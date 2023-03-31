Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD04C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcJDbYFosEsHuz5PZIxiBzvKGJq5lnHEfv2pO1nNg8I=; b=rrrZPXs98p7zct
	hYr1odcwMJf/vkln50Zq06f4eCzFRBxkc/O3GsNYXZUddYnsczzFumj7fAJtJUyXnyTcrkGPYyrga
	T9K/mnyZgGw8hLoVwO00tcjJZTrfuS8qKVfBlJD94Lc8JNzrRrhDDNEvyVO1dJzDVLIE5Vt+kx1mz
	/U969t8uyzJQfTOUboBUIwfKS33s0N11Ap1+2/OL/X+O9kFT9yEcvGpS96wCMla+Kd1UXGyMhgyeU
	3lQQ5av+fVFoecmkli3RjMDTfreoyaFfMzzXs0diINdoxen4r44or9i2zD4lEdvZmQwHbDD2djRRM
	EthKl/G+Cn2XHElQMtoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBze-006vnZ-1B;
	Fri, 31 Mar 2023 10:28:26 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBza-006vko-1h
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 10:28:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F19AE24E336;
	Fri, 31 Mar 2023 18:27:49 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 31 Mar
 2023 18:27:50 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 31 Mar
 2023 18:27:49 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Fri, 31 Mar 2023 18:27:49 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Conor Dooley <conor.dooley@microchip.com>
CC: "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "aou@eecs.berkeley.edu"
	<aou@eecs.berkeley.edu>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Mason Huo <mason.huo@starfivetech.com>
Subject: RE: [PATCH v8 0/4] RISC-V Hibernation Support
Thread-Topic: [PATCH v8 0/4] RISC-V Hibernation Support
Thread-Index: AQHZYtLvA9p1xyT6pkCpIR4M2BabXa8SXEcAgAJT22A=
Date: Fri, 31 Mar 2023 10:27:49 +0000
Message-ID: <c9f9f648b8964c939309cafdc5feaee4@EXMBX066.cuchost.com>
References: <20230330064321.1008373-1-jeeheng.sia@starfivetech.com>
 <a73a194e-f7dd-4cf4-9fb7-62144672b71c@spud>
In-Reply-To: <a73a194e-f7dd-4cf4-9fb7-62144672b71c@spud>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [60.53.70.89]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_032822_884111_2E8338F8 
X-CRM114-Status: GOOD (  11.77  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ29ub3IgRG9vbGV5IDxj
b25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIE1hcmNoIDMwLCAy
MDIzIDI6NTEgUE0NCj4gVG86IEplZUhlbmcgU2lhIDxqZWVoZW5nLnNpYUBzdGFyZml2ZXRlY2gu
Y29tPg0KPiBDYzogcGF1bC53YWxtc2xleUBzaWZpdmUuY29tOyBwYWxtZXJAZGFiYmVsdC5jb207
IGFvdUBlZWNzLmJlcmtlbGV5LmVkdTsgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZzsg
bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IExleWZvb24gVGFuIDxsZXlmb29uLnRh
bkBzdGFyZml2ZXRlY2guY29tPjsgTWFzb24gSHVvIDxtYXNvbi5odW9Ac3RhcmZpdmV0ZWNoLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2OCAwLzRdIFJJU0MtViBIaWJlcm5hdGlvbiBTdXBw
b3J0DQo+IA0KPiBPbiBUaHUsIE1hciAzMCwgMjAyMyBhdCAwMjo0MzoxN1BNICswODAwLCBTaWEg
SmVlIEhlbmcgd3JvdGU6DQo+IA0KPiA+IENoYW5nZXMgc2luY2Ugdjc6DQo+ID4gLSBSZWJhc2Vk
IHRvIGtlcm5lbCB2Ni4zLXJjNA0KPiANCj4gQlRXLCB0aGVyZSBpcyBhYnNvbHV0ZWx5IG5vIG5l
ZWQgdG8gZG8gdGhpcyBldmVyeSB0aW1lIHlvdSByZXN1Ym1pdC4NCj4gVXN1YWxseSBwYXRjaGVz
IHdpbGwgZWl0aGVyIGJlIGFwcGxpZWQgdG8gZm9yLW5leHQgb3IgdG8gLXJjMSwgc28NCj4gcmVi
YXNpbmcgb24gdGhlIG5ld2VzdCAtcmMgaXMgbm90IG5lZWRlZCA6KQ0KTm90ZWQgd2l0aCB0aGFu
a3MhIPCfmIogVGhlIHJlYXNvbiB3aHkgSSB1cGRhdGUgdGhlIGtlcm5lbCB2ZXJzaW9uIHdpdGgg
ZXZlcnkgcmVzdWJtaXNzaW9uIGlzIHRoYXQgSSdtIGFmcmFpZCB0aGUgbmV3IHJlbGVhc2UgY2Fu
ZGlkYXRlIG1pZ2h0IGludHJvZHVjZSBzb21ldGhpbmcgdGhhdCBJJ20gbm90IGF3YXJlIG9mLCB3
aGljaCBjb3VsZCBwb3RlbnRpYWxseSBjYXVzZSBhIGJyZWFrIHNvbWV3aGVyZS4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
