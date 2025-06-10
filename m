Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944FDC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 22:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=GiCKD5cW1RFK6EnQ9gnwtd5i63M0yZFqVTn00+0trrE=; b=Ugg3Y29mYghrNtMedoRuSGRcDc
	PI25aVZnAHf6R7/mWhLPrnu19U07iabtG3k+0nYJqMQLxtQfwAdd0hJfjgfpHJWFXAEPsR/CKN1qj
	mlUK0q7jwU0CYxqeDG2L95De/VhqYSWTTBFBGXKoBUKUpOX+Rr8vwXj5Kf5uW0xoXD7uL/L0IT/iO
	zIv0wZbJ4pVYIMCsTTTsOgXkXqk4jF0bemJFR0/M7OP2LLxtI5HbpWp1V3id+YUioyfq/VGBZqrsi
	TC8KleWnoZHADsGSDTEIr8VCWgN1/nUz7sywr+dWweJ9SpPRM3ttA4+o2yexEIMBUfhE90Eg31oQl
	C2PykENQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7oD-00000008Jx3-1C7x;
	Tue, 10 Jun 2025 22:51:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP76V-00000008B73-2vFW
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 22:06:00 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-236192f8770so2423775ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 15:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749593159; x=1750197959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHqcA3zVz9S368+hvL9R5MdY9BW6tTYhYF+8x4BDYC8=;
        b=W7pNPArt/0nLIy2wyVShdk6Puo41B9TSYt+6dm4GKd40n9oKbQPaMzinTvkzd2RfGs
         Eavs07RfWGNcVkbZnSg+XWXcHFRg7Jow/bmfO6B7Vf6Sx6YNv9RCIaNDfBnhE80KEHpy
         CXltfVMTQrLHzrhHSnemksXpsCYjplGJql08337zXpNTXdZ8uNSUj8VG7cWkAhSfQmtc
         be9fMVHHccCMKY/Ves+8bc63lAhi9+vViOBz0fGC07f6w0qV8+5c4edsQquPiMQxr7IE
         apoXj4nGYRYbY/2SNNqHjiSwPpwvaeHlzuzBrOJK7AjJFAoqT+rNqfV3OW0r+SU13uhx
         tROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749593159; x=1750197959;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHqcA3zVz9S368+hvL9R5MdY9BW6tTYhYF+8x4BDYC8=;
        b=FKKKTY7GLx9KvLx21aBFRRGq/6TA+M/vhEBkxGHa2x56VY671iDxnGTEAijE4lBiLv
         2ZkxfTxJcs/5JWfzoM/pwXjcEXRCW0vMcnqogLSUkQzsvuaz5O/vXXchR2OQ+/sfN9ey
         DVlgbMrVjFIsO4W/kVYN5KMYcIQuGjDMxnOjvg6PCCHNkt9iIFtTlctWhUtVBuhxlO+S
         LRrkDbk39nPz+XRNhPt9GCiVEHUu1BGGCefYBm7Ii6mbwS9UzvF9i2b7Cc+m+zWQckd7
         4cGG55c+evXyFeR2jhJptlkEm6vjHzQvB29aQy9lHjCPlK7jLOL0phV7+7z7EOaPHxOI
         A0ag==
X-Forwarded-Encrypted: i=1; AJvYcCU6DKYjh/NAuHsanmnTrA1NCmYcvU5erpo4YPHnvHUEhiJ0V+HRSml+WIsouF4fzT3JxwfzmZ0YKZtHqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTAJJ6Yisw4jequQNQbQEUykr5vdl9RhWr+hzFW1Uf3qx5m2cD
	9XE27bYhIQs+IPgqga3lPh47JIEzBMTn+JQ3ibl0Ih0IevZboV8sPyIuWvKntwNPjR8=
