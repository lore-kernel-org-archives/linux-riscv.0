Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DACDC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 03:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESn6IIiOXl9K8YtEBlDwJ7jEUxDHkHOHQDJ/oB4uhWU=; b=Z2Frs23GvdE7+h
	UDBtCTypXOe5CHhjeygIS2JQWYIcUBgBEfnyQnPfAORJIwZBnq/xzleXvy68d2o9kqdvbs5eYXEgg
	oD8DdHRHDBJqaYPCULfyuPv9RWQ0eXULxMIrHpgKxLZm4CXc/DOBSguhsYG+c2pQJaBhAjh+jSzzt
	WTENo6jEvYRkm1I3ds0Ry1cQZBeuOqrkEncKUsNF+3UZruNmmXXV5fWU01lypSeUq3ocU3sDFvDjJ
	xq0pHIkJjB4z9ZET3zBeoNjU7RvRp3Jx6pPmxzI2fUim7EnZjZyZsL3Jd7X3hM9ANWVEjpK5aE2/t
	xc2ILXO8oQtOWRVDVpEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJoD-00000008H5T-0ZF2;
	Mon, 12 May 2025 03:26:29 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEJoA-00000008H56-4A1a
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 03:26:28 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e733e25bfc7so3737607276.3
        for <linux-riscv@lists.infradead.org>; Sun, 11 May 2025 20:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747020386; x=1747625186; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfWxCu+80YGp3dsRc7TGJltXL61pho9Cm2NBMxTsy1k=;
        b=WlwwjLfw74rVjSyeqkpWVhQjAYBCHwrJBiPU3SlqO5Oae/ZbEbO12EUngcbWB66FCt
         inSSMHpDLR/OVl8+rb2WwjBuKm2lqvXfaeIOFEDWe1y1STpIJi0oJ8UhBjfRSJu0/HCr
         oFosi0SRdgblNItBCTun7CfZsglDlTDjdGVgCu5jSmsP7PZCE1j+DwK3IpEgIfljI4ZA
         CIMzoSLJtoItu5eaEpXDSrd7nTHCnzTQqqwikKOEO9gU2N8IRnpzIh9oCNqStqhKHpJX
         k61v/fz4uZM3kL9RqqUzRSsjesEJdnYpSlFqzPRp5yYuftC5Oy1RlbUFSZIhg/D6R9ci
         ZLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747020386; x=1747625186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfWxCu+80YGp3dsRc7TGJltXL61pho9Cm2NBMxTsy1k=;
        b=ZhzPjJZLXyxcISzh4XwrCZz650YRIFCz8ufUGfEJF0TR9Xh4oiLIUHGFh7cKeazgNj
         bLBQ6HpxRWTaigmgqIYUVjMlEdzpe1vp/aVw6g9L0Q5Dwl30TmyWSr9m9DVf10NAet9g
         /peiZjEIHLwPRg3J1m6KHPgVs8LJzz1EU4gxIU6Vs8PaOGe1v07t9eR2NcNMnZtO7FHj
         xGwth9aYRabU5VrwVXYyjv43ApY1OWLtGW5KpuHkjW5l8KUpWfzKz8txjLzM8uIR98pr
         ZVvLSKN1MrLhWuSjwzrcPmm4rfi1oJCvexUXFRGKxqYm7reu8rwVz1AIj8irfjSDBkeX
         /hhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIJu7M4CYKkZQ6ge7o0+TOZfOvI0ONMfo+Z/IDUI3LZNzBggieuIRb06fapC0Z79QaWKkBjfqQIupR6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHD3f3+uIbk8/ZHRjkPU81FHgidoKlLm1nNkiRCOQ7wJUOE07a
	Jz15lTDp2WhxRLyclNHffQprnRzNt/bDbqz5F73BqM41QH1r6wS4Bp/GUcerF08VueuTIMFOfO8
	GInBr5qF4Krk3VMRtP3uX24DptrDChaPxnyUjNQ==
X-Gm-Gg: ASbGncs5CJfzxPYeza6r6Mz/64yOdlG2eqMG13DnqSC28UYoDR7JXit/e6pUqoHd0dg
	sL0TvcDPrh9CKLzQMfvswYgSdmJP0mZLnDnVQK2MpnbvDUTVisqBhZSsM1rjsnL6ZxxchOmifPf
	MYwLju2kVTaY04f+EsmlsKvTzzhBc4umJQu62alZ5xAKMXCA==
