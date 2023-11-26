Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E1C3C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ykiQ6FIK7EK/WTOospAjqHwE2aUjF7+XFKXb6pshfk=; b=tOFWqguLtWxu1b
	ogF6FiREvzruoXjjXq+RORJmE53LJskW+CaLedDKfy4HIbZo8bG926cZpJoXXMSB/FJDXHrd5Rzma
	2FDL8YxMp3qCWlqlJX/e6skZCFbph1lvlsxm+gxs5Hdso3tv/XqUEndEp/bZxhHFtidh89B6N0z8n
	GwKqKEwGqby7gKKGTMUjCQxw1kLXzRKhmJr90XqYmF6jsz5P/VTqx9ZlIybof5df5vC4uA1npqc6a
	gzrr2aUfWj+xkD+pywf7qwdh3VJKjWHZnrIsIJpcgw0zcQKEk7CsxpF+504/Y3Wm6LKQUEe6XncU7
	VXYtP1pcUv6NZphAg56w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYQ-00GhVt-0G;
	Sun, 26 Nov 2023 23:28:46 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OYI-00GhOA-26
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:40 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 8FE4E40C56
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041315;
	bh=x/4VKc6j7ZPLGeNJb06p6pcCmpUDLk01xwbpFjzzvZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=ClmvEj+gF6cckt1LODqNmB+rVSIAjZNK4ziEueKlLPDT+lUyVv1phFAaeWtznxqle
	 tIxw5XYFyytoulkae/QNMX4QrLZ7op26xqfVSpnoriswlKeszfBZhoUW+BIgjmHlwk
	 bdQnzDx39PQl9mqr+VBiA2/Jciy0fx1VLDHK79z0A9lpnk+HoCMwBqp+14UWi7iVPr
	 il0Al4fUOWrNVmIbb0ia0QT/nm0QDe1m7pe/KG8Bevl4WbPi8mkth4whcSZvYYG6va
	 W15Cw8rnQLVUh2mj+/YOvB46tW6tKCqiQQ7Zq7QvedZpwpz5KUKz5fiOTaZM6573/F
	 AZlY15q1Fnd1Q==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cfd4aea4dbso1316705ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:28:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041312; x=1701646112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/4VKc6j7ZPLGeNJb06p6pcCmpUDLk01xwbpFjzzvZw=;
        b=mvzNfdi21YdgUpgmb3Zkkj+aCvuvE05BvhHckltj1kb24SBIvXi3BxB53fL0ff0kre
         437j+VF7L5PHA5CA9hZgzuO2QXzHZ8YSKnTENFTm3IqGo8PZDw2d+ZrwuAtAPvkdaUC9
         JohxEG+baCscVhYEQqyO/EAISXKF2mIqdEmS51vcrdAAdCIIKwfC1GCZ/oaVj+fg4Xgk
         1aQeycAgdtXEUHFY0ufTUjRNz8YgpHA1PD/BZ/LGbkYjHOFZAQqWaCY34dcwm6M4OkS0
         Y7usrGBy3fuWK1x+z+Bi5bLlETNSXf2qrhbv8rSUhywDFuzchLL1bv3iKyNXcGiazuPf
         fEQw==
X-Gm-Message-State: AOJu0YxThBhYeb9scRfSU1uXWUR3D6q6w2osJLhiZQmVbKD7iTazwtXO
	w0kAiPg3tq14PHXcxrSBoAggfvt6efQQhLi1YohkMwA4LztBw1gt9MCI9s5upYUhYyMFNexNjz9
	NnI2Cy75KuZeTzoZIFDr4GvTBTf40zpllWPUp3OXmV5QEXZz9sT96dQ==
X-Received: by 2002:a17:902:ab94:b0:1cf:b6a7:67a3 with SMTP id f20-20020a170902ab9400b001cfb6a767a3mr5596107plr.56.1701041312181;
        Sun, 26 Nov 2023 15:28:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGn7gI9RzWm5JEwz0gkJGEdgyWBwAAAeo20KFp29UD271sxXxpOWLxGNhlLdPN5ZwfEX2jcYQ==
X-Received: by 2002:a17:902:ab94:b0:1cf:b6a7:67a3 with SMTP id f20-20020a170902ab9400b001cfb6a767a3mr5596096plr.56.1701041311896;
        Sun, 26 Nov 2023 15:28:31 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:28:30 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/8] riscv: dts: starfive: Add pool for coherent DMA memory on JH7100 boards
Date: Mon, 27 Nov 2023 00:27:43 +0100
Message-Id: <20231126232746.264302-6-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
References: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152838_840087_E987467C 
X-CRM114-Status: GOOD (  13.18  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
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
