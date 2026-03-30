Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76094FF492B
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 00:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIr/7d5eDaiTqyYRpq+KRPG9/ySyMJWjHbbcPCXMeFI=; b=lpK4kfwB19zBc2
	BVCel7K37VkQw3lqZQbwbr0l4T5YpMTxdQh8p+nDYzDjjOz+IC+tmrTxZq15dAlwFnfcOTHHyf2iy
	iKey4hR00TIt5y3rYDCJyshc7W8OHfsLie3crGFWWdNYqD0K1GXhS8aMzPBoinNRarXs75DuiChRk
	wZ41RHuX1o+zOkBYKI9bCGK19yIXlmPj89q0eLZH0XEwL7/6nZK3+2QssWK1ADpAbvHqYpQ7sRrRE
	8WJZrwqs9XnNjPZWvvNOha4KlWfDruBUwg7GCZ64qMndZfoRfiSdIe7e67/TMJBjwN4tSehqluuVu
	vl2bMLTGkWkN9HWLDqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w70XJ-0000000ARfq-0EAm;
	Mon, 30 Mar 2026 00:31:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w70XG-0000000ARfU-2qTP
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 00:31:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6B2042A81;
	Mon, 30 Mar 2026 00:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BD1C116C6;
	Mon, 30 Mar 2026 00:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774830675;
	bh=vVykGeSajuTeLK4oYD2kGFulo5W4fx4EY0TEtNRZSqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bU0RQXe5KXMGSJrYwmARtlmlPmDVoFhLWYAJqg6A/z/+AQ0iW3yn6AzIVSFQZx8rv
	 D2IAei3ytQb16YPRmuUdWSP0Kz6F8uYORMQI40g3EWzuVtYImhqAdGFqwkk20xe/43
	 oV80i/asXxqxnuv6HQgo5Zmdt3idSO61pbFK/KaM36Dyiyf8XF6YHl4GJ5MmXOtOut
	 VkC5Meo1PfHJkrZrHvtDwwZy0DJFJCdomr1p0Mu1AUHheRYK7P4VasPp+LiRU8rwNs
	 D8quzZLt9bdt4+mGWksOjd18w19T0SIkD75EPGNZAAymUSCV5kyYAthi+xXxLrWfEf
	 +BXKrDhAPfDXw==
Date: Mon, 30 Mar 2026 08:31:13 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 2/3] riscv: dts: spacemit: Define the P1 PMIC
 regulators for OrangePi RV2
Message-ID: <20260330003113-GKA960072@kernel.org>
References: <cover.1774803532.git.gaohan@iscas.ac.cn>
 <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <492e0bea0fb84f49f4bead3dc3d563b13d98df11.1774803532.git.gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_173118_744748_1CC8ED0A 
X-CRM114-Status: GOOD (  14.10  )
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

Hi Han,

On 01:05 Mon 30 Mar     , Han Gao wrote:
> Define the DC power input and the 4v power as fixed regulator supplies.
> 
> Define the SpacemiT P1 PMIC voltage regulators and their constraints.
> 
..
> The power management hardware design on the OrangePi RV2 is identical to
> the Banana Pi BPI-F3, so the DT Nodes were taken from k1-bananapi-f3.dts.
I'd suggest to drop above comment, it's vague and even not a direct reason..

> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 93880ba7bdfe..1b1b27bc95d8 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,25 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
..
> +	reg_dc_in: regulator-vcc-in-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
This regulator can be dropped, it's not used by *device*, take a look at Krzysztof's comment

https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
