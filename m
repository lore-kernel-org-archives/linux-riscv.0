Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5DC4C54FB3
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 03:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPET385/+//oi2YHEv2ZYT8xBzJieCMMvw4GsrbrhTM=; b=TPA3JDNlCP1F6P
	Cej5qcyAIHCiUDlThqlbG8laNQsZZObl1vfSRr36A0okd7Gjn4r6n4lYr7gKhasHs8i2bWLnP8gMe
	JEaryLSLvg5544kDJWfJwOWpxALQAOMc9wFTqmRENSxQVdPBzDWSJXwJ7QicLwK4xJARE9HhRdUNz
	mIUrgW07Ztk3+Nzh3mk3O3kwH1gaITsUNZkdLI14n/k5dkukhpHESpTl19R8qosPPXyOW0mH7kmXu
	pNGc7cuclVFOZMJ6mA6ooS8mFwtFM+M7vneHP/oHu7DniU9Ma5YdgbWx391s9FXE7uh/UM+uxFJ+0
	GVTNzfmLxdiZB3idThqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJky9-00000009p8s-0kwV;
	Tue, 27 May 2025 03:27:13 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJky6-00000009p89-0tCw
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 03:27:11 +0000
Received: from localhost (unknown [116.232.18.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 19E4B340C76;
	Tue, 27 May 2025 03:27:06 +0000 (UTC)
Date: Tue, 27 May 2025 03:27:01 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com,
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
	tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	heikki.krogerus@linux.intel.com, elder@riscstar.com,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 4/6] riscv: dts: spacemit: add pwm14_1 pinctrl setting
Message-ID: <20250527032701-GYA55693@gentoo>
References: <20250429085048.1310409-1-guodong@riscstar.com>
 <20250429085048.1310409-5-guodong@riscstar.com>
 <paasmwjel652r25nxobidydtpxfjy7emerilmwqhvhtgrrtg6v@gowpzqdzvlfz>
 <20250526215243-GYA53128@gentoo>
 <CAH1PCMZhS4_u3nTdAQDfTTRVJ_61n-OYjmMuv2m4DHYDzGE0XA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMZhS4_u3nTdAQDfTTRVJ_61n-OYjmMuv2m4DHYDzGE0XA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_202710_306608_7673068B 
X-CRM114-Status: GOOD (  17.54  )
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

SGkgR3VvZG9uZywKCk9uIDEwOjQ4IFR1ZSAyNyBNYXkgICAgICwgR3VvZG9uZyBYdSB3cm90ZToK
PiBPbiBUdWUsIE1heSAyNywgMjAyNSBhdCA1OjUy4oCvQU0gWWl4dW4gTGFuIDxkbGFuQGdlbnRv
by5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpIEd1b2RvbmcsIFV3ZSwKPiA+Cj4gPiBPbiAxODo1NCBN
b24gMjYgTWF5ICAgICAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+ID4gPiBPbiBUdWUsIEFw
ciAyOSwgMjAyNSBhdCAwNDo1MDo0NlBNICswODAwLCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gPiA+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRz
aSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpCj4gPiA+ID4g
aW5kZXggMjgzNjYzNjQ3YTg2Li4xOTVlYjg4NzRmM2MgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJsLmR0c2kKPiA+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLXBpbmN0cmwuZHRzaQo+ID4gPiA+IEBAIC0y
MCw0ICsyMCwxMSBAQCB1YXJ0MC0yLXBpbnMgewo+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ZHJpdmUtc3RyZW5ndGggPSA8MzI+Owo+ID4gPiA+ICAgICAgICAgICAgIH07Cj4gPiA+ID4gICAg
IH07Cj4gPiA+ID4gKyAgIHB3bTE0XzFfY2ZnOiBwd20xNC0xLWNmZyB7Cj4gPiA+ID4gKyAgICAg
ICAgICAgcHdtMTQtMS1waW5zIHsKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgIHBpbm11eCA9
IDxLMV9QQURDT05GKDQ0LCA0KT47Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICBiaWFzLXB1
bGwtdXAgPSA8MD47Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICBkcml2ZS1zdHJlbmd0aCA9
IDwzMj47Cj4gPiA+ID4gKyAgICAgICAgICAgfTsKPiA+ID4gPiArICAgfTsKPiA+ID4KPiA+ID4g
VGhlcmUgaXMgYSBuZXdsaW5lIGV4cGVjdGVkIGJlZm9yZSB0aGUgcHdtMTQtMS1jZmcgbm9kZSwg
aXNuJ3QgdGhlcmU/Cj4gPiA+Cj4gPiBSaWdodCwgSSBjb3VsZCBhbWVuZCB0aGlzIGFuZCBmaXgg
aXQgd2hpbGUgYXBwbHlpbmcgdGhpcyBwYXRjaAo+ID4gKHNvIGlmIHRoZXJlIGlzIG5vIG90aGVy
IHNlcmlvdXMgaXNzdWUsIG5vIG5lZWQgdG8gcmVzZW5kKQo+ID4KPiAKPiBUaGFua3MsIFlpeHVu
Lgo+IAo+IEJ5IHRoZSB3YXksIGRvIHlvdSBwbGFuIHRvIHRha2UgcGF0Y2hlcyAzIGFuZCA0IG9m
IHRoaXMgc2VyaWVzIGludG8KPiB5b3VyIHRyZWU/IFRoZXkgb25seSBhcHBseSBpZiB0aGUgU3Bh
Y2VtaVQgcmVzZXQgcGF0Y2hzZXQgaXMgYXBwbGllZAo+IGZpcnN0Lgo+IApZZXMsIGV4YWN0bHku
IFRoZSBkdHMgcGF0Y2ggd2lsbCBnbyB0aHJvdWdoIFNwYWNlbWlUIFNvQyB0cmVlLCBhbmQgd2UK
aGF2ZSB0byB3YWl0IHVudGlsbCByZXNldCBwYXRjaCBzZXJpZXMgYXBwbGllZC4KCi0tIApZaXh1
biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
