Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90F1606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TlzmvlHk;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YyVkiDqO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=EKBbnqyANkZ5aNpyz+vCsPPCm6dcfq4LogPU+H74IYs=; b=TlzmvlHkikrQcYY0vRV0w4eX08
	ul4R7qKUkh0E2MkllnPJjgpjZs6f+EynMLODJVHvSFQnJ9NP7w1j7bMymI5SzafjmMuDuRRcuu6rZ
	ocE7xygcA8cp6g8ULbQn4B64dDtJs6u5Tx9Om98Dcuu648sIdW5poTfCW3ty//iniHAh2FzU+j5kx
	EJ05jRkWx8hAluNvvKcRXn93EWZI4nfw6z861F4f0NRcn+/cKsGswtiiRb6LQS/36bnuu7blRirZt
	Va+cXH7f6vFoTq3w4EdS1tvVYVuKTJkDfVnG8fytFvIEymsOwidH6AtRk4q+R/3W9hyC+bE8Bzhfx
	79sCmrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxg7-00000002pQh-0jBF;
	Mon, 16 Nov 2026 14:27:27 +0000
Received: from mail-wr1-x448.google.com ([2a00:1450:4864:20::448])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxfz-00000002pGw-3WCI
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:27:22 +0000
Received: by mail-wr1-x448.google.com with SMTP id ffacd0b85a97d-4930269afdcso2478119f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2026 06:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794839238; x=1795444038; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5R2g9UB0W7Cq1TglUi5KIOs/VyvT4iQcIBDMlZHHNJ4=;
        b=YyVkiDqOckJbp5V+CC4CGxTm4Iq3gp7NfjEKGCNZb7ri+6l9AadAscLS7tojnaxOBe
         Hi1krNhGEs75qLplkwsSyjLSsxU6PJ1zXt5UGNhtFLlIQXMEmmMsqKq2r6bc56GlJx4D
         8fsPEwbX7EZBP0o7gS/TUt51wzALGvX1o/KUF3yYhUC96VEtwlbQ2nVy/ENbbUS+7zL7
         PA1cvXTZOQsKutecPcWbaWKfM3dp+mKhzDiNanc3WKFgjtxdHBx8VoXYA+zJUoON+Tx+
         UBQAHULmDMBlj1pNT3/piafvyGWBin9pyO6qAFHWUG1RDO3xFeLkJeW5ZX0IWzM5TeG5
         o86w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839238; x=1795444038;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5R2g9UB0W7Cq1TglUi5KIOs/VyvT4iQcIBDMlZHHNJ4=;
        b=TVdELLRKtAYPhV8XfruYiWE46Gi0HfS7HPQ43URGigd3kf5lKFz96WOCE19/JE+D+1
         6o1otOEGPHi1DBrsyik5q2GTTpMtkKjjPlF73jIylNTEhyFXumI+NP2UVhVf/KcAyIq4
         O/1PB2KwYPcmYqbkEd2JwNUQ8eP1HMJBT1oI31pCBOXuOre8SkeVE2cH3v/g+FdFmWYu
         t9j7lY3yPkiudvaabfpwm3kManYkpcsONsaEFjnOVf+x9QNe4N0Cdp1ATw9OBeZDZ2FE
         n4RRoCtfXVF0bQxCgwXgKmjVa2d9h6YifhHtDmScFV1wu6OE4LKwSTEHD+l+beHsaa2k
         VWkw==
X-Forwarded-Encrypted: i=1; AL+hErExZvgTC5R99GBziNaF9XiSmT/0Cv90SNcQ+UDbinbtTOjy4GPj+7zxoi42lq2fC95G96p4YMATM8BRlg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/QV/HbY4l7fbnf+VQ1SSda7fSPi8otRzVlAwXwsIy+W3oqXUNV
	94zdpORayZ+4D0FTLo5FpRxULD9EAno0C56Ga7JoP+yIDOvorNDgZpxLODmioGzoy+9vlqup+w=
	=
X-Received: from wrok6.prod.google.com ([2002:adf:f286:0:b0:493:d441:be7f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:584b:0:b0:490:71a7:6f51
 with SMTP id ffacd0b85a97d-49c72ba6509mr22449676f8f.45.1794839236764; Mon, 16
 Nov 2026 06:27:16 -0800 (PST)
Date: Mon, 16 Nov 2026 15:26:23 +0100
In-Reply-To: <20261116142618.1687025-17-ardb+git@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261116142618.1687025-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2981; i=ardb@kernel.org;
 h=from:subject; bh=8ndYJWrl5/5wY4uh6dzMJ+7YlbAJMHVUNmS0W0hi37A=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIeu30MSrTJ27pkw5q/E2uejHnms/n2+SWLfg1plna36U6
 s4Uyfxi1FHKwiDGxSArpsgiMPvvu52nJ0rVOs+ShZnDygQyhIGLUwAmsquFkeGL/Zr2F/FRRtFF
 3L9sW+7N3qJ1/c1Dg9yKmY+eR046/1uJkeHT1Pev7Cpzzr93SnY6G7djx68ll3oyj09f9z0v/fi 9U8cYAA==
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116142618.1687025-21-ardb+git@google.com>
Subject: [PATCH v3 04/15] efi/riscv: Rename __init_text_end to __inittext_end
 like other archs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_062719_896855_8A7C7E4A 
X-CRM114-Status: GOOD (  10.93  )
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
