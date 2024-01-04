Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C58C3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 01:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dr5zmF8KyXQCCJQhBdOgyUZKLrg+nAP5/JAvx2qmSxQ=; b=ETttWR5PmyeF0B
	7jjmGcsiaSHNozO9sh61AWWWaBAjSG/S4Tb8TdraViDTkSXDuh/4lSiN/ughhhiYWzZEj1ZsIukFv
	4qPuOCNgWXJ/hUbYou1k13PiCiXxFeLGxIpP4DYGMH+6/bR4+CZKbMmynUr3XE/GuZfyo9PurS3gT
	4CLSeAw8g22QGnlFl7RoH3ltSPbpMTtaLdrlosCKWVbvt5rutZqyQ69dEX51aPmrZ6jLQmJA8k7uB
	a98/x4txe2u0N35aMoi8SUEWmYisRxqJ2HallqPn0WA0B3yZcCHM67V/UovyCdSQPWcGab9BZb3z+
	1mfWQ/eRw+Sxi5dObjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLCTi-00CZJY-2Z;
	Thu, 04 Jan 2024 01:24:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLCTf-00CZIu-0l
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 01:24:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84761615FD
	for <linux-riscv@lists.infradead.org>; Thu,  4 Jan 2024 01:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1346C433CD
	for <linux-riscv@lists.infradead.org>; Thu,  4 Jan 2024 01:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704331493;
	bh=kdiz8o8d/7k1J0F+igL00Zui4dSZF0XFj1b7FGHQtiE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tMrNfGBO3wHy4+Rjoro8wYszWNnfUkoML2TYONWJrvc2yNhclGP3TPSW4V5yCuzlb
	 SeCem0UKZN0Uz20PKrQ2Ch1YKSqr8vnCl1pxgGtGqiaXc4ha6p/ZAipQu4IauJcbhf
	 fgamOMFCveEszky6qY8IHTPUrTdT32SuV21n0UjCkrDazY5Dbkf6b2C96B8q2b/qSK
	 bbPMuw5C29OYTYedG7S3d5l2aIgepAiqbpHlXRf3y8IDEwc15YPITq4vvuE3N8+d8X
	 W7M04j3qjxhtpkyb0ggJEwU8T6HfgyWc23AiOrdr+hyb4St4v5VO5EHFMTAc7Ks6DZ
	 b5y4L+IXauqPw==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55692ad81e3so45144a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 17:24:53 -0800 (PST)
X-Gm-Message-State: AOJu0YzzlOPCB50N3x5nrSufeirmRnEHuJEXI0yWGsaNgO+EZn99ZoaT
	nYJP8TDxGlKYie2EfbzlfewfPrgrhjKl123/MaQ=
X-Google-Smtp-Source: AGHT+IFyflSadMBXsVfi2tQC8KfzFo0ziT4bMqARq1rdklWXKp3oTtWhmdLr1CzEBPxozr2h8pwAt5OUEPQQlobsxjU=
X-Received: by 2002:a50:c182:0:b0:556:db12:af4b with SMTP id
 m2-20020a50c182000000b00556db12af4bmr803567edf.54.1704331491922; Wed, 03 Jan
 2024 17:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-4-guoren@kernel.org>
 <20240102-81391283df04c430d76c0eb0@orel> <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com>
 <ZZW5Y85OdibCu58h@LeoBras>
