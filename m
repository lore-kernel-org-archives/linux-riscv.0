Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0C0EB1043
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2026 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gsVoD6S9IFpvlzcziUUClqc3F46ncZ9fgNWAxh59/90=; b=1XUIMSUKqgBfOT
	Rh37vGGBbCTnCgBYP0Jcu4XtoOhVh5W2XwiHV0jO45M52YZ2Mc0gcCbt3eV+JTkKYSKw4Icq5lRav
	/sqy/A91Lhg9RCvsBi0z6xMe2NX8+gI9hd7k4oo0pK1ZGvrF3P4qarMTcFM6cq6XiUUNd/kXQdkpF
	Q5JVBqujfKH6RioI+1gzoIuoxohRLU9OyHLx7wgR7ZJSCqV42fJrl5UnTk0JfRG8QrRryD0G7XaSA
	ywguWhv7qGFxpo8qSvj7TKyZ4tiY3GDjMdclXGgbaNUA9BzeSyaSOuZYef/kDW4XEzuvaVXlpSGPn
	Zwv2ihEvNtYXTqREVXaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuHo-00000009Bmp-0Ejs;
	Tue, 10 Mar 2026 10:26:00 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzuHj-00000009BkC-1BLK
	for linux-riscv@lists.infradead.org;
	Tue, 10 Mar 2026 10:25:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 42B49C406B4;
	Tue, 10 Mar 2026 10:26:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B58E60002;
	Tue, 10 Mar 2026 10:25:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8F4A410369AAA;
	Tue, 10 Mar 2026 11:25:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773138351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nk14u7MxuVGH3IXCBDHPoTIp85NK3FE7BltrimnfOOk=;
	b=X5YVj3BsGK084AynP8+E6oyih5gqoqcdue/c3CwFV6MFxV44e5SAdOKcG3s2rqMWV3Hq1o
	Jctg0Kx2qZZJmkOIkuuUoHQU57LqlPHWFfFNOCSNhaM8PeDctipuFwHbElEDSS15ArJjOn
	o/5mFUfXeFEkSTi6KKlYa8xilMHDIm/z6Jaqutxhde0kgHuyMQoh5LG/nzD1bQhBszU8EW
	auxo4bkPv8ydWNk56SVYijfsn9tXaMLL4Zf3q88P3IrHBFAdN+eKxKzchB2b+iRXe/qQx7
	jGMLomyGXtsUKWIAn6DDARb/dtDqwtHQY2tnJXOq+mccxIqRN5r7BYKUKFUZAQ==
Mime-Version: 1.0
Date: Tue, 10 Mar 2026 11:25:45 +0100
Message-Id: <DGZ132GP5IU3.1299QBUOW9D0X@bootlin.com>
Cc: "Philipp Zabel" <p.zabel@pengutronix.de>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Michal Wilczynski" <m.wilczynski@samsung.com>, "Han
 Gao" <gaohan@iscas.ac.cn>, "Yao Zi" <ziyao@disroot.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Drew Fustini" <fustini@kernel.org>, "Guo
 Ren" <guoren@kernel.org>, "Fu Wei" <wefu@redhat.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 3/8] drm: verisilicon: add a driver for Verisilicon
 display controllers
X-Mailer: aerc 0.20.1
References: <20260129023922.1527729-1-zhengxingda@iscas.ac.cn>
 <20260129023922.1527729-4-zhengxingda@iscas.ac.cn>
 <DGY9GWWLXGNX.265MMEXXCG8YA@bootlin.com>
 <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
In-Reply-To: <301a33fc27bd01bb50d57779c2f9eb51a4fafaa5.camel@iscas.ac.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_032555_609623_6FA07FCE 
X-CRM114-Status: GOOD (  27.59  )
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

