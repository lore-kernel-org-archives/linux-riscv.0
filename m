Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E640D2ECEF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 01:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFCHWRaUVM/4lkpqfX56onbT5o67IZqPkmGpCczX8og=; b=LuCKyth0mWBl1i
	RWXbZgpnn+oJ0n/3vivoi185TI7XSJrvPZSC4h/9MLMVmoVKUCGrGAC61xoyRTGmBp9MzkduUxhfC
	Y4X9oZXNMuFmINyq/v3xe+lQemmHIuOGbXI30DvYF2yCgYxsr9+KOVimgarrNw7xAHhXRb0RYpm9r
	XCGPjs8lmsVrWyBr8YOC7kqcaQ5R85lIRP1K5aNoGlYexjk/6wb2e2W4EMi2VCVg4p4A6Ec4k8QGI
	oRzLWjSH82hmLrkhEjLxNJQcbJVq4ogJ0LHhr7pIfOoeKf5P17dMwanckhN7Byeu6mkqG8MMzHFCf
	7sPrfGRPl2PLn1AI/BYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0gO-000000032vr-2M5v;
	Tue, 20 Jan 2026 01:37:24 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0gK-000000032vD-1JZm
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 01:37:23 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-12336c0a8b6so10342070c88.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 17:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873039; x=1769477839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=LCT+4AL/wwYx7hSkakWOk4mJ2QxMag8HdOI/s05tbLUo28pr/TKDGLdUt2qYgl+khZ
         fikpzR5eI1/Us4gBZyB9Hb/GvM9ikWll4dj8mP79r5R2olWsRK6xv1d4zPLXm9vcN0jw
         S2vcTuUiwdqWgbIBj7yEdtL49F+MbcUnN9OXNkYLIP+/Bg6W7JQBsNUPPVavldJfVivx
         HQVX8IFhN1hcKtWtK93hyC045VX3qqWWML7c3i7VktrikwzMcqa0aOg/WWZBK3Qrf5OH
         wI5sFhsotvyMaC6XldyvH6TyGgP3FoahF5SqxfdiBGAdvYtel8ShtG816rQe05boC8N4
         latA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873039; x=1769477839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2L35WsEaTxvf/DBI91MAjfu5hKJ1Z5i6X+ns/IiMxg=;
        b=BAOrB7wQYHa7z8KHpLHYazg6fLbzowpz9lZ0VBWd0LQb6lQIQNnkNIgD85kRlYiJVl
         RX+oO1aWMqYY0Iyl3yoThfvzQAbZGQvJqgZu1BkmZJ1TT4MH0iLspmie5Bf0smPd+JaT
         h0wyxGAUabH0SzWh8j3q+Stqpluap3wVJ2u3/RRvO4K2KH6vFmpJRdzMpDgeTdTwmQLB
         t11y8UIdeJ40OR4Ku4SAdd0UjyWDf5549E1FNUBhJewP2GwwDJXE/IwpxWF9KdaO2ay+
         IOOPqwaJp0ulZ9rlvoPzkjWjQm3Y+riwEwgnAF4Qw/RJyMbmItyXL2kGlVMysoaF3dPI
         uBYg==
X-Forwarded-Encrypted: i=1; AJvYcCUFsr36DemMJQKJS9EIOEbDBEcBMQEX8nehAhocKaUBXN2mcerwiY1Tbg9PT4jYB7Ss5Ib61tVCkFkXxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/FJ9ClUbogbp5YPQD1DSvf8EuEHmZkdJqD4majOyTGVlSI7UD
	qUc1iWoJx0p6cXvD+zZy6/+CEtUwCigefJNfn3g5mZsip1gFGSL3ytIV
X-Gm-Gg: AY/fxX7kCPc/pGI/0Ipql5H0YSIKOsGlIqeIfe8nx82+V0G6nThftqBPPSK9ySKJwq4
	4HvZbisYOcG2fGxG+OICA8eOz9VLpJ5s+ZSDOIk/NAcrePgsLU4bbTMGEY+CqewLhVwbpX7cg54
	zcxuW4Qk+cXU8lo+hRrD5Q2iXHExQjltAt+QpZ3Zxsiy7yQOByICygWUhrcUDIdaHt6s4MHxZKw
	SHgyQzWm1iO6or/+PGCyaLeEW7f1lMXjOmXmBSroC55G7PlLQGs35j8yC1v2sYWzV3eyqVHMMqK
	7DilIW6tE4ttLdxzqCsgUABQK4msPIRj1PtjmcgBmSO+RVF9GJuE76Fp8uRP6KmsCIVmTh+fCfh
	1kjbD1dxvuLDGtyykFkVsx/NyOthx9k8sGfiDJhEmDc4GaBU6qcVIbMQNhC0aP0NdBesBSoAuqd
	q3jGm4NawPFA==
X-Received: by 2002:a05:7022:e03:b0:119:e569:fb91 with SMTP id a92af1059eb24-1244a6592d5mr11730336c88.0.1768873039305;
        Mon, 19 Jan 2026 17:37:19 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm18690198c88.16.2026.01.19.17.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:37:18 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 1/3] dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
Date: Tue, 20 Jan 2026 09:37:03 +0800
Message-ID: <20260120013706.436742-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120013706.436742-1-inochiama@gmail.com>
References: <20260120013706.436742-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173722_299105_61063D2D 
X-CRM114-Status: UNSURE (   9.03  )
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

The DMA controller on CV1800B needs to use the DMA phandle args
as the channel number instead of hardware handshake number, so
add a new compatible for the DMA controller on CV1800B.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
index a393a33c8908..0b5c8314e25e 100644
--- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - snps,axi-dma-1.01a
       - intel,kmb-axi-dma
+      - sophgo,cv1800b-axi-dma
       - starfive,jh7110-axi-dma
       - starfive,jh8100-axi-dma
 
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
