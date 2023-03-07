Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64F6C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 01:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muvpd+VeLgFuk4/BVvr67ZdLy2ZWg5dLfgW/UpE75YI=; b=qzcKgcWJBrrxb6
	Ld8HK1xIcs0XMTCr8I86Xr0hukmKQPxIFDWsFMWsj+A46TE+JLXrobYZmC0m2cmzA5sUsVNmb0WO8
	LOgEwwAp1GuFnFxmY8PGm2waBPEfgXby0cxk8BIw9SGAosXsuYB+PB4NtGPNI2xcumf+sfMk8FOAk
	V0vgljOm4fOaBra6Tp0k2GvySAWbpKcuwzxPoN+hDOIlDEXhLXLEz4amngUfv4/8n5VvNs+w0CWC5
	CPVMO9JDv6QFsEM2LLxnEeSJqO8Fg+C9/bEP9/7K9fCmY91GsWYC1HcTrXK1Xnedusk6aolemHYSB
	l4Ln9KyQUwY9V9DdQhbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZM1S-00FiNn-TH; Tue, 07 Mar 2023 01:21:47 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZM1K-00FiJy-Iu
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 01:21:43 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id B737C24E21B;
	Tue,  7 Mar 2023 09:21:10 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:21:10 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:21:09 +0800
Message-ID: <99a9eccd-2886-832f-07e6-4ba620c522b5@starfivetech.com>
Date: Tue, 7 Mar 2023 09:21:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 12/12] riscv: dts: starfive: visionfive 2: Enable gmac
 device tree node
Content-Language: en-US
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-13-samin.guo@starfivetech.com>
 <CAJM55Z-WpxJUshAa_gN5GD+mMp1VaxPbnF6AV-ua0HzsFWsB6w@mail.gmail.com>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <CAJM55Z-WpxJUshAa_gN5GD+mMp1VaxPbnF6AV-ua0HzsFWsB6w@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_172138_908229_AAD5C36E 
X-CRM114-Status: GOOD (  10.47  )
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

CgrlnKggMjAyMy8zLzYgMjE6MDQ6MjgsIEVtaWwgUmVubmVyIEJlcnRoaW5nIOWGmemBkzoKPiBP
biBGcmksIDMgTWFyIDIwMjMgYXQgMTA6MDEsIFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0YXJmaXZl
dGVjaC5jb20+IHdyb3RlOgo+PiBGcm9tOiBZYW5ob25nIFdhbmcgPHlhbmhvbmcud2FuZ0BzdGFy
Zml2ZXRlY2guY29tPgo+Pgo+PiBVcGRhdGUgZ21hYyBkZXZpY2UgdHJlZSBub2RlIHN0YXR1cyB0
byBva2F5Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZYW5ob25nIFdhbmcgPHlhbmhvbmcud2FuZ0Bz
dGFyZml2ZXRlY2guY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW1pbiBHdW8gPHNhbWluLmd1b0Bz
dGFyZml2ZXRlY2guY29tPgo+PiAtLS0KPj4gIC4uLi9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJm
aXZlLXZpc2lvbmZpdmUtMi5kdHNpICAgICB8IDEwICsrKysrKysrKysKPj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpCj4+
IGluZGV4IGMyYWE4OTQ2YTBmMS4uZDFjNDA5ZjQwMDE0IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNp
b25maXZlLTIuZHRzaQo+PiBAQCAtMTIsNiArMTIsOCBAQAo+PiAgLyB7Cj4+ICAgICAgICAgYWxp
YXNlcyB7Cj4+ICAgICAgICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQwOwo+PiArICAgICAgICAg
ICAgICAgZXRoZXJuZXQwID0gJmdtYWMwOwo+PiArICAgICAgICAgICAgICAgZXRoZXJuZXQxID0g
JmdtYWMxOwo+IAo+IFBsZWFzZSBzb3J0IHRoZXNlIGFscGhhYmV0aWNhbGx5LgpUaGFua3MsIHdp
bGwgZml4Lgo+IAo+PiAgICAgICAgICAgICAgICAgaTJjMCA9ICZpMmMwOwo+PiAgICAgICAgICAg
ICAgICAgaTJjMiA9ICZpMmMyOwo+PiAgICAgICAgICAgICAgICAgaTJjNSA9ICZpMmM1Owo+PiBA
QCAtOTIsNiArOTQsMTQgQEAKPj4gICAgICAgICBzdGF0dXMgPSAib2theSI7Cj4+ICB9Owo+Pgo+
PiArJmdtYWMwIHsKPj4gKyAgICAgICBzdGF0dXMgPSAib2theSI7Cj4+ICt9Owo+PiArCj4+ICsm
Z21hYzEgewo+PiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPj4gK307Cj4gCj4gU2luY2UgeW91
J2xsIG5lZWQgdG8gYWRkIHRvIHRoZSBnbWFjMCBhbmQgZ21hYzEgbm9kZXMgaW4gdGhlIGJvYXJk
Cj4gc3BlY2lmaWMgZmlsZXMgdG9vIGFuZCBpdCdzIG9ubHkgb25lIGxpbmUsIGNvbnNpZGVyIGp1
c3QgZHJvcHBpbmcgdGhpcwo+IGhlcmUgYW5kIGFkZCB0aGUgc3RhdHVzID0gIm9rYXkiIHRoZXJl
IGluc3RlYWQuCj4gCkFjY29yZGluZyB0byBBbmRyZXcncyBzdWdnZXN0aW9uLCBjYW4gSSBwdXQg
dGhlIG5vZGVzIG9mIG1kaW8gYW5kIHBoeSBoZXJlPwo+PiAgJmkyYzAgewo+PiAgICAgICAgIGNs
b2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDA+Owo+PiAgICAgICAgIGkyYy1zZGEtaG9sZC10aW1lLW5z
ID0gPDMwMD47Cj4+IC0tCj4+IDIuMTcuMQo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4g
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpCZXN0IHJlZ2FyZHMsClNhbWluCi0t
IApCZXN0IHJlZ2FyZHMsClNhbWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