X-Gm-Gg: ASbGncuqHIEwoSfsxUM/AI+zFHLCGHHISfbrrM6NLGG/I633I01DdgrvwwWxqSh+95O
	jiih+9OfF1Q1t2K9MANIqsB/PD43m+hkyt0lbsjkGxaXJRHGGWQEBGSb1cPUVzyTEF+QdxEf4uE
	NGYVtpxQzoVYJZ0w8ZpFj0JIkwL3NpnKq1BW609FD/fcPi+tIyB56ssb6mCVmjD1BDsCCeEWKxy
	39jqYs7LO+9opB4dZndhmE2Z8t4mg03+QQUogxkqL+PuOaPIWx5ycdLhmOGMcia8jxtH0TSv/zx
	7kTTT5ixAoE4uoCPFOvNSDZbDEBM+xVJxfVv4WYQBVhP1tKK6COH+oV++MYB
X-Google-Smtp-Source: AGHT+IFDADkuWil1bWnN6dI1d8MxdEDW3cXaZee41rfaousESkYjlPck3T795KMl0sR8ywtHR+O3Jw==
X-Received: by 2002:a17:902:f60d:b0:215:a303:24e9 with SMTP id d9443c01a7336-2364169f4aamr11793605ad.3.1749593158758;
        Tue, 10 Jun 2025 15:05:58 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2360340fbffsm75592285ad.197.2025.06.10.15.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 15:05:58 -0700 (PDT)
Date: Tue, 10 Jun 2025 15:05:58 -0700 (PDT)
X-Google-Original-Date: Tue, 10 Jun 2025 15:05:50 PDT (-0700)
Subject: Re: [PATCH] riscv: vector: fix xtheadvector save/restore
In-Reply-To: <CAAT7Ki8Z5O61j8bS3OkdYMbcnfJBY18zxJe=qZeJWCpYTibReg@mail.gmail.com>
CC: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Charlie Jenkins <charlie@rivosinc.com>,
  jesse@rivosinc.com, andybnac@gmail.com, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rabenda.cn@gmail.com
