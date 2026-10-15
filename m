Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327EECC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHWsm+KtRD2POoFwkLtDyhjMxqPHQiACOSGl1iYUrp0=; b=uNUtov77hm/+cfyG8664mWryhD
	R3ibkRpDyAEuu2j63w4WqYB68PKi5KH1lcHWDz/3GV7zWR64JrScH7Nla1v4A3iJdiiHwEtNc0vIs
	LDkwdmppOTX5JeQxubQIpJj5EIDUZtuMuJqYoqat7R3afTDm1/kHTiBcozxTq/GlyJCk9J0VG1aY+
	XsjODEMbx2w2YuUxrfWjyrTKN+drn2ZUy9/JwgInEsuOX74rpj/D9m+hb5CoygCZpqN4yFvFc8y0J
	7BRJDNAqazLnWcOYiqYnXX/Teudn48YhZSYnYq5KKowE6URKOQ9TAk3uakElXnzkECubM6Tdoq9Mp
	ENl2tk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG8s-0000000H3fp-3NKU;
	Thu, 15 Oct 2026 07:44:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG8q-0000000H3eG-2okG
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 07:44:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a16c399641so47931925e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 00:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792050283; x=1792655083; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+dvMNnzmsfKlXaQReE9W1eWaATaq+JUXJSwSZca7lFE=;
        b=ieIsU/2t9tZC/o3eAQUYrNmfl6sHns4GuOElOaPNadGHABJ8Wr49W8zG7Ymoq7dHS5
         7HuRUJCJay9Jl9M+RSrRg21oTKoYWKpgFd1sqK3+nZZ4KcPcVfgGHdO3X3dqODfFmc3H
         uGHeLWGweHsnSwxqiGG0kxSkPslEKQFgDGUTrKkJo8Gz3uu0+503/ANUwfoghbc3Dp5s
         6my7LiP5cCnSAPS2ggpmw/sJV1EeeM5vzwyi5iT7ArC79kMvvI10hRksudIDLjuPi1vE
         3HSsw53ZZm/NUC0gIS1pqjszPlmMgoahnjSXKELHQqqqFev+K9Vn0hsv4UOwUdGr0oM2
         4j9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050283; x=1792655083;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+dvMNnzmsfKlXaQReE9W1eWaATaq+JUXJSwSZca7lFE=;
        b=O9nKDQwmEAE6dDehMVI+LhW/XoVew5112/7X/9JV+FN2foP5AQDFrUafqEcEEVXkWr
         ap+tRGBLitnBnKv4Mz4YsGVcJi7rNKFyrGPrIRRiTwyIaIwxbX/NVJV5wMMZR4awOF2t
         ohf5srA9lkXL8DK91gJSS0GMqgcxx6CQmwL7Z516MCfk5OSIkGYsXDg1nHaIJTGFmyde
         91uZJFto9Pk2dEQ6jPaxwDMyX8TBpr1mKunvdkfeF01wYCcudsaGbCGHAC7cuA2Ykp5c
         LslublPzB82LixoXZgA4uA5pFaeC4YmYuJ/ha5LLyZi12S/fLEUAVXiZCZfCl7ca4VKO
         xykA==
X-Forwarded-Encrypted: i=1; AKwUvBx0IRIgWtA7gif4mvCJ0eh9+q8jdEjXqXUYIO0anl4zJcaID1qu3eLG8BKpJUg2M46zz4Ue+Jusi/IRTw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1kyTZgWpHkyx9Itei4zLETL2lTa2wABq+tm6pm1+va6VVnpue
	JidIk8+3GVVdBfGYTa2kSsLgyePSeHRw8ySt6MbBl4+cv8aO7DCQD7cpSG+gTp2TqwE=
X-Gm-Gg: AYBFou3j9dVXL1OEWY3breNMDjbF5tXDqZoMqGE7wqxapMo0PsCwi9Frs0G+x/3erpS
	bb00hXbNJQi6kdSZDWJsiTtY0abOyahqZHcqS62pb672gNwhg4H25AxIctaIYHCO8WoAkzHR6jz
	7JqXNwe0ttN0Oe9KtYPtZ40Lgm6wRknFyl+vNHtEwgCaRkZERy6/eUoN5/WkJfT0jq66su4xi7k
	sORS77XyvYWSqxl9ka28YkBceP8ekAkHk5aoz3ftIEpAacPZCVyZ98IK34HjzC558m3DU8m59dg
	4SaYxmGdYBE/E1A71yzDNFg//F6MwdTR3wTYGIs27G8gA56S5c+CRtIXCNtuc+FS55q6EVr7SYG
	kpAb0AaKSyOlNcxqCpzJ1RJYhvtkzmb2DGj2hfxg2lBgW3CU8AczAWa5quEB1HgUJKZHLFyG55O
	cRTMOPuK3rK3gne6lipPdVIEpmIhARANdcusrAF0tDZQfrtI7BTyew9jK3gmkq9rpzdkdQp6rFY
	3ouUSiJN5M3uqMKBVPc3PW8ac03yOyOjVC6D4Xl+qO6g7R0FAZw/Y4=
