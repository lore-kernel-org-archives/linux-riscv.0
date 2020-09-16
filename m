Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0716AC43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 04:59:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C34A20936
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 04:59:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="quTrZo4H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="CP38OmPJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C34A20936
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NZL+sd/HSk0Riqg7amiOxAHdwt1dMvfTCbVlboXrlMI=; b=quTrZo4HijMzHVUhFQKUVmxTP
	E8Frakxdz+cRmv7RCknTogj7kkxEWFUvw922RunGkm9qIR94FfEqfZEIySpOUv7KDV4P/WQNAcSXR
	6NW0pFKijIClOUvi9eRwW7pWyfzeF7u5T7t8jZIrOf2qoBPGn9OdvUJU7VltnMcE26puLvMYy3Po8
	m7qCrfLxErN6DVHAcVdymNLs5ovWKakcr0zPt3oPGCpTyB86+awus25pcgzNbOM/3L9+goRev3cIR
	f+ywfRE4KuTfRTPmv1TmnlJ8fRtK3owmdR0SbAFb2Xsc48plE3YFogh6SwlbelADSNQ3bksbHIfPc
	G8BmUxqSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIPXW-0007z3-SP; Wed, 16 Sep 2020 04:59:30 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIPXU-0007yU-Ky
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 04:59:29 +0000
Received: by mail-wm1-x342.google.com with SMTP id x23so1429597wmi.3
 for <linux-riscv@lists.infradead.org>; Tue, 15 Sep 2020 21:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rCTuhyZQOUG1QUoZGvCM2ORI/jmuwqWCZicbq3DWhhA=;
 b=CP38OmPJy4NLsBbgQvFeP7CL6J1ebskg20FlasF5X/WDg++ZFzxrF94fZL9BCAW4Ix
 rMaao5R/1PtNEhYuUk3EAm8UTlgQ3E5Eoetbs2XqxLbFlfZ3lNG3e4FsY7Bt1lv5roCw
 SlaOiCYabeQKWUNQeIIUt570KfWmccLtgC498=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rCTuhyZQOUG1QUoZGvCM2ORI/jmuwqWCZicbq3DWhhA=;
 b=elWo0PVSprHOQVjHm4r0h7pinQaeyyg7RPfSFfM4sgrh4kdnaJvjOxz9+FUuxqTHK9
 dQLdv+PU28JaDlPzSzCwP9yfPdN4Zh7RVR3XUHLGlhrA6HzaZnCGHb4DjKLSphCwNe/N
 ZUUtytT/grssTNQgjWxNUcFYCxw9DqabPJt03/5mRguxR8SLQ9eJjblYnxslCTaIUpKJ
 /6ubrQuKND5ju6NKFHQ1yeZdmabZJ+ZuPYiqztpagog433tLBJq5CjanFnSqLGvMa+Qo
 2BpoGzIgD8Z2DKHhULuvkDgMgvD6scaHbS0kvV4dtrleun0sueylAA5aXQZwCXLMsLdu
 N1nw==
X-Gm-Message-State: AOAM533fPcvW/9CQ72/UYuXuOFcb2ikFF32Bfwj5nILJouehclNs5Oen
 Y+kBYCI8mvjtSXS+eU5AoHrDxhRoO9EYgkkJ9yd0ODgmMBHj
X-Google-Smtp-Source: ABdhPJxSHpK+pvszjJErsLvbX24k1ZOF1jpjwqsuq+xDkucs8PzAfObnjYLDsoIWip/iaP/VhTTci6XtyaaLioog1tc=
X-Received: by 2002:a1c:a988:: with SMTP id s130mr614595wme.31.1600232367435; 
 Tue, 15 Sep 2020 21:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <CY4PR04MB375179E27AE26DBD3ED0FF76E7210@CY4PR04MB3751.namprd04.prod.outlook.com>
 <mhng-bb93a26a-2217-4540-83f7-99b896516413@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-bb93a26a-2217-4540-83f7-99b896516413@palmerdabbelt-glaptop1>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Sep 2020 21:59:16 -0700
