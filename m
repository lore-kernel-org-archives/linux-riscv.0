Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B76FC02180
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzTpMT+NIf+K0B+m9j2aqn1kQXb7oVgoTpzTH1W6qQY=; b=bmQHDfqERBLXjF
	AbzTpPDrqYmKS4wb824m7bgffXPp8WcbZRY9N/z9FtVeIsNyy0SW+wfym+hdFXhCehx+dpj+wVMAm
	kO6O7+NQwQtDdtPiiL6jiJKNW5sX5stn82fv9/USJ03C/jAf1ZQ1683PZUHy6/yZUejj1PIOXIrkF
	t2bk4tVWxjCiJyCIqxDrsSLA47+TO2DzRSyR7VLNIgDkw9kIaFSdKKvOuR516Qw579fRr/9DH9Q1/
	qZKMNmTas7i38h4PH8r+eTWNJONWUKnR7pcydZDi/u4MDByaytDtNWWAIL4R3XCBciNOTlMEDBrka
	zIeLZfID6FYWUgzocP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJ6-0000000BDBQ-0gPQ;
	Wed, 15 Jan 2025 09:03:24 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXzJ3-0000000BDAn-3xUY
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 09:03:23 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 88C9F92009C; Wed, 15 Jan 2025 10:03:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8576392009B;
	Wed, 15 Jan 2025 09:03:20 +0000 (GMT)
Date: Wed, 15 Jan 2025 09:03:20 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Florian Weimer <fweimer@redhat.com>
cc: Jeff Law <jeffreyalaw@gmail.com>, linux-riscv@lists.infradead.org, 
    Palmer Dabbelt <palmer@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>
Subject: Re: Page sizes supported by RISC-V
In-Reply-To: <87msfsldl8.fsf@oldenburg.str.redhat.com>
Message-ID: <alpine.DEB.2.21.2501150858550.50458@angie.orcam.me.uk>
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com> <e55950a2-beb0-4f2a-81da-1c66724116d7@gmail.com> <8734lixzss.fsf@oldenburg.str.redhat.com> <cbbc9925-12a5-4043-a6c5-ccd1ef0997c8@gmail.com> <31ce4016-9420-4143-ae31-faf36a878cb4@gmail.com>
 <alpine.DEB.2.21.2501150631330.50458@angie.orcam.me.uk> <87msfsldl8.fsf@oldenburg.str.redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_010322_147305_2DE3C2B1 
X-CRM114-Status: GOOD (  21.24  )
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

