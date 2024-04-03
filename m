Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE220CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 06:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JcxdGhOOU1Tdgb9rTW23kUJ0ErxReURDC0PTx9vxqdc=; b=uXkiza18ADU3NT
	8EGiu/dl35GAWK0XU8qBFL3sYUCFDX2wyg7HKzjSiKEKWzur8MgIbYuv+HBG75tAhXVcb9bcaEw2d
	bNSKXfLfJP7Zyra2OKygjqly3rkDvT7h3tZTQr3w0XiK99e2ZJVPywdKBfmYdFd6LTb61SbhcuDPm
	GPm42dZ7dCX7OoNIvXGHjhQIG7Syy2qmcwkhooM+ht7ZUXKVzUVPv11PCK9IigT4CBoYfnXJ9vqKx
	ggCY9PXbXltsNGizhSTzPEcpz2n4aITytX4/oEFME3edu6nMSHIGkXVT8HJFODIIwNwl7fiDp3zRS
	eRWtEFR31LrphmWuHk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtfO-0000000EBwF-3LC2;
	Wed, 03 Apr 2024 06:00:10 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrtfK-0000000EBtM-11NN
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 06:00:09 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dcd7c526cc0so5585543276.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 23:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712124001; x=1712728801; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxJSXITYZ9pShDuxFQvxpaL2/3sgcxNx/8xBOuQ2iCk=;
        b=0YcUre11KGYiq2ePo4zspf9Mj0PxJRcjblYoYTkhLOc45jeEnagN4DD+UcFubqz6IF
         6O4IMxAB9YPO0MQBRQs2Au+Z79duluNs8apzsGfg3hmdh+zYYIc+HKYvscBo1dGsBvVX
         TwMR+oOFfbtfYk113F51jrQTd4/aYtBKNZ/Vm2/3eUNVqXNY2iDVQG4gtjazYD119Lj4
         29LWI0CGfdX+4ELBz5nqc2IUoV6COHEKuzRFo6JDI+vdKR/5we6wRUwB87KaU58eqefZ
         vLqqFJyg4v6H0a8wzQdk/MCroxGLthKOCajZuBSKPIS+zsF9J7xz2rhAQG9gqqQkwB4p
         NJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712124001; x=1712728801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxJSXITYZ9pShDuxFQvxpaL2/3sgcxNx/8xBOuQ2iCk=;
        b=Yu+P45c0Bx5QBoSh0jibQv5S6VWREFQKrLvxMII2Tevpy6XCjlBMhxDGPR/TKDGnzA
         GQ/cL3SolnKhkySSe+vrWdikDiORSVR1BhHgKm4GF4bUfnh+qYxrquktVYJh4OOEgP4H
         z7EnzhVFBf6UcPhW+41wnkpemUhxxUWl4wsJjcN3nHvAl+kMALDxUPKfQe3zZmXrLVZp
         NhoCSwFS6rhKxz/c5k10KCgJXSJ0++9U6c4U3HWAqprPt5ZE4zoXGM/PyINW3+t0RElF
         6JAHqUVij2IM+vm75yOQOlHf52xEkw7WYsBWi4bACd2xo9IpQzvZp97L6iEN55z7IR6/
         6/dA==
X-Forwarded-Encrypted: i=1; AJvYcCWJArRZh6+vAyah21/1wMcm0PK3Yf8Dk9SjQYZTJIJ31lL6rljsr6isHZw8nE8q4AOoTN6T0+8Q/M+zk0wSgWqq6ATqCd/mjwNTv1x1V2ne
X-Gm-Message-State: AOJu0YzaraYgck0Ee/wyRyI2xn+xv4STHTVfSQYejpvIN0ccbHKV9GOM
	0LFfW5maSBQUbeoRqIrj6duqQtHsYmdebOy6rZWqHU6LZIcPo4+sNKJQYis2RnyvIIc6vX8hKQT
	lH+/viD9ziPOI9gZHv4ldC4f0w/jEEJZQSJpy
X-Google-Smtp-Source: AGHT+IHF6yOPrbaSAup7jCog58WXJbC6NgZDiM+ULwuH0tlVvkyDWba5Ohyci7jQvdo5tO0oB+yC5pt2quv+tZIAonY=
X-Received: by 2002:a25:ef43:0:b0:dcc:4cdc:e98e with SMTP id
 w3-20020a25ef43000000b00dcc4cdce98emr6405675ybm.5.1712124001329; Tue, 02 Apr
 2024 23:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240402075142.196265-1-wangkefeng.wang@huawei.com> <20240402075142.196265-8-wangkefeng.wang@huawei.com>