SGVsbG8gSWNlbm93eSwKCk9uIE1vbiBNYXIgOSwgMjAyNiBhdCA1OjM1IFBNIENFVCwgSWNlbm93
eSBaaGVuZyB3cm90ZToKCj4+ID4gK3N0cnVjdCB2c2RjX2RwX2Zvcm1hdCB7Cj4+ID4gKwl1MzIg
bGludXhfZm10Owo+PiA+ICsJYm9vbCBpc195dXY7Cj4+ID4gKwl1MzIgdnNkY19mbXQ7Cj4+ID4g
K307Cj4+Cj4+IE1vdmluZyB0aGUgYm9vbCBhZnRlciB0aGUgdHdvICd1MzIncyB3b3VsZCBiZSBi
ZXR0ZXIgZm9yIHBhY2tpbmcgYW5kCj4+IHNwYXRpYWwgbG9jYWxpdHkgKGVzcGVjaWFsbHkgaW4g
Y2FzZSBtb3JlIGZpZWxkcyBhcmUgYWRkZWQgaW4gdGhlCj4+IGZ1dHVyZSkuCj4KPiBZZXMgdGhp
cyBzZWVtcyB0byBzb3VuZCByaWdodCwgYnV0IGRvaW5nIHN1Y2ggcmV3b3JrIHNvdW5kcyBxdWl0
ZSBiaWcKPiBhbmQgdW5uZWNlc3NhcnkgYWZ0ZXIgaXQncyBhcHBsaWVkLi4uCgpVZ2gsIGFwb2xv
Z2llcywgSSBzZW50IG15IHJlcGx5IHdpdGhvdXQgbm90aWNpbmcgdGhpcyBwYXRjaCBoYWQgYmVl
bgphcHBsaWVkIGFscmVhZHkuIEFueXdheSwgYXMgVGhvbWFzIHBvaW50ZWQgb3V0LCB5b3UgY2Fu
IHN0aWxsIGRvIHRoaXMKY2hhbmdlIGFzIGEgc2VwYXJhdGUgcGF0Y2ggaWZpIHlvdSB3YW50LiBP
ciBqdXN0IG5vdCBkbyBhbnl0aGluZywgdGhpcyBjYW4KYmUgZG9uZSBsYXRlciBpbiBjYXNlIG5l
dyBmaWVsZHMgYXJlIGFkZGVkLiBXaXRob3V0IG5ldyBmaWVsZHMgdGhlCnJlb3JkZXJpbmcgd291
bGQgbm90IHByb2R1Y2UgbXVjaCBiZW5lZml0IGFueXdheS4KCj4+ID4gK3N0YXRpYyBzdHJ1Y3Qg
dnNkY19kcF9mb3JtYXQgdnNkY19kcF9zdXBwb3J0ZWRfZm10c1tdID0gewo+PiA+ICsJLyogZGVm
YXVsdCB0byBSR0I4ODggKi8KPj4gPiArCXsgTUVESUFfQlVTX0ZNVF9GSVhFRCwgZmFsc2UsCj4+
ID4gVlNEQ19ESVNQX0RQX0NPTkZJR19GTVRfUkdCODg4IH0sCj4+ID4gKwl7IE1FRElBX0JVU19G
TVRfUkdCODg4XzFYMjQsIGZhbHNlLAo+PiA+IFZTRENfRElTUF9EUF9DT05GSUdfRk1UX1JHQjg4
OCB9LAo+PiA+ICsJeyBNRURJQV9CVVNfRk1UX1JHQjU2NV8xWDE2LCBmYWxzZSwKPj4gPiBWU0RD
X0RJU1BfRFBfQ09ORklHX0ZNVF9SR0I1NjUgfSwKPj4gPiArCXsgTUVESUFfQlVTX0ZNVF9SR0I2
NjZfMVgxOCwgZmFsc2UsCj4+ID4gVlNEQ19ESVNQX0RQX0NPTkZJR19GTVRfUkdCNjY2IH0sCj4+
ID4gKwl7IE1FRElBX0JVU19GTVRfUkdCMTAxMDEwXzFYMzAsCj4+ID4gKwnCoCBmYWxzZSwgVlNE
Q19ESVNQX0RQX0NPTkZJR19GTVRfUkdCMTAxMDEwIH0sCj4+Cj4+IFlvdSBjYW4gcHV0IHVwIHRv
IDEwMCBjaGFycyBwZXIgbGluZSBhbmQgYXZvaWQgdGhlIG5ld2xpbmUgaGVyZSB0bwo+PiBtYWtl
Cj4+IHRoaXMgdGFibGUgbW9yZSByZWFkYWJsZS4gU2FtZSBiZWxvdy4KPgo+IEFoIEkgcHJlZmVy
IHRvIGtlZXAgODAgQ1BMIHdoZW4gSSBjYW4sIGFuZCB0aGUgYGNvZGluZy1zdHlsZS5yc3RgCj4g
ZG9jdW1lbnQgc3RpbGwgc3VnZ2VzdHMgODAuCgpjb2Rpbmctc3R5bGUucnN0IHNlZW1zIHZlcnkg
dmFndWUgIGFib3V0IHRoYXQsIGJ1dCBjaGVja3BhdGNoIGlzIGNsZWFyOgoKICBteSAkbWF4X2xp
bmVfbGVuZ3RoID0gMTAwOwoKKGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE5
LjYvc291cmNlL3NjcmlwdHMvY2hlY2twYXRjaC5wbCNMNjApCgpBbnl3YXksIG5vbiBuZWVkIHRv
IHNlbmQgYSBwYXRjaCBub3cgdGhhdCBpdCdzIGNvbW1pdHRlZCBmb3IgdGhpcywKZGVmaW5pdGVs
eS4gQWdhaW4sIHNvcnJ5IGZvciB0aGUgbm9pc2Ugb24gYW4gYWxyZWFkeSBhcHBsaWVkIHBhdGNo
LgoKPj4gPiArc3RydWN0IHZzX2JyaWRnZSAqdnNfYnJpZGdlX2luaXQoc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYsCj4+ID4gKwkJCQkgc3RydWN0IHZzX2NydGMgKmNydGMpCj4+ID4gK3sKPj4g
PiArCXVuc2lnbmVkIGludCBvdXRwdXQgPSBjcnRjLT5pZDsKPj4gPiArCXN0cnVjdCB2c19icmlk
Z2UgKmJyaWRnZTsKPj4KPj4gSW4gY29tbW9uIHByYWN0aWNlIGEgdmFyaWFibGUgbmFtZWQgJ2Jy
aWRnZScgaXMgdXNlZCB0byBwb2ludCB0byBhCj4+ICdzdHJ1Y3QKPj4gZHJtX2JyaWRnZScsIHNv
IGl0IGZlZWxzIHdlaXJkIHdoZW4gaXQgaXMgdXNlZCBmb3IgYW5vdGhlciB0eXBlLiBDYW4KPj4g
eW91Cj4+IHJlbmFtZSB0byAndmJyaWRnZScgb3IgJ3ZzYnJpZGdlJyBvciBzaW1pbGFyLCB0byBj
bGFyaWZ5IGl0J3MgdGhlCj4+ICJWZXJpc2lsaWNvbiBicmlkZ2UiPwo+Cj4gVGhpcyBzb3VuZHMg
cmlnaHQuCj4KPiBCVFcgd2hlcmUgaXMgc3VjaCBraW5kIG9mIGNvbW1vbiBwcmFjdGljZSBkb2N1
bWVudGVkPwoKQXMgaXQgb2Z0ZW4gaGFwcGVucywgaW4gdGhlIGNvZGUsIEknbSBhZnJhaWQuCgpJ
J3ZlIGJlZW4gdG91Y2hpbmcgYSBsb3Qgb2YgRFJNIGJyaWRnZSBhbmQgcmVsYXRlZCBjb2RlIHJl
Y2VudGx5IGFzIHBhcnQgb2YKdGhlIGJyaWRnZSBob3RwbHVnIHdvcmsgSSdtIGRvaW5nLCBhbmQg
SSBnYXRoZXJlZCBhbiBvdmVyYWxsIHZpZXcgb2YgdGhlCmN1cnJlbnQgY29tbW9uIHByYWN0aWNl
IGFzIHdlbGwgYXMgd2hpY2ggY29udmVudGlvbnMgYXJlIG1vcmUgcmVhZGFibGUgdGhhbgpvdGhl
cnMuCgo+PiA+ICsJCXJldHVybiBFUlJfUFRSKHJldCk7Cj4+ID4gKwl9Cj4+ID4gKwo+PiA+ICsJ
aWYgKGludGYgPT0gVlNEQ19PVVRQVVRfSU5URVJGQUNFX0RQSSkKPj4gPiArCQlicmlkZ2VfZnVu
Y3MgPSAmdnNfZHBpX2JyaWRnZV9mdW5jczsKPj4gPiArCWVsc2UKPj4gPiArCQlicmlkZ2VfZnVu
Y3MgPSAmdnNfZHBfYnJpZGdlX2Z1bmNzOwo+PiA+ICsKPj4gPiArCWJyaWRnZSA9IGRldm1fZHJt
X2JyaWRnZV9hbGxvYyhkcm1fZGV2LT5kZXYsIHN0cnVjdAo+PiA+IHZzX2JyaWRnZSwgYmFzZSwK
Pj4gPiArCQkJCcKgwqDCoMKgwqDCoCBicmlkZ2VfZnVuY3MpOwo+Pgo+PiBUaGUgJ3N0cnVjdCBk
cm1fYnJpZGdlJyBmaWVsZCBlbWJlZGRlZCBpbiBhIGRyaXZlci1zcGVjaWZpYyBzdHJ1Y3QgaXMK
Pj4gY29udmVudGlvbmFsbHkgY2FsbGVkICdicmlkZ2UnLCBzbyByZW5hbWluZyBpdCBmcm9tICdi
YXNlJyB0bwo+PiAnYnJpZGdlJwo+PiB3b3VsZCBtYWtlIGl0IG1vcmUgY29uc2lzdGVudCB3aXRo
IG90aGVyIGRyaXZlcnMuIFRoYXQgd291bGQgZ28gaW4KPj4gc3luYwo+PiB3aXRoIHRoZSBjb2Rp
bmcgY29udmVudGlvbiBJIG1lbnRpb25lZCBhYm92ZTogJ2JyaWRnZScgZm9yIHN0cnVjdAo+PiBk
cm1fYnJpZGdlLCA8WFlaPmJyaWRnZSBvciBqdXN0IDxYWVpaPiBmb3IgYSBjdXN0b20gZHJpdmVy
IHN0cnVjdAo+PiBlbWJlZGRpbmcKPj4gYSBicmlkZ2UuCj4KPiBBaCwgYWxsIHN1YmNsYXNzZXMg
aW4gdGhpcyBkcml2ZXIgY2FsbCB0aGUgYmFzZSBjbGFzcyBgYmFzZWAsIGFuZCBJCj4gc3RpbGwg
d29uZGVyIGhvdyBzdWNoIGNvbnZlbnRpb24gaXMgZG9jdW1lbnRlZC4KCkl0J3MgYSBnYWluIHRo
ZSBjb21tb24gcHJhY3RpY2UgaW4gdGhlIGNvZGU6CgokIGdpdCBncmVwIC1oIC1FICdbWzpzcGFj
ZTpdXXN0cnVjdCBkcm1fYnJpZGdlIFwqW1s6YWxudW06XV9dKjsnIC0tIGRyaXZlcnMvZ3B1L2Ry
bS8gfCBcCiAgc2VkICdzL15bWzpzcGFjZTpdXSovLycgfCBncmVwIC12IHBhbmVsX2JyaWRnZSB8
IHNvcnQgfCB1bmlxIC1jIHwgc29ydCAtbnIKICAgICA5MiBzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJp
ZGdlOwogICAgIDI3IHN0cnVjdCBkcm1fYnJpZGdlICpuZXh0X2JyaWRnZTsKICAgICAgMyBzdHJ1
Y3QgZHJtX2JyaWRnZSAqY29tcGFuaW9uOwogICAgICAyIHN0cnVjdCBkcm1fYnJpZGdlICpuZXh0
OwogICAgICAyIHN0cnVjdCBkcm1fYnJpZGdlICppdGVyOwogICAgICAxIHN0cnVjdCBkcm1fYnJp
ZGdlICp0bXBfYnJpZGdlOwogICAgICAxIHN0cnVjdCBkcm1fYnJpZGdlICpvdXRfYnJpZGdlOwog
ICAgICAxIHN0cnVjdCBkcm1fYnJpZGdlICpleHRfYnJpZGdlOwogICAgICAxIHN0cnVjdCBkcm1f
YnJpZGdlICpkcm1fYnJpZGdlOwpbLi4uXQoKU28gJ2JyaWRnZScgaXMgYnkgZmFyIHRoZSBtb3N0
IGNvbW1vbiwgYW5kICdiYXNlJyBkb2VzIG5ldmVyIGFwcGVhci4KCj4+IFRoZXJlIGlzIG5vdyBh
IG5leHRfYnJpZGdlIGZpZWxkIGluIHN0cnVjdCBkcm1fYnJpZGdlLCB3aGljaCBoYW5kbGVzCj4+
IHRoZQo+PiBicmlkZ2UgbGlmZXRpbWUgaW4gYSBzYWZlciB3YXkgYW5kIG1vcmUgc2ltcGx5IFsw
XSwgc28geW91IGNvdWxkIHVzZQo+PiBpdDoKPgo+IEdsYWQgdG8gaGVhciBzdWNoIGEgZmllbGQg
ZXhpc3RzIG5vdy4gV2lsbCBtb3JlIGNvZGUgYWJvdXQgbmV4dF9icmlkZ2UKPiBsaWZldGltZSBt
YW5hZ2VtZW50IGJlaW5nIHNoYXJlZD8KCk5vdCBzdXJlIGV4YWN0bHkgd2hhdCB5b3UgbWVhbiBo
ZXJlLiBJZiB5b3UgYXJlIGFza2luZyBob3cgbmV4dF9icmlkZ2UKd29ya3M6IGl0J3MgdmVyeSBz
aW1wbGUsIGFsbCBiZWluZyBpbiB0aGUgZGVjbGFyYXRpb24gWzBdICh3aGVyZSBJCmV4cGxhaW5l
ZCBpdCB0byB0aGUgYmVzdCBJIGNvdWxkIGluIHRoZSBjb21tZW50KSBhbmQgaXRzIHVzYWdlIGlu
IHRoZQpkZXN0cnVjdGlvbiBjYWxsYmFjayB3aGVuIHRoZSBsYXN0IHJlZmVyZW5jZSBpcyBwdXQg
WzFdLgoKWzBdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjAtcmMzL3NvdXJj
ZS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29t
L2xpbnV4L3Y3LjAtcmMzL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jI0wyNjcK
CkJlc3QgcmVnYXJkcywKTHVjYQoKLS0KTHVjYSBDZXJlc29saSwgQm9vdGxpbgpFbWJlZGRlZCBM
aW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
