Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6E4D7494E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Oct 2024 01:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjVSf6aVLj17poO5XWmtDkv18dbHNUyxL+fbTUOevFI=; b=2Iti8N6FAI+G73
	YEaAabImkoHNwPfNjiT2MRQY2gHgcE8aTYClYjlgYrNncIm9diR2OFMuyoi9LSNVKWtNHPiqd/npr
	Y5RDbxOYKSGBfwuR8awafGa1Ui4watmFIdppLEMrx06qtCWMZ1q+e044Lzec/ZXsnQvYLqU5tWbnV
	jIJp1gsmeXa73yCcpdpgHzKqhZW5ANVERQ++9bSuF1ls6IXtuIPIUvklZLcjGpaw1AVv19zMHiG1i
	C/KWgHwE2hlrPIJM1wOUcuKlbmZP8v194cln4szZtcpDDVlBjl7NfL1ObCYism80ozQz+uPy6bOgE
	RxXNnv+9EqI0VblTPMYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5x4j-0000000GNuB-2lDl;
	Wed, 30 Oct 2024 01:00:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vuN-0000000GEaB-2Zsl
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Oct 2024 23:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nRy4y69JgL5sB6geChrc5T0OHtDNFkvTlVG645IsDrc=; b=TYSeK0h6zhHA3M6V6bT+1PdjmJ
	hyyN/RUXNXmpUmBfTLcn8MglwKCgHJ75vcNm+biQkghUagFxv4JDHYg2BRGiVlsTG+cnp8R2hBBKC
	CMEvqFKy+gn633u8/1EU6GB/xyGXOwaoVIsCq2aiWU9ZoGkyGoyLwdRFC2GiPRkzY+32ateTGC7kL
	vTZBFwgbAB0GcBxm7rxUY901S2Do+kevCHC6d61P2N1NeOhehVrChdW4gAwPq6lQ6yIwchieXvQ4e
	Sc5n48iksXX7adeSibr2Tcyl/NaFh2jQoHL9CRYCKjY9FgBCroLrhXfSWy/pciu4hajytuY1px8tP
	jN4LHZvg==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5vu2-0000000A1PM-0FmE
	for linux-riscv@lists.infradead.org;
	Tue, 29 Oct 2024 23:45:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so3602467b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Oct 2024 16:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245530; x=1730850330; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRy4y69JgL5sB6geChrc5T0OHtDNFkvTlVG645IsDrc=;
        b=rpcKmBFao0afgnhxd13ZD61EXi9n6S/oHGxWuJFuHvoVCRMeql4/39HANlpphAhGcq
         5NUCLPHSfs5/n0gKZwkSiIfD8iNkkE0t1JRQ5MVquuTQiLqXHiDdw2I9v/EyXBl0D/g6
         YbV8nVgEWUExXVJksax9AYMm/hNU7riMJ9vwVLpdUTgNxh4NrCLElVCAL1x4usMzUAgo
         Wm7PfNeozNtTWlQ9R0vZr3Rq8o9CuLRBbjxPQwspM4npx/xinN/gwfYsqwmhVn1AdlrC
         zmSmnlrAnviOe10PCUIGEjNTr781eQX4KPrC0UGceGlVz3Wo9YJe9WmJUM6XGo/rHvZS
         5XvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245530; x=1730850330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRy4y69JgL5sB6geChrc5T0OHtDNFkvTlVG645IsDrc=;
        b=idxwQ1+NySqZSHooeHSGsvMvyZU4pMHvFjuxlp91uIn8fTqQbVdJHBetZbPYDiR8b+
         4f3dP6YNwWPa2K4r3zC7fzI+lwD2w/slrTKoQ0kePVhS2dUdX9kp/IwPOKpvBLehCnpP
         ZoUTZjfJDJ6jfe67b8TwEhYZEk+h43SEJ4vpr08dezl/UgXPkZeM7L5G6mSVMxoALDo0
         m/qsZCtRU8nkgLeQu5hg7sadHs1EJnpRY8a1G9T0BemUiqNAFZwoPg1PQW4Q3f/UIh9/
         o8XxpGiV/W7R5gC28JwZEBOnebmfUCuy2s4En9Kj4yHRBmoHt6StMsDC1EBqkFQJuzYM
         Eclw==
X-Forwarded-Encrypted: i=1; AJvYcCWx9aujbP20E1O8p+6/bN8KbvmIVoL07RYqclPZITeIGGmJtg8P8eeqjKatbySWw7LgQjDm99hl+2GTVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT5aT0B2DEdoYcHdIDCB0Xu0NE0V0vF0v+D/pALcYxM5srb/C2
	hbjtn+ST06qPMmhKRMc2GfCfbx2l2pLgVW/g/SwJEIWyeB6hbn8qUzckkjJyxec=
X-Google-Smtp-Source: AGHT+IEJnoB5pjGPkuu5fVIOqNL3hz9Y12W/UY6bmoQpgc9NgKdtyZXYcI4NaGAWLxyKkPpDfpG9Xg==
X-Received: by 2002:a05:6a20:e198:b0:1d6:fd8c:fa16 with SMTP id adf61e73a8af0-1d9a850541dmr17895816637.46.1730245530007;
        Tue, 29 Oct 2024 16:45:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:45:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:28 -0700
Subject: [PATCH v7 28/32] riscv: kernel command line option to opt out of
 user cfi
MIME-Version: 1.0
Message-Id: <20241029-v5_user_cfi_series-v7-28-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_234546_853279_DEF20445 
X-CRM114-Status: GOOD (  13.28  )
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

This commit adds a kernel command line option using which user cfi can be
disabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/usercfi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 04b0305943b1..223dfa482deb 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -393,6 +395,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -472,6 +477,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -504,3 +512,15 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "true") == 0)
+		disable_riscv_usercfi = true;
+
+	pr_info("Setting riscv usercfi to be %s\n", (disable_riscv_usercfi ? "disabled" : "enabled"));
+
+	return 1;
+}
+
+__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
