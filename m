Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D05C25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15bDHV5EeE6EVUzfuBDAM/1j7L6ee/ieP8+OeVqu6UE=; b=BLzg658BVNlcMY
	jgYaQ85s1Jg6nEjmbyIGFGq9AUHbKAhEaiZHbWpDcxY9DfMMSeBg+ZxZvplW7M+wVERydnXGNpQhq
	Q0vainbPqb8qwm6+VUDW6FSd1c9yxv0ebmPWcbkdn6PuxUfgJv1FTXEQTXAvwzjeIdwW+8ksp3GCt
	JwbpMlXeOYMJUGycrr66Q+OuKkITCGS622F18FD7xivtmAaVKfZ3noHRHLr6jx26USmVzwq3VQAwR
	mo0s8NX+9rF69qctDruOFX1dq5f9LWrpNXUvnwC/wbhldUjaU9m20yPDMRcygxSLRmS/ORS0oFpM8
	TCtgx3syz6LaJkCIxhFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwK1C-00G75f-0G;
	Fri, 27 Oct 2023 10:24:42 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwK18-00G74X-2v
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 10:24:41 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 70B0724DBFD;
	Fri, 27 Oct 2023 18:24:01 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 27 Oct
 2023 18:24:01 +0800
Received: from [192.168.120.47] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 27 Oct
 2023 18:24:00 +0800
Message-ID: <e3faaa46-896a-405d-ac5f-97587e81fba4@starfivetech.com>
Date: Fri, 27 Oct 2023 18:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] pwm: opencores: Add PWM driver support
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-pwm@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Thierry Reding
	<thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20231020103741.557735-1-william.qiu@starfivetech.com>
 <20231020103741.557735-3-william.qiu@starfivetech.com>
 <20231020112539.gctx5uj2rrhryulo@pengutronix.de>
 <b2ef7299-5d5a-4ef7-89fd-04b6130cb227@starfivetech.com>
 <20231024114545.73ljfceuon2blkxz@pengutronix.de>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20231024114545.73ljfceuon2blkxz@pengutronix.de>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_032439_250252_B3117A81 
X-CRM114-Status: GOOD (  31.60  )
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

