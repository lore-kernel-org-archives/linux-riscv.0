Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF715E7716C
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 12:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fu9JvQdNFl0TyYaKmgXfQQ6mYMbPHf8lAXQHOTYK8ck=; b=lY56DLmb0cIIyS
	2eP1NqqG4sYHXYdKtFXJy5XLSnAcIy2/kBrTWY1eQDcVJMwKkujpdfZejnx4FGJk7rYx91gddX/EX
	3pLmQVDHnrDHCKyAJMkZWRYTVr6Gw6OlcG1mNYUz8WwpKu4o3AVKvx6POIrrlcr4zVvhDhJct6oqQ
	L0TZrnBA2ruJEtW1IEjYxVl1tAZA+sZIcF1bfehNfVP/BGhYk04qkj1EZFtdw8NwfdCXSqYYWzjEB
	d4HOGhFtfmlBudhanx5Kf3IOKdojxaJTdIjYN8pDWQPYNbbH4/pltYHUC53ejRS8AsMe1MXEQN+he
	O4ep4vAwUOpIpu67IZew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAyj-0000000FxDh-3j3I;
	Thu, 05 Dec 2024 12:29:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9pO-0000000Fg5a-2SWm
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Dec 2024 11:15:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eHsIGtukZUVr6OBAUjeBp+IDFt8BX0ZJ5sWCQoNZyIw=; b=X/crx4GJKoGo7vGEcfYQQPpZSq
	SLHXKkvnPnqnXCxR6RUr/GekHTeUm3inlORgU9Hg33yC6DuyFAlf1FMbUioNupWVbvQPTkkC11v4n
	pXscj4VWI+6e4Pcn3rYzvwlOx0qp+6LE2ax0ARVSaa/iH8l4tYEqbIryrQdcC4nkrp4XMdU9k7Eo2
	GYwzXYDmilkpEEji0lGqL8lhKaqXRZRLgsMs2mdtLlKienvnu5GtsP5wp9gM+Hp3gQWh2LUJUNCC3
	sFuTYvisCFCrZ0fCWrp7lPkT9Namo0mLUELdWujMrNlY4KO/819g5yYdtcEGObXL57/49TupHtKTm
	8JPMDPNg==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9pK-00000002rMr-33TU
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 11:15:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29852FF80C;
	Thu,  5 Dec 2024 11:15:16 +0000 (UTC)
Message-ID: <14125726-bb00-4de4-87f6-6655b0ffae58@ghiti.fr>
Date: Thu, 5 Dec 2024 12:15:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: selftests: Fix warnings pointer masking test
Content-Language: en-US
To: Andrew Jones <ajones@ventanamicro.com>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Samuel Holland <samuel.holland@sifive.com>, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <20241204-fix_warnings_pointer_masking_tests-v2-1-1bf0c5095f58@rivosinc.com>
 <20241205-45c00adab2636bf26ce05f70@orel>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241205-45c00adab2636bf26ce05f70@orel>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_111522_867564_BEB61DCF 
X-CRM114-Status: GOOD (  21.04  )
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

