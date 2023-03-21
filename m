Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AECFC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 01:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a1wshX+H5VU08C8ayoOz6rkqUfdvKVQA7F4Y1o1NL6c=; b=ebcassrVWYcysS
	rx/DjGLo1PXuKJ6JyG3/tly6oTZ61J6GTOgvYQfjNiHmgII6+Y0bOY5wqwq4EXthGUf9flLnV7hNC
	A/0IpvNLe78SUYL9wruHI8ImEUXKynPQCRVQoWg0mkOAXHMaDF7iYgCOvkRJQhVjonktsIIpJyRbh
	t54qsbehBdFw75GLl9VWXw82PszHRQ9z9FaE0cUTkwPw0HLAaHetLU+Sz66Cs3Yk0TJvvRg6lSstL
	y38WcD7ytYy8gAGl6qpY2u4Q8iDZLEJVcHTTAEIVLeHutnYiGUdtQY0hFZ/Hrp+raUs/975CBQp7W
	ITG+EMly1O4q5CzNw4kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRFZ-00AyWv-1p;
	Tue, 21 Mar 2023 01:57:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRFV-00AyU5-2v;
	Tue, 21 Mar 2023 01:57:20 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 7830324E231;
	Tue, 21 Mar 2023 09:56:42 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 09:56:42 +0800
Received: from [192.168.125.82] (183.27.97.64) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 09:56:41 +0800
Message-ID: <c2a42311-1e26-f2be-6945-df45b1d81b70@starfivetech.com>
Date: Tue, 21 Mar 2023 09:56:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu
	<jack.zhu@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
 <20230315100421.133428-2-changhuang.liang@starfivetech.com>
 <20230320151437.GA1709620-robh@kernel.org>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20230320151437.GA1709620-robh@kernel.org>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_185718_234694_FB4ED868 
X-CRM114-Status: UNSURE (   7.07  )
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

CgpPbiAyMDIzLzMvMjAgMjM6MTQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDE1
LCAyMDIzIGF0IDAzOjA0OjE5QU0gLTA3MDAsIENoYW5naHVhbmcgTGlhbmcgd3JvdGU6Cj4+IFsu
Li5dCj4+ICsgIHJlc2V0czoKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246
IERQSFlfSFcgcmVzZXQKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IERQSFlfQjA5X0FMV0FZU19P
TiByZXNldAo+PiArCj4+ICsgIHN0YXJmaXZlLGFvbi1zeXNjb246Cj4+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+PiArICAgIGl0ZW1z
Ogo+PiArICAgICAgLSBpdGVtczoKPj4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiBwaGFuZGxl
IG9mIEFPTiBTWVNDT04KPj4gKyAgICAgICAgICAtIGRlc2NyaXB0aW9uOiByZWdpc3RlciBvZmZz
ZXQKPj4gKyAgICBkZXNjcmlwdGlvbjogVGhlIHBvd2VyIG9mIGRwaHkgcnggaXMgY29uZmlndXJl
ZCBieSBBT04gU1lTQ09OCj4+ICsgICAgICBpbiB0aGlzIHByb3BlcnR5Lgo+IAo+IFNvdW5kcyBs
aWtlIEFPTiBTWVNDT04gc2hvdWxkIGJlIGEgcG93ZXItZG9tYWlucyBwcm92aWRlci4gQ3VzdG9t
IAo+IHBoYW5kbGUgbGlua3MgYXJlIGZvciB0aGluZ3Mgd2hpY2ggZG9uJ3QgZml0IHN0YW5kYXJk
IGJpbmRpbmdzLgo+IApIaSwgUm9iCgpJbiBzdGFyZml2ZSBqaDcxMTAgU29D77yMd2UgaGF2ZSBh
Y2hpZXZlZCB0aGUgcG93ZXItZG9tYWlucyBwcm92aWRlciBhcyBmb2xsb3c6Cmh0dHBzOi8vcGF0
Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1wbS9jb3Zlci8yMDIzMDExOTA5NDQ0Ny4y
MTkzOS0xLXdhbGtlci5jaGVuQHN0YXJmaXZldGVjaC5jb20vCgpCdXQgdGhpcyBBT04gU1lTQ09O
IGlzIGEgbWlzY2VsbGFuZW91cyByZWdpc3Rlci4gSXQgZGlmZmVyZW50IG9mZnNldHMgY29uZmln
dXJlIHRoZSBkaWZmZXJlbnQgZnVuY3Rpb25zIApvZiB0aGUgZGlmZmVyZW50IG1vZHVsZXMuIFNv
IHdlIGRvbid0IG1ha2UgYSBmcmFtZXdvcmsgZm90IGl0LiBXaGF0IGRvIHlvdSB0aGluaz8KClRo
YW5rcwoKPj4gKwo+PiArICAiI3BoeS1jZWxscyI6Cj4+ICsgICAgY29uc3Q6IDAKPj4gKwo+PiAr
cmVxdWlyZWQ6Cj4+ICsgIC0gY29tcGF0aWJsZQo+PiArICAtIHJlZwo+PiArICAtIGNsb2Nrcwo+
PiArICAtIGNsb2NrLW5hbWVzCj4+ICsgIC0gcmVzZXRzCj4+ICsgIC0gc3RhcmZpdmUsYW9uLXN5
c2Nvbgo+PiArICAtICIjcGh5LWNlbGxzIgo+PiBbLi4uXQo+PgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
