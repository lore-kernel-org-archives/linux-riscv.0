Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C1EC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K61NTWM352c7D2SJBZbW6w/QpGjRYuyiDY/t7ILpu4E=; b=uXf4XXnFhx87Lc
	k49ENYM7wzH8imLKWs3ODEfwleqyPSTlYu7uagEVsf8HC0OZEqQyHQd4JFeRf4i0uAnnh4ovG+DSM
	AZ7P9eS8ECGQGTopDklwTRN/jOPkR+WK1qKL5jARog8/yg5v5gVKvu5Z/nv3I3ljvKs0hWJEDskeZ
	5CZv8AbB5NRE/Z7QVw2NmPqnYvgUdCxvcyTF3JpvbT5ydVboWuj5jAKugXbZbLzdKl3JtA9cpQMg2
	p8AvEi7oXZVWqFHXMEe72gqgozz7Nu911qNS3B1jQWFzw1ZRmqXNaF1Tf9ziDv9U4/Qb9EpUn0YtU
	8nx75WIfUidZvE2pKCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4zsH-00CfWP-1J; Tue, 13 Dec 2022 07:38:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4zsC-00CeaB-Tj
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 07:38:47 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CF47D24E023;
	Tue, 13 Dec 2022 15:38:17 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Dec
 2022 15:38:17 +0800
Received: from [192.168.120.55] (171.223.208.138) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 13 Dec
 2022 15:38:16 +0800
Message-ID: <4c2ae045-9ece-3245-7203-2db21f604ac8@starfivetech.com>
Date: Tue, 13 Dec 2022 15:38:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 2/3] mmc: starfive: Add sdio/emmc driver support
Content-Language: en-US
To: Shawn Lin <shawn.lin@rock-chips.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20221207131731.1291517-1-william.qiu@starfivetech.com>
 <20221207131731.1291517-3-william.qiu@starfivetech.com>
 <faea4932-add6-fc51-836d-b113e8c9a194@rock-chips.com>
 <26e9c3eb-aaeb-8cbd-dda0-20f28331dbeb@starfivetech.com>
 <cd4639e4-b0e4-3141-5b9f-1a7bd14cb799@rock-chips.com>
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <cd4639e4-b0e4-3141-5b9f-1a7bd14cb799@rock-chips.com>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_233845_261382_4F85F175 
X-CRM114-Status: GOOD (  10.02  )
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

CgpPbiAyMDIyLzEyLzEzIDE1OjMzLCBTaGF3biBMaW4gd3JvdGU6Cj4gSGkKPiAKPiBPbiAyMDIy
LzEyLzEzIDE1OjIxLCBXaWxsaWFtIFFpdSB3cm90ZToKPj4KPj4KPj4gT24gMjAyMi8xMi8xMyAx
MDoyNCwgU2hhd24gTGluIHdyb3RlOgo+Pj4gSGkKPj4KPj4+IHVzZSAiLmNvbW1vbl9jYXBzID0g
TU1DX0NBUF9DTUQyMyIgaW5zdGVhZC4KPj4+Cj4+Cj4+IEhpIFNoYXduLAo+Pgo+PiBUaGFuayB5
b3UgZm9yIHRha2luZyB0aW1lIHRvIHJldmlldy4KPj4gVGhlIC5jb21tb25fY2FwcyBpcyBub3Qg
ZGVmaW5lZCBpbiBkd19tY2lfZHJ2X2RhdGEuCj4+IEFuZCAubnVtX2NhcHMgaXMgYWxzbyB1c2Vk
IGluIGR3X21jaS1yb2NrY2hpcC5jLgo+Pgo+IAo+IFRoYXQgbWVhbnMgeW91ciBwYXRjaCBpcyBi
YXNlZCBvbiBvbGQgdXBzdHJlYW0ga2VybmVsIHdoaWNoIGhhc24ndAo+IGJlZW4gdXBkYXRlZCBm
b3IgYXQgbGVhc3Qgb25lIHllYXIuOikKPiAKClNvcnJ5IGFib3V0IHRoYXQuIEkganVzdCBjaGVj
ayB0aGUgY29kZSBvbiA1LjE1LgpJIHdpbGwgdXBkYXRlIGl0IGluIG5leHQgdmVyc2lvbi4KVGhh
bmsgeW91IGFueSB3YXkuCgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFdpbGxpYW0gUWl1Cj4+Pj4gK8Kg
wqDCoCAuc2V0X2lvcyA9IGR3X21jaV9zdGFyZml2ZV9zZXRfaW9zLAo+Pj4+ICvCoMKgwqAgLnBh
cnNlX2R0ID0gZHdfbWNpX3N0YXJmaXZlX3BhcnNlX2R0LAo+Pj4+ICvCoMKgwqAgLmV4ZWN1dGVf
dHVuaW5nID0gZHdfbWNpX3N0YXJmaXZlX2V4ZWN1dGVfdHVuaW5nLAo+Pj4+ICt9Owo+Pj4+ICsK
Pj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgZHdfbWNpX3N0YXJmaXZlX21h
dGNoW10gPSB7Cj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
