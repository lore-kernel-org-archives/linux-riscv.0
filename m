Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDF7EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 06:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zd/YFYOIVLpBxg9GqQUPSUKYA7JWfJR4ctCa39i780U=; b=yEOpqPHzkoTA22
	wiiqbhwl9T3zfYYT1sx3kSQxRCT5FAAfEiAlHI0fwecWsIAu0L2htsvJAkGJwM7+82rTPgeqaI0+9
	rSPCvS7aDivEms1SVeJ7UcU4onx4z7SDZmbWAcGu80Br6wfxmbc+ou6VQeWRbevxlktyLfuQCHv+x
	JDIxokkzbpSTsiPGkjmd9fnQYgmdTyiMOorZZ6TLIu4ZhXOuuLpVUGIA7rWJuUJBMpSeDDAvwploi
	VncqNJbyiyH8lQQj17S9ujeo4aj0+gHN4lKyZr809CW3XPAQ3cqOve/qm+7sWNCgv2+Sa7AVlqvI6
	NJE+IyY1mi+HRJJuJZBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZFB-00CHFt-0P;
	Tue, 04 Jul 2023 06:10:33 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZF7-00CH4s-0M
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 06:10:31 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 11EE08131;
	Tue,  4 Jul 2023 14:09:31 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:09:31 +0800
Received: from [192.168.60.135] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 14:09:29 +0800
Message-ID: <9da07912-0a18-26f7-eaa6-cce076387cc8@starfivetech.com>
Date: Tue, 4 Jul 2023 14:09:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/9] drm/verisilicon: Add basic drm driver
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
 <20230602074043.33872-4-keith.zhao@starfivetech.com>
 <TY3P286MB2611AF9B43017A0AE3C938249829A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <TY3P286MB2611AF9B43017A0AE3C938249829A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_231029_519692_64CC578B 
X-CRM114-Status: GOOD (  10.74  )
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

CgpPbiAyMDIzLzcvNCAyOjQyLCBTaGVuZ3l1IFF1IHdyb3RlOgo+IEhlbGxvIEtlaXRoLAo+IAo+
IFdoaWxlIGNvbXBpbGluZyB0aGlzIGRyaXZlciBhcyBhIG1vZHVsZSwgYSBlcnJvciBoYXBwZW5z
Ogo+IAo+IGRyaXZlcnMvZ3B1L2RybS92ZXJpc2lsaWNvbi92c19kcm06IHN0cnVjdCBvZl9kZXZp
Y2VfaWQgaXMgMjAwIGJ5dGVzLsKgIFRoZSBsYXN0IG9mIDEgaXM6Cj4gMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDc2IDB4NjUgMHg3MiAweDY5IDB4NzMgMHg2OSAweDZjIDB4
NjkgMHg2MyAweDZmIDB4NmUgMHgyYyAweDY0IDB4NjkgMHg3MyAweDcwIDB4NmMgMHg2MSAweDc5
IDB4MmQgMHg3MyAweDc1IDB4NjIgMHg3MyAweDc5IDB4NzMgMHg3NCAweDY1IDB4NmQgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAw
eDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgw
MCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAg
MHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4
MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAwIDB4MDAgMHgwMCAweDAw
IDB4MDAKPiAweDAwIDB4MDAKPiBGQVRBTDogbW9kcG9zdDogZHJpdmVycy9ncHUvZHJtL3Zlcmlz
aWxpY29uL3ZzX2RybTogc3RydWN0IG9mX2RldmljZV9pZCBpcyBub3QgdGVybWluYXRlZCB3aXRo
IGEgTlVMTCBlbnRyeSEKPiAKPj4gKwo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgdnNfZHJtX2R0X2lkc1tdID0gewo+PiArwqDCoMKgIHsgLmNvbXBhdGlibGUgPSAidmVyaXNp
bGljb24sZGlzcGxheS1zdWJzeXN0ZW0iLCB9LAo+PiArfTsKPj4gKwo+IAo+IFNvLCB0aGlzIHNo
b3VsZCBiZToKPiAKPiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB2c19kcm1fZHRf
aWRzW10gPSB7Cj4gwqDCoMKgwqB7IC5jb21wYXRpYmxlID0gInZlcmlzaWxpY29uLGRpc3BsYXkt
c3Vic3lzdGVtIiwgfSwKPiDCoMKgwqDCoHsgfSwKPiB9Owo+IAo+IEFmdGVyIGZpeGluZyB0aGlz
IHByb2JsZW0sIGFub3RoZXIgZXJyb3IgaGFwcGVuczoKPiAKPiBFUlJPUjogbW9kcG9zdDogbW9k
dWxlIHZzX2RybSB1c2VzIHN5bWJvbCBkbWFfYnVmX21tYXAgZnJvbSBuYW1lc3BhY2UgRE1BX0JV
RiwgYnV0IGRvZXMgbm90IGltcG9ydCBpdC4KPiAKPiBQbGVhc2UgZml4Lgo+IAo+IEJlc3QgcmVn
YXJkcywKPiBTaGVuZ3l1CgpoZWxsbyBTaGVuZ3l1ICwgCgpJIGNhbiByZXByb2R1Y2UgdGhlIGVy
cm9yIGdlbmVyYXRlZCBieSBjb21waWxpbmcga28gLCBhbmQgYWRkIE1PRFVMRV9JTVBPUlRfTlMo
RE1BX0JVRikgYXQgdGhlIGJlZ2lubmluZyBvZiB2c19nZW0uYyAsCml0IGNhbiBmaXggdGhlIGVy
cm9yIG1lc3NhZ2UsIApJIHdpbGwgYWRkIHRoaXMgaW4gbXkgbmV4dCBwYXRjaCAsIHRoYW5rcwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
