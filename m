Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D4EFDEE5E
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 03:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X5nAaCZxuoQlri6yNInNRK0SvU+qI+lMyF67UutAuXc=; b=ul2LuWQNNxfBTA
	UsoGjcBiHlKzUpN/Gopai/tXC/ErJrZXmMjt7jPwFdzSpJrvauDC90h+naCeRtKrvhRHeLZJ9/AtO
	fjCt3Wk0fjnF4zYO75STc+0WjBADhACt3pcLfMf3yAuXSHlg4wUBIg+gd1UTxFM4/cXHUfXW4riZr
	Nix3aIDdwce5Pg5ZhAEc+81PlFVxBs8Vf3pXCP/HcBuD28Te9ekv6bVWkprTBN49jRZk7qT5/uPRH
	Y1wIogU/HBTluo3QAy+Peu557CRDoxS4/13DrRGX664mImWqRSHC1Rd9qE5tWHq+Z1RRl78rUaNQf
	bPTzVwQ5eDX76pH1sqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6pO-0000000CYk1-3TIJ;
	Fri, 24 Apr 2026 03:03:38 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6pK-0000000CYjZ-3Dy6
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 03:03:37 +0000
Received: from [127.0.0.2] (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAA322Z+3eppnHE4Dg--.11152S2;
	Fri, 24 Apr 2026 11:03:26 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Fri, 24 Apr 2026 11:03:26 +0800
Subject: [PATCH] riscv: mm: Do not probe satp mode limit if known in FDT
MIME-Version: 1.0
Message-Id: <20260424-riscv-mm-trust-fdt-mmu-type-v1-1-57f3313275d2@iscas.ac.cn>
X-B4-Tracking: v=1; b=H4sIAH3d6mkC/y3N0QqCQBCF4VeRuW5CF3HFVwkDXceaYNV2ZqUQ3
 70tu/zg8J8NhAKTQJNtEGhl4XlKKE4ZuHs33Qh5SAaTmyovTYmBxa3oPWqIojgOmhBR3wuhq20
 52srUha0hFZZAI79+9Ut7WGL/IKff5H8R6BnTrR4z6DtJodl71iZb7Tm/bju0+/4BpbEp86oAA
 AA=
X-Change-ID: 20260424-riscv-mm-trust-fdt-mmu-type-c874f7628178
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Han Gao <gaohan@iscas.ac.cn>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.15.1
X-CM-TRANSID: qwCowAA322Z+3eppnHE4Dg--.11152S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw45JF18Ar1UZr4DKFWfXwb_yoW5Cw1xpF
	45Ga9avrW5JF9rtF4fGrykZry5t3Zag3y3XFyYyF98Can8tryYkr4Fqw13XryYqr17Ja4F
	kw4qgFZ8ZFWUCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
	JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUhtxDUUU
	UU=
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_200335_208089_0144C142 
X-CRM114-Status: GOOD (  13.34  )
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

Some systems may only have memory at such a high address that an
identity mapping cannot be made in Sv48, or even Sv57. To avoid crashing
while probing satp mode support, trust the mmu-type property from FDT
and avoid probing if it is set.

For example, if a CPU supports (up to) Sv57 but the SoC it is on only
has memory starting at 128 TiB, an identity mapping cannot be made in
Sv48. If the user specifies "no5lvl" on the command line,
set_satp_mode() will attempt to test Sv48 support and crash, since the
virtual address is too high. Instead, given the correct FDT CPU node
property mmu-type = "riscv,sv57", set_satp_mode() can pick the maximum
allowed mode from command line and FDT, namely Sv48, without probing.

Handling of mmu-type "riscv,sv57" in set_satp_mode_from_fdt() is added
since it is now needed.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
Tested on QEMU 10.2.2 on all 3*3 combinations of Sv39/Sv48/Sv57 and
(none)/no4lvl/no5lvl.

In theory this could be a break if mmu-type is wrong, but so many other
things would break if the FDT is wrong anyway.

Also note that this doesn't apply on ACPI since it is difficult to use
ACPICA and read ACPI RHCT at this point, so that will just fall back to
probing. Hopefully UEFI/ACPI + this atrocious SoC design never happens,
since the high memory base address would prevent a lot of PCI(e) devices
from working without an IOMMU. (Fingers crossed.)
---
 arch/riscv/kernel/pi/fdt_early.c | 2 ++
 arch/riscv/mm/init.c             | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index a12ff8090f19..702253287560 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -218,6 +218,8 @@ u64 set_satp_mode_from_fdt(uintptr_t dtb_pa)
 			return SATP_MODE_39;
 		else if (!strcmp(mmu_type, "riscv,sv48"))
 			return SATP_MODE_48;
+		else if (!strcmp(mmu_type, "riscv,sv57"))
+			return SATP_MODE_57;
 		break;
 	}
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..c37578eaddd0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -859,8 +859,9 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 {
 	u64 identity_satp, hw_satp;
 	uintptr_t set_satp_mode_pmd = ((unsigned long)set_satp_mode) & PMD_MASK;
+	u64 satp_mode_limit_fdt = __pi_set_satp_mode_from_fdt(dtb_pa);
 	u64 satp_mode_limit = min_not_zero(__pi_set_satp_mode_from_cmdline(dtb_pa),
-					   __pi_set_satp_mode_from_fdt(dtb_pa));
+					   satp_mode_limit_fdt);
 
 	kernel_map.page_offset = PAGE_OFFSET_L5;
 
@@ -872,6 +873,10 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 		return;
 	}
 
+	/* Skip probing if max SATP mode known from FDT */
+	if (satp_mode_limit_fdt)
+		return;
+
 	create_p4d_mapping(early_p4d,
 			set_satp_mode_pmd, (uintptr_t)early_pud,
 			P4D_SIZE, PAGE_TABLE);

---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260424-riscv-mm-trust-fdt-mmu-type-c874f7628178

Best regards,
--  
Vivian "dramforever" Wang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
