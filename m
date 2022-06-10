Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBE3C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 01:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mvzt0sVq/R4+xzoT/K6BI/6FMKIciBcSqv1KrNZFjyk=; b=ZCaA7jWuumZVT/
	Wx9xgZmeqaFf7vEXBNjwpCbHQMLFtWnfI02jiqBRK3urUsuqx412OIDuDn7c87MweiOFvlUy5XWPQ
	TX/cI1kdxl3lyETFKeh7+cg2SpKYbCTh9ylGhIr84DUg22Eq/qGOxxYWWL2Qd7rndJsJRcuhA8qvY
	quha7yFRrKBAZKc4t+BZ2pApAlt9NPndWyeczLAF1XniUpibHLgrzOUhOWycPipAFTW5EywYALHe+
	7aiKF4IEJKsmEzgSdiON9L/8YQZYAQehPbFphXVO/a2c+HZzs/bsMysgzCpTbrySU51wR3XEOAKZT
	qGecZDCeRasRES78Imkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzTCf-00515p-I2; Fri, 10 Jun 2022 01:12:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzTCc-00514r-Td
	for linux-riscv@lists.infradead.org; Fri, 10 Jun 2022 01:12:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6463DB82E04
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jun 2022 01:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A15C341C5
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jun 2022 01:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654823559;
	bh=il/LrihYHiXpEhIbBQUxhLmQw77pGHQu3lBlJgMP7t4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=h5XWo6HZF6YBmntwAftx+xHpRIGzBxcR+ybykaSvmbjVa5Qw+D3KDvdI3YvVyMAUp
	 lXt4IYHVpL5PP33m3DjAh4xklYQXOketnw11Zd4jM/B013UHMobMRRGpD3IQ5rdIvC
	 f/13zm7uKFdWIQ26Ql9V/Af4OOpxlhOH8eumkSCYVQCXdkTaInWLt+YphWjPwM4llL
	 71g0VUd/r+2DPDIp83YL1NGhl7kkaLqw0JEngsRei/6c5ienAm4BuuET5Dn+JPvFUO
	 SJweynlhxiSfuSZ5J/KTu2qL679VH2HkQ2INqJoxZrEyxoSbZAqLbl0ZdfCukWCW8s
	 Yx74H7MyZwVig==
Received: by mail-vs1-f44.google.com with SMTP id q14so24138489vsr.12
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jun 2022 18:12:39 -0700 (PDT)
X-Gm-Message-State: AOAM530YOLpRHkghKDZ2/NKzmpoZFczV3xfhUtR+ubvTw001a1myPEFS
	5TShrJQylbFo6+KnvTJJkla5PuHgfCLiNXQozj0=
X-Google-Smtp-Source: ABdhPJwHkuSsO830yc4vLKdSnrTtacPei6UOBwiX+MMBbBdgE7ksep8FxixzkTda/vPdKhLDQNUa1vuYTAHYjpipJX4=
X-Received: by 2002:a05:6102:5493:b0:34b:b583:f557 with SMTP id
 bk19-20020a056102549300b0034bb583f557mr12260032vsb.2.1654823558327; Thu, 09
 Jun 2022 18:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220608120849.1695191-1-heiko@sntech.de> <CAJF2gTT_xihu58V43bQ0X-WS0STCT5RNjiEHdwPBaoXmrnX2OA@mail.gmail.com>
 <7523610.lvqk35OSZv@diego>
In-Reply-To: <7523610.lvqk35OSZv@diego>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 10 Jun 2022 09:12:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTXT1UusfCDrccqd1X=16Z2Gg9+cvvhSjohF+D_ukVEiw@mail.gmail.com>
Message-ID: <CAJF2gTTXT1UusfCDrccqd1X=16Z2Gg9+cvvhSjohF+D_ukVEiw@mail.gmail.com>
Subject: Re: [PATCH] riscv: don't warn for sifive erratas in modules
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Wei Fu <wefu@redhat.com>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, 
	Christoph Hellwig <hch@lst.de>, Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_181243_284663_31C77DD1 
X-CRM114-Status: GOOD (  38.08  )
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

