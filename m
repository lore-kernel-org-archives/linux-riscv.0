Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D11CCDB47E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CJALhYHf85ENTuKyjPIo+q/eB99dkisCeMyZ97rnL/c=; b=I2jz3zT0v4A5ex
	+vby37qgcooSaV7j5Kt0+BX8y/MT7nmt6dhe+W2Ob7XM3JpLObt0Bc7PHdAbARF+ZPBY+HLmP8YZo
	1WebdPd0JZqIeKYGJBpEiqlfhOUXuscy1gZBhqiY0CbBLoBg7Atcp2ZP75v0JUimUnoxYeguZ4VI5
	vLMLoXRcd7bXYeMcqqyfpEccBavfLv9rePhu1qOwSANuEtEOs8LQ6LjfsbykbuZhlROtbNnZuYIsE
	a1L8zWB4mtDL9pkWlSJjR9NsoYrqCV0wEWIFa5Knx5Wmi3Ao2B9fokLiLY1cjlKAFWOSFH17f2bPy
	sdaIdLWoWYS48nX3Vk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtki7-001XHz-35;
	Fri, 20 Oct 2023 08:18:23 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtki4-001XGv-2d
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 08:18:22 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 39K8HjXK009119;
	Fri, 20 Oct 2023 16:17:45 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Fri, 20 Oct 2023 16:17:43 +0800
Date: Fri, 20 Oct 2023 16:17:43 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: <geert+renesas@glider.be>, <magnus.damm@gmail.com>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <linux-renesas-soc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <tim609@andestech.com>,
        <dylan@andestech.com>, <locus84@andestech.com>, <dminus@andestech.com>
Subject: Re: [PATCH v2 04/10] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
Message-ID: <ZTI3p82DLgKEo65D@APC323>
References: <20231019135810.3657665-1-peterlin@andestech.com>
 <CAMuHMdX+8RUpmhbcBjohZ5oF+wtakfNpwrxGFbZJvTN8_aJv9g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdX+8RUpmhbcBjohZ5oF+wtakfNpwrxGFbZJvTN8_aJv9g@mail.gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-Originating-IP: [10.0.12.98]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 39K8HjXK009119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_011821_288396_CAFD3262 
X-CRM114-Status: GOOD (  23.29  )
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

SGkgR2VlcnQsCgpPbiBGcmksIE9jdCAyMCwgMjAyMyBhdCAwOToyNjozMUFNICswMjAwLCBHZWVy
dCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgWXUsCj4gCj4gT24gVGh1LCBPY3QgMTksIDIwMjMg
YXQgNDowMeKAr1BNIFl1IENoaWVuIFBldGVyIExpbgo+IDxwZXRlcmxpbkBhbmRlc3RlY2guY29t
PiB3cm90ZToKPiA+IFRoZSBBbmRlcyBJTlRDIGFsbG93cyBBWDQ1TVAgY29yZXMgdG8gaGFuZGxl
IGN1c3RvbSBsb2NhbAo+ID4gaW50ZXJydXB0cywgc3VjaCBhcyB0aGUgcGVyZm9ybWFuY2UgbW9u
aXRvciBvdmVyZmxvdyBpbnRlcnJ1cHQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXUgQ2hpZW4g
UGV0ZXIgTGluIDxwZXRlcmxpbkBhbmRlc3RlY2guY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHYx
IC0+IHYyOgo+ID4gICAtIE5ldyBwYXRjaAo+IAo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiAK
PiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiA+IEBA
IC0zNyw3ICszNyw3IEBAIGNwdTA6IGNwdUAwIHsKPiA+Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBjcHUwX2ludGM6IGludGVycnVwdC1jb250cm9sbGVyIHsKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwxPjsKPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyaXNjdixjcHUtaW50YyI7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW5kZXN0ZWNoLGNw
dS1pbnRjIjsKPiAKPiBUaGlzIGNvbXBhdGlibGUgdmFsdWUgaXMgbm90IGRvY3VtZW50ZWQuICBQ
ZXJoYXBzIGl0IHdhcyBpbnRyb2R1Y2VkCj4gaW4gYW4gZWFybGllciBwYXRjaCBpbiB0aGUgc2Vy
aWVzLCB0byB3aGljaCBJIHdhcyBub3QgQ0NlZD8KPiAKPiBUaHJlYWRpbmcgaXMgYnJva2VuLCBz
byBJIGNhbid0IGVhc2lseSBmaW5kIHRoZSB3aG9sZSBzZXJpZXMgaW4gbG9yZToKPiBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzEwMTkxMzU4MTAuMzY1NzY2NS0xLXBldGVybGluQGFu
ZGVzdGVjaC5jb20vCgpTb3JyeSwgSSdsbCBzZW5kIFBBVENIIHYzIHdpdGggc29tZSBmaXhlcy4K
VGhhbmtzIGZvciByZW1pbmRpbmcgbWUgb2YgdGhpcy4KCkJlc3QgcmVnYXJkcywKUGV0ZXIgTGlu
Cgo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxl
cjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gPiAgICAgICAgICAgICAgICAgfTsK
PiAKPiBHcntvZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAo+IAo+IC0tIAo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXgg
YmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKPiAKPiBJbiBwZXJzb25hbCBjb252
ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4g
QnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFt
bWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
