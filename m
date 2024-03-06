Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B61C5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 13:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/amg/LVeM+W9Ab5K9kWBx0ak7Oyq0gZapuwktUrxfPM=; b=p2KupJUpY6R44B
	lwV8FyvE0NeOoNM8yv0s123mkxALy8ceIiMvESH/OMH+G8HYW2gosvBQfKCn4RFi4UKi6TptTbtOm
	pMbZj0POWX3RaTBiZnaPEqPtPxZ8lJDh9CV7JTfmoSF7UiHHO7grcwFfYlH1pbpqjIKEZNvzaCz4h
	gfzfZ7d1rb9CBkVfJEY2zms6ZR6Xjg9HbL2yIFacL1NUrCZGFSXYhDOknflvmOQQ5RHn6tdZhxDx+
	LAhmmdhOcQBIdVuk38gd/fEah39E60pdthpWKILSGghoRNH+V7ACgd23+3XV1qak4/mTfHHd3NY6j
	TrWWKVI8HpT1zL6Z8vXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrMS-00000000OSH-2pAm;
	Wed, 06 Mar 2024 13:31:08 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrMP-00000000ORZ-3CLL
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 13:31:07 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c1a2f7e1d2so4023994b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 05:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709731863; x=1710336663; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kh51b/rQt55meA6gXpgSjO1cqO3LzSbrLvgk9FvgIw=;
        b=JbQ82SxqG62dp5/zrX2QA6BulWhQTSgPHtxPWygPp20LZRE4KeF0hQLadNcJ4fDT1V
         /WLXKMw1a7JQLTIx97YC70hKQDvrABwY5/Q4rDHMQHQNh30nKN2eOJ938kip25yojAJe
         9m0mcUA6I4bJ7oM8QervzBerbBGoBzeGk+3K82ctQi8I+CZIeuR4MpW6Vd4LKm6r8rI7
         1Kl1p8nwToXvuHclnm43/hV6CaBp3ITtDhe7moNcK8nxlqOs4UWgOCOQ4HKS+UrfgwNM
         5oIqVgMCARpX5lPav943OSMARXTogfnXFB2DU5VKNOEvho+4wsnFY9o1WSwX6LaLmGJ4
         xctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709731863; x=1710336663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kh51b/rQt55meA6gXpgSjO1cqO3LzSbrLvgk9FvgIw=;
        b=tG0XMLD2vSOhkU3X/Wt838taCh8q6DWOWeBhVisGdqC1sOVQM4Dxoq7Ef74xbR5Dxb
         9/cOsA5qsmMSzdwOnUFJy0pVXNL5vo8u+cNcwOkQg1dqN9vohpjhTr+t0Veq/yPDtHz/
         EDUbpRFe6zKPZrtlo0STWh/ojtr997GSaLtUNOq6YYi+bqffPD0Yywr3z1x17WilYaiY
         CSG2gTJMHnybAbVYdaQQPZDN5k1QJA/KdpmSRS/qEl26/NAxeGaSTpBSkAFDaLiR+l8q
         4cX5DVuRWvSLtXh+vhfe22unr0Af6gbJTE4G/hNWuvBYGIXYSbFNIazbVBlqmYsehs9E
         aaLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjdgdcCyNzYlXIa4HmK1B7SQzsPhFjO6UcfSnXZMAoV9rsJ5GGoBCT7Pzklfvlxn1NieyYY8v2IpZP6UEjZ3i6ixS7qRNgscXQ2vDW629g
X-Gm-Message-State: AOJu0YxMzPAAB24lx9ZdloYkSnlhy4KIaq2Tiy8Gq9mjJyVJWNanr6iT
	xVg5cVgQfgNXICm2Vv18kdSQnNYPHQiSFLzuJhMc3NDFBeMb4tHDZ4gbPbOnD+0ZFYplmVImX2z
	MfPL29VrG+Dc1ElywdMesfyf6q32YNHR337z8wJnF9t9Z9k8sk8qCsQ==
