Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45AFFECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 01:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IW0WiUkLMrdAhPfJtTz+cnAUBPXwQ70fV0zaPWsI72I=; b=mz99tP0aFyxDIS
	exDjG0W16fCvCzmW2/LR7q0wiiXe29xUSLgWQp0/MfN0N+qI91ymTNOCVq/MZc+3dmd5dSNwMWzSq
	hZZQd63g+4fx2OyFj9HYv+rFVnucVUMK4rZnuidScSYuAmp6v9bPOQ+38q1Yrh2hgSc7G1jxYNK/k
	63xLkv7dgob0Y5HsIa+0RwVedcwNpocjig1oiIZDbc7EdtNXDUknv3TZpJ05nQgLo96O5ZQMH3Iau
	AHYI2E9eTTyr1EUOk8mfo9/utA5TTVRVQu3LuIOMWTs4eKWrWUAPz+Cm65OQ04IOHqIHc9x2YFfCn
	3USrp/SjhkKm33Elq5bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWTEm-00Av5D-EV; Fri, 09 Sep 2022 01:55:20 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWTEi-00Auwe-JB
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 01:55:19 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MNzVZ5GGbzlVqy;
	Fri,  9 Sep 2022 09:51:18 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 9 Sep 2022 09:55:09 +0800
Message-ID: <50a65f24-08b7-ab36-5e25-b6a90f90a9d8@huawei.com>
Date: Fri, 9 Sep 2022 09:55:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] riscv/kprobe: Optimize the performance of patching
 instruction slot
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: Jisheng Zhang <jszhang@kernel.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <rostedt@goodmis.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20220907023327.85630-1-liaochang1@huawei.com>
 <YxjTF2FlIJbbKq0p@xhacker> <a00328a1-47ee-3700-8cd8-1a9f4e0d7a2b@huawei.com>
 <20220908214958.c8139533dccad1ee8f927214@kernel.org>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <20220908214958.c8139533dccad1ee8f927214@kernel.org>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_185516_991273_F03D8DDA 
X-CRM114-Status: GOOD (  14.92  )
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

