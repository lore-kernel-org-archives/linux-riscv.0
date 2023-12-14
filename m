Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9B4C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9wMhKA0fJztWzkiJ+gy+0OMm8TUrrnghK9lvbTIoRds=; b=NOk5NtwzhGKp/i
	8V1jmLctvYwTLvkgLyLvrKHkd8q1R8MsfDrhoMkVs/dCZaLF/gjZArxti09BUqtBT3t/8wfHLH/5B
	Lm3ACCFI6BYAJWo6Jb2BIyGEIc8UDMxv1foo1o7+RTFBMuYshNjVK5Lc7w+rbPFCOuCZXJKInIEjD
	AJULN1AeHBl7bg7CedKp0cg9lI2CtqudVxovkg/0NtIAu9bTANITgmHia6CUTfM0ttONPAQQCapHu
	dfCP95ZjGGfaItY7hYs9V9D8g0TkhEWFqNb6u9NaBvsFi5ETyoXCpg+ufA37FHKl//NjLCo5gQUS0
	UgOkg5tv09cktsUusWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDoi1-000pFq-23;
	Thu, 14 Dec 2023 16:37:13 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDohx-000pCv-2l;
	Thu, 14 Dec 2023 16:37:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3363eba94ebso1509403f8f.3;
        Thu, 14 Dec 2023 08:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702571821; x=1703176621; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TcCiI3TQ8gopQV9tnMaS9uQNfvMYnRZBR7pxWDWkr/8=;
        b=RxAIOU028/zLjyqfNLQhCLrVVyOfqpC1ez8PqsfwP793PMorlDL3M1lScaUR8ZWAti
         /u00UgZtpqo+UsRuBoho/Bs7+z0HJ13j4TvhDx4bBc3QzXde7xRItqyoM15vEzCO1CPl
         4bAPNUgiCT+qhj5DfrOWrfFV6wYX7wPssye5dhiBf/iom20wnMWt271wgp7Kdnwjuhj1
         1EOaOPFJFxMRM1WYAF1NqKqdFF54uhVDGGfXlkRi6HtL3gYgkPyoK1dWJXi+QjGbxVNF
         ZqXl+bsN+z3gEXpV5HfdqCnvKSIAFwd8l5RQI/4qXmDeDoMlM3tikJ/04VCzKSerGSQo
         Ee/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571821; x=1703176621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TcCiI3TQ8gopQV9tnMaS9uQNfvMYnRZBR7pxWDWkr/8=;
        b=THv1VaRFPbIv2s0JiCUX9A2Nx/6iMITDhOTG8LBqwstJ//J20tEpbbcjvtKFtRWiEf
         Znh6eJdWJ20CX4cImp/k9MkAvK5hm+Oy0K6BsZYOMA3rfHWP/XDMd76Msmo7ACcRFyBm
         +8ZgaEBSRZ/WlUc2s/aCbMEOMuW+WSfj3A2p/a6KARmv3VJJWpb4VY6fPu3jJWxiCyyk
         pbO/UqlWTPHpCCJQP99m9Qv43aE0Jht8c91Q/Ni6JTIdyRY8peWHGkNWclGn/uTQEbWH
         4uXaW2hI7O5RfYKHw4vW7aDWVQF5OkN/8Xz58DMM+K8zBmm4lJNUBPt8AyXP2mQyF9sZ
         dypg==
X-Gm-Message-State: AOJu0Yz2vXM+C6WDUWLh1Ppi4AmIcr+E1QeV4Vr5GUhlQ7pkhQqmCnmy
	zwlKE6hsyVhfTqosgC92XKM=
X-Google-Smtp-Source: AGHT+IF7IW71yfGUG4q0bOw/8YVkeH6lRc27QSTBg3suiLoVsXi8oVaj5T3bf+/+et/gNTlQqLCjlA==
X-Received: by 2002:a05:600c:1819:b0:40c:3630:264b with SMTP id n25-20020a05600c181900b0040c3630264bmr1912250wmp.249.1702571820876;
        Thu, 14 Dec 2023 08:37:00 -0800 (PST)
Received: from archlinux.localnet (82-149-12-148.dynamic.telemach.net. [82.149.12.148])
        by smtp.gmail.com with ESMTPSA id m29-20020a05600c3b1d00b0040b3515cdf8sm25400470wms.7.2023.12.14.08.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 08:37:00 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>, Conor Dooley <conor@kernel.org>
Cc: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 1/5] riscv: dts: allwinner: Update opp table to allow CPU
 frequency scaling
Date: Thu, 14 Dec 2023 17:36:59 +0100
Message-ID: <2177637.Mh6RI2rZIc@archlinux>
In-Reply-To: <20231214-junkyard-corset-d35b01bad69f@spud>
References: <20231214103342.30775-1-fusibrandon13@gmail.com>
 <20231214111446.camz2krqanaieybh@vireshk-i7>
 <20231214-junkyard-corset-d35b01bad69f@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_083709_892606_1A031A15 
X-CRM114-Status: GOOD (  29.12  )
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

On Thursday, December 14, 2023 2:47:14 PM CET Conor Dooley wrote:
> On Thu, Dec 14, 2023 at 04:44:46PM +0530, Viresh Kumar wrote:
> > On 14-12-23, 11:33, Brandon Cheo Fusi wrote:
> > > Two OPPs are currently defined for the D1/D1s; one at 408MHz and
> > > another at 1.08GHz. Switching between these can be done with the
> > > "sun50i-cpufreq-nvmem" driver. This patch populates the opp table
> > > appropriately, with inspiration from
> > > https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi
> > > 
> > > The supply voltages are PWM-controlled, but support for that IP
> > > is still in the works. So stick to a fixed 0.9V vdd-cpu supply,
> > > which seems to be the default on most D1 boards.
> > > 
> > > Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> > > ---
> > >  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
> > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > index 64c3c2e6c..e211fe4c7 100644
> > > --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> > > @@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
> > >  	};
> > >  
> > >  	opp_table_cpu: opp-table-cpu {
> > > -		compatible = "operating-points-v2";
> > > +		compatible = "allwinner,sun20i-d1-operating-points",
> > 
> > I don't think you should add a new compatible for every SoC that needs
> > to be supported by a DT bindings and cpufreq driver. Maybe you should
> > just reuse "allwinner,sun50i-h6-operating-points" and it will work
> > fine for you ?
> > 
> > Rob ?
> 
> The driver can definitely just reuse sun50i-h6, but the binding and
> devicetree should have a soc-specific compatible for the sun20i-d1.

Correct. This is to avoid later regrets if it turns out there are some slight
differences or additional functionality.

Best regards,
Jernej

> 
> That said, the compatible does need to be documented, there's a
> dt-bindings patch missing from this series.
> 
> Cheers,
> Conor.





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
