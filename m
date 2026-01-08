Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD43D185EC
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83meg8WWXkFDsPP3heI2OdbGsuMBFzzQkO2X1uTnOIs=; b=XrIpQTCRi6WoBr
	f7L70z8JstAx87xwLF/RQ1KLqF70pmJNtxCJAAypI5cncapOJYBkQ+rRYtXZlFB4jZajpl1wk0tMd
	38ITOAxcmfHXhsGWyNeKAH3B6M5I5Lm92oNgraCcWpXlp/Wmke4JU6evNNJIl7wxM2jiPdAurt6mY
	CDXMzmc/zDIJdzXsX9wH/F2xoBIQyBJcLh9VK2nqlAnJVin+CxROeA4J+IoTNU75BKqtTvQqCEcTL
	/YcHgs/MG7NZv7b5RDJgySfQ6rk2KpauME4uIOXoF8rRRlkuTfewoL/2Ic/5nfjfVGlF7qyObyUPD
	0un/+KCOF/xXKwNKKHjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp78-0000000H07K-1MJa;
	Thu, 08 Jan 2026 12:27:42 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdp75-0000000H05O-3sC2
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 12:27:41 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-c3e921afad1so1405257a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 04:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767875259; x=1768480059; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSlCL63bjlWI7Lu3zwai0kdDlIJMrGyFIXeM2/6yxPg=;
        b=qj1fm520/qHWNmoLPUK79CwKDnLj6dLMG0GC6Wqlce4ylbhhRkUsFY4sCtyDPxAihi
         5kgnOxmMN8qWejs/ggkYt5CNsQhZkee3nmt8I9n1yyI3cafouyIm9mRDUvctlf3h17PX
         IkyAE9qfutMxCFQkV1PaUuYOgYQBS3R8Hc3zROGXtAD320qgsLw2r7pMOFhikTnr4Jsq
         zscwh9qRqzfGxReA3ScngrAJ6hWyeuU2foMmEf9hO0mSjBKzlF90gx63heTmc/JbqWZ4
         FdxRyiaO8FwWc+7mESa2hH6liHhxD5SUAqQGyN2hIRkels1Dn1Ag4TKW7uPhgaa3CxZw
         G7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875259; x=1768480059;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSlCL63bjlWI7Lu3zwai0kdDlIJMrGyFIXeM2/6yxPg=;
        b=C5OBkKJRdNa6p8zw3dnz5GMPeBPshxyUrCLr6MqmWHvnfk5adPRXvFosoeSSiHqgGZ
         aYhJpYZ2Az3GNI8ER5Fggitvfl3QKQmPaRiptRVHYdEsTXtVhg9ojCb4tOUgWVobs/h7
         /PjDEH4sEOZFgunXHyK3Ll+yWtuQZ3+BwFkGBJOr1GLm45Djsrf1h+tch7HqvMPyG8YA
         oUzgv4sOagmTKu5erkMJabTVKnzMxPBvHjiUPQq2ORQwe04n3yaLjgQ+uqxeWrjPNBw+
         JYAZM/8kNmCvCU30sEr5XmdP1II5r22eVmhfInNuPfdjBCRJtuNWhTvO+8rUt5MfZ0nQ
         1NLA==
X-Forwarded-Encrypted: i=1; AJvYcCWggmTRgeiUtFMVlxAD/o/oOCnSDN1zb1WrERasu/wJ/GiDvtQOQ/Kw1SnoCcwWUXhlEARDl0OXy+5u2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa0/bbnygw7M7G/eHkGHkoNOO2j+v1i0pA2+lygPYkhlh8Sv6P
	jZupBiWZ0PgkU6eQfSYgoTVgDrWUIXvK57bV98gQPkd6V0phenaO/eMg+XzoM7NwjBs=
