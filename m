Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5394C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRjmXNa5vywTa8uWA3LKfZTgj2kNEkX+e6e+0TbIPlc=; b=fHex7xFaF/x7xo
	UKQTJNZtAR0+9vFHDJTIi2pN2Cmyz9UM2Kto/ZvSHJFzTYmL6Ych8QF0GkyVZFh22kGXr+nrs1/Hg
	boC9OasnF4NYzEVvw7Snmk28en83t5FmuutDq2doj01AiB/qnczZEA6711TvSpj2++P0HwS1p5zIA
	htmcqc3B06MptsFDP33XM7uScUF6w5v15XFVWyzAkVaUqrfAx2WNG4Btlgof2z7xo4zXSsNm33cMj
	Vq6KA+sVLFb7Kyw3muonHDhiaSrOWrkLw3nXqiazBcPUXUhJhWTvXJ9RQqK6OKg2LWsxuLS+T8S2g
	Cn3IZMKA+5ZloK9peLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8doC-00G98b-Qq; Tue, 05 Jul 2022 08:21:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8do8-00G95t-CR
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 08:21:22 +0000
Received: by mail-wm1-x32c.google.com with SMTP id m6-20020a05600c3b0600b003a0489f412cso7079118wms.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 01:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wfqoXVK+YfH3izkn1ZIOXk7M9UJ/gOHJBL54VlMil1E=;
        b=xUkNuB6sThZg8/L+TCfTHvgqmve+3X2XTscpzPB8Tdd347qOEdLnpGh+mxdoEih7j+
         LWCL7OdboRbOwv0QIsWPxwLkyW60r6irie07Mr+8PkDgDPCIjcWUhcM+RlBKaOlzwpiL
         I9oZqLzvc1EQwqvJkJygFu1TJthBVJpGZQo0/Xe8hUr8QpCPFrsHLL6F/ySU1L6krew6
         KDXsXBtTB9BWPKMq81vsoGDHHMUFq1YO/k86zB55BlddKyc4GChaRZ8aTpAIERpcpLcE
         1WndJcUi28Js1hwgiup05QRq/MZn02FUl9eX0YYVgkR7sZW3++szGVyA8qXWoGF0PzuR
         st7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wfqoXVK+YfH3izkn1ZIOXk7M9UJ/gOHJBL54VlMil1E=;
        b=PtC6MOqSrrRYAThi4dVf4CB5pLwuSbnay4RO9BRPfYKH6UOyp9ay6vlAfUOVFUFhpg
         nIyHAqdZl2E6nVprpsB6yX3PkL+KEcTodz5XlL6pYooJV+6OFv2OVB3g2ldwwQIehNtO
         J90kmY9OskwNmtK8AUFieftP58PcR38nCCDp+GmFf0jYYRdK3/ErKrRjIP5BIDfebuqH
         vjS/9amT6Y8+b0ck/j4aykFjDR0cfoJse2x0cH71db5Fuwfo/NwkafMEZvAfKljn8mL2
         grQ1vJqy0/2S3lkdEYqZpwVXY6ANYOW1OkA+LyHM6H+9OHyjrCIk9s80EMDZy679ACjg
         kQWg==
X-Gm-Message-State: AJIora9aJwlP+wb9jqKkcNTY+N9BMtfHYVr8snf7YfnUHs89OMrsWwhg
	0bgkzaXAEtcccf6L3I6uiY6XqQ==
X-Google-Smtp-Source: AGRyM1tr6rhGjC+OjSy5qUIGsdXXqW+hoadeDxw4So3EyQixfHxlPvRR/BsUHVmT5zqFTafMEYVfUw==
X-Received: by 2002:a05:600c:4ece:b0:3a1:7816:31a9 with SMTP id g14-20020a05600c4ece00b003a1781631a9mr30790692wmq.100.1657009277148;
        Tue, 05 Jul 2022 01:21:17 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id m123-20020a1ca381000000b003942a244f47sm19512608wme.32.2022.07.05.01.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 01:21:16 -0700 (PDT)
Date: Tue, 5 Jul 2022 10:21:13 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: herbert@gondor.apana.org.au, hch@lst.de, heiko@sntech.de,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <YsP0eekTthD4jWGV@Red>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_012120_672465_83375E44 
X-CRM114-Status: GOOD (  21.68  )
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

Le Fri, Jul 01, 2022 at 02:35:41PM +0100, Ben Dooks a =E9crit :
> On 01/07/2022 14:27, Corentin Labbe wrote:
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

> >   crypto/testmgr.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > =

> > diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> > index c59bd9e07978..187163e2e593 100644
> > --- a/crypto/testmgr.c
> > +++ b/crypto/testmgr.c
> > @@ -19,6 +19,7 @@
> >   #include <crypto/aead.h>
> >   #include <crypto/hash.h>
> >   #include <crypto/skcipher.h>
> > +#include <linux/cacheflush.h>
> >   #include <linux/err.h>
> >   #include <linux/fips.h>
> >   #include <linux/module.h>
> > @@ -205,6 +206,8 @@ static void testmgr_free_buf(char *buf[XBUFSIZE])
> >   static inline void testmgr_poison(void *addr, size_t len)
> >   {
> >   	memset(addr, TESTMGR_POISON_BYTE, len);
> > +	/* Be sure data is written to prevent corruption from some DMA sync */
> > +	flush_icache_range((unsigned long)addr, (unsigned long)addr + len);
> >   }
> >   =

> >   /* Is the memory region still fully poisoned? */
> =

> why are you flushing the instruction cache and not the data-cache?
> =


I just copied what did drivers/crypto/xilinx/zynqmp-sha.c.
I tried to do flush_dcache_range() but it seems to not be implemented on ri=
scV.
And flush_dcache_page(virt_to_page(addr), len) produce a kernel panic.

Any advice on how to go further ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
