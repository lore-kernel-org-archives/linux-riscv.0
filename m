Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB45FE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Dec 2024 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GCQkyBPIZHaRyidmPd9/miKWcXdbLSB4TZZXzm3WOdA=; b=YgWO2IE0Gdd9q3
	oGWD0I2SmQw21hQT6E13E8Wp5IhASgAwkhBanJAkjoRP7oYKvhMhuptk7UMcRQqKFON67bf6sr+8V
	bsY0HvHlchskRB9eds/rjNf2jkDcwlOrggwDDqp8DcExrC2+UNIdBzC+R4Ar8oxCNZWF/mDVQAjQy
	IyGgu9vasotR9CrlBb5X0juSlkLER+AlQ7Mp5FvT0c9KV17yrxWaCCns+PPC32BmwuFuq6NZUkQV2
	Ot9SOQvjqk23G+LDJH32QWGlZ2+9M8YN1/KNCHPV7E570P3IyGV6yZKRzlvD3LIzKG8MRlm5SAEKK
	q/GRFkZBdBHQxhlEIcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOc3R-00000004shs-06L5;
	Fri, 20 Dec 2024 12:24:29 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOc3O-00000004sh0-13NW
	for linux-riscv@lists.infradead.org;
	Fri, 20 Dec 2024 12:24:27 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3eba347aa6fso1060021b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Dec 2024 04:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734697464; x=1735302264; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6LDbg3g5KsuCFJ91dAZNA5dYKkQZfbj6FRYdIS/YzRw=;
        b=LWGpNwSDBVht9DNOjLLk5zNFmaojSNf7IdZZppo/6w7O5x2s1s7xNw8BxfBxqyBOvH
         vKmScVKWS45/5vECN/LkLhJSgwC5sL56Mre0MluGYmAs3dAYmXx3vm1IMQJvpv27t+u3
         lx0PUvMBJdzmHpwdUDmGUipxGvj7lSoZ5a8ru+m1cV2GE3vBM8GPWQ2GRpBTTZNy5WTv
         wgRbWREa7P+JNqwo4hH0IXxd6ow8ZfiMTL5wbTqxzexXtyZFYuSoLeTYpbjyDh90leRF
         Psasvx0hw5cO+w1hsdkA4IedmBCoVmjxSd55FNyH0+OwGYuIvkJIGAPjgUxJVyAB/jGh
         rG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697465; x=1735302265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6LDbg3g5KsuCFJ91dAZNA5dYKkQZfbj6FRYdIS/YzRw=;
        b=wludhb5BSUxIu1W5K+LKIO4TqQZjH39zGtkIbinItr+1+D97p1reGBTqXd/HpHCw87
         xqPgwZHX6w3S7LDRuAaJYxPpmE/aCgWoHc/tMeclrdXk80IXa1rVUqMObaV5d4uJsYza
         //zsglLJytjxhKs0PZ5E9LntvzvutxECVGvyEA18jSsLKqqH23NwP4D5eejsrElLCDmv
         JEvS2HtFiMnwVcaZIo4Ejf//w1izyJT2tuZu+fow7dE9eCTRqDCyzXSYEuw9TRqgG0kx
         dsHUqiDfSM/e5xGJbdNmnMSo/noIsFc63mLJiyKN0jg5uEwgPXD3n+ff4xYBSA5U9RyU
         P1LA==
X-Forwarded-Encrypted: i=1; AJvYcCUmMfpNnzYj6ya8TqzxMzpoKilgvev/XC2W1ehnnEho8k/zk+Yj0akmS4P7VipU11+iKC12ztJ26tVB+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdKrODiDmW/55BSNlAwSVhgnRIPS4gy/64GZ57hUi8ytVCu8e6
	onqgu6Gbmv/RZ5tMTCpWAh/HVSfs5O75dntwBMksemWq91n0ax93ak9FosMpw4l7qiC0riRdKDi
	8b6lTTGrdHi520y9SSpl3TvlIZOxPo6hFz1tAPw==
X-Gm-Gg: ASbGncuNHcVu5THyg65MfcsLoaIc4e6lY5khOC/0B08ZhAxoYQnswvNPS/NyNpUWtWR
	nJE4il/87A08/Ay8lhN/MROAzuT/xi+oon+Awg4VG