T24gVGh1LCBKdW4gOSwgMjAyMiBhdCA1OjU4IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRl
Y2guZGU+IHdyb3RlOgo+Cj4gSGkgR3VvLAo+Cj4gQW0gRG9ubmVyc3RhZywgOS4gSnVuaSAyMDIy
LCAwMzozOToyNCBDRVNUIHNjaHJpZWIgR3VvIFJlbjoKPiA+IE9uIFdlZCwgSnVuIDgsIDIwMjIg
YXQgODowOSBQTSBIZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90ZToKPiA+ID4K
PiA+ID4gVGhlIFNpRml2ZSBlcnJhdGEgY29kZSBjb250YWlucyBjb2RlIGNoZWNraW5nIGFwcGxp
Y2FibGUgZXJyYXRhcwo+ID4gPiB2cy4gYWN0dWFsbHkgYXBwbGllZCBlcnJhdGFzIHRvIHN1Z2dl
c3QgbWlzc2luZyBlcnJhdGFzIHRvIHRoZQo+ID4gPiB1c2VyIHdoZW4gdGhlaXIgS2NvbmZpZyBv
cHRpb25zIGFyZSBub3QgZW5hYmxlZC4KPiA+ID4KPiA+ID4gSW4gdGhlIG1haW4ga2VybmVsIGlt
YWdlIG9uZSBjYW4gYmUgcXVpdGUgc3VyZSB0aGF0IGFsbCBhdmFpbGFibGUKPiA+ID4gZXJyYXRh
cyBhcHBlYXIgYXQgbGVhc3Qgb25jZSwgc28gdGhhdCBjaGVjayB3aWxsIHN1Y2NlZWQuCj4gPiA+
IE9uIHRoZSBvdGhlciBoYW5kIG1vZHVsZXMgY2FuIHZlcnkgd2VsbCBub3QgdXNlIGFueSBlcnJh
dGEtcmVsZXZhbnQKPiA+ID4gY29kZSwgc28gdGhlIG5ld2x5IGFkZGVkIG1vZHVsZS1hbHRlcm5h
dGl2ZSBzdXBwb3J0IG1heSBhbHNvIHBhdGNoCj4gPiA+IHRoZSBtb2R1bGUgY29kZSwgYnV0IG5v
dCB0b3VjaCBTaUZpdmUtc3BlY2lmaWMgZXJyYXRhcyBhdCBhbGwuCj4gPiA+Cj4gPiA+IFNvIHRv
IHJlc3RvcmUgdGhlIG9yaWdpbmFsIGJlaGF2aW91ciBkb24ndCB3YXJuIHdoZW4gcGF0Y2hpbmcK
PiA+ID4gbW9kdWxlcy4gVGhpcyB3aWxsIGtlZXAgdGhlIHdhcm5pbmcgaWYgbmVjZXNzYXJ5IGZv
ciB0aGUgbWFpbiBrZXJuZWwKPiA+ID4gaW1hZ2UgYnV0IHByZXZlbnQgc3B1cmlvdXMgd2Fybmlu
Z3MgZm9yIG1vZHVsZXMuCj4gPiA+Cj4gPiA+IE9mIGNvdXJzZSBoYXZpbmcgc3VjaCBhIHZlbmRv
ci1zcGVjaWZpYyB3YXJuaW5nIG1heSBub3QgYmUgbmVlZGVkIGF0Cj4gPiA+IGFsbCwgYXMgQ09O
RklHX0VSUkFUQV9TSUZJVkUgaXMgc2VsZWN0ZWQgYnkgQ09ORklHX1NPQ19TSUZJVkUgYW5kIHRo
ZQo+ID4gPiBpbmRpdmlkdWFsIGVycmF0YXMgYXJlIGRlZmF1bHQteSBzbyBkaXNhYmxpbmcgdGhl
bSByZXF1aXJlcwo+ID4gPiBkZWxpYmVyYXRlIGFjdGlvbiBhbnl3YXkuIEJ1dCBmb3Igbm93IGp1
c3QgcmVzdG9yZSB0aGUgb2xkIGJlaGF2aW91ci4KPiA+ID4KPiA+ID4gRml4ZXM6IGE4ZTkxMDE2
OGJiYSAoInJpc2N2OiBpbXBsZW1lbnQgbW9kdWxlIGFsdGVybmF0aXZlcyIpCj4gPiA+IFJlcG9y
dGVkLWJ5OiBSb24gRWNvbm9tb3MgPHJlQHc2cnoubmV0Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBI
ZWlrbyBTdHVlYm5lciA8aGVpa29Ac250ZWNoLmRlPgo+ID4gPiAtLS0KPiA+ID4gIGFyY2gvcmlz
Y3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYyB8IDMgKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMgYi9hcmNoL3Jpc2N2L2VycmF0YS9zaWZp
dmUvZXJyYXRhLmMKPiA+ID4gaW5kZXggNjcyZjAyYjIxY2UwLi4xMDMxMDM4NDIzZTcgMTAwNjQ0
Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYwo+ID4gPiArKysg
Yi9hcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMKPiA+ID4gQEAgLTExMSw2ICsxMTEs
NyBAQCB2b2lkIF9faW5pdF9vcl9tb2R1bGUgc2lmaXZlX2VycmF0YV9wYXRjaF9mdW5jKHN0cnVj
dCBhbHRfZW50cnkgKmJlZ2luLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjcHVfYXBw
bHlfZXJyYXRhIHw9IHRtcDsKPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICB9
Cj4gPiA+IC0gICAgICAgaWYgKGNwdV9hcHBseV9lcnJhdGEgIT0gY3B1X3JlcV9lcnJhdGEpCj4g
PiA+ICsgICAgICAgaWYgKHN0YWdlICE9IFJJU0NWX0FMVEVSTkFUSVZFU19NT0RVTEUgJiYKPiA+
ID4gKyAgICAgICAgICAgY3B1X2FwcGx5X2VycmF0YSAhPSBjcHVfcmVxX2VycmF0YSkKPiA+IGlm
IChjcHVfYXBwbHlfZXJyYXRhICY9IH5jcHVfcmVxX2VycmF0YSkKPgo+IEhtbSwgSSBkb24ndCBz
ZWUgd2hhdCB0aGF0IGNoYW5nZXM/CisgICAgICAgaWYgKHN0YWdlICE9IFJJU0NWX0FMVEVSTkFU
SVZFU19NT0RVTEUgJiYKKyAgICAgICAgICAgY3B1X2FwcGx5X2VycmF0YSAhPSBjcHVfcmVxX2Vy
cmF0YSkKICAgICAgICAgICAgICAgIHdhcm5fbWlzc19lcnJhdGEoY3B1X3JlcV9lcnJhdGEgLSBj
cHVfYXBwbHlfZXJyYXRhKTsKKyAgICAgICBlbHNlIGlmIChjcHVfYXBwbHlfZXJyYXRhICY9IH5j
cHVfcmVxX2VycmF0YSkKICAgICAgICAgICAgICAgIHdhcm5fbWlzc19lcnJhdGEoY3B1X3JlcV9l
cnJhdGEgLSBjcHVfYXBwbHlfZXJyYXRhKTsKCkFsbCBtb2R1bGUncyBlcnJhdGEgc2hvdWxkIGJl
IGEgc3Vic2V0IG9mIHRoZSBtYWluIGtlcm5lbC4gTm90IGp1c3QKc2tpcCB0aGUgY2hlY2sgb2Yg
TU9EVUxFLgoKPgo+Cj4gPiBTaGFsbCB3ZSBzdGlsbCBndWFyYW50ZWUgdGhlIG1vZHVsZSdzIG11
c3QgYmUgYSBzdWJzZXQgb2YgdGhlIG1haW4ga2VybmVsLidzPwo+Cj4gVGhlIHdhcm5pbmcgZ2Vu
ZXJhdGVkIHRoZXJlIGlzIG1haW5seSB0byB3YXJuIGFib3V0IHNvbWUgS2NvbmZpZyBvcHRpb25z
Cj4gbm90IGJlaW5nIGVuYWJsZWQgYW5kIGluIGluZGl2aWR1YWwgbW9kdWxlcyBldmVuIG5vIGVy
cmF0YSB1c2FnZSBtYXkgYmUKPiByZXF1aXJlZC4KPgo+Cj4gVGhlIGludGVudCBmb3IgdGhlIHBh
dGNoIGlzIHRvIHJlc3RvcmUgaG93IHRoaW5ncyBiZWhhdmVkIGJlZm9yZQo+IG1vZHVsZS1hbHRl
cm5hdGl2ZXMgd2VyZSBpbnRyb2R1Y2VkLCBzbyBJIGRvbid0IHJlYWxseSB3YW50IHRvCj4gaW50
cm9kdWNlIGZ1bmN0aW9uYWwgY2hhbmdlcyA7LSkgLgo+Cj4gQnV0IGFsc28gaW4gdGhlIGZ1dHVy
ZSB3ZSBjb3VsZCBkZWJhdGUgaWYgdGhhdCB3YXJuaW5nIGlzIGhlbHBmdWwgYXQgYWxsLAo+IGFz
IHRoZSBlcnJhdGFzIGFyZSBlbmFibGVkIGF1dG9tYXRpY2FsbHkgYnkgQ09ORklHX1NPQ19TSUZJ
VkUgYW5kCj4gdGh1cyBkaXNhYmxpbmcgaW5kaXZpZHVhbCBlcnJhdGFzIHJlcXVpcmVzIHNvbWVv
bmUgdG8gdHVybiB0aGVtIG9mZgo+IG1hbnVhbGx5IGluIHRoZWlyIC5jb25maWcgLgo+Cj4KPiBI
ZWlrbwo+Cj4gPiA+ICAgICAgICAgICAgICAgICB3YXJuX21pc3NfZXJyYXRhKGNwdV9yZXFfZXJy
YXRhIC0gY3B1X2FwcGx5X2VycmF0YSk7Cj4gPiA+ICB9Cj4gPiA+IC0tCj4gPiA+IDIuMzUuMQo+
ID4gPgo+ID4KPiA+Cj4gPgo+Cj4KPgo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKTUw6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNza3kvCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
