Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF10606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 11:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DZ1nE/NL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jpnUBSjK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=n+zrgnjnvzWyTSvFM69sxY8cpjwF2Th4sh2oWoSyCSo=; b=DZ1nE/NLAOrhNYEXzABqgJgI52
	pH6o5OQc+hhBlZ9NaeDnr3hhltPL1D4LEeV3uHLu+IdByY6qctx4eQpQmD/YbNzd/yb2DrT+LFBt0
	ttO7C+RCapulgvnQyhY9T8lyqvIoO96nl5dCBY4Q5ujuftsn39ni3CQ0aoZjrmBWEWOgJvVDVJQfz
	+IBPgDuT/zka/XogTbPEcTRpQYAUy4Wh59dJX+dNYPBMlzyWgl4H7Y3/bEAuGxU7p0gPTTsamF2rD
	OoTsF4Ht8jLKTphZ/hiSDMHYWlMFjChBGmYatd55ShyUfU8KCqa8tFaU7BQfarbnCBAjwoByZ0kmJ
	eqhMS1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTdum-00000008ipj-0xgt;
	Wed, 18 Nov 2026 11:33:24 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTduj-00000008ip3-1b4k
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 11:33:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cddee4abc57so281809a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 03:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795001600; x=1795606400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7UG0JPbjn6aH3NrcP1EtB4S7cbz2TK8S8J6WbkM9l3c=;
        b=jpnUBSjKNd89GdZBGDEnFB4EJztZd4veMNh5MYPZWgTAhiSCt4uq/VoaIGSKOOQLmb
         c/VsvUoBbT+OfjaqH4xwV22+/d3jZ7D3qnd9PGsSuKaa8esy0M1P2tnF3bkT8xjdeib3
         RjW/I21ZVS7S1VbBse3hWUn6jBipu0lh4x5Sw2yLb+8UqfRdN7Q1bdaOiUsF5JF4bXeI
         M+l2TGp/40JN5Z0HejzowwHa1V1FryEQt7YyoJrqM5kiC/UtcjuDTOPj9n+KM+5otlJQ
         R1xiXz492tT4IBjCQ6mmc3cbxBP3uJIRqV+ZFxvXzuLGRBrvPKv8daFH91Ki8p0hNlXb
         k7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001600; x=1795606400;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UG0JPbjn6aH3NrcP1EtB4S7cbz2TK8S8J6WbkM9l3c=;
        b=il+05iLAEb0Jsgm1l/R0aLmhukByJNDOotLKD+/P2TkIiaKPOnVPr9c1wPXCK0Ty3m
         WxyAmMZj+gqJ+D3z6zir3BvkTmQy5qs93aSTo+YiUCUmEUsvgRPEZlmm7sy7UoFQ1a7a
         4h9URptgHBPdePxNAUeT1A6KOUqgAcad3+FYrYklmcL2JVsnzTku0kogsTbHOpgLNTf5
         2Oye6Pz4D+Y2y2oPZ0R5ajlrcvlnGaCEiFmOf990OnT9EO8fbl9AOypqS2G7Ru264kHf
         +PdEORlNlVKxNoGLn2O5VrcqkecN52rfb3CM3eLEtUqKHV9z9sb00rEp3xO/xiiXIOiz
         Laug==
X-Forwarded-Encrypted: i=1; AL+hErFgMGzBVuFbkLNRjdZCE6RUQzqtut5sn+TZWxSCBqhr9NgCqMDRgY00bTcddvGcyn8iACO65gNi26Y/Qw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9j/PlTMJaeUTzkolduJaDfWOkAkrK1FCZCXanDRfm1vxanfIxu
	pX8k3ep93EFo7kb05juyQelZ9ABYHlHb1P955DauTbecJ8jrvwOTnerC
