Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC42C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 18:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wJ0TeboinGfAmuuLC/ZCjxmVTz+WMQds39qGK+cNJQI=; b=B6QH9wnWMNtqDG
	2a5UnrGa9bI6+B88u3NplKCK+AWcgN9fZzoOT6FrvukbQ+RQVilcDEgaarVp3cmutterS4jkdi5jL
	xFr116V7U0Vc9Ynx0pdH7P7aY/RU0WlNk+dvp47WurM578eClJhIM5wJM0CLTNR2C4wHBQKz4brw3
	8BD8QXsGPliXDqK9Tv4njmjRc0lHrnmgB01wSUHzc8QdZzb+xpRxrNyhsxVijUXWARKInpvnd4H2y
	CA+UgSH8SSruHuCmMShZSv6eEgf0XT72ZnxFIyzabfPvFmDQ/nENlmY3DuE+zF2doRfPq69DWzjPp
	ajC7NtPo23DznUAX5Mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUp-0000000HWy0-0Bto;
	Fri, 03 May 2024 18:18:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUn-0000000HWwP-0gog
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 18:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=; b=FNDS6QD1fnW7CaWlqe+5RDNnfV
	nX+LIsKEcIwSDHfo7kHh2/ZbWXoYeJQy8KKyfrgqbKQKGvyP+iACUn7kLMF0oW/WHL77cUAXuhHdq
	uRej+lcjhngEFdoAOWBvNBhSnTk1JQV8Qk86BKNsFhRrVQRY9AbPRY+1B2Hw/xCwMVe1k66IVeMk/
	8SZekiulZz3QZfVtOYw5kBntwN7mOsrSidwCGZcHjT7gDHakfmTvzffILZfXOLcfD9g1Z5X9Qsco4
	TwpDEjdD+vyEalZr7XLKm7RQ8fEIfnyICoy6KahUm5quPaoR9dWUO02gy4Ds1BsRYSG2Sc0rtKro9
	SvmspyKQ==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2xUi-00000000dow-2f0u
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 18:18:54 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6f44a2d1e3dso233b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 03 May 2024 11:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714760330; x=1715365130; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=JAJSrEIhkgJ7SLlZeaqteNbphzas25L4owr/nu3i/prYPGivjerDy8Xdr6bWXecibM
         abvJQyNrg0PxFohZW4CfKdAzisj/iCW8M62bfjbIAvf0DetrPpJ1Zwy4Ya0HmA/rTC26
         7EqWvTslmfPBSm2FGtBMckDTV4fQemcN2ISx3BfA4CjiH6H3DoroUGrTf6u4cVH14yhI
         auhgFTCvA1kjEBtEDAt2gmLbt+8GQ4bbXHWVBLkNPoUhnzBc33ymTlpQQEmHHdJ3tiij
         40OqugmUFmNTD8x8Gu67nIPrQQqGAGLLNC9wDaZnK3EvBBHfUwQQS0/rjced9VT0JZ+O
         6fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760330; x=1715365130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xb9tww82u8GPwb/D9ZGp2c9YRfA1MZ53TtnEydxWwQE=;
        b=Wr3zOWNSCWJQbzNzLbHYxbS+bct5AhDbbRClnsW0ClHuDg1iEYG0EN3XKytFBtFi9n
         GgKoz7pWp8Q2KZLze/Kif4CVN25itwMPqTSocrniJPevCJLvduUhe0H4kg7KpMwh74T7
         3Vkhw4d8CkJoKA6EDMCKClhju1nmYDe5itL0uu61fFrXD4Q6uxpp6hEmojrHxVcQyVY+
         OryxfMsIdbPwAWmGSrkbZqdc2PchQFvbuxXB90FT1IJFPdGPZbOKGLzcb9DKEC4BuM6z
         G4NzhmDEYSBXdTW+y/37XJGJEUGUScaQpJcH2tOSn6zaW8KZcD42MlwPzRWNBM5t3h/S
         iWJA==
X-Gm-Message-State: AOJu0YzgW2Z2kIio6BYFoMyzFTbfwOXGMLSP+MvVH17ZVE2EsPeyRppH
	OL2PlOe/89cCkIYmAATFjfLL1CXZP+aHQckcvPf4CYo2kKAhJtjRIR8k7U3MmhM=
X-Google-Smtp-Source: AGHT+IFy7bjwb5Tc2k3ELswk0ckQlxflBBtAMpFeTTm74dAZvij2X2R0LCw+XDzJCWrMJUDPuSACWA==
X-Received: by 2002:a05:6a20:f393:b0:1a7:4b40:96db with SMTP id qr19-20020a056a20f39300b001a74b4096dbmr3340804pzb.10.1714760330034;
        Fri, 03 May 2024 11:18:50 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id fu6-20020a056a00610600b006f3f5d3595fsm3355421pfb.80.2024.05.03.11.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:18:49 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 03 May 2024 11:18:19 -0700
Subject: [PATCH v6 04/17] riscv: dts: allwinner: Add xtheadvector to the
 D1/D1s devicetree
MIME-Version: 1.0
Message-Id: <20240503-dev-charlie-support_thead_vector_6_9-v6-4-cb7624e65d82@rivosinc.com>
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714760318; l=904;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=eg5f+2eUdPorsjTg1AXnvbZp1Gz8QKwXU/sn4bArQ/o=;
 b=6g1xI1qEsC25DUPbbFpRsxXutxb45Sm732q6PItZvN9xNDcps0BAvC/bY1rPUIPcJI36yR/lz
 CNxoaMn0OIdCbC6bJdMpDz6ehBx1GiDP/MZbJJlSKdQjCj7lyJtPXxb
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_191852_754737_1994437A 
X-CRM114-Status: UNSURE (   9.31  )
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
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 64c3c2e6cbe0..50c9f4ec8a7f 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -27,7 +27,8 @@ cpu0: cpu@0 {
 			riscv,isa = "rv64imafdc";
 			riscv,isa-base = "rv64i";
 			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
+					       "zifencei", "zihpm", "xtheadvector";
+			riscv,vlenb = <128>;
 			#cooling-cells = <2>;
 
 			cpu0_intc: interrupt-controller {

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
