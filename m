Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA0A7CE836F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 16:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yk3ncMoMnf6OME3lhQ29ep6DECxLcsjatbpooQ3S7CY=; b=QuMgCYHPBFmB67
	2kUr2nC3Bd0IH0kfWEFD2s4qdoUJ3hnG6q9N6uua09mSRcUQNOF7LN6S78/EZoBiVtI90+dRLUkYu
	F3qRLtiEuAkmedF2IP179uALidH+3yM4tOUuWrt+hgh9AMd3DndIUOv4dumSJjkvvIncQm27fQUNJ
	x+BvEK7QveRpOJRTQ0nX2XJNKySPenzIwKmjtpx+GEKM0gJySAqyi0UDmZNTtlIfOXM81UlVQ2O+Q
	Q1sDMMqCbLAAit19qeD27UyLCIeYgASX0PSCfFxM2DcYr+urzb1KGqyN7LQkabOgPtWOqOXlc8NkH
	dAwV6d5KnEDr2ptJDuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svJG4-00000000ESv-1fXW;
	Mon, 30 Sep 2024 16:28:24 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svJG2-00000000ESZ-09zp
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 16:28:23 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-712422564aaso2779009a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1727713700; x=1728318500; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u26AHe8qW6WrMNznYkx5Wjri5Kg2+jGayT+z3qw7kdo=;
        b=LDczpCEi1duYKuohByFS9ImCmzbyoiNVvLGGIV6K32qFkkBRP+ugbn/+Vu/aHZWorJ
         OsXRjVJ4ZcgAT2F/kiltILB9GnjKL8Ow+5l8rIYdFTA62Hm5u5kD5sLy6UbYyogaFKjo
         UIlupnv00Q82SSWu0zt1sY1VmnvHg7FB8r1poNn9QnSaaWDrB05o5vCYX+V+HT2Lqzdv
         Jw96GpYgOXFljJcBzRDJIM7eKpGgUhh1dnLlAoRNj0XuMRjfvqAWczI0+6tAQyNZmBeJ
         kh2ZLgB2RbsYNDosi0BeZmgTWaVHDS7RSE4knEWxA2vsFIpjG9o0KFO2CoSM7BMnbERN
         2lpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727713700; x=1728318500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u26AHe8qW6WrMNznYkx5Wjri5Kg2+jGayT+z3qw7kdo=;
        b=df2Y1A9oMjyE3NqXS5BWkTC0efX49ciFCgNlbn9HU9wDT8m97TMuznmkN+dAX2qqU3
         DEcKNvMa8rEsse5QPxTA/vEgjqYgarV/zhxap82CjCGpK7D3MsJ2lQxQTtAIT78T1O0p
         vCD8PmoFizspo7rJKFPDzEofdwZOUbskKxACFDbr/xBcJ37lQCQZWwDN+st2mkAdwNNh
         4pNBDfJS0ocA1eZlL1uzssL4R8airk1MyKivvBufTAJlOHx5ZlYm5i2qVXbGIHwArw6/
         utdBKFocpi4MRzh6mG8L04MG6B8eKX7sRHJj0icQ//dy2xlwJ0Dvz2G4+BpB4LiY/Z3d
         6aNw==
X-Forwarded-Encrypted: i=1; AJvYcCWuSMFFIaM9wp40Mj2mSsawrdCDXNdUZJUBFViW0B36FAfDfMFOBuS22mcjXhtElWZ1YlnAf7bbKtMnBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSfaUBpI8jSfEuP/ma9ksYt08W2KGwx5Yu5tE0FqUfFVIbzBeR
	mj7J0gdL4LIyTC6OyeWBpzP4iDYcG7sCyrXkpFKIfXLQBtijiF4/BLYSetZhQwA=
X-Google-Smtp-Source: AGHT+IGM05fYy8IDp69U6l4O00QmQxNfIzJ7eXngleOfu4Zv9vUEqnJjXTMet+NXOfXDlkGLAOJRug==
X-Received: by 2002:a05:6808:14cd:b0:3e0:489b:9bd8 with SMTP id 5614622812f47-3e3acbb96cemr96706b6e.16.1727713700022;
        Mon, 30 Sep 2024 09:28:20 -0700 (PDT)
Received: from sunil-laptop ([106.51.192.229])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e3935c67e6sm2513939b6e.54.2024.09.30.09.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 09:28:18 -0700 (PDT)
Date: Mon, 30 Sep 2024 21:58:10 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Miquel =?utf-8?B?U2FiYXTDqSBTb2zDoA==?= <mikisabate@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com, sudeep.holla@arm.com,
	jeremy.linton@arm.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Prevent a bad reference count on CPU nodes
Message-ID: <ZvrRmqvmVjvmACsd@sunil-laptop>
References: <20240913080053.36636-1-mikisabate@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240913080053.36636-1-mikisabate@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_092822_106085_2A0A22D3 
X-CRM114-Status: GOOD (  26.78  )
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

