Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B0BE7545E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 18:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mMhWVEXWvQwDLmPjqTlRYTJLFFBNgNGJmvd7f5Nf+Lg=; b=YtvlLHg7jkr1f2
	tflgko4bUkpWwNxrWKIPHMXRwt41c2jxWEcrML8zugn3wdZld70b7b+4xi4JY5yLgIEh3g9+Y95rv
	8ASeyv2neA0PFcRshbeI/tCeUfL8JWiu7iaZPZLGsm8/m0q7QExFMlIg9uKONqKkOTjnG5bZDv17F
	XF7QZZhFCz19hMl8KhK63gWm7XHXTezaLuMF5ymWQ07BrO0m3oKrdaJKwUOVDvU5GZ9sV+HLyq564
	bsuziI6v2ETUWg3tYMyqrUBW6F4ucPHL/JDBUwfYxAsk6+JkiTFttAGRN2FIVryF9eFZ5GtyguHbb
	ObGoIBazUUo1XdMG/7xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkK8-00F8ZO-1Q;
	Tue, 03 Oct 2023 18:40:48 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkK5-00F8Yw-0l
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 18:40:46 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-4547322a756so637270137.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696358439; x=1696963239; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4EHhQcGy2VS2JlcOPiKLjlIFfrg/psFf5RMRLEP3YE=;
        b=tcuuPsRyICyiVZNL9bD/WeMkCEjzyRqgBd/2I8/yXWkskTnU1LEJ5zg3KUxYw56axb
         LQg0mDpzhGD2Te6Q2898BHWAL4yfWthS03TQTI6cKInp/ALx69blhNNkzOJjHrSLTroR
         3G5o6XBla8T5B30ExXRbvQNKVES9UiGwL7/g7VNOoSTkVWGWk9MNLEiY0Jdu1eg+Be1Z
         +sCKB5t9UFQQwv23IzfsLbXV6nXLsdCotFXeIeoBSZLIwqU1/0lbyJyjBCh4q+43xSSn
         7+i6yXtjzFy+onNwoy0LTtDZdk3AT3kxHx4JlB9ggPQLR2RP6sOdaoquwqBIUYJrPQKf
         hfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696358439; x=1696963239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4EHhQcGy2VS2JlcOPiKLjlIFfrg/psFf5RMRLEP3YE=;
        b=rsuYRUgyrfA5f1egdjZMGX/21fZh/OO8E3co7Yy71Bu9nYNryvx/Rt634F//5UnEYE
         +kQESpkcxm7SG8nPsvJPe4TH98P2YtxF3sRzkyr9jvMjApZ8M6Ly+solMGkPAXHKWVK+
         lBQCR+8dIoYm9jSJJarespgH/SDyPkBeX6YQnWWnFQKP3nxZkljilJSbRBasSgBo2BMg
         8DsZMwVoDbCVzHEyMsqgeCzuxEaUUC92ABOIZXbE3a7RqAbYnccSZK+LYfkgHMUDhEPs
         TLtGRzIzlWrxqZU2I3Cp/LLYSvdD7NJ1DEiZzFJH+zV5jP4Tlsg0CQsAmI/X663jcm+9
         ZJnQ==
X-Gm-Message-State: AOJu0YxGQXDdKRWCUKKSaK58XEgGvTRaLAt3TNxrRt1QYTfVpkFxcitP
	xAx4vIAkswwp0I1D8Ny8KH098Gi0rLIplkl04ulTjg==
X-Google-Smtp-Source: AGHT+IEXyXPbfnJlsOBki7NVmiAFCgLoSOf3hPuUmd5KFCUolgJZY900HDpzR6daqk+k9LaODgXmolUHPsjA5BASddI=
X-Received: by 2002:a67:b40b:0:b0:452:74b1:63d7 with SMTP id
 x11-20020a67b40b000000b0045274b163d7mr210462vsl.6.1696358439487; Tue, 03 Oct
 2023 11:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <20231003182407.32198-1-alexghiti@rivosinc.com>
In-Reply-To: <20231003182407.32198-1-alexghiti@rivosinc.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 3 Oct 2023 11:40:03 -0700
Message-ID: <CABCJKud=VqYNuQmw1y7JUSBDuPXpPGDv-WwPOeSmBZtf0RUM=w@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix ftrace syscall handling which are now
 prefixed with __riscv_
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_114045_290788_19CA39A5 
X-CRM114-Status: GOOD (  19.45  )
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

