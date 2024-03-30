Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D2C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Mar 2024 03:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a8DhS5u8JaqbjgOOQ9PlLOhzvIXVE4KYSzBMY4BMxRU=; b=1CdBbI5LQzbgkD
	lPuTomUhCwGfc0Sr2/pv75uLonHVwASnMwU9muYOklgKLuINlLVtpaYH62lZ7qjnCjmaT+KIQMYZB
	bm81qzTrfm6cf2sF+hjoql8r7tSoJ+JpFakaM2AsTzeVNgbH7mpicBXyUz9bUjXgakdKfsSuthU1l
	x1MuJnFzIVLRCV8u8Y8kujlIdhrJCq/C49wjPTdZhpYKB/RJJY4aFwm1ZNVI1nt8jFMOqTK0jmF8+
	6/Av3JiO/j9PJqSbhpRw2vJrclWaOdU3bQkMYV76V1XFI4WvcH53gQCZLptpG9ViFiFShqdvbgqNv
	6JE6S52fRSasUM9+Gq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqPDd-00000002dh2-0uh1;
	Sat, 30 Mar 2024 03:17:21 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqPDX-00000002dfH-43Rf
	for linux-riscv@lists.infradead.org;
	Sat, 30 Mar 2024 03:17:17 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e6ca2ac094so2306802b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 20:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711768628; x=1712373428; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+7nrVQkSe14hYl8Q/RTZav7B+/IIz7y9mWl0h4nHVI=;
        b=RWLN3PgKaStd6C5i0ASv+ugGwM4UAegWEOZAXRtyVlly/anTXELpu+TqRRjfybFOD1
         B82Vqa8+gNwopbdjhGToEHUfRvkyY1LR2IBqdLspDHGxy2tNJ9NLK4h5LdKfBItoQsi6
         RA0MA4PtraFMBFbmYzg8wqsaqFTMe9S7mN+rCKcyJs40DrwzSEbXGjNXaqudXJ2xMmJs
         jqgAEwKYVnAjF0jqmfWp5U1BKNuwBlH5rJyECOy8ridtu4KJ4RYqNYbZyEEWp6AmhQRf
         LKI83Mqoydc3hpal7Acutnmn4mGm7M0JpT2xbbjwigrfj/afQcP5ggGO2LS4EeKCJamT
         ndiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711768628; x=1712373428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+7nrVQkSe14hYl8Q/RTZav7B+/IIz7y9mWl0h4nHVI=;
        b=R39ReEkZf1jE4kwk2qbtwUK36hrhMhoxXuAA1ktyHk4w+HmC/fu0Br9rXyg2Cfiew0
         vUMAzU0zuGdCLOk+VMi4hl4x3hm+2LKs3Vs9TRgEm0SNfsQ6SkqamgNu2WpVV3Cs8s+X
         bDOdTzAXzGMCkq2/7hk/Ve/XzUcjW0cD0Cku0kx0msBUsrbuvciOtvpqzqFaCYu+V6/r
         9OtfQpfxeh5U+NpBU1e0OdgK3sQ99scXMiYaIsZLVgGWnQjlDBYAuhXwDLiuUBP9ZyHQ
         M9+OVfHfxPXMp1QAhV0gt84lvm3q+3PdYN9jOdUX5zC7qwxK3wCZU5gPQC7P9jjrtsc6
         NErA==
X-Forwarded-Encrypted: i=1; AJvYcCUzOC3ab92c7/XeErpNzdwYMub2/N99pjgZ9r1R2JPDGbkyVPjXeAFu3SKb64MwlN/fMs1wVItNXyoWlCU7s+Zbrn/+SqS+lWRq/hSvakMv
X-Gm-Message-State: AOJu0Yz8mCj7wPaN4Mk/9vs2IZq6p8yEehQR8E1RI77JfHbwSZnW55Zq
	8EyWdQLAy40d3p0Ko4yv56kf1ZKZgi5mf2JVzO86EbE5k2bCPFj8QChqBQIkHlkKZAaVPLXgSTc
	p/v6c4RrhaYWqBNpMOQ6Q3rY+JrtZXLuI7knzDw==
