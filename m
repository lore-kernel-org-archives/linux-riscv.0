Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25ABC25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 05:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=op4HKa7I1JT4TYpbk/NA3Ri7caMG43xMZGyjtqPJbHs=; b=NHBwKa2zUHWxxO
	y9M6dxElm39ddtJneWw3JwNkQnMBotXjRsmZgkNDh2KzVkLSYoRs0I7VVQ7fuJIdOVAYNSeCNAOmT
	qKp2qCrNqhxKzpEnQ8pbXs9K44f6zz1qr51T6r6bO+6W/BWrgH4KH0+yvkTh5UuhpWgDU3CCRKPxZ
	HG4MoA3mdjyQcFxUeF8O38gP3uZyzw6o3kXzAHLNVISgynOEyD1loPRbzkc2/XHurw9condBJnnJr
	NPkXZzOyQydeDWTp1cTEOBVCjF0gPvdVLjSVJH4Olx1/MYZOqK9exD3bG+ubdhrDGKm1gsN3/bJ8W
	XGLTAwuNqb/m9QikDmRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77Op-00000000XF1-3WSf;
	Wed, 15 May 2024 05:41:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77Ol-00000000XEF-26tr
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 05:41:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 136D7CE02C5;
	Wed, 15 May 2024 05:41:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C70C116B1;
	Wed, 15 May 2024 05:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715751711;
	bh=mmF1KeXBL7U8C83N3jzFBWR9OlDzinn1tPvhQxIcJoQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=TUVIDYBV82kiQ+MFfP94+TJanOMTxDKNqpExsyY9WyUZ6gqtJJodG6QmXkZONJXu6
	 1aK0ScbFd5P7+OEvorRw1zak3jD3s7josaNFDIOSM+aAHbyC82x0oBfodS6bxHnsMy
	 FPKE6S+7j/+G3Dq8AJw8dGiJaHb175oVUGu0KEjaFR+ZTgHymuInC4OSeDzGTmIKVE
	 kc5kWNkFxUxTTMla+TmklOYF4jdwnWpSAE4BNWIi1Eg7XQX9dgykMF3lx348dpGUf3
	 91UIiOXPBMy79Wt/kYXkcI+Yx0xixEsVwhv5FjyfPazlBlTv79liNDyERSF+kyo5XH
	 uo2vBxfXbfz/g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 4/8] riscv: mm: Add memory hotplugging support
In-Reply-To: <ZkPOaAUZrRWRGke0@localhost.localdomain>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-5-bjorn@kernel.org>
 <ZkPOaAUZrRWRGke0@localhost.localdomain>
Date: Wed, 15 May 2024 07:41:47 +0200
Message-ID: <87msork4x0.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_224155_749771_E16343DB 
X-CRM114-Status: GOOD (  14.52  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Lorenzo Stoakes <lstoakes@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNlLmRlPiB3cml0ZXM6Cgo+IE9uIFR1ZSwgTWF5
IDE0LCAyMDI0IGF0IDA0OjA0OjQyUE0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+ICtz
dGF0aWMgdm9pZCBfX21lbWluaXQgZnJlZV92bWVtbWFwX3N0b3JhZ2Uoc3RydWN0IHBhZ2UgKnBh
Z2UsIHNpemVfdCBzaXplLAo+PiArCQkJCQkgICBzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1hcCkK
Pj4gK3sKPj4gKwlpZiAoYWx0bWFwKQo+PiArCQl2bWVtX2FsdG1hcF9mcmVlKGFsdG1hcCwgc2l6
ZSA+PiBQQUdFX1NISUZUKTsKPj4gKwllbHNlCj4+ICsJCWZyZWVfcGFnZXMoKHVuc2lnbmVkIGxv
bmcpcGFnZV9hZGRyZXNzKHBhZ2UpLCBnZXRfb3JkZXIoc2l6ZSkpOwo+Cj4gRGF2aWQgYWxyZWFk
eSBwb2ludGVkIHRoaXMgb3V0LCBidXQgY2FuIGNoZWNrCj4gYXJjaC94ODYvbW0vaW5pdF82NC5j
OmZyZWVfcGFnZXRhYmxlKCkuCj4KPiBZb3Ugd2lsbCBzZWUgdGhhdCB3ZSBoYXZlIHRvIGRvIHNv
bWUgbWFnaWMgZm9yIGJvb3RtZW0gbWVtb3J5IChESU1Ncwo+IHdoaWNoIHdlcmUgbm90IGhvdHBs
dWdnZWQgYnV0IGFscmVhZHkgcHJlc2VudCkKClRoYW5rIHlvdSEKCj4+ICsjaWZkZWYgQ09ORklH
X1NQQVJTRU1FTV9WTUVNTUFQCj4+ICt2b2lkIF9fcmVmIHZtZW1tYXBfZnJlZSh1bnNpZ25lZCBs
b25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXAp
Cj4+ICt7Cj4+ICsJcmVtb3ZlX3BnZF9tYXBwaW5nKHN0YXJ0LCBlbmQsIHRydWUsIGFsdG1hcCk7
Cj4+ICt9Cj4+ICsjZW5kaWYgLyogQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQICovCj4+ICsjZW5k
aWYgLyogQ09ORklHX01FTU9SWV9IT1RQTFVHICovCj4KPiBJIHdpbGwgY29tbWVudCBvbiB0aGUg
cGF0Y2ggd2hlcmUgeW91IGFkZCBzdXBwb3J0IGZvciBob3RwbHVnIGFuZCB0aGUKPiBkZXBlbmRl
bmN5LCBidXQgb24gYSB0cmFjayBpbiBMU0ZNTSB0b2RheSwgd2UgZGVjaWRlZCB0aGF0IG1vc3Qg
bGlrZWx5Cj4gd2Ugd2lsbCBkcm9wIG1lbW9yeS1ob3RwbHVnIHN1cHBvcnQgZm9yICFDT05GSUdf
U1BBUlNFTUVNX1ZNRU1NQVAKPiBlbnZpcm9ubWVudHMuCj4gU28sIHNpbmNlIHlvdSBhcmUgYWRk
aW5nIHRoaXMgcGxhaW4gZnJlc2gsIHBsZWFzZSBjb25zaWRlciB0byB0aWdodCB0aGUKPiBob3Rw
bHVnIGRlcGVuZGVuY3kgdG8gQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQLgo+IEFzIGEgYm9udXMs
IHlvdSB3aWxsIG9ubHkgaGF2ZSB0byBtYWludGFpbiBvbmUgZmxhdm91ciBvZiBmdW5jdGlvbnMu
CgpBaCwgeWVhaCwgSSBzYXcgaXQgbWVudGlvbmVkIG9uIHRoZSBMU0YvTU0vQlBGIHRvcGljcy4g
TGVzcyBpcwpkZWZpbml0ZWx5IG1vcmUgLS0gSSdsbCBtYWtlIHRoZSBuZXh0IHZlcnNpb24gZGVw
ZW5kIG9uClNQQVJTRU1FTV9WTUVNTUFQLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
