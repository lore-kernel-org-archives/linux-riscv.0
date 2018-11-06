Return-Path: <SRS0=W42x=NR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5AA0C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 16:35:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8688320869
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Nov 2018 16:35:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pZ+glqpx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ifiPC2Dr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8688320869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3RYM2rm6deKnmmvkEeGoIDAIYnANh4M5VRmR/GySaU=; b=pZ+glqpxuzgTPo
	kLmth2BobwmelwaT/wkcZpNLybcMOEgnMHjn/TsliFB4Yjbj3ZFPaq0yxdjtywIGkhKLD7hsHgsFX
	eqvkXKwp979h61cE+UDKS44mkkUL7/26spfqN/jkRA2yQ43F1qHmt+diLvY1DfmAtjrpy8KLzZcz6
	LlODuXvZoob3vMbwsw+MdIwR7oAYcYQuBGMIemkX6ksRXhYL6eJURIUjXMOxg7Tbo8V5dsh7tNyiC
	KxmQdUZjMCBFkoR72Aj+jixAslIk1/dFJLFPcYj3uv1YBjNdhemTC4qqRVa/vjyKgN1VdiJHLvVp9
	fSj0OS7w3+mIc4/ttm4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gK4KX-0004wF-PE; Tue, 06 Nov 2018 16:35:53 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK46J-00050s-Bh
 for linux-riscv@bombadil.infradead.org; Tue, 06 Nov 2018 16:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LSLFULPBEqouIu2Ns+8/6OR/IFYhIt1WVkRLRakhEd8=; b=ifiPC2Dr0Q6AwyzJDl8mT2a6VD
 YZdm1uwfriQSSdrkZ0QxVRI19J85vd890N/cu2Jnvk4FsWHkypdeDDnlAkBoTfwMiqitDA04XOLdB
 0jl04hUXxDJC8+xe4+1W7VBG3CNKEN+9BjL6p4UJE4uI6I5KZ/JbyaF2rciaifKzuWtCWYXifSGbS
 P5Ulknf3w7arrMHZFUrwd3eMdJyY2ztzfLgSMCHOls8JPijqYo2pYnsao17qNfPLJksssEdI5GJjd
 3VLBl6ru0mdO9vLvnKOV9c8xJwfuwNKLINNB+Me0hgOydONPWbZo5UBi06BhJgQAm3aDdWsOfqvxn
 ILYv5AbQ==;
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK46F-0002Nh-RI
 for linux-riscv@lists.infradead.org; Tue, 06 Nov 2018 16:21:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A92AEBD;
 Tue,  6 Nov 2018 08:20:56 -0800 (PST)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 114B13F5CF;
 Tue,  6 Nov 2018 08:20:53 -0800 (PST)
Date: Tue, 6 Nov 2018 16:20:51 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Nick Kossifidis <mick@ics.forth.gr>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Message-ID: <20181106162051.w7fyweuxrl7ujzuz@lakrids.cambridge.arm.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <20181106141331.GA28458@e107155-lin>
 <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <969fc2a5198984e0dfe8c3f585dc65f9@mailhost.ics.forth.gr>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181106_162108_196824_E7F679E8 
