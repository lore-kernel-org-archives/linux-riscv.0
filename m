Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AA56C4167D
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ed97r3uUStaCB5EbDWvGt/umB9TS867OwzmmvdC1Io4=; b=j8kVLgKAWME8Zm
	A0WRr/nrNJRdiPZT0zEOIpgXsZNRL6GxOPVgP1pRHeI0olX81jk0i49lgqrsUjx/DHiqNomZHa30f
	sGhpavtVB6ee/AzjHIDNvmMKsKqlFcsR95JsgtErvuoE5tcRIqUtpSGl7WtiFcHwcAaXY1BHqs9b1
	Jhojh1QJ6ErTKwAeaqLBos3VbFZjtlAdfWAdDYOYlIOBp+scL+RbZJwnwHn3J3feM2f0QPyYry0/B
	see93UYT95vJ5N5kTs2MW8Ys4cK6pPy93JKOlzwSroey183QkPTrnZoPgR4HbweJH0Sn/8TAGLBP+
	5bk3erntlZjwwE+dczvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r185o-006pDa-2i;
	Thu, 09 Nov 2023 16:41:20 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1840-006mpw-2Q
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 16:39:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-507b96095abso1302581e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 08:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1699547964; x=1700152764; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atQyaUFkAqX5qmMmzzgQjx0K17zbIjjTNmAZ0V3dWZI=;
        b=mbVfzZQNcw9AYD6lO1VK9KI33bCuojAeCn6zlkGToN2vYHCnvqQZHaYOU6VmY5rpWH
         Xie1rqXh5GCiWxTiiHrNzsBsB5x2i23aY6oARYz7UjikVKFFOxclU+UivRActJQRpRux
         Qnup+ZkpwNucKHFZLT/0Ch6AN4mfkX5AMHUpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699547964; x=1700152764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atQyaUFkAqX5qmMmzzgQjx0K17zbIjjTNmAZ0V3dWZI=;
        b=tmz2V3c3Voy11vNe1vKScW5fraZecsrpeX88KhyTk4FURoSMMu8z5fagYRkqnItIEe
         1tr8Koeb5Jt7sOUFkN9kDbuqwbl82xM+YrYJZDgY8zeOdd5f4DuiG2GDXnFXCmDMAoJW
         Mmc+IpP+e/+e2cHtEXABxn6cxRPzrQI2hMyfQN+VI8yiJkWnCcbqGTMM7K5eiXLlcqJ1
         dbSX5QJvezky+Lr/jX5lFSNYa3dR7gkThBcxK26o95kCQIH5shZmJW5lkbuc7CcX6Zej
         RN8OV5Y7o9Xpz2Z1AzO96eYFB5tBwiNmPs4+v/HdCjBWgBnKoZ/lZw8W5/S2CJ2xCbPA
         1uXQ==
X-Gm-Message-State: AOJu0YwD2fKL/+OTqwhbSQvGYjV/UPAWmZdSxoXeoBCax67S3zBmNaEG
	z3wIkOsIP1nbyUw+a3uaj7tKVjlWRS2QULY3kEQ8
X-Google-Smtp-Source: AGHT+IHBsz0PHZnxhlurVy6KslRTl6XJyaMy6lqOTIMhnZ9YrCBOsefCTGgSn/XDKAZSr88De4l0TgG/wgOCVtFwBdM=
X-Received: by 2002:a19:5215:0:b0:505:7371:ec83 with SMTP id
 m21-20020a195215000000b005057371ec83mr1970987lfb.48.1699547963798; Thu, 09
 Nov 2023 08:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20231109082128.40777-1-alexghiti@rivosinc.com>
In-Reply-To: <20231109082128.40777-1-alexghiti@rivosinc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 9 Nov 2023 08:39:13 -0800
Message-ID: <CAOnJCUK+guaWFsefnU80tfedkBU9hNWtOX9LqbXVT4JhEUf6Rw@mail.gmail.com>
Subject: Re: [PATCH] drivers: perf: Check find_first_bit() return value
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_083929_174291_49BA1ED0 
X-CRM114-Status: GOOD (  16.65  )
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

