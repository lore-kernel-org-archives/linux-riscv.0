Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B77606A327
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XRgJJfxB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rWPNHEDA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PsIpS/9ynOdFtMkw/M3rWfPpCBOCLN7qPxlbnpzDHno=; b=XRgJJfxB3q44RpOkIred1RvMs3
	l0whwS2zrvCA4dqtNTOkfytGcdplAzYCu2ey6xjgW1bBFcMVZp1LoF+pc9krqc75MILW0vWaeClpT
	a9euQvcDk6cXDC7DkXEFylSZS3Ec0FRfmeFE3es86hVYEGX3hbzSI1QAi+APlwT9mo/cB2EcEfKTL
	GWH1+xK3KbVMQR4QtJGsvsnazqdZAE05jf/ldSvTk4Vafz7ZS9bRTdnrfndGFUqakjZprRzwURo81
	/G4nkHHSMYoPcNayIBApKwcEldrrj7vSRQMOnquCYzVwOl8gn4EYv08mnQtPed/yq9pI5Kd2Rbxp5
	TPgobfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPcw-00000002aq6-0v2E;
	Mon, 23 Nov 2026 08:42:18 +0000
Received: from out-234.mta1.migadu.com ([2001:41d0:203:375::ea] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVPcM-00000002ajq-0pyv
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 08:41:53 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=P4NQtTybGc0REmjpLHMH+9ubePcgyr439jm5FEY4xsA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795423299; v=1; x=1796028099;
 b=rWPNHEDAkMj7zYtXYvvVQKSNeUqnWbmzyz0An2ePJzpn3HL2VvAcI5bXAECMX62VLdSggR4H
 NJw54cKLXfyVONp2p/zVi06kHesmnG7NwDPipsGhc0L3Ijx2O50jSWVxEa7ypo9ECbtzY/x6kET
 wdmJhk23f/nUMl26ZIq6t+ME=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7cae5eb235d0b444;
	Mon, 23 Nov 2026 08:41:39 +0000
X-Mizu-Trace-ID: 7cae5eb235d0b444
X-Migadu-Flow: FLOW_OUT
Message-ID: <7e8e6899-8af5-497a-9eca-5091f7703020@linux.dev>
Date: Mon, 23 Nov 2026 16:41:33 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v2
To: gaohan@iscas.ac.cn, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
 <20261122-sg2042-evb-rtc-v1-2-f222c64cc7b9@iscas.ac.cn>
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-2-f222c64cc7b9@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_004152_127747_9D14AF98 
X-CRM114-Status: GOOD (  11.70  )
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
> The SG2042 EVB v2 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
> and add the RTC node.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Reviewed-by: Chen Wang <chen.wang@linux.dev>

Thanks.

> ---
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> index d8c5814f22581076e6b5114f762d4fd090681b80..0dcc53b519971396a5ce734108ea0386fb186726 100644
> --- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> @@ -124,6 +124,17 @@ &emmc {
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
> @@ -189,6 +200,16 @@ sdhci-emmc-rst-pwr-pins {
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
