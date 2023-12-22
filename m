Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B4CCC46CD8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+/XIPWy6xfsPDkzZQ+AopVuuUBHJ/RqSNjS4niwfvM4=; b=MzT1QYnRrK3y33
	tpK7aKY4AqmoQr2ZIpyWSswF+jzeRO7YNLx59cNgzmC4GAden2Pi4qnNUMj6+haOTVlpkQI9vN1M1
	yfOqUFKBw2qVHggXVghJeGuIMAC0UzBU7zxK4lBSl5eWQfFoaowS9tz1lKXY9GOS+7T86tOTy9Or3
	lFty/eLQ6q6AFUcJ8GX278+V/lf48LYKKXlO7Ina1tabuBKhdGKfeaXabEBDzv+5a/BDLXXTN16gV
	D2PpxZg9RpIrpjqhYPrkw/o8DgSkX9wv5BHDw3fkvlKJpkbUKESbHCkrhYJvNSDTMlVL63EIfddoX
	Et0I0WGGPmBLKmc9a+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbwR-005RZq-2k;
	Fri, 22 Dec 2023 09:35:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGbwO-005RZ4-1R
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 09:35:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D744C61B6F
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F6EBC433B8
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 09:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703237734;
	bh=jZzdwoHT2kuZ2oo2BcVo/dRZz8kMowfuO8XWw6Jy+aQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GP5rlVgpsY3gf41iBrWBR4PLFsSSpt1cwhq0UZGWW6D9fMZSfNHAbDFsae+n9TPnm
	 RXbcB/gLI0Cpe6u4lWuu/0/6JGamdELFyme9j9YYAZoEbEm8aCrqWZL/aVIPGR3cvN
	 +VyPRYH08FzJokPuJd0sb5gJKt8UuIIuT14MPVQ6fPHtC2fFwn4NJrA0I4nBrvsYnf
	 P/zJZubL/Wme1lBZ6W98okrOSqrjHFSeJFsFTfiR4zr5LWfIYIOwG3nAApXO0xCPbK
	 NS3BNUGa19SLVjR+PbDK5XdshLte8R/6CovgVosy+zmgzlhNbuHt/fxGYKn/+Fd7UE
	 JlFnT5B+CgRUA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e55f97606so2428674e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 01:35:34 -0800 (PST)
X-Gm-Message-State: AOJu0Yw+B721FTuIBdfgR1O8WiUODN/PZOkEzU8NrVI+CJXtirIZrkRP
	lsgj3CHLJrG14n1m5WWcXU1htnZyXLrh7HTY4OQ=
X-Google-Smtp-Source: AGHT+IFBolUEPY720dl+czfO4qrssPxC1JJ7OwVqlpuBUwcp3tL3lhllAYTVKtUab1jFGi/GhzBcG2KsIGCJdxQjS+s=
X-Received: by 2002:a19:384e:0:b0:50e:384c:6982 with SMTP id
 d14-20020a19384e000000b0050e384c6982mr452303lfj.42.1703237732207; Fri, 22 Dec
 2023 01:35:32 -0800 (PST)
MIME-Version: 1.0
References: <20231222074605.452452-1-leobras@redhat.com> <20231222074605.452452-3-leobras@redhat.com>
In-Reply-To: <20231222074605.452452-3-leobras@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 17:35:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQNE7OQiAbkvVNzo9PCV=Xr8KQD0_=s-G56QMZJiZnjvA@mail.gmail.com>
Message-ID: <CAJF2gTQNE7OQiAbkvVNzo9PCV=Xr8KQD0_=s-G56QMZJiZnjvA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] riscv: add compile-time test into is_compat_task()
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Eric Biederman <ebiederm@xmission.com>, 
	Kees Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Greg Ungerer <gerg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, David Hildenbrand <david@redhat.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, 
	Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_013536_568605_E6207721 
