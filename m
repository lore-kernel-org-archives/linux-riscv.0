Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AF3C3DA4B
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 06:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRfBXR/uvQ9ppuE6GNmcPtoTTzop/NOFbxTgzcz8tM0=; b=x6M5Xeo2j5O5aO
	JPQb2x3QJfWNmRBGWSVQjFhaR3mI7K49msgs2MU0yu0d0BbzcVuFFRZltr+OyoDU7W5XFfqAUgGwy
	rlcYmeQmEslUgD1jEvEhtHYpb6cts8yCtZndjJLw23dkefPDvWPBBye9vMI+i5u7cMqEJtYlxSPyw
	ZFQ6DaL8xZUmILkfIsgRvC14DYAa/SeprMx/DdnWTTjxK9aiPUMH5QVDWWfIrWKIiB+ogwL6pf5Yu
	xGxMytmt545OKb2pU9GL9gNqvzZQaZ/2k6wjCbhJ/HQ3vhOxdIIDK0+V3uTeM8ZP3almMBh7V9Bc1
	kAkAh4qMGIc+yozV9l9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTyA8-0000000CqK1-24FM;
	Wed, 17 Jul 2024 06:29:16 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTyA5-0000000CqJ4-0umX
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 06:29:14 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4279ca8af51so40471905e9.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197751; x=1721802551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV10XIriQxrkSLT6hfJ9bzuJQGW5jGWUcHq8Bf3DvNw=;
        b=p/b34UEpTOWRz5pn4FRSOTyHWtU66U4EBdrM0VOYszGTrFgAVT2CeR0eK8NhG22A1u
         BFzfh6oEqrAC7VQY+zpX4sQFQJR2FQ9hM2WaYsKJJ9elxe7DtGvII6NdOqoY6CgjaJSH
         eSb7Kxje0qI9u1iNzwRbCveJxqpRq/vtLQx7k3V1SIxYKEaDzru1IAO7C+Wxe/W2taAZ
         TmhtykQ20D1na8+pAyNpaCaXUg6tPAf/hDMdGI16hthDktnzJDgt5mtJOQI0GYsEXUnf
         21YwGGxNYU+Fg4cue4jC5bUIPgsLKx2zJsdzort6ThTADeUIIC2bev4wdW6J7l0A9tAt
         oVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197751; x=1721802551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV10XIriQxrkSLT6hfJ9bzuJQGW5jGWUcHq8Bf3DvNw=;
        b=S4RZf/hiHA24MjfYDyplX9BL38JOoKApxcBZBrp2Aq/VQrvfvakTwgD9r5X1grOmnm
         rQZvSJ4nobPnzb6/y3ZacLft41P+g6vTc9Tr+8m5iMU7eflOrB0/xLHRiWeKldQN19I4
         dNWdIzJ7hgM/Eqni2VvLqemxKsz8owAFbjpA1dw0gdOYhL/9TmgCeU1MFGlpeZSHGLyp
         SkrK/pPJskRwa3yCvPFJlK1im4iU+mQzP/otZk7vvVonItIxk8lHV5aMmNyMDGOMT58R
         QiIaGWNXv7vcnOZE2qIO62C03t4jmLEEik6Shi0XC1zocWBN25ONqF/KeSzntP4CfKh2
         4wPw==
X-Forwarded-Encrypted: i=1; AJvYcCW+KruYWI5aFY8i2MogXMAIjxyB0ihIrD/wx73GkpT39BLB2PiPiLIM1Ii5RWr5mMDW7bgwsP6Z3Owsri9QoTYr+1Yp4uLOf/rhs/6RoB+R
X-Gm-Message-State: AOJu0YxT/XKLdssEyFqJ1S8T5tNFPP2U7waXQ2lXgDpb+TjLVbEIARoX
	D5Py0UBftrYrgmOFy9lQ2PA2HQoPgCU9U5AWHrQsjCHRtg8ysjuAaJSn7ClHxL4=
X-Google-Smtp-Source: AGHT+IGP/cuCt+F0ta7uxUlFKhwXsnKpljMYZclyaPYQLOpIG5TT5vjECTCQ1Rcr5BTRTziHhuytmQ==
X-Received: by 2002:adf:fa03:0:b0:368:303b:8fe7 with SMTP id ffacd0b85a97d-36831600243mr520432f8f.7.1721197751437;
        Tue, 16 Jul 2024 23:29:11 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccad8sm10840137f8f.60.2024.07.16.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:29:11 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 09/11] riscv: Add ISA extension parsing for Ziccrse
Date: Wed, 17 Jul 2024 08:19:55 +0200
Message-Id: <20240717061957.140712-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_232913_266946_869FA688 
X-CRM114-Status: GOOD (  10.20  )
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

Add support to parse the Ziccrse string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f71ddd2ca163..863b9b7d4a4f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -82,6 +82,7 @@
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
 #define RISCV_ISA_EXT_ZABHA		75
+#define RISCV_ISA_EXT_ZICCRSE		76
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c125d82c894b..93d8cc7e232c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -306,6 +306,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
+	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
