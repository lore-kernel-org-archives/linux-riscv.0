Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7C5C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a1tlev2jIw+pHe3wULwwRS/8khmzhKF55/NAxsswAo=; b=XGgoo5P7OtJXid
	D25LTM/i4WFfoF/tQb5D1peD9oF4WGnj296nM6v4paQw1FHe0MV54U+M0NNKphZQOfZA/FCDp02ds
	gjW5akXkzgGLnrhXaxb9x3RFVdc/Xx3Ow0331MqTUwklJUZ4cF/rLdjPQOpWC8QRxR/KCdi52QSw4
	Qwl6NSkSK/QXayXuuySqq3W2N/evsCfoc+GBpr0SXha+/ybVoUl6HqUDlyop2fjmcyrHwjes0Dq1K
	oonQxwmiuEt2pGbZiNQrQMX1MwQg+G+nae5eSdn2vakfIxgrbtZqdv+FBJS2AG5CDEByceQgULqVB
	26FEQSDZGsY5R41HB9kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhw6-006Y5g-9K; Fri, 06 Jan 2023 08:18:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhvv-006Xxj-0X; Fri, 06 Jan 2023 08:18:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so3508631wml.0;
        Fri, 06 Jan 2023 00:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtUcosCaiFsfOQ0fA0ahQY5pppeLiBLD4KCC5VXYb5U=;
        b=icRvW+Tr534VNRNBW5UTaAWPROkQHPaEQX/kRQllBk4WaLtMTbOvvt2+5GkqGvKwjk
         HMWXJQY72dSisDrmj5+XPNK4An0gYEbTyo1Izuw28K9NsQ1ZzJiOBh/qYCMC82mT2dSa
         XxZJloj1ZfhjaHunElL4zXEeJoKkxP22C9aR3f0QPYlooVtja02LbDwx367DjGDivev0
         N4OX1MHSB/+cUvxZOURfVofVvz6++3NbyK3W9oy7XmrqvQRpAdiOBp7pTKW+XHTtBPOf
         DULzmHwJkBrQkDOXKCCF4w4d0EJsgRIubwO9B4upphDSzYAyl7RBPrAww4OFbHh37aJR
         lIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtUcosCaiFsfOQ0fA0ahQY5pppeLiBLD4KCC5VXYb5U=;
        b=D6tPlk8Mdu4RlbDxsXz/dw9qT6vR3HjH0O/JZ/yvHXs5HrXkUOA7bHPEL2cp3KYPCF
         qupr1zJP5lie3ghENM7FlayQzXX5JrOydZk0j1rfagQNmUaIEW20TVN9NMXlcMIMzn5k
         t8ADx+IuxuejxWiI+lkTCoT7/T0t/bdFqusUgF3LhROMkYh3DwcCQgvqrd1YnikrrBh4
         hb+6TgJ6haZ7cUj+SzAVtzks0T/n7WgdjElTZ4umqhYAfgNIp3M+ARv6ZqIWPoGqDPMW
         uCfaCkgHhZdDgB5UsSueeNit3zo6S12CtwF9O00/8iJNgrGZjlFxEPsWXU/jFp1dumE6
         ah5Q==
X-Gm-Message-State: AFqh2koosrvaJYFsK9I9akX5m3U9MM2/JqXUDrICTYw2HbVLMj5LQzlW
	elpVSSNcHfUknssBuYW1twY=
X-Google-Smtp-Source: AMrXdXvsRPiGLVmsJAtakcDFnG5+z9snPhbHZVsbxbv8NbhCBxCcgQosTNbJtylk0gcVpgxRnvAITg==
X-Received: by 2002:a05:600c:a51:b0:3d3:513c:240b with SMTP id c17-20020a05600c0a5100b003d3513c240bmr38839263wmq.7.1672993109084;
        Fri, 06 Jan 2023 00:18:29 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id o21-20020a1c7515000000b003d995a704fdsm797856wmc.33.2023.01.06.00.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:18:28 -0800 (PST)
Date: Fri, 6 Jan 2023 09:18:24 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] crypto: sun8i-ce - Add TRNG clock to the D1
 variant
Message-ID: <Y7fZUDSWaZhpL0hc@Red>
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231220146.646-3-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_001835_092577_0237D877 
X-CRM114-Status: GOOD (  11.36  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le Sat, Dec 31, 2022 at 04:01:44PM -0600, Samuel Holland a =E9crit :
> At least the D1 variant requires a separate clock for the TRNG.
> Without this clock enabled, reading from /dev/hwrng reports:
> =

>    sun8i-ce 3040000.crypto: DMA timeout for TRNG (tm=3D96) on flow 3
> =

> Experimentation shows that the necessary clock is the SoC's internal
> RC oscillator. This makes sense, as noise from the oscillator can be
> used as a source of entropy.
> =

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> =


Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
