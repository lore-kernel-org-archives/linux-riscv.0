Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974FECCA470
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 07:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:MIME-Version:Message-Id:Date:Subject
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6zEMF3U4wp5C4LgJi/7YUj00Sfe20J2SvfvKf3YFfLw=; b=pwaUBgVdgT1ulc
	sM03wDw3XUCsyrIOlAwQRbP+n0xYOnQejaboScS/HwaUkpPJNDZX3+WCbpm2ABBKAvkYuAhV2vRcb
	5S6CZUmh6SzwdCSoGLgDxjh2KoGTz3Xt+zJCZPaHmoYbMTDAmIn0O7XiEgwpHwO+Z3DVHDSMtC9Ho
	W3XRbN4Xa9iHdiDje6tM/Cluyn1Tu11s81ObTkoXLvANF4yOa4ng6KVY+lVpRo4c2m7bo69E4It86
	6ai43Uyn9ISecdtDhSWK0BEk8aX3qEAcreJ0z8e3jRugXR3gz7yBQyzU9EcMl3wlQw6OyqtWt9udH
	oC3rqW8dc9bO+hok2hQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Owm-00000003O8U-12eC;
	Wed, 08 Oct 2025 07:50:52 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Owj-00000003O7c-1AkW
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 07:50:51 +0000
Received: from [127.0.0.2] (unknown [114.241.81.247])
	by APP-01 (Coremail) with SMTP id qwCowAA3kaPLF+ZoUI4EDQ--.32936S2;
	Wed, 08 Oct 2025 15:50:35 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH 6.6.y 0/2] riscv: mm: Backport of mmap hint address fixes
Date: Wed, 08 Oct 2025 15:50:15 +0800
Message-Id: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALcX5mgC/x2MQQqEMAxFryJZG7FCK3oVcVHbzEwWaklAFPHuh
 uHBh7f47wYlYVIYqxuEDlbeNxNXV5B+cfsScjaHru18O7gehTUduK6xYMxZUEtMhMFwnvq8hMX
 bgP2L0IfPf3uC0ITmgvl5XkLmNYVyAAAA
X-Change-ID: 20250917-riscv-mmap-addr-space-6-6-15e7db6b5db6
To: stable@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAA3kaPLF+ZoUI4EDQ--.32936S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr17Kw45Cr43Jw4xCr4Durg_yoWfGwb_ZF
	WUtas5Xw1UJF4DWFWDK3WrWr4vk3sYvryrAr1kJ39xGr1akr4DCw42grW8XasFvan5KrZr
	JrWxA34IyFy7tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUba8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_005049_697516_80C89AEC 
X-CRM114-Status: UNSURE (   5.33  )
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
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Backport of the two riscv mmap patches from master. In effect, these two
patches removes arch_get_mmap_{base,end} for riscv.

Guo Ren: Please take a look. Patch 1 has a slightly non-trivial conflict
with your commit 97b7ac69be2e ("riscv: mm: Fixup compat
arch_get_mmap_end"), which changed STACK_TOP_MAX from TASK_SIZE_64 to
TASK_SIZE when CONFIG_64BIT=y. This shouldn't be a problem, but, well,
just to be safe.

---
Charlie Jenkins (2):
      riscv: mm: Use hint address in mmap if available
      riscv: mm: Do not restrict mmap address based on hint

 arch/riscv/include/asm/processor.h | 33 +++++----------------------------
 1 file changed, 5 insertions(+), 28 deletions(-)
---
base-commit: 60a9e718726fa7019ae00916e4b1c52498da5b60
change-id: 20250917-riscv-mmap-addr-space-6-6-15e7db6b5db6

Best regards,
-- 
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
