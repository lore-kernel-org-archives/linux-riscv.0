Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD45E87852
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 18:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ep6R7bd9SXYu4mUBQYsQhWTXpkUC8sWcLg1nT5WgPrs=; b=y1i+erqXnijlbW
	/uv3HvDMsSrRl/ICShMF/DhBYpyI+5N8xyOK6m3OM7b5I51IGIcVcm1XxXKFCz6Tj82ZWh7z+Zv6r
	QnOxDaKrJJjT4slhHFzA7UnQb56aAE0vMhfWhyN/+8an89seivU37cgPpgsQL0AwDvZE/RhsxzB24
	F2SHN/2EWcBLBQubFgwmxrAW7UHWnYSDgd6lkg4wmsR+vXkXBClJXaKZTavuHf2Aq3C74rOevewJc
	6K5TWwaWshxTqLSa2MYRSaOFSoYT/khz6yqnlZgfOdXsUXPmIDwH5P68+vSzCTOiMcjq2Uka7VqMv
	SN8aIISItkc/kIXHy6Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL8W-000000079IO-1VlF;
	Tue, 03 Feb 2026 18:28:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL8V-000000079Hw-3G2H
	for linux-riscv@bombadil.infradead.org;
	Tue, 03 Feb 2026 18:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2xQ/nLc2QG0I/BVgSbnnnyu4Cm8f1qHrCZiZgirqfAo=; b=Mty4JSvxeyYKH0T0Dz7k7XtomH
	C8Yc8rr6yN9nX1sMhzaBxKJtNI/pOg+4NdRDI/T9Lgf2naT6d3Wz1GXStDnpSg5RmJtPPnA7WGoCh
	oHgruCWjrsgjE1759Js6ig9K1pkNwVYMWjmgaIu7HVlraEkA9NhTL1P76caG6KSH1aL6AssVjObJk
	zicoPs5G/+sNuNrkhwW1yKrrsxzIobRDAx9CfeRMXdci3hGa5nAAkF7Pb4niehB7pwnaf5HGpeTIq
	9U3gdvAcTRl7LKYJA++OKHxm/IVSmGJXOW9jhCvs8SSP4t9GnwwfitW765j26hzHelrpM043y8xer
	ElrbCeHw==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL8S-0000000GqXG-2RYK
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 18:28:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76E8B408EA;
	Tue,  3 Feb 2026 18:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86390C116D0;
	Tue,  3 Feb 2026 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770143302;
	bh=IpK3bdfagj+tzAgiMbLE1YNpk2IdlComlUbdTFWpyTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oCRmjjKLdK7dbIBoYO5zDPWZdHVkealFfIMxQNBhE8BM6WZl4ZS8y9Eh2CiEuHo6v
	 msA5CmmeF02GgRI35c/WCVYR8leY5AdPi7oK5qOgFYS4y7lmTByLgOYxlIFu5MUrnT
	 dwt7kk6vg6tDmdnxJB1Qm+JR1epcEbwnKhQrsFdahXiSeWz++j+Kv1YlCHkp16pCea
	 sq5z54Nr3QjmcqG5jMfROsQFvXYezKQE2MbfXoQcsQ5TPA/3jJhKMpMaBXAGrW7XpP
	 p8kxoJTLu4Vi1MGxo3BKtOrx73g8AkoRXWU4Z94YF83SNL04XmgxLOVDY6iakMPdsa
	 0Zwo1+U4h0pAA==
From: Thomas Gleixner <tglx@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Yingjun Ni <yingjun.ni@riscv-computing.com>, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/riscv-imsic: Fix irq migration failure issue
 when cpu hotplug.
In-Reply-To: <CAAhSdy31dF1qHtaM1mqx+dG6ryb_3M+M63e8ujaCZBWDGUYeNg@mail.gmail.com>
References: <20260203080256.9401-2-yingjun.ni@riscv-computing.com>
 <87ecn23q6e.ffs@tglx>
 <CAAhSdy31dF1qHtaM1mqx+dG6ryb_3M+M63e8ujaCZBWDGUYeNg@mail.gmail.com>
Date: Tue, 03 Feb 2026 19:28:18 +0100
Message-ID: <87ldh93cn1.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_182825_134957_636E9C17 
X-CRM114-Status: GOOD (  16.55  )
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

