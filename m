Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBD3C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jun 2022 12:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OU8dYO+JFqxOQfI5QuxZ/rqGlgHky3pMWZH2vBSisho=; b=gFi/EW9c/3c1Ea
	0wE7kmcJ6YNxJgsRu1G6yzlG+zbOOhOIEnl5hTnTw5VubiOufrlKxMkbld+qU1JkAt3DackniolQh
	PF5wn6mYMWmK8+YCI1N+sc46ZXG2z04z+asU1ff3wIuBasbdlaqhcc6FuPCkxrBChCKX2ANna6V/1
	gTEh+XrAB+CzNU52WFOIzZx73qDfe1Zmw23yZx2lywRKtUzlIkCks9mjTdQdmOnlECCGFB9y9C2up
	+uzgrleQgQHyfkL5feqTvM3yhxmCOBfF2LdzwPv6mMFEpS20le9BMd0EDF/JnMJnvW5Fy7O6Ke1jF
	fCizrF4ouNr8wuZ3RFWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdY9-0088Fb-L0; Fri, 10 Jun 2022 12:15:37 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdXy-0088BS-CM; Fri, 10 Jun 2022 12:15:28 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LKKcR3XT9zgYbl;
	Fri, 10 Jun 2022 20:13:27 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 20:15:19 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 10 Jun 2022 20:15:17 +0800
Message-ID: <70bd99eb-a05d-adb0-5cb8-84dcc66b674e@huawei.com>
Date: Fri, 10 Jun 2022 20:15:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 6/6] efi: Disable mirror feature if kernelcore is not
 specified
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, Wupeng Ma <mawupeng1@huawei.com>
CC: Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, "Catalin
 Marinas" <catalin.marinas@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
	"Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko
	<andy@infradead.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <keescook@chromium.org>,
	<songmuchun@bytedance.com>, Randy Dunlap <rdunlap@infradead.org>,
	<damien.lemoal@opensource.wdc.com>, Stephen Boyd <swboyd@chromium.org>,
	<wei.liu@kernel.org>, <robin.murphy@arm.com>, <david@redhat.com>,
	<anshuman.khandual@arm.com>, <thunder.leizhen@huawei.com>,
	<gpiccoli@igalia.com>, <chenhuacai@kernel.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, <chenzhou10@huawei.com>,
	<vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-7-mawupeng1@huawei.com>
 <CAMj1kXGMHn_jsMe2WxWZ-s_QV==1tc5k=xpbNXuDbGp0qF534w@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAMj1kXGMHn_jsMe2WxWZ-s_QV==1tc5k=xpbNXuDbGp0qF534w@mail.gmail.com>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_051526_801046_D1A64BA7 
X-CRM114-Status: GOOD (  19.89  )
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

