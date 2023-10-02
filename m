Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271EDE7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgSoKPSfXcCeLXv9oP8LARsKHefZ4Tlmk9sYASmNPNA=; b=CqSQV2SaJnv09A
	tMAAfiuo6QfKrMXDsNapPPGdmuRY5Xoe8NSqPRbZxnEqDNP7JRPW29+sIN0oWOw9JjzUxEJfdg4lL
	xG9dGjXgJDyv9nDZBYstjaqgx3pbfJdQh+l3M1XnN2iGpyGcIHYoExCoRxftItx88DCzPOVYK4VQv
	GHAmAfi2suXM19ijFUbEsrOkOBU9y3tXpvPP9Gcl7zlqpAmhyD3+V7rKiVVNheuZl4eky+adHvz4b
	dtNyoQeut2sGLNLFgAWDehwCbt63YX/7G2Wqs/iLyL2a9Hu/P79Ffm46d3IWB8B9xl0sZHY195nAA
	V5DJCX7+mSFADcm9z8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJAo-00CnfL-1y;
	Mon, 02 Oct 2023 13:41:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJAk-00Cneg-2d
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 13:41:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B437AC15;
	Mon,  2 Oct 2023 06:41:53 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.28.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 279FA3F59C;
	Mon,  2 Oct 2023 06:41:13 -0700 (PDT)
Date: Mon, 2 Oct 2023 14:41:05 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Edward AD <twuufnxlz@gmail.com>, alex@ghiti.fr, aou@eecs.berkeley.edu,
	conor@kernel.org, gregkh@linuxfoundation.org, guoren@kernel.org,
	jirislaby@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
	liushixin2@huawei.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] Test for riscv fixes
Message-ID: <ZRrIcaa-2Co2cSJm@FVFF77S0Q05N.cambridge.arm.com>
References: <CAHVXubhG2c=ShFHF4hMMFm8=BYDTyDUduOizujbUWQBW+55wTw@mail.gmail.com>
 <20230929230549.45206-2-twuufnxlz@gmail.com>
 <CAHVXubiBVKJ89fBtV1fvEpoOyLvdvjkWfeDmw2yZsod5ao9hPw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHVXubiBVKJ89fBtV1fvEpoOyLvdvjkWfeDmw2yZsod5ao9hPw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_064118_969453_55409C68 
X-CRM114-Status: GOOD (  28.74  )
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

