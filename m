Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96AFC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IppD+9p2sTu9r2I/Ce8YrhvrAuX0vEGzKcmfjfkatQ=; b=eiXJz+QxMQHbKL
	lFqEvXYK9N3QMPXiv1pBoaAtuw8AZT1b4SOBcjSKm/PMM5299h1X7OQXUFOefMhOLhhLRDeW6ham0
	BNT6ulZvftU97BKY+B4QhBH/x93YoJ1lWhZX4u1W6SL4u8s2cKgZwakWCGBRrw1xmFZQCRWx3jY6m
	uRuW0IUNe4jLIERBNSItVoMmhujUY75ONRWUxSGhMLtkaQH+DsBiCEWxV+xSxC8hlMDKQ4tbWdVRH
	b3mV+ISWN85z3On+xbxqQH22vHo3Wd5oyfITEWTtBTfxeyCmp4Sez/BmsjRvxNlNt0gYLKzSXNm9K
	je35zjvvm5ee+8nbMCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uI2-00000004N0V-1eOY;
	Tue, 22 Sep 2026 06:47:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uI1-00000004N01-1Y8x;
	Tue, 22 Sep 2026 06:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R3byElr0T5dtebr3WUNax1uHYhmo+4Ucoy9qEsJjVkM=; b=c3Xt8HA0AS+mAjiIJ40Zoh/UJS
	6k1f1RyHNVYNuraWhcGdSGScS1d2KhQLCKSdKBum5o1mILolftQ2MBJiqfTc4JRaTinqy+O4+K+lD
	ggL5kY+CtHi10QfUTg7b5VlQCMFva7LLeT0TjJH1WLjhQ2yyGzSfcAnePqCeYnH0tMNrdKAIGLdZP
	UjLKBXSTEJ/GmsdBi+aPViTbm+RwjqJTbytVuOg0cM+wOiryFze1OSDQflvd+IT96DIRQqjISgZWX
	yWmmMNSHz7CNuoGhYNfsOtrQWrA/r10tw5dMgomPZZjYhytggDDuKYTsQvk16cZkyyPDDEbjMon3A
	9TqZylnw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uHw-00000007NfL-0I3B;
	Tue, 22 Sep 2026 06:47:36 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9CCD9300708; Tue, 22 Sep 2026 08:47:35 +0200 (CEST)
