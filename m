Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B115CC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcSmh5Yx8tkrC+Ifsdj2kcC4tDiK4G9pSG5JsPt6Qgo=; b=KHvK6n2PxAIKNM
	fgQouXXaAju5iLNCg5c8ZJaeYzp+mD9P6d3W02cl5s9Zn2WIi2n3KWwlnpXzRJ013wsC7If06F0W3
	gjXjGpFaBF+cVdwArRlDxU5XI2Jbd5vhY0KZ3HIzxXmxO3CGmcXHWGNj7t4FdRt3cbRO9W0D2H5di
	jvjm+e457DWy23hXXNJ6vGnkDqtq3/a0IsEtA2iRUGNQIPIP6020cQYx1i1TRxk8y0vtXvJgerkSt
	UL08/kG0qXR+CjVh5skWxQJ8XEEdmfoy5o+ELETgTvLoRYZe7I45S28GrkGxwPx3MWQlIpo+DYGTE
	K8mmX4mDBoDqipyVUIJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFFH-0000000GxY2-2Ewi;
	Thu, 15 Oct 2026 06:47:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFFG-0000000GxXv-2QK3
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Oct 2026 06:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1tUCNd46xtK8g0oxdd9jdvTFkJwGXuPMhPtXJdlM1vo=; b=iFXpml4LfNVp4vBXZyvkvWrwlm
	iHdHuzKSRu4WIngKvszR1ifL3c/p81FUZeEzOxPrEgQ7Y5FwUcPNGJSrhH5ZOrVSNPPSsetFldASg
	/U+J8p/QQWh8B+PyFmlFgeF2IKzp9QkHLtt8xo19KHx9YPxXckETChBN9g1njc1ycBDjx7dFZEUVQ
	dK3oqEWaxRiQtUIl4LGXWO1WPV8BumGTnUe9dV5um1D4bHMSB7lgUQ8SoqOM7XMdetIv6/WAimR0r
	q7D1TkYsvyilqyxawTXTnYwHZY9TksqjTl/DeACv5Z7Y56cALcMiuJ5aCiFUnB1pILeuJOSBDTLA+
	megDApAg==;
Received: from out-223.mta0.migadu.com ([2001:41d0:1004:224b::df] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHFFB-0000000HXYQ-3stR
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 06:47:17 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=t0IiZB/Ux47ttYhnh6RR0lffF1iWD71iJlXsK4k5DOc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792046825; v=1; x=1792651625;
 b=qCbV7nopck15dDBycDk8WGV4ktU/jaZd36GDqHO+ZwfXjPbZ3Ws7QazO26FZEgXvBXqhSJ3s
 e/lc4nDhj2vLGL4ExHRL1PwvsuXMdOX7pRY20P+CcZExjFkmr39GvofBf7YvHRKQooHdSyW9VKu
 /zTuwCbx2hP6r3QKcLH57CjE=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c8ba14fd1bd62bdb;
	Thu, 15 Oct 2026 06:47:05 +0000
X-Mizu-Trace-ID: c8ba14fd1bd62bdb
X-Migadu-Flow: FLOW_OUT
Message-ID: <861d25f6-7bcb-4b04-841e-89ed4cf55843@linux.dev>
Date: Thu, 15 Oct 2026 14:46:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: sg2044: Add eFUSE device
To: Inochi Amaoto <inochiama@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
References: <20261014074516.240247-1-inochiama@gmail.com>
 <20261014074516.240247-4-inochiama@gmail.com>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261014074516.240247-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_074714_400947_5ABCD8E0 
X-CRM114-Status: GOOD (  12.78  )
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


On 10/14/2026 3:45 PM, Inochi Amaoto wrote:
> Add eFUSE controller node for SG2044.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |  4 ++++
>   arch/riscv/boot/dts/sophgo/sg2044.dtsi               | 12 ++++++++++++
>   drivers/nvmem/sophgo-efuse.c                         |  1 +
>   3 files changed, 17 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> index fed3d9a384a0..1b506972d465 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dts
> @@ -36,6 +36,10 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&efuse0 {
> +	status = "okay";
> +};
> +
>   &gmac0 {
>   	phy-handle = <&phy0>;
>   	phy-mode = "rgmii-id";
> diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> index 320c4d1d08e6..9577aae08f7f 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
> @@ -408,6 +408,18 @@ sd: mmc@703000b000 {
>   			status = "disabled";
>   		};
>   
> +		efuse0: efuse@7040000000 {
> +			compatible = "sophgo,sg2044-efuse";
> +			reg = <0x70 0x40000000 0x0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&clk CLK_GATE_EFUSE>,
> +				 <&clk CLK_GATE_APB_EFUSE>;
> +			clock-names = "core", "apb";
> +			resets = <&rst RST_EFUSE0>;
> +			status = "disabled";
> +		};
> +
>   		i2c0: i2c@7040005000 {
>   			compatible = "sophgo,sg2044-i2c", "snps,designware-i2c";
>   			reg = <0x70 0x40005000 0x0 0x1000>;
> diff --git a/drivers/nvmem/sophgo-efuse.c b/drivers/nvmem/sophgo-efuse.c
> index 5f90adaf8e4f..568d17b88ff6 100644
> --- a/drivers/nvmem/sophgo-efuse.c
> +++ b/drivers/nvmem/sophgo-efuse.c
> @@ -14,6 +14,7 @@
>   #include <linux/mutex.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/platform_device.h>
> +#include <linux/slab.h>
>   
>   #define SG2044_EFUSE_CONTENT_SIZE		0x400

This change is not related to DTS, should it be in patch [2/3]?



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
