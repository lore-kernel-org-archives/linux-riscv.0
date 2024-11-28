Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4237D69107
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6kiG48WVYraGGP1lMCT4lVxYdr9xBpUJlo4HcnHyE+E=; b=GRLAQ+Ww69zDCk
	0qD/155jmjZiBfAJfKOu8T18Q6jafnouEM3+iqlAthF04Tibqa3v6MrUwUu0SdbPzH4WIuiaGBhCv
	L/W7bW0FT+2ngnosTPjKGlwXuNlkX5Oj3BqDbdb+i4pFtumu9RvmSuGN2ArdKNA9B20krd8kMyLUR
	jSgbZnEO8zTQAXtcPrP763Ym4nhfkpYuDhRsvka3I+vgL38fB5rRM9hNYhNjErSBUwMmbUMkjIfiB
	CeYlhfLagX3WcEtLCMx/ceMvoET8YvXRt28cpcLqY3rH+I1TsMh4kPO2f8oHb76wKgGnQbWfZjEio
	NghKEcjcTz3JhKDtZ3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeGX-0000000Faj8-2Ntl;
	Thu, 28 Nov 2024 13:09:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeGV-0000000Faim-138b
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 13:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732799341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cAXH3dA3hXdD9DhMWQf4k+asQ47TKDyVsQWDK1csVME=;
	b=UejjZqRboFfAejGVkCnv91RvlJV9Gyg3GNjheB8DU29YmtwekYxEXB1K3Y2bsX+23Gh3Tk
	wLcAUUGQSwYfFj7gbxJ7G/qvfBtHtH6riQeOY3RHZk+4RN84ElTIIbJuj6lVNimPl7oXZ9
	C3euA3nMUSJNHWpbvdBXY3/bPdlZHbQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-2XMpOYPtO1m0JgMJJzavYg-1; Thu, 28 Nov 2024 08:07:24 -0500
X-MC-Unique: 2XMpOYPtO1m0JgMJJzavYg-1
X-Mimecast-MFC-AGG-ID: 2XMpOYPtO1m0JgMJJzavYg
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-434a04437cdso6353005e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 05:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732799243; x=1733404043;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAXH3dA3hXdD9DhMWQf4k+asQ47TKDyVsQWDK1csVME=;
        b=kubGTzaJnV56YYE9Fb5iGjy4+TotZPKCsANKnCpgOHM2DSJMv4IVpRASlxE7njuOV9
         zBS7HGeGGIv5gf7Pde2GQNBcYywxpnnA0ZuDa0XvKi3PEnAdYlmy9GGjfoNhfX130vdX
         xMPn450PTXMO/i51iKBYQFx4/5gqS+Mregy2NP0TSp1lWkgq9QufMcEptFJqIjkeIGEn
         h3Qi6B6VOGb5OSIjudzYrXupW+qfEsqnVV4jDDYLGxD2M/xY3IkPS+s4Gjvtb4mXeB8x
         kQbo1vYm4ybSaF8JaV0fuFYXATSNha1M2bT1aPPWU2LAOjs3XhBUUZ6tjEX0+CLBAEKU
         oBaw==
X-Forwarded-Encrypted: i=1; AJvYcCXnQG9I9gydVGE8H1/c+OsDlE7y5f1OrDoExgK/t9ld3jKSmIjYd72hr90mey/guqEmpYqv5waKfcGHKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZcuMhAagSmYvTsYyNqO922HAmL/pgm2wMpoG1pNY0nLh5rn6i
	df+mqjFOViVWCOPGWXEMnAo7AgWkBn/qT769P+RC9NdGLd6g41wF+gGZIFz/z0i2WFHwtQk0734
	HZ3OaHAy7a+glf2TmBAqePceJb2gqcMtbAp9J8S8h8KHoV2klGBYavbLW2GGLvBBjrg==
X-Gm-Gg: ASbGncupGQw9n/6qpOV+cytTEGp8gmYUc6Tgf1s0VF49MBVQhxTfguiedzq4OxTFGXK
	4AXZyNPCrTovRNtNMehwmNXoRDV4b9jivm7MTryVdVBoJBGzSvSRPeBjzbFXnwK8C0oyhY+2TFe
	xa/97iltpaXgPOArDHfbs14zOmWWqF51qnNvrrqGiMX0HDo5C/a9pw9rVTM6+7pq591lX8rnPi4
	nosTqiGnkx4dInnPBXzJWJgSbuj04lSDj8+GshDWwy6OL4aVridYsJy0bQ8WWnUHfr6dAepouc=
