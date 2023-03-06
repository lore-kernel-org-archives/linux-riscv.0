Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0BAC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 02:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pBYOR31Spb6TpEUGP2RHSFUmSxYiJc2V0Sn7JTER6P4=; b=Hxx4V4x8yK2FSO
	RdRE1ChPAdVIPyAY77X78gJHqdqmTYXL1hVNFSZCWOthF9RU3IuD5REbo5V4R9rtWAb/Pz+GH53N9
	P+RQGxrzRP9/q9T6duAMlJY42ukJWUr5yhhe0N3zgM8d4LYmGthdfKrFge0RGh/JYo4eOl8N9UyS9
	b34lflFRhVENncaeBXW35kgKfgIIOgv0YhoMcaszL1D/MoVTBXjwLG0UnjhbpWys6cx8k2q6VsuRX
	WRX8zgtNUJ4b7av+mXL4RcBZWCNabvyz004HYWYjN6kMk+K+1QxyV/zjkESNWrKVx2UG6R0Pt1JDk
	mJ0rby9MOG8ywk1G2hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ0SN-00AynD-4X; Mon, 06 Mar 2023 02:20:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ0SH-00Aylv-QN
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 02:20:04 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EED2624E34B;
	Mon,  6 Mar 2023 10:19:18 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 10:19:19 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 6 Mar
 2023 10:19:17 +0800
Message-ID: <9093ee69-eee3-7a6c-794e-3df2be11496e@starfivetech.com>
Date: Mon, 6 Mar 2023 10:19:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 05/12] riscv: dts: starfive: jh7110: Add ethernet
 device nodes
To: Andrew Lunn <andrew@lunn.ch>
CC: <linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "David S .
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Heiner Kallweit
	<hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang
	<yanhong.wang@starfivetech.com>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-6-samin.guo@starfivetech.com> <ZAH6CGoXBKz0FmW3@lunn.ch>
Content-Language: en-US
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <ZAH6CGoXBKz0FmW3@lunn.ch>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_182002_286768_89EBC6D5 
X-CRM114-Status: UNSURE (   9.21  )
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

