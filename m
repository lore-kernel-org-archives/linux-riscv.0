Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CECC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 03:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIsYWAwwKkmT/Iu6DezWI83CK3HgDv2xkMeBR26oXhs=; b=V5qIhjgScdHHJD
	ZbgRyVfeknPF44yCiz1IpICwv53ysi6Ht6pV/Ydxozxy1GW4+/bEF+ZGm3Jgz0pgP7MirsqKzQwmI
	BPF93LRyKU93zHVvewwpVD6WRDn8qmOA2AxPMJcv7ptlBCi0L99VVzJIefPhYiqj5gGBzLse9/UZU
	AQbDMjYtQgCQdlsLPiAcEeA3D9gzgovr3Xx/p3B+Wpxu3bCFgsvAGzfThBc4rhDoA6wN8enk847TA
	pYBLs08KBIo88cAvjoHBAzWpUe3eXkF9bZANJT7f9be/hX2WQStKtTZOD1G4oPz1bkMiSDtaYXB3a
	FuPXLH7Mjf9TbseLkEUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ZAc-001qHN-16;
	Thu, 01 Jun 2023 03:40:14 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4ZAY-001qE1-0k
	for linux-riscv@lists.infradead.org;
	Thu, 01 Jun 2023 03:40:12 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B065D24DC28;
	Thu,  1 Jun 2023 11:39:26 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Jun
 2023 11:39:26 +0800
Received: from [192.168.125.80] (113.72.147.198) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 1 Jun
 2023 11:39:25 +0800
Message-ID: <94ec74dd-2f04-8dca-35ff-a537811d1ccf@starfivetech.com>
Date: Thu, 1 Jun 2023 11:39:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 19/22] riscv: dts: starfive: Add initial StarFive
 JH7110 device tree
