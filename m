Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB62ECFD315
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 08:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GqyooeOQDdEfN3Q85FykybyHTe7cDnsfCSq7kVKGMeE=; b=lYBRBEFQ6FpCMT
	ip3vuX4c2hzeiUBb5UXDYkT5PdoZ2SMAQFyqIRvBwNlS+Pi1cXXJgNZrJzDtyX+b9vv6Jtcm+Pfts
	dHZejM+YS7VO8EXA6U0N/4WXQuVW1LfCFfzJINH32UVRxeyfsL1ZUMaiLnVhn2Q1imK2mNfXD9iZN
	gUHWs5uJH3/JuiSdPB+vjKuHHkZ3Zg+vFe762Sl3XdBtTOkspQ4LAvaqVrSr+TKbZFqnYlN6exDee
	/JOWps5tAmwKZjq2yY7iXZJJMtfToMpdMNmFzr7D50P9ZMvQGAq+4fDh5MNeDH4ZyZ8S0TQ/a2hjJ
	DnEfKAwxZT9p+ctfOypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnzs-0000000CwjS-0nWu;
	Tue, 25 Nov 2025 08:02:00 +0000
Received: from sender3-op-o12.zoho.com ([136.143.184.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNnzp-0000000Cwj4-1swM
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 08:01:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1764057713; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lA9ZLipFr65F2u+DlZUYR/6ABCel3n59hm0sehjb/EZfebJheHBWCjwjDZD4vb9vazYElibktltxT2ev4vWfPYMgTkawYNnJ3tvDtvPtH/K/sqS6xkSlg6FN39MQme70r5hjDUYmwJoTLc/U1KGrhXdOZ9dPgfBaYNu3+zmD1hY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764057713; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dNu1Q9j8paX7KuRXYdJHSK/CvB3o9koatthHjbPyQZ0=; 
	b=b2mX9exKxA4bG2e1U1YqCP563s0ByItb6u79jgyUyWAYGF0+67a5VPvXDqtcMob/rUnAlV36fPfnZsZKnkWyUR652sDCSmMXT914gYucJzRBah4M7HHygXflPU7PyTmi/AcwEyhEU27/4yjBCrIVr8abw2v2XST55NAo3DkwxWo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764057713;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=dNu1Q9j8paX7KuRXYdJHSK/CvB3o9koatthHjbPyQZ0=;
	b=fTmIb4AhD2LZwtcCA6w3FJEjsk0nqaTcjcc00GawwqPDcxg1pDIJK8c1+/h7j/3G
	VZjIeEMedSiohkUgv26hlDY4uiulcoIKBg0KtF1vvSlAq5LxSYNPg6kT1Rn0CfgX9uC
	A2rNXrV0cnPvBf0JMkRuia+0fwi2CMg7e5FmxEGOHDgX11yOqx6gCbF9JfoivwdxBi0
	L57xCJSfQtYh58S9AM+jMMlmek84EMvlMPmIOsVDQw3cUmDaSEY056/dytsamj2mMPX
	jPRMPx4h+bwbhxhF4WHqPPCTGg79mgSdNdPmeuw81MxRKwx+wPwxVCDeujZwlNvcCeI
	EmfKicyifQ==
Received: by mx.zohomail.com with SMTPS id 1764057707789534.7662587743201;
	Tue, 25 Nov 2025 00:01:47 -0800 (PST)
Message-ID: <0a2104faee332ee143b5499c18aea3625971156c.camel@icenowy.me>
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
Date: Tue, 25 Nov 2025 16:01:40 +0800
In-Reply-To: <489e9d44-fac6-4aa8-b094-ef20196e392b@kernel.org>
References: <20251123225059.49665-1-e@freeshell.de>
	 <20251123225059.49665-2-e@freeshell.de>
	 <20251124-free-bandicoot-of-skill-fa7d9a@kuoka>
	 <20251124-state-campsite-3e7788a495c1@spud>
	 <0e851ca0-1f56-437d-ae14-094c114d3b77@freeshell.de>
	 <dc48fa76-0a08-4c9d-a3d7-724eb255aff8@kernel.org>
	 <ff1f0e6b95150896136ab31ce13e0a2c7a3a5fe3.camel@icenowy.me>
	 <489e9d44-fac6-4aa8-b094-ef20196e392b@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_000157_594351_360DAE9A 
X-CRM114-Status: GOOD (  26.92  )
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

5ZyoIDIwMjUtMTEtMjXmmJ/mnJ/kuoznmoQgMDg6NDggKzAxMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMjUvMTEvMjAyNSAwODozMywgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IOWcqCAyMDI1LTExLTI15pif5pyf5LqM55qEIDA4OjI4ICswMTAw77yMS3J6eXN6dG9mIEtv
emxvd3NraeWGmemBk++8mgo+ID4gPiBPbiAyNC8xMS8yMDI1IDIyOjU5LCBFIFNoYXR0b3cgd3Jv
dGU6Cj4gPiA+ID4gCj4gPiA+ID4gT24gMTEvMjQvMjUgMDU6MjIsIENvbm9yIERvb2xleSB3cm90
ZToKPiA+ID4gPiA+IE9uIE1vbiwgTm92IDI0LCAyMDI1IGF0IDA4OjI4OjEwQU0gKzAxMDAsIEty
enlzenRvZiBLb3psb3dza2kKPiA+ID4gPiA+IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiBTdW4sIE5v
diAyMywgMjAyNSBhdCAwMjo1MDo0NFBNIC0wODAwLCBFIFNoYXR0b3cgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gRnJvbTogSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+Cj4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gQWRkICJ4dW5sb25nLG9yYW5nZXBpLXJ2IiBhcyBhIFN0YXJGaXZlIEpI
NzExMCBTb0MtYmFzZWQKPiA+ID4gPiA+ID4gPiBib2FyZC4KPiA+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5tZT4KPiA+
ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFIFNoYXR0b3cgPGVAZnJlZXNoZWxsLmRlPgo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPGZvcm0gbGV0dGVyPgo+ID4gPiA+ID4gPiBUaGlzIGlzIGEg
ZnJpZW5kbHkgcmVtaW5kZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4KPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+IEl0IGxvb2tzIGxpa2UgeW91IHJlY2VpdmVkIGEgdGFnIGFuZCBmb3Jnb3Qg
dG8gYWRkIGl0Lgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJdCdzIGZyb20gbWUsIGRvbid0IHJlc3Vi
bWl0IGp1c3QgdG8gYWRkIGl0IHNpbmNlIGl0J2xsIGJlIG1lCj4gPiA+ID4gPiBhcHBseWluZwo+
ID4gPiA+ID4gYW55d2F5Lgo+ID4gPiA+ID4gCj4gPiA+ID4gCj4gPiA+ID4gSGkgQ29ub3IsCj4g
PiA+ID4gCj4gPiA+ID4gT2theS4gWWVzIEknZCBkcm9wcGVkIHRoZSB0YWcgc2luY2UgdGhlIGNv
bW1pdCBtZXNzYWdlIGlzCj4gPiA+ID4gYXBwcmVjaWFibHkKPiA+ID4gPiBkaWZmZXJlbnQsIGFu
ZCB5b3Ugd291bGQgYmUgaGFuZGxpbmcgaXQgYWdhaW4gYW55d2F5cy4gVGhhbmtzIQo+ID4gPiA+
IEFuZAo+ID4gPiA+IHRoYW5rCj4gPiA+ID4geW91IEtyenlzenRvZiBmb3IgdGhlIHJlbWluZGVy
IC1FCj4gPiA+IAo+ID4gPiAKPiA+ID4gQW5kIHdoZXJlIGRpZCB5b3UgZXhwbGFpbiB0aGF0IHlv
dSBkcm9wcGVkIHRoZSB0YWcgYmVjYXVzZSBvZgo+ID4gPiB0aGF0Pwo+ID4gPiBQbGVhc2UgcmVh
ZCB0aGUgZm9ybSBsZXR0ZXIgY2FyZWZ1bGx5Lgo+ID4gCj4gPiBXZWxsIEkgdGhpbmsgdGhlcmUn
cyBubyBjbGVhciBkZWZpbml0aW9uIG9mICJ0aGUgcGF0Y2ggaGFzIGNoYW5nZWQKPiA+IHN1YnN0
YW50aWFsbHkiIGhlcmUuCj4gPiAKPiA+IEUgbWF5IHRoaW5rIGZvciB0aGlzIHN1Y2gtc2hvcnQg
cGF0Y2gsIHRoZSBjb21taXQgbWVzc2FnZSB3ZWlnaHMgYQo+ID4gbG90Cj4gPiBhbmQgdGhlIGNo
YW5nZSB0byBpdCBpcyBzaWduaWZpY2FudCB0byB0aGUgcGF0Y2ggKGUuZy4gbWFraW5nIHRoZQo+
ID4gcGF0Y2gKPiA+IG5vdCBjbGVhciBlbm91Z2gpLgo+IAo+IFlvdSBzdGlsbCBkaWQgbm90IGJv
dGhlciB0byByZWFkIHdoYXQgd2UgZXhwZWN0LiBJIGRvIG5vdCBkaXNjdXNzIGlmCj4gdGhpcyBj
aGFuZ2VkIHNpZ25pZmljYW50bHkgb3Igbm90LCBhbHRob3VnaCBpdCBpcyBvYnZpb3VzIHRoYXQg
aXQgZGlkCj4gbm90IGNoYW5nZSBhbmQgdGFnIHNob3VsZCBoYXZlIGJlZW4gcmV0YWluZWQuCj4g
Cj4gTG9vayBhZ2FpbjoKPiA8UVVPVEU+Cj4gUGxlYXNlIHJlYWQ6Cj4gaHR0cHM6Ly9lbGl4aXIu
Ym9vdGxpbi5jb20vbGludXgvdjYuMTItcmMzL3NvdXJjZS9Eb2N1bWVudGF0aW9uL3Byb2Nlc3Mv
c3VibWl0dGluZy1wYXRjaGVzLnJzdCNMNTc3Cj4gCj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBv
biBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFuZCB3aGF0IGNoYW5nZWQuCj4gPC9RVU9URT4K
PiAKPiBXaGVyZSBkaWQgeW91IGV4cGxhaW4gdGhhdD8KClN1cmUsIEkgYWdyZWUgdGhhdCBleHBs
YWluYXRpb24gb2YgdGhpcyBzaG91bGQgYmUgZGVsaXZlcmVkLgoKPiAKPiAKPiBCZXN0IHJlZ2Fy
ZHMsCj4gS3J6eXN6dG9mCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
