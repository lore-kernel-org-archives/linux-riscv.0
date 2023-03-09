Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EB9C678D5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BAILcpxZjf1NRkVQYU2rEzcSULuC5WjxK0fRHdkdCbw=; b=JEy7+uwOQCP9VL
	qW+5FW5JexYyQG40D0aA4nWmJlhAR5isTZd5ygT9v/jTwhUt66vWTbphLqplPkk2VOglNWGm8Ss8+
	qTuunutmwZga1g0NxZ1y1IqLtG9KmkPaHrrvzXxn9pYz84Kb1mETpFOO8XPdvsvbdm+dK/ZfYdC5u
	K7tPblxLkAoqaJkqOzyjMpYzGgnosDruYieuYJ0bN+fxizjFQYLcwRiIceR7bP4TqAJD82QNntHdJ
	iSg9vhyamqhndOBX478Spv6/xyojHSnJQ/zIDwMgOXqzRR4mp1/y7nAwvJCavUoWZyWcZZAgqXIAv
	aJgTVEGNB1vD/awOHLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa4u8-007OUW-73; Thu, 09 Mar 2023 01:17:12 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa4u4-007OQR-6x
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 01:17:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 29B5524E041;
	Thu,  9 Mar 2023 09:16:36 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 09:16:36 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 9 Mar
 2023 09:16:35 +0800
Message-ID: <2097647b-08c4-765b-990e-432961020d17@starfivetech.com>
Date: Thu, 9 Mar 2023 09:16:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 07/12] dt-bindings: net: starfive,jh7110-dwmac: Add
 starfive,syscon
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn
	<andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis
	<pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-8-samin.guo@starfivetech.com>
 <20230308220309.GA3914591-robh@kernel.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <20230308220309.GA3914591-robh@kernel.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_171708_582693_0A8C1D13 
X-CRM114-Status: UNSURE (   9.72  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0K5Li76aKYOiBSZTogW1BBVENIIHY1IDA3
LzEyXSBkdC1iaW5kaW5nczogbmV0OiBzdGFyZml2ZSxqaDcxMTAtZHdtYWM6IEFkZCBzdGFyZml2
ZSxzeXNjb24KRnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCj4gT24gRnJpLCBN
YXIgMDMsIDIwMjMgYXQgMDQ6NTk6MjNQTSArMDgwMCwgU2FtaW4gR3VvIHdyb3RlOgo+PiBBIHBo
YW5kbGUgdG8gc3lzY29uIHdpdGggdHdvIGFyZ3VtZW50cyB0aGF0IGNvbmZpZ3VyZSBwaHkgbW9k
ZS4KPiAKPiBUaGlzIGNoYW5nZSBiZWxvbmdzIGluIHBhdGNoIDQuCj4gClRoYW5rIHlvdSBmb3Ig
cG9pbnRpbmcgb3V0IHRoYXQgdGhlIG5leHQgdmVyc2lvbiB3aWxsIGJlIG1lcmdlZCBpbnRvIHBh
dGNoNAoKCkJlc3QgcmVnYXJkcywKU2FtaW4KCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhbWluIEd1
byA8c2FtaW4uZ3VvQHN0YXJmaXZldGVjaC5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdzL25l
dC9zdGFyZml2ZSxqaDcxMTAtZHdtYWMueWFtbCAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwo+
PiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFj
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0YXJmaXZlLGpo
NzExMC1kd21hYy55YW1sCj4+IGluZGV4IGNhNDlmMDhkNTBkZC4uNzlhZTYzNWRiMGE1IDEwMDY0
NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0YXJmaXZl
LGpoNzExMC1kd21hYy55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwKPj4gQEAgLTU4LDYgKzU4LDE4IEBA
IHByb3BlcnRpZXM6Cj4+ICAgICAgICBUeCBjbG9jayBpcyBwcm92aWRlZCBieSBleHRlcm5hbCBy
Z21paSBjbG9jay4KPj4gICAgICB0eXBlOiBib29sZWFuCj4+ICAKPj4gKyAgc3RhcmZpdmUsc3lz
Y29uOgo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5k
bGUtYXJyYXkKPj4gKyAgICBpdGVtczoKPj4gKyAgICAgIC0gaXRlbXM6Cj4+ICsgICAgICAgICAg
LSBkZXNjcmlwdGlvbjogcGhhbmRsZSB0byBzeXNjb24gdGhhdCBjb25maWd1cmVzIHBoeSBtb2Rl
Cj4+ICsgICAgICAgICAgLSBkZXNjcmlwdGlvbjogT2Zmc2V0IG9mIHBoeSBtb2RlIHNlbGVjdGlv
bgo+PiArICAgICAgICAgIC0gZGVzY3JpcHRpb246IE1hc2sgb2YgcGh5IG1vZGUgc2VsZWN0aW9u
Cj4+ICsgICAgZGVzY3JpcHRpb246Cj4+ICsgICAgICBBIHBoYW5kbGUgdG8gc3lzY29uIHdpdGgg
dHdvIGFyZ3VtZW50cyB0aGF0IGNvbmZpZ3VyZSBwaHkgbW9kZS4KPj4gKyAgICAgIFRoZSBhcmd1
bWVudCBvbmUgaXMgdGhlIG9mZnNldCBvZiBwaHkgbW9kZSBzZWxlY3Rpb24sIHRoZQo+PiArICAg
ICAgYXJndW1lbnQgdHdvIGlzIHRoZSBtYXNrIG9mIHBoeSBtb2RlIHNlbGVjdGlvbi4KPj4gKwo+
PiAgYWxsT2Y6Cj4+ICAgIC0gJHJlZjogc25wcyxkd21hYy55YW1sIwo+PiAgCj4+IEBAIC05Niw2
ICsxMDgsNyBAQCBleGFtcGxlczoKPj4gICAgICAgICAgc25wcyxlbi10eC1scGktY2xvY2tnYXRp
bmc7Cj4+ICAgICAgICAgIHNucHMsdHhwYmwgPSA8MTY+Owo+PiAgICAgICAgICBzbnBzLHJ4cGJs
ID0gPDE2PjsKPj4gKyAgICAgICAgc3RhcmZpdmUsc3lzY29uID0gPCZhb25fc3lzY29uIDB4YyAw
eDFjMDAwMD47Cj4+ICAgICAgICAgIHBoeS1oYW5kbGUgPSA8JnBoeTA+Owo+PiAgCj4+ICAgICAg
ICAgIG1kaW8gewo+PiAtLSAKPj4gMi4xNy4xCj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