T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgMTA6MDA6NTJBTSArMDIwMCwgTWlxdWVsIFNhYmF0w6kg
U29sw6Agd3JvdGU6Cj4gV2hlbiBwb3B1bGF0aW5nIGNhY2hlIGxlYXZlcyB3ZSBwcmV2aW91c2x5
IGZldGNoZWQgdGhlIENQVSBkZXZpY2Ugbm9kZQo+IGF0IHRoZSB2ZXJ5IGJlZ2lubmluZy4gQnV0
IHdoZW4gQUNQSSBpcyBlbmFibGVkIHdlIGdvIHRocm91Z2ggYQo+IHNwZWNpZmljIGJyYW5jaCB3
aGljaCByZXR1cm5zIGVhcmx5IGFuZCBkb2VzIG5vdCBjYWxsICdvZl9ub2RlX3B1dCcgZm9yCj4g
dGhlIG5vZGUgdGhhdCB3YXMgYWNxdWlyZWQuCj4gCj4gU2luY2Ugd2UgYXJlIG5vdCB1c2luZyBh
IENQVSBkZXZpY2Ugbm9kZSBmb3IgdGhlIEFDUEkgY29kZSBhbnl3YXlzLCB3ZQo+IGNhbiBzaW1w
bHkgbW92ZSB0aGUgaW5pdGlhbGl6YXRpb24gb2YgaXQganVzdCBwYXNzZWQgdGhlIEFDUEkgYmxv
Y2ssIGFuZAo+IHdlIGFyZSBndWFyYW50ZWVkIHRvIGhhdmUgYW4gJ29mX25vZGVfcHV0JyBjYWxs
IGZvciB0aGUgYWNxdWlyZWQgbm9kZS4KPiBUaGlzIHByZXZlbnRzIGEgYmFkIHJlZmVyZW5jZSBj
b3VudCBvZiB0aGUgQ1BVIGRldmljZSBub2RlLgo+IAo+IE1vcmVvdmVyLCB0aGUgcHJldmlvdXMg
ZnVuY3Rpb24gZGlkIG5vdCBjaGVjayBmb3IgZXJyb3JzIHdoZW4gYWNxdWlyaW5nCj4gdGhlIGRl
dmljZSBub2RlLCBzbyBhIHJldHVybiAtRU5PRU5UIGhhcyBiZWVuIGFkZGVkIGZvciB0aGF0IGNh
c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFNhYmF0w6kgU29sw6AgPG1pa2lzYWJhdGVA
Z21haWwuY29tPgo+IC0tLQo+IEkgd2FzIHdvbmRlcmluZyBpZiB0aGlzIHNob3VsZCBhbHNvIGJl
IHNlbnQgdG8gc3RhYmxlLCBidXQgIEkgaGF2ZSBub3Qgc2Vlbgo+IGEgcmVwb3J0IG9uIGl0LCBh
bmQgdGhpcyBpcyBub3QgcmVzcG9uc2libGUgZm9yIGFuIG9vcHMgb3IgYW55dGhpbmcgbGlrZSB0
aGF0Lgo+IFNvIGluIHRoZSBlbmQgSSBkZWNpZGVkIG5vdCB0bywgYnV0IG1heWJlIHlvdSBjb25z
aWRlciBvdGhlcndpc2UuCj4gCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgNyAr
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiBpbmRleCBkNmMxMDhjNTBjYmEuLmQzMmRmZGJhMDgz
ZSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jCj4gQEAgLTc1LDggKzc1LDcgQEAgaW50IHBvcHVs
YXRlX2NhY2hlX2xlYXZlcyh1bnNpZ25lZCBpbnQgY3B1KQo+ICB7Cj4gIAlzdHJ1Y3QgY3B1X2Nh
Y2hlaW5mbyAqdGhpc19jcHVfY2kgPSBnZXRfY3B1X2NhY2hlaW5mbyhjcHUpOwo+ICAJc3RydWN0
IGNhY2hlaW5mbyAqdGhpc19sZWFmID0gdGhpc19jcHVfY2ktPmluZm9fbGlzdDsKPiAtCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnAgPSBvZl9jcHVfZGV2aWNlX25vZGVfZ2V0KGNwdSk7Cj4gLQlzdHJ1
Y3QgZGV2aWNlX25vZGUgKnByZXYgPSBOVUxMOwo+ICsJc3RydWN0IGRldmljZV9ub2RlICpucCwg
KnByZXY7Cj4gIAlpbnQgbGV2ZWxzID0gMSwgbGV2ZWwgPSAxOwo+IAo+ICAJaWYgKCFhY3BpX2Rp
c2FibGVkKSB7Cj4gQEAgLTEwMCw2ICs5OSwxMCBAQCBpbnQgcG9wdWxhdGVfY2FjaGVfbGVhdmVz
KHVuc2lnbmVkIGludCBjcHUpCj4gIAkJcmV0dXJuIDA7Cj4gIAl9Cj4gCj4gKwlucCA9IG9mX2Nw
dV9kZXZpY2Vfbm9kZV9nZXQoY3B1KTsKPiArCWlmICghbnApCj4gKwkJcmV0dXJuIC1FTk9FTlQ7
Cj4gKwpMR1RNLgoKUmV2aWV3ZWQtYnk6IFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8u
Y29tPgoKVGhhbmtzLApTdW5pbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
