Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4351AF01806
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 07:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nFTNrXd5hGlkUjlsi86DUkIxt6vmtMV/6gFOynYcGLY=; b=TzN31c517GVUC6
	UJ63monzGIuKFndBGrezDhY4cUTJE3bI/R/eicD1r1cDppxElD96Jwj7AT0HDaTfrMlGPkZzUzvYP
	S7JNm8/eQlgeZ8g53cR94RateKn8m9rmf0Vci7ZIixFGgONZT8lbGzu7TZVRZqfT847a2sZHMBb8a
	dUB4MaiF5ukEeciteyC32wtEGMe8L4GCCRvxmu4fyP7HlLTc9RvOcD/FDYcPQaDSh4ynjdnZv6LUZ
	UjHKLA8N6R27bWIXJPON+4pM/ug2wbPxJfkVArYikeBSHDdoSNkkqU0x4XV8tibtHV/NWX53FvPxB
	l1nhdr+K+ecbzKXGDr5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPl5-00000003A0Z-2069;
	Fri, 06 Mar 2026 07:38:03 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyPl2-000000039zA-0cmu;
	Fri, 06 Mar 2026 07:38:02 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAXpglFhKppgcC9CQ--.1822S2;
	Fri, 06 Mar 2026 15:37:42 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH 0/2] RISC-V: KVM: Fix array out-of-bounds in firmware counter reads
Date: Fri,  6 Mar 2026 07:37:37 +0000
Message-Id: <20260306073739.3441292-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAXpglFhKppgcC9CQ--.1822S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWUCF1DXw1rXw1ruF1xXwb_yoWfGFX_uF
	WvqFW7Jw1UWanFvF129w4vyr1kK3yYkw1UZF1rAFZ7GFy5Ja47Zw1ktr93CrWxCa4Yv34U
	Ar4Fva1xZ34SvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbS8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6c_3UUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiCRASCWmqYqV5VAAAsr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_233800_553500_8837E724 
X-CRM114-Status: UNSURE (   3.71  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When a guest reads a firmware PMU counter via SBI_EXT_PMU_COUNTER_FW_READ
or SBI_EXT_PMU_COUNTER_FW_READ_HI without first configuring it through
SBI_EXT_PMU_COUNTER_CFG_MATCH, pmc->event_idx is
SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF). get_event_code() extracts the
lower 16 bits as 0xFFFF, which is used to index into the 32-entry
kvpmu->fw_event[] array, triggering a UBSAN array-index-out-of-bounds.

Both pmu_ctr_read() and pmu_fw_ctr_read_hi() are affected. Since they
were introduced in separate commits, the fixes are split accordingly:

  Patch 1: Fix pmu_ctr_read()
  Patch 2: Fix pmu_fw_ctr_read_hi()

Jiakai Xu (2):
  RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read()
  RISC-V: KVM: Fix array out-of-bounds in pmu_fw_ctr_read_hi()

 arch/riscv/kvm/vcpu_pmu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
