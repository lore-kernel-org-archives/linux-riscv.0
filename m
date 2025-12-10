Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B689BD3C929
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k1moEVBN9r8VMg0r2+R85kGDFp8ST9mh1Yw+9vpFBL8=; b=BgrEPKAZzK7Tb5
	gLjRowadmeFpmzj2LDnmJONAwx7YefdzmNiWcDdAqEaDK28L83kkfdIFHT9JYECw6t2lNF2A904TB
	vfCn3YsbA5kL33eZcIlbl04/1rKKKz2NL4OUdigOB+tK+2eFWsGKDSGmV9JTIgNdl/n8RgmH+D3Lc
	mvDuenT/evYXoGXTzepEZnzW+uyqCWZGrsP74CdrsekOWjZrHqV938chtHdW3iTn4AdGG3I93HoNZ
	2uUUciFudLofS7Rb002HFGvgwFcJAHPfAsydeQqYX0Atro06TQ6gPo5AJ9ca5ZsDimc/hxd6r4GYe
	A7whb1h3K8wSK1a4YBMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpK-0000000Fc3T-3Hcz;
	Wed, 10 Dec 2025 16:14:06 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMpH-0000000Fc1y-0QqH
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:14:04 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-bddba676613so4751554a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Dec 2025 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1765383242; x=1765988042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qTSh15bOn/ISe22sYdxi0IbFDDEA9tv9gUhK7XWH2vw=;
        b=IjqTR9mp9Fm0a+A7DQ/A67I90xb7xlCrnaUs6fq7bQvV3t/okj0oFBaPGgB6K7JR2l
         dobn9Dkrlhzd7+pvTh9hydp50OzvzezmR3HVSGh3F6AIEbX0RbYNWGHwVTfduZDXOBMq
         OHgwbxpVnEFW0TnHWmBZlKVpI5cST3xTgoLAL6ZqVcxwMtyEI5pBO2rVFbl/v4QwZlgl
         IEalz3e2W1p4lTm/UrdENto3aoZqwVwpGOYcjR8ykjcPckKh4JpmwRHFQ5kNcx52cKHz
         vMZ+vHj5Y+Io+NEwOZCrS4nKheg2X+CJ10dWebm0chmzxYmnjG9kI7XdM0urU7d8hKkx
         i2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383242; x=1765988042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qTSh15bOn/ISe22sYdxi0IbFDDEA9tv9gUhK7XWH2vw=;
        b=Rzg/n8qu90+Q3yVxMQniqMFVW+27u/p83k6YzlKG/WroTTA7dUemQnFuRpJrY0EGOi
         RXaWGeIcQygJ2eutDj01FkivgVMVFYyPywZpT6R2+hUEFv8WarNdTZcSBiI2EtzrUHjp
         wliGlNHXp4+Opau7L6ZlfCDIJ0r+Qp2x4aX5LE7VqyqaoZVTJap/ln52q3t+EPKSxLnu
         lh+lAGfzqFWvRjjOjRSFl4c1q92T4xV96V6BZuuU8mG4wIwrJsbdDX/PBv8Z8fMDZSzM
         2hOUdydd1KxBZLXW5fQBXhr1PldvZBvqQ/ufQUNXV+rGpv+qWZwncXqKxVEuhYs7ffQC
         JRew==
X-Gm-Message-State: AOJu0YzIxXfLv10PDq/KRT0ZSjQ8mnpTuRZgaDeTBBRKwbFJlAoTtHTL
	vGfc1blufoF202U85tohXZWck8aD1bDns83GQtkL3zCWpSp3sKOmVhSe9XUcxF13spI=