Message-ID: <CAOnJCU+=nU73qOO11H3QoxmzfwjsWOfOiMv-5C0LFiqsOjoz2w@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix compilation warning
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_005928_706165_C0C2DEB1 
X-CRM114-Status: GOOD (  32.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgNzowMiBQTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPiB3cm90ZToKPgo+ID5PbiBUdWUsIDE1IFNlcCAyMDIwIDE4OjI5OjUyIFBEVCAo
LTA3MDApLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiA+PiBPbiAyMDIwLzA5LzE2IDQ6NDQsIEF0
aXNoIFBhdHJhIHdyb3RlOgo+ID4+IE9uIFR1ZSwgU2VwIDE1LCAyMDIwIGF0IDI6MTYgQU0gRGFt
aWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4gd3JvdGU6Cj4gPj4+Cj4gPj4+IE1v
dmUgdGhlIGRlY2xhcmF0aW9uIG9mIHB0X29wcyB1bmRlciAiI2lmZGVmIGlDT05GSUdfTU1VIiB0
byBhdm9pZCB0aGUKPiA+Pj4gY29tcGlsYXRpb24gd2FybmluZzoKPiA+Pj4KPiA+Pj4gYXJjaC9y
aXNjdi9tbS9pbml0LmM6NDQ6Mjg6IHdhcm5pbmc6IOKAmHB0X29wc+KAmSBkZWZpbmVkIGJ1dCBu
b3QgdXNlZAo+ID4+PiBbLVd1bnVzZWQtdmFyaWFibGVdCj4gPj4+ICAgIDQ0IHwgc3RhdGljIHN0
cnVjdCBwdF9hbGxvY19vcHMgcHRfb3BzOwo+ID4+PiAgICAgICB8ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fgo+ID4+Pgo+ID4+PiB3aXRoIE5PIE1NVSBidWlsZHMgKGUuZy4gbm9t
bXVfazIxMF9kZWZjb25maWcpLgo+ID4+Pgo+ID4+Cj4gPj4gVGhhbmtzIGZvciB0aGUgZml4LiBw
dF9vcHMgd2FzIGFkZGVkIGFzIGEgcGFydCBvZiBFRkkgc2VyaWVzLgo+ID4+IEkgYW0gcGxhbm5p
bmcgdG8gc2VuZCB2OCB0byBpbmNsdWRlIHNvbWUgbW9yZSBnZW5lcmljIEVGSSBjaGFuZ2VzLgo+
ID4+Cj4gPj4gRG8geW91IG1pbmQgaWYgSSBqdXN0IGluY2x1ZGUgdGhpcyBmaXggaW4gbXkgc2Vy
aWVzID8KPiA+Cj4gPiBQbGVhc2UgZmVlbCBmcmVlIHRvIGludGVncmF0ZS9zcXVhc2ggdGhpcyBj
aGFuZ2UgaW4geW91ciBzZXJpZXMuIE5vIG5lZWQgZm9yIGEKPiA+IHNlcGFyYXRlIHBhdGNoIGZv
ciBqdXN0IHRoYXQuIEJ1dDogSWYgeW91ciBFRkkgc2VyaWVzIGlzIG5vdCBmaW5hbCwgd2hhdCBp
cyBpdAo+ID4gZG9pbmcgb24gdGhlIGZvci1uZXh0IGJyYW5jaCA/Pz8KPiA+Cj4gPiBQYWxtZXIs
Cj4gPgo+ID4gV2hhdCBpcyBnb2luZyBvbiBoZXJlID8gSWYgQXRpc2ggVjcgc2VyaWVzIGhhcyBw
cm9ibGVtcyBhbmQgaXMgbm90IGZpbmFsLCB3aHkgaXMKPiA+IGl0IGFscmVhZHkgaW4gZm9yLW5l
eHQgPwo+Cj4gSSdtIGJlaGluZCBvbiB0aGlzIHRocmVhZCwgSSBqdXN0IHNhdyB0aGlzIGFzIEkg
d2FzIHNpdHRpbmcgZG93biB0byBkbwo+IHNvbWV0aGluZyBlbHNlLgo+Cj4gSXQgd2FzIHN1cHBv
c2VkIHRvIGJlIHJlYWR5IHRvIGdvLCBidXQgaXQgaGFkIHRvIGJlIHJvbGxlZCBiYWNrLiAgQXMg
ZmFyIGFzIEkKPiB1bmRlcnN0YW5kIGl0IG15IGZvci1uZXh0IGRvZXNuJ3QgYWN0dWFsbHkgaGF2
ZSBicm9rZW4gc3R1ZmYgb24gaXQsIHRoZSBpc3N1ZQo+IGlzIG1vcmUgdGhhdCBzb21lIG90aGVy
IEVGSSB0cmVlIGNoYW5nZXMgbGFuZGVkIHRoYXQgd291bGQgbWFrZSBtZXJnaW5nIHRoZQo+IHRy
ZWVzIG1vcmUgZGlmZmljdWx0LiAgSUlSQyBBcmQgd2FzIGdvaW5nIHRvIGFuIEVGSSB0cmVlIHRh
ZyBmb3IgbWUgdG8gbWVyZ2UsCj4gYW5kIEkgd2FzIHdhaXRpbmcgdW50aWwgdGhhdCB0byBzaG93
IHVwIGZvciB0aGUgcmViYXNlIHNvIHdlIGRpZG4ndCBqdWdnbGUKPiB0aGluZ3MgdG9vIG11Y2gu
ICBJIGd1ZXNzIEknZCBhc3N1bWVkIHRoYXQgdGhlIGFjdHVhbCBwYXRjaGVzIHdlcmVuJ3QgY2hh
bmdpbmcKPiB0aGF0IG11Y2ggaW4gdGhlIHByb2Nlc3MsIGJ1dCBpZiBBdGlzaCBpcyBnb2luZyB0
byBiZSBzZW5kaW5nIGFub3RoZXIgdmVyc2lvbgo+IHdpdGggbWVhbmluZ2Z1bCBjaGFuZ2VzIHRo
ZW4gSSBzdXBwb3NlIGl0J3MgYmVzdCB0byBkcm9wIHRoZSBFRkkgc3R1ZmYgZm9yIG5vdy4KPgoK
VGhlIGFjdHVhbCBjaGFuZ2VzIGFyZSBub3QgYmlnIGJ1dCBpdCBoYXMgdG8gYmUgcmViYXNlZCBv
biB0b3Agb2YKQXJkJ3MgdHJlZSBhbmQgYSBmZXcgc21hbGwgaW1wcm92ZW1lbnRzCmZvciBSVjMy
ICsgdGhpcyBwYXRjaC4KCkkgd2lsbCBzZW5kIHRoZSBzZXJpZXMgdG9tb3Jyb3cuCj4gSSBqdXN0
IHJlYmFzZWQgZm9yLW5leHQsIGRyb3BwaW5nIHRoZSBFRkkgcGF0Y2hlcy4KPgoKVGhhbmtzLiBB
cG9sb2dpZXMgZm9yIHRoZSBjb25mdXNpb24uCgpSZWdhcmRzLApBdGlzaAo+ID4+PiBTaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPgo+ID4+PiAtLS0K
PiA+Pj4gIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgNCArKy0tCj4gPj4+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4+PiBpbmRl
eCAzMmU3MjU4ZGE5YmIuLmM4ODhjNDQ3MGIzNCAxMDA2NDQKPiA+Pj4gLS0tIGEvYXJjaC9yaXNj
di9tbS9pbml0LmMKPiA+Pj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiA+Pj4gQEAgLTQx
LDggKzQxLDYgQEAgc3RydWN0IHB0X2FsbG9jX29wcyB7Cj4gPj4+ICAjZW5kaWYKPiA+Pj4gIH07
Cj4gPj4+Cj4gPj4+IC1zdGF0aWMgc3RydWN0IHB0X2FsbG9jX29wcyBwdF9vcHM7Cj4gPj4+IC0K
PiA+Pj4gIHN0YXRpYyB2b2lkIF9faW5pdCB6b25lX3NpemVzX2luaXQodm9pZCkKPiA+Pj4gIHsK
PiA+Pj4gICAgICAgICB1bnNpZ25lZCBsb25nIG1heF96b25lX3BmbnNbTUFYX05SX1pPTkVTXSA9
IHsgMCwgfTsKPiA+Pj4gQEAgLTIxNCw2ICsyMTIsOCBAQCB2b2lkIF9faW5pdCBzZXR1cF9ib290
bWVtKHZvaWQpCj4gPj4+ICB9Cj4gPj4+Cj4gPj4+ICAjaWZkZWYgQ09ORklHX01NVQo+ID4+PiAr
c3RhdGljIHN0cnVjdCBwdF9hbGxvY19vcHMgcHRfb3BzOwo+ID4+PiArCj4gPj4+ICB1bnNpZ25l
ZCBsb25nIHZhX3BhX29mZnNldDsKPiA+Pj4gIEVYUE9SVF9TWU1CT0wodmFfcGFfb2Zmc2V0KTsK
PiA+Pj4gIHVuc2lnbmVkIGxvbmcgcGZuX2Jhc2U7Cj4gPj4+IC0tCj4gPj4+IDIuMjYuMgo+ID4+
Pgo+ID4+Pgo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiA+Pj4gbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+ID4+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gPj4KPiA+Pgo+ID4+Cj4gPgo+ID4KPiA+LS0KPiA+RGFt
aWVuIExlIE1vYWwKPiA+V2VzdGVybiBEaWdpdGFsIFJlc2VhcmNoCj4gPgoKCgotLSAKUmVnYXJk
cywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
