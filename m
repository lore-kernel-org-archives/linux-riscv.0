Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA99C5DF74
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 23:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyoLCSYtwp/LNMojVl+qgux9yN8Pcq0zJxNPIgI8XdU=; b=4JcloNojj970nv
	0VnZIZ5vDcP0RQBHheNBrhaEQDqb3BYd8lYm2eH0LIrv5PjnuFc+kAVhLTwHZYJZ+v40csWUulfZy
	Kvth6+YbFXqCdJS455RVxjowYJNsa2BZ8aMVBOLE9byKrqmVFaWq1IwvZirmJEWwFLcUdWye45fWV
	dABlCAVzJIkCcnr0FxzaH4TiKlRIjkIrCGXNWKq4hAiAVwyv48W2jkuiyxT2YaCxWcB6NOrLRzG/9
	0Oor7WNRn457e6BjBwwkAr/R15RvO3e6ynXzvKBBjaVvC9CGLZA/kTAR52/glqq2Bp6bU3iiGpcoe
	+l+dyyEGLydrdDqhwrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww752-00000006zWz-1Bbm;
	Mon, 17 Aug 2026 23:49:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww750-00000006zWm-2LNP;
	Mon, 17 Aug 2026 23:49:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31AC7600C8;
	Mon, 17 Aug 2026 23:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B33E1F000E9;
	Mon, 17 Aug 2026 23:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787010559;
	bh=3KmOAWkkq6vNgl04oOZllB37mH/rLBzXgbWryVTtjlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dAYiy5D8oQ1o03PHJOVtpLgpVlEMXd8Kg8yAEXZPPF4UNTO9FqcnqQjvpvm+HzH2O
	 1m4dGzd+6jUpoI80MgMQc+ipMDIbbWHxOeJor9uqonsMJZjcgXyri8PjVW7+Y4iMtw
	 iPMnF69GZ9096HaZx7Wj5vAFltNj++la24IZvwKyLow2Xsd5FeYEsEv4SFpf6Fk53I
	 jlBI301SVZBSHLq8+lRIz+UaPt3jcIWNP5FoAy7gJgOJSlAeUGtUHIrWDzmDzhVUYa
	 aLrHDW28CtSg+681kz4AoNvz0VUWiHo98lQRqBb/Y2EYYJ+CGNrSxNC0YmjQcmrETk
	 vjXyBSeuvQZhw==
Date: Mon, 17 Aug 2026 16:49:18 -0700
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
Subject: Re: [PATCH 03/12] riscv: dts: thead: add device tree node for MISC
 clock controller
Message-ID: <aoOd_i_QtCywStEz@thelio>
References: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
 <20260507081710.4090814-4-zhengxingda@iscas.ac.cn>
 <aiehUzl-qZeZDjXP@thelio>
 <67790d90737c13127100510020262d6921810e34.camel@icenowy.me>
 <aievq4dae3GHHq0c@thelio>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aievq4dae3GHHq0c@thelio>
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

T24gTW9uLCBKdW4gMDgsIDIwMjYgYXQgMTE6MTY6MTFQTSAtMDcwMCwgRHJldyBGdXN0aW5pIHdy
b3RlOgo+IE9uIFR1ZSwgSnVuIDA5LCAyMDI2IGF0IDAxOjM1OjExUE0gKzA4MDAsIEljZW5vd3kg
Wmhlbmcgd3JvdGU6Cj4gPiDlnKggMjAyNi0wNi0wOOS4gOeahCAyMjoxNCAtMDcwMO+8jERyZXcg
RnVzdGluaeWGmemBk++8mgo+ID4gPiBPbiBUaHUsIE1heSAwNywgMjAyNiBhdCAwNDoxNzowMVBN
ICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gPiA+IFRoZSBNSVNDX1NVQlNZUyBjbG9j
ayBjb250cm9sbGVyIG9uIFRIMTUyMCBTb0MgaXMgYSBjbG9jawo+ID4gPiA+IGNvbnRyb2xsZXIK
PiA+ID4gPiBtYWlubHkgY29udHJvbGxpbmcgVVNCLXJlbGF0ZWQgY2xvY2tzICh3aGljaCBpc24n
dCB1dGlsaXplZCB5ZXQpCj4gPiA+ID4gYW5kCj4gPiA+ID4gTU1DL1NEIGNvbnRyb2xsZXJzJyBB
SEIgYnVzIGNsb2Nrcy4KPiA+ID4gPiAKPiA+ID4gPiBBZGQgdGhlIGRldmljZSB0cmVlIG5vZGUg
Zm9yIGl0IGFsb25nIHdpdGggdGhlIG1pc3NpbmcgYnVzIGNsb2NrCj4gPiA+ID4gcmVmZXJlbmNl
cyBmb3IgTU1DL1NEIGNvbnRyb2xsZXJzLgo+ID4gPiAKPiA+ID4gSXMgdGhlcmUgYSBmdW5jdGlv
bmFsIHJlYXNvbiB0byBtb2RpZnkgdGhlIG1tYyBub2RlcyBpbiB0aGlzIHNlcmllcz8KPiA+IAo+
ID4gV2hlbiB0aGUgY2xvY2sgaXNuJ3QgcmVmZXJlbmNlZCwgTGludXggd2lsbCBkaXNhYmxlIGl0
IHVubGVzcwo+ID4gYGNsa19pZ25vcmVfdW51c2VkYCBwYXJhbWV0ZXIgaXMgcGFzc2VkLgo+IAo+
IEFoIG9rLCB0aGFua3MgZm9yIGV4cGxhaW5pbmcuCj4gCj4gRHJldwoKUmV2aWV3ZWQtYnk6IERy
ZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
