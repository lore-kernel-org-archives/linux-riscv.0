Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91CBE732EA
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 16:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdFkeUGoIZPC/lk/xi447Ioe6fbtIob5Z6cFTtwrhMw=; b=L1lYPtPuPCydSA
	c1Lc496uKn7Oe9mcCquDuekGeVfxZgDBvDni6zlJuZgR1ExcZ+bGArmUGNdPPH+gXKi6npLS95wZ4
	+3FbOoc8GyAZcmve/QFmcgDY4fAVvoCynXfCWiJzyfXvFiOfZNuv5NLtpPR3ddDimdm4DPh3xUiVK
	Oelq76z1sOADg9h9KlztEVhN29S3EEdJA8msm2xxbS0fD7lMvyQCcfmZl1nAoMV/ujpsI0Ba13ZoB
	g+4BheUJPKr1tFIEdhS3Xl/849aPgVJi1eXXHrff6oAy4NFoxfbbh3P7izUBMqgDFHLllcbEuVqJm
	IoEJuCBUzteVFtTN9Lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltxQ-0063XY-0E;
	Thu, 28 Sep 2023 16:33:44 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qltxN-0063UX-0w
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 16:33:42 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-65b2463d651so33315226d6.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695918819; x=1696523619; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kI7xhtv1up4cUf/uSqI2zpGGqMta0B7Fjm2QJg7v1Ho=;
        b=m6RyszFhyn9Q2wXkafl4JUg6KBUiLvho4WvVsj04b3jew7hwoRMKcU0YfhClH5qj/T
         240FVUmYKLOWMkvP4av75fpwToi8TDn023xRThPuanuJ+17fyQW5roeRqUZ16BRW9oFb
         joEKtwxBJUXd+cU5uGeED8Qb2B0xHTpUB1KIobuqblQHwuyn94ADLo/rjQtS1NWD9ge6
         tzaOeG3hJKsqt4++b2e+eixw+DhUToSXBNvimwb4uNDxeb/gGXxVOzrtPMumucuW6pZ1
         vi7BIRxjJUVcg3+05TgWlPZeO8iI5Gn0UDJ8GU1BYIE1NSBVe0r7KQIEz7oeMIc93Ms0
         /t/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695918819; x=1696523619;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kI7xhtv1up4cUf/uSqI2zpGGqMta0B7Fjm2QJg7v1Ho=;
        b=mtOQ9v3WQASYT6j9Y7jgviFLV/+j39OFAesMPPrTdIXh+P7md6RhCGacb8Cird+FO5
         O8YquuXlZFSCsnwDaU0j+A9loFa7++IHha9NNu2wjkuDC7GSIgp486Cr6pUlV9/Dcgo+
         6XJXLn2lhqgNo+Tn5AaklUoxfg48JoCLa+AmQZX+8I+y4WhBHa7DdVbw2nr17PPmBbm8
         nSpByHLlDNjsaf9pwWYxIeKsAvOqGdtc5FWXeEU7RwPBB63epk6YaZWmfCAvjsCGMtLk
         FUafCcv/VYWyeulzmwNIQKDR0kEVPLw+YrGPGoigkTF6vfkvw8HYoe2J7oZCnpsTXOuz
         5WGw==
X-Gm-Message-State: AOJu0Yw4BK3tGxQEg0a9/JOYV2nRvH4SJc4BaRZdjM9r0xxLZcGTTVT1
	65MsGP5BXVhV5nOfgSO7zFU2+A==
X-Google-Smtp-Source: AGHT+IEJQKbMz2k1XTUOPKvzbFD6l40vnHDCsN9RGiWm/EBpa2E3iae718GdN0kO/vCFkGt/QgVjjg==
X-Received: by 2002:a0c:dd87:0:b0:658:a043:376b with SMTP id v7-20020a0cdd87000000b00658a043376bmr1628798qvk.8.1695918819251;
        Thu, 28 Sep 2023 09:33:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:5086:8bae:a4b0:bdad? ([2600:1700:2000:b002:5086:8bae:a4b0:bdad])
        by smtp.gmail.com with ESMTPSA id x18-20020a0cb212000000b0064733ac9a9dsm6755734qvd.122.2023.09.28.09.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 09:33:38 -0700 (PDT)
Message-ID: <5f762ab8-c4d3-4ccb-af77-10c2692e5ec2@sifive.com>
Date: Thu, 28 Sep 2023 11:33:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock_event
 rating
Content-Language: en-US
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor.dooley@microchip.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230928104520.24768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <4e4bf02b-2264-491e-9b71-ae3b5ad7fc39@sifive.com>
 <CA+V-a8sSmy-UNwsB3b_yuETTRGS2fBWvS4sTMaVghTWm6oUb+Q@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CA+V-a8sSmy-UNwsB3b_yuETTRGS2fBWvS4sTMaVghTWm6oUb+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_093341_352071_621846D1 
