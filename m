Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E719606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 20:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eqYQGnH+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oTp1Drn0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZbOlTC792n8hkESrDldEJECJWUFcFubbH/AoEebQCWU=; b=eqYQGnH+WklGWhhwOtcwFFbLf7
	EsmwmlPiMLAtdNdKXjrZ76qBSHhQ1N/mcUUswySWQz1bAWkyAIlS6qp+NMeKnWQsdj2mFc5mdPIt/
	yb0lVwV41uNGBt1zHXz8ZcT1uBLKv+izI1LkKEAjNe45sAUlT7Hi4lZ+cEkpGLMdxHUFasfNWL3Qj
	Ku9iBGzgYohLSOoeeZELtvc5X+f9N1ZfY9pLxIQEeC5A1dVvHtVILCUF91nfuAPosho8h3+ORdtwO
	jDTnZpITtBAU9OpsvDgd4mb7XTGZQCH/l+OJTXvD6UIH9pnDDNZ7VBSy67KWwXNNd0KHng2T/2Llh
	a6SoIRgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgRG-0000000EW4t-1rC8;
	Thu, 26 Nov 2026 20:51:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgRD-0000000EW4G-2EYx
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 20:51:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f07a960666so51213345ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 12:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795726286; cv=none;
        d=google.com; s=arc-20260327;
        b=bV3Vlet/YhgMbDrcuiT2ejYeGVgzwMZOdfY7IZ00MdANjwz0EXy0XSBWwUfFUsU2Ch
         ksBa0tcd0g2jF7QOMJv1pN4PRkiYM9rn/cbABhEPdPUXVCeMFhJVnfiTWS1yzwMyjSqj
         civgN9/mzz/kpjP9vLqaGtfMjUNmArx4ZeTtXGB4GUnshhR0DjEYdRxvj3hoosp6hNb2
         jHDsFUSO3ImiuREWfhDyc6ADmR0ltCo6kXQI9nPLz+rykBoaHtbeq+1q2Yv/4CUubCIX
         CPOfI6f5B8x5YnmctOHK4uS7x/oNCpHAVlZxcLU6jYETjLC6iU6AdJILT4imCV3xpEMm
         W/Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        fh=DstE622ew+NtdqM65nlCx90IlUpBEYqAVU5z6yoziPE=;
        b=RQMa8QtvPjvF4/mSDu1mut0KzoCNHS1iH3rTmhDkpo94rHISLRruzMzox8JmuN/vnY
         wxBv2wxRU0r+bgEC7eg2URCegiKrQwOGJgd1p7xxYLsv/J+/ruih4QOqAKWSqU09KAhE
         txo3JochAmANHo9pbcdaUIE+ECTDuYwzE5ivPMH+4sf6AMyCil3vpG7B0cSIAsz6BKsM
         qxW768SBCyMfbpykUQ1sMh5AQNuBeioG0mGAJY2kPPQ8RBOdYEYBvtiZWy/0BxfWlFWk
         tdTsNS4qK3ImV0VRnjAE4WO+SZL8LWpPPar/nYlc51y/VXg51GUVVwtivGg1RW0xX322
         noIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795726286; x=1796331086; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=oTp1Drn0ZpsFRiX/rxFXKRZ99X9on/aF2qM4+We0uYA0uqRvW8jM2PuvOhEjNHU/S/
         fp5uy2lmW5cDJH7s8gym14XJ6nkZrnMyUiEMpIJpguFq05wNbar/VwhmD7+Lge0H+e76
         +vUshnr/ZkEpaLif2sMMFc6fhcMNnwxjjUbE6hVnNZBBXH2VTwGcbf5uERWL7z9CRzZG
         Rugk7C3hjI7aWAYpK8fkKv97JE6fTIPeuVvBXvjJonXY0Zl68M2b/2/OD0jzWEpdj1Sw
         DUd0oJEVHa7ATxMbsz++pE7ZSBz34p7w5XcXoQpQt7wpsz/T14O1ueT/6Zi2HEM7wnaH
         +JJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795726286; x=1796331086;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjPQo4q/k3/IK7cR8RIRgyLDoYYjcusaTmDtFIYgl8E=;
        b=Ean5mI+ElB4Zcj/4/1FvAgx2HWyYnKK2a72MhRnpwkG/ppmTMTQSkOUwZGW3+VbYwn
         uirjD23VrzOV41aeiFf45qiyWwXjAcDJY08/8dDKRSLZWC18zbm7pkMfj30Ouk7XIaOJ
         razIDP/9T55HPAih8/48eTETGAU9brKDSpTmvmBqVZMwDJHBXs/6Z23iF3gPi+5FX56B
         uI/Qv0tyxRKFzGE5/HdIhgKFhtj1gb48stlMIcVnqyAYfR072GtArdf0H/CSjHsAgQT9
         uFHDkOUN7PjwEuOwMYK0P1qIRrgvDGgx9G6iveJIcTDnkJXzkoC3rzITn+oOQjIgnBMM
         WuJA==
