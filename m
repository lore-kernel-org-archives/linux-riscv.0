Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2499DC25B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YDvh+Heti1EOF9A/2w6p/06YjJe0IzTxDEN5kUSn56s=; b=iuuy9hwy/luU2b
	xBo/Y590rDJnVXyVy9Z6FcHYigntdkUqid7RbdDjZ8hYrg8mJCeAwC7hRpIgoXrVG6AZAjXvvg1IT
	mgh5dId/sbkEMtYhA+KrHd86e5SwYL66z05hiU/BEG6TrNOXJAzdcyKIraZwviAuvEugQTg7kws3Q
	42Ag5yMzjichtVAD3cbm+mu4Qg2JGC4aBUdRr3gCC2c2Y2jB3tex101B5OJd/s6WFnAm7G2rdkchN
	dtQc7fCqvOe7MOb4Oypsr0abWESdjRA+wOabEv/j7CGuapMI4LmxMBaJPYl+ZvNkP1tGcb2pXwDPl
	txhefLeFHytJhygwfVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbJd-0000000FMeA-14ek;
	Mon, 27 May 2024 14:27:09 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBbJD-0000000FMKS-0kaT;
	Mon, 27 May 2024 14:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716819939; x=1717424739; i=markus.elfring@web.de;
	bh=WBD5fZbJKASRGqCVJjwjF0/sBlA3tJ1is50PhfAuexQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vX3VhVktvAsC3VEpXA8voazwMQsxjS3krCXirqMDaKAZ3hS5dLEBLJJcYH/CnQUD
	 LX884yPHk6T2CjcYkXrEWl3j7h+qjsuQr6krfiSjSbT9o7hELP6R1MOL3ePslfGIM
	 nUn+Cno9/WCN6Qt7tnw9wJkEH43RGHNxZEMJFx1wgs5oyZoUK9bL3MJfGys243Jnt
	 RWe1fGAwlia3NmWKjA9buWb62mNSN4PEffNKdBdV4ee2XJY9EETUDzwTlBNTo8KlT
	 kv2IvCfd4sTrUVWvA5STc6LBECDk34micjPSbDUs3ES7nw1m899uLKkS35frEPwr4
	 gv2XA0CeWBiz5oCAtw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mtgyj-1sV3WP3CJT-017EBc; Mon, 27
 May 2024 16:25:38 +0200
Message-ID: <96beb071-ec2c-475f-8fa2-d519a1b1dc28@web.de>
Date: Mon, 27 May 2024 16:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@nxp.com>, soc@kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chester Lin <chester62515@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Damien Le Moal <dlemoal@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Hal Feng <hal.feng@starfivetech.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Jacky Bai <ping.bai@nxp.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Joel Stanley <joel@jms.id.au>, Jonathan Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Orson Zhai
 <orsonzhai@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Viresh Kumar <vireshk@kernel.org>, Wells Lu <wellslutw@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, kernel@pengutronix.de,
 Peng Fan <peng.fan@oss.nxp.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
Subject: Re: [PATCH v2 04/20] pinctrl: starfive: Use scope based of_node_put()
 cleanups
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240504-pinctrl-cleanup-v2-4-26c5f2dc1181@nxp.com>
X-Provags-ID: V03:K1:+RyPoq5wWT0ZiaKtbHEM7oUjpYEVZsaQY6N7Y3GqAcCCbvu/2JH
 u2A1o9G2LZb7XdHLU3H69K/ZAgfhJvU9jxdpYiqAnNWG9BA1SqA6BdADoQmnmuaRrP6fAil
 8Vj3+benFoPx5AOFPUxJJt7XUQwXd4D4fxOV2u0S4nMX3GZIShaRs493PFfPvepvyAbRCtv
 sA0TyVvmVIL0Nk6+KE4zA==
