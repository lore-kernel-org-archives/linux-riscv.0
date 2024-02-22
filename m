Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214C9C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 13:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3TSPGHxpRty7r45yrfQI0EOzA01YHDOnaiXP6FStEXw=; b=oAAg1nQpK92pMh
	5kz9M2OqFhtCtI0we8ub0EWf/DnmR9Q+pGMDKYOd/xZAp9PGYcVJm2+4h2CI/8y/YpNSNn+Zkudye
	B/2151/50Sh1JzVJasoakkpyl1BAeE0YHKlYNiImAzw3TM+6rTzKlNKa7/LOsIbBQAmUKGmyurmAu
	uzDO5NhwnZsPIIFYMXXuLnTQID7/EPrVO5UvIxM7IjDo/GWT+gmlOvMuYPVkAdd7Fkkzx3NPS0lnf
	8iMKR/6GC7Dk5p9VWkBh9Pkxt3OuSk7odh3DlBXT6MZNxSPDTDtZ4Zqn9xAF4VRNhBB7SYL22lJyY
	Q/dwYFKBl4U7LLRzRAKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8vB-00000004yV6-31tX;
	Thu, 22 Feb 2024 13:15:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd8v7-00000004ySC-0Cpp;
	Thu, 22 Feb 2024 13:15:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 45139CE2297;
	Thu, 22 Feb 2024 13:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24331C43390;
	Thu, 22 Feb 2024 13:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708607722;
	bh=UEVsSZcGmV67zShBBFj0j5CNp24EUBflBXO5GRus0Ec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sbwSqzTBz+kazip5qwYb+U1jMEnSqGzy5vHiXeKWKcWlRSgm8X8DNJ+PKwtj8Ztoe
	 qz7KBevpyREnT4+f44BDEwa58ymwlnjcLgM7SJuziRwmnI4xxQA+PlbTH6CLxI0y57
	 lD0P9DdG2UgCQpqWWmPO1lpDYV2sc8g6caiaOTA0ZcpBPKOVAjavq6XVmoJr47Mky9
	 OD/L4VncVcJvkD+jZhTgl4ko6IvJjrtMOOH8k8zO8pqh8Zr6AMTF7UPgMYNQs8w2BY
	 grNCBSSSWkwcrVpm8rWaj9jPDJ+7W8dxYhTDoKot8c1c/UZTgXAMK2Zus0i/q5s8IE
	 O2f8ff7S9Et3w==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish
 Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Andrew Jones
 <ajones@ventanamicro.com>
Subject: Re: [PATCH v14 12/18] irqchip/riscv-imsic: Add device MSI domain
 support for platform devices
In-Reply-To: <20240222094006.1030709-13-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-13-apatel@ventanamicro.com>
Date: Thu, 22 Feb 2024 14:15:19 +0100
Message-ID: <87jzmwtzbs.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_051525_508968_0613493D 
X-CRM114-Status: GOOD (  18.33  )
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

