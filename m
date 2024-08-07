Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABE3C49EA1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2024 00:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqYR3D0iMPg1AeIIB2RazRTxnBl3TlotXtO3e1p6x5Q=; b=r+sszswLJo4iT+
	E86i58mxd5h0JVPPFE/S0U0Vdo1ErmwXMWU4vgwaVAuv7fIxHVr7hm+r8VIuoal9xUN7BE3J1ksTl
	nLyebcB7ZvayOkhm7m7PjabSuFMN7rQvniu2/tBRSLGbqBb2fSTCXGyI84tzLbX0rfntUtOZeOH04
	V+cYP2hpKDg53h+kJaSnSzp/h7DddLtfqGqUR3QGRoyk01WUWIWyVwXA//j0rj+i8z5HCYiyAtpGg
	bICGEffiYa3avPZpIOD4vfd0LzQDV4Uza9bnWsqtK/sqiMZ8tw5bjNgGQUSOYpCEcXEu3Qbr6AnDY
	qCfoa4hXOHl6uFvGshtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUao-00000003QoQ-3xTM;
	Wed, 07 Aug 2024 00:31:54 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbUam-00000003QmB-00ni
	for linux-riscv@lists.infradead.org;
	Wed, 07 Aug 2024 00:31:53 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-267b7ef154aso764419fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 17:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722990711; x=1723595511; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=qQZRckJHQ3SWJ55IQkztQG5UpYRzl4SpgtRqpR86X7yEDfGU2fyuzTNOMS3os9Stfk
         lKJJoIX/qn931wIA4wsJZ7YiDFU+/X1mZmaV67O+Pi3FXYJre5hMfuPJKS08KfMLvOPS
         cIgAHzmcn66P9nxHOrtMM4TSdVAyQSotVlys0izH1hOTWmLWD1W6SA7Hsg/hUK9f1UTw
         Ya2cR19m3AgmbbOw4BfemzHe1SJ9DX5Dg1vqoeZ8G7DiqsVZTOFvJRcM9LRPtIwitmnD
         IyMmMp2XyHnubjHeOMWtYLwzrBmmIIlMSUXocP4KKaiRAfcgfX3hlTuEXk/Tkl/oWbb+
         fhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722990711; x=1723595511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34tWDw4L8SN+akOs9Do5H0mwwhItc2hNKASWAYLthDo=;
        b=VgKiWdmcwfOZ/4rIV7qoxu+j8ZCo39mAk9gh0W8k1lweSVXG8SCcVeOCW9cWQXF/Bu
         dCFOfCkByj0IRkH8wC3JwQETpMcZtZwFwojOCNwDBbI2e1Fl3UaTkrQ9Q/kmfj8gNRbb
         GxhHUN/Dl6JNaooRKAngdVKNrKRudEfIPwkfCr2Wm0HirV6aG2MWugbTAIjXk0DRYuBD
         VRb9Rq7EbfOrKROMxfOpX190ZMj3ZRsNYwWIYtrjNWKuYqFaoT+vjA0+o1eeOUOPNLeC
         3EEjZb9AJDF7uM3AiyxTstl9c14K4VCRmTvpzefnvUr1SOlklZDeX3HZiA11P2ZhygNX
         tZfA==
X-Gm-Message-State: AOJu0Yzj/2iXy0W1cqYvP6zT2yU5icbCS/9NCgb6trB8FJFRCb5Jf7s5
	OsjhllyF8n6t8evn3w937YJDJpNUCcjfjCof3fieEGtFRN2RuOdx9nwB5lckYu4=
X-Google-Smtp-Source: AGHT+IHwYGXcB8IEkAHupmpVK0nhVZhhoMXREywsV/hko3tnE1IuMh1Xx52utwzABh32nak18wgz7Q==
X-Received: by 2002:a05:6870:639f:b0:25e:129c:2223 with SMTP id 586e51a60fabf-26891b1d159mr21444778fac.19.1722990709937;
        Tue, 06 Aug 2024 17:31:49 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7b762e9f5aasm7476174a12.6.2024.08.06.17.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 17:31:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 06 Aug 2024 17:31:39 -0700
Subject: [PATCH v9 03/13] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240806-xtheadvector-v9-3-62a56d2da5d0@rivosinc.com>
References: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
In-Reply-To: <20240806-xtheadvector-v9-0-62a56d2da5d0@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722990701; l=960;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=twijwVNwXlRnqiWorC6lSyhzIHtshmEdOl4sTIAcK5Q=;
 b=8DznulBYmzcnRUsTl4PU1Nfrq9DX3CsK4UyIPn+bOSuqD+WxzqyupxoffPAdmO9Cn/UjtYnuL
 m95rcERBaneBI+ZYTnjfNE+sqBlPjvW4j5RZ2+DHqV9e0OsJAzGlQtx
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_173152_080686_091ADA26 
X-CRM114-Status: UNSURE (   9.09  )
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
