Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938A3C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2g5Ghrj0Rs0geZzI75/gwVS7h5xA8QNnwvKmI6DOgHE=; b=ecmJBi0C1tKO2J
	/sbxk0Kp7LkWWS0hjxdeIB/DXA/tV0K9oS9pgmtfn3HqwuZP0TI+N0ItD5NiioZ5RXrfGupojAgRV
	nB5I5etZxHb4aPYnOheOKEvDOqKSTaq28gNs5JdrsjIMCZk7XZwZUMWikl6ribOOo77n6wyxZQxGV
	pGrS+00LwUlUJXeQczrbKQaIhCJeSKRuwq/jrVrrpA6kCQJnDfWNslYNdsUqaDdRwne58isgnWNB4
	W/YVYr1ZmDa2lg2wjiIa7IkSq2lc0BK37RQaLv5Cb1jWvpIluTg8Wb8MKr4g7c+bTcuEfQWwjzo0b
	IajBzZ2f81lq6i0VBHhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm2u-006jTI-Ok; Tue, 31 Jan 2023 08:31:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm2r-006jSV-GD
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:31:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 09356B81A07
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 08:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B543EC4339B
	for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 08:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675153870;
	bh=J/q/Y3zb+IglsouU8fsWGPAsHeUL2+ei6t6E56LXfrQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cpMXWDhU2kyMz/qUfbbb6iz0QKwlGA5I7IGgu10/XDoZmuGynZVQ4WMuSZELFcgnE
	 mAxWw+26gWAPBMaNUM4pwYq9c9MIuZXeR2C3c+e/wkmrI8KQxH0hySYf5r+/X+9x/o
	 yWXI64f591cSJ7XBeiVAOQCVYd/MCrInzm/vgrqTardk/7PTVL5GqFzyS8yMgFiLHG
	 SE8dSz4f2I7viVDxClri4HZQSpTZ/nGsnv5CKUpvUzOYl7sOMCbTJBBm+EvvZczwZj
	 NkAG/erCQ/nBtgCMOhpWkRF9JWJmEatcw6z0xxYEgK77dQEvVQ0PjfKYfGe+ublbV8
	 gjoOwAdfbTgfA==
Received: by mail-ej1-f46.google.com with SMTP id p26so28122188ejx.13
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 00:31:10 -0800 (PST)
X-Gm-Message-State: AO0yUKWLc88XtIrqJpsy3H9sPI32O3jQ3Cee8PCCJ3Lcx9tEln2PnXk+
	agZmlp9cHkNtrXOXA3lxyK9VKQzE56OsTN8bL0U=
X-Google-Smtp-Source: AK7set88WiPiLLf0VHmR41OtrcA136x6n1Dq4j+rY0Rn43UvU5aKhFAzeivOYzR1DDWwOQAZ61j6gkPacHbuMs2PZfA=
X-Received: by 2002:a17:906:c41a:b0:87b:d510:77a8 with SMTP id
 u26-20020a170906c41a00b0087bd51077a8mr3958147ejz.235.1675153868975; Tue, 31
 Jan 2023 00:31:08 -0800 (PST)
MIME-Version: 1.0
References: <20230126161559.1467374-1-guoren@kernel.org> <0abbbdd4-6b85-9659-03ee-97c56a5b77c1@huawei.com>
 <CAJF2gTS0s4X_uwLaEeSqKAyRmxCR2vxRuHhz7-SP2w4bBqzr+Q@mail.gmail.com>
 <87r0vc9h4g.fsf@all.your.base.are.belong.to.us> <Y9fm+6LPXgtDSma/@FVFF77S0Q05N>
 <CAJF2gTRgze_owuWvJjnrPpBNs8+GY-km7wvHU4EuJzarQc+BPQ@mail.gmail.com> <87a61z2n55.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87a61z2n55.fsf@all.your.base.are.belong.to.us>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 31 Jan 2023 16:30:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ7ZfF7JdpxP8O6RZSvPrUqk79geXuyQLweu6U15XjAzA@mail.gmail.com>
Message-ID: <CAJF2gTQ7ZfF7JdpxP8O6RZSvPrUqk79geXuyQLweu6U15XjAzA@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobe: Optimize kprobe with accurate atomicity
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "liaochang (A)" <liaochang1@huawei.com>, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, mhiramat@kernel.org, conor.dooley@microchip.com, 
	penberg@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_003113_854805_A46A44CC 
