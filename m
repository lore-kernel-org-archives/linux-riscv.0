Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2C7EB64DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 09:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1fQi4UYRvu5PDOdUDn9ivnFEcyBhqTlIEHJwcX5fZc=; b=Us551Lj4wVJdCO
	W5nSAykifIqalCLoKJlKvrrcYTyXI3viU3c/kwD+2kseUQO45uODYexrdGVGmV1r28cm0+WPK+IMo
	6zBnj2nR57jdFHADQkjAMx/cLhHmF//tMSbT2OC1q2HKguM6xrB1eQG/X2xdiheh36zrPcBHbHcde
	jpTdPH/IU8T84C/Ams1NE4r3rE9kmVThJA1Wj0wuEwL4c0dAHQ4qYEOhz8KqxIbVuRUqlRcPZWr8R
	YrA+ehI7A7B+Uo+LyPwH3FO7hJ+AA5fbrCCWA2srOve6Us2nbMeWqXS02w5W2BBVVJqMcq46W17ki
	fx2+pwgsfV++ozs7iMlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQHu-00Aaeh-2S;
	Thu, 20 Jul 2023 09:49:34 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQHr-00AadR-3A
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 09:49:33 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b74310566cso8278401fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jul 2023 02:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689846569; x=1690451369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdPjULmUPa6VP/P9oFjDeDKjVlgwghUFnuvoEEW98lk=;
        b=HHofg5goD3MCmhVbpsCJpFHRqzFOOdspVHBHc2MmFRD4bmqkIYAxGzBuDtetpWZPfH
         0OJthp6Qkx/3jOFMvTzKiR0fyy7UKyy0cUctbhp3dZ2VKuc70D7P/iv8pu70g+fg4YkI
         6RLLYKp57LctOmyKyTv0pimuRRljO1xwIiG1mWGlVUrZwWPZbnjwmZJp+vbwoCBfgTFZ
         TTwyMSqWWCtioNyhmH+rq3zt1frT7WCEB7CRtzCOB+sCSOXwUFi9h+K14ZuikqRVksfI
         /KX7rJS+ULnu9yD9vnOJu2FDyx9T8JsnwE2uabQVA7SqQw1q4TihZ7xiF9R6WNJHgh6Y
         mQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689846569; x=1690451369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LdPjULmUPa6VP/P9oFjDeDKjVlgwghUFnuvoEEW98lk=;
        b=UzEBpYepefd76NMvzh4q9g4OyV75JEkUpaAc/eLWuuHBsdIi2aAZqHeQQw0vNKfugh
         BmWbYHoC9GTODjPaQHMZqQ6XHjMmb2hs7gntfOF2YIt2/AOydKiYVdAALE1i+Wun07Wn
         6WZcai0x5odqFN55dPXrCe0KmXJZJfKPgSvxNcSc3KMWdaKcIqVYGZFaGSCRKAU5VZJH
         sGi4Xu6f5MPPXYlXl2OxPnTfTTmbcGJelZcGnL2W14n/rFJ60iSWIIKI3ZS6n/SzRzST
         I+jKFEJQQ00D+FY6dZH0AcNrg0gksbfJMtzKJJ0eee9Ht/m2lN1cIOrlIrnV1XT2bqgi
         ONiw==
X-Gm-Message-State: ABy/qLbf8Ejfqh3+WE8ZdGplQ5LyQuocjMOu7BeJ2jdWGxUrmrgSOffs
	XyuhoCozS4YEB00DtOOEPBYMEy6wI0JboysOwyu5Pw==
X-Google-Smtp-Source: APBJJlHcYyplb13P09E5HKiNPAyWuhkGEPGYuJW5CEjmOyn+qs4zkcM4vBw7USD+ttdRYJCm7IwZvsQDTv4pBHBNPdU=
X-Received: by 2002:a2e:8654:0:b0:2b6:e2cd:20f5 with SMTP id
 i20-20020a2e8654000000b002b6e2cd20f5mr2276664ljj.9.1689846568698; Thu, 20 Jul
 2023 02:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org> <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
 <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org> <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
 <f5275617-d68c-c76b-d799-106f67cc2071@linaro.org> <20230712110908.GA23216@hsinchu16>
 <0865b422-d587-c1c7-9463-510832ddddf4@linaro.org>
In-Reply-To: <0865b422-d587-c1c7-9463-510832ddddf4@linaro.org>
From: Eric Lin <eric.lin@sifive.com>
Date: Thu, 20 Jul 2023 17:49:17 +0800
Message-ID: <CAPqJEFp_YgsXOymQPH1Pr4cORtv=8oS0OWnACWqNe69ARMRwvA@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: conor@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Zong Li <zong.li@sifive.com>, vincent.chen@sifive.com, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_024932_105314_227E9883 
X-CRM114-Status: GOOD (  25.50  )
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

