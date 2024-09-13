Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD348FA3755
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2024 14:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BI97Gk4YjsNAAz3UQPtP0emcjtEqCw/vYt/XCosNpYo=; b=giBJ1m5LUNBKIk
	mgCnvX5DUTnLiFlsvRKU/OHcbCZ2rA+HnA8vVM0bq0ufxqYWphjb5YXMD9wtMgmpMKZHrvgIbhhgj
	zPEt/DOF31OpXzaXzD8pvZzA/vQZWFTy7EpwAsFKlQuvVyEZqnF6Vu4vt4nELAnO6G0xO5brtlxsG
	PlenElDmtD6Im1l+cPPld1OyC+yMbSVfj0lpgih4gMhWL2Hj9VcIlRhzFaADgka/EcwC6aKArmlKR
	klvtW115o+dk8qoSexQxXkT9izQ4tKbozOdYCLZZ/fuVuJG9a+6WNN3hRPLR9OAYF3e3/TSjKcK+f
	UgSoGmKTllcJlhL8gAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp7jG-0000000GGI2-1z2h;
	Fri, 13 Sep 2024 14:56:58 +0000
Received: from msa-213.smtpout.orange.fr ([193.252.23.213] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp7jC-0000000GGHb-3hQR
	for linux-riscv@lists.infradead.org;
	Fri, 13 Sep 2024 14:56:57 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id p7j0sSUf9oR4tp7j1soqq0; Fri, 13 Sep 2024 16:56:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1726239411;
	bh=2ppfZtFE3UF/ZPMPNi/oYz7eBBncngRv+97pSLrZhqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=frB2zXBkPf2SbckhFM/MElr0u4oWmiNEG9WMsoDpJ/9F4I7EYcra7Vs8SKV+jLf+1
	 WWGlSmHvc/f7s+3oGUMSXH5RIL/A2V+mD/tDQ2Npd7phpBuZLSvDKJhe1Lm1JTLPfu
	 aoxhKvyROQrUYZ8kb0VNSo/Qfd2ONclCAzrvbaA7mu5HE+UmjR/zDHxx+E1fE7Es+7
	 kJbvvCde1ENSFzGt/J6Qu/wq7dZt4HKhih6QC9K5ksQM1/n4HyKc1NWK5Yw0uZwRO6
	 s4b/ny6bMWwAvVEVZZhnBEqRRMu4p2PMo2aiVQriYVg2PMV8jODsa9EVN43ryFMzxo
	 R4XOTF72vKrbw==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Fri, 13 Sep 2024 16:56:51 +0200
X-ME-IP: 90.11.132.44
Message-ID: <e2d7ed77-827b-4b7c-800c-9c8f3bcb6b5a@wanadoo.fr>
Date: Fri, 13 Sep 2024 16:56:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 v2 1/4] riscv: dts: starfive: add assigned-clock* to
 limit frquency
To: WangYuli <wangyuli@uniontech.com>, stable@vger.kernel.org,
 gregkh@linuxfoundation.org, sashal@kernel.org, william.qiu@starfivetech.com,
 emil.renner.berthing@canonical.com, conor.dooley@microchip.com,
 xingyu.wu@starfivetech.com, walker.chen@starfivetech.com, robh@kernel.org,
 hal.feng@starfivetech.com
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 richardcochran@gmail.com, netdev@vger.kernel.org
References: <3A31C289BC240955+20240912025539.1928223-1-wangyuli@uniontech.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <3A31C289BC240955+20240912025539.1928223-1-wangyuli@uniontech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_075655_356131_20FFFB59 
X-CRM114-Status: GOOD (  10.53  )
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

TGUgMTIvMDkvMjAyNCDDoCAwNDo1NSwgV2FuZ1l1bGkgYSDDqWNyaXTCoDoKPiBGcm9tOiBXaWxs
aWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0ZWNoLmNvbT4KPiAKPiBbIFVwc3RyZWFtIGNv
bW1pdCBhZjU3MTEzM2Y3YWUwMjhlYzliNWZkYWI3OGY0ODNhZjEzYmYyOGQzIF0KPiAKPiBJbiBK
SDcxMTAgU29DLCB3ZSBuZWVkIHRvIGdvIGJ5LXBhc3MgbW9kZSwgc28gd2UgbmVlZCBhZGQgdGhl
Cj4gYXNzaWduZWQtY2xvY2sqIHByb3BlcnRpZXMgdG8gbGltaXQgY2xvY2sgZnJxdWVuY3kuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogV2lsbGlhbSBRaXUgPHdpbGxpYW0ucWl1QHN0YXJmaXZldGVjaC5j
b20+Cj4gUmV2aWV3ZWQtYnk6IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0
aGluZ0BjYW5vbmljYWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3Iu
ZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogV2FuZ1l1bGkgPHdhbmd5dWxp
QHVuaW9udGVjaC5jb20+Cj4gLS0tCgpIaSwKCmlmL3doZW4gcmVzZW50LCB0aGVyZSBpcyBhIHR5
cG8gaW4gdGhlIHN1YmplY3Q6IHMvZnJxdWVuY3kvZnJlcXVlbmN5LwoKQ0oKCgo+ICAgLi4uL3Jp
c2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaSB8
IDQgKysrKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25m
aXZlLTIuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZl
LXZpc2lvbmZpdmUtMi5kdHNpCj4gaW5kZXggMDYyYjk3YzZlN2RmLi40ODc0ZTNiYjQyYWIgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUt
dmlzaW9uZml2ZS0yLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2po
NzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+IEBAIC0yMDQsNiArMjA0LDggQEAgJmky
YzYgewo+ICAgCj4gICAmbW1jMCB7Cj4gICAJbWF4LWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+
ICsJYXNzaWduZWQtY2xvY2tzID0gPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19TRElPMF9TRENBUkQ+
Owo+ICsJYXNzaWduZWQtY2xvY2stcmF0ZXMgPSA8NTAwMDAwMDA+Owo+ICAgCWJ1cy13aWR0aCA9
IDw4PjsKPiAgIAljYXAtbW1jLWhpZ2hzcGVlZDsKPiAgIAltbWMtZGRyLTFfOHY7Cj4gQEAgLTIy
MCw2ICsyMjIsOCBAQCAmbW1jMCB7Cj4gICAKPiAgICZtbWMxIHsKPiAgIAltYXgtZnJlcXVlbmN5
ID0gPDEwMDAwMDAwMD47Cj4gKwlhc3NpZ25lZC1jbG9ja3MgPSA8JnN5c2NyZyBKSDcxMTBfU1lT
Q0xLX1NESU8xX1NEQ0FSRD47Cj4gKwlhc3NpZ25lZC1jbG9jay1yYXRlcyA9IDw1MDAwMDAwMD47
Cj4gICAJYnVzLXdpZHRoID0gPDQ+Owo+ICAgCW5vLXNkaW87Cj4gICAJbm8tbW1jOwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
