Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 501E8E77171
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 08:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c/UhU9/Y7ssLaWX/IDR26KAP9z8CdXmJOWmhS9VjZ9E=; b=FMYa1sHbfrkM5m
	xEotrHraOUUoAbDmdEAnbvYktS9lov1PkPT0sKkyiIYUe0uzy1mr44hhpW10qLQ/MK17cD5q1QwJK
	+oW1d4E4pGc9sxIDmS9p8aD11GD1nskiEXErtu219POSoZm1BBkotAJTIAezi6nKWSDOdNTMSvW4Q
	rsbq312x6Y9E6WVRJMwPDhEiIIZMsHYirz59diEQ0jVtoJKriKCSSYvZbGvR05kjZcNST7REUjz63
	pLgX+EH3bj5VNRQOYznUWCRfKmYI5VVwL4+CVri4lFTXgXnmTRez9k+5zEEYLGs8kUfehJlgoGHti
	rPuXuyyAxYOcymjr2U3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6xm-0000000F8Ei-2kYv;
	Thu, 05 Dec 2024 08:11:54 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6xk-0000000F8De-0wB6
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 08:11:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 803C6240002;
	Thu,  5 Dec 2024 08:11:47 +0000 (UTC)
Message-ID: <697a402b-0305-489d-bf4e-aa5e7fa4b2aa@ghiti.fr>
Date: Thu, 5 Dec 2024 09:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: selftests: Fix warnings pointer masking test
Content-Language: en-US
To: Charlie Jenkins <charlie@rivosinc.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
References: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_001152_389292_8AD85EC7 
X-CRM114-Status: GOOD (  16.74  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQ2hhcmxpZSwKCk9uIDA1LzEyLzIwMjQgMDM6NTcsIENoYXJsaWUgSmVua2lucyB3cm90ZToK
PiBXaGVuIGNvbXBpbGluZyB0aGUgcG9pbnRlciBtYXNraW5nIHRlc3RzIHdpdGggLVdhbGwgdGhp
cyB3YXJuaW5nCj4gaXMgcHJlc2VudDoKPgo+IHBvaW50ZXJfbWFza2luZy5jOiBJbiBmdW5jdGlv
biDigJh0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGzigJk6Cj4gcG9pbnRlcl9tYXNraW5nLmM6
MjAzOjk6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3JpdGXigJkKPiBk
ZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSDigJh3YXJuX3VudXNlZF9yZXN1bHTigJkgWy1XdW51c2Vk
LXJlc3VsdF0KPiAgICAyMDMgfCAgICAgICAgIHB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsgfAo+
ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4gcG9pbnRlcl9tYXNraW5nLmM6MjA4Ojk6
IHdhcm5pbmc6Cj4gaWdub3JpbmcgcmV0dXJuIHZhbHVlIG9mIOKAmHB3cml0ZeKAmSBkZWNsYXJl
ZCB3aXRoIGF0dHJpYnV0ZQo+IOKAmHdhcm5fdW51c2VkX3Jlc3VsdOKAmSBbLVd1bnVzZWQtcmVz
dWx0XQo+ICAgIDIwOCB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+Cj4gSSBj
YW1lIGFjcm9zcyB0aGlzIG9uIHJpc2N2NjQtbGludXgtZ251LWdjYyAoVWJ1bnR1Cj4gMTEuNC4w
LTF1YnVudHUxfjIyLjA0KS4KPgo+IEZpeCB0aGlzIGJ5IGNoZWNraW5nIHRoYXQgdGhlIG51bWJl
ciBvZiBieXRlcyB3cml0dGVuIGVxdWFsIHRoZSBleHBlY3RlZAo+IG51bWJlciBvZiBieXRlcyB3
cml0dGVuLgo+Cj4gRml4ZXM6IDc0NzBiNWFmZDE1MCAoInJpc2N2OiBzZWxmdGVzdHM6IEFkZCBh
IHBvaW50ZXIgbWFza2luZyB0ZXN0IikKPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMg
PGNoYXJsaWVAcml2b3NpbmMuY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBJIGhhZCBy
ZXQgIT0gMiBmb3IgdGVzdGluZywgSSBjaGFuZ2VkIGl0IHRvIGJlIHJldCAhPSAxLgo+IC0gTGlu
ayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MTIwNC1maXhfd2FybmluZ3Nf
cG9pbnRlcl9tYXNraW5nX3Rlc3RzLXYxLTEtZWExZTk2NjVjZTdhQHJpdm9zaW5jLmNvbQo+IC0t
LQo+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5j
IHwgMTkgKysrKysrKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jCj4gaW5kZXggZGVlNDFiN2VlM2UzLi4yMjlk
ODVjY2ZmNTAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJp
L3BvaW50ZXJfbWFza2luZy5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3Yv
YWJpL3BvaW50ZXJfbWFza2luZy5jCj4gQEAgLTE4OSw2ICsxODksNyBAQCBzdGF0aWMgdm9pZCB0
ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKPiAgIHsKPiAgIAljaGFyIHZhbHVlOwo+
ICAgCWludCBmZDsKPiArCWludCByZXQ7Cj4gICAKPiAgIAlrc2Z0X3ByaW50X21zZygiVGVzdGlu
ZyB0YWdnZWQgYWRkcmVzcyBBQkkgc3lzY3RsXG4iKTsKPiAgIAo+IEBAIC0yMDAsMTQgKzIwMSwy
NCBAQCBzdGF0aWMgdm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKPiAgIAl9
Cj4gICAKPiAgIAl2YWx1ZSA9ICcxJzsKPiAtCXB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiAr
CXJldCA9IHB3cml0ZShmZCwgJnZhbHVlLCAxLCAwKTsKPiArCWlmIChyZXQgIT0gMSkgewo+ICsJ
CWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiV3JpdGUgdG8gL3Byb2Mvc3lzL2FiaS90YWdnZWRfYWRk
cl9kaXNhYmxlZCBmYWlsZWQuXG4iKTsKPiArCQlyZXR1cm47Cj4gKwl9Cj4gKwo+ICAgCWtzZnRf
dGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0cnVlKSA9PSAtRUlO
VkFMLAo+ICAgCQkJICJzeXNjdGwgZGlzYWJsZWRcbiIpOwo+ICAgCj4gICAJdmFsdWUgPSAnMCc7
Cj4gLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gLQlrc2Z0X3Rlc3RfcmVzdWx0KHNldF90
YWdnZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gMCwKPiAtCQkJICJzeXNjdGwgZW5h
YmxlZFxuIik7Cj4gKwlyZXQgPSBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4gKwlpZiAocmV0
ICE9IDEpIHsKPiArCQlrc2Z0X3Rlc3RfcmVzdWx0X2ZhaWwoIldyaXRlIHRvIC9wcm9jL3N5cy9h
YmkvdGFnZ2VkX2FkZHJfZGlzYWJsZWQgZmFpbGVkLlxuIik7Cj4gKwkJcmV0dXJuOwo+ICsJfQo+
ICsKPiArCWtzZnRfdGVzdF9yZXN1bHQoc2V0X3RhZ2dlZF9hZGRyX2N0cmwobWluX3BtbGVuLCB0
cnVlKSA9PSAtRUlOVkFMLAo+ICsJCQkgInN5c2N0bCBkaXNhYmxlZFxuIik7CgpXaHkgZGlkIHlv
dSBjaGFuZ2UgdGhlIHRlc3QgZnJvbSAwIHRvIC1FSU5WQUwgaGVyZT8KClRoYW5rcywKCkFsZXgK
Cgo+ICAgCj4gICAJc2V0X3RhZ2dlZF9hZGRyX2N0cmwoMCwgZmFsc2UpOwo+ICAgCj4KPiAtLS0K
PiBiYXNlLWNvbW1pdDogNDAzODRjODQwZWExOTQ0ZDdjNWEzOTJlODk3NWVkMDg4ZWNmMGIzNwo+
IGNoYW5nZS1pZDogMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy0z
ODYwZTRmMzU0MjkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
