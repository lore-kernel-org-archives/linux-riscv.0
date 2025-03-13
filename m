Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F410C28B28
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 07:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YzRXXpJsrS4JOymUEsQi+i5EG5McFZ4ebn44gjSVAD4=; b=HZ6wW3TgeJWH5W
	UfHxzfvO4OYZR6n6Rf3y8komG7GPx+M7Yu7owj454l61WihRCHLqQ7Ch4VHImb4+c0/POciulodGx
	1KWviR50PJcIR9cIdfTsH9+tvx3vH74W64+9T1N5Td19TjyDzQD5QhEU0xt0fNvaUUhNF3kQvUCKi
	lkFuNB4Dg7TKpXyV+Xk6Ppi37uSSXLFneEyzUGsvuJHqWw7sBocLZrIuV5+fwIvWHCY6cQRbDmylC
	Ua+GQqShtWJs7Ltvp650wwDbqlaQx76yxhppaLY0jZHTXWHwjZ5o3GISQHB5myqcweGSE5FCbnX0m
	DrnjNuDsLGAj1OGQaCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdSN-0000000ATzU-26WI;
	Thu, 13 Mar 2025 07:58:19 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsdSL-0000000ATz1-1p3p
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 07:58:18 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6ef60e500d7so5674957b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741852696; x=1742457496; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMNUjuT0sEsFCRID3lsOG1TNPZy1x50YvG+37FVE2ig=;
        b=T4rV1FzM7ND8S6KhjRs6Oj81RZ65yzrhvUmrZNGvFAZsEPOTEqJr0kpdR72NOdyVOY
         okM0n6Qay3kONBoB3O6lTgzW5UNVeJm5k0OMGIVqVN9h8uZjGGYvGpwLdQkizk2vQRvd
         gXghJQ3cLxHcKhVVgNlL3Js3Tnwt7tL0ANks9LGCL5uW8gA1+c1BOqOIs9X1/+KGCaWm
         gtfjYTpsMQ0VnqLQwHNwjfz1Z7ASHAG+lphLMm7a19TRf9vdvLQLvNaPeBNfj/J9pfDl
         3+BDqvqdiKKZAbZnzJySHAm7i6M2XuwmnZF5dpGzwZm4vqIqeTcQIAiMitR5cJLXZZT/
         lC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741852696; x=1742457496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMNUjuT0sEsFCRID3lsOG1TNPZy1x50YvG+37FVE2ig=;
        b=lbViPm8tiHn+GyaQRghgJCAhOhQv1qpACWeiCEkRxICJCTvBn4rSrWH+iUrC0C/nlt
         QZ38h/wNezWYEErTT0UZw9bi0/on8tQhX9m5XvgwVjoWB5iKDglH5ZKUd0XN2J0/59kT
         sXVcmTSyTedUC0XcRjELxcsaq7NKKxlNGeQ3GD0/moBo/UVBDGDRaZddjVolinHP/Zb8
         s6dLp7pFw3ukwxxIamnCi7AxRNx2e/M2iUlppSRpn0aUJDIaMGne7iG6k1eACKc9VHXt
         ARM/8hw+LmmMlHwAPCZ7zs6iDpD881EgwwuR3XaJlTT7VmCu8p13CwFeXbJ33xZePw3g
         NmrA==
X-Forwarded-Encrypted: i=1; AJvYcCX3th1Xp0cojzaqemoA2/J/YYPjJCHAgx4IFem2vGHH7V22OHBLUJvFJIvi7tbD6OLJfp3qVvh6LykEXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw61NUQVPFJDsbQN2oPCzmaNV5bw9g3NcT3RElyL9huYxKatqPN
	NCM5ucK5uA+4n7ZknVqmnKFrbz5Zt34/Nz+CTk87eXfj8R9L2AM3j4y2igWRruuGY7dGfcxGkUM
	CaRxl8HWNJO1QljGwvmbqOXw5ue0lGfIZ0ZbeoA==
X-Gm-Gg: ASbGnct4hn7Mw12RUv49EGykQ1v6Iiok/Ya46nh6Psmh4PFpmhqcTvYFjqRJeTT2A9A
	yXqIVClaQ3IP3MBXdIi5LzrYx6uT5Ghmbh1Wp+qsWVcx3ytQUso3eFbA/IIQd6XD0inoCqlBIi1
	IehrKM8lzRrEFK+cwa0XFv54enFoTH
