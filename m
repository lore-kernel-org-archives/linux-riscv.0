Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC95EC677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 09:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=C2W+kZx4TJCyjb1+HdpAixXytXycyRDKsaKt0PLXN2w=; b=fUaittsm4vGHHx
	m43doywnF3yZmuhYNVNDV67MaMIzMLQth2JP2+R1twDV31O3EwQaP0z31NPoLQdOLZLTQP3xSwMxL
	ulmTyGOFd8AI6mGDZ8tfuATHNcZIHrbOFiLQGGSoqPDOIynEzPsuRYAD+y2pev5ikImPRui0d91LK
	yBJ2IT3O9O6mscQnc3n142Cm2TT2t1Bek1TCemPgfuPwnDJgT6/rK3JOT6o88cdAuPfX+6+C+wvL0
	f0zmS5PvKIyZYBID7gTbVhUGvD9in3+xzXFcKadEJqFeIHGbZ2N7yv65kchOBVRNCddPbj/ReVTQL
	M6rXcudO4T4dss9bnv3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHgm-00000009See-49yF;
	Wed, 11 Jun 2025 09:24:08 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHgf-00000009SZ5-3y18
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 09:24:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749633823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kO7V+IP0kjxzIQrvpS/6WXoN0TFYQnAdYvQGYN+M9EESRHDfLx2LCr1edGpmh9cjbvAT5xwjplUUPKz+umH5NtVuLrTULPRkrGqrV7In1UfBxOqixKddCXdCIgW3NaauDabDKpWYmoZTfURa2Di7RLaEpcuxpdYs5lRG0cOfqOc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749633823; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KzDcoJuyvrXRTjMEF0wU3nDIzXU2u1U4shVlfR4W+g0=; 
	b=FE+KHIohmMpt4W6j3U8MwU1rB1n8R4l99wCSWzLGlsbxKUeyw9ZZze9ZOxdsUY/AYSoxbmBM7WfFx5sW3ZHAVzRNhe2uBX5hwN2IGwpBTrCrz4jpHiEpI7HWK3tUjBe7g3W4cki8S2aYUr0K8RRG3etZQ/chDm9qNKG7Q/N3VTY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749633823;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KzDcoJuyvrXRTjMEF0wU3nDIzXU2u1U4shVlfR4W+g0=;
	b=a+pYiCO4nqHRRMmAzxo1pgcIPNgGvRa5/G8eM0OyG/USjABXBKDmOp62M8xqS8bB
	stmSILeijgOv1bjOGGKKYq7grIZS1kSuVn+yn/qK76nKny0gHR6FCgxnZF8X7UD9eH2
	brtIG723Rdy5/3HT1CcNH7Ypk9dPzmd59RdcC/Kc=
Received: by mx.zohomail.com with SMTPS id 1749633819809581.0689137008978;
	Wed, 11 Jun 2025 02:23:39 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Chen Wang" <unicorn_wang@outlook.com>, 
	"Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>
In-Reply-To: <PN0P287MB22589781F2D49353E7C66C46FE75A@PN0P287MB2258.INDP287.PROD.OUTLOOK.COM>
Cc: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>, 
	<sophgo@lists.linux.dev>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: Add C906L rproc for Sophgo
	 CV1800B SoC
Message-ID: <1847f2ae7cdd9de8.639eddc348629bd0.78776f2b552d9090@Jude-Air.local>
Date: Wed, 11 Jun 2025 09:23:31 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_022402_364757_2D21C9C4 
X-CRM114-Status: GOOD (  16.45  )
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

