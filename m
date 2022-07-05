Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927A1C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 17:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nI4K6e4Ds99IzogtSPpeEi20LWUO+XuWJWc3nCk6/jI=; b=pKKSm4C7nKdLq1
	sYoCU3gy184Yj+Nlqd98cqgJi+46jhH0ISy2qVxN5x/Ut2aj5ByXVZUP9ofv3or/D3L6ago93afCG
	tljEfGp2SXTkUejqOze/7FLw1OARsgRyCz4FXcQuKQpMqxKzpmmnBLmZqc9HKCw0+4nVOtlSUytfI
	A7zUzc7zXTR442f0VCKRnSGMUlAz2v3fHTMxpmMZyEroS+3yZZBgbUyyfkUF6GfD44eKwBmeZwPZW
	2433Z03Z82gLRqjblv1DszpdMPqdylxB1eMkbTjLOuELEDBxfXNSBoCoRq+66T6acfW1ZIndmyDsy
	RVVHzRKiRY5xx7swQSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8mme-001zKm-FM; Tue, 05 Jul 2022 17:56:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8mma-001zIT-Tm
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 17:56:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id k129so7513421wme.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 10:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tp/mgAHgccbgU9bAMXiScmyIvCd30+VQEBf2GurCHPE=;
        b=NeORGT0pgGebZrwkVHkg52nMivvW56/r+8xwY4nE1j8QhfggCmqERHDAraqqq+NLFM
         n6YnGISqsnPnQANEOGT7V2+jFi9ulS90HZXHFBbS/5BtQNlXKPVEhgOtcjrbXa8u6pe6
         oxwLl2M82Dq+bEO5FQLaEHpIy7jgJqXQ/rlOXF1lSrgTqTqYnoRJITYuCBEau5LzWIQN
         3/ivFSZ5Q8gKsJ6HCsJaa/2yblKxLkkc6C5XhM7Tviz8k+/OG+xXZhd1KFgCMeZygEnr
         /wPJJQzQ+uSw9pUnOOvymkP4+dzQbAEUvVBHm1wl8dzTiF2g9Rvje+eASF609tmnGilD
         8NOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tp/mgAHgccbgU9bAMXiScmyIvCd30+VQEBf2GurCHPE=;
        b=Gn0VIW8kg2drI5yxGR68V/FVG5xczflqqO6UM6EAiYVImbhJ5K5yl4K6KwJNzOBwBo
         uXpwimM9UijttXluXndx70Z4rkAfJvGBe+WVNPRIHeuEwSbe/19/KsoR1o7ObG9qDF5C
         fHnJNxzDB90G4KkGJTOYInD6i0wocAOiHcmXnVT23/Vtdp/P5mGR3m86MImLX5/Dwk1r
         WTalUowhYm61TJFnVvl+K3sFLlNoXu6ymcXQfzQjiX6BfHhTCn6gTvQSjOTf/IJ87wi0
         cSdjd46CSWUsJVk+GfrDzCj2iYplqHDO60zcwfUBDM5Oohtdd8/QrZMhOjq691Sbz2GC
         errw==
X-Gm-Message-State: AJIora9qa4h6tf9tJ0OXxHqww/Cyfu/zzZe6WFuu4/qVBNTjDU6NRt6T
	3hakAUx2R2txE3UHLZv5f4wXJA==
X-Google-Smtp-Source: AGRyM1uaAaJsZIYUzoR96B0uDURnDI9gE4pPU/7G92tNYU6lhXMVPWEr4PbPEUYqRzy2za9/VYhVcw==
X-Received: by 2002:a05:600c:600d:b0:3a1:9712:5d31 with SMTP id az13-20020a05600c600d00b003a197125d31mr18969023wmb.67.1657043777275;
        Tue, 05 Jul 2022 10:56:17 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id r12-20020a05600c35cc00b003a04e900552sm22921126wmq.1.2022.07.05.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:56:16 -0700 (PDT)
Date: Tue, 5 Jul 2022 19:56:11 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, herbert@gondor.apana.org.au,
	heiko@sntech.de, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <YsR7O4q4IRI14Wkc@Red>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
 <YsP0eekTthD4jWGV@Red>
 <20220705164213.GA14484@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705164213.GA14484@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_105621_203217_6F4C4821 
X-CRM114-Status: GOOD (  18.00  )
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

Le Tue, Jul 05, 2022 at 06:42:13PM +0200, Christoph Hellwig a =E9crit :
> On Tue, Jul 05, 2022 at 10:21:13AM +0200, LABBE Corentin wrote:
> > =

> > I just copied what did drivers/crypto/xilinx/zynqmp-sha.c.
> > I tried to do flush_dcache_range() but it seems to not be implemented o=
n riscV.
> =

> That driver is broken and should no have been merged in that form.
> =

> > And flush_dcache_page(virt_to_page(addr), len) produce a kernel panic.
> =

> And that's good so.  Drivers have no business doing their own cache
> flushing.  That is the job of the dma-mapping implementation, so I'd
> suggest to look for problems there.

I am sorry but this code is not in driver but in crypto API code.

It seems that I didnt explain well the problem.

The crypto API run a number of crypto operations against every driver that =
register crypto algos.
For each buffer given to the tested driver, crypto API setup a poison buffe=
r contigous to this buffer.
The goal is to detect if driver do bad thing outside of buffer it got.

So the tested driver dont know existence of this poison buffer and so canno=
t not handle it.

My problem is that a dma_sync on the data buffer corrupt the poison buffer =
as collateral dommage.
Probably because the sync operate on a larger region than the requested dma=
_sync length.
So I try to flush poison data in the cryptoAPI.

Any hint on how to do it properly is welcome.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
