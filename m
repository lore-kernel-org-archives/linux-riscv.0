Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DCB6E7545F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 18:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgLgiFNETYd8KGdpoyc/9B37OIon5lzgmeaS5374l4s=; b=RJgFMvS5wnR2rx
	hqci1Mx4l6swFvs2wDx/8APFyXgr4ulQq0by7EvlXKrkK9pSQc5jqkHSkWZSgC4vWuqzcO5qwabSF
	anJZPCzhBg3bUENp8GW6eA3LTL0uRkVLPLoAtq+0zkf4Ws0D4zPEY/b3+dJsOEjLf/+eKpMlxcjhB
	XW0TZL5fwxfiV5M7/bGE4JxQ6jsTwAVWKCEjp/JaZONb4cqjxymgx/Y9iofv1vBrBo+S43vY4HXHq
	34+6p88Nr0FoiLIaEpknCp/RbVrg9FXNAvCI0TVZeBMlssJNb5S62cI667bqvO8WdWeR7QBdc8yLo
	RqLMwaVlfyOzBya8nRnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkWQ-00F9av-1o;
	Tue, 03 Oct 2023 18:53:30 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnkWM-00F9aH-2H
	for linux-riscv@lists.infradead.org;
	Tue, 03 Oct 2023 18:53:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32615eaa312so1189496f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Oct 2023 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696359203; x=1696964003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxdS62njemCJYDyxzH0Xec1nDuWI0jd1G26QrbZoJVI=;
        b=EFq5jBSzdEJRJcWV5ZyLLTk/oDxcnrBE37h5lg/SsN2cMd8QmrXJb9pZMRhOOVy4wg
         Uo3TRnKr5IqGQXw7xx3B4TvVYodzo+ole8zWuvf5Yn7+VwLWpC5xWrjcUt7Jr2/Yrq5e
         /hs7QtIbi+igqDQ3s3lza7fw80YK9qvgWCkvLAmntmRv3UB4C7PQ7GexRSjwrmNECgxZ
         yrdpLUw9oqEVExS9AmJaBr5a9H6Bt21oXgHM3hUhuSqrpHNsDxKySjb0/Tv4JXwzt1o/
         wyf27fBCNFyBxbN9O5iDCpaBbAoVMjV0+jhUHv+PuqXeG1CqpjaPwH2dR+IXKSnNMQTj
         mGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696359203; x=1696964003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxdS62njemCJYDyxzH0Xec1nDuWI0jd1G26QrbZoJVI=;
        b=fwOQMx9vDW8pfSnqb7Ua45X9r82bl8naC1WkS4cOmzszJwMeN7TLpLPgs97NNBhY3D
         QZVYRwNH5RMH2ZMztz2M6ZXU8JsV/7yh6lB19Kn5aUoOvEPVUX2cnbar89nC9WZWlKnr
         RT7HDvhRpp+gA8FPM2hDsaBst7ithGlLte3QCKT75DiLcdxVUiKycP5bmD3X+/KlDxfy
         mld88yAnwxuwBr81s573pl88rDcy46xcngJeoRoKe+7hEqx9Zp27Frn2313NEVsyYGB3
         fpslLBm0MB92M+9XOCZ+Q2nHUQ90B14PASETtxQjX2HT5ZMeUg9KY6YiErUuqqJ3yvff
         ngwA==
X-Gm-Message-State: AOJu0Yzdc9Ul+WEqRahi+S3eAImF4Kf0CW0+mw/xotKiDLN8ShmRoYIk
	uQ0Of38pcKiVfnSrIP8GfRfU5bQEj4BfHO2ovzaJag==
X-Google-Smtp-Source: AGHT+IHgHTJULG9/ylDvqsl0oic3Vd6rdjwr9xrFptOLH9ELQgyfZDGJG8zjY4qp9RI6QL23gNUARde2AUw9jfvnzRM=
X-Received: by 2002:adf:f74f:0:b0:319:68ba:7c8e with SMTP id
 z15-20020adff74f000000b0031968ba7c8emr101529wrp.38.1696359203241; Tue, 03 Oct
 2023 11:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230927170015.295232-1-sunilvl@ventanamicro.com> <20230927170015.295232-2-sunilvl@ventanamicro.com>