Message-ID: <mhng-08D1FAC4-22A7-424E-A1C8-89B71D89BF01@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_150559_734252_AF238124 
X-CRM114-Status: GOOD (  18.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMyBNYXkgMjAyNSAwMjo0Njo1MCBQRFQgKC0wNzAwKSwgcmFiZW5kYS5jbkBnbWFp
bC5jb20gd3JvdGU6Cj4gSSB3aWxsIHJlbGVhc2UgdjIgbGF0ZXIgdG8gYWRkIGV4cGxhbmF0aW9u
IGFuZCBhZGQgZml4IHRhZwoKU29ycnkgaWYgSSBtaXNzZWQgaXQsIGJ1dCBJIGRvbid0IHNlZSBh
IHYyIChJJ20gc2NydWJiaW5nIHRocm91Z2ggc3R1ZmYgCnBvc3QgbWVyZ2Ugd2luZG93KS4KCj4K
PiBUaGFua3MsCj4KPiBIYW4KPgo+IE9uIEZyaSwgTWF5IDIzLCAyMDI1IGF0IDQ6NTTigK9QTSBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Pgo+PiBIaSBIYW4sCj4+Cj4+
IE9uIDUvMjIvMjUgMTk6MjcsIEhhbiBHYW8gd3JvdGU6Cj4+ID4gRml4IFsxXSBzYXZlL3Jlc3Rv
cmUgdmVjdG9yIHJlZ2lzdGVyIGVycm9yCj4+ID4KPj4gPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDExMTMteHRoZWFkdmVjdG9yLXYxMS05LTIzNmMyMjc5MWVmOUByaXZv
c2luYy5jb20vIFsxXQo+Pgo+Pgo+PiBXb3VsZCB5b3UgbWluZCByZXBocmFzaW5nIHRoZSBsb2c/
IEl0IHNob3VsZCBleHBsYWluIHdoYXQgd2FzIHdyb25nIGFuZAo+PiBob3cgeW91IGZpeGVkIGl0
Lgo+Pgo+PiBUaGFua3MsCj4+Cj4+IEFsZXgKPj4KPj4KPj4gPgo+PiA+IFNpZ25lZC1vZmYtYnk6
IEhhbiBHYW8gPHJhYmVuZGEuY25AZ21haWwuY29tPgo+PiA+IC0tLQo+PiA+ICAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS92ZWN0b3IuaCB8IDEyICsrKysrKy0tLS0tLQo+PiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4gPgo+PiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZWN0b3IuaAo+PiA+IGluZGV4IGU4YTgzZjU1YmUyYi4uN2RmNjM1NTAyM2EzIDEwMDY0
NAo+PiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPj4gPiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4+ID4gQEAgLTIwMCwxMSArMjAwLDExIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0IF9fcmlzY3Zf
dl9leHRfc3RhdGUgKnNhdmVfdG8sCj4+ID4gICAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZT
RVRWTElfVDRYMEU4TThEMQo+PiA+ICAgICAgICAgICAgICAgICAgICAgICBUSEVBRF9WU0JfVl9W
MFQwCj4+ID4gICAgICAgICAgICAgICAgICAgICAgICJhZGQgICAgICAgICAgICB0MCwgdDAsIHQ0
XG5cdCIKPj4gPiAtICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNCX1ZfVjBUMAo+PiA+ICsg
ICAgICAgICAgICAgICAgICAgICBUSEVBRF9WU0JfVl9WOFQwCj4+ID4gICAgICAgICAgICAgICAg
ICAgICAgICJhZGQgICAgICAgICAgICB0MCwgdDAsIHQ0XG5cdCIKPj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgVEhFQURfVlNCX1ZfVjBUMAo+PiA+ICsgICAgICAgICAgICAgICAgICAgICBUSEVB
RF9WU0JfVl9WMTZUMAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAiYWRkICAgICAgICAgICAg
dDAsIHQwLCB0NFxuXHQiCj4+ID4gLSAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZTQl9WX1Yw
VDAKPj4gPiArICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNCX1ZfVjI0VDAKPj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgOiA6ICJyIiAoZGF0YXApIDogIm1lbW9yeSIsICJ0MCIsICJ0NCIp
Owo+PiA+ICAgICAgIH0gZWxzZSB7Cj4+ID4gICAgICAgICAgICAgICBhc20gdm9sYXRpbGUgKAo+
PiA+IEBAIC0yMzYsMTEgKzIzNiwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19yaXNjdl92X3Zz
dGF0ZV9yZXN0b3JlKHN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICpyZXN0b3JlXwo+PiA+ICAg
ICAgICAgICAgICAgICAgICAgICBUSEVBRF9WU0VUVkxJX1Q0WDBFOE04RDEKPj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgVEhFQURfVkxCX1ZfVjBUMAo+PiA+ICAgICAgICAgICAgICAgICAgICAg
ICAiYWRkICAgICAgICAgICAgdDAsIHQwLCB0NFxuXHQiCj4+ID4gLSAgICAgICAgICAgICAgICAg
ICAgIFRIRUFEX1ZMQl9WX1YwVDAKPj4gPiArICAgICAgICAgICAgICAgICAgICAgVEhFQURfVkxC
X1ZfVjhUMAo+PiA+ICAgICAgICAgICAgICAgICAgICAgICAiYWRkICAgICAgICAgICAgdDAsIHQw
LCB0NFxuXHQiCj4+ID4gLSAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZMQl9WX1YwVDAKPj4g
PiArICAgICAgICAgICAgICAgICAgICAgVEhFQURfVkxCX1ZfVjE2VDAKPj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgImFkZCAgICAgICAgICAgIHQwLCB0MCwgdDRcblx0Igo+PiA+IC0gICAgICAg
ICAgICAgICAgICAgICBUSEVBRF9WTEJfVl9WMFQwCj4+ID4gKyAgICAgICAgICAgICAgICAgICAg
IFRIRUFEX1ZMQl9WX1YyNFQwCj4+ID4gICAgICAgICAgICAgICAgICAgICAgIDogOiAiciIgKGRh
dGFwKSA6ICJtZW1vcnkiLCAidDAiLCAidDQiKTsKPj4gPiAgICAgICB9IGVsc2Ugewo+PiA+ICAg
ICAgICAgICAgICAgYXNtIHZvbGF0aWxlICgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
