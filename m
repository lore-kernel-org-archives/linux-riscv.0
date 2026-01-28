Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB50D25B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PA7BRSkVZcJD4X9GliDrlws2yU6i7qoXZZEVRkEr5eE=; b=pITcemf/YD1OoH
	UD/U2gR6+X0zCinzn0RwAhBZJk6YjBKVADsmZpvDPTVUG0WjOlvBbKDKb6MTubzaAyOAGxpKipi1s
	kAqDtc0nMMhjQ8LSaSHqf7FRDk6sOd+WUH5tVK2Vx5NE8iNF3BT/v/OCppdDll4gWYcknBGGZho7b
	U57DpWXKNQKJltypyYhUbmi6ixWPFKUcO67HC0HOY2izxNBnqtG6ZAuevyJJg3tP7QZ7EMhhAkx90
	jLzV+h9Rxf9BWyrjzor0IQBe6r6ELxqcxKN3Ap9Bh0YK0cyuuHOz59dCmy95sIf6qZgH3PJKsX5HL
	l3CpD0NBiUCHUSj7kraw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bY-0000000G4Dp-08zw;
	Wed, 28 Jan 2026 13:29:08 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5bV-0000000G4C5-0xLw
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 13:29:06 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7cfdf0c8908so3812026a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 28 Jan 2026 05:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606944; x=1770211744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=raYtuP2NjeAqA5181HGaACfoUp8/gkl6VSn/CKYueq0=;
        b=VUEy0vXUmwsA4/3W4lBR1JFHJttL6vwexUL5okmfnm31OWyKue6gXn4YxXmBkm+mEz
         xoXuh0+B6Iyh7l0OZVkyuMjvWh2xzkrnGV8sb79vJcEeVnSl6q3r0Nm1afgSu6qdUjHC
         jiR+if/kGnZpdln+JAXfofoUzlSlmcXYNZda08cp1rV10bY4GGtVXrfEn5ovui+v2seO
         oFnJKAEtz6/uHNf6KCElI+Uz+f3hCDDS4rQ+DoGvnPgkuOXRrFTJBwDOm6KFlmz8ctWf
         8I6TIfUgUUj9ufp1b/n8r1a0LNUoNBOD7r8CXvxF1s5jeNiCrDHFVK1sTWD4hmOru9pn
         QqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606944; x=1770211744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=raYtuP2NjeAqA5181HGaACfoUp8/gkl6VSn/CKYueq0=;
        b=jpzyQ2VDdCem47wI2lKTahU8VF6egSjh3EqRp2Sr80pLqCsAkyL4Dj/+5IyfrblGJq
         X8BQ8+5/3Vseh6Z0Rb2xbA7pYMEu4VA/a+ImwocrXDbZI77yOSSmcCLbh2FJ+BC7EIi/
         lj/t13fWei37G22/ZjhTNBacKSA/BBtzxtM21wX7m5OlIuoXWmE1Pdx0+m+ybTx6CN4Z
         YKJ+O2Q7MBUttyRJRkv7iQuweGA8h+eJp89nEr7FfHKlANRY2coOJkXAGGdQbj+GWb93
         jD/oXNmzA7WBI1CKmpD5idA89i1bq7SWpMhRoxhfzWXJ7sx9fUm82b/8QE/s8yQuRl9t
         dtaA==
X-Forwarded-Encrypted: i=1; AJvYcCXwqeQohUOV6xLB2sDPehTb9Evydc/Y1vi2qM0P9EcM6F71PkD1Po2vtcCYXPMmSoFXj+0GQqd1VPSs7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE9BygjR8b+hkk/Z5LTn1ADXWS94vyqbihCVHwhXrJGlt9ndXO
	qG7esxdk56sBI9f4rq8wqoL8nG9UkQJ1N5YBwRu0rsdcDJm2Yh2HUOLYKB1mLkAM7kc=
