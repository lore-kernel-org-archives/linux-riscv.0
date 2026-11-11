Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DD2606A8A8
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 16:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iSCiYBP0;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cz1PCGba
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=kkL9DT7L+DqpH54tcpq02CZOM8kH11NBNlhbxPPAQ7A=; b=iSCiYBP0fuEA8RsWTlgskVOk00
	HQWuIwC0RAYe/qct5FT9gJeuzm4iL2Qtzqp6ecVjrLmcBh4p69Wz4RyNiWVhiUzOVfKXDNN6PyZpm
	ZN547L2AQjpmRQgOkIEKkdNPdUeT/AgYbnrncxzziYdzjOtrGvFeDwImACGTWmZ4nCAA07U/dBXz5
	yRugUHw6zL03+ECzw+2XlscmZZwpCOy7T5D+7EhMTUqE1Fjy+VU156LJDAaPALmLGSIoZGD8WVAHh
	sVeOyjsYB/irO+oCE9dx5KF/3MuoNt5Pwgt5eQa0L8F05l6JXueFGeTR1YrGlA9yF72+vCD3TCzm+
	SZTQ+G5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQr-00000007E4c-0tAB;
	Wed, 11 Nov 2026 16:44:21 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRBQm-00000007E0n-2jLV
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 16:44:17 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4a4654add56so25833755e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2026 08:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794415454; x=1795020254; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4CipcjEstkjXkbwrI150XBAgDE3Lvp07gX7FYPKQvaY=;
        b=Cz1PCGbaaQQT72BwQz4IebT6qGMqYHNc6SKBuGnsYrIczMPSNRBam70c18CxhGBAn7
         b7t2s/ST2jnvL2R3Pm9qUUehYaVbxyG3CHCLcyw92mrnQQYCv1erlaFKGK2PzryVV6G4
         cfoU3VAyBKGrD4jrd5zxXzVo29hHajAAoQ+fCwOe7t5FNGYrG1yDDME/343LyMTs3xha
         VQIp/EyStdk3IAHhtggiMN6n7Vfo2fPfuc5FbAH5Yw3e2upzJkGfciyAMdSypJurPbht
         hLSe6CGr5Q4E9f1N5Mp02gRDkBXFSqbE6In/V7TbNFL9aqEmH41pkg57CjjOp8sJG4LS
         Zkow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415454; x=1795020254;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4CipcjEstkjXkbwrI150XBAgDE3Lvp07gX7FYPKQvaY=;
        b=dS3hyYyIakK4Mq0YOb/E+BjzUhZBLSlwO0GvUOesOBk1T9m6X4NxivKpcEMT6gpbUe
         vRaEu0cACEf/eYMKwsHPzc9JbqjuIZVzdJN9QblwUj2Zqwe/lFPsUBb7hJDIPrYyxGjn
         Ymw8fAVmSCyrHKD8ijjdnECx04i0D09OAR2kvtHOgSnrrQYaga86s77lWkywRkdmAc7v
         rAThfLfSeUkV1ZoF9apJMXhoMx4CuIxlKAW2Fkd6AA+PwyGYtUREMRnYOfFLDlgODd//
         IlLETvIGFd80BnjQ41Fq871Zgvl9XWifPRbyWY6m8RLo+Ea0FkonQ0yCqPnKsIcZYqiB
         RloQ==
X-Forwarded-Encrypted: i=1; AL+hErFCpSBCce9Yp1ExRT/2uFYdF5ERORxu76z48g81empYlNHYjYym4g1WXBsr4uJoiPGGonPOCIm6zabkwA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Zang/YH8bwd+QnECeW0prJSZQUxVTSnl+MK6pMplFpImMJ9rm
	yytpJwkZymG6NWu8nOM2nQ0A7/tgrIK6L8CPq2r+/NUWRkxMHTAPQFUYZNCKC6ebiQZphXX0Dw=
	=
X-Received: from wrxa9.prod.google.com ([2002:a05:6000:1009:b0:496:16d:4e51])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46d3:b0:4ba:6d8:dfad
 with SMTP id 5b1f17b1804b1-4ba0936ead9mr56748755e9.14.1794415454026; Wed, 11
 Nov 2026 08:44:14 -0800 (PST)
Date: Wed, 11 Nov 2026 17:43:49 +0100
In-Reply-To: <20261111164345.4059964-5-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261111164345.4059964-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2934; i=ardb@kernel.org;
 h=from:subject; bh=uHP3CktPJt5MpAy8M29THFv1W5hkZAM4ez0yFg4K4Yc=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevLbDcXpyOTOo/VLz2rv0fh1yz9F4lOZZ1Lj8U7P+8tW
 LZspl12RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZgI9xqG/7W7M42v//rRFv5X
 JTpqlyfzopUTArO/W335cKyKb6r6GjuG/56WS3ujS1anZE69uvRJdmKP7aLDGe+4Re3mJ56y/tV VyQ8A
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111164345.4059964-8-ardb+git@google.com>
Subject: [PATCH 3/3] riscv: Rename __init_text_end to __inittext_end like
 other archs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_084416_784843_D5CB8BED 
X-CRM114-Status: GOOD (  10.80  )
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
index 9849a3e4d102..ba939c7365b2 100644
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
@@ -72,7 +72,7 @@ SECTIONS
 	}
 	__exittext_end = .;
 
-	__init_text_end = .;
+	__inittext_end = .;
 	. = ALIGN(SECTION_ALIGN);
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
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
2.56.0.611.g1030f0b940-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
