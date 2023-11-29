Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A685C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 17:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i0WWW6HAs7NPEw0/Uyu+OZ068urphSLtoK5rohSZzSk=; b=o26uvRW1ycHeee
	q3FuhzVpmyEKNOqAO+q7MlceQj+IO3Jnj4GQJzx5l+C8h1CZRjIzx8DydZkgK0pfzR5bG6b7oclP9
	xbsul3HuM4LPZaLPv7s3YsQHPmdWaa/8fo8nacNog0X9IEVLEFHApyHSc8l4pZMc7fAkuLAc8c23Y
	+gzJnXUbQBRnibCNMdu/cEDGsC2YN2+1KZoKxL/PZ6iy+Ig9MeHwFrlmvvQll6MmOKm2qzqUo2SQr
	HhLJeXrDxySHu50kjSs8aYokog8PkDkq17lQDeX2up449p7JZeknvbstApFKaDJmhY80yxW0uDxFG
	fD4opdxNOtlJtztwmBrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8OhH-00932m-2G;
	Wed, 29 Nov 2023 17:50:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8OhE-00931k-22;
	Wed, 29 Nov 2023 17:50:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A87061CC7;
	Wed, 29 Nov 2023 17:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75D18C43395;
	Wed, 29 Nov 2023 17:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701280198;
	bh=hOv0atHingnUJuqYGWuaNZX1Z0M6TjcYBZp5aRGip38=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HSZ0Bk+XmVmFmLv332NYdThxfq4coZgxOk/QGCVmtzUcqbP97NlHYXwFbriiyC9FH
	 d7/i+52mNChc0yjo6/jXpoAsN+V5rk2WU0NQRFX8RY+48z8kY4qWBHx2BeG1poDNHK
	 K/xwWP38VggGm4bT8c6GbPVqQEGov8dERZjxti4jevPG5l3dDhxzlO5QuV9tWcKJYo
	 ZC9huQ3TP9gplgB3P0TMLjTogFgeQKOxgo4E/PjbsPtu38ro5u6PfYzJvA7+vXzZ+0
	 xhz1vMusrIAxnD4UEQaLNFGsIVKMi1vSUOYnFXILQicFq7V0ZJnyhiBs1v52yDZt7V
	 mdUXs2OqlgUpQ==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d7eb7ff384so70739a34.0;
        Wed, 29 Nov 2023 09:49:58 -0800 (PST)
X-Gm-Message-State: AOJu0Yy+NwPaiDNzf/jBnjDw9MUE+hj48aBSnAIIPI3uqNI1Xd/pdzDg
	/xk8YTFqwgIgPi2NClcD2wxY0zjV/4JWXv31vYE=
X-Google-Smtp-Source: AGHT+IGPL/pndXjMwP7hy3JldohpjQSp00uVIIbyXY3nxHbNA9I2y0xKAZxcbbFRrog0l235VVgYmZxUmeL8Cb87sfc=
X-Received: by 2002:a05:6870:82a5:b0:1fa:2888:701d with SMTP id
 q37-20020a05687082a500b001fa2888701dmr17426756oae.8.1701280197666; Wed, 29
 Nov 2023 09:49:57 -0800 (PST)
MIME-Version: 1.0
References: <20231122-dtc-warnings-v2-0-bd4087325392@kernel.org>
 <CAK7LNASVMjVg4dr=KdSDHwGww_47H78H7rMXA=wf+ncugesDSA@mail.gmail.com>
 <CAL_Jsq+N0GxwZ2YmspEzfiuGOw7M+DmYkyhLgaYtk+Ov2ycY_A@mail.gmail.com>
 <CAK7LNAT6-pBjUbB+Fcik27QWniK7BizvoUG+EiFvFtJ+MTdmJA@mail.gmail.com> <CAL_JsqJSFnVG6+CfcbgVFGo3EyiSTt-et0NSW2qWjei+zXURcg@mail.gmail.com>
In-Reply-To: <CAL_JsqJSFnVG6+CfcbgVFGo3EyiSTt-et0NSW2qWjei+zXURcg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 30 Nov 2023 02:49:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrRwzrU0m0SVOfnJj87hw4kL2YpDK0xRCwuW6fYT9OGg@mail.gmail.com>
Message-ID: <CAK7LNARrRwzrU0m0SVOfnJj87hw4kL2YpDK0xRCwuW6fYT9OGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] kbuild: Per arch/platform dtc warning levels
To: Rob Herring <robh@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_095000_775355_47D05FF3 
X-CRM114-Status: GOOD (  44.07  )
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

