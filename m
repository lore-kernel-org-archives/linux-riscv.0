Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F1DC61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Feb 2023 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+puuVSyDJQs3c0BCeGzb9Dfdnb4ytsJ6KWwZrSj9daM=; b=TapFkyoLMhQiHF
	dDjpKXwqWS63+0F4BPyBrKufuPRuC+wV6kCN3kQs/v1L2efIJLa8mLgnttx5gsqZqIOrvHW0qs+LG
	zAIw+njeUIGytS+s5R9ZiD9XCsvwZ56RFEUEekozXId6NP3NX+HN70/VsTqYIaVUe9G3DNCNOUvje
	2Ah8QndcIbU1fZXtmeZeJ7Yc8g8rus/HZ9VcEcH1pUyppK1ho+O44ZLyApcPaDPFWZ6sCgHMzm1tq
	gpsZUMN3VCo5ieQ/GDGSJSA1P20sEnrAkJxyhBtm2ugetxZ07hCJmhRlusgIm9zLNB0mZ9QG4vCF6
	YFFwzYvJgP9oS4TfsCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTWVW-000LRX-7P; Sat, 18 Feb 2023 23:20:42 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTWVS-000LQW-Vw
	for linux-riscv@lists.infradead.org; Sat, 18 Feb 2023 23:20:40 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id BA9ED5C00E5;
	Sat, 18 Feb 2023 18:20:31 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 18 Feb 2023 18:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1676762431; x=
	1676848831; bh=tjtgdd+H5NnT69NzUOb8A7efXFAPqfaIKfbXt/lcGPE=; b=Y
	Rrod/xhp4OoYLBbuCCFWk3t3IOargZWAZ/ij0HLCSgPjKOkmQTxI+pfCKYyurQhN
	O6VN+jSwAq+UL1tij5OiXeW+kwFMblWXheuw0b3Ma3PoLLfaeN9YOEVilXUrAnfJ
	1PpUtNgWTg3H20MmRfe7WDTPhQhpTVMH1ERF3dBVvrG6IQNl8dD41wC83Jtn/AgC
	8K8LJRQjkktyyjShYQnqIlT/l7ZFyyvZCT/7lC/OCjhZHdnptUCcIAOHYLTFX2aB
	vKNpV4RjsJil86b/weY/pUUaanL8O9UqZ/eSP9Z89V1px88mSJFnY3QuT6+9Gutz
	nql4euIA0AW/U58c3qBsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676762431; x=
	1676848831; bh=tjtgdd+H5NnT69NzUOb8A7efXFAPqfaIKfbXt/lcGPE=; b=V
	uPX8jLqqAiJqFf2BrTrx3H1dQNmFG1a4CIiqBsHp1AFoWib/ik5Od8dVYoAP4ri8
	lPsTQDT6BxraxwWLa00mHdIxLwp91ScKjOI37PAR03tZI6p3naPfckjw2Y4HKvHq
	gTROygTxdgxk5Vp80ARl+99xlO/FxHXCR3ntw5CnRX4rKslyg9uV0ieJcUgWMYeD
	mb8uIPSrMp62tKtSUZC+6AEC6H9+Preqnasiy4SpF+bV9lmEAnrnSAx1I5O80awS
	oxTk+9z1UDnn3lWKuIQWlNUZMJa3cqBYrqfhWYkUkKgBgmZmJDdC5wRn2Ql/V9L3
	8+tF1OiLP36TjzjixDmHA==
X-ME-Sender: <xms:Pl3xY-9itOHN6oZiK113Wf1jGEIU222-TOnSCpjAE4dBrB-gSxAioA>
    <xme:Pl3xY-v1-uikDKQWyKTZJ8rmH9UwAQlr4Aqr4TqlUNRmVisr31zRMqTuiH6ddEDhb
    iVwKUCLq-YFPaCy-A>
X-ME-Received: <xmr:Pl3xY0Av0CFDwPx485PrvEJclTWkAYlFOiyBmLUmpfkuf7-aOgWRO1EN3wBetAhgfdMdTHCVFJBWuFjz2vBIWE4PVW3TwFNaO836urvZ25hbVG_4I1QBgUwFPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejvddgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfevfhfhufgjtgfgsehtkeertddtfeejnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpeeikefgheduvdfhheelkedvffelueehgeejtdeuieduieejhedv
    vddtfeevleeihfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhl
    rghnugdrohhrgh
