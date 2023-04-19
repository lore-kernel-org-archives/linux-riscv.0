Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC8EC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 07:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VD7MmHaJwFBGy3OKF8XkAgbfQaiARBFIO3MUDShErtI=; b=q/paOTCSgRKtvk
	7zJvZ2QLeCAq9FknNntDoWwT8nf/cYkmUYDHSxMsGUzq7Co+EXPMkCltAQN1Ex7DpoR8PhRjxXb67
	i3m2BadZ/WQNg6FkwWrHzuz1zvNNHQ7RujKBu2K0kXlAu9GXNM15IZtj62QHio+pPteWhtgd3/2h5
	uH2mPxsQqDedGy+9H2elWGjbXlT1Imq0x/0Xt9jsvmCKE4LdzoDw5ymsfo34tZD1mRmAshqMc2BFJ
	VEkTuKk1augkucVRLJLNjk/fbzTngrWP3gVdi6G+cOjxbmY1hq7XTw6zfKwjMWLnJlDoztoaTy7Yz
	L4owEqz43sT8G2rcMDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2TS-004SEx-1y;
	Wed, 19 Apr 2023 07:43:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2TP-004SE6-0D;
	Wed, 19 Apr 2023 07:43:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93C806393F;
	Wed, 19 Apr 2023 07:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA24C433D2;
	Wed, 19 Apr 2023 07:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681890206;
	bh=Ph+AAW24rYPBEnSvM4IgbKn1qjlAp05TGyLFtVPz7dE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OxP7OLls4SzwPY7IMv87WLFfDOQHCMYO2CpXtTAvb7oRv5oRDK6xb173pMhRPps5B
	 hmH8uzn4cABQFTr+HoheMk5wRlBLdxqixEZGurk3zbCPhg1S4bfCHokukQaukGIeMq
	 yKgJMmptnvkMv1jLo6FdctEEupRnDulN2ilAm71dMpxmFwFnaplz5RS94ywicJQIf+
	 YMreate4oQMcbCrh/U4Rt7KMsH1jOoc6I0D0j0y54WVZNaHUbIMeARC4iWTrLzvf2u
	 WVmbeKMQpLRqKQsERTy0ek6QlEYhHFg2HEegzhd3lGsdXyPuDTtbirXBgFnnn7lUrd
	 NG6SdMNWRUgHg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, "GNU C Library"
 <libc-alpha@sourceware.org>, "Andrew Waterman" <andrew@sifive.com>
