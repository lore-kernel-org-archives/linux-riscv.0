Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A05CC6B2A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6yCWIGs67JrJnrecZkfVmt7tVfanV4sRM6FYRvfJ9I=; b=lpKtkkieOOJL+9VdDL0odGLvkW
	gXHhUj07Bz1LJTKo90hlA5yROjZtAoaFgjFA4qJGF7elu/BSkHzI0JzBO5OjOvx8rUQCn1NwcwYzW
	DVn+xrU+4DsDgfzaV2YMvnEPTsuN3/hVkxnPDH1K0IjSb7bhyNjax977TgouX7ON2xp1KmBwK0eXX
	JVheay96u95+xaphE8nUf9IvLJGSkkuUILPk5tGib2rQDupR7ivv/UV5NLrkQsNlAXyYHwauH6qM1
	Q0c+AusNKnzL/AvWTQhnFLYuXrqySkB+aEb2kdbsXtuvVLuWvtEYAiOfoDFtn/uMd849jOe5jo6pF
	7bj0mVRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxtW-0000000FPdw-2EJe;
	Wed, 14 Oct 2026 12:15:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxtN-0000000FPbw-3iF9
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 12:15:41 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48870973bddso2422973f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 05:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791980132; x=1792584932; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0shSTot49RHkwbUZQlg7t0vkhs8LKxmI2yP6wvbvZU=;
        b=PU3Rw6PcoWLcr/74QhibD6UH8JqgYGILkCR5DyL5rQ+8p+8JKx+q2BVB+bd5HEuQV0
         lMvgh+/+CexVr0LRRL99vfRxL7gljUPl9eYSPiriG0QbMQWeMGuDLjFNQFMcEDtcB8jn
         tJU3Luuf8sU3dtPeQe7KK4MquDog7TeQ9DdvGj+I4miP3GoiBATqs2DNUu2Mwl1L0Jba
         MyK7uWtBBHAnjLq2vf2MlKzhqbLyrM2S/qEacB/ldP3riXRzLfNspf3vj0/gDzD9Xn2a
         A8WEqZ7m/fJNvWa7HUKQzo4cSdNneSF+pzO46s0K6ymTOaAia88VugpMjMsvR94D7vkv
         Xmpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791980132; x=1792584932;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0shSTot49RHkwbUZQlg7t0vkhs8LKxmI2yP6wvbvZU=;
        b=XEibmUW6L7I5P4WOr1TAHfbsh6oNtHxVrGsdPBS6VGVwvDzS6lzIDSI0rDM3/4Br8J
         eA2E+bg11dsxJxZkPw2YGJqOKrlgmoytPygd8QGYdVnPZsTSvz1pN73L2lEBafdpOmWJ
         aL5Oc0P0cNcJEt+kof36rziEVmfQyJmoU75Wa+WhI3sUDhQfk1wHeUI2qhEybgvYu3Gj
         TBeUU+eDJAh5IyNObHDzgm8pm7+moNwyIKwelMgRgIm/WNW8+91AziJptt280KUMex3H
         sJJ3kjStNkvVO6mFbwtsbwr9wrjzkFx81D9PdB4Dyeasuou74JqNntOWkbWePf7C+fUH
         ixag==
X-Forwarded-Encrypted: i=1; AKwUvBz81UuWhdmYUQeCQ/l1KSz9Gx5JaSb/M5FYaBCTyHh7sLLolzOLWEKDcx+qDHcX2IxOnQEG2vjMp1Mbfg==@lists.infradead.org
X-Gm-Message-State: AFq9FYInnNejRoo6E7kUh5DyNVOhdBUDdpJbfBuksZ1QKpN8nFPcOWRk
	8YPMLry8P4NJm27qCFDeRUtZdrfwy4HGl4NKPyRNY0OXYopXKFOP02Kk3/r6DEWEIm8=
