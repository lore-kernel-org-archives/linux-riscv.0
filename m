Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA2BC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 02:59:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D63E20685
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 02:59:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r2V+hzjs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RModSJP7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D63E20685
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXAviWF7CNwqCeyIXu2QIMHmbzAvGbcr8nbEb0kv/ag=; b=r2V+hzjs4TWpVN
	OfaLsnHjSOTrYCM4YgPoHshHNjuCeyw3YCHWEqKYi/o2TRXRvHoHZpyIBgJXRmTsEX6goIP9L77JO
	b+GX/MowBZPNv8naN1ZtHzMekK+Y7e/4WoS4bYbhw75lfmwXuHcPbVqvcQaWshavgv+ywKo2CuceD
	R8W88X0uoVZ9O8OwJwMxQ3RlqMfkDfQ1522C1DUPXY6ZdLcLeUszsovkRKg5l+Kyv+R/na7JDjdaF
	ObUNwOCmFN+syAxVd0MM6c6Dt3afXnfscLPMpRms4Pfb7yCTxleVvBwF2eETpdxWq3cLiPerS8F3Y
	xW22WIeWfAQ4KL9H6ilg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1getEF-0003mL-E5; Thu, 03 Jan 2019 02:59:27 +0000
Received: from mail-it1-x142.google.com ([2607:f8b0:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1getEB-0003lx-Sb
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 02:59:25 +0000
Received: by mail-it1-x142.google.com with SMTP id p197so41165361itp.0
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jan 2019 18:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=m9JIIhIQDdfEfMjC9QYD+PYxDuJ9Hq9Krph3dSLTfJ8=;
 b=RModSJP7c9jA2F+9D4Ot/Tv9WoAr7I/o5DLLmB6Zts9Z3U0cnF7vQSOdMJSeCvF08T
 oQWGkFaiK67a9IordlsHtEpRCzq65dXtOKskqTVm+F/e7xZJINEn6eg/I31QjIMcHiPu
 xfSmPUyRJzKKkQxwiXgs+FaGH+c1ko4FJEYYNYS7gqTwTCsgetorGMAS+bndhrw1GKG3
 gPLD4t2JMZok9igBbQIM9VqoO7HzhdJc9Ptbpd/J0rKw+Lhwk+4Ki+OHx+tP7TphgcHL
 9DLmmzQAUkhB+Z3AognPj5sY4+rLfSctaq3i8kGe1gRpt/B7pMHFqLWpuZKHGw+JENv1
 tpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=m9JIIhIQDdfEfMjC9QYD+PYxDuJ9Hq9Krph3dSLTfJ8=;
 b=o51k7+0krG2rfIqFEltdZKNzlwzyAkofrDzIBZWGi7u2dTVZKVfXpmi3+ioEJY2/3k
 z7tKKSkk0SMewIRuWm3BIEvI5o5uTWpwPQkDsisZqDPjQQPJucDV5wFcFgMiZf3Mh3Aq
 cx6Sw1RJAmaYtglaSDZvxomGo+pQ1cm6ruXc5JjlSGZ3dYys/c3WWPcVfX+TifbtoQ7T
 WeMkEeLd5vWQPlVzxuSXGB4VJ+Ij8cJExt3qHj5xoJghR2w5yHm834pt2t21SCIoO6kC
 9MNeKwlL1X936vSM1GozqURmXyJBKPQoN4nwVj7ul2aXcN6rvoUTzFLo25vLQzwCrVQA
 zzKQ==
X-Gm-Message-State: AA+aEWZ0/06a1yWzrXlNc/NU1SZcN7fQiIwJTFnVRJ5ObcaCkt/Vy06r
 vocsO4+c7rZ1XSx/92PLxm6W+eM3hh1uJzYO3II=
X-Google-Smtp-Source: AFSGD/UlKUOq0dGJe+B3vYbCHHVVv7ldh4J7pvML2pwBP6kzqc/Q2PrpTiwia1R16p5R0IKGSwdnIjjU/wNSh1jZD4s=
X-Received: by 2002:a02:818c:: with SMTP id n12mr29819647jag.108.1546484362335; 
 Wed, 02 Jan 2019 18:59:22 -0800 (PST)
MIME-Version: 1.0
References: <20181226032350.GA27044@roeck-us.net>
 <mhng-856d9dbc-a4f1-47c3-a71c-d1f7ae82184b@palmer-si-x1c4>
In-Reply-To: <mhng-856d9dbc-a4f1-47c3-a71c-d1f7ae82184b@palmer-si-x1c4>
From: Vincent Chen <deanbo422@gmail.com>
Date: Thu, 3 Jan 2019 10:59:11 +0800
Message-ID: <CAJsyPhyA_u2Syoq1tN73qx=sgddb1KS9DY7Tn98jetoCU+R8ug@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Add CONFIG_PREEMPT=y to defconfig
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_185923_931994_C3AC7CD6 
X-CRM114-Status: GOOD (  22.71  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu, linux@roeck-us.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

UGFsbWVyIERhYmJlbHQgPHBhbG1lckBzaWZpdmUuY29tPiDmlrwgMjAxOOW5tDEy5pyIMjfml6Ug
6YCx5ZubIOS4iuWNiDE6MTnlr6vpgZPvvJoKPgo+IE9uIFR1ZSwgMjUgRGVjIDIwMTggMTk6MjM6
NTAgUFNUICgtMDgwMCksIGxpbnV4QHJvZWNrLXVzLm5ldCB3cm90ZToKPiA+IE9uIFdlZCwgRGVj
IDE5LCAyMDE4IGF0IDA5OjI1OjIxUE0gLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6Cj4gPj4g
T24gV2VkLCBEZWMgMTksIDIwMTggYXQgMDU6NDU6MTFQTSAtMDgwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToKPiA+PiA+IE9uIFdlZCwgTm92IDIxLCAyMDE4IGF0IDEwOjU4OjA1QU0gLTA4MDAsIFBh
bG1lciBEYWJiZWx0IHdyb3RlOgo+ID4+ID4gPiBJIGRvbid0IHJlbWVtYmVyIHdobyBzdWdnZXN0
ZWQgdGhpcywgYnV0IEkgd2FzIHRhbGtpbmcgdG8gc29tZW9uZSBhdAo+ID4+ID4gPiBQbHVtYmVy
cyBhYm91dCBhbGwgdGhlIGhvcnJpYmxlIGJ1Z3Mgd2UndmUgaGFkIGx1cmtpbmcgYXJvdW5kIGlu
IG91cgo+ID4+ID4gPiBwb3J0IGRlc3BpdGUgaXQgc3RpbGwgZ2V0dGluZyB0byB1c2Vyc3BhY2Ug
YW5kIHRoZXkgc3VnZ2VzdGVkIHRoYXQgSQo+ID4+ID4gPiBlbmFibGUgQ09ORklHX1BSRUVNUFQg
aW4gb3VyIGRlZmNvbmZpZyBhcyBpdCdsbCBoZWxwIHNoYWtlIG91dCBtb3JlCj4gPj4gPiA+IGlz
c3Vlcy4KPiA+PiA+ID4KPiA+PiA+ID4gVGhpcyBwYXRjaCBlbmFibGVzIENPTkZJR19QUkVFTVBU
IGluIHRoZSBzaW5nbGUgUklTQy1WIGRlZmNvbmZpZy4gIEl0Cj4gPj4gPiA+IHN0aWxsIHBhc3Nl
cyBteSB0ZXN0cyAoaWUsIGJvb3RpbmcgRmVkb3JhIG9uIFFFTVUpLiAgTWF5YmUgSSdtIHRvbwo+
ID4+ID4gPiBwYXJhbm9pZCwgYnV0IEkgc3RpbGwgZG9uJ3QgdHJ1c3Qgb3VyIHBvcnQgZW5vdWdo
IHRvIGp1c3QgcHVsbCB0aGUKPiA+PiA+ID4gdHJpZ2dlciBvbiB0aGlzIHdpdGhvdXQgYXQgbGVh
c3QgYWNjdW11bGF0aW5nIHNvbWUgIlRlc3RlZC1ieSJzIG9uIGl0Lgo+ID4+ID4gPgo+ID4+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHNpZml2ZS5jb20+Cj4gPj4g
Pgo+ID4+ID4gSSBjYW4gb25seSBnaXZlIHlvdSBhCj4gPj4gPgo+ID4+ID4gRmFpbHMtbWlzZXJh
Ymx5LWZvcjogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0Pgo+ID4+ID4KPiA+PiA+
IE5vdCB0aGUgbmV3IGRlZmNvbmZpZyBpdHNlbGYsIGJ1dCB0aGUgbmV3IGRlZmNvbmZpZyBwbHVz
IGEgdmFyaWV0eSBvZgo+ID4+ID4gc2VsZnRlc3Qgb3B0aW9ucy4gSSBkb24ndCBrbm93IHdoYXQg
ZXhhY3RseSBpcyBmYWlsaW5nLCBidXQgaGVyZSBpcwo+ID4+ID4gbXkgbGlzdCBvZiBlbmFibGVk
IHNlbGZ0ZXN0cyBvbiB0b3Agb2YgZGVmY29uZmlnOgo+ID4+ID4KPiA+PiA+IENPTkZJR19DUllQ
VE9fTUFOQUdFUl9ESVNBQkxFX1RFU1RTPXkKPiA+PiA+IENPTkZJR19DUkMzMl9TRUxGVEVTVD15
Cj4gPj4gPiBDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RTPXkKPiA+PiA+IENPTkZJ
R19ERUJVR19OTUlfU0VMRlRFU1Q9eQo+ID4+ID4gQ09ORklHX0RFQlVHX1JPREFUQV9URVNUPXkK
PiA+PiA+IENPTkZJR19ERUJVR19UTEJGTFVTSD15Cj4gPj4gPiBDT05GSUdfRE1BVEVTVD15Cj4g
Pj4gPiBDT05GSUdfR0xPQl9TRUxGVEVTVD15Cj4gPj4gPiBDT05GSUdfT0ZfVU5JVFRFU1Q9eQo+
ID4+ID4gQ09ORklHX1BDSV9FUEZfVEVTVD15Cj4gPj4gPiBDT05GSUdfUENJX0VORFBPSU5UX1RF
U1Q9eQo+ID4+ID4gQ09ORklHX1BST1ZFX0xPQ0tJTkc9eQo+ID4+ID4gQ09ORklHX1BST1ZFX1JD
VT15Cj4gPj4gPiBDT05GSUdfUkNVX0VRU19ERUJVRz15Cj4gPj4gPiBDT05GSUdfU1RBVElDX0tF
WVNfU0VMRlRFU1Q9eQo+ID4+ID4gQ09ORklHX1NUUklOR19TRUxGVEVTVD15Cj4gPj4gPiBDT05G
SUdfVEVTVF9CSVRNQVA9eQo+ID4+ID4gQ09ORklHX1RFU1RfRklSTVdBUkU9eQo+ID4+ID4gQ09O
RklHX1RFU1RfU09SVD15Cj4gPj4gPiBDT05GSUdfVEVTVF9TWVNDVEw9eQo+ID4+ID4gQ09ORklH
X1RFU1RfVVVJRD15Cj4gPj4gPiBDT05GSUdfVVNCX1RFU1Q9eQo+ID4+ID4gQ09ORklHX1VTQl9F
SFNFVF9URVNUX0ZJWFRVUkU9eQo+ID4+ID4gQ09ORklHX1VTQl9MSU5LX0xBWUVSX1RFU1Q9eQo+
ID4+ID4gQ09ORklHX1dXX01VVEVYX1NFTEZURVNUPXkKPiA+PiA+IENPTkZJR19UT1JUVVJFX1RF
U1Q9eQo+ID4+ID4gQ09ORklHX0xPQ0tfVE9SVFVSRV9URVNUPXkKPiA+PiA+IENPTkZJR19SQ1Vf
VE9SVFVSRV9URVNUPXkKPiA+PiA+IENPTkZJR19SQlRSRUVfVEVTVD15Cj4gPj4gPiBDT05GSUdf
SU5URVJWQUxfVFJFRV9URVNUPXkKPiA+PiA+Cj4gPj4KPiA+PiBVcGRhdGU6IGRlZmNvbmZpZytD
T05GSUdfTE9DS19UT1JUVVJFX1RFU1Q9eSBjYXVzZXMgdGhlIGhhbmcKPiA+PiBpZiBDT05GSUdf
UFJFRU1QVD15Lgo+ID4+Cj4gPgo+ID4gQW5vdGhlciB1cGRhdGUuIENPTkZJR19SQ1VfVE9SVFVS
RV9URVNUPXkgb3IgQ09ORklHX1dXX01VVEVYX1NFTEZURVNUPXkKPiA+IGFsc28gcmVzdWx0IGlu
IGhhbmdzLCBvbmx5IGEgYml0IGxhdGVyLiBJIGhhdmUgbm93IGRpc2FibGVkIGFsbCB0aHJlZSB0
ZXN0Cj4gPiBvcHRpb25zIGluIG15IHJpc2N2IGJvb3QgdGVzdHMgaWYgQ09ORklHX1BSRUVNUFQ9
eS4gVGhlIGxhY2sgb2YgZXJyb3IKPiA+IHJlcG9ydHMgaW4gdGhlIGZ1dHVyZSBkb2VzIF9ub3Rf
IG1lYW4gdGhhdCB0aGUgcHJvYmxlbSBoYXMgbWFnaWNhbGx5Cj4gPiBkaXNhcHBlYXJlZC4gSSBq
dXN0IGZpbmQgaXQgcG9pbnRsZXNzIHRvIGtlZXAgdGVzdGluZyBhIGtub3duIGJyb2tlbgo+ID4g
Y29uZmlndXJhdGlvbiwgZXZlbiBtb3JlIHNvIHNpbmNlIGRvaW5nIHNvIHdvdWxkIGhpZGUgb3Ro
ZXIgcG90ZW50aWFsCj4gPiBwcm9ibGVtcy4KPgo+IFRoYW5rcy4gIEkgYWdyZWUgaXQncyBwb2lu
dGxlc3MgdG8gdGVzdCBtb3JlLCBhcyB0aGVyZSBhcHBlYXIgdG8gYmUgbG90cyBvZgo+IGJ1Z3Mg
dG8gZml4IGFscmVhZHkgYW5kIHRoaXMgd2lsbCBqdXN0IG1hc2sgb3RoZXIgYnVncy4KPgoKTGFz
dCB3ZWVrLCBJIGVuY291bnRlcmVkIHNvbWUgbG9ja2luZyBpc3N1ZXMgaW4gdGhlIGtlcm5lbCwg
c28gSSB0cmllZAp0byB0ZXN0IHRoZQprZXJuZWwgd2l0aCBzb21lIHJlbGF0aXZlIHNlbGZ0ZXN0
cy4gU2luY2UgSSBoYWQgYWxyZWFkeSBzZXQgQ09ORklHX1BSRUVNUFQ9eSwKSSBlbmNvdW50ZXJl
ZCB0aGUgc2FtZSByZXN1bHRzIGluIFJDVV9UT1JUVVJFX1RFU1QgYW5kCkxPQ0tfVE9SVFVSRV9U
RVNULiBJIHRyaWVkIHRvIGRlYnVnIGl0IGFuZCBmb3VuZCB0aGUgaGFuZyB3YXMgZHVlIHRvCnRo
ZSBsYWNrIG9mIF9USUZfTkVFRF9SRVNDSEVEIGNoZWNrIGZvciBrZXJuZWwgdGhyZWFkcyBpbiBl
bnRyeS5TLiBJIHdpbGwgc2VuZCBhCnBhdGNoIHRvIHNvbHZlIHRoaXMgcHJvYmxlbSBhbmQgSSBo
b3BlIHlvdSBjYW4gZ2l2ZSBtZSBzb21lIGNvbW1lbnRzCmlmIHlvdSBmaW5kIHNvbWUKbWlzdGFr
ZXMuCgpWaW5jZW50IENoZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
