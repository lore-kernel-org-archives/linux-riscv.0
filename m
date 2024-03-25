Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06555C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 18:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FqYpibZdFE250qkM8XT/tIrqSAmSSrjpAsizhUsuwB8=; b=M4FMxKEBYwxIgv
	dHGvJgqDHRQqZHnp2gYC4Pank7zpb+hKSfHf9eHhCSNh6PAyGCMwrZ159OpnGuowEfKVQdaxIlY2+
	rCIJCjsbeeqSHFQVFhK7r9gA5EGR06NJhPrCtYUMchfMGuwvLOfPTGwNurc3O9tAX0sk32QtIRLYV
	jbl/a+CW+s+kCxLfJ5M1PQB5KZIWxyu8Xg6JUuYpso+tqdTGFFFTzxHyK6DL8o54gfN1OBKDFlnCV
	IbrHECtNhp2iqIqHu//hyAWe3KAtdi3w76TaAQTapEIJpgm31sdWh8IvcoSzuKc6nfHoD5NfHnK8C
	FQ7oEPfxdTREVI4tsxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rop9L-00000001Ndd-3dsi;
	Mon, 25 Mar 2024 18:34:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rop9I-00000001NcK-1bvw
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 18:34:21 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-341cf28e013so700477f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Mar 2024 11:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711391657; x=1711996457; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea9eOBb1s+yHHAcYxRNr8e9XD1etU46P37uWHKinu3k=;
        b=Vkk1xmycB9z69hNrCvgcrNKA1Vr+zE4ZA60LoJDmJf++NOP6zFQ0HZfwDbiAdsINEy
         ng2N/3OgQS8RUI2s6fGja717ZPhIt0Y1UgpRl/v9SWFfCo4pXTDgBoFJx3GjwoUtIIzp
         tQh5XuwTCGQN5sGSwzNMb9RdI5M6QwzTaHVxsA4I6fWb4X2OqrBaAWXxUl+ReE8eNeoS
         fxT2QRJ6EfJrlvFcRcuizXq2FmiWjdY0U5EatP6aEhn5mLjTbWDyFdl8yAqF5UDogoRA
         fcfNKBJ++zSg+O7GZlq0ZP5ntxV3Fd98vjU/sVBj3PDEJXkayb7DaAVbj+LPeVmjp36C
         OSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711391657; x=1711996457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea9eOBb1s+yHHAcYxRNr8e9XD1etU46P37uWHKinu3k=;
        b=v4ttJlT30vzYGOWkaFDgCXMKedgZdRKtnq8U0JueIVdjQRJoESfsmmFF1JxQ23mpXm
         fyRS6gQe+Po9ZeyOV+0MmpMCpqew8r7qryz68rFf75fuhnzMgJFlG1oe4chKCpFQlmLB
         qJLgKuyHkev7VtKhN9g0dbqj12/XNIg1eaL56nKsZ7dUbZNY7ugxHsUXDY4M/IPhgSvN
         boi1FG6N3jt1UW/BSAlMEM8RJhf4Vlqwj3XGjpwu04RC9OORsRSt+cj6Fkx/66LFUvWf
         p5C1L7zcbGO3wQZlBWDixNYffl9PSWB/iakZFg47TWAiQpaLIuu2C0QsbNwZ+cYGvqET
         P4rA==
X-Forwarded-Encrypted: i=1; AJvYcCV+FpEqZDJ9rfzWXV/uvO8Oky3+kHH/EzUgfK3fCvyCibJJwyWQdozOKQi9SAVqo4FomCpeGm+kEGXbHgw4zGAZA0Q5iljBVEXolg6HJjme
X-Gm-Message-State: AOJu0Yyix0oxtvQcp0X/0JA1kwikdgL6VLlAWxZRqFN2dWoJwFpQnM4K
	FXE9YrAcOUqZaIYLu9wrPmTlwnTn0iFxpBRPBSFJErfGvlweF1MEwNQy+iaxguojzF+lb8wtdpa
	yv42vNPLRYQcD3abavXx1jVuARCQ=