T24gV2VkLCBOb3YgMjksIDIwMjMgYXQgNzoyNeKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBOb3YgMjgsIDIwMjMgYXQgNjowM+KAr0FNIE1hc2Fo
aXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
Tm92IDI3LCAyMDIzIGF0IDExOjAz4oCvUE0gUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDE6MznigK9BTSBNYXNh
aGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+
IE9uIFRodSwgTm92IDIzLCAyMDIzIGF0IDc6MTLigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBv
cnQgdG8gc2V0IHRoZSBkdGMgZXh0cmEgd2FybmluZyBsZXZlbCBvbiBhIHBlcgo+ID4gPiA+ID4g
YXJjaCBvciBwZXIgcGxhdGZvcm0gKGRpcmVjdG9yeSByZWFsbHkpIGJhc2lzLgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRoZSBmaXJzdCB2ZXJzaW9uIG9mIHRoaXMgd2FzIGp1c3QgYSBzaW1wbGUgcGVy
IGRpcmVjdG9yeSBvdmVycmlkZSBmb3IKPiA+ID4gPiA+IFNhbXN1bmcgcGxhdGZvcm1zLCBidXQg
Q29ub3IgYXNrZWQgdG8gYmUgYWJsZSB0byBkbyB0aGlzIGZvciBhbGwgb2YKPiA+ID4gPiA+IHJp
c2N2Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IEZvciBtZXJnaW5nLCBlaXRoZXIgSSBjYW4gdGFrZSB0
aGUgd2hvbGUgdGhpbmcgb3IgdGhlIHJpc2N2IGFuZCBzYW1zdW5nCj4gPiA+ID4gPiBwYXRjaGVz
IGNhbiBnbyB2aWEgdGhlaXIgbm9ybWFsIHRyZWVzLiBUaGUgYWRkZWQgdmFyaWFibGUgd2lsbCBo
YXZlIG5vCj4gPiA+ID4gPiBlZmZlY3QgdW50aWwgbWVyZ2VkIHdpdGggcGF0Y2ggMi4KPiA+ID4g
PiA+Cj4gPiA+ID4gPiB2MToKPiA+ID4gPiA+ICAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC8yMDIzMTExNjIxMTczOS4zMjI4MjM5LTEtcm9iaEBrZXJuZWwub3JnLwo+ID4gPiA+ID4KPiA+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gPiA+
ID4gPiAtLS0KPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gVGhlcmUgd2VyZSBzb21lIGF0dGVtcHRz
IGluIHRoZSBwYXN0IHRvIGVuYWJsZSBXPTEgaW4gcGFydGljdWxhciBzdWJzeXN0ZW1zLAo+ID4g
PiA+IHNvIGhlcmUgaXMgYSBzaW1pbGFyIGNvbW1lbnQuCj4gPiA+ID4KPiA+ID4gPiBBZGRpbmcg
YSBuZXcgd2FybmluZyBmbGFnIHRvIFc9MSBpcyBhbHdheXMgc2FmZSB3aXRob3V0IGRvaW5nIGFu
eSBjb21waWxlIHRlc3QuCj4gPiA+ID4KPiA+ID4gPiBXaXRoIHRoaXMgc2VyaWVzLCBpdCB3b3Vs
ZCBub3QgYmUgdHJ1ZSBhbnkgbW9yZSBiZWNhdXNlIGEgbmV3IHdhcm5pbmcgaW4gVz0xCj4gPiA+
ID4gd291bGQgcG90ZW50aWFsbHkgYnJlYWsgcmlzY3Yvc2Ftc3VuZyBwbGF0Zm9ybXMuCj4gPiA+
Cj4gPiA+IFRoZSBkaWZmZXJlbmNlIGhlcmUgaXMgdGhlIHBlb3BsZSBwb3RlbnRpYWxseSBhZGRp
bmcgd2FybmluZ3MgYXJlIGFsc28KPiA+ID4gdGhlIG9uZXMgZW5zdXJpbmcgbm8gd2FybmluZ3Mu
Cj4gPiA+Cj4gPiA+ID4gTGludXMgcmVxdWlyZXMgYSBjbGVhbiBidWlsZCAoaS5lLiB6ZXJvIHdh
cm5pbmcpIHdoZW4gVz0gb3B0aW9uIGlzIG5vdCBnaXZlbi4KPiA+ID4KPiA+ID4gTGludXMgZG9l
c24ndCBidWlsZCBhbnkgb2YgdGhpcyBBRkFJQ1QuIFdlIGFyZSBub3QgYWx3YXlzIHdhcm5pbmcg
ZnJlZQo+ID4gPiBmb3IgVz0wIHdpdGggZHRicy4KPiA+Cj4gPgo+ID4KPiA+IERvZXMgaXQgbWVh
biwgeW91IGNhbiBlbmFibGUgYWxsIHdhcm5pbmdzIGJ5IGRlZmF1bHQ/Cj4KPiBObywgTGludXMg
bWlnaHQgbm90IGNhcmUsIGJ1dCBvdGhlcnMgKG1lKSBkby4gVGhlIHdob2xlIHBvaW50IG9mIG5v
dAo+IGFsbG93aW5nIHdhcm5pbmdzIGlzIHRoZSBzYW1lLiBHZXQgdG8gemVybyB3YXJuaW5ncyBz
byBhbnkgbmV3Cj4gd2FybmluZ3Mgc3RhbmQgb3V0LiBXZSBub3cgaGF2ZSBzb21lIHN1YnNldCBv
ZiBwbGF0Zm9ybXMgd2hpY2ggYXJlCj4gd2FybmluZyBmcmVlIGFuZCB3YW50IHdhcm5pbmdzIGVu
YWJsZWQgYnkgZGVmYXVsdCB0byBrZWVwIHRoZW0gdGhhdAo+IHdheS4gSG93IGRvIHlvdSBzdWdn
ZXN0IHdlIGRvIHRoYXQ/CgoKCgoKWW91IG1heSBub3QgbGlrZSBpdCwgYnV0IGFuIGFsdGVybmF0
aXZlIHNvbHV0aW9uIGNvdWxkIGJlLApoYXJkLWNvZGUgZXh0cmEgd2FybmluZyBmbGFncy4KCgpJ
biBteSBjb21waWxlLXRlc3RzLCBTYW1zdW5nIHBsYXRmb3JtIGlzIG5vdCBXPTEgY2xlYW4geWV0
LgpJIHNlZSAtV3VuaXRfYWRkcmVzc192c19yZWcsIC1Xc2ltcGxlX2J1c19yZWcsCi1XdW5pcXVl
X3VuaXRfYWRkcmVzc19pZl9lbmFibGVkIHdhcm5pbmdzLgoKSSBkbyBub3Qgc2VlIGFueXRoaW5n
IGVsc2UsIHNvIHlvdSBjYW4gYWRkIHRoZSBmb2xsb3dpbmcgdGhyZWUKZmxhZ3MgdG8ga2VlcCBp
dCB3YXJuaW5nLWZyZWUuCgoKCgoKCmRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zYW1z
dW5nL01ha2VmaWxlCmIvYXJjaC9hcm0vYm9vdC9kdHMvc2Ftc3VuZy9NYWtlZmlsZQppbmRleCA3
YmVjZjM2NjU2YjEuLjFlMTU3ODRlYzUxZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMv
c2Ftc3VuZy9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9ib290L2R0cy9zYW1zdW5nL01ha2VmaWxl
CkBAIC0xLDQgKzEsMTAgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKKwor
ZHRjZmxhZ3MgOj0gXAorICAgICAgIC1XYXZvaWRfdW5uZWNlc3NhcnlfYWRkcl9zaXplIFwKKyAg
ICAgICAtV2FsaWFzX3BhdGhzIFwKKyAgICAgICAtV2dyYXBoX2NoaWxkX2FkZHJlc3MKKwogZHRi
LSQoQ09ORklHX0FSQ0hfRVhZTk9TMykgKz0gXAogICAgICAgIGV4eW5vczMyNTAtYXJ0aWs1LWV2
YWwuZHRiIFwKICAgICAgICBleHlub3MzMjUwLW1vbmsuZHRiIFwKZGlmZiAtLWdpdCBhL3Njcmlw
dHMvTWFrZWZpbGUubGliIGIvc2NyaXB0cy9NYWtlZmlsZS5saWIKaW5kZXggMWE5NjVmZTY4ZTAx
Li5hYTVhNWZjMzljZWMgMTAwNjQ0Ci0tLSBhL3NjcmlwdHMvTWFrZWZpbGUubGliCisrKyBiL3Nj
cmlwdHMvTWFrZWZpbGUubGliCkBAIC0zNjIsNiArMzYyLDkgQEAgRFRDX0ZMQUdTICs9IC1Xbm9k
ZV9uYW1lX2NoYXJzX3N0cmljdCBcCiAgICAgICAgLVd1bmlxdWVfdW5pdF9hZGRyZXNzCiBlbmRp
ZgoKKyMgcGVyLWRpcmVjdG9yeSBmbGFncworRFRDX0ZMQUdTICs9ICQoZHRjZmxhZ3MpCisjIHBl
ci1maWxlIGZsYWdzCiBEVENfRkxBR1MgKz0gJChEVENfRkxBR1NfJChiYXNldGFyZ2V0KSkKCiAj
IFNldCAtQCBpZiB0aGUgdGFyZ2V0IGlzIGEgYmFzZSBEVEIgdGhhdCBvdmVybGF5IGlzIGFwcGxp
ZWQgb250bwoKCgoKCgoKPgo+IEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50IG9uIFc9MSBpbiBnZW5l
cmFsLCBidXQgSSB0aGluayBpdCBqdXN0IGRvZXNuJ3QKPiBhcHBseSBpbiB0aGlzIGNhc2UuIElu
IGdlbmVyYWwsCj4gc29tZW9uZSBtYXkgYmUgdGVzdGluZyBhIG5ldyBjb21waWxlciBhbmQgdGhl
cmUncyBzb21lIG5ldyB3YXJuaW5nIHRvCj4gZW5hYmxlLCBzbyB0aGV5IGFkZCBpdCB0byBXPTEu
IFRoZXkgYXJlIHdvcmtpbmcgaW5kZXBlbmRlbnRseSBvZiBhbnkKPiBzdWJzeXN0ZW0gKGFuZCBM
aW51cykgYW5kIGludHJvZHVjaW5nIG5ldyB3YXJuaW5ncyB3b3VsZCBiZSBhIGJ1cmRlbgo+IHRv
IGZpeCBhbmQgYSBwcm9ibGVtIHRvIGxlYXZlLiBGb3IgRFQsIGl0IGlzIGEgYml0IGRpZmZlcmVu
dCBhcyBhZGRpbmcKPiBuZXcgd2FybmluZ3MsIHVwZGF0aW5nIGR0YyB2ZXJzaW9uLCBhbmQgc2Vs
ZWN0aW5nIHdhcm5pbmdzIHRvIGVuYWJsZQo+IGFyZSBwcmV0dHkgbXVjaCBhbGwgZG9uZSB0b2dl
dGhlci4KPiBQbHVzLCBzY2hlbWEgd2FybmluZ3MgaGF2ZSBwcmV0dHkKPiBtdWNoIHN1cGVyc2Vk
ZWQgZHRjIHdhcm5pbmdzLiBJZiB3ZSBkbyBhZGQgbmV3IHdhcm5pbmdzIHdoaWNoIGNhbid0IGJl
Cj4gZml4ZWQgdXAgZnJvbnQsIHRoZW4gd2UgY291bGQgc3RpbGwgb25seSBlbmFibGUgdGhlIHdh
cm5pbmcgZm9yIFc9MQo+IGZyb20gdGhlIGNvbW1hbmQgbGluZS4gU29tZXRoaW5nIGxpa2UgdGhp
cyBvbiB0b3Agb2YgdGhpcyBzZXJpZXM6Cj4KPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9NYWtlZmls
ZS5saWIgYi9zY3JpcHRzL01ha2VmaWxlLmxpYgo+IGluZGV4IDUzYTc0ZTUzZTBjYS4uNDEzMDdj
NmUxZmVlIDEwMDY0NAo+IC0tLSBhL3NjcmlwdHMvTWFrZWZpbGUubGliCj4gKysrIGIvc2NyaXB0
cy9NYWtlZmlsZS5saWIKPiBAQCAtMzQxLDYgKzM0MSwxMCBAQCBxdWlldF9jbWRfZ3ppcCA9IEda
SVAgICAgJEAKPiAgIyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgRFRDID89ICQob2JqdHJlZSkvc2Ny
aXB0cy9kdGMvZHRjCj4KPiAraWZlcSAoJChmaW5kc3RyaW5nIDEsJChLQlVJTERfRVhUUkFfV0FS
TikpLCkKPiArRFRDX0ZMQUdTICs9IC1Xbm8tc29tZV9uZXdfd2FybmluZ193ZV9uZWVkX29mZl9n
bG9iYWxseQo+ICtlbmRpZgo+ICsKCkhtbS4gVHJpY2t5LCBidXQgd29ya3MuCgpLQlVJTERfRVhU
UkFfV0FSTl9EVEM9MSBpcyB3ZWFrZXIgdGhhbiBLQlVJTERfRVhUUkFfV0FSTj0xCgoKCgo+ICBL
QlVJTERfRVhUUkFfV0FSTl9EVEMgKz0gJChLQlVJTERfRVhUUkFfV0FSTikKPgo+ICAjIERpc2Fi
bGUgbm9pc3kgY2hlY2tzIGJ5IGRlZmF1bHQKPgotLQpCZXN0IFJlZ2FyZHMKTWFzYWhpcm8gWWFt
YWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
