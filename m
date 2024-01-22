Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBAAC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 16:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDXk04/nUkb8pCaFjU9PPYzepzCvm3FuRAmEQP/GIjE=; b=B88LYFDro2Y83J
	xHzaZyF+2aBu+UobVVWhLmI6W+daGvwscPxeOjIXaOs5EkJO9daBnZpi8xSDYH/nZAebMVZNJF61g
	Z3O0JDgC+x4Dwo+kwqPh3OxIPSQkCfqS5R7KTmiFM+XsLU2vPmzuOuGdATT9qRRhnaCkkKxqbJrEj
	fbDZZ2TDaEG/nx8xm9etUbD76Gg230gm3ryJ4334Jo/6gNVRFlHVc9om5yY/wExb62+oGhVvionE1
	oUrBEDDHwSWr86f+jitYQ0lWp6SOSdEqhYwmUSac4kfY0ppVBZss/ubw4/kGm7sQgV0xEw5iNkmRe
	5kZ9LPPI/9oP4AV2fQ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxBc-00Cysj-22;
	Mon, 22 Jan 2024 16:30:12 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRxBX-00CypD-23
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 16:30:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F2F16CE2975;
	Mon, 22 Jan 2024 16:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48EBC433C7;
	Mon, 22 Jan 2024 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705941005;
	bh=OzGrYxrAboZ3xNAP6YdI4Gj21H01FR+mtvCInhIDFhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ye4H0itenIlvmOTqqOw+9kFyYzXK16wx1XFlVTPJt9fq+Kgp36t2JlNaFNoiTCEWC
	 5eS9z+LT1q7dljVuP2r1aozVPuACc5+yQxLH0JUwMu419BwByhMqTZqGyMAFm4badq
	 SaSawt9e67OemZmajio5b5sOHfYrTKzimqiZrG6aTQZ2VGD/DkZQKJqGW1h+OjMAtV
	 iiuP3KBY4HLcuTa7ergelTvjX1Bdc49othKQIgX7oKMFTMfP0nX3jZDeTMrfRbqqa0
	 i1lNZX/pKw5qydYjrblS66wqIE4cn5spyVU5tVhjdmnWba/LTcy1SvNPAzyLNVBiI+
	 MpBnuWubPalHA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Pu Lehui <pulehui@huaweicloud.com>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai
 Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
 <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code
 simplification for RV64 JIT
In-Reply-To: <f73cdabe-eba3-4842-8da2-a6316590eb1e@huaweicloud.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <87il3lqvye.fsf@all.your.base.are.belong.to.us>
 <baffbab8-721f-462a-8b58-64972f5eae70@huaweicloud.com>
 <878r4hqvgq.fsf@all.your.base.are.belong.to.us>
 <874jf5qudx.fsf@all.your.base.are.belong.to.us>
 <f73cdabe-eba3-4842-8da2-a6316590eb1e@huaweicloud.com>
Date: Mon, 22 Jan 2024 17:30:02 +0100
Message-ID: <87zfwxpbzp.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_083007_865880_6847757D 
X-CRM114-Status: UNSURE (   8.77  )
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

UHUgTGVodWkgPHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cml0ZXM6Cgo+IE9uIDIwMjQvMS8y
MiAyMzowNywgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2Vy
bmVsLm9yZz4gd3JpdGVzOgo+PiAKPj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNv
bT4gd3JpdGVzOgo+Pj4KPj4+PiBPbiAyMDI0LzEvMjIgMjI6MzMsIEJqw7ZybiBUw7ZwZWwgd3Jv
dGU6Cj4+Pj4+IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JpdGVzOgo+Pj4+
Pgo+Pj4+Pj4gQWRkIFpiYiBzdXBwb3J0IFswXSB0byBvcHRpbWl6ZSBjb2RlIHNpemUgYW5kIHBl
cmZvcm1hbmNlIG9mIFJWNjQgSklULgo+Pj4+Pj4gTWVhbndoaWxlLCBhZGp1c3QgdGhlIGNvZGUg
Zm9yIHVuaWZpY2F0aW9uIGFuZCBzaW1wbGlmaWNhdGlvbi4gVGVzdHMKPj4+Pj4+IHRlc3RfYnBm
LmtvIGFuZCB0ZXN0X3ZlcmlmaWVyIGhhdmUgcGFzc2VkLCBhcyB3ZWxsIGFzIHRoZSByZWxhdGl2
ZQo+Pj4+Pj4gdGVzdGNhc2VzIG9mIHRlc3RfcHJvZ3MqLgo+Pj4+Pj4KPj4+Pj4+IExpbms6IGh0
dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1iaXRtYW5pcC9yZWxlYXNlcy9kb3dubG9hZC8x
LjAuMC9iaXRtYW5pcC0xLjAuMC0zOC1nODY1ZTdhNy5wZGYgWzBdCj4+Pj4+Pgo+Pj4+Pj4gdjMg
cmVzZW5kOgo+Pj4+Pj4gLSByZXNlbmQgZm9yIG1haWwgYmUgdHJlYXRlZCBhcyBzcGFtLgo+Pj4+
Pj4KPj4+Pj4+IHYzOgo+Pj4+Pj4gLSBDaGFuZ2UgdG8gZWFybHktZXhpdCBjb2RlIHN0eWxlIGFu
ZCBtYWtlIGNvZGUgbW9yZSBleHBsaWNpdC4KPj4+Pj4KPj4+Pj4gTGVodWksCj4+Pj4+Cj4+Pj4+
IFNvcnJ5IGZvciB0aGUgZGVsYXkuIEknbSBjaGFzaW5nIGEgc3RydWN0X29wcyBSSVNDLVYgQlBG
IHJlZ3Jlc3Npb24gaW4KPj4+Pj4gNi44LXJjMSwgSSB3aWxsIG5lZWQgdG8gd3JhcCBteSBoZWFk
IGFyb3VuZCB0aGF0IHByaW9yIHJldmlld2luZwo+Pj4+PiBwcm9wZXJseS4KPj4+Pj4KPj4+Pgo+
Pj4+IE9oLCBJIGFsc28gZm91bmQgdGhlIHByb2JsZW0gd2l0aCBzdHJ1Y3Qgb3BzIGFuZCBmaXhl
ZCBpdAo+PiAKPj4gUHUsIHdpdGggeW91ciBwYXRjaCBicGZfaXRlcl9zZXRzb2Nrb3B0LCBicGZf
dGNwX2NhLCBhbmQgZHVtbXlfc3Rfb3BzCj4+IHBhc3NlcyEKPj4gCj4+IFBsZWFzZSBzcGluIGEg
cHJvcGVyIGZpeGVzIHBhdGNoLCBhbmQgZmVlbCBmcmVlIHRvIGFkZDoKPj4gCj4+IFRlc3RlZC1i
eTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+PiBBY2tlZC1ieTogQmrDtnJu
IFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPj4gCj4KPiBJcyB0aGF0IGluIGEgaHVycnk/IElm
IG5vdCwgSSB3b3VsZCBsaWtlIHRvIHNlbmQgaXQgd2l0aCB0aGUgdXBjb21pbmcgCj4gcGF0Y2hz
ZXQuCgpUaGlzIGlzIGEgc2VwYXJhdGUgZml4LCByaWdodD8gV2hhdCBwYXRjaHNldCBhcmUgeW91
IHJlZmVycmluZyB0byB3aGVyZQp0aGUgZml4IHdvdWxkIGJlIGluPwoKQXMgb2Ygbm93IDYuOC1y
YzEgaXMgYnJva2VuISBJdCB3b3VsZCBiZSBhIGdyZWF0IHdpdGggYSBmaXggYXNhcC4uLgoKCkNo
ZWVycywKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
