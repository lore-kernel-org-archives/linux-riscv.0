Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE977C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 12:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fl5Ah19ctWvCgXzgLkLB6zx8fBON+rdBjvzHRjPRzmc=; b=khPNhDadAmnjNz
	ttoy2UCUkMduyWUSMhHQpnl01blA/eHzlF1Cdfai1juMbIe/wrUN5Hlo1XqH2bgOPlwpSPCdvm9yR
	5RAq0joDR7XNb6INYluZW5o8B6Y3hWtMUYFy4BNB30CF7Wj2GYBuSvkWiDJBKfq8q5Hp2Db5mFv4c
	8CC8uHXsgvhUp8hEHHa5znz20LszOcS2LVSRtwz0VJKRsP9+Y6yGpKHCLC1LhfNOjizMEI4Uaq7O6
	r+A8tlKh2vcQkDjOyZEL2b4ivQ2rF2SZ72Wm5xkhEYbv0No8rugd/clALa69iMEtLMUPOllcWeuxM
	FOfmdXSFxRDf/phgE+ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPM9t-003HRD-0R;
	Fri, 28 Jul 2023 12:01:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPM9q-003HQF-10
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 12:01:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D689261FCF
	for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 12:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EA28C433CB
	for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690545680;
	bh=1/UmSwM6laJjJfl4c22BmZn/PgYb/NIjRBj/+WbLxQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Z2p3bhYsstCSQsrPUJCbWGlQ2i6kpqJ0Fgg4FM3ctamG5M/FXKhAVcumBbAA4UiBI
	 Sx+1fM38CqIrmm60Le7zvWq2YVIn40945jHMWe9v2RUAfB+epAqqApjLQhtcFswMmM
	 v1oWZhY47beNRmDO+ZkwQRzquAyUJKaudxEEmrQGvDihmBrOM2aRq964rr73+wl70b
	 iu4tnKSBOg9kkmBM2ugrGZSc5MjbwX4fse53lBcDGYB/f6c20CdH0SCM8PX+slLXci
	 VJVwqoBM4f9klYGxey8ilhohL6solprr8oQzksDiRGkkL2/B9/+Vdif5YO1LwQdl9S
	 ZG0/PPeqXvL9Q==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5221b90f763so2667916a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 05:01:20 -0700 (PDT)
X-Gm-Message-State: ABy/qLZaB0EpKYv+uff3K1U5tNZoyY1KAC5GmLWw/S9xZUmIzXWLT0l8
	wPWec30aqndbGfCbspgB1z1frx3VK5julWvlvOI=
X-Google-Smtp-Source: APBJJlHEfyGgPAYcqNOw6srjukfIwgKqw571Tya4scu1+5ZCK644utqy+5IG6h2ZfO/GZRfPCw5Jtm8FNa+Bpo1QA2Y=
X-Received: by 2002:aa7:da81:0:b0:522:2f8c:8953 with SMTP id
 q1-20020aa7da81000000b005222f8c8953mr1454781eds.39.1690545678516; Fri, 28 Jul
 2023 05:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221124094845.1907443-1-debug@rivosinc.com> <20230720001852.GA572618@google.com>
 <CAJF2gTRFvSvEvQeDugdp73o7w4ArdtQ99JScEbLkaLnFcftVcA@mail.gmail.com> <CABCJKueNhc8qCbZbHJqdCB+PHHy0u5ETP4uWfpWBRaOMX6U6hA@mail.gmail.com>
In-Reply-To: <CABCJKueNhc8qCbZbHJqdCB+PHHy0u5ETP4uWfpWBRaOMX6U6hA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 28 Jul 2023 20:01:07 +0800
X-Gmail-Original-Message-ID: <CAJF2gTThgCp8-KzghR0cFqDWXxZ2byLtLVF91GdRvBid7U+_aA@mail.gmail.com>
Message-ID: <CAJF2gTThgCp8-KzghR0cFqDWXxZ2byLtLVF91GdRvBid7U+_aA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: VMAP_STACK overflow detection thread-safe
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Deepak Gupta <debug@rivosinc.com>, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_050122_413012_E1E2E8EF 
X-CRM114-Status: GOOD (  15.20  )
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

