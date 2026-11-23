Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C120606A31A
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 08:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ndj4i8+E;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bk0ytuA5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ehMlQTB9ACRuLJq+YyQYG3Sft2MPjniW39ajVamxQXQ=; b=Ndj4i8+EMY+sOyl22Je28giLJO
	KItdEixeOjNkFjT58uAnfSx9wUI6PouxS4A0ZiIXSqKVFtHMzCAMG8iqRqjARdCHSkt5VUJfOAFou
	CwWmLu+euzniH3HT3vAO6Lnu45Y6Ee5dox/gREPs65TmRtxUBg6dZIihZJc9ZsasVZxA7nmi0+Uc2
	QFNyAER8lBsWxjSynZMNzmPBuopRxGXfAJYTPGV1CEPm0EIxdIefMJIXJtRWzoDjdjMEo+hjZQzFW
	LGqjJCdT5aRniy2HjDz5yqcSEfxjaLKPuJvQLPG/uLL+XS59H+SGJHjbLr9+RYYs2rnwqvzlZ1doZ
	y2Yeo2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPck-00000002amp-0WCV;
	Mon, 23 Nov 2026 08:42:06 +0000
Received: from out-98.mta0.migadu.com ([2001:41d0:1004:224b::62] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPbn-00000002ag3-3zon
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 08:41:28 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=l2DP2WRCJyIifr/DPGizDAIwXyQaHH94kdBlyIJQkXM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423265; v=1; x=1796028065;
 b=bk0ytuA5taDoTGgVafhhlm+v9MxLzRYr/Bloib4ufR6eML6dAvXr63wvEXk/tuf2ctjwJPuy
 HX2P6VLK2TeDCq8Rq6h2ECB6MQNrcsOBxT5RKiFmCoEM1KYRcS1Y6Ne/a323HlfDaCmDO2wFhAm
 8pWhr2atTDrYTbBvfDkZrVSc=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 49510743510806cb;
	Mon, 23 Nov 2026 08:41:05 +0000
X-Mizu-Trace-ID: 49510743510806cb
X-Migadu-Flow: FLOW_OUT
Message-ID: <ec584c15-c49a-499d-bd79-a9f48f54dad5@linux.dev>
Date: Mon, 23 Nov 2026 16:40:56 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
 <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_004117_637673_F7818F12 
X-CRM114-Status: GOOD (  11.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/22/2026 9:33 PM, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The SG2042 EVB v1 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
> and add the RTC node.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> index 9f403e564694eae14913f6ab23080a6333df15ae..6ddb16eabc48a51f457449d245d63a3840b2fdef 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> @@ -136,6 +136,17 @@ &emmc {
>   	status = "okay";
>   };
>   
> +&i2c0 {
> +	pinctrl-0 = <&i2c0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	rtc@68 {
> +		compatible = "dallas,ds1307";
> +		reg = <0x68>;
> +	};
> +};
> +
>   &i2c1 {
>   	pinctrl-0 = <&i2c1_cfg>;
>   	pinctrl-names = "default";
> @@ -201,6 +212,16 @@ sdhci-emmc-rst-pwr-pins {
>   		};
>   	};
>   
> +	i2c0_cfg: i2c0-cfg {
> +		i2c0-pins {
> +			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
> +				 <PINMUX(PIN_IIC0_SCL, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +
>   	i2c1_cfg: i2c1-cfg {
>   		i2c1-pins {
>   			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