In-Reply-To: <20230927170015.295232-2-sunilvl@ventanamicro.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 3 Oct 2023 20:53:12 +0200
Message-ID: <CAHVXubjp_hTS7so1eO4V6nwYEqr1ruvMt05u-Y3efDgvP2YNHg@mail.gmail.com>
Subject: Re: [PATCH v2 -next 1/4] RISC-V: ACPI: Enhance acpi_os_ioremap with
 MMIO remapping
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Jones <ajones@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Anup Patel <apatel@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Atish Kumar Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_115326_766859_9F6A616F 
X-CRM114-Status: GOOD (  27.28  )
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

SGkgU3VuaWwsCgpPbiBXZWQsIFNlcCAyNywgMjAyMyBhdCA3OjAw4oCvUE0gU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gRW5oYW5jZSB0aGUgYWNwaV9vc19p
b3JlbWFwKCkgdG8gc3VwcG9ydCBvcHJlZ2lvbnMgaW4gTU1JTyBzcGFjZS4gQWxzbywKPiBoYXZl
IHN0cmljdCBjaGVja3MgdXNpbmcgRUZJIG1lbW9yeSBtYXAgdG8gYWxsb3cgcmVtYXBwaW5nIHRo
ZSBSQU0gc2ltaWxhcgo+IHRvIGFybTY0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgViBMIDxz
dW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICB8
ICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jIHwgODcgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggZDYwN2FiMGY3YzZkLi5hYzAzOWNmOGFmN2EgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmln
Cj4gQEAgLTM5LDYgKzM5LDcgQEAgY29uZmlnIFJJU0NWCj4gICAgICAgICBzZWxlY3QgQVJDSF9I
QVNfVElDS19CUk9BRENBU1QgaWYgR0VORVJJQ19DTE9DS0VWRU5UU19CUk9BRENBU1QKPiAgICAg
ICAgIHNlbGVjdCBBUkNIX0hBU19VQlNBTl9TQU5JVElaRV9BTEwKPiAgICAgICAgIHNlbGVjdCBB
UkNIX0hBU19WRFNPX0RBVEEKPiArICAgICAgIHNlbGVjdCBBUkNIX0tFRVBfTUVNQkxPQ0sKClNo
b3VsZG4ndCB3ZSByZXN0cmljdCB0aGlzIHRvIEFDUEk/Cgo+ICAgICAgICAgc2VsZWN0IEFSQ0hf
T1BUSU9OQUxfS0VSTkVMX1JXWCBpZiBBUkNIX0hBU19TVFJJQ1RfS0VSTkVMX1JXWAo+ICAgICAg
ICAgc2VsZWN0IEFSQ0hfT1BUSU9OQUxfS0VSTkVMX1JXWF9ERUZBVUxUCj4gICAgICAgICBzZWxl
Y3QgQVJDSF9TVEFDS1dBTEsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5j
IGIvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gaW5kZXggNTZjYjJjOTg2YzQ4Li5lNjE5ZWRj
OGIwY2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gKysrIGIvYXJj
aC9yaXNjdi9rZXJuZWwvYWNwaS5jCj4gQEAgLTE0LDkgKzE0LDEwIEBACj4gICAqLwo+Cj4gICNp
bmNsdWRlIDxsaW51eC9hY3BpLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9lZmkuaD4KPiAgI2luY2x1
ZGUgPGxpbnV4L2lvLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9tZW1ibG9jay5oPgo+ICAjaW5jbHVk
ZSA8bGludXgvcGNpLmg+Cj4gLSNpbmNsdWRlIDxsaW51eC9lZmkuaD4KPgo+ICBpbnQgYWNwaV9u
b2lycSA9IDE7ICAgICAgICAgICAgLyogc2tpcCBBQ1BJIElSUSBpbml0aWFsaXphdGlvbiAqLwo+
ICBpbnQgYWNwaV9kaXNhYmxlZCA9IDE7Cj4gQEAgLTIxNyw3ICsyMTgsODkgQEAgdm9pZCBfX2lu
aXQgX19hY3BpX3VubWFwX3RhYmxlKHZvaWQgX19pb21lbSAqbWFwLCB1bnNpZ25lZCBsb25nIHNp
emUpCj4KPiAgdm9pZCBfX2lvbWVtICphY3BpX29zX2lvcmVtYXAoYWNwaV9waHlzaWNhbF9hZGRy
ZXNzIHBoeXMsIGFjcGlfc2l6ZSBzaXplKQo+ICB7Cj4gLSAgICAgICByZXR1cm4gKHZvaWQgX19p
b21lbSAqKW1lbXJlbWFwKHBoeXMsIHNpemUsIE1FTVJFTUFQX1dCKTsKPiArICAgICAgIGVmaV9t
ZW1vcnlfZGVzY190ICptZCwgKnJlZ2lvbiA9IE5VTEw7Cj4gKyAgICAgICBwZ3Byb3RfdCBwcm90
Owo+ICsKPiArICAgICAgIGlmIChXQVJOX09OX09OQ0UoIWVmaV9lbmFibGVkKEVGSV9NRU1NQVAp
KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKwo+ICsgICAgICAgZm9yX2VhY2hf
ZWZpX21lbW9yeV9kZXNjKG1kKSB7Cj4gKyAgICAgICAgICAgICAgIHU2NCBlbmQgPSBtZC0+cGh5
c19hZGRyICsgKG1kLT5udW1fcGFnZXMgPDwgRUZJX1BBR0VfU0hJRlQpOwo+ICsKPiArICAgICAg
ICAgICAgICAgaWYgKHBoeXMgPCBtZC0+cGh5c19hZGRyIHx8IHBoeXMgPj0gZW5kKQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+ICsKPiArICAgICAgICAgICAgICAgaWYgKHBo
eXMgKyBzaXplID4gZW5kKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybihGV19C
VUcgInJlcXVlc3RlZCByZWdpb24gY292ZXJzIG11bHRpcGxlIEVGSSBtZW1vcnkgcmVnaW9uc1xu
Iik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5VTEw7Cj4gKyAgICAgICAgICAg
ICAgIH0KPiArICAgICAgICAgICAgICAgcmVnaW9uID0gbWQ7Cj4gKyAgICAgICAgICAgICAgIGJy
ZWFrOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBJdCBpcyBmaW5l
IGZvciBBTUwgdG8gcmVtYXAgcmVnaW9ucyB0aGF0IGFyZSBub3QgcmVwcmVzZW50ZWQgaW4gdGhl
Cj4gKyAgICAgICAgKiBFRkkgbWVtb3J5IG1hcCBhdCBhbGwsIGFzIGl0IG9ubHkgZGVzY3JpYmVz
IG5vcm1hbCBtZW1vcnksIGFuZCBNTUlPCj4gKyAgICAgICAgKiByZWdpb25zIHRoYXQgcmVxdWly
ZSBhIHZpcnR1YWwgbWFwcGluZyB0byBtYWtlIHRoZW0gYWNjZXNzaWJsZSB0bwo+ICsgICAgICAg
ICogdGhlIEVGSSBydW50aW1lIHNlcnZpY2VzLgo+ICsgICAgICAgICovCj4gKyAgICAgICBwcm90
ID0gUEFHRV9LRVJORUxfSU87Cj4gKyAgICAgICBpZiAocmVnaW9uKSB7Cj4gKyAgICAgICAgICAg
ICAgIHN3aXRjaCAocmVnaW9uLT50eXBlKSB7Cj4gKyAgICAgICAgICAgICAgIGNhc2UgRUZJX0xP
QURFUl9DT0RFOgo+ICsgICAgICAgICAgICAgICBjYXNlIEVGSV9MT0FERVJfREFUQToKPiArICAg
ICAgICAgICAgICAgY2FzZSBFRklfQk9PVF9TRVJWSUNFU19DT0RFOgo+ICsgICAgICAgICAgICAg
ICBjYXNlIEVGSV9CT09UX1NFUlZJQ0VTX0RBVEE6Cj4gKyAgICAgICAgICAgICAgIGNhc2UgRUZJ
X0NPTlZFTlRJT05BTF9NRU1PUlk6Cj4gKyAgICAgICAgICAgICAgIGNhc2UgRUZJX1BFUlNJU1RF
TlRfTUVNT1JZOgo+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChtZW1ibG9ja19pc19tYXBf
bWVtb3J5KHBoeXMpIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICFtZW1ibG9ja19p
c19yZWdpb25fbWVtb3J5KHBoeXMsIHNpemUpKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwcl93YXJuKEZXX0JVRyAicmVxdWVzdGVkIHJlZ2lvbiBjb3ZlcnMga2VybmVsIG1l
bW9yeVxuIik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IC8qCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogTWFwcGluZyBrZXJuZWwgbWVtb3J5IGlz
IHBlcm1pdHRlZCBpZiB0aGUgcmVnaW9uIGluCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICog
cXVlc3Rpb24gaXMgY292ZXJlZCBieSBhIHNpbmdsZSBtZW1ibG9jayB3aXRoIHRoZQo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAqIE5PTUFQIGF0dHJpYnV0ZSBzZXQ6IHRoaXMgZW5hYmxlcyB0
aGUgdXNlIG9mIEFDUEkKPiArICAgICAgICAgICAgICAgICAgICAgICAgKiB0YWJsZSBvdmVycmlk
ZXMgcGFzc2VkIHZpYSBpbml0cmFtZnMuCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogVGhp
cyBwYXJ0aWN1bGFyIHVzZSBjYXNlIG9ubHkgcmVxdWlyZXMgcmVhZCBhY2Nlc3MuCj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZmFsbHRocm91
Z2g7Cj4gKwo+ICsgICAgICAgICAgICAgICBjYXNlIEVGSV9SVU5USU1FX1NFUlZJQ0VTX0NPREU6
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICAgICAgICAg
KiBUaGlzIHdvdWxkIGJlIHVudXN1YWwsIGJ1dCBub3QgcHJvYmxlbWF0aWMgcGVyIHNlLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAqIGFzIGxvbmcgYXMgd2UgdGFrZSBjYXJlIG5vdCB0byBj
cmVhdGUgYSB3cml0YWJsZQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIG1hcHBpbmcgZm9y
IGV4ZWN1dGFibGUgY29kZS4KPiArICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiArICAgICAg
ICAgICAgICAgICAgICAgICBwcm90ID0gUEFHRV9LRVJORUxfUk87Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gKwo+ICsgICAgICAgICAgICAgICBjYXNlIEVGSV9BQ1BJX1JFQ0xB
SU1fTUVNT1JZOgo+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICogQUNQSSByZWNsYWltIG1lbW9yeSBpcyB1c2VkIHRvIHBhc3MgZmlybXdhcmUg
dGFibGVzCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogYW5kIG90aGVyIGRhdGEgdGhhdCBp
cyBpbnRlbmRlZCBmb3IgY29uc3VtcHRpb24gYnkKPiArICAgICAgICAgICAgICAgICAgICAgICAg
KiB0aGUgT1Mgb25seSwgd2hpY2ggbWF5IGRlY2lkZSBpdCB3YW50cyB0byByZWNsYWltCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICogdGhhdCBtZW1vcnkgYW5kIHVzZSBpdCBmb3Igc29tZXRo
aW5nIGVsc2UuIFdlIG5ldmVyCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogZG8gdGhhdCwg
YnV0IHdlIHVzdWFsbHkgYWRkIGl0IHRvIHRoZSBsaW5lYXIgbWFwCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICogYW55d2F5LCBpbiB3aGljaCBjYXNlIHdlIHNob3VsZCB1c2UgdGhlIGV4aXN0
aW5nCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICogbWFwcGluZy4KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAobWVtYmxvY2tfaXNf
bWFwX21lbW9yeShwaHlzKSkKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biAodm9pZCBfX2lvbWVtICopX192YShwaHlzKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBm
YWxsdGhyb3VnaDsKPiArCj4gKyAgICAgICAgICAgICAgIGRlZmF1bHQ6Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgaWYgKHJlZ2lvbi0+YXR0cmlidXRlICYgRUZJX01FTU9SWV9XQikKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByb3QgPSBQQUdFX0tFUk5FTDsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBlbHNlIGlmICgocmVnaW9uLT5hdHRyaWJ1dGUgJiBFRklfTUVNT1JZ
X1dDKSB8fAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIChyZWdpb24tPmF0dHJp
YnV0ZSAmIEVGSV9NRU1PUllfV1QpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUoUEFHRV9LRVJORUwpOwoKSSBoYXZlIHRvIGFzazog
d2h5IGlzIHdyaXRlLXRocm91Z2ggbWFwcGVkIHRvIHdyaXRlLWNvbWJpbmVkIGhlcmU/Cgo+ICsg
ICAgICAgICAgICAgICB9Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAgcmV0dXJuIGlvcmVtYXBf
cHJvdChwaHlzLCBzaXplLCBwZ3Byb3RfdmFsKHByb3QpKTsKPiAgfQo+Cj4gICNpZmRlZiBDT05G
SUdfUENJCj4gLS0KPiAyLjM5LjIKPgoKTGlrZSBBbmRyZXcgc2FpZCBpbiB2MSwgdG9vIGJhZCB3
ZSBjYW4ndCBtZXJnZSB0aGF0IHdpdGggYXJtNjQgaW5zdGVhZApvZiBkdXBsaWNhdGluZy4KCkJ1
dCBvdGhlcndpc2UsIHlvdSBjYW4gYWRkOgoKUmV2aWV3ZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8
YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
