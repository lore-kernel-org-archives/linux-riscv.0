Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA20C77B78
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y2+Ac0svDL3aYJDL7zZ532J3912qOGynwJ0Zpj/CmxI=; b=Hgp+YwmfViFIQZ
	uClIsP3+7iLC0pFEmCPZRzl6zXxU4ZCnmhcZgxcG5Ht6eVLkOfOjiagHqCm9RaLcVY4Xw0r7i3G+S
	cJVeVmCChLtxwenus+sZpIx0E3qDwbpPs1wrVCajg0z3cdYId5IeIyviCG/t5AL2o4Op2cYWqW9C8
	NDc2Odp6bYu5Kjvo+c1dVsxs88+3mNz8qJjU/tuJ2vZSp+l/mKaVaoO0vsuIZJx2Cvs6bF8qWOwoB
	1oKrzORVDfXL7RMt+1m/a0Kcm5pu2XuQQSXoOWeoXGxcyIbEYHDf8WXXydFa7iaa/o8kWL977EIif
	zgxcN8hpwNIH84DEXNsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puV1o-007E1m-3B;
	Thu, 04 May 2023 09:13:32 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puV1m-007Duj-0H
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 09:13:31 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-44fdac26696so77722e0c.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 May 2023 02:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683191605; x=1685783605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjKxbZLYNpVq4nFkaIiEV7KqZSZzrRYr6oKFq9kQ4+s=;
        b=cbvuyeLcoOhTa3i6uI0AYTQolR7KjvGqiGBVVkZL03ya7GBGjKlvN1oi5jcYBo2I7f
         /6c3SXynsTLXKCKKb7pnkcOi0u6yZM38k6ByRV6NnghtdzfliBslOfqkeRoFmcgVVz+G
         9gLVQ1sgjtN0K0G2E6TXzwISP2uzaY91VbxQEslievbgVHWZavkpzY7x2FYPc6cwm75I
         7pKdsM1I/DPjCFLHu1zFMbszih0IT2/xHeJcfwIQ8icddx85dFsA3OcGihS8pbZDDRqz
         NQb5bXDZ3KfQQNtA3HOXM5ixjt3uCJEM30k9Mk5ObeXvzareqmaxkYDsxrcCyngbk8Iu
         3fUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683191605; x=1685783605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jjKxbZLYNpVq4nFkaIiEV7KqZSZzrRYr6oKFq9kQ4+s=;
        b=Yb+a1qRWbee2W835iy1lbncT2qwdr+K7VKsaAgAzVgxzUjvX8DFyBdF9HSu1aUqcD3
         EdCudEh3IIc+8Df0EOxDaENSb0QHmgBJ+NV7P/HR/k9de1S1yByd7g2KEbOtJjizENEb
         Cu5IQj7SubF4ayCBk1r7QC4SyB38DO26UAL+UNF4x3FJdDgVZwawtgpZbtt4/G4HLu15
         8wHNBhWihTNy7xt9425MyjzxRQqxN3+8YNHYjlhBwAwKaFjMD1YhAP2ACQTPQrsZG4w7
         NM6LvbiQDpw8OFjQmL6aj9c2p7VcpR5LCZYuO137tSw6jlzdZpfVEvAMZ/F1FdU3b8IP
         y+oA==
X-Gm-Message-State: AC+VfDwnUSNeH/rS8RD+KRMuIi3a0cO/CJoM8Zpc34Yzf5ndBgDiWue0
	eUu3EvJPkNuPNm1O795g9lXPub6BeUm1tNvpaWw+kw==