T24gVHVlLCBGZWIgMDMgMjAyNiBhdCAyMjozOSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUs
IEZlYiAzLCAyMDI2IGF0IDc6MDXigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAa2VybmVsLm9y
Zz4gd3JvdGU6Cj4+ID4gIHN0YXRpYyB2b2lkIGltc2ljX21zaV91cGRhdGVfbXNnKHN0cnVjdCBp
cnFfZGF0YSAqZCwgc3RydWN0IGltc2ljX3ZlY3RvciAqdmVjKQo+PiA+ICB7Cj4+ID4gICAgICAg
c3RydWN0IG1zaV9tc2cgbXNnID0geyB9Owo+PiA+ICsgICAgIHN0cnVjdCBpcnFfY2hpcCAqaXJx
X2NoaXAgPSBpcnFfZGF0YV9nZXRfaXJxX2NoaXAoZCk7Cj4+ID4gKwo+PiA+ICsgICAgIGlmICgh
aXJxX2NoaXAtPmlycV93cml0ZV9tc2lfbXNnKQo+PiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+
Pgo+PiBJIGhhdmUgbm8gaWRlYSBob3cgdGhpcyBldmVyIHdvcmtlZC4gVGhlIGlycV9kYXRhIHBv
aW50ZXIgYmVsb25ncyB0byB0aGUKPj4gSU1TSUMgYmFzZSBkb21haW4sIHdoaWNoIGRlZmluaXRl
bHkgZG9lcyBub3QgaGF2ZSBhIGlycV93cml0ZV9tc2lfbXNnKCkKPj4gY2FsbGJhY2sgYW5kIG5l
dmVyIGNhbiBoYXZlIG9uZS4KPgo+IFRoZSBpbXNpY19pcnFfc2V0X2FmZmluaXR5KCkgcGFzc2Vz
IGlycV9nZXRfaXJxX2RhdGEoZC0+aXJxKSBhcwo+IGlycV9kYXRhIHBvaW50ZXIgdG8gaW1zaWNf
bXNpX3VwZGF0ZV9tc2coKSBleHBlY3RpbmcgaXQgdG8gYmUKPiB0aGUgdG9wLWxldmVsIGlycV9k
YXRhLiBUaGUgaW1zaWNfbXNpX3VwZGF0ZV9tc2coKSBhc3N1bWVzCj4gdGhhdCB0aGUgdG9wLWxl
dmVsIGlycV9kYXRhIGFsd2F5cyBoYXMgaXJxX3dyaXRlX21zaV9tc2coKSBidXQgaWYKPiB0aGlz
IGFzc3VtcHRpb24gaXMgbm90IGNvcnJlY3QgdGhlbiB3ZSBuZWVkIGFuIGlmLWNoZWNrIG92ZXIg
aGVyZS4KCkluZGVlZC4gSSBtaXNyZWFkIHRoYXQgcGFydCBhbmQgeWVzLCB5b3UgY2FuIGFzc3Vt
ZSB0aGF0IHRoZSB0b3AgbGV2ZWwKZG9tYWluIGhhcyBhIHdyaXRlIE1TSSBjYWxsYmFjayBiZWNh
dXNlIHRoYXQncyB3aGF0IHRoaXMgTVNJIHBhcmVudApkb21haW4gaXMgYWJvdXQuCgpXZSBtaWdo
dCBjaGVjayBmb3IgdGhhdCBpbiB0aGUgbXNpIGxpYi4gU2VlIGJlbG93CgpUaGFua3MsCgogICAg
ICAgIHRnbHgKLS0tICAgICAgICAKLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1tc2ktbGliLmMK
KysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1tc2ktbGliLmMKQEAgLTQ4LDYgKzQ4LDkgQEAgYm9v
bCBtc2lfbGliX2luaXRfZGV2X21zaV9pbmZvKHN0cnVjdCBkZQogCQlyZXR1cm4gZmFsc2U7CiAJ
fQogCisJaWYgKFdBUk5fX09OX09OQ0UoIWNoaXAtPmlycV93cml0ZV9tc2lfbXNnKSkKKwkJcmV0
dXJuIGZhbHNlOworCiAJcmVxdWlyZWRfZmxhZ3MgPSBwb3BzLT5yZXF1aXJlZF9mbGFnczsKIAog
CS8qIElzIHRoZSB0YXJnZXQgZG9tYWluIGJ1cyB0b2tlbiBzdXBwb3J0ZWQ/ICovCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
