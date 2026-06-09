Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FD4CD8CAD
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 05:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+64OoX6WamvIzgFzU2RTOwK1vUucFkEpaZjHP/oH9I=; b=H3Kx9pahGI5WOM
	DB8sWMd7SDzPcS8d9ZT/69CQGTNmQ/rfBF34sbOvE/3mw6JQtXOZB0qLpOe2zMqNxJNOaT5Tg9+4M
	hrKFPC9semibU37qaq5mFRA59/tGv4IDuMqC/Qp/r6iajb7mb8+8k735iAhg+un4Sr4c90xy7pPbA
	7ryYiztNJmmlu5FE6ycu+X6dJJV9kHwf07MLnvRqLnlRhXDRf5k7/xQIZXhii9dnmtWFzwQ1GzzJ+
	+ZHq2I8aT4fGd6l0Y8RGuvE5QB16RkC2qpyly2MkS7MoitgXyU8YFrx/iOPM6tAI9MVzwvSUwzXIh
	NU1E6JoGJ0Zir4QqlbGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWokC-00000004jz0-1Dno;
	Tue, 09 Jun 2026 05:11:20 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWok9-00000004jyX-2G7Y;
	Tue, 09 Jun 2026 05:11:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1780981855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A/UWqSIgnGtvXOLP4BBnY3FE7VuGSiuGjdfDqWQlKItkmHTwtGQfbXVGAyLMk68i41HF8m0Pr1ihkLXvybsReWYCHb8lEnoRdKUUt5CUbMSTU3dJ9D+gdUeYinI7u/3mOdv0YCa8eTt8fyK25q5piyzX62GL8/hd3mW7ECYjXBw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780981855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LnM4xxDaTA6sPdy7VmjbiznxS/a0dU1GXd9YzU2Jenc=; 
	b=JozwoV0QlRRH7schWe8oMPFwJ2QO6cp/v+vLOf/qBmbWSkWpgUPwQubYJi4vl0Dw110PHkUVGFZzjC9GytUDu50I81rLS8fTy+J18Xl5qMYpdfOXBP5zVuGvbIottNLD5pYN5C2RWe5EoecwtZkFB28LroC6G/1lJKCFf4KRa5w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780981855;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=LnM4xxDaTA6sPdy7VmjbiznxS/a0dU1GXd9YzU2Jenc=;
	b=N2MDDFGDLjgRjA2UtlUSuiJlLzCqU98xulMPqUnXDDuOh6Bjs4qDXaWeAKtZOj7l
	YmKyi0JlpfkvcCSoLCIoj7HjY/1wKpgemkaLFx6Oaaqw2KOCpMOnLPD3ax45yG26ar4
	Yw4jaH0dbl967ohZx3ldZH12hAwLZsDU5Gv5BOLqFRyv/Vf6/VihDpc8uff4oWlkGhg
	S7y0guMF2zhRPxk5Rdnyj4zJBmXfCiqoSuROEpnCoyb10X3sOY2agzGMVctouzkSGGX
	J2vUmf0kXp1gkjbc5vtk4gcZ/GP+48XOW1vAMvKMaUicETtT2MleSZOyf5xLYuesrCW
	oCSfeQN0mw==
Received: by mx.zohomail.com with SMTPS id 1780981852365784.4413352514897;
	Mon, 8 Jun 2026 22:10:52 -0700 (PDT)
Message-ID: <a8dc863b1692b4d327b4b9700dd56a4754120561.camel@icenowy.me>
Subject: Re: [PATCH 00/12] Add TH1520 USB support
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Michael Turquette
	 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Jisheng Zhang	 <jszhang@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, 	linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org, 	linux-usb@vger.kernel.org, Han Gao
 <rabenda.cn@gmail.com>, Yao Zi	 <ziyao@disroot.org>
Date: Tue, 09 Jun 2026 13:10:41 +0800
In-Reply-To: <aieT4WmWK9416M9E@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
	 <aieT4WmWK9416M9E@thelio>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_221117_854695_C09D9CE4 
X-CRM114-Status: GOOD (  21.81  )
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

