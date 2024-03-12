Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD9EC54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EH2MsRFIZ+TBjU6rRRyueUSwCnupuf3g9pGX9pXMVc4=; b=ODaUjPfSYrZ15r
	Hp3BSyJEd+rFwayZxOgickxtIKEv2kMJ8wLTIu1j8vjzKLo3AzdZJg9+MwP8QiaV0mDkV8XI/EV0c
	/p4J//+i+B5R6M4Y/IbPiiPU4a4HxQuBmX5DELsV3vWP5tajQz9fB4WrkPlvDmEVjU+Xop9+l8jkv
	Br9Reo1EwXVtJyjXv4uYi6uQuzZyHLdVPDPtJHelHOIMAZml3pTxOQophw1N2fDjBM/eoITyu2+0Y
	t7Dt6xvZRNBuCSEpEln69+ZkmQfs6f8KGsBfbjbrtzlsa5xA206bhALpoeVU20KMn2ILYEydDSM9z
	25/AECWASRLzsOVEvZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qU-00000007IDG-176D;
	Tue, 12 Mar 2024 19:31:30 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XG-00000006ihj-3n9R;
	Tue, 12 Mar 2024 17:03:35 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso2900494a12.3;
        Tue, 12 Mar 2024 10:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263009; x=1710867809; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e/E6ddr2rv0O0qI6ESGYNVGq97JQ/YRs1mbYMxZhW0=;
        b=PX2QEuckrC/MwVZaKse7o/G7QNWSLqRIJw8rGWfcPkxmit6uDdHOKOtgRL6JIoXgSe
         h1vJHOsV688o0wYU2oF4uhxsy/P0LY9QPnr+jkSHvSIAnCstAaliG9nUIfLUUYO9Le1c
         ARYDduNS1/oxVTfLG2+tde7eeoF/A+B30Vps+CNR99LCilcZzFFDULxuqS6MDO7LUpCt
         ykbixU4Ua0kxsDJYwwMoveikgyFA0H6gO/EXDFH2pzNwrAiWGBGoe0ubK9nFZ6SXYS8q
         AUc6sffSHos1kL++PNds68/domQHc1tmxPTXIp+Pot9jotToHpNwR74+OCS/MijSuxW8
         bQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263009; x=1710867809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5e/E6ddr2rv0O0qI6ESGYNVGq97JQ/YRs1mbYMxZhW0=;
        b=ckAiFQx8RT4GSr0IFZdQlREIIoDdNH5+jg0BIEXrPC7cOY0cLdhE+DL15/6dXJOHk4
         PdeGZZyK/rURgbZg8AISrwFRGNt1PaOxaXHHEKDNbRGR3tZlHYywxoeX6onjA+SMI9B+
         laCer/Y9ceJOGqQXO69qScE0p2wGLzmv/w4jQ1ZGiMbniaMqNYy7Rs14QfA0RAmZIR7Y
         THQ80Xv8YhPBlNM/DWPf3oLGyBrPYEBVkfToVy8eJHlcSCJd5WH7OWudUt7cZWxo22iQ
         ++hWlCX56oSBXYpJ+Ul/jDGkLiR6nXHlbV9Ha4enIO3VW1ajcr5rsUfbN2RlA3TC1XWI
         adiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw99rVvy6eLaw3Mn4q05M7kU2UaYxIj0rB4yUR8H3suVnDTdmV7k17YWp7fk/uKs5HhMLdx7XZKRNCLfxaqIPZMa/rHT7Uv1WtuMZXyp0bsgxggRx8wePsN0yvmvWhA4G4DSlSZg0ZNlAPi9Tfzbps5XLY9c4=
X-Gm-Message-State: AOJu0YzNrLCNL5B+0ZgcuMxrJyPDRdomoVGeYhl5sxSlqjJ5I4CGy+3a
	k5juexR3Ex/Ctwbf2/fABzL1y80NTwMAcp37LY10fWfViPTzYG8N
X-Google-Smtp-Source: AGHT+IHnpV6pQ4sbhTQFUz6ATEKXpUTcdarefNsnZ32RzB7TxwrdDKUDIv3vmdM+PJbrepqm0Atu1Q==
X-Received: by 2002:a17:90a:ba93:b0:29c:844:a91 with SMTP id t19-20020a17090aba9300b0029c08440a91mr5600961pjr.48.1710263008670;
        Tue, 12 Mar 2024 10:03:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bf20-20020a17090b0b1400b0029bc2b845c4sm5986405pjb.11.2024.03.12.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:28 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 07/14] x86: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:02 -0700
Message-Id: <20240312170309.2546362-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100331_255779_62037F8B 
X-CRM114-Status: GOOD (  12.47  )
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..d87bf8bab238 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -23,18 +23,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
+		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
+		     "\t.word %c2"        "\t# bug_entry::line\n"	\
+		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
+		     "\t.org 2b+%c4\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -80,7 +90,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);		\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