X-Google-Smtp-Source: AGHT+IGtkZqxlKO6AHhnqXbF+6aNJ8LJBGHymo3UJ2OpmmMYxoV5MTDsPcHCXmednPAxGy4zAQJR2dZ8KKJ5Sp2Djss=
X-Received: by 2002:a05:6902:2783:b0:e79:5e92:4e2d with SMTP id
 3f1490d57ef6-e795e925048mr7437734276.36.1747020386031; Sun, 11 May 2025
 20:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250509021605.26764-1-nick.hu@sifive.com> <20250509-small-graceful-limpet-d0ea41@kuoka>
 <20250509-subtract-caramel-08d47ed3281c@spud>
In-Reply-To: <20250509-subtract-caramel-08d47ed3281c@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 12 May 2025 11:26:15 +0800
X-Gm-Features: AX0GCFsOAs79WJzXlZ70CouAkS-8u5dlCMjR_uUuCS_CkqRYe51AGaRcgARazwU
Message-ID: <CAKddAkCqKcnWh1VZ1wN3FyvQb_t+Gt2PeejZfA2RYhTU5A-QeA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: power: Add SiFive Domain Management controllers
To: Conor Dooley <conor@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Cyan Yang <cyan.yang@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_202627_046833_23006A26 
X-CRM114-Status: GOOD (  32.50  )
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

