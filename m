Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF051C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb8goFWB7a/zRfSAWJL92uzbu/Expn/e3CjZLoUy83I=; b=4XigPb6y8ZKq4d
	Yu/fRL8QZtXcbcRfnrNGgUSdaowGy5ICJNd3wBmSRMoEhefPFT3sORRXghwiWhgrP3Pr4/hPJv9wL
	OSydPzZmbAgqPsTLsdPvEtGNcXP//pGPEF16t4gG+jMsy2JoVbQ9WZzCtd+xUqgbMQTlPfLwu0nHa
	/Uh84hACqQQafKpD8z+6L5WRjc1j+ik4Xvp9BfD5yyoKRXqmfZ172kcP4NMGhclb/g/fp7xjB4duw
	aTxFqo4jmJnyEo9Q8ogyaKe6IDuMn2k53/nfPAbfpl/nRwYEQjEW4bGXjXb11nd+cqtHm+eNlGwGv
	U+Oj/PU0MNWhHnUupLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbXh-009ZhG-7q; Thu, 16 Feb 2023 10:31:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSbXa-009Ze9-T0
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 10:31:07 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A88B124E1E1;
	Thu, 16 Feb 2023 18:30:36 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 18:30:36 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Feb
 2023 18:30:35 +0800
Message-ID: <4b9edac8-20bf-be1c-6b32-69b7f7616ad5@starfivetech.com>
Date: Thu, 16 Feb 2023 18:30:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 4/4] dt-bindings: syscon: Add StarFive syscon doc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-5-william.qiu@starfivetech.com>
 <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <41bcc545-6eda-6c30-c600-d97ef009abf2@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_023103_234428_52E71399 
X-CRM114-Status: GOOD (  10.11  )
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

CgpPbiAyMDIzLzIvMTYgMTg6MjMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMTUv
MDIvMjAyMyAxMjozMiwgV2lsbGlhbSBRaXUgd3JvdGU6Cj4+IEFkZCBkb2N1bWVudGF0aW9uIHRv
IGRlc2NyaWJlIFN0YXJGaXZlIFN5c3RlbSBDb250cm9sbGVyIFJlZ2lzdGVycy4KPj4gCj4+IFNp
Z25lZC1vZmYtYnk6IFdpbGxpYW0gUWl1IDx3aWxsaWFtLnFpdUBzdGFyZml2ZXRlY2guY29tPgo+
PiAtLS0KPiAKPiBUaGFuayB5b3UgZm9yIHlvdXIgcGF0Y2guIFRoZXJlIGlzIHNvbWV0aGluZyB0
byBkaXNjdXNzL2ltcHJvdmUuCj4gCj4+ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+
PiArICAgIGl0ZW1zOgo+PiArICAgICAgLSBlbnVtOgo+PiArICAgICAgICAgIC0gc3RhcmZpdmUs
amg3MTEwLXN0Zy1zeXNjb24KPj4gKyAgICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1zeXMtc3lz
Y29uCj4+ICsgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtYW9uLXN5c2Nvbgo+IAo+IE1heWJl
IGtlZXAgdGhlbSBvcmRlcmVkIGFscGhhYmV0aWNhbGx5Pwo+IAoKSSdtIHNvcnRpbmcgYnkgcmVn
aXN0ZXIgYWRkcmVzcywgb3IgSSBjYW4ga2VlcCB0aGVtIG9yZGVyZWQKYWxwaGFiZXRpY2FsbHnv
vIx3aGljaCBpcyBiZXR0ZXI/Cj4+ICsgICAgICAtIGNvbnN0OiBzeXNjb24KPj4gKwo+PiArICBy
ZWc6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+PiArcmVxdWlyZWQ6Cj4+ICsgIC0gY29tcGF0
aWJsZQo+PiArICAtIHJlZwo+PiArCj4+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPj4g
Kwo+PiArZXhhbXBsZXM6Cj4+ICsgIC0gfAo+PiArICAgIHN5c2NvbkAxMDI0MDAwMCB7Cj4+ICsg
ICAgICAgIGNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEwLXN0Zy1zeXNjb24iLCAic3lzY29u
IjsKPj4gKyAgICAgICAgcmVnID0gPDB4MTAyNDAwMDAgMHgxMDAwPjsKPj4gKyAgICB9Owo+IAo+
IEtlZXAgb25seSBvbmUgZXhhbXBsZS4gQWxsIG90aGVycyBhcmUgdGhlIHNhbWUuCj4gCldpbGwg
dXBkYXRlIGluIG5leHQgdmVyc2lvbi4KVGhhbmtzIGZvciB0YWtpbmcgdGltZXMgdG8gcmV2aWV3
IHRoaXMgcGF0Y2ggc2VyaWVzLgoKQmVzdCByZWdhcmRzCldpbGxpYW0KPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gS3J6eXN6dG9mCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
