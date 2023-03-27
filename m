Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F35C7619A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Mar 2023 11:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWMXFVDGR3+g8ivS/e719zR4JKUU3dUzp565EFOTI5M=; b=MVXB9mfqGh2/uU
	r1HEZ+sIb6UthUGLY2Oq//QZfegkgAuGrrw1EDIwF32+svdWRfinoGKNHAvLumBpMpPeepwzvxkYS
	sz5FyaAoXaER68lSUDv17Yk6v9PwVYBuW4OXl5Oy94yPm4Bhg4MKm3LobtUYaiCsZDkRfWymOOQ80
	NzBELxTAhR5FaqqgabKaE9CaSxbvy1cG1s3BrrTJUCoKftRF1Z/X667RuODB7DnQBdpODoVXTuoY+
	k1yjNrj520p2e9+yAFWJKvJLWhpruoSXVDh3KVzkXuo62bMma7wBnnnIqRvQgc9BzGM/RnHcXOyPp
	tj4d5AjzJZDL6bD/B8hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkey-00Ai0H-2u;
	Mon, 27 Mar 2023 11:05:08 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkev-00AhwG-0T;
	Mon, 27 Mar 2023 11:05:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 99C8324E1BE;
	Mon, 27 Mar 2023 19:04:38 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 19:04:38 +0800
Received: from [192.168.125.108] (113.72.145.117) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Mar
 2023 19:04:37 +0800
Message-ID: <2d46a4ab-f5d3-60b2-6650-3a35395c0eb8@starfivetech.com>
Date: Mon, 27 Mar 2023 19:04:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 3/5] dt-binding: Add JH7110 USB wrapper layer doc.
Content-Language: en-US
To: Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-4-minda.chen@starfivetech.com>
 <7799e176e73d1385322e5efba8479e56544c664b.camel@pengutronix.de>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <7799e176e73d1385322e5efba8479e56544c664b.camel@pengutronix.de>
X-Originating-IP: [113.72.145.117]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_040505_495966_68AE7EF3 
X-CRM114-Status: UNSURE (   9.77  )
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

CgpPbiAyMDIzLzMvMjMgMTc6MjMsIFBoaWxpcHAgWmFiZWwgd3JvdGU6Cj4gT24gTWksIDIwMjMt
MDMtMTUgYXQgMTg6NDQgKzA4MDAsIE1pbmRhIENoZW4gd3JvdGU6Cj4+IFRoZSBkdC1iaW5kaW5n
IGRvYyBvZiBDYWRlbmNlIFVTQlNTLURSRCBjb250cm9sbGVyIHdyYXBwZXIKPj4gbGF5ZXIuCj4+
IAo+PiBTaWduZWQtb2ZmLWJ5OiBNaW5kYSBDaGVuIDxtaW5kYS5jaGVuQHN0YXJmaXZldGVjaC5j
b20+Cj4+IC0tLQo+PiDCoC4uLi9iaW5kaW5ncy91c2Ivc3RhcmZpdmUsamg3MTEwLXVzYi55YW1s
ICAgICB8IDExOSArKysrKysrKysrKysrKysrKysKPj4gwqAxIGZpbGUgY2hhbmdlZCwgMTE5IGlu
c2VydGlvbnMoKykKPj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9zdGFyZml2ZSxqaDcxMTAtdXNiLnlhbWwKPj4gCj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3N0YXJmaXZlLGpoNzEx
MC11c2IueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2Ivc3RhcmZp
dmUsamg3MTEwLXVzYi55YW1sCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAw
MDAwMDAwMC4uYjFhOGRjNmQ3YjRiCj4+IC0tLSAvZGV2L251bGwKPj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zdGFyZml2ZSxqaDcxMTAtdXNiLnlhbWwKPj4g
QEAgLTAsMCArMSwxMTkgQEAKPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4w
LW9ubHkgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvdXNiL3N0YXJmaXZlLGpoNzExMC11c2IueWFtbCMK
Pj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iwo+PiArCj4+ICt0aXRsZTogU3RhckZpdmUgSkg3MTEwIHdyYXBwZXIgbW9kdWxlIGZvciB0aGUg
Q2FkZW5jZSBVU0JTUy1EUkQgY29udHJvbGxlcgo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAg
LSBNaW5kYSBDaGVuIDxtaW5kYS5jaGVuQHN0YXJmaXZldGVjaC5jb20+Cj4+ICsKPj4gK3Byb3Bl
cnRpZXM6Cj4+ICsgIGNvbXBhdGlibGU6Cj4+ICsgICAgY29uc3Q6IHN0YXJmaXZlLGpoNzExMC11
c2IKPj4gKwo+PiArICBjbG9ja3M6Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGRlc2NyaXB0
aW9uOiBscG0gY2xvY2sKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHN0YiBjbG9jawo+PiArICAg
ICAgLSBkZXNjcmlwdGlvbjogYXBiIGNsb2NrCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBheGkg
Y2xvY2sKPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IHV0bWkgYXBiIGNsb2NrCj4+ICsKPj4gKyAg
Y2xvY2stbmFtZXM6Cj4+ICsgICAgaXRlbXM6Cj4+ICsgICAgICAtIGNvbnN0OiBscG0KPj4gKyAg
ICAgIC0gY29uc3Q6IHN0Ygo+PiArICAgICAgLSBjb25zdDogYXBiCj4+ICsgICAgICAtIGNvbnN0
OiBheGkKPj4gKyAgICAgIC0gY29uc3Q6IHV0bWlfYXBiCj4+ICsKPj4gKyAgcmVzZXRzOgo+PiAr
ICAgIGl0ZW1zOgo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogUFdSVVAgcmVzZXQKPj4gKyAgICAg
IC0gZGVzY3JpcHRpb246IEFQQiByZXNldAo+PiArICAgICAgLSBkZXNjcmlwdGlvbjogQVhJIHJl
c2V0Cj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBVVE1JX0FQQiByZXNldAo+IAo+IEknZCBhZGQg
YSAicmVzZXQtbmFtZXMiIHByb3BlcnR5LCBqdXN0IGluIGNhc2UgdGhlcmUgaXMgZXZlciBhIHJl
YXNvbgo+IHRvIHRyaWdnZXIgYW55IG9mIHRoZSByZXNldHMgaW5kZXBlbmRlbnRseSBmcm9tIHRo
ZSBvdGhlcnMuCj4gCk9LLCBUaGFua3MKPiByZWdhcmRzCj4gUGhpbGlwcAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
