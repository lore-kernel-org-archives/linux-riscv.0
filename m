Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F220AC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 21:27:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C362E2070D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 21:27:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bmli0Ys3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="g3nxTJSL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C362E2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYt+q4lsXZ1m/RO/DfKR9eg9UOPr0lbN8wXhl3QUjXo=; b=Bmli0Ys3uUJbyO
	qr9ATRjmTOIYbADJg8gOZE8v8bLEvN9ofdyWSK0PG2Rnz+wAbPXm+wLlgDACF+0zQLpLGGfJC3ils
	PXkxBVAl/R1BLD+jtr86VCmB/Xqc41bBFqf8B7xKxxZOBKsgsMFLcvw6DBSzPfyJOu1rTBtoCk37Q
	QZWYkWD/216sNd/fjvF0ODkCTDbz34fv2wbqXouj4/pg5Oo0UzpqboScrV/Dd2M1bHdiuXGbvxbb8
	qLWE/aNSBjtBD8xLSyvp/HLpN25ZaVSivACDNk9Oo6XWbqgY+0tQF329CTp4bnxDQVJarqjmsISZz
	TRecTKIZAz13hrg1+qAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8X7U-000248-FU; Mon, 25 Mar 2019 21:27:00 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8X7S-000238-0Z
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 21:26:59 +0000
Received: by mail-pg1-x541.google.com with SMTP id i2so7177289pgj.11
 for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2019 14:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=F6eHozPPrDy+9MhKhEeFODU05GUZcOzCOEIshvHqp0U=;
 b=g3nxTJSLig5h9ol2DHrHg/hiRutXrDsxPj0FFoQ2rPTnEtKBxSQhA5zZ4lxGviRD45
 QGWi/QmuAS6ItBsb7WeYLP3SjkHrJ9LhV1xh8RUdxpAmtWAqXZ8Tue1vPoNVmATbdgjm
 jQ+Mvms/roeekMt4OQb2G3OCxIUri44wMmOCj8cF+lVkXG8K3TYTOdyNqe3q9XLvkyH7
 +Af4zdKLTJU8NHYxDphrnkCcJNx4W3HRlI2uo9jGj1FXk3FLGr1VQjw03vDkslFffv9D
 Hf34K3REDNym5BTw2sw5AIE7eM0aDuUeFbfZuFFpvkJshPh5XylJXbx6IpYjjiNnBSA/
 jAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=F6eHozPPrDy+9MhKhEeFODU05GUZcOzCOEIshvHqp0U=;
 b=JWw/goffc+J4lJJFxt07+63sz8id68MZ12WEjxsNRTQXQD1ZFh6kiyQuPN7D5RLWc+
 hXY8XWTYml3oLuTcyh5cdTPOy/orXZILb/L0XofAAFfIRWnQvrxDebLHYzKY4imrNz1K
 ATk5YnGvRJtoR+0qo3McwDR1XVdlEzmYBi/kt35KEEPLoAIai8DTzRDuADnSau3tfViX
 7tTwapRRywHOQ4pHDnLyigSxGHKEDwZ31NagAQR9X9vX/1oYGL3SGhNBBW/yF6GMnb8Q
 fvrvYOkITF2Y35Nj95M6ECqLFNJkbW4YnYE2YAn8u3TQ2pAk3RNb1lwfJydJthztH1hn
 HNOA==
X-Gm-Message-State: APjAAAVtpUY9Myi7u6njPVye0BHvPpZkWYlEJLwIbRen3ORwrvmWLvcX
 TAA1pwxarusn9KJRPT/CXzDrMA==
X-Google-Smtp-Source: APXvYqz/ru3+hE2pBm6MANXiSA8+rV1nwi78KDf5w6HoOuJ3zwb8ayLpOBXy4XAugDeOr5cb7id9pg==
X-Received: by 2002:a63:4750:: with SMTP id w16mr25932558pgk.256.1553549213939; 
 Mon, 25 Mar 2019 14:26:53 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a3sm7591304pfn.182.2019.03.25.14.26.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 25 Mar 2019 14:26:52 -0700 (PDT)
Date: Mon, 25 Mar 2019 14:26:52 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
In-Reply-To: <20190325065737.GD12016@zn.tnic>
Message-ID: <alpine.DEB.2.21.9999.1903251418440.8028@viisi.sifive.com>
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
 <alpine.DEB.2.21.9999.1903241558210.8028@viisi.sifive.com>
 <20190325065737.GD12016@zn.tnic>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_142658_059853_E52F56B9 
X-CRM114-Status: GOOD (  13.82  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 25 Mar 2019, Borislav Petkov wrote:

> On Sun, Mar 24, 2019 at 05:23:27PM -0700, Paul Walmsley wrote:
> > > +	if (!IS_ENABLED(CONFIG_EDAC_DEBUG))
> > > +		return;
> > 
> > Can all of these debugfs functions be wrapped with an #if ... #endif such 
> > that, if CONFIG_EDAC_DEBUG is not set, they will all be stripped out by 
> > the preprocessor?
> 
> Why would you make the code more ugly with ifdeffery?
> 
> Do you have any serious code size constraints so that you absolutely
> need to remove a couple of KBs?

We'll definitely take the RAM savings that a few #ifdefs will deliver to 
us.  They add up.  We're selling chips for embedded use cases, not just 
big-iron x86 systems.

Other EDAC drivers have far more #ifdef lines than the single set that I'm 
proposing, so I don't understand why you're singling this driver out for 
criticism.  Consider:

./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_L2C
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_OCRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_OCRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_L2C
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_ETHERNET
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_NAND
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_DMA
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_USB
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_QSPI
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDMMC
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_L2C
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_OCRAM
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_ETHERNET
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_NAND
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_DMA
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_USB
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_QSPI
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDMMC
./altera_edac.c:#ifdef CONFIG_EDAC_ALTERA_SDRAM
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG
./synopsys_edac.c:#ifdef CONFIG_EDAC_DEBUG


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