Date: Tue, 22 Sep 2026 08:47:35 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org,
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com,
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net,
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
References: <20260922054959.955093-2-mkchauras@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260922054959.955093-2-mkchauras@gmail.com>
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

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTE6MjA6MDBBTSArMDUzMCwgTXVrZXNoIEt1bWFyIENo
YXVyYXNpeWEgKElCTSkgd3JvdGU6Cj4gVmVyaWZ5IHRoYXQgdGhlIF9fYnVnX3RhYmxlIGVudHJ5
IGVtaXR0ZWQgYnkgQVJDSF9XQVJOX0FTTSBoYXMgYSBjb3JyZWN0Cj4gYnVnX2FkZHIgZGlzcGxh
Y2VtZW50IOKAlCBpLmUuIHRoZSBhcmNoJ3MgdHJhcCBsYWJlbCByZWZlcmVuY2UgcmVzb2x2ZXMg
dG8KPiB0aGUgdHJhcCBpbnN0cnVjdGlvbiDigJQgYnkgY2FsbGluZyBmaW5kX2J1ZygpIHdpdGgg
dGhlIGV4YWN0IHZpcnR1YWwgYWRkcmVzcwo+IG9mIHRoZSB0cmFwLCBtaXJyb3Jpbmcgd2hhdCB0
aGUgcmVhbCB0cmFwIGhhbmRsZXIgZG9lcy4KPiAKPiBUbyBzdXBwb3J0IGFsbCBhcmNoaXRlY3R1
cmVzLCBlYWNoIGFyY2ggdGhhdCBpbXBsZW1lbnRzIEFSQ0hfV0FSTl9BU00gbm93Cj4gZGVmaW5l
cyBBUkNIX1dBUk5fQVNNX1RSQVBfTEFCRUwsIGEgc3RyaW5nIGNvbnN0YW50IG5hbWluZyB0aGUg
bG9jYWwgbGFiZWwKPiBhdCB3aGljaCB0aGUgdHJhcCBpbnN0cnVjdGlvbiBpcyBwbGFjZWQ6Cj4g
Cj4gICB4ODYgICAgICAgIjEiICAgICAodWQyIGF0IGxhYmVsIDE6KQo+ICAgcG93ZXJwYyAgICIx
IiAgICAgKHR3aSBhdCBsYWJlbCAxOikKPiAgIHJpc2N2ICAgICAiMSIgICAgIChlYnJlYWsgYXQg
bGFiZWwgMTopCj4gICBhcm02NCAgICAgIjE0NDcxIiAoYnJrIHBsYWNlZCBhdCAxNDQ3MTogYnkg
X19CVUdfRU5UUllfRU5EKQo+ICAgczM5MCAgICAgICIwIiAgICAgKG1jIGF0IGxhYmVsIDA6KQo+
IAo+IFRoZSBsYWJlbCBpcyB1c2VkIGNvbnNpc3RlbnRseTogaW4gQVJDSF9XQVJOX0FTTSBpdHNl
bGYsIGluIHRoZQo+IGJ1Z19hZGRyIGJhY2stcmVmZXJlbmNlIGluc2lkZSBfX0JVR19FTlRSWSAv
IF9FTUlUX0JVR19FTlRSWSwgCgoKPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
YnVnLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9idWcuaAo+IGluZGV4IDIzYWIwNTQzODI2OS4u
NmNjYTg4ODA2NjBlIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oCj4g
KysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20vYnVnLmgKPiBAQCAtNjIsOCArNjIsOSBAQCBleHRl
cm4gdm9pZCBfX1dBUk5fdHJhcChzdHJ1Y3QgYnVnX2VudHJ5ICpidWcsIC4uLik7Cj4gICNkZWZp
bmUgSEFWRV9BUkNIX0JVR19GT1JNQVRfQVJHUwo+ICAjZW5kaWYKPiAgCj4gKyNkZWZpbmUgQVJD
SF9XQVJOX0FTTV9UUkFQX0xBQkVMICIxIgo+ICAjZGVmaW5lIF9fQlVHX0VOVFJZKGZvcm1hdCwg
ZmlsZSwgbGluZSwgZmxhZ3MpCQkJCVwKPiAtCSJcdC5sb25nIDFiIC0gLiIJIlx0IyBidWdfZW50
cnk6OmJ1Z19hZGRyXG4iCQlcCj4gKwkiXHQubG9uZyAiIEFSQ0hfV0FSTl9BU01fVFJBUF9MQUJF
TCAiYiAtIC4iICJcdCMgYnVnX2VudHJ5OjpidWdfYWRkclxuIiBcCj4gIAlfX0JVR19FTlRSWV9G
T1JNQVQoZm9ybWF0KQkJCQkJXAo+ICAJX19CVUdfRU5UUllfVkVSQk9TRShmaWxlLCBsaW5lKQkJ
CQkJXAo+ICAJIlx0LndvcmQgIiBmbGFncwkiXHQjIGJ1Z19lbnRyeTo6ZmxhZ3NcbiIKPiBAQCAt
MTAxLDcgKzEwMiw3IEBAIGRvIHsJCQkJCQkJCQlcCj4gIAkiOTk6XG4iCQkJCQkJCQlcCj4gIAki
XHQuc3RyaW5nIFwiXCJcbiIJCQkJCQlcCj4gIAkiLnBvcHNlY3Rpb25cbiIJCQkJCQkJXAo+IC0J
IjE6XHQgIiBBU01fVUQyICJcbiIJCQkJCQlcCj4gKwlBUkNIX1dBUk5fQVNNX1RSQVBfTEFCRUwg
IjpcdCAiIEFTTV9VRDIgIlxuIgkJCVwKPiAgCV9CVUdfRkxBR1NfQVNNKCI5OWIiLCBmaWxlLCBs
aW5lLCBmbGFncywgc2l6ZSwgIiIpCj4gIAo+ICAjZWxzZQoKTm90IHJlYWxseSBhIGZhbiBvZiB0
aGF0LiBBbmQgSSBjYW4ndCByZWFsbHkgdGVsbCB3aGF0IHlvdSdyZSBkb2luZyB3aXRoCml0IGVp
dGhlci4gVGhlIGt1bml0IGlzIGluIFJ1c3QgYW5kIHRodXMgdW5yZWFkYWJsZSA6LSgKCkkgd291
bGQgcmF0aGVyIHlvdSBmaXggdXAgaXNfdmFsaWRfYnVnYWRkcigpLCBzb21lIGFyY2hpdGVjdHVy
ZXMgc2VlbSB0bwpoYXZlIGFuIGFsd2F5cyB0cnVlIHN0dWIgYmVjYXVzZSBvZiB0aGUgY2FsbGNo
YWlucyBhbHdheXMgYmVpbmcgZnJvbSB0aGUKYnJlYWsgaW5zdHJ1Y3Rpb24uCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
