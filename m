Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C018AEE57ED
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Sep 2023 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9t+hw78Wy2KlRC9kAIJ8TjM14yWp4Ix9sE3AwQ6DKk=; b=JT9CgYDQtERVE4
	DD8QZfcjPOe9XFRIl+T+Wl0I3fQar3bIRnhSM1qjsLbi13JCtZX7/slPGLpVsP8IWcCOAvpSYF3nZ
	xISReqT/KFut8VtZAdyAJW7X7HIuhHlwCG+n4v5ukw9VHQBTbUNFFLIG6Fgz/z+JM3++/0kSvo97q
	XxLn+RYT/SxfMlDXWfEQ8P/LhYYJf+gvm+uJFM13MywxJ/mPQkf+TQxwuFD2CrRMJAQwJERTm6Try
	Cho6HAYHL2dH4hb1ATzi/CuoXd4u8WpL0mpGrUvikzBEs6fjGjGvrqqC11g0RGmiAQiynwyz62+uq
	gUPe7BqI3dE5DAVlVZSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYJY-00DRXn-2u;
	Fri, 08 Sep 2023 10:02:12 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeYJV-00DRTU-01
	for linux-riscv@lists.infradead.org;
	Fri, 08 Sep 2023 10:02:11 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id ABC8824E161;
	Fri,  8 Sep 2023 18:01:22 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 8 Sep
 2023 18:01:22 +0800
Received: from [192.168.120.76] (171.223.208.138) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 8 Sep
 2023 18:01:21 +0800
Message-ID: <dd63bb4f-a59b-0323-08fb-03f8cc048b6e@starfivetech.com>
Date: Fri, 8 Sep 2023 18:01:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v1 1/3] dt-bindings: mmc: Drop unused properties
To: Conor Dooley <conor@kernel.org>, Jessica Clarke <jrtc27@jrtc27.com>
CC: Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML
	<linux-kernel@vger.kernel.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, <linux-mmc@vger.kernel.org>, "Emil Renner
 Berthing" <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Jaehoon Chung
	<jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230830031846.127957-1-william.qiu@starfivetech.com>
 <20230830031846.127957-2-william.qiu@starfivetech.com>
 <20230830-commence-trickery-40eaa193cb15@wendy>
 <b375b88c-0d9c-30a9-21f6-283083cf3880@linaro.org>
 <20230830-procedure-frostbite-56c751f7c276@wendy>
 <efab6f52-4d7f-ea3c-0fc3-4e3ad03c14c7@starfivetech.com>
 <20230901-remold-sublease-a1ddb1fc6348@spud>
 <9EF26965-10E5-4BCA-AC5E-93C5AA55A0DF@jrtc27.com>
 <20230901-affected-wanting-ab517791a870@spud>
Content-Language: en-US
From: William Qiu <william.qiu@starfivetech.com>
In-Reply-To: <20230901-affected-wanting-ab517791a870@spud>
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_030209_349554_25C15D9D 
X-CRM114-Status: GOOD (  22.22  )
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

