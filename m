Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD4FC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 20:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FU0/enoLQBMSzjRihjGivEelVtxwm2pj2Utm53zkTwo=; b=WgN6Y++cq9EzTM
	D7HTb/bbjg9emQx56Z0+dIXcVVkpEzzhnNbTu56hFBoptzR0IDJppSUDH7RkW3LwHny8gP9b9ubvc
	QH78urqCvC5nDhvcf7lNPygFIPy3/sCuz5tD/uRYzcd861I1CZd03trLl9RzrQkyVCffkqUzYFo/m
	mJ+4apedFDNeSiZnI+fvJFnWZOMLUUGF0JaKo3jmWiY7rlQHrDEkB0/TiH8KGiNiY7A8kjuL8QXC8
	w4eyP146VWpSUoS3Rwd7ZH+7ATWN8SM4497FxMs+Ee2eQ0tnUJxQeHSH0jRKGRAEgRaIMQIj7v0J4
	Yy8NCN1EDSQNoBOQ3pcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2I1I-0008fQ-3B;
	Thu, 25 May 2023 20:57:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2I1B-0008co-2r;
	Thu, 25 May 2023 20:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w/nv11jmZL//tzZgnsZQ422wtTnnU+GBTr8mcjZt+5o=; b=jz222m+qmkx46CtsL2SK6imku3
	qq2pJIrpZYwwtoNlBcZF7Fk0xlPqceK3lGx9yfcEP5je3dxHl9hetkE+18QuDijP55CEPQoODBYNI
	uvYKUPiKzBlONmhR187tH+srkvPeqkL343XpLTCXJPsX8gyRZRXys5FShMS4Kw48PvGIyNIrdiJob
	qzWNUEmQ7TjGXaPWTNoBqzaR0fCIqDhz5vX5aceLEg5RLyYCA0NTJNp94Q35H+/kQzQkdBPbuLfU0
	BUQp3kv2YpGE9fMQX8b3xVpJANGw8phzZpM8mq6dy60BHa+pYvxVMkKbTWE80Y8Sdq1m5IiayRsFG
	t/mQy7HA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q2I19-00DAXr-9n; Thu, 25 May 2023 20:57:03 +0000
Date: Thu, 25 May 2023 21:57:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Vishal Moola <vishal.moola@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Message-ID: <ZG/Ln0Nf/Zx//EQk@casper.infradead.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com>
 <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
 <20230525202011.GZ4967@kernel.org>
 <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOzc2pzGPBYL3S=noc1AAEtep04GexRmn2f_T3BPgVFZKaqXTg@mail.gmail.com>
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

