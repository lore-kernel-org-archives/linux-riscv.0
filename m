Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86891C001DB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VSF1TCc02PdZWwe12ilstwUDhWS2mfLqZ6/thXbS4Ow=; b=CbebQA1rFXBUY2
	MNenttwYSC/QRduzv51yubSNPj7AnelH3RhZoeRc6un3CtoqTjuQF/CmyeRFoH/kaNX6YThtRCE8g
	vmx3fEJE/tXGigKH30WRgr+mrRgZjQhK38JscIOMi6q/tXvUxu0w4UNzCM3+DrRY/SME33ccxyiwu
	FbnRe02mUE59Y6s+LOclKA1/aqIvk/kman4f+ju4qh1OlpV5uiBSfwh/aJN0sLWaD0A6qKnvPIJAX
	oC9+sYHJEuWPSqyXi75PyzTVzMisPVKl2VO+aDSDYJ8UM7oDixZm2RSERoXJGVr1FGeiGEWXBX2Ar
	UDafbqqKlRmfEfdmh/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3K8-007JX2-32;
	Thu, 10 Aug 2023 10:55:24 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3K5-007JTz-0k
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 10:55:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4960E24E31A;
	Thu, 10 Aug 2023 18:54:41 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 10 Aug
 2023 18:54:41 +0800
Received: from [192.168.120.43] (171.223.208.138) by EXMBX062.cuchost.com
 (172.16.6.62) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 10 Aug
 2023 18:54:40 +0800
Message-ID: <37f5c947-5bba-0add-4805-1ce800f99aff@starfivetech.com>
Date: Thu, 10 Aug 2023 18:54:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [-next v1 1/1] riscv: dts: starfive: jh7110: Fix GMAC
 configuration
To: Conor Dooley <conor.dooley@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, "Emil
 Renner Berthing" <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>
References: <20230810074646.19076-1-samin.guo@starfivetech.com>
 <20230810074646.19076-2-samin.guo@starfivetech.com>
 <20230810-suitable-truffle-eac5d7f93377@wendy>
Content-Language: en-US
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230810-suitable-truffle-eac5d7f93377@wendy>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_035521_556456_656AD60C 
X-CRM114-Status: UNSURE (   6.87  )
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

