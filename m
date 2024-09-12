Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FF9EE6450
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 05:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqYR3D0iMPg1AeIIB2RazRTxnBl3TlotXtO3e1p6x5Q=; b=gb1eitp3IGGlcK
	rBG9kET1a1VWdwDMpbQFXrBVW8k1aeffieqVolRjCvupWGt82swilsOLdrl0JbXWHTvhxMd3G1zTA
	wsKa6SxQHOf73jiMSVRkluYeALHSNpBq4KUdR9DJAOACdSMbTL/ibsDGvix8aAak8Cnqoo/sBm3Qt
	+DrjgJeo6GHQUZFQAV9/5/P81jD00vzNFc1uHU/pp3jvO4F+G3FICLz/vO1BnrBIcNHL4GL4OnoLI
	r9ADVrvq39Ydb/MpC5C8HWwi4WZvce13Yj0K4OpCEWx8vuDF0VK9jTv/RTkcIwbRe5lIz67a8QK2f
	rXt2m9e4vQXqujhvW+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soco7-0000000Bw0Q-3VY3;
	Thu, 12 Sep 2024 05:55:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soco4-0000000Bvy8-2Y0j
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 05:55:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2054e22ce3fso6440265ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Sep 2024 22:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120552; x=1726725352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=ea9K/5Z//pGyJ4xveaOaETD1qzcVhvnI7Du1FY+Eso/WZhm2hkFBdOTF75yUCKUsNE
         36818fKgugqLZABbNNRaXmSsaN1uTxSdRXsu3E8p8iJMnu2RZtAt3GguUGTCGIRQfFyg
         EyMHo0ZdZxVKonMP+I8nMWIgSDNHW6IKlsP6grAymTzQ3jcVKtKbo9lkSD98WO6kTuOz
         RnSMc3WAXU3iJfFfelbljQjTmW6uk4MfWfjHjQqjEI47oYe1l1nOage10cVSjE+etKZi
         KRzyDFMgROq2ETyPtXc9Q7gMFo+V1BMS/OJuXlaZUeRpi+0Ko/yMmcpq/mkJH7Wseixv
         TmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120552; x=1726725352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=kSBoXkU9OwlY3leBKL1BRLXN47Z24ujcly+Ako+FMIlgaqZpm7Dq774s2ib3qnwL5W
         Mk3aoQtHE5iwU/aPmgTnHuG3+SZqsPa9pW/OtVAwPGdC/QNNAQGddkeMji+gFXTtPNXz
         Oz93envfBmVpJHoVoXJtvAsn5SxDJCQk2Z9+ck2Oq4t3q1P/4Mo3SKQiNAZ2HR1XCsnG
         pj3U+TUhrMCIZN6HDxaaNr8pVjXIwjJVGI0he/HchvHr6A8otinC9dqM51LI9OwI8hxy
         scztxHCe51EZOfLocipMM4unsDAb7ViRAveP9C8aImVxCOU58LNtKKEGQrLyFvAN4YAT
         JbBw==
X-Gm-Message-State: AOJu0YwxWLDTmrbD95/d4MZDWjSYlRhL6YupEqSsFCEEIk37h9Q+oMXp
	wy2COtnis+4J5rmefXOHBLIm2k2tTlj9Z+FzO3Q712VirvUL/ZoKc/ypP1xjHB4=
X-Google-Smtp-Source: AGHT+IFiwN7AL0oMOImj8Bb6j31gbdzpkXOKklYI/Dyd/oOvuPIOVHkDWeO1Nnywoc6bxuIJ7G506g==
X-Received: by 2002:a17:902:fc4c:b0:207:4c7c:743b with SMTP id d9443c01a7336-2076d90a1aamr22272135ad.0.1726120551451;
        Wed, 11 Sep 2024 22:55:51 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:50 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:11 -0700
Subject: [PATCH v10 03/14] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240911-xtheadvector-v10-3-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpqjdgupZ/AlK1Q7FNw/u1tnC9ORpXqpi78+DtXKPk
 5uMNrJ2lLIwiHEwyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMJG3rAz/VOd8nRK482XkT6UZ
 tYt2FjXdjPqi+VXavm/u3tKdInOD3zMyPI7n++V4VnP92xmlpRHdhfJLrru5Hwm1Pvs24Vmrmdc
 lDgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_225552_684832_E70BA5AB 
X-CRM114-Status: UNSURE (   9.28  )
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
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
