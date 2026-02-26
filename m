Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334C5FD8FCC
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UN/IsygLEkPKY+ogT9oQfGXs69kq5/TbMPjaIzAPMDY=; b=L7LZLkQGj7Doc9
	b+MXb825YIt8LXpXDjFuZr8uJ0aXpPgTTUfaiI7/bMt8ajYfA55lb4tU8rXvgsd+CHeRZ/YImthvr
	SzElDrikipNZQC32RrkQhy1Mj8IQx/7V6SjCr73ctQ67fuz+UiM8casyCb+G6uZloAXnuPN4kdNBw
	4DW93oaMs3aLS9rpa3+3Dj/M3jPidR/HYBqX2sZO9jrDN8CnOVaa+iSUuE6YmraYbQnDEp6X42j0r
	PV8zmLxTEu070aM6Z3INlQOVIYdfkWXZ8q8/lXkT2EyOFE6Z9vagM/TQd68Tf/6WZcadHSZ3GMFK3
	oGQn/Xybk/piPnuM1r5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdUG-00000006XJ3-3aTx;
	Thu, 26 Feb 2026 15:41:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdUD-00000006XHg-1uYp
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Feb 2026 15:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1k5RnefQkAvGAiccxF2n3IZAxFH1TLXRjZjH5ND0iLo=; b=X6GEZk6yADp207MJzAHiKFUHYY
	kGlHpFQ1vFZmgcM68j+PrN1AgBSeS3rE+6hu9rxttlCtCjuqqsNFtzgh7QjSgLphUolY1gF5S+77e
	go4eLKe74MjqE/975vwIj6ALkoSz3S8zPaVVFVq6qCFS/Z4Xe35PWkZQIErnuR/y77ilBntSfPL2k
	YzNj0lS9Gdk3sSARSGSR2FhyLjl0pq4+oY4k63PKzaPvKTZtVBNW3YaRkvD5YCVDXXtVF6BBAjOe7
	YVOg7OdVMAceAgbRq5fEWgkhjitY1y0J6hJxN9L81+bh3f1rL+G3fKhYH97of6B5hCzkNdeKkToOL
	A8xGZWqw==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvdU9-0000000BLwx-45NQ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 15:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772120463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1k5RnefQkAvGAiccxF2n3IZAxFH1TLXRjZjH5ND0iLo=;
	b=hPby2ZOffjwdLt0ij3aQLIlGinYCoT4UnQlqDVMVUAebsbNlApAapyPRHpu9Gre+991lDo
	8XCSVehCcVjdmqCvNS8iHh/He4Cmc2QZ2r4KuCu41oZd/BM7SwKpZXY7sA7WYf46i7pxzi
	OPPppdr9emAqLwjj1V1CPZexz6SKjv8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772120463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1k5RnefQkAvGAiccxF2n3IZAxFH1TLXRjZjH5ND0iLo=;
	b=hPby2ZOffjwdLt0ij3aQLIlGinYCoT4UnQlqDVMVUAebsbNlApAapyPRHpu9Gre+991lDo
	8XCSVehCcVjdmqCvNS8iHh/He4Cmc2QZ2r4KuCu41oZd/BM7SwKpZXY7sA7WYf46i7pxzi
	OPPppdr9emAqLwjj1V1CPZexz6SKjv8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-1NfOqNvDPJarCahVVXnggw-1; Thu, 26 Feb 2026 10:38:50 -0500
X-MC-Unique: 1NfOqNvDPJarCahVVXnggw-1
X-Mimecast-MFC-AGG-ID: 1NfOqNvDPJarCahVVXnggw_1772120329
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb4e37a796so635046485a.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 07:38:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772120329; x=1772725129;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1k5RnefQkAvGAiccxF2n3IZAxFH1TLXRjZjH5ND0iLo=;
        b=SKtn+lqQeNXPZkDczk2SBClZ9MYxUkEO3oP0Qmv3BREDV52JAoROr+0VBbcwFmOBia
         A5qS/0WUD2HPkInkCsAV5CocBCFxlJcSEZDbluqNBjESpw7Nw7BsTtQ81GAf7F5ifyy7
         TNWC6L9vxu/kY1D4OOrmxn8vUHCPJanZqBIgIUygM5Od4HdmGRkL/Ge7SfoQLOjStU1A
         XcyZv6SFhNgYwjx3m/kdy5tpm1JK2p+dfZUflB/k+2OoCkKiuaHJH8rRrLuxEeh0CEVo
         L0CKzsmv/P88RW77yMPVoJb9E/L43XWwjspcDxqn9jJ+iIdGYh02TtNBOj7JFAto08Fr
         ytsQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53gMdljCJGkPuXyFyZJD8Pq0CorcIqvKo2XdPhlIC8yIf7M+ymc6rwzVgbd4Zm/3gsCfVH3GEHJ1pvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy81TRvfJ4+CGfgIHZjWBtHRv/M53/FE/bxBDtzN+Sv+Gnn3lMo
	HnXq7vtxyd2/Gc+4KvVVGPQ5BT2re3e3LjBEiAvaootvLluf+g/lOoq9SeHaVFwCWTF91T5Ogwq
	f4dBB0/NAqsRrn2nDoo97+WJ0SYMs2nOnAktgxt453VP/1Ys/3E/mIg9Mhc6H0tp1N3DK5w==
