Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3098C3ABB2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 May 2025 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYzaOoM25ywVPnnoPCZCH1hijN4AWKQDjbdRRU8rk+Y=; b=AWXnTtkpLRS3Yg
	M4S3Q96+Tjv3jYhlpEvv9BXKAKtbiv0eLwFEw6YvJK87Xx1fOt2z16Nq1MMZWIPLQZaLYp7jz6n0f
	1yn8cC9pAHsR2rYFbY9xmCWi4inhpll4J22B6woQ5z1jnXZ9ocukhYIN4S4KjEI+Jd4bgTAyFtOxn
	XXH2w+zCLkoCae3blMkXerpSsFZDtSQp/6spsQBmTZWnAsdQIlq78tKlb9+bQHnE2gsf0QK3WAtJ7
	I5ywsPjg9wITPs8SNF/XaYndrzr0CFyASr9PpfBpQGnEfe+0uoL2mBn9G1hfo/uTS52ruV+axvjwc
	GX1qwm6HIGw7c5Y0U4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmcS-00000001KsG-3Qqg;
	Fri, 02 May 2025 09:23:44 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmUL-00000001Jas-1Uhb
	for linux-riscv@lists.infradead.org;
	Fri, 02 May 2025 09:15:24 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-549967c72bcso1965598e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 May 2025 02:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746177319; x=1746782119; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySX9w+oPBio7ccREiLDzIFMncjou8m/kgRIbKYHKSu8=;
        b=fNZovstpOoC5NTgMxpCZFm4Ukp39xvFb44MUIMwt/gbDd2C3M6psCxlgrpgFjo8OL7
         7L4ADw55AU5sGmBzDZtBnEp6N4qlk0u/CE2qoPAg1X/P+1EOj7TwjUb4V/hphXrXJlHK
         +7fTApbq+hXAZ+dSbaN6WK01Por7ZMxC8zBepyyeL8deIBPp4fhMqfx5yJMEVULjcEd6
         TA9vDxvwFRPt8NmQryLeX1AvoKKqP5KjSpFMoupLZxtucZDVFQbM+byhXy71c93KTnCQ
         NlM7LigdtSQJ6ufEPUVL7XeRPJWLqcT+Nh6Rhmgjb6EcrN1bQpWHl4+aynp2fzJzHxRL
         Qo3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746177319; x=1746782119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySX9w+oPBio7ccREiLDzIFMncjou8m/kgRIbKYHKSu8=;
        b=L3PBqSoxNsBsIwipjY9BkzbHJJU2j/o+fCbEphtlkOiXuTjqV270QMBuQnuo4nUQ8V
         5/TvJGPuNnUCL2kG3TxxS9s3hKYiM2rsaTdaQdrydaAovM9CpQmAcB/sLorK4jmpDusQ
         ihHTw0Bw36Dj3rQdqjVBD2i1gTch1UR3mkAB7IPwBltDTTRRlVdRRhud/x8ReUIPo8A+
         EPhdo9WNcoA/n9Flr989V2uWTbqjBAsDf/TpgaHyEDlW4R9HSQhAf52LxeSt59GxFe0g
         igRnB9qH0cXKxzeF5x17PHmMZPnAje0ndwEYd0hCxB4T1kgrcwhqfqW7Rco99vUg51yo
         AYjg==
X-Forwarded-Encrypted: i=1; AJvYcCUsBmhaj2KjVGyMUkAMqi78L1V2L2Kaeyb9lGkViwLe59htodhOOjIvrKcJI9O9OudylK+gXm9n+e3UuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV889xMRSyBW1O88xR9KzDqKkI3Led4yYZ8DxykJMl8iI51ekI
	lBfF3Z0TUbEZDjBDzrWluBKvz4XJen/jPvNjGobqgMUvaOpyf/ZsiK8p2/A+nzi88IV8bvQ7Fw3
	UFS73r8NmOZzmToIaUK3J6rtE4opeGGvTUWMEN8aQpUffEja6Xlw=
X-Gm-Gg: ASbGncsCYLzrXlrnuju9FI/PFhwULKXMxayWOVfNRR2YZ9PPLa4gO5x1qLRezMFeocf
	00xP0bLVIgtWSUL5Fx7+z4yR7tIoESx6FQisoi9Rb71lR3vVdx3XBTkmQPIl/bVqPHK7wYTLn26
	pseNg48QMvz5uSt+QhDZtNpLQ=
