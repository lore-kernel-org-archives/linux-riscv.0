Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA5CCA1013
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bMYzXRs2kiTLz5ixk2O8aSPPCRtOnj7OOOX3Z8CU5Cc=; b=4lVs8Q9tj/vAaR
	G8G10h2r4Hka+qY+qh9jko3QsuFCtzdAKj0fXrc2mi/vRuKp9b5JUEwcA/gOPlUdCE2CTKwNmmNvO
	ViSMmHsGoF2gDmvweKpLlXyQr24LmYFWiY9dQZWXb29Iz2/beNSph+uWDeKZFpGZBoTfgjlH0UD/W
	3WU5VJfi4+3I7nqstvTm2xlm0QMSmImWHBxxJ4mpJwWIurJFb7znYl9bVX5whSw7f5ZM6g+jROFgG
	P6xSWQ/og/A3jAJVwSafiPi44Jyede8hT8vtLhyzF0wMhOEX3JgxueV/Y6JcrtURVfF2ohuCNxdc4
	61SgYFtv4mloJTZr4iWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFUk-000000006el-3vcV;
	Thu, 18 Sep 2025 14:20:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFUj-000000006eM-0yFc
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 14:20:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9B90C601D5;
	Thu, 18 Sep 2025 14:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15220C4CEE7;
	Thu, 18 Sep 2025 14:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758205220;
	bh=PvXi2UaH2X72C7RXZdhkY44KYCqysJsWDYnH0vlxuTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYgn5fOaQ8c1W1KYuQf68SSRzQ/1VdlyAO+C0dVrdc7puXNL4ufBYH/J8aZGoaAaC
	 SKduReWduVX9jkBdMoHafghoLKwjCDukNDMa7IKYlzZMFElG2rhEwVuIGnTHDEiRl9
	 j0XRTEAZl1pBTYIV7050Xk9YcSrUj6XVjlvbu+EWTiDXXjQPnv3y8wiATaZMf4dFF2
	 xJUOMeaH6GfN/fLL5/qPJDiIXRs6ZVTyuY43IMwFstUSpuJ9aY7/Erlx3PmdzIb5zh
	 AT7ocdTWayweor1lWTGLSvxaXAW6HHtxGRSgXBzOqVtt6Am8f0CFPrrQFop1aDh5ea
	 uwSmLPbqc+ogw==
Date: Thu, 18 Sep 2025 15:20:15 +0100
From: Will Deacon <will@kernel.org>
To: =?utf-8?B?6YOt5Lqa5pif?= <guoyaxing@bosc.ac.cn>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
	iommu <iommu@lists.linux.dev>, tjeznach <tjeznach@rivosinc.com>,
	joro <joro@8bytes.org>, "robin.murphy" <robin.murphy@arm.com>,
	"paul.walmsley" <paul.walmsley@sifive.com>,
	palmer <palmer@dabbelt.com>, aou <aou@eecs.berkeley.edu>,
	alex <alex@ghiti.fr>, anxu <anxu@bosc.ac.cn>,
	wangran <wangran@bosc.ac.cn>
Subject: Re: [PATCH v1 1/3] iommu/riscv: Add iommu perf driver
Message-ID: <aMwVHrhKBZWstPat@willie-the-truck>
References: <20250915020911.1313-1-guoyaxing@bosc.ac.cn>
 <aMfsj1U7NY2m68T4@willie-the-truck>
 <202509161827232434929@bosc.ac.cn>
 <aMqlR4vDOgrFuCUj@willie-the-truck>
 <48b8385a-ad44-4098-a647-109a3cfe3bbb@bosc.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48b8385a-ad44-4098-a647-109a3cfe3bbb@bosc.ac.cn>
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