5ZyoIDIwMjYtMDYtMDjkuIDnmoQgMjE6MTcgLTA3MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBUaHUsIE1heSAwNywgMjAyNiBhdCAwNDoxNjo1OFBNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gVGhpcyBwYXRjaHNldCBhZGRzIHN1cHBvcnQgZm9yIFQtSGVhZCBUSDE1MjAn
cyBVU0IgZnVuY3Rpb25hbGl0eSwKPiA+IGFuZAo+ID4gZW5hYmxlZCBpdCBvbiB0aGUgTGljaGVl
IFBpIDRBIGJvYXJkLgo+ID4gCj4gPiBUaGUgZmlyc3QgMyBwYXRjaGVzIGFkZCBzdXBwb3J0IGZv
ciB0aGUgTUlTQyBzdWJzeXN0ZW0gY2xvY2sKPiA+IGNvbnRydG9sbGVyLCB3aGljaCBjb250YWlu
cyBzb21lIFVTQiBjbG9ja3MuCj4gPiAKPiA+IFRoZSBuZXh0IDIgcGF0Y2hlcyBhZGQgc3VwcG9y
dCBmb3IgdGhlIFVTQiBQSFkgb2YgVC1IZWFkIFRIMTUyMCwKPiA+IHdoaWNoCj4gPiBpcyBhIHdy
YXBwZWQgU3lub3BzeXMgVVNCMy4wIEZlbXRvUEhZIHdpdGggYSBsaXR0bGUgaW50ZWdyYXRpb24K
PiA+IHF1aXJrOwo+ID4gdGhlIGNvbnRyb2xsZXIgaXRzZWxmIGlzIGEgcHJvcGVybHkgY29uZmln
dXJlZCBEV0MzIGNvbnRyb2xsZXIgd2l0aAo+ID4gc2FuZQo+ID4gZGVmYXVsdCByZWdpc3RlciB2
YWx1ZXMgc2V0Lgo+ID4gCj4gPiBUaGVuIG9uZSBwYXRjaCBhZGRzIHRoZSBVU0IgUEhZIGFuZCBj
b250cm9sbGVyIG5vZGVzIHRvIHRoZSBUSDE1MjAKPiA+IERUU0kKPiA+IGZpbGUuCj4gPiAKPiA+
IFRoZSByZW1haW5pbmcgaGFsZiBvZiB0aGlzIHBhdGNoc2V0IGRlZGljYXRlcyB0byBlbmFibGVt
ZW50IG9mIFVTQgo+ID4gb24KPiA+IFRIMTUyMCwgYmVjYXVzZSBvZiB0aGUgb25ib2FyZCBodWIg
b2YgdGhhdCBib2FyZCAtLSBpdHMgVVNCMgo+ID4gc2lnbmFscyBhcmUKPiA+IGJlaGluZCBhIHN3
aXRjaCB0aGF0IG5lZWRzIHRvIGJlIHRvZ2dsZWQgb24sIGFuZCBWYnVzIHN1cHBsaWVzIGZvcgo+
ID4gYm90aAo+ID4gdGhlIGh1YiBpdHNlbGYgYW5kIGRvd25zdHJlYW0gcG9ydHMgYXJlIG1hbmFn
ZWQgdmlhIEkyQy1leHBhbmRlZAo+ID4gR1BJT3MKPiA+IChiZWNhdXNlIHRoZSBTb0MgZG9lcyBu
b3QgaGF2ZSBlbm91Z2ggR1BJTyBwaW5zKS4KPiAKPiBIaSwgdGhhbmtzIGZvciB3b3JraW5nIG9u
IFVTQi4gSSB0cmllZCB0byBhcHBseSBpdCB0byBuZXh0LTIwMjYwNjAxCj4gYW5kCj4gc2V2ZXJh
bCBvZiB0aGUgZHRzIHBhdGNoZXMgbm8gbG9uZ2VyIGFwcGx5IGNsZWFubHkuIENvdWxkIHlvdSBy
ZWJhc2U/CgpJIHRoaW5rIHRoZSByZWFzb24gaXMgdGhhdCBvbmUgb2YgdGhlIEdQSU8gZXhwYW5z
aW9uIGNoaXAgaXMgYWRkZWQgdG8KdGhlIERUIGZvciBlbmFibGluZyBXaS1GaS4KCkkgYW0gbm90
IHN1cmUgd2hldGhlciB0aGUgbmV4dCByZXZpc2lvbiBvZiB0aGlzIHBhdGNoc2V0IHdpbGwgY29u
dGFpbgphbGwgdGhpbmdzLCBtYXliZSBJIHdpbGwgc3BsaXQgb3V0IGF0IGxlYXN0IHRoZSBVU0Ig
UEhZIHBhcnQuCgpUaGFua3MsCkljZW5vd3kKCj4gCj4gSW4gdGhlIG1lYW50aW1lLCBJJ2xsIGFw
cGx5IHRvIDcuMS1yYzcgZm9yIHRlc3RpbmcuCj4gCj4gVGhhbmtzLAo+IERyZXcKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