UI-OutboundReport: notjunk:1;M01:P0:31oKYLNiYt8=;Hxns51jU3fPbLxYZhS6Zxy9O8BL
 qcSJkc+8tI81FYEgYUDEjPFyxO5CsD0G4Yr1KM0HiJM1RAdO+budqXdzmwIJQJO5p6Qgg2nVe
 YKgM7j5yLFrWsSzyaik+NFTvY+PW6VUe11QHVHkDricbyYHE5P9qzbTg86+yeRiFSOOQZksg9
 Xdrs6r2eTX9AowMfEJqKIKNofU6TcDdmBmEh2hd5cMEugRlaO/xU/ubiYD/XRmfkiGEw2Tk9X
 NW8zaQg81GL2PPwft4f4poEafCoYwl+CIrmPHqURH/2YArZiC4UDm9VTu3lTVR8WSADgs2juL
 WzjmfuF3Nb/H8VSJqqzY977EL7BYu0JfjXhqczsj/AJHIU8x7U9FkHQwVLD+/aW9Q5b/a9OPw
 LI1zUhjAqpzjkl9ILHME5dfhA7gkD4YfqDP0iVyWu+VnmZh/pblaybHt4rD5ZI5OfaaxJKTej
 VGs+IMuQBrMttXj/4DWsuAy6tL2ASvq9ajbc+W4PfJFRO8eiyAiXlRr8A1ilG3Wwi2usEs8x0
 pyhK5u8Ye84ZDNXC0xiObkf3AMdCBhIc+0OAJbS7S/lr4Wa88XoId5G8Ib9v3q3Danb/+yyUK
 5YECHUaogBhuwKJTAPf6awFWX25sWIKFsuMiL9bOP098OSKsVamHNvrpo4VNiI2KTPlO3jYMF
 m4zC6H3fMiyTT6q5AwrZQbBuPo5FStw2mq46jULp/VkrI2I5mP81da+ZdY2nuNi0JHqnAsXYb
 nCNKXCaTB/N8hkFz1ZJ6BaXlj9tzCbHQ/4RlK/pJC38X/hUvhfMryOHSpF+68/zEebizBSnT2
 Xmop5HdbEWKcl91rEpyYcoeHY0XK5F3NVihbciHAlOag4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_072644_227595_5AF20FA8 
