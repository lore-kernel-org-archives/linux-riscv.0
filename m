Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C30C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jiyfBBhIyFux/PlO++0qzo+jypiJNH3A/n12Bqfg9Gs=; b=UqPPi9q0GBWZid
	Tb7G+gX8blAmPZ/FZX0oWtdTYba7XZzEtGZrcjCJ9U77Q39vR5gsqknktOUhgEF57zk9UrO0iRlsi
	hL30zidI66hPkTIdEAm52S/JLps0HG+kge5RImFLLwkdYdKesV+EsxjJw+Bj1hSDNSvrXWFKNi25R
	ZLSz6Fm5FgcjMWmgO9K3C+eptLdlyWpZVMhB6/PAP+1wp+PcUQcbGThgPJvKKnhEBEF13hlKW+Wrl
	RMW4611oZ9362jNG7W3g8swj7Q2zMBLKSzmK+Ao3PoNzNwHql2F0b8uTLz2XpGHqTtNnjEFKJQVY3
	qL0aTjZHbMBW9WsJwPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roplB-00000001XAc-25hv;
	Mon, 25 Mar 2024 19:13:29 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropl7-00000001X6a-0V71
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 19:13:28 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-513dc9d6938so5914547e87.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 12:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711394002; x=1711998802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bgBGkwDpvy+zR/EPv0TXmjkYIf1V+bfMcLLs2S2pnX0=;
        b=dxhv1QFxyR4d7qm8E0hYGtWKkhVFWv/JogJx4hk5jHxm9WzhMRzDE5Y3i2ITx888Fq
         0GaYXpuV+S3d4sObymJe3j7UbGmrr6q6hyl6MgxufupYV6b0ZMA3Qh1wxFdiOfWB3KkK
         kmhRs27MQIRDxDp2Ra4PYDCB5PdX9+Z1u5/QhqMxr81857P2FOhZyI0qP9mHVu4bobKv
         s7B8WDHhRgbs5z3zPlrXe9QdJLHnoXrLBm92wOydvEhFXWIU4q/0485tfXtukmcAOMkc
         O+60Hh8LqRN3fLLfoZpEMvcdgiUJRpiySkr9cR5n2wbNVCjrqSzi15oklP/fFWXCUJxI
         OCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394002; x=1711998802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgBGkwDpvy+zR/EPv0TXmjkYIf1V+bfMcLLs2S2pnX0=;
        b=lCkiKoYyZzAgU68kNiymO4HJwwzc8PLwX/7gquD54HtC70i1kRmdNx5fOHqFPYY+DL
         lUw+FepketkUcer4e52pzLlmDLG9zhZBCVEPWXiwoYRXVEKlRcHlR+KhOJncw7/JVtta
         iNkAeLn6ym8clbXm9/FfSgt4weN9VxGBtHZuM2Pw3MqVMXmsTTvkqvQQI50YSWYSv/Yd
         nlqUtt0HZlKQMtrpsZpxVgD26CBBa/Pvl+2ECKe6kpsg2OtMhbRpTjLysh6yLCXntC8c
         7MOA3TrqQSl0WvZx+wjalG69hv/h1B7AX/AVpXTFd+07Z9jR0D4fZEh+OhN6ygIo7I6K
         Si6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYcwj8KFq1H7CmwixaXSp6VlSRC9TkrpWSLYpnDoFdhRm0da9aCRyC+LTYCIKAaOKWVhfJN+ZpnWDNrE1G1rgGxtgoJQPIFvat6yB3GzFz
X-Gm-Message-State: AOJu0YzWg7y2222eKPmgHX2mdGpkVX9u+XJsz0zzfFHw3/Q4EU9NKD7P
	T+xa6UwhXVbC8GUtvQv7SDyMOLgIG47Qv33nW8KAEXp3pNmcvB5TXafw4IQBJfCREi+V8B44iiS
	j3KaXx2M3V9EUkhfU4ZhDs5Y2NUQ=
