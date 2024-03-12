Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D94C5475B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RVD/LGUnJUFExxgFyFXCoCjbIW/uYtPeeJ+EVEna33g=; b=YPFkB3HNjik9wP
	z1m1Q2Zv3NeIpcHmIp7Uuh/cCKNK3qhOwhOoNpqrHIOWKIgHezQ0fmqwPL1pIcuG6eTBIr9TvN8mA
	7JHGRLgwqnorekNgasZQ0x18lQnhezKk6Tu8CA/e1J0BHf4R3jFLvf+19X+2DuDJFbolSBT7lH7bG
	BCJgMBWgkc9X2Kpbl6d0v4e4IMU5m3sUqlR2gJ0YEVTG4hlvfXnPb0t2jCYEjn5lY0tjHj0+/lrO0
	yLa6Bua5V3hOVVeBTgZSpZqLkHUlxT12krzOxTnqyIB2NCu3/UkM7vwGMny4y+RZqV2076kPGnQ92
	l39aApy2SrrYjYk+JG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrLT-00000003tiO-1n5F;
	Tue, 12 Mar 2024 01:54:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrL7-00000003tap-02uq
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 01:54:21 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e5eaf5bb3eso3932548b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 18:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710208436; x=1710813236; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+8U24REJsycoMY3gapLXd6No4Kdp5va5OvGqVZaNtY=;
        b=XZ9cjYTZiIdCBpi7s+G3BdVyS19vqWom5HQW8a+xrO9tzUn8H01bQxLALJMiOj5s1f
         YgB2l8neS7RKe3jOxf532NN3CjXnhcI4JkiFgCx6K+z/IqUThslAOpzb71dPQ0Lb7M8i
         4q7IAD6JMxXPZ3vo4IKW6AAh3EKdAf9Ww6V6irACGLijgdft5N0SHoGjYuxZ/G1xD3aE
         g9FM80j6+PPTS/STcHs2A49Ed+T5kWtwkGVr7eXznWS/njIlkWGa0eOLQEwVe5ryRya2
         9mep8iPgTnZyu+SbqZjK8TnbWk96JemHNKUNmrcpfOf10aogZMFaDZwIXZJ07pQfgGYj
         2v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710208436; x=1710813236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+8U24REJsycoMY3gapLXd6No4Kdp5va5OvGqVZaNtY=;
        b=BK9Y3Y8oi8S1Yd4GayrVYkVyNjAvRcOkol3nu+x2vMsKCEVu0ZB59+x4/4x82do8ZM
         PwbjufZtnNZCGygRfrg1BfskB8qsDPwYPiedodO5o2CJomHWbWh7VbZt0EXSmU66lphw
         G8BIz1dnUzLWSrHmLtnnj7xo0tkrOWwv1oW2UhZAp9YFBnu3aRu1ZYFX1rXIUz6a0UE/
         LzKHpc4N5H/ZAvKnrrMG1JL6WNRgIx4Djp56t6yB8epOFlIJvTrC2Tz7321oYn3qd1uG
         LzNP1DyrlgNCK2RBIn9EccZ1S6Ax7uBavWS7q9gy13J2kuvJUlanhEhpEIdi22eiGoKs
         /avg==
X-Forwarded-Encrypted: i=1; AJvYcCV46nVjZUNfFsDjQh6aBDKxyC45+l3gYR3LjEk/cDNn7ILGiWFunrr/AHBDtBZT7KOe8eh5uU/gHnnS5y8u85uR31gOHQ2DdgKAvblXegZ6
X-Gm-Message-State: AOJu0Yx3OUX8vXXym5MDQdxS5VwF4vV44Tj+MFfC/eIR/USdjvO88oEw
	5SfiGnbr1QQhoLO3bnZ77c9D0KM3D+gbe1SZ2R3CQcoNEvltWjaRk0xEYOE//hgsGeA/uY8odZ2
	bYCo6beupn5FbpEaCPWJ9qGoY9sXmY8rvqdbkhw==
X-Google-Smtp-Source: AGHT+IGOVuFmtgDB4ZKZlti8h1HNW5R33qsIGe5aBgT97QBW6StCjxMixdB7ixy5JtN/Q4HVD/m09pDHUBGfcjfmCjc=
X-Received: by 2002:a05:6a20:429a:b0:1a1:4a4c:9f5e with SMTP id
 o26-20020a056a20429a00b001a14a4c9f5emr646029pzj.49.1710208436407; Mon, 11 Mar
 2024 18:53:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-3-dongmenglong.8@bytedance.com> <CAADnVQK57PziY+xdzW=d3HaG-bn87E3p9zf7thvmqV1t0iR4Yg@mail.gmail.com>
