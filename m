Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6D2C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZeqCO8bBHVZRMXRakIan5uqOsOEOoaBSL4rZ8L0PSk=; b=P2/x3sPAwPvVkx
	oJjrsDl4YSSsoRLvxOUMIy6TbXH7W4KzF8+UjhYAqYCqkT3Gjo+3YOOxuRwPdyu0AdRDCMJjWSfBv
	/uZrqgDgAz6PYI/GfY01zDU1cYt8EzJm2pPrQ3MlMIlpx6T5taY2qcnLR+EKczBcQJhqnBuun+CYs
	MLqkj4Lmg8icB4LrPJB2eA+42SMZuEu1gZe3bnW+V05hUIlUCUfv9ZhBKnLz/P3K3ULbOYioV7v5s
	Ab4I9WhpN11nxS56rTrGZjnwRENLz9g1CyQMqSh2fxm4OoPVebMsi48XHZ4iXb/k22mJbv57dbutk
	ThZs2q/OZDWo2hVwCB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q02NU-00Ge3h-0g;
	Fri, 19 May 2023 15:50:48 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q02NR-00Ge2Z-0s
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 15:50:47 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684511425; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HZGWV3mkCVvIKzG0tWLtxWXq4bBqBQX+cQVxtsi23GQjHcgDVx9TwuGD+rixUFsaANFBzKIBNxOdqXskHKqVrtkJsCnubadgXRJm1pz9XyeS3ND6zsHMkuJ1vIDgRIyeVMGeF8J152alQYVNe1UWMEANbVPOrfrIfp2Jc0as+zA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684511425; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gs+hOAo8YT0FiIn+tQqctT5867aD0k3Rps6XhweMFhk=; 
	b=aK68H8m12N0Wbo7nBfsSsMzYRehGSjcxEkM9NUIsFz5ccKleQx8AAotyh5UKd6AFHMgIRrYyuvSD4r7FwGj/xA/FmtnCixYpl/jfL5oadLbLu9lkPy8AzV1irKyahL/1CgXStBUIROpn2MYktb0wbTXvrzvziMdFerp0ANVHQzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684511425;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=gs+hOAo8YT0FiIn+tQqctT5867aD0k3Rps6XhweMFhk=;
	b=HOUKlDNpR8O12UrWm1nucXKKGG2G8CAHsxoiLRM5a/GHnntl+f+cHygj+3j2H8e+
	mOpMiUfDVIM4x425ty+z8xsXXV0x+xta2Xwm1BonK9B9ya3xR8wljdZ/ekTEtYuwe+l
	jKq9EmiQJ5Qh5LPQyXt8lGUg+OFqG1DpDGTDh0Mw=
Received: from edelgard.fodlan.icenowy.me (120.85.98.248 [120.85.98.248]) by mx.zohomail.com
	with SMTPS id 1684511422475801.3864897939635; Fri, 19 May 2023 08:50:22 -0700 (PDT)
Message-ID: <122af5271507d77b495ef4b69f3aef4449cc0381.camel@icenowy.me>
Subject: Re: [PATCH v2 3/9] dt-bindings: riscv: Add T-HEAD TH1520 board
 compatibles
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren
 <guoren@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org, Yangtao Li
 <frank.li@vivo.com>, Wei Fu <wefu@redhat.com>
Date: Fri, 19 May 2023 23:50:15 +0800
In-Reply-To: <20230518-estate-scoff-c009f19aad5a@spud>
References: <20230518184541.2627-1-jszhang@kernel.org>
	 <20230518184541.2627-4-jszhang@kernel.org>
	 <20230518-estate-scoff-c009f19aad5a@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_085045_386038_CD68E161 
X-CRM114-Status: GOOD (  19.65  )
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