To: Shengyu Qu <wiagn233@outlook.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, <linux-kernel@vger.kernel.org>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
 <20230401111934.130844-20-hal.feng@starfivetech.com>
 <TY3P286MB2611C61D1EDB70BF0A37E65298709@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <TY3P286MB2611C61D1EDB70BF0A37E65298709@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Originating-IP: [113.72.147.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_204010_756281_5A8B815E 
X-CRM114-Status: UNSURE (   9.35  )
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

T24gU3VuLCA3IE1heSAyMDIzIDE4OjAzOjE5ICswODAwLCBTaGVuZ3l1IFF1IHdyb3RlOgo+IEhp
IEhhbCwKPj4gRnJvbTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpCj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZDQ4NGVjZGY5M2Y3Cj4+IC0tLSAvZGV2L251
bGwKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQo+PiBA
QCAtMCwwICsxLDUwOSBAQAo+PiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAg
T1IgTUlUCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDIyIFN0YXJGaXZlIFRlY2hub2xv
Z3kgQ28uLCBMdGQuCj4+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjIgRW1pbCBSZW5uZXIgQmVydGhp
bmcgPGtlcm5lbEBlc21pbC5kaz4KPj4gKyAqLwo+PiArCj4+ICsvZHRzLXYxLzsKPj4gKyNpbmNs
dWRlIDxkdC1iaW5kaW5ncy9jbG9jay9zdGFyZml2ZSxqaDcxMTAtY3JnLmg+Cj4+ICsjaW5jbHVk
ZSA8ZHQtYmluZGluZ3MvcmVzZXQvc3RhcmZpdmUsamg3MTEwLWNyZy5oPgo+PiArCj4+ICsvIHsK
Wy4uLl0KPj4gKwo+PiArwqDCoMKgIHNvYyB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxl
ID0gInNpbXBsZS1idXMiOwo+PiArwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0LXBhcmVudCA9IDwm
cGxpYz47Cj4gCj4gRG8gd2UgcmVhbGx5IG5lZWQgdGhpcyBpbnRlcnJ1cHQtcGFyZW50PyBTZWVt
cyBpdCBpcyBjYXVzaW5nIGEgZGVwZW5kZW5jeSBjeWNsZToKPiAKPiBwbGF0Zm9ybSBzb2M6IEZp
eGVkIGRlcGVuZGVuY3kgY3ljbGUocykgd2l0aCAvc29jL2ludGVycnVwdC1jb250cm9sbGVyQGMw
MDAwMDAKPiAKPiBBbmQgc2VlbXMgZnU3NDAgZHRzIGRvZXNuJ3QgaGF2ZSB0aGlzLgoKU29ycnkg
dG8gcmVwbHkgdG9vIGxhdGUuIElmIHdlIGRyb3AgdGhpcyBsaW5lLCB3ZSBuZWVkIHRvIGFkZCAn
aW50ZXJydXB0LXBhcmVudCcKdG8gZXZlcnkgbm9kZSB3aGljaCB1c2VzIGludGVycnVwdC4gQW5k
IEkgZm91bmQgc29tZSBvdGhlciBwbGF0Zm9ybSBkaWQgdGhlIHNhbWUKc3VjaCBhcyAKCmFyY2gv
cmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQphcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2NhbmFhbi9rMjEwLmR0c2kKYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0
M2YuZHRzaQoKQmVzdCByZWdhcmRzLApIYWwKCj4gCj4+ICvCoMKgwqDCoMKgwqDCoCAjYWRkcmVz
cy1jZWxscyA9IDwyPjsKPj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDI+Owo+PiAr
wqDCoMKgwqDCoMKgwqAgcmFuZ2VzOwo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBjbGludDogdGlt
ZXJAMjAwMDAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3Rh
cmZpdmUsamg3MTEwLWNsaW50IiwgInNpZml2ZSxjbGludDAiOwo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZWcgPSA8MHgwIDB4MjAwMDAwMCAweDAgMHgxMDAwMD47Cj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGludGVycnVwdHMtZXh0ZW5kZWQgPSA8JmNwdTBfaW50YyAzPiwgPCZjcHUw
X2ludGMgNz4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA8JmNwdTFfaW50YyAzPiwgPCZjcHUxX2ludGMgNz4sCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNwdTJfaW50YyAzPiwgPCZj
cHUyX2ludGMgNz4sCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8JmNwdTNfaW50YyAzPiwgPCZjcHUzX2ludGMgNz4sCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNwdTRfaW50YyAzPiwg
PCZjcHU0X2ludGMgNz47Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+ICvCoMKgwqDCoMKg
wqDCoCBjY2FjaGU6IGNhY2hlLWNvbnRyb2xsZXJAMjAxMDAwMCB7Cj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEwLWNjYWNoZSIsICJzaWZpdmUs
Y2NhY2hlMCIsICJjYWNoZSI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAg
MHgyMDEwMDAwIDB4MCAweDQwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1
cHRzID0gPDE+LCA8Mz4sIDw0PiwgPDI+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYWNo
ZS1ibG9jay1zaXplID0gPDY0PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FjaGUtbGV2
ZWwgPSA8Mj47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhY2hlLXNldHMgPSA8MjA0OD47
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhY2hlLXNpemUgPSA8MjA5NzE1Mj47Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhY2hlLXVuaWZpZWQ7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9
Owo+PiArCj4+ICvCoMKgwqDCoMKgwqDCoCBwbGljOiBpbnRlcnJ1cHQtY29udHJvbGxlckBjMDAw
MDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxq
aDcxMTAtcGxpYyIsICJzaWZpdmUscGxpYy0xLjAuMCI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlZyA9IDwweDAgMHhjMDAwMDAwIDB4MCAweDQwMDAwMDA+Owo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZjcHUwX2ludGMgMTE+LAo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjcHUxX2lu
dGMgMTE+LCA8JmNwdTFfaW50YyA5PiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmY3B1Ml9pbnRjIDExPiwgPCZjcHUyX2ludGMgOT4sCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA8JmNw
dTNfaW50YyAxMT4sIDwmY3B1M19pbnRjIDk+LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPCZjcHU0X2ludGMgMTE+LCA8JmNwdTRfaW50YyA5
PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDA+Owo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByaXNjdixuZGV2ID0gPDEzNj47Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4+
ICvCoMKgwqDCoMKgwqDCoCB1YXJ0MDogc2VyaWFsQDEwMDAwMDAwIHsKPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11YXJ0IjsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDEwMDAwMDAwIDB4MCAweDEwMDAwPjsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19VQVJU
MF9DT1JFPiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwmc3lzY3JnIEpI
NzExMF9TWVNDTEtfVUFSVDBfQVBCPjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xvY2st
bmFtZXMgPSAiYmF1ZGNsayIsICJhcGJfcGNsayI7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHJlc2V0cyA9IDwmc3lzY3JnIEpINzExMF9TWVNSU1RfVUFSVDBfQVBCPjsKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0cyA9IDwzMj47Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJlZy1pby13aWR0aCA9IDw0PjsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnLXNo
aWZ0ID0gPDI+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0dXMgPSAiZGlzYWJsZWQi
Owo+PiArwqDCoMKgwqDCoMKgwqAgfTsKPj4gKwpbLi4uXQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