X-ME-Proxy: <xmx:Pl3xY2cK-8Nky_EsS8dIInZ8tIUE_bqp-fsy_eUa19FKNW0UxmvRZA>
    <xmx:Pl3xYzO8cyJ5VLJSe4GcIRoe6G3DP9t42MvjMWtqTAKmMxnviSVmag>
    <xmx:Pl3xYwmQR-C_HMa12UxSRSI8FgzstEne8viOfsC3wT8nb3RwcysH4A>
    <xmx:P13xY8tyxLq8alLpvpHX7WkYsTPUyF9yipiOPj_m1JA5Y2UGThyPpA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 18 Feb 2023 18:20:29 -0500 (EST)
Message-ID: <8bba0d3c-bf10-97df-80a5-ad98d5a417c8@sholland.org>
Date: Sat, 18 Feb 2023 17:20:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, rafael.j.wysocki@intel.com
Cc: dmitry.osipenko@collabora.com, aou@eecs.berkeley.edu,
 apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
 geert@linux-m68k.org, heiko@sntech.de, kai.heng.feng@canonical.com,
 mcgrof@kernel.org, paulmck@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com,
 yuehaibing@huawei.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, tangmeng@uniontech.com
References: <mhng-fbf5d10c-239d-4e47-bf52-3e1255cbe5e0@palmer-ri-x1c9>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH 1/3] kernel/reboot: Use the static sys-off handler for any
 priority
In-Reply-To: <mhng-fbf5d10c-239d-4e47-bf52-3e1255cbe5e0@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230218_152039_122097_240AD5E2 
X-CRM114-Status: GOOD (  22.64  )
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