X-Google-Smtp-Source: AGHT+IEGuQl/FdScngduRf4k2gQmyR9bX/Xqe6XUqVghNCz4zK+Est9HePiPmoKI78i5scBI1KaQqB6vW6KHFvkoqhc=
X-Received: by 2002:a05:6808:f06:b0:3ea:aa8a:c115 with SMTP id
 5614622812f47-3ed88f9629dmr1337937b6e.21.1734697464724; Fri, 20 Dec 2024
 04:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20241209074125.52322-1-alexghiti@rivosinc.com>
In-Reply-To: <20241209074125.52322-1-alexghiti@rivosinc.com>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Fri, 20 Dec 2024 20:24:14 +0800
Message-ID: <CAMWQL2jyJG+oBNrXieUyUzGSDSWJpWRP-1BZrJ-JnyKK1YM12w@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix IPIs usage in kfence_protect_page()
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Liu Shixin <liushixin2@huawei.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_042426_307202_F5D9584F 
X-CRM114-Status: GOOD (  18.59  )
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

SGkgQWxleGFuZHJlLAoKCk9uIE1vbiwgRGVjIDksIDIwMjQgYXQgNDo0NuKAr1BNIEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBmbHVzaF90bGJfa2Vy
bmVsX3JhbmdlKCkgbWF5IHVzZSBJUElzIHRvIGZsdXNoIHRoZSBUTEJzIG9mIGFsbCB0aGUKPiBj
b3Jlcywgd2hpY2ggdHJpZ2dlcnMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIHdoZW4gdGhlIGlycXMg
YXJlIGRpc2FibGVkOgo+Cj4gWyAgICAzLjQ1NTMzMF0gV0FSTklORzogQ1BVOiAxIFBJRDogMCBh
dCBrZXJuZWwvc21wLmM6ODE1IHNtcF9jYWxsX2Z1bmN0aW9uX21hbnlfY29uZCsweDQ1Mi8weDUy
MAo+IFsgICAgMy40NTY2NDddIE1vZHVsZXMgbGlua2VkIGluOgo+IFsgICAgMy40NTcyMThdIENQ
VTogMSBVSUQ6IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMSBOb3QgdGFpbnRlZCA2LjEyLjAtcmM3
LTAwMDEwLWc5MWQzZGU3MjQwYjggIzEKPiBbICAgIDMuNDU3NDE2XSBIYXJkd2FyZSBuYW1lOiBR
RU1VIFFFTVUgVmlydHVhbCBNYWNoaW5lLCBCSU9TCj4gWyAgICAzLjQ1NzYzM10gZXBjIDogc21w
X2NhbGxfZnVuY3Rpb25fbWFueV9jb25kKzB4NDUyLzB4NTIwCj4gWyAgICAzLjQ1NzczNl0gIHJh
IDogb25fZWFjaF9jcHVfY29uZF9tYXNrKzB4MWUvMHgzMAo+IFsgICAgMy40NTc3ODZdIGVwYyA6
IGZmZmZmZmZmODAwYjY2OWEgcmEgOiBmZmZmZmZmZjgwMGI2N2MyIHNwIDogZmYyMDAwMDAwMDAw
YmI1MAo+IFsgICAgMy40NTc4MjRdICBncCA6IGZmZmZmZmZmODE1MjEyYjggdHAgOiBmZjYwMDAw
MDgwMTRmMDgwIHQwIDogMDAwMDAwMDAwMDAwMDAzZgo+IFsgICAgMy40NTc4NTldICB0MSA6IGZm
ZmZmZmZmODE1MjIxZTAgdDIgOiAwMDAwMDAwMDAwMDAwMDBmIHMwIDogZmYyMDAwMDAwMDAwYmMx
MAo+IFsgICAgMy40NTc5MjBdICBzMSA6IDAwMDAwMDAwMDAwMDAwNDAgYTAgOiBmZmZmZmZmZjgx
NTIyMWUwIGExIDogMDAwMDAwMDAwMDAwMDAwMQo+IFsgICAgMy40NTc5NTNdICBhMiA6IDAwMDAw
MDAwMDAwMTAwMDAgYTMgOiAwMDAwMDAwMDAwMDAwMDAzIGE0IDogMDAwMDAwMDAwMDAwMDAwMAo+
IFsgICAgMy40NTgwMDZdICBhNSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiBmZmZmZmZmZmZmZmZm
ZmZmIGE3IDogMDAwMDAwMDAwMDAwMDAwMAo+IFsgICAgMy40NTgwNDJdICBzMiA6IGZmZmZmZmZm
ODE1MjIzYmUgczMgOiAwMGZmZmZmZmZmZmZmMDAwIHM0IDogZmY2MDAwMDFmZmUzOGZjMAo+IFsg
ICAgMy40NTgwNzZdICBzNSA6IGZmNjAwMDAxZmY5NTBkMDAgczYgOiAwMDAwMDAwMjAwMDAwMTIw
IHM3IDogMDAwMDAwMDAwMDAwMDAwMQo+IFsgICAgMy40NTgxMDldICBzOCA6IDAwMDAwMDAwMDAw
MDAwMDEgczkgOiBmZjYwMDAwMDgwODQxZWYwIHMxMDogMDAwMDAwMDAwMDAwMDAwMQo+IFsgICAg
My40NTgxNDFdICBzMTE6IGZmZmZmZmZmODE1MjQ4MTIgdDMgOiAwMDAwMDAwMDAwMDAwMDAxIHQ0
IDogZmY2MDAwMDA4MDA5MmJjMAo+IFsgICAgMy40NTgxNzJdICB0NSA6IDAwMDAwMDAwMDAwMDAw
MDAgdDYgOiBmZjIwMDAwMDAwMDIzNmQwCj4gWyAgICAzLjQ1ODIwM10gc3RhdHVzOiAwMDAwMDAw
MjAwMDAwMTAwIGJhZGFkZHI6IGZmZmZmZmZmODAwYjY2OWEgY2F1c2U6IDAwMDAwMDAwMDAwMDAw
MDMKPiBbICAgIDMuNDU4MzczXSBbPGZmZmZmZmZmODAwYjY2OWE+XSBzbXBfY2FsbF9mdW5jdGlv
bl9tYW55X2NvbmQrMHg0NTIvMHg1MjAKPiBbICAgIDMuNDU4NTkzXSBbPGZmZmZmZmZmODAwYjY3
YzI+XSBvbl9lYWNoX2NwdV9jb25kX21hc2srMHgxZS8weDMwCj4gWyAgICAzLjQ1ODYyNV0gWzxm
ZmZmZmZmZjgwMDBlNGNhPl0gX19mbHVzaF90bGJfcmFuZ2UrMHgxMTgvMHgxY2EKPiBbICAgIDMu
NDU4NjU2XSBbPGZmZmZmZmZmODAwMGU2YjI+XSBmbHVzaF90bGJfa2VybmVsX3JhbmdlKzB4MWUv
MHgyNgo+IFsgICAgMy40NTg2ODNdIFs8ZmZmZmZmZmY4MDFlYTU2YT5dIGtmZW5jZV9wcm90ZWN0
KzB4YzAvMHhjZQo+IFsgICAgMy40NTg3MTddIFs8ZmZmZmZmZmY4MDFlOTQ1Nj5dIGtmZW5jZV9n
dWFyZGVkX2ZyZWUrMHhjNi8weDFjMAo+IFsgICAgMy40NTg3NDJdIFs8ZmZmZmZmZmY4MDFlOWQ2
Yz5dIF9fa2ZlbmNlX2ZyZWUrMHg2Mi8weGM2Cj4gWyAgICAzLjQ1ODc2NF0gWzxmZmZmZmZmZjgw
MWM1N2Q4Pl0ga2ZyZWUrMHgxMDYvMHgzMmMKPiBbICAgIDMuNDU4Nzg2XSBbPGZmZmZmZmZmODA1
ODhjZjI+XSBkZXRhY2hfYnVmX3NwbGl0KzB4MTg4LzB4MWE4Cj4gWyAgICAzLjQ1ODgxNl0gWzxm
ZmZmZmZmZjgwNTg3MDhjPl0gdmlydHF1ZXVlX2dldF9idWZfY3R4KzB4YjYvMHgxZjYKPiBbICAg
IDMuNDU4ODM5XSBbPGZmZmZmZmZmODA1ODcxZGE+XSB2aXJ0cXVldWVfZ2V0X2J1ZisweGUvMHgx
Ngo+IFsgICAgMy40NTg4ODBdIFs8ZmZmZmZmZmY4MDYxM2Q2YT5dIHZpcnRibGtfZG9uZSsweDVj
LzB4ZTIKPiBbICAgIDMuNDU4OTA4XSBbPGZmZmZmZmZmODA1ODc2NmU+XSB2cmluZ19pbnRlcnJ1
cHQrMHg2YS8weDc0Cj4gWyAgICAzLjQ1ODkzMF0gWzxmZmZmZmZmZjgwMDc0N2Q4Pl0gX19oYW5k
bGVfaXJxX2V2ZW50X3BlcmNwdSsweDdjLzB4ZTIKPiBbICAgIDMuNDU4OTU2XSBbPGZmZmZmZmZm
ODAwNzQ4ZjA+XSBoYW5kbGVfaXJxX2V2ZW50KzB4M2MvMHg4Ngo+IFsgICAgMy40NTg5NzhdIFs8
ZmZmZmZmZmY4MDA3ODZjYz5dIGhhbmRsZV9zaW1wbGVfaXJxKzB4OWUvMHhiZQo+IFsgICAgMy40
NTkwMDRdIFs8ZmZmZmZmZmY4MDA3MzkzND5dIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnErMHgx
Yy8weDJhCj4gWyAgICAzLjQ1OTAyN10gWzxmZmZmZmZmZjgwNGJmODdjPl0gaW1zaWNfaGFuZGxl
X2lycSsweGJhLzB4MTIwCj4gWyAgICAzLjQ1OTA1Nl0gWzxmZmZmZmZmZjgwMDczOTM0Pl0gZ2Vu
ZXJpY19oYW5kbGVfZG9tYWluX2lycSsweDFjLzB4MmEKPiBbICAgIDMuNDU5MDgwXSBbPGZmZmZm
ZmZmODA0YmRiNzY+XSByaXNjdl9pbnRjX2FpYV9pcnErMHgyNC8weDM0Cj4gWyAgICAzLjQ1OTEw
M10gWzxmZmZmZmZmZjgwOWQwNDUyPl0gaGFuZGxlX3Jpc2N2X2lycSsweDJlLzB4NGMKPiBbICAg
IDMuNDU5MTMzXSBbPGZmZmZmZmZmODA5ZDkyM2U+XSBjYWxsX29uX2lycV9zdGFjaysweDMyLzB4
NDAKPgo+IFNvIG9ubHkgZmx1c2ggdGhlIGxvY2FsIFRMQiBhbmQgbGV0IHRoZSBsYXp5IGtmZW5j
ZSBwYWdlIGZhdWx0IGhhbmRsaW5nCj4gZGVhbCB3aXRoIHRoZSBmYXVsdHMgd2hpY2ggY291bGQg
aGFwcGVuIHdoZW4gYSBjb3JlIGhhcyBhbiBvbGQgcHJvdGVjdGVkCj4gcHRlIHZlcnNpb24gY2Fj
aGVkIGluIGl0cyBUTEIuIFRoYXQgbGVhZHMgdG8gcG90ZW50aWFsIGluYWNjdXJhY2llcyB3aGlj
aAo+IGNhbiBiZSB0b2xlcmF0ZWQgd2hlbiB1c2luZyBrZmVuY2UuCj4KPiBGaXhlczogNDc1MTNm
MjQzYjQ1ICgicmlzY3Y6IEVuYWJsZSBLRkVOQ0UgZm9yIHJpc2N2NjQiKQo+IFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rZmVuY2UuaCB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rZmVuY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va2ZlbmNlLmgK
PiBpbmRleCA3Mzg4ZWRkODg5ODYuLmQwOGJmN2ZiM2FlZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2tmZW5jZS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9r
ZmVuY2UuaAo+IEBAIC0yMiw3ICsyMiw5IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBrZmVuY2VfcHJv
dGVjdF9wYWdlKHVuc2lnbmVkIGxvbmcgYWRkciwgYm9vbCBwcm90ZWN0KQo+ICAgICAgICAgZWxz
ZQo+ICAgICAgICAgICAgICAgICBzZXRfcHRlKHB0ZSwgX19wdGUocHRlX3ZhbChwdGVwX2dldChw
dGUpKSB8IF9QQUdFX1BSRVNFTlQpKTsKPgo+IC0gICAgICAgZmx1c2hfdGxiX2tlcm5lbF9yYW5n
ZShhZGRyLCBhZGRyICsgUEFHRV9TSVpFKTsKPiArICAgICAgIHByZWVtcHRfZGlzYWJsZSgpOwo+
ICsgICAgICAgbG9jYWxfZmx1c2hfdGxiX2tlcm5lbF9yYW5nZShhZGRyLCBhZGRyICsgUEFHRV9T
SVpFKTsKPiArICAgICAgIHByZWVtcHRfZW5hYmxlKCk7Cj4KPiAgICAgICAgIHJldHVybiB0cnVl
Owo+ICB9Cj4gLS0KPiAyLjM5LjIKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgoKUmV2aWV3ZWQtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25n
eHVhbi53YW5nQHNpZml2ZS5jb20+CgpSZWdhcmRzLApZb25nLVh1YW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
