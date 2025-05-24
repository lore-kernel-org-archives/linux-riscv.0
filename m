Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229DBC54F30
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 09:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWfxK2C63pLXEIiWyWgbuTviE5xvTzndz4gwjGouwLk=; b=T6wpxwkXww5QG/
	xvqHBEsM+hFStNq/FJAXwktFtI2FArO6pfRd6CPLF32nW82d+t0Up0gUd8v8SMxlkAi0erbn0+B/C
	jnyh7yKXW+GosvCJrci9NMVEIUEvCux2IxsT/m/IIeURYszLAFPjumxJ6pO/kqsDLGQx1+QBNupvB
	F91pWO7f0gsWojq9l4CZ035l60rCYU0HBJWXRlB6G92w9+gL/K6yN4tMeJi3L+5opkH/LK5UGIG2j
	cMZdqo04ik3Bo/85hqNBxR7ZDR6Rkq3K3v+kNRC/hrZ8Q6duqrafQZq+iUiBBRWkCuN8zgz/zWBSu
	nSvkBufk3phJ29ZuVe8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIlej-00000005hOT-1rtr;
	Sat, 24 May 2025 09:59:05 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIleg-00000005hNt-2pHi
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 09:59:04 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22e033a3a07so4973005ad.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 02:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748080741; x=1748685541; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocqLAxbpTW/1bNifKrnMpLx5onXsOQ4I8/YyBr4SuME=;
        b=IO1Tp13zLUhUl6BU/cq+HK0nfP80Z7ibUjkKhzpjf5LZqM3guQdJlRNqsNFlR+c70L
         VWuWKCeMdaEroNoH8UUbZHCTTgpb3IOMzgIMXfFrNcjWY9yuPeWzdVExLUpVwC7VdALz
         UdDDgKbMuf4KPzPXrz4JVVy16X4cJmBUgwYypDW99hpdhFHKySOO5OMVksORQHbXoaDE
         11j1YvEihFUWGaWPZdbUtVBDFZr7pgymAn5iBmmratHdworYdLqlwFCu5vFEGhYaBhKs
         bjvbcgQymJ1IFVTmW4OxXSrkfR+1QE7CWGbd+rY+6ORxHOOud5GK/ypIs3THbWj96WuT
         LBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748080741; x=1748685541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocqLAxbpTW/1bNifKrnMpLx5onXsOQ4I8/YyBr4SuME=;
        b=eJbojIUYTsmDgb/eSM/arZNhHBSl7TTP9xRha294T5L5xIqybQA6msjpifXAAr/cNF
         gNpelZVyyv1FUC2D0WBRZ7uKgxa66AfqRSjttcbZ3cNc8sQYB8Tv1p+GnD9Ir9SDyaM5
         rc8shGzNKWHSklPCmZl4GfgDtY2dM8XXFqrK7aGHf0e2tzOhKkIKH+XV/U1ATcvKCYKl
         XQYJmK2xQCaiyCZGeaNsVkd8z9Bg8Wr4XCVXokGuY6OYr8s8y3DuHA4iT18APXK4JWcm
         B7z8sK8Sx+3pCoE9dI301uFlO8/tv0OSqB42DX1+OjLoEZViYbIZ95zEf3VAixzZpJN5
         ysug==
X-Gm-Message-State: AOJu0YwUJqzz8OocuiEWrQYdLxBZQEEwtLY/0nXxs7TfOqFTrz3Oay05
	IxtOMyWkCd1A+BNXrQATU2PIb8EJ899gtT9k5K5XerisD6X8vbf6Zx4wQWOuKRlcTbSdMeGMG45
	/7lOfB5ujh0Hw75gQRkW+nGxSQ8ZScDc=
X-Gm-Gg: ASbGnctTmXzsVEVdA+SrmfNtZHYQ5oVFwnUUxu5Ka+3Q7BGC4p4YZAf6qEh0tJBOO74
	Chp8BzY1H8MIMdub2QUEwkEp6roNoG5PdFZOvip0Pr4xtqzrgGyexsFdW6H8tHQRfChvZLUuUpL
	+S4uP22eCYaYQ3Zf4U18VgWaj+n4FQmRsm/uYzyUTrtA==
X-Google-Smtp-Source: AGHT+IE2sJJFpm2zYNhCrus6o9Tm+1hB4Bg3tMkWf1PFaZiAQHE8PnsnYumXo8N/QCCiUYm8Wmp3OzwjLE3tKYEyCUg=
X-Received: by 2002:a17:902:ef51:b0:223:47d9:1964 with SMTP id
 d9443c01a7336-23414fd3b2emr45444455ad.34.1748080741145; Sat, 24 May 2025
 02:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
