Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6310C678DF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 09:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVBi5IbVgG30LQgRMUjKOfrPyBz5aYkpFv7/FALSyJQ=; b=ehEClkbcW3oGX2
	r0GTBNPzwTfMmWrGAeu826TZCAkuvV5zEwBXATAplVSe1pgH/AAyzdqTS7DJxmgIaBPP0mRJTM/OH
	KKIkEYKyAJ7C3Zbz1/o5hoZ28KGaYL7DDzdBSVHhQRFcvGZ98IZlmOx/OCJQ36lGgouBuwYelcjK7
	EPdjBrn7HIJyF+gZ82fcU88NojdlsCkJ1Lu/m1ek3NQ76siSeUJP2uzPo7dIApScQzoSysCqsmMp+
	FZUsVKkr5N96u02HGi65mBOT32ajWL3kMMfzuAX5cWGJkrh/8MgyRrQf1hZS6o8edDtdW5txdTB9t
	b+FURgFuuFhTV2eLqHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYgY-00000003kmV-20Lc;
	Mon, 09 Jun 2025 09:20:54 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOYWj-00000003jle-3cFx
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 09:10:47 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-55351af2fc6so4911198e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749460244; x=1750065044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMmw4G9aKaZU5qDapJFu/F3F/qwNFopqJUpdbcMKEQI=;
        b=gXrB6UKMjuW7dpkOZ8Q1izKF/oJNh64rAjTOXZvExSkgNeu1ZmJHfKDNaMcKrC36hT
         nEAzPKBrrragZAWapXu090b67dZjgnXdPupeOxxrR6CM52FHlRMA4YLlDD2iWhyCY+RC
         HS86MIQt93BVh1a3nc+k+l5TQd5F/iosBdIBspUmZHIYXUMme52e2oqZL4GIpYCU7kEE
         T0nhyAPNc39P9jNhnorK6js5AFYeV/2dE8Xjs373RyakiwHRDiI+1DIy/jkB4KMOmy26
         cQXqoqg4PZTG+goId1jIC3iHlsz85rWXfDJh+1sFT3OQhW7/eqG6lFL/TVFSekpc2jug
         RJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749460244; x=1750065044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FMmw4G9aKaZU5qDapJFu/F3F/qwNFopqJUpdbcMKEQI=;
        b=Q3PZcEkp+zAZTHs7q37GCBIJyHD949ekyucP1SwLzXB6TkNCVe4jd6PHlxY4EFKLGn
         gwaUcn0hNKd5CUmWYRRhmM5534Aj+B4SJKYl/Qew4DJyEDBbogaBDGd6kLhf2M6yB4J8
         DSnZVkS3+mQ8UY5/rASCOibrFFTkT7xP3N5SEhQJYnyH/OnwyG5TZ1z5ob58sN2HFIwk
         +2nPGU6YDGSxi+aGzquy54GQO5Q3cPRFZ/lzSMWauDAcKPgNUrJFcQ3PAwlr7lCVPnIC
         9y+7rAN265D09QQ5gYrSb2r0jL48bV9SBJcW+JTbG4uG+/CPEYmq5VwkES981YtdD7s8
         15gA==
X-Forwarded-Encrypted: i=1; AJvYcCWPlF/pv55J5ivAK4MXNFcKO3uPK5PG0HuejD7ChbAWrxcgztFafgEJr/EMTepPg7DDQBrwxp3Mb9ywlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxL3Fum5kxKuNgEiTNjuduepNcgp4A1WUP2/N2YCKsoNKUKCspI
	7MMuNiY0ISVYv/oO9ffZU4p3EmcwaQw/Dc9VI3oGBQq/1+rnqq4djqWpOtRHWvbqpeq6QBDAP9W
	wvwOtfnpafPXfuT9DPQa4LnbeenObsLs7SdxELOO/nw==
X-Gm-Gg: ASbGncsxVhEvxwuP+zOahTI6r/jNx4+RMtDRhx1qnARTLcWV89BMbgj+8cL+Iqgs/Ar
	LUjdAcxOdVCIwDmih6zg73k0NVf1qbDGI7wFjWbQBotuVGgXEpnst68yM4nV3p1sg+/v8FSN4eL
	TET3/AdmIPGWk/t+iz4/5i1UWZstjVoNDhnWw3qM8igzll
X-Google-Smtp-Source: AGHT+IH+6vAFbi+7H9+Qq6oBFGjvfco9YJD10/KKGRGKVUqABbwLY2AZfQVHTc1As+KdJzrE2dw9ZkGPK2jj2n3kE2k=
X-Received: by 2002:a05:6512:3da1:b0:553:2a2f:22eb with SMTP id
 2adb3069b0e04-55366c35872mr2987129e87.36.1749460244141; Mon, 09 Jun 2025
 02:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-7-apatel@ventanamicro.com> <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
