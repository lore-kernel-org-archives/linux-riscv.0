Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDDFC7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O4aOwrz8xlbT60pX1jT9qzGL1Iii6X+mIem/vpT7z+4=; b=zncSEQvF2RLk34
	COUWJQLgk07X1zAVw01LZdAdk5plscnt3TyF6xc6DzCH31ewSDllM1Eo/DBMHDicLuUJG9ImrinvJ
	D3AvIjmS0M4/KViOt1U+q3l7QRc537ySNogguSOX+dPXvvU1Bmhq6GyZ0oWHl3WO3tB6WJavZVAid
	kHIeuZG4XZvDurZQPMVnxFCJreTXPbHmQmnh13PPkgKV34pf0lpIFbFNF/Mwi7gvwZkBoCwz9KWuN
	HSWV7D4KbuSuFt4ttOEXkt+Sy10QsGawzU/lv3PR+YVzpQeAfMCKc9534edonPj+4YIEHfi//8ByB
	BmJTXmfuMDUzbx3sH8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk134-004D6B-2b;
	Wed, 05 Apr 2023 11:11:30 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk132-004D4j-0W
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 11:11:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id u10so34069762plz.7
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 04:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680693085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5pxL1NLKIe4ynxwYg+dKy42GRofGXnJPceoZyaJlGsY=;
        b=nvs4osDtFN/XDWVyPnDEUElo8Qbrje5CpeBg/PRBc/WdVbgB9ZU0SrUP1hJq2ju3DS
         z9NmJtkGv0DmufyQvLSFnMKjudXf7+3pdmCuK3uwUnVW7GXp/xRnHkpSKUXlNdTWmB5V
         DbyxwDh01RVrM8HzDoq6knV0uPtMzz7vvOk2W//B8ywv/geATFJI8BNsXBlXzKRVMhs7
         VBRFzcpf5O9Tok5o0AYAwQVtUKRyzD5YIjNP/3kZCxSTycUIXisvyUc5EceMPZM8cuwe
         Meuv2kYW8x+xr8lpCGba+wjBDn/5Q9hhsYYVTFEA4wW4bkE0HV6kcujI83/l7uALfWQI
         W7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680693085;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pxL1NLKIe4ynxwYg+dKy42GRofGXnJPceoZyaJlGsY=;
        b=5L32e7p9Dw6YmcLZqCjqIlsT9SNUdmhpB0E+uILNQLmQD3GHuy/TJQ4GUf6TfxcPJR
         xDsUHibQV56SW0yXeGyJSJWRDORtSCivq88RnxYlJSZXqV5sEtrFKbnvxxroczUxqTZa
         oUyMjVp/SVPO574QitSOTm6/g5IesraUHymwrUO/fItji6uKqrbz1WkzywHQIO7bDG56
         iDkOolKLnor4zwONuuPBL8o2kHJpFkxrUY4DUVMrk0WOffjORWqRc3Arp5V515fCWUQw
         UVhYzHuIK1GolWreSg5JT5RPvgLjgzoMduM0Ngag6TslaASdKH7E17r66vLfAFR08jtX
         Vgeg==
X-Gm-Message-State: AAQBX9f/6eQn71lQwsGgUwbiQNtRZIjL3jMJ63kds2/nJaMFJ5SuPn1N
	S/EktjZFgmBSdooE0wU75BUnEQ==
X-Google-Smtp-Source: AKy350YYKcA8GasuUJIRqwG4r5R+Rypm/Vk1KsMv+WRX/0RgSaLSzcfBQVqYKrxKXrfWFx4e0DEqbw==
X-Received: by 2002:a05:6a20:8347:b0:cd:1709:8d57 with SMTP id z7-20020a056a20834700b000cd17098d57mr4852595pzc.1.1680693085020;
        Wed, 05 Apr 2023 04:11:25 -0700 (PDT)
Received: from sunil-laptop ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id h18-20020a635752000000b0050301745a5dsm8963209pgm.50.2023.04.05.04.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:11:24 -0700 (PDT)
Date: Wed, 5 Apr 2023 16:41:13 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH V4 22/23] platform/surface: Disable for RISC-V
Message-ID: <ZC1XUdD3DFnNauQ2@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-23-sunilvl@ventanamicro.com>
 <0c433e15-640e-280f-fcb0-a8fe081d1bcc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0c433e15-640e-280f-fcb0-a8fe081d1bcc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_041128_201545_A5250DD7 
X-CRM114-Status: GOOD (  19.98  )
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

