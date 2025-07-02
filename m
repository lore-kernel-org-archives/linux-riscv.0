Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CCBC83F05
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2zIiPQPNUmRG8q3lmALhxoWFXGkoiVQ06R+vSwVnurY=; b=gSbfEyUNuiEbg2
	xTguFD0JsWPeBrqCryxvlXeHFpgxDDd7xrngBlVKBIyW+DkfPD8TZnFw3mzB6hUNfISuVp/1fm4T+
	EBOkBvvAiK0zxOuU7ZxjNkTlcYZIyg1QECu0RLHM12Cw8XzrjjuWmPEeuIEDw61Vi3txGL+kU6chf
	uJ9CiqlMrPs7GMsEAabMhufOYlkC77TcZuegTBKpCN6+pltJttxWSfiY1BzwK7g3upws+WKTGXJDu
	RTfQ7ZoRemJVR/6Z59wwZb4v8RS/YpVjSK1Za0KNqFphU6okLkGI8QDHrtPH0Dk8+9qJrUS19Jl4/
	ZVLjD/P6pSRkqC7fS6tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqR-00000008LZg-3oJV;
	Wed, 02 Jul 2025 12:45:47 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwS9-00000008I7m-1ufC
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 12:20:42 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-553d52cb80dso6951795e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 05:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751458839; x=1752063639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlDIE+NRAJTFxIDdo85+1avglgQbOvm9gC4lDC40yv8=;
        b=UbHjpfmIA1ZFRs+zDiK2EMl0oNf9Cl6VNGLley5/nyqmsJEiEM4Gbier8RwvkQToyd
         g1WtTRUoBRBV7I5tWux8F0ajsx+le6HbtQ02SXjwcU5DAVLk4qG+Z6cHkOQSa4oGHdDZ
         hj0MOaioAEhrHpTPjV/bJMb32ut2CyCmYtuhc1g5F2X5sJ6GCHNiO7pShB6A7n87g+Am
         4QiJPB+9KomDETGirLsvEuG4fslsTojv2mayctgwD0sKcZFHU0n1jVcU6CSVb5JZ+AOm
         gYIad10ylJt9E0GhoUcxjUelD+TrK3g5gNsqh9rVuDJ8FomRQ8uwBJxCxqOqrOiB3cwJ
         zxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458839; x=1752063639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlDIE+NRAJTFxIDdo85+1avglgQbOvm9gC4lDC40yv8=;
        b=g6w8t+XgWilXby06UrtUov2wMptY+Xm3nTdqv9vUXYC8EwnBVPrBhIHI/4COyOG5VR
         m+nJCsorIfYGoy5IjcGl7zg1ONDZ9i/VwEvXAREDJz9eRbeZAuqf7edsnTMIg8SqfEr2
         BsKLFCXGQiNwuW6I2CciVp3BmdKx7nmQEES0vQqcx4QBydo3dY8fQkCfDSkBWqoV9L+2
         998en9DGNLfIGbt+6DvYh4/7WF8r/8ipVCUwEWIZ+w2dfAmJBwmXjT9i7tsx2fR+sMNE
         0ZH7FoRnD/n+uGt/WvQaJ+CHhHqlwIrCMZhItJtJnnYS/cf/0vYdjx7Gs4mvjs6ZkupN
         zDIw==
X-Forwarded-Encrypted: i=1; AJvYcCVYcISHcotMmOuNo+IyEyj88nKrFxaQj6dbZ3qUCLeBnrNKt67nIXuqh6Y5hvWhXIFVuM+03t4SzWD69w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhg8KIgwpb1zVm+dux+PoR62UPMYL3w8HfAtfudNW/gUzbUeOc
	hGkECdMFBhCWQJGwQ0GBv5Qfxi30yEfZDOu5s2R7m+j+WYSuzpKh5qlsFyenuBHIXw8rDIj4eZW
	wzy7OEnjC55ybJRg2OSPeCnkLJmpzoCK/HZ+xUm5w3Q==
X-Gm-Gg: ASbGnctNwBA/EppbI6lqUqyj9fnSjnij64rvY2jOXyShaxJ8DNyE88VUatXSrJWnTUZ
	Nbe3KJ0rf4jjLPm4wkRtFwjGrB9bj4V+I4s2V32mfTNqIgSEjPCLK+5YASTBb6ZPCPo9Pd67Ww4
	zfF+dN6kMRbMRYp0ENhGAeqbUy0QWCGyshSmbXwFAwWCSm
