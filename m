Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53268C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 19:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+MdVxC4aulqcRpM7SB57RtxkwU6tiM7It1ILYegXME=; b=aUwtUJp/96mZws
	TSnuGSdPqJ63mxYM+1Kcygf7QmGs6z82AX7LvQ0adE+rK0FljqYsuITIfDaCB4TzWgTjYvoYpA7P8
	0dbjf0al0AGBPnL+XjFv9SfADWeJ8ZwRTQP0T2dZ3ZKUp70t/wj95I/6pl8whSQBST1bfww3u0idv
	UljQz/9s22jYEQDPKcb3nM90U6h1lidmqrBE0/vYBbialFeUS8VI/k5NFNxp825XMZVu8Y7ejwc1h
	K1nmBIlXMu4mO/+vRKNEVHH2iXACNWRSBR1hA7OKxx9IhpikGGOTpOusI9B4zZQ9vfTEk/YM1pvgc
	dzVaJ0x8ByB2qL9XmXlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqeTS-000000043gM-0FpF;
	Sat, 30 Mar 2024 19:34:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqeTO-000000043f5-49Ok;
	Sat, 30 Mar 2024 19:34:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62E81602DC;
	Sat, 30 Mar 2024 19:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE4AC433F1;
	Sat, 30 Mar 2024 19:34:33 +0000 (UTC)
Date: Sat, 30 Mar 2024 15:37:22 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa
 <jolsa@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "David S.
 Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Dave
 Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet
 <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 linux-trace-kernel@vger.kernel.org, "open list:KERNEL SELFTEST FRAMEWORK"
 <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add
 support to record and check the accessed args
Message-ID: <20240330153722.65104301@gandalf.local.home>
In-Reply-To: <CALz3k9idLX10+Gh18xWepwtgvp4VZ3zQfY4aoNXn0gCh8Fs_fA@mail.gmail.com>
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
	<20240311093526.1010158-2-dongmenglong.8@bytedance.com>
	<CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
	<CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
	<CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
	<CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
	<CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
	<CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
	<CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
	<CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
	<CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com>
	<20240328111330.194dcbe5@gandalf.local.home>
	<CALz3k9idLX10+Gh18xWepwtgvp4VZ3zQfY4aoNXn0gCh8Fs_fA@mail.gmail.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_123439_160171_4A92F196 
X-CRM114-Status: GOOD (  14.49  )
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

T24gU2F0LCAzMCBNYXIgMjAyNCAxMToxODoyOSArMDgwMArmoqbpvpnokaMgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+IHdyb3RlOgoKPiA+IElmIHlvdSByZWFsbHkgd2FudCB0byBoYXZl
IHRob3VzYW5kcyBvZiBmdW5jdGlvbnMsIHdoeSBub3QganVzdCByZWdpc3RlciBpdAo+ID4gd2l0
aCBmdHJhY2UgaXRzZWxmLiBJdCB3aWxsIGdpdmUgeW91IHRoZSBhcmd1bWVudHMgdmlhIHRoZSBm
dHJhY2VfcmVncwo+ID4gc3RydWN0dXJlLiBDYW4ndCB5b3UganVzdCByZWdpc3RlciBhIHByb2dy
YW0gYXMgdGhlIGNhbGxiYWNrPwo+ID4gIAo+IAo+IEVubm4uLi5JIGRvbid0IHVuZGVyc3RhbmQu
IFRoZSBtYWluIHB1cnBvc2UgZm9yCj4gbWUgdG8gdXNlIFRSQUNJTkcgaXM6Cj4gCj4gMS4gd2Ug
Y2FuIGRpcmVjdGx5IGFjY2VzcyB0aGUgbWVtb3J5LCB3aGljaCBpcyBtb3JlCj4gICAgZWZmaWNp
ZW50LgoKSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgdGhlIGFib3ZlLiBBY2Nlc3Mgd2hh
dCBtZW1vcnk/Cgo+IDIuIHdlIGNhbiBvYnRhaW4gdGhlIGZ1bmN0aW9uIGFyZ3MgaW4gRkVYSVQs
IHdoaWNoCj4gICAgIGtyZXRwcm9iZSBjYW4ndCBkbyBpdC4gQW5kIHRoaXMgaXMgdGhlIG1haW4g
cmVhc29uLgoKSSBkaWRuJ3QgbWVudGlvbiBrcmV0cHJvYmUuIElmIHlvdSBuZWVkIGFjY2VzcyB0
byB0aGUgZXhpdCBvZiB0aGUgZnVuY3Rpb24sCnlvdSBjYW4gdXNlIE1hc2FtaSdzIGZncmFwaCB1
cGRhdGUuCgogZmVudHJ5IC0+IGZ0cmFjZV90cmFtcG9saW5lIC0+IHlvdXJfY29kZQoKRm9yIGZn
cmFwaDoKCiBmZW50cnkgLT4gZnRyYWNlX3RyYW1wb2xpbmUgLT4gZmdyYXBoIFtzZXRzIHVwIHJl
dHVybiBjYWxsXSAtPiB5b3VyX2VudHJ5X2NvZGUKCiBmdW5jdGlvbiByZXQgLT4gZmdyYXBoX3Jl
dF9oYW5kbGVyIC0+IHlvdXJfZXhpdF9jb2RlCgpBbmQgeW91IHdpbGwgYmUgYWJsZSB0byBwYXNz
IGRhdGEgZnJvbSB0aGUgZW50cnkgdG8gdGhlIGV4aXQgY29kZSwKaW5jbHVkaW5nIHBhcmFtZXRl
cnMuCgotLSBTdGV2ZQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
