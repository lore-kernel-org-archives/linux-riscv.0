Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E4ECA1009
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ma837j2vLnkKcY1WeDqBAkp/pcX6LxxoiyngrGqeCHg=; b=Wv5HBHeJrL6SqJ
	PPqundm0f0WL9veUpJfPPbA4NftbVHU5hC7fUHbfA5eoi440NDqP32O6BecP09rsjetOm8Y8In75r
	xBydZVJ6ENe+nE3mL17gzOwKhjbDiWeg4bPZ6DLib8j5vFKF/JH6/WNulB/H/PXQ/ZiUVWe+2cDuh
	BYliwulEUtXd9pMLcuipnro4skpjB60sk+Berj1UXu4DnEd9OWRm9VqLsX2RVeY36zYS9W6oUQF6k
	uYig0xPz0ie3ripd8iIf1CsZ82eRbNWcSt+iH6qKR9mAr04/J6JABf3FDlRvbLxL5mINlq+GyNlsq
	nH5JFhXbHIwCtNLkbJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm4-00000002AWV-002f;
	Tue, 02 Sep 2025 21:42:44 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRgF-00000000GEP-2o41
	for linux-riscv@lists.infradead.org;
	Tue, 02 Sep 2025 14:08:17 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582DHPqh021113;
	Tue, 2 Sep 2025 16:08:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	OfsW8QTgbTdLP4DbkI1LhSpqxaBZQsvlgtJGzho+GHo=; b=wDvUDvro07WcbWVI
	GSKHtFjhToKdMWBImiAgJUCkfdPfgWtxbpKjPNuX8DWIBmAN0BqyUzLhxbb1/lhh
	Y4POLhNDo+hf7jd2oGzi49bG4xkpqsZ2Iqy4+SSO1QlqPxSEMN6eNS318/v/GRVQ
	5jzEQ1qwlkGhtYBft9mIA38QWR92RV7RfO2ew1QvWyPQfwG2lu8CpeR6MggbfdJ6
	ow2HFWqpIAl+bwqv/LuFM66Xs1JW+1JNbh0vofvuGJYoDKJIt3hMNSbuOjInBGwr
	fyyszoeqUbuSPQThgjbZkTjKG+qUR1dO8B0P3uQqxFElWtWgtZlftU0eCRQScSrT
	kErQSw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48upqkd2tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 16:08:02 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6DF0B40045;
	Tue,  2 Sep 2025 16:06:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0D83C3A874D;
	Tue,  2 Sep 2025 16:05:23 +0200 (CEST)
Received: from [10.48.87.121] (10.48.87.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 2 Sep
 2025 16:05:22 +0200
Message-ID: <9b669562-ee52-47b6-856e-3184b3e89d28@foss.st.com>
Date: Tue, 2 Sep 2025 16:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] clk: divider, gate: create regmap-backed copies of
 gate and divider clocks
To: Conor Dooley <conor@kernel.org>, <sboyd@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara
	<daire.mcnamara@microchip.com>,
        <pierre-henry.moussay@microchip.com>,
        <valentina.fernandezalanis@microchip.com>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones
	<lee@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
	<palmer@dabbelt.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250901-rigid-sacrifice-0039c6e6234e@spud>
 <20250901-yearling-reconcile-99d06fe7868e@spud>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250901-yearling-reconcile-99d06fe7868e@spud>
