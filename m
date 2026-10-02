Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41028CA5FD4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 11:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BD1R9LcTcWdYsVPjs7Tg7VL+4+XCIKdO+aznbWqlk60=; b=dYnwHL1PTyZVTS
	uhT1Q/Refx51KiShjT0av/NkkQi+3zkn0HZ/OwRIzWCjLBroLnfw2zcQ3m8BN7DWtpcZYMjVtyJZZ
	4CFmpwAu34ERopO8H1HFeeOBV4lrDETD+tkdGsattrEQVYKQHOKhdPRw1P/nvbMpm/VXXI0py0bbY
	B/LK8ryWjwpIhiQrXhBjd43Gkx4LO4wKLgLKp66JrJAKDrmTRCq03CwrJb9Jmi23VB9RhwDR7sHqY
	y1HUBV0MUNDztLUbs0Z0kOf/5AAl4cP1ZkDHAxmKzAfmxe/aKNfu3561C+2ALswR9j4Vm0nDv78v2
	wnimujZxnsqruEL53Ivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb2D-0000000BPrV-2Cpa;
	Fri, 02 Oct 2026 11:02:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb2C-0000000BPqi-0tgN;
	Fri, 02 Oct 2026 11:02:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EE73841234;
	Fri,  2 Oct 2026 11:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A0031F000FF;
	Fri,  2 Oct 2026 11:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938955;
	bh=hKu1k8kGP5SDfYzTUe6BEg1Rh9OEx1S7cLJzvwkIo8E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=fSA8KOPcMfD4nTuoQwZ65dnTEvIIcs8MuGlPn8Fs/+3fC7NLGpsaO+RpN1IgsIBZu
	 AUxBtepWGjjVI3M99anax4EK04p2VnA9VIFZGzrlLQlbKdH3xKIuLyNNV+nBS2gK+K
	 5MooxFs6WNfBX0ph/LCjwbFGsD5J8aN8q3nq6gL6dt66NTeVQTiBN3PJLVIx5KOpvx
	 kE87mNLRWpd4R0tmXsVbWwfvfFM0lYN5bAuwZWdHMhEK58ZB7SZ2YSx28z9+Nwg3HW
	 ESud0bA/Itaq1CPRhVc11wMDE18rRr2PF7dQo3epBifa0/5Uf6eMwX7MZUn8/gFQ9j
	 MDkdSwxtvaqxw==
Message-ID: <c39d7d50-e527-4a72-a89f-da4a9ac3cc97@kernel.org>
Date: Fri, 2 Oct 2026 13:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Nathan Chancellor <nathan@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260925-vdso-getrandom-avoid-memset-llvm-24-v2-1-ce640f872393@kernel.org>
 <179093852073.149722.832232613857480812.b4-ty@kernel.org>
 <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAHmME9pDcYh5OVSqnju8VfgEXt3YBToDBbFNz_OguKA23r6stg@mail.gmail.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwMi8xMC8yMDI2IMOgIDEyOjU4LCBKYXNvbiBBLiBEb25lbmZlbGQgYSDDqWNyaXTCoDoK
PiBPbiBGcmksIE9jdCAyLCAyMDI2IGF0IDEyOjU34oCvUE0gQ2hyaXN0b3BoZSBMZXJveSAoQ1Mg
R1JPVVApCj4gPGNobGVyb3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+Cj4+IE9uIEZyaSwgMjUg
U2VwIDIwMjYgMjI6NDY6MzIgKzAxMDAsIE5hdGhhbiBDaGFuY2VsbG9yIHdyb3RlOgo+Pj4gQWZ0
ZXIgYSByZWNlbnQgY2hhbmdlIGluIExMVk0gWzFdLCBidWlsZHMgd2l0aCB0aGUgcmFuZG9tIHZE
U08KPj4+IGltcGxlbWVudGF0aW9uLCBzdWNoIGFzIFBvd2VyUEMgYW5kIFJJU0MtViwgZmFpbCB3
aGVuIGNoZWNraW5nIHRoZSB2RFNPOgo+Pj4KPj4+ICAgIGFyY2gvcG93ZXJwYy9rZXJuZWwvdmRz
by92ZHNvMzIuc28uZGJnOiBkeW5hbWljIHJlbG9jYXRpb25zIGFyZSBub3Qgc3VwcG9ydGVkCj4+
PiAgICBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28uc28uZGJnOiBkeW5hbWljIHJlbG9jYXRp
b25zIGFyZSBub3Qgc3VwcG9ydGVkCj4+Pgo+Pj4gbWVtc2V0KCkgaXMgbm93IGdlbmVyYXRlZCB3
aGVuIHplcm9pbmcgcGFyYW1zLT5yZXNlcnZlZCBmb3Igc29tZSBidWlsZHMKPj4+IGJlY2F1c2Ug
TExWTSBoYXMgYW4gb3B0aW1pemF0aW9uIChub3cgcnVuIGluIG1vcmUgaW5zdGFuY2VzKSB0aGF0
IGNhbgo+Pj4gcmVjb2duaXplIGF0IGNvbXBpbGUgdGltZSB3aGVuIGl0IGlzIGFzc2lnbmluZyBh
IHN0YXRpYyB2YWx1ZSB0byBhCj4+PiBjb250aWd1b3VzIGFyZWEgb2YgbWVtb3J5IGFuZCB0dXJu
IHRoYXQgaW50byBhIGNhbGwgdG8gbWVtc2V0KCkuIEJvdGgKPj4+IGNsYW5nIGFuZCBHQ0MgYXNz
dW1lIG1lbXNldCgpIGlzIGFsd2F5cyBhdmFpbGFibGUgWzJdLgo+Pj4KPj4+IFsuLi5dCj4+Cj4+
IEFwcGxpZWQsIHRoYW5rcyEKPj4KPj4gWzEvMV0gcmFuZG9tOiB2RFNPOiBBdm9pZCBjYWxsIHRv
IG1lbXNldCgpIHdoZW4gemVyb2luZyByZXNlcnZlZCBpbiBfX2N2ZHNvX2dldHJhbmRvbV9kYXRh
KCkKPj4gICAgICAgIChubyBjb21taXQgaW5mbykKPiAKPiBUaGF0J3Mgbm90IGZvciB5b3UgdG8g
YXBwbHkuIEknbSBzZW5kaW5nIHRoaXMgdGhyb3VnaCBteSByYW5kb20gdHJlZSwKPiBhbG9uZyB3
aXRoIGEgaGFuZGZ1bCBvZiBvdGhlciB0aGluZ3MgSSBuZWVkIHRvIGZpeC4gQnV0IEkgd2FudGVk
IHRvCj4gbGV0IHRoaXMgY29vayBhIGJpdCBtb3JlLiBJIGNhbiBhZGQgeW91ciByZXZpZXdlZC1i
eSBsaW5lLCB0aG91Z2guCgpTb3JyeSBJIG1lc3NlZCB1cCB3aXRoICdiNCB0eScsIEkgZG8gbm90
IGludGVudCB0byB0YWtlIHRoaXMgcGF0Y2ggaW4gbXkgCnRyZWUuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