CgpPbiAxMS8wNi8yMDI1IDE3OjAxLCBDaGVuIFdhbmcgd3JvdGU6Cj4gT24gMjAyNS82LzggMTA6
MzcsIEp1bmh1aSBMaXUgd3JvdGU6Cj4+IEFkZCBDOTA2TCByZW1vdGUgcHJvY2Vzc29yIGZvciBD
VjE4MDBCIFNvQywgd2hpY2ggaXMgYW4gYXN5bW1ldHJpYwo+PiBwcm9jZXNzb3IgdHlwaWNhbGx5
IHJ1bm5pbmcgUlRPUy4KPiAKPiBJbiB0aGUgY292ZXIgZW1haWwsIEkgc2F3IHRoYXQgcmVtb3Rl
cHJvYyBhbHNvIHVzZXMgbWFpbGJveCBhcyB0aGUgCj4gdW5kZXJseWluZyBjb21tdW5pY2F0aW9u
LiBTbyBJIGd1ZXNzIHNvbWUgbWFpbGJveC1yZWxhdGVkIHByb3BlcnRpZXMgCj4gd2lsbCBuZWVk
IHRvIGJlIGFkZGVkIHRvIHRoZSBiaW5kaW5ncz8gSSBzdWdnZXN0IHRoYXQgdGhlc2Ugc2hvdWxk
IGJlIAo+IGRldGVybWluZWQgYmVmb3JlIG9mZmljaWFsbHkgbWVyZ2luZyB0aGlzIGJpbmRpbmdz
LgoKWWVzLCB0aGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbi4gSSB3aWxsIHRyeSB0byBhZGQgbWFp
bGJveC1yZWxhdGVkCnByb3BlcnRpZXMgYW5kIGZ1bmN0aW9ucyBpbiB0aGUgYmluZGluZ3MgYW5k
IGRyaXZlciBpbiB2Miwgc2luY2UgdGhlCm1haWxib3ggZHJpdmVyIGhhcyBiZWVuIG1lcmdlZC4g
QXQgdGhlIHZlcnkgbGVhc3QsIEkgd2lsbCBlbnN1cmUgdGhlCm1haWxib3gtcmVsYXRlZCBwcm9w
ZXJ0aWVzIGFyZSBpbmNsdWRlZCBpbiB0aGUgYmluZGluZ3MuCgo+IAo+IFRoYW5rc++8jAo+IAo+
IENoZW4KPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVuaHVpIExpdSA8anVuaHVpLmxpdUBwaWdt
b3JhbC50ZWNoPgo+PiAtLS0KPj4gICAuLi4vYmluZGluZ3MvcmVtb3RlcHJvYy9zb3BoZ28sY3Yx
ODAwYi1jOTA2bC55YW1sICB8IDY4ICsrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUg
Y2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2Mvc29waGdvLGN2MTgwMGItYzkwNmwueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3NvcGhnbyxj
djE4MDBiLWM5MDZsLnlhbWwKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uNDU1ZTk1N2RlYzAxYzE2NDI0YzQ5
ZWJlNWVmNDUxODgzYjBjM2Q0YQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3NvcGhnbyxjdjE4MDBiLWM5MDZsLnlh
bWwKPj4gQEAgLTAsMCArMSw2OCBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4gKyRpZDogaHR0
cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmVtb3RlcHJvYy9zb3BoZ28sY3YxODAwYi1jOTA2
bC55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9j
b3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBTb3BoZ28gQzkwNkwgcmVtb3RlIHByb2Nlc3NvciBj
b250cm9sbGVyIGZvciBDVjE4MDBCIFNvQwo+PiArCj4+ICttYWludGFpbmVyczoKPj4gKyAgLSBK
dW5odWkgTGl1IDxqdW5odWkubGl1QHBpZ21vcmFsLnRlY2g+Cj4+ICsKPj4gK2Rlc2NyaXB0aW9u
Ogo+PiArICBEb2N1bWVudCB0aGUgYmluZGluZ3MgZm9yIHRoZSBDOTA2TCByZW1vdGVwcm9jIGNv
bXBvbmVudCB0aGF0IGxvYWRzIGFuZCBib290cwo+PiArICBmaXJtd2FyZXMgb24gdGhlIENWMTgw
MEIgU29DLgo+PiArCj4+ICtwcm9wZXJ0aWVzOgo+PiArICBjb21wYXRpYmxlOgo+PiArICAgIGNv
bnN0OiBzb3BoZ28sY3YxODAwYi1jOTA2bAo+PiArCj4+ICsgIGZpcm13YXJlLW5hbWU6Cj4+ICsg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvc3RyaW5nCj4+ICsgICAg
ZGVzY3JpcHRpb246Cj4+ICsgICAgICBUaGUgbmFtZSBvZiB0aGUgZmlybXdhcmUgZmlsZSB0byBs
b2FkIGZvciB0aGlzIHJlbW90ZSBwcm9jZXNzb3IsIHJlbGF0aXZlCj4+ICsgICAgICB0byB0aGUg
ZmlybXdhcmUgc2VhcmNoIHBhdGggKHR5cGljYWxseSAvbGliL2Zpcm13YXJlLykuCj4+ICsKPj4g
KyAgbWVtb3J5LXJlZ2lvbjoKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4gKyAgICAgIFBoYW5kbGUg
dG8gYSByZXNlcnZlZCBtZW1vcnkgcmVnaW9uIHRoYXQgaXMgdXNlZCB0byBsb2FkIHRoZSBmaXJt
d2FyZSBmb3IKPj4gKyAgICAgIHRoaXMgcmVtb3RlIHByb2Nlc3Nvci4gVGhlIHJlbW90ZSBwcm9j
ZXNzb3Igd2lsbCB1c2UgdGhpcyBtZW1vcnkgcmVnaW9uCj4+ICsgICAgICBhcyBpdHMgZXhlY3V0
aW9uIG1lbW9yeS4KPj4gKwo+PiArICByZXNldHM6Cj4+ICsgICAgbWF4SXRlbXM6IDEKPj4gKwo+
PiArICBzb3BoZ28sc3lzY29uOgo+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2Rl
ZmluaXRpb25zL3BoYW5kbGUKPj4gKyAgICBkZXNjcmlwdGlvbjoKPj4gKyAgICAgIEEgcGhhbmRs
ZSB0byB0aGUgU0VDX1NZUyByZWdpb24sIHVzZWQgZm9yIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHJl
bW90ZSBwcm9jZXNzb3IuCj4+ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4g
KyAgLSBmaXJtd2FyZS1uYW1lCj4+ICsgIC0gbWVtb3J5LXJlZ2lvbgo+PiArICAtIHJlc2V0cwo+
PiArICAtIHNvcGhnbyxzeXNjb24KPj4gKwo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNl
Cj4+ICsKPj4gK2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICByZXNlcnZlZC1tZW1vcnkgewo+
PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPj4gKyAgICAgICAgI3NpemUtY2VsbHMg
PSA8MT47Cj4+ICsgICAgICAgIHJhbmdlczsKPj4gKwo+PiArICAgICAgICBjOTA2bF9tZW06IHJl
Z2lvbkA4M2Y0MDAwMCB7Cj4+ICsgICAgICAgICAgICByZWcgPSA8MHg4M2Y0MDAwMCAweGMwMDAw
PjsKPj4gKyAgICAgICAgICAgIG5vLW1hcDsKPj4gKyAgICAgICAgfTsKPj4gKyAgICB9Owo+PiAr
Cj4+ICsgICAgYzkwNmwtcnByb2Mgewo+PiArICAgICAgICBjb21wYXRpYmxlID0gInNvcGhnbyxj
djE4MDBiLWM5MDZsIjsKPj4gKyAgICAgICAgZmlybXdhcmUtbmFtZSA9ICJjOTA2bC1maXJtd2Fy
ZS5lbGYiOwo+PiArICAgICAgICBtZW1vcnktcmVnaW9uID0gPCZjOTA2bF9tZW0+Owo+PiArICAg
ICAgICByZXNldHMgPSA8JnJzdCAyOTQ+Owo+PiArICAgICAgICBzb3BoZ28sc3lzY29uID0gPCZz
ZWNfc3lzPjsKPj4gKyAgICB9Owo+PgoKLS0gCkJlc3QgcmVnYXJkcywKSnVuaHVpIExpdQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
