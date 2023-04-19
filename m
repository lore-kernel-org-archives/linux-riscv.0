Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC4AC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJjwQqDd6ZXAquTJ+oC22toE8x5PPe+9IPwnh3Ww1yA=; b=SKoH6HMTVifYqT
	J0idCiEuj8CkyRaHxlIxwXzaw0jQ17MOq6Nf0Bh3md2Gn7uSIxHFsTJUEuxaYmS6WdGRKwpSOZVkT
	HFwYck2M4k1kPBktyKQE+pMNdT9grdN7o6V+MsSlVpoGsSp0xvo/03faE5SIlmtpJcJoqHOI0gHm4
	boOQ9qDfMmvwdxzgkTysshMc3Kt3ax7/imbgOTzgX6UlSGdVuKeiC0Ci3rrOS4f3epjax/s7H5Q/1
	xFoxWdWcQiBfrOVp5+m9bH7Om2L+5PdAs2xhn9cUiuoJFNBVqyeh7nmHmSBcqPk5igD5sx0j6jCKH
	Xi2ThDNay8ibuNUaIzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp30A-004ZCO-1k;
	Wed, 19 Apr 2023 08:17:18 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp305-004Z8M-2O;
	Wed, 19 Apr 2023 08:17:16 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 12E2824DBBD;
	Wed, 19 Apr 2023 16:16:42 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 16:16:41 +0800
Received: from [192.168.125.108] (113.72.144.253) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 16:16:40 +0800
Message-ID: <f7e07efc-c274-4fc2-20c1-4c5e2e1c989e@starfivetech.com>
Date: Wed, 19 Apr 2023 16:16:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 0/7] Add JH7110 USB and USB PHY driver support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>,
	"Kishon Vijay Abraham I" <kishon@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Peter Chen"
	<peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, "Philipp Zabel"
	<p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Mason Huo" <mason.huo@starfivetech.com>
References: <20230406015216.27034-1-minda.chen@starfivetech.com>
 <517670ca-ba2e-811e-3eb2-7f38011c9690@linaro.org>
 <985d0a57-1fc8-5725-4d3a-33dcc5d49d67@starfivetech.com>
 <5953bc83-9609-6d12-7e9b-ca5202151fb3@linaro.org>
 <a75ed45c-55c4-ff94-86f9-313ec79720ac@starfivetech.com>
 <c79e7d05-0b62-40e6-0864-35b2821c69e7@linaro.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <c79e7d05-0b62-40e6-0864-35b2821c69e7@linaro.org>
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_011713_958870_D1D892FB 
X-CRM114-Status: UNSURE (   8.53  )
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

CgpPbiAyMDIzLzQvMTggMjA6MjIsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMTgv
MDQvMjAyMyAxMzoxMiwgTWluZGEgQ2hlbiB3cm90ZToKPj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gYmFz
ZS1jb21taXQ6IDBlYzU3Y2ZhNzIxZmJkMzZiNGM0YzBkOWNjYzVkNzhhNzhmN2ZhMzUKPj4+Pj4+
IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogMjRhNmUzNDQyZWQxZjU0NTRmZmI0YTUxNGNmZDc2ODQz
NmE4NzA5MAo+Pj4+Pj4gcHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA1NTM5MDUzNzM2MGYyNWM4Yjlj
YmZkYzMwYjczYWRlMDA0ZjQzNmY3Cj4+Pj4+Cj4+Pj4+IGZhdGFsOiBiYWQgb2JqZWN0IDU1Mzkw
NTM3MzYwZjI1YzhiOWNiZmRjMzBiNzNhZGUwMDRmNDM2ZjcKPj4+Pj4KPj4+Pj4gV2hhdCBjb21t
aXRzIGRvIHlvdSByZWZlcmVuY2U/IEhvdyBhcmUgdGhleSBoZWxwZnVsPwo+Pj4+Pgo+Pj4+IEkg
dXNlICJnaXQgZm9ybWF0LXBhdGNoIC0tYmFzZT0oY29tbWl0KSB0byBnZW5lcmF0ZSBwYXRjaHNl
dC4KPj4+PiBNYXliZSBJIHNldCB0aGUgd3JvbmcgYmFzZSBjb21taXQuCj4+Pgo+Pj4gSG93IGFy
ZSB0aGV5IGhlbHBmdWwgaWYgdGhlc2UgYXJlIHByaXZhdGUgY29tbWl0cz8KPj4+PiBCZXN0IHJl
Z2FyZHMsCj4+PiBLcnp5c3p0b2YKPj4+Cj4+IGJhc2UtY29tbWl0IGlzIG5vdCBwcml2YXRlIGNv
bW1pdHMuIAo+PiBJIHNob3VsZCBzZXQgYmFzZSBjb21taXQgMTk3YjZiNjBhZTdiYzUxZGQwODE0
OTUzYzU2MjgzMzE0M2IyOTJhYS4gVGhpcyBpcyA2LjMtcmM0IGNvbW1pdC4KPj4gQnV0IEkgc2V0
IDBlYzU3Y2ZhNzIxZmJkMzZiNGM0YzBkOWNjYzVkNzhhNzhmN2ZhMzUuIFRoaXMgaXMgNi4zLXJj
NCdzIHByZXZpb3VzIGNvbW1pdC4KPiAKPiBZb3UgbWlzc2VkIHRoZSBwb2ludC4gSSBhbSBub3Qg
dGFsa2luZyBhYm91dCBiYXNlIGNvbW1pdC4gSSBhbSB0YWxraW5nCj4gYWJvdXQgeW91ciBwcmVy
ZXF1aXNpdGVzLCB3aGljaCBhcmUgdXNlbGVzcy4gV2hhdCBjYW4gd2UgZG8gd2l0aCBzdWNoIFNI
QT8KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4gCk9L77yMIEkgd2lsbCBkZWxldGUg
dGhlbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