SGkgRHJldywKCk9uIDA1LzEyLzIwMjQgMDk6MDQsIEFuZHJldyBKb25lcyB3cm90ZToKPiBPbiBX
ZWQsIERlYyAwNCwgMjAyNCBhdCAwNjo1NzoxMFBNIC0wODAwLCBDaGFybGllIEplbmtpbnMgd3Jv
dGU6Cj4+IFdoZW4gY29tcGlsaW5nIHRoZSBwb2ludGVyIG1hc2tpbmcgdGVzdHMgd2l0aCAtV2Fs
bCB0aGlzIHdhcm5pbmcKPj4gaXMgcHJlc2VudDoKPj4KPj4gcG9pbnRlcl9tYXNraW5nLmM6IElu
IGZ1bmN0aW9uIOKAmHRlc3RfdGFnZ2VkX2FkZHJfYWJpX3N5c2N0bOKAmToKPj4gcG9pbnRlcl9t
YXNraW5nLmM6MjAzOjk6IHdhcm5pbmc6IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3Jp
dGXigJkKPj4gZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZ
IFstV3VudXNlZC1yZXN1bHRdCj4+ICAgIDIwMyB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUs
IDEsIDApOyB8Cj4+ICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4gcG9pbnRlcl9tYXNr
aW5nLmM6MjA4Ojk6IHdhcm5pbmc6Cj4+IGlnbm9yaW5nIHJldHVybiB2YWx1ZSBvZiDigJhwd3Jp
dGXigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUKPj4g4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZ
IFstV3VudXNlZC1yZXN1bHRdCj4+ICAgIDIwOCB8ICAgICAgICAgcHdyaXRlKGZkLCAmdmFsdWUs
IDEsIDApOwo+Pgo+PiBJIGNhbWUgYWNyb3NzIHRoaXMgb24gcmlzY3Y2NC1saW51eC1nbnUtZ2Nj
IChVYnVudHUKPj4gMTEuNC4wLTF1YnVudHUxfjIyLjA0KS4KPj4KPj4gRml4IHRoaXMgYnkgY2hl
Y2tpbmcgdGhhdCB0aGUgbnVtYmVyIG9mIGJ5dGVzIHdyaXR0ZW4gZXF1YWwgdGhlIGV4cGVjdGVk
Cj4+IG51bWJlciBvZiBieXRlcyB3cml0dGVuLgo+Pgo+PiBGaXhlczogNzQ3MGI1YWZkMTUwICgi
cmlzY3Y6IHNlbGZ0ZXN0czogQWRkIGEgcG9pbnRlciBtYXNraW5nIHRlc3QiKQo+PiBTaWduZWQt
b2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgo+PiAtLS0KPj4g
Q2hhbmdlcyBpbiB2MjoKPj4gLSBJIGhhZCByZXQgIT0gMiBmb3IgdGVzdGluZywgSSBjaGFuZ2Vk
IGl0IHRvIGJlIHJldCAhPSAxLgo+PiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJfbWFza2luZ190ZXN0cy12MS0xLWVh
MWU5NjY1Y2U3YUByaXZvc2luYy5jb20KPj4gLS0tCj4+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5jIHwgMTkgKysrKysrKysrKysrKysrLS0tLQo+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJf
bWFza2luZy5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFz
a2luZy5jCj4+IGluZGV4IGRlZTQxYjdlZTNlMy4uMjI5ZDg1Y2NmZjUwIDEwMDY0NAo+PiAtLS0g
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yaXNjdi9hYmkvcG9pbnRlcl9tYXNraW5nLmMKPj4g
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcmlzY3YvYWJpL3BvaW50ZXJfbWFza2luZy5j
Cj4+IEBAIC0xODksNiArMTg5LDcgQEAgc3RhdGljIHZvaWQgdGVzdF90YWdnZWRfYWRkcl9hYmlf
c3lzY3RsKHZvaWQpCj4+ICAgewo+PiAgIAljaGFyIHZhbHVlOwo+PiAgIAlpbnQgZmQ7Cj4+ICsJ
aW50IHJldDsKPj4gICAKPj4gICAJa3NmdF9wcmludF9tc2coIlRlc3RpbmcgdGFnZ2VkIGFkZHJl
c3MgQUJJIHN5c2N0bFxuIik7Cj4+ICAgCj4+IEBAIC0yMDAsMTQgKzIwMSwyNCBAQCBzdGF0aWMg
dm9pZCB0ZXN0X3RhZ2dlZF9hZGRyX2FiaV9zeXNjdGwodm9pZCkKPj4gICAJfQo+PiAgIAo+PiAg
IAl2YWx1ZSA9ICcxJzsKPj4gLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4+ICsJcmV0ID0g
cHdyaXRlKGZkLCAmdmFsdWUsIDEsIDApOwo+PiArCWlmIChyZXQgIT0gMSkgewo+PiArCQlrc2Z0
X3Rlc3RfcmVzdWx0X2ZhaWwoIldyaXRlIHRvIC9wcm9jL3N5cy9hYmkvdGFnZ2VkX2FkZHJfZGlz
YWJsZWQgZmFpbGVkLlxuIik7Cj4+ICsJCXJldHVybjsKPj4gKwl9Cj4+ICsKPj4gICAJa3NmdF90
ZXN0X3Jlc3VsdChzZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IC1FSU5W
QUwsCj4+ICAgCQkJICJzeXNjdGwgZGlzYWJsZWRcbiIpOwo+PiAgIAo+PiAgIAl2YWx1ZSA9ICcw
JzsKPj4gLQlwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4+IC0Ja3NmdF90ZXN0X3Jlc3VsdChz
ZXRfdGFnZ2VkX2FkZHJfY3RybChtaW5fcG1sZW4sIHRydWUpID09IDAsCj4+IC0JCQkgInN5c2N0
bCBlbmFibGVkXG4iKTsKPj4gKwlyZXQgPSBwd3JpdGUoZmQsICZ2YWx1ZSwgMSwgMCk7Cj4+ICsJ
aWYgKHJldCAhPSAxKSB7Cj4+ICsJCWtzZnRfdGVzdF9yZXN1bHRfZmFpbCgiV3JpdGUgdG8gL3By
b2Mvc3lzL2FiaS90YWdnZWRfYWRkcl9kaXNhYmxlZCBmYWlsZWQuXG4iKTsKPj4gKwkJcmV0dXJu
Owo+PiArCX0KPiBDb3VsZCBtYWtlIGEgd3JhcHBlciBmdW5jdGlvbiBmb3IgcHdyaXRlKCkgdG8g
YXZvaWQgZHVwbGljYXRpbmcgdGhlIHJldAo+IHZhbHVlIGNoZWNrLgo+Cj4+ICsKPj4gKwlrc2Z0
X3Rlc3RfcmVzdWx0KHNldF90YWdnZWRfYWRkcl9jdHJsKG1pbl9wbWxlbiwgdHJ1ZSkgPT0gLUVJ
TlZBTCwKPj4gKwkJCSAic3lzY3RsIGRpc2FibGVkXG4iKTsKPiBXaHkgaXMgdGhpcyBjaGFuZ2Vk
IGZyb20gZXhwZWN0aW5nIDAgZm9yIHRoZSByZXR1cm4gYW5kIGJlaW5nIHRoZQo+ICJzeXNjdHJs
IGVuYWJsZWQiIHRlc3Q/IFdlIHN0aWxsIHdyaXRlICcwJyB0byB0YWdnZWRfYWRkcl9kaXNhYmxl
ZCBoZXJlLgo+Cj4+ICAgCj4+ICAgCXNldF90YWdnZWRfYWRkcl9jdHJsKDAsIGZhbHNlKTsKPj4g
ICAKPj4KPj4gLS0tCj4+IGJhc2UtY29tbWl0OiA0MDM4NGM4NDBlYTE5NDRkN2M1YTM5MmU4OTc1
ZWQwODhlY2YwYjM3Cj4+IGNoYW5nZS1pZDogMjAyNDEyMDQtZml4X3dhcm5pbmdzX3BvaW50ZXJf
bWFza2luZ190ZXN0cy0zODYwZTRmMzU0MjkKPj4gLS0gCj4+IC0gQ2hhcmxpZQo+Pgo+IE5vdCBw
YXJ0IG9mIHRoaXMgcGF0Y2gsIGJ1dCBub3cgdGhhdCBJIGxvb2tlZCBhdAo+IHRlc3RfdGFnZ2Vk
X2FkZHJfYWJpX3N5c2N0bCgpIEkgc2VlIHRoYXQKPiBrc2Z0X3Rlc3RfcmVzdWx0X3NraXAoKSBp
cyBkdXBsaWNhdGVkLgo+Cj4gVGhhbmtzLAo+IGRyZXcKCgpZb3VyIG1haWxzIG9mdGVuIGVuZCB1
cCBpbiBteSBqdW5rIGZvbGRlciwgYW0gSSB0aGUgb25seSBvbmU/IEFueSBpZGVhIAp3aGF0IGNv
dWxkIGJlIHdyb25nPwoKVGhhbmtzLAoKQWxleAoKCj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBs
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