X-Google-Smtp-Source: ACHHUZ5cIAcaI7ROK8c8MEEIvtJgRjFRMYvdqALsOFkZMYEByuAvD+ElGM62un54/1M76m9sidrcq1IgdbOGrS8V0P0=
X-Received: by 2002:a1f:c1d3:0:b0:44f:aa56:e6eb with SMTP id
 r202-20020a1fc1d3000000b0044faa56e6ebmr1472705vkf.9.1683191604766; Thu, 04
 May 2023 02:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230417060618.639395-1-vincent.chen@sifive.com>
 <mhng-8488a1b0-fc27-4a74-b1d6-3b9975f8795f@palmer-ri-x1c9a> <CAHVXubgNYEtTcjzdXaA2UhH3N7VfqyGWSRtoBfm1jJXK8vPk+Q@mail.gmail.com>
In-Reply-To: <CAHVXubgNYEtTcjzdXaA2UhH3N7VfqyGWSRtoBfm1jJXK8vPk+Q@mail.gmail.com>
From: Vincent Chen <vincent.chen@sifive.com>
Date: Thu, 4 May 2023 17:13:13 +0800
Message-ID: <CABvJ_xiZ1tjfv9wtN83B9Pdh87YarMP-gCOg=z418zztrzZ24Q@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: mm: execute local TLB flush after populating vmemmap
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_021330_124772_D9AD26BA 
X-CRM114-Status: GOOD (  29.92  )
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

