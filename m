Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18BAC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Mar 2022 04:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7gYYbis2mFo6TAtSoyUy813kc/Z4x8Nlu7qvQyfV3A=; b=y3knQ0737QlGHE
	FbJppmthohrgL37mn97TX+KI6t0xHOTYC0va6IrCAv7smFb8OHN34bcE3Qgq7Ek8wLYEwVw51l6yN
	xdaxPeMc1fi+Xe4LsZBq1T2IRZsg/mCXl7h5+UE+3j9iF9OdVz8dwGMzr8gwn48QIOxQDjaVUzTsS
	VKzCwuAeRhk+lr1opleyzBN2Wa67DQ6gzNqi3TQXxMgHM7J9kCfjpD93UAr9pQUGCeEhVXww6FI8M
	h0lF7xXPxbomJwz1YLxU415YugozdSuFmGmCp8PSac7zToZxK3wAyiyfgEZ/dEHVTyMPdBcqKpANb
	kOvZqcHaNUiwCvH7qpkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRo5q-007Ibf-7P; Wed, 09 Mar 2022 04:38:34 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRo5n-007Ib8-1R
 for linux-riscv@lists.infradead.org; Wed, 09 Mar 2022 04:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646800712; x=1678336712;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OSaPAy2Y2iAJhLNxMchb2w/Lfbz/1Dfnsnnrlz8Sf8g=;
 b=Dh3TUvn6WRjU9+UzaNvoB+EvSq3PIEiWlt4wcIApd0vIQjKBwNw3XvSH
 SFHxegHnkPf5WX/xV/qD4n0cmwy8MGT2TR0XSQD6MWDJgZlCvJFXaTeMy
 WxEBMXFnvrPxjdZxtxTQEeCOsFLiJZGw4WuQQUWrASX7xcb75FYw7Dfnr
 LYS2QHocRcyLcFD1YlSJHiUB4Y2dj1wIpIts/MSppFhjAZJBCHYjnt91p
 rRvDt7UQHz8ddEDJc0GAZH2puYPTlcWcgQhAli0/7DzJuvR2eyMy3U6NI
 ozJuToFO9jDMzRvawoQPe0ZxmZs1qVv0yjnEh5F58XyIsZWaWGAmrTX97 A==;
X-IronPort-AV: E=Sophos;i="5.90,166,1643644800"; d="scan'208";a="195777824"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Mar 2022 12:38:30 +0800
IronPort-SDR: gV6mNB57sOgO5qixX6dJq1A5WwJ11KJH3W95V1R7xSdKKzF9CWsZRFmqgHfUSZK64qyCw25cav
 8uusmn4TLHYn4l4UBZc/3Hs1Ak2OCxmR0byMEBUyPqyEq0M6KrUTZaonssJP0R4TwjsKKM+MYr
 6/mSi770mljHkRqUBVxKMMbDadHYuuzdrxY78UQ8IkGlGChfoUpxLjucaog1fQtSFre6hT9Fws
 IiumJOtxdsRLWD+FCSDP/zJCk83cPMens55uLRGB2r0zBlyWFBkMvNzZuKog5Qe49vAw7eG0Pq
 Wa+haeRYAnk/n4F1HYpmX6LV
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 20:10:45 -0800
IronPort-SDR: pVPC0EXln/RqXNYEXvdmqzCMlt/Dq4HHrNTs1ndZe5tzPRQHcWZ+QPKbGiOS5cqXVvypnLCeZ+
 jSRPBRrcqbpB21Qde8KjrddD/b5n6MtnSpnV+89rqNhcVaEq6HGwGv560iYxJ03NLGB76Hp7as
 41EmEXxDEBxlm7YINHIy5mMZ4IQh0CKFD8bjSpRNvfZzsyz11xyxX9I0jChx/0GObVUCb8UyFQ
 UJVWpe2VSTyXGf7hhRlo8y8Co/3xEJcmT7CqLvgoYMNWiCa1C2dPmFbf3kgW0wOvEhaw4kL/e+
 8YA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 20:38:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KCzwN6jvyz1SVp1
 for <linux-riscv@lists.infradead.org>; Tue,  8 Mar 2022 20:38:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1646800690; x=1649392691; bh=OSaPAy2Y2iAJhLNxMchb2w/Lfbz/1Dfnsnn
 rlz8Sf8g=; b=KDYIk3R3+Ny/eXfGZGRSE+/hSASBkdVOgNhRZcMYySwlW3L+C5e
 gZhcuL28LQH9tYn7YCVqVhOzmseQTZKVGb+qf+NFsgDCj4drjcYylfQG4y7AYMNQ
 zb1WftXDK+fLbvN7Rbf1SQ9v9S/UKPRnG7qcehvziC+BZuyUn/v5g9nJrctelGGS
 a+gCLOoA12P77M+DYCJXTjz4KCvMKajV3bbR3kdic8fKPs4iSudC4y4vSvJ7irFZ
 updJC8kDXGyRVokrAlKkHADyHO8F/l8SpjLni/GN3RwcUi/d6j/SDrGcm7XsTKrq
 aQqwh8Y4pdT/6qwRAS2GcMXdCAxeXyhqsjg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id MYYbzldtZ2Xh for <linux-riscv@lists.infradead.org>;
 Tue,  8 Mar 2022 20:38:10 -0800 (PST)
Received: from [10.225.163.91] (unknown [10.225.163.91])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KCzw124Dgz1Rvlx;
 Tue,  8 Mar 2022 20:38:09 -0800 (PST)
Message-ID: <373656f5-63d8-6ee5-4f1f-ea7477b98b63@opensource.wdc.com>
Date: Wed, 9 Mar 2022 13:38:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
Content-Language: en-US
To: Niklas Cassel <Niklas.Cassel@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_203831_731110_386E06D5 
X-CRM114-Status: GOOD (  20.55  )
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

On 3/8/22 22:28, Niklas Cassel wrote:
> From: Niklas Cassel <niklas.cassel@wdc.com>
> 
> According to the K210 Standalone SDK Programming guide:
> https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf
> 
> Section 15.4.3.3:
> SPI0 and SPI1 supports: standard, dual, quad and octal transfers.
> SPI3 supports: standard, dual and quad transfers (octal is not supported).
> 
> In order to support quad transfers (Quad SPI), SPI3 must have four IO wires
> connected to the SPI flash.
> 
> Update the device tree to specify the correct bus width.
> 
> Tested on maix bit, maix dock and maixduino, which all have the same
> SPI flash (gd25lq128d) connected to SPI3. maix go is untested, but it
> would not make sense for this k210 board to be designed differently.
> 
> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

Looks OK to me.

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

> ---
> Changes since v1:
> -Add the new properties directly after spi-max-frequency for all DT board
>  files.
> 
>  arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 ++
>  arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 ++
>  arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 ++
>  arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 ++
>  4 files changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> index 984872f3d3a9..b9e30df127fe 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
> @@ -203,6 +203,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> index 7ba99b4da304..8d23401b0bbb 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
> @@ -205,6 +205,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> index be9b12c9b374..24fd83b43d9d 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
> @@ -213,6 +213,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};
> diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> index 031c0c28f819..25341f38292a 100644
> --- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> +++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
> @@ -178,6 +178,8 @@ flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
>  		spi-max-frequency = <50000000>;
> +		spi-tx-bus-width = <4>;
> +		spi-rx-bus-width = <4>;
>  		m25p,fast-read;
>  		broken-flash-reset;
>  	};


-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
