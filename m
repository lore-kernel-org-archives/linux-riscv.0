Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8524CCF9EA
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Oct 2025 22:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QvYFWPAixEs8e9rMCF7QoA5aIZPuaYiqTojQ6VVddks=; b=FAYS0GQuxOLr+O
	uvOwy8++1t7f5hI3cXfg4G4HHx2RKeOEIj6n3uzDUiqU6EQKMXsVMAq6n3PDjlqXVMf5sSQZ2D9AG
	dp3azYpdX/Rak0CxYoMcTEETwP+Fa1OtbZLxmtvBs284zrDuE3bUIYhZgay9gdeVVhaElQudbSkUS
	fXYBo3QwAdN0uIaWek4E0CBZSVyB4J9lUP3dyv03kk19bEME8U0qaQZ3zNARm5U8t1jNYZjbWfeU/
	brkUKC27A/EAhcptckrrVneQ2gxRmN6VJkw9S9aMA36cgM4K7PHUUwDSOW04rUyKkp8GiOND6jnIK
	n3l09EJSsvQOVVYF6GWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsLI-0000000GlA8-1alh;
	Tue, 28 Oct 2025 22:39:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDsLG-0000000Gl9h-0QJD
	for linux-riscv@lists.infradead.org;
	Tue, 28 Oct 2025 22:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 602EB435AB;
	Tue, 28 Oct 2025 22:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2114BC4CEE7;
	Tue, 28 Oct 2025 22:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761691141;
	bh=4XDrRjgMgePVe6D8cwsvwDhjr3zdZYOD7rLj0NQPFK8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Z1hOEuv6ySMU+0QmtzomMmC788GmtWwDm0T936SEt9rozV/2nOdsJX8BVmmb89pZn
	 q0z7H+pyj5INp367mlS8Ffp/7vyQMIgdW83PF8jJMcYZ+ZIg7n0oE8Uw97WJ5Uwd0M
	 LxcLUp1Jc3TGdMJQw0NZr9fp3DFtqGc5Z1ns28A48HoJNJSh3iA4y6fWgq7T5EGHS6
	 6OBYA1c25InFp1umvyk14JEt3n1HEo/nl6gGW+k5uNNCQGoWuV+XSIc483hLBUK3LI
	 tgb8JZa/zbh2nJBHC3lgRr6nzOtBi5EbozdbcMfteT3X0zkAyMt9WVV6GG59D+4AMg
	 z6jNlS7GMRYjA==