X-Google-Smtp-Source: AGHT+IH05W+rHs8mZ1MIYxcHQsBlr++/4hOQdFgIvbgfRF1B9qUyGrmZWQ8wKGlpA+Rc8/GY0pzZWNyON1esrRA5bVg=
X-Received: by 2002:a05:6512:3e15:b0:54a:cc76:ad5e with SMTP id
 2adb3069b0e04-54eac1f0a74mr544047e87.3.1746177318745; Fri, 02 May 2025
 02:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-3-apatel@ventanamicro.com> <20250203223020.GA277987-robh@kernel.org>
In-Reply-To: <20250203223020.GA277987-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 2 May 2025 14:45:08 +0530
X-Gm-Features: ATxdqUH92AZUQ116dRuBh-zB0wpJxtNGQiHH2dWPIJIE2lX8xStUOkLcjPgQASo
Message-ID: <CAK9=C2VOxFJVfZxCPBi-79ZynexTMCa4nHinbH_MNt3Bdm-arg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/17] dt-bindings: mailbox: Add bindings for RPMI
 shared memory transport
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_021521_399204_110CD4CA 
X-CRM114-Status: GOOD (  25.38  )
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Anup Patel <anup@brainfault.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Rahul Pathak <rpathak@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atishp@atishpatra.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgNCwgMjAyNSBhdCA0OjAw4oCvQU0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAwMywgMjAyNSBhdCAwMjoxODo1MVBNICswNTMw
LCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gQWRkIGRldmljZSB0cmVlIGJpbmRpbmdzIGZvciB0aGUg
Y29tbW9uIFJJU0MtViBQbGF0Zm9ybSBNYW5hZ2VtZW50Cj4gPiBJbnRlcmZhY2UgKFJQTUkpIHNo
YXJlZCBtZW1vcnkgdHJhbnNwb3J0IGFzIGEgbWFpbGJveCBjb250cm9sbGVyLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0t
Cj4gPiAgLi4uL21haWxib3gvcmlzY3YscnBtaS1zaG1lbS1tYm94LnlhbWwgICAgICAgIHwgMTUw
ICsrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxNTAgaW5zZXJ0aW9ucygr
KQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWFpbGJveC9yaXNjdixycG1pLXNobWVtLW1ib3gueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWFpbGJveC9yaXNjdixycG1pLXNo
bWVtLW1ib3gueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94
L3Jpc2N2LHJwbWktc2htZW0tbWJveC55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi5jMzM5ZGY1ZDllMjQKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tYWlsYm94L3Jpc2N2LHJwbWkt
c2htZW0tbWJveC55YW1sCj4gPiBAQCAtMCwwICsxLDE1MCBAQAo+ID4gKyMgU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gKyVZQU1MIDEu
Mgo+ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWFpbGJv
eC9yaXNjdixycG1pLXNobWVtLW1ib3gueWFtbCMKPiA+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNl
dHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+ICsKPiA+ICt0aXRsZTogUklTQy1W
IFBsYXRmb3JtIE1hbmFnZW1lbnQgSW50ZXJmYWNlIChSUE1JKSBzaGFyZWQgbWVtb3J5IG1haWxi
b3gKPiA+ICsKPiA+ICttYWludGFpbmVyczoKPiA+ICsgIC0gQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KPiA+ICsKPiA+ICtkZXNjcmlwdGlvbjogfAo+ID4gKyAgVGhlIFJJU0MtViBQ
bGF0Zm9ybSBNYW5hZ2VtZW50IEludGVyZmFjZSAoUlBNSSkgWzFdIGRlZmluZXMgYSBjb21tb24g
c2hhcmVkCj4gPiArICBtZW1vcnkgYmFzZWQgUlBNSSB0cmFuc3BvcnQuIFRoaXMgUlBNSSBzaGFy
ZWQgbWVtb3J5IHRyYW5zcG9ydCBpbnRlZ3JhdGVzIGFzCj4gPiArICBtYWlsYm94IGNvbnRyb2xs
ZXIgaW4gdGhlIFNCSSBpbXBsZW1lbnRhdGlvbiBvciBzdXBlcnZpc29yIHNvZnR3YXJlIHdoZXJl
YXMKPiA+ICsgIGVhY2ggUlBNSSBzZXJ2aWNlIGdyb3VwIGlzIG1haWxib3ggY2xpZW50IGluIHRo
ZSBTQkkgaW1wbGVtZW50YXRpb24gYW5kCj4gPiArICBzdXBlcnZpc29yIHNvZnR3YXJlLgo+ID4g
Kwo+ID4gKyAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+ID4g
KyAgUmVmZXJlbmNlcwo+ID4gKyAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ID4gKwo+ID4gKyAgWzFdIFJJU0MtViBQbGF0Zm9ybSBNYW5hZ2VtZW50IEludGVy
ZmFjZSAoUlBNSSkKPiA+ICsgICAgICBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9y
aXNjdi1ycG1pL3JlbGVhc2VzCj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+ICsgIGNvbXBhdGli
bGU6Cj4gPiArICAgIGNvbnN0OiByaXNjdixycG1pLXNobWVtLW1ib3gKPiA+ICsKPiA+ICsgIHJl
ZzoKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBk
ZXNjcmlwdGlvbjogQTJQIHJlcXVlc3QgcXVldWUgYmFzZSBhZGRyZXNzCj4gPiArICAgICAgICAg
IC0gZGVzY3JpcHRpb246IFAyQSBhY2tub3dsZWRnbWVudCBxdWV1ZSBiYXNlIGFkZHJlc3MKPiA+
ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogUDJBIHJlcXVlc3QgcXVldWUgYmFzZSBhZGRyZXNz
Cj4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IEEyUCBhY2tub3dsZWRnbWVudCBxdWV1ZSBi
YXNlIGFkZHJlc3MKPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogQTJQIGRvb3JiZWxsIGFk
ZHJlc3MKPiA+ICsgICAgICAtIGl0ZW1zOgo+ID4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBB
MlAgcmVxdWVzdCBxdWV1ZSBiYXNlIGFkZHJlc3MKPiA+ICsgICAgICAgICAgLSBkZXNjcmlwdGlv
bjogUDJBIGFja25vd2xlZGdtZW50IHF1ZXVlIGJhc2UgYWRkcmVzcwo+ID4gKyAgICAgICAgICAt
IGRlc2NyaXB0aW9uOiBQMkEgcmVxdWVzdCBxdWV1ZSBiYXNlIGFkZHJlc3MKPiA+ICsgICAgICAg
ICAgLSBkZXNjcmlwdGlvbjogQTJQIGFja25vd2xlZGdtZW50IHF1ZXVlIGJhc2UgYWRkcmVzcwo+
ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IEEyUCByZXF1
ZXN0IHF1ZXVlIGJhc2UgYWRkcmVzcwo+ID4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBQMkEg
YWNrbm93bGVkZ21lbnQgcXVldWUgYmFzZSBhZGRyZXNzCj4gPiArICAgICAgICAgIC0gZGVzY3Jp
cHRpb246IEEyUCBkb29yYmVsbCBhZGRyZXNzCj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAg
ICAgICAgLSBkZXNjcmlwdGlvbjogQTJQIHJlcXVlc3QgcXVldWUgYmFzZSBhZGRyZXNzCj4gPiAr
ICAgICAgICAgIC0gZGVzY3JpcHRpb246IFAyQSBhY2tub3dsZWRnbWVudCBxdWV1ZSBiYXNlIGFk
ZHJlc3MKPiA+ICsKPiA+ICsgIHJlZy1uYW1lczoKPiA+ICsgICAgb25lT2Y6Cj4gPiArICAgICAg
LSBpdGVtczoKPiA+ICsgICAgICAgICAgLSBjb25zdDogYTJwLXJlcQo+ID4gKyAgICAgICAgICAt
IGNvbnN0OiBwMmEtYWNrCj4gPiArICAgICAgICAgIC0gY29uc3Q6IHAyYS1yZXEKPiA+ICsgICAg
ICAgICAgLSBjb25zdDogYTJwLWFjawo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBkb29yYmVsbAo+
ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IGEycC1yZXEKPiA+ICsg
ICAgICAgICAgLSBjb25zdDogcDJhLWFjawo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBwMmEtcmVx
Cj4gPiArICAgICAgICAgIC0gY29uc3Q6IGEycC1hY2sKPgo+IFRoZXNlIGZpcnN0IDIgaXRlbXMg
bGlzdHMgY2FuIGJlIGNvbWJpbmVkIHdpdGggdGhlIGFkZGl0aW9uIG9mCj4gJ21pbkl0ZW1zOiA0
JwoKSXQgc2VlbXMgIm1pbkl0ZW1zIiBpcyBub3QgYWxsb3dlZCB1bmRlciAiaXRlbXMiLgoKSWYg
d2UgcHV0ICJtaW5JdGVtczogNCIgdW5kZXIgInJlZy1uYW1lcyIgdGhlbiBiZWxvdwpjb21iaW5h
dGlvbnMgYmVjb21lIGludmFsaWQuCgo+Cj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAg
ICAgLSBjb25zdDogYTJwLXJlcQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBwMmEtYWNrCj4gPiAr
ICAgICAgICAgIC0gY29uc3Q6IGRvb3JiZWxsCj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAg
ICAgICAgLSBjb25zdDogYTJwLXJlcQo+ID4gKyAgICAgICAgICAtIGNvbnN0OiBwMmEtYWNrCj4g
PiArCj4gPiArICBpbnRlcnJ1cHRzOgo+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gKyAgICBkZXNj
cmlwdGlvbjoKPiA+ICsgICAgICBUaGUgUlBNSSBzaGFyZWQgbWVtb3J5IHRyYW5zcG9ydCBzdXBw
b3J0cyB3aXJlZCBpbnRlcnJ1cHQgc3BlY2lmaWVkIGJ5Cj4gPiArICAgICAgdGhpcyBwcm9wZXJ0
eSBhcyB0aGUgUDJBIGRvb3JiZWxsLgo+ID4gKwo+ID4gKyAgbXNpLXBhcmVudDoKPiA+ICsgICAg
ZGVzY3JpcHRpb246Cj4gPiArICAgICAgVGhlIFJQTUkgc2hhcmVkIG1lbW9yeSB0cmFuc3BvcnQg
c3VwcG9ydHMgTVNJIGFzIFAyQSBkb29yYmVsbCBhbmQgdGhpcwo+ID4gKyAgICAgIHByb3BlcnR5
IHNwZWNpZmllcyB0aGUgdGFyZ2V0IE1TSSBjb250cm9sbGVyLgo+ID4gKwo+ID4gKyAgcmlzY3Ys
c2xvdC1zaXplOgo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9u
cy91aW50MzIKPiA+ICsgICAgbWluaW11bTogNjQKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiAr
ICAgICAgUG93ZXItb2YtMiBSUE1JIHNsb3Qgc2l6ZSBvZiB0aGUgUlBNSSBzaGFyZWQgbWVtb3J5
IHRyYW5zcG9ydC4KPiA+ICsKPiA+ICsgIHJpc2N2LGRvb3JiZWxsLW1hc2s6Cj4gPiArICAgICRy
ZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gKyAgICBkZWZh
dWx0OiAweGZmZmZmZmZmCj4gPiArICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgIFVwZGF0ZSBv
bmx5IHRoZSByZWdpc3RlciBiaXRzIG9mIGRvb3JiZWxsIGRlZmluZWQgYnkgdGhlIG1hc2sgKDMy
IGJpdCkuCj4gPiArCj4gPiArICByaXNjdixkb29yYmVsbC12YWx1ZToKPiA+ICsgICAgJHJlZjog
L3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiArICAgIGRlZmF1bHQ6
IDB4MQo+ID4gKyAgICBkZXNjcmlwdGlvbjoKPiA+ICsgICAgICBWYWx1ZSB3cml0dGVuIHRvIHRo
ZSBkb29yYmVsbCByZWdpc3RlciBiaXRzICgzMi1iaXQgYWNjZXNzKSBzcGVjaWZpZWQKPiA+ICsg
ICAgICBieSB0aGUgcmlzY3YsZGItbWFzayBwcm9wZXJ0eS4KPgo+IFlvdSBtZWFuIHJpc2N2LGRv
b3JiZWxsLW1hc2s/Cj4KPiBJJ20gY29uZnVzZWQgd2h5IHlvdSB3b3VsZCBuZWVkIGJvdGg/IElm
IHRoZSB2YWx1ZSB0byB3cml0ZSBpcyBmaXhlZAo+IGhlcmUsIHRoZW4gd2h5IGRvIHlvdSBuZWVk
IGEgbWFzaz8gWW91IGNvdWxkIGp1c3QgbWFzayB0aGUgdmFsdWUgaGVyZS4KPgo+IEkgYXNzdW1l
IHRoZXJlJ3Mgc29tZSBkZXBlbmRlbmN5IGJldHdlZW4gdGhlc2UgMiBwcm9wZXJ0aWVzLiBUaGF0
IG5lZWRzCj4gdG8gYmUgY2FwdHVyZWQgd2l0aCAnZGVwZW5kZW5jaWVzJy4KCldlIGRvbid0IG5l
ZWQgdGhlICJyaXNjdixkb29yYmVsbC1tYXNrIiBwcm9wZXJ0eSBiZWNhdXNlIHRoZQpsYXRlc3Qg
ZnJvemVuIFJQTUkgc3BlY2lmaWNhdGlvbiBvbmx5IGRlZmluZXMgYSB3cml0ZS1vbmx5IDMyLWJp
dApkb29yYmVsbCByZWdpc3Rlci4gSSB3aWxsIHJlbW92ZSB0aGlzIHByb3BlcnR5IGluIHRoZSBu
ZXh0IHJldmlzaW9uLgoKPgo+ID4gKwo+ID4gKyAgIiNtYm94LWNlbGxzIjoKPiA+ICsgICAgY29u
c3Q6IDEKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgVGhlIGZpcnN0IGNlbGwgc3Bl
Y2lmaWVzIFJQTUkgc2VydmljZSBncm91cCBJRC4KPiA+ICsKPiA+ICtyZXF1aXJlZDoKPiA+ICsg
IC0gY29tcGF0aWJsZQo+ID4gKyAgLSByZWcKPiA+ICsgIC0gcmVnLW5hbWVzCj4gPiArICAtIHJp
c2N2LHNsb3Qtc2l6ZQo+ID4gKyAgLSAiI21ib3gtY2VsbHMiCj4gPiArCj4gPiArYW55T2Y6Cj4g
PiArICAtIHJlcXVpcmVkOgo+ID4gKyAgICAgIC0gaW50ZXJydXB0cwo+ID4gKyAgLSByZXF1aXJl
ZDoKPiA+ICsgICAgICAtIG1zaS1wYXJlbnQKPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICAvLyBFeGFt
cGxlIDEgKFJQTUkgc2hhcmVkIG1lbW9yeSB3aXRoIG9ubHkgMiBxdWV1ZXMpOgo+ID4gKyAgICBt
YWlsYm94QDEwMDgwMDAwIHsKPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmlzY3YscnBtaS1z
aG1lbS1tYm94IjsKPiA+ICsgICAgICAgIHJlZyA9IDwweDEwMDgwMDAwIDB4MTAwMDA+LAo+ID4g
KyAgICAgICAgICAgICAgPDB4MTAwOTAwMDAgMHgxMDAwMD4sCj4gPiArICAgICAgICAgICAgICA8
MHgxMDBhMDAwMCAweDQ+Owo+ID4gKyAgICAgICAgcmVnLW5hbWVzID0gImEycC1yZXEiLCAicDJh
LWFjayIsICJkb29yYmVsbCI7Cj4gPiArICAgICAgICBtc2ktcGFyZW50ID0gPCZpbXNpY19tbGV2
ZWw+Owo+ID4gKyAgICAgICAgcmlzY3Ysc2xvdC1zaXplID0gPDY0PjsKPiA+ICsgICAgICAgICNt
Ym94LWNlbGxzID0gPDE+Owo+ID4gKyAgICB9Owo+ID4gKyAgLSB8Cj4gPiArICAgIC8vIEV4YW1w
bGUgMiAoUlBNSSBzaGFyZWQgbWVtb3J5IHdpdGggb25seSA0IHF1ZXVlcyk6Cj4gPiArICAgIG1h
aWxib3hAMTAwMDEwMDAgewo+ID4gKyAgICAgICAgY29tcGF0aWJsZSA9ICJyaXNjdixycG1pLXNo
bWVtLW1ib3giOwo+ID4gKyAgICAgICAgcmVnID0gPDB4MTAwMDEwMDAgMHg4MDA+LAo+ID4gKyAg
ICAgICAgICAgICAgPDB4MTAwMDE4MDAgMHg4MDA+LAo+ID4gKyAgICAgICAgICAgICAgPDB4MTAw
MDIwMDAgMHg4MDA+LAo+ID4gKyAgICAgICAgICAgICAgPDB4MTAwMDI4MDAgMHg4MDA+LAo+ID4g
KyAgICAgICAgICAgICAgPDB4MTAwMDMwMDAgMHg0PjsKPiA+ICsgICAgICAgIHJlZy1uYW1lcyA9
ICJhMnAtcmVxIiwgInAyYS1hY2siLCAicDJhLXJlcSIsICJhMnAtYWNrIiwgImRvb3JiZWxsIjsK
PiA+ICsgICAgICAgIG1zaS1wYXJlbnQgPSA8Jmltc2ljX21sZXZlbD47Cj4gPiArICAgICAgICBy
aXNjdixzbG90LXNpemUgPSA8NjQ+Owo+ID4gKyAgICAgICAgcmlzY3YsZG9vcmJlbGwtbWFzayA9
IDwweDAwMDA4MDAwPjsKPiA+ICsgICAgICAgIHJpc2N2LGRvb3JiZWxsLXZhbHVlID0gPDB4MDAw
MDgwMDA+Owo+ID4gKyAgICAgICAgI21ib3gtY2VsbHMgPSA8MT47Cj4gPiArICAgIH07Cj4gPiAt
LQo+ID4gMi40My4wCj4gPgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
