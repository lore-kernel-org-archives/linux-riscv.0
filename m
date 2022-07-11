Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE39C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 22:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9PVAPlaQmD1MuZLWe/O/aAygi+/966Y4XXc/X1WZlMk=; b=JL2Quk76PN5cwB
	2UqEhG1uIIbkX8J469/213RaOq8Fes/ENK92DC+i1TgutTnh3tI7+bBlmrvFy9OtdEadb+vHd4DkW
	UYsnDhVQY6PbNssPhG4ofv+uSwr5I0XPhVvatJx8z8cDWfSzstxZ1BDIYdtCiQg0xkF4iJyjAS3ef
	THUfSLlY9yNJFJRp+jHBxI+k7PkOHRlHIxFV8D0d2o3jiwPc+L2w2BaFruqpsnX3XOb3lTjJ4zDGO
	jRTZbZUE4qin4fBMNfKyrs25AF3OPfSbo7sWuRD0FwZ1EX2OyOx6WzO/cCdX/zGEEYkbZtXW2vOKY
	6AXT6nknE/FseZQS00Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2Gw-005OwS-PI; Mon, 11 Jul 2022 22:52:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB2Gf-005OlY-9K; Mon, 11 Jul 2022 22:52:44 +0000
Received: by mail-ej1-x62b.google.com with SMTP id j22so11311262ejs.2;
        Mon, 11 Jul 2022 15:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i2JP/AK/462flQNf3WkuAKr99hiwoo70NGIBG6Typ3w=;
        b=ErppBv825hWACq85NgILEoUpFIDS7zhQU4dBsF65NWh9mqK1QibzrTz5JjL/oe9P4P
         xddf9vJAS5jJevier0WxjtSRTzqNqYMTuFMbLyHy18aT7xPi4oZPjKUXEDf3BhSaLDa4
         4O3xw1J1KLXUrMcEs66ayBXSRlLIZbC064ewsp5aVZAPGfL0CMXNAFyBX/9qyBVJbAOu
         xoSUM1m6sng8YQvv6Z+b3Z5XjXwnY/UzydMHSmIOJ28NgRuG0eCkAIYDttY9WOuNkv9g
         v51CIgVGXO+hyPttpvZ9Y8r1QIuDcwQgPgw5HdmKK2Y4Fsxmh65jR/Qqh4XcEPpMGnwl
         PGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i2JP/AK/462flQNf3WkuAKr99hiwoo70NGIBG6Typ3w=;
        b=lEtMpfSLHWbbwCZs9A3aTkQWl25hb1uEJxLM1K7gHE8DOWTk2HQhhdBzLHJCfNJZ9g
         PK1ZD0uqIhrbX7PAq7v18bs0BqbOjkIez4sHnN7s3AwUpqevUJtjMH858kkvaMu95cH1
         Z9ZH6g+SV788GfX48EADVAM9mAXb+G9da0QJaDrFkg2GVgC37mLqdNaMSMYUtcREWTnH
         kNbmxeXiHSsfzv18QvlfrejAIAehTd1s8CjUXmZFrJH7VVg9oKteRuh7ZAIZAAw495Aa
         sOrcqkFYzClOWWZLTQmUZBkx/+0CINFO8lDAbz9CQw9s2+Po2XmmbrRIBRGxrIVw5k4M
         2bHg==
X-Gm-Message-State: AJIora9vUGACir6XiNfCRXvgykwonxeP+qlV4iFhtEp5AYCRrKWucatK
	UCsW9BArk7wzlqFYDhFAedK1z3PHUGZRz00xaWkNVBoaf0W1NQ==
X-Google-Smtp-Source: AGRyM1u3B9GaqsJzc2ZnGgAx20N9pPna/H/YyY3hApLIj/mDA7Feo0MOU0K0s1MJSpzYriYuHv0RZqEbB9CZJ8ZQIzU=
X-Received: by 2002:a17:906:8a45:b0:72b:31d4:d537 with SMTP id
 gx5-20020a1709068a4500b0072b31d4d537mr17046686ejc.170.1657579957647; Mon, 11
 Jul 2022 15:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220711034615.482895-1-21cnbao@gmail.com> <20220711034615.482895-3-21cnbao@gmail.com>
 <13b283fe-10f7-376f-9b8e-856e4d1e0ede@huawei.com>
