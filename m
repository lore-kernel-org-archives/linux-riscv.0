Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C3CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ikzs5D+38Zn2tebeghdhwc8VYvztNxsBr8gmq5aNSDw=; b=NnCB5Jukrq3CAp
	FBtglbHxU12nrMKbfMJ4K19WDi6TmXC21rb1PlTVqGLnO7U4i3oZrsXDYB2NU/3Kmi12kNg17pRvl
	yxEvC/e/itg8ooQ3lVkO/is3Cq6kIPRDWdU3wz7dL3hSZOh/UL/rr60QyPKbetqBHvFEFZCI3Husa
	y+U6inu30MCIzfHIlLZxorOWRQNfKvbwgUcBdHv7/fkmEODhv9FQS01dWHdDiWqMv2mxQrfnO5dPV
	BAQM99BLJ4H6lmSnajMzAEU7AjemYW3t8jaGMwMoi8CX+xz0fTzqoKCtdBiHzNrbdaFD3BAUZ/sjL
	AiRqqp4yGYRNmyb656cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw20s-00000008vm0-2oHb;
	Tue, 09 Sep 2025 17:20:14 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvypc-00000007YZw-2CNu;
	Tue, 09 Sep 2025 13:56:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757426185; x=1788962185;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=g/QqtRMuBql/lAp+Wpk1UAHBNS5otc0roGKqOnIPLHk=;
  b=Bd6brfpgte5USq04G7FKZeMq7ZNLex4b8+9D3MQOwTdNEw1Ln0adlycr
   oMAtN1YSDQbDy9FGLP+g6Z74QB4iSI5/u6aGWTTUDNzvy511W/V+tw4tc
   x7m2lv5fSJr/voSDsN1wrDwJEbIxl7NXYdslSLP9nCtWDgmZW30zDc9pP
   U08dY1EaJISWWZZu8N7PfLzXrl3OedUxq0xn0ScfP8edguGpPP11+p7C4
   VflN9fbtCiaS1oN/MZP23ezVyp/+dQKw7pUDxvWrLtMEX5du3C3tTefIb
   AWCbLe8t2a4h+0nJ6hwykkshhmx4vEjf4IFr+Egw0p+weCFbbl+k9gllU
   A==;
X-CSE-ConnectionGUID: 1BXFm5xRQnOg6LDboHm2Xg==
X-CSE-MsgGUID: M8Pt/czLRoy+AcnbYNw3Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="69964137"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="69964137"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:56:21 -0700
X-CSE-ConnectionGUID: ks5yNBpNSuKS3BFnVbhH5w==
X-CSE-MsgGUID: P7SuEn8mRlSdRZ+kBu7loA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="172963735"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 06:56:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1uvypQ-00000001UyO-2aQ3;
	Tue, 09 Sep 2025 16:56:12 +0300
Date: Tue, 9 Sep 2025 16:56:12 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
Message-ID: <aMAx_EwwBteiI9K6@smile.fi.intel.com>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com>
 <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com>
 <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com>
 <aMAv3STeZUdSQ14p@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aMAv3STeZUdSQ14p@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_065624_601175_B11A51D6 
X-CRM114-Status: GOOD (  35.55  )
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