CgpPbiAyMDIzLzkvMiAxOjQzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gRnJpLCBTZXAgMDEs
IDIwMjMgYXQgMDY6MjA6MzhQTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ugd3JvdGU6Cj4+IE9uIDEg
U2VwIDIwMjMsIGF0IDE2OjQyLCBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+PiA+IAo+PiA+IE9uIEZyaSwgU2VwIDAxLCAyMDIzIGF0IDEwOjMzOjEzQU0gKzA4MDAsIFdp
bGxpYW0gUWl1IHdyb3RlOgo+PiA+PiAKPj4gPj4gCj4+ID4+IE9uIDIwMjMvOC8zMCAxNjozNCwg
Q29ub3IgRG9vbGV5IHdyb3RlOgo+PiA+Pj4gT24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgMDk6Mjk6
MjBBTSArMDIwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gPj4+PiBPbiAzMC8wOC8y
MDIzIDA4OjUwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+ID4+Pj4+IE9uIFdlZCwgQXVnIDMwLCAy
MDIzIGF0IDExOjE4OjQ0QU0gKzA4MDAsIFdpbGxpYW0gUWl1IHdyb3RlOgo+PiA+Pj4+Pj4gRHVl
IHRvIHRoZSBjaGFuZ2Ugb2YgdHVuaW5nIGltcGxlbWVudGF0aW9uLCBpdCdzIG5vIGxvbmdlciBu
ZWNlc3NhcnkgdG8KPj4gPj4+Pj4+IHVzZSB0aGUgInN0YXJmaXZlLHN5c3JlZyIgcHJvcGVydHkg
aW4gZHRzLCBzbyBkcm9wIHRoZSByZWxldmFudAo+PiA+Pj4+Pj4gZGVzY3JpcHRpb24gaW4gZHQt
YmluZGluZ3MgaGVyZS4KPj4gPj4+Pj4gCj4+ID4+Pj4+IEhvdyBkb2VzIGNoYW5naW5nIHlvdXIg
c29mdHdhcmUgaW1wbGFudGF0aW9uIGludmFsaWRhdGUgYSBkZXNjcmlwdGlvbiBvZgo+PiA+Pj4+
PiB0aGUgaGFyZHdhcmU/Cj4+ID4+Pj4+IAo+PiA+Pj4+IAo+PiA+Pj4+IFdoaWNoIGlzIGtpbmQg
b2YgcHJvb2YgdGhhdCB0aGlzIHN5c2NvbiB3YXMganVzdCB0byBzdWJzdGl0dXRlCj4+ID4+Pj4g
aW5jb21wbGV0ZSBoYXJkd2FyZSBkZXNjcmlwdGlvbiAoZS5nLiBtaXNzaW5nIGNsb2NrcyBhbmQg
cGh5cykuIFdlCj4+ID4+Pj4gc2hvdWxkIGhhdmUgcmVqZWN0ZWQgaXQuIEp1c3QgbGlrZSB3ZSBz
aG91bGQgcmVqZWN0IHRoZW0gaW4gdGhlIGZ1dHVyZS4KPj4gPj4+IAo+PiA+Pj4gOnMgSSBkdW5u
byB3aGF0IHRvIGRvIHdpdGggdGhpcy4uLiBJJ20gaW5jbGluZWQgdG8gc2F5IG5vdCB0byByZW1v
dmUgaXQKPj4gPj4+IGZyb20gdGhlIGJpbmRpbmcgb3IgZHRzIGF0IGFsbCAmIG9ubHkgY2hhbmdl
IHRoZSBzb2Z0d2FyZS4KPj4gPj4+IAo+PiA+Pj4+IFRoZXJlIGFyZSBqdXN0IGZldyBjYXNlcyB3
aGVyZSBzeXNjb24gaXMgcmVhc29uYWJsZS4gQWxsIG90aGVycyBpcyBqdXN0Cj4+ID4+Pj4gbGF6
aW5lc3MuIEl0J3Mgbm90IG9ubHkgc3RhcmZpdmV0ZWNoLCBvZiBjb3Vyc2UuIFNldmVyYWwgb3Ro
ZXIKPj4gPj4+PiBjb250cmlidXRvcnMgZG8gdGhlIHNhbWUuCj4+ID4+PiAKPj4gPj4+IEknbSBu
b3Qgc3VyZSBpZiBsYXppbmVzcyBpcyBmYWlyLCBsYWNrIG9mIHVuZGVyc3RhbmRpbmcgaXMgdXN1
YWxseSBtb3JlCj4+ID4+PiBsaWtlbHkuCj4+ID4+IAo+PiA+PiBGb3IgdGhpcywgSSB0ZW5kIHRv
IGtlZXAgaXQgaW4gYmluZGluZywgYnV0IHJlbW92ZSBpdCBmcm9tIHJlcXVpcmVkLiBCZWNhdXNl
Cj4+ID4+IHdlIG9ubHkgbW9kaWZ5IHRoZSB0dW5pbmcgaW1wbGVtZW50YXRpb24sIGl0IGRvZXNu
J3QgbWVhbiB0aGF0IHRoaXMgcHJvcGVydHkKPj4gPj4gbmVlZCB0byBiZSByZW1vdmVkLCBpdCdz
IGp1c3Qgbm8gbG9uZ2VyIGJlIHRoZSByZXF1aXJlZCBvbmUuCj4+ID4gCj4+ID4gUGxlYXNlIG9u
bHkgcmVtb3ZlIGl0IGZyb20gcmVxdWlyZWQgaWYgdGhlIGN1cnJlbnQgZHJpdmVyIGRvZXNuJ3Qg
YnJlYWsKPj4gPiBpZiB0aGUgcmVnbWFwIGlzIHJlbW92ZWQuCj4+IAo+PiBFaXRoZXIgd2F5IHBs
ZWFzZSBtYWtlIHN1cmUgdGhlIGRvY3VtZW50YXRpb24gY2xlYXJseSBzdGF0ZXMg4oCcbmV2ZXIg
dXNlCj4+IHRoaXMsIGlmIHlvdeKAmXJlIHVzaW5nIGl0IHlvdeKAmXJlIGRvaW5nIGl0IHdyb25n
LCB0aGlzIG9ubHkgZXhpc3RzCj4+IGJlY2F1c2UgaXQgd2FzIHdyb25nbHkgdXNlZCBpbiB0aGUg
cGFzdOKAnS4gT3RoZXJ3aXNlIHBlb3BsZSB3cml0aW5nCj4+IGRyaXZlcnMgZm9yIG90aGVyIE9T
ZXMgd2lsbCBwcm9iYWJseSB1c2UgaXQgdG9vIHRoaW5raW5nIHRoZXkgbmVlZCB0by4KPiAKPiBN
YXliZSB3ZSBzaG91bGQganVzdCBkZWxldGUgaXQgaWYgdGhlIGltcGFjdCBpcyBnb2luZyB0byBi
ZSBuZWdsaWdpYmxlLAo+IHNvdW5kcyBsaWtlIHlvdSdyZSBub3QgdXNpbmcgaXQgaW4gRnJlZUJT
RCwgd2hpY2ggd2FzIHBhcnQgb2Ygd2hhdCBJIHdhcwo+IHdvcnJpZWQgYWJvdXQuIEd1ZXNzIGl0
IGRlcGVuZHMgb24gd2hhdCBFbWlsICYgdGhlIGRpc3RybyBoZWFkcyB0aGluay4KSGkgQ29ub3Is
CgpBZnRlciBkaXNjdXNzaW5nIGl0IHdpdGggb3VyIGNvbGxlYWd1ZXMsIHdlIGRlY2lkZWQgdGhh
dCBkZWxldGluZyBpdCB3YXMgdGhlIGJlc3QKY291cnNlIG9mIGFjdGlvbi4gU2luY2UgdGhlcmUg
d2lsbCBubyBsb25nZXIgYmUgYSByZWxhdGVkIGltcGxlbWVudGF0aW9uIG9mCiJzdGFyZml2ZSxz
eXNyZWciIGluIGZ1dHVyZSBkcml2ZXJzLCBldmVuIGlmIHRoZSBkdC1iaW5kaW5nIGlzIGRlc2Ny
aWJlZCwgaXQgd2lsbApiZSAibmV2ZXIgdXNlIiwgc28gSSB0aGluayBpdCBzaG91bGQgYmUgZGVs
ZXRlZC4KCldoYXQgZG8geW91IHRoaW5rPwoKQmVzdCByZWdhcmRzLApXaWxsaWFtCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
