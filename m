Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36541C04FF8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D5vg/xm0CmGYGoYE0XyGYif5PL2GCf3vCOSz/KsIYck=; b=4Xhk2s2YW1yLO+
	RJAg7usImVwbmz82zzBix09WHaxmeagZ0BrgTSOa6IuLE0TGgwRu0u7DCRuGBy4MQG1kAVaXc7P/6
	kMpADQK8Qtsz6BdvoNog4cIPE/hn3/evQHn8LND+7LTzsO6PvSFrfde6Yi6RBBP5DCo1QGK5bC9KR
	wALzHXx4EZYYKga+HyV5o8aXmvjFH7hzkLR9nJ8DCBtIDNrZd75YYjFax8LQO5AHXaCTyvWb62bs6
	FDRg+4paXB/J6wxhlL/pKgcBVvLUhRWDpE6G877mGZM3K0gHPN79kexYKRJcFMlrkApUplMAXWekG
	vC2tLBy1Bevfzek1Ou5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNL9-00000001TkL-1rQr;
	Thu, 18 Apr 2024 08:41:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxNL6-00000001Tj1-2wu3
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 08:41:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35794339;
	Thu, 18 Apr 2024 01:42:17 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0E4B3F64C;
	Thu, 18 Apr 2024 01:41:46 -0700 (PDT)
Date: Thu, 18 Apr 2024 09:41:44 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, bhelgaas@google.com,
	james.morse@arm.com, jhugo@codeaurora.org, jeremy.linton@arm.com,
	john.garry@huawei.com, Jonathan.Cameron@huawei.com,
	pierre.gondois@arm.com, tiantao6@huawei.com
Subject: Re: [PATCH v4 2/3] riscv: cacheinfo: initialize cacheinfo's level
 and type from ACPI PPTT
Message-ID: <20240418084144.go3zk5yycsg6e2k2@bogus>
References: <20240418034330.84721-1-cuiyunhui@bytedance.com>
 <20240418034330.84721-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240418034330.84721-2-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_014152_819121_870BBAF8 
X-CRM114-Status: GOOD (  19.15  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMTE6NDM6MjlBTSArMDgwMCwgWXVuaHVpIEN1aSB3cm90
ZToKPiBCZWZvcmUgY2FjaGVpbmZvIGNhbiBiZSBidWlsdCBjb3JyZWN0bHksIHdlIG5lZWQgdG8g
aW5pdGlhbGl6ZSBsZXZlbAo+IGFuZCB0eXBlLiBTaW5jZSBSU0lDLVYgY3VycmVudGx5IGRvZXMg
bm90IGhhdmUgYSByZWdpc3RlciBncm91cCB0aGF0Cj4gZGVzY3JpYmVzIGNhY2hlLXJlbGF0ZWQg
YXR0cmlidXRlcyBsaWtlIEFSTTY0LCB3ZSBjYW5ub3Qgb2J0YWluIHRoZW0KPiBkaXJlY3RseSwg
c28gbm93IHdlIG9idGFpbiBjYWNoZSBsZWF2ZXMgZnJvbSB0aGUgQUNQSSBQUFRUIHRhYmxlCj4g
KGFjcGlfZ2V0X2NhY2hlX2luZm8oKSkgYW5kIHNldCB0aGUgY2FjaGUgdHlwZSB0aHJvdWdoIHNw
bGl0X2xldmVscy4KPiAKPiBTdWdnZXN0ZWQtYnk6IEplcmVteSBMaW50b24gPGplcmVteS5saW50
b25AYXJtLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IFN1ZGVlcCBIb2xsYSA8c3VkZWVwLmhvbGxhQGFy
bS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3VpeXVuaHVpQGJ5dGVkYW5jZS5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NhY2hlaW5mby5jIHwgMjIgKysrKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+IAo+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jYWNoZWluZm8uYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL2NhY2hlaW5mby5jCj4gaW5kZXggMzBhNjg3ODI4N2FkLi5lNDdhMWU2YmQzZmUgMTAwNjQ0
Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY2FjaGVpbmZvLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9jYWNoZWluZm8uYwo+IEBAIC02LDYgKzYsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgv
Y3B1Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZi5oPgo+ICAjaW5jbHVkZSA8YXNtL2NhY2hlaW5m
by5oPgo+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPgo+ICAKPiAgc3RhdGljIHN0cnVjdCByaXNj
dl9jYWNoZWluZm9fb3BzICpydl9jYWNoZV9vcHM7Cj4gIAo+IEBAIC03OCw2ICs3OSwyNyBAQCBp
bnQgcG9wdWxhdGVfY2FjaGVfbGVhdmVzKHVuc2lnbmVkIGludCBjcHUpCj4gIAlzdHJ1Y3QgZGV2
aWNlX25vZGUgKnByZXYgPSBOVUxMOwo+ICAJaW50IGxldmVscyA9IDEsIGxldmVsID0gMTsKPiAg
Cj4gKwlpZiAoIWFjcGlfZGlzYWJsZWQpIHsKPiArCQlpbnQgcmV0LCBmd19sZXZlbHMsIHNwbGl0
X2xldmVsczsKPiArCj4gKwkJcmV0ID0gYWNwaV9nZXRfY2FjaGVfaW5mbyhjcHUsICZmd19sZXZl
bHMsICZzcGxpdF9sZXZlbHMpOwo+ICsJCWlmIChyZXQpCj4gKwkJCXJldHVybiByZXQ7Cj4gKwo+
ICsJCUJVR19PTigoc3BsaXRfbGV2ZWxzID4gZndfbGV2ZWxzKSB8fAo+ICsJCSAgICAgICAoc3Bs
aXRfbGV2ZWxzICsgZndfbGV2ZWxzID4gdGhpc19jcHVfY2ktPm51bV9sZWF2ZXMpKTsKPiArCj4g
KwkJZm9yICg7IGxldmVsIDw9IHRoaXNfY3B1X2NpLT5udW1fbGV2ZWxzOyBsZXZlbCsrKSB7Cj4g
KwkJCWlmIChsZXZlbCA8PSBzcGxpdF9sZXZlbHMpIHsKPiArCQkJCWNpX2xlYWZfaW5pdCh0aGlz
X2xlYWYrKywgQ0FDSEVfVFlQRV9EQVRBLCBsZXZlbCk7Cj4gKwkJCQljaV9sZWFmX2luaXQodGhp
c19sZWFmKyssIENBQ0hFX1RZUEVfSU5TVCwgbGV2ZWwpOwo+ICsJCQl9IGVsc2Ugewo+ICsJCQkJ
Y2lfbGVhZl9pbml0KHRoaXNfbGVhZisrLCBDQUNIRV9UWVBFX1VOSUZJRUQsIGxldmVsKTsKPiAr
CQkJfQo+ICsJCX0KPiArCQlyZXR1cm4gMDsKPiArCX0KPiArCgpNdWNoIGJldHRlciwgc28gbXkg
cmV2aWV3IHN0aWxsIHN0YW5kcyDwn5iECgpSZXZpZXdlZC1ieTogU3VkZWVwIEhvbGxhIDxzdWRl
ZXAuaG9sbGFAYXJtLmNvbT4KCj4gIAlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiY2Fj
aGUtc2l6ZSIpKQo+ICAJCWNpX2xlYWZfaW5pdCh0aGlzX2xlYWYrKywgQ0FDSEVfVFlQRV9VTklG
SUVELCBsZXZlbCk7Cj4gIAlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaS1jYWNoZS1z
aXplIikpCj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKUmVnYXJkcywKU3VkZWVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
