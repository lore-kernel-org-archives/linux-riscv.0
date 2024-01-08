Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88A2C3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lm6j95G8w9SzZtkmMpOHqChtdsCLYjeRau0w+/Ry9mc=; b=WkAXflfJbc+6nR
	kJu7cvwxiXHj0zfl854ljupf/7ipl6lXiBYcDP27v9HSR8pNQD6IoxRchMjORwgNHfs4xIB/T+xo0
	0K45N5XmaXNnQLhS2lQ7ES4fgED78KPcaQc3B5OrLHLgQ0OW+B4WcmJLhponOeQILfFqChHIY8KQN
	OmDxhRh2SVkoUtMDLUQBBSqhrB96NGNN/EUltqAVzNoU3+rpPJqqBwArqJeN3DO5cgaH2Q/H/dJuI
	qhNIUoEHaUMEdAwVT6X3I4sRVW74qzEgeAKyEsfxb0EWfkF6QCL2EYSW3Zj7Hu73Vr/5bKo0DtkLg
	a3SXvjy6yV1kO9tx+u8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMgga-003vbp-0r;
	Mon, 08 Jan 2024 03:52:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMggX-003vZv-0S
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 03:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8238F60C27;
	Mon,  8 Jan 2024 03:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE1CC433C8;
	Mon,  8 Jan 2024 03:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704685931;
	bh=BYq3nKahkpbPeIQOPmcx9Uc3nLwQ06njOG913uOBkfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8GOcf3IFxGovrEwg/JKFlh8/To76tqTnN8wmRfmzz5Zmi6m9SvJaw1zqGC/+EXlI
	 c+gkX8rY9sjE8+ugVKkfTLMmFfBWoPsW24yYUciUpomtVRn/8HxIn8vUX2o6fPXDaU
	 xbd2aDFqAL1rAy4SFN2XDGDEhlsBLq8bvzTmWxhriNJNDEoyKC7M32Key7znWWZwmE
	 PAejF0t2UU4L45zzA0AOT2HMdPFd0NDZIzw37etkYnPQt9ykYfa7Kz6H+yPaPb4Rqf
	 bBVJUYMOBlgzFd/yaHkSwLarM1tPEEFYBVlHJVmaBlcbfoQW4qxaX2uA7k6CUBZL8Y
	 wuSzDY3140Syg==
Date: Sun, 7 Jan 2024 19:52:09 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	paul.walmsley@sifive.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, bjorn@kernel.org, charlie@rivosinc.com,
	ardb@kernel.org, arnd@arndb.de, peterz@infradead.org,
	tglx@linutronix.de, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [v9, 00/10] riscv: support kernel-mode Vector
Message-ID: <20240108035209.GA212605@sol.localdomain>
References: <20231229143627.22898-1-andy.chiu@sifive.com>
 <20240105185920.GA25631@sol.localdomain>
 <CABgGipUgQS85P-PDRg9CF8LW6=VRfUVz_GJ4pZTfQN8gpB+-qA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABgGipUgQS85P-PDRg9CF8LW6=VRfUVz_GJ4pZTfQN8gpB+-qA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_195221_260521_1F5D3A86 
X-CRM114-Status: GOOD (  16.37  )
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

T24gTW9uLCBKYW4gMDgsIDIwMjQgYXQgMTE6MTY6MjdBTSArMDgwMCwgQW5keSBDaGl1IHdyb3Rl
Ogo+IE9uIFNhdCwgSmFuIDYsIDIwMjQgYXQgMjo1OeKAr0FNIEVyaWMgQmlnZ2VycyA8ZWJpZ2dl
cnNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSGkgUGFsbWVyLAo+ID4KPiA+IE9uIEZyaSwg
RGVjIDI5LCAyMDIzIGF0IDAyOjM2OjE3UE0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90ZToKPiA+ID4g
VGhpcyBzZXJpZXMgcHJvdmlkZXMgc3VwcG9ydCBydW5uaW5nIFZlY3RvciBpbiBrZXJuZWwgbW9k
ZS4KPiA+Cj4gPiBJcyB0aGVyZSBhbnkgY2hhbmNlIHRoYXQgeW91IGNhbiB0YWtlIHBhdGNoZXMg
MSBhbmQgMiBvZiB0aGlzIHNlcmllcyB2aWEgdGhlCj4gPiBSSVNDLVYgdHJlZSBmb3IgdjYuOD8g
IFRoZSB2ZWN0b3IgY3J5cHRvIHBhdGNoc2V0IGRlcGVuZHMgb24gdGhvc2UgdHdvIHBhdGNoZXMu
Cj4gCj4gUGF0Y2ggNCBpcyB2ZXJ5IGVzc2VudGlhbCBmb3Igbm9uLXByZWVtcHRpYmxlIGtlcm5l
bC1tb2RlIFZlY3RvciwKPiB1bmxlc3Mgd2Ugd2FudCB0byBiZWFyIHJlc3RvcmluZyBvdmVyaGVh
ZCBhdCBlYWNoIGtlcm5lbF92ZWN0b3JfZW5kKCkuCj4gSXQncyB+MjAwIGN5Y2xlcyBvbiBhIFZM
RU49MTI4IGhhcmR3YXJlLiBJdCBoYXBwZW5zIGFzIGxvbmcgYXMgVmVjdG9yCj4gaXMgYWxzbyB1
c2VkIGluIHVzZXItbW9kZSwgd2hpY2ggd2lsbCBiZSB2ZXJ5IGNvbW1vbi4gUGxlYXNlIGNvbnNp
ZGVyCj4gaW5jbHVkaW5nIHVwIHRvIHBhdGNoIDQgaWYgd2UgbXVzdCBzcGxpdC4KPiAKCkl0J3Mg
ZGVmaW5pdGVseSBhbiBpbXBvcnRhbnQgb3B0aW1pemF0aW9uLCBidXQgSSB3b3VsZG4ndCBjYWxs
IGl0ICJ2ZXJ5CmVzc2VudGlhbCIuICB4ODYgZGlkbid0IGltcGxlbWVudCBsYXp5IHJlc3RvcmVz
IHVudGlsIGtlcm5lbCB2NS4yLgoKTXkgaG9wZSBpcyB0aGF0IHdlIGNhbiBqdXN0IGdldCBlbm91
Z2ggbWVyZ2VkIHNvb24gdG8gdW5ibG9jayB0aGUgdmVjdG9yIGNyeXB0bwpwYXRjaHNldCwgd2hp
Y2gganVzdCBuZWVkcyBrZXJuZWxfdmVjdG9yX3tiZWdpbixlbmR9IHdpdGggc29mdGlycSBzdXBw
b3J0LiAgVGhlCnJlbWFpbmluZyBjb3JlIHZlY3RvciB3b3JrIGNhbiBoYXBwZW4gaW4gcGFyYWxs
ZWwuCgotIEVyaWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