T24gV2VkLCAxNSBKYW4gMjAyNSwgRmxvcmlhbiBXZWltZXIgd3JvdGU6Cgo+ID4+ID4+IEkgdW5k
ZXJzdGFuZCB0aGF0IG5vdCBtYWtpbmcgYSBjYWxsIGluIHRoZSBzcGVjaWZpY2F0aW9ucyBhdm9p
ZHMgdGhlCj4gPj4gPj4gbmVlZCB0byByZXNvbHZlIHRoZXNlIGNvbmZsaWN0cy7CoCBCdXQgaWYg
eW91IGRvbid0IGRlZmluZSBhIG1heGltdW0gcGFnZQo+ID4+ID4+IHNpemUgdGhlcmUsIGl0IGlz
IGVmZmVjdGl2ZWx5IHNwZWNpZmllZCBhcyA0MDk2IGJ5dGVzLsKgIFRoaXMgd2lsbCBjYXVzZQo+
ID4+ID4+IHByb2JsZW1zIGlmIGRpc3RyaWJ1dGlvbnMgdGFyZ2V0aW5nIGxhcmdlIHN5c3RlbXMg
d2FudCBhIGxhcmdlciBwYWdlCj4gPj4gPj4gc2l6ZSBiZWNhdXNlIGl0IGJldHRlciBhbGlnbnMg
d2l0aCB0aGUga2luZCBvZiBoYXJkd2FyZSB0aGV5IHRhcmdldC4KPiA+PiA+PiBJdCdzIHJlYWxs
eSBiYWQgZm9yIGNyb3NzLWRpc3RyaWJ1dGlvbiBiaW5hcnkgY29tcGF0aWJpbGl0eSwgc29tZXRo
aW5nCj4gPj4gPj4gdGhhdCdzIGltcG9ydGFudCBvdXRzaWRlIHRoZSBlbWJlZGRlZCBzcGFjZSBh
bmQgcHJvYmFibHkgbmVjZXNzYXJ5IGZvcgo+ID4+ID4+IG1haW5zdHJlYW1pbmcuCj4gPj4gPj4K
PiA+PiA+PiAoT2YgY291cnNlIHlvdSBrbm93IGFsbCB0aGlzLiA4LSkKPiA+PiA+IFl1cC7CoCBP
bmNlIGl0J3MgYmFrZWQgaW50byBvbmUgc2lnbmlmaWNhbnQgZGlzdHJvLCBpdCdzIGRvaW5nIHRv
IGJlIAo+ID4+ID4gYmxvb2R5IGhhcmQgdG8gY2hhbmdlLsKgIEknbSBzdXJlIHdlIGJvdGggcmVt
ZW1iZXIgdGhlIFBQQyBwYWdlc2l6ZSBzdHVmZiAKPiA+PiA+IGZyb20gYSBmZXcgeWVhcnMgYmFj
ayA7KAo+ID4+ID4gCj4gPj4gPiBJIHN0cm9uZ2x5IHN1c3BlY3QgdGhlIGxhY2sgb2Ygc3BlY2lm
aWNhdGlvbiBoZXJlIGlzIG1lYW4gdG8gZ2l2ZSAKPiA+PiA+IGRlZ3JlZXMgb2YgZnJlZWRvbSB0
byB0aGUgaW1wbGVtZW50b3JzLCBidXQgc29tZXRpbWVzIHRob3NlIHdyaXRpbmcgdGhlIAo+ID4+
ID4gc3BlY3MgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgdGhlIGltcGxpY2F0aW9uIG9mIGxlYXZp
bmcgdGhpbmdzIGxpa2UgCj4gPj4gPiB0aGlzIHVuc3BlY2lmaWVkIGFuZCBob3cgbXVjaCBwYWlu
IGl0IHJlYWxseSBjYXVzZXMgaW4gdGhlIGVuZC4KPiA+PiBTbyByZXN1cnJlY3RpbmcgdGhpcyBk
aXNjdXNzaW9uLgo+ID4+IAo+ID4+IElzIHRoZXJlIGFueSByZWFsaXN0aWMgY2hhbmNlIG9mIGJ1
bXBpbmcgdGhlIG1pbmltdW0gcGFnZXNpemUgZm9yIHJpc2MtdiAKPiA+PiBhdCB0aGlzIHBvaW50
PyAgWHUgTHUgYW5kIGhpcyB0ZWFtIGhhdmUgc29tZSBjb21wZWxsaW5nIGRhdGEgdGhhdCAKPiA+
PiBpbmRpY2F0ZXMgbW92aW5nIGZvcndhcmQgdG8gNjRrIGNvdWxkIGJlIGhpZ2hseSBwcm9maXRh
YmxlLiAgVGhhdCB3b3JrIAo+ID4+IHdhcyBkb25lIG9uIGFhcmNoNjQsIGJ1dCBzaG91bGQgYmUg
Z2VuZXJhbGx5IGFwcGxpY2FibGUgdG8gcmlzY3YgYXMgd2VsbC4KPiA+Cj4gPiBDYW4ndCB3ZSBz
aW1wbHkgbWFrZSBhIHJlYXNvbmFibGUgZ3Vlc3MvYXNzdW1wdGlvbiBqdXN0IGZvciB0aGUgcHVy
cG9zZSAKPiA+IG9mIHRvb2xpbmc/Cj4gCj4gVGhhdCByZWFzb25hYmxlIGRlZmF1bHQgZXhpc3Rz
IHRvZGF5IGFuZCBpcyA0MDk2LiAgU29tZSBlZmZvcnQgaXMKPiByZXF1aXJlZCB0byBjaGFuZ2Ug
dGhhdC4KCiBJIHRob3VnaHQgd2Ugd2VyZSB0YWxraW5nIGFib3V0IHRoZSBtYXhpbXVtIHJhdGhl
ciB0aGFuIHRoZSBkZWZhdWx0LiAgSSAKZG9uJ3QgdGhpbmsgY2hhbmdpbmcgdGhlIGRlZmF1bHQg
Y2F1c2VzIGFueSBmdXNzIGFzIGxvbmcgYXMgaXQncyBiZXR3ZWVuIApwcmV2aW91c2x5IGVzdGFi
bGlzaGVkIG1pbmltdW0gYW5kIG1heGltdW0uCgogIE1hY2llagoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