X-Originating-IP: [10.48.87.121]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_070816_211468_C379BEC6 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDkvMS8yNSAxMzowNCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IEZyb206IENvbm9yIERvb2xl
eSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBJbXBsZW1lbnQgcmVnbWFwLWJhY2tl
ZCBjb3BpZXMgb2YgZ2F0ZSBhbmQgZGl2aWRlciBjbG9ja3MgYnkgcmVwbGFjaW5nCj4gdGhlIGlv
bWVtIHBvaW50ZXIgdG8gdGhlIGNsb2NrIHJlZ2lzdGVycyB3aXRoIGEgcmVnbWFwIGFuZCBvZmZz
ZXQKPiB3aXRoaW4uCj4KPiBTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+IHY0Ogo+IC0gaW5jcmVhc2UgbWFwX29mZnNldCB0byBh
IHUzMgo+IC0gdXNlIGEgc2luZ2xlIEtjb25maWcgb3B0aW9uIGZvciBib3RoIGRpdmlkZXIgYW5k
IGdhdGUgcmVnbWFwCj4gICAgaW1wbGVtZW50YXRpb25zCj4gLS0tCj4gICBkcml2ZXJzL2Nsay9L
Y29uZmlnICAgICAgICAgICAgICB8ICAgNCArCj4gICBkcml2ZXJzL2Nsay9NYWtlZmlsZSAgICAg
ICAgICAgICB8ICAgMiArCj4gICBkcml2ZXJzL2Nsay9jbGstZGl2aWRlci1yZWdtYXAuYyB8IDI3
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL2Nsay9jbGstZ2F0
ZS1yZWdtYXAuYyAgICB8IDI1NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgaW5j
bHVkZS9saW51eC9jbGstcHJvdmlkZXIuaCAgICAgfCAxMTkgKysrKysrKysrKysrKysKPiAgIDUg
ZmlsZXMgY2hhbmdlZCwgNjUwIGluc2VydGlvbnMoKykKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBk
cml2ZXJzL2Nsay9jbGstZGl2aWRlci1yZWdtYXAuYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvY2xrL2Nsay1nYXRlLXJlZ21hcC5jCj4KSGkgQ29ub3IsCgppIHRlc3RlZCB0aGUgY2xr
X2dhdGVfcmVtYXAgcGFydCB3aXRoIG15IGNvZGUsIGl0IHdvcmtzIGZpbmUuCgpKdXN0IGHCoCBt
aW5vciByZW1hcmsgY29uY2VybmluZyAucm91bmRfcmF0ZSwgeW91IGNhbiBhZGQgbXkKClJldmll
d2VkLWJ5OiBHYWJyaWVsIEZlcm5hbmRleiA8Z2FicmllbC5mZXJuYW5kZXpAZm9zcy5zdC5jb20+
Cgo+ICtjb25zdCBzdHJ1Y3QgY2xrX29wcyBjbGtfZGl2aWRlcl9yZWdtYXBfb3BzID0gewo+ICsJ
LnJlY2FsY19yYXRlID0gY2xrX2RpdmlkZXJfcmVnbWFwX3JlY2FsY19yYXRlLAo+ICsJLnJvdW5k
X3JhdGUgPSBjbGtfZGl2aWRlcl9yZWdtYXBfcm91bmRfcmF0ZSwKCi5yb3VuZF9yYXRlIGNvdWxk
IGJlIHJlbW92ZWQgPwoKCj4gKwkuZGV0ZXJtaW5lX3JhdGUgPSBjbGtfZGl2aWRlcl9yZWdtYXBf
ZGV0ZXJtaW5lX3JhdGUsCj4gKwkuc2V0X3JhdGUgPSBjbGtfZGl2aWRlcl9yZWdtYXBfc2V0X3Jh
dGUsCj4gK307Cj4gK0VYUE9SVF9TWU1CT0xfR1BMKGNsa19kaXZpZGVyX3JlZ21hcF9vcHMpOwo+
ICsKPiArY29uc3Qgc3RydWN0IGNsa19vcHMgY2xrX2RpdmlkZXJfcmVnbWFwX3JvX29wcyA9IHsK
PiArCS5yZWNhbGNfcmF0ZSA9IGNsa19kaXZpZGVyX3JlZ21hcF9yZWNhbGNfcmF0ZSwKPiArCS5y
b3VuZF9yYXRlID0gY2xrX2RpdmlkZXJfcmVnbWFwX3JvdW5kX3JhdGUsCgpkaXRvCgoKPiArCS5k
ZXRlcm1pbmVfcmF0ZSA9IGNsa19kaXZpZGVyX3JlZ21hcF9kZXRlcm1pbmVfcmF0ZSwKPiArfTsK
PiArRVhQT1JUX1NZTUJPTF9HUEwoY2xrX2RpdmlkZXJfcmVnbWFwX3JvX29wcyk7Cj4gKwoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
