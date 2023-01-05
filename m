Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1EEC54EBD
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDapBxZUFxKuiYH2seaQvFTXjKCr26EPtXF++U7cZyo=; b=UCDj6zwOpkFP/G
	jqn/PcADr2aVu0K1UuCYd+8+SO3f4k28/OQBzxTwVr/r3S4BTuWGuZMobns3R2Y4pbMilN/HIJGo9
	sojyj7+VsY7ZK7P1OrR8krmHc9JM6lgDtI9BsWaGr5WR6GAEPNBi0UMx3pREAmHH7/XS/dbXA3oFa
	1khT6jqGaJsKB96p+c36Zg307G128Ws5EVZOgtpxpfMzskja8hM6YYPqJRBH3h73Gc7cUwDGWd96y
	/F0gZ1QP7gCEiqeKF1s/ju4CNBKoB2pnaDm8SaiI/w+3MJ4Nw7vLEacHgSaK4V8G5pRhcRTGKJPSJ
	HXku7VlckarPgv443f+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXQ3-00EtV7-49; Thu, 05 Jan 2023 21:04:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUmK-00DRsn-TY; Thu, 05 Jan 2023 18:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pyOyM/HgwJlEQ/SHr0fVdceVxYFOEYTbqWcahqqz92M=; b=f8lc7Ac2yDWU3fNVEWcwBYumif
	NJR2Dg0AqU9x9gNAEg6zFalcusJqFnljzKYNqpav3tU+RRfnHFFaMpNmsoRNTsRB1DyvwO+XUbc33
	nqHeAVRpAhaSSH4FUNLviOg8luWxua07JJn8pReOnuiXDWtRUxTRwUDrR19Njg5kNScgNaMd+fv+o
	6MlU51Z3sstuJjgM0c5Swpc5xkYEenwDWqmczRCP8LQpUxHnPxEE2x8aDIuV+h1TFhfhlwGPl2g4E
	UxDW3wEqRioCSb/VnOVJs2beSpQnAcWxc6riCUD6kuFs/jwpezLHLhsrBnjnW0l1zCDeNw6oeZMI1
	xlDay5mg==;
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDSy3-001TnI-2S;
	Thu, 05 Jan 2023 16:19:49 +0000
Received: by mail-ej1-x62d.google.com with SMTP id jo4so91231880ejb.7;
        Thu, 05 Jan 2023 08:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyOyM/HgwJlEQ/SHr0fVdceVxYFOEYTbqWcahqqz92M=;
        b=VQVKe2hUanS6/QijnRF6HkC0a+ngye5JsJDB/WLc6I2avTZBU/dgJ5Pc5p7zQ0uyrc
         OmZMAIjPj70zYo6IwuWUb/JWAoZlOU8h02pIXCHOZZBGDaKzHb7KNiEFpkc8Cjf3ac8R
         pUEzIrtIGUtKDiteNml8SNjgIG8qT/HsK93oEGjafTcBOgrUQV+mre7/c/iModBDsEi9
         JGN6DdTrLG/BBdLt5V+rDhcjmT11A+FmdL8zpW/uPWMw1b348xCf8RXsylclOt+uAY3f
         uZHddDuwE+5a4EY3pqNXIjraf3/MtJ3O/Vb93N0sZHlGPPnHHrrET35p3PAKNJYaT0jW
         L+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyOyM/HgwJlEQ/SHr0fVdceVxYFOEYTbqWcahqqz92M=;
        b=vqCxkINfxEXLI2YhqplOa0Xj4wM4aKKyFCPbQ5liTwzdvVDAMpZyG18SBDI17lJQCD
         v0FaAU1t9xD329htyqiHJVDHmoQ6gz1KUhzB5TybQL2hONCOiZOkmTBFPv1ArGKx9A70
         PmXZs/AJNnA2mNpPzwjgavBcBP89BIcNdrLK973wa2US4hwo+6TfDarqLV5QzohjA+Ot
         8DwmxBlXAdgUllYt45RyTTiuzcUNd4HHeY9KXMhgXsROUM8lTNBJj6xkz9ALRP8mfehZ
         0wASNlVxcd/Sl6NTZp2iaXIH7xkqqSBhrPnL3BL6IYeSHbcjFkCzGcunL2e3lb0sOjZo
         S/pw==
X-Gm-Message-State: AFqh2kqEeuyZ+6KyLdM8TKkEyXVBuudyUqZH1nwTV1ivkdKMCsXDFqhm
	76fXGWOwCNS/Xv0ujY168Kg=
X-Google-Smtp-Source: AMrXdXsQwQkFr98YlIHQBlZLZhzkiyI1XZKspKsDyskIeLIk0vVJSB5Ia1sEEmCFUSd/R/u3G5WP/w==
X-Received: by 2002:a17:906:f854:b0:849:7688:3e3e with SMTP id ks20-20020a170906f85400b0084976883e3emr35059487ejb.44.1672935592250;
        Thu, 05 Jan 2023 08:19:52 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id z4-20020a17090655c400b0083ffb81f01esm16797532ejp.136.2023.01.05.08.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:19:51 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] media: cedrus: Make SRAM section claiming optional
Date: Thu, 05 Jan 2023 17:19:49 +0100
Message-ID: <4450464.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20221231164628.19688-4-samuel@sholland.org>
References:  <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-4-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_161947_963233_FDB6F175 
X-CRM114-Status: GOOD (  15.21  )
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

Dne sobota, 31. december 2022 ob 17:46:26 CET je Samuel Holland napisal(a):
> The video engine in the D1 family of SoCs does not have a switchable
> SRAM section. Allow the driver to probe even when the SRAM section
> reference is missing.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  drivers/staging/media/sunxi/cedrus/cedrus_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c index
> fa86a658fdc6..11e859617932 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -257,7 +257,7 @@ int cedrus_hw_probe(struct cedrus_dev *dev)
>  	}
> 
>  	ret = sunxi_sram_claim(dev->dev);
> -	if (ret) {
> +	if (ret && ret != -ENOENT) {

What about more strict check based on quirks flag?

Best regards,
Jernej

>  		dev_err(dev->dev, "Failed to claim SRAM\n");
> 
>  		goto err_mem;





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