X-Gm-Gg: AZuq6aK/SW75KAUCnVlLbMvr02Sg/3frk4HfFu8qnVCVPCIGFN9mTZDPKVEDHN6AmEA
	71rliuP4bnO6B1SDes8arz22jtPFBnUbDWU0lpfNI/dtDEus2bEtbLLwOZF82ZlQA29M57Yx1D4
	KQcaGrhUYOFKvBqz17EPV6y+WVxPu2d+/LEy0GATtzpJzcFrxltnwiQr4I5AQlrlKvtrH3tw5dn
	0s7zOO5CY5h8XVOzdX7ZRPi6cXwrxZSYDc5xb5KcCLnHlgRvYHNmlMQ1vScVuyqtNGw1O1y4jdG
	nzvZudOZUUxLR4Ur2bVFPl9G+BmWOmCWQaXkVVVve0dcBgJlWtFFAs1dHIA0+d05zwd2/4acRLD
	twvWTx2HwWNBrQ4N4Q/48vWgRbO4Hz9porvnQn6UDAe7IeXw9JCF/m7nShPtfuiZ9k2uhV2CJuL
	znGQkFJAP0pTZ2PaEYrkmiaZSgrHI3DzpvER1YCzWRFTkJEqE+nTM=
X-Received: by 2002:a05:6820:4588:b0:65f:1012:69c5 with SMTP id 006d021491bc7-662f20f917fmr2413146eaf.76.1769606943544;
        Wed, 28 Jan 2026 05:29:03 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:29:03 -0800 (PST)
Message-ID: <7f892961-5978-4283-bec9-0f2953db42b7@riscstar.com>
Date: Wed, 28 Jan 2026 07:29:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] riscv: dts: spacemit: Update PMIC supply
 properties for BPI-F3 and Jupiter
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-4-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-4-2c86b06694ba@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_052905_277597_6DE24C72 
X-CRM114-Status: GOOD (  16.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Update individual supply properties in pmic "spacemit,p1" node to specify
> the board's power tree topology for BananaPi F3 and Milk-V Jupiter.
> 
> Previously these relationships were hardcoded in the driver; now they
> are explicitly defined in the devicetree per the updated binding
> document spacemit,p1.yaml.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

I acknowledge that you've made an ABI change, and I should
have done a better job of describing this the first time
around.  (And reviewers might have caught that!)

I had some of the same thoughts about supporting just
"vin_supply" for older systems.

However I agree with the conclusion you and Vivian
came to, which is that practically speaking it isn't
likely to be a problem.  Boards should use either
old DTB and software or new DTB and software, not
a mix.

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
> v2: Added the pmic supply properties for K1 Milkv Jupiter.
>      Updated the commit message accordingly.
> ---
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 12 ++++++++++--
>   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 12 ++++++++++--
>   2 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5971605754b3..444c3b1e6f44 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -190,7 +190,15 @@ pmic@41 {
>   		compatible = "spacemit,p1";
>   		reg = <0x41>;
>   		interrupts = <64>;
> -		vin-supply = <&reg_vcc_4v>;
> +		vin1-supply = <&reg_vcc_4v>;
> +		vin2-supply = <&reg_vcc_4v>;
> +		vin3-supply = <&reg_vcc_4v>;
> +		vin4-supply = <&reg_vcc_4v>;
> +		vin5-supply = <&reg_vcc_4v>;
> +		vin6-supply = <&reg_vcc_4v>;
> +		aldoin-supply = <&reg_vcc_4v>;
> +		dldoin1-supply = <&buck5>;
> +		dldoin2-supply = <&buck5>;
>   
>   		regulators {
>   			buck1 {
> @@ -221,7 +229,7 @@ buck4 {
>   				regulator-always-on;
>   			};
>   
> -			buck5 {
> +			buck5: buck5 {
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <3450000>;
>   				regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 800a112d5d70..e2702a781734 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -100,7 +100,15 @@ pmic@41 {
>   		compatible = "spacemit,p1";
>   		reg = <0x41>;
>   		interrupts = <64>;
> -		vin-supply = <&reg_vcc_4v>;
> +		vin1-supply = <&reg_vcc_4v>;
> +		vin2-supply = <&reg_vcc_4v>;
> +		vin3-supply = <&reg_vcc_4v>;
> +		vin4-supply = <&reg_vcc_4v>;
> +		vin5-supply = <&reg_vcc_4v>;
> +		vin6-supply = <&reg_vcc_4v>;
> +		aldoin-supply = <&reg_vcc_4v>;
> +		dldoin1-supply = <&buck5>;
> +		dldoin2-supply = <&buck5>;
>   
>   		regulators {
>   			buck1 {
> @@ -131,7 +139,7 @@ buck4 {
>   				regulator-always-on;
>   			};
>   
> -			buck5 {
> +			buck5: buck5 {
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <3450000>;
>   				regulator-ramp-delay = <5000>;
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
