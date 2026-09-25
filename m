Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF87C9830E
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lTYi8Y6koT21JokVTi9a7uKC+B2K58O/aoNtwWdSG4E=; b=2XXFbeqbhfYW9N
	y59f47ikhK8iydxiRkCh9vB3e0/JcFjdGtLgO/dZ3dE6GOFO4q2CDMWT+NMlbPLKoeSTGZ4/FJb0Y
	g9oiCZPN57mZ7+Dy9OYJ74VS36iraMPpiK1vJUzwff9IFrQlj5RIrtez0Z/W40bwyWdcRX2O2f8fx
	nAR/TchCePRrqsNsV2of8DaTL/5R2NNQn+meKBo+5I/uZo7ffFizZIvgRUkFdQcHkeI3wMvsp8Pf/
	yosJ0GjAkTBXCGls+TJtBU5icgRDZ/QC0leSmBhbcfFxjvHhU4tZXNgkFfpjUH5DPkc/8yD1ziYeW
	D7pU2tbuPZ0CJ5G5xcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8EG-0000000DraH-26IV;
	Fri, 25 Sep 2026 15:52:52 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8EE-0000000DrZP-0EDb
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:52:51 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-482f635552aso807840f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790351568; cv=none;
        d=google.com; s=arc-20260327;
        b=E6Zx4Ne7fhDjkEvV7Ug9+3lOx0mhBPHn6oZYr1L6B6KuTIumQ0+2NE8IOM/M/Pc7Sn
         avPFoGJRI0vg24T89chO+32TRDprvp2pAMd4V4b+N+mn7sRZXjbiEJkOI6Y0J2ihGfKK
         XX0WG4EEFalySsTfz5IlSZL2YUzgHr7E00whhnblweW3eVVLgOvJRWeeZ85fcxgb+irJ
         HPQebtatoC54xFw8Oo/onLOsIs4P+6qWpCeaMIS5ftGaYJEultHdiZP758DrmZmT44W+
         7NUSiKN4OXbK+3oGYwl0zhL9TrMlUnJnztjIGJzV29k5BcHL/YMF6jNxAVOECQ0ynNwM
         Y/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=utwZNZ9pY4Xx5gq59KUjA7owWSl05dTqrvQ9otynvfA=;
        fh=H5WwhnEgaNaZTKk19GJ1ONBlqCz1A00/ER6CJ4P2t28=;
        b=UzxJiiL5iofG9OBa6JbbE0SxkW4mUA+a1/MslVs3/prnhIuUxwYlMV/PlvEfKvM3TV
         phLC2XildqwaR44AWRwOcW2s7Q9JNPIrq8k3PSTZC69tykqMbEF0I9nXUSs+gnt7KYMP
         oSy9Zv1IBjfQwsClu7+CFynHG98LeSX4msJ1dA91SpCcgVBFVOU4l3T3PM9eR6DAuzu3
         sRx1Gc9gefUwSXlq231tgYZ0ZVrOYeF8EkH559GTWDch2z9lZLRX+kKaAWu/2sy7aakX
         ZzZYSxPjNMx9THRK1hjuww5vBG1xmhlRHkCi0k8c+ArqduNtJP22hxVLQq0VSowOscBx
         ytOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790351568; x=1790956368; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=utwZNZ9pY4Xx5gq59KUjA7owWSl05dTqrvQ9otynvfA=;
        b=QGDqvpp8f9FyfeJkdZ7+KMXaKIgWhNbbNhLW1Ys7pH9oKtVCVeEzYKSrP5eicoaw01
         IGh/f7iIUzbqIekGRxDbZCjcVYGirQyP12Pe/4HJ4hOWq/Yh9730tW+iiivitxGb/NZr
         PAcGIi14LDci+98zCXDC1TfYRenFdMuHJtxNwlflor8P3MPpOCUWDTDaSmwl56WsEigQ
         eD+A0YaqkwzkrQlfroqOLGdbFOHuZT53e3DlDFzp+QqRGOaeAfVB5zUZ0HWjRycz1JPL
         b0BxXt023nXzGcy/C/miS1N73RZYSCrZTYCZCO/C9CyQXZfTvSumrwu7lvtugt1hbayl
         4S5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351568; x=1790956368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utwZNZ9pY4Xx5gq59KUjA7owWSl05dTqrvQ9otynvfA=;
        b=gKr+UcBCgXf6BDv6YAcASxMQgs0lKqXn3tZ/7GjlDb0Nzf8WMmVpnPpc1iV40fGWSC
         y6pYwVdAr247nZIyXWlaHkH7U9q0zJOcfDSf9n+FtnjfTiFKh4YNEKUQfm12sZoxADGx
         Z66e8e41N8jcnejfQkASG9F6lcjz6asRmVaAC/pjDTvNHPfbO5+eM6d7Js5RHy60Cpks
         YvsEDjxBdZH2uENr9jJ9xQP9I0+RsE+Zd+2jx/POHechjWeEOP0LlZLMkSXBUEg3emDG
         jWKC+TFf7wyLQ9Q3hnA2GFv2mxsIQvkFhW8jfWmWBu2yT2a3+DaFnWlacnT9Wlousp7X
         gljQ==
