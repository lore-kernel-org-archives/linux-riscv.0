Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4537ECD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 21:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSur2SroTri439FDRb+6/2hr/l2eVosmhADUP/SO7ww=; b=FJyJCtOuqUvwFF
	y2fhZvhCEU5OHBJYy1XzGj8F6iMldXYxsFtQIs+P4LFTz53GsmueR411OyAAI2p7eyQINPVRlXw7T
	Bq5MZNaOoAmG4y8/SJk49GCgYXJ3FeSyzEuV+tvWAHJoh9eCOGvLDXQYv3rjHORXGqu+5xnXGELbv
	1VsJeSAOKF54uPaKSfkGtN3WOCbkVFf3Gb//7qm0S+pGFWyUxK+zUmxp3ObfTb4EFh6S5xGR/77q0
	QrODUptNcHY2mBNRsrFeiw04x06lnGHz94fahzYDxKGbVKyqxUXDNOdfCvR3htWhQbQhi0+Pgu6pg
	6B/1r5Hl/lPnDhkgloqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo6D-00000005nJx-2Oiw;
	Wed, 20 May 2026 21:05:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo6C-00000005nJX-03xm;
	Wed, 20 May 2026 21:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NoQFWNK7oWAD/wrjDNQs2N+Z55W1ZBNqkdyVcG17n+A=; b=bR9HCAGSj3BuTqMtUE+DLlE2/V
	hbqFNHpAblQKp5tyrESGJToQyAt4gGSYt43sRu6JEbVNZTj0qvFZxTyoBxJ1wp0kQ5ZcRxN1nm3Rb
	gh32K03vbE/E7J0yrggnNOynCTcgltl9vPaiaVZXlPQBWE/JQgInR1dXcExZ8Iz6LVbgTlq8x52mX
	WL8vfh2Lyfw2a/Tpq2i/SXxctbJ1CzS4YgLicbHSvLU347BFYhk2464cXsmbdNSDNV+5du23ojl3E
	wPSEPslSUR5LG+Oc0B2L/jDVGsi3Or0fTJoXFl2vl9TX0JbwU5Szrew428V10FYaIsgWdHpxL5RaA
	8tHIsB1A==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPo5z-00000007aEX-3LBW;
	Wed, 20 May 2026 21:04:51 +0000
Date: Wed, 20 May 2026 22:04:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: "Liam R. Howlett" <liam@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>, akpm@linux-foundation.org,
	linux-mm@kvack.org, david@kernel.org, vbabka@kernel.org,
	rppt@kernel.org, mhocko@suse.com, jack@suse.cz, pfalcato@suse.de,
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com,
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org,
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
	bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <ag4h87CBd-gph9zX@casper.infradead.org>
References: <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
 <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
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

T24gV2VkLCBNYXkgMjAsIDIwMjYgYXQgMDY6MDE6NTZBTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiA+IGltcGxpZWQgaXMgdGhhdCB0aGUgcGVyLXZtYSBsb2NraW5nIG1heSBzdGFsbCBtbWFw
X2xvY2sgd3JpdGVzIGZvcgo+ID4gbG9uZ2VyIHRoYW4gaWYgdGhlIG1tYXBfbG9jayB3YXMgdGFr
ZW4gaW4gcmVhZCBtb2RlPyAgQmFycnksIGlzIHRoYXQKPiA+IGNvcnJlY3Q/Cj4gCj4gTm90IHRo
ZSBjYXNlIOKAlCB0aGUgYWN0dWFsIHNpdHVhdGlvbiBpcyAoaWYgd2UgbW9kaWZ5IHRoZQo+IGN1
cnJlbnQga2VybmVsIHRvIHBlcmZvcm0gSS9PIHdpdGhvdXQgcmVsZWFzaW5nIFZNQSByZWFkIGxv
Y2tzKToKPiAKPiB0aHJlYWQgMSBQRjogbG9jayB2bWExIHJlYWQgLS0tLSAgSU8gLS0tLS0gOwo+
IHRocmVhZCAyIFBGOiBsb2NrIHZtYTIgcmVhZCAtLS0tLSBJTyAtLS0tLSA7Cj4gdGhyZWFkIDMg
UEY6ICBsb2NrIHZtYTMgcmVhZCAtLS0tIElPIC0tLS0tIDsKPiB0aHJlYWQgNCBmb3JrOiAgbW1h
cF9sb2NrX3dyaXRlIC0tLS0gbG9jayB2bWExLCB2bWEyLCB2bWEzIHdyaXRlIDsKPiB0aHJlYWQg
NSA6ICB0YWtlIG1tYXBfbG9jayBmb3IgYW55IHJlYWQvd3JpdGUgcmVhc29uCj4gCj4gTm93IHlv
dSBjYW4gc2VlIHRoYXQgdGhyZWFkIDQgaGFzIHRvIHdhaXQgZm9yIHRoZSBJL08gb2YKPiBWTUEx
LCBWTUEyLCBhbmQgVk1BMyB0byBjb21wbGV0ZSwgYW5kIHRocmVhZCA1IHRoZW4gaGFzIHRvCj4g
d2FpdCBmb3IgdGhyZWFkIDQgdG8gcmVsZWFzZSBtbWFwX2xvY2suIEJvdGggdGhyZWFkIDQgYW5k
Cj4gdGhyZWFkIDUgY2FuIGJlY29tZSBleHRyZW1lbHkgc2xvdywgYmVjYXVzZSBJL08gbWF5IGJl
IHN0dWNrCj4gYW55d2hlcmUgaW4gdGhlIGJpby9yZXF1ZXN0IHF1ZXVlIG9yIGZpbGVzeXN0ZW0g
R0MuCj4gCj4gU28gbm93IHdlIGhhdmUgdHdvIGNob2ljZXM6Cj4gCj4gMS4gQ2hhbmdlIGZvcmso
KSB0byBhdm9pZCB0YWtpbmcgdGhlIHZtYSB3cml0ZSBsb2NrIGZvciB2bWExLzIvMyB3aGVyZSBw
b3NzaWJsZTsKPiAyLiBLZWVwIHRoZSBjdXJyZW50IGtlcm5lbCBiZWhhdmlvciBhbmQgZHJvcCB0
aGUgVk1BIGxvY2sgYmVmb3JlIEkvTzoKCk9wdGlvbiAzOiBTYXkgdGhhdCB0aGlzIGlzIGEgdmVy
eSBzaWxseSB0aGluZyB0byBvcHRpbWlzZSBmb3IuICBJIGhhdmUgYQpoYXJkIHRpbWUgYmVsaWV2
aW5nIHRoYXQgYW55IGFwcGxpY2F0aW9uIHdpbGwgY2FyZSBhYm91dCB0aGUgbGF0ZW5jeSBvZgpm
b3JrKCksIG9yIHRoZSBsYXRlbmN5IG9mIHBhZ2UgZmF1bHRzIHdoaWxlIGl0J3MgaW4gdGhlIG1p
ZGRsZSBvZiBmb3JrKCkuCk11bHRpdGhyZWFkZWQgYXBwbGljYXRpb25zIGp1c3QgZG9uJ3QgZm9y
ayB0aGF0IG9mdGVuIQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
