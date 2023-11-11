Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BCBC4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Nov 2023 00:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NW8GlLX2UO4ZqvxE0TratbNP0bA6fB+QBRqcP7ad/XU=; b=rkIjjvtPocEdm/
	YDskI714fa2y4/aQxe3IMQuL/2vlT+g3XiwZq6gV2dB/Jw7dfKCfOoSygHUhROHIk/KqcYX/z+K5p
	X2Rcjnk05J8KohoNhk2STNA5mUbJeVYZrbCmq+QkxgJ+cDRpyfhDsgmrFObdugBPCMqCj37aABvIo
	TKJcYzGL1zA4EAwYxUGEySpSWJM9hzzDW/F0MeRzPigtRu6KuYz3Ea1OLAzH/QpkyW9O3Atju4HMK
	3x5KvQg/rIE1uS9ShD5D3dwovYMukfZj5dQMqibIaXyCHfgXduddoH4JjJZueONBUGOXm45PfePyt
	VDtgEHFu2L1DpwQ7hMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bXX-009grm-34;
	Sat, 11 Nov 2023 00:07:55 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1bXT-009gr5-0R
	for linux-riscv@lists.infradead.org;
	Sat, 11 Nov 2023 00:07:53 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5bdf5a025c1so1952799a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Nov 2023 16:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699661268; x=1700266068; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oZOLx6piJ84WzMT/cgtNzYXyAwxaq83dr7vI8k16AOs=;
        b=tkknYGsjCCAuGoow12tqa6rORCHo51TRaORvnMdtBHrwxwjn0LG2GJzieR059OUXkj
         PygO3Tm2hHsRomfSccWyKQnMePITOP53zRovq6i+12jU62xNrTm3T7IagkWsi7GXlfLU
         1rl9wo5Jo22NQStJ2zmiCBvxQ8FMt+UZjgfemIyinAiBDkFMNRQQgVRDQe473ly5+eX9
         zhCWOZZ7uIgLhrwQ4/QvKk6AEQ+2fkcjUVbC+/iE6Sej8bpt2dEaeQwSTng9PVb71soA
         WF3IQvWO9Mocmd/iruefbGiJ7nkURe0zaqeYoukdniz2wai9tiTxub/3qzUcAT44X5B5
         rAHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699661268; x=1700266068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZOLx6piJ84WzMT/cgtNzYXyAwxaq83dr7vI8k16AOs=;
        b=GrTnyByvPnuAnS30P6w7C0fMKfdReDZqrPL7jsU4FhETgHwOEMLLRxr3h+l6YJUuUL
         gLM2/WNG7XoIUWYmrBGW5tXj3KjqQVgpzU9rbN62dDPx5Zx36Q8GhC+Wpq3KROYY/bpn
         da/YXmnJOShdU0ImchOGD5x+hieJLngdyNp7YSfz1/AjW5b4ANaMDIUQOHn/+GLxXSYl
         Xzi9jfNLh1U1dHv2YcjIhnnpJ2U+8F3f0VbmjioHCKLWGHTbeSMwZOBjmlNGXUIRFfs4
         EMo91hVjaMHhVsbHmmCDrXVOSfrBkYkOzoZuPW+Dwq1KO57M3KkB98Gn71OODtyjD9Qr
         XUGA==
X-Gm-Message-State: AOJu0YzPX7lpxt18VeauCnuP+XyZRFGmEpBjFgUSohDPBwSh0CliF5kl
	EF1ZznyiCNqNtrhqLtHJvZpiHw==
X-Google-Smtp-Source: AGHT+IEf3RnQ6vghHFIDkcaI3xfo22n0ICD/Y7dXSaL4pgL+HjLTqobf8F4Ab5nqLI350QpkYuW/Ow==
X-Received: by 2002:a05:6a20:daa3:b0:14e:a1f0:a8ea with SMTP id iy35-20020a056a20daa300b0014ea1f0a8eamr792191pzb.3.1699661267932;
        Fri, 10 Nov 2023 16:07:47 -0800 (PST)
Received: from x1 ([2601:1c2:1800:f680:e564:eb78:dbd8:6618])
        by smtp.gmail.com with ESMTPSA id p47-20020a056a0026ef00b00692754580f0sm272439pfw.187.2023.11.10.16.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 16:07:47 -0800 (PST)
Date: Fri, 10 Nov 2023 16:07:45 -0800
From: Drew Fustini <dfustini@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 5/7] riscv: dts: thead: Add TH1520 mmc controllers and
 sdhci clock
Message-ID: <ZU7F0d+MCefRskPn@x1>
References: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
 <20231109-th1520-mmc-v5-5-018bd039cf17@baylibre.com>
 <4cf3d481-c16d-4b1c-ab45-3ceff80b0b1b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4cf3d481-c16d-4b1c-ab45-3ceff80b0b1b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_160751_359619_1C39B11D 
X-CRM114-Status: GOOD (  17.36  )
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

On Fri, Nov 10, 2023 at 12:10:34PM +0100, Krzysztof Kozlowski wrote:
> On 10/11/2023 06:41, Drew Fustini wrote:
> > Add node for the SDHCI fixed clock. Add mmc0 node for the first mmc
> > controller instance which is typically connected to the eMMC device.
> > Add mmc1 node for the second mmc controller instance which is typically
> > connected to microSD slot.
> > 
> > Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index ff364709a6df..f5ec9326c4b8 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -134,6 +134,13 @@ uart_sclk: uart-sclk-clock {
> >  		#clock-cells = <0>;
> >  	};
> >  
> > +	sdhci_clk: sdhci-clock {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <198000000>;
> > +		clock-output-names = "sdhci_clk";
> > +		#clock-cells = <0>;
> > +	};
> > +
> >  	soc {
> >  		compatible = "simple-bus";
> >  		interrupt-parent = <&plic>;
> > @@ -292,6 +299,22 @@ dmac0: dma-controller@ffefc00000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		mmc0: mmc@ffe7080000 {
> > +			compatible = "thead,th1520-dwcmshc";
> > +			reg = <0xff 0xe7080000 0x0 0x10000>;
> > +			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&sdhci_clk>;
> > +			clock-names = "core";
> 
> You miss disable in each mmc node.
> 
> Best regards,
> Krzysztof

Thank you for reviewing. I will add 'status = "disabled"' to each node.

Drew
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
