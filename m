Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43F1C35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 07:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8+wVeeN6kxpTrqJb8ek1hgL/E3PepEEqhgcEjQ2asE=; b=OHovzyImYOxcbP
	P0A1hlsFT7h3XsOsihIXXj4cr4sdY1RMSehY57gqPMBd9hkS1Cx2Hvy3ANsnZv2hDHvTa7jhRHemJ
	W8JyIMsf49SKyy8wsWXc+zovc7ekUpCtMBxsfvkgXA1twcnrVLnx2ubWM2+RZqAl17HedkYDOQTVN
	HWDfyNmlMf0TiY3/EjzPbzpdwa4xQ8nOkOMwE4Dzu7q5SX0gOVCnPUrr+Tylalq6vOBeeuhMRgi7Q
	8nsKalQolYd0DthgnSsmVnYKGzhkSVrjqt/Rw8eo9NNU0ySHFCCpxcJXxmsdvheEhkClmlQkTr8p8
	G3rK/+KBtqmEXuyBhQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGDtR-001z9e-2x;
	Thu, 21 Dec 2023 07:54:57 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGDtO-001z99-1H
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 07:54:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50e30b28c1aso683980e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 23:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703145290; x=1703750090; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8JlMGjDbWI3o2X+Vm2WsAsXNAIE0NMID+aG9ZAdKHE=;
        b=NsI0Vo4exZnSwjTQVvl8zgtF03aFMqCY1t2rCfId50w97lnPzvy6rdVTc7wFn4VsNJ
         s5MrK4UCyKvN6iphijiQWBtQOXP3g7eF9C5QGEBmEpipRxiPupMnDBdBIUu+Ad7/rZCK
         t8RXPGV8fjYdWHkK5B7rW6ZnkWO3a2jBe3E738+YW9y4uL7dSJ7dlWo7MIaJMxquP4vk
         zbTPdwmc80OnanQDX0oPLS3U4K/v7/w2694AqKwXoWmZK3rHXmAf0mlmuc2r5FFWEqQN
         82SD6al/OgJ8ZepYMFLLMZHCbyykmckQy/nFJSt6PzRIl/dtL2WC1UQ6b55ZHhCkhSvD
         VVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703145290; x=1703750090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8JlMGjDbWI3o2X+Vm2WsAsXNAIE0NMID+aG9ZAdKHE=;
        b=ky32YlTYWR/EwKiJN4brdwp5HCqnewcAsdf0b/kF9pLgwh7RJghisPo6H+1YFmzs2T
         +90LyuM0EeFwhMG20aUyc6AzFN4bMgxdLCbWaa425/F4dz7TABvvF88OCJguz5EmJ4/K
         D/DBdb3o1PFdcHu+GiVxM/s8NH7fPESVU7ZQOhaw8/zsgapb4syrQsvLdknn0cIb9Sgc
         TZrY5719zOwp3RhBbqyaalKzsn8qYxOKM0nXBu8V1zU3IZrwAr3o8/7/ukDUvetLBRf9
         eIJxV0qA1lxDqkdwbE5WtPlsjOoy/hrj9qERI4uTpY2BBugcWeZdauMEDBNim+v5Zzud
         uSPg==
X-Gm-Message-State: AOJu0Yy0lEIAMxoBji0BA7SGpcyRkilGe+MEBIrOw+D3h+lzSoTAohci
	xkFV8FPN3gIycLNBWAvPhIUe8QdHLnsFPmbhhYSupw==
X-Google-Smtp-Source: AGHT+IHXE0SvvKh+BBlfB/Y28NFVLbZii8VCDwvUjc5vj9hOtWga8E1x1lbDDWosb6/uDp0Ep2qmMzbPoEnytsptros=
X-Received: by 2002:a05:6512:3b11:b0:50e:5072:3f94 with SMTP id
 f17-20020a0565123b1100b0050e50723f94mr1739541lfv.99.1703145290001; Wed, 20
 Dec 2023 23:54:50 -0800 (PST)