X-CRM114-Status: GOOD (  38.56  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien.LeMoal@wdc.com, alankao@andestech.com,
 hch@infradead.org, anup@brainfault.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, zong@andestech.com,
 Atish Patra <atish.patra@wdc.com>, robh+dt@kernel.org,
 Sudeep Holla <sudeep.holla@arm.com>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181106162051.xMgO26w7Q5p10a9yjo-sc8-yLck3p85SFqLtPpRQp8A@z>

T24gVHVlLCBOb3YgMDYsIDIwMTggYXQgMDU6MjY6MDFQTSArMDIwMCwgTmljayBLb3NzaWZpZGlz
IHdyb3RlOgo+IM6jz4TOuc+CIDIwMTgtMTEtMDYgMTY6MTMsIFN1ZGVlcCBIb2xsYSDOrc6zz4HO
sc+IzrU6Cj4gPiBPbiBGcmksIE5vdiAwMiwgMjAxOCBhdCAwODo1ODozOVBNICswMjAwLCBOaWNr
IEtvc3NpZmlkaXMgd3JvdGU6Cj4gPiA+IM6jz4TOuc+CIDIwMTgtMTEtMDIgMDE6MDQsIEF0aXNo
IFBhdHJhIM6tzrPPgc6xz4jOtToKPiA+ID4gPiBUaGlzIHBhdGNoIHNlcmllcyBhZGRzIHRoZSBj
cHUgdG9wb2xvZ3kgZm9yIFJJU0MtVi4gSXQgY29udGFpbnMKPiA+ID4gPiBib3RoIHRoZSBEVCBi
aW5kaW5nIGFuZCBhY3R1YWwgc291cmNlIGNvZGUuIEl0IGhhcyBiZWVuIHRlc3RlZCBvbgo+ID4g
PiA+IFFFTVUgJiBVbmxlYXNoZWQgYm9hcmQuCj4gPiA+ID4KPiA+ID4gPiBUaGUgaWRlYSBpcyBi
YXNlZCBvbiBjcHUtbWFwIGluIEFSTSB3aXRoIGNoYW5nZXMgcmVsYXRlZCB0byBob3cKPiA+ID4g
PiB3ZSBkZWZpbmUgU01UIHN5c3RlbXMuIFRoZSByZWFzb24gZm9yIGFkb3B0aW5nIGEgc2ltaWxh
ciBhcHByb2FjaAo+ID4gPiA+IHRvIEFSTSBhcyBJIGZlZWwgaXQgcHJvdmlkZXMgYSB2ZXJ5IGNs
ZWFyIHdheSBvZiBkZWZpbmluZyB0aGUKPiA+ID4gPiB0b3BvbG9neSBjb21wYXJlZCB0byBwYXJz
aW5nIGNhY2hlIG5vZGVzIHRvIGZpZ3VyZSBvdXQgd2hpY2ggY3B1cwo+ID4gPiA+IHNoYXJlIHRo
ZSBzYW1lIHBhY2thZ2Ugb3IgY29yZS4gIEkgYW0gb3BlbiB0byBhbnkgb3RoZXIgaWRlYSB0bwo+
ID4gPiA+IGltcGxlbWVudCBjcHUtdG9wb2xvZ3kgYXMgd2VsbC4KPiA+ID4gCj4gPiA+IEkgd2Fz
IGFsc28gYWJvdXQgdG8gc3RhcnQgYSBkaXNjdXNzaW9uIGFib3V0IENQVSB0b3BvbG9neSBvbiBS
SVNDLVYKPiA+ID4gYWZ0ZXIgdGhlIGxhc3Qgc3d0b29scyBncm91cCBtZWV0aW5nLiBUaGUgZ29h
bCBpcyB0byBwcm92aWRlIHRoZQo+ID4gPiBzY2hlZHVsZXIgd2l0aCBoaW50cyBvbiBob3cgdG8g
ZGlzdHJpYnV0ZSB0YXNrcyBtb3JlIGVmZmljaWVudGx5Cj4gPiA+IGJldHdlZW4gaGFydHMsIGJ5
IHBvcHVsYXRpbmcgdGhlIHNjaGVkdWxpbmcgZG9tYWluIHRvcG9sb2d5IGxldmVscwo+ID4gPiAo
aHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjQuMTkvaWRlbnQvc2NoZWRfZG9tYWlu
X3RvcG9sb2d5X2xldmVsKS4KPiA+ID4gV2hhdCB3ZSB3YW50IHRvIGRvIGlzIGRlZmluZSBjcHUg
Z3JvdXBzIGFuZCBhc3NpZ24gdGhlbSB0bwo+ID4gPiBzY2hlZHVsaW5nIGRvbWFpbnMgd2l0aCB0
aGUgYXBwcm9wcmlhdGUgU0RfIGZsYWdzCj4gPiA+IChodHRwczovL2dpdGh1Yi5jb20vdG9ydmFs
ZHMvbGludXgvYmxvYi9tYXN0ZXIvaW5jbHVkZS9saW51eC9zY2hlZC90b3BvbG9neS5oI0wxNiku
Cj4gPiAKPiA+IE9LIGFyZSB3ZSBkZWZpbmluZyBhIENQVSB0b3BvbG9neSBiaW5kaW5nIGZvciBM
aW51eCBzY2hlZHVsZXIgPwo+ID4gTkFDSyBmb3IgYWxsIHRoZSBhcHByb2FjaGVzIHRoYXQgYXNz
dW1lcyBhbnkga25vd2xlZGdlIG9mIE9TIHNjaGVkdWxlci4KPiAKPiBJcyB0aGVyZSBhbnkgc3Rh
bmRhcmQgcmVnYXJkaW5nIENQVSB0b3BvbG9neSBvbiB0aGUgZGV2aWNlIHRyZWUgc3BlYyA/Cj4g
QXMgZmFyIGFzIEkga25vdyB0aGVyZSBpcyBub25lLiBXZSBhcmUgdGFsa2luZyBhYm91dCBhIExp
bnV4LXNwZWNpZmljCj4gRGV2aWNlIFRyZWUgYmluZGluZyBzbyBJIGRvbid0IHNlZSB3aHkgZGVm
aW5pbmcgYSBiaW5kaW5nIGZvciB0aGUKPiBMaW51eCBzY2hlZHVsZXIgaXMgb3V0IG9mIHNjb3Bl
LgoKU3BlYWtpbmcgYXMgYSBEVCBiaW5kaW5nIG1haW50YWluZXIsIHBsZWFzZSBhdm9pZCBPUy1z
cGVjaWZpYyBEVApiaW5kaW5ncyB3aGVyZXZlciBwb3NzaWJsZS4KCldoaWxlIERUIGJpbmRpbmdz
IGxpdmUgaW4gdGhlIGtlcm5lbCB0cmVlLCB0aGV5IGFyZSBub3QgaW50ZW5kZWQgdG8gYmUKTGlu
dXgtc3BlY2lmaWMsIGFuZCBvdGhlciBPU3MgKGUuZy4gRnJlZUJTRCwgemVwaHlyKSBhcmUgYWlt
aW5nIHRvCnN1cHBvcnQgdGhlIHNhbWUgYmluZGluZ3MuCgpJbiBnZW5lcmFsLCB0YXJnZXRpbmcg
YSBzcGVjaWZpYyBPUyBpcyBhIGJhZCBpZGVhLCBiZWNhdXNlIHRoZQppbXBsZW1lbnRhdGlvbiBk
ZXRhaWxzIG9mIHRoYXQgT1MgY2hhbmdlIG92ZXIgdGltZSwgb3IgdGhlIGJpbmRpbmdzIGVuZAp1
cCBiZWluZyB0YWlsb3JlZCB0byBvbmUgc3BlY2lmaWMgdXNlLWNhc2UuIEV4cG9zaW5nIGRldGFp
bHMgdG8gdGhlIE9TCnN1Y2ggdGhhdCB0aGUgT1MgY2FuIG1ha2UgZGVjaXNpb25zIGF0IHJ1bnRp
bWUgaXMgdHlwaWNhbGx5IGJldHRlci4KCj4gRG8geW91IGhhdmUgY3B1LW1hcCBvbiBvdGhlciBP
U2VzIGFzIHdlbGwgPwoKVGhlcmUgaXMgbm90aGluZyBPUy1zcGVjaWZpYyBhYm91dCBjcHUtbWFw
LCBhbmQgaXQgbWF5IGJlIG9mIHVzZSB0bwpvdGhlciBPU3MuCgo+ID4gPiBTbyB0aGUgY29yZXMg
dGhhdCBiZWxvbmcgdG8gYSBzY2hlZHVsaW5nIGRvbWFpbiBtYXkgc2hhcmU6Cj4gPiA+IENQVSBj
YXBhY2l0eSAoU0RfU0hBUkVfQ1BVQ0FQQUNJVFkgLyBTRF9BU1lNX0NQVUNBUEFDSVRZKQo+ID4g
PiBQYWNrYWdlIHJlc291cmNlcyAtZS5nLiBjYWNoZXMsIHVuaXRzIGV0Yy0gKFNEX1NIQVJFX1BL
R19SRVNPVVJDRVMpCj4gPiA+IFBvd2VyIGRvbWFpbiAoU0RfU0hBUkVfUE9XRVJET01BSU4pCj4g
PiA+IAo+ID4gCj4gPiBUb28gTGludXgga2VybmVsL3NjaGVkdWxlciBzcGVjaWZpYyB0byBiZSBw
YXJ0IG9mICRzdWJqZWN0Cj4gCj4gQWxsIGxpc3RzIG9uIHRoZSBjYyBsaXN0IGFyZSBMaW51eCBz
cGVjaWZpYywgYWdhaW4gSSBkb24ndCBzZWUgeW91cgo+IHBvaW50IGhlcmUgYXJlIHdlIHRhbGtp
bmcgYWJvdXQgZGVmaW5pbmcgYSBzdGFuZGFyZCBDUFUgdG9wb2xvZ3kKPiBzY2hlbWUgZm9yIHRo
ZSBkZXZpY2UgdHJlZSBzcGVjIG9yIGEgTGludXgtc3BlY2lmaWMgQ1BVIHRvcG9sb2d5Cj4gYmlu
ZGluZyBzdWNoIGFzIGNwdS1tYXAgPwoKVGhlIGNwdS1tYXAgYmluZGluZyBpcyBub3QgaW50ZW5k
ZWQgdG8gYmUgTGludXggc3BlY2lmaWMsIGFuZCBhdm9pZHMKTGludXgtc3BlY2lmaWMgdGVybWlu
b2xvZ3kuCgpXaGlsZSB0aGUgY3B1LW1hcCBiaW5kaW5nIGRvY3VtZW50YXRpb24gaXMgaW4gdGhl
IExpbnV4IHNvdXJjZSB0cmVlLCB0aGUKYmluZGluZyBpdHNlbGQgaXMgbm90IGludGVuZGVkIHRv
IGJlIExpbnV4LXNwZWNpZmljLCBhbmQgaXQgZGVsaWJlcmF0ZWx5CmF2b2lkcyBMaW51eCBpbXBs
ZW1lbnRhdGlvbiBkZXRhaWxzLgoKPiBFdmVuIG9uIHRoaXMgY2FzZSB5b3VyIHBvaW50IGlzIG5v
dCB2YWxpZCwgdGhlIGluZm9ybWF0aW9uIG9mIHR3bwo+IGhhcnRzIHNoYXJpbmcgYSBjb21tb24g
cG93ZXIgZG9tYWluIG9yIGhhdmluZyB0aGUgc2FtZSBvciBub3QKPiBjYXBhY2l0eS9tYXggZnJl
cXVlbmN5IChvciBtYXliZSBjYXBhYmlsaXRpZXMvZXh0ZW5zaW9ucyBpbiB0aGUKPiBmdXR1cmUp
LCBpcyBub3QgTGludXggc3BlY2lmaWMuIEkganVzdCB1c2VkIHRoZSBMaW51eCBzcGVjaWZpYyBt
YWNyb3MKPiB1c2VkIGJ5IHRoZSBMaW51eCBzY2hlZHVsZXIgdG8gcG9pbnQgb3V0IHRoZSBjb2Rl
IHBhdGguICBFdmVuIG9uIG90aGVyCj4gT1NlcyB3ZSBzdGlsbCBuZWVkIGEgd2F5IHRvIGluY2x1
ZGUgdGhpcyBpbmZvcm1hdGlvbiBvbiB0aGUgQ1BVCj4gdG9wb2xvZ3ksIGFuZCBjdXJyZW50bHkg
Y3B1LW1hcCBkb2Vzbid0LiBBbHNvIHRoZSBMaW51eCBpbXBsZW1lbnRhdGlvbgo+IG9mIGNwdS1t
YXAgaWdub3JlcyBtdWx0aXBsZSBsZXZlbHMgb2Ygc2hhcmVkIHJlc291cmNlcywgd2Ugb25seSBn
ZXQKPiBvbmUgbGV2ZWwgZm9yIFNNVCBhbmQgb25lIGxldmVsIGZvciBNQyBsYXN0IHRpbWUgSSBj
aGVja2VkLgoKR2l2ZW4gY2x1c3RlcnMgY2FuIGJlIG5lc3RlZCwgYXMgaW4gdGhlIHZlcnkgZmly
c3QgZXhhbXBsZSwgSSBkb24ndCBzZWUKd2hhdCBwcmV2ZW50cyBtdWx0aXBsZSBsZXZlbHMgb2Yg
c2hhcmVkIHJlc291cmNlcy4KCkNhbiB5b3UgcGxlYXNlIGdpdmVuIGFuIGV4YW1wbGUgb2YgdGhl
IHRvcG9sb2d5IHlvdXIgY29uc2lkZXJpbmc/IERvZXMKdGhhdCBzaGFyZSBzb21lIHJlc291cmNl
cyBhY3Jvc3MgY2x1c3RlcnMgYXQgc29tZSBsZXZlbD8KCldlIGFyZSBjZXJ0YWlubHkgb3BlbiB0
byBpbXByb3ZpbmcgdGhlIGNwdS1tYXAgYmluZGluZy4KClRoYW5rcywKTWFyay4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
