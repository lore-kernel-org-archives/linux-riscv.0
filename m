Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2414ECD4F25
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RU+s0v2dPU6F8JsfqyBayPDIFDPaJ5Rxs9NhnjG2ac4=; b=ss6rdPjkFMbCGn
	FOznrolDuCfDs9bZ23afjPk8fKui9/K+gxpFBblxiFdrxYC0i1LjfvV/Gr1TvJzsZjH6klIk6okT9
	WBQf0iQlbEyrXHgjE4zkrALfblDCkBy0hI368z6otQnLpT3PEFIDunM98YMcxNb40UBLKhKzK146Y
	CI+UCqD4qQ6HaYOzmWrJF6Ex3UJ0Z0IJXE6xSeayxP7QyRO14bWJHh5TaRWed6qFPRGLku8DsZrLP
	iSqYLH/GYgUilh4qHehAQawjgcb9Lo/aCSQDx88AK6CJhi28gRUQEgNGU0D0Q7mtBQ+X0ltSOSo+x
	vRh7h5xcvRGTbRrlyfKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwVW-00000005wv8-1fGn;
	Wed, 04 Sep 2024 20:21:38 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slwVT-00000005wuj-3YYU
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 20:21:37 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7cd8afc9ff3so905277a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Sep 2024 13:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725481294; x=1726086094; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OAMoPk7C0DH2NXF8P5L8PAlBeNNIJDV5ksHuFpUK2Zw=;
        b=Nhh3qMmVM47somYSM2v3pANkugzd517RGiqni7YoVLdVFXLP0hWBqKKaxuQxArJeZQ
         +OsqZmPe2a6yhMsujiBe9clCwqP2lJi+5Ut6OukqyWO6hQEPJmJL9tIMHnbMbxX826J5
         ywgLao25fPuGn9UVLLsn4GijlNFHoj8m+pbc1Zo1AW4zh2ZTLECmqyCBZNsCY2wWSMVL
         XyP763AILh8je2L7UHYCt6eJU1CCbJ9KNCr2JAfap+rEK9lhS7MpqAUe2/E+X8AV8NJh
         p9FhPU4Rsoz8f17sazFKshv7ZDA80co6Cpd5DxOF0tX+qEqnoagvf5gxDJNbJQvoJku7
         avqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725481294; x=1726086094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OAMoPk7C0DH2NXF8P5L8PAlBeNNIJDV5ksHuFpUK2Zw=;
        b=hvOBdislXW5WYhmcJdukqEMGjWxAXb+iIOqHCDqQqdIgyfcg+i1xOBmpoM1Ab5Ognu
         PWrl8FUL/tqy4kVfxYa6NTzkYAQiLAQv/t79k6cATpRxEn178CeOSxO54hTCPRZWELh7
         bmwOw4ktBNbHJTEgjraJWjOOU2a9ofcg26Se0/4o2M1Ezu7CFDeSYnjXwrKCgBGDBB5u
         vRZstaYSYrfhz1SBvwLy13Yk9j0N+ZFxdm+3qOHh1a5FwxSKNool9uTniOMN9WedilYT
         V2jxBjX+38mtN6ged3eFO4otEHIntaiv/lv3G61O5u4XY0FUETyCNn7I8jE0wx3542hK
         KwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXPG0SNNzgl+Tpw9PxYJfAyVnGWp9yGWohLF8nTlZMc542pqe+nT2yZHyuRJ1Y0yZgkRitPnuOIXvC6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtJ2lfimatFJI5tAMu1eHeEgN6cDbzYdhjcdU452cZUhwWCQCY
	aBjJK8jsz/gSnN1/7Sp5R000kkMADSSb95PopLxhGAeO2WE+v7HtVzAQMAwZVIB7CqdWWTTQpao
	6sGAfj9OLcSqaSWPU9KERbP6DHcg=
X-Google-Smtp-Source: AGHT+IFGWtqUAtuDasPjB0tcP05uQa2rp9boXM1aqKCzVoM5wST6zCNZ+dkBQcG/iUCkve7kSACiWtJlfihV64zuSgQ=
X-Received: by 2002:a17:90b:30cb:b0:2c9:36bf:ba6f with SMTP id
 98e67ed59e1d1-2da8e9d7788mr5387259a91.3.1725481294230; Wed, 04 Sep 2024
 13:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240831041934.1629216-1-pulehui@huaweicloud.com> <20240831041934.1629216-3-pulehui@huaweicloud.com>
In-Reply-To: <20240831041934.1629216-3-pulehui@huaweicloud.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 4 Sep 2024 13:21:21 -0700
Message-ID: <CAEf4BzYQx95PzRyivNgGWwL_ytB1=Z8eVGe_ejYHvdiCyjMJzA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 2/4] libbpf: Access first syscall argument
 with CO-RE direct read on arm64
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	netdev@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Puranjay Mohan <puranjay@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Pu Lehui <pulehui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_132135_909103_3C4B77A7 
X-CRM114-Status: GOOD (  17.36  )
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

