Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E65C5DF67
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 08:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NGr6SQtcVHQ1ORsRaNjEloDZ2ZE8rLIO7bh82BK4oaA=; b=BLlElT325PkGEx
	ynJmeJE0HS7ogkpr+tkFrfSMbcE77ZrB1cNnmm4zSMdujlBuT14lkPhZ/xcB9luCJcF6cuuey9uoo
	ltHEqKzdzEjCZFbS/Wnnp6SY8Pxuwqdq7g0Hige/ODIAAyCyKgFMGQYGt4gecsmRkdOQxpcz4DxMC
	YTW0eZ2cDmRkHiXzowoQX1g+yz0dNhqlo2TgdpXLYWZVceWL5TxCTODybFmT135VsEx0e0hL5gG64
	0SMTA2nYnrj+emdDfRU876G6FGB71YQZI3q1/EknLLMmAaSWLTPblBZI2Oo/e9EYR4m77GCAtIVpF
	NHpfXh4jonpw6dgODJiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunHV-00000002HMO-0u1v;
	Fri, 14 Aug 2026 08:28:49 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wunHR-00000002HKm-3z3s
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 08:28:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=f/
	Rp3afxHVt11GiYQfwg2x9WpjUQqy7bLvcIUQuUuck=; b=fpoL/1Ij9tgRXPWPC3
	vdC/wCBSxoz/FtDHyEL12e8DvvEgykmcL9lfbI4T6T2ZFDUpOnTf8TVVzo0cWa9w
	lTmLXTpFD1E+QkodmslckytwaZvpS02Beg4NG6ZxeE1xTWOf9mu9Kw2e5a6AvyaT
	hlXq88bYs3qD8gWoFanJ4JAv4=
Received: from Ubuntu.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3dIl_0X5qdVL2Pg--.57693S4;
	Fri, 14 Aug 2026 16:27:45 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	Klara Modin <klara@kasm.eu>,
	prabhakar.csengg@gmail.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	xiaofengmian@163.com
Subject: [PATCH v5 2/2] riscv: patch: skip fixmap mapping when kernel text is already writable
Date: Fri, 14 Aug 2026 08:27:42 +0000
Message-ID: <20260814082742.148403-3-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814082742.148403-1-xiaofengmian@163.com>
References: <20260814082742.148403-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3dIl_0X5qdVL2Pg--.57693S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF17CrW7WryxXw17XrW8Zwb_yoW8ZF48p3
	ykAr45AFWrGF1Sy39Fk34DuryYvwn5trW3WF9xG34Svw4DZ3y5Awn2gw17XF1kXr1j9r4S
	yFsayrsIva4UK37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_5l1DUUUUU=
X-Originating-IP: [39.144.122.80]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbC5gLO0Wp+0YIYfwAA3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_012846_336038_34DBF5A5 
X-CRM114-Status: GOOD (  11.73  )
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

patch_map() always creates a temporary writable mapping via fixmap for
kernel text addresses, even when CONFIG_STRICT_KERNEL_RWX is disabled
and the kernel text is already mapped with _PAGE_WRITE.

This is unnecessary overhead at best, and on minimal configurations
it can cause page faults.

Skip the fixmap path for kernel text when CONFIG_STRICT_KERNEL_RWX
is not enabled, since the text pages are already writable in that case.
The module text path is already gated on CONFIG_STRICT_MODULE_RWX and
is kept unchanged.

Reported-by: Klara Modin <klara@kasm.eu>
Closes: https://lore.kernel.org/all/ant_8TaBbov_GS4i@soda.int.kasm.eu/
Reported-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
Closes: https://lore.kernel.org/all/CA+V-a8tQK8rih9SGGTyqrEBGpNkx4H0eX2YccCRrgkVAPr+EBg@mail.gmail.com/
---
v5: fix the fixmap gating for kernel text. The v4 early return on
    CONFIG_STRICT_MODULE_RWX wrongly skipped the fixmap for kernel text
    too, which panics on configs with CONFIG_MODULES=n where
    CONFIG_STRICT_MODULE_RWX is unavailable but CONFIG_STRICT_KERNEL_RWX
    is still enabled and kernel text is read-only.
v3: early return when !CONFIG_STRICT_MODULE_RWX (per Nam Cao's suggestion)
v2: add commit description

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
 arch/riscv/kernel/patch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
index 16b243376f..2239c28981 100644
--- a/arch/riscv/kernel/patch.c
+++ b/arch/riscv/kernel/patch.c
@@ -45,6 +45,8 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
 	phys_addr_t phys;
 
 	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
+		if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+			return addr;
 		phys = __pa_symbol(addr);
 	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
 		struct page *page = vmalloc_to_page(addr);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
