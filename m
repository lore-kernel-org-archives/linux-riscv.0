Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A229C77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 03:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVL0DmitVXfsESA6ohCrQtyhOd1J8cAa4fIsODnon5U=; b=eW7umR3dQ9S0aK
	0V/wG/CIX/xBESB14u62M04LRnSDaH4RM8Bu0XoXtmMBUg/bRFoRVECSCsD8kl8oBba6CsEF+zOCj
	e0IHbGZNNjpgC+4ihZJmgd9h6pXxuxgtK6q8C156sYduUbFiQNRzLlA0PrzR3r3gjz8vqYn5yeWFQ
	tRKqLuKTj5dwcQH8ts+eIAJZ4TWGev3VSOJvAdMu+PGaBIajO1gfc4fMczGIuzmTM4R8VGSYH6Xin
	u720x0q1IV+JI+Kqatlpnz8+CeaST0yEbh+OYw6K4MFfxDd8XQfAQrIAZesjbDi60NaRYRfmPSY0P
	Q+3S7crs72v8kbib8hOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyOsr-000jog-0q;
	Mon, 15 May 2023 03:28:25 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyOso-000jfh-1B
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 03:28:23 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8885180B2;
	Mon, 15 May 2023 11:27:43 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 11:27:43 +0800
Received: from [192.168.155.85] (202.188.176.82) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 15 May
 2023 11:27:40 +0800
Message-ID: <2ae2d187-5db7-9207-7846-1a80e87047b2@starfivetech.com>
Date: Mon, 15 May 2023 11:27:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 4/4] crypto: starfive - Add hash and HMAC support
To: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230504073400.1170979-1-jiajie.ho@starfivetech.com>
 <20230504073400.1170979-5-jiajie.ho@starfivetech.com>
 <ZF4bKe0YkpcQakLs@gondor.apana.org.au>
Content-Language: en-US
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
In-Reply-To: <ZF4bKe0YkpcQakLs@gondor.apana.org.au>
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_202822_573130_2F60CA16 
X-CRM114-Status: UNSURE (   7.14  )
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

T24gMTIvNS8yMDIzIDY6NTUgcG0sIEhlcmJlcnQgWHUgd3JvdGU6Cj4gT24gVGh1LCBNYXkgMDQs
IDIwMjMgYXQgMDM6MzQ6MDBQTSArMDgwMCwgSmlhIEppZSBIbyB3cm90ZToKPj4KPj4gKwl3cml0
ZWwoflNUQVJGSVZFX0lFX01BU0tfSEFTSF9ET05FLCBjcnlwLT5iYXNlICsgU1RBUkZJVkVfSUVf
TUFTS19PRkZTRVQpOwo+PiArCXdyaXRlbChjc3IudiwgY3J5cC0+YmFzZSArIFNUQVJGSVZFX0hB
U0hfU0hBQ1NSKTsKPiAKPiBXaXRoIGNvbXBpbGUgdGVzdGluZyBJIGdldAo+IAo+IC4uL2RyaXZl
cnMvY3J5cHRvL3N0YXJmaXZlL2poNzExMC1oYXNoLmM6IEluIGZ1bmN0aW9uIOKAmHN0YXJmaXZl
X2hhc2hfc3RhcnTigJk6Cj4gLi4vZHJpdmVycy9jcnlwdG8vc3RhcmZpdmUvamg3MTEwLWhhc2gu
YzoxMTA6OTogd2FybmluZzogY29udmVyc2lvbiBmcm9tIOKAmGxvbmcgdW5zaWduZWQgaW504oCZ
IHRvIOKAmHVuc2lnbmVkIGludOKAmSBjaGFuZ2VzIHZhbHVlIGZyb20g4oCYMTg0NDY3NDQwNzM3
MDk1NTE2MTHigJkgdG8g4oCYNDI5NDk2NzI5MeKAmSBbLVdvdmVyZmxvd10KPiAKCkhpIEhlcmJl
cnQsCkkndmUgYWRkZWQgQ09NUElMRV9URVNUIGluIHRoZSBLY29uZmlnLCB0aGVuIHJhbiBtYWtl
IFc9MSwgc3BhcnNlIGFuZCBzbWF0Y2guCkhvd2V2ZXIgaXQgZGlkIG5vdCBwcm9kdWNlIHRoZSBl
cnJvciBtZXNzYWdlLgoKK2NvbmZpZyBDUllQVE9fREVWX0pINzExMAorICAgICAgIHRyaXN0YXRl
ICJTdGFyRml2ZSBKSDcxMTAgY3J5cHRvZ3JhcGhpYyBlbmdpbmUgZHJpdmVyIgorICAgICAgIGRl
cGVuZHMgb24gU09DX1NUQVJGSVZFIHx8IENPTVBJTEVfVEVTVAorICAgICAgIHNlbGVjdCBDUllQ
VE9fRU5HSU5FCgpTeW1ib2w6IENPTVBJTEVfVEVTVCBbPXldClR5cGUgIDogYm9vbApEZWZpbmVk
IGF0IGluaXQvS2NvbmZpZzoxNDIKCm1ha2UgQz0yIGRyaXZlcnMvY3J5cHRvLwptYWtlIFc9MSBk
cml2ZXJzL2NyeXB0by8Kfi9zbWF0Y2gvc21hdGNoX3NjcmlwdHMva2NoZWNrZXIgZHJpdmVycy9j
cnlwdG8vCgpBbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKVGhhbmtzLApKaWEgSmllCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