X-CRM114-Status: GOOD (  24.74  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgNTowMuKAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBDdXJyZW50bHkgc2V2ZXJhbCBwbGFjZXMgd2lsbCB0ZXN0
IGZvciBDT05GSUdfQ09NUEFUIGJlZm9yZSB0ZXN0aW5nCj4gaXNfY29tcGF0X3Rhc2soKSwgcHJv
YmFibHkgaW4gb3JkZXIgdG8gYXZvaWQgYSBydW4tdGltZSB0ZXN0IGludG8gdGhlIHRhc2sKPiBz
dHJ1Y3R1cmUuCj4KPiBTaW5jZSBpc19jb21wYXRfdGFzaygpIGlzIGFuIGlubGluZWQgZnVuY3Rp
b24sIGl0IHdvdWxkIGJlIGhlbHBmdWwgdG8gYWRkIGEKPiBjb21waWxlLXRpbWUgdGVzdCBvZiBD
T05GSUdfQ09NUEFULCBtYWtpbmcgc3VyZSBpdCBhbHdheXMgcmV0dXJucyB6ZXJvIHdoZW4KPiB0
aGUgb3B0aW9uIGlzIG5vdCBlbmFibGVkIGR1cmluZyB0aGUga2VybmVsIGJ1aWxkLgo+Cj4gV2l0
aCB0aGlzLCB0aGUgY29tcGlsZXIgaXMgYWJsZSB0byB1bmRlcnN0YW5kIGluIGJ1aWxkLXRpbWUg
dGhhdAo+IGlzX2NvbXBhdF90YXNrKCkgd2lsbCBhbHdheXMgcmV0dXJuIDAsIGFuZCBvcHRpbWl6
ZS1vdXQgc29tZSBvZiB0aGUgZXh0cmEKPiBjb2RlIGludHJvZHVjZWQgYnkgdGhlIG9wdGlvbi4K
Pgo+IFRoaXMgd2lsbCBhbHNvIGFsbG93IHJlbW92aW5nIGEgbG90ICNpZmRlZnMgdGhhdCB3ZXJl
IGludHJvZHVjZWQsIGFuZCBtYWtlCj4gdGhlIGNvZGUgbW9yZSBjbGVhbi4KPgo+IFNpZ25lZC1v
ZmYtYnk6IExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4KPiAtLS0KPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaCAgICB8IDMgKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZWxmLmggICAgICAgfCA0IC0tLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggICB8IDYgLS0tLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgg
fCA0ICsrLS0KPiAgNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY29tcGF0LmggYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5oCj4gaW5kZXggMmFjOTU1YjUxMTQ4Zi4uOTE1
MTdiNTFiOGUyNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NvbXBhdC5o
Cj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jb21wYXQuaAo+IEBAIC0xNCw2ICsxNCw5
IEBACj4KPiAgc3RhdGljIGlubGluZSBpbnQgaXNfY29tcGF0X3Rhc2sodm9pZCkKPiAgewo+ICsg
ICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19DT01QQVQpKQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gMDsKPiArCj4gICAgICAgICByZXR1cm4gdGVzdF90aHJlYWRfZmxhZyhUSUZfMzJCSVQp
Owo+ICB9Cj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaCBiL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPiBpbmRleCA1OWEwODM2N2ZkZGQ3Li4yZTg4MjU3
Y2FmYWVhIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPiArKysg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5oCj4gQEAgLTUzLDEzICs1Myw5IEBAIGV4dGVy
biBib29sIGNvbXBhdF9lbGZfY2hlY2tfYXJjaChFbGYzMl9FaGRyICpoZHIpOwo+ICAjZGVmaW5l
IEVMRl9FVF9EWU5fQkFTRSAgICAgICAgICAgICAgICAoKERFRkFVTFRfTUFQX1dJTkRPVyAvIDMp
ICogMikKPgo+ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gLSNpZmRlZiBDT05GSUdfQ09NUEFUCj4g
ICNkZWZpbmUgU1RBQ0tfUk5EX01BU0sgICAgICAgICAoaXNfY29tcGF0X3Rhc2soKSA/IFwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDdmZiA+PiAoUEFHRV9TSElGVCAtIDEy
KSA6IFwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDNmZmZmID4+IChQQUdF
X1NISUZUIC0gMTIpKQo+IC0jZWxzZQo+IC0jZGVmaW5lIFNUQUNLX1JORF9NQVNLICAgICAgICAg
KDB4M2ZmZmYgPj4gKFBBR0VfU0hJRlQgLSAxMikpCj4gLSNlbmRpZgo+ICAjZW5kaWYKPgo+ICAv
Kgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggMWQ0NzJiMzFlMGNmZS4uZWE1YjI2
OWJlMjIzYSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gQEAgLTEyNywxNiArMTI3
LDEwIEBACj4gICNkZWZpbmUgVkFfVVNFUl9TVjQ4IChVTCgxKSA8PCAoVkFfQklUU19TVjQ4IC0g
MSkpCj4gICNkZWZpbmUgVkFfVVNFUl9TVjU3IChVTCgxKSA8PCAoVkFfQklUU19TVjU3IC0gMSkp
Cj4KPiAtI2lmZGVmIENPTkZJR19DT01QQVQKPiAgI2RlZmluZSBNTUFQX1ZBX0JJVFNfNjQgKChW
QV9CSVRTID49IFZBX0JJVFNfU1Y0OCkgPyBWQV9CSVRTX1NWNDggOiBWQV9CSVRTKQo+ICAjZGVm
aW5lIE1NQVBfTUlOX1ZBX0JJVFNfNjQgKFZBX0JJVFNfU1YzOSkKPiAgI2RlZmluZSBNTUFQX1ZB
X0JJVFMgKGlzX2NvbXBhdF90YXNrKCkgPyBWQV9CSVRTX1NWMzIgOiBNTUFQX1ZBX0JJVFNfNjQp
Cj4gICNkZWZpbmUgTU1BUF9NSU5fVkFfQklUUyAoaXNfY29tcGF0X3Rhc2soKSA/IFZBX0JJVFNf
U1YzMiA6IE1NQVBfTUlOX1ZBX0JJVFNfNjQpCj4gLSNlbHNlCj4gLSNkZWZpbmUgTU1BUF9WQV9C
SVRTICgoVkFfQklUUyA+PSBWQV9CSVRTX1NWNDgpID8gVkFfQklUU19TVjQ4IDogVkFfQklUUykK
PiAtI2RlZmluZSBNTUFQX01JTl9WQV9CSVRTIChWQV9CSVRTX1NWMzkpCj4gLSNlbmRpZiAvKiBD
T05GSUdfQ09NUEFUICovCj4gLQo+ICAjZWxzZQo+ICAjaW5jbHVkZSA8YXNtL3BndGFibGUtMzIu
aD4KPiAgI2VuZGlmIC8qIENPTkZJR182NEJJVCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNz
b3IuaAo+IGluZGV4IGYxOWY4NjFjZGE1NDkuLmVkMzJlNTNlNTU5OTkgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcHJvY2Vzc29yLmgKPiBAQCAtMjIsNyArMjIsNyBAQAo+ICAoeyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAg
ICAgICB1bnNpZ25lZCBsb25nIG1tYXBfZW5kOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiAgICAgICAgIHR5cGVvZihhZGRyKSBfYWRkciA9IChhZGRyKTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXAo+IC0gICAgICAgaWYgKChfYWRkcikgPT0gMCB8fCAoSVNfRU5BQkxF
RChDT05GSUdfQ09NUEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSkgXAo+ICsgICAgICAgaWYgKChf
YWRkcikgPT0gMCB8fCBpc19jb21wYXRfdGFzaygpKSAgICAgICAgICAgICAgICAgICBcCj4gICAg
ICAgICAgICAgICAgIG1tYXBfZW5kID0gU1RBQ0tfVE9QX01BWDsgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiAgICAgICAgIGVsc2UgaWYgKChfYWRkcikgPj0gVkFfVVNFUl9TVjU3KSAgICAgICAg
ICAgICAgICAgICAgICAgXAo+ICAgICAgICAgICAgICAgICBtbWFwX2VuZCA9IFNUQUNLX1RPUF9N
QVg7ICAgICAgICAgICAgICAgICAgICAgICBcCj4gQEAgLTM5LDcgKzM5LDcgQEAKPiAgICAgICAg
IHR5cGVvZihhZGRyKSBfYWRkciA9IChhZGRyKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XAo+ICAgICAgICAgdHlwZW9mKGJhc2UpIF9iYXNlID0gKGJhc2UpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAgICB1bnNpZ25lZCBsb25nIHJuZF9nYXAgPSBERUZBVUxUX01B
UF9XSU5ET1cgLSAoX2Jhc2UpOyAgIFwKPiAtICAgICAgIGlmICgoX2FkZHIpID09IDAgfHwgKElT
X0VOQUJMRUQoQ09ORklHX0NPTVBBVCkgJiYgaXNfY29tcGF0X3Rhc2soKSkpIFwKPiArICAgICAg
IGlmICgoX2FkZHIpID09IDAgfHwgaXNfY29tcGF0X3Rhc2soKSkgICAgICAgICAgICAgICAgICAg
XAo+ICAgICAgICAgICAgICAgICBtbWFwX2Jhc2UgPSAoX2Jhc2UpOyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gICAgICAgICBlbHNlIGlmICgoKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcp
ICYmIChWQV9CSVRTID49IFZBX0JJVFNfU1Y1NykpIFwKPiAgICAgICAgICAgICAgICAgbW1hcF9i
YXNlID0gVkFfVVNFUl9TVjU3IC0gcm5kX2dhcDsgICAgICAgICAgICAgXAo+IC0tCj4gMi40My4w
Cj4KUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKLS0gCkJlc3QgUmVn
YXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