MIME-Version: 1.0
References: <20231221070449.1809020-1-songshuaishuai@tinylab.org> <DM8PR11MB5751B02E235561D402D4C608B895A@DM8PR11MB5751.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5751B02E235561D402D4C608B895A@DM8PR11MB5751.namprd11.prod.outlook.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 21 Dec 2023 15:54:38 +0800
Message-ID: <CABgGipVKwpyAwYL1yQrkt_fJb94eMZTU_xrvgmnrzVsud+-1XA@mail.gmail.com>
Subject: Re: [PATCH] riscv: vector: Check SR_SD before saving vstate
To: "Wang, Xiao W" <xiao.w.wang@intel.com>
Cc: Song Shuai <songshuaishuai@tinylab.org>, 
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, 
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "greentime.hu@sifive.com" <greentime.hu@sifive.com>, 
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>, "guoren@kernel.org" <guoren@kernel.org>, 
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"ruinland.tsai@sifive.com" <ruinland.tsai@sifive.com>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_235454_462096_BAA6AEE1 
X-CRM114-Status: GOOD (  21.96  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMzozN+KAr1BNIFdhbmcsIFhpYW8gVyA8eGlhby53Lndh
bmdAaW50ZWwuY29tPiB3cm90ZToKPgo+Cj4KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4gPiBGcm9tOiBTb25nIFNodWFpIDxzb25nc2h1YWlzaHVhaUB0aW55bGFiLm9yZz4KPiA+IFNl
bnQ6IFRodXJzZGF5LCBEZWNlbWJlciAyMSwgMjAyMyAzOjA1IFBNCj4gPiBUbzogcGF1bC53YWxt
c2xleUBzaWZpdmUuY29tOyBwYWxtZXJAZGFiYmVsdC5jb207Cj4gPiBhb3VAZWVjcy5iZXJrZWxl
eS5lZHU7IGFuZHkuY2hpdUBzaWZpdmUuY29tOyBncmVlbnRpbWUuaHVAc2lmaXZlLmNvbTsKPiA+
IGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tOyBndW9yZW5Aa2VybmVsLm9yZzsKPiA+IHNvbmdz
aHVhaXNodWFpQHRpbnlsYWIub3JnOyBiam9ybkByaXZvc2luYy5jb207IFdhbmcsIFhpYW8gVwo+
ID4gPHhpYW8udy53YW5nQGludGVsLmNvbT47IGhlaWtvQHNudGVjaC5kZTsgcnVpbmxhbmQudHNh
aUBzaWZpdmUuY29tCj4gPiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+ID4gU3ViamVjdDogW1BBVENIXSByaXNjdjogdmVj
dG9yOiBDaGVjayBTUl9TRCBiZWZvcmUgc2F2aW5nIHZzdGF0ZQo+ID4KPiA+IFRoZSBTRCBiaXQg
c3VtbWFyaXplcyB0aGUgZGlydHkgc3RhdGVzIG9mIEZTLCBWUywgb3IgWFMgZmllbGRzLAo+ID4g
cHJvdmlkaW5nIGEgImZhc3QgY2hlY2siIGJlZm9yZSBzYXZpbmcgZnN0YXRlIG9yIHZzdGF0ZS4K
PiA+Cj4gPiBMZXQgX19zd2l0Y2hfdG9fdmVjdG9yKCkgY2hlY2sgU0QgYml0IGFzIF9fc3dpdGNo
X3RvX2ZwdSgpIGRvZXMuCj4KPiBJdCBsb29rcyBhIGR1cGxpY2F0aW9uIG9mIHN0YXR1cyBjaGVj
ayBzaW5jZSB0aGUgX19zd2l0Y2hfdG9fKigpIGludGVybmFsbHkgd2lsbCBjaGVjayB0aGUgZXh0
IHNwZWNpZmljIHN0YXR1cyBiaXQuCj4gQ2FuIHdlIGp1c3QgcmVtb3ZlIFNSX1NEIGNoZWNrIGZv
ciB0aGUgZnB1KCkgY2FzZT8KCkhpLCBJIGNhbWUgdG8gdGhlIHNhbWUgcXVlc3Rpb24gd2hlbiBh
ZGRpbmcgdGhlIFZlY3RvciBjb250ZXh0IHN3aXRjaC4KSSB0aGluayB0aGUgYmV0dGVyIHNvbHV0
aW9uIGlzIHRvIHNraXAgc2F2aW5nIGJvdGggZnB1IGFuZCB2ZWN0b3IgaWYKdGhlIFNEIGlzIGNs
ZWFyLiBIb3dldmVyLCB0aGlzIG1heSBtYWtlIGNvZGUgbGVzcyBtYWludGFpbmFibGUgYmVjYXVz
ZQpmcHUgYW5kIHZlY3RvciBjb2RlIGFyZSBzY2F0dGVyZWQgYW5kIHdlIG11c3QgbWl4IGNvZGUg
dG9nZXRoZXIgYnkKZG9pbmcgdGhhdC4gQWxzbywgd2Ugd2lsbCBoYXZlIHRvIGR1cGxpY2F0ZSBo
YXNfZnB1IGFuZCBoYXNfdmVjdG9yCmNoZWNrIGJlY2F1c2Ugb2YgdGhlIGJyYW5jaCBkZXBlbmRl
bmN5CgplLmcuCgppZiAobGlrZWx5KChyZWdzLT5zdGF0dXMgJiBTUl9TRCkpKSB7CiAgICBpZiAo
aGFzX2ZwdSgpKQogICAgICAgIGZzdGF0ZV9zYXZlKCkKICAgIGlmIChoYXNfdmVjdG9yKCkpCiAg
ICAgICAgdnN0YXRlX3NhdmUoKQp9CgppZiAoaGFzX2ZwdSgpKSA8LS0tIGR1cGxpY2F0ZWQgY2hl
Y2sgKG5vcCkKICAgIGZzdGF0ZV9yZXN0b3JlKCkKaWYgKGhhc192ZWN0b3IoKSkgPC0tLSBzYW1l
CiAgICB2c3RhdGVfcmVzdG9yZSgpCgpTbywgaXQgcmVhbGx5IGlzICJJcyBpdCB3b3J0aCB0byB0
cmFkZSBleHRyYSBub3Agd2l0aCBTUl9TRCB0aGF0CnBvdGVudGlhbGx5IHNraXAgb25lIFNSXypT
IGNoZWNrIgoKQmVzaWRlcywgd2l0aCB1c2VyIHNwYWNlIGxpYnJhcmllcyBzdGFydCBlbWJyYWNp
bmcgVmVjdG9yLCBJIGRvbid0CmV4cGVjdCBTUl9TRCB3b3VsZCBiZSBpbiAiY2xlYXJlZCIgc3Rh
dGUgdmVyeSBvZnRlbi4gVGhvdWdoIEkgaGF2ZW4ndApkb25lIGFueSByZWFsLXdvcmxkIGV4cGVy
aW1lbnQgeWV0LgoKPgo+IEJScywKPiBYaWFvCj4KPiA+Cj4gPiBGaXhlczogM2EyZGY2MzIzZGVm
ICgicmlzY3Y6IEFkZCB0YXNrIHN3aXRjaCBzdXBwb3J0IGZvciB2ZWN0b3IiKQo+ID4gU2lnbmVk
LW9mZi1ieTogU29uZyBTaHVhaSA8c29uZ3NodWFpc2h1YWlAdGlueWxhYi5vcmc+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIHwgMyArKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3ZlY3Rvci5oCj4gPiBpbmRleCA4N2FhZWY2NTYyNTcuLmQzMGZhNTZmNjdjNiAxMDA2NDQK
PiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+ICsrKyBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiA+IEBAIC0xOTAsNyArMTkwLDggQEAgc3RhdGlj
IGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QKPiA+IHRhc2tfc3RydWN0ICpw
cmV2LAo+ID4gICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3M7Cj4gPgo+ID4gICAgICAgcmVncyA9
IHRhc2tfcHRfcmVncyhwcmV2KTsKPiA+IC0gICAgIHJpc2N2X3ZfdnN0YXRlX3NhdmUocHJldiwg
cmVncyk7Cj4gPiArICAgICBpZiAodW5saWtlbHkocmVncy0+c3RhdHVzICYgU1JfU0QpKQo+ID4g
KyAgICAgICAgICAgICByaXNjdl92X3ZzdGF0ZV9zYXZlKHByZXYsIHJlZ3MpOwo+ID4gICAgICAg
cmlzY3Zfdl92c3RhdGVfcmVzdG9yZShuZXh0LCB0YXNrX3B0X3JlZ3MobmV4dCkpOwo+ID4gIH0K
PiA+Cj4gPiAtLQo+ID4gMi4yMC4xCj4KClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
