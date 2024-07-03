Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA4CC3271E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 05:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuA7uy3m9WYIV9YUvrEzNM4aovJbnnfxWHBw80tjsEQ=; b=Tl07gumgeV1xEM
	RWdAwkqfFEjzLEhSjlA6ikOTuwu1oRnN/CpEneoWwgBFKgCwgR96SooI4HgqHnZCaqxlpN6kRGNcP
	DBpgo14DNgLqxOGD55GcNhvVh7jCtQMvm8mkqLfTU0ST0co22TF0NFeSIxQcTuNY9aMP2YY4kKCW5
	dVE/z1sojPaxl8gbgQtn5Gx84btMZwa/ZNYXr7zsZuY4nv6MWDlPeQnZFAtsc6yRGnaKEl8qcN51H
	yQqqEFh7tzhCATJtaoCGTLABCI5vi8S+UkVqkxwn1ZAEuup85gN6POlqXBN63b0JAJZtVrWcVjVNm
	sxL4UnG4HhWyNGS9HpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszK-000000097cz-3kJE;
	Wed, 03 Jul 2024 05:57:06 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOszH-000000097Zt-0vJR
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 05:57:05 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7066c9741fbso4281421b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jul 2024 22:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719986222; x=1720591022; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=012PkbnjLFpSJ4XrKlhdu5FQgarCbZ5z/RPHdCDxhQ7U4YRYGk0J6UWNU5BuY1wr4P
         oLWiYdL9IYJUIuoIFdozSFbet2vTx4EO+SUqeJFd2k6647eJb+ramL+gGJMnys0tVHad
         5krfa30PtBX7uVJdHXIo4BFwrWzz472gHSZQhv6Doyhzb2bBJk8+vvm33oOTfK239nq5
         Gdzkbf1UcxzwCfUi/7GIqZuFOEcEnkegUQTnw2pvEE4oOQ50YAvkdsHf+lxWrjEq3Edd
         iUKkaQn/pA+slqElHGJvmAbG5gPN0V9C9LqARHkaP8oQfHihoo9YYh1JRtxp3fqZZNBw
         5oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719986222; x=1720591022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g1DxVy9Ij2OMsYu7oTE9l+cI+PV2f969LKgw+PL+a8=;
        b=UT1EfBVzd//aL4MEZk8QMjE16KV0B+6EHiZalePME3BZHaIzETQAEF6yGEgtaY6UoX
         deHdGabRoYPH8pguWwwv03RokryBedRETPmV6G+4i29uZTuOdRJL3nbpdrhKQo9oTO2Q
         0sT89bzH9vAq06I1WUhqw/Q0TbFoR79a2++UIRXkSGceZwZwISij9FQ5HW5zmo1IqcJY
         S7rV/se/i1tCLzLHJuPBKcZSuN6fTlFV+2JaaeoErvXreZiaJ/3EeqomeR5Wo10nlh9L
         1f56pa5ZJKnjGOwDIrHSsOgJBhFVaCz82aGqEAtuT39nIhWWNG7vidb8i8A2M9E0WgEW
         NUVg==
X-Gm-Message-State: AOJu0YzhMOkr3dPSiW/V0BAIzENy+sM2EUIP5UG4J9VCt2WbzsA4IMug
	PbUhtIwxWW/qnPKD/AuzgxDIlzvDJF6f2u5br0KvGHENOgfYwAGAa8+YycfJG8s=
X-Google-Smtp-Source: AGHT+IFz2hW7EMifawOpqM4AiD3kcAclIq6iiztRCK1L3Y4b6IKCzpZ5P6BWyV3Fbxcd9CTq6SCKYA==
X-Received: by 2002:a05:6a00:21ce:b0:706:6af8:e08a with SMTP id d2e1a72fcca58-70aaad2acc7mr15442207b3a.2.1719986222055;
        Tue, 02 Jul 2024 22:57:02 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70804a89fc9sm9514103b3a.212.2024.07.02.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 22:57:01 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 02 Jul 2024 22:56:23 -0700
Subject: [PATCH v4 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240702-xtheadvector-v4-3-2bad6820db11@rivosinc.com>
References: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
In-Reply-To: <20240702-xtheadvector-v4-0-2bad6820db11@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719986213; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=I9BB6+DSsEot7edtm0hreUvYP0RvytEdbSv790C0uE4=;
 b=H8CrljGzUjIOOabCLiAC2ZNGpp0HazfmCxEDWU83VroeOYA6cw7Q1KvMeHXN76EX2cHtVbITP
 JsrlM5MIuFpBDrF5FfDU16a3EB1Ky1H5hrSQoekvqfQ6XWHptRHd8+b
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_225703_321465_E2DFD295 
X-CRM114-Status: UNSURE (   9.38  )
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

The D1/D1s SoCs support xtheadvector so it can be included in the
devicetree. Also include vlenb for the cpu.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..6367112e614a 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			thead,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
