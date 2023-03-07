Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D719C61DA4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 01:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQbxwXZMLvU/+kfd/w5I93LMJv8kPMBZq4hFamx2L4U=; b=xYopHXUTZ4ci4i
	fREvbDawHF7978RB8ZIBLdJQCgYACv5jnWRT4l0ZuH+zN9Qvn5xlGPLuZpCbxPe1wHyDa7y1zuO/j
	aTaPDf5E4hOLlzKj8H8QkwEqHixd+0r7AmbStdROg1yO2qohahO21ETkEHqmjj5uWYbLuPBp5p7il
	Xr1pm7X/PJBx0y+k6kyCGlXj+Cvh35kXV0UHvzAe/EkLHyrVIZIwHcqJ4mu2VRBdJmRaLAGnBvQOe
	nkwlKAJEZQ5Blvh6V/dJVMotqMkTuG4QSx9vZ+BJAL2NH+5iEQNV2DDovQRIP9JzmibAEYaipKEB3
	bheFY38PQykq0Dw/3aRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMMt-00Flmt-Qw; Tue, 07 Mar 2023 01:43:55 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZMMp-00Flll-Qs
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 01:43:53 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2164C24E0D8;
	Tue,  7 Mar 2023 09:43:40 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:43:40 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Mar
 2023 09:43:39 +0800
Message-ID: <8bd8654e-4bba-c718-4b17-5291e70f05fe@starfivetech.com>
Date: Tue, 7 Mar 2023 09:43:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 11/12] riscv: dts: starfive: visionfive-2-v1.2a: Add
 gmac+phy's delay configuration
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
 <20230303085928.4535-12-samin.guo@starfivetech.com>
 <CAJM55Z_8m42vfoPDicTP18S6Z1ZXYbFeS1edTjzYVB3Kq2xFeQ@mail.gmail.com>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <CAJM55Z_8m42vfoPDicTP18S6Z1ZXYbFeS1edTjzYVB3Kq2xFeQ@mail.gmail.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_174352_182896_B7A11E66 
X-CRM114-Status: GOOD (  11.54  )
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

