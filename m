Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96775C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 16:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKMgKuEBzyN6IBUC7IkHPvayMe9J67ffR7Mb/YwK6uI=; b=k0ji4cD70ATUhq
	iE1X1hvk44HqVcHcS+D41exQ47zKxDF1fp4a21RMDBuN7TdUKzotzozPYccxZ7uVFzFyfrr5zc3m/
	wLw/gynZaQqY5SS8/MSUIzEyJevp2tznBUqBJmE57jVdsnVmqsDMDswSBUZkNoO6EpnMUo0WpzbEy
	Cb8WNm20h9UWpEPWfN5Gku8z45soS243Te11mUfoqxM74X2YD1U/nzAc/WzKJgzHa/TRJeFpp7OZN
	Tz0zxsW5Y0MS/wsqR+2h0/aRAvhoUAOotORHoIb/GEj5oxBNPTfUt371GNuOyYpPjVgl2hkH96mCD
	MkduTGhvzMBjE0nRVh1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nADNN-006GIu-0I; Wed, 19 Jan 2022 15:59:57 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nADNJ-006GHs-PV
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 15:59:55 +0000
Received: by mail-wm1-x330.google.com with SMTP id p18so5903192wmg.4
 for <linux-riscv@lists.infradead.org>; Wed, 19 Jan 2022 07:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+vOb5yHTUTgHDDJX2OrXL/1O2I+8ETIcPsDexqsYa1Y=;
 b=fYraz93MX4Xg4NtOpfPQ59K9zOTiqFaT0QfJNRUzZde4KwXyKNXQvByB6IiFd7oaIl
 hV5QVjpdZBq6KWaOnHRlZui/ponpmAj49JbWd1Q7uGx/4H9BsrNEyngiok+2pDjp7kPz
 A7+je10EtD2nsoGw0WQ7BxkzTCWskyvqecMmZbKAw9Z3bHd+uh0oDfxzDX1BKyFir8Da
 YqgQ3KvlO0VJwTsi7XrNWKoSU18rZGG2hOQ+AqqHiLZrl5eHZG6uTQC7fYzlOCCe4unT
 oH+djtM/VcPzktfiXU8ICsIsHRWVl2iRHUlW8cvM7sr0bXAgJZMr40qeyZsjqG0rWbRe
 oJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+vOb5yHTUTgHDDJX2OrXL/1O2I+8ETIcPsDexqsYa1Y=;
 b=UKncXYIC3Q1YYpb9mOoSsyhhIkKk/1syxuCPP9Cs+Qr3Po9ZP8MhELaP5ohTbcQP3X
 GEWvUvjqUyxFr/t7+zEI9Ab4dcMLGSSmbMQhPcPEDbVGhonQg4Tsr+xVKsV+moY3d0i4
 f9qANteWJfxC+pTB0+C8/atV28CSd6Kc26Pit6EITfudQXSHD2bwCcrFss+UkjYpyhTY
 ehy9vhwXsfpajSKK2j1N1/D1tvaxbmUyS2TntUgYy04tJB+0y4Up3zkkGWb2pHHdbDoy
 CCc9MMMFxj7iHFt8LZQRSbxDmEVvx2+iIyFnsapS4Jlcp9vMQL7JDtLA6K3zJISMjQIk
 KQ3Q==
X-Gm-Message-State: AOAM532iyr406DOaskKfcwOBKg8By+vnGLPXRgVhO0CVKt5o3027fPPq
 WOjpPtB6BON6KP7mFouQLEOD3OVCQsTvj7UHLQM=
X-Google-Smtp-Source: ABdhPJxllMHmNdo+PnzLV4B/leNYKBD0RcLgdBJ9d7U41dzillp07VzmjbjOGDrtTBkD7GmO0emmpFkyrOxTSsLuAH0=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr4222288wmh.133.1642607992553; 
 Wed, 19 Jan 2022 07:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20220110165208.1826-1-jszhang@kernel.org>
 <Ydxljv2Q4YNDYRTx@xhacker>
 <CAJ+HfNiS7Ss0FJowPUrrKvuC+1Kn9gXb=VqNoqh3eWJDu=m4Mg@mail.gmail.com>
 <1b104397-8cb7-c5c2-92cb-11ce56c9a8de@iogearbox.net>
In-Reply-To: <1b104397-8cb7-c5c2-92cb-11ce56c9a8de@iogearbox.net>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 19 Jan 2022 16:59:40 +0100
Message-ID: <CAJ+HfNikH3OMH_b3=uvfSqAJZkjJabn9yipbYdnTxsh_=VDHOQ@mail.gmail.com>
Subject: Re: [PATCH riscv-next] riscv: bpf: Fix eBPF's exception tables
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Jisheng Zhang <jszhang@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 palmer@rivosinc.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, 
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Tong Tiangen <tongtiangen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_075953_857575_961ECE85 
X-CRM114-Status: UNSURE (   9.50  )
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

T24gV2VkLCAxOSBKYW4gMjAyMiBhdCAxNjo0MiwgRGFuaWVsIEJvcmttYW5uIDxkYW5pZWxAaW9n
ZWFyYm94Lm5ldD4gd3JvdGU6Cj4KWy4uLl0KPiA+IEFGQUlLLCBKaXNoZW5nJ3MgZXh0YWJsZSB3
b3JrIGlzIHN0aWxsIGluIFBhbG1lcidzIGZvci1uZXh0IHRyZWUuCj4gPgo+ID4gRGFuaWVsL0Fs
ZXhlaTogVGhpcyBlQlBGIG11c3QgZm9sbG93IGNvbW1pdCAxZjc3ZWQ5NDIyY2IgKCJyaXNjdjoK
PiA+IHN3aXRjaCB0byByZWxhdGl2ZSBleHRhYmxlIGFuZCBvdGhlciBpbXByb3ZlbWVudHMiKSwg
d2hpY2ggaXMgaW4KPiA+IFBhbG1lcidzIHRyZWUuIEl0IGNhbm5vdCBnbyB2aWEgYnBmLW5leHQu
Cj4KPiBUaGFua3MgZm9yIGxldHRpbmcgdXMga25vdywgdGhlbiBsZXRzIHJvdXRlIHRoaXMgZml4
IHZpYSBQYWxtZXIuIE1heWJlIGhlIGNvdWxkCj4gYWxzbyBhZGQgRml4ZXMgdGFncyB3aGVuIGFw
cGx5aW5nLCBzbyBzdGFibGUgY2FuIHBpY2sgaXQgdXAgbGF0ZXIgb24uCj4KCkl0IHNob3VsZG4n
dCBoYXZlIGEgZml4ZXMtdGFnLCBzaW5jZSBpdCdzIGEgbmV3IGZlYXR1cmUgZm9yIFJWLiBUaGlz
CndhcyBhZGFwdGluZyB0byB0aGF0IG5ldyBmZWF0dXJlLiBJdCBoYXNuJ3QgbWFkZSBpdCB1cHN0
cmVhbSB5ZXQgKEkKaG9wZSEpLgoKCkNoZWVycywKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
