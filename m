Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE93C25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3v2XwiF4croLwB8cM/ed7jkK1DU8+ASPvRLyfH4tpxE=; b=jXp8D323hUsOzF
	t3ZhxsYgFYwuuT7RcIqgYXLN6E3ztKfcfr5kMbsyQ1W+3n8BVkGiE3IOdAMdPUSl0CrPyZ1u9USf5
	JlWjdhlFVlwF3+Fz0/TX0zdTp/O3dTgYs0UWq1YO/22hcWAhsMutkeD2C/cnoo3Tzl4NezuNU5TkO
	4AH8dC8eZ7yI83C1hjp4T6qB4tI1mXVmHYCxaG2Od/EBQ6Tw4bIjrd8W+7EKhij2bByX0MWt1Uq/u
	qYJAEPA3dX6+eAbMIo5oT8cFb9a0C+KvHyuyaNQny68/LJX3Lh8vtFH9QxBvBf8mDEtBg48rxmKDe
	+G5THKQKSzf5z+gvqfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw486-00EvRf-0k;
	Thu, 26 Oct 2023 17:26:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw483-00EvQx-0U
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 17:26:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 82596B837C6;
	Thu, 26 Oct 2023 17:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF22CC433C7;
	Thu, 26 Oct 2023 17:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698341201;
	bh=7BAeAfW71dln/XhU+dLMLgzw3nnXeBMswiuhD606WIo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s3db95fI/eHkyzmx5IJp8Fd/n3POMb+po5Nmw5rzw1WR2hsZBiEn5HHKb6TsoPlom
	 S7irqxF2d/EQl6eTpQMMaKPyV9tani0dtK9imvy/yCvLOAienXTZImKk8Ku1f/aRa0
	 Nw4OnLdjX6eJHzclFXGU6FCZzwTa9MoSlDhE9bveYUqYAMA42vm2RmryvohRVjMdEH
	 jL5GuQ7vv9OD8IOSQqdbALt5ei7+tNzMoXqtNLmLN2I9gU9pRL4YOSLikvvoOmXIil
	 SrHMQxGhCZLAVtBGIS97p3/jSbnlyvlcnmmTHRRFuHA0wow7gHnrcXDn3/uAkx18l9
	 U7J00d24d6eJQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [RFC PATCH] genirq/matrix: Dynamic bitmap allocation
In-Reply-To: <CAK9=C2Vcbq_ReGcK51uOYp+M2hakz=9=RNHaHFMbfxhth_4cnA@mail.gmail.com>
References: <20231026101957.320572-1-bjorn@kernel.org>
 <CAK9=C2Vcbq_ReGcK51uOYp+M2hakz=9=RNHaHFMbfxhth_4cnA@mail.gmail.com>
Date: Thu, 26 Oct 2023 19:26:38 +0200
Message-ID: <87a5s5z44x.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_102643_348643_6549474F 
X-CRM114-Status: GOOD (  11.75  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gT24gVGh1LCBP
Y3QgMjYsIDIwMjMgYXQgMzo1MOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
IHdyb3RlOgo+Pgo+PiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+
Cj4+IFNvbWUgKGZ1dHVyZSkgdXNlcnMgb2YgdGhlIGlycSBtYXRyaXggYWxsb2NhdG9yLCBkbyBu
b3Qga25vdyB0aGUgc2l6ZQo+PiBvZiB0aGUgbWF0cml4IGJpdG1hcHMgYXQgY29tcGlsZSB0aW1l
Lgo+Pgo+PiBUbyBhdm9pZCB3YXN0aW5nIG1lbW9yeSBvbiB1bm5lY2Vzc2FyeSBsYXJnZSBiaXRt
YXBzLCBzaXplIHRoZSBiaXRtYXAKPj4gYXQgbWF0cml4IGFsbG9jYXRpb24gdGltZS4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+PiAtLS0K
Pj4gSGVyZSdzIGEgY2xlYW5lZCB1cCwgYm9vdCB0ZXN0ZWQsIHByb3BlciBwYXRjaC4KPj4KPj4g
VGhvbWFzLCB0aGlzIGlzIGp1c3QgRllJL1JGQy4gVGhpcyBjaGFuZ2Ugd291bGQgb25seSBtYWtl
IHNlbnNlLCBpZgo+PiB0aGUgUklTQy1WIEFJQSBzZXJpZXMgc3RhcnRzIHVzaW5nIHRoZSBJUlEg
bWF0cml4IGFsbG9jYXRvci4KPgo+IEkgaGF2ZSBkcm9wcGVkICJtdWx0aS1NU0kiIHN1cHBvcnQg
ZnJvbSB0aGUgQUlBIHYxMiBzZXJpZXMKPiBhbmQgYWxzbyBpbnRlZ3JhdGVkIHRoZSBJUlEgbWF0
cml4IGFsbG9jYXRvci4gVGhpcyBwYXRjaCBpcwo+IGluY2x1ZGVkIGluIHRoZSBBSUEgdjEyIHNl
cmllcy4KCk9rIQoKPiBGb3IgcmVmZXJlbmNlLCBsb29rIGF0IHJpc2N2X2FpYV92MTIgYnJhbmNo
IGF0Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL2xpbnV4LmdpdAo+Cj4gSSBzdGlsbCBu
ZWVkIHRvIHJlYmFzZSB0aGlzIHVwb24gZGV2aWNlIE1TSSBkb21haW4gc3VwcG9ydAo+IGZyb20g
VGhvbWFzLgoKTm90ZSB0aGF0IHRoZSBwZXItZGV2aWNlIGRvbWFpbiBzdXBwb3J0IGlzIGFscmVh
ZHkgdXBzdHJlYW0sIGl0J3Mgb25seQp0aGUgQVJNIGNsZWFudXBzIHRoYXQgYXJlIG5vdC4KCklP
VywgdGhlcmUncyBubyBuZWVkIHRvIHdhaXQgZm9yIHRoZSBBUk0gY2xlYW51cHMuIDotKQoKCkJq
w7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
