Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC13C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Jul 2022 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L9JVvRhhI5/rirahwje3t/9cIXkEMZtJMpVV0cqTrvA=; b=IWco2K4yXz+6li
	gdiRq6TipL5kOwXh+1pUPEZ5zkXClNh86dBoxrOtLdryXVtYyCCpda78RT9YVgwGJNn0yx/s/9+/v
	4xqaDTMJeqrKTYNPmQxAPnm18dJc/kgNSFxjcD9JHU0WhdvUqyvfoOboL9ze8AdSCafWrVvNsbOTL
	9K7ncgUa7NSf0jAw9eEq5udW1rm9Hg0vhXvJIQe1BbuH2T28qdzKFWg3A9edpdPobIWVrWh89CkWx
	GGFNB1DrHb7Tg1nq6ZpYtKR5JqqK9DuPJ6gjnCArV3qTNxCa00HOtIi8Eyi2NXT+uPyA9mQI6cSbG
	+BoCUgaskbAgcAuraFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7I3V-005Tup-VZ; Fri, 01 Jul 2022 14:55:38 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7I3R-005TqK-Tn
	for linux-riscv@lists.infradead.org; Fri, 01 Jul 2022 14:55:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id cl1so3600337wrb.4
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aKmhqWsvz2VXt/NxPWZTmSfapGdUQJOe7XuueEGMywA=;
        b=q7+4mVv9tGFQDYiHUjyiZhWOet/va8+qMXYFOdyNBU6x5hh0p/oE2lRkR7wEInuyyX
         njarglTDvX8/WBvF5xCWpQ90YXMrij4tXs99p5lLzfEk9B0iGhvJTTw4yI3drnDlt5XS
         lnhx8sGxE1b2ouu4aIo5+HzV3huTYEkpTvVHhvuQmuhVkNEpAzAcejTB4oO/QQk4g4jq
         HpC+BRflTl7YknywuQmrycZRm2eJWEo9XUorIGW1B4vcty520Jc+Q5lYvsGqO1yNfwTW
         wqjRhywZOUy3R7HsxEMdDhEUQ8P/9dODWLeKaRFkb6QmBmBMjm3h90Qp4PEUyVHi3YCs
         ruRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aKmhqWsvz2VXt/NxPWZTmSfapGdUQJOe7XuueEGMywA=;
        b=Xga8AS7XUghRHhAyCSImp6FSgBOilv5vgHp/aJTJ8Bo0JjvTgh0uLGXC+Ys2BrC0ta
         F0bATH/HVVO5MicSIgEvcTB3VQxHvs9rgc0QUU4MXGDOxy6Tyc5kIjpFI6O9L219p2VF
         dTXFi8l6A59H3HXC4V54hOfi3MPNiBM8tUhAEUNfHNmh9IG9ZlyXvRqhP+wt1X5SMp+c
         UBptk0/pZLBk03Mh2gtcp1IFXJCe8K7M4eXfrVfdK0C2blPtxp1Epmn2GSuLIOkzcCD5
         x0sZttes1p1xZS0CbNipVwzWYRdv5ON5GWlIiQ1aJzWadBYs1UWOLTBsEWKRkDx2/MAb
         I7Ag==
X-Gm-Message-State: AJIora91ChQIxzjGa6iEq5hZAvrxe3f1+m0FvsW8m8AjNZeKbrZUrZV1
	4HmpZStOQDqS2jewhhwyQL7bqg==
X-Google-Smtp-Source: AGRyM1tCIA07jyVpPAgoHKY5VvDK82sz/FIuyrKzmAOblKWvPhdFd7fSDEiruHGXEYgIAT5QawR1jA==
X-Received: by 2002:a5d:4b08:0:b0:21d:2ea6:2fe0 with SMTP id v8-20020a5d4b08000000b0021d2ea62fe0mr12365732wrq.144.1656687327276;
        Fri, 01 Jul 2022 07:55:27 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id b8-20020a05600c4e0800b003974cb37a94sm7081073wmq.22.2022.07.01.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:55:26 -0700 (PDT)
Date: Fri, 1 Jul 2022 16:55:24 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: herbert@gondor.apana.org.au, hch@lst.de, heiko@sntech.de,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <Yr8K3Kxm6QzGY/g4@Red>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <20220701153614.0a576f9c@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220701153614.0a576f9c@donnerap.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_075534_062214_7ADF39DF 
X-CRM114-Status: GOOD (  27.20  )
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

Le Fri, Jul 01, 2022 at 03:36:14PM +0100, Andre Przywara a =E9crit :
> On Fri,  1 Jul 2022 13:27:35 +0000
> Corentin Labbe <clabbe@baylibre.com> wrote:
> =

> Hi,
> =

> > On my Allwinner D1 nezha, the sun8i-ce fail self-tests due to:
> > alg: skcipher: cbc-des3-sun8i-ce encryption overran dst buffer on test =
vector 0
> > =

> > In fact the buffer is not overran by device but by the dma_map_single()=
 operation.
> > =

> > To prevent any corruption of the poisoned data, simply flush them before
> > giving the buffer to the tested driver.
> > =

> > Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
> > ---
> > =

> > Hello
> > =

> > I put this patch as RFC, since this behavour happen only on non yet mer=
ged RISCV code.
> > (Mostly riscv: implement Zicbom-based CMO instructions + the t-head var=
iant)
> > =

> > Regards
> > =

> >  crypto/testmgr.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > =

> > diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> > index c59bd9e07978..187163e2e593 100644
> > --- a/crypto/testmgr.c
> > +++ b/crypto/testmgr.c
> > @@ -19,6 +19,7 @@
> >  #include <crypto/aead.h>
> >  #include <crypto/hash.h>
> >  #include <crypto/skcipher.h>
> > +#include <linux/cacheflush.h>
> >  #include <linux/err.h>
> >  #include <linux/fips.h>
> >  #include <linux/module.h>
> > @@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
> >  static inline void testmgr_poison(void *addr, size_t len)
> >  {
> >  	memset(addr, TESTMGR_POISON_BYTE, len);
> > +	/* Be sure data is written to prevent corruption from some DMA sync */
> > +	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);
> =

> As Ben already mentioned, this looks like having nothing to do with the I
> cache. I guess you picked that because it does the required cache cleaning
> and doesn't require a vma parameter?

The reality is simpler, I just copied what did drivers/crypto/xilinx/zynqmp=
-sha.c

> =

> But more importantly: I think drivers shouldn't do explicit cache
> maintenance, this is what the DMA API is for.
> So if you get DMA corruption, then this points to some flaw in the DMA API
> usage: either the buffer belongs to the CPU, then the device must not wri=
te
> to it. Or the buffer belongs to the device, then the CPU cannot expect to
> write to that without that data potentially getting corrupted.

The device does nothing wrong, I removed all sun8i-ce device action (and ke=
pt DMA API actions) and the the whole buffer is still corrupted.
Anyway if the driver was doing something wrong, it should have fail on arm =
or arm64.

See my previous report https://lore.kernel.org/lkml/YllWTN+15CoskNBt@Red/ w=
hich show the problem (The invalidated size is bigger than the dma_sync len=
gth parameter)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