CgrlnKggMjAyMi85LzggMjA6NDksIE1hc2FtaSBIaXJhbWF0c3UgKEdvb2dsZSkg5YaZ6YGTOgo+
IE9uIFRodSwgOCBTZXAgMjAyMiAwOTo0Mzo0NSArMDgwMAo+ICJsaWFvY2hhbmcgKEEpIiA8bGlh
b2NoYW5nMUBodWF3ZWkuY29tPiB3cm90ZToKPiAKPj4gVGhhbmtzIGZvciBjb21tZW50Lgo+Pgo+
PiDlnKggMjAyMi85LzggMToyMSwgSmlzaGVuZyBaaGFuZyDlhpnpgZM6Cj4+PiBPbiBXZWQsIFNl
cCAwNywgMjAyMiBhdCAxMDozMzoyN0FNICswODAwLCBMaWFvIENoYW5nIHdyb3RlOgo+Pj4+IFNp
bmNlIG5vIHJhY2UgY29uZGl0aW9uIG9jY3VycyBvbiBlYWNoIGluc3RydWN0aW9uIHNsb3QsIGhl
bmNlIGl0IGlzCj4+Pj4gc2FmZSB0byBwYXRjaCBpbnN0cnVjdGlvbiBzbG90IHdpdGhvdXQgc3Rv
cHBpbmcgbWFjaGluZS4KPj4+Cj4+PiBobW0sIElNSE8gdGhlcmUncyByYWNlIHdoZW4gYXJtaW5n
IGtwcm9iZSB1bmRlciBTTVAsIHNvIHN0b3BwaW5nCj4+PiBtYWNoaW5lIGlzIG5lY2Vzc2FyeSBo
ZXJlLiBNYXliZSBJIG1pc3VuZGVydGFuZCBzb21ldGhpbmcuCj4+Pgo+Pgo+PiBJdCBpcyBpbmRl
ZWQgbmVjZXNzYXJ5IHRvIHN0b3AgbWFjaGluZSB3aGVuIGFybSBrcHJvYmUgdW5kZXIgU01QLAo+
PiBidXQgaSBkb24ndCB0aGluayBpdCBuZWVkIHRvIHN0b3AgbWFjaGluZSB3aGVuIHByZXBhcmUg
aW5zdHJ1Y3Rpb24gc2xvdCwKPj4gdHdvIHJlYXNvbnM6Cj4+Cj4+IDEuIEluc3RydWN0aW9uIHNs
b3QgaXMgZHluYW1pY2FsbHkgYWxsb2NhdGVkIGRhdGEuCj4+IDIuIEtlcm5lbCB3b3VsZCBub3Qg
ZXhlY3V0ZSBpbnN0cnVjdGlvbiBzbG90IHVudGlsIG9yaWdpbmFsIGluc3RydWN0aW9uCj4+ICAg
IGlzIHJlcGxhY2VkIGJ5IGJyZWFrcG9pbnQuCj4gCj4gQWgsIHRoaXMgaXMgZm9yIHNzIChzaW5n
bGUgc3RlcCBvdXQgb2YgbGluZSkgc2xvdC4gU28gdW50aWwKPiBrcHJvYmUgaXMgZW5hYmxlZCwg
dGhpcyBzaG91bGQgbm90IGJlIHVzZWQgZnJvbSBvdGhlciBjb3Jlcy4KPiBPSywgdGhlbiBpdCBz
aG91bGQgYmUgc2FmZS4KCkV4YWN0bHksIE1hc2FtaSwgYW5kIGkgZmluZCBvdXQgdGhpcyBvcHRp
bWl6YXRpb24gY291bGQgYmUgYXBwbGllZCB0byBzb21lIG90aGVyCmFyY2hpdGVjdHVyZXMsIHN1
Y2ggYXMgYXJtNjQgYW5kIGNza3ksIGRvIHlvdSB0aGluayBpdCBpcyBnb29kIHRpbWUgdG8gZG8g
dGhlbSBhbGwuCgpUaGFua3MuCgo+IAo+IAo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogTGlhbyBD
aGFuZyA8bGlhb2NoYW5nMUBodWF3ZWkuY29tPgo+Pj4+IC0tLQo+Pj4+ICBhcmNoL3Jpc2N2L2tl
cm5lbC9wcm9iZXMva3Byb2Jlcy5jIHwgOCArKysrKy0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMva3Byb2Jlcy5jCj4+Pj4gaW5kZXggZTZlOTUwYjdjZjMyLi5lZmY3ZDdmYWI1MzUgMTAwNjQ0
Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+Pj4+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPj4+PiBAQCAtMjQsMTIgKzI0LDE0
IEBAIHBvc3Rfa3Byb2JlX2hhbmRsZXIoc3RydWN0IGtwcm9iZSAqLCBzdHJ1Y3Qga3Byb2JlX2N0
bGJsayAqLCBzdHJ1Y3QgcHRfcmVncyAqKTsKPj4+PiAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFy
Y2hfcHJlcGFyZV9zc19zbG90KHN0cnVjdCBrcHJvYmUgKnApCj4+Pj4gIHsKPj4+PiAgCXVuc2ln
bmVkIGxvbmcgb2Zmc2V0ID0gR0VUX0lOU05fTEVOR1RIKHAtPm9wY29kZSk7Cj4+Pj4gKwljb25z
dCBrcHJvYmVfb3Bjb2RlX3QgYnJrX2luc24gPSBfX0JVR19JTlNOXzMyOwo+Pj4+ICsJa3Byb2Jl
X29wY29kZV90IHNsb3RbTUFYX0lOU05fU0laRV07Cj4+Pj4gIAo+Pj4+ICAJcC0+YWluc24uYXBp
LnJlc3RvcmUgPSAodW5zaWduZWQgbG9uZylwLT5hZGRyICsgb2Zmc2V0Owo+Pj4+ICAKPj4+PiAt
CXBhdGNoX3RleHQocC0+YWluc24uYXBpLmluc24sIHAtPm9wY29kZSk7Cj4+Pj4gLQlwYXRjaF90
ZXh0KCh2b2lkICopKCh1bnNpZ25lZCBsb25nKShwLT5haW5zbi5hcGkuaW5zbikgKyBvZmZzZXQp
LAo+Pj4+IC0JCSAgIF9fQlVHX0lOU05fMzIpOwo+Pj4+ICsJbWVtY3B5KHNsb3QsICZwLT5vcGNv
ZGUsIG9mZnNldCk7Cj4+Pj4gKwltZW1jcHkoKHZvaWQgKikoKHVuc2lnbmVkIGxvbmcpc2xvdCAr
IG9mZnNldCksICZicmtfaW5zbiwgNCk7Cj4+Pj4gKwlwYXRjaF90ZXh0X25vc3luYyhwLT5haW5z
bi5hcGkuaW5zbiwgc2xvdCwgb2Zmc2V0ICsgNCk7Cj4gCj4gQlRXLCBkaWRuJ3QgeW91IGhhdmUg
YSBtYWNybyBmb3IgdGhlIHNpemUgb2YgX19CVUdfSU5TTl8zMj8KPiAKPiBUaGFuayB5b3UsCgpJ
IHRoaW5rIHlvdSBhcmUgc2F5aW5nIEdFVF9JTlNOX0xFTkdUSCwgaSB3aWxsIHVzZSBpdCB0byBj
YWN1bGF0ZQp0aGUgc2l6ZSBvZiBfX0JVR19JTlNOXzMyIGluIHYyLCBpbnN0ZWFkIG9mIG1hZ2lj
IG51bWJlciAnNCcuCgpUaGFua3MuCgo+IAo+IAo+Pj4+ICB9Cj4+Pj4gIAo+Pj4+ICBzdGF0aWMg
dm9pZCBfX2twcm9iZXMgYXJjaF9wcmVwYXJlX3NpbXVsYXRlKHN0cnVjdCBrcHJvYmUgKnApCj4+
Pj4gLS0gCj4+Pj4gMi4xNy4xCj4+Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+
Pj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKPj4+IC4KPj4KPj4gLS0gCj4+
IEJSLAo+PiBMaWFvLCBDaGFuZwo+IAo+IAoKLS0gCkJSLApMaWFvLCBDaGFuZwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