X-Received: by 2002:a05:600c:4e8a:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-434a9dc5003mr65339395e9.8.1732799242815;
        Thu, 28 Nov 2024 05:07:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2psrPhjev3bJrjSIB+JHRV7XwXM7FdQVe1Lk4BWmEHa6+pF1hXmW+7huHZUP0OGwp9t/s8w==
X-Received: by 2002:a05:600c:4e8a:b0:431:5e3c:2ff0 with SMTP id 5b1f17b1804b1-434a9dc5003mr65339055e9.8.1732799242505;
        Thu, 28 Nov 2024 05:07:22 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd367f9sm1582466f8f.31.2024.11.28.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:07:21 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id D262C164E1A8; Thu, 28 Nov 2024 14:07:20 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 bpf@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Quentin Monnet
 <qmo@kernel.org>, Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, David Abdurachmanov <davidlt@rivosinc.com>,
 Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH bpf v2] tools: Override makefile ARCH variable if
 defined, but empty
In-Reply-To: <20241127101748.165693-1-bjorn@kernel.org>
References: <20241127101748.165693-1-bjorn@kernel.org>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Thu, 28 Nov 2024 14:07:20 +0100
Message-ID: <87o71zik1j.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aIPR1Sa0D2je3ZEGVhuovicyseyJCJmI_2fzydu-mNA_1732799243
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_050903_349457_5E1BF6A2 
X-CRM114-Status: GOOD (  13.05  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBUaGVyZSBhcmUgYSBudW1iZXIgb2YgdG9v
bHMgKGJwZnRvb2wsIHNlbGZ0ZXN0cyksIHRoYXQgcmVxdWlyZSBhCj4gImJvb3RzdHJhcCIgYnVp
bGQuIEhlcmUsIGEgYm9vdHN0cmFwIGJ1aWxkIGlzIGEgYnVpbGQgaG9zdCB2YXJpYW50IG9mCj4g
YSB0YXJnZXQuIEUuZy4sIGFzc3VtZSB0aGF0IHlvdSdyZSBwZXJmb3JtaW5nIGEgYnBmdG9vbCBj
cm9zcy1idWlsZCBvbgo+IHg4NiB0byByaXNjdiwgYSBib290c3RyYXAgYnVpbGQgd291bGQgdGhl
biBiZSBhbiB4ODYgdmFyaWFudCBvZgo+IGJwZnRvb2wuIFRoZSB0eXBpY2FsIHdheSB0byBwZXJm
b3JtIHRoZSBob3N0IGJ1aWxkIHZhcmlhbnQsIGlzIHRvIHBhc3MKPiAiQVJDSD0iIGluIGEgc3Vi
LW1ha2UuIEhvd2V2ZXIsIGlmIGEgdmFyaWFibGUgaGFzIGJlZW4gc2V0IHdpdGggYQo+IGNvbW1h
bmQgYXJndW1lbnQsIHRoZW4gb3JkaW5hcnkgYXNzaWdubWVudHMgaW4gdGhlIG1ha2VmaWxlIGFy
ZQo+IGlnbm9yZWQuCj4KPiBUaGlzIHNpZGUtZWZmZWN0IHJlc3VsdHMgaW4gdGhhdCBBUkNILCBh
bmQgdmFyaWFibGVzIGRlcGVuZGluZyBvbiBBUkNICj4gYXJlIG5vdCBzZXQuCj4KPiBXb3JrYXJv
dW5kIGJ5IG92ZXJyaWRpbmcgQVJDSCB0byB0aGUgaG9zdCBhcmNoLCBpZiBBUkNIIGlzIGVtcHR5
Lgo+Cj4gRml4ZXM6IDg4NTliMGRhNWFhYyAoInRvb2xzL2JwZnRvb2w6IEZpeCBjcm9zcy1idWls
ZCIpCj4gUmV2aWV3ZWQtYnk6IEplYW4tUGhpbGlwcGUgQnJ1Y2tlciA8amVhbi1waGlsaXBwZUBs
aW5hcm8ub3JnPgo+IFRlc3RlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgo+IFJldmlld2VkLWJ5OiBOYW1oeXVuZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+
Cj4gQWNrZWQtYnk6IFF1ZW50aW4gTW9ubmV0IDxxbW9Aa2VybmVsLm9yZz4KPiBTaWduZWQtb2Zm
LWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgpSZXZpZXdlZC1ieTogVG9r
ZSBIw7hpbGFuZC1Kw7hyZ2Vuc2VuIDx0b2tlQHJlZGhhdC5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
