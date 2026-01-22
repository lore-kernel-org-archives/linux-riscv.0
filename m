Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D3CC44500
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 07:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC5JrDT9MZlRzVMGI+ARn6Lrk7kylbL4EbviAajpRds=; b=TEjwuZCvAZkEdp
	ZvUZcBvXVT7bdHXMhaE8QY1J+y3e60HyVSFKrgIHuNKY/Vb2SwvB+RpFo8Cqfghex2Pq1aMFJEGr0
	yiaLSzC1p8aQzKhkhw7AL8BPLmqYfcxu7mV99Z80zUMYTHJvllNkK1rsDySeisutnMC709Fynppui
	9xZtaZBQXLsexG1E+78RnF9MZLlGoae8++YCzkQkfywh1y6+n5Qf8BwkvRfdGFxrpjrdld9+QZy3P
	CPHJXtGP2If+GLo9gC7KX5FBeTv2W0N4Ss534zzBcVpZOGvn98g3bUGidU2yBqkEEFAaBFX4p5+YO
	MV2C2VT+yY0LV43Ti5GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipGi-00000006aoH-0sgE;
	Thu, 22 Jan 2026 07:38:16 +0000
Received: from sender4-pp-e103.zoho.com ([136.143.188.103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipGf-00000006anf-2X6b
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 07:38:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769067460; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IUEuA7iixpF8g6ihu8V8QGi6kaYgpTSlcHr9jxQn95IhlcvR+ybd1ACfxTbavWTBhlLI1Die9W8M0iY4Q+IbERFuXWDutDMBfW3FCM6TfzI+Odop3ALe/dvZzFg2uSP9go1XT8ondylOifQPWF8nMm++AR5J96/UnIz8IVqnNT4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769067460; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=27t/D+au2E5C7LW4H+D00miBeJuLJZVdStU+4BuYmh4=; 
	b=eaDyfkKxPxRVa7wKWqTtOcFUdn1p2i/yyyZhYw0prb8NP+UyuEK4KONMzasLMwN9v/1OA5hFPt0peSHh8Fbfibo7jLPuxjSP5vyHt1V2gM+IFXJ6sK2qhu91rWdZkdjsU9B5KT9vtexBp5GtB9trqzsbOYOjBbLQIuhkd21o3hg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769067460;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=27t/D+au2E5C7LW4H+D00miBeJuLJZVdStU+4BuYmh4=;
	b=E+/jIas7Qh4p+m3shDjLivdA1NgpOR9fsh0txKMDmdekAFcI/OsLfNSKNJskPDta
	k7B6xtQG4Afm0gWd8AAJoUsWnXXwJlRhzPv6alDhFVqTKj6nVam/WqxLR0XcMcnzhxS
	F799VRlpXCnjfuR7iVsxs8JzXKU4hFcN+UK1qlZERlcpEr3Wtk+xLeoPXxv5THrLD+P
	v9CqdepE/9dZSN1XK8n/vEVD4B3R+njPjvC7d2Y6we0QqOrlyjviXvf0j8y0O9zjdsd
	KMe3Yuk6xQT1w/7vkvGpOWmqexzOLTuTG2EIWyJLztnOq9ulCveKaGCrGEL20K8r/6Y
	mdY8291CkQ==
Received: by mx.zohomail.com with SMTPS id 176906745890729.598189028159595;
	Wed, 21 Jan 2026 23:37:38 -0800 (PST)
Message-ID: <bf129af81c999b9b0760036ed2755e0c3da3e9c1.camel@icenowy.me>
Subject: Re: [PATCH v5 3/9] drm: verisilicon: add a driver for Verisilicon
 display controllers
From: Icenowy Zheng <uwu@icenowy.me>
To: Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob
 Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Dmitry Baryshkov
 <lumag@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,  Yao
 Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Han Gao <gaohan@iscas.ac.cn>
Date: Thu, 22 Jan 2026 15:37:28 +0800
In-Reply-To: <f49d5e01-1e01-4393-9ba3-2079006984ae@suse.de>
References: <20260116043746.336328-1-zhengxingda@iscas.ac.cn>
	 <20260116043746.336328-4-zhengxingda@iscas.ac.cn>
	 <56e1974c-0fe6-4bdb-918d-fcf6a8b866c1@suse.de>
	 <4afa6f3110790c701c5e24901e9e66560cf21ad0.camel@icenowy.me>
	 <f49d5e01-1e01-4393-9ba3-2079006984ae@suse.de>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_233813_706888_E59C7866 
X-CRM114-Status: UNSURE (   9.36  )
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

5ZyoIDIwMjYtMDEtMjLmmJ/mnJ/lm5vnmoQgMDg6MzEgKzAxMDDvvIxUaG9tYXMgWmltbWVybWFu
buWGmemBk++8mgo+IEhpCj4gCj4gQW0gMjIuMDEuMjYgdW0gMDg6MDYgc2NocmllYiBJY2Vub3d5
IFpoZW5nOgo+ID4g5ZyoIDIwMjYtMDEtMjHmmJ/mnJ/kuInnmoQgMTM6NTYgKzAxMDDvvIxUaG9t
YXMgWmltbWVybWFubuWGmemBk++8mgo+ID4gCj4gPiA9PT09PT09PT09PT09PT0gODwgPT09PT09
PT09PT09PT09PT0KPiA+ID4gPiArCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGlycXMpCj4g
PiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByX3dhcm4oIlVua25vd24gVmVy
aXNpbGljb24gREMgaW50ZXJydXB0IDB4JXgKPiA+ID4gPiBmaXJlZCFcbiIsIGlycXMpOwo+ID4g
PiBJJ2QgYXZvaWQgcHJfd2FybigpIGhlcmUuIFRoaXMgY2FuIGZpbGwgeW91ciBsb2dzIHF1aWNr
bHkuCj4gPiBUaGVuIGlzIHByX3dhcm5fb25jZSgpIG9rYXk/Cj4gCj4gWWVhaCwgd2Fybl9vbmNl
IHNob3VsZCBiZSBmaW5lLgo+IAo+ID4gCj4gPiA+ID4gKwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDC
oHJldHVybiBJUlFfSEFORExFRDsKPiA+ID4gPiArfQo+ID4gPT09PT09PT09PT09PT09IDg8ID09
PT09PT09PT09PT09PT09Cj4gCj4gTWF5YmUgY29uc2lkZXIgcmV0dXJuaW5nIElSUV9OT05FIGlm
IHRoZSAoaXJxKSB0ZXN0cyBzdWNjZWVkcy4KCldlbGwsIHRoZSBJUlFzIGFyZSByZWFkIGZyb20g
dGhlIGRldmljZSdzIHJlZ2lzdGVyLCBhbmQgdGhlIHJlYWQKb3BlcmF0aW9uIGF1dG9tYXRpY2Fs
bHkgQUNLcyB0aGUgSVJRLCBzbyBpdCBzb3VuZHMgbW9yZSBhcHByb3ByaWF0ZSB0bwphbHdheXMg
cmV0dXJuIElSUV9IQU5ETEVELgoKKFdlbGwgbWF5YmUgdGhpcyBmdW5jdGlvbiBzaG91bGQgYmUg
bWFkZSByZXR1cm4gdm9pZCwgYW5kIHJldHVybmluZwpJUlFfSEFORExFRCBzaG91bGQgYmUgZG9u
ZSBpbiB0aGUgY2FsbGVyIG9mIHRoaXMgZnVuY3Rpb24sCnZzX2RjX2lycV9oYW5kbGVyKCkgKQoK
VGhhbmtzLApJY2Vub3d5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
