Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B768C5474E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRTXjbjcgNA12KD2jseZM+z8QVQTkjYkJaiqLYBR+WA=; b=cq4kwINfiOMkM2
	9up3xY9j24pTLRkIlEPnkaW+XQdwN4rfnBr5NurpPgTKoV7sbUgcvj5Xidtj9O1YVJfPLARPwah9c
	+DAMC6i01jZoAd46rdUJWEtndCumOVKQoFRIAFxq5U2uxQnc5XtNaByK4InRuSLSP15diuY0NmnyD
	QoQwGaWe26m7FkxtTJTv2juafvPS6jN5fVyJpfL1rJiRaE5bRpOwg6F1TevBJjjO2gBZTEoY/KaFY
	UJiSUSAjdzTyT76T6ROeEzV0QZtrWYW2ZN/YNNlMQsa0QDj7eySKtGtMQOQ6KhuEN+a3U19QUXtD1
	zHQi7lDhVK+FFtg/ro+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbc-0000000ERJo-0wcl;
	Wed, 28 Aug 2024 08:00:40 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjBZ4-0000000Dy76-2deG
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 05:49:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-201fbd0d7c2so52362955ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 22:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724824194; x=1725428994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPJ0dF9cF6J1lv0FlFvR4vKxUsSQiAia4h2dvI+DMjw=;
        b=gpL/DgZbUbryG6ua1/eo5ssX5EUcxxW+6AP8hcf/mXTBA07ObPypz0UOz2LkY6TsJH
         hWVo5or74kCjPT50agI/U3o9xSNgYrUZSbVTac03jF/rMQ52pTpJZIyAvVoce7BqvVj+
         J5I1fUIK8UXyrPUKb3V9NwuuRti3KBVsTUDhDxZsytaeb8a/4VInsRy4B6E5qw1SiEJ5
         uA3YUIWlmXjO4AtOBiys5sZERu0Dic/zDutSq+zKQMsPOWOJlG6qr1ZBeXnCLsNXnanb
         f0Of2d73PNWWElfe1Fz46uoWTXfsEpIS8rtRqN4CyVi55y13Qz40XsE7fA+Cj8Uj83dE
         i0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724824194; x=1725428994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPJ0dF9cF6J1lv0FlFvR4vKxUsSQiAia4h2dvI+DMjw=;
        b=Lrniis5XLmQO+utMW3p+nTC6ScfkF+P5jyy0iPs/0dUe+E7j1GMx4DhA72tlrU6ZPR
         0UePk1OyFZP/W3bPFAnUS70h5dtCx8xb71buz6bGLoRfAN3+5WTUOm4HqqkTtAsPVgcz
         s6LSldqkybHy5FpjJ0vFolw9sUXRd9kj2MuOt4IdBz1ybL+dz3cUevogjUuyGTkrkwvw
         zGvy1EwJnJxQwf4DKC3Vd+5nGHJOberGaRvK4tzB3/sERlkOWS/TNKey6lpPp5DEOXZY
         pvaRyW35Dk4Oz9TglZGzxwcBEWLMjKWRDXmmfpmWDkF1Tc2zfVATSgtmGpfezaR6rjVN
         qCFA==
X-Forwarded-Encrypted: i=1; AJvYcCXMNrhBFfWhpyfgJg/6JWu0YE3Z02ztrfD74i3noh6Vl4BqszwNdDsZ2jDAKgaF/GGnc/gbidermvNtjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDigzZdbLVSy+ZIF4DcyQtP7nqL3gjDfGq2wXs0pR6iyQvLU/C
	F1/XOkQ5GpLVEu2wCqMoauEu31z/Cmb5c1rzzNusiJbR3Kd2piczR/AVQ52i67M=
X-Google-Smtp-Source: AGHT+IGIwf3MFbsmI5L/nn36QcLF0tw2dizRywserImseYHkgoEBii3QkvkJxB3CCAhauX+R+NVkZg==
X-Received: by 2002:a17:903:41cb:b0:1fb:90e1:c8c0 with SMTP id d9443c01a7336-204f9c50d18mr13883795ad.63.1724824193604;
        Tue, 27 Aug 2024 22:49:53 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855df0c4sm92092495ad.157.2024.08.27.22.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 22:49:52 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Aug 2024 22:49:14 -0700