In-Reply-To: <9b9eb2337f3d5336ce813721f8ebea51e0b2b553.1747994822.git.rabenda.cn@gmail.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Sat, 24 May 2025 17:58:50 +0800
X-Gm-Features: AX0GCFux6boRM43dnlNp6p2jvrWngA0EVcz9p8sBEXUaLJRJcqD4WZqCUVorpU8
Message-ID: <CAFTtA3MaXonbwnVpCPiOZKem86pkxdPcdxjdQqC5Ywrd8RMHSQ@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: vector: Fix context save/restore with xtheadvector
To: Han Gao <rabenda.cn@gmail.com>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Xiongchuan Tan <tanxiongchuan@isrc.iscas.ac.cn>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_025902_720314_83F909C5 
X-CRM114-Status: GOOD (  13.45  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgNjoyNuKAr1BNIEhhbiBHYW8gPHJhYmVuZGEuY25AZ21h
aWwuY29tPiB3cm90ZToKPgo+IFByZXZpb3VzbHkgb25seSB2MC12NyB3ZXJlIGNvcnJlY3RseSBz
YXZlZC9yZXN0b3JlZCwKPiBhbmQgdGhlIGNvbnRleHQgb2YgdjgtdjMxIGFyZSBkYW1hbmdlZC4K
PiBDb3JyZWN0bHkgc2F2ZS9yZXN0b3JlIHY4LXYzMSB0byBhdm9pZCBicmVha2luZyB1c2Vyc3Bh
Y2UuCj4KPiBGaXhlczogZDg2MzkxMGVhYmFmICgicmlzY3Y6IHZlY3RvcjogU3VwcG9ydCB4dGhl
YWR2ZWN0b3Igc2F2ZS9yZXN0b3JlIikKPiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxyYWJlbmRh
LmNuQGdtYWlsLmNvbT4KPiBUZXN0ZWQtYnk6IFhpb25nY2h1YW4gVGFuIDx0YW54aW9uZ2NodWFu
QGlzcmMuaXNjYXMuYWMuY24+Cj4gUmV2aWV3ZWQtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogQW5keSBDaGl1IDxhbmR5Ym5hY0BnbWFpbC5j
b20+Cgo+IC0tLQo+Cj4gQ2hhbmdlcyBpbiB2MjoKPiAgIEFkZCBmaXggdGFnCj4gICBJbXByb3Zl
IGNvbW1pdCBtZXNhZ2UKPgo+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNj
di9jMjIxYzk4ZGMyMzY5ZWE2OTFlM2ViNjY0YmYwODRkYzkwOTQ5NmY2LjE3NDc5MzQ2ODAuZ2l0
LnJhYmVuZGEuY25AZ21haWwuY29tLwo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9y
LmggfCAxMiArKysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zl
Y3Rvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+IGluZGV4IGU4YTgzZjU1
YmUyYi4uN2RmNjM1NTAyM2EzIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dmVjdG9yLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gQEAgLTIw
MCwxMSArMjAwLDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUo
c3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnNhdmVfdG8sCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgVEhFQURfVlNFVFZMSV9UNFgwRThNOEQxCj4gICAgICAgICAgICAgICAgICAgICAgICAg
VEhFQURfVlNCX1ZfVjBUMAo+ICAgICAgICAgICAgICAgICAgICAgICAgICJhZGQgICAgICAgICAg
ICB0MCwgdDAsIHQ0XG5cdCIKPiAtICAgICAgICAgICAgICAgICAgICAgICBUSEVBRF9WU0JfVl9W
MFQwCj4gKyAgICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNCX1ZfVjhUMAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICJhZGQgICAgICAgICAgICB0MCwgdDAsIHQ0XG5cdCIKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBUSEVBRF9WU0JfVl9WMFQwCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgVEhFQURfVlNCX1ZfVjE2VDAKPiAgICAgICAgICAgICAgICAgICAgICAgICAiYWRkICAgICAg
ICAgICAgdDAsIHQwLCB0NFxuXHQiCj4gLSAgICAgICAgICAgICAgICAgICAgICAgVEhFQURfVlNC
X1ZfVjBUMAo+ICsgICAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZTQl9WX1YyNFQwCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgOiA6ICJyIiAoZGF0YXApIDogIm1lbW9yeSIsICJ0MCIsICJ0
NCIpOwo+ICAgICAgICAgfSBlbHNlIHsKPiAgICAgICAgICAgICAgICAgYXNtIHZvbGF0aWxlICgK
PiBAQCAtMjM2LDExICsyMzYsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92c3Rh
dGVfcmVzdG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqcmVzdG9yZV8KPiAgICAgICAg
ICAgICAgICAgICAgICAgICBUSEVBRF9WU0VUVkxJX1Q0WDBFOE04RDEKPiAgICAgICAgICAgICAg
ICAgICAgICAgICBUSEVBRF9WTEJfVl9WMFQwCj4gICAgICAgICAgICAgICAgICAgICAgICAgImFk
ZCAgICAgICAgICAgIHQwLCB0MCwgdDRcblx0Igo+IC0gICAgICAgICAgICAgICAgICAgICAgIFRI
RUFEX1ZMQl9WX1YwVDAKPiArICAgICAgICAgICAgICAgICAgICAgICBUSEVBRF9WTEJfVl9WOFQw
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgImFkZCAgICAgICAgICAgIHQwLCB0MCwgdDRcblx0
Igo+IC0gICAgICAgICAgICAgICAgICAgICAgIFRIRUFEX1ZMQl9WX1YwVDAKPiArICAgICAgICAg
ICAgICAgICAgICAgICBUSEVBRF9WTEJfVl9WMTZUMAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICJhZGQgICAgICAgICAgICB0MCwgdDAsIHQ0XG5cdCIKPiAtICAgICAgICAgICAgICAgICAgICAg
ICBUSEVBRF9WTEJfVl9WMFQwCj4gKyAgICAgICAgICAgICAgICAgICAgICAgVEhFQURfVkxCX1Zf
VjI0VDAKPiAgICAgICAgICAgICAgICAgICAgICAgICA6IDogInIiIChkYXRhcCkgOiAibWVtb3J5
IiwgInQwIiwgInQ0Iik7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICBhc20g
dm9sYXRpbGUgKAo+IC0tCj4gMi40Ny4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