CgrlnKggMjAyMy8zLzYgMjE6MDA6MTksIEVtaWwgUmVubmVyIEJlcnRoaW5nIOWGmemBkzoKPiBP
biBGcmksIDMgTWFyIDIwMjMgYXQgMTA6MDEsIFNhbWluIEd1byA8c2FtaW4uZ3VvQHN0YXJmaXZl
dGVjaC5jb20+IHdyb3RlOgo+PiB2MS4yQSBnbWFjMCB1c2VzIG1vdG9yY29tbSBZVDg1MzEocmdt
aWktaWQpIFBIWSwgYW5kIG5lZWRzIGRlbGF5Cj4+IGNvbmZpZ3VyYXRpb25zLgo+Pgo+PiB2MS4y
QSBnbWFjMSB1c2VzIG1vdG9yY29tbSBZVDg1MTIocm1paSkgUEhZLCBhbmQgbmVlZHMgdG8KPj4g
c3dpdGNoIHJ4IGFuZCByeCB0byBleHRlcm5hbCBjbG9jayBzb3VyY2VzLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBTYW1pbiBHdW8gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPgo+PiAtLS0KPj4g
IC4uLi9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjJhLmR0cyB8IDEz
ICsrKysrKysrKysrKysKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2
ZS12aXNpb25maXZlLTItdjEuMmEuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjJhLmR0cwo+PiBpbmRleCA0YWYzMzAwZjNj
ZjMuLjIwNWExM2Q4YzhiMSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLXYxLjJhLmR0cwo+PiArKysgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTItdjEu
MmEuZHRzCj4+IEBAIC0xMSwzICsxMSwxNiBAQAo+PiAgICAgICAgIG1vZGVsID0gIlN0YXJGaXZl
IFZpc2lvbkZpdmUgMiB2MS4yQSI7Cj4+ICAgICAgICAgY29tcGF0aWJsZSA9ICJzdGFyZml2ZSx2
aXNpb25maXZlLTItdjEuMmEiLCAic3RhcmZpdmUsamg3MTEwIjsKPj4gIH07Cj4+ICsKPj4gKyZn
bWFjMSB7Cj4+ICsgICAgICAgcGh5LW1vZGUgPSAicm1paSI7Cj4+ICsgICAgICAgYXNzaWduZWQt
Y2xvY2tzID0gPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19HTUFDMV9UWD4sCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgPCZzeXNjcmcgSkg3MTEwX1NZU0NMS19HTUFDMV9SWD47Cj4+ICsgICAg
ICAgYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDwmc3lzY3JnIEpINzExMF9TWVNDTEtfR01BQzFf
Uk1JSV9SVFg+LAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JnN5c2NyZyBK
SDcxMTBfU1lTQ0xLX0dNQUMxX1JNSUlfUlRYPjsKPj4gK307Cj4+ICsKPj4gKyZwaHkwIHsKPj4g
KyAgICAgICByeC1pbnRlcm5hbC1kZWxheS1wcyA9IDwxOTAwPjsKPj4gKyAgICAgICB0eC1pbnRl
cm5hbC1kZWxheS1wcyA9IDwxMzUwPjsKPj4gK307Cj4gCj4gSGVyZSB5b3UncmUgbm90IHNwZWNp
ZnlpbmcgdGhlIGludGVybmFsIGRlbGF5cyBmb3IgcGh5MSB3aGljaCBtZWFucyBpdAo+IGRlZmF1
bHRzIHRvIDE5NTBwcyBmb3IgYm90aCByeCBhbmQgdHguIElzIHRoYXQgcmlnaHQgb3IgZGlkIHlv
dSBtZWFuCj4gdG8gc2V0IHRoZW0gdG8gMCBsaWtlIHRoZSB2MS4zYiBwaHkxPwoKSGksIGVtaWws
IHVzdWFsbHksIG9ubHkgMTAwME0gKHJnbWlpKSBuZWVkcyB0byBjb25maWd1cmUgdGhlIGRlbGF5
LCBhbmQgMTAwTShybWlpKSBkb2VzIG5vdC4KPiAKPiBBbHNvIHlvdXIgdS1ib290IHNlZW1zIHRv
IHNldCB3aGF0IHRoZSBsaW51eCBwaHkgZHJpdmVyIGNhbGxzCj4gbW90b3Jjb21tLGtlZXAtcGxs
LWVuYWJsZWQgYW5kIG1vdG9yY29tbSxhdXRvLXNsZWVwLWRpc2FibGVkIGZvciBhbGwKPiB0aGUg
cGh5cy4gRGlkIHlvdSBsZWF2ZSB0aG9zZSBvdXQgb24gcHVycG9zZT8KCkhpLCBFbWlsLCBXZSBk
aWQgY29uZmlndXJlIG1vdG9yY29tbSxhdXRvLXNsZWVwLWRpc2FibGVkIGZvciB5dDg1MTIgaW4g
dWJvb3QsIApidXQgWXV0YWkgdXBzdHJlYW0ncyBMaW51eCBkcml2ZXIgb25seSB5dDg1MjEveXQ4
NTMxIHN1cHBvcnRzIHRoaXMgcHJvcGVydHkuIApZdDg1MTIgaXMgYSBHZW5lcmljIFBIWSBkcml2
ZXIgYW5kIGRvZXMgbm90IHN1cHBvcnQgdGhlIGNvbmZpZ3VyYXRpb24gb2YgCm1vdG9yY29tbSxh
dXRvLXNsZWVwLWRpc2FibGVkIGFuZCBtb3RvcmNvbW0sa2VlcC1wbGwtZW5hYmxlZC4KCkFuZCB3
aXRob3V0IGNvbmZpZ3VyaW5nIHRoZXNlIHR3byBhdHRyaWJ1dGVzLCB2ZjItMS4yYSBnbWFjMSBh
bHNvIHdvcmtzIG5vcm1hbGx5LgoKCkJlc3QgcmVnYXJkcywKU2FtaW4KPiAKPj4gLS0KPj4gMi4x
Ny4xCj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCi0tIApCZXN0IHJlZ2FyZHMsClNhbWluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