T24gMi8xNC8yMyAxODoxNywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gV2VkLCAyOCBEZWMg
MjAyMiAwODoxOToxMyBQU1QgKC0wODAwKSwgc2FtdWVsQHNob2xsYW5kLm9yZyB3cm90ZToKPj4g
Y29tbWl0IDU4N2I5YmZlMDY2OCAoImtlcm5lbC9yZWJvb3Q6IFVzZSBzdGF0aWMgaGFuZGxlciBm
b3IKPj4gcmVnaXN0ZXJfcGxhdGZvcm1fcG93ZXJfb2ZmKCkiKSBhZGRkZWQgYSBzdGF0aWNhbGx5
LWFsbG9jYXRlZCBoYW5kbGVyCj4+IHNvIHJlZ2lzdGVyX3N5c19vZmZfaGFuZGxlcigpIGNvdWxk
IGJlIGNhbGxlZCBiZWZvcmUgdGhlIHNsYWIgYWxsb2NhdG9yCj4+IGlzIGF2YWlsYWJsZS4KPj4K
Pj4gVGhhdCBiZWhhdmlvciB3YXMgbGltaXRlZCB0byB0aGUgU1lTX09GRl9QUklPX1BMQVRGT1JN
IHByaW9yaXR5Lgo+PiBIb3dldmVyLCBpdCBpcyBhbHNvIHJlcXVpcmVkIGZvciBoYW5kbGVycyBz
dWNoIGFzIFBTQ0kgb24gQVJNIGFuZCBTQkkgb24KPj4gUklTQy1WLCB3aGljaCBzaG91bGQgYmUg
cmVnaXN0ZXJlZCBhdCBTWVNfT0ZGX1BSSU9fRklSTVdBUkUuIEN1cnJlbnRseSwKPj4gdGhpcyBj
YWxsIHN0YWNrIGNyYXNoZXM6Cj4+Cj4+IMKgIHN0YXJ0X2tlcm5lbCgpCj4+IMKgwqDCoCBzZXR1
cF9hcmNoKCkKPj4gwqDCoMKgwqDCoCBwc2NpX2R0X2luaXQoKQo+PiDCoMKgwqDCoMKgwqDCoCBw
c2NpXzBfMl9pbml0KCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJlZ2lzdGVyX3N5c19vZmZfaGFu
ZGxlcigpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga21lbV9jYWNoZV9hbGxvYygpCj4+Cj4+
IEdlbmVyYWxpemUgdGhlIGNvZGUgdG8gdXNlIHRoZSBzdGF0aWNhbGx5LWFsbG9jYXRlZCBoYW5k
bGVyIGZvciB0aGUKPj4gZmlyc3QgcmVnaXN0cmF0aW9uLCByZWdhcmRsZXNzIG9mIHByaW9yaXR5
LiBDaGVjayAuc3lzX29mZl9jYiBmb3IKPj4gY29uZmxpY3RzIGluc3RlYWQgb2YgLmNiX2RhdGE7
IHNvbWUgY2FsbGJhY2tzIChlLmcuIGZpcm13YXJlIGRyaXZlcnMpCj4+IGRvIG5vdCBuZWVkIGFu
eSBwZXItaW5zdGFuY2UgZGF0YSwgc28gLmNiX2RhdGEgY291bGQgYmUgTlVMTC4KPj4KPj4gUmV2
aWV3ZWQtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+
Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3JnPgo+
PiAtLS0KPj4KPj4gwqBrZXJuZWwvcmVib290LmMgfCAxMCArKysrLS0tLS0tCj4+IMKgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2tlcm5lbC9yZWJvb3QuYyBiL2tlcm5lbC9yZWJvb3QuYwo+PiBpbmRleCAzYmJhODhjN2Zm
YzYuLjM4YzE4ZDRmMGEzNiAxMDA2NDQKPj4gLS0tIGEva2VybmVsL3JlYm9vdC5jCj4+ICsrKyBi
L2tlcm5lbC9yZWJvb3QuYwo+PiBAQCAtMzI3LDcgKzMyNyw3IEBAIHN0YXRpYyBpbnQgc3lzX29m
Zl9ub3RpZnkoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKPj4gwqDCoMKgwqAgcmV0dXJuIGhh
bmRsZXItPnN5c19vZmZfY2IoJmRhdGEpOwo+PiDCoH0KPj4KPj4gLXN0YXRpYyBzdHJ1Y3Qgc3lz
X29mZl9oYW5kbGVyIHBsYXRmb3JtX3N5c19vZmZfaGFuZGxlcjsKPj4gK3N0YXRpYyBzdHJ1Y3Qg
c3lzX29mZl9oYW5kbGVyIGVhcmx5X3N5c19vZmZfaGFuZGxlcjsKPj4KPj4gwqBzdGF0aWMgc3Ry
dWN0IHN5c19vZmZfaGFuZGxlciAqYWxsb2Nfc3lzX29mZl9oYW5kbGVyKGludCBwcmlvcml0eSkK
Pj4gwqB7Cj4+IEBAIC0zMzgsMTAgKzMzOCw4IEBAIHN0YXRpYyBzdHJ1Y3Qgc3lzX29mZl9oYW5k
bGVyCj4+ICphbGxvY19zeXNfb2ZmX2hhbmRsZXIoaW50IHByaW9yaXR5KQo+PiDCoMKgwqDCoMKg
ICogUGxhdGZvcm1zIGxpa2UgbTY4ayBjYW4ndCBhbGxvY2F0ZSBzeXNfb2ZmIGhhbmRsZXIgZHlu
YW1pY2FsbHkKPj4gwqDCoMKgwqDCoCAqIGF0IHRoZSBlYXJseSBib290IHRpbWUgYmVjYXVzZSBt
ZW1vcnkgYWxsb2NhdG9yIGlzbid0Cj4+IGF2YWlsYWJsZSB5ZXQuCj4+IMKgwqDCoMKgwqAgKi8K
Pj4gLcKgwqDCoCBpZiAocHJpb3JpdHkgPT0gU1lTX09GRl9QUklPX1BMQVRGT1JNKSB7Cj4+IC3C
oMKgwqDCoMKgwqDCoCBoYW5kbGVyID0gJnBsYXRmb3JtX3N5c19vZmZfaGFuZGxlcjsKPj4gLcKg
wqDCoMKgwqDCoMKgIGlmIChoYW5kbGVyLT5jYl9kYXRhKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gRVJSX1BUUigtRUJVU1kpOwo+PiArwqDCoMKgIGlmICghZWFybHlfc3lzX29m
Zl9oYW5kbGVyLnN5c19vZmZfY2IpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGhhbmRsZXIgPSAmZWFy
bHlfc3lzX29mZl9oYW5kbGVyOwo+PiDCoMKgwqDCoCB9IGVsc2Ugewo+PiDCoMKgwqDCoMKgwqDC
oMKgIGlmIChzeXN0ZW1fc3RhdGUgPiBTWVNURU1fUlVOTklORykKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZsYWdzID0gR0ZQX0FUT01JQzsKPj4gQEAgLTM1OCw3ICszNTYsNyBAQCBzdGF0
aWMgc3RydWN0IHN5c19vZmZfaGFuZGxlcgo+PiAqYWxsb2Nfc3lzX29mZl9oYW5kbGVyKGludCBw
cmlvcml0eSkKPj4KPj4gwqBzdGF0aWMgdm9pZCBmcmVlX3N5c19vZmZfaGFuZGxlcihzdHJ1Y3Qg
c3lzX29mZl9oYW5kbGVyICpoYW5kbGVyKQo+PiDCoHsKPj4gLcKgwqDCoCBpZiAoaGFuZGxlciA9
PSAmcGxhdGZvcm1fc3lzX29mZl9oYW5kbGVyKQo+PiArwqDCoMKgIGlmIChoYW5kbGVyID09ICZl
YXJseV9zeXNfb2ZmX2hhbmRsZXIpCj4+IMKgwqDCoMKgwqDCoMKgwqAgbWVtc2V0KGhhbmRsZXIs
IDAsIHNpemVvZigqaGFuZGxlcikpOwo+PiDCoMKgwqDCoCBlbHNlCj4+IMKgwqDCoMKgwqDCoMKg
wqAga2ZyZWUoaGFuZGxlcik7Cj4gCj4gU29ycnkgZm9yIGJlaW5nIHNsb3cgaGVyZSwgSSdkIGJl
ZW4gYXNzdW1pbmcgc29tZW9uZSB3b3VsZCBBY2sgdGhpcyBidXQKPiBpdCBsb29rcyBsaWtlIG1h
eWJlIHRoZXJlJ3Mgbm9ib2R5IGluIHRoZSBtYWludGFpbmVycyBmaWxlIGZvcgo+IGtlcm5lbC9y
ZWJvb3QuYz/CoCBJJ20gZmluZSB0YWtpbmcgdGhpcyB2aWEgdGhlIFJJU0MtViB0cmVlIGlmIHRo
YXQncyBPSwo+IHdpdGggcGVvcGxlLCBidXQgdGhlIGNvdmVyIGxldHRlciBzdWdnZXN0cyB0aGUg
cGF0Y2ggaXMgbmVjZXNzYXJ5IGZvcgo+IG11bHRpcGxlIHBhdGNoIHNldHMuCgpTZWUgYWxzbyBE
bWl0cnkncyByZXBseVswXSB0byB0aGUgUFNDSSB0aHJlYWQuIChNYXliZSBJIHNob3VsZCBoYXZl
IHNlbnQKYm90aCBjb252ZXJzaW9ucyBhcyBvbmUgc2VyaWVzPykKCkkgYW0gaGFwcHkgd2l0aCB0
aGUgcGF0Y2hlcyBnb2luZyB0aHJvdWdoIGFueSB0cmVlLiBUaGUga2VybmVsL3JlYm9vdC5jCnBh
dGNoIGlzIGV4YWN0bHkgdGhlIHNhbWUgYmV0d2VlbiB0aGUgdHdvIHNlcmllcywgc28gaXQgc2hv
dWxkIG5vdCBodXJ0CmlmIGl0IGdldHMgbWVyZ2VkIHR3aWNlLiBUaG91Z2ggaWYgeW91IHRha2Ug
dGhpcyBzZXJpZXMgdGhyb3VnaCB0aGUKUklTQy1WIHRyZWUsIG1heWJlIHlvdSB3YW50IHRvIGNy
ZWF0ZSBhIHRhZyBmb3IgaXQ/CgpJIGFtIG5vdCBzdXJlIGV4YWN0bHkgd2hhdCBuZWVkcyB0byBi
ZSBkb25lIGhlcmU7IEkgYW0gaGFwcHkgdG8gZG8KYW55dGhpbmcgdGhhdCB3b3VsZCBhc3Npc3Qg
Z2V0dGluZyBib3RoIHNlcmllcyBtZXJnZWQgZm9yIHY2LjMsIHRvIGF2b2lkCmEgcmVncmVzc2lv
biB3aXRoIGF4cDIweFsxXS4KClJlZ2FyZHMsClNhbXVlbAoKWzBdOgpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sLzBhMTgwODQ5LWJhMWItMmE4Mi1hYjA2LWVkMWI4MTU1ZDVjYUBjb2xsYWJv
cmEuY29tLwpbMV06Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvZTM4ZDI5ZjUtY2QzYy00
YTJiLWIzNTUtMmJjZmFkMDBhMjRiQHNob2xsYW5kLm9yZy8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
