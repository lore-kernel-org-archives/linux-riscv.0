Return-Path: <SRS0=Yzoz=SF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2C01C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:04:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C154020830
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2019 01:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q6I0crBM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C154020830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu4dUIvWKsEoc9R6rYp5jd67VQzaC37ytp1vAuf9Im8=; b=Q6I0crBMbx0HAM
	5MTNFI2lKiOf3ggRpjrDeQnAek/Erkh3Ch10gXmz08LOCJeB+jJTWwSnx+FMfKtRUQeaYazazGlAB
	oFyRYH7I/beFbSFOd3NmajoI0+N42a865YNfT0JE7Un0dUu45fPidNoMw4wX6PD2flmRZ9gPw3r9N
	z3b1rX9+ly8jrSpy3t8rdsCO8jE0D2giqyUI1zc0hPfN0lmij7EnwuCC4j96Z1WSgO7XXKiB0UPm5
	XrakSCmQ5MLb93q8W/eHqBI89XkNnXbDoec4XZGxBe2XzcgscNB3qRV88p4OQCfsTbp5VJ24TCz1L
	43FHrnavS/KsB93fr0dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBUKZ-0003aM-Re; Wed, 03 Apr 2019 01:04:43 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBUKW-0003Zv-EG
 for linux-riscv@lists.infradead.org; Wed, 03 Apr 2019 01:04:42 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x3313I8o091355;
 Wed, 3 Apr 2019 09:03:18 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 3 Apr 2019
 09:04:26 +0800
Date: Wed, 3 Apr 2019 09:04:26 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>, <laanwj@gmail.com>
Subject: Re: Perf counters on SiFive FU540-C000
Message-ID: <20190403010426.GA4033@andestech.com>
References: <20190331143732.7n4b5llrkxs5nbvm@aurora.visucore.com>
 <mhng-0cd5a4db-2499-4830-a4bf-656275714836@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-0cd5a4db-2499-4830-a4bf-656275714836@palmer-si-x1c4>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x3313I8o091355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_180440_741007_D7247CAC 