X-Forwarded-Encrypted: i=1; AL+hErEAsJBPUrHDxOtPIPhpmNLze4AMkV3qQodHKiujWONougSTVTVQezjwm/3y5Mai7cRlW6UMGPe4TZyUBg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9tVhFTYwGGnLyFZhzCcKUJlU+zB7rPSfksJnvsa3qghT1IxjHK
	+QGwnQgiddBBtSTEL1TMFHvFxSwFFKPN7YXuMErm2osQbQl3JxrmvXO4Ire103qvBHJy5uEzruk
	j3DxpcGuuleMU4Znnp3Uq3PzALoTJ/zk=
X-Gm-Gg: AZFdTZcnP/tfeiC1O7W0CuxguNnlk5nqQTzcQwXFEet87zp0zGa3S20xRH4Yv3GrMw4
	YCgZ6YAJPxi/K7tMgAXvod0pxFikZPesqgDAE86ItfxZ65YCW9o6ppQAWoVaFwkR+EDHBHrvL+V
	6F95zdhAKKaFPn/p09RdkpQ87uR8EYZlbcwxyALaLLfZpw5Tl7wc7zVh3ybI+mi2qUYu6Qy3tRO
	GyToA5/xvoEJyz6BEdGhfNHMan7E9Xi/KTWq1DUJQw0e4tHd6p1JXyUCCWlbQPsR+j2UYTJT0B+
	s2PR9afXHCmENUBdBV2nmewXeogRUqMaQwemXKHTE0J6hZxh4XtRHvnYs7n3NPe2o72YrSdJZQJ
	DTZS14eRH8xrH69UbfSbc23lbSOLDsjWNN5LQ
X-Received: by 2002:a17:903:4b0c:b0:2ed:352d:c619 with SMTP id
 d9443c01a7336-2f03f16ca83mr215219965ad.46.1795726286102; Thu, 26 Nov 2026
 12:51:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
