Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ABAC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ql15hvZdNLKq17NjEOlm6XwLXm/161GHSXMQf8ugtH4=; b=dptyaGLmXDA193
	P0IB/DlrmRUsKhh/ho/r3ETfoWf23EY1D2ZAEB/RJb9a5QJ6RPpMvoRgRo1Yg8pR9zwrNv0hjsouz
	akVEVbu332tE+OHJxTo6TknnAqLrtVfXnvSVYu06gSD99DLOREiblph77XYzEc8aXCMxy34Lp7HmC
	P2Y2LpVIeRlzhtmL3vUVc/HRDOr2+4shI0CWB3y43+7uUrd++s5pItOGlDrtGdkRsIQDCCN36XhKy
	Nx1phu9xg6FcKDAzv3+UAOpNRJvnNamOgiR+OBvVnSTGlaIHCPaw9CPOWbSJkRP1IUI/AFmCTt2KN
	mO+axsD+0C+/4xOyrUWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjqms-00000003mwV-2Wkp;
	Tue, 12 Mar 2024 01:18:38 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjqmn-00000003mu0-3qCm
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 01:18:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Ttwkb6XP4z4f3jsb
	for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 09:18:15 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 8FE141A0199
	for <linux-riscv@lists.infradead.org>; Tue, 12 Mar 2024 09:18:21 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgA3955cre9laYFJGg--.31220S2;
	Tue, 12 Mar 2024 09:18:21 +0800 (CST)
Message-ID: <1133a3d8-a7a5-47f1-8768-682c3e502d7e@huaweicloud.com>
Date: Tue, 12 Mar 2024 09:18:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while
 not supported
Content-Language: en-US
To: Atish Patra <atishp@atishpatra.org>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 bpf@vger.kernel.org, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>
References: <20240305155223.1823287-1-pulehui@huaweicloud.com>
 <20240307-oat-mule-10441ef7e94a@spud>
 <f399749b-85bf-4aaf-8af6-ea735c5ab517@huaweicloud.com>
 <CAOnJCULGctBu6viW7PwpT30o2fZ=aApi6UaJKsB4qjMEaEQ2cg@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAOnJCULGctBu6viW7PwpT30o2fZ=aApi6UaJKsB4qjMEaEQ2cg@mail.gmail.com>
X-CM-TRANSID: _Ch0CgA3955cre9laYFJGg--.31220S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4kWw1fXryUGFW7AF1DZFb_yoW5Ww13pF
	48CFyFka15Jr1ayw1aqF1ktF1rt3s5K3s8XryDt34Uurs09F9rKFWkKayrC3W8Xr1xCry2
	vr1UKrW3Ca45AaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUgvb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUrR6zUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_181834_395048_D906C1C5 
X-CRM114-Status: GOOD (  24.95  )
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

