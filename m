Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DEA4C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Apr 2022 07:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RzVYWBFPTd3icMze7s8L763MvGf0PXn/foBn2s0cOYY=; b=KkIBRjjs/A6jx/
	P7qdVnFtQoaibLlLOreYGSF/cfzGhCIP43oeDvjvqWahVoSLngHAgMufFQ8ZVPXIyt8he1DS3ePCf
	V86vgKeDiv21VLv+nrSqbryISoHvVZuYZiYPpsnZt8XaGlaEyvI+oKEWuv5Iuskb9p0sdah9re4Pr
	qs3wNr4QSutO4pVKMNaDv5WZRxTIZsIPTp37a6OaIP5EKd8GzxNLb0y6rmi9C8c6ONU67yM9mMQ91
	gEyTjneQXH2IiDEkXE5UIzXGaPA+4d8SaBwh5wgMeFtuMgBUCN/5ZaOHRgw+hcOYA8KmdLKeYlw0k
	UdY1T2yQG/t3f4B6xXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfcxm-00CQg9-EU; Sat, 16 Apr 2022 07:35:22 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfcxj-00CQfo-3s
 for linux-riscv@lists.infradead.org; Sat, 16 Apr 2022 07:35:20 +0000
Received: by mail-wr1-x436.google.com with SMTP id i20so12863093wrb.13
 for <linux-riscv@lists.infradead.org>; Sat, 16 Apr 2022 00:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=n3udlrmFRG5gOrbFNhXLisVJVRQDIPelDEgRxtU6UwA=;
 b=RA8I9Cdr3AKi1lYngqd/bphEz2n7JJWcnyCNtKEpfArKxgIc+8PRyHMpMh12dE6t0M
 gAj8j4is59ks+20l8jN9jnFhNbu+cOQ9K1LQsotipfxEi4MxvsuogVF6t4A++4mbdo1a
 RQ2p7Wc0mJukYm6jyRIeCxwmbxtSFNGzzwodbssHLJ2/SRd8g3kOha92ZvTBNr03epFF
 Qbfjtx0gDPcCVCDZ9lJ2gqmbh8yBgR78MUt3j7Nz1mfExrbexbiez8a/SznHxtY6kmp9
 PqJzgpGoaYE3XplfaqGiKk3B6NY0+V4vbftGba4vBGvIetTv8opxaYRGtUMGgROF/fkc
 y7WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n3udlrmFRG5gOrbFNhXLisVJVRQDIPelDEgRxtU6UwA=;
 b=xLkZ+7kCNjWw+sXr7p062cXadDPyjw8twzmDBuobo1E5mJ+YUeONJAJp3z2Q5NaTT0
 F1+x7CmOTqx5CQhrBuRjmvaMQZk/5XjjamnjQIZJ+SE3OQH5IXfmD4yGMWZhDtg9SYKT
 H4732jTTXhd6l2SsPxpfjipwSK59EMomj1Sqip5Vc2S+3sBlTlXqARvAQpodiJgB5Gur
 YSlI7dXz54PeDsvkoepoSGjoMS0s9xwgUsSoI5W/P+yuF7yptQg2GLBg7iTdq1iYscOC
 lrZ74fKG6iHlyZUZrG7ygHi8cYltTjqWsZ/cQUImDIb2v67NecYffKHzLS74/4+WRaUC
 lmug==
X-Gm-Message-State: AOAM531+U82x8j8lNp2XRy8XGL2DTQY0wmlxeGp8TrkXbkNfWYIc5bfB
 SfWGnt9AZtsgLOBIdfeVvE0=
X-Google-Smtp-Source: ABdhPJyv8ehPti8tRf6o2sqU7F//aIHeAkOa/ls1y1ClnrI6aBDeG2kUvsM6Mic5Yq4tWHGMGdgKWA==
X-Received: by 2002:adf:ed43:0:b0:207:ac79:84ee with SMTP id
 u3-20020adfed43000000b00207ac7984eemr1733242wro.321.1650094516563; 
 Sat, 16 Apr 2022 00:35:16 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 205-20020a1c02d6000000b003928c42d02asm800268wmc.23.2022.04.16.00.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Apr 2022 00:35:16 -0700 (PDT)
Date: Sat, 16 Apr 2022 09:35:13 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Heiko Stuebner <heiko@sntech.de>, palmer@dabbelt.com,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
 cmuellner@linux.com, philipp.tomsich@vrull.eu
Subject: Re: [PATCH 0/2] riscv: implement Zicbom-based CMO instructions + the
 t-head variant
Message-ID: <YlpxsYREWv/LQ+HY@Red>
References: <20220307224620.1933061-1-heiko@sntech.de> <YllWTN+15CoskNBt@Red>
 <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70da24dd-2d03-fc49-151d-daabb315a5f6@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220416_003519_199884_2742E605 
X-CRM114-Status: GOOD (  19.38  )
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

Le Fri, Apr 15, 2022 at 09:19:23PM -0500, Samuel Holland a =E9crit :
> On 4/15/22 6:26 AM, Corentin Labbe wrote:
> > Le Mon, Mar 07, 2022 at 11:46:18PM +0100, Heiko Stuebner a =E9crit :
> >> This series is based on the alternatives changes done in my svpbmt ser=
ies
> >> and thus also depends on Atish's isa-extension parsing series.
> >>
> >> It implements using the cache-management instructions from the  Zicbom-
> >> extension to handle cache flush, etc actions on platforms needing them.
> >>
> >> SoCs using cpu cores from T-Head like the Allwinne D1 implement a
> >> different set of cache instructions. But while they are different,
> >> instructions they provide the same functionality, so a variant can
> >> easly hook into the existing alternatives mechanism on those.
> >>
> >>
> > =

> > Hello
> > =

> > I am testing https://github.com/smaeul/linux.git branch:origin/riscv/d1=
-wip which contain this serie.
> > =

> > I am hitting a buffer corruption problem with DMA.
> > The sun8i-ce crypto driver fail self tests due to "device overran desti=
nation buffer".
> > In fact the buffer is not overran by device but by dma_map_single() ope=
ration.
> > =

> > The following small code show the problem:
> > =

> > dma_addr_t dma;
> > u8 *buf;
> > #define BSIZE 2048
> > #define DMASIZE 16
> > =

> > buf =3D kmalloc(BSIZE, GFP_KERNEL | GFP_DMA);
> > for (i =3D 0; i < BSIZE; i++)
> >     buf[i] =3D 0xFE;
> > print_hex_dump(KERN_INFO, "DMATEST1:", DUMP_PREFIX_NONE, 16, 4, buf, 25=
6, false);
> > dma =3D dma_map_single(ce->dev, buf, DMASIZE, DMA_FROM_DEVICE);
> =

> This function (through dma_direct_map_page()) ends up calling
> arch_sync_dma_for_device(..., ..., DMA_FROM_DEVICE), which invalidates th=
e CPU's
> cache. This is the same thing other architectures do (at least arm, arm64,
> openrisc, and powerpc). So this appears to be working as intended.
> =

> Regards,
> Samuel
> =


This behavour is not present at least on ARM and ARM64.
The sample code I provided does not corrupt the buffer on them.

Regards

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
