Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B268C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 07:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uSHs+x11r90tGcCY9HWr0M6HmqbZRVQpRI/CKw+NCJk=; b=ZYW227hX7BD4xG
	MwZyckXqyOr7Uhx9MHW0ebK/igNuAaK3vR1O45sh3AJ5n0ssYGa8cm22gQ1JzxAaq+rq7Qvix1G9p
	c2XVJeDGYQtef59/fifGHKsqDspXwITomS/2o0wVz0KJgKh68kpFUYBR7BxdMLGinETZZNfKsLn/n
	GKOM0d9N0Roa1aMEbnZQwVFcTQmHwVUaNXXhrBwSrBcnWhsID4P2cPTHmhLJYymUok1FDOdUWbvWE
	eTRkX9aXy0gIt85Nilg3AWlA49GxMIAW9w4xdD+euEWYbrDKs6uguyiBNFT4tNoseN6mQtD+hitm+
	FJVNLjUI/aMR/z/kSBQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zQA-0075ne-H8; Wed, 06 Jul 2022 07:26:02 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8zQ5-0075lQ-Rh
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 07:26:00 +0000
Received: by mail-wr1-x436.google.com with SMTP id v16so9231497wrd.13
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 00:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=RNGv+/8XLL3pLmqx9QBeEgEnepJuAQVAPCFO8Yi+Cro=;
        b=3mUI2v7SV28d9VmjYj0Fyg+1wNOzEcpQ4VMVHukiS0/GQw88kM3nJjZIj9oUc5CyOn
         HWcWTODnZgR+0wizfsFWughub1yC23i2CW45v0j3SfQ6zbxNdXA8w2tH0HZO1N5WWZah
         9l6I3qFan41NyCXQCm14R222BXC4hhrZWPm5nFJfGfc6eKig5tAO1KCC1MsEvu1oJO56
         ArveHYEYcNb5z55A57UdWFcrxHRuCxGREVvxJZ2XM2ZrBPzy2YGruospChNnGUgoleU1
         b1QGJDfEz9UYeOIri0rx7Nqk+wtupPIUNQYC3rxhUem/IABM7T9tuf5TB0uUF0jZB69F
         o/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=RNGv+/8XLL3pLmqx9QBeEgEnepJuAQVAPCFO8Yi+Cro=;
        b=bbXg9NpGpQMqJQdMaN5CPr/WAjkYY6iqs1IbU0E25sapz/SHwWaswd/Y8NtPlSsMam
         YgXb9A5B2ho7GFP9lk7YsuPkOxr/M5XPOeG1+On9EN2+LvsWE4CXfhLw0oJN3YDtBtxt
         L3MWN3+s0uB2/7hNbdL1DFsBAd1wsilngPUEzA4AY1tCuLvTSenMOrhc9T5EdePbwcfF
         jn1n57vn6LUwz5VsRp+g7owOYytxgZdcswV3vUQC/Kye7jiM0zKTx4o6lxxypKYRW2g9
         QPkRZbaB1L4aSh2r+5TrRSBkNwZ6YaPaqlVqgueTBVH4JfbsOP6Gu3CQ2un94NeF2CU6
         uPxg==
X-Gm-Message-State: AJIora/3Z/+5aII1CVh0k4ekg+h8nsnseKBSvIz46e9FAgnLAWwBJqGk
	YJ3rBZOR+aKe0X1FRjzn4DvFPQ==
X-Google-Smtp-Source: AGRyM1sjjoD72QqN/kPda1ll5BXRtL8M7g0zel6AU2vN3d7fDNT6a5wzNwnXMciWvstWpJaNyTIO/g==
X-Received: by 2002:a5d:468a:0:b0:21d:6dc8:9e60 with SMTP id u10-20020a5d468a000000b0021d6dc89e60mr11671635wrq.595.1657092355613;
        Wed, 06 Jul 2022 00:25:55 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id a1-20020a05600c348100b003a03be22f9fsm20272887wmq.18.2022.07.06.00.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 00:25:55 -0700 (PDT)
Date: Wed, 6 Jul 2022 09:25:50 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, herbert@gondor.apana.org.au,
	heiko@sntech.de, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <YsU4/qrnxG8yjFwC@Red>
References: <20220701132735.1594822-1-clabbe@baylibre.com>
 <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk>
 <YsP0eekTthD4jWGV@Red>
 <20220705164213.GA14484@lst.de>
 <YsR7O4q4IRI14Wkc@Red>
 <20220705175834.GA15815@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705175834.GA15815@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_002558_155154_1201DEAA 
X-CRM114-Status: GOOD (  12.48  )
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

Le Tue, Jul 05, 2022 at 07:58:34PM +0200, Christoph Hellwig a =E9crit :
> On Tue, Jul 05, 2022 at 07:56:11PM +0200, LABBE Corentin wrote:
> > My problem is that a dma_sync on the data buffer corrupt the poison buf=
fer as collateral dommage.
> > Probably because the sync operate on a larger region than the requested=
 dma_sync length.
> > So I try to flush poison data in the cryptoAPI.
> =

> Data structures that are DMAed to must be aligned to
> the value returned by dma_get_cache_alignment(), as non-coherent DMA
> by definition can disturb the data inside that boundary.  That is not
> a bug but fundamentally part of how DMA works when the device attachment
> is not cache coherent.

I am sorry but I dont see how this can help my problem.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
