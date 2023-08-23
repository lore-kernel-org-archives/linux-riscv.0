Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE72EE49AE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxpLIIr5+s3sawHn0ACKk2QgSkrBpNlB5XgcZlaDJzE=; b=chWVRq+kguhQ1C
	ez8W2DaQ6i3L1vY5TXX1GUbxg2xsYyG5S1JHTf0dQBPiLXqtLYg0ocyzbaogyPqgupUzgJ/gyrTkV
	qkg+dNPbkt4Ye4YjgwCnsvqo2pda3UH+k8NluqxwFSUDRm/pwkqY7NY2j1fZxj1PHFcY6rqNcNsFq
	2CdtFO4XCQ3ye7HVqaWUK/zsyt6H5dnYfmHwXK7UhQGtkbMHA9c81ZBtHx5rlOwdSKG5+LriGVS/J
	c0XNGO9pnhRr8MTCQ5vWe7B6aN2nDmSznQAQxcWPOTC4O2+Myb3lRXSpYWU2EmppP8n/fIICQadvX
	81iaZQ4XMJe8cgHtKtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYiQX-00HU7y-0C;
	Wed, 23 Aug 2023 07:37:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYiQU-00HU74-1a
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 07:37:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E79C36123A;
	Wed, 23 Aug 2023 07:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB316C433C7;
	Wed, 23 Aug 2023 07:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692776233;
	bh=9VDdlX8ZeyJwgIjrJNUC5vHMaGJEWMGFWPF7gHyuF/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sFnsjPljkf9KB0zqv/WPZzNfzxBNzphCuj6rJFulog22LM2Y+M5kFLsDETYqBY+1+
	 lyzXT/ICtWg9irLbvD7wI1G+vpjGwB57mVbhqNkXtr59ftOqXaiy6bk0/71UCQKXld
	 KjO7ysc9EvbKmAmcJKdIOiURkOxdGC0Yes3hwWTEOr0VNOOR20kAxxxvogYcN3sGmJ
	 UXT1AOdUGlKNpMM1FQEzJZw20naOfLsuPlP5q+Q7VpVAcO/6ECGmvRcenhuIPvtl2g
	 ZbGL4GkNPm5yCaiqb129otlnhNSyjUTjFMFMO+Wg6Pz963ppUuSVkS8bTLNRDd3AY3
	 SI5so7s5cc79g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>
Subject: Re: linux-next: Tree for Aug 21 (riscv-64 asm)
In-Reply-To: <87bkeyxmzx.fsf@all.your.base.are.belong.to.us>
References: <20230821164605.7bac05f1@canb.auug.org.au>
 <5ebf04f8-0cf6-d2b4-fb73-f51fff421b3a@infradead.org>
 <87ttsr33a8.fsf@all.your.base.are.belong.to.us>
 <0111b49a-8cdf-2c1a-bab3-d1fd647aafa6@infradead.org>
 <87bkeyxmzx.fsf@all.your.base.are.belong.to.us>
