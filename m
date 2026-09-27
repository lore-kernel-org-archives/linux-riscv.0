Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC1C9832F
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BUNomZBirvAf78QHjLgXMkQMB3GXYZidE+35Hqs8fBY=; b=u9xH2gB15QbLku
	dHK0DV9Htjx5uoiLYkQYTiMkpIjLGB6PzDCawxIwLsjgkIgCCK0EQ6PrKpzXwnn6+UG79mMY3PVNd
	q4YGJWQVp4MzSXCNxsVrk5syu2lo0FpNQjEdNf1L7wJRWinwWcqL6pgs8ctGxZSyzTd7VPw4Ya3Kf
	rtCE+koIVcSxTEdZR45iZ5v82+Z9lecfIVsw0uRsnohIsZgLiy1faWE+gbIKpaVgCA58dN0C/QpMf
	mjQQPnQ876iPCg32wTjbNZK1L5tYPBd2khYwyw1jSJONBTWteJHQzhZ5gLDUQpixQAkAHLh2vH3MT
	5Ih2iVkl+kQTCLUDymow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkS-0000000GYtR-2gk2;
	Sun, 27 Sep 2026 16:29:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xArkQ-0000000GYsW-3vUC;
	Sun, 27 Sep 2026 16:29:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 997DE40187;
	Sun, 27 Sep 2026 16:29:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 002D31F000FF;
	Sun, 27 Sep 2026 16:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790526546;
	bh=lMcI0XjYXxee6gQybGjy+nF52Zob3DzrgHJzmXEp8fc=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IggNfbCOWc3Qu2tHK8WHnDs24hP2X51WEjGQiUMCT3DAKwlWx+bJ2owge4SRyItne
	 p/YpydwrSEs+xZKdAH785auXYfIjvrNKDIDBUAxAo/fiCqY00BehgZU5c54oX8hC6K
	 K9jCzqmBItHAHdjk8iSth2KVRjfPInxo3/LlNMAG2uthWkQ0tLYPpdGi3TJsngGu/y
	 w8Vx/fxAHLAzMU15096FUduU0PNkJDGiVCemZpXViZtmcBbX7bDWUs6r7rFjhsykYP
	 RZxgnrIIqHOLoUnECh48i98eyWQRZi62VyGfLtyp9IkvBhsi4xxoVEGsUWWYjDTz2y
	 xDD4ugM5ILP0w==
Subject: Re: [PATCH net-next v15 2/9] dt-bindings: phy: document the serdes
 PHY on sa8255p
From: netdev-bot+sashiko@kernel.org
To: bartosz.golaszewski@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, vkoul@kernel.org,
 peppe.cavallaro@st.com, wens@kernel.org, jernej.skrabec@gmail.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 shawnguo@kernel.org, festevam@gmail.com, jan.petrous@oss.nxp.com, s32@nxp.com,
 mohd.anwar@oss.qualcomm.com, romain.gantois@bootlin.com,
 geert+renesas@glider.be, magnus.damm@gmail.com, mripard@kernel.org,
 christophe.roullier@foss.st.com, brgl@kernel.org, radu@rendec.net,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, dfustini@tenstorrent.com,
 linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-mips@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 bartosz.golaszewski@linaro.org