X-Gm-Gg: AYBFou30TYYx0LiPUA1BzrK2d9o3mGbsCO02PuUFLbsMxo9Ns0sdCpReD88dey8lbqG
	+UcV5O5zfVIuwTXe79wHqJhEyCdZOxfWwdcJk8nPPv3UirhVwUZUvNZ+Kh9hl7g8865hjMq9hbl
	yfEVkH0W1tLvRxxRYQ7Igjp4iCAzl7B2L+gq3MdVWEha0QlfdJLeaeBEeITDWgJF3DAJHh/Lop8
	NraoDuC0GYFStVVu0MmfxD76qmt3sTbLaGPMkc0nYk1kGzOykyBy+Dz2rGoivPTUfviDTIXoeAL
	Ir2K+A+x0rMlvR1x4odz43wemZ42sr2/Bygl/YNw+viYmLioX5TJqCyxGxE44UH5QhvphDGjcAy
	JeOrWCd/ExYzNr1MjMo506qqgdaP3WgZVmT6hIFQL8o8joJF+YDgqiln9w9e0DlzR1OH+JPDpXT
	uaUHmxAT9phkUJ2SC7FNo0kvwwUYmlOCfk2UGmnOFpOFWUtPivBdpDYCERS9MsndN4FtpI0qr/I
	gSTy82T1Ziw+A4RkGJP56YqrdAuURBrMB/Pile1ZaDyep3eKMbR8q0=
