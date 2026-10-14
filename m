Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3EECC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+oT6dt2aQVQETa9xJWl3svpuPAg0rLIZAxPYcwNJso=; b=dP+H2wn6hxh2TWBJLkvQSgxU/U
	DWbbnpMaeKORv+wDlrgMqjZ2UnGvMuzyB/sS5t9/5tcd1TShoVVpMo6JkAQObpH7HlfQ/TzXwBYVk
	NRcupgIWh0hlCo33l4GKRMYYcqg1VY8TO2derO9uFRyUQdGZVIMDSJte5h6wsWtX17wx+hyRwL0UB
	jWQcmcspvWKIgfuNDsWSSP/UJZyFVHYvGuvoYX8B57IAIpAAL+W3VX3NENWW9wIC16GtP6sysoAKk
	QvPhR0lq/35lGGjRe675tYOgW8xi1t2DJ624B2db6wpVScMYQ0m6XtP/2ES1K4ramVrZce08SFJES
	2IQe/1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuLW-0000000Et1Q-15Ld;
	Wed, 14 Oct 2026 08:28:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuLT-0000000Et0d-2rwE
	for linux-riscv@bombadil.infradead.org;
	Wed, 14 Oct 2026 08:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=BEWX0NnWZSM0xUTF33KaixK1TLeuUgRnotvYl3b7sMI=; b=TfP9p6FNi7hJOxVECyOdZWV3Wz
	jB1/swSOtBdCOa6kMt2AmVvENMUmrZTmy9Tq2r2r8nFcykqVkeB0v+BWKrifWay7jUfdBr7m0t8Ot
	Rvig9gwadV7V8IWc/BispBjy2MsZ7cuWDVGX1xLO+2DenmDUYLC7i5WJLoSgWf67gTQwZBaKgPksE
	u1BhgYnMZS4NAeHvULOqL2jBh0xUAbNUPlf8mqaw73063TuBQbJP5wuDhCO4j8cnuzNkPLmcTYYz5
	9M9tegMgyspC9JAx/sqzNYWYLaWa3w35Ddo51ltWBSw0PnShb+agxNcevYj8W2Ty9isjgyDHQ7AOq
	eL9i3Tdg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGuLQ-0000000GV6G-0hTe
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 08:28:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so11416185e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791966494; x=1792571294; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEWX0NnWZSM0xUTF33KaixK1TLeuUgRnotvYl3b7sMI=;
        b=pG1EiSUzVKSzRs4g0NFOZFBr2WtE+LfjdN8cvyvFWLxy06xbH/ucLnL5dS4wboaetl
         orhdg+mF67SgexRnZS12p11Gplztm30AEbyJEGu3F6xdRzKL5dbRr3qcr2d/qrI8+Vtl
         CVTYje9twrPG9O7QJiiAHyFOVc2SLAZvp6IPQYKN6E+p8gcG3RtV6yAzXPWj/o87tBNX
         L5Il+IVJzorbljLWVMjaSo2tWCPCzeLMPYmO2PUZU3H1BbmG7HtmpBqbkbOrSD8ieAwU
         +A++/FzkFAjatVXwHK3j3vFnx4eiTjPfh9QFurRpIaZHxC3MlrQnLCFTy+kIGrcR0gVY
         ZrTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966494; x=1792571294;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEWX0NnWZSM0xUTF33KaixK1TLeuUgRnotvYl3b7sMI=;
        b=QnXCbAzH5p+QmWb7FTDEXjfhRVPXLGXGPrkZB5+W1yXpoTVY4B3PNhFUiQqfr/Wk3m
         LrZgKs4kpARwnB3eFn8pB2AB0hF2n0b0AiCyvl1hyPURObYfbRB2Sp5Escb7kKA+f+b3
         y6tQPUWKtsA3Myaf3Kn1fDF+tFk5Bpt+i4EGxjs+aNas+GRvC1hzfQzTtn69FtqJgbJ2
         +McPKFO4eLFKAFdIMMGOAMMKAIMuyxLIgxC8Uju0huq/VKq7RRDSCKYqIdb6bTJZyjl1
         HoFEGn0nuLKMrWoittE8+E3HGY8tXgChZvk/CTHoZxnmm+9I8aYFtSFYlcHihvZs4l0/
         v/IA==
X-Forwarded-Encrypted: i=1; AKwUvBymfFw1ycU2MJ8n9SzOvXqTiVjugZuUXQmPCq0scSJKNkqfMOjgkHy2mxvbeWZJKgUvUp+z0ru+O7qyKA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2KXaJFHlgFN7QHsW/Zj+kldQ8fhc5V97S9HO/F1n6QFa+rMHB
	XlhegXOzRiS5ny2Fc1YEfWZsixya+eW7QHmUn2sohDmNs84u6bCQI/x2AzK4eG7VI+Q=
