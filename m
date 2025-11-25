Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBF2CFD364
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 07:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T6t6EY0GvKmLQ2SpB5P6i06NlJJP1CHvty66uSMI9g8=; b=Y/HKjFoJHrHeXv
	RnVYJ6hWkLhQj5M1i54jFR+e4TpsojQpaM8L2cBZJyWlCTRW/DjOi+rwtNPVaag0CbDPfiKrN5fQ9
	6gaY+2JfzY2EiKNMIKj8yCQEmJh/is/oZk+R7jmYCyADzzVDU/W10ZxeTcu6IJl7Q+VTfOEEHYCs4
	a9sl006chp2BFcpOIL6MW3t0F545HM/deQ3gLxV2Vayzy0W+Ns2FpBtnGwxP2/rpQoHdPB6Dqwnx5
	c0XiJ9zMyeImI1NyAYlYfLpCwRuU7XP7DC5+J5k7uzjEctQDV5y4KM1MA7NHnRf4blgohfOVmBWCD
	41pU4P9xngXzEp69MfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnZ2-0000000Ctz7-2G6v;
	Tue, 25 Nov 2025 07:34:16 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnYz-0000000Ctyc-22lq
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 07:34:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764056045; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=io7FGzkr9UJTn7mfg7AXgQtapqXhkODcvdWAoCa0MkiCHMmizcR0TcoOphanBaAR++I5xoEOMdzDkr7H2V6KmjeeR/k9kjNLaWzZeXE16COA8mXSOVjq50texMO17Q7grqLNBP4w8aYA4aQj1tMrjxDT5B9UJYSOgwDPr9kStRQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764056045; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VhxW/aH83Wbs1YIQrF8h2VKL0WHJNFnb6XQ0X84LpmU=; 
	b=ip0jgTdN7iV4GH++e2Z4skAyrG5XHf4uIDu9c5kMDArTItrv6tOuw3ZIFb8FBKnbpPtwiyr2vWOo6iefsnq+dlOWg+6nuSUM/xPM2wQXD3kWYQg+q4mhrvgs4lG1lMcGxp0K2Z+Y3lYqSnerwpZvF+sjuvbQGfEfsLaxn8HY3n4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764056045;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=VhxW/aH83Wbs1YIQrF8h2VKL0WHJNFnb6XQ0X84LpmU=;
	b=aZvCGmY+/XLiqKhBAs8zhOVVKsqW4/bxprVhYzFNBSNgE8rCqrtDM2rzCLkOL1gn
	5FgD/V+gOI2EabKYweic+TDFWeGmCoEFUNYk26rNOBCDCUN662ytwAPedyyqE2rh+Km
	yzZeV7mVV7HLYKjthfih/Qm6+eEM7VKSyvL8FwlwFphoifengAR7/aKJMe7c92Vmtty
	+g2qBP6FVbMRfj3L6L6UTgjpKJ3wt8Ot9+zifgBQyFZaAiFcgeK81oOH/icD1SNkwez
	rPreQNGQzS6veWC2gl670FYrLZvtn9tUro7f112xqgHxjJ0uDkgXYq+ekeCIVURxP7Q
	WxngIx1XNw==
Received: by mx.zohomail.com with SMTPS id 176405604352736.10638278907402;
	Mon, 24 Nov 2025 23:34:03 -0800 (PST)
Message-ID: <ff1f0e6b95150896136ab31ce13e0a2c7a3a5fe3.camel@icenowy.me>
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: starfive: add
 xunlong,orangepi-rv
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, E Shattow <e@freeshell.de>, Conor
	Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Michael Zhu <michael.zhu@starfivetech.com>, Drew
 Fustini <drew@beagleboard.org>,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,  devicetree@vger.kernel.org
Date: Tue, 25 Nov 2025 15:33:56 +0800
In-Reply-To: <dc48fa76-0a08-4c9d-a3d7-724eb255aff8@kernel.org>
References: <20251123225059.49665-1-e@freeshell.de>
	 <20251123225059.49665-2-e@freeshell.de>
	 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
	 <20251124-state-campsite-3e7788a495c1@spud>
	 <0e851ca0-1f56-437d-ae14-094c114d3b77@freeshell.de>
	 <dc48fa76-0a08-4c9d-a3d7-724eb255aff8@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_233413_613228_C0E1A55F 
X-CRM114-Status: GOOD (  19.03  )
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