Ck9uIDIwMjIvNi8xMCAxOToyMCwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gT24gVHVlLCA3IEp1
biAyMDIyIGF0IDExOjE2LCBXdXBlbmcgTWEgPG1hd3VwZW5nMUBodWF3ZWkuY29tPiB3cm90ZToK
Pj4gRnJvbTogTWEgV3VwZW5nIDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4KPj4KPj4gSWYgc3lzdGVt
IGhhdmUgc29tZSBtaXJyb3JlZCBtZW1vcnkgYW5kIG1pcnJvcmVkIGZlYXR1cmUgaXMgbm90IHNw
ZWNpZmllZAo+PiBpbiBib290IHBhcmFtZXRlciwgdGhlIGJhc2ljIG1pcnJvcmVkIGZlYXR1cmUg
d2lsbCBiZSBlbmFibGVkIGFuZCB0aGlzIHdpbGwKPj4gbGVhZCB0byB0aGUgZm9sbG93aW5nIHNp
dHVhdGlvbnM6Cj4+Cj4+IC0gbWVtYmxvY2sgbWVtb3J5IGFsbG9jYXRpb24gcHJlZmVycyBtaXJy
b3JlZCByZWdpb24uIFRoaXMgbWF5IGhhdmUgc29tZQo+PiAgICB1bmV4cGVjdGVkIGluZmx1ZW5j
ZSBvbiBudW1hIGFmZmluaXR5Lgo+Pgo+PiAtIGNvbnRpZ3VvdXMgbWVtb3J5IHdpbGwgYmUgc3Bs
aXQgaW50byBzZXZlcmFsIHBhcnRzIGlmIHBhcnRzIG9mIHRoZW0KPj4gICAgaXMgbWlycm9yZWQg
bWVtb3J5IHZpYSBtZW1ibG9ja19tYXJrX21pcnJvcigpLgo+Pgo+PiBUbyBmaXggdGhpcywgdmFy
aWFibGUgbWlycm9yZWRfa2VybmVsY29yZSB3aWxsIGJlIGNoZWNrZWQgYmVmb3JlIGNhbGxpbmcK
Pj4gZWZpX2ZpbmRfbWlycm9yKCkgd2hpY2ggd2lsbCBlbmFibGUgYmFzaWMgbWlycm9yZWQgZmVh
dHVyZSBhbmQgdGhpcwo+PiB2YXJpYWJsZSBpcyB0cnVlIGlmIGtlcm5lbGNvcmU9bWlycm9yIGlz
IGFkZGVkIGluIHRoZSBrZXJuZWwgcGFyYW1ldGVycy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWEg
V3VwZW5nIDxtYXd1cGVuZzFAaHVhd2VpLmNvbT4KPiBUaGlzIHNlZW1zIGxpa2UgdGhlIHdyb25n
IHBsYWNlIHRvIGRvIHRoaXMuIElmIG1pcnJvcmVkIG1lbW9yeSBpcwo+IGlycmVsZXZhbnQgdG8g
bWVtYmxvY2ssIGl0IHNob3VsZCBpZ25vcmUgdGhlIGF0dHJpYnV0ZS4gU28gSSB0aGluawo+IHRo
aXMgY2hlY2sgYmVsb25ncyBpbiBtbS9tZW1ibG9jay5jIGluc3RlYWQuCgpTb3VuZCBnb29kLMKg
IGxldCdzIGFkZCBjaGVjayBpbnRvIG1lbWJsb2NrX21hcmtfbWlycm9yKCkgYW5kIHJldGFpbgoK
dGhlIGVmaSBtZW1vcnkgbWlycm9yIGluZm9ybWF0aW9uIHByaW50aW5nLgoKPgo+Cj4+IC0tLQo+
PiAgIGRyaXZlcnMvZmlybXdhcmUvZWZpL2VmaS5jIHwgMyArKysKPj4gICBpbmNsdWRlL2xpbnV4
L21tLmggICAgICAgICB8IDIgKysKPj4gICBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAgICB8IDIg
Ky0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJtd2FyZS9lZmkvZWZpLmMgYi9kcml2ZXJzL2Zp
cm13YXJlL2VmaS9lZmkuYwo+PiBpbmRleCA3OWMyMzJlMDdkZTcuLjhhNWVkY2IwZGQ4MiAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9maXJtd2FyZS9lZmkvZWZpLmMKPj4gKysrIGIvZHJpdmVycy9m
aXJtd2FyZS9lZmkvZWZpLmMKPj4gQEAgLTQ1NCw2ICs0NTQsOSBAQCB2b2lkIF9faW5pdCBlZmlf
ZmluZF9taXJyb3Iodm9pZCkKPj4gICAgICAgICAgaWYgKCFlZmlfZW5hYmxlZChFRklfTUVNTUFQ
KSkKPj4gICAgICAgICAgICAgICAgICByZXR1cm47Cj4+Cj4+ICsgICAgICAgaWYgKCFtaXJyb3Jl
ZF9rZXJuZWxjb3JlKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuOwo+PiArCj4+ICAgICAgICAg
IGZvcl9lYWNoX2VmaV9tZW1vcnlfZGVzYyhtZCkgewo+PiAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGxvbmcgbG9uZyBzdGFydCA9IG1kLT5waHlzX2FkZHI7Cj4+ICAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBsb25nIHNpemUgPSBtZC0+bnVtX3BhZ2VzIDw8IEVGSV9QQUdFX1NISUZU
Owo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5o
Cj4+IGluZGV4IGJjOGYzMjZiZTBjZS4uNzQxYWM3ZDAyMmMzIDEwMDY0NAo+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L21tLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9tbS5oCj4+IEBAIC0yNTQwLDYg
KzI1NDAsOCBAQCBleHRlcm4gdm9pZCBnZXRfcGZuX3JhbmdlX2Zvcl9uaWQodW5zaWduZWQgaW50
IG5pZCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnN0YXJ0X3Bm
biwgdW5zaWduZWQgbG9uZyAqZW5kX3Bmbik7Cj4+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgZmlu
ZF9taW5fcGZuX3dpdGhfYWN0aXZlX3JlZ2lvbnModm9pZCk7Cj4+Cj4+ICtleHRlcm4gYm9vbCBt
aXJyb3JlZF9rZXJuZWxjb3JlOwo+PiArCj4+ICAgI2lmbmRlZiBDT05GSUdfTlVNQQo+PiAgIHN0
YXRpYyBpbmxpbmUgaW50IGVhcmx5X3Bmbl90b19uaWQodW5zaWduZWQgbG9uZyBwZm4pCj4+ICAg
ewo+PiBkaWZmIC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4+IGlu
ZGV4IGUwMDhhM2RmMDQ4NS4uY2Y2ZjcwYWJhNzg3IDEwMDY0NAo+PiAtLS0gYS9tbS9wYWdlX2Fs
bG9jLmMKPj4gKysrIGIvbW0vcGFnZV9hbGxvYy5jCj4+IEBAIC0zNTYsNyArMzU2LDcgQEAgc3Rh
dGljIHVuc2lnbmVkIGxvbmcgcmVxdWlyZWRfa2VybmVsY29yZV9wZXJjZW50IF9faW5pdGRhdGE7
Cj4+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgcmVxdWlyZWRfbW92YWJsZWNvcmUgX19pbml0ZGF0
YTsKPj4gICBzdGF0aWMgdW5zaWduZWQgbG9uZyByZXF1aXJlZF9tb3ZhYmxlY29yZV9wZXJjZW50
IF9faW5pdGRhdGE7Cj4+ICAgc3RhdGljIHVuc2lnbmVkIGxvbmcgem9uZV9tb3ZhYmxlX3BmbltN
QVhfTlVNTk9ERVNdIF9faW5pdGRhdGE7Cj4+IC1zdGF0aWMgYm9vbCBtaXJyb3JlZF9rZXJuZWxj
b3JlIF9fbWVtaW5pdGRhdGE7Cj4+ICtib29sIG1pcnJvcmVkX2tlcm5lbGNvcmUgX19tZW1pbml0
ZGF0YTsKPj4KPj4gICAvKiBtb3ZhYmxlX3pvbmUgaXMgdGhlICJyZWFsIiB6b25lIHBhZ2VzIGlu
IFpPTkVfTU9WQUJMRSBhcmUgdGFrZW4gZnJvbSAqLwo+PiAgIGludCBtb3ZhYmxlX3pvbmU7Cj4+
IC0tCj4+IDIuMjUuMQo+Pgo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
