Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206E1CD343F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 17:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGTjcyO0TABkDRGNx5BmkxppGu19X32tVIVsRp4N2WA=; b=Pw29lgmVz0QaK6
	GpycwHsb1qNNQJrskmWNnPKzY6n8GhTXuQ8gdCw39hG96r14cmpcKkcJR/X0EvwDfwbew6zXx0RHQ
	jj4rXsyBvjtGZRfPxIq+fig6RwlqSsxZo7IdTEAy3+Ln6Zf2eHrlMbKtQeKL5y2kFUcO1MeZ+HkVl
	1zLMv/p3YwkWP3EhXkmMrLn4YxbHuzGBpRMznu2K5lotzACT5vaDHYzA6oVnWXhbq3kdXlUiD+el3
	8fiLemWLq8zdHQnAGBjOhj1xhgMmPrAZ7LU5sYKlt3qDKM6jDgOoa2CD+ZqGhO69ZsqreBi+m1uMr
	hyqGQwn7uhPNuCWfZOTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqW3-0000000HTPu-0neD;
	Tue, 12 May 2026 17:03:31 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqW0-0000000HTOA-1sAI
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 17:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=RfeqH0Cmtp9+NntQslpQpPTwstKhK8P2xes8sXl5U3A=; b=EXQuzNNUQOE0CyKC4fgiohPMr9
	5DW2Av4OA+aPD5gm2ohSXn7eG74vsAUQnnQx5u2jvNxIpBNWUpsyIUT2wBfy8kMuAQMCyEiw7nEXF
	eUT5lbnnjDapMElGn26Qvo9rjzzZPxzjX3wbT5BXG8qOxlhzdEcbVo0ZMwA+kR9F5ZgVs0mYcIltS
	Ii7h0lrkHK3HG9pYlmkqSjNe+nDRmTS1CWMOMAU+lKdWokxxNbPYY7u/s8ABeV/SCFKyIjnkKkY41
	b/DVIjT7flr3TBpjihDhl9P++1OKmeDcgpPsWp2WKoIz9kDcesy6Ype9nFQauBvgHWT7Wd5UG+p45
	MBhOwX6A==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wMqVj-00000004u8d-1Kjt;
	Tue, 12 May 2026 19:03:11 +0200
Date: Tue, 12 May 2026 19:03:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	Margherita Milani <margherita.milani@amarulasolutions.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v9 7/8] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
Message-ID: <agNdTiFbwtllEw0Z@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>,
	Iker Pedrosa <ikerpedrosam@gmail.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-riscv@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
	Margherita Milani <margherita.milani@amarulasolutions.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Paul Walmsley <pjw@kernel.org>, spacemit@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
 <20260511-orangepi-sd-card-uhs-v9-7-ae48c0b2b2cf@gmail.com>
 <20260512054358-GKE3624147@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512054358-GKE3624147@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100328_494650_C5DCA827 
X-CRM114-Status: GOOD (  22.79  )
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

Hi Yixun,

On 2026-05-12 05:43, Yixun Lan wrote:
> Hi Iker,
> 
> Please note, once you are sending new patch series, please drop patch 1-4
> which already picked by Ulf, but keep increase the version number
> 
> 
> On 10:54 Mon 11 May     , Iker Pedrosa wrote:
> > Add complete SD card controller support with UHS high-speed modes.
> > 
> > - Enable sdhci0 controller with 4-bit bus width
> > - Configure card detect GPIO with inversion
> > - Connect vmmc-supply to buck4 for 3.3V card power
> > - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> > - Add dual pinctrl states for voltage-dependent pin configuration
> > - Support UHS-I SDR25, SDR50, and SDR104 modes
> > 
> > This enables full SD card functionality including high-speed UHS modes
> > for improved performance.
> > 
> > Suggested-by: Anand Moon <linux.amoon@gmail.com>
> > Tested-by: Anand Moon <linux.amoon@gmail.com>
> > Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>
> > Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > index e20daa50a152..8fea6e87acec 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > @@ -221,7 +221,7 @@ buck3_1v8: buck3 {
> >  				regulator-always-on;
> >  			};
> >  
> > -			buck4 {
> > +			buck4: buck4 {
> >  				regulator-min-microvolt = <500000>;
> >  				regulator-max-microvolt = <3300000>;
> >  				regulator-ramp-delay = <5000>;
> > @@ -242,7 +242,7 @@ buck6 {
> >  				regulator-always-on;
> >  			};
> >  
> > -			aldo1 {
> > +			aldo1: aldo1 {
> >  				regulator-min-microvolt = <500000>;
> >  				regulator-max-microvolt = <3400000>;
> >  				regulator-boot-on;
> > @@ -374,3 +374,21 @@ hub_3_0: hub@2 {
> >  		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >  	};
> >  };
> > +
> > +&sdhci0 {
> I'd suggest to add alias (to 'aliases' node), so we will have stable
> dev node regardless whichever device probe first.. something should like
> 	aliases {
> 		..
> 		mmc0 = &emmc;
> 		mmc1 = &sdhci0;
> 		..
> 	}
> 
> So, how about let's make it convention here, first device is emmc, second
> is SD card, third is sdio device (haven't added yet).. We introduced emmc
> early before this patch, so it stays unchanged which is nice for end user
> 
> Please apply this alias idea to all boards although I only comment in this
> patch..

Having a stable naming is definitely a good idea.

What about boards that have no or optional emmc, like the Milk-V Jupiter 
board? I plan to submit a patch for it, so I wonder if we still number 
the SD card as mmc1 even if there is no emmc.

Thanks
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
