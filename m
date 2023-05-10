Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD66C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 20:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muHW2jhpiQwcwJ2T7nl6XZ0k2ZMr3kY3LXKTZNg+Rrs=; b=2I+6JUXapcqVGh
	ZjKjb8/kwqeDHUYvDujJl0APWat+u1JBLEbRqtgi997/weA1NzfNei084lmm5JmITL8/xzJPIrrI0
	zd+m49Gvj7LxIxhkBsPYVOVk+S1/CAGL11UBiNBugKbjkq+XdqDVNt/2pAXFRBFkHO4liCDACHcZZ
	t39NuYk+dIMCQSnfYZwezGeKUi37RGYnpO/upjhAglEnlNkwy6n/RsYgBnMM0cvTfSFJeeD4NNTtb
	/EjK/A0w5FXNcJVAK3yGPKmX3xX8+WVryx2L6SiluOpQcPoaMzFK1HGp/jJ2yoCTAVdh1wyiEixqG
	eiyopVt73Q9Snzusr+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwque-0070kk-04;
	Wed, 10 May 2023 20:59:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwqua-0070k2-2z;
	Wed, 10 May 2023 20:59:50 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-965f7bdab6bso1236346166b.3;
        Wed, 10 May 2023 13:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683752385; x=1686344385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7iiVpNS2TbezgmpT9ZKv1CtTBR6JW8urFYOpMbLQIE=;
        b=Ve84bY8EFJx6v5kYiXJIW4l38TbjweukQ9WPJ6EbKvaOLLh081oFWKHsluTDupOCmg
         EgQ2VgSu1zl+F5zx/otyUBmafq657FY6qzHR/gAXtygP1fxPk7pW/RnQSI5wFSPnZFww
         6RmKXFADFOlhsqW9PTuM++FK0p9pu7tusMpanqQTRHMNjv+Dy1GL9aZud/QcI+dsFCnQ
         vQCa0EYiDIPqjztsz31dqgLbRnBBGZwwXX/NitSrvpYh3Q6U75nBzB9X6SqeNPZUp5Gv
         bZbHAXNCNx3VUDFbS4roIkGZCwnZGai/7bkWX2JlW+XPd9KR3JjArqQIkml0W+1MR9Vj
         WvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683752385; x=1686344385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7iiVpNS2TbezgmpT9ZKv1CtTBR6JW8urFYOpMbLQIE=;
        b=Xkywr5fDep9+0m4+kZXjmE31n7byhXSYJYbCtce4epk9tWQReVuVNCocXmcHJiavF1
         BT1BHv3z9ylRWqlSsHuatCqlKGrZ+qaiLcusF3UdICP6JpCKAfxD1D+RHoNsy3TVsXJC
         fNR0MHvrzWSq0eyDiTl9KPtnTpdYHnSGLVhdFVFf/D73s8Vff+GZxpsZDnuLwpauNbCQ
         mfz6W5oMH4XD3oXlfQNS2Z90NQd5k44qvdaetwpFp5qL84Ep9UJAqJKIYpP0sFEq5At2
         Wg8gggPZCDVnLpQ6A22TQ18fFOkBlN9dfvBqDgQrSNiGeXyZyz3CYzUxk7MdHllwqWxd
         gNXw==
X-Gm-Message-State: AC+VfDy2AceNWdvBa/i39umtgp/hBrJ+FsXia3Mta/e2jHx769JKHzSI
	napfNTF/aQUhW1RaFnaMvU0=
X-Google-Smtp-Source: ACHHUZ6672faX07heGWs3B0PV7ZJkqYGuQNoX8YzdTu1PeXrQ3hCuaiW5DPyaliV7S7XcyE3AyDzgA==
X-Received: by 2002:a17:907:94d3:b0:96a:58a:6cd8 with SMTP id dn19-20020a17090794d300b0096a058a6cd8mr6734541ejc.9.1683752384784;
        Wed, 10 May 2023 13:59:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id p15-20020a17090653cf00b0094ebc041e20sm3072028ejo.46.2023.05.10.13.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 13:59:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:  Re: [PATCH v5 5/5] riscv: dts: allwinner: d1: Add SPI controllers node
Date: Wed, 10 May 2023 22:59:42 +0200
Message-ID: <1932306.PYKUYFuaPT@jernej-laptop>
In-Reply-To: <20230510081121.3463710-6-bigunclemax@gmail.com>
References:  <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-6-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_135949_020903_E0FD8845 
X-CRM114-Status: GOOD (  10.24  )
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

Dne sreda, 10. maj 2023 ob 10:11:12 CEST je Maksim Kiselev napisal(a):
> Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
> an optional SPI flash that connects to the SPI0 controller.
> 
> This controller is the same for R329/D1/R528/T113s SoCs and
> should be supported by the sun50i-r329-spi driver.
> 
> So let's add its DT nodes.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