T24gV2VkLCBBcHIgMDUsIDIwMjMgYXQgMTE6MzM6MDBBTSArMDIwMCwgTWF4aW1pbGlhbiBMdXog
d3JvdGU6Cj4gT24gNC80LzIzIDIwOjIwLCBTdW5pbCBWIEwgd3JvdGU6Cj4gPiBXaXRoIENPTkZJ
R19BQ1BJIGVuYWJsZWQgZm9yIFJJU0MtViwgdGhpcyBkcml2ZXIgZ2V0cyBlbmFibGVkCj4gPiBp
biBhbGxtb2Rjb25maWcgYnVpbGQuIEhvd2V2ZXIsIFJJU0MtViBkb2Vzbid0IHN1cHBvcnQgc3Vi
LXdvcmQKPiA+IGF0b21pY3Mgd2hpY2ggaXMgdXNlZCBieSB0aGlzIGRyaXZlci4gRHVlIHRvIHRo
aXMsIHRoZSBidWlsZCBmYWlscwo+ID4gd2l0aCBiZWxvdyBlcnJvci4KPiA+IAo+ID4gSW4gZnVu
Y3Rpb24gw6LigqzLnHNzaF9zZXFfbmV4dMOi4oKs4oSiLAo+ID4gICAgICBpbmxpbmVkIGZyb20g
w6LigqzLnHNzYW1fcmVxdWVzdF93cml0ZV9kYXRhw6LigqzihKIgYXQgZHJpdmVycy9wbGF0Zm9y
bS9zdXJmYWNlL2FnZ3JlZ2F0b3IvY29udHJvbGxlci5jOjE0ODM6ODoKPiA+IC4vLi9pbmNsdWRl
L2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6Mzk5OjQ1OiBlcnJvcjogY2FsbCB0byDDouKCrMucX19j
b21waWxldGltZV9hc3NlcnRfMzM1w6LigqzihKIgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJy
b3I6IEJVSUxEX0JVRyBmYWlsZWQKPiA+ICAgIDM5OSB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fz
c2VydChjb25kaXRpb24sIG1zZywgX19jb21waWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykK
PiA+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xgo+ID4gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6Nzg6NDU6IG5vdGU6IGluIGRlZmluaXRp
b24gb2YgbWFjcm8gw6LigqzLnHVubGlrZWx5w6LigqzihKIKPiA+ICAgICA3OCB8ICMgZGVmaW5l
IHVubGlrZWx5KHgpICAgIF9fYnVpbHRpbl9leHBlY3QoISEoeCksIDApCj4gPiAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiA+IC4vLi9pbmNs
dWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6Mzg3Ojk6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDDouKCrMucX19jb21waWxldGltZV9hc3NlcnTDouKCrOKEogo+ID4gICAgMzg3IHwgICAg
ICAgICBfX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgcHJlZml4LCBzdWZmaXgp
Cj4gPiAgICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gPiAuLy4vaW5jbHVk
ZS9saW51eC9jb21waWxlcl90eXBlcy5oOjM5OTo5OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFj
cm8gw6LigqzLnF9jb21waWxldGltZV9hc3NlcnTDouKCrOKEogo+ID4gICAgMzk5IHwgICAgICAg
ICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2Vy
dF8sIF9fQ09VTlRFUl9fKQo+ID4gICAgICAgIHwgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+
Cj4gPiAuL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lv
biBvZiBtYWNybyDDouKCrMucY29tcGlsZXRpbWVfYXNzZXJ0w6LigqzihKIKPiA+ICAgICAzOSB8
ICNkZWZpbmUgQlVJTERfQlVHX09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCgh
KGNvbmQpLCBtc2cpCj4gPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBefn5+fn5+fn5+fn5+fn5+fn4KPiA+IC4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDo1
OToyMTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xCVUlMRF9CVUdfT05fTVNH
w6LigqzihKIKPiA+ICAgICA1OSB8ICNkZWZpbmUgQlVJTERfQlVHKCkgQlVJTERfQlVHX09OX01T
RygxLCAiQlVJTERfQlVHIGZhaWxlZCIpCj4gPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn4KPiA+IC4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmg6
MzM1OjE3OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnEJVSUxEX0JVR8Oi4oKs
4oSiCj4gPiAgICAzMzUgfCAgICAgICAgICAgICAgICAgQlVJTERfQlVHKCk7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiAgICAgICAgfCAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+Cj4gPiAuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oOjM0
NDozMDogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xfX2NtcHhjaGfDouKCrOKE
ogo+ID4gICAgMzQ0IHwgICAgICAgICAoX190eXBlb2ZfXygqKHB0cikpKSBfX2NtcHhjaGcoKHB0
ciksICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiA+IC4vaW5jbHVkZS9saW51eC9hdG9taWMvYXRv
bWljLWluc3RydW1lbnRlZC5oOjE5MTY6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi
4oKsy5xhcmNoX2NtcHhjaGfDouKCrOKEogo+ID4gICAxOTE2IHwgICAgICAgICBhcmNoX2NtcHhj
aGcoX19haV9wdHIsIF9fVkFfQVJHU19fKTsgXAo+ID4gICAgICAgIHwgICAgICAgICBefn5+fn5+
fn5+fn4KPiA+IGRyaXZlcnMvcGxhdGZvcm0vc3VyZmFjZS9hZ2dyZWdhdG9yL2NvbnRyb2xsZXIu
Yzo2MTozMjogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xjbXB4Y2hnw6Ligqzi
hKIKPiA+ICAgICA2MSB8ICAgICAgICAgd2hpbGUgKHVubGlrZWx5KChyZXQgPSBjbXB4Y2hnKCZj
LT52YWx1ZSwgb2xkLCBuZXcpKSAhPSBvbGQpKSB7Cj4gPiAgICAgICAgfCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXn5+fn5+fgo+ID4gCj4gPiBTbywgZGlzYWJsZSB0aGlzIGRyaXZl
ciBmb3IgUklTQy1WIGV2ZW4gd2hlbiBBQ1BJIGlzIGVuYWJsZWQgZm9yIG5vdy4KPiAKPiBDT05G
SUdfU1VSRkFDRV9QTEFURk9STVMgc2hvdWxkIGJlIGVuYWJsZWQgZm9yIEFSTTY0IHx8IFg4NiB8
fCBDT01QSUxFX1RFU1Qgb25seSwKPiBzbyBJIGd1ZXNzIHRoZSBpc3N1ZSBvbmx5IGhhcHBlbnMg
d2hlbiBjb21waWxpbmcgd2l0aCB0aGUgbGF0dGVyIGVuYWJsZWQ/Cj4gCj4gSSdtIG5vdCBhd2Fy
ZSBvZiBhbnkgY3VycmVudCBwbGFucyBvZiBNUyB0byByZWxlYXNlIFJJU0MtVi1iYXNlZCBTdXJm
YWNlCj4gZGV2aWNlcywgc28geW91IGNvdWxkIG1heWJlIGFsc28ganVzdCBleHBsaWNpdGx5IGRp
c2FibGUgQ09ORklHX1NVUkZBQ0VfUExBVEZPUk1TLgo+IEluIGFueSBjYXNlLCBJIGRvbid0IHNl
ZSBhbnkgaXNzdWVzIHdpdGggZGlzYWJsaW5nIHRoZSB3aG9sZSBwbGF0Zm9ybS9zdXJmYWNlCj4g
b3Igb25seSBpbmRpdmlkdWFsIGRyaXZlcnMgZm9yIFJJU0MtViwgc28gZm9yIGVpdGhlciBzb2x1
dGlvbjoKPiAKPiBBY2tlZC1ieTogTWF4aW1pbGlhbiBMdXogPGx1em1heGltaWxpYW5AZ21haWwu
Y29tPgo+IApIaSBNYXhpbWlsaWFuLAoKVGhhbmtzIS4gWWVzLCBDT01QSUxFX1RFU1QgZ2V0cyBl
bmFibGVkIGZvciBhbGxtb2Rjb25maWcgYnVpbGRzLiBTaW5jZQp0aGUgd2hvbGUgaW50ZW50aW9u
IG9mIENPTVBJTEVfVEVTVCBhcHBlYXJzIHRvIGJlIGFibGUgdG8gY29tcGlsZS10ZXN0CmRyaXZl
cnMgb24gYSBwbGF0Zm9ybSB0aGFuIHRoZXkgYXJlIHN1cHBvc2VkIHRvIGJlIHVzZWQsIEkgdGhp
bmsgaXQgaXMKYmV0dGVyIG5vdCB0byBza2lwIHdob2xlIHNldCBvZiBkcml2ZXJzIGJ1dCBvbmx5
IHRoYXQgd2hpY2ggY2FuIG5vdCBidWlsZC4KU28sIEkgcHJlZmVyIHRvIGtlZXAgdGhpcyBjaGFu
Z2UgYXMgaXMuCgpUaGFua3MsClN1bmlsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