T24gRnJpLCBBdWcgMzAsIDIwMjQgYXQgOToxN+KAr1BNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aWNsb3VkLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29t
Pgo+Cj4gQ3VycmVudGx5IFBUX1JFR1NfUEFSTTEgU1lTQ0FMTCh4KSBpcyBjb25zaXN0ZW50IHdp
dGggUFRfUkVHU19QQVJNMV9DT1JFCj4gU1lTQ0FMTCh4KSwgd2hpY2ggd2lsbCBpbnRyb2R1Y2Ug
dGhlIG92ZXJoZWFkIG9mIEJQRl9DT1JFX1JFQUQoKSwgdGFraW5nCj4gaW50byBhY2NvdW50IHRo
ZSByZWFkIHB0X3JlZ3MgY29tZXMgZGlyZWN0bHkgZnJvbSB0aGUgY29udGV4dCwgbGV0J3MgdXNl
Cj4gQ08tUkUgZGlyZWN0IHJlYWQgdG8gYWNjZXNzIHRoZSBmaXJzdCBzeXN0ZW0gY2FsbCBhcmd1
bWVudC4KPgo+IFN1Z2dlc3RlZC1ieTogQW5kcmlpIE5ha3J5aWtvIDxhbmRyaWlAa2VybmVsLm9y
Zz4KPiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+IC0tLQo+
ICB0b29scy9saWIvYnBmL2JwZl90cmFjaW5nLmggfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS90b29scy9s
aWIvYnBmL2JwZl90cmFjaW5nLmggYi90b29scy9saWIvYnBmL2JwZl90cmFjaW5nLmgKPiBpbmRl
eCBlN2Q5MzgyZWZlYjMuLjA1MWM0MDhlNmFlZCAxMDA2NDQKPiAtLS0gYS90b29scy9saWIvYnBm
L2JwZl90cmFjaW5nLmgKPiArKysgYi90b29scy9saWIvYnBmL2JwZl90cmFjaW5nLmgKPiBAQCAt
MjIyLDcgKzIyMiw3IEBAIHN0cnVjdCBwdF9yZWdzX19fczM5MCB7Cj4KPiAgc3RydWN0IHB0X3Jl
Z3NfX19hcm02NCB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIG9yaWdfeDA7Cj4gLX07Cj4gK30g
X19hdHRyaWJ1dGVfXygocHJlc2VydmVfYWNjZXNzX2luZGV4KSk7Cj4KPiAgLyogYXJtNjQgcHJv
dmlkZXMgc3RydWN0IHVzZXJfcHRfcmVncyBpbnN0ZWFkIG9mIHN0cnVjdCBwdF9yZWdzIHRvIHVz
ZXJzcGFjZSAqLwo+ICAjZGVmaW5lIF9fUFRfUkVHU19DQVNUKHgpICgoY29uc3Qgc3RydWN0IHVz
ZXJfcHRfcmVncyAqKSh4KSkKPiBAQCAtMjQxLDcgKzI0MSw3IEBAIHN0cnVjdCBwdF9yZWdzX19f
YXJtNjQgewo+ICAjZGVmaW5lIF9fUFRfUEFSTTRfU1lTQ0FMTF9SRUcgX19QVF9QQVJNNF9SRUcK
PiAgI2RlZmluZSBfX1BUX1BBUk01X1NZU0NBTExfUkVHIF9fUFRfUEFSTTVfUkVHCj4gICNkZWZp
bmUgX19QVF9QQVJNNl9TWVNDQUxMX1JFRyBfX1BUX1BBUk02X1JFRwo+IC0jZGVmaW5lIFBUX1JF
R1NfUEFSTTFfU1lTQ0FMTCh4KSBQVF9SRUdTX1BBUk0xX0NPUkVfU1lTQ0FMTCh4KQo+ICsjZGVm
aW5lIFBUX1JFR1NfUEFSTTFfU1lTQ0FMTCh4KSAoKChjb25zdCBzdHJ1Y3QgcHRfcmVnc19fX2Fy
bTY0ICopKHgpKS0+b3JpZ194MCkKCkl0IHdvdWxkIHByb2JhYmx5IGJlIGJlc3QgKGZvciBjb25z
aXN0ZW5jeSkgdG8gc3RpY2sgdG8gdXNpbmcKX19QVFJfUEFSTTFfU1lTQ0FMTF9SRUcgaW5zdGVh
ZCBvZiBoYXJkLWNvZGluZyBvcmlnX3gwIGhlcmUsIG5vPyBJJ2xsCmZpeCBpdCB1cCB3aGlsZSBh
cHBseWluZy4gU2FtZSBmb3IgcGF0Y2ggIzEgYW5kICM0LgoKSXQgd291bGQgYmUgZ3JlYXQgaWYg
eW91IGNhbiBkb3VibGUtY2hlY2sgdGhhdCBmaW5hbCBwYXRjaGVzIGluCmJwZi1uZXh0L21hc3Rl
ciBjb21waWxlIGFuZCB3b3JrIHdlbGwgZm9yIGFybTY0LCBzMzkweCwgYW5kIFJWNjQgKGFzIEkK
Y2FuJ3QgcmVhbGx5IHRlc3QgdGhhdCBtdWNoIGxvY2FsbHkpLgoKCgo+ICAjZGVmaW5lIFBUX1JF
R1NfUEFSTTFfQ09SRV9TWVNDQUxMKHgpIFwKPiAgICAgICAgIEJQRl9DT1JFX1JFQUQoKGNvbnN0
IHN0cnVjdCBwdF9yZWdzX19fYXJtNjQgKikoeCksIF9fUFRfUEFSTTFfU1lTQ0FMTF9SRUcpCj4K
PiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