X-Google-Smtp-Source: AGHT+IH1lD190ckWcim2q6Zk3SmkYALF/z3+aLiK7gzYQJFBAZHqekWx0X5SLSlbsPJp/7c6iQAutReznlxbFSvgSgc=
X-Received: by 2002:a05:6512:b0d:b0:554:e7ce:97f8 with SMTP id
 2adb3069b0e04-55628ed6c86mr899229e87.15.1751458839282; Wed, 02 Jul 2025
 05:20:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250702114633.1490974-1-apatel@ventanamicro.com>
In-Reply-To: <20250702114633.1490974-1-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 2 Jul 2025 17:50:26 +0530
X-Gm-Features: Ac12FXxE_Q89fF2kuLXVjucIT31RfsCBiQVg9DaPXxssTSlaWFGUaeKT2XWMNbE
Message-ID: <CAK9=C2WH5QuQcKwTuGUAwF_ewkTDurDig0CU_+rJRtP3HHEpLA@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Add kernel parameter to disable IPIs
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_052041_496063_A048B033 
X-CRM114-Status: GOOD (  27.61  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA1OjE24oCvUE0gQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRh
bmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2hlbiBpbmplY3RpbmcgSVBJcyB0byBhIHNldCBvZiBo
YXJ0cywgdGhlIElNU0lDIElQSSBzdXBwb3J0IHdpbGwgZG8KPiBhIHNlcGFyYXRlIE1NSU8gd3Jp
dGUgdG8gdGhlIFNFVElQTlVNX0xFIHJlZ2lzdGVyIG9mIGVhY2ggdGFyZ2V0IGhhcnQuCj4gVGhp
cyBtZWFucyBvbiBhIHBsYXRmb3JtIHdoZXJlIElNU0lDIGlzIHRyYXAtbi1lbXVsYXRlZCwgdGhl
cmUgd2lsbCBiZQo+IE4gTU1JTyB0cmFwcyB3aGVuIGluamVjdGluZyBJUEkgdG8gTiB0YXJnZXQg
aGFydHMgaGVuY2UgSU1TSUMgSVBJcyB3aWxsCj4gYmUgc2xvdyBvbiBzdWNoIHBsYXRmb3JtIGNv
bXBhcmVkIHRvIHRoZSBTQkkgSVBJIGV4dGVuc2lvbi4KPgo+IFVuZm9ydHVuYXRlbHksIHRoZXJl
IGlzIG5vIERULCBBQ1BJLCBvciBhbnkgb3RoZXIgd2F5IG9mIGRpc2NvdmVyaW5nCj4gd2hldGhl
ciB0aGUgdW5kZXJseWluZyBJTVNJQyBpcyB0cmFwLW4tZW11bGF0ZWQuIFVzaW5nIE1NSU8gd3Jp
dGUgdG8KPiB0aGUgU0VUSVBOVU1fTEUgcmVnaXN0ZXIgZm9yIGluamVjdGluZyBJUEkgaXMgcHVy
ZWx5IGEgc29mdHdhcmUgY2hvaWNlCj4gaW4gdGhlIElNU0lDIGRyaXZlciBoZW5jZSBhZGQgYSBr
ZXJuZWwgcGFyYW1ldGVyIHRvIGFsbG93IHVzZXJzIGRpc2FibGUKPiBJTVNJQyBJUElzIG9uIHBs
YXRmb3JtcyB3aXRoIHRyYXAtbi1lbXVsYXRlZCBJTVNJQy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFu
dXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9u
L2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCB8ICA3ICsrKysrKysKPiAgZHJpdmVy
cy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jICAgICAgICAgfCAxMiArKysrKysrKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+IGluZGV4IGYxZjJjMDg3
NGRhOS4uN2YwZTEyZDBkMjYwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3Vp
ZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlk
ZS9rZXJuZWwtcGFyYW1ldGVycy50eHQKPiBAQCAtMjUzOCw2ICsyNTM4LDEzIEBACj4gICAgICAg
ICAgICAgICAgICAgICAgICAgcmVxdWlyZXMgdGhlIGtlcm5lbCB0byBiZSBidWlsdCB3aXRoCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgQ09ORklHX0FSTTY0X1BTRVVET19OTUkuCj4KPiArICAg
ICAgIGlycWNoaXAucmlzY3ZfaW1zaWNfbm9pcGkKPiArICAgICAgICAgICAgICAgICAgICAgICBb
UklTQy1WLEVBUkxZXQo+ICsgICAgICAgICAgICAgICAgICAgICAgIEZvcmNlIHRoZSBrZXJuZWwg
dG8gbm90IHVzZSBJTVNJQyBzb2Z0d2FyZSBpbmplY3RlZCBNU0lzCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgYXMgSVBJcy4gSW50ZW5kZWQgZm9yIHN5c3RlbSB3aGVyZSBJTVNJQyBpcyB0cmFw
LW4tZW11bGF0ZWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYW5kIHRodXMgd2FudCB0byBy
ZWR1Y2UgTU1JTyB0cmFwcyB3aGVuIHRyaWdnZXJpbmcgSVBJcwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHRvIG11bHRpcGxlIGhhcnRzLgo+ICsKPiAgICAgICAgIGlycWZpeHVwICAgICAgICBb
SFddCj4gICAgICAgICAgICAgICAgICAgICAgICAgV2hlbiBhbiBpbnRlcnJ1cHQgaXMgbm90IGhh
bmRsZWQgc2VhcmNoIGFsbCBoYW5kbGVycwo+ICAgICAgICAgICAgICAgICAgICAgICAgIGZvciBp
dC4gSW50ZW5kZWQgdG8gZ2V0IHN5c3RlbXMgd2l0aCBiYWRseSBicm9rZW4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jIGIvZHJpdmVycy9pcnFj
aGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gaW5kZXggMWRiYzQxZDdmZTgwLi5jNmZiYTky
ZGQ1YTkgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJs
eS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1lYXJseS5jCj4gQEAg
LTksNiArOSw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L2V4cG9ydC5oPgo+ICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9pbml0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pby5oPgo+ICAjaW5jbHVkZSA8bGludXgv
aXJxLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9pcnFjaGlwLmg+Cj4gQEAgLTIyLDYgKzIzLDE0IEBA
Cj4gICNpbmNsdWRlICJpcnEtcmlzY3YtaW1zaWMtc3RhdGUuaCIKPgo+ICBzdGF0aWMgaW50IGlt
c2ljX3BhcmVudF9pcnE7Cj4gK3N0YXRpYyBib29sIGltc2ljX25vaXBpOwo+ICsKPiArc3RhdGlj
IGludCBfX2luaXQgaW1zaWNfbm9pcGlfY2ZnKGNoYXIgKmJ1ZikKPiArewo+ICsgICAgICAgaW1z
aWNfbm9pcGkgPSB0cnVlOwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gK30KPiArZWFybHlfcGFyYW0o
ImlycWNoaXAucmlzY3ZfaW1zaWNfbm9pcGkiLCBpbXNpY19ub2lwaV9jZmcpOwo+Cj4gICNpZmRl
ZiBDT05GSUdfU01QCj4gIHN0YXRpYyB2b2lkIGltc2ljX2lwaV9zZW5kKHVuc2lnbmVkIGludCBj
cHUpCj4gQEAgLTQ3LDYgKzU2LDkgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfaXBpX2RvbWFp
bl9pbml0KHZvaWQpCj4gIHsKPiAgICAgICAgIGludCB2aXJxOwo+Cj4gKyAgICAgICBpZiAoaW1z
aWNfbm9pcGkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAwOwo+ICsKCldlIGNhbiBza2lwIGVu
YWJsaW5nL2Rpc2FibGluZyBJTVNJQ19JUElfSUQgaW4gaW1zaWNfaXBpX3N0YXJ0aW5nX2NwdSgp
CmFuZCBpbXNpY19pcGlfZHlpbmdfY3B1KCkgd2hlbiBpbXNpY19ub2lwaSBpcyBzZXQuCgpJbiBh
ZGRpdGlvbiB0byB0aGUgYWJvdmUsIHdlIGNhbiBhbHNvIHJlLXVzZSB0aGUgcmVzZXJ2ZWQgSVBJ
IElEIGZvcgpkZXZpY2VzLgoKSSB3aWxsIHF1aWNrbHkgc2VuZCB2My4gQXBvbG9naWVzIGZvciB0
aGUgbm9pc2UuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
