Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB2AC77B75
	for <linux-riscv@archiver.kernel.org>; Wed,  3 May 2023 05:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsA/gA8dWbgdvuDSrNBXUEvjNUoanNg/4nHgEOxZAUE=; b=qmW+aWpDzGuT64
	zYEOsPOELZMzC2xkVvgt5lOK4r68Iul8c2dC61waJ9G1XI0aGPwYnJGivTFooqOK1HGYRASUD2P18
	xE3aSsc2j7QxABZUafJ5NTRYHt9GNPYnQlyKtamTjm11J31v4DcYrW62JM6nCw57Vod/fiHvXwB8N
	lfF2hCncPitsTpmWjNSZ0HNn3QhV+bf18bjJ0dqI2jd563jPC40/MzEsRsIVBepfJBaHvvTVaUpMV
	n/RF15JCmU4c+6sdBiveQabl06fo7LcEEFAWdHEH7GGg0YsLPfxuC7PqNBAPjjWzOnA74E4TyeWtl
	krokSP25W5Uhz84Dtycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu5Sb-003QXW-24;
	Wed, 03 May 2023 05:55:29 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu5SY-003QWt-02
	for linux-riscv@lists.infradead.org;
	Wed, 03 May 2023 05:55:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1683093311; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dXf/z6T3UZCv+texqamhmD8WP+ySIcT8+mX4YjiIwp3ksH9l0AwHJk8exPIQpHv7jxwD8ih2IvKeQdgbN7/aIMh6cSLiq9yFMvach4NLaSsApwH4pZ79Q2dE0+er7wR8oM0z2HkDB9VxsElDfNJtDa9rl+ZUjobX2pOtsJ0Diww=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1683093311; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=+NVmQ6ZP5n0PV0Ca3kCz5g0tcHZhKEg4OMuMhJVciXo=; 
	b=d8GGDXSgdeCo9x8iwJmIJfyukfwY7iqH0LnTqzC16YA1CoGVSlhBklln2AdM9KEc5ca/Yi3ptNEPwzy284mhy9oszNQCm6Ji0VSfNDknSlc+YrZsB9L2raREkFA1oRcVNWilra5ZsrcHoTGzJnQFVLAZZlLfvFzrbk1dBs3TA7g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1683093311;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=+NVmQ6ZP5n0PV0Ca3kCz5g0tcHZhKEg4OMuMhJVciXo=;
	b=aPZBAYz49O8UFO+n13fU7Y1tnR+1aqUzikkCGb3bNVs3K5wJ+dIO9xKWfXrZEmEi
	VADEEVxnyWF1cOA9wcYwh9LNwCHEw/uPJ+GGyy748NgKPPGDdg9nSFE6r4i3JzM1Dpc
	nNT4E/mgjrp1NSLxil87xo/nL/5qM0Wzlt85Wi4Q=
Received: from edelgard.fodlan.icenowy.me (120.85.97.113 [120.85.97.113]) by mx.zohomail.com
	with SMTPS id 1683093310083649.8294996152783; Tue, 2 May 2023 22:55:10 -0700 (PDT)
Message-ID: <8bb0baa57a92a778a83618e1f4de8f28f4a15ee0.camel@icenowy.me>
Subject: Re: Atish is looking at the excessive bouncing
From: Icenowy Zheng <uwu@icenowy.me>
To: Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt
 <palmer@rivosinc.com>,  "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>
Cc: linux-riscv@lists.infradead.org
Date: Wed, 03 May 2023 13:55:00 +0800
In-Reply-To: <CAOnJCULybsPrygGe6easQUgFTXOSUFQ+nOPEYp57F-vkvhuHLQ@mail.gmail.com>
References: <mhng-f3c5429e-4361-4068-b88c-fb528681881a@palmer-ri-x1c9a>
	 <CAOnJCULybsPrygGe6easQUgFTXOSUFQ+nOPEYp57F-vkvhuHLQ@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_225526_110675_246B417F 
X-CRM114-Status: GOOD (  23.66  )
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