X-CRM114-Status: GOOD (  28.35  )
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

T24gVHVlLCBKYW4gMzEsIDIwMjMgYXQgMzoxMiBQTSBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cml0ZXM6Cj4K
PiA+IE9uIE1vbiwgSmFuIDMwLCAyMDIzIGF0IDExOjQ5IFBNIE1hcmsgUnV0bGFuZCA8bWFyay5y
dXRsYW5kQGFybS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGkgQmpvcm4sCj4gPj4KPiA+PiBPbiBN
b24sIEphbiAzMCwgMjAyMyBhdCAwNDoyODoxNVBNICswMTAwLCBCasO2cm4gVMO2cGVsIHdyb3Rl
Ogo+ID4+ID4gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyaXRlczoKPiA+PiA+Cj4gPj4g
PiA+PiBJbiB0aGUgc2VyaWUgb2YgUklTQ1YgT1BUUFJPQkVTIFsxXSwgaXQgcGF0Y2hlcyBhIGxv
bmctanVtcCBpbnN0cnVjdGlvbnMgcGFpcgo+ID4+ID4gPj4gQVVJUEMvSkFMUiBpbiBrZXJuZWwg
dGV4dCwgc28gaW4gb3JkZXIgdG8gZW5zdXJlIG90aGVyIENQVXMgZG9lcyBub3QgZXhlY3V0ZQo+
ID4+ID4gPj4gaW4gdGhlIGluc3RydWN0aW9ucyB0aGF0IHdpbGwgYmUgbW9kaWZpZWQsIGl0IGlz
IHN0aWxsIG5lZWQgdG8gc3RvcCBvdGhlciBDUFVzCj4gPj4gPiA+PiB2aWEgcGF0Y2hfdGV4dCBB
UEksIG9yIHlvdSBoYXZlIGFueSBiZXR0ZXIgc29sdXRpb24gdG8gYWNoaWV2ZSB0aGUgcHVycG9z
ZT8KPiA+PiA+ID4gIC0gVGhlIHN0b3BfbWFjaGluZSBpcyBhbiBleHBlbnNpdmUgd2F5IGFsbCBh
cmNoaXRlY3R1cmVzIHNob3VsZAo+ID4+ID4gPiBhdm9pZCwgYW5kIHlvdSBjb3VsZCBrZWVwIHRo
YXQgaW4geW91ciBPUFRQUk9CRVMgaW1wbGVtZW50YXRpb24gZmlsZXMKPiA+PiA+ID4gd2l0aCBz
dGF0aWMgZnVuY3Rpb25zLgo+ID4+ID4gPiAgLSBUaGUgc3RvcF9tYWNoaW5lIGNvdWxkbid0IHdv
cmsgd2l0aCBQUkVFTVBUSU9OLCBzbyB5b3VyCj4gPj4gPiA+IGltcGxlbWVudGF0aW9uIG5lZWRz
IHRvIHdvcmsgd2l0aCAhUFJFRU1QVElPTi4KPiA+PiA+Cj4gPj4gPiAuLi5hbmQgc3RvcF9tYWNo
aW5lKCkgd2l0aCAhUFJFRU1QVElPTiBpcyBicm9rZW4gYXMgd2VsbCwgd2hlbiB5b3UncmUKPiA+
PiA+IHJlcGxhY2luZyBtdWx0aXBsZSBpbnN0cnVjdGlvbnMgKHNlZSBNYXJrJ3MgcG9zdCBhdCBb
MV0pLiBUaGUKPiA+PiA+IHN0b3BfbWFjaGluZSgpIGRhbmNlIG1pZ2h0IHdvcmsgd2hlbiB5b3Un
cmUgcmVwbGFjaW5nICpvbmUqIGluc3RydWN0aW9uLAo+ID4+ID4gbm90IG11bHRpcGxlIGFzIGlu
IHRoZSBSSVNDLVYgY2FzZS4gSSdsbCBleHBhbmQgb24gdGhpcyBpbiBhIGNvbW1lbnQgaW4KPiA+
PiA+IHRoZSBPUFRQUk9CRVMgdjYgc2VyaWVzLgo+ID4+Cj4gPj4gSnVzdCB0byBjbGFyaWZ5LCBt
eSBjb21tZW50cyBpbiBbMV0gd2VyZSBhc3N1bWluZyB0aGF0IHN0b3BfbWFjaGluZSgpIHdhcyBu
b3QKPiA+PiB1c2VkLCBpbiB3aGljaCBjYXNlIHRoZXJlIGlzIGEgcHJvYmxlbSB3aXRoIG9yIHdp
dGhvdXQgUFJFRU1QVElPTi4KPiA+Pgo+ID4+IEkgYmVsaWV2ZSB0aGF0IHdoZW4gdXNpbmcgc3Rv
cF9tYWNoaW5lKCksIHRoZSAhUFJFRU1QVElPTiBjYXNlIGlzIGZpbmUsIHNpbmNlCj4gPj4gc3Rv
cF9tYWNoaW5lKCkgc2NoZWR1bGVzIHdvcmsgcmF0aGVyIHRoYW4gcnVubmluZyB3b3JrIGluIElS
USBjb250ZXh0IG9uIHRoZQo+ID4+IGJhY2sgb2YgYW4gSVBJLCBzbyBubyBDUFVzIHNob3VsZCBi
ZSBtaWQtc2VxdW5jZSBkdXJpbmcgdGhlIHBhdGNoaW5nLCBhbmQgaXQncwo+ID4+IG5vdCBwb3Nz
aWJsZSBmb3IgdGhlcmUgdG8gYmUgdGhyZWFkcyB3aGljaCBhcmUgcHJlZW1wdGVkIG1pZC1zZXF1
ZW5jZS4KPiA+Pgo+ID4+IFRoYXQgYWxsIHNhaWQsIElJVUMgb3B0cHJvYmVzIGlzIGdvaW5nIHRv
IGRpc2FwcGVhciBvbmNlIGZwcm9iZSBpcyByZWFkeQo+ID4+IGV2ZXJ5d2hlcmUsIHNvIHRoYXQg
bWlnaHQgYmUgbW9vdC4KPiA+IFRoZSBvcHRwcm9iZXMgY291bGQgYmUgaW4gdGhlIG1pZGRsZSBv
ZiBhIGZ1bmN0aW9uLCBidXQgZnByb2JlIG11c3QgYmUKPiA+IHRoZSBlbnRyeSBvZiBhIGZ1bmN0
aW9uLCByaWdodD8KPiA+Cj4gPiBEb2VzIHlvdXIgZnByb2JlIGhlcmUgbWVhbjogPwo+ID4KPiA+
IFRoZSBMaW51eCBrZXJuZWwgY29uZmlndXJhdGlvbiBpdGVtIENPTkZJR19GUFJPQkU6Cj4gPgo+
ID4gcHJvbXB0OiBLZXJuZWwgRnVuY3Rpb24gUHJvYmUgKGZwcm9iZSkKPiA+IHR5cGU6IGJvb2wK
PiA+IGRlcGVuZHMgb246ICggQ09ORklHX0ZVTkNUSU9OX1RSQUNFUiApICYmICgKPiA+IENPTkZJ
R19EWU5BTUlDX0ZUUkFDRV9XSVRIX1JFR1MgKSAmJiAoIENPTkZJR19IQVZFX1JFVEhPT0sgKQo+
ID4gZGVmaW5lZCBpbiBrZXJuZWwvdHJhY2UvS2NvbmZpZwo+Cj4gU2VlIHRoZSBjb3ZlciBvZiBb
MV0uIEl0J3MgYWJvdXQgZGlyZWN0IGNhbGxzIGZvciBCUEYgdHJhY2luZyAoYW5kIG1vcmUpCj4g
b24gQXJtLCBhbmQgeW91J3JlIGNvbXBsZXRseSByaWdodCwgdGhhdCBpdCdzICpub3QqIHJlbGF0
ZWQgdG8gb3B0cHJvYmVzCj4gYXQgYWxsLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIyMTEwODIyMDY1MS4yNDQ5Mi0xLXJldmVzdEBjaHJvbWl1bS5vcmcvClRoeCBmb3Ig
c2hhcmluZyA6KQoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
