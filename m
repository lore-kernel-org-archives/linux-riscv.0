Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F8C001DF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 10:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ttprm/WmOCXYBlGv5rpCbPLQ4aot/gKSQQYdzhlijSE=; b=bK5p444CZCOYcZ
	6Zd4JBLEYzp6Wt8za1j4UxuhdCqSq8ebFf6zW2IH47zq0c4zmweApZ0vB5K+8oZ8ByAXwdpLOPL5R
	xrMnLUQ8+Vj4Yk3aoQSKQGi9a7ww8nZFOptdnhihrfL8jkcOFsnU/32F3rJ0czxhoyMq1NSa/iqey
	E94pjZMvIXukxVKal4y/QFZCSi8ueCrR8KE9L0h6s7EqtLtIPNq67VoxS4ENqHBOHsRecTH/vAExu
	YWQLJ7YGJRtV2pKz9elAeRMdrJFkYQ2nTlZ7qTb8qK2bzPjWxcm3nvVya1YPuaxO/1mr/eNDSoE9j
	Z/l+A6IDAesREpmkvi9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQn6V-00228V-30;
	Tue, 01 Aug 2023 10:59:51 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQn6T-00227j-01
	for linux-riscv@lists.infradead.org;
	Tue, 01 Aug 2023 10:59:50 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso83122761fa.3
        for <linux-riscv@lists.infradead.org>; Tue, 01 Aug 2023 03:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1690887585; x=1691492385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F76i/7vGNisrChJeRqvuEQPeFIPFgiCjw08O3STlUnc=;
        b=BPClByZTHs7jw3OZmeyJAD4PsN3zyPlaDbDLMU+3gZiyPb9Y5o8jW2P8Tlh5p6s+9r
         BlAORineS72jryyv1aMOR7CAQ2QvqCqS/FShXPD9ckwFFobrBr11l6md0DRF8LeRFIz4
         HCPs+ezWMsz/3i8x1k5giQ/4TLSXcYfFz1qdugHdRSJaAktMjWW27OnYbTbc26pq+uaA
         TAsAgdfii8Q3g3jqkVlVDBMDeEzhdfHKh2CjtXZISoVLj3TOFhG4UACU0RVa8Uv6rnCE
         j2R5L0KAqpYyOdyThqIB0o+bIGvj9QVRG1oJPwOhFBE6PomEkl6xWZjSuOSkBoTarhIp
         0tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690887585; x=1691492385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F76i/7vGNisrChJeRqvuEQPeFIPFgiCjw08O3STlUnc=;
        b=QW3NRXReVbpLlr79xIMUZpd8WPJKO2F/6zL0WhAkn1naFGwW9A9X43ka6F9EUCPrl8
         3mg7Lrk6l3qQjBvN1SWp54u3o6tzM/apD71wQkbncFjuh/kdh5AoOWsSiLkLA/CYeFpl
         B+5OfUxxYtWy0fzE2cc+DwyftRAOHXEfOsHrIdG74b0oyy7ENCovb1Q036MbjXFfcZPJ
         3LaEuFkRVC+fkTy1IRJdtqovgERR4eD40e2iXAYH++2NN0DuG05Oe7mpyHgcG5mhbtLI
         pvL0/vlJULj22SXFv4erIor9Z4RMWh0F1MznZ1thc7T0Jo6J84CEfPHvBreOZ68srwjy
         BvbA==
X-Gm-Message-State: ABy/qLYBC7llSQ9KS8rY2fQlHhO7bcViVAsFiYRodvFZMog49001+Zgc
	wt6sRLk9wK4UJgNfv/c1YTDpnM4fn7WrCvg8nRJkfQ==
X-Google-Smtp-Source: APBJJlFNZI1VOiwUF6e/KUPHc2Zx0vZxESwSvI5tKYuKGB7IyFDDEb7la65niBvb/xQFqiAfDcQvct1KidT8ZF2BKmc=
X-Received: by 2002:a2e:b0c1:0:b0:2b9:e93e:65d9 with SMTP id
 g1-20020a2eb0c1000000b002b9e93e65d9mr2272839ljl.40.1690887585321; Tue, 01 Aug
 2023 03:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230720135125.21240-1-eric.lin@sifive.com> <20230720135125.21240-2-eric.lin@sifive.com>
 <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org> <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
 <be748338-987b-d474-d040-82af7cfb5f01@linaro.org> <CAPqJEFpYOgaEiSJ4HJwxMtpu1MZeUg9=tARTWa7hwTkjsQ3UAA@mail.gmail.com>
 <f7df407e-1deb-f667-912c-81415fffcbfd@linaro.org>