5ZyoIDIwMjUtMTEtMjXmmJ/mnJ/kuoznmoQgMDg6MjggKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjQvMTEvMjAyNSAyMjo1OSwgRSBTaGF0dG93IHdyb3RlOgo+ID4g
Cj4gPiBPbiAxMS8yNC8yNSAwNToyMiwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+ID4gPiBPbiBNb24s
IE5vdiAyNCwgMjAyNSBhdCAwODoyODoxMEFNICswMTAwLCBLcnp5c3p0b2YgS296bG93c2tpCj4g
PiA+IHdyb3RlOgo+ID4gPiA+IE9uIFN1biwgTm92IDIzLCAyMDI1IGF0IDAyOjUwOjQ0UE0gLTA4
MDAsIEUgU2hhdHRvdyB3cm90ZToKPiA+ID4gPiA+IEZyb206IEljZW5vd3kgWmhlbmcgPHV3dUBp
Y2Vub3d5Lm1lPgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBBZGQgInh1bmxvbmcsb3JhbmdlcGktcnYi
IGFzIGEgU3RhckZpdmUgSkg3MTEwIFNvQy1iYXNlZAo+ID4gPiA+ID4gYm9hcmQuCj4gPiA+ID4g
PiAKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1l
Pgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRSBTaGF0dG93IDxlQGZyZWVzaGVsbC5kZT4KPiA+
ID4gPiAKPiA+ID4gPiA8Zm9ybSBsZXR0ZXI+Cj4gPiA+ID4gVGhpcyBpcyBhIGZyaWVuZGx5IHJl
bWluZGVyIGR1cmluZyB0aGUgcmV2aWV3IHByb2Nlc3MuCj4gPiA+ID4gCj4gPiA+ID4gSXQgbG9v
a3MgbGlrZSB5b3UgcmVjZWl2ZWQgYSB0YWcgYW5kIGZvcmdvdCB0byBhZGQgaXQuCj4gPiA+IAo+
ID4gPiBJdCdzIGZyb20gbWUsIGRvbid0IHJlc3VibWl0IGp1c3QgdG8gYWRkIGl0IHNpbmNlIGl0
J2xsIGJlIG1lCj4gPiA+IGFwcGx5aW5nCj4gPiA+IGFueXdheS4KPiA+ID4gCj4gPiAKPiA+IEhp
IENvbm9yLAo+ID4gCj4gPiBPa2F5LiBZZXMgSSdkIGRyb3BwZWQgdGhlIHRhZyBzaW5jZSB0aGUg
Y29tbWl0IG1lc3NhZ2UgaXMKPiA+IGFwcHJlY2lhYmx5Cj4gPiBkaWZmZXJlbnQsIGFuZCB5b3Ug
d291bGQgYmUgaGFuZGxpbmcgaXQgYWdhaW4gYW55d2F5cy4gVGhhbmtzISBBbmQKPiA+IHRoYW5r
Cj4gPiB5b3UgS3J6eXN6dG9mIGZvciB0aGUgcmVtaW5kZXIgLUUKPiAKPiAKPiBBbmQgd2hlcmUg
ZGlkIHlvdSBleHBsYWluIHRoYXQgeW91IGRyb3BwZWQgdGhlIHRhZyBiZWNhdXNlIG9mIHRoYXQ/
Cj4gUGxlYXNlIHJlYWQgdGhlIGZvcm0gbGV0dGVyIGNhcmVmdWxseS4KCldlbGwgSSB0aGluayB0
aGVyZSdzIG5vIGNsZWFyIGRlZmluaXRpb24gb2YgInRoZSBwYXRjaCBoYXMgY2hhbmdlZApzdWJz
dGFudGlhbGx5IiBoZXJlLgoKRSBtYXkgdGhpbmsgZm9yIHRoaXMgc3VjaC1zaG9ydCBwYXRjaCwg
dGhlIGNvbW1pdCBtZXNzYWdlIHdlaWdocyBhIGxvdAphbmQgdGhlIGNoYW5nZSB0byBpdCBpcyBz
aWduaWZpY2FudCB0byB0aGUgcGF0Y2ggKGUuZy4gbWFraW5nIHRoZSBwYXRjaApub3QgY2xlYXIg
ZW5vdWdoKS4KCj4gCj4gQmVzdCByZWdhcmRzLAo+IEtyenlzenRvZgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