X-Gm-Gg: AY/fxX6On7CXaWtc2yh3HAAyEurVq1EFsY5wIMF0sHLhQxG/PXjy9QoTkpjXsu8JGpH
	p7VV6cqfENfeTK0wXwQherXoP0DbFxgCYciyiwmuvWO8z6vVJlmfFM0+mTi/LlAdlxUnxbfAuOR
	v+UIWbfTl49lFf8v+jlKPMeSI4AyBsN7Y/c7EO0Rpk43uZebMQFKtsWm6HdzHz+RuQpDVh7PmVX
	2nV4C+G+UH5REvn/iyz9jrESlHBJb1ocL5jJD95JcXE+5ONRPIuBvtb+x/MTAhGXmMNRnZuSeeJ
	klPRPSsEqYgFmlE310k2SiDoCSFZ8Y6U3ne6PCYBPXyGN+/smTHnp9EWIpFFA5bsdXRozphc2Ie
	WYX8rRbAad7+GkCdfQFnEhlG6T4Hi3+yHFpYDSDeo0bQRzgH8aEGQh8Kxa/VNMue1dqX14AWqcu
	8Phvg/00tukt/j+EFi0zJMtqZ72mNdWbrm15LzXm0aPA==
X-Google-Smtp-Source: AGHT+IFkYm2SREYy+7WJ7uAuLhJAJVWSuC3ES+DlILkoTqpUr0EQ9J4ASyAuPfOv5z6+UGv+JulmOw==
X-Received: by 2002:a05:6a20:3ca1:b0:366:58cc:b74b with SMTP id adf61e73a8af0-3898f91d2c1mr6221633637.21.1767875258815;
        Thu, 08 Jan 2026 04:27:38 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::40df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bafe991dsm7656401b3a.16.2026.01.08.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:27:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 08 Jan 2026 20:25:59 +0800
Subject: [PATCH v3 08/11] dt-bindings: riscv: Add Ssccptr, Sscounterenw,
 Sstvala, Sstvecd, Ssu64xl
MIME-Version: 1.0
Message-Id: <20260108-k3-basic-dt-v3-8-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
In-Reply-To: <20260108-k3-basic-dt-v3-0-ed99eb4c3ad3@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_042739_968430_C03583BE 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Add descriptions for five new extensions: Ssccptr, Sscounterenw, Sstvala,
Sstvecd, and Ssu64xl. These extensions are ratified in RISC-V Profiles
Version 1.0 (commit b1d806605f87 "Updated to ratified state.").

They are introduced as new extension names for existing features and
regulate implementation details for RISC-V Profile compliance. According
to RISC-V Profiles Version 1.0 and RVA23 Profiles Version 1.0, their
requirement status are:

 - Ssccptr: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Sscounterenw: Mandatory in RVA22S64, RVA23S64
 - Sstvala: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Sstvecd: Mandatory in RVA20S64, RVA22S64, RVA23S64
 - Ssu64xl: Optional in RVA20S64, RVA22S64; Mandatory in RVA23S64

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: No change.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ee2cdd3856b91a5bbf486e8a2da0986269e82a2b..78b75ab0a473b60508f72fc30d4809a797a2c40a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -160,12 +160,26 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccptr
+          description: |
+            The standard Ssccptr extension for main memory (cacheability and
+            coherence) hardware page-table reads, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
         - const: sscofpmf
           description: |
             The standard Sscofpmf supervisor-level extension for count overflow
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: sscounterenw
+          description: |
+            The standard Sscounterenw extension for support writable enables
+            in scounteren for any supported counter, as ratified in RISC-V
+            Profiles Version 1.0, with commit b1d806605f87 ("Updated to
+            ratified state.")
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as
@@ -178,6 +192,24 @@ properties:
             ratified at commit 3f9ed34 ("Add ability to manually trigger
             workflow. (#2)") of riscv-time-compare.
 
+        - const: sstvala
+          description: |
+            The standard Sstvala extension for stval provides all needed values
+            as ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
+        - const: sstvecd
+          description: |
+            The standard Sstvecd extension for stvec supports Direct mode as
+            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
+        - const: ssu64xl
+          description: |
+            The standard Ssu64xl extension for UXLEN=64 must be supported, as
+            ratified in RISC-V Profiles Version 1.0, with commit b1d806605f87
+            ("Updated to ratified state.")
+
         - const: svade
           description: |
             The standard Svade supervisor-level extension for SW-managed PTE A/D

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