In-Reply-To: <aDWk5kIN3lkB0Jw2@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 9 Jun 2025 14:40:32 +0530
X-Gm-Features: AX0GCFu9QhcInm8OVXRkSGSXY6CJ1XzDih7D6CmQzSnxoRj96FTDd8_3JeLtE_U
Message-ID: <CAK9=C2XbNeZRp9h4FevVBm-NdPH3w5t=C1NhAn5WQAkNLK9d_A@mail.gmail.com>
Subject: Re: [PATCH v4 06/23] mailbox: Allow controller specific mapping using fwnode
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_021045_900362_4065A5D3 
X-CRM114-Status: GOOD (  23.11  )
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
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Atish Patra <atish.patra@linux.dev>, Michael Turquette <mturquette@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, "Rafael J . Wysocki" <rafael@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgNToxMeKAr1BNIEFuZHkgU2hldmNoZW5rbwo8YW5kcml5
LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFN1biwgTWF5IDI1LCAy
MDI1IGF0IDAyOjE2OjUzUE0gKzA1MzAsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBJbnRyb2R1Y2Ug
b3B0aW9uYWwgZndfbm9kZSgpIGNhbGxiYWNrIHdoaWNoIGFsbG93cyBhIG1haWxib3ggY29udHJv
bGxlcgo+ID4gZHJpdmVyIHRvIHByb3ZpZGUgY29udHJvbGxlciBzcGVjaWZpYyBtYXBwaW5nIHVz
aW5nIGZ3bm9kZS4KPiA+Cj4gPiBUaGUgTGludXggT0YgZnJhbWV3b3JrIGFscmVhZHkgaW1wbGVt
ZW50cyBmd25vZGUgb3BlcmF0aW9ucyBmb3IgdGhlCj4gPiBMaW51eCBERCBmcmFtZXdvcmsgc28g
dGhlIGZ3X3hsYXRlKCkgY2FsbGJhY2sgd29ya3MgZmluZSB3aXRoIGRldmljZQo+ID4gdHJlZSBh
cyB3ZWxsLgo+Cj4gLi4uCj4KPiA+ICBzdHJ1Y3QgbWJveF9jaGFuICptYm94X3JlcXVlc3RfY2hh
bm5lbChzdHJ1Y3QgbWJveF9jbGllbnQgKmNsLCBpbnQgaW5kZXgpCj4gPiAgewo+ID4gKyAgICAg
c3RydWN0IGZ3bm9kZV9yZWZlcmVuY2VfYXJncyBmd3NwZWM7Cj4KPiArIHByb3BlcnR5LmggKGlm
IG5vdCBkb25lIHlldCkKClRoaXMgbmVlZHMgZndub2RlLmgKCj4KPiA+IC0gICAgIGludCByZXQ7
Cj4gPiArICAgICBpbnQgaSwgcmV0Owo+Cj4gV2h5IGlzICdpJyBzaWduZWQ/CgpObyBwYXJ0aWN1
bGFyIHJlYXNvbiBiZWNhdXNlICdpJyBpcyBub3QgYmVpbmcgYXNzaWduZWQgYSBuZWdhdGl2ZQp2
YWx1ZSBzbyBib3RoIHNpZ25lZCBhbmQgdW5zaWduZWQgd2lsbCB3b3JrIGZpbmUuCgo+Cj4gPiAt
ICAgICBpZiAoIWRldiB8fCAhZGV2LT5vZl9ub2RlKSB7Cj4gPiAtICAgICAgICAgICAgIHByX2Rl
YnVnKCIlczogTm8gb3duZXIgZGV2aWNlIG5vZGVcbiIsIF9fZnVuY19fKTsKPiA+ICsgICAgIGlm
ICghZGV2IHx8ICFkZXYtPmZ3bm9kZSkgewo+Cj4gRG8gbm90IGRlcmVmZXJlbmNlIGZ3bm9kZSBk
aXJlY3RseS4gVXNlIGRldl9md25vZGUuCj4KPiA+ICsgICAgICAgICAgICAgcHJfZGVidWcoIiVz
OiBObyBvd25lciAlc1xuIiwgX19mdW5jX18sICFkZXYgPyAiZGV2aWNlIiA6ICJmd25vZGUiKTsK
Pgo+IFVzZSBwb3NpdGl2ZSBjb25kaXRpb25hbC4KPgo+IF9fZnVuY19fIGlzIHJlZHVuZGFudCBp
dCBkZWJ1ZyBtZXNzYWdlcy4gV2l0aCBEeW5hbWljIERlYnVnIGVuYWJsZWQgaXQgbWF5IGJlCj4g
c3dpdGNoZWQgYXQgcnVuLXRpbWUuCgpPa2F5LCBJIHdpbGwgZHJvcCB0aGUgX19mdW5jX18KCj4K
PiA+ICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7Cj4gPiAgICAgICB9Cj4g
Pgo+ID4gLSAgICAgcmV0ID0gb2ZfcGFyc2VfcGhhbmRsZV93aXRoX2FyZ3MoZGV2LT5vZl9ub2Rl
LCAibWJveGVzIiwgIiNtYm94LWNlbGxzIiwKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGluZGV4LCAmc3BlYyk7Cj4gPiArICAgICByZXQgPSBmd25vZGVfcHJvcGVy
dHlfZ2V0X3JlZmVyZW5jZV9hcmdzKGRldi0+Zndub2RlLCAibWJveGVzIiwKPgo+ICAgICAgICAg
c3RydWN0IGZ3bm9kZV9oYW5kbGUgKmZ3bm9kZSA9IGRldl9md25vZGUoZGV2KTsKPgo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiI21ib3gtY2VsbHMi
LCAwLCBpbmRleCwgJmZ3c3BlYyk7Cj4gPiAgICAgICBpZiAocmV0KSB7Cj4gPiAgICAgICAgICAg
ICAgIGRldl9kYmcoZGV2LCAiJXM6IGNhbid0IHBhcnNlIFwibWJveGVzXCIgcHJvcGVydHlcbiIs
IF9fZnVuY19fKTsKPiA+ICAgICAgICAgICAgICAgcmV0dXJuIEVSUl9QVFIocmV0KTsKPiA+ICAg
ICAgIH0KPgo+ID4gKyAgICAgbWVtc2V0KCZzcGVjLCAwLCBzaXplb2Yoc3BlYykpOwo+ID4gKyAg
ICAgaWYgKGRldi0+b2Zfbm9kZSkgewo+Cj4gV2hhdCBpcyB0aGlzIGNoZWNrIGZvcj8KCkl0J3Mg
YSBwYXJhbm9pZCBjaGVjayBvbiBteSBwYXJ0LiBJIHdpbGwgZHJvcCB0aGUgY2hlY2sKaW4gdGhl
IG5leHQgcmV2aXNpb24uCgo+Cj4gPiArICAgICAgICAgICAgIHNwZWMubnAgPSB0b19vZl9ub2Rl
KGZ3c3BlYy5md25vZGUpOwo+ID4gKyAgICAgICAgICAgICBzcGVjLmFyZ3NfY291bnQgPSBmd3Nw
ZWMubmFyZ3M7Cj4gPiArICAgICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBzcGVjLmFyZ3NfY291
bnQ7IGkrKykKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzcGVjLmFyZ3NbaV0gPSBmd3NwZWMu
YXJnc1tpXTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICAgICAgIG11dGV4X2xvY2soJmNvbl9tdXRl
eCk7Cj4gPgo+ID4gICAgICAgY2hhbiA9IEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7Cj4gPiAtICAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5KG1ib3gsICZtYm94X2NvbnMsIG5vZGUpCj4gPiAtICAgICAg
ICAgICAgIGlmIChtYm94LT5kZXYtPm9mX25vZGUgPT0gc3BlYy5ucCkgewo+ID4gKyAgICAgbGlz
dF9mb3JfZWFjaF9lbnRyeShtYm94LCAmbWJveF9jb25zLCBub2RlKSB7Cj4gPiArICAgICAgICAg
ICAgIGlmIChtYm94LT5md194bGF0ZSAmJiBtYm94LT5kZXYtPmZ3bm9kZSA9PSBmd3NwZWMuZndu
b2RlKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY2hhbiA9IG1ib3gtPmZ3X3hsYXRlKG1i
b3gsICZmd3NwZWMpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmICghSVNfRVJSKGNoYW4p
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiArICAgICAgICAg
ICAgIH0gZWxzZSBpZiAobWJveC0+b2ZfeGxhdGUgJiYgbWJveC0+ZGV2LT5vZl9ub2RlID09IHNw
ZWMubnApIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBjaGFuID0gbWJveC0+b2ZfeGxhdGUo
bWJveCwgJnNwZWMpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmICghSVNfRVJSKGNoYW4p
KQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgICAg
ICAgIH0KPgo+Cj4gICAgICAgICAgICAgICAgIGlmICghSVNfRVJSKC4uLikpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4KPiBpcyBjb21tb24uCgpMYXRlc3QgbWFpbGJveC5jIGhh
cyBjaGFuZ2VkIHNvIEkgd2lsbCBjaGVjayBhbmQgdXBkYXRlIGFjY29yZGluZ2x5LgoKPgo+Cj4g
PiArICAgICB9Cj4KPiAuLi4KPgo+ID4gK2Z3X21ib3hfaW5kZXhfeGxhdGUoc3RydWN0IG1ib3hf
Y29udHJvbGxlciAqbWJveCwKPiA+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmd25v
ZGVfcmVmZXJlbmNlX2FyZ3MgKnNwKQo+Cj4gT25lIGxpbmU/CgpPa2F5LCBJIHdpbGwgdXBkYXRl
LgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