X-Gm-Gg: AZFdTZeiB4OiHdHSeF5/YEZcSzsvs92sHg5biwBNE1jnjKMPyxcdNDaudj2dNC6+c4P
	oeza/Tdyk0rBgOv7adlvd96bFbnlf4dI8OYRFJbe6PHPRrNNo5YAextpb3nrifKJIeuNO1CHjUf
	ifHJ5A3pHSelvM3sKa0+KYYsYXWuYcrAv8ksq8cdQat9l/zfyXoHCTVkL+Qs72tGl3wyT+ANnrD
	nCXkb+FeGXw1jNojImDjtHt0xbMehzphAQmLgJc3TAAEQfMq3XJMzoGkLnppon471IeOn95eGXz
	RJX5T9bbD9p3jK8KTGesRaSVgKGjCK32pSpVIi04wGsd7qr3HLxleNm4eWUVCOtoi5sxzQongrl
	1A8F3rHEJTxpFhqrV0/HcN4WTPLF1nZ/mTbjfhhMnrf4jt5P8TfwGTv5NF8J5jqHUn9ucmdWJ+Q
	dpSnEon+7833oUxJKDHBgFeYjQuIbCjrJJ1i6pVmrsx7dcPSmGZqnVb+005bbs1WB320cFHqRCg
	N0KTuxko9+U6laWF/gQGtI8dlH8hFzT+3joczEboMnBM1GBYoi/74Gdv0LIzeVYBPwrPqUJySM3
	Tt355HeWGFAk1Xwv7DoHiK0t7YJauTFP4spQxfcbQRzTVaUK
X-Received: by 2002:a17:90b:52c8:b0:3ad:6090:a189 with SMTP id 98e67ed59e1d1-3b3d07a545bmr2675748a91.45.1795001599893;
        Wed, 18 Nov 2026 03:33:19 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d1c03e04sm3923274a91.15.2026.11.18.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:33:19 -0800 (PST)
Date: Wed, 18 Nov 2026 19:32:50 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, 
	AnnanLiu <annan.liu.xdu@outlook.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <chen.wang@linux.dev>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <av2McZf10FiOKDcZ@inochi.infowork>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
 <20261113124748.339778-1-chenyou910331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261113124748.339778-1-chenyou910331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_033321_423759_C99080D0 
X-CRM114-Status: GOOD (  24.88  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 13, 2026 at 08:47:47PM +0800, Chen-Yu Yeh wrote:
> On Thu, Jan 25, 2024 at 05:46:40PM +0800, AnnanLiu wrote:
> > Add the watchdog device tree node to cv1800 SoC.
> 
> Hi Annan, Inochi,
> 
> This patch was sent before the clock driver was merged, and I could not
> find a newer version on the lists. Mainline and the sophgo for-next
> branch still have no watchdog node for CV18XX/SG200X.
> 
> Annan, are you still working on this? If not, I would like to pick it
> up, with credit to your patch.
> 
> Inochi, before I start, is this plan fine?
> 
>  - Put the node in cv180x.dtsi and leave it enabled, since it does not
>    depend on the board.
>  - Use the clock controller instead of the stub clock. In the TRM clock
>    table, CLK_APB_WDT is the only clock for WDT0-2, fed by xtal without
>    a divider. The counter clock is selected by reg_wdt_clk_sel in
>    top_wdt_ctrl (top syscon, offset 0x1a8, xtal by default). Only the
>    RTC domain watchdog has a separate clk_wdt, in rtcsys_clk_en.
>    Should the node use <&clk CLK_APB_WDT> alone, or &osc as tclk and
>    CLK_APB_WDT as pclk?
>  - Keep the reset (RST_WDT) and the interrupt from this patch. The
>    vendor DT has the same interrupt (58) but no interrupt-parent for
>    it, and the TRM interrupt table names 58 "WatchDog1", so I will
>    check it with the pretimeout test.
>  - Test on a Milk-V Duo 256M (SG2002): timeout reset, pretimeout
>    interrupt and restart.
> 
> Regards,
> Chen-Yu

If you want to take this patch, you need to add all watchdog device
instead of the only one for RISC-V. There are three watchdog devices
for A53/C906 0/C906 1. IIRC only one can take effect at the same
time.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