T24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDQ6NDc6MDlQTSArMDMwMCwgQW5keSBTaGV2Y2hlbmtv
IHdyb3RlOgo+IE9uIFR1ZSwgU2VwIDA5LCAyMDI1IGF0IDA0OjQ1OjMxUE0gKzAzMDAsIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToKPiA+IE9uIFR1ZSwgU2VwIDA5LCAyMDI1IGF0IDA4OjI0OjIzQU0g
LTA1MDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgOSBTZXAgMjAy
NSAxNToxMzowNCArMDIwMCwgQW5keSBTaGV2Y2hlbmtvCj4gPiA+IDxhbmRyaXkuc2hldmNoZW5r
b0BpbnRlbC5jb20+IHNhaWQ6Cj4gPiA+ID4gT24gVHVlLCBTZXAgMDksIDIwMjUgYXQgMDE6MzU6
MDRQTSArMDIwMCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+ID4gPj4gT24gVHVlLCBT
ZXAgOSwgMjAyNSBhdCAxOjMx4oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA+ID4+IDxhbmRyaXku
c2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOgo+ID4gPiA+PiA+IE9uIFR1ZSwgU2VwIDA5LCAy
MDI1IGF0IDExOjE1OjQwQU0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6CgouLi4K
Cj4gPiA+ID4+ID4gPiArICAgICBjb25maWcgPSAodHlwZW9mKGNvbmZpZykpewo+ID4gPiA+PiA+
Cj4gPiA+ID4+ID4gVGhpcyBsb29rcyB1bnVzdWFsLiBXaHkgY2FuJ3QgcHJvcGVybHkgZm9ybWVk
IGNvbXBvdW5kIGxpdGVyYWwgYmUgdXNlZCBhcyBpbgo+ID4gPiA+PiA+IG1hbnkgb3RoZXIgcGxh
Y2VzIGluIHRoZSBrZXJuZWw/Cj4gPiA+ID4+Cj4gPiA+ID4+IEl0IGlzIGNvcnJlY3QgQwo+ID4g
PiA+Cj4gPiA+ID4gSWYgaXQgY29tcGlsZXMsIGl0IGRvZXNuJ3QgbWVhbiBpdCdzIGNvcnJlY3Qg
QywgaXQgbWlnaHQgYmUgbm9uLXN0YW5kYXJkLgo+ID4gPiA+IEhhdmUgeW91IGNoZWNrZWQgd2l0
aCB0aGUgc3RhbmRhcmQgKG5vdGUsIEkgcmVhZCB0aGF0IHBhcnQgaW4gdGhlIHBhc3QsCj4gPiA+
ID4gYnV0IEkgbWF5IGZvcmdvdCB0aGUgZGV0YWlscywgc28gSSBkb24ndCBrbm93IHRoZSBhbnN3
ZXIgdG8gdGhpcyk/Cj4gPiA+IAo+ID4gPiBJdCdzIGEgR05VIGV4dGVuc2lvbiBhbHJpZ2h0Cj4g
PiAKPiA+IGNsYW5nLCBJIHN1cHBvc2UsIGFsc28gb2theSB3aXRoIHRoaXM/Cj4gPiAKPiA+ID4g
YnV0IGl0J3Mgc3VwcG9ydGVkIGluIHRoZSBrZXJuZWwgYXMgaXQgZXZhbHVhdGVzCj4gPiA+IHRv
IGEgc2ltcGxlIGNhc3QuCj4gPiAKPiA+IFRoZXJlIGlzIG5vIGNhc3QuIEFuZCB0aGF0J3MgbWFr
ZSBhIGJpZyBkaWZmZXJlbmNlIHRvIHdoYXQgdGhlIGNvZGUgdHJpZXMgdG8gZG8uCj4gPiAKPiA+
ID4gPj4gYW5kIGNoZWNrcGF0Y2ggZG9lc24ndCByYWlzZSBhbnkgd2FybmluZ3MuCj4gPiA+ID4K
PiA+ID4gPiBjaGVja3BhdGNoIGlzIGZhciBmcm9tIGJlaW5nIHVzZWZ1bCBpbiB0aGUgcXVlc3Rp
b25zIGxpa2UgdGhpcy4KPiA+ID4gPiBJdCBmYWxzZSBwb3NpdGl2ZWx5IGNvbXBsYWlucyBmb3Ig
Zm9yX2VhY2gqKCkgbWFjcm9zIGFsbCBvdmVyCj4gPiA+ID4gdGhlIGtlcm5lbCwgZm9yIGV4YW1w
bGUuCj4gPiA+ID4KPiA+ID4gPj4gSXQncyB0aGUKPiA+ID4gPj4gc2FtZSBraW5kIG9mIGFyZ3Vt
ZW50IGFzIGJldHdlZW4ga21hbGxvYyhzaXplb2Yoc3RydWN0IGZvbykpIHZzCj4gPiA+ID4+IGtt
YWxsb2Moc2l6ZW9mKGYpKS4KPiA+ID4gPgo+ID4gPiA+IE1heWJlLCBidXQgaXQgaW50cm9kdWNl
cyBhIG5ldyBzdHlsZSB3aGlsZSBhbGwgb3RoZXIgY2FzZXMgdXNlIHRoZSBvdGhlciwKPiA+ID4g
PiBfZXN0YWJsaXNoZWRfIHN0eWxlLiBTbyB3ZSBoYXZlIGEgcHJlY2VkZW50IGFuZCB0aGUgZm9y
bSB0aGUgY29kZSBpcyB3cml0dGVuCj4gPiA+ID4gaW4gaXMgYWdhaW5zdCB0aGUgZGUgZmFjdG8g
dXNhZ2Ugb2YgdGhlIGNvbXBvdW5kIGxpdGVyYWxzLgo+ID4gPiAKPiA+ID4gSXQgbWF5IG5vdCBi
ZSAqdmVyeSogY29tbW9uIGJ1dCBpdCdzIGhhcmRseSBuZXcgc3R5bGU6Cj4gPiAKPiA+IEkgdGhp
bmsgeW91ciBzdGF0ZW1lbnQgaXMgaW5jb3JyZWN0IHNlZSBiZWxvdyB3aHkuCj4gPiAKPiA+ID4g
JCBnaXQgZ3JlcCAtUCAiXCh0eXBlb2ZcKC4qXClcKSA/XHsiIHwgd2MKPiA+ID4gICAgIDEwOCAg
ICAgNTI5ICAgIDczMTUKPiA+IAo+ID4gTm90IGNvcnJlY3QuIFRoZSBjb3JyZWN0IG91dHB1dCB3
aWxsIGJlIGNsb3NlciB0bwo+ID4gCj4gPiAkIGdpdCBncmVwIC1sIC1QICJcKHR5cGVvZlwoLipc
KVwpID9ceyIgfCB3YyAtbAo+ID4gMTUKPiA+IAo+ID4gQW5kIGlmIHlvdSBsb29rZWQgYXQgdGhl
IG91dHB1dCBjYXJlZnVsbHksIHlvdSBzZWUgdGhlIGJ1ZyBpbiB0aGUgUkUgeW91IHVzZWQuCj4g
PiAKPiA+IFNvLCBldmVuIGNsb3NlciB3aWxsIGJlIHRoaXMgb25lOgo+ID4gCj4gPiAkIGdpdCBn
cmVwIC1sIC1QICI9W1s6c3BhY2U6XV0rXCh0eXBlb2ZcKC4qXClcKSA/XHsiIHwgd2MgLWwKPiA+
IDcKPiA+IAo+ID4gMiBvdXQgb2Ygd2hpY2ggYXJlIHJlbGF0ZWQgdG8gbGliZXRoLCBlZmZlY3Rp
dmVseSBtYWtlcyB0aGlzIDYuCgpBbmQgZm9yIG9mIGZ1bGxuZXNzIHRoZSBwaWN0dXJlOgokIGdp
dCBncmVwIC1sIC1QICI9W1s6c3BhY2U6XV0rXChzdHJ1Y3QgW15bOnNwYWNlOl1dKlwpID9ceyIg
fCB3YyAtbAo1MDEKClNvLCBpdCdzIDE6MTAwIHJhdGlvLgoKPiBUQkgsIEkgdGhpbmsgdGhvc2Ug
NiBhbGwgbWFkZSB0aGUgc2FtZSBtaXN0YWtlLCBpLmUuIHRoaW5raW5nIG9mIHRoZSBjb21wb3Vu
ZAo+IGxpdGVyYWwgYXMgYSBjYXN0LiBXaGljaCBpcyBub3QhCj4gCj4gPiBObywgdGhpcyBpcyBj
b21wbGV0ZWx5IG5vbi1zdGFuZGFyZCBhbmQgdW51c3VhbCB0aGluZyBpbiB0aGUga2VybmVsLgo+
ID4gCj4gPiA+ID4+IEkgZ3Vlc3MgaXQncyBwZXJzb25hbCB0YXN0ZSBidXQgSSBsaWtlIHRoaXMg
dmVyc2lvbiBiZXR0ZXIuCj4gPiA+ID4KPiA+ID4gPiBJbiBrZXJuZWwgd2UgYWxzbyB0cnkgdG8g
YmUgY29uc2lzdGVudC4gVGhpcyBhZGQgaW5jb25zaXN0ZW5jeS4gQW0gSSB3cm9uZz8KPiA+ID4g
Pgo+ID4gPiA+PiA+ID4gKyAgICAgICAgICAgICAuZGV2ID0gJnBkZXYtPmRldiwKPiA+ID4gPj4g
PiA+ICsgICAgICAgICAgICAgLnN6ID0gNCwKPiA+ID4gPj4gPiA+ICsgICAgICAgICAgICAgLmRh
dCA9IHNkLT5ncGlvX3B1Yl9iYXNlICsgR1BJTlIsCj4gPiA+ID4+ID4gPiArICAgICAgICAgICAg
IC5zZXQgPSBzZC0+Z3Bpb19wdWJfYmFzZSArIEdQT1VUUiwKPiA+ID4gPj4gPiA+ICsgICAgICAg
ICAgICAgLmRpcm91dCA9IHNkLT5ncGlvX3B1Yl9iYXNlICsgR1BPRVIsCj4gPiA+ID4+ID4gPiAr
ICAgICB9OwoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