Subject: Re: [PATCH -next v18 00/20] riscv: Add vector ISA support
In-Reply-To: <20230414155843.12963-1-andy.chiu@sifive.com>
References: <20230414155843.12963-1-andy.chiu@sifive.com>
Date: Wed, 19 Apr 2023 09:43:22 +0200
Message-ID: <87cz4048rp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_004327_183749_813D6E40 
X-CRM114-Status: GOOD (  24.96  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBUaGlzIHBhdGNoc2V0
IGlzIGltcGxlbWVudGVkIGJhc2VkIG9uIHZlY3RvciAxLjAgc3BlYyB0byBhZGQgdmVjdG9yIHN1
cHBvcnQKPiBpbiByaXNjdiBMaW51eCBrZXJuZWwuIFRoZXJlIGFyZSBzb21lIGFzc3VtcHRpb25z
IGZvciB0aGlzIGltcGxlbWVudGF0aW9ucy4KPgo+IDEuIFdlIGFzc3VtZSBhbGwgaGFydHMgaGFz
IHRoZSBzYW1lIElTQSBpbiB0aGUgc3lzdGVtLgo+IDIuIFdlIGRpc2FibGUgdmVjdG9yIGluIGJv
dGgga2VybmVsIGFuZCB1c2VyIHNwYWNlIFsxXSBieSBkZWZhdWx0LiBPbmx5Cj4gICAgZW5hYmxl
IGFuIHVzZXIncyB2ZWN0b3IgYWZ0ZXIgYW4gaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwIHdoZXJl
IGl0Cj4gICAgYWN0dWFsbHkgc3RhcnRzIGV4ZWN1dGluZyB2ZWN0b3IgKHRoZSBmaXJzdC11c2Ug
dHJhcCBbMl0pLgo+IDMuIFdlIGRldGVjdCAicmlzY3YsaXNhIiB0byBkZXRlcm1pbmUgd2hldGhl
ciB2ZWN0b3IgaXMgc3VwcG9ydCBvciBub3QuCj4KPiBXZSBkZWZpbmVkIGEgbmV3IHN0cnVjdHVy
ZSBfX3Jpc2N2X3ZfZXh0X3N0YXRlIGluIHN0cnVjdCB0aHJlYWRfc3RydWN0IHRvCj4gc2F2ZS9y
ZXN0b3JlIHRoZSB2ZWN0b3IgcmVsYXRlZCByZWdpc3RlcnMuIEl0IGlzIHVzZWQgZm9yIGJvdGgg
a2VybmVsIHNwYWNlCj4gYW5kIHVzZXIgc3BhY2UuCj4gIC0gSW4ga2VybmVsIHNwYWNlLCB0aGUg
ZGF0YXAgcG9pbnRlciBpbiBfX3Jpc2N2X3ZfZXh0X3N0YXRlIHdpbGwgYmUKPiAgICBhbGxvY2F0
ZWQgdG8gc2F2ZSB2ZWN0b3IgcmVnaXN0ZXJzLgo+ICAtIEluIHVzZXIgc3BhY2UsCj4gCS0gSW4g
c2lnbmFsIGhhbmRsZXIgb2YgdXNlciBzcGFjZSwgdGhlIHN0cnVjdHVyZSBpcyBwbGFjZWQKPiAJ
ICByaWdodCBhZnRlciBfX3Jpc2N2X2N0eF9oZHIsIHdoaWNoIGlzIGVtYmVkZGVkIGluIGZwIHJl
c2VydmVkCj4gCSAgYWVyYS4gVGhpcyBpcyByZXF1aXJlZCB0byBhdm9pZCBBQkkgYnJlYWsgWzJd
LiBBbmQgZGF0YXAgcG9pbnRzCj4gCSAgdG8gdGhlIGVuZCBvZiBfX3Jpc2N2X3ZfZXh0X3N0YXRl
Lgo+IAktIEluIHB0cmFjZSwgdGhlIGRhdGEgd2lsbCBiZSBwdXQgaW4gdWJ1ZiBpbiB3aGljaCB3
ZSB1c2UKPiAJICByaXNjdl92cl9nZXQoKS9yaXNjdl92cl9zZXQoKSB0byBnZXQgb3Igc2V0IHRo
ZQo+IAkgIF9fcmlzY3Zfdl9leHRfc3RhdGUgZGF0YSBzdHJ1Y3R1cmUgZnJvbS90byBpdCwgZGF0
YXAgcG9pbnRlcgo+IAkgIHdvdWxkIGJlIHplcm9lZCBhbmQgdmVjdG9yIHJlZ2lzdGVycyB3aWxs
IGJlIGNvcGllZCB0byB0aGUKPiAJICBhZGRyZXNzIHJpZ2h0IGFmdGVyIHRoZSBfX3Jpc2N2X3Zf
ZXh0X3N0YXRlIHN0cnVjdHVyZSBpbiB1YnVmLgo+Cj4gVGhpcyBwYXRjaHNldCBpcyByZWJhc2Vk
IHRvIHY2LjMtcmMxIGFuZCBpdCBpcyB0ZXN0ZWQgYnkgcnVubmluZyBzZXZlcmFsCj4gdmVjdG9y
IHByb2dyYW1zIHNpbXVsdGFuZW91c2x5LiBJdCBkZWxpdmVycyBzaWduYWxzIGNvcnJlY3RseSBp
biBhIHRlc3QKPiB3aGVyZSB3ZSBjYW4gc2VlIGEgdmFsaWQgdWNvbnRleHRfdCBpbiBhIHNpZ25h
bCBoYW5kbGVyLCBhbmQgYSBjb3JyZWN0IFYKPiBjb250ZXh0IHJldHVyaW5nIGJhY2sgZnJvbSBp
dC4gQW5kIHRoZSBwdHJhY2UgaW50ZXJmYWNlIGlzIHRlc3RlZCBieQo+IFBUUkFDRV97R0VULFNF
VH1SRUdTRVQuIExhc3RseSwgS1ZNIGlzIHRlc3RlZCBieSBydW5uaW5nIGFib3ZlIHRlc3RzIGlu
Cj4gYSBndWVzdCB1c2luZyB0aGUgc2FtZSBrZXJuZWwgaW1hZ2UuIEFsbCB0ZXN0cyBhcmUgZG9u
ZSBvbiBhbiBydjY0Z2N2Cj4gdmlydCBRRU1VLgo+Cj4gTm90ZTogcGxlYXNlIGFwcGx5IHRoZSBw
YXRjaCBhdCBbNF0gZHVlIHRvIGEgcmVncmVzc2lvbiBpbnRyb2R1Y2VkIGJ5Cj4gY29tbWl0IDU5
NmZmNGEwOWI4OSAoImNwdW1hc2s6IHJlLWludHJvZHVjZSBjb25zdGFudC1zaXplZCBjcHVtYXNr
Cj4gb3B0aW1pemF0aW9ucyIpIGJlZm9yZSB0ZXN0aW5nIHRoZSBzZXJpZXMuCj4KPiBTb3VyY2Ug
dHJlZToKPiBodHRwczovL2dpdGh1Yi5jb20vc2lmaXZlL3Jpc2N2LWxpbnV4L3RyZWUvcmlzY3Yv
Zm9yLW5leHQvdmVjdG9yLXYxOAoKQWZ0ZXIgc29tZSBvZmZsaXN0IGRpc2N1c3Npb25zLCB3ZSBt
aWdodCBoYXZlIGEgaWRlbnRpZmllZCBhCnBvdGVudGlhbCBsaWJjLT5hcHBsaWNhdGlvbiBBQkkg
YnJlYWsuCgpHaXZlbiBhbiBhcHBsaWNhdGlvbiB0aGF0IGRvZXMgY3VzdG9tIHRhc2sgc2NoZWR1
bGluZyB2aWEgYSBzaWduYWwKaGFuZGxlci4gVGhlIGFwcGxpY2F0aW9uIGJpbmFyeSBpcyBub3Qg
dmVjdG9yIGF3YXJlLCBidXQgbGliYyBpcy4gTGliYwppcyB1c2luZyB2ZWN0b3IgcmVnaXN0ZXJz
IGZvciBtZW1jcHkuIEl0J3MgYW4gIm9sZCBhcHBsaWNhdGlvbiwgbmV3CmxpYnJhcnksIG5ldyBr
ZXJuZWwiLXNjZW5hcmlvLgoKIHwgLi4uCiB8IHN0cnVjdCBjb250ZXh0ICpwMV9jdHg7CiB8IHN0
cnVjdCBjb250ZXh0ICpwMl9jdHg7CiB8IAogfCB2b2lkIHNpZ2hhbmRsZXIoaW50IHNpZywgc2ln
aW5mb190ICppbmZvLCB2b2lkICp1Y29udGV4dCkKIHwgewogfCAgIGlmIChwMV9ydW5uaW5nKQog
fCAgICAgc3dpdGNoX3RvKHAxX2N0eCwgcDJfY3R4KTsKIHwgICBpZiAocDJfcnVubmluZykKIHwg
ICAgIHN3aXRjaF90byhwMl9jdHgsIHAxX2N0eCk7CiB8IH0KIHwgCiB8IHZvaWQgcDEodm9pZCkK
IHwgewogfCAgIG1lbWNweShmb28sIGJhciwgMTcpOwogfCB9CiB8IAogfCB2b2lkIHAyKHZvaWQp
CiB8IHsKIHwgICAuLi4KIHwgfQogfCAuLi4KClRoZSBzd2l0Y2hfdG8oKSBmdW5jdGlvbiBzY2hl
ZHVsZXMgcDEoKSBhbmQgcDIoKS4gRS5nLiwgdGhlCmFwcGxpY2F0aW9uIChhc3N1bWVzIHRoYXQg
aXQpIHNhdmVzIHRoZSBjb21wbGV0ZSB0YXNrIHN0YXRlIGZyb20Kc2lnY29udGV4dCAodWNvbnRl
eHQpIHRvIHAxX2N0eCwgYW5kIHJlc3RvcmVzIHNpZ2NvbnRleHQgdG8gcDJfY3R4LCBzbwp3aGVu
IHNpZ3JldHVybiBpcyBjYWxsZWQsIHAyKCkgaXMgcnVubmluZywgYW5kIHAxKCkgaGFzIGJlZW4K
aW50ZXJydXB0ZWQuCgpUaGUgIm9sZCBhcHBsaWNhdGlvbiIgd2hpY2ggaXMgbm90IGF3YXJlIG9m
IHZlY3RvciwgaXMgbm93IHJ1biBvbiBhCnZlY3RvciBlbmFibGVkIGtlcm5lbC9nbGliYy4KCkFz
c3VtZSB0aGF0IHRoZSBzaWdoYW5kbGVyIGlzIGhpdCwgYW5kIHAxKCkgaXMgaW4gdGhlIG1pZGRs
ZSBvZiB0aGUKdmVjdG9yIG1lbWNweS4gVGhlIHN3aXRjaF90bygpIGZ1bmN0aW9uIHdpbGwgbm90
IHNhdmUgdGhlIHZlY3RvcgpzdGF0ZSwgYW5kIG5leHQgdGltZSBwMigpIGlzIHNjaGVkdWxlZCB0
byBydW4gaXQgd2lsbCBoYXZlIGluY29ycmVjdAptYWNoaW5lIHN0YXRlLgoKTm93OgoKSXMgdGhp
cyBhbiBhY3R1YWwgb3IgdGhlb3JldGljYWwgcHJvYmxlbSAoaS5lLiBhcmUgdGhlcmUgYW55CmFw
cGxpY2F0aW9ucyBpbiB0aGUgd2lsZCk/IEknZCBiZSBzdXJwcmlzZWQgaWYgaXQgd291bGQgbm90
IGJlIHRoZQpsYXR0ZXIuLi4KClJlZ2FyZGxlc3MsIGEga2VybmVsIGtub2IgZm9yIGRpc2FibGlu
ZyB2ZWN0b3IgKHN5c2N0bC9wcmN0bCkgdG8gYXZvaWQKdGhlc2Uga2luZCBvZiBicmVha3MgaXMg
bmVlZGVkIChyaWdodD8pLiBDb3VsZCB0aGlzIGtub2IgYmUgYQpmb2xsb3ctdXAgcGF0Y2ggdG8g
dGhlIGV4aXN0aW5nIHYxOCBzZXJpZXM/CgpOb3RlIHRoYXQgYXJtNjQgZG9lcyBub3Qgc3VmZmVy
IGZyb20gdGhpcyB3aXRoIFNWRSwgYmVjYXVzZSB0aGUgZGVmYXVsdAp2ZWN0b3IgbGVuZ3RoICh2
bD09MC8xMjhiKjMyKSBmaXRzIGluIHRoZSAibGVnYWN5IiBzaWdjb250ZXh0LgoKCkJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
