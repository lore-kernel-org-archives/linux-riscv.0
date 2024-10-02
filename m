Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FF1CF31B4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 11:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjajJTIimA6sJ3NeKayjKK2z64Zd8V/7QhOSNOQsrcA=; b=V+CJ7LWNlU41UGeHmIRgzPiFQq
	4OAQt7T5BOlvxucMy4vfrU8tNNJiFRZMdMzf9moxSMD30dSLhGEzZj6mje86H8SFGaboRZGWzDAH6
	toRNcDKGEhwT3jJpOWEsJsI6P1TiEZU6M02lly1DLnBOdThIG183083xE+HU3TrdkOWoTJFSYZxof
	rs6YF2tF0gP9J18PRPEpkRqMS8evDL31bN+GlMY/5gGUbnPSeKj1rDj4ml9M27LmUEKqGQIKB6ucE
	v63s6rKdOvIKZ/jykez8W1yVnAPFCHDfqAvA785wdoAYBKAA7fzREiWAIpDrIEPQR7yVyPwXUEmwa
	3PIGFzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxWd-00000005esA-1Azw;
	Wed, 02 Oct 2024 11:28:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxPT-00000005dDf-3HlU
	for linux-riscv@lists.infradead.org;
	Wed, 02 Oct 2024 11:20:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37cd5016d98so3395196f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Oct 2024 04:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727868046; x=1728472846; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xuMn+uvzgNhXlVl6NvssHiZDUL25KUVzV3NB9k+ro68=;
        b=fcPvs+C9ANPfGLDTevme/p3sXaF4Oeh321Uh+7UuwbSquNZpE3kuJGiQCG9t8TFmLU
         /POwhEtyNeCG2KQNztaw6/FqJBZwPp054TYqEt2qn7QmukDmCSkEDgx+ALMb4Jp0vTGZ
         vpJ4wOtiygmjam6sS782tkF/IL54h2kPdKmcop9kPyQL2OW954RwxhtDfem33BtFXPKJ
         pUOawgmCx87V08Bl/xcsBZj8RlQM1j/XnVQE+zLe60c9xj+IcF1fsdr251jZfC9/9hEY
         l1QVSuaWAH0yhp/5l+p2IbUEqi2bLYRCO9fhkWvh5P6adEZCl3pswbsv2XO63Ben+Bga
         9XxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727868046; x=1728472846;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xuMn+uvzgNhXlVl6NvssHiZDUL25KUVzV3NB9k+ro68=;
        b=vNWH25y2kDQRqodc/od1FaDiLQ4QoeVkgMLuvksj/0LxgwUhqk+xXpyngOTlr1ol7v
         pSIQw8qLNoV3gK7T3LPSCtO/3QN17OpHSQVgyjmOIdyFt9let0fWDtXjrnsMz+nN/m3N
         O/g59pTxpDs8ZkO3uYUfyYze8l64xFLClXqfD/p6ZnYBI9zdlQQcmf/rjuMx8FPCvDDT
         sLauGHyhtPBib5mY8qCT82PbNkJwKKbIFBHo3yiaPIjzZHTrxYdAHdJXa2XFGE9GL98J
         AG4F2O8cBmFykDeI/9jKnziDAKVCBjgl+Io4fnBtgjkznf7eae8FiZzGXsciMl1YNbDO
         PPDw==
X-Forwarded-Encrypted: i=1; AJvYcCUC2KDGpmL21nHH80KV1MFtq2SYDGv5jzA/korNRdlkRsWiWWBks1+RInWObpeF4rrQ3AJO40ahiKKlmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVXIQP8Wc8kiUo0J1+MCQ7k3We8X1UKOLdbnCX1kDXEU/rG1Kp
	VKTmdoGRhFiBmJ/X633JXlFLOE7iEiKdIXMWLMxvulZ10m6sYFApeBXQjpqLCss=
X-Google-Smtp-Source: AGHT+IG8p3dWVjk/6hZCzmXj39xeg0ImZtG3Merz+EByl/MIpSdWVEPWB/AKs0ghnMfzwQPyYhCtlQ==
X-Received: by 2002:a5d:4843:0:b0:374:c142:80e7 with SMTP id ffacd0b85a97d-37cfb8b14eamr2128521f8f.1.1727868045945;
        Wed, 02 Oct 2024 04:20:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ce64:813c:ca8:36b5? ([2a01:e0a:982:cbb0:ce64:813c:ca8:36b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6488sm13786576f8f.46.2024.10.02.04.20.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 04:20:45 -0700 (PDT)
Message-ID: <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
Date: Wed, 2 Oct 2024 13:20:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-hula-unwashed-1c4ddbadbec2@spud>
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
In-Reply-To: <20241002-hula-unwashed-1c4ddbadbec2@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_042047_901610_1D1D08F9 
X-CRM114-Status: GOOD (  10.86  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 02/10/2024 12:48, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> I like this one better than qualcomms and wish to use it for the
> PolarFire SoC clock drivers.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/clk/Kconfig                           |  4 ++
>   drivers/clk/Makefile                          |  1 +
>   drivers/clk/{meson => }/clk-regmap.c          |  2 +-
>   drivers/clk/meson/Kconfig                     | 46 +++++++++----------
>   drivers/clk/meson/Makefile                    |  1 -
>   drivers/clk/meson/a1-peripherals.c            |  2 +-
>   drivers/clk/meson/a1-pll.c                    |  2 +-
>   drivers/clk/meson/axg-aoclk.c                 |  2 +-
>   drivers/clk/meson/axg-audio.c                 |  2 +-
>   drivers/clk/meson/axg.c                       |  2 +-
>   drivers/clk/meson/c3-peripherals.c            |  2 +-
>   drivers/clk/meson/c3-pll.c                    |  2 +-
>   drivers/clk/meson/clk-cpu-dyndiv.c            |  2 +-
>   drivers/clk/meson/clk-dualdiv.c               |  2 +-
>   drivers/clk/meson/clk-mpll.c                  |  2 +-
>   drivers/clk/meson/clk-phase.c                 |  2 +-
>   drivers/clk/meson/clk-pll.c                   |  2 +-
>   drivers/clk/meson/g12a-aoclk.c                |  2 +-
>   drivers/clk/meson/g12a.c                      |  2 +-
>   drivers/clk/meson/gxbb-aoclk.c                |  2 +-
>   drivers/clk/meson/gxbb.c                      |  2 +-
>   drivers/clk/meson/meson-aoclk.h               |  2 +-
>   drivers/clk/meson/meson-eeclk.c               |  2 +-
>   drivers/clk/meson/meson-eeclk.h               |  2 +-
>   drivers/clk/meson/meson8-ddr.c                |  2 +-
>   drivers/clk/meson/meson8b.c                   |  2 +-
>   drivers/clk/meson/s4-peripherals.c            |  2 +-
>   drivers/clk/meson/s4-pll.c                    |  2 +-
>   drivers/clk/meson/sclk-div.c                  |  2 +-
>   drivers/clk/meson/vclk.h                      |  2 +-
>   drivers/clk/meson/vid-pll-div.c               |  2 +-
>   .../meson => include/linux/clk}/clk-regmap.h  |  0
>   32 files changed, 53 insertions(+), 53 deletions(-)
>   rename drivers/clk/{meson => }/clk-regmap.c (99%)
>   rename {drivers/clk/meson => include/linux/clk}/clk-regmap.h (100%)
> 
<snip>

I don't have objections, but I think Stephen didn't like the idea
a few years ago, but perhaps it has changed...

Anyway, take my:
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
