Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624DCC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 02:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1UmQFzvKWIL4C7p+Fa3LqfEc/rxTIHvJ75zQkB6rW/s=; b=S9kH8kwnZZ76rH
	H2xFO3Aq2lRcLbAehffkHQDG3a4wR9d9eRD6LDXmPr6AAE8PJx9WNE7DYx5RZSjUP/iP4cAE/CQaC
	zDPkvKsL0WyQGvgqONbgIjMe9Wws2BGvvYpwcL2X0/o6KXj9XQbW2JFXXiz9SCdA7gpi78TNJui5y
	9lT5eQGLricvPCgQLp135+eD28kNoeauLchozDpRGuEVTxiDp9sEWeCF70f2KRQNASiEcF3anypgw
	Ysu+XS/7MxBi8JGQcWu89t5Bn2uhyWykIkEIRgyW/WKDOX1z/9qwb8bHb4fjwWjZ2eKb7BPvWP/mO
	NCPd78a6IPzbEahu7BIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm4Ax-00GI8T-3A;
	Tue, 11 Apr 2023 02:56:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm4At-00GI4x-1s
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 02:56:06 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id AA21624E292;
	Tue, 11 Apr 2023 10:54:42 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 10:54:42 +0800
Received: from [192.168.120.57] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 11 Apr
 2023 10:54:42 +0800
Message-ID: <c9e5e8cf-cfa9-0081-2851-2db46c2cddf3@starfivetech.com>
Date: Tue, 11 Apr 2023 10:54:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 2/4] mmc: starfive: Add sdio/emmc driver support
To: Shengyu Qu <wiagn233@outlook.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-mmc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, <linux-kernel@vger.kernel.org>
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <20230215113249.47727-3-william.qiu@starfivetech.com>
 <TY3P286MB26115A8F90DAD2D7DA4DCBEB988B9@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <TY3P286MB26115E6311132C791616D32B98889@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
 <cfde7320-323f-725e-8ed5-c8473bce1755@starfivetech.com>
 <TY3P286MB26113FF6ABD3CBA616DEC6DC98959@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <TY3P286MB26113FF6ABD3CBA616DEC6DC98959@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_195603_951444_F804D14C 
X-CRM114-Status: GOOD (  17.77  )
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

