Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBDCCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NK4gc4WJJ8sGuMTZSd7AqUq63vA2juCx44Xgwv1zRs=; b=aIQHMMMrkF6eMs
	NonUgIpuXv3zsDkJh9vWad9IUhSiN4ItAjB7XeWDgpq99jJ4LmtcZHBfpyOLA05yYPVJsqj90xasP
	UCv/oWMVFRvrENYQKTD33qKbau11jRd1S0xeNjPP2UIQwisGP12I09X28vlpjVEefqaHGimtl1Ju4
	wkeEQ/CqbWa0O6NIA+w+oQ1L+n8COmK6b+i9JNHeIkg+gxwcIjTo5OOvKa+9gPDgz3mL1PhBVRlcx
	au1zcp1IMOIrlhw3uvbAhZ3gHHWcS4bVwm+KbCEXTc2LfTj5uEEg6m60Agq7vT6dxqS2YT6OV6TFC
	FuqRUr9ABvY0w8tdhThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0YM-0000000G9Xt-2Goo;
	Wed, 03 Apr 2024 13:21:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XE-0000000G8mE-3rAO;
	Wed, 03 Apr 2024 13:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kz48OxP3NhYfgMKsflTw0/QUK/EsEKDn2LToBTsPHNQ=; b=mbPDIBX60VhJa1bfojsF8lI/21
	Z/xE9JyRiEUiXnGb8Kxes9/BE/GzeuFPmQSgP8vbRuL82xaatkK0tTM7qe/Zphpz+k+dlbDRKjkzc
	oSIw8F5bn7BgtzdGJKkXMz/r80RflyuP/t7g5snLo7bkRKezbm9VDXe6DYnft/mkAN1kRjN7VGFXx
	9HdbBReZf0M1c6EAgwpuMVy//u40hFTLGQKbqCYbrIQO7gyyrtsbp1oqH2JtXRYui2pjwItQLj3qc
	bfGt2OW1pFvKER06WWI47Ro3AO8cFUXivBduFeg8d+VZO0u5w2kFo+K3qGeds7/NPHQZdXcYA5vHP
	LKE3bTxw==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XA-00000004EPg-0UFX;
	Wed, 03 Apr 2024 13:20:11 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e0d8403257so49723495ad.1;
        Wed, 03 Apr 2024 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150394; x=1712755194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kz48OxP3NhYfgMKsflTw0/QUK/EsEKDn2LToBTsPHNQ=;
        b=Rc1mVtCjqASFRDIQ5Bm6QFRB/z/v8RtA9Uth6yr5AuX9bAo/hOgN2/nlWC8iOWCsHG
         cArIS+P9WtgLXLKrLUfgBIziLnIb/s01h2MNAi6iULWQyYw92387HgNaKgdOI9vN7wai
         FK2fgHP/2Z4888G+0YkyfJPMNsiVQ73mp4futS8/iel1w82309CbsHj6t8Kw/+9zCLkA
         vVJ4FkOJp5CtDUXuWhfzsiW68Ci0vOsGvSHtTtEuIKNPzV6ylACcTStyfZTxImTRIudI
         lv4jRg4AQA66hM1QltJi5muqlOpVk9Eg34yUi2JtWwSQbrQcbg9OJQ/nM77y75RdPZVp
         bFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150394; x=1712755194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kz48OxP3NhYfgMKsflTw0/QUK/EsEKDn2LToBTsPHNQ=;
        b=iSdTG4AnhdJShZn/OAydfh0nLAMBoUKzFYGxCVAkGS+SKEaszUlbiNhBzQ9j94qQkz
         kbiZfJOijZ9+Pk87uPpMbzf9j158l2g7pWN24Y+BQRfLwG7axFJJ+k8q+LIEFMDtJ8no
         szFS+mHHsFVhaersTPu2FsE33PpO6kcXdPXyb0fjw7xrQJ+jqVuqT4HaMIA9dZj0QSnd
         vGTziANWpbVzYlEAQt3BLmKZYRtLfBUO8FYb/7xxZbBgp6Z3nZM0oyhZ5JMBimN6Ppjq
         c0usL6eAJ3OwDj5KDvZZC7ut6hC+DbaUnmvoJcpFvJtqQGzEel1hX+zowASnK6OGWwsx
         R+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUta5ufmt63MIr3ElRXcQXXo/94BwRKNj5xarAHeuKQCWkUhwyOwcNJZte9bE643j5iDX8ckspd5JSwFwbvRM6kVuHlSXJ0ottn399dGgPxKAyJ9RsreRgakX0QVESKxV2YmbCA3fcwEYoKl0Bl0B/9TfLvuIw=
X-Gm-Message-State: AOJu0YwQsnzdbYZolmtUk4iK32FOrK+r22w5ifKP1Th2bRRUxP2BV0dH
	/zmwfiKYng4LNFt7d63Imx13+bHoH/4madvutbo1tOZwz6l8gCox
X-Google-Smtp-Source: AGHT+IFNgcjVYp4BARBLtJXFan7xr/0CnX1zHuDDo3GwnVh2w9uqbZMBPA/s2jR8/t1K3n7W3FEYHw==
X-Received: by 2002:a17:902:ec8b:b0:1e2:2e93:10ef with SMTP id x11-20020a170902ec8b00b001e22e9310efmr15831594plg.52.1712150394590;
        Wed, 03 Apr 2024 06:19:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902704400b001e26e1e62f9sm3840318plt.176.2024.04.03.06.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:54 -0700 (PDT)
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
	netdev@vger.kernel.org,
	x86@kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: [PATCH v3 07/15] x86: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:28 -0700
Message-Id: <20240403131936.787234-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142008_291680_79F0EFCB 
X-CRM114-Status: GOOD (  13.30  )
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
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..7698dfa74c98 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -23,18 +23,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
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
