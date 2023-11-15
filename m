Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57450C07548
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 07:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prqPfI3XNtTFieEA4KoZPHI+WvPQJpGFBhN5P8UBRl4=; b=yHDlRCFKgKRoLY
	yfkfhQJ0D8jRtnf/ewDBPT+UPam8vip1g7GeK7FV+/hvz9gxHDSybEQJPrND5m1umLvI6rJxGrMCp
	gZhbr3v4EaLbYUvBUgLzayDfCd18ZNovifZPlCOAtdVx4P9MMMRKFsQt8jPAZoVEvWVxqmasy2+5v
	HlI8gEWwRmw1b/OCsahKEZZZDA9avpWZTC2HjPurYIkFkmYSw6naHQub5nikUCqWNGGJERupDriGn
	BNxi//8QpiCQe6fHCGwSYVQwoFvETR7Xw21e+sJyFFZPhwruG+0JSAPGdhHbOmyKPl9B0LhuTYb1Y
	3ZtsVgyOLU2aPn6TFSuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ai9-000Bia-0W;
	Wed, 15 Nov 2023 07:53:21 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Ai4-000BhO-2q
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 07:53:19 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 442CE7FEF;
	Wed, 15 Nov 2023 15:52:49 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 15:52:49 +0800
Received: from [192.168.100.10] (172.16.6.8) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Nov
 2023 15:52:47 +0800
Message-ID: <f373645c-1e89-df76-e545-21bf0ba9ee8f@starfivetech.com>
Date: Wed, 15 Nov 2023 15:52:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] clocksource/timer-risc: Add riscv_clock_shutdown
 callback
To: Anup Patel <apatel@ventanamicro.com>
CC: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<leyfoon.tan@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20231115061811.10041-1-joshua.yeong@starfivetech.com>
 <CAK9=C2VXxNjKOq1XqQ9t6iVELdj2fFi85K77xNCOfdf3WRdy8w@mail.gmail.com>
Content-Language: en-US
From: Joshua Yeong <joshua.yeong@starfivetech.com>
In-Reply-To: <CAK9=C2VXxNjKOq1XqQ9t6iVELdj2fFi85K77xNCOfdf3WRdy8w@mail.gmail.com>
X-Originating-IP: [172.16.6.8]
X-ClientProxiedBy: EXCAS081.cuchost.com (172.16.6.41) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_235317_110799_8800FC60 
X-CRM114-Status: GOOD (  10.85  )
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

SGkgQW51cCwKCk9uIDE1LU5vdi0yMyAzOjAwIFBNLCBBbnVwIFBhdGVsIHdyb3RlOgo+IE9uIFdl
ZCwgTm92IDE1LCAyMDIzIGF0IDExOjQ54oCvQU0gSm9zaHVhIFllb25nCj4gPGpvc2h1YS55ZW9u
Z0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToKPj4gQWRkIGNsb2Nrc291cmNlIGRldGFjaC9zaHV0
ZG93biBjYWxsYmFjayB0byBkaXNhYmxlIFJJU0MtViB0aW1lciBpbnRlcnJ1cHQgd2hlbgo+PiBz
d2l0Y2hpbmcgb3V0IHJpc2N2IHRpbWVyIGFzIGNsb2NrIHNvdXJjZQo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBKb3NodWEgWWVvbmcgPGpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tPgo+PiAtLS0K
Pj4gICBkcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgfCA3ICsrKysrKysKPj4gICAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2Nsb2Nrc291cmNlL3RpbWVyLXJpc2N2LmMgYi9kcml2ZXJzL2Nsb2Nrc291cmNlL3RpbWVyLXJp
c2N2LmMKPj4gaW5kZXggZGEzMDcxYjM4N2ViLi41ODhhMDU0NTliNmEgMTAwNjQ0Cj4+IC0tLSBh
L2RyaXZlcnMvY2xvY2tzb3VyY2UvdGltZXItcmlzY3YuYwo+PiArKysgYi9kcml2ZXJzL2Nsb2Nr
c291cmNlL3RpbWVyLXJpc2N2LmMKPj4gQEAgLTUwLDEyICs1MCwxOSBAQCBzdGF0aWMgaW50IHJp
c2N2X2Nsb2NrX25leHRfZXZlbnQodW5zaWduZWQgbG9uZyBkZWx0YSwKPj4gICAgICAgICAgcmV0
dXJuIDA7Cj4+ICAgfQo+Pgo+PiArc3RhdGljIGludCByaXNjdl9jbG9ja19zaHV0ZG93bihzdHJ1
Y3QgY2xvY2tfZXZlbnRfZGV2aWNlICpldnQpCj4+ICt7Cj4+ICsgICAgICAgc2JpX3NldF90aW1l
cigtMSk7Cj4gVXNlIHJpc2N2X2Nsb2NrX2V2ZW50X3N0b3AoKSBoZXJlLgpZb3UgbWVhbiByZXBs
YWNpbmcgcmlzY3ZfY2xvY2tfc2h1dGRvd24gYXMgcmlzY3ZfY2xvY2tfZXZlbnRfc3RvcD8KPgo+
PiArICAgICAgIHJldHVybiAwOwo+PiArfQo+PiArCj4+ICAgc3RhdGljIHVuc2lnbmVkIGludCBy
aXNjdl9jbG9ja19ldmVudF9pcnE7Cj4+ICAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBj
bG9ja19ldmVudF9kZXZpY2UsIHJpc2N2X2Nsb2NrX2V2ZW50KSA9IHsKPj4gICAgICAgICAgLm5h
bWUgICAgICAgICAgICAgICAgICAgPSAicmlzY3ZfdGltZXJfY2xvY2tldmVudCIsCj4+ICAgICAg
ICAgIC5mZWF0dXJlcyAgICAgICAgICAgICAgID0gQ0xPQ0tfRVZUX0ZFQVRfT05FU0hPVCwKPj4g
ICAgICAgICAgLnJhdGluZyAgICAgICAgICAgICAgICAgPSAxMDAsCj4+ICAgICAgICAgIC5zZXRf
bmV4dF9ldmVudCAgICAgICAgID0gcmlzY3ZfY2xvY2tfbmV4dF9ldmVudCwKPj4gKyAgICAgICAu
c2V0X3N0YXRlX3NodXRkb3duICAgICA9IHJpc2N2X2Nsb2NrX3NodXRkb3duLAo+PiAgIH07Cj4+
Cj4+ICAgLyoKPj4gLS0KPj4gMi4yNS4xCj4+Cj4gUmVnYXJkcywKPiBBbnVwCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