CgpvbiAyMDIzLzgvMTAgMTg6NDg6MzgsIENvbm9yIERvb2xleSB3cm90ZToKPiBPbiBUaHUsIEF1
ZyAxMCwgMjAyMyBhdCAwMzo0Njo0NlBNICswODAwLCBTYW1pbiBHdW8gd3JvdGU6Cj4+IEZpeGVk
IGNvbmZpZ3VyYXRpb24gdG8gaW1wcm92ZSB0aGUgc3BlZWQgb2YgVENQIFJYLgo+Pgo+PiBCZWZv
cmU6Cj4+ICAgIyBpcGVyZjMgLXMKPj4gICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIFNlcnZlciBsaXN0ZW5pbmcgb24gNTIw
MSAodGVzdCAjMSkKPj4gICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIEFjY2VwdGVkIGNvbm5lY3Rpb24gZnJvbSAxOTIuMTY4
LjEuNCwgcG9ydCA0NzYwNAo+PiAgIFsgIDVdIGxvY2FsIDE5Mi4xNjguMS4zIHBvcnQgNTIwMSBj
b25uZWN0ZWQgdG8gMTkyLjE2OC4xLjQgcG9ydCA0NzYxMgo+PiAgIFsgSURdIEludGVydmFsICAg
ICAgICAgICBUcmFuc2ZlciAgICAgQml0cmF0ZQo+PiAgIFsgIDVdICAgMC4wMC0xLjAwICAgc2Vj
ICAzNi4zIE1CeXRlcyAgIDMwNSBNYml0cy9zZWMKPj4gICBbICA1XSAgIDEuMDAtMi4wMCAgIHNl
YyAgMzUuNiBNQnl0ZXMgICAyOTkgTWJpdHMvc2VjCj4+ICAgWyAgNV0gICAyLjAwLTMuMDAgICBz
ZWMgIDM2LjUgTUJ5dGVzICAgMzA2IE1iaXRzL3NlYwo+PiAgIFsgIDVdICAgMy4wMC00LjAwICAg
c2VjICAzNi41IE1CeXRlcyAgIDMwNiBNYml0cy9zZWMKPj4gICBbICA1XSAgIDQuMDAtNS4wMCAg
IHNlYyAgMzUuNyBNQnl0ZXMgICAzMDAgTWJpdHMvc2VjCj4+ICAgWyAgNV0gICA1LjAwLTYuMDAg
ICBzZWMgIDM1LjQgTUJ5dGVzICAgMjk3IE1iaXRzL3NlYwo+PiAgIFsgIDVdICAgNi4wMC03LjAw
ICAgc2VjICAzNy4xIE1CeXRlcyAgIDMxMSBNYml0cy9zZWMKPj4gICBbICA1XSAgIDcuMDAtOC4w
MCAgIHNlYyAgMzUuNiBNQnl0ZXMgICAyOTggTWJpdHMvc2VjCj4+ICAgWyAgNV0gICA4LjAwLTku
MDAgICBzZWMgIDM2LjQgTUJ5dGVzICAgMzA1IE1iaXRzL3NlYwo+PiAgIFsgIDVdICAgOS4wMC0x
MC4wMCAgc2VjICAzNi4zIE1CeXRlcyAgIDMwNCBNYml0cy9zZWMKPj4gICAtIC0gLSAtIC0gLSAt
IC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtCj4+ICAgWyBJRF0gSW50ZXJ2YWwg
ICAgICAgICAgIFRyYW5zZmVyICAgICBCaXRyYXRlCj4+ICAgWyAgNV0gICAwLjAwLTEwLjAwICBz
ZWMgICAzNjEgTUJ5dGVzICAgMzAzIE1iaXRzL3NlYyAgICAgICAgcmVjZWl2ZXIKPj4KPj4gQWZ0
ZXI6Cj4+ICAgIyBpcGVyZjMgLXMKPj4gICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIFNlcnZlciBsaXN0ZW5pbmcgb24gNTIw
MSAodGVzdCAjMSkKPj4gICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIEFjY2VwdGVkIGNvbm5lY3Rpb24gZnJvbSAxOTIuMTY4
LjEuNCwgcG9ydCA0NzcxMAo+PiAgIFsgIDVdIGxvY2FsIDE5Mi4xNjguMS4zIHBvcnQgNTIwMSBj
b25uZWN0ZWQgdG8gMTkyLjE2OC4xLjQgcG9ydCA0NzcyMAo+PiAgIFsgSURdIEludGVydmFsICAg
ICAgICAgICBUcmFuc2ZlciAgICAgQml0cmF0ZQo+PiAgIFsgIDVdICAgMC4wMC0xLjAwICAgc2Vj
ICAgMTExIE1CeXRlcyAgIDkzMiBNYml0cy9zZWMKPj4gICBbICA1XSAgIDEuMDAtMi4wMCAgIHNl
YyAgIDExMSBNQnl0ZXMgICA5MzQgTWJpdHMvc2VjCj4+ICAgWyAgNV0gICAyLjAwLTMuMDAgICBz
ZWMgICAxMTEgTUJ5dGVzICAgOTM0IE1iaXRzL3NlYwo+PiAgIFsgIDVdICAgMy4wMC00LjAwICAg
c2VjICAgMTExIE1CeXRlcyAgIDkzNCBNYml0cy9zZWMKPj4gICBbICA1XSAgIDQuMDAtNS4wMCAg
IHNlYyAgIDExMSBNQnl0ZXMgICA5MzQgTWJpdHMvc2VjCj4+ICAgWyAgNV0gICA1LjAwLTYuMDAg
ICBzZWMgICAxMTEgTUJ5dGVzICAgOTM1IE1iaXRzL3NlYwo+PiAgIFsgIDVdICAgNi4wMC03LjAw
ICAgc2VjICAgMTExIE1CeXRlcyAgIDkzNCBNYml0cy9zZWMKPj4gICBbICA1XSAgIDcuMDAtOC4w
MCAgIHNlYyAgIDExMSBNQnl0ZXMgICA5MzUgTWJpdHMvc2VjCj4+ICAgWyAgNV0gICA4LjAwLTku
MDAgICBzZWMgICAxMTEgTUJ5dGVzICAgOTM0IE1iaXRzL3NlYwo+PiAgIFsgIDVdICAgOS4wMC0x
MC4wMCAgc2VjICAgMTExIE1CeXRlcyAgIDkzNCBNYml0cy9zZWMKPj4gICBbICA1XSAgMTAuMDAt
MTAuMDAgIHNlYyAgIDE2NyBLQnl0ZXMgICA5MzMgTWJpdHMvc2VjCj4+ICAgLSAtIC0gLSAtIC0g
LSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLSAtIC0gLQo+PiAgIFsgSURdIEludGVydmFs
ICAgICAgICAgICBUcmFuc2ZlciAgICAgQml0cmF0ZQo+PiAgIFsgIDVdICAgMC4wMC0xMC4wMCAg
c2VjICAxLjA5IEdCeXRlcyAgIDkzNCBNYml0cy9zZWMgICAgICAgIHJlY2VpdmVyCj4+Cj4+IFJl
dmlld2VkLWJ5OiBIYWwgRmVuZyA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT4KPj4gU2lnbmVk
LW9mZi1ieTogU2FtaW4gR3VvIDxzYW1pbi5ndW9Ac3RhcmZpdmV0ZWNoLmNvbT4KPiAKPiBUaGlz
IGlzCj4gRml4ZXM6IDFmZjE2NmM5Nzk3MiAoInJpc2N2OiBkdHM6IHN0YXJmaXZlOiBqaDcxMTA6
IEFkZCBldGhlcm5ldCBkZXZpY2Ugbm9kZXMiKQo+IHJpZ2h0PwoKSGkgQ29ub3LvvIwKClllcy4g
VGhlcmUgaXMgYW4gaXNzdWUgd2l0aCB0aGUgY29uZmlndXJhdGlvbiBvZiB0aGUgMWZmMTY2Yzk3
OTcyIHRoYXQgYWZmZWN0cyB0aGUgc3BlZWQgb2YgdGhlIEdNQUMgVENQIFJYLgoKQmVzdCByZWdh
cmRzLApTYW1pbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