In-Reply-To: <f7df407e-1deb-f667-912c-81415fffcbfd@linaro.org>
From: Eric Lin <eric.lin@sifive.com>
Date: Tue, 1 Aug 2023 18:59:34 +0800
Message-ID: <CAPqJEFrYrbH2H5F=V4D4-exLjmnuJybj8L2GKPzqhTrDsqe-gA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_035949_097106_0B76FF7E 
X-CRM114-Status: GOOD (  20.06  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNTozOeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyOC8wNy8yMDIzIDEx
OjA0LCBFcmljIExpbiB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDI4LCAyMDIzIGF0IDI6NTjigK9Q
TSBLcnp5c3p0b2YgS296bG93c2tpCj4gPiA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIDI4LzA3LzIwMjMgMDg6MDEsIEVyaWMgTGluIHdyb3RlOgo+
ID4+PiBIaSBLcnp5c3p0b2YsCj4gPj4+Cj4gPj4+IE9uIEZyaSwgSnVsIDIxLCAyMDIzIGF0IDQ6
MzXigK9QTSBLcnp5c3p0b2YgS296bG93c2tpCj4gPj4+IDxrcnp5c3p0b2Yua296bG93c2tpQGxp
bmFyby5vcmc+IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IE9uIDIwLzA3LzIwMjMgMTU6NTEsIEVyaWMg
TGluIHdyb3RlOgo+ID4+Pj4+IFRoaXMgYWRkIFlBTUwgRFQgYmluZGluZyBkb2N1bWVudGF0aW9u
IGZvciBTaUZpdmUgUHJpdmF0ZSBMMgo+ID4+Pj4+IGNhY2hlIGNvbnRyb2xsZXIKPiA+Pj4+Pgo+
ID4+Pj4+IFNpZ25lZC1vZmYtYnk6IEVyaWMgTGluIDxlcmljLmxpbkBzaWZpdmUuY29tPgo+ID4+
Pj4+IFJldmlld2VkLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPj4+Pj4gUmV2
aWV3ZWQtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+Pj4+Cj4gPj4+Pgo+ID4+
Pj4gLi4uCj4gPj4+Pgo+ID4+Pj4+ICtwcm9wZXJ0aWVzOgo+ID4+Pj4+ICsgIGNvbXBhdGlibGU6
Cj4gPj4+Pj4gKyAgICBpdGVtczoKPiA+Pj4+PiArICAgICAgLSBjb25zdDogc2lmaXZlLHBsMmNh
Y2hlMQo+ID4+Pj4KPiA+Pj4+IEkgc3RpbGwgaGF2ZSBkb3VidHMgdGhhdCBpdCBpcyBub3QgdXNl
ZCBpbiBhbnkgU29DLiBUaGlzIGlzIHdoYXQgeW91Cj4gPj4+PiBzYWlkIGxhc3QgdGltZTogImlz
IG5vdCBwYXJ0IG9mIGFueSBTb0MuIgo+ID4+Pj4gSWYgbm90IHBhcnQgb2YgYW55IFNvQywgdGhl
biB3aGVyZSBpcyBpdD8gV2h5IGFyZSB5b3UgYWRkaW5nIGl0IHRvIHRoZQo+ID4+Pj4ga2VybmVs
Pwo+ID4+Pj4KPiA+Pj4KPiA+Pj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBJIGRpZG4ndCBk
ZXNjcmliZSBpdCBjbGVhcmx5IGxhc3QgdGltZS4KPiA+Pj4gQ3VycmVudGx5LCB3ZSBoYXZlIHR3
byBoYXJkd2FyZSB2ZXJzaW9ucyBvZiBwbDJjYWNoZTogcGwyY2FjaGUwIGFuZCBwbDJjYWNoZTEu
Cj4gPj4+IFRoZSBwbDJjYWNoZTAgaXMgdXNlZCBpbiB1bm1hdGNoZWQgYm9hcmQgU29DLiBUaGUg
cGwyY2FjaGUxIGlzCj4gPj4+IHV0aWxpemVkIGluIG91ciBpbnRlcm5hbCBGUEdBIHBsYXRmb3Jt
IGZvciBldmFsdWF0aW9uOyBpdCdzIG91ciBjb3JlCj4gPj4+IElQLgo+ID4+Cj4gPj4gQW5kIHdo
eSBkbyB5b3UgYWRkIGJpbmRpbmdzIGZvciBzb21lIGludGVybmFsIEZQR0EgSVAgYmxvY2sgd2hp
Y2ggZG9lcwo+ID4+IG5vdCBpbnRlcmZhY2Ugd2l0aCBhbnkgU1c/Cj4gPj4KPiA+Cj4gPiBIaSBL
cnp5c3p0b2YsCj4gPiBUaGUgcGwyY2FjaGUgaGFzIG1taW8gaW50ZXJmYWNlIGZvciBTVy4gVGhh
bmtzLgo+Cj4gVGhlbiBkaWQgeW91IG1lYW4gdGhhdCBGUEdBIHJlcHJlc2VudGVkIHNvbWUgbW9k
ZWwgb2YgeW91ciBTb0M/IElmIHNvLAo+IHdoYXQgYXJlIG90aGVyIGJpbmRpbmdzIGZvciB0aGF0
IEZQR0EgY29tcG9uZW50cz8KPgpIaSBLcnp5c3p0b2YsCgpTb3JyeSBmb3IgdGhlIGxhdGUgcmVw
bHkuClllcywgaGVyZSBhcmUgdGhlIGRldmljZXMgZHQtYmluZGluZyB0aGF0IHdlIHVzZSBvbiB0
aGUgaW50ZXJuYWwgRlBHQQpTb0MgcGxhdGZvcm0uIFRoYW5rcy4KCnVhcnQ6CkRvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvc2lmaXZlLXNlcmlhbC55YW1sCgpncGlvOgpE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUsZ3Bpby55YW1sCgpk
bWE6CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kbWEvc2lmaXZlLGZ1NTQwLWMw
MDAtcGRtYS55YW1sCgpzcGk6CkRvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zcGkv
c3BpLXNpZml2ZS55YW1sCgpCZXN0IHJlZ2FyZHMsCkVyaWMgTGluCgo+IEJlc3QgcmVnYXJkcywK
PiBLcnp5c3p0b2YKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