X-Google-Smtp-Source: AGHT+IGsESZ28cADtj1/qO3+J9Uodvw2vXH9gd6MIiRper+aJOdmK0FpZ5KKlkyJpg9j4OHGhq9BJkjNjaQwfBjs/x0=
X-Received: by 2002:a05:6870:2302:b0:220:bce1:448f with SMTP id
 w2-20020a056870230200b00220bce1448fmr4753787oao.40.1709731863257; Wed, 06 Mar
 2024 05:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <20240306085622.87248-3-cuiyunhui@bytedance.com> <CAMj1kXEjjFAeVAVwiDO22RJECSM=L=0q6J=zog7JR38rUZpLGQ@mail.gmail.com>
 <CAEEQ3w=2pX+pjwoz=hNFpR4thD+d6o9OmBob8LMzZ8BbKZ=pqg@mail.gmail.com>
 <CAMj1kXFG=y_XXiaBHZOXDApZiCb48i0U5pX+GBRO2KAUom52VA@mail.gmail.com> <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
In-Reply-To: <CAMj1kXH1oMbONoHFMPaatfaqrHNE2ryfrG7kw-7J-eFsuXkK-Q@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 6 Mar 2024 21:30:52 +0800
Message-ID: <CAEEQ3wnuqBYcrwaRhx46E2kbwcHR_miE4+JzK=CmYhF0zMA07Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/3] efistub: fix missed the initialization
 of gp
To: Ard Biesheuvel <ardb@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	xuzhipeng.1973@bytedance.com, alexghiti@rivosinc.com, samitolvanen@google.com, 
	bp@alien8.de, xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_053105_832677_CAA59DEF 
X-CRM114-Status: GOOD (  27.16  )
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

