Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5859C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 06:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ML3uB6+PvGxCR08xncZLdoTAisMOr9G9vbjmaKphuLI=; b=o1v/EBKDQXiUXT
	ghmJJR1DRyTY1Ly3PJMOl5YxTxd/4LiGQFSBKEpZQkyEKxGwb1tl2mrRJjIKXvKcwPjcquo2jxuVf
	R6pEmwxseYfbKRKsUjV9bM/52lNg2KNufpNFIh3D0xmtRGTjy60/1htxBnoOxIky6kihjgnzNukmF
	R+UKEjhYxC8ahdGbpNQn0X14KhAuIAonOPLJzieNzPGvbc8SAONKvmroWwFWRA0DZeKQDxrAKxEBa
	guuDxH0+++gUrNryPGxbJ/SbJuLRKPVRhEmtMFZelADjuWVOmcxNXqEMXDeo8wBRy02X76NsNpIrI
	NaIJ0V19uKjTK7wJlmSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMlC-00000007eog-1DFI;
	Wed, 27 Mar 2024 06:27:42 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpMl7-00000007en0-3sTP
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 06:27:40 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-21e45ece781so4064892fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 Mar 2024 23:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1711520854; x=1712125654; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9YlwXsqvc7dgwQyElf+0ZLQ4rc4YzdX8Bou4Gf4VCs=;
        b=BF63QS7hf4R2QsQsxcW3bZJjA//K0ApSkEAO6MThFsqZlLYpz0yXaLCdwdGqA2WbHK
         KZvSvFaHmUkpqc7sCOjVBHlc3zS0WJ1NlZaOl79UeHjEIjHOXRozQM5z6FS4x6RobsGg
         38U1YTPUDT8+mJ2xlMyK3GAiQcLqp+ElS5e++1a1woi8rsOVsWGY5Tr4e2Ae/oa1cZdC
         eDCuC74mqouxHJE7lgn3V+8+kNFc4yrGkgVTBYmqtm2ups4it0iInzfCZPAR8e7aEK7W
         D4UWzM9Mk8bXwBTjsgjHF2dcuiwEUnM0+CbQQw+AWiz2MQz/BRD7i+6A31JcMt9ErV4F
         hG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711520854; x=1712125654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9YlwXsqvc7dgwQyElf+0ZLQ4rc4YzdX8Bou4Gf4VCs=;
        b=Fc7wpnp0kwRzcveAxqXONfwlF9Z2psp2lMdtD1CFLo03fQ8qoKC2ayKTa0lbJRP1HE
         O4oll3QmatIV2hU7BYxSSYqcfCcX9Fnx4Q8KRWQl5x3xmG+ixlQ5OqwHLfcJJ2Fk34h4
         2iGdgdqzW8tsNLVsM6lKrS04nZhinztVz5ntinxTK+rgi7sTUurL5FNkev8TvQccltJK
         vYNHfCH3LstJibbuQiURdtcqmq3VhjQW5D4m9rHn6oiES7DkmTvzSdcy+IMnmY8RCwWu
         7xMRVUu2LRKc63w3d/J4GH/A1oHVnwXLplu9vrJ7W2Oc8Naj4DPyz4FhZf4uUCz0JFzQ
         /1XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCvBYAIu8crafaVTn49zxVczz7Ig5+U5jAR5PoEuo3Y5z15qE0fJEcjIQ6Er6+0LnqAvVlaK2HuKRKgAKQfoEXj3t7wxXdDQjI3pcsK5sf
X-Gm-Message-State: AOJu0YxVvJXtnYi7yuni6WydoCueNW/jetEDg65E1Betrl4Wb3ubScZu
	3NZw2fww+OrSPI4SNCNYTfLurQDxFRpojzUfigovzyrwx5YAvVzmm756FOIbWBO414sdtP2Fe2D
	A0qOrW5i/LbL7Sg0HL5vY/hLk3cyVNulhaY6beQ==
X-Google-Smtp-Source: AGHT+IFrg2HoG7q97DhSpbXNc25ham37J0pbg6a9qU7enuIB3n4fknfbf9j25G1aDzy1MVe4/zsyJcVd9XwGgb7dOzo=
X-Received: by 2002:a05:6871:554:b0:222:7a41:b6a0 with SMTP id
 t20-20020a056871055400b002227a41b6a0mr1890669oal.6.1711520853082; Tue, 26 Mar
 2024 23:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240327045035.368512-1-samuel.holland@sifive.com> <20240327045035.368512-9-samuel.holland@sifive.com>
In-Reply-To: <20240327045035.368512-9-samuel.holland@sifive.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 27 Mar 2024 14:27:22 +0800
Message-ID: <CAEEQ3wkjgu22WjV63Xn+sJ=KoZr+rS18OCCG=7Sw7V9hrYMETg@mail.gmail.com>
Subject: Re: [External] [PATCH v6 08/13] riscv: Avoid TLB flush loops when
 affected by SiFive CIP-1200
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_232738_066387_933FD38F 
X-CRM114-Status: GOOD (  22.11  )
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

