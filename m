Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF374C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 01:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxKOLFeW9yGa1FiXoVhOwnDvQk8iWzrDWNW/xSuTlrU=; b=DIMTffOBmQqMrb
	A1M8qsNamaztc1NXlttAjeH3wqtOQprGtOKfTGPAAqxehG5jNSm8Bw4wTvSbwW9oDwP/yIKex97qc
	micizqBM9ktuA37dlev2iurdsHwDNXUurCBCqdNvzq8R8d9FQrfLt5RKmFJqw7Wf2VmXo5/MiDK6X
	w54/Y8b5XYUbYKQ/9os47EXZaP+tP07ibKZNFjlZkdNQcn0xhxSw/CBDzYYvmAFkZxiLPAxkZUcLu
	EU4JMeIBYh5At0TxkEFnHL/KCmZ6sJIYgiVVkwbyOw7Zo8wVZydOXJD2HU9BpXtwbWx11ANz0xLnP
	AT9lJ4qD2+jyR3LmeZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUHAz-0096Ae-1I;
	Fri, 11 Aug 2023 01:42:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUHAv-00969I-35
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 01:42:51 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 0B0CB24E17F;
	Fri, 11 Aug 2023 09:42:06 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 11 Aug
 2023 09:42:06 +0800
Received: from [192.168.120.43] (171.223.208.138) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 11 Aug
 2023 09:42:04 +0800
Message-ID: <2bf16511-b57b-0981-a19b-c04c8c34ce87@starfivetech.com>
Date: Fri, 11 Aug 2023 09:42:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [-next v1 0/1] Fix StarFive JH7110 gmac TCP RX speed issue
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Emil Renner Berthing
	<kernel@esmil.dk>, Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>
References: <20230810074646.19076-1-samin.guo@starfivetech.com>
 <20230810-cresting-talon-51a6c31da4f8@spud>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230810-cresting-talon-51a6c31da4f8@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_184250_279940_472B6B22 
X-CRM114-Status: UNSURE (   8.16  )
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

CgpPbiAyMDIzLzgvMTAgMjM6Mzc6MTMsIENvbm9yIERvb2xleSB3cm90ZToKPiBGcm9tOiBDb25v
ciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IAo+IE9uIFRodSwgMTAgQXVn
IDIwMjMgMTU6NDY6NDUgKzA4MDAsIFNhbWluIEd1byB3cm90ZToKPj4gVGhpcyBwYXRjaCBmaXhl
cyB0aGUgU3RhckZpdmUgSkg3MTEwIGdtYWMgVENQIFJYIHNsb3cgaXNzdWUuIEFuZCBpdCBoYXMg
YmVlbgo+PiB0ZXN0ZWQgb24gVmlzaW9uRml2ZSAyLgo+Pgo+PiBIZXJlIGlzIHRoZSByZXN1bHQg
b2YgdGhlIHRlc3QgKGlwZXJmMyk6Cj4+Cj4+ICAgQmVmb3JlOgo+PiAgICAgICAjIGlwZXJmMyAt
cwo+PiAgICAgICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+PiAgICAgICBTZXJ2ZXIgbGlzdGVuaW5nIG9uIDUyMDEgKHRlc3QgIzEp
Cj4+ICAgICAgIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4+ICAgICAgIEFjY2VwdGVkIGNvbm5lY3Rpb24gZnJvbSAxOTIuMTY4LjEu
NCwgcG9ydCA0NzYwNAo+PiAgICAgICBbICA1XSBsb2NhbCAxOTIuMTY4LjEuMyBwb3J0IDUyMDEg
Y29ubmVjdGVkIHRvIDE5Mi4xNjguMS40IHBvcnQgNDc2MTIKPj4gICAgICAgWyBJRF0gSW50ZXJ2
YWwgICAgICAgICAgIFRyYW5zZmVyICAgICBCaXRyYXRlCj4+ICAgICAgIFsgIDVdICAgMC4wMC0x
LjAwICAgc2VjICAzNi4zIE1CeXRlcyAgIDMwNSBNYml0cy9zZWMKPj4gICAgICAgWyAgNV0gICAx
LjAwLTIuMDAgICBzZWMgIDM1LjYgTUJ5dGVzICAgMjk5IE1iaXRzL3NlYwo+PiAgICAgICBbICA1
XSAgIDIuMDAtMy4wMCAgIHNlYyAgMzYuNSBNQnl0ZXMgICAzMDYgTWJpdHMvc2VjCj4+ICAgICAg
IFsgIDVdICAgMy4wMC00LjAwICAgc2VjICAzNi41IE1CeXRlcyAgIDMwNiBNYml0cy9zZWMKPj4g
ICAgICAgWyAgNV0gICA0LjAwLTUuMDAgICBzZWMgIDM1LjcgTUJ5dGVzICAgMzAwIE1iaXRzL3Nl
Ywo+PiAgICAgICBbICA1XSAgIDUuMDAtNi4wMCAgIHNlYyAgMzUuNCBNQnl0ZXMgICAyOTcgTWJp
dHMvc2VjCj4+ICAgICAgIFsgIDVdICAgNi4wMC03LjAwICAgc2VjICAzNy4xIE1CeXRlcyAgIDMx
MSBNYml0cy9zZWMKPj4gICAgICAgWyAgNV0gICA3LjAwLTguMDAgICBzZWMgIDM1LjYgTUJ5dGVz
ICAgMjk4IE1iaXRzL3NlYwo+PiAgICAgICBbICA1XSAgIDguMDAtOS4wMCAgIHNlYyAgMzYuNCBN
Qnl0ZXMgICAzMDUgTWJpdHMvc2VjCj4+ICAgICAgIFsgIDVdICAgOS4wMC0xMC4wMCAgc2VjICAz
Ni4zIE1CeXRlcyAgIDMwNCBNYml0cy9zZWMKPj4gICAgICAgLSAtIC0gLSAtIC0gLSAtIC0gLSAt
IC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLQo+PiAgICAgICBbIElEXSBJbnRlcnZhbCAgICAg
ICAgICAgVHJhbnNmZXIgICAgIEJpdHJhdGUKPj4gICAgICAgWyAgNV0gICAwLjAwLTEwLjAwICBz
ZWMgICAzNjEgTUJ5dGVzICAgMzAzIE1iaXRzL3NlYyAgICAgICAgcmVjZWl2ZXIKPj4KPj4gWy4u
Ll0KPiAKPiBBcHBsaWVkIHRvIHJpc2N2LWR0LWZvci1uZXh0IHdpdGggdGhlIGNvbnZlcnNpb24g
dG8gZGVjaW1hbCwgdGhhbmtzIQo+IAo+IFsxLzFdIHJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcx
MTA6IEZpeCBHTUFDIGNvbmZpZ3VyYXRpb24KPiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L2Nvbm9yL2MvMTI3M2Y3ZTk2YTcwCj4gCj4gVGhhbmtzLAo+IENvbm9yLgoKSGkgQ29ub3LvvIwK
ClRoYW5rIGEgbG90IGZvciBmb3IgbWVyZ2luZyBpbnRvIHRoZSBuZXh0IGJyYW5jaCBzbyBwcm9t
cHRsee+8gQogCkJlc3QgcmVnYXJkcywKU2FtaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