In-Reply-To: <13b283fe-10f7-376f-9b8e-856e4d1e0ede@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 12 Jul 2022 10:52:24 +1200
Message-ID: <CAGsJ_4wW=3xsmB1jzcv=sD9OhhPc0v=+odp=JY80vEbMY6OZ_g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] mm: rmap: Allow platforms without mm_cpumask to
 defer TLB flush
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, 
	LAK <linux-arm-kernel@lists.infradead.org>, x86 <x86@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
	Darren Hart <darren@os.amperecomputing.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	huzhanyuan@oppo.com, =?UTF-8?B?5p2O5Z+56ZSLKHdpbmsp?= <lipeifeng@oppo.com>, 
	=?UTF-8?B?5byg6K+X5piOKFNpbW9uIFpoYW5nKQ==?= <zhangshiming@oppo.com>, 
	=?UTF-8?B?6YOt5YGl?= <guojian@oppo.com>, real mz <realmz6@gmail.com>, 
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_155241_368176_FC3E4230 
X-CRM114-Status: GOOD (  18.56  )
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

T24gVHVlLCBKdWwgMTIsIDIwMjIgYXQgMTozNSBBTSBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53
YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4gSGkgQmFycnnvvIwKPgo+IE9uIDIwMjIvNy8xMSAx
MTo0NiwgQmFycnkgU29uZyB3cm90ZToKPiA+IEZyb206IEJhcnJ5IFNvbmcgPHYtc29uZ2Jhb2h1
YUBvcHBvLmNvbT4KPiA+Cj4gPiBQbGF0Zm9ybXMgbGlrZSBBUk02NCBoYXZlIGhhcmV3YXJlIFRM
QiBzaG9vdGRvd24gYnJvYWRjYXN0LiBUaGV5Cj4gPiBkb24ndCBtYWludGFpbiBtbV9jcHVtYXNr
IGJ1dCBqdXN0IHNlbmQgdGxiaSBhbmQgcmVsYXRlZCBzeW5jCj4gPiBpbnN0cnVjdGlvbnMgZm9y
IFRMQiBmbHVzaC4gdGFzaydzIG1tX2NwdW1hc2sgaXMgbm9ybWFsbHkgZW1wdHkKPiA+IGluIHRo
aXMgY2FzZS4gV2UgYWxzbyBhbGxvdyBkZWZlcnJlZCBUTEIgZmx1c2ggb24gdGhpcyBraW5kIG9m
Cj4gPiBwbGF0Zm9ybXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFycnkgU29uZyA8di1zb25n
YmFvaHVhQG9wcG8uY29tPj4KPiA+IC0tLQo+IC4uLgo+ID4gZGlmZiAtLWdpdCBhL21tL0tjb25m
aWcgYi9tbS9LY29uZmlnCj4gPiBpbmRleCAxNjllNjQxOTJlNDguLjdiZjU0ZjU3Y2EwMSAxMDA2
NDQKPiA+IC0tLSBhL21tL0tjb25maWcKPiA+ICsrKyBiL21tL0tjb25maWcKPiA+IEBAIC05NTEs
NiArOTUxLDkgQEAgY29uZmlnIEFSQ0hfSEFTX0NVUlJFTlRfU1RBQ0tfUE9JTlRFUgo+ID4gICAg
ICAgICByZWdpc3RlciBhbGlhcyBuYW1lZCAiY3VycmVudF9zdGFja19wb2ludGVyIiwgdGhpcyBj
b25maWcgY2FuIGJlCj4gPiAgICAgICAgIHNlbGVjdGVkLgo+ID4KPiA+ICtjb25maWcgQVJDSF9I
QVNfTU1fQ1BVTUFTSwo+ID4gKyAgICAgYm9vbAo+ID4gKwo+ID4gICBjb25maWcgQVJDSF9IQVNf
Vk1fR0VUX1BBR0VfUFJPVAo+ID4gICAgICAgYm9vbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9tbS9y
bWFwLmMgYi9tbS9ybWFwLmMKPiA+IGluZGV4IDViY2IzMzRjZDZmMi4uMTNkNGY5YTFkNGYxIDEw
MDY0NAo+ID4gLS0tIGEvbW0vcm1hcC5jCj4gPiArKysgYi9tbS9ybWFwLmMKPiA+IEBAIC02OTIs
NiArNjkyLDEwIEBAIHN0YXRpYyBib29sIHNob3VsZF9kZWZlcl9mbHVzaChzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwgZW51bSB0dHVfZmxhZ3MgZmxhZ3MpCj4gPiAgICAgICBpZiAoIShmbGFncyAmIFRU
VV9CQVRDSF9GTFVTSCkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+Cj4gPiAr
I2lmbmRlZiBDT05GSUdfQVJDSF9IQVNfTU1fQ1BVTUFTSwo+ID4gKyAgICAgcmV0dXJuIHRydWU7
Cj4gPiArI2VuZGlmCj4gPiArCj4KPiBIZXJlIGlzIGFub3RoZXIgb3B0aW9uIHRvIGVuYWJsZSBh
cmNoJ3MgdGxiYmF0Y2ggZGVmZXIKPgoKVGhpcyBvcHRpb24gaXMgZXZlbiBiZXR0ZXIgdGhhbiBz
aW1wbHkgaGF2aW5nIEFSQ0hfSEFTX01NX0NQVU1BU0sKc2luY2UgYXJjaCBtaWdodCBtYWtlIGRl
Y2lzaW9ucyBiYXNlZCBvbiBzcGVjaWZpYyBoYXJkd2FyZSBjaGFyYWN0ZXJzLgpmb3IgZXhhbXBs
ZSwKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9saW51eHBwYy1kZXYvMjAxNy1O
b3ZlbWJlci8xNjU0NjguaHRtbAoKK2Jvb2wgYXJjaF90bGJiYXRjaF9zaG91bGRfZGVmZXIoc3Ry
dWN0IG1tX3N0cnVjdCAqbW0pCit7CisgICAgIGlmICghcmFkaXhfZW5hYmxlZCgpIHx8IGNwdV9o
YXNfZmVhdHVyZShDUFVfRlRSX1BPV0VSOV9ERDEpKQorICAgICAgICAgcmV0dXJuIGZhbHNlOwor
CisgICAgIGlmICghbW1faXNfdGhyZWFkX2xvY2FsKG1tKSkKKyAgICAgICAgIHJldHVybiB0cnVl
OworCisgICAgIHJldHVybiBmYWxzZTsKK30KCkluIHRoaXMgY2FzZSwgaGF2aW5nIE1NX0NQVU1B
U0sgZG9lc24ndCBuZWNlc3NhcmlseSBtZWFuIHRsYmJhdGNoIGlzIG5lZWRlZC4KCj4gWzFdCj4g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9wYXRjaC8y
MDE3MTEwMTEwMTczNS4yMzE4LTIta2hhbmR1YWxAbGludXgudm5ldC5pYm0uY29tLwo+Cj4gPiAg
ICAgICAvKiBJZiByZW1vdGUgQ1BVcyBuZWVkIHRvIGJlIGZsdXNoZWQgdGhlbiBkZWZlciBiYXRj
aCB0aGUgZmx1c2ggKi8KPiA+ICAgICAgIGlmIChjcHVtYXNrX2FueV9idXQobW1fY3B1bWFzayht
bSksIGdldF9jcHUoKSkgPCBucl9jcHVfaWRzKQo+ID4gICAgICAgICAgICAgICBzaG91bGRfZGVm
ZXIgPSB0cnVlOwoKVGhhbmtzCkJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
