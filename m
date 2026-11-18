Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7797606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 18:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d27ToGRb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wmfz8kC/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=IBGYmlDzRab7NHkqppDjJiCg92NfPPrGppO9dCoVfns=; b=d27ToGRbH7ZK8ewE+gCNcFEkPz
	R6tIrWkSKELTmLa4mtpKUh6ynBBLNqCKQZ76eaGaHcTCEC5+wFx4FX6byo8TJcWk80pZqAcxf/BFJ
	NVMaHKzQYMP4UWCwDzSMRLS+GQciwEXjK//nNYtnjdA2yi1zVYANtnljvGWtKbcV32WVvBclje8p9
	7gJgkIVVv+kdxx7mDhjoGUwKCFV8XEBP49zh9F5TxMfiWWzdXzlcQ61QOZ/FBmJqPjUGcYrQXBxP0
	1uDtKDrHybDnYtGICEdTomF6fRxjzwCc+lm7n2C08ppEtQhwpUBV2NZWNhImZo001wBi9zvfTf5fp
	6a1f7LJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkIQ-00000009tYQ-2OdL;
	Wed, 18 Nov 2026 18:22:14 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTkI8-00000009tB8-0gum
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 18:21:57 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-499ca65ae87so36999f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026112; x=1795630912; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3qJpbOK0S/KfzF1LTQDOmj6a+FOLurEzqYwJRYI91E=;
        b=Wmfz8kC/DbRYG4VLblKzZFsThYgne9bhWUB2dlJE1mmTSrHRpIku0Fx5WdKGQUbpcn
         yQufcGJYg0BBoQWnKXttu3da09QA9YnQSZ1dV2kL9mdl5a4CPFZZYzL+znttTd99dwiM
         cW7Yuo9TECTcLuqbjpQcdY6HyUYczwzhQNC+RPLBZlQJ7ZcvnZ2lWx76610AsiKq+6EZ
         9X/H1kdpnS7lbE/ggD7uaZPHz/pd5h6pLApA3TWc1k+FOXnyFEXa6nJ96mFyyVzSRwfC
         bvsQDmx55G7NcXDYKWntjTlBPLeYIXle32lflkU50WGklFiNSP9NWCdWwGLY86wGPRtj
         9DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026112; x=1795630912;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3qJpbOK0S/KfzF1LTQDOmj6a+FOLurEzqYwJRYI91E=;
        b=S8z8qIzjfzF9DgbvAniKkZCM/ZDtbnulzlO7UdrJ6trI0GzBM+S6UL4t2iA+O+cfbs
         RAZJJR/z4uHLT8xBm6Awa8kVfelYXLDt4b985Larwlo/dvpuzMNXQK5MLgaznxvebhyJ
         f08IkWnbOaUE7BNNzRdOfbJJWDbej9PeR3Bh7OxakgZsm3JhpIp1LtEa9YcSr9Mw19jE
         SNhc13pTVq/QyQBvW9o3WKnBM+q/Byh7vrp8Ber1/vIyqhO/jEfDKaldlau3pddSoaUm
         smH5njr9Fg8EMQ3KJyaINQ51G6tKBZohUQW9pgFGTIA9Dmtcws2+9xVwtRe6LoCJeS4c
         PDbA==
X-Forwarded-Encrypted: i=1; AL+hErH/IsXmytE+ZsI/EHAzbPSArbQquXrdJRFP3suem4b+C2Naztr719NAlPLzlhZKA+Ft7BaMqyfgHI11DQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+D5mju/+oL/s2Jskb8aGBwmLe8xuMMdxVjLlOdtDCLGspd8zP3
	O+9MKLKlOD1YmAZOy+/5f/Vo9Ou7wa0GHlsEza5bOiK2IM8Jzm3T8slEXuGd3FM6LoZZLJrmqg=
	=