5ZyoIDIwMjMtMDUtMDPmmJ/mnJ/kuInnmoQgMDA6MDAgKzA1MzDvvIxBdGlzaCBQYXRyYeWGmemB
k++8mgo+IE9uIFR1ZSwgTWF5IDIsIDIwMjMgYXQgMTE6MTfigK9BTSBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiB3cm90ZToKPiA+IAo+ID4gV2UncmUgbm90IHN1cmUgd2hh
dCBoYXBwZW5lZCwgYnV0IGl0IGxvb2tzIGxpa2UgYSBsb3Qgb2YgcGVvcGxlIGFyZQo+ID4gZ2V0
dGluZyBkcm9wcGVkIGZyb20gdGhlIGxpc3QgZHVlIHRvIGV4Y2Vzc2l2ZSBib3VuY2VzLsKgIFNl
ZW1zIHRvCj4gPiBoYXZlCj4gPiBzdGFydGVkIHJlY2VudGx5LCBwb3NzaWJseSB0b2RheSBvciBv
dmVyIHRoZSB3ZWVrZW5kLsKgIFdlJ3ZlIGFsd2F5cwo+ID4gaGFkCj4gPiBzb21lIGlzc3VlcyB3
aXRoIHRoZSBib3VuY2VzLCBidXQgdGhleSdyZSBhIGxvdCB3b3JzZS4KPiA+IAo+IAo+IEFsbCB0
aGUgYm91bmNlcyBhcmUgcmVsYXRlZCB0byB0aGUgZ21haWwgc2VydmVyIHdoaWNoIHRyZWF0cyBn
ZW51aW5lCj4gcGF0Y2hlcyBhcyBib3VuY2UgbWVzc2FnZXMuCj4gbWFpbG1hbiBzZXJ2ZXIgZGlz
YWJsZXMgdGhlIG1lbWJlcnNoaXAgaWYgaXQgZ2V0cyB0b28gbWFueSBib3VuY2UKPiBiYWNrcyBm
cm9tIHRoZSByZWNpcGllbnQuCj4gSXQgc2VlbXMgdGhlIG1haWxtYW4gc2VydmVyIGNhbid0IGRv
IG11Y2ggYWJvdXQgaXQgdW50aWwgdGhlIGlzc3VlIGlzCj4gZml4ZWQgaW4gdGhlIGdtYWlsIHNl
cnZlci4KPiBXZSBoYXZlIGluY3JlYXNlZCB0aGUgYm91bmNlIHRocmVzaG9sZCBzaWduaWZpY2Fu
dGx5IGluIG9yZGVyIHRvCj4gYXZvaWQKPiBkaXNhYmxpbmcgc3Vic2NyaXB0aW9ucy4KPiBJZiB5
b3Ugc3RpbGwgZ2V0IG9uZSwgcGxlYXNlIHJlZW5hYmxlIGl0IG1hbnVhbGx5LiBZb3Ugc2hvdWxk
IHJlY2VpdmUKPiBvbmUgcmVtaW5kZXIgZW1haWwgZm9yIHRoYXQgYXMgd2VsbC4KPiBUaGVyZSBp
cyBubyBvdGhlciBzb2x1dGlvbiBhdCB0aGlzIHRpbWUuIFNvcnJ5IGZvciB0aGUgaW5jb252ZW5p
ZW5jZS4KCldlbGwsIGJ5IHRoZSB3YXksIG15IG1haWwgc2VydmVyIChab2hvKSwgaXMgYWxzbyBh
bHdheXMgcmVjZWl2aW5nCmJvdW5jZSByZW1pbmRlci4KCkkgZG9uJ3Qga25vdyBob3cgdGhpcyBo
YXBwZW5zIHlldC4KCj4gCj4gSSBoYXZlIGluY2x1ZGVkIHRoZSBicm9hZGVyIGtlcm5lbCBtYWls
aW5nIGxpc3QgaW4gdGhlIGhvcGUgdG8gc2VlIGlmCj4gYW55Ym9keSBlbHNlIGlzIGFsc28gZmFj
aW5nIHNpbWlsYXIgcHJvYmxlbXMuCj4gSXQgd291bGQgYmUgZ3JlYXQgaWYgYW55Ym9keSB3b3Jr
aW5nIGZvciB0aGUgR29vZ2xlL2dtYWlsIHRlYW0gY2FuCj4gcmFpc2UgdGhpcyBpc3N1ZSBpbnRl
cm5hbGx5Lgo+IAo+ID4gU29ycnkgZm9yIHRoZSBoZWFkYWNoZXMuCj4gPiAKPiA+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPiA+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiAKPiAK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
