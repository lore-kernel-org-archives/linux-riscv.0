Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA01EC7115E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 03:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N0IsDBULQdrbCBWFlE4Cx/1E2HG57fETODqBQiuqPFY=; b=dK3jq7PYihMGyW
	jBSxpBMsgiLLxIBwROagnQnE1j6nuRcOvrRW/SJPZV9IZIDAIN0u/rA5Fx0m0twMjgLIO+cohiQgz
	8BnbzboOT5kKHdAGgGPJRx57qHFyJW/po8s30D4sSoo4YzTgQVe3yUp3/aQDFYD1ELWJo1IG6GbZm
	Tpn+JbWdjmNsdMpjo9/QGTir6xNueKP0Al8ai3Wkt/UwnqfwY2caR0JM2zmjAnhCMuHUBNbR602OP
	FfkDvD0knFsmpW14s4oIlk8XIlnkrU816TPxzx9pDfUFOXmx+3+V7jjtHWdHoDFV7BmSNS1r4NyLC
	mUW5H5RlQplsv87oQOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjW1A-00000000O7z-27d9;
	Thu, 29 Aug 2024 03:40:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjW0W-00000000NwP-2UOg
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 03:39:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-201f7fb09f6so1485605ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 20:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724902776; x=1725507576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3GAnBxuP0k13UOo0B/EnxeGCQ0ew6a+lFlFL3wfeVM=;
        b=nOY8/vHJUZV77oi32adxZG3ViKUCGikoVtQOTAF6zZFzkfg6oRdLuDXbmUzs2pljSZ
         Z/Hf7TaGCCdPBbraFy9vS1mmj4DaiiNdkgvZbu4TGD2IujZADSFQoBWVMdsArXXMNP9L
         vGIcASCWZE4abIHfxnx5tkzvZD+xQOfNuc8jJssv/gjfMkpgt3pOtyYPWURTSARuWWIJ
         iZrjlIxIku09t6J+xFYYTYCOy9YDPw5UxTTlXm1oXZXH6FrwjBsxJIEMkJTFV9GDUc/K
         o2KGOvrkx5FYCL0vV/So+z2R/bwXMUbQ3/wC/+tvuw9v+aaNZFVroL9hX86ldBFRuBg8
         vI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902776; x=1725507576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3GAnBxuP0k13UOo0B/EnxeGCQ0ew6a+lFlFL3wfeVM=;
        b=gvwf9867cH2xeki1ELNPpwXIH9T0udAyQShLkDZ3gTEThVPF8xo9NMcWjJHnPcvwm9
         TJUkljP1YA9wulnkxGmgwusuord1iZTDO6byffFbIVDJO8BtgeHGAh/OJJOP/W2ZGI6T
         L4K/3thGmty0qV2lHSKItRc3klDR24XytKxZuCQbaiZyVQGs/PUEGMa3dxx4ognrZUZ5
         AI/mUvNXzGQsUARLFPa6lqB1KyyP0BJ7oBDIkiLLdCL0N88+nvoA/06JKCbKOfr3OuMa
         S8MIC50bGK4anrLGtzfHhU3QY4htogmxHpU1yWErZyoebJx+gxmE+o4PDzhGqPqTddOq
         qBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXI3uObhrbzn9lyt7BWWNIgsVEbTVNkJvMc7jrsD+Qw5WEmcLIDY4MuKNzgc9mzRCyhStjnQnkVVPaRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0ANXPIbcpT2TPBKZEjem4Ie78CutmeAyrInq4acLKsWD/oPFH
	gbYUbEKPSbXa1YE2u1vixFG7sdMpBthzgWaWjXZPLuBymNWTrxjRdn8BT4F42Rg=
X-Google-Smtp-Source: AGHT+IH/8fsuBgr/qoojKI4pyRmSBKKLvKU8OllZIsbVlPHRLEjgz17SXXEQ34o9DYQ5ZzKFjsFW3Q==
X-Received: by 2002:a17:902:d50d:b0:202:5075:428d with SMTP id d9443c01a7336-2050c4b6ca4mr16399455ad.64.1724902775824;
        Wed, 28 Aug 2024 20:39:35 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542498sm2056065ad.188.2024.08.28.20.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 20:39:35 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Nick Hu <nick.hu@sifive.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: Add stimecmp save and restore
Date: Thu, 29 Aug 2024 11:38:59 +0800
Message-Id: <20240829033904.477200-2-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829033904.477200-1-nick.hu@sifive.com>
References: <20240829033904.477200-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_203936_660632_570884FC 
X-CRM114-Status: GOOD (  10.98  )
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

If the HW support the SSTC extension, we should save and restore the
stimecmp register while cpu non retention suspend.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 arch/riscv/include/asm/suspend.h |  4 ++++
 arch/riscv/kernel/suspend.c      | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
index 4ffb022b097f..ffaac2efabb5 100644
--- a/arch/riscv/include/asm/suspend.h
+++ b/arch/riscv/include/asm/suspend.h
@@ -16,6 +16,10 @@ struct suspend_context {
 	unsigned long envcfg;
 	unsigned long tvec;
 	unsigned long ie;
+#if __riscv_xlen < 64
+	unsigned long stimecmph;
+#endif
+	unsigned long stimecmp;
 #ifdef CONFIG_MMU
 	unsigned long satp;
 #endif
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index c8cec0cc5833..3afd86e1abf7 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -19,6 +19,12 @@ void suspend_save_csrs(struct suspend_context *context)
 	context->tvec = csr_read(CSR_TVEC);
 	context->ie = csr_read(CSR_IE);
 
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+		context->stimecmp = csr_read(CSR_STIMECMP);
+#if __riscv_xlen < 64
+		context->stimecmph = csr_read(CSR_STIMECMPH);
+#endif
+	}
 	/*
 	 * No need to save/restore IP CSR (i.e. MIP or SIP) because:
 	 *
@@ -42,6 +48,13 @@ void suspend_restore_csrs(struct suspend_context *context)
 	csr_write(CSR_TVEC, context->tvec);
 	csr_write(CSR_IE, context->ie);
 
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
+		csr_write(CSR_STIMECMP, context->stimecmp);
+#if __riscv_xlen < 64
+		csr_write(CSR_STIMECMPH, context->stimecmph);
+#endif
+	}
+
 #ifdef CONFIG_MMU
 	csr_write(CSR_SATP, context->satp);
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