In-Reply-To: <20261125-spacemit-soc-timer-v3-0-e6390f3ae4a6@linux.spacemit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 26 Nov 2026 21:50:00 +0100
X-Gm-Features: Aa3M54oEPweJV68Vjz8cVs_U2wRf_Iqv5S5UWB4zm__2yBgEw8WUCZAIeYKD9Xg
Message-ID: <CABdCQ=OHaicMvAC=S+To2pQgFXupoUEY72TF+NUNF7ywM1kj0Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add SpacemiT K1/K3 SoC timer support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_125127_605812_12AD4263 
X-CRM114-Status: GOOD (  17.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2VyaWVzIGxvb2tzIGdvb2QuIEFsbCBwcmV2aW91cyBjb25jZXJucyBhZGRyZXNzZWQuCgpSZXZp
ZXdlZC1ieTogSWtlciBQZWRyb3NhIDxpa2VycGVkcm9zYW1AZ21haWwuY29tPgoKRWwgbWnDqSwg
MjUgbm92IDIwMjYgYSBsYXMgMjozOSwgVHJveSBNaXRjaGVsbAooPHRyb3kubWl0Y2hlbGxAbGlu
dXguc3BhY2VtaXQuY29tPikgZXNjcmliacOzOgo+Cj4gVGhlIFNwYWNlbWlUIEsxIGFuZCBLMyBT
b0NzIGhhdmUgQVBCIHRpbWVycyB0aGF0IHJ1biBpbmRlcGVuZGVudGx5IG9mCj4gdGhlIENQVSBj
b3Jlcy4gRWFjaCB0aW1lciBibG9jayBoYXMgdGhyZWUgMzItYml0IHVwIGNvdW50ZXJzLCBhbmQg
ZWFjaAo+IGNvdW50ZXIgaGFzIHRocmVlIG1hdGNoIGNvbXBhcmF0b3JzIGFuZCBpdHMgb3duIGlu
dGVycnVwdC4gQSBjb3VudGVyCj4gY2FuIGJlIGNsb2NrZWQgZnJvbSB0aGUgZnVuY3Rpb25hbCBj
bG9jayBvciBmcm9tIHRoZSAzMi43Njgga0h6IGNsb2NrLAo+IGFuZCBjYW4gcnVuIGluIGZyZWUt
cnVubmluZyBvciBwZXJpb2RpYyBtb2RlLgo+Cj4gVGhpcyBzZXJpZXMgdXNlcyBjb3VudGVyIDAg
YXMgYSBvbmVzaG90IGNsb2NrZXZlbnQuIEl0IGlzIHJlZ2lzdGVyZWQKPiBmb3IgdGljayBicm9h
ZGNhc3QsIHNvIGl0IGNhbiB3YWtlIHVwIENQVXMgd2hvc2UgbG9jYWwgUklTQy1WIHRpbWVyCj4g
c3RvcHMgaW4gaWRsZS4KPgo+IEszIHVzZXMgdGhlIHNhbWUgcmVnaXN0ZXIgaW50ZXJmYWNlIGFz
IEsxIGFuZCBmYWxscyBiYWNrIHRvIHRoZSBLMQo+IGNvbXBhdGlibGUuIEJvdGggU29DcyBydW4g
dGhlIHRpbWVyIGZyb20gYSAxIE1IeiBmdW5jdGlvbmFsIGNsb2NrLgo+Cj4gLS0tCj4gQ2hhbmdl
cyBpbiB2MzoKPiAtIERyb3AgdGhlIHVubmVjZXNzYXJ5IFJFU0VUX0NPTlRST0xMRVIgZGVwZW5k
ZW5jeSAoUGhpbGlwcCkKPiAtIExpbmsgdG8gdjI6IGh0dHBzOi8vcGF0Y2gubXNnaWQubGluay8y
MDI2MTExNy1zcGFjZW1pdC1zb2MtdGltZXItdjItMC05MjY0ZDBlYTc3NTVAbGludXguc3BhY2Vt
aXQuY29tCj4KPiBDaGFuZ2VzIGluIHYyOgo+IC0gVXNlIG5hbWVkIGNvbnN0YW50cyB3aXRoIGNv
bW1lbnRzIGZvciB0aGUgY291bnRlciBzeW5jIGxhdGVuY3kgYW5kCj4gICB0aGUgbWluaW11bSBj
bG9jayByYXRlIChJa2VyKQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaC5tc2dpZC5saW5r
LzIwMjYxMTAzLXNwYWNlbWl0LXNvYy10aW1lci12MS0wLTM2NzIyNDIxZGI2ZUBsaW51eC5zcGFj
ZW1pdC5jb20KPgo+IFRvOiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNl
bWl0LmNvbT4KPiBUbzogRGFuaWVsIExlemNhbm8gPGRhbmllbC5sZXpjYW5vQGtlcm5lbC5vcmc+
Cj4gVG86IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+IFRvOiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgo+IFRvOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtl
cm5lbC5vcmc+Cj4gVG86IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz4KPiBUbzog
WWl4dW4gTGFuIDxkbGFuQGtlcm5lbC5vcmc+Cj4gVG86IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxA
cGVuZ3V0cm9uaXguZGU+Cj4gVG86IFBhdWwgV2FsbXNsZXkgPHBqd0BrZXJuZWwub3JnPgo+IFRv
OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQuY29tPgo+IFRvOiBBbGJlcnQgT3UgPGFv
dUBlZWNzLmJlcmtlbGV5LmVkdT4KPiBUbzogQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZy
Pgo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzog
c3BhY2VtaXRAbGlzdHMubGludXguZGV2Cj4KPiAtLS0KPiBUcm95IE1pdGNoZWxsICg1KToKPiAg
ICAgICBkdC1iaW5kaW5nczogdGltZXI6IEFkZCBTcGFjZW1pVCBLMSB0aW1lcgo+ICAgICAgIGNs
b2Nrc291cmNlL2RyaXZlcnMvc3BhY2VtaXQ6IEFkZCBLMSB0aW1lciBzdXBwb3J0Cj4gICAgICAg
cmlzY3Y6IGR0czogc3BhY2VtaXQ6IEFkZCB0aGUgSzEgQVBCIHRpbWVyCj4gICAgICAgcmlzY3Y6
IGR0czogc3BhY2VtaXQ6IEFkZCB0aGUgSzMgQVBCIHRpbWVyCj4gICAgICAgTUFJTlRBSU5FUlM6
IEFkZCBlbnRyeSBmb3IgU3BhY2VtaVQgdGltZXIKPgo+ICAuLi4vYmluZGluZ3MvdGltZXIvc3Bh
Y2VtaXQsazEtdGltZXIueWFtbCAgICAgICAgICB8ICA3MSArKysrKwo+ICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCj4gIGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc3BhY2VtaXQvazEuZHRzaSAgICAgICAgICAgICAgIHwgIDEyICsKPiAgYXJj
aC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMy5kdHNpICAgICAgICAgICAgICAgfCAgMTIgKwo+
ICBkcml2ZXJzL2Nsb2Nrc291cmNlL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAx
MSArCj4gIGRyaXZlcnMvY2xvY2tzb3VyY2UvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAg
IHwgICAxICsKPiAgZHJpdmVycy9jbG9ja3NvdXJjZS90aW1lci1zcGFjZW1pdC5jICAgICAgICAg
ICAgICAgfCAzMTcgKysrKysrKysrKysrKysrKysrKysrCj4gIDcgZmlsZXMgY2hhbmdlZCwgNDMw
IGluc2VydGlvbnMoKykKPiAtLS0KPiBiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEz
NDVlM2EyMGQyMTgyOWFhZTdlNAo+IGNoYW5nZS1pZDogMjAyNjEwMTktc3BhY2VtaXQtc29jLXRp
bWVyLWNhZGYzMDg4ZDI4Ngo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gVHJveSBNaXRjaGVsbCA8
dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4KPgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