CgpPbiAyMDI0LzMvOSAxNzowNiwgQXRpc2ggUGF0cmEgd3JvdGU6Cj4gT24gRnJpLCBNYXIgOCwg
MjAyNCBhdCAxMDo0OOKAr1BNIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3Jv
dGU6Cj4+Cj4+Cj4+Cj4+IE9uIDIwMjQvMy84IDE6NTIsIENvbm9yIERvb2xleSB3cm90ZToKPj4+
IE9uIFR1ZSwgTWFyIDA1LCAyMDI0IGF0IDAzOjUyOjIzUE0gKzAwMDAsIFB1IExlaHVpIHdyb3Rl
Ogo+Pj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4KPj4+PiBSSVND
LVYgcGVyZiBkb2VzIG5vdCB5ZXQgc3VwcG9ydCBicmFuY2ggc2FtcGxpbmcuIFR3byByaXNjdiBi
cGYKPj4+PiB0ZXN0Y2FzZXMgZ2V0X2JyYW5jaF9zbmFwc2hvdCBhbmQgcGVyZl9icmFuY2hlcy9w
ZXJmX2JyYW5jaGVzX2h3IGZhaWxlZAo+Pj4+IGR1ZSB0byBub3QgZGlzYWJsaW5nIHN1Y2ggc2Ft
cGxpbmcuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWku
Y29tPgo+Pj4KPj4+IFRoaXMgc2VlbXMgd29ydGh5IG9mIGEgZml4ZXMgdGFnLiBGb3Igd2hhdCBj
b21taXQgSSBkbyBub3Qga25vdywgYnV0IEkKPj4+IGZpZ3VyZSBpdCBpcyBhIHByb2JsZW0gY3Vy
cmVudGx5IGluIG1haW5saW5lIGFuZCBhIGZpeCBzaG91bGQgYmUKPj4+IGJhY2twb3J0ZWQ/Cj4+
Cj4+IFRoYW5rcyBmb3IgcmV2aWV3LiBXZSBuZWVkIHRvIGJhbiB0aGlzIHR5cGUgb2YgZXZlbnQs
IG90aGVyd2lzZSB3ZSB3aWxsCj4+IGdldCB1bnByZWRpY3RhYmxlIHJlc3VsdHMuIEl0IHNob3Vs
ZCBiZSB3aXRoIGEgZml4ZXMgdGFnLgo+Pgo+Pj4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL3Bl
cmYvcmlzY3ZfcG11LmMgfCA0ICsrKysKPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jIGIv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jCj4+Pj4gaW5kZXggYzc4YTZmZDZjNTdmLi5iYzQyY2I5
NWE5N2MgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jCj4+Pj4gKysr
IGIvZHJpdmVycy9wZXJmL3Jpc2N2X3BtdS5jCj4+Pj4gQEAgLTMxMyw2ICszMTMsMTAgQEAgc3Rh
dGljIGludCByaXNjdl9wbXVfZXZlbnRfaW5pdChzdHJ1Y3QgcGVyZl9ldmVudCAqZXZlbnQpCj4+
Pj4gICAgICAgdTY0IGV2ZW50X2NvbmZpZyA9IDA7Cj4+Pj4gICAgICAgdWludDY0X3QgY21hc2s7
Cj4+Pj4KPj4+PiArICAgIC8qIGRvZXMgbm90IHN1cHBvcnQgdGFrZW4gYnJhbmNoIHNhbXBsaW5n
ICovCj4+Pgo+Pj4gU2tpbW1pbmcgcGF0Y2h3b3JrLCBJIGZvdW5kIHRoaXMgY29tbWVudCBjb25m
dXNpbmcuCj4+PiBJc29sYXRlZCBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSwgd2hpY2ggaXQgd2ls
bCBiZSBvbmNlIGNvbW1pdHRlZCwgaXQKPj4+IHdhcyBub3QgaW1tZWRpYXRlbHkgY2xlYXIgdGhh
dCB5b3Ugd2VyZSByZWZlcnJpbmcgdG8gdGhlIGRyaXZlci4gSSB0aGluawo+Pj4gaXQgaXMganVz
dCBtYXR0ZXIgb2YgbWFraW5nIHRoaXMgYSBjb21wbGV0ZSBzZW50ZW5jZSB0aGF0IHN0YXJ0cyBi
eQo+Pj4gbWVudGlvbmluZyAvd2hhdC8gZG9lcyBub3Qgc3VwcG9ydCB0aGlzIGZlYXR1cmUuIElz
IGl0IHRoZSBkcml2ZXI/IERvZXMKPj4+IHRoZSBzcGVjIG5vdCBhbGxvdyBpdD8gZXRjCj4+Cj4+
IEkgYWN0dWFsbHkganVzdCBmb3VuZCBvdXQgdGhhdCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlv
biBvZiByaXNjdiBwZXJmCj4+IGRyaXZlciBkb2Vzbid0IHN1cHBvcnQgaXQuIEFmdGVyIHJlYWRp
bmcgdGhlIHJlbGV2YW50IHNwZWMsIEkgZGlkIG5vdAo+PiBmaW5kIGFueSBkZXNjcmlwdGlvbiBy
ZWxhdGVkIHRvIGJyYW5jaCByZWNvcmQuIE1heWJlIEkgbWF5IGhhdmUgbWlzc2VkCj4+IHNvbWV0
aGluZyBvciBpdCBtYXkgYmUgc3VwcG9ydGVkIGluIHRoZSBmdXR1cmUsIGJ1dCB0aGUgY3VycmVu
dCBkcml2ZXIKPj4gZG9lcyBub3Qgc3VwcG9ydCBpdCwgc28gSSB0aGluayBpdCBpcyBtb3JlIGFw
cHJvcHJpYXRlIHRvIGxpbWl0IHRoaXMKPiAKPiBZZXMuIFRoZXJlIHdhcyBubyBzcGVjaWZpY2F0
aW9uIGF0IHRoZSB0aW1lIHRoaXMgZHJpdmVyIHdhcyB1cHN0cmVhbWVkLgo+IFRoZSBzcGVjIGZv
ciBicmFuY2ggcmVjb3JkIGJlaW5nIGlzIG9uIGl0cyB3YXkgZm9yIHJhdGlmaWNhdGlvbiBhbmQg
cGF0Y2hlcwo+IHdpbGwgYmUgYXZhaWxhYmxlIHNvb24uCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jp
c2N2L3Jpc2N2LWNvbnRyb2wtdHJhbnNmZXItcmVjb3Jkcwo+IAo+IFRoZSBjaGFuZ2VzIGxvb2sg
Z29vZCB0byBtZSBmb3Igbm93LiBJIHdpbGwgYmUgaGFwcHkgdG8gc2VuZCBhIFJCIHRhZyBvbmNl
IHlvdQo+IGFkZCB0aGUgRml4ZXMgdGFnLgo+IAoKVGhhbmtzIGZvciB5b3VyIGFkZGl0aW9uLCBs
b29raW5nIGZvcndhcmQgdG8gdGhlIHVwY29taW5nIAppbXBsZW1lbnRhdGlvbi4gV2lsbCBzZW5k
IG5ldyB2ZXJzaW9uIHNvb24uCgo+PiBjb21tZW50IHRvIHRoZSBkcml2ZXIgaW1wbGVtZW50YXRp
b24uIEhvdyBhYm91dCAicmlzY3YgcGVyZiBkcml2ZXIgZG9lcwo+PiBub3Qgc3VwcG9ydCBicmFu
Y2ggc3RhY2sgc2FtcGxpbmciPwo+Pgo+Pj4KPj4+IENoZWVycywKPj4+IENvbm9yLgo+Pj4KPj4+
PiArICAgIGlmIChoYXNfYnJhbmNoX3N0YWNrKGV2ZW50KSkKPj4+PiArICAgICAgICAgICAgcmV0
dXJuIC1FT1BOT1RTVVBQOwo+Pj4+ICsKPj4+PiAgICAgICBod2MtPmZsYWdzID0gMDsKPj4+PiAg
ICAgICBtYXBwZWRfZXZlbnQgPSBydnBtdS0+ZXZlbnRfbWFwKGV2ZW50LCAmZXZlbnRfY29uZmln
KTsKPj4+PiAgICAgICBpZiAobWFwcGVkX2V2ZW50IDwgMCkgewo+Pj4+IC0tCj4+Pj4gMi4zNC4x
Cj4+Pj4KPj4KPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