X-CRM114-Status: GOOD (  14.98  )
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

SGkgUHJhYmhha2FyLAoKT24gMjAyMy0wOS0yOCAxMToxOCBBTSwgTGFkLCBQcmFiaGFrYXIgd3Jv
dGU6Cj4gT24gVGh1LCBTZXAgMjgsIDIwMjMgYXQgNTowNOKAr1BNIFNhbXVlbCBIb2xsYW5kCj4g
PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+IHdyb3RlOgo+Pgo+PiBPbiAyMDIzLTA5LTI4IDU6
NDUgQU0sIFByYWJoYWthciB3cm90ZToKPj4+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPj4+Cj4+PiBSZW5lc2FzIFJaL0ZpdmUg
U29DIGhhcyBPU1RNIGJsb2NrcyB3aGljaCBjYW4gYmUgdXNlZCBmb3IgY2xvY2tfZXZlbnQgYW5k
Cj4+PiBjbG9ja3NvdXJjZSBbMF0uIFRoZSBjbG9ja19ldmVudCByYXRpbmcgZm9yIHRoZSBPU1RN
IGlzIHNldCAzMDAgYnV0Cj4+PiB3aGVyZWFzIHRoZSByYXRpbmcgZm9yIHJpc2N2LXRpbWVyIGNs
b2NrX2V2ZW50IGlzIHNldCB0byAxMDAgZHVlIHRvIHdoaWNoCj4+PiB0aGUga2VybmVsIGlzIGNo
b29zaW5nIE9TVE0gZm9yIGNsb2NrX2V2ZW50Lgo+Pj4KPj4+IEFzIHJpc2N2LXRpbWVyIGlzIG11
Y2ggbW9yZSBlZmZpY2llbnQgdGhhbiBNTUlPIGNsb2NrX2V2ZW50LCBpbmNyZWFzZSB0aGUKPj4+
IHJhdGluZyB0byA0MDAgc28gdGhhdCB0aGUga2VybmVsIHByZWZlcnMgcmlzY3YtdGltZXIgb3Zl
ciB0aGUgTU1JTyBiYXNlZAo+Pj4gY2xvY2tfZXZlbnQuCj4+Cj4+IFRoaXMgaXMgb25seSB0cnVl
IGlmIHlvdSBoYXZlIHRoZSBTc3RjIGV4dGVuc2lvbiBhbmQgY2FuIHNldCBzdGltZWNtcCBkaXJl
Y3RseS4KPj4gT3RoZXJ3aXNlIHlvdSBoYXZlIHRoZSBvdmVyaGVhZCBvZiBhbiBTQkkgY2FsbCwg
d2hpY2ggaXMgZ29pbmcgdG8gYmUgbXVjaCBoaWdoZXIKPj4gdGhhbiBhbiBNTUlPIHdyaXRlLiBT
byB0aGUgcmF0aW5nIHNob3VsZCBkZXBlbmQgb24gU3N0YywgYXMgaW4gdGhpcyBwYXRjaDoKPj4K
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzA3MTAxMzE5MDIuMTQ1
OTE4MC0zLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLwo+Pgo+IFRoYW5rIHlvdSBmb3IgdGhlIHBv
aW50ZXIuIERvIHlvdSBrbm93IGFueSB0b29sL3V0aWwgd2hpY2ggSSBjYW4gdXNlCj4gdG8gbWFr
ZSBjb21wYXJpc29ucz8KClRvIG1lYXN1cmUgdGhlIGxhdGVuY3kgb2YgdGhlIHRyYXAgdG8gTS1t
b2RlIHdoZW4gcmVjZWl2aW5nIHRoZSB0aW1lciBpbnRlcnJ1cHQsCnlvdSBjb3VsZCB1c2UgdGhl
IHRpbWVybGF0IHRyYWNlci4gVGhpcyBjb21wdXRlcyB0aGUgZGVsdGEgYmV0d2VlbiB0aGUKcHJv
Z3JhbW1lZCB0aW1lc3RhbXAsIGFuZCB3aGVuIHRoZSBJUlEgaXMgYWN0dWFsbHkgaGFuZGxlZC4K
ClRvIG1lYXN1cmUgdGhlIGxhdGVuY3kgb2Ygc2V0dGluZyB0aGUgdGltZXIsIHlvdSBjb3VsZCBh
ZGQgY29kZSB0byBjb21wdXRlIHRoZQpkdXJhdGlvbiBvZiB0aGUgc2V0X25leHRfZXZlbnQgZnVu
Y3Rpb25zLiAobWluX2RlbHRhX25zIHdvbid0IHRlbGwgeW91IGFueXRoaW5nCmJlY2F1c2Ugc2V0
X25leHRfZXZlbnQgbmV2ZXIgZmFpbHMuKQoKUmVnYXJkcywKU2FtdWVsCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