5ZyoIDIwMjMtMDUtMTjmmJ/mnJ/lm5vnmoQgMjA6NDAgKzAxMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBGcmksIE1heSAxOSwgMjAyMyBhdCAwMjo0NTozNUFNICswODAwLCBKaXNoZW5n
IFpoYW5nIHdyb3RlOgo+ID4gU2V2ZXJhbCBTb01zIGFuZCBib2FyZHMgYXJlIGF2YWlsYWJsZSB0
aGF0IGZlYXR1cmUgdGhlIFQtSEVBRAo+ID4gVEgxNTIwCj4gPiBTb0MuIERvY3VtZW50IHRoZSBj
b21wYXRpYmxlIHN0cmluZ3MuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcg
PGpzemhhbmdAa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi90aGVhZC55YW1swqDCoMKgwqDCoCB8IDI5Cj4gPiArKysrKysrKysrKysrKysrKysr
Cj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4gPiDCoGNyZWF0ZSBtb2Rl
IDEwMDY0NAo+ID4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3RoZWFk
LnlhbWwKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi90aGVhZC55YW1sCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9yaXNjdi90aGVhZC55YW1sCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5lNjJmNjgyMTM3MmUKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi90aGVhZC55YW1sCj4gPiBAQCAt
MCwwICsxLDI5IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpCj4gPiArJVlBTUwgMS4yCj4gPiArLS0tCj4gPiArJGlkOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9yaXNjdi90aGVhZC55YW1sIwo+ID4gKyRzY2hlbWE6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4g
K3RpdGxlOiBULUhFQUQgU29DLWJhc2VkIGJvYXJkcwo+ID4gKwo+ID4gK21haW50YWluZXJzOgo+
ID4gK8KgIC0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gKwo+ID4gK2Rl
c2NyaXB0aW9uOgo+ID4gK8KgIFQtSEVBRCBTb0MtYmFzZWQgYm9hcmRzCj4gPiArCj4gPiArcHJv
cGVydGllczoKPiA+ICvCoCAkbm9kZW5hbWU6Cj4gPiArwqDCoMKgIGNvbnN0OiAnLycKPiA+ICvC
oCBjb21wYXRpYmxlOgo+ID4gK8KgwqDCoCBvbmVPZjoKPiA+ICvCoMKgwqDCoMKgIC0gZGVzY3Jp
cHRpb246IFNpcGVlZCBMaWNoZWUgUGkgNEEgYm9hcmQgZm9yIHRoZSBTaXBlZWQKPiA+IExpY2hl
ZSBNb2R1bGUgNEEKPiA+ICvCoMKgwqDCoMKgwqDCoCBpdGVtczoKPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqAgLSBlbnVtOgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gc2lwZWVkLGxp
Y2hlZS1waS00YQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBzaXBlZWQsbGljaGVl
LW1vZHVsZS00YQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiB0aGVhZCx0aDE1MjAK
PiAKPiBTYW1lIGhlcmUgcmU6IG90aGVyIFNvTXMgSSBndWVzcy4gUHJvYmFibHkgbW9yZSBpbnRl
cmVzdCBpbiBjcmVhdGluZwo+IHRoZW0gaGVyZSB0aG91Z2ghCj4gCj4gSSBoZWFyZCBvbiB0aGUg
Z3JhcGV2aW5lIHRoYXQgdGhlIGJvYXJkcyBwZW9wbGUgaGF2ZSBub3cgYXJlIHBlcmhhcHMKPiBu
b3QKPiB0aGUgc2FtZSBhcyB0aGUgZGVzaWduIHRoYXQgdGhleSdyZSBnb2luZyB0byBzaGlwIGlu
IHRoZSBtYWluCj4gcHJvZHVjdGlvbgo+IHJ1bj8KClRoZXJlIHJlYWxseSB3YXMgYW4gZWFybHkg
RVZCIHRoYXQgaXMgbm90IHB1YmxpYywgYnV0IHRoZSBFVkIgaXMgY2FsbGVkCkxNNEEgRVZCIGlu
c3RlYWQgb2YgTFA0QS4KClRoZSBMaWNoZWUgUGkgNEEgYm9hcmQgaGVyZSBpcyB0aGUgcHJvZHVj
dGlvbiBydW4gb25lLgoKPiBEbyB5b3Uga25vdyBpZiB0aGVyZSBpcyBhIG1vcmUgZGV0YWlsZWQg
cGFydCBudW1iZXIgZm9yIHRoZSBib2FyZHMsCj4ganVzdAo+IGluIGNhc2UgdGhlcmUgYXJlIHNv
bWUgc29mdHdhcmUtdmlzaWJsZSBjaGFuZ2VzPwo+IAo+IFRoYW5rcywKPiBDb25vci4KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
