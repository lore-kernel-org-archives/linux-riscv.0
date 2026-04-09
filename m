Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F283EA3C59
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 13:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oxwC8i9KAYufLoQ3oBng7SQv+fYluCqs6x4eZstvtXA=; b=CTX0Nac7d0sUV+
	4F+pTwbICmToHb5qwT5T5dzd6jqPGVttK/MXYlQxx8xxVFGA9SkiFgMPaHtLqhATIHObABk0QUC02
	BoecrYAAwvSE7iiph3ziVVYm3cA7215wceQsvHCCjDZAkhDKDBOuf9A51xjsJD2HHYC0VTDWBFVqA
	W+4+TSasM6yfLuolrqzxVmsH8i8SUtTZ7pFMTTXd5kehaFnC6AU7BbzndJJ1V2OwTVyVfFRUKW7dg
	VQ9SCwkAf86lIzOP+jMyHapTRjuASapE9t5+D3SB/nR8Lqs0AKec9TFAALLdSfy+RKohHKd/KyEuC
	tm/N7FmpbumwF80cIHZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp4r-0000000AQva-2ENX;
	Thu, 09 Apr 2026 13:05:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp4U-0000000AQnp-3rqz
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 13:05:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1775739923; x=1807275923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gEk3T3+cT30CNHuMEfUH8toLVddd4fxXMXt/FnTVm6c=;
  b=JAwx/+b4Sypzp1oyeVRVuuuXwpmAPHbVwl20+xy/m0FtmftoFMfhJDbF
   L7MTTEAU43gbe3ogl2+9WI4wrOs7pO4lbRS9nWvSY+nyhVTeFG+1U1x7P
   wNeptGDt+uTCK/l2rdV4uM0eDAp6JdyvBKN93UY30GrJXbnTuoiIAA7SD
   RIq6S/96T5MXeRz5VrcsfYTuxqc4w9dcdQ91RwOfYh2Mc9rrHcflVRnd1
   S267WfclVOMx2HYwXCzhujq2tCEInKi/ALHw5fX4ikb7/p3ktpa7tOnCm
   QMsAbD1P0sUY+wcgyBxuDrydyvQmvhTUeQj8eN+NPPvvgr1WaKLtHIGeU
   w==;
X-CSE-ConnectionGUID: 2Rf1PsHCRaWXsjgl3Sf8Jw==
X-CSE-MsgGUID: BSkTIShXQkqtyQxXibo4rA==
X-IronPort-AV: E=Sophos;i="6.23,169,1770620400"; 
   d="scan'208";a="287249589"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Apr 2026 06:04:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 9 Apr 2026 06:04:30 -0700
Received: from bby-cbu-swbuild03.eng.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58 via Frontend Transport; Thu, 9 Apr 2026 06:04:30 -0700
Date: Thu, 9 Apr 2026 06:04:28 -0700
From: Charles Perry <charles.perry@microchip.com>
To: Nick Hu <nick.hu@sifive.com>
CC: Charles Perry <charles.perry@microchip.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Message-ID: <adej3CvQFWVJb6j1@bby-cbu-swbuild03.eng.microchip.com>
References: <20250321083507.25298-1-nick.hu@sifive.com>
 <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
 <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com>
 <adZo84i4jfoWZnb2@bby-cbu-swbuild03.eng.microchip.com>
 <CAKddAkC-okFpyHcbFXQwTFmLfwBdBow=mAJBxirEdbcrYmOcyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKddAkC-okFpyHcbFXQwTFmLfwBdBow=mAJBxirEdbcrYmOcyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_060525_002091_D36865CC 
X-CRM114-Status: GOOD (  27.08  )
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