X-Google-Smtp-Source: AGHT+IFH2cLUwpQB0Ur9fkV3U1FYXN+GL+meSfPbLtpV+O+jILouURdHVdotnF8t0NIZTXhWYOQAwJyB/kMwDBw7UAY=
X-Received: by 2002:a5d:5341:0:b0:33e:7a42:68e2 with SMTP id
 t1-20020a5d5341000000b0033e7a4268e2mr4836336wrv.21.1711391656945; Mon, 25 Mar
 2024 11:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240324103306.2202954-1-pulehui@huaweicloud.com>
 <CAADnVQLhfN7f6AFxa_19E0g2_YADEkrfPPffi43HeH9VCi8MqQ@mail.gmail.com> <c0890fc2-53ea-401a-a3b4-a9bf6181a867@huaweicloud.com>
In-Reply-To: <c0890fc2-53ea-401a-a3b4-a9bf6181a867@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 25 Mar 2024 11:34:05 -0700
Message-ID: <CAADnVQKnTe-7KhziOnGSesbz1WDkNp4nyCN3qp-y=ab0jMxr3Q@mail.gmail.com>
Subject: Re: [PATCH bpf] riscv, bpf: Fix kfunc parameters incompatibility
 between bpf and riscv abi
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf <bpf@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Network Development <netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, 
	Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_113420_451147_7F098D60 
X-CRM114-Status: GOOD (  30.63  )
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

