Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F1C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+qupFYU59YXI0012dZ1P4Y6CKXEkUXoeHaMhAo7uNw=; b=lqQbTdvfsNlnk0
	sSRXBodyz4I5RiT4f94dtDIytbe9vkxIywyDthCgjlaxuczvjsTxr/CL/eWh2dvW1infHoH6vLpsk
	ePebfTzPyW1kQo65DB0fcKDQ0L088dbvZpUxulMuRoFYXoMqqidwQPQ3JcbdGRXuvMPnCoPSpIqC6
	4OT7o+r0LV90K0ngtegXEPzK51aK1IwRib5/0QTSd5NZj7MJB9BITDBZwWfNDBe9KdLkqFfFJ12NP
	Zl3LTEKJFZi9S35arO0235R15fmH8kvk33JjXiQ0YuZzD+h4C2K/0Qkr3LPKbQsJrnb7kqne4KkrQ
	0Jaq3vKLbz/7LZHfG/EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGH3-00BP1i-2x;
	Mon, 18 Dec 2023 16:15:21 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGH0-00BOzW-2r;
	Mon, 18 Dec 2023 16:15:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a2369d9b04aso75504366b.1;
        Mon, 18 Dec 2023 08:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702916114; x=1703520914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuQkvFoOE7DbmbVDS6evAusjIw9xKO/OIgcTSDhOMeo=;
        b=XOFK/k2pTAYmoV86kMcQ8wexYMdfkn7n7nEDxYa3hbTFK2diQ2MXqBX66qBBOmGRRf
         LUtzW+5kRFeGrc4HpHWVxjo0etIOm5iv7Y0ESxvtfC7s9CzTJbr6jWmo9E2kaDwJESpj
         Tzmp7Ly0i1QoLJ5u0hec2hAy+Mn2w42NfEBz8rJoXobnvJQGmYvNQC6m/7JUeG61KS0z
         0vrH4oOXde+ufxaF/XMGuFSvVm9D0QSLrNUtaPEI31LlAxiMyJokIAuwPizsrcD0mSkQ
         GqWIl3HzMBw6mO3u8rjgMl/9LW8fAkL3AnY16oIZ2RtBxz3VNz7fmi5/2+qWPErwn54Y
         mspw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702916114; x=1703520914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NuQkvFoOE7DbmbVDS6evAusjIw9xKO/OIgcTSDhOMeo=;
        b=nQ+zAvYUgAdH9Kmle3AcWMvacXSaVq6WmI8cnn/agorhL78AQobQ9wItsphZ4MrQ4S
         cdpD+ousXdOzArxDUXe3N6OND9jdgpRucaZQF2AE6JbQ5miDERsLEihfp3NmiHXoNdzI
         momVYX9OEr+pTfEwGHHYrdeqg/PeqnKatuyhVZ3IzuC28SarpVVfi4T1SZ4neRhHl2wQ
         ubVmq/s5jk12Feuo9g0IiID5mztftS+UvlLbRvWiPE16d4elfwYq0xo3V6EgyBIY53Fn
         RQdbkvuFNQNREto9KxotJEQyCt26jPWBskinaFqob3gFuiLkas1nWef540yS5cYjhDEv
         y8sw==
X-Gm-Message-State: AOJu0YxkJDOtI96oRGMhalokaRlAOIl685mgF7W/FtBOVwv6+RzfAZy/
	SIeACbsuMIjRBYkn5nGiELo=
X-Google-Smtp-Source: AGHT+IFwxKikc0VD/aflFLF5hsUj2htfh9cxPznr1qHGY/nVPfC2muHIz36ghByZC6hXFA3e5iP3eQ==
X-Received: by 2002:a17:906:51d8:b0:a23:6eb6:6b29 with SMTP id v24-20020a17090651d800b00a236eb66b29mr58860ejk.101.1702916114457;
        Mon, 18 Dec 2023 08:15:14 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id hg12-20020a1709072ccc00b00a2359f95ad8sm1230202ejc.37.2023.12.18.08.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 08:15:13 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Conor Dooley <conor@kernel.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/5] cpufreq: sun50i: Add D1 support
Date: Mon, 18 Dec 2023 17:15:12 +0100
Message-ID: <2710663.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20231218155345.476e71ea@donnerap.manchester.arm.com>
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218-blabber-slapstick-ab7ae45af019@spud>
 <20231218155345.476e71ea@donnerap.manchester.arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_081518_949239_65856A7E 
X-CRM114-Status: GOOD (  26.63  )
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

Dne ponedeljek, 18. december 2023 ob 16:53:45 CET je Andre Przywara napisal(a):
> On Mon, 18 Dec 2023 14:55:30 +0000
> Conor Dooley <conor@kernel.org> wrote:
> 
> Hi,
> 
> > On Mon, Dec 18, 2023 at 12:05:41PM +0100, Brandon Cheo Fusi wrote:
> > > Add support for D1 based devices to the Allwinner H6 cpufreq
> > > driver
> > > 
> > > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > ---
> > >  drivers/cpufreq/sun50i-cpufreq-nvmem.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/cpufreq/sun50i-cpufreq-nvmem.c b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > index 32a9c88f8..ccf83780f 100644
> > > --- a/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > +++ b/drivers/cpufreq/sun50i-cpufreq-nvmem.c
> > > @@ -160,6 +160,7 @@ static struct platform_driver sun50i_cpufreq_driver = {
> > >  
> > >  static const struct of_device_id sun50i_cpufreq_match_list[] = {
> > >  	{ .compatible = "allwinner,sun50i-h6" },
> > > +	{ .compatible = "allwinner,sun20i-d1" },  
> > 
> > I thought the feedback in v2 was to drop this change, since the
> > devicetree has the sun50i-h6 as a fallback compatible?
> 
> Well, this is the *board* (fallback) compatible string, so we cannot assign
> it as we like. The whole (existing) scheme is admittedly somewhat weird,
> because we not only match on a particular device compatible
> (like allwinner,sun20i-d1-operating-points), but also need to blocklist and
> re-match some parts against the *board compatible*, owing to the
> cpufreq-dt driver. The board name is basically used as a placeholder to
> find out the SoC, because there is (or was?) no other good way - the
> CPU DT nodes don't work for this. Back when this was introduced, this was
> the "least worst" solution.
> 
> I don't remember all the details, and didn't find time yet to look into
> this in more detail, but fixing this is non-trivial. If this isn't 6.8
> material, I might have a look at this later this week/month.

I would say it's 6.9 material. -rc6 already passed and it's not yet aligned
with all maintainers.

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