T24gVGh1LCBTZXAgMTgsIDIwMjUgYXQgMTE6MjA6NTVBTSArMDgwMCwg6YOt5Lqa5pifIHdyb3Rl
Ogo+IFtTb3JyeSwgSSB0cmllZCBzd2l0Y2hpbmcgYSBuZXcgZW1haWwgY2xpZW50IGFuZCBtYWRl
IHNvbWUgc2V0dGluZ3MuLi5dCj4gCj4gT24gOS8xNy8yMDI1IDg6MTAgUE0sIFdpbGwgRGVhY29u
IHdyb3RlOgo+ID4gW25pdDogeW91ciBlbWFpbCBjbGllbnQgaGFzIG1hZGUgYSBiaWcgbWVzcyBv
ZiB0aGUgdGhyZWFkIGhlcmVdCj4gPiAKPiA+IE9uIFR1ZSwgU2VwIDE2LCAyMDI1IGF0IDA2OjI3
OjIzUE0gKzA4MDAsIGd1b3lheGluZ0Bib3NjLmFjLmNuIHdyb3RlOgo+ID4gPiA+IFBNVSBkcml2
ZXJzIGFyZSBiZXR0ZXIgcGxhY2VkIHVuZGVyIGRyaXZlcnMvcGVyZi8KPiA+ID4gCj4gPiA+IEkg
ZGlkIGEgcXVpY2sgcmVhZGluZyBvZiBTTU1VIHBtdSBkcml2ZXIgaW4gZHJpdmVycy9wZXJmLy4g
IEhvd2V2ZXIsIElmCj4gPiA+IHRoZSBSSVNDLVYgSU9NTVUgUE1VIGRyaXZlciBpcyBwbGFjZWQg
dW5kZXIgZHJpdmVycy9wZXJmLyBhcyB0aGUgU01NVSBkaWQsCj4gPiA+IGl0IHdvdWxkIGNhdXNl
IGFuIG92ZXJsYXAgaW4gdGhlIGlvbWVtIHJlc291cmNlIHJlZ2lvbiBiZXR3ZWVuIHRoZSB0d28K
PiA+ID4gZGV2aWNlcyhpb21tdSAmIGlvbW11IHBtdSksIGJlY2F1c2UgaXQgbmVlZHMgdG8gc2hh
cmUgaW50ZXJydXB0LXJlbGF0ZWQKPiA+ID4gcmVnaXN0ZXJzIChzdWNoIGFzIHRoZSBJUFNSIHJl
Z2lzdGVyKSB3aXRoIHRoZSBtYWluIElPTU1VIGRyaXZlci4KPiA+IAo+ID4gSXMgdGhhdCBub3Qg
c29tZXRoaW5nIHlvdSBjYW4gcmVzb2x2ZSB3aXRoIElSUUZfU0hBUkVEPwo+ID4gCj4gCj4gQWN0
dWFsbHkgSU9NTVUgcGVyZiBpcyB1c2luZyBzdGFuZC1hbG9uZyBpbnRlcnJ1cHQsIHNvIG1pZ2h0
IG5vdCBuZWVkCj4gSVJRRl9TSEFSRUQgd2l0aCBJT01NVSBkcml2ZXIuCgpIcm0uIFR3byBzZXBh
cmF0ZSBpbnRlcnJ1cHRzIHRoYXQgc2hhcmUgdGhlIHNhbWUgaW50ZXJydXB0LWhhbmRsaW5nCnJl
Z2lzdGVycyBpcyBhbiAiaW50ZXJlc3RpbmciIGRlc2lnbiBmb3IgYSBwaWVjZSBvZiBoYXJkd2Fy
ZSA6LwoKPiBXaGF0IEkgbWVhbiBpcyB0aGUgSU9NTVUgYW5kIElPTU1VIHBlcmYgc2hhcmUgdGhl
IHNhbWUgcmVnaXN0ZXJzLCBzdWNoIGFzCj4gSVBTUi4gVGhpcyBjb3VsZCByZXN1bHQgaW4gb3Zl
cmxhcCBvbiB0aGlzIGlvbWVtIHJlZ2lvbnMgYmV0d2VlbiB0aGVtLCB3aGljaAo+IGlzIGhpZ2hs
eSB1bmRlc2lyYWJsZS4KPiAKPiBGb3Igbm93LCB0d28gaWRlYXMgY29tZSB0byBteSBtaW5kOgo+
IDEuIEludGVncmF0ZSBJT01NVSBwZXJmIGZ1bmN0aW9uYWxpdHkgaW50byBJT01NVSBkcml2ZXIs
IGp1c3QgYXMgcHJldmlvdXMKPiB2ZXJzaW9uIHBhdGNoLgo+IAo+IDIuIExldCBJT01NVSBkcml2
ZXIgZXhwb3J0IGV4dGVybmFsIGFwaSBmb3IgSU9NTVUgcGVyZgo+ICh0byBvYnRhaW4gdmlydHVh
bCBhZGRyZXNzIG9mIElQU1IgcmVnaXN0ZXIpIGZvciBwZXJmIHJlbGF0ZWQgb3BlcmF0aW9ucy4K
PiAKPiBTbyB3aGF0J3MgeW91ciBzdWdnZXN0aW9uPwoKSSB3b25kZXIgaWYgeW91IGNvdWxkIGNy
ZWF0ZSB0aGUgUE1VIGRldmljZSBhcyBhIGNoaWxkIG9mIHRoZSBJT01NVT8KCkknbSBzdXJlIFJv
YmluIGhhZCBmdW4gZGVhbGluZyB3aXRoIHNoYXJlZCBNTUlPIHJlZ2lvbnMgYmVmb3JlLCBidXQg
SQpjYW4ndCByZW1lbWJlciB0aGUgZGV0YWlscyAod2FzIGl0IHRoZSBDTU4gUE1VIGRyaXZlcj8p
CgpXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
