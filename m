Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29551C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/s4VZsj8C1LTogllhTa/8lfIB99lPhlPcc5v1NhetI=; b=y7Jrx6rDYhcyFA
	vy4AiOWHv3TuIKcg055Gsy542C5+oci4Z+KzXHOcsxTDOqBbCI/r9P10OhC0EoyGbulBbFkjimN3Y
	5VthyUvBJGWpgh+S3IuMT9OJOZ4mxsrdrbmkPsvjKwMzB4qE3dJQbsAiPHOWLGBrvc+Nj0VR93cag
	JZKjCnC3NFN1hNzJ81syEaR3iV8NZkJItgF7LqqdH93QIpsILjiPOOW+UmlKZs94nePKKEplQ7OON
	7I/3Ulfn8znpbZTzu5DhnZXfDPQME65nXqB1fxQLEBABYBM1jjsRj5tVBem3Hqif0sVZMBGGCfJuR
	d+kZIrCHW8mxLwTxz2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLg3R-0000000GGim-021s;
	Mon, 24 Jun 2024 09:32:05 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLg3N-0000000GGi8-2GlJ
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 09:32:04 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a724b3a32d2so110859566b.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jun 2024 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719221520; x=1719826320; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtSoSxfjq8aHhF6gq2sk0dwqY29zGCyMkL+T3Rh2MIE=;
        b=e0WVfMUzSu3qDKHz6JfvOByO3Tik1RA1CynZeS/RXaJEGQ3ByhoFjCgHMD4CiosT8R
         8fj+VbspB6f8GE5cj6qXL/WUCq9irs89FQP8hwR1JPiwLEFuz8PXzh/aetj8DIoUstXJ
         ZZZZIoKYtaATMBiKFm+kwtBg8Dr2/GNmgVJXd5hbz7ECTCTnOu1397TbZ3jY6SiTcB8N
         WiWqSvbd64vrpNizv7due5jCpX1S3jnQBe4hJku1UkkpT4xIb7i8/MEhWCeZPhbWq0IU
         qQ4I5po0UYZ20PXL584nn+n/iYtum2f8wG8nxXGJMjbzLZxIVogb/7RlidTYm8PJJdl8
         gzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719221520; x=1719826320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtSoSxfjq8aHhF6gq2sk0dwqY29zGCyMkL+T3Rh2MIE=;
        b=VUFfSXgbMVBSd6u4H/6mqvbkKlADpF/Om8npGY7qv163iyMeSQ2sP1wTvs2M145wru
         lA9wX1ENdZl590WKH427LKAYjbiNCWv2MtOuRQcF1MRbjYUl8UQzJzmHoJ9wMK0bB+6o
         9BNkyev2k2SwQDFmVP5WF0rJRgNvSnN/k/3riqiWr+AxDk6Uyk9ZKEgANtxJJUWOJTn+
         BKL32yEVmFZZxN4+soJ9EVVhTYf3w2jb2Sz67xwBfSt5iv7pjTd/HJitd7b1BaKBrUFu
         o9p5XLX0Yp9Md2hEIBzoyXopOojmdZs+0nl7R/pVgVfnKm+KcRUF5Z7cPfyMXRR2rNZr
         9PyA==
X-Forwarded-Encrypted: i=1; AJvYcCXJnOiwnyLd3zlAUGdZQWTRGFloUWsPtvDi77IWnf/w1ENRkTho0DaysE5PJH1ypO/YUQnu5E/eO4mgC8hngO1YrHfsFbg+tmPfMEOetLF6
X-Gm-Message-State: AOJu0YyCfBU59VFVQv1N3Ryos2uBjbfmgqSc+DpgU/e2mFAKKoFX8/ov
	PdPC13fJig+WxXQOLw1LZ6LMT8aeC/dckr3oFypL4py4YXQTbkfynhq1bi8YsGEf+4AqqLS3WAH
	YH7mJED60DmnERdPNvPJTXy5RuwKruK/RD/IQxw==
X-Google-Smtp-Source: AGHT+IFVeOm41TPJdia3V+ypKDs5ua30MsXI4dF3qYEF70GUNjAd+SwTuXPVZZMhmO/B5Tw3/mwInQAqPilUcV0OMrk=
X-Received: by 2002:a17:906:7c2:b0:a71:94ce:9b03 with SMTP id
 a640c23a62f3a-a7245b6251amr241286166b.20.1719221519773; Mon, 24 Jun 2024
 02:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240605114100.315918-1-bjorn@kernel.org> <20240605114100.315918-6-bjorn@kernel.org>
In-Reply-To: <20240605114100.315918-6-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 24 Jun 2024 11:31:48 +0200
Message-ID: <CAHVXubhx6VxB3JCXQo_eo-6J27i620ALTBHCnnVif6RG7hpXww@mail.gmail.com>
Subject: Re: [PATCH v4 05/11] riscv: mm: Add pfn_to_kaddr() implementation
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_023201_892381_0678C27B 
X-CRM114-Status: GOOD (  14.92  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

KHJlc2VuZGluZyBhcyBnbWFpbCBjbGllbnQgdHVybmVkIHRvIGh0bWwpCgoKT24gV2VkLCBKdW4g
NSwgMjAyNCBhdCAxOjQx4oCvUE0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBUaGUg
cGZuX3RvX2thZGRyKCkgZnVuY3Rpb24gaXMgdXNlZCBieSBLQVNBTidzIG1lbW9yeSBob3RwbHVn
Z2luZwo+IHBhdGguIEFkZCB0aGUgbWlzc2luZyBmdW5jdGlvbiB0byB0aGUgUklTQy1WIHBvcnQs
IHNvIHRoYXQgaXQgY2FuIGJlCj4gYnVpbHQgd2l0aCBNSFAgYW5kIENPTkZJR19LQVNBTi4KPgo+
IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAtLS0K
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYWdlLmggfCA1ICsrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BhZ2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGFnZS5oCj4gaW5kZXggMTE1YWM5
OGI4ZDcyLi4yMzVmZDQ1ZDk5OGQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wYWdlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BhZ2UuaAo+IEBAIC0xODgs
NiArMTg4LDExIEBAIGV4dGVybiBwaHlzX2FkZHJfdCBfX3BoeXNfYWRkcl9zeW1ib2wodW5zaWdu
ZWQgbG9uZyB4KTsKPgo+ICB1bnNpZ25lZCBsb25nIGthc2xyX29mZnNldCh2b2lkKTsKPgo+ICtz
dGF0aWMgX19hbHdheXNfaW5saW5lIHZvaWQgKnBmbl90b19rYWRkcih1bnNpZ25lZCBsb25nIHBm
bikKPiArewo+ICsgICAgICAgcmV0dXJuIF9fdmEocGZuIDw8IFBBR0VfU0hJRlQpOwo+ICt9Cj4g
Kwo+ICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCj4KPiAgI2RlZmluZSB2aXJ0X2FkZHJfdmFs
aWQodmFkZHIpICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiAtLQo+IDIuNDMuMAo+CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
