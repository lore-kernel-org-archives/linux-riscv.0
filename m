Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11152E7734B
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 22:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=llYHA/90m1PJX2JEmN8TzPiIkDecJ4ijRIu0TGnAuVQ=; b=kWTpTdQEHynQYq
	QIeBtmj1y359Zt7ZVVgpAx2JoKWqBQ6IZ355QfuhqffmWZRFyFhabFuB/G2d0cIqRdDLIBGdc62gj
	0PxamROwAgsj9NQ/sRHZzdMh+ml9Q5RFnPGVmA/Num1H2QvmmuQnLa8I73Kv55U0PcFQQk2HGzYCU
	KAvX8hGFVoVk6K6Uj5BKuxE3yw3mV1hIdi5PBzPDAqMpzv2+4x43UMGR/X0RN+iUrH4LiEWe4/9S8
	cgewplnOvDuqPE0dM7348GCzSXHfwlR1zQLZrmJUa4XVbvVYAzWAAh0adbYA7F55EFR0VXUMHsykr
	54O0fbBpggZ0iIsh4Hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMMB-008fg5-2N;
	Fri, 29 Sep 2023 22:53:11 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmMM8-008feh-2Y
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 22:53:09 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-45290cda80aso5883866137.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 15:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696027979; x=1696632779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVD0NwiVgmmQvibC1xInA0otG2T0uniQ4SKhb3BsNQI=;
        b=TPXMtHAxxcx1UHG+ICY5xba2vV4JJaTwRRNwrcj5OKFFsQ6CshffkNIptgQek3Bia0
         hvN9+/7iCiT5Rhi4XAp9oSr0ptNo5H0Jv5IpDx4mhfnoiZnIqBEcU0rxrJiX4sUunaZJ
         3Rr8dTol/fzMa23WRMWZH9teu+VFs8XTZ4rQbH1aaF86urL/VjO2MTWzZDBtoaleqJ3n
         Sjd7CbKZK/jg7gh1Y+MPErfkBEslTx5MiCzIsORy2TG1H5VVysJB0unIFRokdICEb2LH
         +3AArBgHnjRLW/HVHU6tUI9ZQe8DNbzFlWrtmFMEpzI5dzP4bjxvhXNWJbWFOZ+l+EYK
         X4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696027979; x=1696632779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vVD0NwiVgmmQvibC1xInA0otG2T0uniQ4SKhb3BsNQI=;
        b=QnIMdMl514DkYMRgtz4yg05j/bTJeA40vd1N9gXsX7pq+OfEHLmy0pdHMFGW2HNN34
         2ytNpKPLCWtGGH8IaYXa1oWkOuKCD8XDJkOCo5lmAhfi7km4OqPXQA0oFGsMafHl1rgd
         w9y6ELsIkQWPUJZGvBd0EnKn3ka7SQCRCtuHMEKWapxjS3AnNpHNXMB7klJA1Qdlx4jZ
         MnjKJy43M7HlX+y1CR2IytyJxIXbGcYxiT6bz6TaQMqXTre078d8ggqF47kABuSyuFyb
         iV8wiI2NVqgnq2OPZAuuigcPfH2sLHSQ7aSmW+kSAjR1SvwufwX2ipNiTFM3JqXC7eDD
         ZQ/g==
X-Gm-Message-State: AOJu0YyLt5/ObLDSjxI1E7DeY9oL03UAT3K7NeFeCsT12mTD+TqVuajn
	qU9yCuLmBKZhIZQKDers775PvxYiVlZEHq5+ak3Nww==
X-Google-Smtp-Source: AGHT+IFIzioa8M+FkbhUdK48/e055YeWZrhKv/naxGAzU7YglwP+Nfq9WJ8bCC7WBhwhOz65LtF9FwPuJudNt5dBpwY=
X-Received: by 2002:a05:6102:134b:b0:452:77f1:f1e8 with SMTP id
 j11-20020a056102134b00b0045277f1f1e8mr4849186vsl.33.1696027978754; Fri, 29
 Sep 2023 15:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com> <202309291452.66ED9B4D83@keescook>
In-Reply-To: <202309291452.66ED9B4D83@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 29 Sep 2023 15:52:22 -0700
Message-ID: <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
To: Kees Cook <keescook@chromium.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_155308_832584_1352391F 
X-CRM114-Status: GOOD (  14.18  )
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

T24gRnJpLCBTZXAgMjksIDIwMjMgYXQgMjo1NOKAr1BNIEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hy
b21pdW0ub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDI5LCAyMDIzIGF0IDA5OjExOjU4UE0g
KzAwMDAsIFNhbWkgVG9sdmFuZW4gd3JvdGU6Cj4gPiBBUkNIX01NQVBfUk5EX0JJVFNfTUFYIGlz
IGJhc2VkIG9uIFN2MzksIHdoaWNoIGxlYXZlcyBhIGZldwo+ID4gcG90ZW50aWFsIGJpdHMgb2Yg
bW1hcCByYW5kb21uZXNzIG9uIHRoZSB0YWJsZSBpZiB3ZSBlbmQgdXAgZW5hYmxpbmcKPiA+IDQv
NS1sZXZlbCBwYWdpbmcuIFVwZGF0ZSBtbWFwX3JuZF9iaXRzX21heCB0byB0YWtlIHRoZSBmaW5h
bCBhZGRyZXNzCj4gPiBzcGFjZSBzaXplIGludG8gYWNjb3VudC4gVGhpcyBpbmNyZWFzZXMgbW1h
cF9ybmRfYml0c19tYXggZnJvbSAyNCB0bwo+ID4gMzMgd2l0aCBTdjQ4LzU3Lgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5lbkBnb29nbGUuY29tPgo+Cj4g
SSBsaWtlIHRoaXMuIElzIFJJU0NWIHRoZSBvbmx5IGFyY2ggd2hlcmUgdGhlIHBhZ2luZyBsZXZl
bCBjYW4gYmUgY2hvc2VuCj4gYXQgYm9vdCB0aW1lPwoKSSBoYXZlbid0IHNlZW4gdGhpcyBlbHNl
d2hlcmUsIGJ1dCBJIGFsc28gaGF2ZW4ndCBsb29rZWQgYXQgYWxsIHRoZQpvdGhlciBhcmNoaXRl
Y3R1cmVzIHRoYXQgY2xvc2VseS4gYXJtNjQgZG9lcyBzb21ldGhpbmcgaW50ZXJlc3RpbmcKd2l0
aCBBUk02NF9WQV9CSVRTXzUyLCBidXQgSSB0aGluayB3ZSBjYW4gc3RpbGwgaGFuZGxlIHRoYXQg
aW4KS2NvbmZpZy4KClNhbWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
