Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FEEC83F11
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 14:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekd0STgyj8cPyQL1hrnzAFFzTrvjnufGrrXNTI4XRO8=; b=38KOyl+HOOdkVa
	TSI95EwSfswfH/Xzx0hZXSc7lqzs+3yd113+Zxb1CB06CH7VnYCHLXAkx+29mExB3I5JM5KO0cwoE
	Gicn1dkfQz/xSabsPpJ1tZQAERS2tgzZbRSZu86vl4qFqhYsrHvdbjD7kHh5SNDwRjUNCoo7Ibte3
	aqSe97Z6lhpSWTreq8oj+30y+6hSQcPH6+5z98BvWf63yH3UC/S25BJxIzytBEip6qQpBRtXEdPhl
	rZhRtNbHDiaxAegkRetgPkkiuHG82aOWx0sbNKBmfI6Qg4jW2fBNzIJNyettYomqmzZ69U82DXez1
	n5z94RjccNhTAXTnVzxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtsN-006xzu-1u;
	Sat, 26 Aug 2023 14:02:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZtsL-006xzT-2C
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 14:02:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1458361CAD;
	Sat, 26 Aug 2023 14:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3A7C433C7;
	Sat, 26 Aug 2023 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693058570;
	bh=RZHkYur0kpYvgVYND39F8EDHpz0KGEHIwqM0/355IUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CYK6t/9miqMJe5VMd7UiNWV2OFKCownnT6Ig+7Q+o6MTvHzQbkt3fZ9WB6gvA9xA7
	 OuC0j56OJRCUCgDjaMocRfXzo1gKz5OEychsYWDvjjLDfOuckjMs3GuGrfau7vRIOV
	 1N1+4pj+EOEY0cHOsRxfaSVJsCF+eZgr89hy28O/WmTseKLJlQY8hH2FPBbvhrB4aD
	 gfexUXDZfDnS+eAwuDv+bY5ZeBJCG9OCjdpexk63QxMwlsBqlfP2x94UsIaepmG/29
	 ek3eVKbCVYNEl/zihNgr2P+RQKkFlAfE1tuN9nnVuV4x1Czf2WRtlZ+BAyrWUO+DJW
	 6iIPDxHnHScXQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Puranjay Mohan <puranjay12@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, pulehui@huawei.com,
 conor.dooley@microchip.com, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, song@kernel.org, yhs@fb.com,
 kpsingh@kernel.org, bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: puranjay12@gmail.com
Subject: Re: [PATCH bpf-next v2 2/3] riscv: implement a memset like function
 for text
In-Reply-To: <20230824133135.1176709-3-puranjay12@gmail.com>
References: <20230824133135.1176709-1-puranjay12@gmail.com>
 <20230824133135.1176709-3-puranjay12@gmail.com>
Date: Sat, 26 Aug 2023 16:02:47 +0200
Message-ID: <871qfprjeg.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_070253_765625_25F88511 
X-CRM114-Status: GOOD (  13.01  )
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

UHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPiB3cml0ZXM6Cgo+IFRoZSBCUEYg
SklUIG5lZWRzIHRvIHdyaXRlIGludmFsaWQgaW5zdHJ1Y3Rpb25zIHRvIFJYIHJlZ2lvbnMgb2Yg
bWVtb3J5Cj4gdG8gaW52YWxpZGF0ZSByZW1vdmVkIEJQRiBwcm9ncmFtcy4gVGhpcyBuZWVkcyBh
IGZ1bmN0aW9uIGxpa2UgbWVtc2V0KCkKPiB0aGF0IGNhbiB3b3JrIHdpdGggUlggbWVtb3J5Lgo+
Cj4gSW1wbGVtZW50IHBhdGNoX3RleHRfc2V0X25vc3luYygpIHdoaWNoIGlzIHNpbWlsYXIgdG8g
dGV4dF9wb2tlX3NldCgpIG9mCj4geDg2LgoKU29tZSBhZGRpdGlvbmFsIG5pdHMsIGluIGFkZGl0
aW9uIHRvIHRoZSBvdGhlciBjb21tZW50cyAoU29uZywga2VybmVsCnRlc3QgYm90LCBMZWh1aSku
Cgo+IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheTEyQGdtYWlsLmNvbT4K
PiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wYXRjaC5oIHwgIDEgKwo+ICBhcmNoL3Jp
c2N2L2tlcm5lbC9wYXRjaC5jICAgICAgfCA3NCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGF0Y2guaAo+IGluZGV4IDYzYzk4ODMzZDUxMC4uYWE1YzE4MzBlYTQzIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGF0Y2guaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGF0Y2guaAo+IEBAIC03LDYgKzcsNyBAQAo+ICAjZGVmaW5lIF9BU01fUklTQ1Zf
UEFUQ0hfSAo+ICAKPiAgaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFkZHIsIGNvbnN0IHZv
aWQgKmluc25zLCBzaXplX3QgbGVuKTsKPiAraW50IHBhdGNoX3RleHRfc2V0X25vc3luYyh2b2lk
ICphZGRyLCBjb25zdCBpbnQgYywgc2l6ZV90IGxlbik7Cj4gIGludCBwYXRjaF90ZXh0KHZvaWQg
KmFkZHIsIHUzMiAqaW5zbnMsIGludCBuaW5zbnMpOwo+ICAKPiAgZXh0ZXJuIGludCByaXNjdl9w
YXRjaF9pbl9zdG9wX21hY2hpbmU7Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Bh
dGNoLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5jCj4gaW5kZXggNDY1YjJlZWJiYzM3Li4y
NGQ0OTk5OWFjMWEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ICsr
KyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKPiBAQCAtMTMsNiArMTMsNyBAQAo+ICAjaW5j
bHVkZSA8YXNtL2ZpeG1hcC5oPgo+ICAjaW5jbHVkZSA8YXNtL2Z0cmFjZS5oPgo+ICAjaW5jbHVk
ZSA8YXNtL3BhdGNoLmg+Cj4gKyNpbmNsdWRlIDxhc20vc3RyaW5nLmg+Cj4gIAo+ICBzdHJ1Y3Qg
cGF0Y2hfaW5zbiB7Cj4gIAl2b2lkICphZGRyOwo+IEBAIC01Myw2ICs1NCwzNCBAQCBzdGF0aWMg
dm9pZCBwYXRjaF91bm1hcChpbnQgZml4bWFwKQo+ICB9Cj4gIE5PS1BST0JFX1NZTUJPTChwYXRj
aF91bm1hcCk7Cj4gIAo+ICtzdGF0aWMgaW50IF9fcGF0Y2hfaW5zbl9zZXQodm9pZCAqYWRkciwg
Y29uc3QgaW50IGMsIHNpemVfdCBsZW4pCgpEcm9wIHRoZSAiY29uc3QiIGZyb20gImNvbnN0IGlu
dCBjIiBldmVyeXdoZXJlIGluIHRoaXMgcGF0Y2gsIGFuZCBsZXQncwpqdXN0IHVzZSB1OCBpbnN0
ZWFkIG9mIGludC4gV2UgZG9uJ3QgbmVlZCB0byBjYXJyeSB0aGUgb2xkIG1lbXNldCgpCmxlZ2Fj
eSBhcmd1bWVudHRzISBXZSdyZSBtb3JlIG1vZGVybiB0aGFuIHRoYXQhIDstKQoKCkJqw7ZybgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
