Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE130C3DA66
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wBpj5kp8S1MOiehhWvE90GBxbzIyLW+0S8+uwoLfCOw=; b=DhD6xLf6I6XNw7
	gshUFt5sNUYp+dV0ofZIgd1+RpBxOTxZhaO48aaQykqHsJtsFwOxPMT5XS/W1W/nOO91uCAi6S3yx
	oG401euvupcNMsyHPHCnr8FLZr+vBXVV97RZ13eBFWcEpAUnERT6y/QYioyPzwamDpAxZZUZt0Vw3
	lZexxUrPgoDefLI3Eh7Ay7oP5/+W8cAd9Qw4oQlyiozl/xUOsNg6N8r5jYYYeWUM+fBjPwugaB6OR
	Ifj+uue74moYtujnIOvlF1IngMUySw6WsD5/GYNLys77DMaNXzvbFf8LIlhYujl296z2vAfRqyLWe
	XS+ekoRYHDm1tDuEbS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYuLF-001U9n-2B;
	Wed, 23 Aug 2023 20:20:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYuLC-001U8t-1p
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 20:20:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E25461A3F;
	Wed, 23 Aug 2023 20:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241D6C433C7;
	Wed, 23 Aug 2023 20:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692822032;
	bh=mWRrjgHFVNoHHu7TMf8MhELzUccfckHf08+JQ0fi1HY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rzGG1dM52g4MHdoa6aYpybcEJRiKIpRWJetqVfvXZziL8fxVcLfuClRN3xvfmS08Q
	 PEJfGr8vY0P/r6fjTmlYk08L7Z7ABHQFXbbebRmMFX9HMU3dk6NsprEW0xIXoW25ap
	 RoOEc/THm8X55pF/mfkICeEMqJTrx0xl3lXV+/LtLrTLKT32LpKDBLPg9aGmVrTY2n
	 8WBi6z4ArceD/6dQ00OvAvx8ehYYYsOW9jdFfqxE2GaD7fkKYDKiSSS+3jn9JSYTHl
	 oUuLK0E+mYo/KsFzU7obBgUziCTXB3Zv9gCwV7NGooKCNkYzJnFx8MDReuvpi9pIDs
	 H0NSUe17Akmzg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: suagrfillet@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, rostedt@goodmis.org, mhiramat@kernel.org, Mark
 Rutland <mark.rutland@arm.com>, guoren@kernel.org, suagrfillet@gmail.com,
 Bjorn Topel <bjorn@rivosinc.com>, jszhang@kernel.org, Conor Dooley
 <conor.dooley@microchip.com>, pulehui@huawei.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, songshuaishuai@tinylab.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH V11 0/5] riscv: Optimize function trace
In-Reply-To: <mhng-a2c88f43-3cf7-4caa-8e4a-b0fc9d7e4628@palmer-ri-x1c9a>
References: <mhng-a2c88f43-3cf7-4caa-8e4a-b0fc9d7e4628@palmer-ri-x1c9a>
Date: Wed, 23 Aug 2023 22:20:29 +0200
Message-ID: <87zg2hse7m.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_132034_695689_4CA54D2A 
X-CRM114-Status: GOOD (  18.54  )
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

UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyaXRlczoKCj4gT24gV2VkLCAx
MiBKdWwgMjAyMyAxMToxMTowOCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVsLm9yZyB3cm90ZToK
Pj4gU29uZyBTaHVhaSA8c3VhZ3JmaWxsZXRAZ21haWwuY29tPiB3cml0ZXM6Cj4+Cj4+IFsuLi5d
Cj4+Cj4+PiBBZGQgV0lUSF9ESVJFQ1RfQ0FMTFMgc3VwcG9ydCBbM10gKHBhdGNoIDMsIDQpCj4+
PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+Cj4+IFdl
J3ZlIGhhZCBzb21lIG9mZmxpc3QgZGlzY3Vzc2lvbnMsIHNvIGhlcmUncyBzb21lIGlucHV0IGZv
ciBhIHdpZGVyCj4+IGF1ZGllbmNlISBNb3N0IGltcG9ydGFudGx5LCB0aGlzIGlzIGZvciBQYWxt
ZXIsIHNvIHRoYXQgdGhpcyBzZXJpZXMgaXMKPj4gbm90IG1lcmdlZCB1bnRpbCBhIHByb3BlciBC
UEYgdHJhbXBvbGluZSBmaXggaXMgaW4gcGxhY2UuCj4+Cj4+IE5vdGUgdGhhdCB3aGF0J3MgY3Vy
cmVudGx5IHVzYWJsZSBmcm9tIEJQRiB0cmFtcG9saW5lICp3b3JrcyouIEl0J3MKPj4gd2hlbiB0
aGlzIHNlcmllcyBpcyBhZGRlZCB0aGF0IGl0IGJyZWFrcy4KPj4KPj4gVEw7RFIgVGhpcyBzZXJp
ZXMgYWRkcyBEWU5BTUlDX0ZUUkFDRV9XSVRIX0RJUkVDVF9DQUxMUywgd2hpY2ggZW5hYmxlcwo+
PiBmZW50cnkvZmV4aXQgQlBGIHRyYW1wb2xpbmUgc3VwcG9ydC4gVW5mb3J0dW5hdGVseSB0aGUK
Pj4gZmV4aXQvQlBGX1RSQU1QX0ZfU0tJUF9GUkFNRSBwYXJ0cyBvZiB0aGUgUlYgQlBGIHRyYW1w
b2xpbmUgYnJlYWtzCj4+IHdpdGggdGhpcyBhZGRpdGlvbiwgYW5kIG5lZWQgdG8gYmUgYWRkcmVz
c2VkICpwcmlvciogbWVyZ2luZyB0aGlzCj4+IHNlcmllcy4gQW4gZWFzeSB3YXkgdG8gcmVwcm9k
dWNlLCBpcyBqdXN0IGNhbGxpbmcgYW55IG9mIHRoZSBrc2VsZnRlc3QKPj4gdGVzdHMgdGhhdCB1
c2VzIGZleGl0IHBhdGNoaW5nLgo+Pgo+PiBUaGUgaXNzdWUgaXMgYXJvdW5kIHRoZSBub3Agc2Vs
ZCwgYW5kIGhvdyBhIGNhbGwgaXMgZG9uZTsgVGhlIG5vcCBzbGVkCj4+IChwYXRjaGFibGUtZnVu
Y3Rpb24tZW50cnkpIHNpemUgY2hhbmdlZCBmcm9tIDE2QiB0byA4QiBpbiBjb21taXQKPj4gNjcy
NGE3NmNmZjg1ICgicmlzY3Y6IGZ0cmFjZTogUmVkdWNlIHRoZSBkZXRvdXIgY29kZSBzaXplIHRv
IGhhbGYiKSwgYnV0Cj4+IEJQRiBjb2RlIHN0aWxsIHVzZXMgdGhlIG9sZCAxNkIuIFNvIGl0J2xs
IHdvcmsgZm9yIEJQRiBwcm9ncmFtcywgYnV0IG5vdAo+PiBmb3IgcmVndWxhciBrZXJuZWwgZnVu
Y3Rpb25zLgo+Pgo+PiBBbiBleGFtcGxlOgo+Pgo+PiAgIHwgZmZmZmZmZmY4MGZhNDE1MCA8YnBm
X2ZlbnRyeV90ZXN0MT46Cj4+ICAgfCBmZmZmZmZmZjgwZmE0MTUwOiAgICAgICAwMDAxICAgICAg
ICAgICAgICAgICAgICBub3AKPj4gICB8IGZmZmZmZmZmODBmYTQxNTI6ICAgICAgIDAwMDEgICAg
ICAgICAgICAgICAgICAgIG5vcAo+PiAgIHwgZmZmZmZmZmY4MGZhNDE1NDogICAgICAgMDAwMSAg
ICAgICAgICAgICAgICAgICAgbm9wCj4+ICAgfCBmZmZmZmZmZjgwZmE0MTU2OiAgICAgICAwMDAx
ICAgICAgICAgICAgICAgICAgICBub3AKPj4gICB8IGZmZmZmZmZmODBmYTQxNTg6ICAgICAgIDEx
NDEgICAgICAgICAgICAgICAgICAgIGFkZCAgICAgc3Asc3AsLTE2Cj4+ICAgfCBmZmZmZmZmZjgw
ZmE0MTVhOiAgICAgICBlNDIyICAgICAgICAgICAgICAgICAgICBzZCAgICAgIHMwLDgoc3ApCj4+
ICAgfCBmZmZmZmZmZjgwZmE0MTVjOiAgICAgICAwODAwICAgICAgICAgICAgICAgICAgICBhZGQg
ICAgIHMwLHNwLDE2Cj4+ICAgfCBmZmZmZmZmZjgwZmE0MTVlOiAgICAgICA2NDIyICAgICAgICAg
ICAgICAgICAgICBsZCAgICAgIHMwLDgoc3ApCj4+ICAgfCBmZmZmZmZmZjgwZmE0MTYwOiAgICAg
ICAyNTA1ICAgICAgICAgICAgICAgICAgICBhZGR3ICAgIGEwLGEwLDEKPj4gICB8IGZmZmZmZmZm
ODBmYTQxNjI6ICAgICAgIDAxNDEgICAgICAgICAgICAgICAgICAgIGFkZCAgICAgc3Asc3AsMTYK
Pj4gICB8IGZmZmZmZmZmODBmYTQxNjQ6ICAgICAgIDgwODIgICAgICAgICAgICAgICAgICAgIHJl
dAo+Pgo+PiBpcyBwYXRjaGVkIHRvOgo+Pgo+PiAgIHwgZmZmZmZmZmY4MGZhNDE1MDogIGY3MGMw
Mjk3ICAgICAgICAgICAgICAgICAgICAgYXVpcGMgICB0MCwtMTUwMjA4NTEyCj4+ICAgfCBmZmZm
ZmZmZjgwZmE0MTU0OiAgZWIwMjgyZTcgICAgICAgICAgICAgICAgICAgICBqYWxyICAgIHQwLHQw
LC0zMzYKPj4KPj4gVGhlIHJldHVybiBhZGRyZXNzIHRvIGJwZl9mZW50cnlfdGVzdDEgaXMgc3Rv
cmVkIGluIHQwIGF0IEJQRgo+PiB0cmFtcG9saW5lIGVudHJ5LiBSZXR1cm4gdG8gdGhlICpwYXJl
bnQqIGlzIGluIHJhLiBUaGUgdHJhbXBsaW5lIGhhcwo+PiB0byBkZWFsIHdpdGggdGhpcy4KPj4K
Pj4gRm9yIEJQRl9UUkFNUF9GX1NLSVBfRlJBTUUvQ0FMTF9PUklHLCB0aGUgQlBGIHRyYW1wb2xp
bmUgd2lsbCBza2lwIHRvbwo+PiBtYW55IGJ5dGVzLCBhbmQgbm90IGNvcnJlY3RseSBoYW5kbGUg
cGFyZW50IGNhbGxzLgo+Pgo+PiBGdXJ0aGVyOyBUaGUgQlBGIHRyYW1wb2xpbmUgY3VycmVudGx5
IGhhcyBhIGRpZmZlcmVudCB3YXkgb2YgcGF0Y2hpbmcKPj4gdGhlIG5vcHMgZm9yIEJQRiBwcm9n
cmFtcywgdGhhbiB3aGF0IGZ0cmFjZSBkb2VzLiBUaGF0IHNob3VsZCBiZSBjaGFuZ2VkCj4+IHRv
IG1hdGNoIHdoYXQgZnRyYWNlIGRvZXMgKGF1aXBjL2phbHIgdDApLgo+Pgo+PiBUbyBzdW1tYXJp
emU6Cj4+ICAqIEFsaWduIEJQRiBub3Agc2xlZCB3aXRoIHBhdGNoYWJsZS1mdW5jdGlvbi1lbnRy
eTogOEIuCj4+ICAqIEFkYXB0IEJQRiB0cmFtcG9saW5lIGZvciA4QiBub3Agc2xlZHMuCj4+ICAq
IEFkYXB0IEJQRiB0cmFtcG9saW5lIHQwIHJldHVybiwgcmEgcGFyZW50IHNjaGVtZS4KPgo+IFRo
YW5rcyBmb3IgZGlnZ2luZyBpbnRvIHRoaXMgb25lLCBJIGFncmVlIHdlIG5lZWQgdG8gc29ydCBv
dXQgdGhlIEJQRiAKPiBicmVha2FnZXMgYmVmb3JlIHdlIG1lcmdlIHRoaXMuICBTb3VuZHMgbGlr
ZSB0aGVyZSdzIGEgcmFiYml0IGhvbGUgaGVyZSwgCj4gYnV0IGhvcGVmdWxseSB3ZSBjYW4gZ2V0
IGl0IHNvcnRlZCBvdXQuCj4KPiBJJ3ZlIGRyb3BwZWQgdGhpcyBmcm9tIHBhdGNod29yayBhbmQg
c3VjaCwgYXMgd2UnbGwgbmVlZCBhdCBsZWFzdCAKPiBhbm90aGVyIHNwaW4uCgpQYWxtZXIsCgpU
aGUgbmVlZGVkIEJQRiBwYXRjaCBpcyB1cHN0cmVhbSBpbiB0aGUgYnBmLW5leHQgdHJlZSwgYW5k
IGhhcyBiZWVuIGZvcgphIGNvdXBsZSBvZiB3ZWVrcy4KCkkgdGhpbmsgdGhpcyBzZXJpZXMgaXMg
YSBjYW5kaWRhdGUgZm9yIFJJU0MtViAtbmV4dCEgSXQgd291bGQgaGVscApSSVNDLVYgQlBGIGEg
bG90IGluIHRlcm1zIG9mIGNvbXBsZXRlbmVzcy4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
