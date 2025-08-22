Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B504FCA0EFA
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Aug 2025 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=30qzvSCaEodihAbHAjjUdY3ck2l2lDdNkjbVc4Ki6cI=; b=PveIJe6MrvVf96
	lh4covqZL1lO6wwndDTwF0FX3HYcDcSmneCl7RfUlJTsRpBQ/j7w8gkY4c28fLLAsqPOmkqM/tbY4
	akEngLXEMwzsBMfhrxtfdls31+TicbH4PV4GEEbEhA2Qt267UGqjeu4vcQv4CR6IeTlEFw4nEu5M/
	hAclaHdBGZEKOmO51d2E/PBa8ARFKLBzAoCuQTnAMN8P1ESUXfRgPI9N9faBft3IqydzmgHpCUq6s
	2vbC5SdCYun9kGv9R7vjFGCRUuiByh1NSafCjDvI+SnUSmRcWAKcNqdl1u/qJmmD0XHbq71KTI7qM
	ihlFMYb99aoHDZYBIJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upjUd-00000004MzE-3pFG;
	Sat, 23 Aug 2025 08:20:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZKH-00000003VRe-1Wot
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 21:29:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 99017A58C07;
	Fri, 22 Aug 2025 21:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA80C4CEED;
	Fri, 22 Aug 2025 21:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755898172;
	bh=XdRfsuCBeE2JPGsoh0xnqLu4uAHzTxPybD5NLEAdrus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uOgDQtkTFuyN6OSUi4Zg7YTx3n4m4lFnUxCOO8c1PiER+3BJMUwdo9DOBrgyzC2oQ
	 nA5Df4iyKsTWLxcNNJVcUf4T5YMs9FGJ+lhcCm15tJn0TuEMrkBTpiLzvA+nF6ynKS
	 Uqmf7/i/Z9ecUybh+xHVtFs6Hedv3jevj7Wif6XOqGv6NQGsZ27EnT6xGq7n34sXEb
	 GKQHVWEHu2vFQzjnLz+jrNJSCn9NzUYDk/ZeG6Q13+GiHdvQvt8v7fKvTWs1HWiPux
	 1SOP7zlaj9wG9gVVVnI6XRnJav0Yq+cxgEgigSWfMrsC9/6YkmxuTVlFrny8ORiZvG
	 GYJxcXitlLM5w==
Date: Fri, 22 Aug 2025 14:29:30 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: dts: thead: th1520: add coefficients to the
 PVT node
Message-ID: <aKjhOuqlQyuLCVEK@x1>
References: <20250816093209.2600355-1-uwu@icenowy.me>
 <20250816093209.2600355-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250816093209.2600355-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_142933_474226_EB8CCE6F 
X-CRM114-Status: GOOD (  17.43  )
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

On Sat, Aug 16, 2025 at 05:32:07PM +0800, Icenowy Zheng wrote:
> The manual of TH1520 contains a set of coefficients a little different
> to the driver default ones.
> 
> Add them to the device tree node of PVT.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 03f1d73190499..e9c81bdabed8a 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -676,6 +676,10 @@ pvt: pvt@fffff4e000 {
>  			reg-names = "common", "ts", "pd", "vm";
>  			clocks = <&aonsys_clk>;
>  			#thermal-sensor-cells = <1>;
> +			moortec,ts-coeff-g = <42740>;
> +			moortec,ts-coeff-h = <220500>;
> +			moortec,ts-coeff-j = <(-160)>;
> +			moortec,ts-coeff-cal5 = <4094>;
>  		};
>  
>  		gpio@fffff52000 {
> -- 
> 2.50.1
> 

I think moortec,ts-coeff-XXX will need to be rounded to nearest multiple
of 100 as dtbs_check warns that:

pvt@fffff4e000: moortec,ts-coeff-g: 42740 is not a multiple of 100
	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
pvt@fffff4e000: moortec,ts-coeff-j: -160 is not a multiple of 100
	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
pvt@fffff4e000: moortec,ts-coeff-g: 42740 is not a multiple of 100
	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#
pvt@fffff4e000: moortec,ts-coeff-j: -160 is not a multiple of 100
	from schema $id: http://devicetree.org/schemas/hwmon/moortec,mr75203.yaml#

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