SGkgU2FtdWVsLAoKT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTI6NTHigK9QTSBTYW11ZWwgSG9s
bGFuZAo8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBJbXBsZW1lbnRhdGlv
bnMgYWZmZWN0ZWQgYnkgU2lGaXZlIGVycmF0YSBDSVAtMTIwMCBoYXZlIGEgYnVnIHdoaWNoCj4g
Zm9yY2VzIHRoZSBrZXJuZWwgdG8gYWx3YXlzIHVzZSB0aGUgZ2xvYmFsIHZhcmlhbnQgb2YgdGhl
IHNmZW5jZS52bWEKPiBpbnN0cnVjdGlvbi4gV2hlbiBhZmZlY3RlZCBieSB0aGlzIGVycmF0YSwg
ZG8gbm90IGF0dGVtcHQgdG8gZmx1c2ggYQo+IHJhbmdlIG9mIGFkZHJlc3NlczsgZWFjaCBpdGVy
YXRpb24gb2YgdGhlIGxvb3Agd291bGQgYWN0dWFsbHkgZmx1c2ggdGhlCj4gd2hvbGUgVExCIGlu
c3RlYWQuIEluc3RlYWQsIG1pbmltaXplIHRoZSBvdmVyYWxsIG51bWJlciBvZiBzZmVuY2Uudm1h
Cj4gaW5zdHJ1Y3Rpb25zLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVl
bC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY2Ogo+ICAtIENsYXJp
ZnkgdGhlIGNvbW1pdCBtZXNzYWdlIGZvciBwYXRjaCA4IGJhc2VkIG9uIE1MIGRpc2N1c3Npb24K
Pgo+IENoYW5nZXMgaW4gdjQ6Cj4gIC0gT25seSBzZXQgdGxiX2ZsdXNoX2FsbF90aHJlc2hvbGQg
d2hlbiBDT05GSUdfTU1VPXkuCj4KPiBDaGFuZ2VzIGluIHYzOgo+ICAtIE5ldyBwYXRjaCBmb3Ig
djMKPgo+ICBhcmNoL3Jpc2N2L2VycmF0YS9zaWZpdmUvZXJyYXRhLmMgfCA1ICsrKysrCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCB8IDIgKysKPiAgYXJjaC9yaXNjdi9tbS90
bGJmbHVzaC5jICAgICAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3Np
Zml2ZS9lcnJhdGEuYyBiL2FyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJhdGEuYwo+IGluZGV4
IDNkOWEzMmQ3OTFmNy4uNzE2Y2ZlZGFkM2EyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvZXJy
YXRhL3NpZml2ZS9lcnJhdGEuYwo+ICsrKyBiL2FyY2gvcmlzY3YvZXJyYXRhL3NpZml2ZS9lcnJh
dGEuYwo+IEBAIC00Miw2ICs0MiwxMSBAQCBzdGF0aWMgYm9vbCBlcnJhdGFfY2lwXzEyMDBfY2hl
Y2tfZnVuYyh1bnNpZ25lZCBsb25nICBhcmNoX2lkLCB1bnNpZ25lZCBsb25nIGltcAo+ICAgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gICAgICAgICBpZiAoKGltcGlkICYgMHhmZmZmZmYp
ID4gMHgyMDA2MzAgfHwgaW1waWQgPT0gMHgxMjAwNjI2KQo+ICAgICAgICAgICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gKwo+ICsjaWZkZWYgQ09ORklHX01NVQo+ICsgICAgICAgdGxiX2ZsdXNoX2Fs
bF90aHJlc2hvbGQgPSAwOwo+ICsjZW5kaWYKPiArCj4gICAgICAgICByZXR1cm4gdHJ1ZTsKPiAg
fQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+IGluZGV4IDQ2M2I2MTVkNzcyOC4uOGUz
Mjk3MjEzNzViIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2gu
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+IEBAIC02Niw2ICs2
Niw4IEBAIHZvaWQgYXJjaF90bGJiYXRjaF9hZGRfcGVuZGluZyhzdHJ1Y3QgYXJjaF90bGJmbHVz
aF91bm1hcF9iYXRjaCAqYmF0Y2gsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgdWFkZHIpOwo+ICB2b2lkIGFyY2hfZmx1c2hfdGxiX2JhdGNoZWRfcGVuZGlu
ZyhzdHJ1Y3QgbW1fc3RydWN0ICptbSk7Cj4gIHZvaWQgYXJjaF90bGJiYXRjaF9mbHVzaChzdHJ1
Y3QgYXJjaF90bGJmbHVzaF91bm1hcF9iYXRjaCAqYmF0Y2gpOwo+ICsKPiArZXh0ZXJuIHVuc2ln
bmVkIGxvbmcgdGxiX2ZsdXNoX2FsbF90aHJlc2hvbGQ7Cj4gICNlbHNlIC8qIENPTkZJR19NTVUg
Ki8KPiAgI2RlZmluZSBsb2NhbF9mbHVzaF90bGJfYWxsKCkgICAgICAgICAgICAgICAgICBkbyB7
IH0gd2hpbGUgKDApCj4gICNlbmRpZiAvKiBDT05GSUdfTU1VICovCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IGluZGV4
IGFkN2JkY2ZjYzIxOS4uMThhZjdiNTA1M2FmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0v
dGxiZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IEBAIC0xMSw3ICsx
MSw3IEBACj4gICAqIEZsdXNoIGVudGlyZSBUTEIgaWYgbnVtYmVyIG9mIGVudHJpZXMgdG8gYmUg
Zmx1c2hlZCBpcyBncmVhdGVyCj4gICAqIHRoYW4gdGhlIHRocmVzaG9sZCBiZWxvdy4KPiAgICov
Cj4gLXN0YXRpYyB1bnNpZ25lZCBsb25nIHRsYl9mbHVzaF9hbGxfdGhyZXNob2xkIF9fcmVhZF9t
b3N0bHkgPSA2NDsKPiArdW5zaWduZWQgbG9uZyB0bGJfZmx1c2hfYWxsX3RocmVzaG9sZCBfX3Jl
YWRfbW9zdGx5ID0gNjQ7Cj4KPiAgc3RhdGljIHZvaWQgbG9jYWxfZmx1c2hfdGxiX3JhbmdlX3Ro
cmVzaG9sZF9hc2lkKHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPiAtLQo+IDIu
NDMuMQo+CgpSZXZpZXdlZC1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
