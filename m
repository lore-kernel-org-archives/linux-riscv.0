Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A40FAC001DE
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 19:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UD3d7EtnEPkbfrUKfXGdxlRNbJZ+vhW6mOV4xWVYuek=; b=q0l8TGDx3KHpeI
	E2Aji9axcuMTo14ZLfxY6xrdn3KmeJmpwg3x1GaL+WeuCi4nocztQRDUI/1mzsjGTPW8pLZZ4M3s/
	2K1wnuaZcJaQR3KoWoaaQoDJJgfa5GRI9BgRKb3Vmio+ofJOv8PRZ6ervpYZrhJjzmL9Q5Vz7BkjJ
	D1iUWVwaMWJeLnkJ2TCcMKSRzqqmnLEiPVl1YwmyIiyI+8SBoqQVs9dyqoIFqGFi2waetSMIkKnf5
	btued2GBKQfq/LGKucGszCC08a9Ww+SnlzzKGrpM8jaXjUA4Ph6zQ8CkddUhVmobHkMygBGVTvcO2
	Smqve2gUtJmEVddm73BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwU-008h7a-1q;
	Wed, 19 Jul 2023 19:34:34 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCwQ-008h4U-02
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 19:34:31 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3466725f0beso548745ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 12:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689795268; x=1690400068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsGoT51dWJmzQKPxb3tGZnxKgH62aNnVUMM3GK3B70I=;
        b=25R+yCvMKbfvQR87JPugzrtI45C63mU3sviX8G0Vy3Wvo5ueLJ6LoiuXaMFt1wKE/9
         J2h7M7wC9mw8pp112AUlWRQnBXuQYeNqWCUrHT4s/bSKKKVibQt5pMn4JpFlbK212NTU
         Sh9aDJz8I0G32u8J5s8SbpYs7u5AYuv0KdPzsQzp4A4tsU6FfR5KRmDtU19hydphE8fS
         Dvwd2miaFaVXcHQq7Pao/6dE0JkI4ofWpL3JzgHPGwqTAgtKWllYKsvDJSJBHZ4k4ptP
         KcOM7qqQwWLW6QhyEFO3/HD64siCzcAvSJ8/yq3MiSdTk8+aGW6aGukJ4KThrK/kYnKa
         PovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689795268; x=1690400068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BsGoT51dWJmzQKPxb3tGZnxKgH62aNnVUMM3GK3B70I=;
        b=N9KVQ+TirieHWBSHQaJGM2wwcXO/v+IOb0fh517Fwy9B9AlvyYIVc5xGikm1Jj3dRU
         vC2nymg04+nekEag8SvARy8aN12b9VQr5bJ6N7mupAZV3GpNFmmILJFXdm2UrL7F6D+p
         weYqXZO4bbWMBOx60BsNzXzI+3lZsRTYtuNKvrxo9CCAQYeTrJuIOTYS8FOafgNKbLad
         44VBURNJcgC7Er3CUTh+ECzGEC/P6OEtbxM4lnyJCyXqfypy7uzSiJe04RylEN7YoZSe
         hjonCXsjrTNxcxNIyPQV32uzM9vC1+SsICcBaFOOm7L+5IYiZnQHE9rlyrJT3Ea8SqYv
         iPdQ==
X-Gm-Message-State: ABy/qLZomngTdfTMM2FGOlQ491DS4PnBlmsJRhAviFjAeiTFrJUZ4UYw
	KOdaONSE2vI0k6BjFOQ8X1Cgqg==
X-Google-Smtp-Source: APBJJlG+MFbJEKkJ1B9LQsQ5MgT1jSSRYuMm6X1iFGTwoFDCvk/QYGkIlda8SXG94SgiZ9wVyGnQjg==
X-Received: by 2002:a05:6e02:1c49:b0:346:e850:6cc8 with SMTP id d9-20020a056e021c4900b00346e8506cc8mr3677361ilg.9.1689795268696;
        Wed, 19 Jul 2023 12:34:28 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b00264040322desm1591053pje.40.2023.07.19.12.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 12:34:28 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 04/11] MAINTAINERS: Add myself for RISC-V IOMMU driver
Date: Wed, 19 Jul 2023 12:33:48 -0700
Message-Id: <e1578b96b9c75433d8c49b6a173ff47a64675c2b.1689792825.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689792825.git.tjeznach@rivosinc.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_123430_057117_0C594C13 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index aee340630eca..d28b1b99f4c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18270,6 +18270,13 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V IOMMU
+M:	Tomasz Jeznach <tjeznach@rivosinc.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
+F:	drivers/iommu/riscv/
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
