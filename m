Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890E1C61DA4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 02:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dc8SEgMG4ul7KIEvxRpLkfCiHc/qiCNOdNxY/E10krU=; b=vtzBuy6CYgZ8hJ
	vFSwuZku/VmJtkDdPKqcWyvzvpL0lLEZBgDTYCbdSqSDkS/Hc6h0TcPysZyi5j0AADNsbbHNL/01h
	RMlmCBW+rQGWHUaDZy+4Un5Sr1nF6lhoYrEV/cEQhiy8lSOewvxs5ytWG5O8YuE6HACUvDgb9NFjA
	IN95OFTnb9tVY420M+c9liSAl11aKygb/XWr24qIMZs1CrQ/9OHwh9h4WpwiQHojglmvd/ZKec9WA
	0uBEYBhEEt99qJzrXbF3UFC6Zu9B/WXzyjGHoUgDJbJGtQYTFar4YhK8bT5WUYIfQqYst3CSgQeoh
	Vc/4HE2FBy1A51bCPoyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqWA-00CPAo-L4; Fri, 17 Feb 2023 02:30:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSqW8-00CP7s-1J
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 02:30:33 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B5F2024E287;
	Fri, 17 Feb 2023 10:30:01 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 10:29:59 +0800
Received: from [192.168.125.128] (183.27.98.67) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 17 Feb
 2023 10:29:58 +0800
Message-ID: <c0b03600-13a9-b9e7-e4f3-701fd5b55c86@starfivetech.com>
Date: Fri, 17 Feb 2023 10:30:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 2/3] drivers: watchdog: Add StarFive Watchdog driver
To: Guenter Roeck <linux@roeck-us.net>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Samin Guo <samin.guo@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
References: <20221219094233.179153-1-xingyu.wu@starfivetech.com>
 <20221219094233.179153-3-xingyu.wu@starfivetech.com>
 <20230201224619.GA3194283@roeck-us.net>
 <1f18bfdc-7a04-4914-d970-7ef1d4f99653@starfivetech.com>
 <bfc81429-1829-bec1-ac29-0559f6a01215@roeck-us.net>
Content-Language: en-US
From: Xingyu Wu <xingyu.wu@starfivetech.com>
In-Reply-To: <bfc81429-1829-bec1-ac29-0559f6a01215@roeck-us.net>
X-Originating-IP: [183.27.98.67]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_183032_249178_C5F8B0F4 
X-CRM114-Status: UNSURE (   9.94  )
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

T24gMjAyMy8yLzE2IDIyOjU3LCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+IE9uIDIvMTUvMjMgMjM6
MTEsIFhpbmd5dSBXdSB3cm90ZToKPj4gT24gMjAyMy8yLzIgNjo0NiwgR3VlbnRlciBSb2VjayB3
cm90ZToKPj4+IE9uIE1vbiwgRGVjIDE5LCAyMDIyIGF0IDA1OjQyOjMyUE0gKzA4MDAsIFhpbmd5
dSBXdSB3cm90ZToKPj4+PiBBZGQgd2F0Y2hkb2cgZHJpdmVyIGZvciB0aGUgU3RhckZpdmUgSkg3
MTEwIFNvQy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFhpbmd5dSBXdSA8eGluZ3l1Lnd1QHN0
YXJmaXZldGVjaC5jb20+Cj4+Pj4gKwo+Pj4+IFsuLi5dCj4+Pj4gKwo+Pj4+ICtzdGF0aWMgY29u
c3Qgc3RydWN0IHdhdGNoZG9nX2luZm8gc3RhcmZpdmVfd2R0X2lkZW50ID0gewo+Pj4+ICvCoMKg
wqAgLm9wdGlvbnMgPSBPUFRJT05TLAo+Pj4+ICvCoMKgwqAgLmZpcm13YXJlX3ZlcnNpb24gPSAw
LAo+Pj4KPj4+IEl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gaW5pdGlsaXplIGEgc3RhdGljIHZhcmlh
YmxlIHdpdGggMC4KPj4+Cj4+Pj4gK8KgwqDCoCAuaWRlbnRpdHkgPSAiU3RhckZpdmUgV2F0Y2hk
b2ciLAo+Pj4+ICt9Owo+Pgo+PiBIaSBHdWVudGVyLAo+Pgo+PiBJdCB3b3VsZCBiZSBhIGNvbXBp
bGF0aW9uIGVycm9yIGlmIGRyb3AgdGhlICcwJy4gSSBmb3VuZCB0aGF0IG90aGVyIGZpbGVzCj4g
Cj4gTm8uCj4gCj4+IGluaXRpYWxpemUgdGhpcyBzdGF0aWMgdmFyaWFibGUgYXMgd2VsbC4KPj4K
PiAKPiBBaCwgdGhlIG9sZCAib3RoZXJzIGRvIGl0LCBzbyBkbyBJIiBhcmd1bWVudC4KPiBTb3Jy
eSwgdGhhdCBpcyBub3QgYSB2YWxpZCBhcmd1bWVudC4KPiAKCkNhbiBJIGFzc2lnbiDigJhmaXJt
d2FyZV92ZXJzaW9u4oCZIHRvIGEgbWFjcm8gZGVmaW5pdGlvbiBpbiB0aGUgcHJvYmU/CgpCZXN0
IHJlZ2FyZHMsClhpbmd5dSBXdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