X-Gm-Message-State: AFuF++kG86xgJQPngiQhMElUai1eX5Ww3nvRIzpnLKAdpe1PoAjf6GYT
	lSlk1weqsCX1sSGJ/8lE2C5u7Z/ezwVld/orf7dFRAuiSgaWTKr9e8NiiSwioaHY4uvhv+g69j0
	iVb9JNDXI6EO5U+z+O2zE1mP8yqYtDv16O5uXfbyOiA==
X-Gm-Gg: AYBFou3dWcsNv7OQcg8mjWUw3VaLl98KNJK5IGmGmsq4lFQ6/ovrzjXUMmmwffyDpZl
	/Jyx//oWb32cUYquTMF6lGsnezFK/uvmzL9fHBqiOHQptuAXENeN/vulo76/gGRK2qaq2Zo2LWx
	5VW3nzw6NI+X82ZGY1W1KorN5tpUjWsny+0dGyORD3YV66y/eH+YR+io0T8o4OH1xMx2sTBqOMa
	0Vg4GS8/zZ/iI61m24fqGYN9TKNcZpZISTNJ2GXbYGzfAX7CgEP6NBohcaIT3dE6m4y1IB2u4JQ
	4ihfrQWJTMqQmnTiagQUgK0Kv4Z1GdpU+LVcrLG6k/z8sUvXyYlLobCHMxzjw764a+5lwaig9C9
	hFPRX26aGZnE+j3vs0l3zHRHyoCd0Q70G95ctdaSQ/en6XTk+eD2dEYkvvhFcgZPqHyXR7RGgS9
	sp4J1SgP1+xQ==
X-Received: by 2002:a05:6000:4b09:b0:488:6072:c0bc with SMTP id
 ffacd0b85a97d-48872a5d9a7mr10536030f8f.4.1790351568022; Fri, 25 Sep 2026
 08:52:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com> <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260925151659.419512-12-andrew.jones@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 25 Sep 2026 21:22:37 +0530
X-Gm-Features: AclHuK8pWQixNwcDzjZHyMQnruKEEP2VO1eZ6phkF3nVvr6l2DhyRC2oXU3yBTo
Message-ID: <CAAhSdy1a-poX0KKrHThmOzvSnLQVwDQdY_Anz3=zjSYOcboPJg@mail.gmail.com>
Subject: Re: [PATCH v6 11/16] irqchip/riscv-imsic: Support IOMMU MSI address lists
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev, tjeznach@rivosinc.com, 
	jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com, tglx@kernel.org, 
	kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_085250_135520_0969E2F7 
