Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D574ECDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wd6FPLTyZKxRFLjc2M8UE00Rinzqyk9gO3UvkuVTf+8=; b=RTpo8D3T0FQvWq
	qCJowp0oE6+ex1E4eXRYJhMRx8t/1l7Pq9c3PGK+vnE0buS4h/cAJL3K6l9ZWcgsfqkO6WzNXb4wd
	M6WD6O7f8+XSMYUHFmNY9LZ0F5mBVWHEZzVvveOZj+XyAvB550YTJ4IkRpCNAQHgBv0gatmGGwBYo
	Xjx5QxmRr+mUZwWjykGKnWPMG5UNCUuz5/viXGOENw18s3nuNDcfOHkOxUVhxLl8EQ3TZqRUibgGt
	Yo2R7ko/Oxi9T2qkKdFRJ0MGheFxlI82N5CzjaEYlg3dDeqBa1Hr3GLEQ88UYGaqr4brrfhGZwc2P
	J86IiYbUv3mg5yIZAv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtApm-00FOLP-07;
	Wed, 18 Oct 2023 17:59:54 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAph-00FOJg-2B
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:59:52 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c9fa869a63so35323015ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697651987; x=1698256787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KIX8roHs6Y2xfB0yyrc9fz1uKsUCw1ugcleeV2Jgmg8=;
        b=TABjAE5KUvKTbg4EDLNYIt7d4MAqyIEfgX6AJa2Q5kQyVztG0OiEatxXQMVq7+bgtp
         IzWZTRlD68yvXXXhqPgQK7JbKz/zQ0+IEAmjb+kwYGTOxQzOVZi/g9HStFT7FsQBe0Qp
         FID1w/18EYYnmYp40JHw2QWUgGDYLjgn+TYkawtj8tcNJgvNkyBw3Rowkj+z5i6HvEe3
         N3RtYN+8dlBEG46KbRTpmPsblQIKc47jpw0gUmQyo+qrW5vokjOowboGxX9317IcN+6w
         SfGm2CbO6hPbasC70WzU4/XnPdR6PvxD7dUfs810Nseix0Xe6hHhi8dNTXiT0Gac8Swr
         +JBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697651987; x=1698256787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIX8roHs6Y2xfB0yyrc9fz1uKsUCw1ugcleeV2Jgmg8=;
        b=toHZu4Qi6lYOuZ24Utrl4EfBhl7zTocj7JC87AMD+ppfEOJdqH6jiUDjUtOlqglLBc
         c0tb2OyJbpxFhcc/5Tz6Q+STswWhJMD+8NdEfwM5CWcSSQ8jHlX6rJghauOuwP+0fg2P
         /VrRdBAE//QWsd5ywzPuVqCkzlLvgV4oDbXasssg1Fa7qcrqjzqWOZqUZABSYGTds4O+
         WVk6GTcImVepcLoL3IgoLKDtQS06AlLJLLyq7AmFvw9yRu/B4MvNAyEVKUeyqpg1GhYb
         fJrjwLoQFm0mdb90oLrCCeTTuONaF3WlUrDwYbMwGZBVYflUo8UjRw6PKHkSdUjS6Ccg
         AxHA==
X-Gm-Message-State: AOJu0YxSLRYzdnthmrpmcO7ctjkaRa24KUNvkqB2+xJ1zVplQIhJSZae
	0eKBdxWCMGJ62H6gjqcBURPfzw==
X-Google-Smtp-Source: AGHT+IFuRZYdlOYu8jcYT7a+dm4yo2n/AMX0UeXuajz4t3w2UbaA9ylak4iJyUvNX3BWgaHQgHTx6Q==
X-Received: by 2002:a17:903:1110:b0:1c8:9832:827f with SMTP id n16-20020a170903111000b001c89832827fmr102594plh.20.1697651986953;
        Wed, 18 Oct 2023 10:59:46 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:3b92:d9c:239b:cd56])
        by smtp.gmail.com with ESMTPSA id d9-20020a170902cec900b001c5f7e06256sm214183plg.152.2023.10.18.10.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 10:59:46 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:59:43 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v2 6/7] riscv: dts: thead: Enable BeagleV Ahead eMMC
 controller
Message-ID: <ZTAdD/28PTNCWvWp@x1>
References: <20231017-th1520-mmc-v2-0-4678c8cc4048@baylibre.com>
 <20231017-th1520-mmc-v2-6-4678c8cc4048@baylibre.com>
 <20231018-dating-yogurt-d7f3a65a873e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231018-dating-yogurt-d7f3a65a873e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_105949_934890_4C4BC176 
X-CRM114-Status: GOOD (  17.66  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Xi Ruoyao <xry111@xry111.site>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Robert Nelson <robertcnelson@beagleboard.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 18, 2023 at 02:57:50PM +0100, Conor Dooley wrote:
> On Tue, Oct 17, 2023 at 01:43:52PM -0700, Drew Fustini wrote:
> > Add properties to the emmc node and enable it and set the frequency for
> > the sdhci clock.
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > index 70e8042c8304..bf55319ba950 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > @@ -52,6 +52,10 @@ &uart_sclk {
> >  	clock-frequency = <100000000>;
> >  };
> >  
> > +&sdhci_clk {
> > +	clock-frequency = <198000000>;
> > +};
> > +
> >  &dmac0 {
> >  	status = "okay";
> >  };
> > @@ -59,3 +63,13 @@ &dmac0 {
> >  &uart0 {
> >  	status = "okay";
> >  };
> > +
> > +&mmc0 {
> > +	bus-width = <8>;
> > +	max-frequency = <198000000>;
> > +	mmc-hs400-1_8v;
> > +	non-removable;
> > +	no-sdio;
> > +	no-sd;
> > +	status = "okay";
> > +};
> 
> Is this file meant to be in alphanumerical order?
> 

Good point, I should add the new nodes in alphabetical order.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
