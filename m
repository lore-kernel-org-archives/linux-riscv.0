Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824D0CCD187
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 05:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/APkPNhhYfVKG3eAchjNHISA2cC2p3KASTXdLb6Mcx8=; b=GWU3JuAnWhFHhZ
	p3BzI2C2QI/CRW7DWlKp9Qq9CGxOvvRMGnUu/c2wDg4wM29ZSzcMYYip5jlfBjNvuI3w+ROYrH0hH
	9SCtqYJclCYv1VADtxFNTRLlxpNWks77LpC6bWA5cdzad4TT9vfPdsHOQXgNDHGKgy3kN9kCAdhLk
	1QDKALSoN6NWIolNxhEjTPvZfGXAD7xJ3iUCHobUz/+a3KApRv3//UIR0iBNDpNK3iWZNbDAohQuP
	Ws9ltj5kussZQjqkqKf9iR+pa2IgpX2D0x+Nj1JIWD/wq693/AsWxXEVWDuLhVi+/UrhguVRXaC+d
	IvbC1e/qdH9xwmDfIs3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XYx-0000000FCuU-17cF;
	Tue, 14 Oct 2025 05:27:07 +0000
Received: from omta040.useast.a.cloudfilter.net ([44.202.169.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8XYu-0000000FCu2-3LMn
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 05:27:06 +0000
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id 8LR0vohl2v7248XYtvE8xX; Tue, 14 Oct 2025 05:27:03 +0000
Received: from box5620.bluehost.com ([162.241.219.59])
	by cmsmtp with ESMTPS
	id 8XYrviJ1k25G78XYsvvaB2; Tue, 14 Oct 2025 05:27:02 +0000
X-Authority-Analysis: v=2.4 cv=LuqSymdc c=1 sm=1 tr=0 ts=68eddf26
 a=30941lsx5skRcbJ0JMGu9A==:117 a=30941lsx5skRcbJ0JMGu9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=7vwVE5O1G3EA:10
 a=9VXFyi0rFAJFUNMutsYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Wh1V8bzkS9CpCxOpQUxp:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=w6rz.net;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iVnTJ/Uow+/494pNjGbD8AvWtc0PjGDVdzmx39Dv63o=; b=j/OmbZLC9Idbxfaax7ubCwFCXT
	XnLEEHXdVWJ1rQcyAG4ZmeBuNrZznVH9JNcJxYxLHpTDz/9Yj+NC+Bl4iqwXn5onSgLUButHEZNaZ
	p5xToOdxAAUDIWsAeZAnHyXBQfN2B3NBj1fGKoA3o8oWST/2FvjnlLogBk++lenB8n8tFZBWAnDr8
	uF/YOdN13QapPS+freHb3rJ3Oal3N2Ge0vwemYjB04OyDnS8LD+zFYxWk9HD23ZuS0H6xht6/cOKU
	8hklJmsv57qDKV7MTvTed0+qWNaMkbiHYXpgXIXi/0/jgCq777jbTEIUTU5k6VgB4ns0NMB/J6Bl2
	2NJwfVwg==;
Received: from c-73-92-56-26.hsd1.ca.comcast.net ([73.92.56.26]:36646 helo=[10.0.1.116])
	by box5620.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <re@w6rz.net>)
	id 1v8XYr-000000038nP-0TGO;
	Mon, 13 Oct 2025 23:27:01 -0600
Message-ID: <95a0f2a4-3ddd-4dec-a67e-27f774edb5fd@w6rz.net>
Date: Mon, 13 Oct 2025 22:26:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SiFive FU740 PCI driver fails on 6.18-rc1
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: bhelgaas@google.com, mani@kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Paul Walmsley <pjw@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, regressions@lists.linux.dev
References: <20251013212801.GA865570@bhelgaas>
 <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
Content-Language: en-US
From: Ron Economos <re@w6rz.net>
In-Reply-To: <bc7deb1a-5f93-4a36-bd6a-b0600b150d48@oss.qualcomm.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5620.bluehost.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - w6rz.net
X-BWhitelist: no
X-Source-IP: 73.92.56.26
X-Source-L: No
X-Exim-ID: 1v8XYr-000000038nP-0TGO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: c-73-92-56-26.hsd1.ca.comcast.net ([10.0.1.116]) [73.92.56.26]:36646
X-Source-Auth: re@w6rz.net
X-Email-Count: 5
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: d3NpeHJ6bmU7d3NpeHJ6bmU7Ym94NTYyMC5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfPPh/2VM7qvx6aEtjztPwk7wZKunh1+hN9DEsI2CEfC5EGBPssRajf2+xiyXPN9caXMgoN89jrWt1hcyAAezCSijflXFXhP53sBzPzu8aWDM6rraXzci
 pPDLszXFEZYNL6Kcwse63Xnlzy/N5bc7s24lZ9EhqvZV9z6Qbeve0UwKEZ2mnpp1UcoHU7+zEthauan/BcaYab8/qIXlS4dO/jY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_222704_993148_3CFA5E0F 
X-CRM114-Status: GOOD (  11.01  )
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

T24gMTAvMTMvMjUgMjI6MjAsIEtyaXNobmEgQ2hhaXRhbnlhIENodW5kcnUgd3JvdGU6Cj4KPgo+
IE9uIDEwLzE0LzIwMjUgMjo1OCBBTSwgQmpvcm4gSGVsZ2FhcyB3cm90ZToKPj4gWytjYyBGVTc0
MCBkcml2ZXIgZm9sa3MsIENvbm9yLCByZWdyZXNzaW9uc10KPj4KPj4gT24gTW9uLCBPY3QgMTMs
IDIwMjUgYXQgMTI6MTQ6NTRBTSAtMDcwMCwgUm9uIEVjb25vbW9zIHdyb3RlOgo+Pj4gVGhlIFNp
Rml2ZSBGVTc0MCBQQ0kgZHJpdmVyIGZhaWxzIG9uIHRoZSBIaUZpdmUgVW5tYXRjaGVkIGJvYXJk
IHdpdGggCj4+PiBMaW51eAo+Pj4gNi4xOC1yYzEuIFRoZSBlcnJvciBtZXNzYWdlIGlzOgo+Pj4K
Pj4+IFvCoMKgwqAgMy4xNjY2MjRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IGhvc3QgYnJp
ZGdlIAo+Pj4gL3NvYy9wY2llQGUwMDAwMDAwMAo+Pj4gcmFuZ2VzOgo+Pj4gW8KgwqDCoCAzLjE2
NjcwNl0gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgwqAgSU8KPj4+IDB4MDA2
MDA4MDAwMC4uMHgwMDYwMDhmZmZmIC0+IDB4MDA2MDA4MDAwMAo+Pj4gW8KgwqDCoCAzLjE2Njc2
N10gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTrCoMKgwqDCoMKgIE1FTQo+Pj4gMHgwMDYwMDkw
MDAwLi4weDAwN2ZmZmZmZmYgLT4gMHgwMDYwMDkwMDAwCj4+PiBbwqDCoMKgIDMuMTY2ODA1XSBm
dTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKgwqAgTUVNCj4+PiAweDIwMDAwMDAwMDAu
LjB4M2ZmZmZmZmZmZiAtPiAweDIwMDAwMDAwMDAKPj4+IFvCoMKgwqAgMy4xNjY5NTBdIGZ1NzQw
LXBjaWUgZTAwMDAwMDAwLnBjaWU6IEVDQU0gYXQgW21lbQo+Pj4gMHhkZjAwMDAwMDAtMHhkZmZm
ZmZmZmZdIGZvciBbYnVzIDAwLWZmXQo+Pj4gW8KgwqDCoCAzLjU3OTUwMF0gZnU3NDAtcGNpZSBl
MDAwMDAwMDAucGNpZTogTm8gaUFUVSByZWdpb25zIGZvdW5kCj4+PiBbwqDCoMKgIDMuNTc5NTUy
XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBGYWlsZWQgdG8gY29uZmlndXJlIGlBVFUgCj4+
PiBpbiBFQ0FNCj4+PiBtb2RlCj4+PiBbwqDCoMKgIDMuNTc5NjU1XSBmdTc0MC1wY2llIGUwMDAw
MDAwMC5wY2llOiBwcm9iZSB3aXRoIGRyaXZlciBmdTc0MC1wY2llCj4+PiBmYWlsZWQgd2l0aCBl
cnJvciAtMjIKPj4+Cj4+PiBUaGUgbm9ybWFsIG1lc3NhZ2UgKG9uIExpbnV4IDYuMTcuMikgaXM6
Cj4+Pgo+Pj4gW8KgwqDCoCAzLjM4MTQ4N10gZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogaG9z
dCBicmlkZ2UgCj4+PiAvc29jL3BjaWVAZTAwMDAwMDAwCj4+PiByYW5nZXM6Cj4+PiBbwqDCoMKg
IDMuMzgxNTg0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKgwqDCoCBJTwo+Pj4g
MHgwMDYwMDgwMDAwLi4weDAwNjAwOGZmZmYgLT4gMHgwMDYwMDgwMDAwCj4+PiBbwqDCoMKgIDMu
MzgxNjgyXSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOsKgwqDCoMKgwqAgTUVNCj4+PiAweDAw
NjAwOTAwMDAuLjB4MDA3ZmZmZmZmZiAtPiAweDAwNjAwOTAwMDAKPj4+IFvCoMKgwqAgMy4zODE3
MjRdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6wqDCoMKgwqDCoCBNRU0KPj4+IDB4MjAwMDAw
MDAwMC4uMHgzZmZmZmZmZmZmIC0+IDB4MjAwMDAwMDAwMAo+Pj4gW8KgwqDCoCAzLjQ4NDgwOV0g
ZnU3NDAtcGNpZSBlMDAwMDAwMDAucGNpZTogaUFUVTogdW5yb2xsIFQsIDggb2IsIDggCj4+PiBp
YiwgYWxpZ24KPj4+IDRLLCBsaW1pdCA0MDk2Rwo+Pj4gW8KgwqDCoCAzLjY4MzY3OF0gZnU3NDAt
cGNpZSBlMDAwMDAwMDAucGNpZTogUENJZSBHZW4uMSB4OCBsaW5rIHVwCj4+PiBbwqDCoMKgIDMu
ODgzNjc0XSBmdTc0MC1wY2llIGUwMDAwMDAwMC5wY2llOiBQQ0llIEdlbi4zIHg4IGxpbmsgdXAK
Pj4+IFvCoMKgwqAgMy45ODc2NzhdIGZ1NzQwLXBjaWUgZTAwMDAwMDAwLnBjaWU6IFBDSWUgR2Vu
LjMgeDggbGluayB1cAo+Pj4gW8KgwqDCoCAzLjk4ODE2NF0gZnU3NDAtcGNpZSBlMDAwMDAwMDAu
cGNpZTogUENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAKPj4+IDAwMDA6MDAKPj4+Cj4+PiBSZXZlcnRp
bmcgdGhlIGZvbGxvd2luZyBjb21taXRzIHNvbHZlcyB0aGUgaXNzdWUuCj4+Pgo+Pj4gMGRhNDhj
NWIyZmE3MzFiMjFiYzUyM2M4MmQ5MjczOTlhMWU1MDhiMCBQQ0k6IGR3YzogU3VwcG9ydCBFQ0FN
IAo+Pj4gbWVjaGFuaXNtIGJ5Cj4+PiBlbmFibGluZyBpQVRVICdDRkcgU2hpZnQgRmVhdHVyZScK
Pj4+Cj4+PiA0NjYwZTUwY2Y4MTgwMGY4MmVlZWNmNzQzYWQxZTNlOTdhYjcyMTkwIFBDSTogcWNv
bTogUHJlcGFyZSBmb3IgdGhlIAo+Pj4gRFdDIEVDQU0KPj4+IGVuYWJsZW1lbnQKPj4+Cj4+PiBm
NmZkMzU3ZjdhZmJlYjM0YTYzM2U1Njg4YTIzYjlkN2ViNDlkNTU4IFBDSTogZHdjOiBQcmVwYXJl
IHRoZSAKPj4+IGRyaXZlciBmb3IKPj4+IGVuYWJsaW5nIEVDQU0gbWVjaGFuaXNtIHVzaW5nIGlB
VFUgJ0NGRyBTaGlmdCBGZWF0dXJlJwo+Pgo+PiBBcyBDb25vciBwb2ludGVkIG91dCwgd2UgY2Fu
J3QgZml4IGEgY29kZSByZWdyZXNzaW9uIHdpdGggYSBEVCBjaGFuZ2UuCj4+Cj4+ICNyZWd6Ym90
IGludHJvZHVjZWQ6IGY2ZmQzNTdmN2FmYiAoIlBDSTogZHdjOiBQcmVwYXJlIHRoZSBkcml2ZXIg
Zm9yIAo+PiBlbmFibGluZyBFQ0FNIG1lY2hhbmlzbSB1c2luZyBpQVRVICdDRkcgU2hpZnQgRmVh
dHVyZSciKQo+IEhpIENvbm9yLAo+Cj4gQ2FuIHlvdSB0cnkgd2l0aCB0aGlzIHBhdGNoIGFuZCBz
ZWUgaWYgaXQgaXMgZml4aW5nIHRoZSBpc3N1ZS4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jIAo+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1mdTc0MC5jCj4gaW5kZXggNjYzNjcyNTIwMzJiLi5iNWUwZjAxNmE1ODAgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gKysrIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gQEAgLTMyOCw2ICszMjgs
OCBAQCBzdGF0aWMgaW50IGZ1NzQwX3BjaWVfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAK
PiAqcGRldikKPgo+IMKgwqDCoMKgwqDCoMKgIHBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGFm
cCk7Cj4KPiArwqDCoMKgwqDCoMKgIHBjaS0+cHAubmF0aXZlX2VjYW0gPSB0cnVlOwo+ICsKPiDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gZHdfcGNpZV9ob3N0X2luaXQoJnBjaS0+cHApOwo+IMKgfQo+
Cj4gLSBLcmlzaG5hIENoYWl0YW55YS4KPgo+PgpJJ3ZlIGFscmVhZHkgdHJpZWQgaXQuIEl0IGRv
ZXNuJ3Qgd29yay4gU2FtZSBlcnJvciBtZXNzYWdlIGFzIGJlZm9yZS4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