T24gRnJpLCBNYXkgOSwgMjAyNSBhdCAxMTo1N+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIE1heSAwOSwgMjAyNSBhdCAwODo0MDoyOEFNICsw
MjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+ID4gT24gRnJpLCBNYXkgMDksIDIwMjUg
YXQgMTA6MTY6MDRBTSBHTVQsIE5pY2sgSHUgd3JvdGU6Cj4gPiA+IFNpRml2ZSBEb21haW4gTWFu
YWdlbWVudCBjb250cm9sbGVyIGluY2x1ZGVzIHRoZSBmb2xsb3dpbmcgY29tcG9uZW50cwo+ID4g
PiAtIFNpRml2ZSBUaWxlIE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4gPiAtIFNpRml2ZSBDbHVz
dGVyIE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4gPiAtIFNpRml2ZSBDb3JlIENvbXBsZXggTWFu
YWdlbWVudCBDb250cm9sbGVyCj4gPiA+Cj4gPiA+IFRoZXNlIGNvbnRyb2xsZXJzIGNvbnRyb2wg
dGhlIGNsb2NrIGFuZCBwb3dlciBkb21haW4gb2YgdGhlCj4gPiA+IGNvcnJlc3BvbmRpbmcgZG9t
YWluLgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5j
b20+Cj4gPiA+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9z
aWZpdmUsdG1jLnlhbWwgfCA4OSArKysrKysrKysrKysrKysrKysrCj4gPgo+ID4gV2hlcmUgaXMg
YSBwYXRjaCB3aXRoIHRoZSBkcml2ZXIgKHVzZXIgb2YgdGhlIGJpbmRpbmcpPwo+ID4KPiA+ID4g
IDEgZmlsZSBjaGFuZ2VkLCA4OSBpbnNlcnRpb25zKCspCj4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bvd2VyL3NpZml2ZSx0bWMueWFt
bAo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Bvd2VyL3NpZml2ZSx0bWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wb3dlci9zaWZpdmUsdG1jLnlhbWwKPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi43ZWQ0ZjI5MGI5NGIKPiA+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcG93ZXIvc2lmaXZl
LHRtYy55YW1sCj4gPiA+IEBAIC0wLDAgKzEsODkgQEAKPiA+ID4gKyMgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+ID4gPiArJVlBTUwgMS4y
Cj4gPiA+ICstLS0KPiA+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcG93
ZXIvc2lmaXZlLHRtYy55YW1sIwo+ID4gPiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3Jn
L21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4gPiA+ICsKPiA+ID4gK3RpdGxlOiBTaUZpdmUgRG9t
YWluIE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4gPiArCj4gPiA+ICttYWludGFpbmVyczoKPiA+
ID4gKyAgLSBDeWFuIFlhbmcgPGN5YW4ueWFuZ0BzaWZpdmUuY29tPgo+ID4gPiArICAtIE5pY2sg
SHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+ID4gKyAgLSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVs
LmhvbGxhbmRAc2lmaXZlLmNvbT4KPiA+ID4gKwo+ID4gPiArZGVzY3JpcHRpb246IHwKPiA+ID4g
KyAgVGhpcyBpcyB0aGUgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhlIGZvbGxvd2luZyBTaUZp
dmUgRG9tYWluIE1hbmFnZW1lbnQgQ29udHJvbGxlcnMuCj4gPgo+ID4gRXhwbGFpbiB0aGUgaGFy
ZHdhcmUsIG5vdCB0aGF0ICJiaW5kaW5nIGlzIGEgYmluZGluZyBmb3IgLi4uIi4KPiA+Cj4gPiBB
bHNvLCB3cmFwIGFjY29yZGluZyB0byBMaW51eCBjb2Rpbmcgc3R5bGUuCj4gPgo+ID4KPiA+ID4g
KyAgLSBUaWxlIE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4gPiArICAgICAgLSBUTUMwCj4gPiA+
ICsgICAgICAtIFRNQzEKPiA+ID4gKyAgICAgIC0gVE1DMgo+ID4gPiArICAgICAgLSBUTUMzCj4g
PiA+ICsgIC0gU3Vic3lzdGVtIE1hbmFnZW1lbnQgQ29udHJvbGxlcgo+ID4gPiArICAgICAgLSBT
TUMwCj4gPiA+ICsgICAgICAtIFNNQzEKPiA+ID4gKyAgICAgIC0gU01DMgo+ID4gPiArICAgICAg
LSBTTUMzCj4gPiA+ICsgIC0gQ2x1c3RlciBNYW5hZ2VtZW50IENvbnRyb2xsZXIKPiA+ID4gKyAg
ICAgIC0gQ01DMgo+ID4gPiArICAgICAgLSBDTUMzCj4gPiA+ICsgIFNpRml2ZSBEb21haW4gTWFu
YWdlbWVudCBDb250cm9sbGVycyBzdXBwb3J0IHRoZSBTaUZpdmUgUXVpZXQgSW50ZXJmYWNlCj4g
PiA+ICsgIFByb3RvY29sIChTUUlQKSBzdGFydGluZyBmcm9tIHRoZSBWZXJzaW9uIDEuIFRoZSBj
b250cm9sIG1ldGhvZCBpcwo+ID4gPiArICBkaWZmZXJlbnQgZnJvbSB0aGUgVmVyc2lvbiAwLCBt
YWtpbmcgdGhlbSBpbmNvbXBhdGlibGUuCj4gPiA+ICsKPiA+ID4gK2FsbE9mOgo+ID4gPiArICAt
ICRyZWY6IHBvd2VyLWRvbWFpbi55YW1sIwo+ID4gPiArCj4gPiA+ICtwcm9wZXJ0aWVzOgo+ID4g
PiArICBjb21wYXRpYmxlOgo+ID4gPiArICAgIG9uZU9mOgo+ID4gPiArICAgICAgLSBpdGVtczoK
PiA+ID4gKyAgICAgICAgICAtIHt9Cj4gPiA+ICsgICAgICAgICAgLSBwYXR0ZXJuOiAiXnNpZml2
ZSxbdHNdbWMwJCIKPiA+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiA+ICsgICAgICAgICAgLSB7fQo+
ID4gPiArICAgICAgICAgIC0gcGF0dGVybjogIl5zaWZpdmUsW3RzXW1jMyQiCj4gPiA+ICsgICAg
ICAgICAgLSBwYXR0ZXJuOiAiXnNpZml2ZSxbdHNdbWMyJCIKPiA+ID4gKyAgICAgICAgICAtIHBh
dHRlcm46ICJec2lmaXZlLFt0c11tYzEkIgo+ID4gPiArICAgICAgLSBpdGVtczoKPiA+ID4gKyAg
ICAgICAgICAtIHt9Cj4gPiA+ICsgICAgICAgICAgLSBwYXR0ZXJuOiAiXnNpZml2ZSxbdHNdbWMy
JCIKPiA+ID4gKyAgICAgICAgICAtIHBhdHRlcm46ICJec2lmaXZlLFt0c11tYzEkIgo+ID4gPiAr
ICAgICAgLSBpdGVtczoKPiA+ID4gKyAgICAgICAgICAtIHt9Cj4gPiA+ICsgICAgICAgICAgLSBw
YXR0ZXJuOiAiXnNpZml2ZSxbdHNdbWMxJCIKPiA+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiA+ICsg
ICAgICAgICAgLSB7fQo+ID4gPiArICAgICAgICAgIC0gY29uc3Q6IHNpZml2ZSxjbWMzCj4gPiA+
ICsgICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNtYzIKPiA+ID4gKyAgICAgIC0gaXRlbXM6Cj4g
PiA+ICsgICAgICAgICAgLSB7fQo+ID4gPiArICAgICAgICAgIC0gY29uc3Q6IHNpZml2ZSxjbWMy
Cj4gPgo+ID4gQWxsIG9mIHRoaXMgaXMganVzdCB1bmV4cGVjdGVkLiBXaHkgYW55IGNvbXBhdGli
bGUgc2hvdWxkIGNvbWUgd2l0aAo+ID4gdGhlc2U/Cj4KPiBJdCdzIGFsc28gbm90IHF1aXRlIGNv
cnJlY3QgZWl0aGVyLCByaWdodD8gT3IgbWF5IG5vdCBiZSBjb3JyZWN0IGF0Cj4gbGVhc3QuIEl0
IHBlcm1pdHMgInh4eCIsICJ0bWMyIiwgInNtYzEiIGFuZCAieHh4IiwgInNtYzIiLCAidG1jMSIK
PiB3aGljaCBtZWFuIHRoYXQgdGhlIHNtYyBhbmQgdG1jIG11c3QgYmUgaWRlbnRpY2FsIGluIHRl
cm1zIG9mCj4gcHJvZ3JhbW1pbmcgbW9kZWwuCj4KWW91IGFyZSByaWdodCwgSSBoYWRuJ3QgY29u
c2lkZXJlZCB0aGF0IGNhc2UuIEknbGwgYWRkcmVzcyBpdCBpbiB0aGUKbmV4dCB2ZXJzaW9uLgoK
PiA+IFlvdSBuZWVkIHRvIHVzZSBTb0Mgc3BlY2lmaWMgY29tcGF0aWJsZXMuCj4KPiBJIHRoaW5r
IHRoZXJlJ3Mgc29tZSBzbGFjayB0byBwcm92aWRlIGhlcmUsIHNpZml2ZSBhcmUgdXBzdHJlYW1p
bmcgaXQgaW4KPiBhZHZhbmNlIG9mIHRoZXJlIGJlaW5nIGN1c3RvbWVycyAob3IgY3VzdG9tZXJz
IHJlYWR5IHRvIHVwc3RyZWFtKSBhbmQgdGhpcwo+IGZvcm1hdCBhbGxvd3MgdXMgdG8gYWNjZXB0
IGJpbmRpbmdzL2RyaXZlcnMgYW5kIHRoZSBjdXN0b21lciB3aWxsIGhhdmUKPiB0byBhZGQgYSBz
b2Mtc3BlY2lmaWMgY29tcGF0aWJsZSBpbiBvcmRlciB0byBhY3R1YWxseSB1c2UgdGhlc2UgaW4g
YQo+IGR0cy4gSSB0aGluayBpdCdzIGJldHRlciB0byBhY2NlcHQgc29tZXRoaW5nIGFsb25nIHRo
ZXNlIGxpbmVzIHRoYW4KPiBzdGFsbCBvdXQgdW50aWwgYSBjdXN0b21lciBkZWNpZGVzIHRvIHVw
c3RyZWFtIHRoZWlyIHVzZXIuIFRoYXQgc2FpZCwgSQo+IHdvdWxkIGV4cGVjdCB0aGlzIHRvIGNv
bWUgKGFzIHlvdSBtZW50aW9uZWQgYWJvdmUpIHdpdGggdGhlIGRyaXZlci4KPgpUaGFua3MgZm9y
IHRoZSB1bmRlcnN0YW5kaW5nID0pCkknbSBob3BpbmcgdGhlIGRyaXZlciBjYW4gYmUgc3VibWl0
dGVkIGF0IGEgbGF0ZXIgc3RhZ2UuClRoZSBkcml2ZXIgdGhhdCBoYW5kbGVzIHRoZSBNTUlPIGlz
IGltcGxlbWVudGVkIGluIE9wZW5TQkkgYW5kIGRlcGVuZHMKb24gc29tZSBwcmVyZXF1aXNpdGUg
cGF0Y2hlcyBbMV0sIHNvIGl0IHdpbGwgZm9sbG93IGFmdGVyd2FyZC4KCkxpbmtzOgotIFsxXSBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuc2JpL0NBS2RkQWtEMDBnTGdwek9DWFk5bVhhZWJy
MnFaY1U5bWtVR09aNDI3OHcwYm1pTHVCUUBtYWlsLmdtYWlsLmNvbS9ULyN0Cgo+ID4gPiArCj4g
PiA+ICsgIHJlZzoKPiA+ID4gKyAgICBtYXhJdGVtczogMQo+ID4gPiArCj4gPiA+ICsgIHNpZml2
ZSxmZWF0dXJlLWxldmVsOgo+ID4gPiArICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiA+ICsgICAgICBT
dXBwb3J0ZWQgcG93ZXIgZmVhdHVyZXMuIFRoaXMgcHJvcGVydHkgaXMgYWJzZW50IGlmIHRoZSBm
dWxsIHNldCBvZiBmZWF0dXJlcwo+ID4gPiArICAgICAgaXMgc3VwcG9ydGVkCj4gPgo+ID4gQ29t
cGF0aWJsZSBkZWZpbmVzIHRoaXMuIERyb3AuCj4gPgo+ID4KPiA+ID4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcKPiA+ID4gKyAgICBlbnVtOiBbIm5v
cGciLCAiY2Vhc2VwZyIsICJydW5vbmx5cGciXQo+ID4gPiArCj4gPiA+ICsgICIjcG93ZXItZG9t
YWluLWNlbGxzIjoKPiA+ID4gKyAgICBjb25zdDogMAo+ID4gPiArCj4gPiA+ICtpZjoKPiA+ID4g
KyAgbm90Ogo+ID4gPiArICAgIHByb3BlcnRpZXM6Cj4gPiA+ICsgICAgICBjb21wYXRpYmxlOgo+
ID4gPiArICAgICAgICBjb250YWluczoKPiA+ID4gKyAgICAgICAgICBwYXR0ZXJuOiAiXnNpZml2
ZSxbdHNjXW1jMyQiCj4gPiA+ICt0aGVuOgo+ID4gPiArICBwcm9wZXJ0aWVzOgo+ID4gPiArICAg
IHNpZml2ZSxmZWF0dXJlLWxldmVsOiBmYWxzZQo+ID4gPiArCj4gPiA+ICtyZXF1aXJlZDoKPiA+
ID4gKyAgLSBjb21wYXRpYmxlCj4gPiA+ICsgIC0gcmVnCj4gPiA+ICsKPiA+ID4gK2FkZGl0aW9u
YWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4KPiA+IE1pc3NpbmcgZXhhbXBsZS4KPgo+IFlvdSBjYW4n
dCBhY3R1YWxseSBtYWtlIGFuIGV4YW1wbGUgdGhhdCBwYXNzZXMgdmFsaWRhdGlvbiB3aGVuIHRo
ZQo+IHNvYy1zcGVjaWZpYyBjb21wYXRpYmxlcyBhcmUgbm90IGFkZGVkLCBzbyB0aGlzIHdvdWxk
IHJlcXVpcmUgYWRkaW5nCj4gc29tZS4KSSBjYW4gYWRkIGEgY29tbWVudCBoZXJlIHRvIG5vdGUg
dGhhdCB0aGUgZXhhbXBsZSBzaG91bGQgYmUgaW5jbHVkZWQKb25jZSBhIFNvQy1zcGVjaWZpYyBj
b21wYXRpYmxlIHN0cmluZyBpcyBhdmFpbGFibGUuCgpCZXN0IFJlZ2FyZHMsCk5pY2sKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
