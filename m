Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA518C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 02:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W4izhXHYQ/WfP8uK7uOj9cy22nFVOKOMwim3YbZxyFk=; b=eGM4YCMJvV3Vef
	ddP2JBu2+hUK7UaKDmuQ04IV5W3phID1LcqylaIStlxTnGLymwYtk/FhXLBp7CLPG9HRvCiGR8unv
	y98sEIz+OHhLMfJdqmT5zWqKFm/++5Fv3dlYgtrwc1h0pMNbglPqYIXCB4qnwBMI0kGkFsmwIeSRU
	ZZbdHLPkrRqnXFwtjZQX4L6nhexDKMob7Pd4L/4mqE5mtY94ezXbDGp5rsSx+48Bf1WguJ6FJTiy4
	1Ikh0YAhhxbyRvuB7BLqDKG5wS0BJWfBOb77RsnjmT+HeR3JR9FZ7is91lnbAUGkHLEcMJqkyNPVD
	ItaBL+komyaevVfdl+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3T6q-0011vG-DW; Fri, 09 Dec 2022 02:27:32 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3T6m-0011VH-CA
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 02:27:30 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 2ED5F24DD6E;
	Fri,  9 Dec 2022 10:26:58 +0800 (CST)
Received: from EXMBX173.cuchost.com (172.16.6.93) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 9 Dec
 2022 10:26:58 +0800
Received: from [192.168.120.49] (171.223.208.138) by EXMBX173.cuchost.com
 (172.16.6.93) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 9 Dec
 2022 10:26:56 +0800
Message-ID: <236b1b83-9bda-ac09-ea09-9701dccb4ac6@starfivetech.com>
Date: Fri, 9 Dec 2022 10:26:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 2/7] net: stmmac: platform: Add snps,dwmac-5.20 IP
 compatible string
Content-Language: en-US
To: Ben Dooks <ben.dooks@codethink.co.uk>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-3-yanhong.wang@starfivetech.com>
 <f6fd99d22a025377e176890cc7641ab9@codethink.co.uk>
From: yanhong wang <yanhong.wang@starfivetech.com>
In-Reply-To: <f6fd99d22a025377e176890cc7641ab9@codethink.co.uk>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX173.cuchost.com
 (172.16.6.93)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_182728_715613_3DB29A56 
X-CRM114-Status: GOOD (  11.72  )
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

CgpPbiAyMDIyLzEyLzkgOTo1OSwgQmVuIERvb2tzIHdyb3RlOgo+IAo+IAo+IE9uIDIwMjItMTIt
MDEgMDk6MDIsIFlhbmhvbmcgV2FuZyB3cm90ZToKPj4gQWRkICJzbnBzLGR3bWFjLTUuMjAiIGNv
bXBhdGlibGUgc3RyaW5nIGZvciA1LjIwIHZlcnNpb24gdGhhdCBjYW4gYXZvaWQKPj4gdG8gZGVm
aW5lIHNvbWUgcGxhdGZvcm0gZGF0YSBpbiB0aGUgZ2x1ZSBsYXllci4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPj4gU2lnbmVkLW9m
Zi1ieTogWWFuaG9uZyBXYW5nIDx5YW5ob25nLndhbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gLS0t
Cj4+IMKgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9zdG1tYWMvc3RtbWFjX3BsYXRmb3Jt
LmMgfCAzICsrLQo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19wbGF0Zm9ybS5jCj4+IGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3RtaWNyby9z
dG1tYWMvc3RtbWFjX3BsYXRmb3JtLmMKPj4gaW5kZXggNTBmNmI0YTE0YmU0Li5jYzNiNzAxYWY4
MDIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0
bW1hY19wbGF0Zm9ybS5jCj4+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L3N0bWljcm8vc3Rt
bWFjL3N0bW1hY19wbGF0Zm9ybS5jCj4+IEBAIC01MTksNyArNTE5LDggQEAgc3RtbWFjX3Byb2Jl
X2NvbmZpZ19kdChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlCj4+ICpwZGV2LCB1OCAqbWFjKQo+PiDC
oMKgwqDCoCBpZiAob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJzbnBzLGR3bWFjLTQuMDAi
KSB8fAo+PiDCoMKgwqDCoMKgwqDCoMKgIG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAic25w
cyxkd21hYy00LjEwYSIpIHx8Cj4+IMKgwqDCoMKgwqDCoMKgwqAgb2ZfZGV2aWNlX2lzX2NvbXBh
dGlibGUobnAsICJzbnBzLGR3bWFjLTQuMjBhIikgfHwKPj4gLcKgwqDCoMKgwqDCoMKgIG9mX2Rl
dmljZV9pc19jb21wYXRpYmxlKG5wLCAic25wcyxkd21hYy01LjEwYSIpKSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShucCwgInNucHMsZHdtYWMtNS4xMGEiKSB8
fAo+PiArwqDCoMKgwqDCoMKgwqAgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJzbnBzLGR3
bWFjLTUuMjAiKSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgIHBsYXQtPmhhc19nbWFjNCA9IDE7Cj4+
IMKgwqDCoMKgwqDCoMKgwqAgcGxhdC0+aGFzX2dtYWMgPSAwOwo+PiDCoMKgwqDCoMKgwqDCoMKg
IHBsYXQtPnBtdCA9IDE7Cj4gCj4gb3V0IG9mIGludGVyZXN0LCBpcyB0aGUgdmVyc2lvbiBvZiB0
aGUgaXAgYXV0b2RldGVjdGFibGUgeWV0Pwo+IGFsc28sIHdlIHdvdWxkIGJlIGJldHRlciBvZmYg
aWYgaGF2aW5nIGFuIGlmICh2ZXJzaW9uID4gNCkgY2hlY2sgaWYgd2UgdXNlIHRoZSBzdGFuZGFy
ZCBzbnBzIGlwIGJsb2NrIGNvZGUgaGVhZGVycwo+IAoKWWVzLCB0aGUgdmVyc2lvbiBvZiB0aGUg
aXAgaXMgYXV0b2RldGVjdGFibGUuIEl0IGlzIGFsc28gcG9zc2libGUgdG8gdXNlIHRoZSBzdGFu
ZGFyZCAic25wcywgZHdtYWMtNS4xMGEiIGRlZmluaXRpb24gb24gSkg3MTEw77yIaGFzIGJlZW4g
dGVzdGVkIG9uIHRoZSBWaXNpb25GaXZlIHYyIGJvYXJkcyBhbmQgd29ya3Mgbm9ybWFsbHnvvIks
IGRvIHlvdSBoYXZlIGFueSBiZXR0ZXIgc3VnZ2VzdGlvbnM/CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
