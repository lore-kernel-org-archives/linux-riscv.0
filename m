Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF6ACE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 09:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qwiQXoAEPU76+5Lzm6twIFCLRVb5T7EqYUaXZM5dCJg=; b=n8B23zJ9VInYE0
	M/5t+ZIZvOD4il27g0lOR1N68rFYEX6PGHlUfoPwqKcPvFOHH4zjcgeMtdj5nE7QOCcS76kZvl4QX
	6/bX5mT0PMNj9/7E3nRUSZfqxNzXL/6MxWOO6F+J/AgTjrI+Z47PnJVcuT9w7U86AEZ/BOVkf8NAM
	EYkn6UN7qG0MfyQ7P/hkqx3bTy+h+7C6WnzYNnD+eIdkbXPjpYqTwA830YnQXWBaHz2RFtdjbIqbE
	nMQxilbbMDof/OvKM2CXjZP+thVhXJ0gGgkRwcwbM5xnMuF53oaVzO37/o3z3xYYGJtyQu1lzvULx
	+jwKML7KxWBrni7oAPLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qitHq-002Qsu-1b;
	Wed, 20 Sep 2023 09:14:22 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qitHn-002Qrg-0d
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 09:14:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 61CFF2000B;
	Wed, 20 Sep 2023 09:14:09 +0000 (UTC)
Message-ID: <876d3cd5-bb99-edd0-47c0-6dc34c8402d1@ghiti.fr>
Date: Wed, 20 Sep 2023 11:14:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 3/3] riscv: Introduce NAPOT field to PTDUMP
Content-Language: en-US
To: Yu Chien Peter Lin <peterlin@andestech.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, david@redhat.com,
 akpm@linux-foundation.org, alexghiti@rivosinc.com, bjorn@rivosinc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: conor.dooley@microchip.com
References: <20230920035522.3180558-1-peterlin@andestech.com>
 <20230920035522.3180558-3-peterlin@andestech.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230920035522.3180558-3-peterlin@andestech.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_021419_382601_6EB8D773 
X-CRM114-Status: GOOD (  14.24  )
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

Ck9uIDIwLzA5LzIwMjMgMDU6NTUsIFl1IENoaWVuIFBldGVyIExpbiB3cm90ZToKPiBUaGlzIHBh
dGNoIGludHJvZHVjZXMgdGhlIE5BUE9UIGZpZWxkIHRvIFBURFVNUCwgYWxsb3dpbmcgaXQKPiB0
byBkaXNwbGF5IHRoZSBsZXR0ZXIgIk4iIGZvciBwYWdlcyB0aGF0IGhhdmUgdGhlIDYzcmQgYml0
IHNldC4KPgo+IFNpZ25lZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5k
ZXN0ZWNoLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYzCj4gLSBubyBjaGFuZ2UKPiAtLS0K
PiAgIGFyY2gvcmlzY3YvbW0vcHRkdW1wLmMgfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL3B0ZHVtcC5jIGIv
YXJjaC9yaXNjdi9tbS9wdGR1bXAuYwo+IGluZGV4IDEzOTk3Y2YzZmUzNi4uYjcxZjA4YjkxZTUz
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vcHRkdW1wLmMKPiArKysgYi9hcmNoL3Jpc2N2
L21tL3B0ZHVtcC5jCj4gQEAgLTEzNiw2ICsxMzYsMTAgQEAgc3RydWN0IHByb3RfYml0cyB7Cj4g
ICBzdGF0aWMgY29uc3Qgc3RydWN0IHByb3RfYml0cyBwdGVfYml0c1tdID0gewo+ICAgCXsKPiAg
ICNpZmRlZiBDT05GSUdfNjRCSVQKPiArCQkubWFzayA9IF9QQUdFX05BUE9ULAo+ICsJCS5zZXQg
PSAiTiIsCj4gKwkJLmNsZWFyID0gIi4iLAo+ICsJfSwgewo+ICAgCQkubWFzayA9IF9QQUdFX01U
TUFTS19TVlBCTVQsCj4gICAJCS5zZXQgPSAiTVQoJXMpIiwKPiAgIAkJLmNsZWFyID0gIiAgLi4g
ICIsCgpOaWNlIHRvIHNlZSB0aGF0IHdlIGFjdHVhbGx5IHRyYW5zcGFyZW50bHkgdXNlIG5hcG90
IG1hcHBpbmdzOgoKLS0tWyBQQ0kgSS9PIHN0YXJ0IF0tLS0KMHhmZmZmOGQ3ZmZmMDAwMDAwLTB4
ZmZmZjhkN2ZmZjAxMDAwMMKgwqDCoCAweDAwMDAwMDAwMDMwMDAwMDAgNjRLIFBURSBOwqDCoCAK
Li7CoMKgwqDCoCAuLsKgwqAgRCBBIEcgLiAuIFcgUiBWCgpZb3UgY2FuIGFkZDoKClJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUZXN0ZWQtYnk6
IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KClRoYW5rcyBmb3IgdGhl
IHNlcmllcywgcmVhbGx5IGFwcHJlY2lhdGVkIQoKQWxleAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
