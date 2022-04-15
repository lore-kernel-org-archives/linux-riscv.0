Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6215DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 11:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HcMgzN6Dh7TjMPxCDVuG2uqhF7fsE7QiPt2quJQa29g=; b=mGsYjw3as7Yj5w
	Ykjl0sOxqTzonmaEbbV72bulSQe1X6QBeUuItS0ZBPu5ZvGcC9CpKBwPGI6R9HvVTORQ0vVKz4yRQ
	AP/RVHGL/K2TT3T3uWjhbAu7lvynAHV1S6lSmSThHjFUglwh2FgVeF6q1AFXY7MbxQ5kapJ3cpHfJ
	e6xm/HlfDVAeRBE/A+XYTLLOvPaphtRU2wo3uS7QDngA4RoOV1INpPpcCtAcufc/5DKxoCmP7vq4x
	85lzt0So+hqRq0H/nY5Q36uyR38qvKMYxgEj7mBxjDhjFmY5ps/CW4Gg3RW45CIc560SDkX37JsNf
	l5SRkjPbFZZzhleZXSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfK5j-009p0y-LU; Fri, 15 Apr 2022 11:26:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfK5c-009oxw-Gv
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 11:26:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id k22so10344716wrd.2
 for <linux-riscv@lists.infradead.org>; Fri, 15 Apr 2022 04:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=JEwBbnSv4wy8BjMA4tVtRE4HEbh8Klb/JEyZ0qGQGEM=;
 b=lHNQR8bOCTyJ+udwv0kNNIQuWIfcelZdA7qCYzeh/hfp1PGUUju3szcLwobmWjlG+D
 nd0gbdBgA+U/G9MwTm6EwcybEYhz9O7zcuGb+XquO85Cnt3zAnRGSOozeRkelx+Dl5iy
 Zd1kypx1KsUUlc7kim/LpcGrnp2xsx7hzQBG/i9AToI6iucVECFhibyYCMZ9Hn/abBQs
 RYYcuLDe6al/DRJa9I4lwCgCdG83QErLqu6AJeyceCHJL7SbVd0fLrGL7VmFqALstkvY
 bDZ9UIiWlLF66dUri7slTgwOOZnJ8JSVJWFhPE5BC+kVnEgmI4Xok/PyCKyW1WOL8t+E
 OdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JEwBbnSv4wy8BjMA4tVtRE4HEbh8Klb/JEyZ0qGQGEM=;
 b=Bzf3Gi9oLyIOaqIQBwK/AyugofF8ZJI5Ri8KeML939H1AaafQhPCSUSfp4V27gaae2
 IZWWdmo5Hyj6zrtmexlm+OwXVW3upZL5FLBYSEH3qWsic1j+vDW2v8h/GTecRb4MvfTK
 gUGGMxadRIJppDx4ls5YtnJdnaWisAVJvK5n/z0R6hNARrmrRi/UNQHpDjCJvGuVV3rJ
 g3obgFkPrazJLmPGXQZ48DJpl2J82dmJ6Dsf+WbkvHIdejCMmcWR8QrP1nXRYqfd4zfP
 CXQrtEkiYN49paeFDCiCRhIincQDK2yznEjjl5R68xZ5XL6wLcIpfBF6yCQbueu/RFn1
 j70Q==
X-Gm-Message-State: AOAM532PATBlGkrYqo1ntW8xv+zYUrooGLIyYwClQVLFAIcwKYPMQoFG
 nN9ZVMWSS/CZiP5gD4LZ4wc=
X-Google-Smtp-Source: ABdhPJwXbN5EDaBIeTHDhxBCGKD6+A4UtWqBM0PcYmjyQnQruTkfe96lqckZZFEVlN2ZGc/B8znUZw==
X-Received: by 2002:a5d:47cc:0:b0:204:1c9d:2157 with SMTP id
 o12-20020a5d47cc000000b002041c9d2157mr5084367wrc.294.1650021966801; 
 Fri, 15 Apr 2022 04:26:06 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 bg8-20020a05600c3c8800b0038e4c5967besm5255924wmb.3.2022.04.15.04.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 04:26:06 -0700 (PDT)
Date: Fri, 15 Apr 2022 13:26:04 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
Message-ID: <YllWTN+15CoskNBt@Red>
References: <20220307224620.1933061-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307224620.1933061-1-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_042612_613968_0E5503FB 
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le Mon, Mar 07, 2022 at 11:46:18PM +0100, Heiko Stuebner a =E9crit :
> This series is based on the alternatives changes done in my svpbmt series
> and thus also depends on Atish's isa-extension parsing series.
> =

> It implements using the cache-management instructions from the  Zicbom-
> extension to handle cache flush, etc actions on platforms needing them.
> =

> SoCs using cpu cores from T-Head like the Allwinne D1 implement a
> different set of cache instructions. But while they are different,
> instructions they provide the same functionality, so a variant can
> easly hook into the existing alternatives mechanism on those.
> =

> =


Hello

I am testing https://github.com/smaeul/linux.git branch:origin/riscv/d1-wip=
 which contain this serie.

I am hitting a buffer corruption problem with DMA.
The sun8i-ce crypto driver fail self tests due to "device overran destinati=
on buffer".
In fact the buffer is not overran by device but by dma_map_single() operati=
on.

The following small code show the problem:

dma_addr_t dma;
u8 *buf;
#define BSIZE 2048
#define DMASIZE 16

buf =3D kmalloc(BSIZE, GFP_KERNEL | GFP_DMA);
for (i =3D 0; i < BSIZE; i++)
    buf[i] =3D 0xFE;
print_hex_dump(KERN_INFO, "DMATEST1:", DUMP_PREFIX_NONE, 16, 4, buf, 256, f=
alse);
dma =3D dma_map_single(ce->dev, buf, DMASIZE, DMA_FROM_DEVICE);
dma_unmap_single(ce->dev, dma, DMASIZE, DMA_FROM_DEVICE);
print_hex_dump(KERN_INFO, "DMATEST3:", DUMP_PREFIX_NONE, 16, 4, buf, 256, f=
alse);

Will lead to:
[    2.960040] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    2.965354] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    2.970709] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    2.976069] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    2.981440] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    2.986814] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    2.992188] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    2.997560] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.002934] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.008307] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.013680] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.019054] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.024427] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.029802] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.035175] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.040546] DMATEST1:fefefefe fefefefe fefefefe fefefefe
[    3.401647] DMATEST3:a9c3a9c3 a9c3a9c3 a9c3a9c3 a9c3a9c3
[    3.406982] DMATEST3:a9c3a9c3 a9c3a9c3 a9c3a9c3 a9c3a9c3
[    3.412350] DMATEST3:a9c3a9c3 a9c3a9c3 a9c3a9c3 a9c3a9c3
[    3.417720] DMATEST3:a9c3a9c3 a9c3a9c3 a9c3a9c3 a9c3a9c3
[    3.423094] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.428468] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.433841] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.439213] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.444588] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.449962] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.455334] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.460707] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.466081] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.471454] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.476828] DMATEST3:fefefefe fefefefe fefefefe fefefefe
[    3.482200] DMATEST3:fefefefe fefefefe fefefefe fefefefe

Even with no DMA action, the buffer is corrupted.

Regards

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
