Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD283C54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 12:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZrwI8pC7eEGCsQHW5oJa+D2Y125fFBL5N1ZHwzvxfc=; b=hFgn5DoY8AVLAp
	I0M3OYOH9aA98VIHBTTm74TEHEoxj8JOuVHKmNTI069YWguEpfmv3uw/3zMMDSfrlXkTZxtYwvjCV
	RWj+LzBxBG6EtqgTJQmXobzrUhOl0Ls7nKJXFSzezoo+/sTo3nNRtEOVB0bG5X2cXV8jJHdhnW6kj
	F8kGAjbVFBi9abAv3OCQtidKEHQ1azbAOqwVoks/5mLGxhdhrvhOnQLEi+14sV3zPa/IBEDE7DvNX
	ew2npJkkEX5znBu5soefgRXQbxMsRYcw/R3h56x1ReZAeG3krYZh77kXz69GjrgYQxA/byQTqo6Yw
	6bnKV0IZx43DsfHq5Qhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1NT-00000005lnN-2jCv;
	Tue, 12 Mar 2024 12:37:07 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk1NP-00000005lk1-12T1
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 12:37:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-29c16b324ecso1325096a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 05:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1710247022; x=1710851822; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/AgPq2nu+A2U5g0bYOC1f9iV3K7xrBHfOXnwZQ2oGko=;
        b=HVDXFJKkabEVNI34wq1qAjBHYP2R03cSg6VkX22wQJj2TPzeryB24tOg/J+sjBXDCo
         NmcMDBIyrA68k5o8S2ZMkQERmn0b0XXgWqAJko+Mo/SX51bEj++j8pwr5lB6PzC0SX0P
         DTgW8e71DxbbiFrGGPi+sviQIErS+3J/RJNRnJX0zELdqbccOTNZp6pboQj6mPopaumi
         NOTtNZGSC7o8CKN9qNFoIMMq/fBi5g9YiplDPA2yPhVXvErTe7jXBFqlHpT2waI/3Cgg
         QSQthQEuCyDXNCCtJEBXsbd+tsqVIPItI+JHMZ7CMooZzJDaVLSiQXL0tS+zvcEeTtVK
         2/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247022; x=1710851822;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/AgPq2nu+A2U5g0bYOC1f9iV3K7xrBHfOXnwZQ2oGko=;
        b=pcs4e8WnaVR9eP3os5snwkKl3OvcY+w0wYuUOWNgPe4nws4O9+fkRFTYzYhEdgTeVJ
         Dt5OU/Z2RatftGHYddcBeH1Yz72ZQJ5alr6AFeQ8eiLQmF8oy+23IRfuhblG955WZAwu
         fJsildZX+nZ1/kGuZ69BhhIWXM7V6yJMxV267OiXjfEzmJDKvRn08vMg5jXf1FB48yLh
         51/qiwTVaudYR4/CKptvn/RFQBjzcoD42DLYJAm64nvagDqPhbWon3Aa+qtXQKXYftcf
         NtU3q07j+kpoRoo5Ajlk18BjzzN1Bm4KZaAflnf5A4u4DiWA+q+8sSmlc6eD1Kkj3PO1
         rQlg==
X-Gm-Message-State: AOJu0YzgjJNq3a2HbqbB4haecLzhAYiG7NKlZfKvOKtS6FillNpWXQ26
	TJm/6qr1CQ3rfw1BygKzghGj6yUBTOn6AZiN+SD6h3uBPfYfCq3Ec99Y5WbWpJCJvElGoQzslXP
	o3nyqdODuI+zHOd/2dDabBcDG9dN4WQHf+YkqcKGAzl+0j512x2YUNOgbVzpubbsdIUFnOvsZD9
	fVAbwF2K6AoMVBWwEFNCsCe8GSjjkwDxFdXZjnncA+e2WVLYZ7Al+f
X-Google-Smtp-Source: AGHT+IFWcVc8ohditsm0AFO/HZMaxS5ttP0/B2MBk81eyVNWJWQpR1HP2AIT+GYbAtyhnvag7OrpqA==
X-Received: by 2002:a17:90a:9084:b0:29b:b854:db with SMTP id j4-20020a17090a908400b0029bb85400dbmr7434996pjo.27.1710247021814;
        Tue, 12 Mar 2024 05:37:01 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id hk13-20020a17090b224d00b0029c2794d3f7sm1804233pjb.7.2024.03.12.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 05:37:01 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	bjorn@kernel.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Evan Green <evan@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Costa Shulyupin <costa.shul@redhat.com>
Subject: [v1, 5/6] riscv: hwprobe: add zve Vector subextesnions into hwprobe interface
Date: Tue, 12 Mar 2024 20:36:26 +0800
Message-Id: <20240312123627.9285-6-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240312123627.9285-1-andy.chiu@sifive.com>
References: <20240312123627.9285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_053703_320173_25F3A3AC 
X-CRM114-Status: GOOD (  10.41  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following Vector subextensions for "embedded" platforms are added
into RISCV_HWPROBE_KEY_IMA_EXT_0:
 - ZVE32X
 - ZVE32F
 - ZVE64X
 - ZVE64F
 - ZVE64D

Extensions end with X mean the platform don't have a Vector FPU.
Extensions end with F/D mean whether single (F) or double (D) precision
Vector operation is supported.

The number 32 or 64 follows from ZVE tells the maximum element length.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 15 +++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  5 +++++
 arch/riscv/kernel/sys_hwprobe.c       |  5 +++++
 3 files changed, 25 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..d0b02e012e5d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -188,6 +188,21 @@ The following keys are defined:
        manual starting from commit 95cf1f9 ("Add changes requested by Ved
        during signoff")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVE32X`: The Vector sub-extension Zve32x is
+    supported, as defined by version 1.0 of the RISC-V Vector extension manual.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVE32F`: The Vector sub-extension Zve32f is
+    supported, as defined by version 1.0 of the RISC-V Vector extension manual.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVE64X`: The Vector sub-extension Zve64x is
+    supported, as defined by version 1.0 of the RISC-V Vector extension manual.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVE64F`: The Vector sub-extension Zve64f is
+    supported, as defined by version 1.0 of the RISC-V Vector extension manual.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZVE64D`: The Vector sub-extension Zve64d is
+    supported, as defined by version 1.0 of the RISC-V Vector extension manual.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..b9a0876e969f 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,11 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_ZVE32X	(1ULL << 36)
+#define		RISCV_HWPROBE_EXT_ZVE32F	(1ULL << 37)
+#define		RISCV_HWPROBE_EXT_ZVE64X	(1ULL << 38)
+#define		RISCV_HWPROBE_EXT_ZVE64F	(1ULL << 39)
+#define		RISCV_HWPROBE_EXT_ZVE64D	(1ULL << 40)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..2500d175ed66 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -111,6 +111,11 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
 		EXT_KEY(ZICOND);
+		EXT_KEY(ZVE32X);
+		EXT_KEY(ZVE32F);
+		EXT_KEY(ZVE64X);
+		EXT_KEY(ZVE64F);
+		EXT_KEY(ZVE64D);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
