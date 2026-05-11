Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2460ECD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 07:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnGOFeRlbDMPUlrLkr1+sKL0PwRoVADe/gbXhGU31is=; b=WF1WGthEpKRKMi
	FLR/6k+Yf0io1EoPkd605pBYeV5tlq2V6U2n3oE8lKAANb2JsBVcCIpPtSFkCYrAx6UZ7bx/NtHkb
	qHBwDKDpehuT8t1X9WdbSrE0qwJFHzyuyvMFI8NsIotZpU/3bxbUfWSVT6YfQYSmjnUXzTCbpA5kX
	KMnyTBWp+PDEykn/wOzB3yabZPmvejQi7tnrm6M6+hoDrbGRSNFnXzmMnIPevVCIoqBGQxyw2uhxD
	yPaMmCNY0LhLtRTZBinlvgovpxbijSORqnGJUNghrPCqmmvbtWocIb0YwKTBi3ckW1WU77n23I65h
	8qwl/P2ZFV+RutkpYWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKjc-0000000CYmd-0ghc;
	Mon, 11 May 2026 07:07:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKjY-0000000CYm1-3ueO
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 07:07:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4ED043CCC;
	Mon, 11 May 2026 07:07:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED65FC2BCB0;
	Mon, 11 May 2026 07:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778483240;
	bh=2gFiDL3VupG/8sWVskWAbPqYRsDXt3LLxEZvkrAN/K8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdkRcEWedDRQSgz6SUsTh/+VkrY82V+Dd235f7fSmEG2+M/ZH3uR+f0V3ugAuEG/6
	 ATPeKGCRLMVI/HpfkhJ6qzcd+kkPaG9KGcqiwupTsOJ4eOqXfePCZRRCJzx35UZZ/S
	 XxXn8REH+RZtVQLIdYQ6kAaymWTHe8DubBt9rsZFycpxvwkFu5b3kTQurgDyKr8FBT
	 oQTrUO176f2wReYo7YK8u+w39t7riZkArkYDO3QvPUms+V9KdPf+3lpqB0mkylwi3q
	 rcmxxG+sL7TZu3ZcqcsCkOtjo3DY2qjf0ZSrRC6q52yfZxJ5qHmlgcf9odJxu64Qo1
	 nr50UZVE5ek9A==
Date: Mon, 11 May 2026 07:07:18 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi R2S
Message-ID: <20260511070718-GKC3624147@kernel.org>
References: <20260410100010.1197804-1-amadeus@jmu.edu.cn>
 <20260410100010.1197804-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410100010.1197804-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_000721_130153_6BBAFEAD 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Chukun,

On 18:00 Fri 10 Apr     , Chukun Pan wrote:
> Define the power input and the 4V power as fixed regulator supplies.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index de75f6aac740..409a6db269ae 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -21,6 +21,25 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	vcc_5v0: regulator-vcc-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	vcc4v0: regulator-vcc4v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc4v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
>  };
please check my comment below, I think this patch has similar issue

https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
