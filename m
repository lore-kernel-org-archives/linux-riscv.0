Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C430DC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 15:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIfq4tt05AxXNx/prEnehn4NOh6Zgv2gQFaaCLQ1eCQ=; b=4E9HxzP0t2JGcJ
	oi8wr4QZW1Qi2Ekd6Cbm42D8eEEeHItc1QetvAaEM58/VaTr9W0oFv6nb07vlaIUaYmMuRBoM0YOS
	ssDAscNi3RPXc8ZOJYngtc5/+a8M64jurtCIF50fecEOZNczACTOgZQFIS+0BOsQPRz7I8mz5jlD8
	Q2es2p419GlEYG99yXc9jRy5gNvgQp28UCm5BWHWC0vrjksBDyKy47C81mXK8S9+J2m0qKMUwXpB/
	i59FlTNx02F/B01G7jt5hmSjkDpnjx69ebmkoXBy13HGoZgI4lZOxsBGY8xl6NM3or2GHaNE8uDEF
	kryzvPNiiOXb4WlrTdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvflj-00CcN4-1Q;
	Wed, 25 Oct 2023 15:26:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvflg-00CcLi-1g
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 15:26:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id ADA9EB8300C;
	Wed, 25 Oct 2023 15:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120C1C433C7;
	Wed, 25 Oct 2023 15:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698247557;
	bh=XNtqmjzlGoaxXATR3hfkSbSFqAPY5X6MkYdWKvJljr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIrWXIAj85SXqAP4C2Dj4+engdAvrNekV9ljm3XKOtePy1hwdO0o9VP+bsRJqORKU
	 QKl2HohkReBC82jPccVy+9BMut/SzwcXVin5kZfm3Jtj3Nk+KSrnBH2Cfp4bhwANZW
	 NirYI/ePMwf/Qkdc9+OxfABKlFuQe087xarez2hpsvDCoiggpoAjXBX8QjUGKrM6SM
	 rYp6S7MJxBtBgphivsAxMga7Kx/8+09G6NesVDoBT2gNj98bE5InuOja7XGqU6LSyu
	 c6HhMfQOAXYjGYSRISPo+cytz7GELTtK7WHHBLpz7FEIpHPBSim+ud/QRv+ON1P0Zs
	 CnD8TAb41TYQw==
Date: Wed, 25 Oct 2023 23:13:39 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Chao Wei <chao.wei@sophgo.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: sophgo: remove address-cells from intc
 node
Message-ID: <ZTkwo/u6S9Atp2u3@xhacker>
References: <20231024-maternity-slang-fd3dcfb211c0@spud>
 <MA0P287MB0332C00AB091FD7139560E25FEDEA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MA0P287MB0332C00AB091FD7139560E25FEDEA@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_082600_715474_1F94EA64 
X-CRM114-Status: GOOD (  18.49  )
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

T24gV2VkLCBPY3QgMjUsIDIwMjMgYXQgMDg6NDg6NTdBTSArMDgwMCwgQ2hlbiBXYW5nIHdyb3Rl
Ogo+IAo+IE9uIDIwMjMvMTAvMjQgMTY6MjAsIENvbm9yIERvb2xleSB3cm90ZToKPiA+IEZyb206
IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiAKPiA+IEEgcmVj
ZW50IHN1Ym1pc3Npb24gWzFdIGZyb20gUm9iIGhhcyBhZGRlZCBhZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UKPiA+IHRvIHRoZSBpbnRlcnJ1cHQtY29udHJvbGxlciBjaGlsZCBub2RlIG9mIFJJ
U0MtViBjcHVzLCBoaWdobGlnaHRpbmcgdGhhdAo+ID4gdGhlIG5ldyBjdjE4MDBiIERUIGhhcyBi
ZWVuIGluY29ycmVjdGx5IHVzaW5nICNhZGRyZXNzLWNlbGxzLgo+ID4gSXQgaGFzIG5vIGNoaWxk
IG5vZGVzLCBzbyAjYWRkcmVzcy1jZWxscyBpcyBub3QgbmVlZGVkLiBSZW1vdmUgaXQuCj4gPiAK
PiA+IExpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNj
di9wYXRjaC8yMDIzMDkxNTIwMTk0Ni40MTg0NDY4LTEtcm9iaEBrZXJuZWwub3JnLyBbMV0KPiA+
IEZpeGVzOiBjM2RmZmE4NzljY2EgKCJyaXNjdjogZHRzOiBzb3BoZ286IGFkZCBpbml0aWFsIENW
MTgwMEIgU29DIGRldmljZSB0cmVlIikKPiA+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpOaWNlIGNhdGNoIQoKUmV2aWV3ZWQtYnk6IEpp
c2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KCgo+ID4gLS0tCj4gPiBDQzogQ2hhbyBX
ZWkgPGNoYW8ud2VpQHNvcGhnby5jb20+Cj4gPiBDQzogQ2hlbiBXYW5nIDx1bmljb3JuX3dhbmdA
b3V0bG9vay5jb20+Cj4gPiBDQzogUm9iIEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz4KPiA+
IENDOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5v
cmc+Cj4gPiBDQzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgo+ID4g
Q0M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4gPiBDQzogQWxiZXJ0IE91
IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+Cj4gPiBDQzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcKPiA+IENDOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBDQzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwo+ID4gLS0tCj4gPiAgIGFyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL2N2MTgwMGIuZHRzaSB8IDEgLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3Yx
ODAwYi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpCj4gPiBp
bmRleCBkZjQwZTg3ZWUwNjMuLmFlYzY0MDFhNDY3YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGIuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290
L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpCj4gPiBAQCAtMzQsNyArMzQsNiBAQCBjcHUwOiBjcHVA
MCB7Cj4gPiAgIAkJCWNwdTBfaW50YzogaW50ZXJydXB0LWNvbnRyb2xsZXIgewo+ID4gICAJCQkJ
Y29tcGF0aWJsZSA9ICJyaXNjdixjcHUtaW50YyI7Cj4gPiAgIAkJCQlpbnRlcnJ1cHQtY29udHJv
bGxlcjsKPiA+IC0JCQkJI2FkZHJlc3MtY2VsbHMgPSA8MD47Cj4gPiAgIAkJCQkjaW50ZXJydXB0
LWNlbGxzID0gPDE+Owo+ID4gICAJCQl9Owo+ID4gICAJCX07Cj4gCj4gQWNrZWQtYnk6IENoZW4g
V2FuZyA8dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+IAo+IFRoYW5rc++8jGJ0dywgd2lsbCBp
dCBiZSBtZXJnZWQgaW4gNi43PwoKRG9uJ3Qgd29ycnksIHRoaXMgaXMgYSBmaXgsIEkgdGhpbmsg
Q29ub3Igd2lsbCBzdWJtaXQgZml4IFBSIG9uY2UgcmMxIGlzIG91dC4KCj4gCj4gTG9vcGluZyBK
aXNoZW5nIHdobyBpcyB3b3JraW5nIG9uIER1by9jdjE4MDBiLgo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