X-CRM114-Status: GOOD (  23.12  )
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgODo0N+KAr1BNIEFuZHJldyBKb25lcwo8YW5kcmV3Lmpv
bmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gUklTQy1WIElPTU1VIGhvc3QgaW50ZXJy
dXB0IHJlbWFwcGluZyBtYXBzIGV2ZXJ5IHBvc3NpYmxlIGhvc3QgSU1TSUMKPiB0YXJnZXQgaW50
byBvbmUgY29udGlndW91cyBJT1ZBIHJhbmdlLiBNU0kgbWVzc2FnZSBjb21wb3NpdGlvbiB0aGVy
ZWZvcmUKPiBuZWVkcyBlYWNoIHRhcmdldCdzIHBvc2l0aW9uIHdpdGhpbiB0aGF0IHJhbmdlLgo+
Cj4gUHJlcGFyZSB0aGUgY29tcGxldGUgSU1TSUMgYWRkcmVzcyBsaXN0IHdoaWxlIGFsbG9jYXRp
bmcgYW4gSVJRLiBUaGUKPiBsaXN0IGlzIGd1YXJhbnRlZWQgdG8gZXhpc3QgYWZ0ZXIgSU1TSUMg
c3RhdGUgaW5pdGlhbGl6YXRpb24uIFRoZSBJT01NVQo+IGJhY2tlbmQgbWFwcyB0aGUgcGFnZXMg
YW5kIGNhY2hlcyB0aGUgY29udGlndW91cyBiYXNlIElPVkEgaW4gdGhlIE1TSQo+IGRlc2NyaXB0
b3Igd2hlbiB0cmFuc2xhdGlvbiBpcyBuZWVkZWQuCj4KPiBXaGVuIHRoZSBkZXNjcmlwdG9yIGhh
cyBhbiBJT01NVSBNU0kgbWFwcGluZywgdXNlIHRoZSBzZWxlY3RlZCBsb2dpY2FsCj4gQ1BVIGRp
cmVjdGx5IGFzIHRoZSBwYWdlIGluZGV4IHdpdGhpbiB0aGUgSU9WQSByYW5nZS4gVXNlIHRoZSBz
YW1lIHBhdGgKPiBmb3IgaW5pdGlhbCBjb21wb3NpdGlvbiBhbmQgYWZmaW5pdHkgdXBkYXRlcy4g
QSB6ZXJvIGlvbW11X21zaV9zaGlmdAo+IG1lYW5zIG5vIE1TSSBhZGRyZXNzIHRyYW5zbGF0aW9u
IGlzIHJlcXVpcmVkLCBzbyBrZWVwIHBoeXNpY2FsIG1lc3NhZ2VzLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4KPiBUZXN0ZWQt
Ynk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgoKTEdNVC4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpBY2tlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgZHJpdmVy
cy9pcnFjaGlwL0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBkcml2ZXJzL2ly
cWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgfCAyNCArKysrKysrKysrKysrKysrKysr
LS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lycWNoaXAvS2NvbmZpZyBiL2RyaXZlcnMvaXJxY2hp
cC9LY29uZmlnCj4gaW5kZXggMjBiNzdmYmM1MWVlLi5hMDM4ZTExMjFiZTMgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9pcnFjaGlwL0tjb25maWcKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvS2NvbmZp
Zwo+IEBAIC02NTEsNiArNjUxLDcgQEAgY29uZmlnIFJJU0NWX0lNU0lDCj4gICAgICAgICBzZWxl
Y3QgSVJRX0RPTUFJTl9ISUVSQVJDSFkKPiAgICAgICAgIHNlbGVjdCBHRU5FUklDX0lSUV9NQVRS
SVhfQUxMT0NBVE9SCj4gICAgICAgICBzZWxlY3QgR0VORVJJQ19NU0lfSVJRCj4gKyAgICAgICBz
ZWxlY3QgSVJRX01TSV9JT01NVQo+ICAgICAgICAgc2VsZWN0IElSUV9NU0lfTElCCj4KPiAgY29u
ZmlnIFJJU0NWX1JQTUlfU1lTTVNJCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEt
cmlzY3YtaW1zaWMtcGxhdGZvcm0uYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMt
cGxhdGZvcm0uYwo+IGluZGV4IDY0M2M4ZTQ1OTYxMS4uZGRiMmJiNTcwY2RjIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+ICsrKyBiL2Ry
aXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+IEBAIC0xMCw2ICsxMCw3
IEBACj4gICNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVw
dC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4KPiArI2luY2x1ZGUgPGxpbnV4L2lvbW11Lmg+
Cj4gICNpbmNsdWRlIDxsaW51eC9pcnEuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2lycWNoaXAuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L2lycWRvbWFpbi5oPgo+IEBAIC02OSw4ICs3MCwxMCBAQCBzdGF0
aWMgdm9pZCBpbXNpY19pcnFfYWNrKHN0cnVjdCBpcnFfZGF0YSAqZCkKPiAgICAgICAgIGlycV9t
b3ZlX2lycShkKTsKPiAgfQo+Cj4gLXN0YXRpYyB2b2lkIGltc2ljX2lycV9jb21wb3NlX3ZlY3Rv
cl9tc2coc3RydWN0IGltc2ljX3ZlY3RvciAqdmVjLCBzdHJ1Y3QgbXNpX21zZyAqbXNnKQo+ICtz
dGF0aWMgdm9pZCBpbXNpY19pcnFfY29tcG9zZV92ZWN0b3JfbXNnKHN0cnVjdCBpcnFfZGF0YSAq
ZCwgc3RydWN0IGltc2ljX3ZlY3RvciAqdmVjLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IG1zaV9tc2cgKm1zZykKPiAgewo+ICsgICAgICAgc3RydWN0
IG1zaV9kZXNjICpkZXNjID0gaXJxX2RhdGFfZ2V0X21zaV9kZXNjKGQpOwo+ICAgICAgICAgcGh5
c19hZGRyX3QgbXNpX2FkZHI7Cj4KPiAgICAgICAgIGlmIChXQVJOX09OKCF2ZWMpKQo+IEBAIC03
OSw2ICs4MiwxMiBAQCBzdGF0aWMgdm9pZCBpbXNpY19pcnFfY29tcG9zZV92ZWN0b3JfbXNnKHN0
cnVjdCBpbXNpY192ZWN0b3IgKnZlYywgc3RydWN0IG1zaV9tcwo+ICAgICAgICAgaWYgKFdBUk5f
T04oIWltc2ljX2NwdV9wYWdlX3BoeXModmVjLT5jcHUsIDAsICZtc2lfYWRkcikpKQo+ICAgICAg
ICAgICAgICAgICByZXR1cm47Cj4KPiArICAgICAgIC8qIEEgemVybyBzaGlmdCBtZWFucyBubyBJ
T01NVSBNU0kgbWFwcGluZyBpcyBuZWVkZWQuICovCj4gKyAgICAgICBpZiAoZGVzYy0+aW9tbXVf
bXNpX3NoaWZ0KSB7Cj4gKyAgICAgICAgICAgICAgIG1zaV9hZGRyID0gKGRlc2MtPmlvbW11X21z
aV9pb3ZhIDw8IGRlc2MtPmlvbW11X21zaV9zaGlmdCkgKwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZlYy0+Y3B1ICogSU1TSUNfTU1JT19QQUdFX1NaOwo+ICsgICAgICAgfQo+ICsKPiAg
ICAgICAgIG1zZy0+YWRkcmVzc19oaSA9IHVwcGVyXzMyX2JpdHMobXNpX2FkZHIpOwo+ICAgICAg
ICAgbXNnLT5hZGRyZXNzX2xvID0gbG93ZXJfMzJfYml0cyhtc2lfYWRkcik7Cj4gICAgICAgICBt
c2ctPmRhdGEgPSB2ZWMtPmxvY2FsX2lkOwo+IEBAIC04Niw3ICs5NSw3IEBAIHN0YXRpYyB2b2lk
IGltc2ljX2lycV9jb21wb3NlX3ZlY3Rvcl9tc2coc3RydWN0IGltc2ljX3ZlY3RvciAqdmVjLCBz
dHJ1Y3QgbXNpX21zCj4KPiAgc3RhdGljIHZvaWQgaW1zaWNfaXJxX2NvbXBvc2VfbXNnKHN0cnVj
dCBpcnFfZGF0YSAqZCwgc3RydWN0IG1zaV9tc2cgKm1zZykKPiAgewo+IC0gICAgICAgaW1zaWNf
aXJxX2NvbXBvc2VfdmVjdG9yX21zZyhpcnFfZGF0YV9nZXRfaXJxX2NoaXBfZGF0YShkKSwgbXNn
KTsKPiArICAgICAgIGltc2ljX2lycV9jb21wb3NlX3ZlY3Rvcl9tc2coZCwgaXJxX2RhdGFfZ2V0
X2lycV9jaGlwX2RhdGEoZCksIG1zZyk7Cj4gIH0KPgo+ICAjaWZkZWYgQ09ORklHX1NNUAo+IEBA
IC05NCw3ICsxMDMsNyBAQCBzdGF0aWMgdm9pZCBpbXNpY19tc2lfdXBkYXRlX21zZyhzdHJ1Y3Qg
aXJxX2RhdGEgKmQsIHN0cnVjdCBpbXNpY192ZWN0b3IgKnZlYykKPiAgewo+ICAgICAgICAgc3Ry
dWN0IG1zaV9tc2cgbXNnID0geyB9Owo+Cj4gLSAgICAgICBpbXNpY19pcnFfY29tcG9zZV92ZWN0
b3JfbXNnKHZlYywgJm1zZyk7Cj4gKyAgICAgICBpbXNpY19pcnFfY29tcG9zZV92ZWN0b3JfbXNn
KGQsIHZlYywgJm1zZyk7Cj4gICAgICAgICBpcnFfZGF0YV9nZXRfaXJxX2NoaXAoZCktPmlycV93
cml0ZV9tc2lfbXNnKGQsICZtc2cpOwo+ICB9Cj4KPiBAQCAtMjI1LDcgKzIzNCw5IEBAIHN0YXRp
YyBzdHJ1Y3QgaXJxX2NoaXAgaW1zaWNfaXJxX2Jhc2VfY2hpcCA9IHsKPiAgc3RhdGljIGludCBp
bXNpY19pcnFfZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4sIHVuc2lnbmVk
IGludCB2aXJxLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBp
bnQgbnJfaXJxcywgdm9pZCAqYXJncykKPiAgewo+ICsgICAgICAgbXNpX2FsbG9jX2luZm9fdCAq
aW5mbyA9IGFyZ3M7Cj4gICAgICAgICBzdHJ1Y3QgaW1zaWNfdmVjdG9yICp2ZWM7Cj4gKyAgICAg
ICBpbnQgcmV0Owo+Cj4gICAgICAgICAvKiBNdWx0aS1NU0kgaXMgbm90IHN1cHBvcnRlZCB5ZXQu
ICovCj4gICAgICAgICBpZiAobnJfaXJxcyA+IDEpCj4gQEAgLTIzNSw2ICsyNDYsMTMgQEAgc3Rh
dGljIGludCBpbXNpY19pcnFfZG9tYWluX2FsbG9jKHN0cnVjdCBpcnFfZG9tYWluICpkb21haW4s
IHVuc2lnbmVkIGludCB2aXJxLAo+ICAgICAgICAgaWYgKCF2ZWMpCj4gICAgICAgICAgICAgICAg
IHJldHVybiAtRU5PU1BDOwo+Cj4gKyAgICAgICByZXQgPSBpb21tdV9kbWFfcHJlcGFyZV9tc2lf
bGlzdChpbmZvLT5kZXNjLCBpbXNpYy0+bXNpX3BhX2xpc3QsCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBudW1fcG9zc2libGVfY3B1cygpLCBJTVNJQ19NTUlPX1BB
R0VfU1opOwo+ICsgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBpbXNpY192ZWN0
b3JfZnJlZSh2ZWMpOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgfQo+
ICsKPiAgICAgICAgIGlycV9kb21haW5fc2V0X2luZm8oZG9tYWluLCB2aXJxLCB2aXJxLCAmaW1z
aWNfaXJxX2Jhc2VfY2hpcCwgdmVjLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoYW5k
bGVfZWRnZV9pcnEsIE5VTEwsIE5VTEwpOwo+ICAgICAgICAgaXJxX3NldF9ub3Byb2JlKHZpcnEp
Owo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
