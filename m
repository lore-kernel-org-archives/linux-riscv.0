Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F82C52D7C
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Aug 2024 06:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pdpi0iF+85MUbNtYw/j4psbCATe1VeHpcQu2RpdIiu0=; b=A8ph7owhwzX2ft
	SP+6AqnCtaqReBn6X4ICr7a4SwOrLYvvJnpsQr6yhdNr1XK/ktfUdXgy/vX2Vg9mJ2uAGZafyGzI2
	9nDrl7vAmWg81+5K5zEu7f+uLlH34Cu4oXWolF0jdau43EZGeskWsOsWQS0+sCv74e3F0KQyxkiSe
	mGKGq98RaZGLRKbsWa/eWOb5X6AR7EZRlpnUft5Vh4PkMc3ym9BBGRPzXn0Mlz4+DZp+pR0+rLY/R
	fzVFqY/mu3QslBHUNjeVRFYWfg7C3HDTZHgjB2vEobPnKX5qGyiO/MPBNuISY5/ymP2NIGf+kIlMX
	+7uH3HGwUON9Mo3hsuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZgu-0000000GEoc-0Qrg;
	Sun, 18 Aug 2024 06:47:04 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfZgq-0000000GEnq-3OoJ
	for linux-riscv@lists.infradead.org;
	Sun, 18 Aug 2024 06:47:02 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-428243f928fso34977405e9.0
        for <linux-riscv@lists.infradead.org>; Sat, 17 Aug 2024 23:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1723963619; x=1724568419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlqxfa1Dgyr/RCZKCOdmB4jO+WlSQVOulpijR1tIjck=;
        b=tp8m7w4CE8yXrxcSM9imCLoH+sVDA9gm7PewEFS+ykEt+AxmY15+DWCL9v7hZE7G7Q
         4YOjmMWp0S3r3srg+RxU0Pw2GOslRT16HLzGZC3T17Vg6f4QrK2TGyyWc27LRrNvGwUI
         WcPc94SRDZ86Q4/MPxkZoBH56HOE+bt6f6pZUVHMEggaBSAzQjSmGusqKANvpD5+jYP9
         n6z41jleGXCX8MIU/mzaD7yhPDBw8YjvHkp0VGrw8vh2m5OujB7X1GWXWh4d2Qc6z59D
         tYP05jFO6uuE/VDVXSRKltgY7dZ54ZCtvRoycWJVuos3/hAcrtf+Ar04xoHi5pI16mnW
         2+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723963619; x=1724568419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlqxfa1Dgyr/RCZKCOdmB4jO+WlSQVOulpijR1tIjck=;
        b=qr4IETB5c5wtMuCXG2gpF/ayuYekTg39PfSQJVrRZiwudRSjSMcC3whBmEtcpxKl5D
         ZjXoMg7nKehFOmG1CraMwAh3E7EoEDcSbots2cFRp3mQ6z3ZCWobg7XgjK6yI9PXoFMH
         gPTQu8JWADoG0JnJovawQ3InB+SLL3k3Km5RMHDm13PmaOKnBlNAMG+/BzOmOmXbgRrI
         GlDGwwBDbNBJZdos8ZrCw8BFBrrHYjdHd6D1FK25a2SQq/J67c0C8jwcFKiMbi7Iurn/
         hUQTF2EIODoAjOHrLZZttktfGsFm/+gQZ8tK6ai/H/nkPtv4eO5I9uUNYUP7mknWDs7b
         gRtA==
X-Forwarded-Encrypted: i=1; AJvYcCUymY419WoFiHV2CaGWgYvdRfbIxYa3tM+zJN0hHBruvUKjB8VF/d6EJtos4VeZXU+6GV9stUadKEL7kdXN/jo08sBNvMrfXV1I4HtDt+gD
X-Gm-Message-State: AOJu0YzhVQePD2eDOXovb31k8WT1nOLFDauucoOdU8wNJsYSMR4Ox5XS
	9ZElxfkjXcu3+VqYONophjXEClVAvkm/o27QFWbRqUNiYwdEzK/Phz6P85VGXWk=
X-Google-Smtp-Source: AGHT+IFwS3MzzU8TURVJ4Ap0a8/3o7r3oh1yyMOzNik5dKrEar+UZ6Tut2SPaHafSLHiL9m2WkM9gg==
X-Received: by 2002:a5d:694a:0:b0:367:dc45:55ab with SMTP id ffacd0b85a97d-371944561f9mr6249467f8f.25.1723963618917;
        Sat, 17 Aug 2024 23:46:58 -0700 (PDT)
Received: from alex-rivos.guest.squarehotel.net ([130.93.157.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898b89bdsm7269358f8f.112.2024.08.17.23.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 23:46:58 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 11/13] riscv: Add ISA extension parsing for Ziccrse
Date: Sun, 18 Aug 2024 08:35:36 +0200
Message-Id: <20240818063538.6651-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240818063538.6651-1-alexghiti@rivosinc.com>
References: <20240818063538.6651-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_234700_870391_B59542AB 
X-CRM114-Status: UNSURE (   9.97  )
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

Add support to parse the Ziccrse string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f5d53251c947..9e228b079a6d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,7 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_ZABHA		86
+#define RISCV_ISA_EXT_ZICCRSE		87
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67ebcc4c9424..ea9c255bbe3d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 					  riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
 					  riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