X-Received: by 2002:a05:600c:4685:b0:4a0:27eb:49b with SMTP id 5b1f17b1804b1-4a18e4ae6fcmr385008175e9.30.1792050282515;
        Thu, 15 Oct 2026 00:44:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4? ([2a01:e0a:106d:1080:fdbf:f373:6d5b:93e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48ded185de7sm8548506f8f.31.2026.10.15.00.44.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:44:42 -0700 (PDT)
Message-ID: <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
Date: Thu, 15 Oct 2026 09:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Chen-Yu Tsai <wenst@chromium.org>
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
 <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
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
In-Reply-To: <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_004444_740605_555F3C0A 
X-CRM114-Status: GOOD (  18.00  )
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

T24gMTAvMTQvMjYgMTg6MzYsIEtvbnJhZCBEeWJjaW8gd3JvdGU6Cj4gT24gMTAvMTQvMjYgMTE6
NDQgQU0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+PiBPbiAxMC8xNC8yNiAxMToyOSwgQ2hlbi1Z
dSBUc2FpIHdyb3RlOgo+Pj4gT24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgNToyOOKAr1BNIE5laWwg
QXJtc3Ryb25nCj4+PiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4+Pj4KPj4+
PiBPbiAxMC8xNC8yNiAxMDoyMCwgQ2hlbi1ZdSBUc2FpIHdyb3RlOgo+Pj4+PiBUaGUgRFdDMyBj
b250cm9sbGVyIGNhbiBvcGVyYXRlIGluIGhvc3QgbW9kZS4gSXQgZG9lcyBzbyB3aXRoIGEgWEhD
SQo+Pj4+PiBjb21wbGlhbnQgaG9zdCBjb250cm9sbGVyLiBUaGUgWEhDSSBoYXMgdHdvIGRvd25z
dHJlYW0gcG9ydHMsIG9uZSBmb3IKPj4+Pj4gSFMgYW5kIG9uZSBmb3IgU1MuIFVTQiBkb3duc3Ry
ZWFtIHBvcnRzIHN0YXJ0IGZyb20gMSwgbm90IDAuCj4gCj4gWy4uLl0KPiAKPiAKPj4+IElNSE8g
aGF2aW5nIGNvbnNpc3RlbnQgbnVtYmVyaW5nIGFjcm9zcyBjb250cm9sbGVyIHR5cGVzIHdvdWxk
IGJlCj4+PiBiZXR0ZXIuIFRoaXMgYXZvaWRzIG1ha2luZyB0aGUgVVNCIGNvcmUgYW5kIGh1YiBj
b2RlIGRlYWwgd2l0aCBtb3JlCj4+PiBleGNlcHRpb25zLCBhbmQgYWxzbyBlYXNpZXIgdG8gdW5k
ZXJzdGFuZCBhbmQgd3JpdGUgZGV2aWNlIHRyZWVzLgo+Pgo+PiBJIHdhcyBpbiB0aGUgaW1wcmVz
c2lvbiB0aGUgcG9ydCBudW1iZXIgbm90IG5lY2Vzc2FyaWx5IHJlZmxlY3RzCj4+IGFuIGFjdHVh
bCBwaHlzaWNhbCBudW1iZXJpbmcsIGFuZCBjYW4gYmUgYSBsb2dpY2FsIG51bWJlciB3ZSB3b3Vs
ZAo+PiB0aGVuIG1hcCBpbiB0aGUga2VybmVsLgo+Pgo+PiBJIGRvbid0IHNlZSBhbnkgaXNzdWUg
aGVyZSBoYXZpbmcgYmFzZSAwIGZvciB0aGUgYmluZGluZ3MgYW5kIHRoZW4KPj4gY29udmVydGlu
ZyBpdCB0byBiYXNlIDEgZm9yIHRoZSBYSENJIHBvcnQgbnVtYmVyaW5nLgo+IAo+IEkgdGhvdWdo
dCBiYXNlMSBjb21lcyBmcm9tIHRoZSBVU0Igc3BlYyBhbmQgbm90IGp1c3QgWEhDST8KClRoaXMg
aXMgbXkgcXVlc3Rpb24sIGlzIHRoZSBzcGVjIHNheXM6IGVhY2ggVVNCIEhvc3QgQ29udHJvbGxl
ciByb290CnBvcnQgc2hhbGwgYmUgY29uc2lkZXJlZCBhcyBhIHBvcnQgb2YgYSBIdWIgYW5kIG51
bWJlcmVkIHRoZSBzYW1lIHdheSwKdGhlbiBmaW5lLCBsZXQncyB1c2UgdGhlIGJhc2UxIG51bWJl
cmluZy4KCkFzIEkgdW5kZXJzdGFuZCBob3cgVVNCIGlzIGFyY2hpdGVjdHVyZWQsIGFsbCBkb3du
c3RyZWFtIHBvcnRzIG9mIEh1YnMKYXJlIG51bWJlcmVkIGluIGJhc2UxLCBhbmQgdGhlIHdob2xl
IHRvcG9sb2d5IGlzIGJhc2VkIG9uIHRoYXQuCgpCdXQgaGVyZSwgd2UgYXJlIHNwZWFraW5nIG9m
IHBoeXNpY2FsbHkgc2VwYXJhdGUgVVNCIGJ1c3Nlcywgb25lClVTQjIuMCBhbmQgb25lIFVTQjMu
MCwgYSBjb250cm9sbGVyIGNvdWxkIGFsc28gaGF2ZSAxMCBVU0IyLjAgcG9ydHMKYW5kIDUgVVNC
My4wIHBvcnRzLCB3aG8ga25vd3MuIFRoZSB3YXkgdGhvc2Ugd2lsbCBiZSBudW1iZXJlZCBpcyBu
b3QKcGFydCBvZiB0aGUgc3BlY2lmaWNhdGlvbiBiZWNhdXNlIHRoZSBzcGVjaWZpY2F0aW9uIG9u
bHkgdGhlIGRlZmluZXMKdGhlIHRvcG9sb2d5IG9mIGFuIFVTQiBidXMsIGxpa2UgUENJKGUpIGRl
ZmluZXMgdGhlIHRvcG9sb2d5IG9uIGEgUENJKGUpIGJ1cy4KCkhvdyB3ZSBhZ2dyZWdhdGUgYWxs
IHRob3NlIGJ1c3NlcyB0byBhYnN0cmFjdCB0aGVtIHRvIHNvZnR3YXJlIGlzIG5vdApwYXJ0IG9m
IHRoZSBzcGVjLCB3ZSBjaG9zZSB0byBkZWNsYXJlIGEgZmFrZSByb290IEh1YiB3aXRoIGEgcGh5
c2ljYWwKZG93bnN0cmVhbSBwb3J0IGFzIGEgdmlydHVhbCBwb3J0IG9mIHRoZSByb290IEh1Yiwg
ZmluZSBidXQgdGhpcyBpcwpwdXJlbHkgc29mdHdhcmUgYWJzdHJhY3Rpb24uCgpXZSBtYXkgb25s
eSB1c2UgdGhlIGhhcmR3YXJlIElQIHBvcnQgbnVtYmVyaW5nIGluIHRoZSBiaW5kaW5ncywgbm90
CnRoZSBzb2Z0d2FyZSBhYnN0cmFjdGlvbi4KCldlIGNvdWxkIHVzZSB0aGUgYmFzZTEgdG8gZGVz
Y3JpYmUgdGhlIERXQzMgcG9ydHMsIGJ1dCBob3cgdG8gZGVzY3JpYmUKYWxsIHRoZSBwaHlzaWNh
bCBVU0IgYnVzc2VzIGEgY29udHJvbGxlciBjYW4gZXhwb3NlID8gV2UgbWF5IG5vdCBsaW1pdAp0
aGUgYmluZGluZ3MgdG8gVVNCMi4wIGFuZCBVU0IzLjAgcG9ydHMgb25seS4KCkhvdyBhYm91dCB0
aGUgVVNCNCwgZG9lcyBpdCB1c2UgdGhlIFVTQjMuMCBwb3J0ID8KCk5laWwKCj4gCj4gS29ucmFk
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
