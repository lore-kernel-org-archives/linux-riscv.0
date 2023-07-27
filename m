Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95802C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 23:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoxvF+Wm5Hxgd5ju3mB0K5h7HOgjSkWM32Ij0JnyViY=; b=Tms5QvCW3P0+KB
	gwWPMCGJmZl6QLIE6KCaRx2S2/pmUBT6I2lm3NGNIZLc9LHaN23euQFRKwRldh95sIS4i4+vZgNO5
	MvITKJb89+kqAk0VJa8UIcFgefgtnLaAhyJkA2GH9MQRMaKAi3dp6+ll3U+QhOP7BEOM12BLY5PA9
	c5nM52JUDG0JubdEqa6NKnNYLabI2HJPKfwjKBiQKi6NqXZMoE0jA+sB99hBF0/SGeixhqUPbWnLW
	w0hkI1AkpC0m9bMvkVUeD63qPfL6+/K6+k+nGsOwCfwbhgCDzXGkKWUpKQDJxCUWMYc1aOlVZAT6/
	kT5d0QEeerIrQXbrAGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPAtW-000ySi-3C;
	Thu, 27 Jul 2023 23:59:47 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPAtS-000yRx-2d
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 23:59:45 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bb81809ca8so12007545ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 16:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690502379; x=1691107179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yOKiUxDPKvRLa/kPi76r2pwEo1sFcVBEnyuTNjKRcD0=;
        b=YESZl38UaRZ05Obt17gN/zrCA22IzUrY4yM0wvLjlSkPxTNrR0gjFfgvLX48MAv2vH
         NETGf2BXTaccmfT43k6Jfr0QubkNMBZntPyuDxA5eG4FLAxDEDwTuzlTkVxuipg5XC/T
         +P3hZZmlsveCgC664VMh5Y22YmwJdm09CWdUlmG2JKWddTl0Kt9wtU2QkKtRmdAXJZiC
         O1Hosbtg5vF2J2V3Jjn3nM8FKG0fBygvanqLwAaDMPm/9knYAxOlWq+yekhZ7vEHXRTR
         CfgPUDI0jvghpou5vwA07o5qHsB27o3rPLm35svKAqnBK6bnBP4tbd+PQMKRkL7ObyVC
         f0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690502379; x=1691107179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOKiUxDPKvRLa/kPi76r2pwEo1sFcVBEnyuTNjKRcD0=;
        b=cREpIwjEGKb3NE6Wmc+MoBrOvfe4fkX7gRyL4uVYrimiuSOVIqkOr6wW8gKj32aMdh
         D7Pqk+7Sjvdqzoi5dTp76F1Waz2cOqMrOwLNFa8Pr5jXpddkEeJ8XGEwGG69hRTVuWJK
         eGzi0MKRfJ36K3eIo0fsNv/VALIqj6z2Nh2udt4RwqSu6oApfWTu15DdR1jhPEkxQ27/
         eBxmemv/y3zf7AVv11P0G0wXUxX/Qp+tJxjBDBp5ytTfTyp8WqDGYT4EsPM6+Mo6yBRk
         VnRLXDx4v+O2SbJ8kjbvg0MzJQo05c2wEqFm1mOEnTueJlieo29zKn2mmtm5Gs+76+K+
         yCpA==
X-Gm-Message-State: ABy/qLbJSwGIHxiTi/ru6Vk4rt6hQQJZgkNAq5XHHn93jCSm8lHVYiBo
	O7Bwnt/7d8LLzmHUnTA54RGQQQ==
X-Google-Smtp-Source: APBJJlGMw2cf+CJchqdgDNVLwOuXKaGnK5e4Us9yFYLovgmZPrtW19QVwG5gqf8OYeTtOv1aSbOsHQ==
X-Received: by 2002:a17:902:bd4b:b0:1b8:8af0:416f with SMTP id b11-20020a170902bd4b00b001b88af0416fmr117522plx.1.1690502379302;
        Thu, 27 Jul 2023 16:59:39 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:dacb:3a1a:fcaf:c0fc])
        by smtp.gmail.com with ESMTPSA id je12-20020a170903264c00b001bbb598b8bbsm2220874plb.41.2023.07.27.16.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 16:59:38 -0700 (PDT)
Date: Thu, 27 Jul 2023 16:59:37 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Kwanghoon Son <k.son@samsung.com>
Cc: 'Jisheng Zhang' <jszhang@kernel.org>, 'Conor Dooley' <conor@kernel.org>,
	'Guo Ren' <guoren@kernel.org>, 'Fu Wei' <wefu@redhat.com>,
	'Rob Herring' <robh+dt@kernel.org>,
	'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
	'Conor Dooley' <conor+dt@kernel.org>,
	'Paul Walmsley' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt' <palmer@dabbelt.com>,
	'Albert Ou' <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	'Robert Nelson' <robertcnelson@beagleboard.org>,
	'Jason Kridner' <jkridner@beagleboard.org>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device
 tree
Message-ID: <ZMME6cHQzHMLUCq+@x1>
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
 <20230723-savor-trolling-e35ed4a7a751@spud>
 <ZL1jlacHj7sgNg8M@x1>
 <CGME20230724003542epcas1p4c6c8dbd042af792bc168e10c6e81e45d@epcas1p4.samsung.com>
 <ZL3Eenj4lGZDhZTM@xhacker>
 <000001d9c070$82638290$872a87b0$@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001d9c070$82638290$872a87b0$@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_165943_077620_B61D505C 
X-CRM114-Status: GOOD (  18.97  )
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

On Thu, Jul 27, 2023 at 06:55:37PM +0900, Kwanghoon Son wrote:
> > On Sun, Jul 23, 2023 at 10:29:57AM -0700, Drew Fustini wrote:
> > > On Sun, Jul 23, 2023 at 11:32:17AM +0100, Conor Dooley wrote:
> > > > On Sat, Jul 22, 2023 at 02:55:39PM -0700, Drew Fustini wrote:
> > > >
> > > > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > > > @@ -0,0 +1,61 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > >
> > > > Hmm, should this not be dual licensed?
> > > > I notice the other th1520 stuff isn't either..
> > >
> > > Good point, I'll resubmit with a dual license.
> > >
> > > Jisheng: are you okay with the other arch/riscv/boot/dts/thead files
> > > changing to a dual license?
> > 
> > When cooking the initial patch, I wrote the lpi4a dts files from
> > scratch based on sipeed opened sch file, and currently only I made
> > contributions to them, so it's easy to make the lpi4a dts files
> > dual license.
> 
> Thanks for your work.
> Is there any datasheet or user manual can get on public?
> I'm going to contribute drivers in my spare time,
> but it's hard to know the register file and dma information.
 
We (the BeagleBoard.org Foundation) have asked T-Head to publish public
documentation for the TH1520. It is our understanduing that this should
happen soon but we do not know exactly when. I'll followup in the this
thread once that happens.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
