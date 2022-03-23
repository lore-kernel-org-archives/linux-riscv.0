Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19493C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Mar 2022 10:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ipXG78gJ7A/Vw+U9kEnfUJvJIk99gPhZK3l3k+Zm9ng=; b=WeeJqK1WL12vw7
	GvL9Y+tq3X2V5ZA6qttxammZPVke8ad1KUQtsgCu2W4FFb9dRfG7G0Ep7+QT30/fVWaNmFENJMq9G
	rSLkInEUFwI7bFX6z+5+JGVBm0y2gXwsEDiUV17cPfQ2MorZ0FM+5Fq+qwsK6AOYuPL2aE22aHaL1
	NljDVAHlIdugdGxjIxy1x4bqGqQBPbF1pxOCgWY2qKJeyNG6Be3IGNEfqBcuYpeaE5EajvYa2O4yD
	iC3BASa8dNkvz5kcsfw5WoM12vP/sdIRiU6mIFG+bVz3IoYc92IN+f1wdVS2gxYspQU+RYmbYhD+n
	lRsWS4djM2ObskHcvP4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWyPm-00DLmb-5k; Wed, 23 Mar 2022 10:40:30 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWyPi-00DLjY-SK
 for linux-riscv@lists.infradead.org; Wed, 23 Mar 2022 10:40:28 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.21])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1nWyPV-0006wD-F7; Wed, 23 Mar 2022 10:40:13 +0000
Message-ID: <bded4b1e-3404-6bcd-3289-dc8d5b4d713a@codethink.co.uk>
Date: Wed, 23 Mar 2022 10:40:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [V3] PCI: fu740: Drop to 2.5GT/s to fix initial device probing on
 some boards
Content-Language: en-GB
To: Alexandre Ghiti <alex@ghiti.fr>, linux-pci@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Neill Whillans <neill.whillans@codethink.co.uk>
References: <20220318152430.526320-1-ben.dooks@codethink.co.uk>
 <2442936e-a53e-59bf-488f-95eac26d1252@ghiti.fr>
 <85e864fd-762e-0780-f829-bfbb178ab24e@ghiti.fr>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <85e864fd-762e-0780-f829-bfbb178ab24e@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_034026_921357_E5A9262C 
X-CRM114-Status: GOOD (  15.17  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjMvMDMvMjAyMiAxMDozNiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IE9uIDMvMjEvMjIg
MTQ6NDksIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gSGkgQmVuLAo+Pgo+PiBPbiAzLzE4LzIy
IDE2OjI0LCBCZW4gRG9va3Mgd3JvdGU6Cj4+PiBUaGUgZnU3NDAgUENJZSBjb3JlIGRvZXMgbm90
IHByb2JlIGFueSBkZXZpY2VzIG9uIHRoZSBTaUZpdmUgVW5tYXRjaGVkCj4+PiBib2FyZCB3aXRo
b3V0IHRoaXMgZml4IChvciBoYXZpbmcgVS1Cb290IGV4cGxpY2l0bHkgc3RhcnQgdGhlIFBDSWUg
dmlhCj4+PiBlaXRoZXIgYm9vdC1zY3JpcHQgb3IgdXNlciBjb21tYW5kKS4gVGhlIGZpeCBpcyB0
byBzdGFydCB0aGUgbGluayBhdAo+Pj4gMi41R1QvcyBzcGVlZHMgYW5kIG9uY2UgdGhlIGxpbmsg
aXMgdXAgdGhlbiBjaGFuZ2UgdGhlIG1heGltdW0gc3BlZWQgCj4+PiBiYWNrCj4+PiB0byB0aGUg
ZGVmYXVsdC4KPj4+Cj4+PiBUaGUgVS1Cb290IGRyaXZlciBjbGFpbXMgdG8gc2V0IHRoZSBsaW5r
LXNwZWVkIHRvIDIuNUdUL3MgdG8gZ2V0IHRoZSAKPj4+IHByb2JlCj4+PiB0byB3b3JrIChhbmQg
VS1Cb290IGRvZXMgcHJpbnQgbGluayB1cCBhdCAyLjVHVC9zKSBpbiB0aGUgZm9sbG93aW5nIAo+
Pj4gY29kZToKPj4+IGh0dHBzOi8vc291cmNlLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2Jsb2Iv
bWFzdGVyL2RyaXZlcnMvcGNpL3BjaWVfZHdfc2lmaXZlLmM/aWQ9djIwMjIuMDEjTDI3MSAKPj4+
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNv
LnVrPgoKCltzbmlwXQoKPj4+IMKgIMKgIHN0YXRpYyBpbnQgZnU3NDBfcGNpZV9ob3N0X2luaXQo
c3RydWN0IHBjaWVfcG9ydCAqcHApCj4+Cj4+ICtjYyBNYWNpZWogYW5kIERhdmlkIGFzIHRoZXJl
IGlzIHRoaXMgb3RoZXIgZml4IHRoYXQgc2VlbXMgdG8gZG8gdGhlIAo+PiBzYW1lIGJ1dCBkaWZm
ZXJlbnRseSwgaXQncyBiZWVuIHVuZGVyIHJldmlldyBmb3Igc29tZSB0aW1lIG5vdzogCj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDMwMjAwMDA0My5HQTY2MjUyM0BiaGVsZ2Fh
cy90Lwo+PgoKSSBkaWQgaGF2ZSBhIHF1aWNrIGxvb2ssIGJ1dCBJIHRoaW5rIGJlY2F1c2Ugd2Ug
ZG9uJ3QgZ2V0IGFueSBQQ0llCnByb2JpbmcgYXQtYWxsIHdlIGRvbid0IGV2ZW4gaGF2ZSBhIGRl
dmljZSB0byBhdHRhY2ggdG8uCgo+PiBJIGZlbGwgb250byB0aGlzIGlzc3VlIHJlY2VudGx5LCBJ
J2xsIGdpdmUgeW91ciBwYXRjaCBhbmQgdGhlIGFib3ZlIGEgCj4+IHRyeSBzb29uLgo+IAo+IAo+
IEZXSVcsIEkgaGF2ZSB0ZXN0ZWQgdGhpcyBhbmQgaXQgc29sdmVkIG15IGlzc3VlIHdpdGggbnZt
ZSBub3QgYmVpbmcgCj4gcHJvYmVkLCBzbzoKPiAKPiBUZXN0ZWQtYnk6IEFsZXhhbmRyZSBHaGl0
aSA8YWxleGFuZHJlLmdoaXRpQGNhbm9uaWNhbC5jb20+CgpPaywgZ3JlYXQuIE91ciB0ZXN0IHJp
ZyBzZWVtcyB0byBiZSBzdGlsbCB3b3JraW5nIHdpdGggdGhpcy4KCgotLSAKQmVuIERvb2tzCQkJ
CWh0dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5r
IC0gUHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3ku
aHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