X-Received: by 2002:a05:6000:2506:b0:48b:946:c1f7 with SMTP id ffacd0b85a97d-48db94bb90bmr29731276f8f.31.1791980130857;
        Wed, 14 Oct 2026 05:15:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4? ([2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bd1843sm11655892f8f.56.2026.10.14.05.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:15:30 -0700 (PDT)
Message-ID: <a47f24bb-7c49-4e39-9aac-69da552fb2b0@linaro.org>
Date: Wed, 14 Oct 2026 14:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
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
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
 <CAGXv+5H+ZZXnZKB4EzXP0O9f4YGHBHsz3YCRyRJgX9V6RW1eug@mail.gmail.com>
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
In-Reply-To: <CAGXv+5H+ZZXnZKB4EzXP0O9f4YGHBHsz3YCRyRJgX9V6RW1eug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_051534_031004_A0D7E866 
X-CRM114-Status: GOOD (  40.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTAvMTQvMjYgMTI6MTQsIENoZW4tWXUgVHNhaSB3cm90ZToKPiBPbiBXZWQsIE9jdCAxNCwg
MjAyNiBhdCA2OjQ04oCvUE0gTmVpbCBBcm1zdHJvbmcKPiA8bmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDEwLzE0LzI2IDExOjI5LCBDaGVuLVl1IFRzYWkgd3JvdGU6
Cj4+PiBPbiBXZWQsIE9jdCAxNCwgMjAyNiBhdCA1OjI44oCvUE0gTmVpbCBBcm1zdHJvbmcKPj4+
IDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPj4+Pgo+Pj4+IE9uIDEwLzE0LzI2
IDEwOjIwLCBDaGVuLVl1IFRzYWkgd3JvdGU6Cj4+Pj4+IFRoZSBEV0MzIGNvbnRyb2xsZXIgY2Fu
IG9wZXJhdGUgaW4gaG9zdCBtb2RlLiBJdCBkb2VzIHNvIHdpdGggYSBYSENJCj4+Pj4+IGNvbXBs
aWFudCBob3N0IGNvbnRyb2xsZXIuIFRoZSBYSENJIGhhcyB0d28gZG93bnN0cmVhbSBwb3J0cywg
b25lIGZvcgo+Pj4+PiBIUyBhbmQgb25lIGZvciBTUy4gVVNCIGRvd25zdHJlYW0gcG9ydHMgc3Rh
cnQgZnJvbSAxLCBub3QgMC4KPj4+Pgo+Pj4+IElzIHRoZXJlIHNvbWV0aGluZyBpbiBpbmRleCAw
IHdlIHdpbGwgbmVlZCB0byBkZWZpbmUgYXQgc29tZSBwb2ludCA/Cj4+Pgo+Pj4gT24gdGhlIGhv
c3Qgc2lkZSwgbm8uIERvd25zdHJlYW0gcG9ydHMgc3RhcnQgYXQgMS4KPj4+Cj4+PiBPbiB0aGUg
ZGV2aWNlIG1vZGUgc2lkZSwgSSBiZWxpZXZlIHRoZSBudW1iZXJzIGFyZSBjb21wbGV0ZWx5IG1h
ZGUgdXAuCj4+Pgo+Pj4+IFVzaW5nIDAgYXMgYmFzZSBmb3IgbnVtYmVyaW5nIGluIERUIGlzbid0
IGluY29tcGF0aWJsZSB3aXRoIHRoZSBVU0IKPj4+PiBzcGVjIHVzaW5nIGJhc2UgMSBmb3IgbnVt
YmVyaW5nLAo+Pj4KPj4+IEJ1dCB5b3UgZW5kIHVwIHdpdGggZGl2ZXJnaW5nIG51bWJlcmluZyBz
Y2hlbWVzLCBhbmQgaXQgZGl2ZXJnZXMKPj4+IGZyb20gb3RoZXIgVVNCIGNvbnRyb2xsZXJzLCBw
YXJ0aWN1bGFybHkgWEhDSSwgd2hpY2ggRFdDMyBlbWJlZHMuCj4+Pgo+Pj4gQW5kIGl0IGFsc28g
ZGlmZmVycyBmcm9tIHRoZSBudW1iZXJpbmcgY3VycmVudGx5IHVzZWQgZm9yIGRpcmVjdGx5Cj4+
PiBjb25uZWN0ZWQgb25ib2FyZCBkZXZpY2VzIChsaWtlIGh1YnMpLCB3aGljaCB1c2Ugb3IgZXhw
ZWN0IHRoZSBVU0IKPj4+IG51bWJlcmluZyBzY2hlbWUuCj4+Pgo+Pj4gU3VyZSB3ZSBjYW4gbWFr
ZSBEV0MzICJzcGVjaWFsIiwgZHJvcCBpbmNsdXNpb24gb2YgdXNiLWhjZC55YW1sLAo+Pj4gYW5k
IGR1cGxpY2F0ZSB0aGUgc2VjdGlvbiBmb3Igb25ib2FyZCBkZXZpY2VzLiBPbiBMaW51eCwgd2Ug
Y2FuCj4+PiBhZGQgc29tZSBtb3JlIGNvZGUgdG8geGhjaV9maW5kX3Jhd19wb3J0X251bWJlcigp
IHRvIG1ha2UgYW4KPj4+IGV4Y2VwdGlvbiBmb3IgRFdDMyBjb250cm9sbGVycy4KPj4+Cj4+PiBB
bHNvLCB1c2Jfb2ZfZ2V0X2Nvbm5lY3RfdHlwZSgpIGlzIGFscmVhZHkgYnJva2VuIGZvciBEV0Mz
IGJhc2VkCj4+PiBjb250cm9sbGVycyB0aGF0IG9ubHkgZGVzY3JpYmUgdGhlIEhTIGNvbm5lY3Rp
b24gYnV0IG5vdCB0aGUgU1MKPj4+IGNvbm5lY3Rpb24uIHVzYl9vZl9nZXRfY29ubmVjdF90eXBl
KCkgY3VycmVudGx5IGRvZXNuJ3QgY2FsbAo+Pj4gdXNiX2hjZF9maW5kX3Jhd19wb3J0X251bWJl
cigpIHNvIGJvdGggSFMgYW5kIFNTIGdldCBtYXBwZWQgdG8gcG9ydCAxLAo+Pj4gd2hpY2ggd291
bGRuJ3QgYmUgaW4gdGhlIERUIHNpbmNlIEhTIGlzIGN1cnJlbnRseSBwb3J0QDAuIEJ1dCBldmVu
IGlmCj4+PiBpdCBkaWQsIFNTIHdvdWxkIGdldCBtYXBwZWQgdG8gcG9ydCAyIGFueXdheS4KPj4+
Cj4+Pgo+Pj4gSU1ITyBoYXZpbmcgY29uc2lzdGVudCBudW1iZXJpbmcgYWNyb3NzIGNvbnRyb2xs
ZXIgdHlwZXMgd291bGQgYmUKPj4+IGJldHRlci4gVGhpcyBhdm9pZHMgbWFraW5nIHRoZSBVU0Ig
Y29yZSBhbmQgaHViIGNvZGUgZGVhbCB3aXRoIG1vcmUKPj4+IGV4Y2VwdGlvbnMsIGFuZCBhbHNv
IGVhc2llciB0byB1bmRlcnN0YW5kIGFuZCB3cml0ZSBkZXZpY2UgdHJlZXMuCj4+Cj4+IEkgd2Fz
IGluIHRoZSBpbXByZXNzaW9uIHRoZSBwb3J0IG51bWJlciBub3QgbmVjZXNzYXJpbHkgcmVmbGVj
dHMKPj4gYW4gYWN0dWFsIHBoeXNpY2FsIG51bWJlcmluZywgYW5kIGNhbiBiZSBhIGxvZ2ljYWwg
bnVtYmVyIHdlIHdvdWxkCj4+IHRoZW4gbWFwIGluIHRoZSBrZXJuZWwuCj4+Cj4+IEkgZG9uJ3Qg
c2VlIGFueSBpc3N1ZSBoZXJlIGhhdmluZyBiYXNlIDAgZm9yIHRoZSBiaW5kaW5ncyBhbmQgdGhl
bgo+PiBjb252ZXJ0aW5nIGl0IHRvIGJhc2UgMSBmb3IgdGhlIFhIQ0kgcG9ydCBudW1iZXJpbmcu
Cj4+Cj4+IEVhY2ggY29udHJvbGxlciAoSG9zdCwgRGV2aWNlLCBPVEcpIHdpbGwgaGF2ZSBpdCdz
IG93biBudW1iZXJpbmcgYW55d2F5LAo+PiBzbyB1c2luZyB0aGUgWEhDSSBudW1iZXJpbmcgb25s
eSBzb3VuZHMgYSBiYWQgaWRlYSBUQkguCj4gCj4gT0suIFNvIHdlIGtlZXAgdGhlIHBvcnQgbnVt
YmVyaW5nLCB3aGljaCBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgZW1iZWRkZWQKPiBkZXZpY2UgbnVt
YmVyaW5nLCBldmVuIGZvciB0aGUgc2FtZSBkdWFsIHJvbGUgY29udHJvbGxlcj8gU2VlIGJlbG93
Lgo+IAo+IEkgaG9wZSB5b3Ugc2VlIHdoeSBJIHRoaW5rIGl0IGlzIGNvbmZ1c2luZy4KPiAKPj4+
Cj4+Pj4+IFJlY29uY2lsZSB0aGUgZG93bnN0cmVhbSBwb3J0IG51bWJlcmluZyB3aXRoIHRoZSBj
b21tb24gVVNCIGhvc3QKPj4+Pj4gYmluZGluZywgcmVudW1iZXJpbmcgdGhlIGRvd25zdHJlYW0g
cG9ydCBudW1iZXJzIGZyb20gMCBhbmQgMSB0bwo+Pj4+PiAxIGFuZCAyLgo+Pj4+Pgo+Pj4+PiBU
aGlzIGlzIG5vbi1iYWNrd2FyZHMgY29tcGF0aWJsZSwgaG93ZXZlciBpdCB3b24ndCBicmVhayBj
dXJyZW50Cj4+Pj4+IG1ham9yIGltcGxlbWVudGF0aW9uczoKPj4+Pj4KPj4+Pj4gLSBkd2MzICJn
YWRnZXQgbW9kZSIgaW4gTGludXgga2VybmVsIG9ubHkgcmVxdWlyZXMgYSBjb25uZWN0aW9uIHRv
IGJlCj4+Pj4+ICAgICAgcHJlc2VudDsgaXQgZG9lc24ndCBtYXR0ZXIgd2hpY2ggcG9ydCBpdCBp
cwo+Pj4+PiAgICAgIC0gZHdjMyAiaG9zdCBtb2RlIiBPRiBncmFwaCBjb25uZWN0aW9ucyBhcmVu
J3Qgc3VwcG9ydGVkIHlldCBbMV0KPj4+Pj4gLSBGcmVlQlNEIGRvZXNuJ3QgdXNlIHRoZSBPRiBn
cmFwaCBmb3IgYW55dGhpbmcKPj4+Pj4gLSBVLWJvb3QgZG9lc24ndCB1c2UgdGhlIE9GIGdyYXBo
IGZvciBVU0IKPj4+Pj4gLSBPcGVuQlNEIGRvZXNuJ3Qgc3VwcG9ydCBkd2MzLCBvbmx5IHRoZSBY
SENJIGluIGR3YzMsIGFuZCBkb2Vzbid0IHVzZQo+Pj4+PiAgICAgIHRoZSBPRiBncmFwaCBmb3Ig
VVNCCj4+Pj4+IC0gY29yZWJvb3QgZG9lc24ndCB1c2UgdGhlIE9GIGdyYXBoIGZvciBhbnl0aGlu
Zwo+Pj4+PiAtIFplcGh5ciBkb2Vzbid0IHN1cHBvcnQgZHdjMwo+Pj4+PiAtIFRGLUEgZG9lc24n
dCB1c2UgdGhlIE9GIGdyYXBoIGZvciBhbnl0aGluZwo+Pj4+PiAtIEVESzIgZG9lc24ndCBzdXBw
b3J0IGR3YzMgYW5kIGRvZXNuJ3Qgc3VwcG9ydCBPRiBncmFwaAo+Pj4+PiAtIE9QLVRFRSBkb2Vz
bid0IHN1cHBvcnQgZHdjMyBhbmQgZG9lc24ndCBzdXBwb3J0IE9GIGdyYXBoCj4+Pj4+Cj4+Pj4+
IFsxXSBXSVAgdG8gdGllIE9GIGdyYXBoIHBvcnQgbm9kZSB0byBVU0IgcG9ydCBkZXZpY2UKPj4+
Pj4KPj4+Pj4gRml4ZXM6IGEzMzExM2Y3MzY5MyAoImR0LWJpbmRpbmdzOiB1c2I6IHNucHMsZHdj
MzogZG9jdW1lbnQgSFMgJiBTUyBPRiBncmFwaCBwb3J0cyIpCj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IENoZW4tWXUgVHNhaSA8d2Vuc3RAY2hyb21pdW0ub3JnPgo+Pj4+PiAtLS0KPj4+Pj4gSXQgaXMg
dW5jbGVhciB0byBtZSB3aGV0aGVyIHRoZSBIUy9TUyBudW1iZXJpbmcgaXMgZml4ZWQgZm9yIGFs
bCBkd2MzCj4+Pj4+IHZhcmlhbnRzLiBJIGNoZWNrZWQgQWxsd2lubmVyIEg2MTYgYW5kIFJvY2tj
aGlwIFJLMzU4OCBhbmQgdGhleSBib3RoCj4+Pj4+IGhhdmUgSFMgYXMgcG9ydCAxIGFuZCBTUyBh
cyBwb3J0IDIuCj4+Pj4+Cj4+Pj4+IFRoaXMgYWxzbyBkb2Vzbid0IGNvdmVyIGEgcG90ZW50aWFs
ICJtdWx0aS1wb3J0IiBEV0MzIGltcGxlbWVudGF0aW9uLAo+Pj4+PiB3aGljaCBRdWFsY29tbSBz
ZWVtcyB0byBoYXZlLgo+Pj4+Cj4+Pj4gSXQgYnJlYWtzIHRoZSBjdXJyZW50IFF1YWxjb21tIG51
bWJlcmluZyBvbiBudW1lcm91cyBib2FyZHMuCj4+Pgo+Pj4gWWVzLiBJdCBicmVha3MgX2V2ZXJ5
b25lXyB1c2luZyB0aGUgY3VycmVudCBudW1iZXJpbmcgaW4gdGhlIHNlbnNlIHRoYXQKPj4+IHRo
ZXkgYXJlIG5vIGxvbmdlciB2YWxpZCwgYnV0IHNob3VsZCBub3QgYWZmZWN0IGFjdHVhbCB1c2Fn
ZS4KPj4KPj4gT2xkZXIgRFQgYXJlIHN1cHBvc2VkIHRvIGJlIHdvcmtpbmcgb24gbmV3IGtlcm5l
bHMsIHlvdSB3aWxsIGJyZWFrIEFCSQo+PiBhbmQgd2lsbCBicmVhayB1c2FnZSBpZiB0aGUgcG9y
dCBudW1iZXJpbmcgaXMgZW5mb3JjZWQgdG8gZW5hYmxlZCBlbWJlZGRlZAo+PiBodWJzIGZvciBl
eGFtcGxlLgo+IAo+IE9uIHRoYXQgZnJvbnQsIGVtYmVkZGVkIGh1YnMgYWxyZWFkeSByZXF1aXJl
IHlvdSB0byB1c2UgdGhlIFVTQiBudW1iZXJpbmcuCj4gCj4gSWYgeW91IHdyaXRlCj4gCj4gICAg
ICBkd2MzIHsKPiAgICAgICAgICBodWJAMCB7Cj4gICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
dXNiMDEyMyxhYmNkIjsKPiAgICAgICAgICAgICAgcmVnID0gIjAiOwo+ICAgICAgICAgIH07Cj4g
ICAgICB9Owo+IAo+IEl0IHdvbid0IG1hdGNoIGFueXRoaW5nLiBUaGUgY3VycmVudCBVU0IgSENE
IGJpbmRpbmcgZG9lc24ndCBwcmV2ZW50IHlvdQo+IGZyb20gdXNpbmcgcG9ydCAwLCBidXQgdGhl
IGtlcm5lbCB3b24ndCB0aWUgdGhlIFVTQiBkZXZpY2UgdG8gaXQsIGV2ZW4KPiBpZiBpdCBpcyBh
IHNpbmdsZSBwb3J0IFVTQiBjb250cm9sbGVyLiBBcyBJIG1lbnRpb25lZCwgVVNCIGRvd25zdHJl
YW0KPiBwb3J0cyBzdGFydCBhdCAxLCBldmVuIGZvciByb290IGh1YnMgdGhhdCBvbmx5IGhhdmUg
MSBkb3duc3RyZWFtIHBvcnQuCj4gCj4gVGhlIGtlcm5lbCBhbHNvIGRvZXNuJ3QgY2hlY2sgaWYg
dGhlIGNvbXBhdGlibGUgcHJvcGVydHkgaXMgY29ycmVjdCwgYnV0Cj4gdGhhdCBpcyBhIHNlcGFy
YXRlIGlzc3VlLiBNYXliZSBpdCBzaG91bGQgdGhvdWdoLCBzbyBwZW9wbGUgY2FuIHNlZSB0aGF0
Cj4gdGhlaXIgRFQgaXMgaW5jb3JyZWN0LCBsaWtlIGlmIHRoZXkgc3dhcHBlZCBIUyBhbmQgU1Mg
cG9ydHMgZm9yIGEgVVNCIDMueAo+IGh1Yi4KClRCSCB0aGlzIFVTQiBkZXZpY2UgYmluZGluZ3Mg
Zm9yIGVtYmVkZGVkIGh1YnMgaXMgd3JvbmcgaW4gbWFueSBvZiB3YXlzLgoKU28sIGlzIHRoZSBk
b3duc3RyZWFtIHBvcnQgaW5kZXggYSBudW1iZXJpbmcgc2NoZW1lIGZyb20gTGludXggPyBXaWxs
IGVhY2ggcG9ydAp3aWxsIGhhdmUgdGhlIHNhbWUgbnVtYmVyIG9uIGV2ZXJ5IE9TIGltcGxlbWVu
dGF0aW9uID8gRG8gYWxsIE9TZXMgaW1wbGVtZW50CnRoZSByb290IGFzIGEgdGhlIHZpcnR1YWwg
cm9vdCBodWIgPyBkbyB0aGV5IGFsd2F5cyB1c2UgdGhlIHNhbWUgaW5kZXhpbmcgPwoKTXkgY29t
cGFyaXNvbiBpcyBQQ0koZSkgd2hlcmUgdGhlIGNvbnRyb2xsZXIgcG9ydCBudW1iZXIgaXMgYSBM
aW51eCBpbnRlcm5hbApudW1iZXJpbmcgd2UgZG9uJ3QgdXNlIGluIERULCB3ZSBvbmx5IHVzZSB0
aGUgQkRGIG9mIHRoZSBkb3duc3RyZWFtIGJ1cy9lbmRwb2ludHMKZW51bWVyYXRpb24gd2hpY2gg
aXMgc3RhbmRhcmRpemVkLgoKU28gSSB0aGluayB3ZSBzaG91bGQgYWN0dWFsbHkgdXNlIHRoZSBz
YW1lIHNjaGVtZSBmb3IgdXNiLCBidXQgaGF2aW5nIGEgc3Vibm9kZQpwZXIgY29udHJvbGxlciB1
c2IgcG9ydCB3aXRoIGEgaGllcmFyY2h5IG9mIG5vZGVzIHJlcHJlc2VudGluZyBkZXZpY2VzLgoK
S2VlcGluZyB0aGUgY3VycmVudCBVU0IgZGV2aWNlIGJpbmRpbmdzIGFuZCB0cnlpbmcgdG8gbWFr
ZSBpdCB3b3JrIGlzIHdyb25nIGhlcmUuCgpOZWlsCgo+IAo+IAo+IENoZW5ZdQo+IAo+IAo+PiBO
ZWlsCj4+Cj4+Pgo+Pj4gVGhpcyBjb21tZW50IHJlZmVycyB0byAibXVsdGlwb3J0IiBjb250cm9s
bGVycyBmcm9tIFF1YWxjb21tIFsxXSwgd2hpY2gKPj4+IHdvdWxkIGhhdmUgcG9ydHMgYmV5b25k
IDEgYW5kIDIuCj4+Pgo+Pj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQy
MDA0NDkwMS44ODQwOTgtOC1xdWljX2tyaXNrdXJhQHF1aWNpbmMuY29tLwo+Pj4KPj4+Cj4+Pj4+
IC0tLQo+Pj4+PiAgICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBz
LGR3YzMtY29tbW9uLnlhbWwgfCA0ICsrLS0KPj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1jb21tb24ueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc25wcyxkd2MzLWNvbW1vbi55
YW1sCj4+Pj4+IGluZGV4IDZjMGI4YjY1MzgyNC4uNGI2MzA0YmQyZWMxIDEwMDY0NAo+Pj4+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1jb21t
b24ueWFtbAo+Pj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L3NucHMsZHdjMy1jb21tb24ueWFtbAo+Pj4+PiBAQCAtNDEwLDExICs0MTAsMTEgQEAgcHJvcGVy
dGllczoKPj4+Pj4gICAgICAgICAgIHByb3BlcnR5IGlzIHVzZWQuCj4+Pj4+Cj4+Pj4+ICAgICAg
ICAgcHJvcGVydGllczoKPj4+Pj4gLSAgICAgIHBvcnRAMDoKPj4+Pj4gKyAgICAgIHBvcnRAMToK
Pj4+Pj4gICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9w
b3J0Cj4+Pj4+ICAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBIaWdoIFNwZWVkIChIUykgZGF0YSBi
dXMuCj4+Pj4+Cj4+Pj4+IC0gICAgICBwb3J0QDE6Cj4+Pj4+ICsgICAgICBwb3J0QDI6Cj4+Pj4+
ICAgICAgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+
Pj4+PiAgICAgICAgICAgICBkZXNjcmlwdGlvbjogU3VwZXIgU3BlZWQgKFNTKSBkYXRhIGJ1cy4K
Pj4+Pj4KPj4+Pgo+PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
