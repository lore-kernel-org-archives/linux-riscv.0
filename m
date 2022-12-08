Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D307C63705
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mETtHY8lJ4JVJb3hQhOWWWqxQx1QRpZIvVEdc0rm+p8=; b=A8ETVQrKz+emvA
	jq77rGKCsN4kI+YiCWY0chrSNerviiUyyU3lCBfEZXhgNdwzjhOIGZ6Zf59CrAokCgTCUplpOdobR
	5Q/b2Z3U68EZtX7wGtiDxbNjBgHOHID6sJ9UIo63Hf0A3wkMIzF86bUSK9wbJ+WVjnOinqxHn772s
	eM+qxbT3W2GhYqrkx6WY1RjTM2EfO6y5BswO9Vd/B8gIHl249gZt9N25Zp0p7FNr8Vm2t1m18Dto6
	wfSJe1/CThf30k/2W/sii4rP+hAh2d8+5jzl75YQX/xhLChA/Sw0FI8JzToL50C6DfCkK+tDQ/VLn
	D9otwPA5HCk41etetM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DtF-00Bv5r-Ih; Thu, 08 Dec 2022 10:12:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3DtC-00Buu2-3Q
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 10:12:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5EF2B821FE;
	Thu,  8 Dec 2022 10:12:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCC0C433C1;
	Thu,  8 Dec 2022 10:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670494343;
	bh=oSWBk5A/YjRMfCW/WvVQ9ZXtccAnJ070ZscZDewoBA8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fhBjHMg8aHSWYwKc5eAemS49AbwxRIeDH9bt2w8V2BitAB4uV0BeCtoXZx7Sn9JxB
	 YWApAOm3gTzHpztRw+p4e8T2tXdM8SmCMiPDfDr02IB4J4YEK2UFmufzHbu/5oonS9
	 bkjlEdAt8pZrPJ/vwYPh6CQlAUyySsLoFJ8QStEhnrmkIZUDl+s6v81mfVoTouEO+N
	 onib47o8lexbKrLzmApXHKPwYBIa49seUnezt/a0m1xOhjiqZGYcmPd2pHi/ILH+nD
	 KrK837YSpNTpa5ioRSoECUvxBGgNbrEFN7vcNysSrYSDPaCua99QtJ/U8W6s6BoL93
	 6onmsyZI3kabQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: guoren@kernel.org, arnd@arndb.de, guoren@kernel.org,
 palmer@rivosinc.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, conor.dooley@microchip.com, heiko@sntech.de,
 jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org,
 chenhuacai@kernel.org, apatel@ventanamicro.com, atishp@atishpatra.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mark.rutland@arm.com,
 zouyipeng@huawei.com, bigeasy@linutronix.de, David.Laight@aculab.com,
 chenzhongjin@huawei.com, greentime.hu@sifive.com, andy.chiu@sifive.com,
 ben@decadent.org.uk
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH -next V10 09/10] riscv: stack: Support
 HAVE_SOFTIRQ_ON_OWN_STACK
In-Reply-To: <20221208025816.138712-10-guoren@kernel.org>
References: <20221208025816.138712-1-guoren@kernel.org>
 <20221208025816.138712-10-guoren@kernel.org>
Date: Thu, 08 Dec 2022 11:12:21 +0100
Message-ID: <87o7sew6ey.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_021226_537203_62EC20EB 
X-CRM114-Status: GOOD (  19.71  )
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

