Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A63CC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0GgiABOIRV2oYHbMCBI+qfKRRzZCNlcfXsS5GPqgnA=; b=wwVHDc1kpX29LC
	pn5Yrav60tDs2dgG7/gHoNmoGQ19jZ137esit5Kg1BDCj0eko+ozZ5OMegx7uAsWeLor8AuaMc0Rw
	rTa8WMw7pdm/LChc0iGffrXfdBcn/YOFb5AC90GiOlfseno5ZyeiyNh6t5KZaMHOYQs5RgG2KaTBY
	32FyGxm+AaVUM8xbXrzPKt6xPV+HIFPT9/DBTlIjbqTmgD50wfoJqOJ7JMfOdctzuocSJN9Sk2dzI
	t4IEcWzb+Nw4AwhNfMCouRg4jMnK5S3obQzQKsyJOiTs4PjNC5M9rhmkylmLjYUZyDegQp/KgpcM/
	BRlJsgXe0XEuw1r17j9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4zcK-00CEFN-F2; Tue, 13 Dec 2022 07:22:20 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4zcG-00CEBF-Fx
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 07:22:19 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3101E24E0D8;
	Tue, 13 Dec 2022 15:21:38 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Dec
 2022 15:21:38 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Dec
 2022 15:21:37 +0800
Message-ID: <26e9c3eb-aaeb-8cbd-dda0-20f28331dbeb@starfivetech.com>
Date: Tue, 13 Dec 2022 15:21:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 2/3] mmc: starfive: Add sdio/emmc driver support
To: Shawn Lin <shawn.lin@rock-chips.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-3-william.qiu@starfivetech.com>
 <faea4932-add6-fc51-836d-b113e8c9a194@rock-chips.com>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <faea4932-add6-fc51-836d-b113e8c9a194@rock-chips.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_232216_855900_C089590A 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDIyLzEyLzEzIDEwOjI0LCBTaGF3biBMaW4gd3JvdGU6Cj4gSGkKPiAKPiBPbiAyMDIy
LzEyLzcgMjE6MTcsIFdpbGxpYW0gUWl1IHdyb3RlOgo+PiBBZGQgc2Rpby9lbW1jIGRyaXZlciBz
dXBwb3J0IGZvciBTdGFyRml2ZSBKSDcxMTAgc29jLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBXaWxs
aWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gLS0tCj4+IMKgIE1BSU5U
QUlORVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDC
oCA2ICsKPj4gwqAgZHJpdmVycy9tbWMvaG9zdC9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEwICsrCj4+IMKgIGRyaXZlcnMvbW1jL2hvc3QvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqAgMSArCj4+IMKgIGRyaXZlcnMvbW1jL2hvc3QvZHdfbW1jLXN0YXJmaXZlLmMgfCAx
OTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAy
MTQgaW5zZXJ0aW9ucygrKQo+PiDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tbWMvaG9z
dC9kd19tbWMtc3RhcmZpdmUuYwo+Pgo+IAo+IC4uLgo+IAo+PiArCj4+ICtzdGF0aWMgdW5zaWdu
ZWQgbG9uZyBkd19tY2lfc3RhcmZpdmVfY2Fwc1tdID0gewo+PiArwqDCoMKgIE1NQ19DQVBfQ01E
MjMsCj4+ICvCoMKgwqAgTU1DX0NBUF9DTUQyMywKPj4gK8KgwqDCoCBNTUNfQ0FQX0NNRDIzCj4+
ICt9Owo+PiArCj4gCj4gLi4uLgo+IAo+PiArwqDCoMKgIGhvc3QtPnByaXYgPSBwcml2Owo+PiAr
Cj4+ICvCoMKgwqAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
ZHdfbWNpX2Rydl9kYXRhIHN0YXJmaXZlX2RhdGEgPSB7Cj4+ICvCoMKgwqAgLmNhcHMgPSBkd19t
Y2lfc3RhcmZpdmVfY2FwcywKPj4gK8KgwqDCoCAubnVtX2NhcHMgPSBBUlJBWV9TSVpFKGR3X21j
aV9zdGFyZml2ZV9jYXBzKSwKPiAKPiB1c2UgIi5jb21tb25fY2FwcyA9IE1NQ19DQVBfQ01EMjMi
IGluc3RlYWQuCj4gCgpIaSBTaGF3biwKClRoYW5rIHlvdSBmb3IgdGFraW5nIHRpbWUgdG8gcmV2
aWV3LgpUaGUgLmNvbW1vbl9jYXBzIGlzIG5vdCBkZWZpbmVkIGluIGR3X21jaV9kcnZfZGF0YS4K
QW5kIC5udW1fY2FwcyBpcyBhbHNvIHVzZWQgaW4gZHdfbWNpLXJvY2tjaGlwLmMuCgpCZXN0IHJl
Z2FyZHMsCldpbGxpYW0gUWl1Cj4+ICvCoMKgwqAgLnNldF9pb3MgPSBkd19tY2lfc3RhcmZpdmVf
c2V0X2lvcywKPj4gK8KgwqDCoCAucGFyc2VfZHQgPSBkd19tY2lfc3RhcmZpdmVfcGFyc2VfZHQs
Cj4+ICvCoMKgwqAgLmV4ZWN1dGVfdHVuaW5nID0gZHdfbWNpX3N0YXJmaXZlX2V4ZWN1dGVfdHVu
aW5nLAo+PiArfTsKPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdf
bWNpX3N0YXJmaXZlX21hdGNoW10gPSB7Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