Date: Sun, 27 Sep 2026 16:29:03 +0000
Message-ID: <179052654351.2160803.11432185989352625433@kernel.org>
In-Reply-To: <20260923-qcom-sa8255p-emac-v15-2-e82f33720737@oss.qualcomm.com>
References: <20260923-qcom-sa8255p-emac-v15-2-e82f33720737@oss.qualcomm.com>
X-sashiko-severity: Low
MIME-Version: 1.0
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

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
bW9yZSBzZXZlcmUKaXNzdWUocykgaW4gb3RoZXIgcGF0Y2hlcyBvZiB0aGlzIHNlcmllcy4gVGhp
cyBtYWlsIGlzIG9ubHkgYW4gRllJLCBpbiBjYXNlCnlvdSB3YW50IHRvIGFkZHJlc3MgdGhlIG5p
dCBwaWNrcyBiZWxvdyB3aGVuIHlvdSByZXNwaW4uCgpMb3cgcHJpb3JpdHkgLyBuaXQgcGlja3Mg
Zm9yIHlvdXIgY29uc2lkZXJhdGlvbjoKCi0gW0xvd10gSW4gdGhlIG5ldyBiaW5kaW5nCiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9xY29tLHNhODI1NXAtZHdtYWMtc2dt
aWkt4oCmCgotLQoKZHQtYmluZGluZ3M6IHBoeTogZG9jdW1lbnQgdGhlIHNlcmRlcyBQSFkgb24g
c2E4MjU1cAoKVGhpcyBjb21taXQgYWRkcyBhIG5ldyBiaW5kaW5nIGZvciB0aGUgU0dNSUkvU2Vy
RGVzIFBIWSBvbiBRdWFsY29tbSBzYTgyNTVwCnBsYXRmb3Jtcy4gVGhlIGhhcmR3YXJlIGlzIHRo
ZSBzYW1lIGFzIHNhODc3NXAgcmV2MywgYnV0IGhlcmUgZmlybXdhcmUKbWFuYWdlcyB0aGUgUEhZ
IG92ZXIgU0NNSS4KCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waHkvcWNvbSxzYTgyNTVwLWR3bWFjLXNnbWlpLXBoeS55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9xY29tLHNhODI1NXAtZHdtYWMtc2dtaWktcGh5Lnlh
bWwKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMDAuLjllODQ2ZTM4
MTU1NTUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BoeS9xY29tLHNhODI1NXAtZHdtYWMtc2dtaWktcGh5LnlhbWwKClsgLi4uIF0KCj4g
KyAgcG93ZXItZG9tYWluczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIHBvd2VyLWRvbWFp
bi1uYW1lczoKPiArICAgIG1heEl0ZW1zOiAxCgpbU2V2ZXJpdHk6IExvd10KVGhpcyBpc24ndCBh
IGJ1ZywgYnV0IHNob3VsZCBwb3dlci1kb21haW4tbmFtZXMgcGluIGl0cyB2YWx1ZSBoZXJlPwoK
VGhlIHByb3BlcnR5IGlzIGxpc3RlZCB1bmRlciByZXF1aXJlZCwgYW5kIHRoZSBleGFtcGxlIHVz
ZXMgInNlcmRlcyIuCkhvd2V2ZXIsIHRoZSBvbmx5IGNvbnN0cmFpbnQgaXMgbWF4SXRlbXM6IDEu
IEEgbm9kZSB3aXRoCnBvd2VyLWRvbWFpbi1uYW1lcyA9ICJmb28iIHdvdWxkIHN0aWxsIHBhc3Mg
ZHRfYmluZGluZ19jaGVjaywgc28gdGhlIHZhbHVlCm9mIGEgcmVxdWlyZWQgcHJvcGVydHkgaXMg
bGVmdCB1bmRlZmluZWQgaW4gdGhlIEFCSS4KClRoZSBvdGhlciBmaXJtd2FyZS1tYW5hZ2VkIHNh
ODI1NXAgYmluZGluZ3MgZml4IHRoZWlyIG5hbWVzIHdpdGggY29uc3QKZW50cmllcy4gRm9yIGV4
YW1wbGUsIHFjb20sc2E4MjU1cC1nZW5pLWkyYy55YW1sIGhhczoKCiAgcG93ZXItZG9tYWluLW5h
bWVzOgogICAgaXRlbXM6CiAgICAgIC0gY29uc3Q6IHBvd2VyCiAgICAgIC0gY29uc3Q6IHBlcmYK
CnFjb20sc2E4MjU1cC1ldGhxb3MueWFtbCwgYWRkZWQgbGF0ZXIgaW4gdGhpcyBzZXJpZXMsIGRv
ZXMgdGhlIHNhbWUgd2l0aApjb3JlIGFuZCBtZGlvLgoKcG93ZXItZG9tYWlucyBhbHNvIGhhcyBu
byBkZXNjcmlwdGlvbiwgc28gdGhlIGJpbmRpbmcgZG9lc24ndCBzYXkgd2hhdCB0aGUKc2luZ2xl
IGRvbWFpbiByZXByZXNlbnRzLgoKQ291bGQgdGhpcyB1c2UgaXRlbXM6IC0gY29uc3Q6IHNlcmRl
cyBmb3IgcG93ZXItZG9tYWluLW5hbWVzLCBhbmQgYWRkIGFuCml0ZW1zOiAtIGRlc2NyaXB0aW9u
OiBlbnRyeSBmb3IgcG93ZXItZG9tYWlucz8gQW5vdGhlciBvcHRpb24gaXMgdG8gZHJvcApwb3dl
ci1kb21haW4tbmFtZXMsIHNpbmNlIHRoZXJlIGlzIG9ubHkgb25lIGVudHJ5LgoKVGhlIGRyaXZl
ciBhZGRlZCBsYXRlciBpbiB0aGUgc2VyaWVzIChwaHktcWNvbS1zZ21paS1ldGgtc2NtaS5jKSBk
b2Vzbid0Cmxvb2sgdGhlIGRvbWFpbiB1cCBieSBuYW1lLiBUaGUgZHJpdmVyIGNvcmUgYXR0YWNo
ZXMgdGhlIHNpbmdsZSBkb21haW4KYXV0b21hdGljYWxseSwgc28gYW4gdW5leHBlY3RlZCBuYW1l
IGNhdXNlcyBubyBydW50aW1lIGZhaWx1cmUuIFRoZSBjb25jZXJuCmlzIGxpbWl0ZWQgdG8gdGhl
IHNjaGVtYSBhbmQgdGhlIEFCSSBkZWZpbml0aW9uLgoKPiArCj4gKyAgIiNwaHktY2VsbHMiOgo+
ICsgICAgY29uc3Q6IDAKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0aWJsZQo+ICsgIC0g
cmVnCj4gKyAgLSAiI3BoeS1jZWxscyIKPiArICAtIHBvd2VyLWRvbWFpbnMKPiArICAtIHBvd2Vy
LWRvbWFpbi1uYW1lcwoKWyAuLi4gXQoKPiArICAgICAgICBwb3dlci1kb21haW5zID0gPCZzY21p
N19kdmZzIDA+Owo+ICsgICAgICAgIHBvd2VyLWRvbWFpbi1uYW1lcyA9ICJzZXJkZXMiOwo+ICsg
ICAgfTsKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL25ldGRldi1haS5ib3RzLmxp
bnV4LmRldi9zYXNoaWtvLyMvcGF0Y2hzZXQvMjAyNjA5MjMtcWNvbS1zYTgyNTVwLWVtYWMtdjE1
LTAtZTgyZjMzNzIwNzM3JTQwb3NzLnF1YWxjb21tLmNvbQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