X-Google-Smtp-Source: AGHT+IHC9129UFHKLJVWu59KlrBAFQHjuLJAPXRcIMITBR/y3yl7B/1mDZtCo+FXr/nzrNpi9QW3jmAQMdPb19b2ZOc=
X-Received: by 2002:a05:6512:328a:b0:513:cc25:d3b5 with SMTP id
 p10-20020a056512328a00b00513cc25d3b5mr5423878lfe.7.1711394001477; Mon, 25 Mar
 2024 12:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240325155434.65589-1-puranjay12@gmail.com> <20240325155434.65589-3-puranjay12@gmail.com>
 <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
In-Reply-To: <20240325-nineteen-unvaried-cb5cb5fd3a73@spud>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 25 Mar 2024 20:13:10 +0100
Message-ID: <CANk7y0gWtwN7EJ24aoY9-RB9629d5Ks-9fMc3wnAAjjERcZhFw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] bpf,riscv: Implement bpf_addr_space_cast instruction
To: Conor Dooley <conor@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_121325_245649_DC28151C 
X-CRM114-Status: GOOD (  12.86  )
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

T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgODoxMOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAyNSwgMjAyNCBhdCAwMzo1NDozNFBNICsw
MDAwLCBQdXJhbmpheSBNb2hhbiB3cm90ZToKPiA+IExMVk0gZ2VuZXJhdGVzIGJwZl9hZGRyX3Nw
YWNlX2Nhc3QgaW5zdHJ1Y3Rpb24gd2hpbGUgdHJhbnNsYXRpbmcKPiA+IHBvaW50ZXJzIGJldHdl
ZW4gbmF0aXZlICh6ZXJvKSBhZGRyZXNzIHNwYWNlIGFuZAo+ID4gX19hdHRyaWJ1dGVfXygoYWRk
cmVzc19zcGFjZShOKSkpLiBUaGUgYWRkcl9zcGFjZT0wIGlzIHJlc2VydmVkIGFzCj4gPiBicGZf
YXJlbmEgYWRkcmVzcyBzcGFjZS4KPiA+Cj4gPiByWSA9IGFkZHJfc3BhY2VfY2FzdChyWCwgMCwg
MSkgaXMgcHJvY2Vzc2VkIGJ5IHRoZSB2ZXJpZmllciBhbmQKPiA+IGNvbnZlcnRlZCB0byBub3Jt
YWwgMzItYml0IG1vdmU6IHdYID0gd1kKPiA+Cj4gPiByWSA9IGFkZHJfc3BhY2VfY2FzdChyWCwg
MSwgMCkgaGFzIHRvIGJlIGNvbnZlcnRlZCBieSBKSVQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPgo+Cj4gRG9lc24ndCBjb21waWxl
IGZvciBhbGxtb2Rjb25maWc6Cj4gICAuLi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5j
OjEwODY6NzogZXJyb3I6IGNhbGwgdG8gdW5kZWNsYXJlZCBmdW5jdGlvbiAnaW5zbl9pc19jYXN0
X3VzZXInOyBJU08gQzk5IGFuZCBsYXRlciBkbyBub3Qgc3VwcG9ydCBpbXBsaWNpdCBmdW5jdGlv
biBkZWNsYXJhdGlvbnMgWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4KPiBDaGVl
cnMsCj4gQ29ub3IuCgpZZXMsCkkgbWVudGlvbmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIgdGhhdCBh
IHBhdGNoIGlzIHJlcXVpcmVkLgpJdCBqdXN0IGdvdCBtZXJnZWQgaW4gYnBmLW5leHQvbWFzdGVy
OgpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icGYvYnBm
LW5leHQuZ2l0L2NvbW1pdC8/aWQ9NzcwNTQ2YWU5ZjRjMWFlMWViY2FmMDg3NGYwZGQ5NjMxZDc3
ZWM5NwoKU28sIHJlYmFzaW5nIG9uIHRoZSBsYXRlc3QgYnBmLW5leHQvbWFzdGVyIHNob3VsZCBm
aXggdGhlIGlzc3VlLgoKVGhhbmtzLApQdXJhbmpheQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