X-Google-Smtp-Source: AGHT+IGVN8mj6fsGuWs3zLqNPpTPCwZ1MIebWhJAEg3QqqK8w6bYcTZi6CuQt3e1msFgcsuQUeuxtwR9869SV0mzVgs=
X-Received: by 2002:a05:6a21:189:b0:1a3:dc33:2e47 with SMTP id
 le9-20020a056a21018900b001a3dc332e47mr3993857pzb.4.1711768627780; Fri, 29 Mar
 2024 20:17:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-2-dongmenglong.8@bytedance.com> <CAADnVQKQPS5NcvEouH4JqZ2fKgQAC+LtcwhX9iXYoiEkF_M94Q@mail.gmail.com>
 <CALz3k9i5G5wWi+rtvHPwVLOUAXVMCiU_8QUZs87TEYgR_0wpPA@mail.gmail.com>
 <CAADnVQJ_ZCzMmT1aBsNXEBFfYNSVBdBXmLocjR0PPEWtYQrQFw@mail.gmail.com>
 <CALz3k9icPePb0c4FE67q=u1U0hrePorN9gDpQrKTR_sXbLMfDA@mail.gmail.com>
 <CAADnVQLwgw8bQ7OHBbqLhcPJ2QpxiGw3fkMFur+2cjZpM_78oA@mail.gmail.com>
 <CALz3k9g9k7fEwdTZVLhrmGoXp8CE47Q+83r-AZDXrzzuR+CjVA@mail.gmail.com>
 <CAADnVQLHpi3J6cBJ0QBgCQ2aY6fWGnVvNGdfi3W-jmoa9d1eVQ@mail.gmail.com>
 <CALz3k9g-U8ih=ycJPRbyU9x_9cp00fNkU3PGQ6jP0WJ+=uKmqQ@mail.gmail.com>
 <CALz3k9jG5Jrqw=BGjt05yMkEF-1u909GbBYrV-02W0dQtm6KQQ@mail.gmail.com> <20240328111330.194dcbe5@gandalf.local.home>