T24gVHVlLCBKdWwgMjUsIDIwMjMgYXQgMTI6MzTigK9BTSBTYW1pIFRvbHZhbmVuIDxzYW1pdG9s
dmFuZW5AZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBhdCA4OjA2
4oCvQU0gR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwg
SnVsIDIwLCAyMDIzIGF0IDg6MTnigK9BTSBTYW1pIFRvbHZhbmVuIDxzYW1pdG9sdmFuZW5AZ29v
Z2xlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEFyZSB5b3UgcGxhbm5pbmcgb24gcmVzZW5kaW5n
IHRoaXMgcGF0Y2g/IEkgc2VlIGl0IGRpZG4ndCBnYWluIG11Y2gKPiA+ID4gdHJhY3Rpb24gbGFz
dCB0aW1lLCBidXQgdGhpcyBsb29rcyBsaWtlIGEgbXVjaCBjbGVhbmVyIHNvbHV0aW9uIGZvcgo+
ID4gPiBzZWxlY3RpbmcgdGhlIG92ZXJmbG93IHN0YWNrIHRoYW4gaGF2aW5nIGEgYHNoYWRvd19z
dGFja2AgYW5kIGNhbGxpbmcKPiA+ID4gdG8gQyB0byBjb21wdXRlIHRoZSBwZXItQ1BVIG9mZnNl
dC4gVGhlIGFzbV9wZXJfY3B1IG1hY3JvIGFsc28gd291bGQKPiA+ID4gY29tZSBpbiBoYW5keSB3
aGVuIGltcGxlbWVudGluZyBDT05GSUdfU0hBRE9XX0NBTExfU1RBQ0ssIHdoaWNoIHdlJ2QKPiA+
ID4gbGlrZSB0byBoYXZlIG9uIFJJU0MtViB0b28uCj4gPiBJIHJlbWVtYmVyIHdlIGVuZGVkIHVw
IHdpdGggYW4gYXRvbWljIGxvY2sgbWVjaGFuaXNtIGluc3RlYWQgb2YgcGVyY3B1Cj4gPiBvZmZz
ZXQsIHNvIHdoYXQncyB0aGUgYmVuZWZpdCBvZiBwZXJjcHUgc3R5bGUgaW4gb3ZlcmZsb3dfc3Rh
Y2sgcGF0aD8KPgo+IFRoZSBiZW5lZml0IGlzIG5vdCBuZWVkaW5nIGEgc2VwYXJhdGUgdGVtcG9y
YXJ5IHN0YWNrIGFuZCBsb2NrcyBqdXN0Ck9oLCB5b3UgY29udmluY2VkIG1lIGl0IGNvdWxkIHNh
dmUgYW5vdGhlciAxS0Igb2YgbWVtb3J5LgoKQWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJu
ZWwub3JnPgoKPiB0byBjb21wdXRlIHRoZSBwZXItQ1BVIG9mZnNldC4gV2l0aCBDT05GSUdfU0hB
RE9XX0NBTExfU1RBQ0ssIHdlIHdvdWxkCj4gYWxzbyBuZWVkIGEgInNoYWRvdyIgc2hhZG93IGNh
bGwgc3RhY2sgaW4gdGhpcyBjYXNlIGJlZm9yZSBjYWxsaW5nIHRvCj4gQyBjb2RlLCBhdCB3aGlj
aCBwb2ludCBjb21wdXRpbmcgdGhlIG9mZnNldHMgZGlyZWN0bHkgaW4gYXNzZW1ibHkgaXMKPiBq
dXN0IHNpZ25pZmljYW50bHkgY2xlYW5lciBhbmQgd2l0aG91dCBjb25jdXJyZW5jeSBpc3N1ZXMu
Cj4KPiBTYW1pCgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
