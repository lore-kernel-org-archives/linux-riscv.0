Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB32CCFA05
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 11:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RFh6Ia7lIvBkatI1Ec2pcRwpJUZVBclr48BkUkPLs6c=; b=ydb3MWzct4r95C
	Em04PEZseuj75WPdLfDwf94I7yYdclUm2Uwo7rby5DOuO2C9nL+gew5OugAAAnBX9UQyCgJV2GAPd
	0heg8LxEbjaqDeTElZjsU2sDvX3REEUhSe7gNDQBWmknWrAwrbBjKsPLPceido6ZNip3pD/+jlvc2
	QjoZi57OMwxlhmoQBFMeZCS9tNIoJovwCp7ne9c56+zo0PXVwpWeivqbb1Polon8mQd9ijiiKF3el
	qlGF4gSXhcgPu7FtkfJuvkhp+jDJ5UFiidZExjigMw2aKoegqcz5+KHlpWlZ8Ig0Z8B0uJ/bqjVnG
	yHnQm5ZQ7U48Oh+c8sMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKaH-0000000HCfH-2rz0;
	Fri, 07 Nov 2025 11:24:49 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHKaF-0000000HCes-0kHK
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 11:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1762514669;
	bh=HGs0/L8ncOabUNWXYKXnKsQ79vn23oo0qvYbvXQ7sWs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j/YUeIQcHC8otLzqCl7XpD3lZAAcXH6zlMPgZl66YW+pPG648ixllD55b1yBs5jby
	 venUESrF5aERiu2flcb/HktBi7fP3KD5YMLfjJc8qkyUHEAtDJS02U0RdV0ThSh1Fo
	 5nL5lZht2VJuw/+8TeV+s6keLu1wciw09H/r8obnh2NZC8v58C66BQyLFjbpgD/J/m
	 oB5mFvqsgqZs/2T97iGSasVF77dhqPiBpgLPZfo+teiJNHNF1qxEDIBbdsKwPDe8Ez
	 bStr0/iUkeVznjhNx/pf2JCLh4NZuUs6SG84Q3N/0uhH0babn2t7fHFVirAEqTQ0Tt
	 PTw/APnqFGJ2A==
Received: from [192.168.2.54] (unknown [98.97.27.87])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id E2640B2201EE;
	Fri,  7 Nov 2025 12:24:25 +0100 (CET)
Message-ID: <5b7c7ecc-38db-483b-87fc-4199a8bd52c3@freeshell.de>
Date: Fri, 7 Nov 2025 03:24:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] riscv: dts: starfive: jh711x-common: Move out some
 nodes to jh7110 common dtsi
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251107095530.114775-1-hal.feng@starfivetech.com>
 <20251107095530.114775-6-hal.feng@starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251107095530.114775-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_032447_398586_5D04B4D7 
X-CRM114-Status: GOOD (  11.67  )
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



On 11/7/25 01:55, Hal Feng wrote:
> Some nodes in this file are not used by the upcoming VisionFive 2 Lite
> board. Move them to the jh7110 common dtsi to prepare for adding the
> new VisionFive 2 Lite device tree.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 14 ++++++++++++++
>  arch/riscv/boot/dts/starfive/jh711x-common.dtsi |  8 --------
>  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index dd5805ef70a1..cdc362b8d58b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -25,3 +25,17 @@ opp-1500000000 {
>  		opp-microvolt = <1040000>;
>  	};
>  };
> +
> +&mmc0 {
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
> +};
> +
> +&mmc1 {
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh711x-common.dtsi b/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
> index 809274625615..42b8f60725fb 100644
> --- a/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh711x-common.dtsi
> @@ -281,14 +281,8 @@ &mmc0 {
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
>  	bootph-pre-ram;
> -	cap-mmc-highspeed;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
> -	cap-mmc-hw-reset;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc0_pins>;
> -	vmmc-supply = <&vcc_3v3>;
> -	vqmmc-supply = <&emmc_vdd>;
>  	status = "okay";
>  };
>  
> @@ -298,8 +292,6 @@ &mmc1 {
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
>  	bootph-pre-ram;
> -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> -	disable-wp;
>  	cap-sd-highspeed;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc1_pins>;

Reviewed-by: E Shattow <e@freeshell.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
