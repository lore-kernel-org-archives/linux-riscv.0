Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61164C7619A
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 02:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5ck5zrlwkxUWJPRt5oYnxq5bhwD+aFTq1DC2XA43hI=; b=Blzb8F8ZzYycLe
	fSCjeUrA4Cj7qAk6y/UiaVCWz2co7IJ6GTLJQySmgSEfTzRxQI+9PEhtdn5SIC2/IInzFSx7/Ux9F
	PxBw2a+jT33/mCLc1auPc5t/o47d299LrAagNFsHWBxt82O0kqelao/5dbTpa02kjXi92YIWscu2x
	MflWmO2tZsyBMh+tYwP/qYMG1ulgkjdcMYiL22IYjQsNHxu/S8Bc56yq/oQeQHeMXRraJHRvcvQCL
	IFTjxh3qCJR3TxwNVfdVk9gC6N4W9kjpToi6x9qu2FwMQsuWO1BwTadz2AFaWHPaMkGTeQpwgvJJD
	qjkn06lgmDXbns3cVQ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQLj-001dFD-34;
	Wed, 12 Apr 2023 02:36:43 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmQLf-001dAq-27
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 02:36:42 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D535924E2E7;
	Wed, 12 Apr 2023 10:36:22 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:36:22 +0800
Received: from [192.168.125.89] (113.72.145.176) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 10:36:21 +0800
Message-ID: <e0f27ed2-9144-ff91-fe11-92e19eaf6013@starfivetech.com>
Date: Wed, 12 Apr 2023 10:36:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 1/3] riscv: dts: starfive: Enable axp15060 pmic for
 cpufreq
Content-Language: en-US
To: Shengyu Qu <wiagn233@outlook.com>, Conor Dooley
	<conor.dooley@microchip.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
 <20230411083257.16155-2-mason.huo@starfivetech.com>
 <20230411-chimp-unvarying-142394732ff5@wendy>
 <TY3P286MB261181FB1FDAF6B14CDB266B989A9@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
From: Mason Huo <mason.huo@starfivetech.com>
In-Reply-To: <TY3P286MB261181FB1FDAF6B14CDB266B989A9@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_193640_013414_AF7635F6 
X-CRM114-Status: GOOD (  12.05  )
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

CgpPbiAyMDIzLzQvMTEgMjI6NDksIFNoZW5neXUgUXUgd3JvdGU6Cj4+IE9uIFR1ZSwgQXByIDEx
LCAyMDIzIGF0IDA0OjMyOjU1UE0gKzA4MDAsIE1hc29uIEh1byB3cm90ZToKPj4+IFRoZSBWaXNp
b25GaXZlIDIgYm9hcmQgaGFzIGFuIGVtYmVkZGVkIHBtaWMgYXhwMTUwNjAsCj4+PiB3aGljaCBz
dXBwb3J0cyB0aGUgY3B1IERWRlMgdGhyb3VnaCB0aGUgZGNkYzIgcmVndWxhdG9yLgo+Pj4gVGhp
cyBwYXRjaCBlbmFibGVzIGF4cDE1MDYwIHBtaWMgYW5kIGNvbmZpZ3MgdGhlIGRjZGMyLgo+Pj4K
Pj4+IFNpZ25lZC1vZmYtYnk6IE1hc29uIEh1byA8bWFzb24uaHVvQHN0YXJmaXZldGVjaC5jb20+
Cj4+PiAtLS0KPj4+IMKgIC4uLi9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0y
LmR0c2nCoMKgwqAgfCAxNSArKysrKysrKysrKysrKysKPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
NSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMv
c3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kKPj4+IGlu
ZGV4IDJhNmQ4MTYwOTI4NC4uZGY1ODJiZGRhZTRiIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kKPj4+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lv
bmZpdmUtMi5kdHNpCj4+PiBAQCAtMTE0LDYgKzExNCwyMSBAQCAmaTJjNSB7Cj4+PiDCoMKgwqDC
oMKgIHBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+PiDCoMKgwqDCoMKgIHBpbmN0cmwtMCA9
IDwmaTJjNV9waW5zPjsKPj4+IMKgwqDCoMKgwqAgc3RhdHVzID0gIm9rYXkiOwo+Pj4gKwo+Pj4g
K8KgwqDCoCBwbWljOiBheHAxNTA2MF9yZWdAMzYgewo+PiBObyB1bmRlcnNjb3JlcyBpbiBub2Rl
IG5hbWVzIHBsZWFzZSAmICJwbWljIiBpcyB0aGUgZ2VuZXJpYyBub2RlIG5hbWUKPj4gZm9yIHBt
aWNzLgo+Pgo+PiBDaGVlcnMsCj4+IENvbm9yLgo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvbXBh
dGlibGUgPSAieC1wb3dlcnMsYXhwMTUwNjAiOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJlZyA9IDww
eDM2PjsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCByZWd1bGF0b3JzIHsKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZ19kY2RjMjogZGNkYzIgewo+IAo+IHJlZ19kY2RjMiBzZWVtcyBu
b3QgYSBnb29kIG5hbWUsIHRvbyBnZW5lcmljIGZvciBpZGVudGlmaWNhdGlvbi4gSW4gbW9zdAo+
IAo+IGNhc2VzLCBpdCdzIHNhbWUgYXMgcmVndWxhdG9yLW5hbWUgYnV0IHVzaW5nICJfIiByYXRo
ZXIgdGhhbiAiLSIuCj4gCkhpIFNoZW5neXUsCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgpXaWxs
IGNoYW5nZSB0byAidmRkX2NwdSIuCgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZWd1bGF0b3ItYm9vdC1vbjsKPiAKPiBJdCBzaG91bGQgbm90IGJlIHVzZWQswqAgaW4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlZ3VsYXRvcgo+IAo+IC9yZWd1bGF0b3Iu
eWFtbCwgaXQgaXMgZGVzY3JpYmVkIGFzIGZvbGxvd3M6Cj4gCj4gIlRoaXMgcHJvcGVydHkgaXMg
aW50ZW5kZWQgdG8gb25seSBiZSB1c2VkIGZvciByZWd1bGF0b3JzIHdoZXJlIHNvZnR3YXJlCj4g
Cj4gY2Fubm90IHJlYWQgdGhlIHN0YXRlIG9mIHRoZSByZWd1bGF0b3IuIgo+IAo+IEluIHRoaXMg
Y2FzZSwgcmVndWxhdG9yIHN0YXRlIGlzIGNvbXBsZXRlbHkgYWJsZSB0byBiZSByZWFkIGJ5IGRy
aXZlci4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gU2hlbmd5dQo+V2lsbCByZW1vdmUgaXQuCgpU
aGFua3MKTWFzb24KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
