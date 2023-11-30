Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD4C10DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ykiQ6FIK7EK/WTOospAjqHwE2aUjF7+XFKXb6pshfk=; b=4UWydUj3IUpMBu
	PNO671cybhC1PhuI1G6PRPRK2XJATTmcgRfRUg1iEwQshL7DSTJ7IqR3xmV3tA+7LqXAE4Uf4uRnW
	9/Wb5VGqsqIW8ymYpZV6lwHwbySUO+bUBaBDPDs7+WVsyWH4SAaRCZq9alMPa9NDPT4Qt2g0pZhGX
	qK7+o5tCJyL78jRccV5DDhin0efqGY5/hKiMFtthPg3yInV9b2LZ5M7r03nCqy8y3EePzbET8I/3k
	2FL2hFETXQBgtcH49QeSeXepBEFDlq4gLW5cJ0j7F/qTQfAXI1FL1c12yWOSgJmmRoVpnxi4YIpx5
	I35QfkBP5DwIN7rg3cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iq4-00BBlI-0Z;
	Thu, 30 Nov 2023 15:20:28 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8iq0-00BBi4-30
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:20:26 +0000
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 98E0C42240
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357623;
	bh=x/4VKc6j7ZPLGeNJb06p6pcCmpUDLk01xwbpFjzzvZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ap1qRYRraseSqCpDR3saeu4bryWspvFmdIcGYnSSvvvjGtKSq8qLb7Yx1hJElwaEm
	 Ziv+Nu8IeQ7xU5D70a0ov8QnfUOpcv2v1nRQj5vgAPG20/YRH88VP1DlI9Iax0ziOP
	 BAADJ5xYfxCJ+Gt90xD2K9hOc7e84I9oJDjqN8jv3rY5gKuSq6eCSucqzp+g9DBjqG
	 cAvoLgMF1XWXSRk+PDFqHpS0Uo/YbuToTIbLkFW/0luT6TF3bG9/tE73aHXL0JD6Ad
	 5lGeXOBROj0XKGYfeG77c8ltJ3ZSyK9FPkGHVAoJTIHxGNfBD1zn+UHfBkptVh+thS
	 zpujZSjzjVMGA==
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6cd8b5b2d04so1314075b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357622; x=1701962422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/4VKc6j7ZPLGeNJb06p6pcCmpUDLk01xwbpFjzzvZw=;
        b=Jc4J1q4FLGqSUomEWD6MId1hWVV5fEudZGXx/jR4CcVlCSnS4PDVRc/nV2qbQZNP8j
         FHlM0mlPbdf2XVTgY/zXc7DQG9LknZxxUQDE/OL0jAFIJx9C0nTh+8P620OS7taNWtJ4
         Z53djAbf+wMrDD6MG1aH18R6UD8KZjAGls3oMSX6VRH/rX58pged/IrIyVBCUjvzvt77
         jt+NFzIqtu1F/QnNgXWZXmUA7dGZRSyjLl2MljctMaE1+8dDbgSZdjmZbMHJymDF6dsF
         Ij7S81Ovru6xw4XOykowJJfn7ot8utdmbTDI5WirEPA+Gl+FdFmHTYSfcgYSv46UaWL7
         PaDg==
X-Gm-Message-State: AOJu0YzBsKrGIZ04afsJZcGAWOHgyO84q2+NIEc5kY7/R3+4BCAXGfzf
	8LcSVi8T6VT3ZwdMZU+I2Zal0m7/4fo0Vf2WTFVDa73St3hzjFBqQ4XXMNwZnEKksJkScNKgdo2
	/7fHay95IVZwoEMEGmNxzQTI65JRMIqQxhsl8B1oR0+wv0mD5sjpCOA==
X-Received: by 2002:a05:6a20:144b:b0:18c:548d:3d0f with SMTP id a11-20020a056a20144b00b0018c548d3d0fmr23512356pzi.5.1701357622021;
        Thu, 30 Nov 2023 07:20:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJual8Lkb2g8N/YiH3FRK7taRMkY4AzxQVOPrkbyzCXqvXjTjv3kTIlyWPfwhdcnKtKcS4lA==
X-Received: by 2002:a05:6a20:144b:b0:18c:548d:3d0f with SMTP id a11-20020a056a20144b00b0018c548d3d0fmr23512330pzi.5.1701357621745;
        Thu, 30 Nov 2023 07:20:21 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:20:21 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/8] riscv: dts: starfive: Add pool for coherent DMA memory on JH7100 boards
Date: Thu, 30 Nov 2023 16:19:29 +0100
Message-Id: <20231130151932.729708-6-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_072025_103466_9F26A2FC 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The StarFive JH7100 SoC has non-coherent device DMAs, but most drivers
expect to be able to allocate coherent memory for DMA descriptors and
such. However on the JH7100 DDR memory appears twice in the physical
memory map, once cached and once uncached:

  0x00_8000_0000 - 0x08_7fff_ffff : Off chip DDR memory, cached
  0x10_0000_0000 - 0x17_ffff_ffff : Off chip DDR memory, uncached

To use this uncached region we create a global DMA memory pool there and
reserve the corresponding area in the cached region.

However the uncached region is fully above the 32bit address limit, so add
a dma-ranges map so the DMA address used for peripherals is still in the
regular cached region below the limit.

Link: https://github.com/starfive-tech/JH7100_Docs/blob/main/JH7100%20Data%20Sheet%20V01.01.04-EN%20(4-21-2021).pdf
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/starfive/jh7100-common.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
index b93ce351a90f..3af88e6970a3 100644
--- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
@@ -39,6 +39,30 @@ led-ack {
 			label = "ack";
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		dma-reserved@fa000000 {
+			reg = <0x0 0xfa000000 0x0 0x1000000>;
+			no-map;
+		};
+
+		linux,dma@107a000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x10 0x7a000000 0x0 0x1000000>;
+			no-map;
+			linux,dma-default;
+		};
+	};
+
+	soc {
+		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
+			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
+			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
+	};
 };
 
 &gpio {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
