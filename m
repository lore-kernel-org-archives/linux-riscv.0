Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E106CF6491
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PENonW7HcYhQQg8Qyk1q1eGebjgDmwiFvQkhrDeQjbk=; b=h39wkg+VyIglKZ
	HdgNgpxHTg2/jhC16QP2ewZZTtOzu+NqKgOi99TZhgGhpc1wgA9vBDTdIkPnDuP5dSG7KOaWu17CR
	prqlNI7krM/c9vcYssVEO/dvr3kre009vNSFmDbXmv4d/cFv8yxZjhlvljkuP+VkZy8DoLxEJQY11
	BW/nhLjWPD2SRdUx1z233KhcDkVIHUo/+BJUEf/j2uZG60F9jy1EgJiU5yV5OcYKr3Aq4C9zas1Y9
	m47Ol76j1UbZREzrcbf4ZVc+prUSBvtrt6aAFY5oVClOZyP9BSoWAIW6wLbAtJmi5bXryPbod16J9
	DnRGwnWKqsFIxVkJ+tRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sueLP-0000000Dc1o-2Eyy;
	Sat, 28 Sep 2024 20:47:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sueKB-0000000Dbuk-2wD8
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 20:45:58 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2068acc8b98so34639715ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 13:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727556355; x=1728161155; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B1wN4Mv6KTR3klc618UZyJIvaPfyrd+I69sEqUZILgs=;
        b=gmlYAJsCwFkcPlmhrESDgHE1eaZoUJtULwCEx7tzHG7WIVEB92ftcKJDlknSe6OEgP
         DAO2Ehn7q2xHHVIDiSg2KWITBAeXs37qugddiMqzyKzTFe6Yz1wuCyujZEAK63/K0KDg
         cBIUBN3bCJsJzbIXIz3RDNM4GFtxPKrzfzzqEpcOXEOUPJudxX9eP9jagE+wsiMA/wyL
         LE4+dug0uhzgIf91y1Xg9RDjMLZTUwZvHP0QyBkhDiwSj8CGbNxPeNUFUqpqrkNjmFkm
         huDQ1OSzMc0L3am9lg11LKDngDeIwX/dIw7n+4gkLeVp81uCkqc0uazLB43hEf1qX43i
         QF5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727556355; x=1728161155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B1wN4Mv6KTR3klc618UZyJIvaPfyrd+I69sEqUZILgs=;
        b=Y7fIKTNGEVEl+v8MUEY8oxpkkb5+AAtp/EnN7/C7xBMx6iGjnx6M5gtbv9I2gmbLj9
         pRJywcauDyOZogBrpJ2Xb3Q6zu3SFOoYWmNrYjMtrSDr3rvRRmufQhl31kn3af/S/bmj
         0RoeKCS8kAKoQQvxJIa7P/R2O8QGfIdPQBYFg5NeXuF5CF9mIBagUFO7wBXx7xRNgbcO
         WezVm5sM6Oq0+9SHfBUTxubBpz9QXfaGn932YOyYwyV1ScF2cY++WGPrPHOWnecSoSi/
         yn6GK4Rx8YADvzu0k3K1A/Ra7l4tlwQrL6Hxp/p8w6PvmuFXdanolwgb/rezQZLecF1k
         WUfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG8lQaVLYBd0EdGgtq/FtjyZBVZ4C/+1EmuBpHxukmdFsBemo73FkRa2YNQSTz/8SyP4r2DsKBQ39y0g==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzjt7N2YSgtQdEaZ5vD1DlQjkldNaRwOOiED4gHYl0G9BPpQTq
	g+v0lfieom57gDB/eh6ej1wcxgxx5RJX7quxz2UDA3FgusUEFPKFRLkB8A7HanI=
X-Google-Smtp-Source: AGHT+IHYe5C2dCeMbXLolGkdYVgGv6vaXYzm7QHCg36ZJ1QQJYHSFNwHxNkSM+iWKcxoee+lJlo/DA==
X-Received: by 2002:a17:902:c952:b0:20b:6a57:bf3a with SMTP id d9443c01a7336-20b6a57c137mr21788895ad.1.1727556354766;
        Sat, 28 Sep 2024 13:45:54 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e2f382sm30487635ad.182.2024.09.28.13.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 13:45:54 -0700 (PDT)
Date: Sat, 28 Sep 2024 13:45:52 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: Add TH1520 ethernet nodes
Message-ID: <ZvhrAFyfvj9mXuuV@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <CAJM55Z-FLmpFfisNpJi8FP7o_5mwoDa7r18VXW7u7nF0V6oiRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-FLmpFfisNpJi8FP7o_5mwoDa7r18VXW7u7nF0V6oiRw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_134555_769989_955F08F2 
X-CRM114-Status: GOOD (  16.12  )
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

On Fri, Sep 27, 2024 at 05:55:04AM -0700, Emil Renner Berthing wrote:
> Drew Fustini wrote:
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > [drew: change apb registers from syscon to second reg of gmac node]
> > [drew: add phy reset delay properties for beaglev ahead]
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++
> >  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 135 +++++++++++++++++++++
> >  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++++++
> >  3 files changed, 276 insertions(+)
> 
> ...
> 
> > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > index ca84bc2039ef..d9d2e1f4dc68 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > @@ -11,6 +11,11 @@ / {
> >  	model = "Sipeed Lichee Module 4A";
> >  	compatible = "sipeed,lichee-module-4a", "thead,th1520";
> >
> > +	aliases {
> > +		ethernet0 = &gmac0;
> > +		ethernet1 = &gmac1;
> > +	};
> > +
> >  	memory@0 {
> >  		device_type = "memory";
> >  		reg = <0x0 0x00000000 0x2 0x00000000>;
> > @@ -25,6 +30,16 @@ &osc_32k {
> >  	clock-frequency = <32768>;
> >  };
> >
> > +&dmac0 {
> > +	status = "okay";
> > +};
> > +
> > +&aogpio {
> > +	gpio-line-names = "", "", "",
> > +			  "GPIO00",
> > +			  "GPIO04";
> > +};
> > +
> 
> These GPIO line names does not belong in this patch. They should
> already be included in your other patchset adding the names for the
> other lines.
> 
> /Emil

Thanks, yeah, those sneaked in here.

Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
