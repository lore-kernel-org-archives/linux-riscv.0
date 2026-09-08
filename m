Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251B2C79F82
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KLie7W9W0+EAJ2V1RjI9W1FRBdqehB4XBrdquCFh9/g=; b=EqPh9AEb1HOK5X
	3k2oJb6LjPT6WPylgKIGDmBQm6SnZuKRS1Y8+RH2zFtBZiH8v2fcU1BAxgdJwpr0o6S04oM05dXLl
	nC9k90lL5EcBxeYN6JTS5q2EuTO3i2Hj55/L9FNHqT3iQFJ5YEF+1yvGaOlugi1iws/9eNeRgUmgP
	f8DUsbUBIrGl3nQRsX+/q+1nYz40op4jSBsw6orFqXj0TrVNEPjZ94HqaKAxEZT8Q+/yoHJgjxdqz
	k7ZUzalGCjjXYtWKo22EK+67I04Jvf7DGIH0hV+iflhCAPQ+LCB9r55i3hjsOsw6a33k5OnNOnYTL
	qlK0amLQKZb3gXooj/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44wl-0000000AR2c-1rT6;
	Tue, 08 Sep 2026 23:09:47 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x44wi-0000000AR1W-2qql
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 23:09:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so41799585e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Sep 2026 16:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908982; x=1789513782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=BsFY6RjcNuBAwIOLfOqoWMj4MhRhEXsxt85M897iDgKpZCvNHmkNW9AYAaesmzg0+2
         E+Gqeo4ureUqO2ZSNTa8Pc0fMRd5Zkxbqbuu2dqaNn8lUTY2nL67ZcUJMHdS7PgXw9Ac
         o4xqP5x3JrEkX3+8lf8IUIVh26MU8mBITEm0VAZBtl2acZsUu9oD93kUNuriaLVjIXaT
         PlFEt2+wSh9mCi08XY247MNpD5c4/qMuVM2tVm5PJrpak627V+a8dmECHtzr1rhZ1aNi
         TMrjofqeP/k1/QJgepbo8/hT3CIOrJ9t+N3zeo3AB5UGLzaEkFIF900/ZcUE3SI0Rgi9
         NFkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908982; x=1789513782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1sqlRiEDMtea/68TRHJP/y7Fg6bS0f93iC/rAE6DLs=;
        b=HFUInw6hkpMBWfAY76WeYuEenKWgcJWD7caXGvii0DJDr4ch2//VfvXHc0278/wLMt
         hCLXmfDhc35NkN4rXa5CZFQTvrLTumHg4Fl8FGMR333OLPWs8rlFM5gUU21p9TYYZqNS
         Nv+x+C1lFMu7TCTeMA6pP7ehDK0WygGeUSbmOFtYNejBk9VX32fGGzTSG+kd9Bl9qkOX
         G0J1mzKe1nELE9qFOLzgfOEUeovQtDpLSTiAWYDWoMBC1FRoG187VznXeHdeOW55cRmm
         jvKo6Lh+w516TCgOJ4X50NZOg+xVTAEs5BSfTH/91hT6dJmMpk77KUI4cG3LjqJYGXze
         ZoDA==
X-Forwarded-Encrypted: i=1; AKwUvBxCXO0MqGB3VSWysDA22fAdhnrdkCC5s920RQ4rc8vy+ppwYWTH2d/++sR0BU3uxnUlVYJqmgkVmTNBRg==@lists.infradead.org
X-Gm-Message-State: AFuF++lqlAFwb9rC3ynUyBSWuAX8szGVfodItiBUiuaA1GJTe4TGCKZp
	PZ/00ZrUC7R95q5/G1mae+qQV00T6vxPRxKhcT4FCwmFT0nK/40y2Lgi
X-Gm-Gg: AYBFou1ac7xqJW4etN4Pf+alXJ1PSANqKzIbMRwIGWvpY/FVkArRzKA4O6q1bQK7TBw
	UfP5hLdAVzn9nXKSEqJj5uAsT4PtfA0sYzwHxKALeAxxx1NhwxDXna5jgVskLAyJCdUfsIPn1Gy
	BmSi47VTG8aCMqal38tjvJe/lJOoFK0O3c4pqEx6BtXPtZUCl+2GBBmcXojWWqBKfzs3QaTKjp0
	QKUUJ7tSWQ3QruWRsYQ2BkHx1E9bidcWfDIFVbVisqOHPSR1DG1BrgbTQwiBKEg6GZoV69jyEZc
	0C/4dECU1on7uMcVvm2Cn/yghABHTVWNYAClcF1fT55B9syF29j0rHRf5sJCTSjNFLitCd1MAoi
	hdiKtKCGh6f/5wtnBbw8oGs1/70ZrnxOs/DGn1D/VzCzql/82cdbxnHaXmIew0dON8LgsyGET+X
	zSY10mJD/GQizk/cR8kBvXlhXmiwPWMMqPmK3z1ueUr/MY+kIbG30XwoB3TgsailBWACQfxwzZm
	TRRGT4QxNjAgTXPfCvKbGboyaQQvIC+4YzNRK0e1i0K3SeN3UZ3xoTxT+SV4XAFbO4W8qXkVe2Y
	uX+6BQdAIpZ4ePnVBDFkaMel1A==
