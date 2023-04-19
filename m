Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC7CC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 06:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p6tqaSMGc6uAmctcsLCnzedbz3AvZ4OPFDiga5FjP7M=; b=UzOONR4+oRxJPT
	exN6nqlxqpde3dhDMQKEmqvHHwNyYHs1+WeJu/mdba7mAeLMp9df0danV+NetCuk+wdpaGW4WX//f
	tidDKcsNJ9l7R1R4OjN8/Fei0I++x4byro3vrPqWL4lHJf6IZRA+uUzAX1d+Jl6Jn5Wud1+PDyp23
	37QJ5lTz9TjcOTGFm1YdVyQAqPTOKKhlKVc+QfyCtGQtWdGuYeXwgkOVhX+C36LUnLMDfbvjdn3Hx
	W86PqeqwQ2V/ITG0qrDKu4AOK9zk7r1bPwpXPhjLTcmjBEABOE++ySifEbcd4UCoW/dN+BXx6gCDR
	VjzOvOxS2DN2LVg3BM+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp12S-004Agw-0j;
	Wed, 19 Apr 2023 06:11:32 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp12O-004Ael-1I;
	Wed, 19 Apr 2023 06:11:30 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 6094224E25E;
	Wed, 19 Apr 2023 14:10:43 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 14:10:43 +0800
Received: from [192.168.125.106] (113.72.144.253) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 19 Apr
 2023 14:10:42 +0800
Message-ID: <bf04808b-5988-c3d2-e2c4-4e8cdbaec838@starfivetech.com>
Date: Wed, 19 Apr 2023 14:10:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu
	<jack.zhu@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230412084540.295411-1-changhuang.liang@starfivetech.com>
 <20230412084540.295411-2-changhuang.liang@starfivetech.com>
 <8dd0dc63-e0df-8764-f756-da032d9d671c@linaro.org>
 <eb47b7c7-bdbb-92d9-ba39-604ce487f297@starfivetech.com>
 <f6a4fb28-d635-4d99-44bb-d929cb41eef2@linaro.org>
 <b34a8d59-34e4-8358-9d2b-367f4707ca7c@starfivetech.com>
 <f0d82428-aaa5-3dd4-bc29-f1057fe749bc@linaro.org>
 <20230418184246.GA2103246-robh@kernel.org>
 <CAL_JsqKVa+XHkoDbDLaD+haC2J7QDJ_oLr9RAT=7Pvwa-rWHLg@mail.gmail.com>
From: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <CAL_JsqKVa+XHkoDbDLaD+haC2J7QDJ_oLr9RAT=7Pvwa-rWHLg@mail.gmail.com>
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_231128_742011_06149EB5 
X-CRM114-Status: GOOD (  11.85  )
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

CgpPbiAyMDIzLzQvMTkgMjo0NiwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBBcHIgMTgs
IDIwMjMgYXQgMTo0MuKAr1BNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+
Pgo+PiBPbiBUaHUsIEFwciAxMywgMjAyMyBhdCAxMDo0MToyM0FNICswMjAwLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOgo+Pj4gT24gMTMvMDQvMjAyMyAwNDozNCwgQ2hhbmdodWFuZyBMaWFu
ZyB3cm90ZToKPj4+Pj4+Pj4gKyAgbGFuZV9tYXBzOgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2h5IGRpZCB0
aGlzIGFwcGVhcj8gVW5kZXJzY29yZXMgYXJlIG5vdCBhbGxvd2VkLiBJdCBsb29rcyBsaWtlIHlv
dQo+Pj4+Pj4+IHJlLWltcGxlbWVudCBzb21lIHN0YW5kYXJkIHByb3BlcnR5Lgo+Pj4+Pj4+Cj4+
Pj4+Pgo+Pj4+Pj4gV2lsbCBjaGFuZ2UgdG8gbGFuZS1tYXBzLgo+Pj4+Pj4gWWVzLCBhY2NvcmRp
bmcgdG8gVmlub2QgYWR2aWNlLCBsYW5lIG1hcHBpbmcgdGFibGUgdXNlIGRldmljZSB0cmVlCj4+
Pj4+PiB0byBwYXJzZSBtYWtlcyBzZW5zZS4KPj4+Pj4KPj4+Pj4gSG0sIEkgaGF2ZSBhIGZlZWxp
bmcgdGhhdCBJIHNhdyBzdWNoIHByb3BlcnR5LCBzbyB5b3Ugc2hvdWxkIGRpZyBpbnRvCj4+Pj4+
IGV4aXN0aW5nIGFuZCBpbi1mbGlnaHQgYmluZGluZ3MuCj4+Pj4+Cj4+Pj4+IEJlc3QgcmVnYXJk
cywKPj4+Pj4gS3J6eXN6dG9mCj4+Pj4+Cj4+Pj4KPj4+PiBBIHN0YW5kYXJkIHByb3BlcnR5PyBM
aWtlICJjbG9ja3MiIG9yICJyZXNldHMiPwo+Pj4KPj4+IExpa2UgbGFuZS1wb2xhcml0aWVzIG5v
dyBzdWJtaXR0ZWQgdG8gb25lIE1JUEkuCj4+Pgo+Pgo+PiBkYXRhLWxhbmVzIHBlcmhhcHM/Cj4g
Cj4gRXhjZXB0IHRoYXQgaXMgZm9yIHRoZSBjb250cm9sbGVyJ3MgZW5kcG9pbnQgcmF0aGVyIHRo
YW4gdGhlIHBoeS4KPiBQcmVzdW1hYmx5IGlmIHRoZSBjb250cm9sbGVyIGtub3dzIHRoZSBtYXBw
aW5nLCB0aGVuIGl0IGNhbiB0ZWxsIHRoZQo+IHBoeSBpZiBpdCBuZWVkcyB0aGUgaW5mb3JtYXRp
b24uIElPVywgZG9uJ3QganVzdCBjb3B5ICdkYXRhLWxhbmVzJyB0bwo+IHRoZSBwaHkuIEZvbGxv
dyB0aGUgbm9ybWFsIHBhdHRlcm5zLgo+IAo+IFJvYgoKSSBhbSBub3Qgc3VyZSBpZiBwaHkgY2Fu
IGZldGNoIGZyb20gdGhlIG90aGVyIGNvbnRyb2xsZXIncyBlbmRwb2ludC4gSW4gCmFkZGl0aW9u
LCBsaWtlIG91ciBKSDcxMTAgU29DLCBpdCBoYXZlIGRhdGEtbGFuZXMgY29uZmlndXJlIChkYXRh
LWxhbmVzID0gPDEgMj4pCmluIGNzaTJyeCBjb250cm9sbGVyLCBidXQgdGhpcyBkYXRhLWxhbmVz
IGNvbmZpZ3VyZSBpcyBub3QgYXBwcm9wcmlhdGUgdG8gcGh5LCAKbWF5YmUgdGhleSBhcmUgaW5k
ZXBlbmRlbnQuIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