T24gVGh1LCBBcHIgMDksIDIwMjYgYXQgMDE6Mzc6NDZQTSArMDgwMCwgTmljayBIdSB3cm90ZToK
PiBPbiBXZWQsIEFwciA4LCAyMDI2IGF0IDEwOjQx4oCvUE0gQ2hhcmxlcyBQZXJyeQo+IDxjaGFy
bGVzLnBlcnJ5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgQXByIDA4LCAy
MDI2IGF0IDAyOjE1OjE5UE0gKzA4MDAsIE5pY2sgSHUgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgTWFy
IDI3LCAyMDI2IGF0IDQ6NTbigK9BTSBDaGFybGVzIFBlcnJ5Cj4gPiA+IDxjaGFybGVzLnBlcnJ5
QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gRnJpLCBNYXIgMjEsIDIw
MjUgYXQgMDQ6MzU6MDZQTSArMDgwMCwgTmljayBIdSB3cm90ZToKPiA+ID4gPiA+IEFkZCBjb21w
YXRpYmxlIHN0cmluZyBhbmQgcHJvcGVydHkgZm9yIHRoZSBTaUZpdmUgQ0xJTlQgdjIuIFRoZSBT
aUZpdmUKPiA+ID4gPiA+IENMSU5UIHYyIGlzIGluY29tcGF0aWJsZSB3aXRoIHRoZSBTaUZpdmUg
Q0xJTlQgdjAgZHVlIHRvIGRpZmZlcmVuY2VzCj4gPiA+ID4gPiBpbiB0aGVpciBjb250cm9sIG1l
dGhvZHMuCj4gPiA+ID4KPiA+ID4gPiBIZWxsbyBOaWNrLAo+ID4gPiA+Cj4gPiA+ID4gQ2FuIHlv
dSBoZWxwIG1lIHVuZGVyc3RhbmQgd2hhdCBpcyB0aGlzIGRpZmZlcmVudCBjb250cm9sIG1ldGhv
ZD8gSSd2ZQo+ID4gPiA+IGZvdW5kIHRoYXQgYm90aCBPcGVuU0JJIFsxXSBhbmQgVS1Cb290IFsy
XSB1c2UgdGhlIHNhbWUgbWF0Y2ggZGF0YSBpbiB0aGVpcgo+ID4gPiA+IGNsaW50IGRyaXZlciB3
aGljaCB3b3VsZCBpbmRpY2F0ZSB0aGF0IHRoZXkgYXJlIGNvbXBhdGlibGUuCj4gPiA+ID4KPiA+
ID4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lgo+ID4KPiA+IEhlbGxvIE5pY2ssIG5vIHdvcnJp
ZXMuCj4gPgo+ID4gPiBVbmxpa2UgdjAsIHYyIHJlcXVpcmVzIGEgd3JpdGUgdG8gdGhlIG10aW1l
IHJlZ2lzdGVyIHRvIGtpY2sgdGhlIHRpbWVyLgo+ID4KPiA+IEEga2ljayBvbmNlIGF0IHRoZSBi
ZWdpbm5pbmcgb3IgZXZlcnkgdGltZSBhIG1hY2hpbmUgdGltZXIgaW50ZXJydXB0IGZpcmVzPwo+
ID4KPiBBIGtpY2sgb25jZSBhdCB0aGUgYmVnaW5uaW5nCgpUaGF0IHdvdWxkIGV4cGxhaW4gd2hh
dCBJIG9ic2VydmVkIGluIFUtQm9vdCBhbmQgT3BlblNCSS4gVGhlIGtpY2sgbWlnaHQgYmUKaW4g
c29tZSBhcmNoIHNwZWNpZmljIGNvZGUgb3IgYSBwcmlvciBib290IHN0YWdlLgoKPiAKPiA+ID4K
PiA+ID4gPiBBbHNvLCBkbyB5b3Uga25vdyBpZiB0aGVyZSdzIGFuIGVhc3kgd2F5IHRvIHRlbGwg
aWYgYSBzaWZpdmUgY2xpbnQgaXMgYSB2MAo+ID4gPiA+IG9yIHYyPwo+ID4gPiA+Cj4gPiA+IHNp
Zml2ZSxjbGludDIgaW50cm9kdWNlcyBhZGRpdGlvbmFsIE1NSU8gcmVnaXN0ZXJzCj4gPgo+ID4g
SXMgdGhhdCB0aGUgaGlnaCByZXNvbHV0aW9uIHRpbWVycyAoSFJUKSBtZW50aW9ubmVkIGluIHRo
ZSBkZXNjcmlwdGlvbj8KPiA+Cj4gPiBBbmQgbGFzdCBxdWVzdGlvbiwgd291bGQgeW91IGhhcHBl
biB0byBrbm93IGlmIHNpZml2ZSBtYWRlIGEgY2xpbnQgdjEgdGhhdAo+ID4gZG9lcyBOT1QgcmVx
dWlyZSB0aGUgbXRpbWUga2ljayBidXQgZG9lcyBoYXZlIHRoZSBIUlQ/Cj4gPgo+IFllcywgdGhh
dCdzIGNvcnJlY3QuCgpPay4KClRoYW5rcywKQ2hhcmxlcwoKPiAKPiA+IEknbSB0cnlpbmcgdG8g
ZmlndXJlIG91dCB3aGF0IHNob3VsZCBiZSB0aGUgY29tcGF0aWJsZSBmb3IgUElDNjQtSFBTQy4K
PiA+IFNvbWUgY29kZSBmcm9tIGEgcmVwb3NpdG9yeSBjYWxsZWQgIkZTRk0iIHVzZWQgInNpZml2
ZSxjbGludDEiIGZvciB0aGUKPiA+IGNvbXBhdGlibGUuIEknbSB3b25kZXJpbmcgaWYgSSBzaG91
bGQgYWRkIHRoZSBjbGludCB2MSB0byB0aGlzIGZpbGUuCj4gPgo+ID4gVGhhbmtzLAo+ID4gQ2hh
cmxlcwo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