X-Gm-Gg: ASbGncuzKIRPv6rrBLGrehh+gCseAipr53ksDRtyRwvwfb0r6laElyfJis0VtaPgbB+
	M21Npdn4T3aTzxAp9MUzUC78omuJwwZGIcy60DGQc0G8S8X7A5gEATrtnFNHwbCEDJjZlsFP/tw
	FN2rCztu9Ki2SWFDqfP0v8UQM0Lo1UGrgEJqUtprvj0ZXheeX21KcaWbGaPRpfJ8xo1mEWgpv12
	GZfuiTHyhPO4kemsqvARlxs0o0iaGPUdpOZqKTGdYu0s4pfZyrMmpzz9iLcEjklABaUamMTmEo0
	o+SDk6u9P8+F8fsle4OOcpgTwP+r1pcE3IcZuRZcGcWJYW/W9Abxq6BjSGZZV6nyu1zryFZT7yn
	YxyXdBrnYPQ0zq563uZ/s08tnJA820qmlUDjLSLWnQv9Q/MpIc3THnIjQnRzBMY0H2fusQI49vO
	pPMWt3xSJplbYSRxa1Nohr8HADbmEbuuuSdNtGTRxuJ3ma1qQUop/M1a1kX3EHRrwMFP+LTL1wU
	w5NwtDgYq1g
X-Google-Smtp-Source: AGHT+IFloP2cltPI8IKSBsR3cQfpYXlU7qszA9eHpor1X56F0IBfeYjmlpcQsl+fWBlxs64diwNDwg==
X-Received: by 2002:a05:7022:e21:b0:119:e569:f615 with SMTP id a92af1059eb24-11f2963f1bamr2216659c88.14.1765383242124;
        Wed, 10 Dec 2025 08:14:02 -0800 (PST)
Received: from [127.0.1.1] (p7838222-ipoefx.ipoe.ocn.ne.jp. [123.225.39.221])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f283d4733sm10364600c88.17.2025.12.10.08.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:01 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
X-Google-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Wed, 10 Dec 2025 08:13:42 -0800
Subject: [PATCH RFC 05/10] riscv: kconfig: Add zve32x
MIME-Version: 1.0
Message-Id: <20251210-profiles-v1-5-315a6ff2ca5a@gmail.com>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
In-Reply-To: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765383226; l=1267;
 i=thecharlesjenkins@gmail.com; s=20240124; h=from:subject:message-id;
 bh=9M10GOO0wPEhtE1SP1x63n71s2lNJna47O4qmUwYiKQ=;
 b=28t6i9wcH+p48IMmANOO6dGSWTsicxZlvL4RUCZcLWJXBOifTOA6LWtXCBLQgkZP+a/7/X34W
 XnSzAobaK+aCyGv8eYPcN60Dt7lQjhIMOjx10YerZrpSmX75F2ZVURi
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=eVndo3OHViAjwuqHqbJB4ZtzJzzvk/r6fUf84tZ3rw4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_081403_149091_A95298B1 
X-CRM114-Status: UNSURE (   7.64  )
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

Add zve32x since has_vector() checks for vector support by looking for
this extension.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/Kconfig.extensions | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/Kconfig.extensions b/arch/riscv/Kconfig.extensions
index e3ca147765b1..e400fd5574f7 100644
--- a/arch/riscv/Kconfig.extensions
+++ b/arch/riscv/Kconfig.extensions
@@ -347,6 +347,7 @@ config RISCV_ISA_V
 	depends on TOOLCHAIN_HAS_V
 	depends on FPU
 	select DYNAMIC_SIGFRAME
+	select RISCV_ISA_ZVE32X
 	depends on NONPORTABLE || m
 	default m
 	help
@@ -359,6 +360,19 @@ config RISCV_ISA_V
 
 	  If you don't know what to do here, say m.
 
+config RISCV_ISA_ZVE32X
+	tristate "zve32x extension support"
+	depends on NONPORTABLE || m
+	default m
+	help
+	  zve23x is a subset of the vector extension. Can be enabled for minimal vector support.
+
+	  Select "m" for boot-time detection for portability.
+
+	  Select "y" for compile-time detection for optimization. Only available with NONPORTABLE.
+
+	  If you don't know what to do here, say m.
+
 config RISCV_ISA_V_DEFAULT_ENABLE
 	bool "Enable userspace Vector by default"
 	depends on RISCV_ISA_V

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