Date: Tue, 28 Oct 2025 17:38:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ron Economos <re@w6rz.net>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Conor Dooley <conor@kernel.org>, bhelgaas@google.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	regressions@lists.linux.dev
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
Message-ID: <20251028223859.GA1538617@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bf478b8-2194-4ffb-aaac-8e3e314ad71c@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_153902_176844_AC879BF2 
X-CRM114-Status: GOOD (  15.22  )
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgMDc6MjE6MDZBTSAtMDcwMCwgUm9uIEVjb25vbW9zIHdy
b3RlOgo+IE9uIDEwLzE3LzI1IDA0OjQzLCBLcmlzaG5hIENoYWl0YW55YSBDaHVuZHJ1IHdyb3Rl
Ogo+ID4gT24gMTAvMTUvMjAyNSA3OjMzIFBNLCBNYW5pdmFubmFuIFNhZGhhc2l2YW0gd3JvdGU6
Cj4gPiA+IE9uIFR1ZSwgT2N0IDE0LCAyMDI1IGF0IDAzOjQxOjM5UE0gLTA3MDAsIFJvbiBFY29u
b21vcyB3cm90ZToKPiA+ID4gPiBPbiAxMC8xNC8yNSAwOToyNSwgTWFuaXZhbm5hbiBTYWRoYXNp
dmFtIHdyb3RlOgo+ID4gPiA+ID4gT24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMTA6NTI6NDhQTSAt
MDcwMCwgUm9uIEVjb25vbW9zIHdyb3RlOgo+ID4gPiA+ID4gPiBPbiAxMC8xMy8yNSAyMjozNiwg
S3Jpc2huYSBDaGFpdGFueWEgQ2h1bmRydSB3cm90ZToKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gPiBPbiAxMC8xNC8yMDI1IDEwOjU2IEFNLCBSb24gRWNvbm9tb3Mgd3JvdGU6Cj4gPiA+ID4g
PiA+ID4gPiBPbiAxMC8xMy8yNSAyMjoyMCwgS3Jpc2huYSBDaGFpdGFueWEgQ2h1bmRydSB3cm90
ZToKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IE9uIDEwLzE0LzIwMjUgMjo1
OCBBTSwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiBbK2NjIEZVNzQw
IGRyaXZlciBmb2xrcywgQ29ub3IsIHJlZ3Jlc3Npb25zXQo+ID4gPiA+ID4gPiA+ID4gPiA+IAo+
ID4gPiA+ID4gPiA+ID4gPiA+IE9uIE1vbiwgT2N0IDEzLCAyMDI1IGF0IDEyOjE0OjU0QU0gLTA3
MDAsIFJvbiBFY29ub21vcyB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFRoZSBTaUZpdmUg
RlU3NDAgUENJIGRyaXZlciBmYWlscyBvbiB0aGUgSGlGaXZlCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiBVbm1hdGNoZWQgYm9hcmQgd2l0aCBMaW51eAo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gNi4xOC1y
YzEuIFRoZSBlcnJvciBtZXNzYWdlIGlzOgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBbwqDCoMKgIDMuMTY2NjI0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2ll
OiBob3N0IGJyaWRnZQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gL3NvYy9wY2llQGUwMDAwMDAwMAo+
ID4gPiA+ID4gPiA+ID4gPiA+ID4gcmFuZ2VzOgo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gW8KgwqDC
oCAzLjE2NjcwNl0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogSU8KPiA+ID4gPiA+ID4gPiA+
ID4gPiA+IDB4MDA2MDA4MDAwMC4uMHgwMDYwMDhmZmZmIC0+IDB4MDA2MDA4MDAwMAo+ID4gPiA+
ID4gPiA+ID4gPiA+ID4gW8KgwqDCoCAzLjE2Njc2N10gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNp
ZTogTUVNCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiAweDAwNjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAt
PiAweDAwNjAwOTAwMDAKPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFvCoMKgwqAgMy4xNjY4MDVdIGZ1
NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IE1FTQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gMHgyMDAw
MDAwMDAwLi4weDNmZmZmZmZmZmYgLT4gMHgyMDAwMDAwMDAwCj4gPiA+ID4gPiA+ID4gPiA+ID4g
PiBbwqDCoMKgIDMuMTY2OTUwXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBFQ0FNIGF0IFtt
ZW0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IDB4ZGYwMDAwMDAwLTB4ZGZmZmZmZmZmXSBmb3IgW2J1
cyAwMC1mZl0KPiA+ID4gPiA+ID4gPiA+ID4gPiA+IFvCoMKgwqAgMy41Nzk1MDBdIGZ1NzQwLXBj
aWUgZTAwMDAwMDAwLnBjaWU6IE5vIGlBVFUgcmVnaW9ucyBmb3VuZAo+ID4gPiA+ID4gPiA+ID4g
PiA+ID4gW8KgwqDCoCAzLjU3OTU1Ml0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogRmFpbGVk
IHRvCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBjb25maWd1cmUgaUFUVSBpbiBFQ0FNCj4gPiA+ID4g
PiA+ID4gPiA+ID4gPiBtb2RlCj4gPiA+ID4gPiA+ID4gPiA+ID4gPiBbwqDCoMKgIDMuNTc5NjU1
XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBwcm9iZSB3aXRoCj4gPiA+ID4gPiA+ID4gPiA+
ID4gPiBkcml2ZXIgZnU3NDAtcGNpZQo+ID4gPiA+ID4gPiA+ID4gPiA+ID4gZmFpbGVkIHdpdGgg
ZXJyb3IgLTIyCgo+ID4gQ2FuIHlvdSB0cnkgd2l0aCB0aGlzIHNlcmllcyBhbmQgbGV0IHVzIGtu
b3cgaWYgaXQgaXMgaGVscGluZyB5b3Ugb3IKPiA+IG5vdC4KPiA+IAo+ID4gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYWxsLzIwMjUxMDE3LWVjYW1fZml4LXYxLTAtZjZmYWEzZDBlZGYzQG9zcy5x
dWFsY29tbS5jb20vCj4gCj4gVGhlIHBhdGNoIHdvcmtzIGdvb2QuIEhlcmUncyB0aGUgbG9nIG9m
IFBDSSBtZXNzYWdlcy4KCiNyZWd6Ym90IGZpeDogYTE5NzhiNjkyYTM5ICgiUENJOiBkd2M6IFVz
ZSBjdXN0b20gcGNpX29wcyBmb3Igcm9vdCBidXMgREJJIHZzIEVDQU0gY29uZmlnIGFjY2VzcyIp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