In-Reply-To: <ZZW5Y85OdibCu58h@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Jan 2024 09:24:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTpi5A+9KP5EyH9qhD_fwuZrWpx6zdCJyG+iv0Ez5q-gw@mail.gmail.com>
Message-ID: <CAJF2gTTpi5A+9KP5EyH9qhD_fwuZrWpx6zdCJyG+iv0Ez5q-gw@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
To: Leonardo Bras <leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_172455_362287_0F7C25C7 
X-CRM114-Status: GOOD (  29.95  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, wuwei2016@iscas.ac.cn, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wefu@redhat.com, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gNCwgMjAyNCBhdCAzOjQ14oCvQU0gTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0By
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIFdlZCwgSmFuIDAzLCAyMDI0IGF0IDAyOjE1OjQ1UE0g
KzA4MDAsIEd1byBSZW4gd3JvdGU6Cj4gPiBPbiBUdWUsIEphbiAyLCAyMDI0IGF0IDc6MTnigK9Q
TSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+
ID4gT24gU3VuLCBEZWMgMzEsIDIwMjMgYXQgMDM6Mjk6NTNBTSAtMDUwMCwgZ3VvcmVuQGtlcm5l
bC5vcmcgd3JvdGU6Cj4gPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgo+ID4gPiA+Cj4gPiA+ID4gVGhlIGNvc3Qgb2YgY2hhbmdpbmcgYSBjYWNoZWxpbmUgZnJv
bSBzaGFyZWQgdG8gZXhjbHVzaXZlIHN0YXRlIGNhbiBiZQo+ID4gPiA+IHNpZ25pZmljYW50LCBl
c3BlY2lhbGx5IHdoZW4gdGhpcyBpcyB0cmlnZ2VyZWQgYnkgYW4gZXhjbHVzaXZlIHN0b3JlLAo+
ID4gPiA+IHNpbmNlIGl0IG1heSByZXN1bHQgaW4gaGF2aW5nIHRvIHJldHJ5IHRoZSB0cmFuc2Fj
dGlvbi4KPiA+ID4gPgo+ID4gPiA+IFRoaXMgcGF0Y2ggbWFrZXMgdXNlIG9mIHByZWZldGNoLncg
dG8gcHJlZmV0Y2ggY2FjaGVsaW5lcyBmb3Igd3JpdGUKPiA+ID4gPiBwcmlvciB0byBsci9zYyBs
b29wcyB3aGVuIHVzaW5nIHRoZSB4Y2hnX3NtYWxsIGF0b21pYyByb3V0aW5lLgo+ID4gPiA+Cj4g
PiA+ID4gVGhpcyBwYXRjaCBpcyBpbnNwaXJlZCBieSBjb21taXQ6IDBlYTM2NmY1ZTFiNiAoImFy
bTY0OiBhdG9taWNzOgo+ID4gPiA+IHByZWZldGNoIHRoZSBkZXN0aW5hdGlvbiB3b3JkIGZvciB3
cml0ZSBwcmlvciB0byBzdHhyIikuCj4gPiA+ID4KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8g
UmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY21weGNoZy5oIHwgNCArKystCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY21weGNoZy5oCj4gPiA+ID4gaW5kZXggMjZjZWEyMzk1YWFlLi5kN2I5ZDc5NTFmMDggMTAw
NjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgKPiA+ID4g
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+ID4gPiA+IEBAIC0xMCw2
ICsxMCw3IEBACj4gPiA+ID4KPiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gPiA+
ID4gICNpbmNsdWRlIDxhc20vZmVuY2UuaD4KPiA+ID4gPiArI2luY2x1ZGUgPGFzbS9wcm9jZXNz
b3IuaD4KPiA+ID4gPgo+ID4gPiA+ICAjZGVmaW5lIF9fYXJjaF94Y2hnX21hc2tlZChwcmVwZW5k
LCBhcHBlbmQsIHIsIHAsIG4pICAgICAgICAgICAgICAgICBcCj4gPiA+Cj4gPiA+IEFyZSB5b3Ug
c3VyZSB0aGlzIGlzIGJhc2VkIG9uIHY2LjctcmM3PyBCZWNhdXNlIEkgZG9uJ3Qgc2VlIHRoaXMg
bWFjcm8uCj4gPiBPaCwgaXQgaXMgYmFzZWQgb24gTGVvYnJhcycgcGF0Y2hlcy4gSSB3b3VsZCBy
ZW1vdmUgaXQgaW4gdGhlIG5leHQgb2YgdmVyc2lvbi4KPgo+IEkgd291bGQgc2F5IHRoaXMgbmV4
dCA6KQpUaHggZm9yIHRoZSBncmFtbWFyIGNvcnJlY3Rpb24uCgo+Cj4gPgo+ID4gPgo+ID4gPiA+
ICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiA+ID4gQEAgLTIzLDYgKzI0LDcgQEAKPiA+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ID4gPiA+ICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fICggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gICAgICAgICAgICAgIHByZXBl
bmQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+
ID4gPiArICAgICAgICAgICAgUFJFRkVUQ0hXX0FTTSglNSkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICAgICAgICAgICAgICAiMDogICAgICBsci53ICUw
LCAlMlxuIiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gICAgICAg
ICAgICAgICIgICAgICAgIGFuZCAgJTEsICUwLCAlejRcbiIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ID4gPiAgICAgICAgICAgICAgIiAgICAgICAgb3IgICAlMSwgJTEsICV6M1xu
IiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+IEBAIC0zMCw3ICszMiw3IEBA
Cj4gPiA+ID4gICAgICAgICAgICAgICIgICAgICAgIGJuZXogJTEsIDBiXG4iICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiAgICAgICAgICAgICAgYXBwZW5kICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ICAg
ICAgICAgICAgICA6ICI9JnIiIChfX3JldHgpLCAiPSZyIiAoX19yYyksICIrQSIgKCooX19wdHIz
MmIpKSAgICAgICBcCj4gPiA+ID4gLSAgICAgICAgICAgIDogInJKIiAoX19uZXd4KSwgInJKIiAo
fl9fbWFzaykgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiArICAgICAgICAgICAg
OiAickoiIChfX25ld3gpLCAickoiICh+X19tYXNrKSwgInJKIiAoX19wdHIzMmIpICAgICAgICAg
XAo+ID4gPgo+ID4gPiBJJ20gcHJldHR5IHN1cmUgd2UgZG9uJ3Qgd2FudCB0byBhbGxvdyB0aGUg
SiBjb25zdHJhaW50IGZvciBfX3B0cjMyYi4KPiA+ID4KPiA+ID4gPiAgICAgICAgICAgICAgOiAi
bWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gICAgICAgciA9IChfX3R5cGVvZl9fKCoocCkp
KSgoX19yZXR4ICYgX19tYXNrKSA+PiBfX3MpOyAgICAgICAgICAgICAgIFwKPiA+ID4gPiAtLQo+
ID4gPiA+IDIuNDAuMQo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcywKPiA+ID4gZHJldwo+ID4K
PiA+Cj4gPgo+ID4gLS0KPiA+IEJlc3QgUmVnYXJkcwo+ID4gIEd1byBSZW4KPiA+Cj4KPiBOaWNl
IHBhdGNoIDopCj4gQW55IHJlYXNvbiBpdCdzIG5vdCBuZWVkZWQgaW4gX19hcmNoX2NtcHhjaGdf
bWFza2VkKCksIGFuZCBfX2FyY2hfY21weGNoZygpID8KQ0FTIGlzIGEgY29uZGl0aW9uYWwgQU1P
LCB1bmxpa2UgeGNoZyAoU3RhbmQgQU1PKS4gQXJtNjQgaXMgd3JvbmcsIG9yCnRoZXkgaGF2ZSBh
IHByb2JsZW0gd2l0aCB0aGUgaGFyZHdhcmUuCgo+Cj4gVGhhbmtzIQo+IExlbwo+CgoKLS0gCkJl
c3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