CgpPbiAyMDIzLzEwLzI0IDE5OjQ1LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBIZWxsbyBX
aWxsaWFtLAo+IAo+IE9uIFR1ZSwgT2N0IDI0LCAyMDIzIGF0IDA1OjE2OjQ5UE0gKzA4MDAsIFdp
bGxpYW0gUWl1IHdyb3RlOgo+PiBPbiAyMDIzLzEwLzIwIDE5OjI1LCBVd2UgS2xlaW5lLUvDtm5p
ZyB3cm90ZToKPj4gPiBIZWxsbywKPj4gPiAKPj4gPiBPbiBGcmksIE9jdCAyMCwgMjAyMyBhdCAw
NjozNzozOVBNICswODAwLCBXaWxsaWFtIFFpdSB3cm90ZToKPj4gPj4gQWRkIFB1bHNlIFdpZHRo
IE1vZHVsYXRpb24gZHJpdmVyIHN1cHBvcnQgZm9yIE9wZW5Db3Jlcy4KPj4gPj4gCj4+ID4+IENv
LWRldmVsb3BlZC1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+Cj4+ID4+
IFNpZ25lZC1vZmYtYnk6IEhhbCBGZW5nIDxoYWwuZmVuZ0BzdGFyZml2ZXRlY2guY29tPgo+PiA+
PiBTaWduZWQtb2ZmLWJ5OiBXaWxsaWFtIFFpdSA8d2lsbGlhbS5xaXVAc3RhcmZpdmV0ZWNoLmNv
bT4KPj4gPj4gLS0tCj4+ID4+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgfCAgIDcgKysKPj4g
Pj4gIGRyaXZlcnMvcHdtL0tjb25maWcgICAgICB8ICAxMSArKwo+PiA+PiAgZHJpdmVycy9wd20v
TWFrZWZpbGUgICAgIHwgICAxICsKPj4gPj4gIGRyaXZlcnMvcHdtL3B3bS1vY29yZXMuYyB8IDIx
MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gPj4gIDQgZmlsZXMg
Y2hhbmdlZCwgMjMwIGluc2VydGlvbnMoKykKPj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3B3bS9wd20tb2NvcmVzLmMKPj4gPj4gCj4+ID4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVS
UyBiL01BSU5UQUlORVJTCj4+ID4+IGluZGV4IDZjNGNjZTQ1YTA5ZC4uMzIxYWY4ZmE3YWFkIDEw
MDY0NAo+PiA+PiAtLS0gYS9NQUlOVEFJTkVSUwo+PiA+PiArKysgYi9NQUlOVEFJTkVSUwo+PiA+
PiBAQCAtMTYwMDMsNiArMTYwMDMsMTMgQEAgRjoJRG9jdW1lbnRhdGlvbi9pMmMvYnVzc2VzL2ky
Yy1vY29yZXMucnN0Cj4+ID4+ICBGOglkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW9jb3Jlcy5jCj4+
ID4+ICBGOglpbmNsdWRlL2xpbnV4L3BsYXRmb3JtX2RhdGEvaTJjLW9jb3Jlcy5oCj4+ID4+IAo+
PiA+PiArT1BFTkNPUkVTIFBXTSBEUklWRVIKPj4gPj4gK006CVdpbGxpYW0gUWl1IDx3aWxsaWFt
LnFpdUBzdGFyZml2ZXRlY2guY29tPgo+PiA+PiArTToJSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJm
aXZldGVjaC5jb20+Cj4+ID4+ICtTOglTdXBwb3J0ZWQKPj4gPj4gK0Y6CURvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vb3BlbmNvcmVzLHB3bS1vY29yZXMueWFtbAo+PiA+PiAr
RjoJZHJpdmVycy9wd20vcHdtLW9jb3Jlcy5jCj4+ID4+ICsKPj4gPj4gIE9QRU5SSVNDIEFSQ0hJ
VEVDVFVSRQo+PiA+PiAgTToJSm9uYXMgQm9ubiA8am9uYXNAc291dGhwb2xlLnNlPgo+PiA+PiAg
TToJU3RlZmFuIEtyaXN0aWFuc3NvbiA8c3RlZmFuLmtyaXN0aWFuc3NvbkBzYXVuYWxhaHRpLmZp
Pgo+PiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vS2NvbmZpZyBiL2RyaXZlcnMvcHdtL0tj
b25maWcKPj4gPj4gaW5kZXggOGViY2RkZjkxZjdiLi5jYmZiZjIyN2Q5NTcgMTAwNjQ0Cj4+ID4+
IC0tLSBhL2RyaXZlcnMvcHdtL0tjb25maWcKPj4gPj4gKysrIGIvZHJpdmVycy9wd20vS2NvbmZp
Zwo+PiA+PiBAQCAtNDM0LDYgKzQzNCwxNyBAQCBjb25maWcgUFdNX05UWEVDCj4+ID4+ICAJICBj
b250cm9sbGVyIGZvdW5kIGluIGNlcnRhaW4gZS1ib29rIHJlYWRlcnMgZGVzaWduZWQgYnkgdGhl
IG9yaWdpbmFsCj4+ID4+ICAJICBkZXNpZ24gbWFudWZhY3R1cmVyIE5ldHJvbml4Lgo+PiA+PiAK
Pj4gPj4gK2NvbmZpZyBQV01fT0NPUkVTCj4+ID4+ICsJdHJpc3RhdGUgIk9wZW5jb3JlcyBQV00g
c3VwcG9ydCIKPj4gPj4gKwlkZXBlbmRzIG9uIEhBU19JT01FTSAmJiBPRgo+PiA+PiArCWRlcGVu
ZHMgb24gQ09NTU9OX0NMSyAmJiBSRVNFVF9DT05UUk9MTEVSCj4+ID4gCj4+ID4gV291bGQgaXQg
bWFrZSBzZW5zZSB0byBhZGQgc29tZXRoaW5nIGxpa2U6Cj4+ID4gCj4+ID4gCWRlcGVuZHMgb24g
QVJDSF9TT01FVEhJTkcgfHwgQ09NUElMRV9URVNUCj4+ID4gCj4+ID4gaGVyZT8KPj4gPiAKPj4g
QnV0IHRoZXJlIGlzIG5vIG1lbnRpb24gb2YgYXJjaGl0ZWN0dXJhbCBsaW1pdGF0aW9ucyBpbiB0
aGUgT3BlbkNvcmVzJ3MKPj4gc3BlY2lmaWNhdGlvbi4KPiAKPiBJIGFscmVhZHkgZ3Vlc3NlZCB0
aGF0LiBTdGlsbCBpdCBwcm9iYWJseSBtYWtlcyBubyBzZW5zZSB0byBlbmFibGUgdGhhdAo+IG9w
dGlvbiBvbiBtb3N0IG1hY2hpbmVzLiBUaGUgUFdNIGRldmljZSBmb3VuZCBpbiBpLk1YIFNvQ3Mg
Y2FuCj4gdGhlb3JldGljYWxseSBhbHNvIGJlIGltcGxlbWVudGVkIG9uIEFUOTEgb3IgUzM5MHgu
IEluIHByYWN0aWNlIGl0Cj4gaXNuJ3QsIHNvIHRoZXJlIGlzIGEgZGVwZW5kZW5jeSBvbiBBUkNI
X01YQyB8fCBDT01QSUxFX1RFU1QuCj4gCj4gQ29uc2lkZXIgdGhlIHJvbGUgb2Ygc29tZW9uZSB3
aG8gZG9lcyBhIGtlcm5lbCBidW1wIGZvciBhIGNlcnRhaW4KPiBtYWNoaW5lIChvbiBvbmUgZW5k
IG9mIHRoZSBzcGVjdHJ1bSkgb3IgYSBkaXN0cmlidXRpb24ga2VybmVsIChvbiB0aGUKPiBvdGhl
ciBlbmQpLgo+IAo+IElmIHlvdSB0YWtlIGEgNi41IHg4Nl82NCBhbGxtb2Rjb25maWcgKyBDT01Q
SUxFX1RFU1Q9biBhbmQgdXBncmFkZSB0bwo+IHY2LjYtcmM3IGFuZCBkbyBhbiBvbGRjb25maWcs
IHlvdSBnZXQgOTAgcXVlc3Rpb25zWzFdLgo+IAo+IEp1c3QgbG9va2luZyBxdWlja2x5IHRocm91
Z2ggdGhpcyBsaXN0LCBhbW9uZyB0aGVtIGFyZToKPiAKPiAJRFJNIHN1cHBvcnQgZm9yIExvb25n
c29uIEdyYXBoaWNzIChEUk1fTE9PTkdTT04pIFtOL20vP10gKE5FVykgCj4gCVhpbGlueCBBWEkg
RE1BUyBFbmdpbmUgKFhJTElOWF9ETUEpIFtOL20veS8/XSAoTkVXKQo+IAlDbG9jayBkcml2ZXIg
Zm9yIFJlbmVzYXMgVmVyc2FDbG9jayAzIGRldmljZXMgKENPTU1PTl9DTEtfVkMzKSBbTi9tL3kv
P10gKE5FVykKPiAJUmVhbHRlayBSVDEwMTcgU0RDQSBDb2RlYyAtIFNEVyAoU05EX1NPQ19SVDEw
MTdfU0RDQV9TRFcpIFtOL20vP10gKE5FVykKPiAKPiBJIGRpZG4ndCBjaGVjayBpbiBkZXRhaWwg
YW5kIG1heWJlIG9uZSBvciB0aGUgb3RoZXIgaXMgdmFsaWQgb24geDg2XzY0LAo+IGJ1dCBJJ2Qg
YmUgc3VycHJpc2VkIGlmIHlvdSBmaW5kIHR3byB0aGF0IGFyZSBzZW5zaWJsZSB0byBlbmFibGUg
b24KPiB4ODZfNjQgdG8gc3VwcG9ydCBhIHJlYWwgbWFjaGluZS4KPiAKPiBXaGlsZSBJIHRoaW5r
IEtjb25maWcgY2Fubm90IGJlIGhlbGQgcmVzcG9uc2libGUgdG8gb25seSBhbGxvdwo+IGdlbmVy
YXRpbmcgInJlYWwgd29ybGQgc2Vuc2libGUiIGNvbmZpZ3VyYXRpb25zLCB3ZSBzaG91bGQgd29y
ayBhIGJpdAo+IGhhcmRlciB0byBydWxlIG91dCB0aGUgb2J2aW91cyB2aW9sYXRvcnMgYW5kIG1h
a2UgaXQgZWFzeSBmb3IgcGVvcGxlCj4gY29uZmlndXJpbmcgdGhlIGtlcm5lbCB3aGVyZSBzZW5z
aWJsZS4KPiAKPiBJbiBteSBib29rIGl0J3MgYmV0dGVyIHRvIGhhdmUgYSB0b28gc3Ryb25nIGRl
cGVuZGVuY3kgYXQgZmlyc3QgZm9yIGEKPiBuZXcgZHJpdmVyIChidXQgYWxsb3cgaXQgd2l0aCBD
T01QSUxFX1RFU1QpLiBTb21lb25lIHdobyBhcyBhIGRldmljZQo+IG5lZWRpbmcgdGhhdCBkcml2
ZXIgd2lsbCBmaW5kIGl0IG91dCBhbmQgc3BlYWsgdXAuIEhvd2V2ZXIgaWYgeW91IGFsbG93Cj4g
dG8gZW5hYmxlIHRoZSBkcml2ZXIgZXZlcnl3aGVyZSwgbWFueSBwZW9wbGUgd2lsbCBkaXNhYmxl
IHRoZSBkcml2ZXIKPiAobWF5YmUgdXNpbmcgeWVzICcnIHwgbWFrZSBvbGRjb25maWcpLCBzb21l
IHdpbGwgc3BlbmQgdGltZSB0byByZXNlYXJjaAo+IGFib3V0IHRoaXMgb3B0aW9uIHRvIGZpbmQg
d2hpY2ggbWFjaGluZXMgYWN0dWFsbHkgaGF2ZSBzdWNoIGEgZGV2aWNlIGFuZAo+IGlmIHRoZSBt
YWNoaW5lKHMpIHRoZXkgY2FyZSBhYm91dCBhcmUgaW4gdGhpcyBzZXQuIFRoaXMgaXMgYSB3YXN0
ZSBvZgo+IHRpbWUgYW5kIG9wcG9ydHVuaXRpZXMuIChBbmQgbm90ZSwgdGhpcyBpc24ndCBvbmx5
IGFib3V0IHBlb3BsZSBzcGVuZGluZwo+IHRpbWUgdG8gZGVjaWRlIGlmIHRoZXkgZW5hYmxlIG9y
IGRpc2FibGUgUFdNX09DT1JFUywgdGhpcyBpcyBhbHNvIGFib3V0Cj4gcGVvcGxlIHdobyB1c2Ug
eWVzICcnIGJlY2F1c2UgdGhlcmUgYXJlIHRvbyBtYW55IHF1ZXN0aW9ucyBhbmQgc28gdGhleQo+
IG1pZ2h0IG1pc3MgdGhlIGhhbmRmdWwgb2YgdXNlZnVsIG9uZXMuKQo+IAo+IEJlc3QgcmVnYXJk
cwo+IFV3ZQo+IAo+IFsxXSBtZWFzdXJlZCB1c2luZwo+IAo+IAl5ZXMgJycgfCBtYWtlIG9sZGNv
bmZpZwo+IAo+IGFuZCBjb3VudGluZyB0aGUgb2NjdXJyZW5jZXMgb2YgIihORVcpIi4KPiAKSSBz
ZWUsIEknbGwgdGhpbmsgYWJvdXQgaXQuCk1heWJlIGRlcGVuZCBvbiBTVEFSRklWRSdTIFNvQ3Mg
Zmlyc3Q/CgpCZXN0IHJlZ2FyZHMsCldpbGxpYW0KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
