Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A2FCDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 08:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q126efqcXdIVmtStawohPpKyqzqGnzasR1/5zo61pVA=; b=M4EkLUxdiqOVjA
	Flmps/c4HnQ10hbU6xbUdLsysn27hKAA/e6BBt5puTe/fFMp5JdKQifCnFyBmwNSUX0Dl/tKlcqO2
	zJwspkoV/m1ejGdl+xHW3fD7CaJhmWFxDpbN74CyMUfV/kttt2GZBN1/hSEsU19JclMOXkbHwVfgT
	Xajg6b+TexUYkk1mTsx91Ex68JlQs4kZ7oegKLgOxfhkQPud2Pa7olw/2DCeQbM9kJ6EQGQzW/fMY
	1Kang8B6FEUHvjp1nnBJmglMR1YW8Eibhbp3dQctp5fBBaIMCFKUso8rdylZxPdb6i9scO1eCaG5K
	i57g09FaFrfGulkzQBPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkkS-001XyI-00;
	Fri, 20 Oct 2023 08:20:48 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkkO-001Xwg-1R
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 08:20:46 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39K8KHU0009756;
	Fri, 20 Oct 2023 16:20:17 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Fri, 20 Oct 2023 16:20:15 +0800
Date: Fri, 20 Oct 2023 16:20:15 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <magnus.damm@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <linux-renesas-soc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>
Subject: Re: [PATCH v2 09/10] riscv: dts: renesas: Add Andes PMU extension
Message-ID: <ZTI4P9KIfS58WKuU@APC323>
References: <20231019140232.3660375-1-peterlin@andestech.com>
 <CAMuHMdW1Ua4skxtT+9kyoSDiqt2kNiNG-1jHE8rf4+b14hX4Vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1Ua4skxtT+9kyoSDiqt2kNiNG-1jHE8rf4+b14hX4Vg@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39K8KHU0009756
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_012044_923202_6296F0D4 
X-CRM114-Status: GOOD (  23.84  )
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

SGkgR2VlcnQsCgpPbiBGcmksIE9jdCAyMCwgMjAyMyBhdCAwOTozMjo0NUFNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgUGV0ZXIsCj4gCj4gT24gVGh1LCBPY3QgMTksIDIw
MjMgYXQgNDowNeKAr1BNIFl1IENoaWVuIFBldGVyIExpbgo+IDxwZXRlcmxpbkBhbmRlc3RlY2gu
Y29tPiB3cm90ZToKPiA+IEFkZCAieGFuZGVzcG11IiB0byBJU0EgZXh0ZW5zaW9ucywgdGhlIFNC
SSBQTVUgZHJpdmVyIHdpbGwKPiA+IHByb2JlIHRoZSBleHRlbnNpb24gYW5kIHVzZSB0aGUgbm9u
LXN0YW5kYXJkIGlycSBzb3VyY2UuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4gUGV0
ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYxIC0+
IHYyOgo+ID4gICAtIE5ldyBwYXRjaAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+ICsr
KyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+IEBAIC0y
Niw3ICsyNiw3IEBAIGNwdTA6IGNwdUAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJp
c2N2LGlzYSA9ICJydjY0aW1hZmRjIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2
LGlzYS1iYXNlID0gInJ2NjRpIjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlz
YS1leHRlbnNpb25zID0gImkiLCAibSIsICJhIiwgImYiLCAiZCIsICJjIiwgInppY250ciIsICJ6
aWNzciIsCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICJ6aWZlbmNlaSIsICJ6aWhwbSI7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSIsICJ4YW5kZXNwbXUiOwo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgbW11LXR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBpLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGktY2FjaGUtbGluZS1zaXplID0gPDB4NDA+Owo+IAo+IFRoaXMgZXh0ZW5z
aW9uIGlzIG5vdCBkb2N1bWVudGVkIGluCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbC4gUGVyaGFwcyBpdCB3YXMKPiBpbnRyb2R1Y2VkIGlu
IGFuIGVhcmxpZXIgcGF0Y2ggaW4gdGhlIHNlcmllcywgdG8gd2hpY2ggSSB3YXMgbm90IENDZWQ/
CgpZZXMsIEkgbWlzc2VkIGFkZGluZyB0aGUgZXh0ZW5zaW9uIHRvIGR0IGJpbmRpbmdzLgpUaGFu
a3MgZm9yIHRoZSBwb2ludGVyLgoKQmVzdCByZWdhcmRzLApQZXRlciBMaW4KCj4gCj4gVGhyZWFk
aW5nIGlzIGJyb2tlbiwgc28gSSBjYW4ndCBlYXNpbHkgZmluZCB0aGUgd2hvbGUgc2VyaWVzIGlu
IGxvcmU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMDE5MTQwMjMyLjM2NjAz
NzUtMS1wZXRlcmxpbkBhbmRlc3RlY2guY29tLwo+IAo+IEdye29ldGplLGVldGluZ31zLAo+IAo+
ICAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cj4gCj4gLS0gCj4gR2VlcnQgVXl0dGVyaG9l
dmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZwo+IAo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKPiB3aGVuIEknbSB0YWxraW5nIHRvIGpv
dXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQu
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