T24gVHVlLCBPY3QgMywgMjAyMyBhdCAxMToyNOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdo
aXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBmdHJhY2UgY3JlYXRlcyBlbnRyaWVzIGZvciBl
YWNoIHN5c2NhbGwgaW4gdGhlIHRyYWNlZnMgYnV0IGhhcyBmYWlsZWQKPiBzaW5jZSBjb21taXQg
MDhkMGNlMzBlMGU0ICgicmlzY3Y6IEltcGxlbWVudCBzeXNjYWxsIHdyYXBwZXJzIikgd2hpY2gK
PiBwcmVmaXhlcyBhbGwgcmlzY3Ygc3lzY2FsbHMgd2l0aCBfX3Jpc2N2Xy4KPgo+IFNvIGZpeCB0
aGlzIGJ5IGltcGxlbWVudGluZyBhcmNoX3N5c2NhbGxfbWF0Y2hfc3ltX25hbWUoKSB3aGljaCBh
bGxvd3MgdXMKPiB0byBpZ25vcmUgdGhpcyBwcmVmaXguCj4KPiBBbmQgYWxzbyBpZ25vcmUgY29t
cGF0IHN5c2NhbGxzIGxpa2UgeDg2L2FybTY0IGJ5IGltcGxlbWVudGluZwo+IGFyY2hfdHJhY2Vf
aXNfY29tcGF0X3N5c2NhbGwoKS4KPgo+IEZpeGVzOiAwOGQwY2UzMGUwZTQgKCJyaXNjdjogSW1w
bGVtZW50IHN5c2NhbGwgd3JhcHBlcnMiKQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0
aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9mdHJhY2UuaCB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
ZnRyYWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gaW5kZXggNzQwYTk3
OTE3MWU1Li4yYjJmNWRmN2VmMmMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9mdHJhY2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiBAQCAt
MzEsNiArMzEsMjcgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nIGZ0cmFjZV9jYWxsX2Fk
anVzdCh1bnNpZ25lZCBsb25nIGFkZHIpCj4gICAgICAgICByZXR1cm4gYWRkcjsKPiAgfQo+Cj4g
Ky8qCj4gKyAqIExldCdzIGRvIGxpa2UgeDg2L2FybTY0IGFuZCBpZ25vcmUgdGhlIGNvbXBhdCBz
eXNjYWxscy4KPiArICovCj4gKyNkZWZpbmUgQVJDSF9UUkFDRV9JR05PUkVfQ09NUEFUX1NZU0NB
TExTCj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX3RyYWNlX2lzX2NvbXBhdF9zeXNjYWxsKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gaXNfY29tcGF0X3Rhc2so
KTsKPiArfQo+ICsKPiArI2RlZmluZSBBUkNIX0hBU19TWVNDQUxMX01BVENIX1NZTV9OQU1FCj4g
K3N0YXRpYyBpbmxpbmUgYm9vbCBhcmNoX3N5c2NhbGxfbWF0Y2hfc3ltX25hbWUoY29uc3QgY2hh
ciAqc3ltLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29uc3QgY2hhciAqbmFtZSkKPiArewo+ICsgICAgICAgLyoKPiArICAgICAgICAqIFNpbmNlIGFs
bCBzeXNjYWxsIGZ1bmN0aW9ucyBoYXZlIF9fcmlzY3ZfIHByZWZpeCwgd2UgbXVzdCBza2lwIGl0
Lgo+ICsgICAgICAgICogSG93ZXZlciwgYXMgd2UgZGVzY3JpYmVkIGFib3ZlLCB3ZSBkZWNpZGVk
IHRvIGlnbm9yZSBjb21wYXQKPiArICAgICAgICAqIHN5c2NhbGxzLCBzbyB3ZSBkb24ndCBjYXJl
IGFib3V0IF9fcmlzY3ZfY29tcGF0XyBwcmVmaXggaGVyZS4KPiArICAgICAgICAqLwo+ICsgICAg
ICAgcmV0dXJuICFzdHJjbXAoc3ltICsgOCwgbmFtZSk7Cj4gK30KCkdvb2QgY2F0Y2gsIHRoYW5r
cyBmb3IgZml4aW5nIHRoaXMhCgpSZXZpZXdlZC1ieTogU2FtaSBUb2x2YW5lbiA8c2FtaXRvbHZh
bmVuQGdvb2dsZS5jb20+CgpTYW1pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