T24gTW9uLCBPY3QgMDIsIDIwMjMgYXQgMDk6MTM6NTJBTSArMDIwMCwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+IEhpIEVkd2FyZCwKPiAKPiBPbiBTYXQsIFNlcCAzMCwgMjAyMyBhdCAxOjA24oCv
QU0gRWR3YXJkIEFEIDx0d3V1Zm54bHpAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBIaSBBbGV4
YW5kcmUsCj4gPgo+ID4gT24gRnJpLCAyOSBTZXAgMjAyMyAxMDoyNTo1OSArMDIwMCBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiBJJ20gc3RpbGwg
bm90IGNvbnZpbmNlZCB0aGlzIHdpbGwgZml4IHRoZSBrYXNhbiBvdXQtb2YtYm91bmRzCj4gPiA+
IGFjY2Vzc2VzLCB0aGUgcGFnZSBjYW4gYmUgdmFsaWQgYnV0IHRoZSByZWFkIGNhbiBoYXBwZW4g
YXQgYW4gb2Zmc2V0Cj4gPiA+IG5vdCBpbml0aWFsaXplZCBhbmQgdHJpZ2dlciBzdWNoIGVycm9y
cyByaWdodD8gSSBzdGlsbCB0aGluayB0aGVyZSBpcwo+ID4gPiBzb21ldGhpbmcgd2VpcmQgYWJv
dXQgdGhlIHN0YWNrIGZyYW1lLCBhcyB0byBtZSB0aGlzIHNob3VsZCBub3QgaGFwcGVuCj4gPiA+
IChidXQgYWRtaXR0ZWRseSBJIGRvbid0IGtub3cgbXVjaCBhYm91dCB0aGF0KS4KPiA+IFRoZSBh
ZGRlZCBjaGVjayBjYW4gY29uZmlybSB0aGF0IHRoZSBwaHlzaWNhbCBwYWdlIGlzIGludmFsaWQg
KHdoZXRoZXIgaXQgaXMgYQo+ID4gdm1hbGxvYyBhbGxvY2F0ZWQgcGFnZSBvciBhIHNsYWIgYWxs
b2NhdGVkIHBhZ2UpLCBhbmQgZXhpdCB0aGUgZm9yIGxvb3Agd2hlbiBpdCBpcyBpbnZhbGlkLgo+
IAo+IFllcywgYnV0IHRvIG1lIHRoaXMgaXMgbm90IHdoYXQgaGFwcGVucyBpbiB0aGUgYnVnIHJl
cG9ydCB5b3UgbGluazoKPiAKPiB8IEJVRzogS0FTQU46IG91dC1vZi1ib3VuZHMgaW4gd2Fsa19z
dGFja2ZyYW1lKzB4MTMwLzB4MmYyCj4gYXJjaC9yaXNjdi9rZXJuZWwvc3RhY2t0cmFjZS5jOjU5
Cj4gfCBSZWFkIG9mIHNpemUgOCBhdCBhZGRyIGZmMjAwMDAwMDZkMzdjMzggYnkgdGFzayBzd2Fw
cGVyLzEvMAo+IAo+IFNvIHRoZSByZWFkIGF0IGFkZHJlc3MgZmYyMDAwMDAwNmQzN2MzOCBpcyBu
b3QgIm5vcm1hbCIgYWNjb3JkaW5nIHRvCj4gS0FTQU4gKHlvdSBjYW4gc2VlIHRoZXJlIGlzIG5v
IHRyYXAsIG1lYW5pbmcgdGhlIHBoeXNpY2FsIG1hcHBpbmcKPiBleGlzdHMpLgo+IAo+IHwgVGhl
IGJ1Z2d5IGFkZHJlc3MgYmVsb25ncyB0byB0aGUgdmlydHVhbCBtYXBwaW5nIGF0Cj4gfCAgW2Zm
MjAwMDAwMDZkMzAwMDAsIGZmMjAwMDAwMDZkMzkwMDApIGNyZWF0ZWQgYnk6Cj4gfCBrZXJuZWxf
Y2xvbmUrMHgxMTgvMHg4OTYga2VybmVsL2ZvcmsuYzoyOTA5Cj4gCj4gVGhlIHZpcnR1YWwgYWRk
cmVzcyBpcyBsZWdpdGltYXRlIHNpbmNlIHRoZSB2bWEgZXhpc3RzIF4KPiAKPiB8IFRoZSBidWdn
eSBhZGRyZXNzIGJlbG9uZ3MgdG8gdGhlIHBoeXNpY2FsIHBhZ2U6Cj4gfCBwYWdlOmZmMWMwMDAw
MDI1MGRiYzAgcmVmY291bnQ6MSBtYXBjb3VudDowIG1hcHBpbmc6MDAwMDAwMDAwMDAwMDAwMAo+
IGluZGV4OjB4MCBwZm46MHg5NDM2Zgo+IAo+IEFuZCB0aGUgcGh5c2ljYWwgcGFnZSBhbHNvIGV4
aXN0cyBeCj4gCj4gU28gSSBpbnNpc3QsIGNoZWNraW5nIHRoYXQgYSBwaHlzaWNhbCBtYXBwaW5n
IGV4aXN0cyB0byBleGl0IHRoZSBsb29wCj4gaXMgbm90IGVub3VnaCwgdG8gbWUsIHRoZSBlcnJv
ciBoZXJlIGlzIHRoYXQgdGhlIGJhY2t0cmFjZSBnb2VzICJ0b28KPiBmYXIiIGF0IGFuIGFkZHJl
c3Mgd2hlcmUgbm90aGluZyB3YXMgd3JpdHRlbiBiZWZvcmUgYW5kIHRoZW4gS0FTQU4KPiBjb21w
bGFpbnMgYWJvdXQgdGhhdCwgYWdhaW4sIHdlIGRvbid0IHRha2UgYW55IHBhZ2UgZmF1bHQgaGVy
ZSBzbyBpdCdzCj4gbm90IGEgcHJvYmxlbSBvZiBleGlzdGluZyBwaHlzaWNhbCBtYXBwaW5nLgoK
WWVwIQoKSSBiZWxpZXZlIHdoYXQncyBoYXBwZW5pbmcgaGVyZSBpcyBvbmUgdGFzayB1bndpbmRp
bmcgYW5vdGhlciAoc3RhcnRpbmcgZnJvbQp3aGF0ZXZlciBnZXRzIHNhdmVkIGluIHN3aXRjaF90
bygpKSwgYW5kIHRoZXJlJ3Mgbm90aGluZyB0aGF0IHByZXZlbnRzIHRoYXQKb3RoZXIgdGFzayBm
cm9tIHJ1bm5pbmcgY29uY3VycmVudGx5IGFuZCBtb2RpZnlpbmcvcG9pc29uaW5nIGl0cyBzdGFj
ay4gSW4KZ2VuZXJhbCB0cnlpbmcgdG8gdW53aW5kIGEgcmVtb3RlIHN0YWNrIGlzIHJhY3kgYW5k
IGJyb2tlbiwgYnV0IHdlJ3JlIHN0dWNrCndpdGggYSBmZXcgYml0cyBvZiB0aGUga2VybmVsIHRy
eWluZ3RvIGRvIHRoYXQgb2NjYXNpb25hbGx5IGFuZCBzbyB0aGUgYXJjaApjb2RlIG5lZWRzIHRv
IGhhbmRsZSB0aGF0IHdpdGhvdXQgYmxvd2luZyB1cC4KCkZvciBLQVNBTiBzcGVjaWZpY2FsbHkg
eW91J2xsIG5lZWQgdG8gYWNjZXNzIHRoZSBzdGFjayB3aXRoIHVuY2hlY2tlZCBhY2Nlc3Nlcwoo
ZS5nLiB1c2luZyBSRUFEX09OQ0VfTk9DSEVDSygpIHRvIHJlYWQgdGhlIHN0cnVjdCBzdGFja2Zy
YW1lKSwgYW5kIHlvdSdsbApwcm9iYWJseSB3YW50IHRvIGFkZCBzb21lIGV4cGxpY2l0IGNoZWNr
cyB0aGF0IHBvaW50ZXJzIGFyZSB3aXRoaW4gc3RhY2sgYm91bmRzCnNpbmNlIGNvbmN1cnJlbnQg
bW9kaWZpY2F0aW9uIChvciBjb3JydXB0aW9uKSBjb3VsZCByZXN1bHQgaW4gZW50aXJlbHkgYm9n
dXMKcG9pbnRlcnMuCgpJICp0aGluayogdGhhdCB3ZSBkbyB0aGUgcmlnaHQgdGhpbmcgb24gYXJt
NjQsIHNvIHlvdSBtaWdodCB3YW50IHRvIHRha2UgYSBsb29rCmF0IGFybTY0J3MgdW53aW5kZXIg
aW4gYXJjaC9hcm02NC9rZXJuZWwvc3RhY2t0cmFjZS5jLAphcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3N0YWNrdHJhY2UuaCwgYW5kCmFyY2gvYXJtNjQvaW5jbHVkZS9hc20vc3RhY2t0cmFjZS9jb21t
b24uaC4KCk1hcmsuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
