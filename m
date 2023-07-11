Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16258EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/+C7UIOMncJg88/MfqHJF4swBy1ZpWyq0Q1z+qhhWNc=; b=T68yHtzYgeljo/
	q7X+SnfWaR2WUW22nne6+Oilq+vlWUwsQFLLL7jsDt5fMKsR9ekixbyYpFjBVGQNveGUFYC4o5GPc
	JAGXKf+w0fBqQJm1AFtkihbj0AGj9V28fZvJz4QCMxL8KEw1GrmjEKxubY5kJ6ZnX0XWNfeKxtXP1
	k8u9flNwilT3QjzpwkEE6Zezo6TyKWyWkm1qDTgUB1V/WXYum+opfo2XF/bdyktQbZL1b5NbKLJFN
	Xa93RXn/nXeyZYWt7JMhR5AU0KpPyRCWwi/QgKHqiYX3i1naEeSCixphw6YD6DmyVQ/QyWEAr3R+N
	sJL47ZB5qzwW/o1xP0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ2RE-00DDuw-2S;
	Tue, 11 Jul 2023 01:45:12 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ2RA-00DDrs-2f
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 01:45:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 5D45A24DE03;
	Tue, 11 Jul 2023 09:44:16 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Jul
 2023 09:44:16 +0800
Received: from [192.168.60.133] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Jul
 2023 09:44:15 +0800
Message-ID: <560ca37f-74c3-8f36-c118-eb17f92e20b3@starfivetech.com>
Date: Tue, 11 Jul 2023 09:44:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/9] drm/verisilicon: Add drm plane funcs
Content-Language: en-US
To: Shengyu Qu <wiagn233@outlook.com>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Emil Renner Berthing" <kernel@esmil.dk>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel
	<p.zabel@pengutronix.de>, Sumit Semwal <sumit.semwal@linaro.org>,
	<christian.koenig@amd.com>, Bjorn Andersson <andersson@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>, Jagan Teki
	<jagan@edgeble.ai>, Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
	<jack.zhu@starfivetech.com>, Shengyang Chen
	<shengyang.chen@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-8-keith.zhao@starfivetech.com>
 <TY3P286MB261191B29FB384110094181C9830A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <TY3P286MB261191B29FB384110094181C9830A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_184509_317594_0C7856D1 
X-CRM114-Status: UNSURE (   9.84  )
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

CgpPbiAyMDIzLzcvMTEgMDo0NiwgU2hlbmd5dSBRdSB3cm90ZToKPiBIZWxsbyBLZWl0aCwKPj4g
Kwo+PiArc3RhdGljIHZvaWQgdnNfcGxhbmVfYXRvbWljX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUpCj4+ICt7Cj4+ICvCoMKgwqAgc3RydWN0IGRybV9wbGFu
ZV9zdGF0ZSAqbmV3X3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3BsYW5lX3N0YXRlKHN0YXRl
LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwbGFuZSk7Cj4+ICvCoMKgwqAgdW5zaWduZWQgY2hh
ciBpLCBudW1fcGxhbmVzOwo+PiArwqDCoMKgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOwo+
PiArwqDCoMKgIHN0cnVjdCB2c19wbGFuZSAqdnNfcGxhbmUgPSB0b192c19wbGFuZShwbGFuZSk7
Cj4+ICvCoMKgwqAgLy9zdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpzdGF0ZSA9IHBsYW5lLT5zdGF0
ZTsKPj4gK8KgwqDCoCBzdHJ1Y3QgdnNfY3J0YyAqdnNfY3J0YyA9IHRvX3ZzX2NydGMobmV3X3N0
YXRlLT5jcnRjKTsKPj4gK8KgwqDCoCBzdHJ1Y3QgdnNfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRl
ID0gdG9fdnNfcGxhbmVfc3RhdGUobmV3X3N0YXRlKTsKPj4gK8KgwqDCoCAvL3N0cnVjdCBkcm1f
Zm9ybWF0X25hbWVfYnVmICpuYW1lID0gJnBsYW5lX3N0YXRlLT5zdGF0dXMuZm9ybWF0X25hbWU7
Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIW5ld19zdGF0ZS0+ZmIgfHwgIW5ld19zdGF0ZS0+Y3J0YykK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybjsKPj4gKwo+PiArwqDCoMKgIGZiID0gbmV3X3N0YXRl
LT5mYjsKPj4gKwo+PiArwqDCoMKgIG51bV9wbGFuZXMgPSB2c19nZXRfcGxhbmVfbnVtYmVyKGZi
KTsKPj4gKwo+PiArwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBudW1fcGxhbmVzOyBpKyspIHsKPj4g
K8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB2c19nZW1fb2JqZWN0ICp2c19vYmo7Cj4+ICsKPj4gK8Kg
wqDCoMKgwqDCoMKgIHZzX29iaiA9IHZzX2ZiX2dldF9nZW1fb2JqKGZiLCBpKTsKPj4gK8KgwqDC
oMKgwqDCoMKgIHZzX3BsYW5lLT5kbWFfYWRkcltpXSA9IHZzX29iai0+aW92YSArIGZiLT5vZmZz
ZXRzW2ldOwo+IAo+IFRoZXJlIGlzIGEgZGNhY2hlIGZsdXNoIG9wZXJhdGlvbiBoZXJlIGluIGRv
d25zdHJlYW0gZHJpdmVyLiBJcyB0aGF0IGEgY2FjaGUgY29oZXJlbmNlIHByb2JsZW0/Cj4gCj4g
QmVzdCByZWdhcmRzLAo+IAo+IFNoZW5neXUKPiAKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDC
oCBwbGFuZV9zdGF0ZS0+c3RhdHVzLnNyYyA9IGRybV9wbGFuZV9zdGF0ZV9zcmMobmV3X3N0YXRl
KTsKPj4gK8KgwqDCoCBwbGFuZV9zdGF0ZS0+c3RhdHVzLmRlc3QgPSBkcm1fcGxhbmVfc3RhdGVf
ZGVzdChuZXdfc3RhdGUpOwo+PiArCj4+ICvCoMKgwqAgdnNfcGxhbmUtPmZ1bmNzLT51cGRhdGUo
dnNfY3J0Yy0+ZGV2LCB2c19wbGFuZSwgcGxhbmUsIHN0YXRlKTsKPj4gK30KPj55ZXMgLCBZb3Ug
Y2FuIGZpbmQgdGhhdCB0aGUgY3VycmVudCBzaXR1YXRpb24gaXMgdmVyeSBwcm9mZXNzaW9uYWwu
IApUaGlzIHByb2JsZW0gZXhpc3RzIGF0IHByZXNlbnQsIGJ1dCB0aGUgZG1hIGludGVyZmFjZSBp
cyBub3QgcGVyZmVjdCBhdCBub3csIAphbmQgdGhlIGRtYV9zeW5jX3NpbmdsZV9mb3JfZGV2aWNl
IGludGVyZmFjZSBuZWVkcyB0byBiZSBpbXBsZW1lbnRlZCBsYXRlci4gCkkgd2lsbCBjb25zaWRl
ciByZXBhaXJpbmcgdGhpcyBwcm9ibGVtIGluIHRoZSBmb3JtIG9mIHBhdGNoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