T24gVHVlLCBNYXkgMiwgMjAyMyBhdCA4OjE24oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDIsIDIwMjMgYXQgMjoxOOKA
r0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+IHdyb3RlOgo+ID4KPiA+IE9u
IFN1biwgMTYgQXByIDIwMjMgMjM6MDY6MTggUERUICgtMDcwMCksIHZpbmNlbnQuY2hlbkBzaWZp
dmUuY29tIHdyb3RlOgo+ID4gPiBUaGUgc3BhcmVfaW5pdCgpIGNhbGxzIG1lbW1hcF9wb3B1bGF0
ZSgpIG1hbnkgdGltZXMgdG8gY3JlYXRlIFZBIHRvIFBBCj4gPiA+IG1hcHBpbmcgZm9yIHRoZSBW
TUVNTUFQIGFyZWEsIHdoZXJlIGFsbCAic3RydWN0IHBhZ2UiIGFyZSBsb2NhdGVkIG9uY2UKPiA+
ID4gQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIGlzIGRlZmluZWQuIFRoZXNlICJzdHJ1Y3QgcGFn
ZSIgYXJlIGxhdGVyCj4gPiA+IGluaXRpYWxpemVkIGluIHRoZSB6b25lX3NpemVzX2luaXQoKSBm
dW5jdGlvbi4gSG93ZXZlciwgZHVyaW5nIHRoaXMKPiA+ID4gcHJvY2Vzcywgbm8gc2ZlbmNlLnZt
YSBpbnN0cnVjdGlvbiBpcyBleGVjdXRlZCBmb3IgdGhpcyBWTUVNTUFQIGFyZWEuCj4gPiA+IFRo
aXMgb21pc3Npb24gbWF5IGNhdXNlIHRoZSBoYXJ0IHRvIGZhaWwgdG8gcGVyZm9ybSBwYWdlIHRh
YmxlIHdhbGsKPiA+ID4gYmVjYXVzZSBzb21lIGRhdGEgcmVsYXRlZCB0byB0aGUgYWRkcmVzcyB0
cmFuc2xhdGlvbiBpcyBpbnZpc2libGUgdG8gdGhlCj4gPiA+IGhhcnQuIFRvIHNvbHZlIHRoaXMg
aXNzdWUsIHRoZSBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgaXMgY2FsbGVkCj4gPiA+
IHJpZ2h0IGFmdGVyIHRoZSBzcGFyZV9pbml0KCkgdG8gZXhlY3V0ZSBhIHNmZW5jZS52bWEgaW5z
dHJ1Y3Rpb24gZm9yIHRoZQo+ID4gPiBWTUVNTUFQIGFyZWEsIGVuc3VyaW5nIHRoYXQgYWxsIGRh
dGEgcmVsYXRlZCB0byB0aGUgYWRkcmVzcyB0cmFuc2xhdGlvbgo+ID4gPiBpcyB2aXNpYmxlIHRv
IHRoZSBoYXJ0Lgo+ID4gPgo+ID4gPiBGaXhlczogZDk1ZjFhNTQyYzNkICgiUklTQy1WOiBJbXBs
ZW1lbnQgc3BhcnNlbWVtIikKPiA+ID4gU2lnbmVkLW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5j
ZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8
YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS90bGJmbHVzaC5oIHwgNyArKysrKysrCj4gPiA+ICBhcmNoL3Jpc2N2L21tL2luaXQu
YyAgICAgICAgICAgICAgfCA1ICsrKysrCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2Vy
dGlvbnMoKykKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dGxiZmx1c2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdGxiZmx1c2guaAo+ID4gPiBpbmRl
eCBhMDkxOTZmOGRlNjguLmY5ZDM3MTJiZDkzYiAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS90bGJmbHVzaC5oCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vdGxiZmx1c2guaAo+ID4gPiBAQCAtNjEsNCArNjEsMTEgQEAgc3RhdGljIGlubGluZSB2b2lk
IGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2UodW5zaWduZWQgbG9uZyBzdGFydCwKPiA+ID4gICAgICAg
Zmx1c2hfdGxiX2FsbCgpOwo+ID4gPiAgfQo+ID4gPgo+ID4gPiArLyogRmx1c2ggYSByYW5nZSBv
ZiBrZXJuZWwgcGFnZXMgd2l0aG91dCBicm9hZGNhc3RpbmcgKi8KPiA+ID4gK3N0YXRpYyBpbmxp
bmUgdm9pZCBsb2NhbF9mbHVzaF90bGJfa2VybmVsX3JhbmdlKHVuc2lnbmVkIGxvbmcgc3RhcnQs
Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGVuZCkKPiA+ID4gK3sKPiA+ID4gKyAgICAgbG9jYWxfZmx1c2hfdGxiX2FsbCgp
Owo+ID4KPiA+IFdoeSBpcyB0aGlzIGEgZ2xvYmFsIGZsdXNoLCBpc3RlYWQgb2YgYSByYW5nZS1i
YXNlZCBvbmU/ICBXZSBzaG91bGQKPiA+IHByb2JhYmx5IG1ha2UgdGhlIHNhbWUgY2hhbmdlIGZv
ciBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCksIHRob3VnaAo+ID4gdGhhdCdzIG5vdCBhIGZpeC4K
Pgo+IFlvdSdyZSByaWdodCwgYnV0IHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIGZsdXNo
X3RsYl9yYW5nZSB3aWxsCj4gdWx0aW1hdGVseSBjYWxsIGZsdXNoX3RsYl9hbGwgaWYgdGhlIHNp
emUgPiBQQUdFX1NJWkUsIHdoaWNoIGlzIHZlcnkKPiBsaWtlbHkgaW4gdGhpcyBjYXNlLiBBbnl3
YXksIEkgaGF2ZSBhIHBhdGNoc2V0IGFsbW9zdCByZWFkeSB0aGF0Cj4gaW1wcm92ZXMgdGhlIHRs
YiBmbHVzaCByb3V0aW5lcywgYW5kIEkgbm90ZWQgdGhhdCBJIGhhZCB0byBmaXggdGhpcwo+IGZ1
bmN0aW9uIG9uY2UgbWVyZ2VkLgo+CgpJIGFncmVlIHdpdGggQWxleGFuZHJlIHRoYXQgaXQncyBo
aWdobHkgcHJvYmFibGUgdGhhdCB0aGUgc2l6ZSB3aWxsIGJlCmdyZWF0ZXIgdGhhbiBQQUdFX1NJ
WkUgaW4gdGhpcyBjYXNlLiBIb3dldmVyLCBJIG11c3QgYWRtaXQgdGhhdCB0aGlzCmltcGxlbWVu
dGF0aW9uIGlzIG5vdCBzdWl0YWJsZSBmb3IgdGhlIGNhc2Ugd2hlcmUgdGhlIHNpemUgaXMgbGVz
cwp0aGFuIG9yIGVxdWFsIHRvIFBBR0VfU0laRS4gSSBhbSB3aWxsaW5nIHRvIHdhaXQgZm9yIEFs
ZXhhbmRyZSdzIHBhdGNoCmFuZCByZWJhc2UgbXkgcGF0Y2ggb24gdG9wIG9mIGhpcyBJZiB5b3Ug
YmVsaWV2ZSBpdCBpcyBhIGJldHRlcgphcHByb2FjaC4KCj4gPgo+ID4gPiArfQo+ID4gPiArCj4g
PiA+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9UTEJGTFVTSF9IICovCj4gPiA+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiA+IGluZGV4
IDBmMTRmNGE4ZDE3OS4uYmNmMzY1Y2JiY2MxIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2
L21tL2luaXQuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gPiBAQCAtMTIy
MSw2ICsxMjIxLDEwIEBAIHZvaWQgX19pbml0IG1pc2NfbWVtX2luaXQodm9pZCkKPiA+ID4gICAg
ICAgZWFybHlfbWVtdGVzdChtaW5fbG93X3BmbiA8PCBQQUdFX1NISUZULCBtYXhfbG93X3BmbiA8
PCBQQUdFX1NISUZUKTsKPiA+ID4gICAgICAgYXJjaF9udW1hX2luaXQoKTsKPiA+ID4gICAgICAg
c3BhcnNlX2luaXQoKTsKPiA+ID4gKyNpZmRlZiBDT05GSUdfU1BBUlNFTUVNX1ZNRU1NQVAKPiA+
ID4gKyAgICAgLyogVGhlIGVudGlyZSBWTUVNTUFQIHJlZ2lvbiBoYXMgYmVlbiBwb3B1bGF0ZWQu
IEZsdXNoIFRMQiBmb3IgdGhpcyByZWdpb24gKi8KPiA+ID4gKyAgICAgbG9jYWxfZmx1c2hfdGxi
X2tlcm5lbF9yYW5nZShWTUVNTUFQX1NUQVJULCBWTUVNTUFQX0VORCk7Cj4gPiA+ICsjZW5kaWYK
PiA+ID4gICAgICAgem9uZV9zaXplc19pbml0KCk7Cj4gPiA+ICAgICAgIHJlc2VydmVfY3Jhc2hr
ZXJuZWwoKTsKPiA+ID4gICAgICAgbWVtYmxvY2tfZHVtcF9hbGwoKTsKPiA+ID4gQEAgLTEyMzAs
NiArMTIzNCw3IEBAIHZvaWQgX19pbml0IG1pc2NfbWVtX2luaXQodm9pZCkKPiA+ID4gIGludCBf
X21lbWluaXQgdm1lbW1hcF9wb3B1bGF0ZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBs
b25nIGVuZCwgaW50IG5vZGUsCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHZtZW1fYWx0bWFwICphbHRtYXApCj4gPiA+ICB7Cj4gPiA+ICsgICAgIC8qIERlZmVyIHRo
ZSByZXF1aXJlZCBUTEIgZmx1c2ggdW50aWwgdGhlIGVudGlyZSBWTUVNTUFQIHJlZ2lvbiBoYXMg
YmVlbiBwb3B1bGF0ZWQgKi8KPiA+ID4gICAgICAgcmV0dXJuIHZtZW1tYXBfcG9wdWxhdGVfYmFz
ZXBhZ2VzKHN0YXJ0LCBlbmQsIG5vZGUsIE5VTEwpOwo+ID4gPiAgfQo+ID4gPiAgI2VuZGlmCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
