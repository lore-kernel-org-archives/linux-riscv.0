Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89BECA5FE6
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Oct 2026 13:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dDE3Igo84vNjML3w5ZYiMsUmp8OQUHbTfiGw8onPNgk=; b=G9TrgNcqnVYw4C
	HYQsQ0kQWTgMKSbWeVfA/IixYhWSGkE7k2esP57mREagkPge/pU9plc3Ny8Q8VmPS4loYuXg9+o3D
	s9TkoyBAc7mnJ+etqyuUo4eJz6j1Lk4SwdvgjDJz3HHwYdFib3zjiOOGYweCFjAsEJA9oS4Juf7Q1
	FZSI2NEU6NjkD8sjZwp0pAD+ovEBhqmwTO/pDTHjzlpF7duoz86wywW9hLEl51UvJVlqCZ+iPL9RP
	2f/+Q3NIHNxOFG9mbEpXIkbqJwL//qaUMrEszuDtiJmJQQb1l+qCyXiuGXu1jIUp3Hjma+c773bnu
	iv8LyaREFnkgS5iLMr0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMYR-0000000Erw5-3T95;
	Sun, 04 Oct 2026 13:47:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMYR-0000000Ervz-1KL1
	for linux-riscv@lists.infradead.org;
	Sun, 04 Oct 2026 13:47:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B306160120;
	Sun,  4 Oct 2026 13:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5861F000FF;
	Sun,  4 Oct 2026 13:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791121622;
	bh=wjQUJehNv7x6Ld+SZmB+IotKGd3LDi+sKb1y5LRwM1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ga1cjuC4+1ZZi/OrlQCwWxWKpt+32ez03wp++NxitjZ9yXOJcEnE8ZPnXPzI5eQLv
	 2b8xtO6ihMDSElUJjnZ76hjZMXKqs1qUQPGX7bvGfJBPIeQnYqYJ0W58/Y8TOvhkSU
	 CsnYHhi6NTJ65XZnM7cyJt5g6dmPWGeJZpnn/+ZOi9PklExuwd2lGCLBRjsKLyJcLp
	 f8wlyN/fkbfRPC5DrIdvmkLNGG/3IkUvrfvqm7hxSMkD/I5qZMqCmK8x69bVNfEJp/
	 1IWl9Q/BQJ1K6ZyX/JAmb382vCCqqvI6tjdh5CtTyiXg91JjHOnQ/APZK2RLxh4EEA
	 W0Ho3gfGjmbsQ==
Date: Sun, 4 Oct 2026 13:47:00 +0000
From: Yixun Lan <dlan@kernel.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
Message-ID: <20261004134700-GKA83703@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
 <CABdCQ=OUTASG8JDBqnJAPJ5aTDUC-BQzCVcw0r=cxrb8CPUO2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABdCQ=OUTASG8JDBqnJAPJ5aTDUC-BQzCVcw0r=cxrb8CPUO2A@mail.gmail.com>
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