Date: Wed, 23 Aug 2023 09:37:10 +0200
Message-ID: <877cpmxl95.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_003714_574118_309BCE0E 
X-CRM114-Status: GOOD (  14.75  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JpdGVzOgo+Cj4+IEhpLAo+Pgo+PiBPbiA4LzIyLzIz
IDAxOjExLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4gUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+IHdyaXRlczoKPj4+IAo+Pj4+IE9uIDgvMjAvMjMgMjM6NDYsIFN0ZXBoZW4g
Um90aHdlbGwgd3JvdGU6Cj4+Pj4+IEhpIGFsbCwKPj4+Pj4KPj4+Pj4gQ2hhbmdlcyBzaW5jZSAy
MDIzMDgxODoKPj4+Pj4KPj4+Pgo+Pj4+IC4uL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6IElu
IGZ1bmN0aW9uICdkb19pcnEnOgo+Pj4+IC4uL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmM6Mzg0
OjE6IGVycm9yOiBzMCBjYW5ub3QgYmUgdXNlZCBpbiAnYXNtJyBoZXJlCj4+Pj4gICAzODQgfCB9
Cj4+Pj4gICAgICAgfCBeCj4+Pj4gLi4vYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmM6IEluIGZ1bmN0
aW9uICdkb19zb2Z0aXJxX293bl9zdGFjayc6Cj4+Pj4gLi4vYXJjaC9yaXNjdi9rZXJuZWwvaXJx
LmM6OTQ6MTogZXJyb3I6IHMwIGNhbm5vdCBiZSB1c2VkIGluICdhc20nIGhlcmUKPj4+PiAgICA5
NCB8IH0KPj4+PiAgICAgICB8IF4KPj4+Pgo+Pj4+Cj4+Pj4gMiBvdXQgb2YgMTAgcmlzYy12IDY0
LWJpdCBidWlsZHMgZmFpbGVkIHdpdGggdGhlc2UgZXJyb3JzLgo+Pj4+Cj4+Pj4gSXMgdGhpcyBh
IHRvb2xjaGFpbiBwcm9ibGVtIG9yIHNvbWV0aGluZyBlbHNlPwo+Pj4gCj4+PiBIbW0sIGRvIHlv
dSBoYXZlIGEgbGluayB0byBjb25maWcvdG9vbGNoYWluL2xvZywgb3Igc2ltaWxhcj8KPj4KPj4g
VGhlIGZ1bGwgcmFuZGNvbmZpZyBmaWxlIGlzIGF0dGFjaGVkLgo+Pgo+PiBUaGUgdG9vbGNoYWlu
IGlzIEFybmQncyBidWlsZCBvZiBnY2MgMTMuMS4wIGZyb206Cj4+ICAgaHR0cHM6Ly9taXJyb3Jz
LmVkZ2Uua2VybmVsLm9yZy9wdWIvdG9vbHMvY3Jvc3N0b29sLwo+PiAoeDg2XzY0IGhvc3QpCj4+
Cj4+IEhtLCBJIHNlZSB0aGF0IHRoZSBsYXRlc3QvY3VycmVudCB0aGVyZSBpcyBnY2MgMTMuMi4w
Lgo+PiBJJ2xsIHVwZ3JhZGUgbGF0ZXIgdG9kYXkuCj4KPiBUaGFua3MgUmFuZHkhIEkgY2FuIHJl
cHJvZHVjZSB3aXRoIEdDQyAxMiBvbiBteSBtYWNoaW5lLgo+Cj4gVGhlIGNvbmZpZyBoYXMKPiAg
fCAjIENPTkZJR19GUkFNRV9QT0lOVEVSIGlzIG5vdCBzZXQKPiBidXQgZm9yIHNvbWUgcmVhc29u
ICItZm5vLW9taXQtZnJhbWUtcG9pbnRlciIgaXMgcGFzc2VkIHRvIEdDQyBhbnl3YXksCj4gd2hp
Y2ggaXMgd2h5IEdDQyBjb21wbGFpbnMgYWJvdXQgczAgKEZQIG9uIFJJU0MtVikgaW4gYXNtLgo+
Cj4KPiBJJ2xsIGRpZyBhIGJpdCBtb3JlLgoKVGhlcmUgYXJlIG11bHRpcGxlIGlzc3VlczoKICog
cmlzY3YgZW5hYmxlcyAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciB1bmNvbmRpdGlvbmFsbHkgZm9y
IFBFUkZfRVZFTlRTCiAqIENPTkZJR19GVU5DVElPTl9UUkFDRVIgdy9vIGR5bmFtaWMgZnRyYWNl
IGVuYWJsZXMgLXBnLCB3aGljaCBwdWxscyBpbgogICAtZm5vLW9taXQtZnJhbWUtcG9pbnRlciBv
biByaXNjdi4KCkJqw7ZybgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
