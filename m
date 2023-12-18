Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6131C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 16:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0KRDjGnYTbwwvgw3wFMlQjvfpxRJrFvdSbAMuHFMvA=; b=pPi7WHBa8PU9Mm
	WveYWEj979FHO7JAq+M2vF87AcjBFvXQG+0Z0DLSmdGK/xawCJ5Kd4l0KuHPOTkZe+WI4x68IkhxF
	32N1/uDzHTNUI9FIb5KriNwWegcVWQIN4AzUZwVZfC9wPsn6Xk8+s0DLIqg1Y86SMG7qP9WHSMVbe
	Y44BrlWS3IbbMmkUcPy66be56M43/FwNngRuEt8miij8h0qjncv+DY6Y8u8BOwV3nzoJs0bpOYYQw
	sUBbV/pa6BNW1yCtW/j1pCBhLC9/NAnZ/GrTrdkkE2OKcifdLTBRMEPWOyv346wQ2IfzcNid0ti4h
	khlBJYMrVQZTYsG94t/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGGe-00BOtm-1Y;
	Mon, 18 Dec 2023 16:14:56 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFGGZ-00BOqn-2G;
	Mon, 18 Dec 2023 16:14:54 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailnew.nyi.internal (Postfix) with ESMTP id 83B0B580974;
	Mon, 18 Dec 2023 11:14:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 18 Dec 2023 11:14:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1702916084;
	 x=1702923284; bh=6hSi0QYlB46i5legZj1Q7xKc4G5X4LGmhxKU180ngxA=; b=
	h5YRu0xmF3N6ngePNTIApGIvibyXXlEaYL2Zsyftd4C/eDKPQHQs9P2T5T6dP5d7
	Zw0q+wS53eIHOSOlXqC8BMNo0+nBjTH6QWpL9S3BflMvnV4s10eD5xqBL9Fup0iV
	SyDVTrgbeeVstoj6Eu70FJ5MBy0GgIBeO9STD+R0lRnAFfkcOe+ZezdPCEAFclq1
	X97Cka4f228PmnderwxwTB72Uzn71nYuFcTtmPOjBcdL//ihEn7Ok2KoJnVQQIZY
	8EtNHMziu4PGlmkEiJXsfN8o58R65/m0XyRIVXf05trW1tVQVm7jpjqALeBtL0Ji
	XhwhqTSU4He6BvYUEJGtgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1702916084; x=
	1702923284; bh=6hSi0QYlB46i5legZj1Q7xKc4G5X4LGmhxKU180ngxA=; b=2
	c/NbeoXu6NgaSRQcaeYIHeUC7KDddwPp8Kt45aCedtbFloC2CDbi/3cggRpOx4Q3
	IAceYKGnB00W7p0thxnkEy6hmwH/VTNm3MEwCL5b82xJtsmruAnlm+kD9henj3jm
	wds8nkSEBH9GmRUtCvJlDY5NQw4sx4M/W2osvdqUVdx75FDaW0IVIWPSWjn4QUCH
	EQiK5PmoneOn7Tp7WAHG+GjTwgxa/Qa6V+tWCNkbf25+VLiLzDhDakHAMP0uJEsE
	UEHoZtAxl1s8xrHbdcsBWtU+04VxDznAyPJZT3vKtLDOYPtoeKi842dw6Nl1VZvg
	9iqjIFc7wf+WuJqYKLqaQ==
X-ME-Sender: <xms:82-AZeuzn37EaHmt_jBVvMGyCzzaWc_DxBVON1bBOtzvVd01YPoVVA>
    <xme:82-AZTfZPlRSG9cQNsihav_u7xTWgcQhTdLBGMu9pyS440LycJ54Ey2fyRTxnomI5
    lwpz2djCkshEcy8qA>
