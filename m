Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0194DC47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zBRGqwSTk1bRXByVtxR22+VqDSxp5Ejbh1rxtVwlSw=; b=nA3OPSmfqekBnr
	9DUTOlBWJT4ZOfAXfitLmFu3+NUe6t0OPCC28yIAGx2fZ+0AQ/zfNvRM1MlEZxANEDP9VuyZwQdlP
	uzLOVqwHTEwoXBSOy87v59AfIhkFYd2OTqPlHsgCWYBR0m05v1NxZ1MCuMA2NGNNzqujxbo8QNrRw
	xa7HlZSR245Dlwtog3janok+Q5WxEL8K2MnDqaWfmQJ+bstYwKiSepFEdiZpvwutdOXJoo0trnhcT
	QPNcWM0hTxUAT8pM9Ry9y5cup8zXAlq3IgTlaaOBpl4sIgOkddf7BhHai5SYhaf+44UvzsTbbOdsz
	AUhxYQKIsDOIYMFJ6KbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU8zj-0000000A7Sa-01tJ;
	Sun, 28 Jan 2024 17:30:59 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU8zf-0000000A7RJ-3NJw
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 17:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 991ECCE0C6E;
	Sun, 28 Jan 2024 17:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C37C433C7;
	Sun, 28 Jan 2024 17:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706463047;
	bh=TrcKnw6RTm/SZmRtoNZUPC9uNj6goijl09eHns8H8rQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ws3xH1MhFp/9IvryJ1ia30C56JKvXh75sO6NrPcq1aaSx2IvpM4nlgu2l1yk7Vtiv
	 9OQADff1fWuWpGR13UlB/hM6WA/5KLTFp4Ao5xg8ZglfAp6t6xc/AAvjiPdu+dxr2f
	 6l4TtF1+FbqvmHXv6J7VwQrbVl2GC9DXt0btuKamDhChFDG3UrGNryWL3tvcenwr2O
	 2sTw8Oea0PjYacI1EkVdYSSEzZMkAARjPPKxEoIKqIKeJNmwA4KrR8V6ZYrlefOyuU
	 wV4r+RCE2+8JJX1ICM4IThQB7Nt7rLeyO1WvUjamOv9DU3E1SFQ5v19oeqk/pOuyXv
	 RDLQHBxx1O2GA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Song Liu <song@kernel.org>, Puranjay Mohan <puranjay12@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>, Pu Lehui
 <pulehui@huaweicloud.com>
Subject: Re: [PATCH bpf-next 0/3] Use bpf_prog_pack for RV64 bpf trampoline
In-Reply-To: <20240123103241.2282122-1-pulehui@huaweicloud.com>
References: <20240123103241.2282122-1-pulehui@huaweicloud.com>
Date: Sun, 28 Jan 2024 18:30:44 +0100
Message-ID: <87ttmxcqm3.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_093056_060131_CF61EF7D 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IFdlIHVzZWQgYnBm
X3Byb2dfcGFjayB0byBhZ2dyZWdhdGUgYnBmIHByb2dyYW1zIGludG8gaHVnZSBwYWdlIHRvCj4g
cmVsaWV2ZSB0aGUgaVRMQiBwcmVzc3VyZSBvbiB0aGUgc3lzdGVtLiBXZSBjYW4gYXBwbHkgaXQg
dG8gYnBmCj4gdHJhbXBvbGluZSwgYXMgU29uZyBoYWQgYmVlbiBpbXBsZW1lbnRlZCBpdCBpbiBj
b3JlIGFuZCB4ODYgWzBdLiBUaGlzCj4gcGF0Y2ggaXMgZ29pbmcgdG8gdXNlIGJwZl9wcm9nX3Bh
Y2sgdG8gUlY2NCBicGYgdHJhbXBvbGluZS4gU2luY2UgU29uZwo+IGFuZCBQdXJhbmpheSBoYXZl
IGRvbmUgYSBsb3Qgb2Ygd29yayBmb3IgYnBmX3Byb2dfcGFjayBvbiBSVjY0LAo+IGltcGxlbWVu
dGluZyB0aGlzIGZ1bmN0aW9uIHdpbGwgYmUgZWFzeS4gQnV0IG9uZSB0aGluZyB0byBtZW50aW9u
IGlzCj4gdGhhdCBlbWl0X2NhbGwgaW4gUlY2NCB3aWxsIGdlbmVyYXRlIHRoZSBtYXhpbXVtIG51
bWJlciBvZiBpbnN0cnVjdGlvbnMKPiBkdXJpbmcgZHJ5IHJ1biwgYnV0IGR1cmluZyByZWFsIHBh
dGNoaW5nIGl0IG1heSBiZSBvcHRpbWl6ZWQgdG8gMQo+IGluc3RydWN0aW9uIGR1ZSB0byBkaXN0
YW5jZS4gVGhpcyBpcyBubyBwcm9ibGVtIGFzIGl0IGRvZXMgbm90IG92ZXJmbG93Cj4gdGhlIGFs
bG9jYXRlZCBSTyBpbWFnZS4KPgo+IFRlc3RzIGFib3V0IHJlZ3VsYXIgdHJhbXBvbGluZSBhbmQg
c3RydWN0X29wcyB0cmFtcG9saW5lIGhhdmUgcGFzc2VkLCBhcwo+IHdlbGwgYXMgInRlc3RfdmVy
aWZpZXIiIHdpdGggbm8gZmFpbHVyZSBjYXNlcy4KPgo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIzMTIwNjIyNDA1NC40OTIyNTAtMS1zb25nQGtlcm5lbC5vcmcgWzBdCgpU
ZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4gI3Jpc2N2CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
