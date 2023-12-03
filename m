Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49189C4167B
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Dec 2023 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QRGa8O/QI8BcPhDCi6W9Vk+zQ24NCQF4NCq6vYYd2Ik=; b=CCJ1J2FUFBxjq9HrQ5YWI8POc9
	NLNQksRy7mhC6Cnqd/UIit4Qj5zw8oLA5pBRTXPlQNWiaH46X7mjI06XgPEOX9D21WfDeN6hlTB18
	KNjmWQBB7TqJRf8/kWuvGOL0FRGfMzhrd01YD3hpAwRfzYCBWa/O0q8g7wg+e43CodXKODv9tOanW
	LSvDNUrFzp+Q6ImHDrT/kZIbalW0bLE1skEiMkPwR0CUTWDpBpzIEdL0npqlwP5n3FdwiUugpyIgc
	00tUnGdZMFsteByXWiXI6E1ynbmdW5KABm6EWF/BSQyUxP3JggKbBjThWu8gYmEGjneZLSHcUHNeM
	fBkyqx0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9p1s-0016yt-0B;
	Sun, 03 Dec 2023 16:09:12 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9p1n-0016tn-2m
	for linux-riscv@lists.infradead.org;
	Sun, 03 Dec 2023 16:09:10 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AC90340331
	for <linux-riscv@lists.infradead.org>; Sun,  3 Dec 2023 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701619742;
	bh=Jr2viQE+KNXdoLwjt3YG8fOnB+WKPmtD8qV0RS5wcNE=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SIihe6oh8Pdg/qzj6ZLeulNjUKAEY45iD1C8Y/jpN0FxCuX2ETt716dOAsORS97Ps
	 a1uf5lM6VcCn9E3oVhMu3fhyhiJoboAgpsYExq/KQ1nen2N2S2YBLFhB83zxkIU1CK
	 NOuOLsUnPeBl38U95GCTX6PFtCoemsqw5vqvrTuu/jA/KhEPlJzN1gajiNmlTjv0U8
	 u3Trk+aLtJqeB06EsxkASd43Gvn4I9M7EJA/5cGmVqR3nzEvAcOsU1sNOOeeoWcG3A
	 EBWgsHEffQaZKUgWyZiEAxUMPB2dTWVyHbhEyzpInhAZ9FupqVZ0GvAeriyVzjlF1T
	 Udb7SW279X9bQ==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-423e0957b35so53063981cf.2
        for <linux-riscv@lists.infradead.org>; Sun, 03 Dec 2023 08:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701619741; x=1702224541;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jr2viQE+KNXdoLwjt3YG8fOnB+WKPmtD8qV0RS5wcNE=;
        b=AUgmlWh6SKZpZ9Ul5uunlJ23ttqfHVbdrqIp02sjZAdChA/0ANdrr0M+yPgtUsom5S
         hej8xmOIXYxBq54Sp0hA9KO5ULz41dmnyr7qoyLyH7LDSYRK4IiiYp2REj57dNjX+KSh
         BWtvkGKfhB0yPZZwyKtYDToEjqQXz4n7zz/fvj0vxaiQ8b7C4vuzSN1bJ3Chevkd2Wkx
         vbRuHrL3NAdFe84QdRV08L7BhdaihwRZOo1VSXsu9foF1+QkirrLCdD+neRP18HQIAee
         g8saiolOD1XWu8+2wEEgaIg3tr/rn0UwialBIx3BMqnLjhsHriIvK8PuK48QwynsJTU2
         BVZg==
X-Gm-Message-State: AOJu0YykIghqr93IPWwmBGojShAFd4M1o4Deo8TQzLjCvnw7Tjdatym2
	rh08ZcIcDjvXqFPsYoV5ZYFkNWQQ8iiLLlcSAXuuIzrP9bGvlsrFXIEj9rnJrZs7mwfaM6TX6lY
	AxRbtum/aZn1jxVsxfYjw3gvF+780yM13xnn3u9gowepShi1Ou7HOhDXDX/2CFg==
X-Received: by 2002:a05:622a:1010:b0:425:4043:1db6 with SMTP id d16-20020a05622a101000b0042540431db6mr4559530qte.137.1701619741640;
        Sun, 03 Dec 2023 08:09:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IElcjoXi0CImvP0OyCrnumGiuHmDr6BY0KTDzIC+pp9TQpbbFvQn54i+0pGeMyf5ZofZVoSlxlxQt+VbXqNHm4=
X-Received: by 2002:a05:622a:1010:b0:425:4043:1db6 with SMTP id
 d16-20020a05622a101000b0042540431db6mr4559513qte.137.1701619741411; Sun, 03
 Dec 2023 08:09:01 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 3 Dec 2023 08:09:01 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231203-mountable-snowsuit-24e4252c9eb5@spud>
References: <20231130-bobbing-valid-b97f26fe8edc@spud> <CAJM55Z9=smqcZ=su1oNdk1YZL_XdYAKrwtrZS7ScS=cAVmxZOA@mail.gmail.com>
 <20231203-mountable-snowsuit-24e4252c9eb5@spud>
Mime-Version: 1.0
Date: Sun, 3 Dec 2023 08:09:00 -0800
Message-ID: <CAJM55Z-cb=0X2xToKnEwmqMkBSZkQ-kjAZyoGo1AY=edTLvxew@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: move timebase-frequency to .dtsi
To: Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Walker Chen <walker.chen@starfivetech.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231203_080908_213663_9F02E2F4 
X-CRM114-Status: GOOD (  16.53  )
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

Conor Dooley wrote:
> On Fri, Dec 01, 2023 at 02:44:58PM +0100, Emil Renner Berthing wrote:
> > Conor Dooley wrote:
> > > From: Conor Dooley <conor.dooley@microchip.com>
> > >
> > > Properties fixed by the SoC should be defined in the $soc.dtsi, and the
> > > timebase-frequency is not sourced directly from an off-chip oscillator.
> >
> > Yes, according to the JH7100 docs[1] the mtime register is sourced from the
> > osc_sys external oscillator through u74rtc_toggle. However I haven't yet found
> > a place in the docs that describe where that clock is divided by 4 to get
> > 6.25MHz from the 25MHz.
> >
> > I expect the JH7110 mtime is set up in a similar way, but haven't yet dug into
> > the available documentation.
>
> Your other reply suggests that this is a fixed division for the jh7110,
> in which case it makes sense to leave it as-is. mpfs is different in
> that it is fixed to 1 MHz regardless of which of the permitted external
> oscillator frequencies you use.

This is what I've found for the JH7100:

osc_sys (25MHz) -> u74rtc_toggle (gate) -> ? (div 4) -> mtime

The divide by 4 is not in the regular clock tree, so if it is configurable it
must be some bits hidden in the syscon area or something. The only restriction
I've found in the docs is that it must be strictly less than half the rate of
the core clock.

For the JH7110 it goes:

osc (24MHz) -> rtc_toggle (div N) -> mtime

..where N defaults to 6 and this is also the maximum N.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