X-Received: from wrul11.prod.google.com ([2002:a5d:668b:0:b0:4a3:5c5b:309f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:4310:b0:492:2b36:a149
 with SMTP id ffacd0b85a97d-4a8ee39a399mr578670f8f.25.1795026112167; Wed, 18
 Nov 2026 10:21:52 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:10 +0100
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261118182105.1633603-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3105; i=ardb@kernel.org;
 h=from:subject; bh=VYcmCaSIFKr4fxWSLhFh8fGld9SRwA19gzbmJfyyOk0=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm+mng60ZL704seN5fuy5j+HTcq/zyR2552qw+s+Ct
 aaXv4b86ihlYRDjYpAVU2QRmP333c7TE6VqnWfJwsxhZQIZwsDFKQATaQlgZJj396zSquk9MRGb
 dkz+IGJ2SrfWan9054bMgFMBnCkejEcZGfov8D/7+szO6pHCcue/V6d7hTruuuX8qHCKxjflTRo qudwA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-25-ardb+git@google.com>
Subject: [PATCH v4 04/19] efi/riscv: Rename __init_text_end to __inittext_end
 like other archs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_102156_483910_E8ACBB4D 
X-CRM114-Status: GOOD (  11.23  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ard Biesheuvel <ardb@kernel.org>

Align RISC-V with arm64, LoongArch and x86, and drop the underscore
between 'init' and 'text' in the section markers. This allows the value
to be captured by generic EFI stub code that can be shared between all
those architectures.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/riscv/include/asm/sections.h         | 2 +-
 arch/riscv/kernel/image-vars.h            | 2 +-
 arch/riscv/kernel/vmlinux.lds.S           | 4 ++--
 drivers/firmware/efi/libstub/riscv-stub.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/sections.h b/arch/riscv/include/asm/sections.h
index a393d5035c54..4a882a28f414 100644
--- a/arch/riscv/include/asm/sections.h
+++ b/arch/riscv/include/asm/sections.h
@@ -11,7 +11,7 @@
 extern char _start[];
 extern char _start_kernel[];
 extern char __init_data_begin[], __init_data_end[];
-extern char __init_text_begin[], __init_text_end[];
+extern char __inittext_begin[], __inittext_end[];
 extern char __alt_start[], __alt_end[];
 extern char __exittext_begin[], __exittext_end[];
 
diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
index 7b44b94f1283..bf703eba3fa5 100644
--- a/arch/riscv/kernel/image-vars.h
+++ b/arch/riscv/kernel/image-vars.h
@@ -27,7 +27,7 @@ __efistub__start		= _start;
 __efistub__start_kernel		= _start_kernel;
 __efistub__end			= _end;
 __efistub__edata		= _edata;
-__efistub___init_text_end	= __init_text_end;
+__efistub___inittext_end	= __inittext_end;
 #if defined(CONFIG_EFI_EARLYCON) || defined(CONFIG_SYSFB)
 __efistub_sysfb_primary_display	= sysfb_primary_display;
 #endif
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 9849a3e4d102..0ec1b4b55e41 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -46,7 +46,7 @@ SECTIONS
 
 	. = ALIGN(SECTION_ALIGN);
 	__init_begin = .;
-	__init_text_begin = .;
+	__inittext_begin = .;
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
 		_sinittext = .;						\
 		INIT_TEXT						\
@@ -72,12 +72,12 @@ SECTIONS
 	}
 	__exittext_end = .;
 
-	__init_text_end = .;
 	. = ALIGN(SECTION_ALIGN);
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_text_end = .;
 #endif
+	__inittext_end = .;
 	/* Start of init data section */
 	__init_data_begin = .;
 	INIT_DATA_SECTION(16)
diff --git a/drivers/firmware/efi/libstub/riscv-stub.c b/drivers/firmware/efi/libstub/riscv-stub.c
index 725b634c5179..5cbc50a814e1 100644
--- a/drivers/firmware/efi/libstub/riscv-stub.c
+++ b/drivers/firmware/efi/libstub/riscv-stub.c
@@ -34,7 +34,7 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 	efi_status_t status;
 
 	kernel_size = _edata - _start;
-	kernel_codesize = __init_text_end - _start;
+	kernel_codesize = __inittext_end - _start;
 	kernel_memsize = kernel_size + (_end - _edata);
 	*image_addr = (unsigned long)_start;
 	*reserve_size = kernel_memsize;
-- 
2.56.1.708.g77570a6a1d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