T24gTW9uLCBNYXIgMjUsIDIwMjQgYXQgODoyOOKAr0FNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMjAyNC8zLzI1IDI6NDAsIEFsZXhlaSBTdGFy
b3ZvaXRvdiB3cm90ZToKPiA+IE9uIFN1biwgTWFyIDI0LCAyMDI0IGF0IDM6MzLigK9BTSBQdSBM
ZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyb3RlOgo+IFtTTklQXQo+ID4+Cj4gPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9hcmNoL3Jpc2N2
L25ldC9icGZfaml0X2NvbXA2NC5jCj4gPj4gaW5kZXggODY5ZTQyODJhMmM0Li5lM2ZjMzkzNzBm
N2QgMTAwNjQ0Cj4gPj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4+
ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiA+PiBAQCAtMTQ1NCw2ICsx
NDU0LDIyIEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmlu
c24sIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ID4+ICAgICAgICAgICAgICAgICAgaWYg
KHJldCA8IDApCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPj4K
PiA+PiArICAgICAgICAgICAgICAgaWYgKGluc24tPnNyY19yZWcgPT0gQlBGX1BTRVVET19LRlVO
Q19DQUxMKSB7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGJ0Zl9m
dW5jX21vZGVsICpmbTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBpbnQgaWR4Owo+ID4+
ICsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICBmbSA9IGJwZl9qaXRfZmluZF9rZnVuY19t
b2RlbChjdHgtPnByb2csIGluc24pOwo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmICgh
Zm0pCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiA+PiArCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgZm9yIChpZHggPSAwOyBpZHggPCBm
bS0+bnJfYXJnczsgaWR4KyspIHsKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHU4IHJlZyA9IGJwZl90b19ydl9yZWcoQlBGX1JFR18xICsgaWR4LCBjdHgpOwo+ID4+ICsKPiA+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChmbS0+YXJnX3NpemVbaWR4XSA9
PSBzaXplb2YoaW50KSkKPiA+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZW1pdF9zZXh0dyhyZWcsIHJlZywgY3R4KTsKPiA+PiArICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4gPj4gKyAgICAgICAgICAgICAgIH0KPiA+PiArCj4gPgo+ID4gVGhlIGJ0Zl9mdW5jX21v
ZGVsIHVzYWdlIGxvb2tzIGdvb2QuCj4gPiBHbGFkIHRoYXQgbm8gbmV3IGZsYWdzIHdlcmUgbmVj
ZXNzYXJ5LCBzaW5jZSBib3RoIGludCBhbmQgdWludAo+ID4gbmVlZCB0byBiZSBzaWduIGV4dGVu
ZCB0aGUgZXhpc3RpbmcgYXJnX3NpemUgd2FzIGVub3VnaC4KPiA+Cj4gPiBTaW5jZSB3ZSdyZSBh
dCBpdC4gRG8gd2UgbmVlZCB0byBkbyB6ZXJvIGV4dGVuc2lvbiBvZiByZXR1cm4gdmFsdWUgPwo+
ID4gVGhlcmUgaXMKPiA+IF9fYnBmX2tmdW5jIGludCBicGZfa2Z1bmNfY2FsbF90ZXN0MihzdHJ1
Y3Qgc29jayAqc2ssIHUzMiBhLCB1MzIgYikKPiA+IGJ1dCB0aGUgc2VsZnRlc3Qgd2l0aCBpdCBp
cyB0b28gc2ltcGxlOgo+ID4gICAgICAgICAgcmV0dXJuIGJwZl9rZnVuY19jYWxsX3Rlc3QyKChz
dHJ1Y3Qgc29jayAqKXNrLCAxLCAyKTsgPgo+ID4gQ291bGQgeW91IGV4dGVuZCB0aGlzIHNlbGZ0
ZXN0IHdpdGggYSByZXR1cm4gb2YgbGFyZ2UgaW50L3VpbnQKPiA+IHdpdGggMzF0aCBiaXQgc2V0
IHRvIGZvcmNlIHNpZ24gZXh0ZW5zaW9uIGluIG5hdGl2ZQo+Cj4gU29ycnkgZm9yIGxhdGUuIHJp
c2N2NjQgd2lsbCBzaWduLWV4dGVuZCBpbnQvdWludCByZXR1cm4gdmFsdWVzLiBJCj4gdGhvdWdo
dCB0aGlzIHdvdWxkIGJlIGEgZ29vZCB0ZXN0LCBzbyBJIHRyaWVkIHRoZSBmb2xsb3dpbmc6Cj4g
YGBgCj4gdTMyIGJwZl9rZnVuY19jYWxsX3Rlc3QyKHUzMiBhLCB1MzIgYikgX19rc3ltOyA8LS0g
aGVyZSBjaGFuZ2UgaW50IHRvIHUzMgo+IGludCBrZnVuY19jYWxsX3Rlc3QyKHN0cnVjdCBfX3Nr
X2J1ZmYgKnNrYikKPiB7Cj4gICAgICAgICBsb25nIHRtcDsKPgo+ICAgICAgICAgdG1wID0gYnBm
X2tmdW5jX2NhbGxfdGVzdDIoMHhmZmZmZmZmMCwgMik7Cj4gICAgICAgICByZXR1cm4gKHRtcCA+
PiAzMikgKyB0bXA7Cj4gfQo+IGBgYAo+IEFzIGV4cGVjdGVkLCBpZiB0aGUgcmV0dXJuIHZhbHVl
IGlzIHNpZ24tZXh0ZW5kZWQsIHRoZSBicGYgcHJvZ3JhbSB3aWxsCj4gcmV0dXJuIDB4ZmZmZmZm
ZjEuIElmIHRoZSByZXR1cm4gdmFsdWUgaXMgemVyby1leHRlbmRlZCwgdGhlIGJwZiBwcm9ncmFt
Cj4gd2lsbCByZXR1cm4gMHhmZmZmZmZmMi4gQnV0IGluIGZhY3QsIHJpc2N2IHJldHVybnMgMHhm
ZmZmZmZmMi4gVXBvbgo+IGZ1cnRoZXIgZGlzY292ZXJ5LCBpdCBzZWVtcyBjbGFuZyB3aWxsIGNv
bXBlbnNhdGUgZm9yIHVuc2lnbmVkIHJldHVybgo+IHZhbHVlcy4gQ3VyaW91cyEKPiBmb3IgZXhh
bXBsZToKPiBgYGAKPiB1MzIgYnBmX2tmdW5jX2NhbGxfdGVzdDIodTMyIGEsIHUzMiBiKSBfX2tz
eW07Cj4gaW50IGtmdW5jX2NhbGxfdGVzdDIoc3RydWN0IF9fc2tfYnVmZiAqc2tiKQo+IHsKPiAg
ICAgICAgIGxvbmcgdG1wOwo+Cj4gICAgICAgICB0bXAgPSBicGZfa2Z1bmNfY2FsbF90ZXN0Migw
eGZmZmZmZmYwLCAyKTsKPiAgICAgICAgIGJwZl9wcmludGsoInRtcDogMHglbHgiLCB0bXApOwo+
ICAgICAgICAgcmV0dXJuICh0bXAgPj4gMzIpICsgdG1wOwo+IH0KPiBgYGAKPiBhbmQgdGhlIGJ5
dGVjb2RlIHdpbGwgYmU6Cj4gYGBgCj4gICAwOiAgICAgICAxOCAwMSAwMCAwMCAwMCAwMCAwMCBm
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCByMSA9Cj4gMHhmMDAwMDAwMCBsbAo+ICAgMjogICAg
ICAgYjcgMDIgMDAgMDAgMDIgMDAgMDAgMDAgcjIgPSAweDIKPiAgIDM6ICAgICAgIDg1IDEwIDAw
IDAwIGZmIGZmIGZmIGZmIGNhbGwgLTB4MQo+ICAgNDogICAgICAgYmYgMDYgMDAgMDAgMDAgMDAg
MDAgMDAgcjYgPSByMAo+ICAgNTogICAgICAgYmYgNjMgMDAgMDAgMDAgMDAgMDAgMDAgcjMgPSBy
Ngo+ICAgNjogICAgICAgNjcgMDMgMDAgMDAgMjAgMDAgMDAgMDAgcjMgPDw9IDB4MjAgPC0tIHpl
cm8gZXh0ZW5zaW9uCj4gICA3OiAgICAgICA3NyAwMyAwMCAwMCAyMCAwMCAwMCAwMCByMyA+Pj0g
MHgyMAo+ICAgODogICAgICAgMTggMDEgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMDAgMDAgcjEgPSAweDAgbGwKPiAxMDogICAgICAgYjcgMDIgMDAgMDAgMGIgMDAgMDAgMDAg
cjIgPSAweGIKPiAxMTogICAgICAgODUgMDAgMDAgMDAgMDYgMDAgMDAgMDAgY2FsbCAweDYKPiAx
MjogICAgICAgYmYgNjAgMDAgMDAgMDAgMDAgMDAgMDAgcjAgPSByNgo+IDEzOiAgICAgICA5NSAw
MCAwMCAwMCAwMCAwMCAwMCAwMCBleGl0Cj4gYGBgCj4KPiBhbm90aGVyIGV4YW1wbGU6Cj4gYGBg
Cj4gdTMyIGJwZl9rZnVuY19jYWxsX3Rlc3QyKHUzMiBhLCB1MzIgYikgX19rc3ltOwo+IGludCBr
ZnVuY19jYWxsX3Rlc3QyKHN0cnVjdCBfX3NrX2J1ZmYgKnNrYikKPiB7Cj4gICAgICAgICBsb25n
IHRtcDsKPgo+ICAgICAgICAgdG1wID0gYnBmX2tmdW5jX2NhbGxfdGVzdDIoMHhmZmZmZmZmMCwg
Mik7Cj4gICAgICAgICByZXR1cm4gKHRtcCA+PiAyMCkgKyB0bXA7IDwtLSBjaGFuZ2UgZnJvbSAz
MiB0byAyMAo+IH0KPiBgYGAKPiBhbmQgdGhlIGJ5dGVjb2RlIHdpbGwgYmU6Cj4gYGBgCj4gICAw
OiAgICAgICAxOCAwMSAwMCAwMCAwMCAwMCAwMCBmMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCBy
MSA9Cj4gMHhmMDAwMDAwMCBsbAo+ICAgMjogICAgICAgYjcgMDIgMDAgMDAgMDIgMDAgMDAgMDAg
cjIgPSAweDIKPiAgIDM6ICAgICAgIDg1IDEwIDAwIDAwIGZmIGZmIGZmIGZmIGNhbGwgLTB4MQo+
ICAgNDogICAgICAgMTggMDIgMDAgMDAgMDAgMDAgZjAgZmYgMDAgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgcjIgPQo+IDB4ZmZmMDAwMDAgbGwgPC0tIDMyLWJpdCB0cnVuY2F0aW9uCj4gICA2OiAgICAg
ICBiZiAwMSAwMCAwMCAwMCAwMCAwMCAwMCByMSA9IHIwCj4gICA3OiAgICAgICA1ZiAyMSAwMCAw
MCAwMCAwMCAwMCAwMCByMSAmPSByMgo+ICAgODogICAgICAgNzcgMDEgMDAgMDAgMTQgMDAgMDAg
MDAgcjEgPj49IDB4MTQKPiAgIDk6ICAgICAgIDBmIDAxIDAwIDAwIDAwIDAwIDAwIDAwIHIxICs9
IHIwCj4gMTA6ICAgICAgIGJmIDEwIDAwIDAwIDAwIDAwIDAwIDAwIHIwID0gcjEKPiAxMTogICAg
ICAgOTUgMDAgMDAgMDAgMDAgMDAgMDAgMDAgZXhpdAo+IGBgYAo+Cj4gSXQgaXMgZGlmZmljdWx0
IHRvIGNvbnN0cnVjdCB0aGlzIHRlc3QgY2FzZS4KClllYWguCkkgYWxzbyB0cmllZCBhIGJ1bmNo
IG9mIGV4cGVyaW1lbnRzIHdpdGggbGx2bSBhbmQgZ2NjLWJwZi4KQm90aCBjb21waWxlcnMgZW1p
dCB6ZXJvIGV4dGVuc2lvbiB3aGVuIHUzMiBpcyBiZWluZyB1c2VkIGFzIHU2NC4KCj4gPiBrZXJu
ZWwgcmlzYy12IGNvZGUgPwo+ID4gSSBzdXNwZWN0IHRoZSBicGYgc2lkZSB3aWxsIGJlIGNvbmZ1
c2VkLgo+ID4gV2hpY2ggd291bGQgbWVhbiB0aGF0IHJpc2MtdiBKSVQgaW4gYWRkaXRpb24gdG86
Cj4gPiAgICAgICAgICBpZiAoaW5zbi0+c3JjX3JlZyAhPSBCUEZfUFNFVURPX0NBTEwpCj4gPiAg
ICAgICAgICAgICAgZW1pdF9tdihicGZfdG9fcnZfcmVnKEJQRl9SRUdfMCwgY3R4KSwgUlZfUkVH
X0EwLCBjdHgpOwo+ID4KPiA+IG5lZWQgdG8gY29uZGl0aW9uYWxseSBkbzoKPiA+ICAgaWYgKGZt
LT5yZXRfc2l6ZSA9PSBzaXplb2YoaW50KSkKPiA+ICAgICBlbWl0X3pleHR3KGJwZl90b19ydl9y
ZWcoQlBGX1JFR18wLCBjdHgpLAo+ID4gICAgICAgICAgICAgICAgYnBmX3RvX3J2X3JlZyhCUEZf
UkVHXzAsIGN0eCksIGN0eCk7Cj4gPiA/Cj4KPiBBZ3JlZSBvbiB6ZXJvLWV4dGVuZGluZyBpbnQv
dWludCByZXR1cm4gdmFsdWVzIHdoZW4gcmV0dXJuaW5nIGZyb20KPiBrZnVuYyB0byBicGYgY3R4
LiBJIHdpbGwgYWRkIGl0IGluIG5leHQgdmVyc2lvbi4gVGhhbmtzLgoKTG9va2luZyBhdCBleGlz
dGluZyBjb21waWxlcnMgYmVoYXZpb3IgaXQncyBwcm9iYWJseSB1bm5lY2Vzc2FyeS4KSSB0aGlu
ayB0aGlzIHBhdGNoIGlzIGZpbmUgYXMtaXMuCkknbGwgYXBwbHkgaXQgc2hvcnRseS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