SGkgQXJkLAoKT24gV2VkLCBNYXIgNiwgMjAyNCBhdCA5OjA54oCvUE0gQXJkIEJpZXNoZXV2ZWwg
PGFyZGJAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIDYgTWFyIDIwMjQgYXQgMTQ6MDIs
IEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwg
NiBNYXIgMjAyNCBhdCAxMzozNCwgeXVuaHVpIGN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBIaSBBcmQsCj4gPiA+Cj4gPiA+IE9uIFdlZCwgTWFyIDYsIDIw
MjQgYXQgNTozNuKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+
ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCA2IE1hciAyMDI0IGF0IDA5OjU2LCBZdW5odWkgQ3VpIDxj
dWl5dW5odWlAYnl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gQ29tcGFy
ZWQgd2l0aCBnY2MgdmVyc2lvbiAxMiwgZ2NjIHZlcnNpb24gMTMgdXNlcyB0aGUgZ3AKPiA+ID4g
PiA+IHJlZ2lzdGVyIGZvciBjb21waWxhdGlvbiBvcHRpbWl6YXRpb24sIGJ1dCB0aGUgZWZpc3R1
YiBtb2R1bGUKPiA+ID4gPiA+IGRvZXMgbm90IGluaXRpYWxpemUgZ3AuCj4gPiA+ID4gPgo+ID4g
PiA+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5jb20+
Cj4gPiA+ID4gPiBDby1EZXZlbG9wZWQtYnk6IFpoaXBlbmcgWHUgPHh1emhpcGVuZy4xOTczQGJ5
dGVkYW5jZS5jb20+Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIG5lZWRzIGEgc2lnbi1vZmYsIGFuZCB5
b3VyIHNpZ25vZmYgbmVlZHMgdG8gY29tZSBhZnRlci4KPiA+ID4gPgo+ID4gPiA+ID4gLS0tCj4g
PiA+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TIHwgMTEgKysrKysrKysrKy0K
PiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9lZmkt
aGVhZGVyLlMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9lZmktaGVhZGVyLlMKPiA+ID4gPiA+IGluZGV4
IDUxNWIyZGZiY2E3NS4uZmExN2MwOGMwOTJhIDEwMDY0NAo+ID4gPiA+ID4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvZWZpLWhlYWRlci5TCj4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9lZmktaGVhZGVyLlMKPiA+ID4gPiA+IEBAIC00MCw3ICs0MCw3IEBAIG9wdGlvbmFsX2hlYWRl
cjoKPiA+ID4gPiA+ICAgICAgICAgLmxvbmcgICBfX3BlY29mZl9kYXRhX3ZpcnRfZW5kIC0gX19w
ZWNvZmZfdGV4dF9lbmQgICAgICAvLyBTaXplT2ZJbml0aWFsaXplZERhdGEKPiA+ID4gPiA+ICAj
ZW5kaWYKPiA+ID4gPiA+ICAgICAgICAgLmxvbmcgICAwICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLy8gU2l6ZU9mVW5pbml0aWFsaXplZERhdGEKPiA+ID4gPiA+IC0gICAg
ICAgLmxvbmcgICBfX2VmaXN0dWJfZWZpX3BlX2VudHJ5IC0gX3N0YXJ0ICAgICAgICAgLy8gQWRk
cmVzc09mRW50cnlQb2ludAo+ID4gPiA+ID4gKyAgICAgICAubG9uZyAgIF9lZmlzdHViX2VudHJ5
IC0gX3N0YXJ0ICAgICAgICAgLy8gQWRkcmVzc09mRW50cnlQb2ludAo+ID4gPiA+ID4gICAgICAg
ICAubG9uZyAgIGVmaV9oZWFkZXJfZW5kIC0gX3N0YXJ0ICAgICAgICAgICAgICAgICAvLyBCYXNl
T2ZDb2RlCj4gPiA+ID4gPiAgI2lmZGVmIENPTkZJR18zMkJJVAo+ID4gPiA+ID4gICAgICAgICAu
bG9uZyAgX19wZWNvZmZfdGV4dF9lbmQgLSBfc3RhcnQgICAgICAgICAgICAgICAvLyBCYXNlT2ZE
YXRhCj4gPiA+ID4gPiBAQCAtMTIxLDQgKzEyMSwxMyBAQCBzZWN0aW9uX3RhYmxlOgo+ID4gPiA+
ID4KPiA+ID4gPiA+ICAgICAgICAgLmJhbGlnbiAweDEwMDAKPiA+ID4gPiA+ICBlZmlfaGVhZGVy
X2VuZDoKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgLmdsb2JhbCBfZWZpc3R1Yl9lbnRy
eQo+ID4gPiA+ID4gK19lZmlzdHViX2VudHJ5Ogo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBzaG91bGQg
Z28gaW50byAudGV4dCBvciAuaW5pdC50ZXh0LCBub3QgdGhlIGhlYWRlci4KPiA+ID4gPgo+ID4g
PiA+ID4gKyAgICAgICAvKiBSZWxvYWQgdGhlIGdsb2JhbCBwb2ludGVyICovCj4gPiA+ID4gPiAr
ICAgICAgIGxvYWRfZ2xvYmFsX3BvaW50ZXIKPiA+ID4gPiA+ICsKPiA+ID4gPgo+ID4gPiA+IFdo
YXQgaXMgc3VwcG9zZWQgdG8gaGFwcGVuIGhlcmUgaWYgQ09ORklHX1NIQURPV19DQUxMX1NUQUNL
PXk/IFRoZSBFRkkKPiA+ID4gPiBzdHViIE1ha2VmaWxlIHJlbW92ZXMgdGhlIFNDUyBDRkxBR1Ms
IHNvIHRoZSBzdHViIHdpbGwgYmUgYnVpbHQKPiA+ID4gPiB3aXRob3V0IHNoYWRvdyBjYWxsIHN0
YWNrIHN1cHBvcnQsIHdoaWNoIEkgZ3Vlc3MgbWVhbnMgdGhhdCBpdCBtaWdodAo+ID4gPiA+IHVz
ZSBHUCBhcyBhIGdsb2JhbCBwb2ludGVyIGFzIHVzdWFsPwo+ID4gPiA+Cj4gPiA+ID4gPiArICAg
ICAgIGNhbGwgX19lZmlzdHViX2VmaV9wZV9lbnRyeQo+ID4gPiA+ID4gKyAgICAgICByZXQKPiA+
ID4gPiA+ICsKPiA+ID4gPgo+ID4gPiA+IFlvdSBhcmUgcmV0dXJuaW5nIHRvIHRoZSBmaXJtd2Fy
ZSBoZXJlLCBidXQgYWZ0ZXIgbW9kaWZ5aW5nIHRoZSBHUAo+ID4gPiA+IHJlZ2lzdGVyLiBTaG91
bGRuJ3QgeW91IHJlc3RvcmUgaXQgdG8gaXRzIG9sZCB2YWx1ZT8KPiA+ID4gVGhlcmUgaXMgbm8g
bmVlZCB0byByZXN0b3JlIHRoZSB2YWx1ZSBvZiB0aGUgZ3AgcmVnaXN0ZXIuIFdoZXJlIGdwIGlz
Cj4gPiA+IG5lZWRlZCwgdGhlIGdwIHJlZ2lzdGVyIG11c3QgZmlyc3QgYmUgaW5pdGlhbGl6ZWQu
IEFuZCBoZXJlIGlzIHRoZQo+ID4gPiBlbnRyeS4KPiA+ID4KPiA+Cj4gPiBCdXQgaG93IHNob3Vs
ZCB0aGUgZmlybXdhcmUga25vdyB0aGF0IEdQIHdhcyBjb3JydXB0ZWQgYWZ0ZXIgY2FsbGluZwo+
ID4gdGhlIGtlcm5lbCdzIEVGSSBlbnRyeXBvaW50PyBUaGUgRUZJIHN0dWIgY2FuIHJldHVybiB0
byB0aGUgZmlybXdhcmUKPiA+IGlmIGl0IGVuY291bnRlcnMgYW55IGVycm9ycyB3aGlsZSBzdGls
bCBydW5uaW5nIGluIHRoZSBFRkkgYm9vdAo+ID4gc2VydmljZXMuCj4gPgo+Cj4gQWN0dWFsbHks
IEkgd29uZGVyIGlmIEdQIGNhbiBiZSBtb2RpZmllZCBhdCBhbGwgYmVmb3JlCj4gRXhpdEJvb3RT
ZXJ2aWNlcygpLiBUaGUgRUZJIHRpbWVyIGludGVycnVwdCBpcyBzdGlsbCBsaXZlIGF0IHRoaXMK
PiBwb2ludCwgYW5kIHNvIHRoZSBmaXJtd2FyZSBpcyBiZWluZyBjYWxsZWQgYmVoaW5kIHlvdXIg
YmFjaywgYW5kIG1pZ2h0Cj4gcmVseSBvbiBHUCByZXRhaW5pbmcgaXRzIG9yaWdpbmFsIHZhbHVl
LgoKT0ssIGluIHYyIEkgd2lsbCByZXN0b3JlIHRoZSB2YWx1ZSBvZiBncCBhcyBmb2xsb3dzOgoK
ICBlZmlfaGVhZGVyX2VuZDoKKworIF9fSU5JVAorIC5nbG9iYWxfZWZpc3R1Yl9lbnRyeQorX2Vm
aXN0dWJfZW50cnk6CisgLyogUmVsb2FkIHRoZSBnbG9iYWwgcG9pbnRlciAqLworLm9wdGlvbiBw
dXNoCisub3B0aW9uIG5vcmVsYXgKKyBhZGRpIHNwLHNwLC04Cisgc2QgZ3AsMChzcCkKKyBsYSBn
cCwgX19nbG9iYWxfcG9pbnRlciQKKy5vcHRpb24gcG9wCisgY2FsbCBfX2VmaXN0dWJfZWZpX3Bl
X2VudHJ5CitsZCBncCwwKHNwKQorYWRkaSBzcCxzcCw4CityZXQKKyBfX0hFQUQKKwogICAgICAg
ICAuZW5kbQoKd2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
