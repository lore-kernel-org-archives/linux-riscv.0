Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB9AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 06:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hV5D1IsqggAJBLqjN1686GRoNkCWGlSwnfvq8q7V6Oc=; b=YZMsl7Vxrbq6f3
	OTaEpnQqJidH3TrcK2xe6b1QXLXjqBjnO4QH3B5jl1UNzWAlES5WhnkM1fsvb0tTh1yNn0blm/tZw
	eYZ0Qwj2qP1g8u+IWBqULQ40aA5hfkyA3ENj+Whxgn4B1J79QXym6fA6EF69CRNfL/mQpA3RdYPnl
	WWod0iESrccVOdsVk1Yeej+8d+FT2qVDpxOwvhcCxVb9B6gPsTAGWb8ZzvOJ6wggv4/XYO2lE76kj
	11EbmSB31L1zcXfIftQPkqx5qchvwblpoNmBJcHnqqcKT4mIWhN73zOoyw72mwVL3yx07hf/2JsCg
	XCVU2UIzpvtx3GJrD3KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuR3-006hiW-AX; Tue, 29 Nov 2022 06:49:41 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuQs-006hgD-Lm
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 06:49:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id bs21so20524198wrb.4
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 22:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lmVjYexoERFRLmswRpO1q36g6awLl71zVxT5hQ15vcg=;
        b=ntk/FH9EbBtwfWvoMIOUfe9FsgBTlcvBWzIX7MVys87ufBo39LkWymGd0In84CowLn
         4zIscMlAYgrIwoSOF+t0A6A69nIVOwcJWtvqLCXVF+WvGJg6lhGrIeZHrVfLjjMi+DiQ
         FePqtvkUemS2vBWUoY5IqccNWo2ZWvZKSCjxRPxvwRRL8KzlFdWaOiu6Obii7UrRHdD+
         99DKQaDAmDwjsGwa3aCftxFFGOloKd6RJ9Fq0hTCNQtIkqFPShRiwzHkJhPhv2o+LkDb
         naMDb4HwaV4/wuRCq7L1tBrOqdE/S8gfkRyZ+BULYGMGvE08GSql13KsaLpwTZIFhchP
         Q3LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmVjYexoERFRLmswRpO1q36g6awLl71zVxT5hQ15vcg=;
        b=mOW2JPTWIQWU9iXCoKvujlTtYy1xVa5Z4IumXZZ+ReBVZmFx0wUNRWUFKmt/6jn6ju
         kF2jhi63x9KPOFUAw0nhGo3+es9hCBzC1o/xvtPeaIjpGAjKRxmhdiQ3vwEZJ+frnf8Q
         mpJWMX6TiWlXmA4rtHAkEC3rZk3o+jYPA8M6I0zVhw8UALJ19tGAcYCxVmjboUs5KfKj
         tlLNB/+f0tE5tyw+kQwkD1mxjK5XfdPnT1fcghZdM25L2aXbf/MOknSE1x82azgefIIP
         0ZWojjJooUFbR47BBkgof0eK+Uo1Vp7/44aOYGXza2RJcHxoodiQjYA+POnVlYsxZsn8
         uVGg==
X-Gm-Message-State: ANoB5pk7sNjEoZuX2wq80MWWMKyt6RmJuJ9RWv1WHSySQfplWSjXWIdh
	bLPP2M6LerFO7uef0hQ9wYGJsA==
X-Google-Smtp-Source: AA0mqf5dlqn3HBjFPq2nAmDpPb3yIbAlXddjpobxrmlhDjs9DMdVfaLD9GLImkT+T+Q53hDWdMOb6g==
X-Received: by 2002:adf:ee8a:0:b0:242:2d:c679 with SMTP id b10-20020adfee8a000000b00242002dc679mr14065313wro.369.1669704567012;
        Mon, 28 Nov 2022 22:49:27 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i18-20020adfb652000000b0022e36c1113fsm6071466wre.13.2022.11.28.22.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 22:49:26 -0800 (PST)
Date: Tue, 29 Nov 2022 07:49:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>, palmer@dabbelt.com,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 12/12] riscv: defconfig: Enable the Allwinner D1
 platform and drivers
Message-ID: <20221129064925.kjjqrzmi3fm67akt@kamzik>
References: <20221125234656.47306-1-samuel@sholland.org>
 <20221125234656.47306-13-samuel@sholland.org>
 <Y4JBa52o4Yemv/uj@spud>
 <11740765.nUPlyArG6x@diego>
 <6aad3b63-498e-b13a-af49-b5af0d4e721e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6aad3b63-498e-b13a-af49-b5af0d4e721e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_224930_736379_9C1DA51B 
X-CRM114-Status: GOOD (  30.21  )
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

On Mon, Nov 28, 2022 at 09:17:38PM +0000, Conor Dooley wrote:
> On 28/11/2022 21:11, Heiko St=FCbner wrote:
> > Am Samstag, 26. November 2022, 17:40:11 CET schrieb Conor Dooley:
> >> On Fri, Nov 25, 2022 at 05:46:56PM -0600, Samuel Holland wrote:
> >>> Now that several D1-based boards are supported, enable the platform in
> >>> our defconfig. Build in the drivers which are necessary to boot, such=
 as
> >>> the pinctrl, MMC, RTC (which provides critical clocks), SPI (for flas=
h),
> >>> and watchdog (which may be left enabled by the bootloader).
> >>
> >> All of that looks good.
> >>
> >>> Other common
> >>> onboard peripherals are enabled as modules.
> >>
> >> This I am not sure about though. I'll leave that to Palmer since I'm
> >> pretty sure it was him that said it, but I thought the plan was only
> >> turning on stuff required to boot to a console & things that are
> >> generally useful rather than enabling modules for everyone's "random"
> >> drivers. Palmer?
> > =

> > Isn't the defconfig meant as a starting point to get working systems
> > with minimal config effort? At least that was always the way to go on a=
rm
> > so far :-) .
> > =

> > So having boot-required drivers built-in with the rest enabled as modul=
es
> > for supported boards will allow people to boot theirs without headaches.
> > =

> > Disabling unneeded drivers if you're starved for storage space in a spe=
cial
> > project is always easier than hunting down all the drivers to enable fo=
r a
> > specific board. =

> =

> I wouldn't mind being able to turn on all the PolarFire SoC stuff and
> yeah, that would be the way that arm64 does it. But I do recall hearing
> that I should not turn stuff on this way, when I initially tried to
> turn stuff on via selects, got a nack and asked if I could do this instea=
d.
> =

> But it may be that I misremember, which is why I appealed to the Higher
> Powers for clarification :)

FWIW, I don't worry too much about modules in defconfig because I always
immediately apply a 'LSMOD=3D$PWD/L localmodconfig' to it, where the L
file is an lsmod output which only includes modules I need.

Thanks,
drew

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