Subject: [PATCH 08/16] x86: mm: Support MAP_BELOW_HINT
MIME-Version: 1.0
Message-Id: <20240827-patches-below_hint_mmap-v1-8-46ff2eb9022d@rivosinc.com>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2933; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=/49vITxLNj+RJRh4dWyqxf17jS8h791m43d/wmsbi4g=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9q5XfH5mu/c9Rrzlz8/vq1gj25AnkDItFvB5j/EjQ7d2
 dgpWufVUcrCIMbBICumyMJzrYG59Y5+2VHRsgkwc1iZQIYwcHEKwERiehj+Oxm+8In6am8suLjK
 Qbj6ukzK61nfEx9q7X3ecc3HVutSBcP/QCmOFDVPG+uvAsGmtk+sN15sO6WrIvn+0Hvj8ITPYtt
 ZAA==
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_224954_977130_175C0113 
X-CRM114-Status: GOOD (  15.55  )
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

Add support for MAP_BELOW_HINT to mmap by restricting high_limit to
addr when the flag is enabled.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/x86/kernel/sys_x86_64.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index 01d7cd85ef97..fa16b38f3702 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -86,7 +86,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, unsigned long, len,
 	return ksys_mmap_pgoff(addr, len, prot, flags, fd, off >> PAGE_SHIFT);
 }
 
-static void find_start_end(unsigned long addr, unsigned long flags,
+static void find_start_end(unsigned long addr, unsigned long len, unsigned long flags,
 		unsigned long *begin, unsigned long *end)
 {
 	if (!in_32bit_syscall() && (flags & MAP_32BIT)) {
@@ -106,10 +106,14 @@ static void find_start_end(unsigned long addr, unsigned long flags,
 	}
 
 	*begin	= get_mmap_base(1);
+
 	if (in_32bit_syscall())
 		*end = task_size_32bit();
 	else
 		*end = task_size_64bit(addr > DEFAULT_MAP_WINDOW);
+
+	if (flags & MAP_BELOW_HINT)
+		*end = MIN(*end, addr + len);
 }
 
 static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
@@ -132,7 +136,7 @@ arch_get_unmapped_area_vmflags(struct file *filp, unsigned long addr, unsigned l
 	if (flags & MAP_FIXED)
 		return addr;
 
-	find_start_end(addr, flags, &begin, &end);
+	find_start_end(addr, len, flags, &begin, &end);
 
 	if (len > end)
 		return -ENOMEM;
@@ -166,6 +170,7 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	struct vm_unmapped_area_info info = {};
+	unsigned long task_size, mmap_base;
 
 	/* requested length too big for entire address space */
 	if (len > TASK_SIZE)
@@ -198,7 +203,8 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	else
 		info.low_limit = PAGE_SIZE;
 
-	info.high_limit = get_mmap_base(0);
+	mmap_base = get_mmap_base(0);
+	info.high_limit = mmap_base;
 	info.start_gap = stack_guard_placement(vm_flags);
 
 	/*
@@ -210,6 +216,19 @@ arch_get_unmapped_area_topdown_vmflags(struct file *filp, unsigned long addr0,
 	 */
 	if (addr > DEFAULT_MAP_WINDOW && !in_32bit_syscall())
 		info.high_limit += TASK_SIZE_MAX - DEFAULT_MAP_WINDOW;
+	if (flags & MAP_BELOW_HINT) {
+#ifdef CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES
+		task_size = task_size_32bit();
+#else
+		task_size = task_size_64bit(0);
+#endif
+		/*
+		 * mmap_base is defined by PAGE_ALIGN(task_size - gap - rnd) so
+		 * subtract out the task_size to isolate the gap + rnd.
+		 */
+		info.high_limit = MIN(info.high_limit,
+				      (addr + len) - (task_size - mmap_base));
+	}
 
 	info.align_offset = pgoff << PAGE_SHIFT;
 	if (filp) {

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