In-Reply-To: <CAADnVQK57PziY+xdzW=d3HaG-bn87E3p9zf7thvmqV1t0iR4Yg@mail.gmail.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 09:53:45 +0800
Message-ID: <CALz3k9jNY8NmB-=qKogA=WVC1dGA=git_hy95UoJV2=KLfhb5g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 2/9] bpf: refactor the
 modules_array to ptr_array
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, Eddy Z <eddyz87@gmail.com>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	X86 ML <x86@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Quentin Monnet <quentin@isovalent.com>, 
	bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_185416_308583_DC49EF3E 
X-CRM114-Status: GOOD (  22.38  )
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

T24gVHVlLCBNYXIgMTIsIDIwMjQgYXQgOTo0OeKAr0FNIEFsZXhlaSBTdGFyb3ZvaXRvdgo8YWxl
eGVpLnN0YXJvdm9pdG92QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1hciAxMSwgMjAy
NCBhdCAyOjM04oCvQU0gTWVuZ2xvbmcgRG9uZwo+IDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2Uu
Y29tPiB3cm90ZToKPiA+Cj4gPiBSZWZhY3RvciB0aGUgc3RydWN0IG1vZHVsZXNfYXJyYXkgdG8g
bW9yZSBnZW5lcmFsIHN0cnVjdCBwdHJfYXJyYXksIHdoaWNoCj4gPiBpcyB1c2VkIHRvIHN0b3Jl
IHRoZSBwb2ludGVycy4KPiA+Cj4gPiBNZWFud2hpbGVzLCBpbnRyb2R1Y2UgdGhlIGJwZl90cnlf
YWRkX3B0cigpLCB3aGljaCBjaGVja3MgdGhlIGV4aXN0aW5nIG9mCj4gPiB0aGUgcHRyIGJlZm9y
ZSBhZGRpbmcgaXQgdG8gdGhlIGFycmF5Lgo+ID4KPiA+IFNlZW1zIGl0IHNob3VsZCBiZSBtb3Zl
ZCB0byBhbm90aGVyIGZpbGVzIGluICJsaWIiLCBhbmQgSSdtIG5vdCBzdXJlIHdoZXJlCj4gPiB0
byBhZGQgaXQgbm93LCBhbmQgbGV0J3MgbW92ZSBpdCB0byBrZXJuZWwvYnBmL3N5c2NhbGwuYyBm
b3Igbm93Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdtZW5nbG9u
Zy44QGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL2xpbnV4L2JwZi5oICAgICAg
fCAxMCArKysrKysrKysKPiA+ICBrZXJuZWwvYnBmL3N5c2NhbGwuYyAgICAgfCAzNyArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAga2VybmVsL3RyYWNlL2JwZl90cmFjZS5jIHwg
NDggKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvYnBmLmggYi9pbmNsdWRlL2xpbnV4L2JwZi5oCj4gPiBpbmRl
eCAwZjY3N2ZkY2ZjYzcuLjk5Nzc2NWNkZjQ3NCAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvYnBmLmgKPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvYnBmLmgKPiA+IEBAIC0zMDQsNiArMzA0
LDE2IEBAIHN0cnVjdCBicGZfbWFwIHsKPiA+ICAgICAgICAgczY0IF9fcGVyY3B1ICplbGVtX2Nv
dW50Owo+ID4gIH07Cj4gPgo+ID4gK3N0cnVjdCBwdHJfYXJyYXkgewo+ID4gKyAgICAgICB2b2lk
ICoqcHRyczsKPiA+ICsgICAgICAgaW50IGNudDsKPiA+ICsgICAgICAgaW50IGNhcDsKPiA+ICt9
Owo+ID4gKwo+ID4gK2ludCBicGZfYWRkX3B0cihzdHJ1Y3QgcHRyX2FycmF5ICphcnIsIHZvaWQg
KnB0cik7Cj4gPiArYm9vbCBicGZfaGFzX3B0cihzdHJ1Y3QgcHRyX2FycmF5ICphcnIsIHN0cnVj
dCBtb2R1bGUgKm1vZCk7Cj4gPiAraW50IGJwZl90cnlfYWRkX3B0cihzdHJ1Y3QgcHRyX2FycmF5
ICphcnIsIHZvaWQgKnB0cik7Cj4gPiArCj4gPiAgc3RhdGljIGlubGluZSBjb25zdCBjaGFyICpi
dGZfZmllbGRfdHlwZV9uYW1lKGVudW0gYnRmX2ZpZWxkX3R5cGUgdHlwZSkKPiA+ICB7Cj4gPiAg
ICAgICAgIHN3aXRjaCAodHlwZSkgewo+ID4gZGlmZiAtLWdpdCBhL2tlcm5lbC9icGYvc3lzY2Fs
bC5jIGIva2VybmVsL2JwZi9zeXNjYWxsLmMKPiA+IGluZGV4IGY2M2Y0ZGE0ZGI1ZS4uNGYyMzBm
ZDFmOGU0IDEwMDY0NAo+ID4gLS0tIGEva2VybmVsL2JwZi9zeXNjYWxsLmMKPiA+ICsrKyBiL2tl
cm5lbC9icGYvc3lzY2FsbC5jCj4gPiBAQCAtNDc5LDYgKzQ3OSw0MyBAQCBzdGF0aWMgdm9pZCBi
cGZfbWFwX3JlbGVhc2VfbWVtY2coc3RydWN0IGJwZl9tYXAgKm1hcCkKPiA+ICB9Cj4gPiAgI2Vu
ZGlmCj4gPgo+ID4gK2ludCBicGZfYWRkX3B0cihzdHJ1Y3QgcHRyX2FycmF5ICphcnIsIHZvaWQg
KnB0cikKPiA+ICt7Cj4gPiArICAgICAgIHZvaWQgKipwdHJzOwo+ID4gKwo+ID4gKyAgICAgICBp
ZiAoYXJyLT5jbnQgPT0gYXJyLT5jYXApIHsKPiA+ICsgICAgICAgICAgICAgICBhcnItPmNhcCA9
IG1heCgxNiwgYXJyLT5jYXAgKiAzIC8gMik7Cj4gPiArICAgICAgICAgICAgICAgcHRycyA9IGty
ZWFsbG9jX2FycmF5KGFyci0+cHRycywgYXJyLT5jYXAsIHNpemVvZigqcHRycyksIEdGUF9LRVJO
RUwpOwo+ID4gKyAgICAgICAgICAgICAgIGlmICghcHRycykKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKyAgICAgICAgICAgICAgIGFyci0+cHRycyA9IHB0
cnM7Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgYXJyLT5wdHJzW2Fyci0+Y250XSA9
IHB0cjsKPiA+ICsgICAgICAgYXJyLT5jbnQrKzsKPiA+ICsgICAgICAgcmV0dXJuIDA7Cj4gPiAr
fQo+ID4gKwo+ID4gK2Jvb2wgYnBmX2hhc19wdHIoc3RydWN0IHB0cl9hcnJheSAqYXJyLCBzdHJ1
Y3QgbW9kdWxlICptb2QpCj4KPiBEb24ndCB5b3UgbmVlZCAndm9pZCAqbW9kJyBoZXJlPwo+CgpP
b3BzLCBpdCBzaG91bGQgYmUgdm9pZCAqcHRyIGhlcmUsIG15IG1pc3Rha2V+Cgo+ID4gK3sKPiA+
ICsgICAgICAgaW50IGk7Cj4gPiArCj4gPiArICAgICAgIGZvciAoaSA9IGFyci0+Y250IC0gMTsg
aSA+PSAwOyBpLS0pIHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoYXJyLT5wdHJzW2ldID09IG1v
ZCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ID4gKyAgICAgICB9
Cj4gPiArICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICt9Cj4KPiAuLi4KPgo+ID4gLSAgICAgICAg
ICAgICAgIGtwcm9iZV9tdWx0aV9wdXRfbW9kdWxlcyhhcnIubW9kcywgYXJyLm1vZHNfY250KTsK
PiA+IC0gICAgICAgICAgICAgICBrZnJlZShhcnIubW9kcyk7Cj4gPiArICAgICAgICAgICAgICAg
a3Byb2JlX211bHRpX3B1dF9tb2R1bGVzKChzdHJ1Y3QgbW9kdWxlICoqKWFyci5wdHJzLCBhcnIu
Y250KTsKPgo+IERvIHlvdSByZWFsbHkgbmVlZCB0byB0eXBlIGNhc3Q/IENvbXBpbGVyIGRvZXNu
J3QgY29udmVydCB2b2lkKioKPiBhdXRvbWF0aWNhbGx5PwoKWWVhaCwgdGhlIGNvbXBpbGVyIHJl
cG9ydHMgZXJyb3JzIHdpdGhvdXQgdGhpcyBjYXN0aW5nLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