X-CRM114-Status: GOOD (  10.41  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiBVc2Ugc2NvcGUgYmFzZWQgb2Zfbm9kZV9wdXQoKSBjbGVhbnVwIHRvIHNpbXBsaWZ5IGNvZGUu
CgpJIHNlZSBvcHBvcnR1bml0aWVzIHRvIGltcHJvdmUgYWZmZWN0ZWQgZnVuY3Rpb24gaW1wbGVt
ZW50YXRpb25zIGFub3RoZXIgYml0LgoKCuKApgo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9zdGFy
Zml2ZS9waW5jdHJsLXN0YXJmaXZlLWpoNzEwMC5jCuKApgo+IEBAIC01NDMsMTggKzU0MCwxOCBA
QCBzdGF0aWMgaW50IHN0YXJmaXZlX2R0X25vZGVfdG9fbWFwKHN0cnVjdCBwaW5jdHJsX2RldiAq
cGN0bGRldiwKPiAgCQkJcGlucyA9IGRldm1fa2NhbGxvYyhkZXYsIG5waW5zLCBzaXplb2YoKnBp
bnMpLCBHRlBfS0VSTkVMKTsKPiAgCQkJaWYgKCFwaW5zKSB7Cj4gIAkJCQlyZXQgPSAtRU5PTUVN
Owo+IC0JCQkJZ290byBwdXRfY2hpbGQ7Cj4gKwkJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCQl9Cj4K
PiAgCQkJcGlubXV4ID0gZGV2bV9rY2FsbG9jKGRldiwgbnBpbnMsIHNpemVvZigqcGlubXV4KSwg
R0ZQX0tFUk5FTCk7Cj4gIAkJCWlmICghcGlubXV4KSB7Cj4gIAkJCQlyZXQgPSAtRU5PTUVNOwo+
IC0JCQkJZ290byBwdXRfY2hpbGQ7Cj4gKwkJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCQl9CuKApgo+
IEBAIC02MjMsOCArNjIwLDYgQEAgc3RhdGljIGludCBzdGFyZml2ZV9kdF9ub2RlX3RvX21hcChz
dHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxkZXYsCj4gIAltdXRleF91bmxvY2soJnNmcC0+bXV0ZXgp
Owo+ICAJcmV0dXJuIDA7Cj4KPiAtcHV0X2NoaWxkOgo+IC0Jb2Zfbm9kZV9wdXQoY2hpbGQpOwo+
ICBmcmVlX21hcDoKPiAgCXBpbmN0cmxfdXRpbHNfZnJlZV9tYXAocGN0bGRldiwgbWFwLCBubWFw
cyk7Cj4gIAltdXRleF91bmxvY2soJnNmcC0+bXV0ZXgpOwrigKYKPiArKysgYi9kcml2ZXJzL3Bp
bmN0cmwvc3RhcmZpdmUvcGluY3RybC1zdGFyZml2ZS1qaDcxMTAuYwrigKYKPiBAQCAtMTc1LDE4
ICsxNzUsMTggQEAgc3RhdGljIGludCBqaDcxMTBfZHRfbm9kZV90b19tYXAoc3RydWN0IHBpbmN0
cmxfZGV2ICpwY3RsZGV2LAo+ICAJCXBpbnMgPSBkZXZtX2tjYWxsb2MoZGV2LCBucGlucywgc2l6
ZW9mKCpwaW5zKSwgR0ZQX0tFUk5FTCk7Cj4gIAkJaWYgKCFwaW5zKSB7Cj4gIAkJCXJldCA9IC1F
Tk9NRU07Cj4gLQkJCWdvdG8gcHV0X2NoaWxkOwo+ICsJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCX0K
Pgo+ICAJCXBpbm11eCA9IGRldm1fa2NhbGxvYyhkZXYsIG5waW5zLCBzaXplb2YoKnBpbm11eCks
IEdGUF9LRVJORUwpOwo+ICAJCWlmICghcGlubXV4KSB7Cj4gIAkJCXJldCA9IC1FTk9NRU07Cj4g
LQkJCWdvdG8gcHV0X2NoaWxkOwo+ICsJCQlnb3RvIGZyZWVfbWFwOwo+ICAJCX0K4oCmCj4gQEAg
LTIzMyw4ICsyMzMsNiBAQCBzdGF0aWMgaW50IGpoNzExMF9kdF9ub2RlX3RvX21hcChzdHJ1Y3Qg
cGluY3RybF9kZXYgKnBjdGxkZXYsCj4gIAkqbnVtX21hcHMgPSBubWFwczsKPiAgCXJldHVybiAw
Owo+Cj4gLXB1dF9jaGlsZDoKPiAtCW9mX25vZGVfcHV0KGNoaWxkKTsKPiAgZnJlZV9tYXA6Cj4g
IAlwaW5jdHJsX3V0aWxzX2ZyZWVfbWFwKHBjdGxkZXYsIG1hcCwgbm1hcHMpOwo+ICAJbXV0ZXhf
dW5sb2NrKCZzZnAtPm11dGV4KTsKCgoxLiBFeGNlcHRpb24gaGFuZGxpbmcgaXMgcmVwZWF0ZWQg
YSBmZXcgdGltZXMgYWxzbyBhY2NvcmRpbmcgdG8gbWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZXMu
CiAgIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gdXNlIGEgY29ycmVzcG9uZGluZyBsYWJlbCBs
aWtlIOKAnGVfbm9tZW3igJ0KICAgc28gdGhhdCBhbm90aGVyIGJpdCBvZiBkdXBsaWNhdGUgc291
cmNlIGNvZGUgY2FuIGJlIGF2b2lkZWQ/CiAgIGh0dHBzOi8vd2lraS5zZWkuY211LmVkdS9jb25m
bHVlbmNlL2Rpc3BsYXkvYy9NRU0xMi1DLitDb25zaWRlcit1c2luZythK2dvdG8rY2hhaW4rd2hl
bitsZWF2aW5nK2ErZnVuY3Rpb24rb24rZXJyb3Ird2hlbit1c2luZythbmQrcmVsZWFzaW5nK3Jl
c291cmNlcwoKMi4gV2lsbCBkZXZlbG9wbWVudCBpbnRlcmVzdHMgZ3JvdyBmb3IgdGhlIHVzYWdl
IG9mIGEgc3RhdGVtZW50IGxpa2Ug4oCcZ3VhcmQobXV0ZXgpKCZzZnAtPm11dGV4KTvigJ0/CgoK
UmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
