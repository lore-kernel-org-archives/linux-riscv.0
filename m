Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7ABC982D2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xKBafdpQHo8dCE/36egG1ma8+fnVZA8OEmViwwbrlFY=; b=WIVDfVQIx6roix
	+J0M3BzboAAXBmZv66IsZ30+XzdrphNN92GeptEvRbkGnSBEoEbkUHLxSNTKDENlXvbDp3gKyiez6
	Uf5sawWIfoFQWTZFMFt/CePEZj9Dp4ek5+9jyUsZ2+yLhQ8wjL1Ttmaa3PtP6TIV+0WjuGVDQtinT
	bj1KVAO4dFwHY0ZJFC6j8CSFtx823i6/sMJyOp/rLDAwZPisqJhOJUV+oRP/9FNqn2exwCWbrE+jf
	nliKPupTU/v1rrbt38EeZBr9/JkqKXDVca98EMYl3V2LrckrC/ddeTuft1tTIGk9a8VYCAHA8W5Pz
	5sXYspW9Or0RPPooqxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rcl-0000000DWas-3gfz;
	Fri, 18 Sep 2026 05:59:03 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Rcf-0000000DWYx-3lau;
	Fri, 18 Sep 2026 05:58:59 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-01 (Coremail) with SMTP id qwCowAAn_O8C06xqtWNICA--.15380S2;
	Fri, 18 Sep 2026 13:58:28 +0800 (CST)
Message-ID: <1aa49a9bcf5c5a16ce38b57f8f508a31ca70c1ce.camel@iscas.ac.cn>
Subject: Re: [PATCH v4 05/20] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Andrzej Hajda	 <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
 Yan <andy.yan@rock-chips.com>, Philipp Zabel	 <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng	
 <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
 Belhachemi	 <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
 Brunet	 <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Marek Szyprowski
 <m.szyprowski@samsung.com>,  Maud Spierings <maud_spierings@murena.io>,
 Graham Markall <hello@big-grey.co.uk>, Chaoyi Chen	
 <chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <u.kleine-koenig@baylibre.com>
Date: Fri, 18 Sep 2026 13:58:26 +0800
In-Reply-To: <20260915-jh7110-clean-send-v4-5-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
		<CGME20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44@eucas1p2.samsung.com>
	 <20260915-jh7110-clean-send-v4-5-f0e4fd6f2cc8@samsung.com>
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: qwCowAAn_O8C06xqtWNICA--.15380S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4fJrW7tF1UKFykGFy5XFb_yoW8GF4xpF
	sakFZrJFyIgrn3W3y8J3WUK3y7Wr1xA3W0gF1jq3W2grs8GFWFqr4Y9r1qgF4UJFW8CFW8
	ZFsY9rWYvr1vyF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvGb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjxUaGYpUUUUU
X-Originating-IP: [112.94.103.44]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_225858_327995_B7EFED0F 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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

5ZyoIDIwMjYtMDktMTXkuoznmoQgMTc6MzIgKzAyMDDvvIxNaWNoYWwgV2lsY3p5bnNraeWGmemB
k++8mgo+IFRoZSBKSDcxMTAgZW1iZWRzIGEgREM4MjAwLiBUaGUgYmluZGluZyByZXF1aXJlcyBh
biBTb0Mgc3BlY2lmaWMKPiBjb21wYXRpYmxlIGFoZWFkIG9mIHRoZSBnZW5lcmljIG9uZSwgc28g
YWRkIHRoZSBKSDcxMTAgdG8gdGhlIGVudW0uCj4gCj4gUmV2aWV3ZWQtYnk6IEpvc2h1YSBQZWlz
YWNoIDxqcGVpc2FjaEB1YnVudHUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBXaWxjenlu
c2tpIDxtLndpbGN6eW5za2lAc2Ftc3VuZy5jb20+Cj4gLS0tCj4gwqBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sIHwgMSArCj4gwqAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0Cj4gYS9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixkYy55YW1sCj4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbixk
Yy55YW1sCj4gaW5kZXgKPiA5MTlhOTAwMTIyMDEyMDA1NGNiNjJkMWQwMWI3MjkzMzY3MjY2Zjk1
Li4wNWEyMDI2MzNjZDI3M2ZlYzM1OGMwOTVjNjQKPiA1ODRkOTU5ZDk2ZDkwIDEwMDY0NAo+IC0t
LSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29u
LGRjLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS92ZXJpc2lsaWNvbixkYy55YW1sCj4gQEAgLTE2LDYgKzE2LDcgQEAgcHJvcGVydGllczoKPiDC
oMKgIGNvbXBhdGlibGU6Cj4gwqDCoMKgwqAgaXRlbXM6Cj4gwqDCoMKgwqDCoMKgIC0gZW51bToK
PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gc3RhcmZpdmUsamg3MTEwLWRjODIwMAoKTm90ZTogdGhp
cyBiaW5kaW5nIGlzIGJlaW5nIHJlZmFjdG9yZWQgYXMgcGFydCBvZiBNQTM1RDEgc3VwcG9ydApp
bnRyb2R1Y3Rpb24gKHRoaXMgU29DIGhhcyBhIHNpbmdsZS1wb3J0IERDIGxpa2UgYSBEQzgwMDAp
LCBhZnRlciB0aGUKcmVmYWN0b3IgdGhlIGJpbmRpbmcgc3RyaW5nIG1pZ2h0IG5lZWQgdG8gYXBw
ZWFyIHR3aWNlLgoKVGhhbmtzLApJY2Vub3d5Cgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gdGhl
YWQsdGgxNTIwLWRjODIwMAo+IMKgwqDCoMKgwqDCoCAtIGNvbnN0OiB2ZXJpc2lsaWNvbixkYyAj
IERDIElQcyBoYXZlIGRpc2NvdmVyYWJsZSBJRC9yZXZpc2lvbgo+IHJlZ2lzdGVycwo+IMKgCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