X-Gm-Gg: AYBFou3tJ1N4jO1c0XE5YQzD6o8iNYQukjHYSf1pqBhVTqb0cELzSki710mtCD6LeGw
	t6m9ydHlwd1uQICV+6EA3fpuFWSgwXzwgN2UJbNPJK5D672RNIPF+h/Fxob/fygLHJZ9qkMJs0x
	uvkbQPcMrnFqw5vPsfHf4yaGXFwkQ47JUMp4+5WakRHe225URjJ/WVCXp4jhHWXlyzwPFJqsAXK
	fJUR7Osp6pc5jH/5eDvj/3qWW/Swp/zO5q/2UlwEpp+bCLBcSj6Eg5EhW4iCHlDLSu2k3BSiEMj
	uVD/Z1iskI/YJbp3Hk3gBtydm8jHMDqh0ohDc9RX36xeJhV1vu+mCddvUYr05hcqeTnUdzCGAdI
	aiauIT0sD1z7RQnRgidwZnDWkVojyY6RsmfKSTBOZ/Yp+JqO6osq2daKbJwkeOZ54TLWF9ev6lT
	kboE8FEsafd6fz23mNF5H2PoU3wupW3lopnUzWRl/ZI2VpCMy9irdv9OLixxHG3rj8GkG8VSwRD
	hDB2HIsTltQnVK9YjSRh76Zx8RbK2jDJ8cOIqBjbRenFWniWFEmnOg=
X-Received: by 2002:a05:600c:8b04:b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a18e4d67edmr291581105e9.24.1791966494135;
        Wed, 14 Oct 2026 01:28:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb? ([2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b8a184sm17182865e9.2.2026.10.14.01.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 01:28:13 -0700 (PDT)
Message-ID: <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
Date: Wed, 14 Oct 2026 10:28:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Wei Yang <yangwei1@eswincomputing.com>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
 Yang Xiwen <forbidden405@foxmail.com>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Stanley Chang <stanley_chang@realtek.com>, Ze Huang <huang.ze@linux.dev>,
 Aswath Govindraju <a-govindraju@ti.com>, Roger Quadros <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20261014082037.1774672-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_092816_745786_477D6001 
X-CRM114-Status: GOOD (  23.91  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/14/26 10:20, Chen-Yu Tsai wrote:
> The DWC3 controller can operate in host mode. It does so with a XHCI
> compliant host controller. The XHCI has two downstream ports, one for
> HS and one for SS. USB downstream ports start from 1, not 0.

Is there something in index 0 we will need to define at some point ?

Using 0 as base for numbering in DT isn't incompatible with the USB
spec using base 1 for numbering,

> 
> Reconcile the downstream port numbering with the common USB host
> binding, renumbering the downstream port numbers from 0 and 1 to
> 1 and 2.
> 
> This is non-backwards compatible, however it won't break current
> major implementations:
> 
> - dwc3 "gadget mode" in Linux kernel only requires a connection to be
>    present; it doesn't matter which port it is
>    - dwc3 "host mode" OF graph connections aren't supported yet [1]
> - FreeBSD doesn't use the OF graph for anything
> - U-boot doesn't use the OF graph for USB
> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use
>    the OF graph for USB
> - coreboot doesn't use the OF graph for anything
> - Zephyr doesn't support dwc3
> - TF-A doesn't use the OF graph for anything
> - EDK2 doesn't support dwc3 and doesn't support OF graph
> - OP-TEE doesn't support dwc3 and doesn't support OF graph
> 
> [1] WIP to tie OF graph port node to USB port device
> 
> Fixes: a33113f73693 ("dt-bindings: usb: snps,dwc3: document HS & SS OF graph ports")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> It is unclear to me whether the HS/SS numbering is fixed for all dwc3
> variants. I checked Allwinner H616 and Rockchip RK3588 and they both
> have HS as port 1 and SS as port 2.
> 
> This also doesn't cover a potential "multi-port" DWC3 implementation,
> which Qualcomm seems to have.

It breaks the current Qualcomm numbering on numerous boards.

> ---
>   Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> index 6c0b8b653824..4b6304bd2ec1 100644
> --- a/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
> @@ -410,11 +410,11 @@ properties:
>         property is used.
>   
>       properties:
> -      port@0:
> +      port@1:
>           $ref: /schemas/graph.yaml#/properties/port
>           description: High Speed (HS) data bus.
>   
> -      port@1:
> +      port@2:
>           $ref: /schemas/graph.yaml#/properties/port
>           description: Super Speed (SS) data bus.
>   


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