CgrlnKggMjAyMy8zLzMgMjE6NDU6NDQsIEFuZHJldyBMdW5uIOWGmemBkzoKPj4gKwkJZ21hYzA6
IGV0aGVybmV0QDE2MDMwMDAwIHsKPj4gKwkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEw
LWR3bWFjIiwgInNucHMsZHdtYWMtNS4yMCI7Cj4+ICsJCQlyZWcgPSA8MHgwIDB4MTYwMzAwMDAg
MHgwIDB4MTAwMDA+Owo+PiArCQkJY2xvY2tzID0gPCZhb25jcmcgSkg3MTEwX0FPTkNMS19HTUFD
MF9BWEk+LAo+PiArCQkJCSA8JmFvbmNyZyBKSDcxMTBfQU9OQ0xLX0dNQUMwX0FIQj4sCj4+ICsJ
CQkJIDwmc3lzY3JnIEpINzExMF9TWVNDTEtfR01BQzBfUFRQPiwKPj4gKwkJCQkgPCZhb25jcmcg
Skg3MTEwX0FPTkNMS19HTUFDMF9UWF9JTlY+LAo+PiArCQkJCSA8JnN5c2NyZyBKSDcxMTBfU1lT
Q0xLX0dNQUMwX0dUWEM+Owo+PiArCQkJY2xvY2stbmFtZXMgPSAic3RtbWFjZXRoIiwgInBjbGsi
LCAicHRwX3JlZiIsCj4+ICsJCQkJICAgICAgInR4IiwgImd0eCI7Cj4+ICsJCQlyZXNldHMgPSA8
JmFvbmNyZyBKSDcxMTBfQU9OUlNUX0dNQUMwX0FYST4sCj4+ICsJCQkJIDwmYW9uY3JnIEpINzEx
MF9BT05SU1RfR01BQzBfQUhCPjsKPj4gKwkJCXJlc2V0LW5hbWVzID0gInN0bW1hY2V0aCIsICJh
aGIiOwo+PiArCQkJaW50ZXJydXB0cyA9IDw3PiwgPDY+LCA8NT47Cj4+ICsJCQlpbnRlcnJ1cHQt
bmFtZXMgPSAibWFjaXJxIiwgImV0aF93YWtlX2lycSIsICJldGhfbHBpIjsKPj4gKwkJCXBoeS1t
b2RlID0gInJnbWlpLWlkIjsKPiAKPiBwaHktbW9kZSBpcyBhIGJvYXJkIHByb3BlcnR5LCBub3Qg
YSBTb0MgcHJvcGVydHkuIEl0IHNob3VsZCBiZSBpbiB0aGUKPiBib2FyZCAuZHRzIGZpbGUsIG5v
dCB0aGUgU29DIC5kdHNpIGZpbGUuCgpUaGFua3MuIEkgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQg
dmVyc2lvbi4KPiAKPj4gKwkJCXNucHMsbXVsdGljYXN0LWZpbHRlci1iaW5zID0gPDY0PjsKPj4g
KwkJCXNucHMscGVyZmVjdC1maWx0ZXItZW50cmllcyA9IDw4PjsKPj4gKwkJCXJ4LWZpZm8tZGVw
dGggPSA8MjA0OD47Cj4+ICsJCQl0eC1maWZvLWRlcHRoID0gPDIwNDg+Owo+PiArCQkJc25wcyxm
aXhlZC1idXJzdDsKPj4gKwkJCXNucHMsbm8tcGJsLXg4Owo+PiArCQkJc25wcyxmb3JjZV90aHJl
c2hfZG1hX21vZGU7Cj4+ICsJCQlzbnBzLGF4aS1jb25maWcgPSA8JnN0bW1hY19heGlfc2V0dXA+
Owo+PiArCQkJc25wcyx0c287Cj4+ICsJCQlzbnBzLGVuLXR4LWxwaS1jbG9ja2dhdGluZzsKPj4g
KwkJCXNucHMsdHhwYmwgPSA8MTY+Owo+PiArCQkJc25wcyxyeHBibCA9IDwxNj47Cj4+ICsJCQlz
dGF0dXMgPSAiZGlzYWJsZWQiOwo+PiArCQkJcGh5LWhhbmRsZSA9IDwmcGh5MD47Cj4gCj4gVGhl
IFBIWSBpcyBleHRlcm5hbCwgc28gdGhpcyBpcyBhbHNvIGEgYm9hcmQgcHJvcGVydHksIG5vdCBh
IFNvQwo+IHByb3BlcnR5LiAKV2lsbCBmaXgsIHRoYW5rcy4KPiAKPj4gKwo+PiArCQkJbWRpbyB7
Cj4+ICsJCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4+ICsJCQkJI3NpemUtY2VsbHMgPSA8MD47
Cj4+ICsJCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3bWFjLW1kaW8iOwo+PiArCj4+ICsJCQkJcGh5
MDogZXRoZXJuZXQtcGh5QDAgewo+PiArCQkJCQlyZWcgPSA8MD47Cj4+ICsJCQkJfTsKPiAKPiBU
aGUgUEhZIGlzIGFsc28gYSBib2FyZCBwcm9wZXJ0eS4gWW91IGNvdWxkIGZvciBleGFtcGxlIGRl
c2lnbiBhIGJvYXJkCj4gd2hlcmUgYm90aCBQSFlzIGFyZSBvbiBvbmUgTURJTyBidXMsIGluIG9y
ZGVyIHRvIHNhdmUgdHdvIFNvQyBwaW5zLgoKU291bmRzIGxpa2UgYSBnb29kIGlkZWEuCj4gCj4g
ICAgICAgQW5kcmV3CgpUaGFuayB5b3UgZm9yIHRha2luZyB0aGUgdGltZSB0byByZXZpZXcuCi0t
IApCZXN0IHJlZ2FyZHMsClNhbWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
