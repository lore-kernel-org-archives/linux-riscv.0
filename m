Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83370C83F3F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 18:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KW4pAIJdg1mzqjBJUwOSQH26LljPLr3fFzbvtTc35rY=; b=21QFgoltVkvI3K
	XtFe5M71ACxyzRYieOfB7Y6FfGLJcnRNONeHJzLEmiggGM2W5cEVf2NQ8GT/nZwte/zQnZlliewmD
	x4CcOygUvQFrPknaAAcjbuEp83Jdzzro01JnmwKnacs9Hl9UVa84DgnTMEJD608CZO23zT605L+SR
	AGOIXrOJekuy8prTYK6Tdy8a+Gl6f3NKiiQCOe25b6U3XpQWU4QtQiIxZzYY6t6LY+NFqaJH/ZkO0
	y1C2paAvKtjzcU+ujH+u0jnYtokeJFIxlUYco5YQ6NeZ6ExHl10xRQj3loVTfPG/8ezNH7KybptkF
	RFWi0/WPsKKSGqvfDa+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdEeP-004cDD-2V;
	Mon, 04 Sep 2023 18:50:17 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdEeL-004cCr-13
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 18:50:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-26d50a832a9so927078a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 11:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693853412; x=1694458212; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wf1kOMDJycx1EhXIXAvvdW5Sk/cZAAEVFAKi6ah34Mc=;
        b=h08pgDDGHI85R35yM0veXX7wuodpm/aMxgEP6l1yF7dBCXxEeiJdMJfy8PvS73mSsa
         Gye+1vBwbasM4fkiKgpqR8TyYhBKSoFJN0pgxWv9H041QA9VgKwlDsLAqH1uhU64Bw5/
         lsf2WJXEPZkLkPfJWtUZ+9AoGq8El5y/qu4guO/PuKfF4jBTrog+qabP8YYw6cedI9eq
         Bd2UXGaIjvL3e0teq6CCIotYrN7FjH8EjzlTYK3VFkemmInRfJFmm4ioYLSa6HMsWTLn
         2PUFBu5gPWgSv/0MNhIbZOyw/N+u5jYrLkYumDreSJ/bI0+UUFC7ZZ+875iqYYtszY0n
         Dgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693853412; x=1694458212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wf1kOMDJycx1EhXIXAvvdW5Sk/cZAAEVFAKi6ah34Mc=;
        b=SHX8RxstweiDtmdxcdywj7n2vrpKnlYuujXeWHPHwg73/vn8gS4UAGvTn5zSIvPU8C
         yyCNLGGmBpVbw3ZzGi/LUefx/WLXkX2nI/kXWpbEPMuZF56USUqflNXCEreYCng4Al6w
         NCJtEoWPNO5SqWOOt+tfYMd9tYLYo0yfM0Wpzi1Szp8cGhiBhU8rk2sxMBsZsw9N5cBh
         3HShc0//nAllKbQbm5XjmC3yz5P7/Mb4ONsgBCNWuHV4jZ7xRmvWQNKJvKWFMqnmHAjz
         ODk5BcVLEx5abYtDNkOyeCFoJwa6VD0rAjtDn1iUWwHcm+lybk4Y8hkMdV/bm00dZuhQ
         rNfQ==
X-Gm-Message-State: AOJu0Yx6wQzVlsmD71jO/haD+fTFx45JEG/G/+Kk9G2P04hfA85lOr0k
	9Ooav+TcKdVO4GYE7i1mXQ0++w==
X-Google-Smtp-Source: AGHT+IEVP+hJormX1Eur4mwRVG0JSZQfY+VMOFl6HpD2U+AUVAnaRoOKLQ/Bfg+HqlHUGlzs5PLo4g==
X-Received: by 2002:a17:90a:6e0d:b0:26c:f6d2:2694 with SMTP id b13-20020a17090a6e0d00b0026cf6d22694mr8751480pjk.12.1693853411971;
        Mon, 04 Sep 2023 11:50:11 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:e0eb:2a3d:8122:b588])
        by smtp.gmail.com with ESMTPSA id fa24-20020a17090af0d800b00268032f6a64sm9266991pjb.25.2023.09.04.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 11:50:11 -0700 (PDT)
Date: Mon, 4 Sep 2023 11:50:09 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: thead: set dma-noncoherent to soc bus
Message-ID: <ZPYm4S0GKr/TEtXk@x1>
References: <20230820115353.1962-1-jszhang@kernel.org>
 <ZPUXhe7ogxvaB6Eg@x1>
 <ZPXtl1iWlsYwmixc@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZPXtl1iWlsYwmixc@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_115013_369377_EEF4ED45 
X-CRM114-Status: GOOD (  24.81  )
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

On Mon, Sep 04, 2023 at 10:45:43PM +0800, Jisheng Zhang wrote:
> On Sun, Sep 03, 2023 at 04:32:21PM -0700, Drew Fustini wrote:
> > On Sun, Aug 20, 2023 at 07:53:53PM +0800, Jisheng Zhang wrote:
> > > riscv select ARCH_DMA_DEFAULT_COHERENT by default, and th1520 isn't
> > > dma coherent, so set dma-noncoherent to reflect this fact.
> > > 
> > > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > > ---
> > >  arch/riscv/boot/dts/thead/th1520.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > index 56a73134b49e..58108f0eb3fd 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > > @@ -139,6 +139,7 @@ soc {
> > >  		interrupt-parent = <&plic>;
> > >  		#address-cells = <2>;
> > >  		#size-cells = <2>;
> > > +		dma-noncoherent;
> > >  		ranges;
> > >  
> > >  		plic: interrupt-controller@ffd8000000 {
> > > -- 
> > > 2.40.1
> > > 
> > 
> > Tested-by: Drew Fustini <dfustini@baylibre.com>
> > 
> > I tried this on the BeagleV Ahead. They system booted as expected and I
> > did not notice any problems in the boot log.
> > 
> > Are there other patches such as the dwmac series that I should test this
> > with?
> 
> Hmm, this patch is necessary to test dwmac, emmc ;)

Would you be able to share list of patches you are currently using so
that I can apply them all?

Do you have any changes in the device tree that you are using that is
not in mainline?

I added the linux,cma node [1] with compatible "shared-dma-pool" from 
light.dtsi in the thead sdk, but that did not seem to make a difference.

thanks,
drew

[1] https://git.beagleboard.org/beaglev-ahead/kernel/-/blob/master/arch/riscv/boot/dts/thead/light.dtsi#L88

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