X-Received: by 2002:a05:600c:348a:b0:49c:fa20:cc03 with SMTP id 5b1f17b1804b1-49cfa20ccedmr254595975e9.26.1788908982187;
        Tue, 08 Sep 2026 16:09:42 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f8192sm385530905e9.3.2026.09.08.16.09.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 08 Sep 2026 16:09:41 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nicolas Pitre <nico@fluxnic.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-modules@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] module: reject out-of-range relocation target indices
Date: Wed,  9 Sep 2026 01:08:15 +0200
Message-Id: <20260908230815.78409-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_160944_814521_422C0B4B 
X-CRM114-Status: GOOD (  16.48  )
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

apply_relocations() skips relocation sections whose sh_info target index
is outside the section table. ARM, ARM64, LoongArch, PA-RISC and RISC-V
use sh_info earlier in module_frob_arch_sections(), before this check.

ARM, ARM64, LoongArch and RISC-V use the unchecked index to read
sh_flags outside the section header table. PA-RISC uses it to index an
e_shnum-sized heap array for a read and an update. QEMU reproduced
page-fault Oopses on ARM, ARM64, LoongArch and RISC-V, and a Data TLB
miss on the PA-RISC array read.

Validate sh_info for SHT_REL and SHT_RELA sections in
elf_validity_cache_sechdrs(). Reject the module with ENOEXEC before
architecture code can use the index.

Fixes: c298be74492b ("parisc: fix module loading failure of large kernel modules")
Fixes: 7d485f647c1f ("ARM: 8220/1: allow modules outside of bl range")
Fixes: fd045f6cd98e ("arm64: add support for module PLTs")
Fixes: ab1ef68e5401 ("RISC-V: Add sections of PLT and GOT for kernel module")
Fixes: fcdfe9d22bed ("LoongArch: Add ELF and module support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---

A custom harness for upstream Frama-C 33.0 (Arsenic) Eva found the
ARM32 instance in a source-identical ARM module_frob_arch_sections()
slice. Eva reported the out-of-range section-table pointer and sh_flags
access.

The analysis and ARM32 A/B test ran at Linux b9b3e33b70b7 ("Merge tag
'trace-v7.2-rc6' of
git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace"). The
PA-RISC, ARM64, RISC-V, LoongArch and x86_64 A/B tests ran at the
declared base commit, 28924df2a08f. arch/arm/kernel/module-plts.c and
the touched loop in kernel/module/main.c are identical between the two
commits.

Each A/B test changed only a relocation section's sh_info to
0x10000000. The same configurations and modules were used before and
after the change. All controls loaded before and after the change. The
fixed kernels rejected the malformed modules with ENOEXEC.

Original-kernel results with QEMU 10.2.1 TCG:

- ARM32, virt/Cortex-A15, GCC 15.2.0, multi_v7_defconfig plus
  VMSPLIT_2G: page fault at module_frob_arch_sections()+0x160.
- ARM64, virt/Cortex-A57, GCC 15.2.0, defconfig: page fault at
  module_frob_arch_sections()+0x110.
- PA-RISC, B160L, hppa-linux-gcc 8.1.0, binutils 2.30,
  generic-32bit_defconfig: Data TLB miss at
  module_frob_arch_sections()+0x11c on the stub_entries read for a
  counted R_PARISC_PCREL17F relocation.
- RISC-V, virt, GCC 15.2.0, defconfig plus RELOCATABLE with
  MODULE_SECTIONS enabled: page fault at
  module_frob_arch_sections()+0xe4.
- LoongArch, virt/LA464, LLVM 21.1.8, loongson64_defconfig: page fault
  at module_frob_arch_sections()+0x1b8.

On x86_64, which has no vulnerable early sh_info access, the original
kernel loaded both modules. The fixed kernel loaded the control and
rejected the malformed module with ENOEXEC. The test used pc/qemu64,
x86_64_defconfig and GCC 15.2.0.
---
 kernel/module/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/module/main.c b/kernel/module/main.c
index d0e1e0bd2ad0..30c7a05488bc 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -1933,6 +1933,7 @@ static int elf_validity_ehdr(const struct load_info *info)
  * * Section array fits in the user provided data
  * * Section index 0 is NULL
  * * Section contents are inbounds
+ * * Relocation section target indices are inbounds
  *
  * Then updates @info with a &load_info->sechdrs pointer if valid.
  *
@@ -1983,6 +1984,12 @@ static int elf_validity_cache_sechdrs(struct load_info *info)
 	/* Validate contents are inbounds */
 	for (i = 1; i < info->hdr->e_shnum; i++) {
 		shdr = &sechdrs[i];
+		if ((shdr->sh_type == SHT_REL || shdr->sh_type == SHT_RELA) &&
+		    shdr->sh_info >= info->hdr->e_shnum) {
+			pr_err("Invalid ELF relocation section target index %u\n",
+			       shdr->sh_info);
+			return -ENOEXEC;
+		}
 		switch (shdr->sh_type) {
 		case SHT_NULL:
 		case SHT_NOBITS:

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.53.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