QW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyaXRlczoKCj4gVGhlIExpbnV4
IHBsYXRmb3JtIE1TSSBzdXBwb3J0IGFsbG93cyBwZXItZGV2aWNlIE1TSSBkb21haW5zIHNvIGFk
ZAo+IGEgcGxhdGZvcm0gaXJxY2hpcCBkcml2ZXIgZm9yIFJJU0MtViBJTVNJQyB3aGljaCBwcm92
aWRlcyBhIGJhc2UgSVJRCj4gZG9tYWluIHdpdGggTVNJIHBhcmVudCBzdXBwb3J0IGZvciBwbGF0
Zm9ybSBkZXZpY2UgZG9tYWlucy4KPgo+IFRoZSBJTVNJQyBwbGF0Zm9ybSBkcml2ZXIgYXNzdW1l
cyB0aGF0IHRoZSBJTVNJQyBzdGF0ZSBpcyBhbHJlYWR5Cj4gaW5pdGlhbGl6ZWQgYnkgdGhlIElN
U0lDIGVhcmx5IGRyaXZlci4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2
ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKy0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1w
bGF0Zm9ybS5jIHwgMzQ0ICsrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLXJpc2N2LWltc2ljLXN0YXRlLmggICAgfCAgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDM0
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPgo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2lycWNoaXAvTWFrZWZpbGUgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUKPiBpbmRl
eCBkNzE0NzI0Mzg3Y2UuLmFiY2E0NDVhMzIyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2lycWNo
aXAvTWFrZWZpbGUKPiArKysgYi9kcml2ZXJzL2lycWNoaXAvTWFrZWZpbGUKPiBAQCAtOTUsNyAr
OTUsNyBAQCBvYmotJChDT05GSUdfUUNPTV9NUE0pCQkJKz0gaXJxLXFjb20tbXBtLm8KPiAgb2Jq
LSQoQ09ORklHX0NTS1lfTVBJTlRDKQkJKz0gaXJxLWNza3ktbXBpbnRjLm8KPiAgb2JqLSQoQ09O
RklHX0NTS1lfQVBCX0lOVEMpCQkrPSBpcnEtY3NreS1hcGItaW50Yy5vCj4gIG9iai0kKENPTkZJ
R19SSVNDVl9JTlRDKQkJKz0gaXJxLXJpc2N2LWludGMubwo+IC1vYmotJChDT05GSUdfUklTQ1Zf
SU1TSUMpCQkrPSBpcnEtcmlzY3YtaW1zaWMtc3RhdGUubyBpcnEtcmlzY3YtaW1zaWMtZWFybHku
bwo+ICtvYmotJChDT05GSUdfUklTQ1ZfSU1TSUMpCQkrPSBpcnEtcmlzY3YtaW1zaWMtc3RhdGUu
byBpcnEtcmlzY3YtaW1zaWMtZWFybHkubyBpcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0ubwo+ICBv
YmotJChDT05GSUdfU0lGSVZFX1BMSUMpCQkrPSBpcnEtc2lmaXZlLXBsaWMubwo+ICBvYmotJChD
T05GSUdfSU1YX0lSUVNURUVSKQkJKz0gaXJxLWlteC1pcnFzdGVlci5vCj4gIG9iai0kKENPTkZJ
R19JTVhfSU5UTVVYKQkJKz0gaXJxLWlteC1pbnRtdXgubwo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2lycWNoaXAvaXJxLXJpc2N2LWltc2ljLXBsYXRmb3JtLmMgYi9kcml2ZXJzL2lycWNoaXAvaXJx
LXJpc2N2LWltc2ljLXBsYXRmb3JtLmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAwMC4uZTIzNDRmYzA4ZGNhCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtcGxhdGZvcm0uYwo+IEBAIC0wLDAgKzEsMzQ0IEBACj4g
Ky8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gKy8qCj4gKyAqIENvcHlyaWdo
dCAoQykgMjAyMSBXZXN0ZXJuIERpZ2l0YWwgQ29ycG9yYXRpb24gb3IgaXRzIGFmZmlsaWF0ZXMu
Cj4gKyAqIENvcHlyaWdodCAoQykgMjAyMiBWZW50YW5hIE1pY3JvIFN5c3RlbXMgSW5jLgo+ICsg
Ki8KPiArCj4gKyNkZWZpbmUgcHJfZm10KGZtdCkgInJpc2N2LWltc2ljOiAiIGZtdAo+ICsjaW5j
bHVkZSA8bGludXgvYml0bWFwLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L2ludGVycnVwdC5oPgo+ICsjaW5jbHVkZSA8bGludXgvaW8uaD4KPiArI2luY2x1
ZGUgPGxpbnV4L2lycS5oPgo+ICsjaW5jbHVkZSA8bGludXgvaXJxY2hpcC5oPgo+ICsjaW5jbHVk
ZSA8bGludXgvaXJxZG9tYWluLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L21zaS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+
Cj4gKyNpbmNsdWRlIDxsaW51eC9zcGlubG9jay5oPgo+ICsjaW5jbHVkZSA8bGludXgvc21wLmg+
Cj4gKwo+ICsjaW5jbHVkZSAiaXJxLXJpc2N2LWltc2ljLXN0YXRlLmgiCj4gKwo+ICtzdGF0aWMg
Ym9vbCBpbXNpY19jcHVfcGFnZV9waHlzKHVuc2lnbmVkIGludCBjcHUsIHVuc2lnbmVkIGludCBn
dWVzdF9pbmRleCwKPiArCQkJCXBoeXNfYWRkcl90ICpvdXRfbXNpX3BhKQo+ICt7Cj4gKwlzdHJ1
Y3QgaW1zaWNfZ2xvYmFsX2NvbmZpZyAqZ2xvYmFsOwo+ICsJc3RydWN0IGltc2ljX2xvY2FsX2Nv
bmZpZyAqbG9jYWw7Cj4gKwo+ICsJZ2xvYmFsID0gJmltc2ljLT5nbG9iYWw7Cj4gKwlsb2NhbCA9
IHBlcl9jcHVfcHRyKGdsb2JhbC0+bG9jYWwsIGNwdSk7Cj4gKwo+ICsJaWYgKEJJVChnbG9iYWwt
Pmd1ZXN0X2luZGV4X2JpdHMpIDw9IGd1ZXN0X2luZGV4KQo+ICsJCXJldHVybiBmYWxzZTsKPiAr
Cj4gKwlpZiAob3V0X21zaV9wYSkKPiArCQkqb3V0X21zaV9wYSA9IGxvY2FsLT5tc2lfcGEgKwo+
ICsJCQkgICAgICAoZ3Vlc3RfaW5kZXggKiBJTVNJQ19NTUlPX1BBR0VfU1opOwoKTml0OiBBbmQg
b25lIG1vcmUgcmVkdW5kYW50IHBhcmVudGhlc2lzIGFuZCAxMDAgY2hhciEgOy0pCgoKQmrDtnJu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