X-Google-Smtp-Source: AGHT+IGp6MvYk8pn8cuSFH/tJh1fjFagxxuHGQs84LN+E9bj1UCyjQ4i+yvES1TFbTwOnp2qVaqV1mIETgiHMesQ98o=
X-Received: by 2002:a05:690c:6412:b0:6fb:9450:b0d1 with SMTP id
 00721157ae682-6ff091ac15amr152290817b3.2.1741852695922; Thu, 13 Mar 2025
 00:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250311051903.3825-1-nick.hu@sifive.com> <20250311195953.GA14239-robh@kernel.org>
 <20250311-erasure-rival-f68525c21742@spud>
In-Reply-To: <20250311-erasure-rival-f68525c21742@spud>
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 13 Mar 2025 15:58:05 +0800
X-Gm-Features: AQ5f1JoArwz67rimlbvntQFgrzGWz_0QdYrn-hsKZwEE72YS-5NkcDfMe2HMQIE
Message-ID: <CAKddAkBwkVQS7UtVvXCdLxEz6bz1=_X1u1CGUPm-OHiyAD4Dsw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: Add SiFive CLINT2
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_005817_495332_CAB3437C 
X-CRM114-Status: GOOD (  23.26  )
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

SGkgUm9iIGFuZCBDb25vcgoKVGhhbmtzIHRvIGFsbCB5b3VyIGZlZWRiYWNrLgoKT24gV2VkLCBN
YXIgMTIsIDIwMjUgYXQgNDo0NuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4KPiBPbiBUdWUsIE1hciAxMSwgMjAyNSBhdCAwMjo1OTo1M1BNIC0wNTAwLCBSb2Ig
SGVycmluZyB3cm90ZToKPiA+IE9uIFR1ZSwgTWFyIDExLCAyMDI1IGF0IDAxOjE5OjAzUE0gKzA4
MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiA+IEFkZCBjb21wYXRpYmxlIHN0cmluZyBhbmQgcHJvcGVy
dHkgZm9yIHRoZSBTaUZpdmUgQ0xJTlQgdjIuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5p
Y2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xs
YW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4gPiAtLS0KPiA+ID4gIC4uLi9iaW5k
aW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbCAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysr
KysrKysKPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4gPiA+Cj4gPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lm
aXZlLGNsaW50LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIv
c2lmaXZlLGNsaW50LnlhbWwKPiA+ID4gaW5kZXggNzZkODNhZWE0ZTJiLi45M2Q3NGM1MDRiNWYg
MTAwNjQ0Cj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy90aW1l
ci9zaWZpdmUsY2xpbnQueWFtbAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwKPiA+ID4gQEAgLTM2LDYgKzM2LDkgQEAg
cHJvcGVydGllczoKPiA+ID4gICAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtY2xpbnQg
ICAjIFN0YXJGaXZlIEpINzExMAo+ID4gPiAgICAgICAgICAgICAgICAtIHN0YXJmaXZlLGpoODEw
MC1jbGludCAgICMgU3RhckZpdmUgSkg4MTAwCj4gPiA+ICAgICAgICAgICAgLSBjb25zdDogc2lm
aXZlLGNsaW50MCAgICAgICAgIyBTaUZpdmUgQ0xJTlQgdjAgSVAgYmxvY2sKPiA+Cj4gPiBOb3Rp
Y2UgdGhhdCB3ZSBkb24ndCBhbGxvdyBjbGludDAgYnkgaXRzZWxmLiBXZSBzaG91bGRuJ3Qgc3Rh
cnQgbm93Lgo+ID4KPiA+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPgo+ID4gSWYgeW91IGRvbid0IGhh
dmUgYSBzcGVjaWZpYyBvbmUgeWV0LCB0aGVuIGFkZCAnLSB7fScgZm9yIHRoZSBmaXJzdAo+ID4g
ZW50cnkuCj4gPgpEbyB5b3Ugc3VnZ2VzdCBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nPwog
ICAgIC0gaXRlbXM6CiAgICAgICAgICAtIHt9CiAgICAgICAgICAtIGNvbnN0OiBzaWZpdmUsY2xp
bnQyICAgICAgICAjIFNpRml2ZSBDTElOVCB2MiBJUCBibG9jawogICAgICAgIGRlc2NyaXB0aW9u
OiBTaUZpdmUgQ0xJTlQgdjIgaXMgdGhlIEhSVCB0aGF0IHN1cHBvcnRzIHRoZSBaaWNudHIKCj4g
PiA+ICsgICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNsaW50MiAgICAgICAgIyBTaUZpdmUgQ0xJ
TlQgdjIgSVAgYmxvY2sKPiA+ID4gKyAgICAgICAgZGVzY3JpcHRpb246IFNpRml2ZSBDTElOVCB2
MiBpcyB0aGUgSFJUIHRoYXQgc3VwcG9ydHMgdGhlIFppY250cgo+ID4gPiAgICAgICAgLSBpdGVt
czoKPiA+ID4gICAgICAgICAgICAtIGVudW06Cj4gPiA+ICAgICAgICAgICAgICAgIC0gYWxsd2lu
bmVyLHN1bjIwaS1kMS1jbGludAo+ID4gPiBAQCAtNjIsNiArNjUsMjIgQEAgcHJvcGVydGllczoK
PiA+ID4gICAgICBtaW5JdGVtczogMQo+ID4gPiAgICAgIG1heEl0ZW1zOiA0MDk1Cj4gPiA+Cj4g
PiA+ICsgIHNpZml2ZSxmaW5lLWN0ci1iaXRzOgo+ID4gPiArICAgIGRlc2NyaXB0aW9uOiBUaGUg
d2lkdGggaW4gYml0cyBvZiB0aGUgZmluZSBjb3VudGVyLgo+ID4KPiA+IG1heGltdW06IDE1Cj4g
Pgo+ID4gVW5sZXNzIHlvdSBrbm93IG9mIGEgZGlmZmVyZW50IG1heGltdW0gaW4gd2hpY2ggY2Fz
ZSB3aHkgYXJlbid0IHlvdQo+ID4gZG9jdW1lbnRpbmcgdGhhdCB0b28/Cj4KWW91IGFyZSByaWdo
dC4gSXQncyBteSBiYWQuIFRoZSBtYXhpbXVtIHdpZHRoIHNob3VsZCBhbHdheXMgYmUgMTUgaW4K
c2lmaXZlLGNsaW50Mi4KSSBzaG91bGQgdXBkYXRlIHRvOgogc2lmaXZlLGZpbmUtY3RyLWJpdHM6
CiAgICBtYXhpbXVtOiAxNQogICAgZGVzY3JpcHRpb246IFRoZSB3aWR0aCBpbiBiaXRzIG9mIHRo
ZSBmaW5lIGNvdW50ZXIuCgppZjoKICBub3Q6CiAgICBwcm9wZXJ0aWVzOgogICAgICBjb21wYXRp
YmxlOgogICAgICAgIGNvbnRhaW5zOgogICAgICAgICAgY29uc3Q6IHNpZml2ZSxjbGludDIKdGhl
bjoKICBwcm9wZXJ0aWVzOgogICAgc2lmaXZlLGZpbmUtY3RyLWJpdHM6IGZhbHNlCgo+IEknbSBj
dXJpb3VzIHdoeSB0aGlzIGlzIG5vdCBzb21ldGhpbmcgdGhhdCBjYW4gYmUgZGlzY2VybmVkIGZy
b20gdGhlCj4gY29tcGF0aWJsZS4gSXQncyBtYXggMTUsIGJ1dCBhcmUgdGhlcmUgYWN0dWFsbHkg
dmVyc2lvbnMgb2YgdGhpcyB3aXRoIGEKPiBsZXNzLXRoYW4tMTUtYml0IHdpZHRoPwo+ClRoZSB3
aWR0aCBtYXkgYmUgdmFyaW91cyBvbiBkaWZmZXJlbnQgcGxhdGZvcm1zIHNvIGl0IGlzIHBvc3Np
YmxlIHRvCmhhdmUgYSBsZXNzLXRoYW4tMTUtYml0IHdpZHRoLgoKPiA+Cj4gPiA+ICsKPiA+ID4g
K2lmOgo+ID4gPiArICBwcm9wZXJ0aWVzOgo+ID4gPiArICAgIGNvbXBhdGlibGU6Cj4gPiA+ICsg
ICAgICBjb250YWluczoKPiA+ID4gKyAgICAgICAgY29uc3Q6IHNpZml2ZSxjbGludDIKPiA+ID4g
K3RoZW46Cj4gPiA+ICsgIHByb3BlcnRpZXM6Cj4gPiA+ICsgICAgc2lmaXZlLGZpbmUtY3RyLWJp
dHM6Cj4gPiA+ICsgICAgICBtYXhpbXVtOiAxNQo+ID4gPiArZWxzZToKPiA+ID4gKyAgcHJvcGVy
dGllczoKPiA+ID4gKyAgICBzaWZpdmUsZmluZS1jdHItYml0czogZmFsc2UKPiA+ID4gKwo+ID4g
PiAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4gPiA+Cj4gPiA+ICByZXF1aXJlZDoKPiA+
ID4gLS0KPiA+ID4gMi4xNy4xCj4gPiA+CgpCZXN0IFJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