In-Reply-To: <20240402075142.196265-8-wangkefeng.wang@huawei.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 2 Apr 2024 22:59:50 -0700
Message-ID: <CAJuCfpFoxP78+P1+4WQcCqMzGv7jpC9V8pR_-R8t8zPUg-t+aA@mail.gmail.com>
Subject: Re: [PATCH 7/7] x86: mm: accelerate pagefault when badaccess
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_230007_117235_FD59CD4B 
X-CRM114-Status: GOOD (  20.85  )
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

T24gVHVlLCBBcHIgMiwgMjAyNCBhdCAxMjo1M+KAr0FNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdm1fZmxhZ3Mgb2Ygdm1hIGFscmVhZHkg
Y2hlY2tlZCB1bmRlciBwZXItVk1BIGxvY2ssIGlmIGl0IGlzIGEKPiBiYWQgYWNjZXNzLCBkaXJl
Y3RseSBoYW5kbGUgZXJyb3IgYW5kIHJldHVybiwgdGhlcmUgaXMgbm8gbmVlZCB0bwo+IGxvY2tf
bW1fYW5kX2ZpbmRfdm1hKCkgYW5kIGNoZWNrIHZtX2ZsYWdzIGFnYWluLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgoKTG9va3Mgc2Fm
ZSB0byBtZS4KVXNpbmcgKG1tICE9IE5VTEwpIHRvIGluZGljYXRlIHRoYXQgd2UgYXJlIGhvbGRp
bmcgbW1hcF9sb2NrIGlzIG5vdAppZGVhbCBidXQgSSBndWVzcyB0aGF0IHdvcmtzLgoKUmV2aWV3
ZWQtYnk6IFN1cmVuIEJhZ2hkYXNhcnlhbiA8c3VyZW5iQGdvb2dsZS5jb20+Cgo+IC0tLQo+ICBh
cmNoL3g4Ni9tbS9mYXVsdC5jIHwgMjMgKysrKysrKysrKysrKystLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvbW0vZmF1bHQuYyBiL2FyY2gveDg2L21tL2ZhdWx0LmMKPiBpbmRleCBhNGNj
MjBkMDAzNmQuLjY3YjE4YWRjNzVkZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3g4Ni9tbS9mYXVsdC5j
Cj4gKysrIGIvYXJjaC94ODYvbW0vZmF1bHQuYwo+IEBAIC04NjYsMTQgKzg2NiwxNyBAQCBiYWRf
YXJlYV9ub3NlbWFwaG9yZShzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlcnJv
cl9jb2RlLAo+Cj4gIHN0YXRpYyB2b2lkCj4gIF9fYmFkX2FyZWEoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MsIHVuc2lnbmVkIGxvbmcgZXJyb3JfY29kZSwKPiAtICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
YWRkcmVzcywgdTMyIHBrZXksIGludCBzaV9jb2RlKQo+ICsgICAgICAgICAgdW5zaWduZWQgbG9u
ZyBhZGRyZXNzLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArICAgICAgICAgIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1MzIgcGtleSwgaW50IHNpX2NvZGUpCj4gIHsKPiAtICAgICAgIHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gICAgICAgICAvKgo+ICAgICAgICAg
ICogU29tZXRoaW5nIHRyaWVkIHRvIGFjY2VzcyBtZW1vcnkgdGhhdCBpc24ndCBpbiBvdXIgbWVt
b3J5IG1hcC4uCj4gICAgICAgICAgKiBGaXggaXQsIGJ1dCBjaGVjayBpZiBpdCdzIGtlcm5lbCBv
ciB1c2VyIGZpcnN0Li4KPiAgICAgICAgICAqLwo+IC0gICAgICAgbW1hcF9yZWFkX3VubG9jayht
bSk7Cj4gKyAgICAgICBpZiAobW0pCj4gKyAgICAgICAgICAgICAgIG1tYXBfcmVhZF91bmxvY2so
bW0pOwo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICB2bWFfZW5kX3JlYWQodm1hKTsK
Pgo+ICAgICAgICAgX19iYWRfYXJlYV9ub3NlbWFwaG9yZShyZWdzLCBlcnJvcl9jb2RlLCBhZGRy
ZXNzLCBwa2V5LCBzaV9jb2RlKTsKPiAgfQo+IEBAIC04OTcsNyArOTAwLDggQEAgc3RhdGljIGlu
bGluZSBib29sIGJhZF9hcmVhX2FjY2Vzc19mcm9tX3BrZXlzKHVuc2lnbmVkIGxvbmcgZXJyb3Jf
Y29kZSwKPgo+ICBzdGF0aWMgbm9pbmxpbmUgdm9pZAo+ICBiYWRfYXJlYV9hY2Nlc3NfZXJyb3Io
c3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgZXJyb3JfY29kZSwKPiAtICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKPiArICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBz
dHJ1Y3QgbW1fc3RydWN0ICptbSwKPiArICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEpCj4gIHsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBUaGlzIE9TUEtF
IGNoZWNrIGlzIG5vdCBzdHJpY3RseSBuZWNlc3NhcnkgYXQgcnVudGltZS4KPiBAQCAtOTI3LDkg
KzkzMSw5IEBAIGJhZF9hcmVhX2FjY2Vzc19lcnJvcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5z
aWduZWQgbG9uZyBlcnJvcl9jb2RlLAo+ICAgICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAg
ICAgICAgdTMyIHBrZXkgPSB2bWFfcGtleSh2bWEpOwo+Cj4gLSAgICAgICAgICAgICAgIF9fYmFk
X2FyZWEocmVncywgZXJyb3JfY29kZSwgYWRkcmVzcywgcGtleSwgU0VHVl9QS1VFUlIpOwo+ICsg
ICAgICAgICAgICAgICBfX2JhZF9hcmVhKHJlZ3MsIGVycm9yX2NvZGUsIGFkZHJlc3MsIG1tLCB2
bWEsIHBrZXksIFNFR1ZfUEtVRVJSKTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gLSAgICAgICAgICAg
ICAgIF9fYmFkX2FyZWEocmVncywgZXJyb3JfY29kZSwgYWRkcmVzcywgMCwgU0VHVl9BQ0NFUlIp
Owo+ICsgICAgICAgICAgICAgICBfX2JhZF9hcmVhKHJlZ3MsIGVycm9yX2NvZGUsIGFkZHJlc3Ms
IG1tLCB2bWEsIDAsIFNFR1ZfQUNDRVJSKTsKPiAgICAgICAgIH0KPiAgfQo+Cj4gQEAgLTEzNTcs
OCArMTM2MSw5IEBAIHZvaWQgZG9fdXNlcl9hZGRyX2ZhdWx0KHN0cnVjdCBwdF9yZWdzICpyZWdz
LAo+ICAgICAgICAgICAgICAgICBnb3RvIGxvY2tfbW1hcDsKPgo+ICAgICAgICAgaWYgKHVubGlr
ZWx5KGFjY2Vzc19lcnJvcihlcnJvcl9jb2RlLCB2bWEpKSkgewo+IC0gICAgICAgICAgICAgICB2
bWFfZW5kX3JlYWQodm1hKTsKPiAtICAgICAgICAgICAgICAgZ290byBsb2NrX21tYXA7Cj4gKyAg
ICAgICAgICAgICAgIGJhZF9hcmVhX2FjY2Vzc19lcnJvcihyZWdzLCBlcnJvcl9jb2RlLCBhZGRy
ZXNzLCBOVUxMLCB2bWEpOwo+ICsgICAgICAgICAgICAgICBjb3VudF92bV92bWFfbG9ja19ldmVu
dChWTUFfTE9DS19TVUNDRVNTKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICAgICAgICAg
fQo+ICAgICAgICAgZmF1bHQgPSBoYW5kbGVfbW1fZmF1bHQodm1hLCBhZGRyZXNzLCBmbGFncyB8
IEZBVUxUX0ZMQUdfVk1BX0xPQ0ssIHJlZ3MpOwo+ICAgICAgICAgaWYgKCEoZmF1bHQgJiAoVk1f
RkFVTFRfUkVUUlkgfCBWTV9GQVVMVF9DT01QTEVURUQpKSkKPiBAQCAtMTM5NCw3ICsxMzk5LDcg
QEAgdm9pZCBkb191c2VyX2FkZHJfZmF1bHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gICAgICAg
ICAgKiB3ZSBjYW4gaGFuZGxlIGl0Li4KPiAgICAgICAgICAqLwo+ICAgICAgICAgaWYgKHVubGlr
ZWx5KGFjY2Vzc19lcnJvcihlcnJvcl9jb2RlLCB2bWEpKSkgewo+IC0gICAgICAgICAgICAgICBi
YWRfYXJlYV9hY2Nlc3NfZXJyb3IocmVncywgZXJyb3JfY29kZSwgYWRkcmVzcywgdm1hKTsKPiAr
ICAgICAgICAgICAgICAgYmFkX2FyZWFfYWNjZXNzX2Vycm9yKHJlZ3MsIGVycm9yX2NvZGUsIGFk
ZHJlc3MsIG1tLCB2bWEpOwo+ICAgICAgICAgICAgICAgICByZXR1cm47Cj4gICAgICAgICB9Cj4K
PiAtLQo+IDIuMjcuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
