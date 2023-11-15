Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753EEC2BB3F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 16:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68Xt/8GvO2V/S6uCS815bqo9grDDKo6uJtVbh33B8ms=; b=mORhBq3tWUeNJt
	QXFB0uZ8xDsGnFZX2d1Tu5npwNIVBoNKdvcAJ7MoIEK91+nh+fojYKCBsw7aDrOrpBiTlqbCDWzP8
	qlP0lVJO2eRTpa4eZkQJaEx0M008iL6OLkQk+SVe8JXP1lpf0UjrVL6K+TKaoLDQcYknIYMwqzKRX
	/O4Jj1Dw9B+Trb/99hhTDWORh4TOSX823GSvnOEQfDQQ7nfPXu3Va31cxa3B+cVOoW3R/MlnEBz1b
	Uc2UVpIg/5HojAiKaRaFvZOo/Aye4cyPGp8bxOjUKkf9Zbnin6UOq056RMH0dOjviTnmOLyNR0mxz
	H9F5sKWAUn2wRi8IPYvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3IMl-001HIm-0l;
	Wed, 15 Nov 2023 16:03:47 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3IMg-001HHe-2B
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 16:03:45 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-779fb118fe4so427166985a.2
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700064219; x=1700669019; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5tDYXry5Yt4gE435+5gScTv9ABMQHbckYhe3lM02emE=;
        b=wOfO1VtuNyOXoaOyHV+2yRAgrV+xMxJdNpgU/Me953cBRvaODECViIesfGGfTetTnt
         8hxSMe/tz93EoSare6LrIPSYF9zjdjhGhen9JePXdW+jW7KmvJ8TmFABteVUT2zIZ/ok
         fotdRmxAd/vJRA1NMzuYkzKCVHkSUmH7cwfLGsNXPH0VUuJqvC7TmZ6MFMPkJ4bnamkT
         1HGMCw9boZRyIKWdUf90lV89sxrLtvEC3yq4hbDz3HdJe7r/crtRumT0xQoqXpivT3a8
         P5VXpV67Xt086CyC0cmG0+b7BnbooVg5kRjchnepwmxflwSz0wtKhVK+3SlY0C0++iq0
         vUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700064219; x=1700669019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tDYXry5Yt4gE435+5gScTv9ABMQHbckYhe3lM02emE=;
        b=FfVaNDXVZOV4foxWFPvZA9kNDEGFabBst/TOeMBYHfiL+8XaI6zucxIAfIgcspv9mM
         twxBhcAyQjIOVaSDkm5vVcfCWGumY8wNnVQ3Q9LLA4toc/9qov4PLfdWV/SD+qFoHcZ6
         UNysDAtF2l49UBs9AXojNT6wEP5WwPQhMevbErykT2OjB3Ky0VzwaOt0KtjLQ0S/ko8Y
         qDTnXalzP47pFTu2PA8WYQHTpOdF+FDDe3jhYOr/T5P3COQ8/txx4wUFwupqj3hyU8eU
         wLY/VWWuDPYDSjOq+H+D3sbjKLo9G2PAykHqBQFwly9AZBnorYpXSDt6u+gL1kk3eyjP
         XEaQ==
X-Gm-Message-State: AOJu0Yz51cxX2T2m8KSz1HeYUiFJBCiKHb1fagroaGvKXbNslZfBiRLJ
	DsnX1sFUsHymNOWAPKoJzsPUiQ==
X-Google-Smtp-Source: AGHT+IF93JhWNlbYNdOEZtUE6mCjhq9mjRfXWGgqHnPrwHynLnLGWfpW+HW6XqPiTsquRivLQ2yAuw==
X-Received: by 2002:a05:620a:3aca:b0:77a:35f:61fc with SMTP id ss10-20020a05620a3aca00b0077a035f61fcmr4931758qkn.24.1700064219254;
        Wed, 15 Nov 2023 08:03:39 -0800 (PST)
Received: from x1 ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id f5-20020ac84985000000b0041815bcea29sm3614057qtq.19.2023.11.15.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:03:38 -0800 (PST)
Date: Wed, 15 Nov 2023 11:03:37 -0500
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
Message-ID: <ZVTr2VaZPvE45zP1@x1>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
 <20231114-th1520-mmc-v6-5-3273c661a571@baylibre.com>
 <20231114-starring-swarm-0e1b641f888c@squawk>
 <ZVP1AoosripWj3gs@x1>
 <ZVTiFVHSsBxk3pLH@xhacker>
 <ZVTi3lvSQEXeTbUN@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZVTi3lvSQEXeTbUN@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_080342_892635_75335DEA 
X-CRM114-Status: GOOD (  23.40  )
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

On Wed, Nov 15, 2023 at 11:25:18PM +0800, Jisheng Zhang wrote:
> On Wed, Nov 15, 2023 at 11:22:03PM +0800, Jisheng Zhang wrote:
> > On Tue, Nov 14, 2023 at 05:30:26PM -0500, Drew Fustini wrote:
> > > On Tue, Nov 14, 2023 at 09:27:44PM +0000, Conor Dooley wrote:
> > > > On Tue, Nov 14, 2023 at 04:07:59PM -0500, Drew Fustini wrote:
> > > > 
> > > > > +	sdhci_clk: sdhci-clock {
> > > > > +		compatible = "fixed-clock";
> > > > > +		clock-frequency = <198000000>;
> > > > > +		clock-output-names = "sdhci_clk";
> > > > > +		#clock-cells = <0>;
> > > > > +	};
> > > > 
> > > > If only you had a clock driver to provide these...
> > > > 
> > > > Is someone working on a resubmission of the clock driver?
> > > 
> > > Yangtao Li posted an initial revision back [1] in May but I don't think
> > > there has been any follow up. It is for sure something we need to have
> > > in mainline so I'll take a look at getting that effort going again.
> > 
> > Hi Drew,
> > 
> > Based on Yangtao's version, I cooked an updated version in last
> > development window but still can't complete it and met some issues
> > which need the clk/pll register document.
> > IIRC, the document was released a few days ago before soc tree frozen.
> > 
> > It's nice if you can continue the effort! I'll read the sdhci driver
> > soon.
> 
> PS: I can send my updated version to you for reference tomorrow.

Thank you, that would be great!

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