Z3VvcmVuQGtlcm5lbC5vcmcgd3JpdGVzOgoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4KPiBBZGQgdGhlIEhBVkVfU09GVElSUV9PTl9PV05fU1RBQ0sgZmVhdHVy
ZSBmb3IgdGhlIElSUV9TVEFDS1MgY29uZmlnLiBUaGUKPiBpcnEgYW5kIHNvZnRpcnEgdXNlIHRo
ZSBzYW1lIGluZGVwZW5kZW50IGlycV9zdGFjayBvZiBwZXJjcHUgYnkgdGltZQo+IGRpdmlzaW9u
IG11bHRpcGxleGluZy4KPgo+IFRlc3RlZC1ieTogSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJu
ZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiAtLS0KPiAg
YXJjaC9yaXNjdi9LY29uZmlnICAgICAgfCAgNyArKysrLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVs
L2lycS5jIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCAwYTlkNGJk
YzAzMzguLmJkNGM0YWU0Y2RjOSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L0tjb25maWcKPiAr
KysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiBAQCAtNDQ3LDEyICs0NDcsMTMgQEAgY29uZmlnIEZQ
VQo+ICAJICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBZLgo+ICAKPiAg
Y29uZmlnIElSUV9TVEFDS1MKPiAtCWJvb2wgIkluZGVwZW5kZW50IGlycSBzdGFja3MiIGlmIEVY
UEVSVAo+ICsJYm9vbCAiSW5kZXBlbmRlbnQgaXJxICYgc29mdGlycSBzdGFja3MiIGlmIEVYUEVS
VAo+ICAJZGVmYXVsdCB5Cj4gIAlzZWxlY3QgSEFWRV9JUlFfRVhJVF9PTl9JUlFfU1RBQ0sKPiAr
CXNlbGVjdCBIQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLCgpIQVZFX0lSUV9FWElUX09OX0lSUV9T
VEFDSyBpcyB1c2VkIGJ5IHNvZnRpcnEuYyBTaG91bGRuJ3QgdGhhdCBiZQpzZWxlY3RlZCBpbnRy
b2R1Y2VkIGluIHRoaXMgcGF0Y2gsIGluc3RlYWQgb2YgdGhlIHByZXZpb3VzIG9uZT8KCj4gIAlo
ZWxwCj4gLQkgIEFkZCBpbmRlcGVuZGVudCBpcnEgc3RhY2tzIGZvciBwZXJjcHUgdG8gcHJldmVu
dCBrZXJuZWwgc3RhY2sgb3ZlcmZsb3dzLgo+IC0JICBXZSBtYXkgc2F2ZSBzb21lIG1lbW9yeSBm
b290cHJpbnQgYnkgZGlzYWJsaW5nIElSUV9TVEFDS1MuCj4gKwkgIEFkZCBpbmRlcGVuZGVudCBp
cnEgJiBzb2Z0aXJxIHN0YWNrcyBmb3IgcGVyY3B1IHRvIHByZXZlbnQga2VybmVsIHN0YWNrCj4g
KwkgIG92ZXJmbG93cy4gV2UgbWF5IHNhdmUgc29tZSBtZW1vcnkgZm9vdHByaW50IGJ5IGRpc2Fi
bGluZyBJUlFfU1RBQ0tTLgoKU2FtZSBjb21tZW50IGZyb20gcHJldmlvdXMgcGF0Y2guIFBsZWFz
ZSB1c2UgdGhlIHNhbWUgd29yZGluZy9jb25maWcgYXMKb3RoZXIgYXJjaHMuCgo+ICBlbmRtZW51
ICMgIlBsYXRmb3JtIHR5cGUiCj4gIAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9p
cnEuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2lycS5jCj4gaW5kZXggNWQ3N2Y2OTJiMTk4Li5hNjQw
NmRhMzQ5MzcgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvaXJxLmMKPiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9pcnEuYwo+IEBAIC0xMSw2ICsxMSw3IEBACj4gICNpbmNsdWRlIDxs
aW51eC9zZXFfZmlsZS5oPgo+ICAjaW5jbHVkZSA8YXNtL3NtcC5oPgo+ICAjaW5jbHVkZSA8YXNt
L3ZtYXBfc3RhY2suaD4KPiArI2luY2x1ZGUgPGFzbS9zb2Z0aXJxX3N0YWNrLmg+Cj4gIAo+ICAj
aWZkZWYgQ09ORklHX0lSUV9TVEFDS1MKPiAgc3RhdGljIERFRklORV9QRVJfQ1BVKHVsb25nICos
IGlycV9zdGFja19wdHIpOwo+IEBAIC0zOCw2ICszOSwzOCBAQCBzdGF0aWMgdm9pZCBpbml0X2ly
cV9zdGFja3Modm9pZCkKPiAgCQlwZXJfY3B1KGlycV9zdGFja19wdHIsIGNwdSkgPSBwZXJfY3B1
KGlycV9zdGFjaywgY3B1KTsKPiAgfQo+ICAjZW5kaWYgLyogQ09ORklHX1ZNQVBfU1RBQ0sgKi8K
PiArCj4gKyNpZmRlZiBDT05GSUdfSEFWRV9TT0ZUSVJRX09OX09XTl9TVEFDSwo+ICt2b2lkIGRv
X3NvZnRpcnFfb3duX3N0YWNrKHZvaWQpCj4gK3sKPiArI2lmZGVmIENPTkZJR19JUlFfU1RBQ0tT
Cj4gKwlpZiAob25fdGhyZWFkX3N0YWNrKCkpIHsKPiArCQl1bG9uZyAqc3AgPSBwZXJfY3B1KGly
cV9zdGFja19wdHIsIHNtcF9wcm9jZXNzb3JfaWQoKSkKPiArCQkJCQkrIElSUV9TVEFDS19TSVpF
L3NpemVvZih1bG9uZyk7Cj4gKwkJX19hc21fXyBfX3ZvbGF0aWxlKAo+ICsJCSJhZGRpCXNwLCBz
cCwgLSJSSVNDVl9TWlBUUiAgIlxuIgo+ICsJCVJFR19TIiAgcmEsIChzcCkJCVxuIgo+ICsJCSJh
ZGRpCXNwLCBzcCwgLSJSSVNDVl9TWlBUUiAgIlxuIgo+ICsJCVJFR19TIiAgczAsIChzcCkJCVxu
Igo+ICsJCSJhZGRpCXMwLCBzcCwgMioiUklTQ1ZfU1pQVFIgIlxuIgo+ICsJCSJtb3ZlCXNwLCAl
W3NwXQkJXG4iCj4gKwkJImNhbGwJX19kb19zb2Z0aXJxCQlcbiIKPiArCQkiYWRkaQlzcCwgczAs
IC0yKiJSSVNDVl9TWlBUUiJcbiIKPiArCQlSRUdfTCIgIHMwLCAoc3ApCQlcbiIKPiArCQkiYWRk
aQlzcCwgc3AsICJSSVNDVl9TWlBUUiAgICJcbiIKPiArCQlSRUdfTCIgIHJhLCAoc3ApCQlcbiIK
PiArCQkiYWRkaQlzcCwgc3AsICJSSVNDVl9TWlBUUiAgICJcbiIKPiArCQk6Cj4gKwkJOiBbc3Bd
ICJyIiAoc3ApCj4gKwkJOiAiYTAiLCAiYTEiLCAiYTIiLCAiYTMiLCAiYTQiLCAiYTUiLCAiYTYi
LCAiYTciLAo+ICsJCSAgInQwIiwgInQxIiwgInQyIiwgInQzIiwgInQ0IiwgInQ1IiwgInQ2IiwK
PiArCQkgICJtZW1vcnkiKTsKClNhbWUgYXMgcHJldmlvdXMgcGF0Y2guIFBsZWFzZSBhdm9pZCBD
JlAgYW5kIGhhdmUgYSBsb29rIGF0IGhvdwpjYWxsX29uX3N0YWNrIGlzIGRvbmUgb24geDg2LgoK
CkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