X-Gm-Gg: ATEYQzy7eex2MboLyWghBzVBSliurENukgG/Yt/v5xdPArMjsmgTvTB6QDUo/EkcniK
	leebpd/JemPMY6tfxE7JK1xTSlaIheVgGvjRv9aPZ86cy3QCG11UTpxOPgFqdE8DFRbiWi+1Vfg
	XQHgE4/jJ6jqjx9yqCnrwBOyzODUEYfqpSrnAMLaOhCh/7fzcW/l/Z6Ox/F/ElPbvSASG5b22oM
	WXw9guILcK1sYdFd0uU9Ttb4aIACIm05tdIJQkt9ga+P82Eoly0w9Ab2aj1Ctiy4eiFLvd4xJDs
	/R2nmgadhOGkFs2xCFMH3xO8HqL2UQAyPXZ30qNiqffQnCG4WIp4oF2vL6yTUsj2reBtW/3YHAt
	1wT8B80Z3GiQ0PTggzU971CdLco4SuniFPK7QxnBmCGiF8eQr2xTOUbUD
X-Received: by 2002:a05:620a:4045:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8cb8ca18f95mr1599112885a.34.1772120329391;
        Thu, 26 Feb 2026 07:38:49 -0800 (PST)
X-Received: by 2002:a05:620a:4045:b0:8c0:cbd8:20b0 with SMTP id af79cd13be357-8cb8ca18f95mr1599107585a.34.1772120328924;
        Thu, 26 Feb 2026 07:38:48 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6534f3sm222534085a.5.2026.02.26.07.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 07:38:47 -0800 (PST)
Date: Thu, 26 Feb 2026 10:38:45 -0500
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: microchip: mpfs-ccc: fix out of bounds access
 during output registration
Message-ID: <aaBpBYVtt_VhuJws@redhat.com>
References: <20260224-briskly-scholar-294d13464721@wendy>
 <aZ9-NWiX4wMH3Ay6@redhat.com>
 <20260225-cache-nebulizer-2f3669074fa4@spud>
 <20260225-thrive-endless-3168e0b0f916@spud>
MIME-Version: 1.0
In-Reply-To: <20260225-thrive-endless-3168e0b0f916@spud>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: idvdAKwNksWEl59DBGHOKNYrMwRQrhjH_1Dy1HmYJ_I_1772120329
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_154106_149514_03F6A3E5 
X-CRM114-Status: GOOD (  37.77  )
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

On Wed, Feb 25, 2026 at 11:24:59PM +0000, Conor Dooley wrote:
> On Wed, Feb 25, 2026 at 11:14:47PM +0000, Conor Dooley wrote:
> > On Wed, Feb 25, 2026 at 05:56:53PM -0500, Brian Masney wrote:
> > > Hi Conor,
> > > 
> > > On Tue, Feb 24, 2026 at 09:35:25AM +0000, Conor Dooley wrote:
> > > > UBSAN reported an out of bounds access during registration of the last
> > > > two outputs. This out of bounds access occurs because space is only
> > > > allocated in the hws array for two PLLs and the four output dividers
> > > > that each has, but the defined IDs contain two DLLS and their two
> > > > outputs each, which are not supported by the driver. The ID order is
> > > > PLLs -> DLLs -> PLL outputs -> DLL outputs. Decrement the PLL output IDs
> > > > by two while adding them to the array to avoid the problem.
> > > > 
> > > > Fixes: d39fb172760e ("clk: microchip: add PolarFire SoC fabric clock support")
> > > > CC: stable@vger.kernel.org
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > > CC: Conor Dooley <conor.dooley@microchip.com>
> > > > CC: Daire McNamara <daire.mcnamara@microchip.com>
> > > > CC: Michael Turquette <mturquette@baylibre.com>
> > > > CC: Stephen Boyd <sboyd@kernel.org>
> > > > CC: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> > > > CC: linux-riscv@lists.infradead.org
> > > > CC: linux-clk@vger.kernel.org
> > > > CC: linux-kernel@vger.kernel.org
> > > > ---
> > > >  drivers/clk/microchip/clk-mpfs-ccc.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/clk/microchip/clk-mpfs-ccc.c b/drivers/clk/microchip/clk-mpfs-ccc.c
> > > > index 3a3ea2d142f8a..54cfbb8be8ab5 100644
> > > > --- a/drivers/clk/microchip/clk-mpfs-ccc.c
> > > > +++ b/drivers/clk/microchip/clk-mpfs-ccc.c
> > > > @@ -178,7 +178,7 @@ static int mpfs_ccc_register_outputs(struct device *dev, struct mpfs_ccc_out_hw_
> > > >  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
> > > >  					     out_hw->id);
> > > >  
> > > > -		data->hw_data.hws[out_hw->id] = &out_hw->divider.hw;
> > > > +		data->hw_data.hws[out_hw->id - 2] = &out_hw->divider.hw;
> > > 
> > > What happens when / if the DLLs are supported by this driver in the
> > > future? This seems like a trap for the future.
> > > 
> > > According to include/dt-bindings/clock/microchip,mpfs-clock.h, there are
> > > only 16 clock IDs. Could hws be initialized to have enough room for all
> > > 16 structures, and would it be ok if it was a sparse array?
> > > 
> > > At the very least, I think it would be nice to include a comment here.
> > 
> > I think I'd rather add a comment, I know it's at most only 24 extra
> > allocations, but just feels bad to do it.
> 
> I'll add this, maybe on application.
> 
> @@ -234,6 +234,10 @@ static int mpfs_ccc_probe(struct platform_device *pdev)
>         unsigned int num_clks;
>         int ret;
>  
> +       /*
> +        * If DLLs get added here, mpfs_ccc_register_outputs() currently packs
> +        * sparse clock IDs in the hws array
> +        */
>         num_clks = ARRAY_SIZE(mpfs_ccc_pll_clks) + ARRAY_SIZE(mpfs_ccc_pll0out_clks) +
>                    ARRAY_SIZE(mpfs_ccc_pll1out_clks);

That makes sense.

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
