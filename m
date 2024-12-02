Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D34BD4979C
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 03:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=26/oHmpVs0MRz//dtf1vt0OK5B3JLvONhqw66Mkuk7E=; b=Dw1Af2UgcAX9Dg
	qMp8zPADoLe5p1m/9+W3QsCMrXhRR5thYQ/R+ucTnsjQfJ3MzSR4lRNhmVZUMfENHtNUaE/KfirUG
	8R1iEOpcZr3dSi6WG1c2onVyr/jwaOq2k/rEpimB1ah2r/DnEr3e0sMC9nBBVPMaD8+FIxhugKJXu
	3meMw/LJnCLCicGcGy6X2fDQWmetmF3Mp0jDL/x5haBbaALIjPmX55ValApicTgV5gJ+BWvDFM9oK
	8novVdSfSDGnKGrPDGOiCHd/iqZPtvyHvK5+F6juw9SD2jZj0SoxZjehZjUXAHPxW5B70mpvP+bCo
	pDBUajy4TnGfDciDZMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx9m-00000004xJd-2WLO;
	Mon, 02 Dec 2024 03:31:30 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx2T-00000004vdf-4Adh;
	Mon, 02 Dec 2024 03:24:00 +0000
Received: from zq-Legion-Y7000.. (unknown [180.111.103.148])
	by APP-05 (Coremail) with SMTP id zQCowADn7389KE1n_dUuBw--.9423S2;
	Mon, 02 Dec 2024 11:23:42 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 0/4] RISC-V: KVM: Allow Svvptc/Zabha/Ziccrse exts for guests
Date: Mon,  2 Dec 2024 11:21:26 +0800
Message-Id: <cover.1732854096.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn7389KE1n_dUuBw--.9423S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrWUGw43JrWkXr1xKFy7trb_yoW3AFXEya
	4xAryfWw18Wa1UCFyxAFn3GFWxJFZYkF17XFnFvr15WFnrZryayw18Wr48Ar4UWa15X3WD
	Ar1rXrZak34avjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbf8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbbo2UUUUUU==
X-Originating-IP: [180.111.103.148]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiDAcTBmdNBhJyIwABsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192358_414473_4F0ED8B7 
X-CRM114-Status: UNSURE (   3.79  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Advertise Svvptc/Zabha/Ziccrse extensions to KVM guest
when underlying host supports it.

---
Change since v1:
- Arrange Svvptc in alphabetical order (Andrew)
- Add Reviewed-by tags

---
v1 link:
https://lore.kernel.org/all/cover.1732762121.git.zhouquan@iscas.ac.cn/

Quan Zhou (4):
  RISC-V: KVM: Allow Svvptc extension for Guest/VM
  RISC-V: KVM: Allow Zabha extension for Guest/VM
  RISC-V: KVM: Allow Ziccrse extension for Guest/VM
  KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts to get-reg-list
    test

 arch/riscv/include/uapi/asm/kvm.h                |  3 +++
 arch/riscv/kvm/vcpu_onereg.c                     |  6 ++++++
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
 3 files changed, 21 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
