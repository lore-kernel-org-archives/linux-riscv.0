Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EF5C83F3E
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLSPBry7gouQakkCsNbLGhYwG3609DQvos+IGCHXsjk=; b=oaToKseSKZbmKj
	GqfgtQTZvRc9SH57EB6Hh12xiYca92Gjo4WgtFvB5nPNIC7DKs/0Kj6gTpNiBP+4EVildwvtPERSe
	9EoPa8nvLgBGyZ00KUo/36f32DusgNkDCTY2cgoknEq3eO4dil9cs9b6E76UdmwuMwJhe15Is8Cqo
	Fl5SX4i0XqyG3DBSY5XRj8W8a/ZSBu3zHErVicWEj00wPF4uH83aAiGBe93pnmEvSfe3IbVMYs4rn
	/C+HSZHVFML15tTg1omumCRQsd6NZoD8Mxx71fl+hG3bAUnPgyLF3KBJ8WXn+wwz7WAn/mK01WxtJ
	3pmfIiF8wrjBoi6JvBJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQru-005TUL-25;
	Tue, 05 Sep 2023 07:53:02 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQrr-005TTM-2x
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 07:53:01 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-76c64da0e46so101128039f.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 00:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693900374; x=1694505174; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/s66p9pwSSI1fSoYztzIq0uZUi+KONsknkXUZ5g+do=;
        b=XATvsQ4PYMDNn/4HnIhMGHUS/OjlGrNyjVWusO+n1saUyzV9yrCFIZtsfGt3HTVwXa
         T8csKq2XW2zIs21AZrMN9GlsP8O0DrsnRezp1zJTe8p9KAuVibYrkdNoGvmJSw/g86D4
         b1Nv7kAwfmh/7Q9Rsw6u7fSCcYxqfHRK2nMiyzOJ9Vk43ZrBgpT7LTY5WUtqogX1XRK0
         MHsQdobsNAi07+O7WDBwaxmKK5v086UqiXJ0WMeBi0IAm1HL6uNoZWHqwvvF45XmEUEC
         V3u2S2qZYO8cAcjP/e+k0GLj+wvPM/PE9J13VfOF/BUjiO8jrHeg5f2AxqO8hXYkT5wc
         xEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693900374; x=1694505174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g/s66p9pwSSI1fSoYztzIq0uZUi+KONsknkXUZ5g+do=;
        b=APmYeJqkSMP0Sx8SIBLHHrFoTJoR0kNjzSa8UdYNDyV5bhA8zAUF2zhWg6sIY9hOfM
         5eboqx+4Tkrh2bUK4qtqfYjKhQVRjl7Z3uZ+eUV/k+4+VNDkITFvfIOFfGV+HKG9mASH
         3n1Yaftcmpkr2B064DFZsFT4ZYDbZf3UT4CKjWiJ0aodcZBDNOpPqlCHAuxtg6FgyrjJ
         pADUtwJ38aakKaFp+Lmd1gvTRDlDmnX60XcgUJRx0uLz6cQIVqZYsEQ6mJYWVrxjbP6E
         z8LHdV92KoxVh86pqihuNj+N5gfYNNmuyWJN8ltcw/WapnMPlQLnHo2MpVVk1eDqvgLV
         O01Q==
X-Gm-Message-State: AOJu0YxBL8W88mBn9wZf7vscG6VKVg1qBIFdWDA5raXA1Aljd+DUsJQr
	kUuH+2lojVOnTdFZ9Jg0oRcxTXLAFX60bfy5Dx0=
X-Google-Smtp-Source: AGHT+IEySP94eVLl7AiEPYh5FDmpxXtZ41VikaFi3omLii57sxmTMraaEjMpLk1CCaU/fWHLAoG/v/+5gKsnnWCUapQ=
X-Received: by 2002:a05:6e02:128f:b0:349:9665:38b with SMTP id
 y15-20020a056e02128f00b003499665038bmr11582256ilq.30.1693900373973; Tue, 05
 Sep 2023 00:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230901110320.312674-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230902-plexiglas-cannot-e4ca8494ef95@spud>
In-Reply-To: <20230902-plexiglas-cannot-e4ca8494ef95@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 5 Sep 2023 08:52:27 +0100
Message-ID: <CA+V-a8umzZ7eGDQ-CAL0+uV7mQcr6HC5BR3b=UWJoV2VjNm-4Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Kconfig.errata: Add dependency for RISCV_SBI in
 ERRATA_ANDES config
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, kernel test robot <lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_005259_954553_1B15BA23 
X-CRM114-Status: GOOD (  14.32  )
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

SGkgQ29ub3IsCgpPbiBTYXQsIFNlcCAyLCAyMDIzIGF0IDEyOjAy4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIEZyaSwgU2VwIDAxLCAyMDIzIGF0IDEy
OjAzOjIwUE0gKzAxMDAsIFByYWJoYWthciB3cm90ZToKPiA+IEZyb206IExhZCBQcmFiaGFrYXIg
PHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBBbmRlcyBl
cnJhdGEgdXNlcyBzYmlfZWNhbGxsKCkgd2hpY2ggaXMgb25seSBhdmFpbGFibGUgaWYgUklTQ1Zf
U0JJIGlzCj4gPiBlbmFibGVkLiBTbyBhZGQgYW4gZGVwZW5kZW5jeSBmb3IgUklTQ1ZfU0JJIGlu
IEVSUkFUQV9BTkRFUyBjb25maWcgdG8KPiA+IGF2b2lkIGFueSBidWlsZCBmYWlsdXJlcy4KPiA+
Cj4gPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPiBD
bG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzA4MzExNjEw
LmVjNmJtMkc4LWxrcEBpbnRlbC5jb20vCj4gPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2Fy
IDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBSZXBsaWVkIGhl
cmUgZWFybGllciwgYnV0IHByZXNzZWQgdGhlIHdyb25nIGtleSAmIGl0IG9ubHkgd2VudCB0byB0
aGUKPiBsaXN0Lgo+IEkgdGhpbmsgdGhpcyBwYXRjaCBwcm9iYWJseSBhbHNvIG5lZWRzIHRvIGdy
b3cgYSBGaXhlcyB0YWcsIGZvcgo+IGNvbW1pdCBmMjg2M2YzMGQxYjAgKCJyaXNjdjogZXJyYXRh
OiBBZGQgQW5kZXMgYWx0ZXJuYXRpdmUgcG9ydHMiKS4KPgo+IFRoZSA0IEtjb25maWcgcGF0Y2hl
cyBpZGVhbGx5IHdvdWxkJ3ZlIGJlZW4gaW4gYSBzZXJpZXMsIHNpbmNlIDMgb2YgdGhlCj4gNCBz
ZWVtIHRvIGJlIGZpeGVzICYgdGhlIDR0aCBkZXBlbmRzIG9uIG9uZSBvZiB0aGUgZml4ZXMgYmVp
bmcgYXBwbGllZC4KPgpNeSBiYWQgSSBzaG91bGQgaSd2ZSBwb3N0ZWQgdGhlbSBhcyBhIHNlcmll
cy4KCkNoZWVycywKUHJhYmhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