X-CRM114-Status: GOOD (  14.32  )
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
Cc: linux-riscv@lists.infradead.org, nickhu@andestech.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiBUdWUsIEFwciAwMiwgMjAxOSBhdCAxMDo1NzoxNEFNIC0wNzAwLCBQYWxtZXIgRGFi
YmVsdCB3cm90ZToKPiBPbiBTdW4sIDMxIE1hciAyMDE5IDA3OjM3OjMyIFBEVCAoLTA3MDApLCBs
YWFud2pAZ21haWwuY29tIHdyb3RlOgo+ID5IZWxsbywKPiA+Cj4gPkknbSBwbGFubmluZyBvbiBk
b2luZyBzb21lIG9wdGltaXphdGlvbiB3b3JrIGZvciBSSVNDLVYsIHNvIEknZCBsaWtlIHRvIGFk
ZAo+ID5wZXJmIHN1cHBvcnQgZm9yIHRoZSBwZXJmb3JtYW5jZSBjb3VudGVycyBvbiB0aGUgRlU1
NDAtQzAwMOKAlGFzIGRlc2NyaWJlZCBpbgo+ID5TZWN0aW9uIDQuMTAgb2YgdGhlICJTaUZpdmUg
RlU1NDAtQzAwMCBNYW51YWwiLgo+IAo+IFRoYXQgd291bGQgYmUgZ3JlYXQsIHRoYW5rcyEKPiAK
PiA+VGhlc2UgYXJlIHZlcnkgYmFzaWM6IENTUnMgbWhwbWV2ZW50MyBhbmQgbWhwbWV2ZW50NCBj
YW4gYmUgdXNlZCB0byBjaG9vc2UgYSBjYXRlZ29yeQo+ID4oSW5zdHJ1Y3Rpb24gQ29tbWl0IEV2
ZW50cywgTWljcm9hcmNoaXRlY3R1cmFsIEV2ZW50cywgTWVtb3J5IFN5c3RlbSBFdmVudHMpLCB0
aGVuCj4gPmZyb20gdGhlc2UgY2F0ZWdvcmllcyBhIGJpdG1hc2sgb2YgZXZlbnRzIGNhbiBiZSBz
ZXQgdGhhdCB3aWxsIGluY3JlYXNlIHRoZSBhc3NvY2lhdGVkCj4gPmNvdW50ZXIgd2hlbiB0aGV5
IGhhcHBlbi4gSSBkb24ndCB1bmRlcnN0YW5kIHRoZSByYXRpb25hbGUgZm9yIGNvdW50aW5nIG11
bHRpcGxlCj4gPmtpbmRzIG9mIGV2ZW50cyBpbiBvbmUgcmVnaXN0ZXIsIHNvIGZyb20gd2hhdCBJ
IHVuZGVyc3RhbmQsIHR3byBjb3VudGVycyBjYW4gYmUKPiA+c3VwcG9ydGVkIGF0IG9uY2UgaW4g
dGhlIHBlcmYgaW50ZXJmYWNlLgo+IAo+IFRoZSBpZGVhIGhlcmUgaXMgdG8gYWxsb3cgdXNlcnMg
dG8gaGF2ZSBkaWZmZXJlbnQgcGVyZm9ybWFuY2UgY291bnRlcgo+IGdyYW51bGFyaXRpZXMuICBG
b3IgZXhhbXBsZSwgdXNlcnMgbWlnaHQgd2FudCB0byBjb3VudCBhbGwgcGlwZWxpbmUgZmx1c2hl
cwo+IChtYXliZSB0aGVpciBmcmFtZXdvcmsgZGVmaW5lcyB0aGF0IGFzIGEgcG9zc2libGUgY291
bnRlciB0eXBlKSBvciBtYXkgd2FudAo+IHRvIHNwZWNpZmljYWxseSBpbmRpY2F0ZSB3aGljaCBz
b3J0IG9mIHBpcGVsaW5lIGZsdXNoIHNob3VsZCBiZSBjb3VudGVkLgo+IAo+ID5JIGZvdW5kIHNv
bWUgZG9jdW1lbnRhdGlvbiBhYm91dCBwbGF0Zm9ybSBzcGVjZmljIGNvdW50ZXJzIGluIERvY3Vt
ZW50YXRpb24vcmlzY3YvcG11LnR4dCwKPiA+aG9wZWZ1bGx5IHRoaXMgaXMgZW5vdWdoIHRvIGdl
dCBtZSBzdGFydGVkLgo+ID4oSWYgc29tZW9uZSBzdGFydGVkIHdvcmsgb24gdGhpcywgcGxlYXNl
IGxldCBtZSBrbm93KQo+IAo+IFNvbWVvbmUgZnJvbSBBbmRlcyBoYWQgcGF0Y2hlcyBvdXQgdG8g
YWRkIHN1cHBvcnQgZm9yIHRoZWlyIHBlcmZvcm1hbmNlCj4gY291bnRlcnMgYSB3aGlsZSBhZ28u
ICBUaGUgaXNzdWUgdGhlcmUgd2FzIHRoYXQgdGhlIHBlcmZvcm1hbmNlIGNvdW50ZXIKPiBpbXBs
ZW1lbnRhdGlvbiB3YXMgY2hvc2VuIGF0IGNvbXBpbGUgdGltZSwgYnV0IGl0IHNob3VsZCByZWFs
bHkgYmUgZGV0ZWN0ZWQKPiBhdCBydW4gdGltZSB2aWEgc29tZSBwbGF0Zm9ybS1zcGVjaWZpYyBt
ZWNoYW5pc20gKGllLCBkZXZpY2UgdHJlZSkuCgpQTVUgZGV0ZWN0aW9uIHdhcyBvbmUgb2YgdGhl
IHByb2JsZW1zLCBhbmQgc2hvdWxkIGhhdmUgYmVlbiBzb2x2ZWQgaW4gcHJldmlvdXMKcGF0Y2hl
cy4gIEZvciB0aGUgcmVzdCBvZiB0aGUgcHJvYmxlbXMsIERvY3VtZW50YXRpb24vcmlzY3YvcG11
LnR4dCBzaG91bGQKc2VydmUgYXMgYSBnb29kIGd1aWRlLgoKPiBBc2lkZSBmcm9tIHRoYXQgSSB0
aGluayB0aGUgb25seSBpc3N1ZSB3YXMgaG93IHRvIGV4cG9zZSB0aGVzZSB0byB1c2Vyc3BhY2UK
PiBpbiBhIHNhbmUgZmFzaGlvbiwgd2hpY2ggaXMgc29tZXRoaW5nIEkgdGhvdWdodCB3b3VsZCBi
ZSBxdWl0ZSB0cmlja3kuICBJSVJDCj4gc29tZW9uZSBtYW5hZ2VkIHRvIGNvbnZpbmNlIG1lIHRo
YXQgdGhlcmUgd2FzIGEgcmVhbGx5IHNpbXBsZSBzY2hlbWUgZm9yCj4gZG9pbmcgdGhpcywgYnV0
IEkgZG9uJ3QgcmVtZW1iZXIgd2hhdCBpdCB3YXMuCgpUaGUgY29ycmVzcG9uZGluZyB1c2Vyc3Bh
Y2UgdG9vbCBpcyBpbiB0b29scy9wZXJmLiAgT25jZSBvbmUgZmluaXNoZXMgdGhlIGtlcm5lbApw
YXJ0LCB0aGUgd29yayBsZWZ0IGZvciB1c2Vyc3BhY2UgcGVyZiB3aWxsIGJlIHRoZSBzeW1ib2xp
emF0aW9uIG9mIFBNVSByYXcKZXZlbnRzLiAgVGhlIHByZWxpbWluYXJ5IHBhdGNoIHN1cHBvcnRz
IGNvbW1vbiBjb3VudGVycyBvbmx5LCBzbyBJIGJlbGlldmUgdGhpcwp3aWxsIGJlIHRoZSBmaXJz
dCBwbGF0Zm9ybS1zcGVjaWZpYyBQTVUgaW4gUklTQy1WLgoKQWxhbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
