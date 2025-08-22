Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD90CA0FEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8MAPjVH2wk1Gf/z4ucDv79C71C5Tsayj1bnXVGGLKs=; b=k9WeFs2SN02Uej
	oVeOXCZjGO0w3Ts8nQtFxUwG4IsipzjGbjTc3JcRDJtrdgwS+BfDjy7cL7RSN1GeFanhI2HikUiOB
	jIM/o21vfnwOEwhjrf7IOEG8WDuIhMNpNmobBQ5TtZ8FHnbI3gCBOdHI0rIt7awHLQdtGxurRAjTd
	TM3sh9PBwNP+/7raELwMpQhzQt1jBXDFpMfPHudnCM2JiGt0eenxFCVTDpf97KScvu0J51Q5NoL3E
	kVjC/Qqw4bF4wV2uJTSe9dDHWajU2kmUjl0lYuTYDyoZiLFAAh3FK2mP/bvP67o4A0LO8J+b99jW0
	SuUm1meDkYbaWC+leHMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqw-00000002IF6-0keU;
	Fri, 22 Aug 2025 11:22:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI7M-00000001LLG-1VKR
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 03:07:05 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-76e93370ab8so1772494b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 20:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755832023; x=1756436823; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZudeS21S7Z9HKYl2WwDLHxu+6vkPHg6qhFAwHt0tdNs=;
        b=y5Ih6qb/gdl5GG2Mcw2ttg3vtT1Ui27VhNdA06ARH80cfVGiaUYEd12rQ0N8eb3WA3
         fx4r+JgTDGCMGU6+X8LFiSsXFthjNbRaLArBctj0v2zMbfHCsRyZBophVXYdBSaAN2N6
         cAmjILovrFs055a8S/0dSq5prH264VGfzgkK1lnWIt4WqB8zqg8qRLbvXX4Eysoi+JA8
         YcEHnCZDiD24tYxkvuEfPlFgdTU6T1Ir+3z9g9KIAd7zMGwcfUwem5b0wvUGtFGcq7DR
         lAujcg8LmNSYt4C5Gfpw6RRdcqauIjT8iam6MNDZpiHSh2AY0A1EP6qZXbtoSwiPKc8u
         xm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755832023; x=1756436823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZudeS21S7Z9HKYl2WwDLHxu+6vkPHg6qhFAwHt0tdNs=;
        b=NdD2doVXDLKunO/vkSBvds+im0+9MKhxCkT5+ZVr2jOagt3v17jUMbggyZ7yFyMGKk
         Qr0Cr34dz0CvX7EmCWiMomtx0mC/txR6mL2hjLaadQ3j5B6Vby+CySp/X1GuU6tqtp+X
         lr9XeJnq0TIGXAGQe0Hpu0Pf9U5g2/xR/7IUVSB7pN9WVQJbJO3729XmmjRuoQeKoFuw
         ryw0FRzvvUisy/2j60far6UYzKWs444DO2iLkNWWkatYjP5ZsljPi1wZAvy0aDEW+m6f
         mm4cZ3Y5I8Kqb2CZORDsqyvmhXZLCGDRotU+H3on5jixQmr/BTLVmYKnTjtismRadcwa
         ZVCg==
X-Forwarded-Encrypted: i=1; AJvYcCW571X94jvKEe4sywmqg+RtnOdimkpUDjEygfiYHwvMP4L83ZszrA/aaWz+aqgpsbIkzb5bifxpyKmLKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxS+0HBJJEoTHKYAnTB9HMEDhi9xNrejbBTzWaSXoEu8mB8v2ve
	GmUU6Xf7ANhuHiMnn1fiuE4IC3kMa8yYqxJLHgymCZkaQ5yxVBfEinLAR4wCQkY1kd4=
X-Gm-Gg: ASbGncu+cJuw9GY7k8zPueOb9mwUUtVJjL6l0v7OcLe2N0c+TGfO2aj1PXr+868cF7d
	t7XC2ES8l8aW8ZemZ4Vx6/a3TWFzMGG/JAE8UiUcQa2VsJd3WceKcMOZUEjxLW8f6ByH82mdM1+
	y+ehR01q0qYlcypSxP3k1FNA8lpUGbwYxQZzLhRHDslw1ZShUVFEGTUusoox1qX126YJKIbbq5R
	ogRTOoxZ/V0xedDzLDMJqWS6mTRK38XQ/cnhSB5OJXvTONhQJr02fRCT8eH/6Dn64cgQ7IlHLNk
	mu4SDDMZ40VmeGXj5XGvr3oTSc7/pe46oscnsLrzzrki/XrFPYSLEnLN//nslJqWt50l+UsXEN/
	fej4l5Q7U6BbAja7ACZHy4aC5kQ3l8qQINn/l7h4sOxkG
X-Google-Smtp-Source: AGHT+IGm4j2NRRY1FzjfoUSGytYiPyWd0cIxjX3x+KRIkqu4iEC4XXZhVq4VrVHDhxiZRilFQYwnKA==
X-Received: by 2002:a05:6a20:6a0b:b0:240:489:be9c with SMTP id adf61e73a8af0-24340cd3104mr2211058637.39.1755832023564;
        Thu, 21 Aug 2025 20:07:03 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:07:03 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Fri, 22 Aug 2025 11:06:32 +0800
Subject: [PATCH v5 6/8] riscv: dts: spacemit: Add PDMA node for K1 SoC
MIME-Version: 1.0
Message-Id: <20250822-working_dma_0701_v2-v5-6-f5c0eda734cc@riscstar.com>
References: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
In-Reply-To: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_200704_405602_4CF5D276 
X-CRM114-Status: GOOD (  11.67  )
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

Add PDMA dma-controller node under dma_bus for SpacemiT K1 SoC.

The PDMA node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
v5:
- Add reviewed-by from Troy.
v4:
- Rename the node from pdma0 to pdma
- For consistnecy, put the "interrupts" after "clocks" and "resets"
v3:
- Adjust pdma0 position, ordering by device address
- Update properties according to the newly created schema binding
v2:
- Updated the compatible string.
- Rebased. Part of the changes in v1 is now in this patchset:
   - "riscv: dts: spacemit: Add DMA translation buses for K1"
   - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..861f0fe18083fa158da51bd3be2808609f6233f4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -660,6 +660,17 @@ dma-bus {
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
 
+			pdma: dma-controller@d4000000 {
+				compatible = "spacemit,k1-pdma";
+				reg = <0x0 0xd4000000 0x0 0x4000>;
+				clocks = <&syscon_apmu CLK_DMA>;
+				resets = <&syscon_apmu RESET_DMA>;
+				interrupts = <72>;
+				dma-channels = <16>;
+				#dma-cells= <1>;
+				status = "disabled";
+			};
+
 			uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