SGkgS3J6eXN6dG9mLAoKT24gV2VkLCBKdWwgMTIsIDIwMjMgYXQgODozMOKAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kKPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBP
biAxMi8wNy8yMDIzIDEzOjA5LCBFcmljIExpbiB3cm90ZToKPiA+IE9uIFNhdCwgSnVsIDAxLCAy
MDIzIGF0IDEwOjIyOjI1QU0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gPj4g
T24gMjgvMDYvMjAyMyAxODozMSwgRXJpYyBMaW4gd3JvdGU6Cj4gPj4KPiA+Pj4+Pj4KPiA+Pj4+
Pj4+ICsgICAgICAtIGVudW06Cj4gPj4+Pj4+PiArICAgICAgICAgIC0gc2lmaXZlLHBMMkNhY2hl
MAo+ID4+Pj4+Pj4gKyAgICAgICAgICAtIHNpZml2ZSxwTDJDYWNoZTEKPiA+Pj4+Pj4KPiA+Pj4+
Pj4gV2hhdCBpcyAiMCIgYW5kICIxIiBoZXJlPyBXaGF0IGRvIHRoZXNlIGNvbXBhdGlibGVzIHJl
cHJlc2VudD8gV2h5IHRoZXkKPiA+Pj4+Pj4gZG8gbm90IGhhdmUgYW55IFNvQyByZWxhdGVkIHBh
cnQ/Cj4gPj4+Pj4KPiA+Pj4+PiBUaGUgcEwyQ2FjaGUxIGhhcyBtaW5vciBjaGFuZ2VzIGluIGhh
cmR3YXJlLCBidXQgaXQgY2FuIHVzZSB0aGUgc2FtZQo+ID4+Pj4+IHBsMiBjYWNoZSBkcml2ZXIu
Cj4gPj4+Pgo+ID4+Pj4gVGhlbiB3aHkgYXJlbid0IHRoZXkgY29tcGF0aWJsZT8KPiA+Pj4+Cj4g
Pj4+Cj4gPj4+IFRoZSBwTDJDYWNoZTEgaGFzIHJlbW92ZWQgc29tZSB1bnVzZWQgYml0cyBpbiB0
aGUgcmVnaXN0ZXIgY29tcGFyZWQgdG8KPiA+Pj4gcGwyQ2FjaGUwLgo+ID4+PiBGcm9tIHRoZSBo
YXJkd2FyZSBwZXJzcGVjdGl2ZSwgdGhleSBhcmUgbm90IGNvbXBhdGlibGUgYnV0IHRoZXkgY2Fu
Cj4gPj4+IHNoYXJlIHRoZSBzYW1lIHBsMiBjYWNoZSBkcml2ZXIgaW4gc29mdHdhcmUuCj4gPj4K
PiA+PiBTbyB0aGV5IGFyZSBjb21wYXRpYmxlLi4uIElmIHRoZXkgd2VyZSBub3QgY29tcGF0aWJs
ZSwgeW91IHdvdWxkbid0IGJlCj4gPj4gYWJsZSB0byB1c2UgdGhlIHNhbWUgbWF0Y2ggaW4gdGhl
IGRyaXZlci4KPiA+Pgo+ID4+PiBUaHVzLCB3ZSB3b3VsZCBsaWtlIHRvIGtlZXAgYm90aC4gSXQg
d291bGQgYmUgZ3JlYXQgaWYgeW91IGNhbiBwcm92aWRlCj4gPj4+IHNvbWUgc3VnZ2VzdGlvbnMu
IFRoYW5rcy4KPiA+Pgo+ID4+IEkgcHJvcG9zZSB0byBtYWtlIHRoZW0gY29tcGF0aWJsZSwgbGlr
ZSBldmVyeSBvdGhlciBwaWVjZSBvZiBTb0MuIEkKPiA+PiBkb24ndCBzZWUgYW55IGJlbmVmaXQg
b2YgaGF2aW5nIHRoZW0gc2VwYXJhdGUuCj4gPj4KPiA+Cj4gPiBIaSBLcnp5c3p0b2YsCj4gPgo+
ID4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lgo+ID4gVGhlIHBsMiBjYWNoZSBpcyBvdXIgaW50
ZXJuYWwgcGxhdGZvcm0gSVAgYW5kIGlzIG5vdCBwYXJ0IG9mIGFueSBTb0MuCj4gPgo+ID4gVGhl
IHJlYXNvbiB3aHkgdGhpcyBkcml2ZXIgaXMgY29tcGF0aWJsZSB3aXRoIHRoZSBoYXJkd2FyZSAi
cGwyY2FjaGUwIiBhbmQgaGFyZHdhcmUgInBsMmNhY2hlMSIKPiA+IGlzIHRoYXQgaXQgZG9lc24n
dCBwcm9ncmFtIHRoZSBkaWZmZXJlbnQgcGFydHMgb2YgdGhlIGNvbmZpZyByZWdpc3Rlcgo+ID4g
SG93ZXZlciwgb3VyIGludGVybmFsIHNvZnR3YXJlIChlLmcuLCBiYXJlLW1ldGFsIHNvZnR3YXJl
KSB3aWxsIHByb2dyYW0gdGhlc2UgZGlmZmVyZW50IHBhcnRzLAo+ID4gc28gaXQgbmVlZHMgdG8g
cmVseSBvbiB0aGUgZGlmZmVyZW50IGNvbXBhdGlibGUgc3RyaW5nIHRvIGlkZW50aWZ5IHRoZSBo
YXJkd2FyZS4KPiA+Cj4gPiBBZGRpdGlvbmFsbHksIHdlIHdvdWxkIGxpa2UgdGhlIGNvbXBhdGli
bGUgc3RyaW5ncyB0byByZWZsZWN0IHdoaWNoIGhhcmR3YXJlIGlzIGJlaW5nIHVzZWQgVGhhbmtz
Lgo+Cj4gSSBkb24ndCB1bmRlcnN0YW5kIGhvdyBkb2VzIGl0IGNvbnRyYWRpY3RzIGFueXRoaW5n
IEkgc2FpZC4gU28geW91IGRvCj4gYWdyZWUgd2l0aCBtZT8gT3Igd2hhdD8KPgoKVGhhbmtzIGZv
ciB5b3VyIHN1Z2dlc3Rpb25zLiBPSywgSSdsbCBmaXggaXQgaW4gdjIuCgpCZXN0IHJlZ2FyZHMs
CkVyaWMgTGluCgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