CgpPbiAyMDIzLzQvMTEgMjowNCwgU2hlbmd5dSBRdSB3cm90ZToKPiBIZWxsbyBXaWxsaWFtLAo+
IAo+PiBPbiAyMDIzLzMvMjkgMDowOCwgU2hlbmd5dSBRdSB3cm90ZToKPj4+IEhlbGxvIFdpbGxp
YW0sCj4+Pgo+Pj4gU29ycnkgZm9yIG1ha2luZyBub2lzZSBhYm91dCB0aGlzLCBidXQgc2VlbXMg
ZGVsZXRlZCB2b2x0YWdlIHN3dGljaCBmdW5jdGlvbgo+Pj4KPj4+IGRvZXNuJ3QgaGVscCBhYm91
dCB0aGlzLiBCdXQgdGhlcmUncyBzdGlsbCBhIHByb2JsZW0gYWJvdXQgZU1NQyBzcGVlZC4gQ3Vy
cmVudGx5Cj4+Pgo+Pj4gb25seSBhYm91dCAyME1CL3MgbWF4aW11bSByZWFkaW5nIHNwZWVkIGNv
dWxkIGJlIHJlYWNoZWQgd2hlbiB1c2luZyBlTU1DCj4+Pgo+Pj4gb24gVkYyLCBhbnkgaWRlYSBh
Ym91dCB0aGlzPwo+Pj4KPj4+IEJlc3QgcmVnYXJkcywKPj4+Cj4+PiBTaGVuZ3l1Cj4+Pgo+Pj4g
5ZyoIDIwMjMvMy8yOCAwOjAxLCBTaGVuZ3l1IFF1IOWGmemBkzoKPj4+PiBIZWxsbyBXaWxsaWFt
LAo+Pj4+Cj4+Pj4gSSdtIGRpZ2dpbmcgaW50byBkb3duc3RyZWFtIG1tYyBkcml2ZXIgdGhlc2Ug
ZGF5cyBhbmQgZm91bmQgYSBwcm9ibGVtCj4+Pj4KPj4+PiB0aGF0IGN1cnJlbnQgdmVyc2lvbiBt
YWlubGluZSBkcml2ZXIgZG9lc24ndCBoYXMgYSB2b2x0YWdlIHN3aXRjaCBmdW5jdGlvbiBmb3IK
Pj4+Pgo+Pj4+IGl0LiBEb3duc3RyZWFtIG9sZGVyIHZlcnNpb24gaGFzIG9uZSBidXQgd2FzIGRl
bGV0ZWQgaW4gdGhpcyBjb21taXQgWzFdLgo+Pj4+Cj4+Pj4gSXQgd2FzIGRlbGV0ZWQgc2luY2Ug
dmYyJ3MgU0Qgc2xvdCBkb2Vzbid0IGhhdmUgMS44ViBpbnB1dCBidXQgY29tbWl0ZXIgZm9yZ290
Cj4+Pj4KPj4+PiB0aGF0IHZmMidzIGVNTUMgc2xvdCBoYXMgYSBwcm9wZXIgMS44ViBpbnB1dC4K
Pj4+Pgo+Pj4+IFNvIGNvdWxkIHlvdSBhZGQgdm9sdGFnZSBzd2l0Y2ggZnVuY3Rpb24gZm9yIG1h
aW5saW5lPyBJJ3ZlIG1ldCBhIGVNTUMgc3BlZWQKPj4+Pgo+Pj4+IHByb2JsZW0gcG9zc2libHkg
ZHVlIHRvIGl0Lgo+Pj4+Cj4+Pj4gQmVzdCByZWdhcmRzLAo+Pj4+Cj4+Pj4gU2hlbmd5dQo+Pj4+
Cj4+IAo+PiBIaSBTaGVuZ3l1LAo+PiAKPj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lgo+PiAK
Pj4gRmlyc3Qgb2YgYWxsLCBJIHdpbGwgY29uc2lkZXIgYWRkaW5nIHZvbHRhZ2Ugc3dpdGNoIGZ1
bmN0aW9uLCBidXQgdGhlIGltcGxlbWVudGF0aW9uCj4+IG1ldGhvZCBpcyB0byBjb25maWd1cmUg
dGhlIHBtaWMgcmVnaXN0ZXIgY29uZmlndXJhdGlvbiBpbiBkdHMsIGFuZCB0aGUgaW1wbGVtZW50
YXRpb24KPj4gaW50ZXJmYWNlIHdpbGwgdXNlIHRoZSB2b2x0YWdlIHN3aXRjaCBmdW5jdGlvbiBp
biBkd19tbWMuYy4KPj4gCj4+IEFzIGZvciBzcGVlZCwgdGhlIG1haW4gcmVhc29uIGZvciB0aGUg
bG93IHJhdGUgaXMgdGhlIGNsb2NrIG9mIEpINzExMCBhbmQgdGhlCj4+IGFzc29jaWF0ZWQgSU8g
ZHJpdmluZyBzdHJlbmd0aCwgaW4gdGhpcyBsaW1pdCwgdGhlIG1heGltdW0gcmVhZGluZyBzcGVl
ZCBJIHRlc3RlZCB3YXMKPj4gYWJvdXQgNTBNYi9zLgo+PiAKPj4gSSB3aWxsIHRyeSB0byByZXBy
b2R1Y2UgeW91ciBwcm9ibGVtIGFuZCB0cnkgdG8gc29sdmUgaXQuIFRoYW5rcyBmb3Igc3VnZ2Vz
dGlvbnMuCj4+IAo+PiBCZXN0IHJlZ2FyZHMsCj4+IFdpbGxpYW0KPiBJIGZvdW5kIG91dCB0aGUg
cmVhc29uIGFuZCBmaXhlZCB0aGF0LiBkbXdjaSBkcml2ZXIgbmVlZHMgdnFtbWMgc3VwcGx5Cj4g
Y29uZmlndXJlZCBpbiBkZXZpY2UgdHJlZSBhbmQgYSBzdWNjZXNzZnVsIHZvbHRhZ2UgY2hhbmdl
IHRvIGFjdHVhbGx5Cj4gZW5hYmxlIDEuOHYgbW9kZSwgZXZlbiAxLjggc3VwcGx5IGFjdHVhbGx5
IGFscmVhZHkgcGh5c2ljYWxseSBleGlzdHMuCj4gU28gdG8gc29sdmUgdGhpcyBwcm9ibGVtLCBJ
IHdyb3RlIEFYUDE1MDYwIGRyaXZlciBhbmQgZGV2aWNlIHRyZWUKPiBiaW5kaW5ncyBiYXNpbmcg
b24gLXVwc3RyZWFtIGJyYW5jaCBhbmQgZ2V0cyBvdmVyIDc1TUIvcyByZWFkIHNwZWVkLiBUaGUK
PiBkcml2ZXIgc2VyaWVzIGlzIGFscmVhZHkgdW5kZXIgcmV2aWV3IGhlcmU6Cj4gCj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1RZM1AyODZNQjI2MTE3ODkxREZCMkRENjE1QTdDNTRFRjk4
OTY5QFRZM1AyODZNQjI2MTEuSlBOUDI4Ni5QUk9ELk9VVExPT0suQ09NLwo+IAo+IEJlc3QgcmVn
YXJkcywKPiBTaGVuZ3l1CgpIaSBTaGVuZ3l1LAoKVGhhbmtzIGZvciB0aGUgcGF0Y2ggc2VyaWVz
LiBJIHdpbGwgdHJ5IGl0IG9uIG15IGJyYW5jaC4KCkJlc3QgcmVnYXJkcywKV2lsbGlhbQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
