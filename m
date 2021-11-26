Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0BDC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 00:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YnBPvWzsoEWSj1qKq4+XFxrCL0aXjBV1k6iu+UY8AdA=; b=nRPZis6KWWTEJK
	jATh+GzWLuR6dpAKbnvAGQPyhUtdv1aKUObfo+BrrYE28JCeHQQRr5XYesHvSPAL41FfEZMiQO0Pn
	RW46a26TBixtWIcFN+Pr6OwhEPMpKo7vNNSRhC+f+RF22oKZNWzVr8WxND4ihF2oYHSzHQW3vHIUH
	D2uLDUAGpEuEEPC/cfpf5ZG6Se/9s0xhkAQQRvXFvLwBoKJB3TVClSqrG6dfxWvrvURCkfEflEo4o
	hghK98Oqw+GEqvV0uMCPDDo/UIMjhO1NQXCpZp12uVYFrpLxuRuz5fiMcbHbXdOBvVuhDml4jS6bJ
	lQnUNkzQopPUpn3TCVyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqOtm-008v0u-61; Fri, 26 Nov 2021 00:15:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqOti-008v0C-Uh
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 00:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637885724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=aHYTSvEaf35gtxIU/OdUXMVV96quCC++ChEzR9yL5d0=;
 b=B7v62U1Myr59P/gkdh6mfr8eLKSH42mv7ix2R6V1wdtjK+6OFFxN2pekNtDLiWNsGxGrqN
 GD+wBN/hLbItYvUJseTYyG6ljo6ozK1+iAMV+p0q5ukNNa9xdAxsUNUUCU0/Ghc3QX3Ajr
 4MPX7zJ9nCEPDb5IGeA+3/axLh5uUSU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-535-2avXGm24NAeJXwBY7zE3oQ-1; Thu, 25 Nov 2021 19:13:43 -0500
X-MC-Unique: 2avXGm24NAeJXwBY7zE3oQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p17-20020adff211000000b0017b902a7701so1402144wro.19
 for <linux-riscv@lists.infradead.org>; Thu, 25 Nov 2021 16:13:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aHYTSvEaf35gtxIU/OdUXMVV96quCC++ChEzR9yL5d0=;
 b=iDqG8h4Py7JR+cXSBWZiI4lQ5YumkDjHysiJB3OGb2vdTHkmM8uNuad7zK5PZ+S9Ho
 T6YIcGnJx+e7cW5YZcWIfIOHubfgTo2XVt3n3qZ0I2x/sPz0rOxoZ8E+wVXaCmOuqqYW
 x1jvlLd8BCPrWz7+FlOj+yTfCC7PpaF5tVEXlTtGsaiZYKVUJM6YqVAXQ2N79rB0FhJW
 wPsjFL0EpLTBQTMpa4b1i4uthEBc4VxZaJF9X/Grp1MqrgLjGBft9qWRj4R0epf4ePLp
 F37KLs+Hp3HoKpHPnQmQHEZXeGFo4adro7nH6Ah7Y/bQsqEhFCRsaZog2PE9db9w6xVv
 QXHQ==
X-Gm-Message-State: AOAM532/1HddEOSiZZAtcvfm5GWvvzkfEYAPJaknDe400VVTl6Y+ESLG
 NcLahWQd3Qsf70juWHLM0vHA2yoyny4Zlrn1XwKYAhRSB15UDA19SdN7SJ0IQMumYcha1tbCCie
 ogP0p6jurPm2zLZ0FHgpKNUF8piGv
X-Received: by 2002:adf:dc12:: with SMTP id t18mr11013256wri.566.1637885622044; 
 Thu, 25 Nov 2021 16:13:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoZG+YdMkwdiPxwlrZTBFxCXXKIKLYVcyqaOTO6tv8VqV0xmHfGjnG9iHtSwOjpJh8BXAkyg==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr11013235wri.566.1637885621813; 
 Thu, 25 Nov 2021 16:13:41 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id a12sm4005540wrm.62.2021.11.25.16.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 16:13:41 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH] efi: Move efifb_setup_from_dmi() prototype from arch headers
Date: Fri, 26 Nov 2021 01:13:32 +0100
Message-Id: <20211126001333.555514-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_161527_101690_D5157A74 
X-CRM114-Status: GOOD (  14.39  )
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

Commit 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup
for all arches") made the Generic System Framebuffers (sysfb) driver able
to be built on non-x86 architectures.

But left the efifb_setup_from_dmi() function prototype declaration in the
architecture specific headers. This could lead to the following compiler
warning as reported by the kernel test robot:

   drivers/firmware/efi/sysfb_efi.c:70:6: warning: no previous prototype for function 'efifb_setup_from_dmi' [-Wmissing-prototypes]
   void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
        ^
   drivers/firmware/efi/sysfb_efi.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void efifb_setup_from_dmi(struct screen_info *si, const char *opt)

Fixes: 8633ef82f101 ("drivers/firmware: consolidate EFI framebuffer setup for all arches")
Reported-by: kernel test robot <lkp@intel.com>
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 arch/arm/include/asm/efi.h   | 1 -
 arch/arm64/include/asm/efi.h | 1 -
 arch/riscv/include/asm/efi.h | 1 -
 arch/x86/include/asm/efi.h   | 2 --
 include/linux/efi.h          | 6 ++++++
 5 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/efi.h b/arch/arm/include/asm/efi.h
index a6f3b179e8a9..27218eabbf9a 100644
--- a/arch/arm/include/asm/efi.h
+++ b/arch/arm/include/asm/efi.h
@@ -17,7 +17,6 @@
 
 #ifdef CONFIG_EFI
 void efi_init(void);
-extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 
 int efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md);
 int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md);
diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index d3e1825337be..ad55079abe47 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -14,7 +14,6 @@
 
 #ifdef CONFIG_EFI
 extern void efi_init(void);
-extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 #else
 #define efi_init()
 #endif
diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index 49b398fe99f1..cc4f6787f937 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -13,7 +13,6 @@
 
 #ifdef CONFIG_EFI
 extern void efi_init(void);
-extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 #else
 #define efi_init()
 #endif
diff --git a/arch/x86/include/asm/efi.h b/arch/x86/include/asm/efi.h
index 4d0b126835b8..63158fd55856 100644
--- a/arch/x86/include/asm/efi.h
+++ b/arch/x86/include/asm/efi.h
@@ -197,8 +197,6 @@ static inline bool efi_runtime_supported(void)
 
 extern void parse_efi_setup(u64 phys_addr, u32 data_len);
 
-extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
-
 extern void efi_thunk_runtime_setup(void);
 efi_status_t efi_set_virtual_address_map(unsigned long memory_map_size,
 					 unsigned long descriptor_size,
diff --git a/include/linux/efi.h b/include/linux/efi.h
index dbd39b20e034..ef8dbc0a1522 100644
--- a/include/linux/efi.h
+++ b/include/linux/efi.h
@@ -1283,4 +1283,10 @@ static inline struct efi_mokvar_table_entry *efi_mokvar_entry_find(
 }
 #endif
 
+#ifdef CONFIG_SYSFB
+extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
+#else
+static inline void efifb_setup_from_dmi(struct screen_info *si, const char *opt) { }
+#endif
+
 #endif /* _LINUX_EFI_H */
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
