Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27C6C5B572
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 18:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jtj2wysb+nQbal3qiqXoPL+ZvwV3qXkR3K+kVTAVzFo=; b=JcYAs5BWnrvas2
	1JjRP2+A6lbwQZLzDEtlwa1wZEhjng9j3bi6uyZy1kqJYoGeDgEqLTT0i8MV0pfC1r4X125ae9yqB
	FX3jFUBp4uSVkAKKkn6fpOh3zwu1lXwkzw+4WzW7qc2F4hSG5FDRn5i0a29fL/ybK4avo9XpwKxmY
	WW0jqHfrvdrvz3W7UZZ6No0ax26cWG+qjNuJWcWZJNkk1nC0VUOXR8jhJFPw44KoULgvBolSmuDz9
	1HEa5ymYwvDJBnsecbox+t+qALpOcLTh+JCdXz74j+Bwa+EYYUsb/eu45/lD1F1zLXnT4TUmyOREg
	+wU6hW8uxV/yXGBLhjmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvfL5-00000004yeo-0wCw;
	Sun, 16 Aug 2026 18:12:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvfL3-00000004yeU-3BhI;
	Sun, 16 Aug 2026 18:12:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7328F60120;
	Sun, 16 Aug 2026 18:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE301F000E9;
	Sun, 16 Aug 2026 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786903924;
	bh=shbxNjSwtOu6lTbGry+vOL2dBkYNSUjGouYEXzD95eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fID2NsCdGux2mZG02sRND6KNPxGYYqZ6FQgJ/HolCE+szt/U1siKveWp1W3lSs1B7
	 xCewy2jL2sUe8hVn0fXQqaKJXEeoE5QGDYjazRNrLxhqvGrFuc6EI+gq9bfXheOAqG
	 eCAPpnU2afoT1MFxjrbjQujw7lIMND3wYqwLewjF08pWNPC67yfgPdiNxrk7Ev9HqJ
	 M9K8EuqZNQyqYju8U0e+0hsJYWGYYoB3tlgS0GGDTsw4gqP2p7TfPro1blkbMwcj3P
	 4mifWLHPFNs7KUqFiDpkHZOGo+VTNX3crRW0AvU8O48EghulX5g9AXc4/p+XkIM1AG
	 IjrCAehb45wXw==
Date: Sun, 16 Aug 2026 11:12:02 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH 02/12] clk: thead: th1520-ap: add support for MISC subsys
 clocks
Message-ID: <aoH9cvTC8vD4NYpB@x1>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-3-zhengxingda@iscas.ac.cn>
 <aier9XppLeCkJydw@thelio>
 <93b867c1b7f5526cc25cb04f838432cd752f5981.camel@icenowy.me>
 <aievi0s-3SO8hV6a@thelio>
 <aijpEqzJ7fM7rGMH@thelio>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aijpEqzJ7fM7rGMH@thelio>
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

