Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E74B6C7619A
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Apr 2023 12:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AHI1XxaFXEwNK/oCZv0a71OOfi1yZJBPBdYuxL8pt9A=; b=GyqBexeyh8AL7p
	aSKJ9R7D4O/WwIsYkXSAOIgMPwdcBpLcyz88cqU0NcSanrJTRfPvBNjEcOSJDslu9QhgglrytzncU
	eU3fhFFZzCpbf1rhdWZ5sNmwjqtEJ5TED0HISfmtjtJ6arjQ9+j0gp9OlYuWLT7jFgeR8PlNJffGh
	pMQVABNYx4VrjXiiMn7XjOQj9+d55tXYtoHzwsuyLI8NANmTU1fJkF/Tw6gHkB/T6hYu6OSG7Q4uF
	XgFVV45IGIuYRn1z/jmzLUa5gDUcq5toc3fomxF+7gLsrbe9c5EXHqqeFA8WbvI/fEaQFi5n3w8q9
	e9OveBWHINOY6BCqvtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7nh-00CIpA-30;
	Sat, 08 Apr 2023 12:36:13 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl7nc-00CIoP-2q;
	Sat, 08 Apr 2023 12:36:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94a34a14a54so27951966b.1;
        Sat, 08 Apr 2023 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680957363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOWahdTnRG3Wj8yi+V6U+R9QIgRUu+TUuu4yKrmq1Po=;
        b=HZ6hA51qYqRkCOfrq5rl07wWJs6ZXodOnniOCbtg/CbbYj7+Cvt0H/2M7mWU6STdP6
         YOCr/NpmbIHfxI8gLFijenNJ04LxQ730dvOfjolF7mWWPKQXUTIfOcMcQ8Djt9ZaNlCK
         3q7IN9EcIndh/yIHLuDs4+yc5QTbEwwipGOCD/1O49JHGcjZDx1hiRG8lyW61fC0imq9
         HAfOFK9k3mx2rVUGqodOLjVeclsDfg2D7xqcLRNbvJDv3humib9EhZuqgkVPXTnqKT9H
         2thBmOmXK9xUVo2lVb+zmIWvxFP45GPo5CTKAeIY7J7yaNWWC7foDjqVPTsmipJ+Pn+s
         jrWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680957363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOWahdTnRG3Wj8yi+V6U+R9QIgRUu+TUuu4yKrmq1Po=;
        b=zZSBAbPyAHvEof7WvQNW90xXo0KCakM6RG7WA86Z8yXRhOdLh2KLNJYXMwVydkdoKP
         8c32Pz5xEEKRXjj8bDFz1zUjWqNzzDEyE5mwODXBPF1/7PfTPSOdbV1km4Uy3e/c2WcM
         bKjOaaWZ1EYk2mqDiVuUwFoZsMX4kIKCJIO0P1k1x/pHntLoiJcKpWySOnTW+xpeeQ5w
         utU6kDRhAH/+kVRd/e7roA7zFrIOrku/a34xEBmBsPlXG7YHJJpQ8zsAjMizo1RvF03p
         D9MGBpW+u637x6bwtDkFx7tiQIPyQlYXh9i1K2fwjIXGH6M/WJTE2o6+gb6SZ0oXUoks
         3QkQ==
X-Gm-Message-State: AAQBX9cl8sKyAGT9s56lMN45OpKAbN0i279+y1q/EFB+h6n4jebPaOxD
	H8A1iov3QJW87JaiJp5B57k=
X-Google-Smtp-Source: AKy350Y1drrvxW3UM2vKy8JNJ5ywWt6Gxl4RwyNbLie7SrkT0Gou8ZfxNt9jwSJcq2xa5fyzHkUS/g==
X-Received: by 2002:a50:ee06:0:b0:502:2a76:5781 with SMTP id g6-20020a50ee06000000b005022a765781mr4928298eds.5.1680957362692;
        Sat, 08 Apr 2023 05:36:02 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id h2-20020a50c382000000b004ad601533a3sm2898806edf.55.2023.04.08.05.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 05:36:02 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, kernel@collabora.com
Subject:  Re: [PATCH v2 06/10] riscv: dts: allwinner: d1: Switch dma-names order for
 snps,dw-apb-uart nodes
Date: Sat, 08 Apr 2023 14:36:00 +0200
Message-ID: <1945003.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20230321215624.78383-7-cristian.ciocaltea@collabora.com>
References:  <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
 <20230321215624.78383-7-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_053608_979655_20413DEA 
X-CRM114-Status: GOOD (  12.40  )
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

Dne torek, 21. marec 2023 ob 22:56:20 CEST je Cristian Ciocaltea napisal(a):
> Commit 370f696e4474 ("dt-bindings: serial: snps-dw-apb-uart: add dma &
> dma-names properties") documented dma-names property to handle Allwinner
> D1 dtbs_check warnings, but relies on the rx->tx ordering, which is the
> reverse of what a bunch of different boards expect.
> 
> The initial proposed solution was to allow a flexible dma-names order in
> the binding, due to potential ABI breakage concerns after fixing the DTS
> files. But luckily the Allwinner boards are not affected, since they are
> using a shared DMA channel for rx and tx.
> 
> Hence, the first step in fixing the inconsistency was to change
> dma-names order in the binding to tx->rx.
> 
> Do the same for the snps,dw-apb-uart nodes in the DTS file.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Applied patches 2-6, thanks!

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