X-ME-Received: <xmr:82-AZZw-_j3XEAkn3CuyqQAOX1kBxlEqiI9GpdfOSw3ZNc_YEogdrB2QYJUTZzAsMjuzxF-RMFxI5b-j7myXUWUlzmXji6BsDKgRlzbPtnc6hZSabKvM13uIMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvddtkedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeduffekkeejtdfhjeeivddukeehhfegteeihfefleelheeuudej
    veefgeeggeehleenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:82-AZZM8NBZQdsE0Uy3dM_axGkmgOZvCcPpPXdT4wYhvZKt5Lol0aw>
    <xmx:82-AZe-gcfDBPoWUPLeIcsFWTL5CGAuXB8--OHBes13fSRMZDXV5QA>
    <xmx:82-AZRXcMpaql3SA-DESowLOKGAFp8bNN5nc3-ifaz6gWrbaecCgtA>
    <xmx:9G-AZRi9UMKBgqfBd_LI6mnwolGB3S19lzyzIEor2KeSKnWRq-1JZg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Dec 2023 11:14:42 -0500 (EST)
Message-ID: <aad8302d-a015-44ee-ad11-1a4c6e00074c@sholland.org>
Date: Mon, 18 Dec 2023 10:14:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] riscv: dts: allwinner: Update opp table to allow
 CPU frequency scaling
Content-Language: en-US
To: Brandon Cheo Fusi <fusibrandon13@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20231218110543.64044-1-fusibrandon13@gmail.com>
 <20231218110543.64044-2-fusibrandon13@gmail.com>
From: Samuel Holland <samuel@sholland.org>
In-Reply-To: <20231218110543.64044-2-fusibrandon13@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_081452_280573_51B1E648 
X-CRM114-Status: GOOD (  19.51  )
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

On 12/18/23 05:05, Brandon Cheo Fusi wrote:
> Two OPPs are currently defined for the D1/D1s; one at 408MHz and
> another at 1.08GHz. Switching between these can be done with the
> "sun50i-cpufreq-nvmem" driver. This patch populates the opp table
> appropriately, inspired by
> https://github.com/Tina-Linux/linux-5.4/blob/master/arch/riscv/boot/dts/sunxi/sun20iw1p1.dtsi
> 
> The supply voltages are PWM-controlled, but support for that IP
> is still in the works. So stick to a target vdd-cpu supply of 0.9V,
> which seems to be the default on most D1 boards.
> 
> Signed-off-by: Brandon Cheo Fusi <fusibrandon13@gmail.com>
> ---
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> index 64c3c2e6c..2f1771c19 100644
> --- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> +++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
> @@ -39,16 +39,22 @@ cpu0_intc: interrupt-controller {
>  	};
>  
>  	opp_table_cpu: opp-table-cpu {
> -		compatible = "operating-points-v2";
> +		compatible = "allwinner,sun20i-d1-operating-points",
> +				 "allwinner,sun50i-h6-operating-points";

This is not correct. The compatible string specifies the algorithm for
looking up the speed grade from the NVMEM cell, and D1 uses a totally
different algorithm compared to H6:

https://github.com/Tina-Linux/linux-5.4/blob/master/drivers/cpufreq/sun50i-cpufreq-nvmem.c#L293-L338

So you cannot use a fallback compatible string here, and you need to add
driver support for the D1's speed bin encoding.

Regards,
Samuel

> +		nvmem-cells = <&cpu_speed_grade>;
> +		nvmem-cell-names = "speed";
> +		opp-shared;
>  
>  		opp-408000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <408000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +			opp-microvolt-speed0 = <900000 900000 1100000>;
>  		};
>  
>  		opp-1080000000 {
> +			clock-latency-ns = <244144>; /* 8 32k periods */
>  			opp-hz = /bits/ 64 <1008000000>;
> -			opp-microvolt = <900000 900000 1100000>;
> +			opp-microvolt-speed0 = <900000 900000 1100000>;
>  		};
>  	};
>  
> @@ -115,3 +121,9 @@ pmu {
>  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x00020000>;
>  	};
>  };
> +
> +&sid {
> +	cpu_speed_grade: cpu-speed-grade@0 {
> +		reg = <0x00 0x2>;
> +	};
> +};


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
