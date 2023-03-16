Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE03C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BA87xXHyJJ9pm5/sD5aSyiPpso96VIHDpRuIj8+rp6I=; b=ydY9VT1IiYK+y1
	mSfeCMwqhy6akvfEwl0yubo5ffDPbEVGe5SNuRdaGsSHpwRxkTP77OKYu7q6Bwt/auv232ml6uye7
	8eAV6rXaeR2770/1Z8SqNKeM8yxK0H2d53eSYH1W5FjQx9SeIYwU6qf+VqYyrCshfDa5vCW61IJIb
	yPy/2h/Io/z0kRE8b2R5bNTM8JhDeswP6/7UNr6xzyUURG4Awz87n++gFnMdySLWL+rIzJtPv3Iqr
	tmdfqrPR9ksBVS3h5xu1OHCMbPr62PxAIFIuTJK0mFhZ4k2FWJw3PTmgMAsM66MzI8dVUWBkrO4F3
	BYIbVwUWLHlcX4SgeNew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckhb-00G0bu-0Z;
	Thu, 16 Mar 2023 10:19:19 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckhX-00G0Zh-0I
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 10:19:17 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id D3AC224E3AD;
	Thu, 16 Mar 2023 18:18:47 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 18:18:47 +0800
Received: from [192.168.120.42] (171.223.208.138) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Mar
 2023 18:18:46 +0800
Message-ID: <ed8dbe90-ee1d-405a-5aa6-cbc16a0057ac@starfivetech.com>
Date: Thu, 16 Mar 2023 18:18:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>, Tommaso Merciai
	<tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-5-samin.guo@starfivetech.com>
 <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
 <93a3b4bb-35a4-da7c-6816-21225b42f79b@starfivetech.com>
 <9038dba0-6f72-44a1-9f57-1c08b03b9c31@linaro.org>
 <d2bb7fa5-206f-2059-bde0-b65e1acc44de@starfivetech.com>
 <c716e535-7426-56da-ca6f-51c7d7d69bb3@linaro.org>
 <b7766151-cf21-a5b4-e0ef-7b070e9e5c33@starfivetech.com>
 <d2eda9a8-f532-d7f0-7ef3-b3b8e1a0a79f@linaro.org>
From: Guo Samin <samin.guo@starfivetech.com>
In-Reply-To: <d2eda9a8-f532-d7f0-7ef3-b3b8e1a0a79f@linaro.org>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_031915_420144_68DF3F53 
X-CRM114-Status: GOOD (  10.28  )
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