T24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMDE6Mzg6NTRQTSAtMDcwMCwgVmlzaGFsIE1vb2xhIHdy
b3RlOgo+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDE6MjDigK9QTSBNaWtlIFJhcG9wb3J0IDxy
cHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTWF5IDI1LCAyMDIzIGF0IDEw
OjAwOjIzQU0gLTA3MDAsIFZpc2hhbCBNb29sYSB3cm90ZToKPiA+ID4gT24gVGh1LCBNYXkgMjUs
IDIwMjMgYXQgMTo1NuKAr0FNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPiA+ID4KPiA+ID4gPiBIaSwKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwgTWF5IDAxLCAyMDIz
IGF0IDEyOjI3OjU2UE0gLTA3MDAsIFZpc2hhbCBNb29sYSAoT3JhY2xlKSB3cm90ZToKPiA+ID4g
PiA+IE5vIGZvbGlvIGVxdWl2YWxlbnRzIGZvciBwYWdlIHR5cGUgb3BlcmF0aW9ucyBoYXZlIGJl
ZW4gZGVmaW5lZCwgc28KPiA+ID4gPiA+IGRlZmluZSB0aGVtIGZvciBsYXRlciBmb2xpbyBjb252
ZXJzaW9ucy4KPiA+ID4gPgo+ID4gPiA+IENhbiB5b3UgcGxlYXNlIGVsYWJvcmF0ZSB3aHkgd291
bGQgd2UgbmVlZCBmb2xpb3MgZm9yIHBhZ2UgdGFibGUgZGVzY3JpcHRvcnM/Cj4gPiA+Cj4gPiA+
IFRoYW5rcyBmb3IgdGhlIHJldmlldyEKPiA+ID4KPiA+ID4gVGhlc2UgbWFjcm9zIGFyZSBmb3Ig
Y2FsbGVycyB0aGF0IGNhcmUgYWJvdXQgdGhlIHBhZ2UgdHlwZSwgaS5lLiBUYWJsZSBhbmQKPiA+
ID4gQnVkZHkuIEFzaWRlIGZyb20gYWNjb3VudGluZyBmb3IgdGhvc2UgY2FzZXMsIHRoZSBwYWdl
IHRhYmxlcyBkb24ndCB1c2UgZm9saW9zLgo+ID4gPiBUaGVzZSBhcmUgbW9yZSBmb3IgdGhlIGNs
ZWFubGluZXNzIG9mIHRob3NlIGNhbGxlcnMuCj4gPgo+ID4gQnV0IHdoeSB1c2luZyBmb2xpbyBB
UElzIGZvciBQYWdlVHlwZSB3aWxsIGJlIGNsZWFuZXIgdGhhbiB1c2luZyBwYWdlIEFQSXM/Cj4g
PiBEbyB5b3UgaGF2ZSBhbiBleGFtcGxlPwo+IAo+IEFoLCBmb3IgZXhhbXBsZSBpbiBtbS9tZW1v
cnktZmFpbHVyZS5jIHRoZXJlIGFyZSBhIGNvdXBsZSB1c2VzIG9mIFBhZ2VUYWJsZS4KPiBMaWtl
IHRoZSBsaW5lIDoKPiBpZiAoZm9saW9fdGVzdF9zbGFiKGZvbGlvKSB8fCBQYWdlVGFibGUoJmZv
bGlvLT5wYWdlKSB8fAo+IGZvbGlvX3Rlc3RfcmVzZXJ2ZWQoZm9saW8pKQo+IHdoZXJlIHRoYXQg
UGFnZVRhYmxlKCZmb2xpby0+cGFnZSkgY2FuIG5vdyBiZSB3cml0dGVuIGFzIGZvbGlvX3Rlc3Rf
dGFibGUoZm9saW8pCj4gaW5zdGVhZC4KPiAKPiBBbHNvIHRoZXJlIGFyZSBudW1lcm91cyB1c2Vz
IG9mIFBhZ2VCdWRkeSBpbiBtbS9jb21wYWN0aW9uLmMgdGhhdCB3aWxsCj4gbGlrZWx5IG5lZWQg
dG8gYmUgY29udmVydGVkIHRvIGZvbGlvcyBhcyB3ZWxsLgoKLi4uIGFuZCB5b3UgY2FuIGN1cnJl
bnRseSBjYWxsIFBhZ2VUYWJsZSgpIG9uIHRoZSBzZWNvbmQvdGhpcmQvLi4uIHBhZ2UKb2YgYW4g
YWxsb2NhdGlvbiBhbmQgaXQgd2lsbCByZXR1cm4gZmFsc2UsIHJlZ2FyZGxlc3Mgb2Ygd2hhdCB0
aGUKZmlyc3QgcGFnZSBpcyB0eXBlZCBhcy4gIEZvciBtb3N0IGFyY2hpdGVjdHVyZXMsIHRoaXMg
ZG9lc24ndCBtYXR0ZXIsCmJ1dCAvcHJvYy9rcGFnZWZsYWdzIHdpbGwgdW5kZXJyZXBvcnQgdGhl
IGFtb3VudCBvZiBtZW1vcnkgYWxsb2NhdGVkCmFzIHBhZ2UgdGFibGVzIG9uIGFyY2hpdGVjdHVy
ZXMgd2hpY2ggdXNlIG11bHRpLXBhZ2UgYWxsb2NhdGlvbnMgZm9yCnRoZWlyIHBhZ2UgdGFibGVz
IGFzIHRoZXJlJ3MgY3VycmVudGx5IGFic29sdXRlbHkgbm90aGluZyB0byBpbmRpY2F0ZQp0aGUg
c2l6ZSBvZiB0aGUgYWxsb2NhdGlvbi4KClRvIGZpeCB0aGlzLCB3ZSBuZWVkIHRvIHVzZSBfX0dG
UF9DT01QLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
