Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856DBD78761
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 12:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49sI3GICvUoSBktzZ1WwvDL8igNmhW7eZu4dANCmK5c=; b=e+2CmYkF7HlJHB
	XzUMTeMm5CWLKVyiOTI+FyK0JTWsiXXEhNz95jowC1jZ7rMOb8eFwBgNPosRLqnIvjojiXlDpbOlH
	WbKvtIJvGzZA1lbfoKBxG/QlwoYzSacnMbF1YicJFe7V+XfIRWHAVnPV2K22PgRhjqCKQuQWdQUJq
	wUrTWHdFtyEE9XICaYEols4XvfKr8T4Sj5VekJpV5s1Cjyh0wKZ/7VxKQEvcgEjFxoFMVCKS8HHt0
	xBvv6PXhZVs01fNr+gAfO3VBA1k9Ja5iXAGz5YRs06mEXpRnHeyPrze1ZrYKpRo7zmiMoay2hwlj9
	P8mMTgnFpR6s/hgJPDHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZTE-0000000AHRq-04t3;
	Fri, 19 Dec 2025 12:20:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWZTC-0000000AHQm-3yBz
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Dec 2025 12:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ct4vOKinix4TxueD3fVwHKY6QNU92ZqD4T3jFqVSH/8=; b=etaTa0PTDsUB2RoZqv4QrddRp8
	aHrAJDfgF8i0CY0ILkvdATfC6a2kgn6aTHbiLNevZQQ3//S4a3hhvLxoSyUZqsvbbShkhQeo706xW
	+453d0eHpI25mOsF0syLNFBzMKyNGRZay2z17IiPQfpacLki2kx5iF1wiH0pnpvoEMJDdxMBSLen+
	i0R2Ny4ttlAQRt8K3XeUlJK0GkMMMIq9+TbHfItIe9N+hzpWA/JDZxpeTP/9ZPCfDwmosGW0aO5sB
	z9gZR9D9mGAGXrSVXVYVP703+GjOBgdKmvoHSUQIX2uvguPXIdqN7R96pAhyoIoYnDl7K7ClU5a+i
	5TYSoykQ==;
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWYbh-0000000Am6r-3L70
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 11:25:15 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 78C9A340BDE;
	Fri, 19 Dec 2025 12:20:22 +0000 (UTC)
Date: Fri, 19 Dec 2025 20:20:18 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 4/5] riscv: dts: spacemit: Add a PCIe regulator
Message-ID: <20251219122018-GYC1958363@gentoo.org>
References: <20251218151235.454997-1-elder@riscstar.com>
 <20251218151235.454997-5-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251218151235.454997-5-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_112514_079343_8B50506C 
X-CRM114-Status: GOOD (  12.19  )
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


On 09:12 Thu 18 Dec     , Alex Elder wrote:
> Define a 3.3v fixed voltage regulator to be used by PCIe on the
> Banana Pi BPI-F3.  On this platform, this regulator is always on.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 02f218a16318e..71f48454ba47c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -33,6 +33,14 @@ led1 {
>  		};
>  	};
>  
> +	pcie_vcc_3v3: pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIE_VCC3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
>  	reg_dc_in: dc-in-12v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "dc_in_12v";
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