T24gVHVlLCBKdW4gMDksIDIwMjYgYXQgMDk6MzM6MjJQTSAtMDcwMCwgRHJldyBGdXN0aW5pIHdy
b3RlOgo+IE9uIE1vbiwgSnVuIDA4LCAyMDI2IGF0IDExOjE1OjM5UE0gLTA3MDAsIERyZXcgRnVz
dGluaSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDA5LCAyMDI2IGF0IDAyOjAxOjQzUE0gKzA4MDAs
IEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+IOWcqCAyMDI2LTA2LTA45LiA55qEIDIzOjAwIC0w
NzAw77yMRHJldyBGdXN0aW5p5YaZ6YGT77yaCj4gPiA+ID4gT24gVGh1LCBNYXkgMDcsIDIwMjYg
YXQgMDQ6MTc6MDBQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4gPiA+IFRoZSBU
SDE1MjAgU29DIGNvbnRhaW5zIGEgTUlTQ19TVUJTWVMgY2xvY2sgY29udHJvbGxlciwgd2hpY2gK
PiA+ID4gPiA+IGFsbG93cwo+ID4gPiA+ID4gY29udHJvbGxpbmcgb2YgVVNCIHJlbGF0ZWQgY2xv
Y2tzIGFuZCBNTUMvU0QgY29udHJvbGxlciBBSEIgYnVzCj4gPiA+ID4gPiBjbG9ja3MuCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IEFkZCBzdXBwb3J0IGZvciB0aGlzIGNsb2NrIGNvbnRyb2xsZXIsIGlu
IG9yZGVyIHRvIGVuYWJsZSBVU0IKPiA+ID4gPiA+IHN1cHBvcnQuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNu
Pgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiDCoGRyaXZlcnMvY2xrL3RoZWFkL2Nsay10aDE1MjAt
YXAuYyB8IDY0Cj4gPiA+ID4gPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiA+
ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay90aGVhZC9jbGstdGgxNTIwLWFwLmMKPiA+ID4g
PiA+IGIvZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jCj4gPiA+ID4gPiBpbmRleCAz
YTY4NDdmMWM5NTBmLi4yNGY3ODVmMGIzMjlhIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvZHJpdmVy
cy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2Nsay90
aGVhZC9jbGstdGgxNTIwLWFwLmMKPiA+ID4gPiBbLi4uXQo+ID4gPiA+ID4gQEAgLTE2MDksNiAr
MTY2MywxMiBAQCBzdGF0aWMgaW50IHRoMTUyMF9jbGtfcHJvYmUoc3RydWN0Cj4gPiA+ID4gPiBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ID4gPiDCoAkJCXJldHVybiByZXQ7Cj4gPiA+ID4g
PiDCoAl9Cj4gPiA+ID4gPiDCoAo+ID4gPiA+ID4gKwlpZiAocGxhdF9kYXRhID09ICZ0aDE1MjBf
YXBfcGxhdGRhdGEpIHsKPiA+ID4gPiA+ICsJCXJldCA9IGRldm1fY2xrX2h3X3JlZ2lzdGVyKGRl
diwKPiA+ID4gPiA+ICZ1c2Jfc3VzcGVuZF9kaXZfY2xrLmh3KTsKPiA+ID4gPiA+ICsJCWlmIChy
ZXQpCj4gPiA+ID4gPiArCQkJcmV0dXJuIHJldDsKPiA+ID4gPiA+ICsJfQo+ID4gPiA+IAo+ID4g
PiA+IFNob3VsZCB1c2Jfc3VzcGVuZF9kaXZfY2xrLmh3IGluc3RlYWQgYmUgcmVnaXN0ZXJlZCB1
bmRlcgo+ID4gPiA+ICdpZiAocGxhdF9kYXRhID09ICZ0aDE1MjBfYXBfcGxhdGRhdGEpJz8KPiA+
ID4gCj4gPiA+IERvIHlvdSBtZWFuIG1pc2NfcGxhdGRhdGE/Cj4gPiA+IAo+ID4gPiBZZXMsIHRo
aXMgaXMgYW4gY29weS1uLXBhc3RlIGVycm9yIHRoYXQgZGVzZXJ2ZXMgYSBmaXguCj4gPiAKPiA+
IEhhaCwgeWVzLCBJIGFsc28gaGFkIGEgdHlwbyA6KQo+IAo+IEFzc3VtaW5nIHRoYXQgZ2V0cyBm
aXhlZCBpbiB0aGUgbmV4dCByZXY6Cj4gCj4gUmV2aWV3ZWQtYnk6IERyZXcgRnVzaW5pIDxmdXN0
aW5pQGtlcm5lbC5vcmc+CgpJIHdpbGwgZml4dXAgdGhlIHR5cG8gYW5kIGFwcGx5IHRvIHRoZWFk
LWNsay1mb3ItbmV4dCBvbmNlIDcuMy1yYzEgaXMKcmVsZWFzZWQuCgpUaGFua3MsCkRyZXcKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