SGkgSWtlciBQZWRyb3NhLAoKT24gMjA6NTQgRnJpIDAyIE9jdCAgICAgLCBJa2VyIFBlZHJvc2Eg
d3JvdGU6Cj4gRWwgdmllLCAxOCBzZXB0IDIwMjYgYSBsYXMgNzo0OSwgWWl4dW4gTGFuICg8ZGxh
bkBrZXJuZWwub3JnPikgZXNjcmliacOzOgo+ID4gWy4uLl0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BtZG9tYWluL3NwYWNlbWl0L3BtX2RvbWFpbnMuYyBiL2RyaXZlcnMvcG1kb21haW4vc3Bh
Y2VtaXQvcG1fZG9tYWlucy5jCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAw
MDAwMDAwMDAwLi5kNTYzZTRlNGUyMzIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2RyaXZl
cnMvcG1kb21haW4vc3BhY2VtaXQvcG1fZG9tYWlucy5jCj4gPiBbLi4uXQo+ID4gK3N0YXRpYyBz
dHJ1Y3Qgc3BhY2VtaXRfcG11ICpncG11Owo+IAo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gZW1i
ZWQgdGhlICdzdHJ1Y3Qgc3BhY2VtaXRfcG11JyBwb2ludGVyIGRpcmVjdGx5IGludG8KPiAnc3Ry
dWN0IHNwYWNlbWl0X3BtX2RvbWFpbic/IE90aGVyIGdlbmVyaWMgUG93ZXIgRG9tYWluIGRyaXZl
cnMgKFJvY2tjaGlwLAo+IFFDT00sIFJlbmVzYXMpIHVzZSB0aGlzIHBhdHRlcm4gdG8ga2VlcCBk
b21haW4gY2FsbGJhY2tzIHNlbGYtY29udGFpbmVkIGFuZAo+IHJlYWR5IGZvciBtdWx0aS1pbnN0
YW5jZSBTb0NzCj4gCj4gPiBbLi4uXQo+ID4gK3N0YXRpYyBpbnQgc3BhY2VtaXRfcGRfcG93ZXJf
b24oc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICpkb21haW4pCj4gPiArewo+ID4gWy4uLl0KPiA+
ICsgcmVnbWFwX3JlYWQoZ3BtdS0+cmVnbWFwLCBBUE1VX1BPV0VSX1NUQVRVU19SRUcsICZ2YWwp
Owo+IAo+IFBsZWFzZSBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIG9mIHJlZ21hcF9yZWFkKCkKPiAK
SXQncyBub3QgbmVjZXNzYXJ5LCBvciBpdCdzIG5vdCByZWFsbHkgdXNlZnVsIHRvIGNoZWNrIHJl
dHVybiB2YWx1ZSBoZXJlLApyZWdtYXBfcmVhZCgpIHNob3VsZG4ndCBmYWlsIGhlcmUsIGl0IGdl
bmVyYWxseSBhY2Nlc3MgdGhlIGlvIG1lbW9yeQoKPiA+IFsuLi5dCj4gPiArIGlmIChyZXQgPCAw
KSB7Cj4gPiArIGRldl9lcnIoJmRvbWFpbi0+ZGV2LCAicG93ZXItb2ZmIGRvbWFpbjogJWQsIGVy
cm9yXG4iLCBzcGQtPnBtX2luZGV4KTsKPiAKPiBUeXBvOiBzaG91bGQgdGhpcyBzYXkgInBvd2Vy
LW9uIGRvbWFpbiIgc2luY2UgdGhpcyBpcyBpbnNpZGUKPiBzcGFjZW1pdF9wZF9wb3dlcl9vbigp
Pwo+IAp3aWxsIGRyb3AgdGhpcyBsb2dpYywgSSBqdXN0IGZvbGxvd2VkIHZlbmRvciBkcml2ZXIg
d2hpY2ggdHJ5IHRvIGZvcmNlIHBvd2VyCm9mZiBkb25tYWluIGJlZm9yZSBkb2luZyB0aGUgcG93
ZXIgb24gb3BlcmF0aW9uIGlmIGl0J3MgYWxyZWFkeSBpbiAnb24nIHN0YXRlLi4KCndoaWxlIGZv
dW5kIGl0J3Mgbm90IHJlYWxseSBuZWNlc3NhcnkgdG8gZG8gdGhpcyBkdXJpbmcgYWN0dWFsIHRl
c3RpbmcKCj4gPiBbLi4uXQo+ID4gK3N0YXRpYyBib29sIHNwYWNlbWl0X3BtX2dldF9zdGF0ZShz
dHJ1Y3Qgc3BhY2VtaXRfcG11ICpwbXUsCj4gPiArICBzdHJ1Y3Qgc3BhY2VtaXRfcG1fZG9tYWlu
ICpwZCkKPiA+ICt7Cj4gPiArIGNvbnN0IHN0cnVjdCBzcGFjZW1pdF9wbV9kb21haW5fcGFyYW0g
KnAgPSBwZC0+cGFyYW07Cj4gPiArIHUzMiByZWcsIGJpdDsKPiA+ICsKPiA+ICsgcmVnbWFwX3Jl
YWQocG11LT5yZWdtYXAsIEFQTVVfUE9XRVJfU1RBVFVTX1JFRywgJnJlZyk7Cj4gCj4gUGxlYXNl
IGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgaGVyZSBhcyB3ZWxsCj4gCkkgZG9uJ3QgdGhpbmsgdGhl
IGNoZWNrIGlzIHVzZWZ1bCwgaW4gcmFyZSBjYXNlIGl0IHNob3VsZCBmYWlsCgo+ID4gKyBiaXQg
PSBwLT51c2VfaHcgPyBCSVQocGQtPnBhcmFtLT5iaXRfaHdfcHdyX3N0YXQpIDoKPiA+ICsgIEJJ
VChwZC0+cGFyYW0tPmJpdF9wd3Jfc3RhdCk7Cj4gCj4gU2luY2UgJ3AnIGlzIGluaXRpYWxpemVk
IHRvICdwZC0+cGFyYW0nIGFib3ZlLCB5b3UgY2FuIHVzZSAncC0+Yml0X2h3X3B3cl9zdGF0Jwo+
IGFuZCAncC0+Yml0X3B3cl9zdGF0JyBkaXJlY3RseSBoZXJlClllcywgd2lsbCBkbwoKLS0gCllp
eHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