CgotLS0tLS0tLSDljp/lp4vkv6Hmga8gLS0tLS0tLS0KUmU6IFtQQVRDSCB2NyA0LzZdIGR0LWJp
bmRpbmdzOiBuZXQ6IEFkZCBzdXBwb3J0IFN0YXJGaXZlIGR3bWFjCkZyb206IEtyenlzenRvZiBL
b3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KdG8gOiBHdW8gU2FtaW4g
PHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPiwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcs
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKZGF0YTogMjAyMy8zLzE2Cgo+IE9uIDE2LzAz
LzIwMjMgMDk6MjgsIEd1byBTYW1pbiB3cm90ZToKPj4KPj4KPj4gLS0tLS0tLS0g5Y6f5aeL5L+h
5oGvIC0tLS0tLS0tCj4+IOS4u+mimDogUmU6IFtQQVRDSCB2NyA0LzZdIGR0LWJpbmRpbmdzOiBu
ZXQ6IEFkZCBzdXBwb3J0IFN0YXJGaXZlIGR3bWFjCj4+IEZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4KPj4g5pS25Lu25Lq6OiBHdW8gU2Ft
aW4gPHNhbWluLmd1b0BzdGFyZml2ZXRlY2guY29tPiwgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZywgbmV0ZGV2QHZnZXIua2VybmVsLm9yZywgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmcsIGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPj4g5pel5pyfOiAyMDIzLzMvMTYKPj4K
Pj4+IE9uIDE2LzAzLzIwMjMgMDk6MTUsIEd1byBTYW1pbiB3cm90ZToKPj4+Pj4+PiBpbnRlcnJ1
cHRzOiA/Pz8KPj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IEhpIEtyenlzenRvZiwgCj4+Pj4+Pgo+Pj4+
Pj4gc25wcyxkd21hYy55YW1sIGhhcyBkZWZpbmVkIHRoZSByZWcvaW50ZXJydXB0L2ludGVycnVw
dC1uYW1lcyBub2RlcywKPj4+Pj4+IGFuZCB0aGUgSkg3MTEwIFNvQyBpcyBhbHNvIGFwcGxpY2Fi
bGUuCj4+Pj4+PiBNYXliZSBqdXN0IGFkZCByZWcvaW50ZXJydXB0L2ludGVycnVwdC1uYW1lcyB0
byB0aGUgcmVxdWlyZWQgPwo+Pj4+Pgo+Pj4+PiBZb3UgbmVlZCB0byBjb25zdHJhaW4gdGhlbS4K
Pj4+Pgo+Pj4+Cj4+Pj4gSSBzZWUuIEkgd2lsbCBhZGQgcmVnIGNvbnN0cmFpbnRzIGluIHRoZSBu
ZXh0IHZlcnNpb24sIHRoYW5rcy4KPj4+Pgo+Pj4+IEkgaGF2ZSBvbmUgbW9yZSBxdWVzdGlvbiwg
dGhlIGludGVycnVwdHMvaW50ZXJydXAtbmFtZXMgb2YgSkg3MTEwIFNvQydzIGdtYWMgYXJlIGV4
YWN0bHkgdGhlIHNhbWUgYXMgc25wcyxkd21hYy55YW1sLAo+Pj4+IGRvIHRoZXNlIGFsc28gbmVl
ZCB0byBiZSBjb25zdHJhaW5lZD8KPj4+Cj4+PiBUaGUgaW50ZXJydXB0cyBvbiBjb21tb24gYmlu
ZGluZyBhcmUgdmFyaWFibGUsIHNvIHlvdSBuZWVkIHRvIGNvbnN0cmFpbgo+Pj4gdGhlbSAtIHlv
dSBoYXZlIGZpeGVkIG51bWJlciBvZiB0aGVtLCByaWdodD8KPj4+Cj4+PiBCZXN0IHJlZ2FyZHMs
Cj4+PiBLcnp5c3p0b2YKPj4+Cj4+Cj4+IFllcywgSkg3MTEwIGZpeGVkIGlzIDMgcGNzLiBUaGFu
a3MsIEkgd2lsbCBjb25zdHJhaW4gdGhlbS4KPiAKPiBUaGVuIGp1c3QgbWluSXRlbXM6IDMsIG1h
eEl0ZW1zOiAzIGhlcmUgc2hvdWxkIGJlIGVub3VnaAo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5
c3p0b2YKPiAKCkhpIEtyenlzenRvZiwKClRoYW5rIHlvdSBmb3IgdGhlIHN1Z2dlc3Rpb24uIApJ
J2xsIGNoYW5nZSBpdCBsaWtlIHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbiwgaXMgcmlnaHQ/CgoK
JCBnaXQgZGlmZgotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3N0
YXJmaXZlLGpoNzExMC1kd21hYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9uZXQvc3RhcmZpdmUsamg3MTEwLWR3bWFjLnlhbWwKQEAgLTI3LDYgKzI3LDkgQEAg
cHJvcGVydGllczoKICAgICAgICAgICAtIHN0YXJmaXZlLGpoNzExMC1kd21hYwogICAgICAgLSBj
b25zdDogc25wcyxkd21hYy01LjIwCiAKKyAgcmVnOgorICAgIG1heEl0ZW1zOiAxCisKICAgY2xv
Y2tzOgogICAgIGl0ZW1zOgogICAgICAgLSBkZXNjcmlwdGlvbjogR01BQyBtYWluIGNsb2NrCkBA
IC00Myw2ICs0NiwxNCBAQCBwcm9wZXJ0aWVzOgogICAgICAgLSBjb25zdDogdHgKICAgICAgIC0g
Y29uc3Q6IGd0eAogCisgIGludGVycnVwdHM6CisgICAgbWluSXRlbXM6IDMKKyAgICBtYXhJdGVt
czogMworCisgIGludGVycnVwdC1uYW1lczoKKyAgICBtaW5JdGVtczogMworICAgIG1heEl0ZW1z
OiAzCisKICAgcmVzZXRzOgogICAgIGl0ZW1zOgogICAgICAgLSBkZXNjcmlwdGlvbjogTUFDIFJl
c2V0IHNpZ25hbC4KQEAgLTc3LDggKzg4LDExIEBAIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFs
c2UKIAogcmVxdWlyZWQ6CiAgIC0gY29tcGF0aWJsZQorICAtIHJlZwogICAtIGNsb2NrcwogICAt
IGNsb2NrLW5hbWVzCisgIC0gaW50ZXJydXB0cworICAtIGludGVycnVwdC1uYW1lcwogICAtIHJl
c2V0cwogICAtIHJlc2V0LW5hbWVzCgoKCgoKQmVzdCByZWdhcmRzLApTYW1pbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