T24gVGh1LCBOb3YgOSwgMjAyMyBhdCAxMjoyMeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBXZSBtdXN0IGNoZWNrIHRoZSByZXR1cm4gdmFs
dWUgb2YgZmluZF9maXJzdF9iaXQoKSBiZWZvcmUgdXNpbmcgdGhlCj4gcmV0dXJuIHZhbHVlIGFz
IGFuIGluZGV4IGFycmF5IHNpbmNlIGl0IGhhcHBlbnMgdG8gb3ZlcmZsb3cgdGhlIGFycmF5Cj4g
YW5kIHRoZW4gcGFuaWM6Cj4KPiBbICAxMDcuMzE4NDMwXSBLZXJuZWwgQlVHIFsjMV0KPiBbICAx
MDcuMzE5NDM0XSBDUFU6IDMgUElEOiAxMjM4IENvbW06IGtpbGwgVGFpbnRlZDogRyAgICAgICAg
ICAgIEUgICAgICA2LjYuMC1yYzZ1YnVudHUtZGVmY29uZmlnICMyCj4gWyAgMTA3LjMxOTQ2NV0g
SGFyZHdhcmUgbmFtZTogcmlzY3YtdmlydGlvLHFlbXUgKERUKQo+IFsgIDEwNy4zMTk1NTFdIGVw
YyA6IHBtdV9zYmlfb3ZmX2hhbmRsZXIrMHgzYTQvMHgzYWUKPiBbICAxMDcuMzE5ODQwXSAgcmEg
OiBwbXVfc2JpX292Zl9oYW5kbGVyKzB4NTIvMHgzYWUKPiBbICAxMDcuMzE5ODY4XSBlcGMgOiBm
ZmZmZmZmZjgwYTBhNzdjIHJhIDogZmZmZmZmZmY4MGEwYTQyYSBzcCA6IGZmZmZhZjgzZmVjZGEz
NTAKPiBbICAxMDcuMzE5ODg0XSAgZ3AgOiBmZmZmZmZmZjgyMzk2MWE4IHRwIDogZmZmZmFmODA4
M2RiMWRjMCB0MCA6IGZmZmZhZjgzZmVjZGE0ODAKPiBbICAxMDcuMzE5ODk5XSAgdDEgOiBmZmZm
ZmZmZjgwY2FmZTYyIHQyIDogMDAwMDAwMDAwMDAwZmYwMCBzMCA6IGZmZmZhZjgzZmVjZGE1MjAK
PiBbICAxMDcuMzE5OTIxXSAgczEgOiBmZmZmYWY4M2ZlY2RhMzgwIGEwIDogMDAwMDAwMThmY2Ey
OWRmMCBhMSA6IGZmZmZmZmZmZmZmZmZmZmYKPiBbICAxMDcuMzE5OTM2XSAgYTIgOiAwMDAwMDAw
MDAxMDczNzM0IGEzIDogMDAwMDAwMDAwMDAwMDAwNCBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiBb
ICAxMDcuMzE5OTUxXSAgYTUgOiAwMDAwMDAwMDAwMDAwMDQwIGE2IDogMDAwMDAwMDAxZDFjODc3
NCBhNyA6IDAwMDAwMDAwMDA1MDRkNTUKPiBbICAxMDcuMzE5OTY1XSAgczIgOiBmZmZmZmZmZjgy
NDUxZjEwIHMzIDogZmZmZmZmZmY4MjcyNGU3MCBzNCA6IDAwMDAwMDAwMDAwMDAwM2YKPiBbICAx
MDcuMzE5OTgwXSAgczUgOiAwMDAwMDAwMDAwMDAwMDExIHM2IDogZmZmZmFmODA4M2RiMjdjMCBz
NyA6IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAxMDcuMzE5OTk1XSAgczggOiAwMDAwMDAwMDAwMDAw
MDAxIHM5IDogMDAwMDdmZmZiNDVkNjU1OCBzMTA6IDAwMDA3ZmZmYjQ1ZDgxYTAKPiBbICAxMDcu
MzIwMDA5XSAgczExOiBmZmZmYWY3ZmZmZjYwMDAwIHQzIDogMDAwMDAwMDAwMDAwMDAwNCB0NCA6
IDAwMDAwMDAwMDAwMDAwMDAKPiBbICAxMDcuMzIwMDIzXSAgdDUgOiBmZmZmYWY3ZjgwMDAwMDAw
IHQ2IDogZmZmZmFmODAwMDAwMDAwMAo+IFsgIDEwNy4zMjAwMzddIHN0YXR1czogMDAwMDAwMDIw
MDAwMDEwMCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDAz
Cj4gWyAgMTA3LjMyMDA4MV0gWzxmZmZmZmZmZjgwYTBhNzdjPl0gcG11X3NiaV9vdmZfaGFuZGxl
cisweDNhNC8weDNhZQo+IFsgIDEwNy4zMjAxMTJdIFs8ZmZmZmZmZmY4MDBiNDJkMD5dIGhhbmRs
ZV9wZXJjcHVfZGV2aWRfaXJxKzB4OWUvMHgxYTAKPiBbICAxMDcuMzIwMTMxXSBbPGZmZmZmZmZm
ODAwYWQ5MmM+XSBnZW5lcmljX2hhbmRsZV9kb21haW5faXJxKzB4MjgvMHgzNgo+IFsgIDEwNy4z
MjAxNDhdIFs8ZmZmZmZmZmY4MDY1ZjlmOD5dIHJpc2N2X2ludGNfaXJxKzB4MzYvMHg0ZQo+IFsg
IDEwNy4zMjAxNjZdIFs8ZmZmZmZmZmY4MGNhZjRhMD5dIGhhbmRsZV9yaXNjdl9pcnErMHg1NC8w
eDg2Cj4gWyAgMTA3LjMyMDE4OV0gWzxmZmZmZmZmZjgwY2IwMDM2Pl0gZG9faXJxKzB4NjQvMHg5
Ngo+IFsgIDEwNy4zMjAyNzFdIENvZGU6IDg1YTYgODU1ZSBiMDk3IGZmN2YgODBlNyA5MjIwIGI3
MDkgOTAwMiA0NTAxIGJiZDkgKDkwMDIpIDYwOTcKPiBbICAxMDcuMzIwNTg1XSAtLS1bIGVuZCB0
cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0KPiBbICAxMDcuMzIwNzA0XSBLZXJuZWwgcGFuaWMg
LSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uIGluIGludGVycnVwdAo+IFsgIDEwNy4zMjA3
NzVdIFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5IENQVXMKPiBbICAxMDcuMzIxMjE5XSBLZXJuZWwg
T2Zmc2V0OiAweDAgZnJvbSAweGZmZmZmZmZmODAwMDAwMDAKPiBbICAxMDcuMzMzMDUxXSAtLS1b
IGVuZCBLZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogRmF0YWwgZXhjZXB0aW9uIGluIGludGVy
cnVwdCBdLS0tCj4KPiBGaXhlczogNDkwNWVjMmZiN2U2ICgiUklTQy1WOiBBZGQgc3Njb2ZwbWYg
ZXh0ZW5zaW9uIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxl
eGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmku
YyB8IDUgKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgYi9kcml2ZXJzL3BlcmYvcmlzY3Zf
cG11X3NiaS5jCj4gaW5kZXggNDM5ZGE0OWRkMGE5Li45M2Q3MjkyMTMxNDAgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYwo+ICsrKyBiL2RyaXZlcnMvcGVyZi9yaXNj
dl9wbXVfc2JpLmMKPiBAQCAtNjg3LDYgKzY4NywxMSBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgcG11
X3NiaV9vdmZfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkZXYpCj4KPiAgICAgICAgIC8qIEZpcm13
YXJlIGNvdW50ZXIgZG9uJ3Qgc3VwcG9ydCBvdmVyZmxvdyB5ZXQgKi8KPiAgICAgICAgIGZpZHgg
PSBmaW5kX2ZpcnN0X2JpdChjcHVfaHdfZXZ0LT51c2VkX2h3X2N0cnMsIFJJU0NWX01BWF9DT1VO
VEVSUyk7Cj4gKyAgICAgICBpZiAoZmlkeCA9PSBSSVNDVl9NQVhfQ09VTlRFUlMpIHsKPiArICAg
ICAgICAgICAgICAgY3NyX2NsZWFyKENTUl9TSVAsIEJJVChyaXNjdl9wbXVfaXJxX251bSkpOwo+
ICsgICAgICAgICAgICAgICByZXR1cm4gSVJRX05PTkU7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgZXZlbnQgPSBjcHVfaHdfZXZ0LT5ldmVudHNbZmlkeF07Cj4gICAgICAgICBpZiAoIWV2ZW50
KSB7Cj4gICAgICAgICAgICAgICAgIGNzcl9jbGVhcihDU1JfU0lQLCBCSVQocmlzY3ZfcG11X2ly
cV9udW0pKTsKPiAtLQo+IDIuMzkuMgo+CgoKUmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgoKLS0gClJlZ2FyZHMsCkF0aXNoCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