In-Reply-To: <20240328111330.194dcbe5@gandalf.local.home>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Sat, 30 Mar 2024 11:18:29 +0800
Message-ID: <CALz3k9idLX10+Gh18xWepwtgvp4VZ3zQfY4aoNXn0gCh8Fs_fA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 1/9] bpf: tracing: add support
 to record and check the accessed args
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Jiri Olsa <jolsa@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Quentin Monnet <quentin@isovalent.com>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_201716_126395_DD1BFBAE 
X-CRM114-Status: GOOD (  35.44  )
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

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTE6MTHigK9QTSBTdGV2ZW4gUm9zdGVkdCA8cm9zdGVk
dEBnb29kbWlzLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIDI4IE1hciAyMDI0IDIyOjQzOjQ2ICsw
ODAwCj4g5qKm6b6Z6JGjIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPiB3cm90ZToKPgo+
ID4gSSBoYXZlIGRvbmUgYSBzaW1wbGUgYmVuY2htYXJrIG9uIGNyZWF0aW5nIDEwMDAKPiA+IHRy
YW1wb2xpbmVzLiBJdCBpcyBzbG93LCBxdWl0ZSBzbG93LCB3aGljaCBjb25zdW1lIHVwIHRvCj4g
PiA2MHMuIFdlIGNhbid0IGRvIGl0IHRoaXMgd2F5Lgo+ID4KPiA+IE5vdywgSSBoYXZlIGEgYmFk
IGlkZWEuIEhvdyBhYm91dCB3ZSBpbnRyb2R1Y2UKPiA+IGEgImR5bmFtaWMgdHJhbXBvbGluZSI/
IFRoZSBiYXNpYyBsb2dpYyBvZiBpdCBjYW4gYmU6Cj4gPgo+ID4gIiIiCj4gPiBzYXZlIHJlZ3MK
PiA+IGJwZnMgPSB0cmFtcG9saW5lX2xvb2t1cF9pcChpcCkKPiA+IGZlbnRyeSA9IGJwZnMtPmZl
bnRyaWVzCj4gPiB3aGlsZSBmZW50cnk6Cj4gPiAgIGZlbnRyeShjdHgpCj4gPiAgIGZlbnRyeSA9
IGZlbnRyeS0+bmV4dAo+ID4KPiA+IGNhbGwgb3JpZ2luCj4gPiBzYXZlIHJldHVybiB2YWx1ZQo+
ID4KPiA+IGZleGl0ID0gYnBmcy0+ZmV4aXRzCj4gPiB3aGlsZSBmZXhpdDoKPiA+ICAgZmV4aXQo
Y3R4KQo+ID4gICBmZXhpdCA9IGZleGl0LT5uZXh0Cj4gPgo+ID4geHh4eHh4Cj4gPiAiIiIKPiA+
Cj4gPiBBbmQgd2UgbG9va3VwIHRoZSAiYnBmcyIgYnkgdGhlIGZ1bmN0aW9uIGlwIGluIGEgaGFz
aCBtYXAKPiA+IGluIHRyYW1wb2xpbmVfbG9va3VwX2lwLiBUaGUgdHlwZSBvZiAiYnBmcyIgaXM6
Cj4gPgo+ID4gc3RydWN0IGJwZl9hcnJheSB7Cj4gPiAgIHN0cnVjdCBicGZfcHJvZyAqZmVudHJp
ZXM7Cj4gPiAgc3RydWN0IGJwZl9wcm9nICpmZXhpdHM7Cj4gPiAgIHN0cnVjdCBicGZfcHJvZyAq
bW9kaWZ5X3JldHVybnM7Cj4gPiB9Cj4gPgo+ID4gV2hlbiB3ZSBuZWVkIHRvIGF0dGFjaCB0aGUg
YnBmIHByb2dBIHRvIGZ1bmN0aW9uIEEvQi9DLAo+ID4gd2Ugb25seSBuZWVkIHRvIGNyZWF0ZSB0
aGUgYnBmX2FycmF5QSwgYnBmX2FycmF5QiwgYnBmX2FycmF5Qwo+ID4gYW5kIGFkZCB0aGUgcHJv
Z0EgdG8gdGhlbSwgYW5kIGluc2VydCB0aGVtIHRvIHRoZSBoYXNoIG1hcAo+ID4gImRpcmVjdF9j
YWxsX2JwZnMiLCBhbmQgYXR0YWNoIHRoZSAiZHluYW1pYyB0cmFtcG9saW5lIiB0bwo+ID4gQS9C
L0MuIElmIGJwZl9hcnJheUEgZXhpc3QsIGp1c3QgYWRkIHByb2dBIHRvIHRoZSB0YWlsIG9mCj4g
PiBicGZfYXJyYXlBLT5mZW50cmllcy4gV2hlbiB3ZSBuZWVkIHRvIGF0dGFjaCBwcm9nQiB0bwo+
ID4gQi9DLCBqdXN0IGFkZCBwcm9nQiB0byBicGZfYXJyYXlCLT5mZW50cmllcyBhbmQKPiA+IGJw
Zl9hcnJheUItPmZlbnRyaWVzLgo+ID4KPiA+IENvbXBhcmVkIHRvIHRoZSB0cmFtcG9saW5lLCBl
eHRyYSBvdmVyaGVhZCBpcyBpbnRyb2R1Y2VkCj4gPiBieSB0aGUgaGFzaCBsb29rdXBpbmcuCj4g
Pgo+ID4gSSBoYXZlIG5vdCBiZWd1biB0byBjb2RlIHlldCwgYW5kIEkgYW0gbm90IHN1cmUgdGhl
IG92ZXJoZWFkIGlzCj4gPiBhY2NlcHRhYmxlLiBDb25zaWRlcmluZyB0aGF0IHdlIGFsc28gbmVl
ZCB0byBkbyBoYXNoIGxvb2t1cAo+ID4gYnkgdGhlIGZ1bmN0aW9uIGluIGtwcm9iZV9tdWx0aSwg
bWF5YmUgdGhlIG92ZXJoZWFkIGlzCj4gPiBhY2NlcHRhYmxlPwo+Cj4gU291bmRzIGxpa2UgeW91
IGFyZSBqdXN0IHJlY3JlYXRpbmcgdGhlIGZ1bmN0aW9uIG1hbmFnZW1lbnQgdGhhdCBmdHJhY2UK
PiBoYXMuIEl0IGFsc28gY2FuIGFkZCB0aG91c2FuZHMgb2YgdHJhbXBvbGluZXMgdmVyeSBxdWlj
a2x5LCBiZWNhdXNlIGl0IGRvZXMKPiBpdCBpbiBiYXRjaGVzLiBJdCB0YWtlcyBzcGVjaWFsIHN5
bmNocm9uaXphdGlvbiBzdGVwcyB0byBhdHRhY2ggdG8gZmVudHJ5Lgo+IGZ0cmFjZSAoYW5kIEkg
YmVsaWV2ZSBtdWx0aS1rcHJvYmVzKSB1cGRhdGVzIGFsbCB0aGUgYXR0YWNobWVudHMgZm9yIGVh
Y2gKPiBzdGVwLCBzbyB0aGUgc3luY2hyb25pemF0aW9uIG5lZWRlZCBpcyBvbmx5IGRvbmUgb25j
ZS4KPgoKWWVzLCBpdCBpcyBmYXN0IHRvIHJlZ2lzdGVyIGEgdHJhbXBvbGluZSBmb3IgYSBrZXJu
ZWwgZnVuY3Rpb24KaW4gdGhlIG1hbmFnZWQgZnRyYWNlIGluCnJlZ2lzdGVyX2ZlbnRyeS0+cmVn
aXN0ZXJfZnRyYWNlX2RpcmVjdC0+ZnRyYWNlX2FkZF9yZWNfZGlyZWN0LgpBbmQgaXQgd2lsbCBh
ZGQgdGhlIHRyYW1wb2xpbmUgdG8gdGhlIGhhc2ggdGFibGUgImRpcmVjdF9mdW5jdGlvbnMiLgoK
QW5kIHRoZSB0cmFtcG9saW5lIHdpbGwgYmUgY2FsbGVkIGluIHRoZSBmb2xsb3dpbmcKc3RlcCAo
SSdtIG5vdCBzdXJlIGlmIEkgdW5kZXJzdGFuZCBpdCBjb3JyZWN0bHkpOgoKZnRyYWNlX3JlZ3Nf
Y2FsbGVyCnwKX19mdHJhY2Vfb3BzX2xpc3RfZnVuYyAtPiBjYWxsX2RpcmVjdF9mdW5jcyAtPiBz
YXZlIHRyYW1wb2xpbmUgdG8KcHRfcmVncy0+b3JpZ2luX2F4CnwKY2FsbCBwdF9yZWdzLT5vcmln
aW5fYXggaWYgbm90IE5VTEwKClRoZSBsb2dpYyBhYm92ZSBtZWFucyB0aGF0IHdlIGNhbiBvbmx5
IGNhbGwgYQp0cmFtcG9saW5lIG9uY2UsIGFuZCBhIGtlcm5lbCBmdW5jdGlvbiBjYW4gb25seSBo
YXZlCm9uZSB0cmFtcG9saW5lLgoKVGhlIG9yaWdpbmFsIGlkZWEgb2YgbWluZSBpcyB0byByZWdp
c3RlciBhbGwgdGhlIHNoYXJlZAp0cmFtcG9saW5lIHRvIHRoZSBtYW5hZ2VkIGZ0cmFjZS4gRm9y
IGV4YW1wbGUsIGlmIHdlIGhhdmUKdGhlIHNoYXJlZCB0cmFtcG9saW5lMSBmb3IgZnVuY3Rpb24g
QS9CL0MsIGFuZCBzaGFyZWQKdHJhbXBvbGluZTIgZm9yIGZ1bmN0aW9uIEIvQy9ELCB0aGVuIEkg
cmVnaXN0ZXIgdHJhbXBvbGluZTEKYW5kIHRyYW1wb2xpbmUyIGZvciBmdW5jdGlvbiBCL0MuIEhv
d2V2ZXIsIGl0IGNhbid0IHdvcmssCmFzIHdlIGNhbid0IGNhbGwgMiB0cmFtcG9saW5lcyBmb3Ig
YSBmdW5jdGlvbi4KClRoZW4sIEkgdGhvdWdodCB0aGF0IHdlIGNvdWxkIGNyZWF0ZSBhICJkeW5h
bWljIHRyYW1wb2xpbmUiLgpUaGUgbG9naWMgZm9yIHRoZSBub24tZnRyYWNlLW1hbmFnZWQgY2Fz
ZSBpcyBzaW1wbGUsIHdlCm9ubHkgbmVlZCB0byByZXBsYWNlIHRoZSAibm9wIiBvZiBhbGwgdGhl
IHRhcmdldCBmdW5jdGlvbnMKdG8gImNhbGwgZHluYW1pY190cmFtcG9saW5lIi4gQW5kIGZvciB0
aGUgZnRyYWNlLW1hbmFnZWQKY2FzZSwgdGhlIGxvZ2ljIGlzIHRoZSBzYW1lIHRvbywgZXhjZXB0
IHRoYXQgdGhlIHRyYW1wb2xpbmUKdGhhdCB3ZSBhZGQgdG8gdGhlICJkaXJlY3RfZnVuY3Rpb25z
IiBoYXNoIGlzIHRoZQpkeW5hbWljLXRyYW1wb2xpbmU6CgpmdHJhY2VfcmVnc19jYWxsZXIKfApf
X2Z0cmFjZV9vcHNfbGlzdF9mdW5jIC0+IGNhbGxfZGlyZWN0X2Z1bmNzIC0+IHNhdmUgZHluYW1p
Yy10cmFtcG9saW5lCnRvIHB0X3JlZ3MtPm9yaWdpbl9heAp8CmNhbGwgcHRfcmVncy0+b3JpZ2lu
X2F4KGR5bmFtaWMtdHJhbXBvbGluZSkgaWYgbm90IE5VTEwKCkFuZCBpbiB0aGUgZHluYW1pYy10
cmFtcG9saW5lLCB3ZSBjYW4gY2FsbCBwcm9nMSBmb3IKQSwgY2FsbCBwcm9nMSBhbmQgcHJvZzIg
Zm9yIEIvQywgY2FsbCBwcm9nMiBmb3IgRC4KCkFuZCB0aGUgcmVnaXN0ZXIgaXMgZmFzdCBlbm91
Z2guCgo+IElmIHlvdSByZWFsbHkgd2FudCB0byBoYXZlIHRob3VzYW5kcyBvZiBmdW5jdGlvbnMs
IHdoeSBub3QganVzdCByZWdpc3RlciBpdAo+IHdpdGggZnRyYWNlIGl0c2VsZi4gSXQgd2lsbCBn
aXZlIHlvdSB0aGUgYXJndW1lbnRzIHZpYSB0aGUgZnRyYWNlX3JlZ3MKPiBzdHJ1Y3R1cmUuIENh
bid0IHlvdSBqdXN0IHJlZ2lzdGVyIGEgcHJvZ3JhbSBhcyB0aGUgY2FsbGJhY2s/Cj4KCkVubm4u
Li5JIGRvbid0IHVuZGVyc3RhbmQuIFRoZSBtYWluIHB1cnBvc2UgZm9yCm1lIHRvIHVzZSBUUkFD
SU5HIGlzOgoKMS4gd2UgY2FuIGRpcmVjdGx5IGFjY2VzcyB0aGUgbWVtb3J5LCB3aGljaCBpcyBt
b3JlCiAgIGVmZmljaWVudC4KMi4gd2UgY2FuIG9idGFpbiB0aGUgZnVuY3Rpb24gYXJncyBpbiBG
RVhJVCwgd2hpY2gKICAgIGtyZXRwcm9iZSBjYW4ndCBkbyBpdC4gQW5kIHRoaXMgaXMgdGhlIG1h
aW4gcmVhc29uLgoKVGhhbmtzIQpNZW5nbG9uZyBEb25nCgo+IEl0IHdpbGwgcHJvYmFibHkgbWFr
ZSB5b3VyIGFjY291bnRpbmcgbXVjaCBlYXNpZXIsIGFuZCBqdXN0IGxldCBmdHJhY2UKPiBoYW5k
bGUgdGhlIGZlbnRyeSBsb2dpYy4gVGhhdCdzIHdoYXQgaXQgd2FzIG1hZGUgdG8gZG8uCj4KPiAt
LSBTdGV2ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
