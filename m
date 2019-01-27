Return-Path: <SRS0=74fC=QD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF36EC282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Jan 2019 16:58:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FFBB20882
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Jan 2019 16:58:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="taSw2rhq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ALsHF/wG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FFBB20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u4aDLPBKg6UoaqVSPViektmYhXO+f66+2U+FnS9UKUs=; b=taSw2rhqUli0/Bs6RYte8yK/f
	mzfQYHVokp6kEwLjymzLkU9gfVdbYRF9jRps7pvF8tiRoMfUPRa/ATNLS1Un/Fe78s+FVCch3943O
	2i5DQ56+vyk7M/LgMLJI76OweMrKDhznl+9q8nA+001XQ9wzJZYipHYZWnG+2P2qhU5LF9+MhMs3S
	Qd1l/z9GwyKptkDYST6fIvoYwSU2F2X4HqpVUf3T9/xIv/ddMFRKLq7qKCbSQPE3SGGCzR+kU1E+H
	CnMeDCXhtrIJ0d6KJZiWSkk9x605yqtg8vYiGHbtk1brsKp0rvfz5rGyDpWs7jN6aSsbmnGjzvPoh
	GWNjU87Hw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnnlR-0004Vw-OM; Sun, 27 Jan 2019 16:58:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnnlP-0004Vd-Om
 for linux-riscv@bombadil.infradead.org; Sun, 27 Jan 2019 16:58:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XPDVGYQ7gdwW3og7dNe4K+76HH35mVaTzpF4CyDsHwA=; b=ALsHF/wGQqxMmTSpRjXZ3Kr9EJ
 WYe6gJwalyFL8VmnXm/jqIa9r1QJ7kUEEHP+FhCbv7jBKoJTEAHR4ALgZ7C7r0Pwn1l3+pNCL0Okx
 EP7qyr4O/OLiIr4BK1ugIR8YW1IAGWeay+bKZQcxWMhigKn80ePw7QaAGyS97dnuIdPcKmPWdv0n8
 ZIGx0BycZYo1Om+DCTjcHAkS7kAGrsLO6RY41GDOV2quD4bh3Rzwqdkz9tyRKmZup1yPUN9VZd7Uz
 icy2eiNm/H0Og9HkJs2CN6p5sY7axGmZkHexNRxWbbzKaW9v5YfAjxKZo0y5G2VTyUFZOw//KvmvW
 Hg4s8OaA==;
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnnlM-0002Lr-CE
 for linux-riscv@lists.infradead.org; Sun, 27 Jan 2019 16:58:30 +0000
X-Originating-IP: 79.86.19.127
Received: from [192.168.0.11] (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 17964E0006;
 Sun, 27 Jan 2019 16:57:52 +0000 (UTC)
From: Alex Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 3/3] riscv: Adjust mmap base address at a third of task
 size
References: <c45285f7-9b05-9f04-a5a0-5d5dc075bb1b@ghiti.fr>
 <mhng-390e0f09-77a1-4943-99a6-6faba4632383@palmer-si-x1c4>
 <24d86d8d-e1c4-6221-3f5c-84fdaa56e5b4@ghiti.fr>
Message-ID: <5f0af912-7c79-2aa9-c5c9-89f90a1d8a65@ghiti.fr>
Date: Sun, 27 Jan 2019 11:57:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <24d86d8d-e1c4-6221-3f5c-84fdaa56e5b4@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190127_165828_475264_47B5A0EF 
X-CRM114-Status: GOOD (  22.38  )
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
Cc: aou@eecs.berkeley.edu, akpm@linux-foundation.org, catalin.marinas@arm.com,
 ndesaulniers@google.com, aghiti@upmem.com,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org, mike.kravetz@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMS8yNi8xOSA0OjIzIEFNLCBBbGV4IEdoaXRpIHdyb3RlOgo+IE9uIDEvMjUvMTkgMjowMiBQ
TSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+IE9uIFR1ZSwgMTUgSmFuIDIwMTkgMDg6MDI6MDYg
UFNUICgtMDgwMCksIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4gT24gTW9uLCBEZWMgMTAs
IDIwMTggYXQgMDY6MjE6NDZBTSArMDAwMCwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+Pj4+IFRo
aXMgcmF0aW8gaXMgdGhlIG1vc3QgdXNlZCBhbW9uZyBhbGwgb3RoZXIgYXJjaGl0ZWN0dXJlcyBh
bmQgbWFrZQo+Pj4+IGljYWNoZV9oeWdpZW5lIGxpYmh1Z2V0bGJmcyB0ZXN0IHBhc3M6IHRoaXMg
dGVzdCBtbWFwIGxvdHMgb2YKPj4+PiBodWdlcGFnZXMgd2hvc2UgYWRkcmVzc2VzLCB3aXRob3V0
IHRoaXMgcGF0Y2gsIHJlYWNoIHRoZSBlbmQgb2YKPj4+PiB0aGUgcHJvY2VzcyB1c2VyIGFkZHJl
c3Mgc3BhY2UuCj4+Pgo+Pj4gVGhpcyBkb2VzIGluZGVlZCBsb29rIGNvbW1vbiwgc28gdGhpcyBs
b29rcyBzZW5zaWJsZSB0byBtZSBhbmQgbWlnaHQKPj4+IGJlIHdvcnRoIHBpY2tpbmcgdXAgQVNB
UCBldmVuIHdpdGhvdXQgdGhlIGh1Z2V0bGIgc3VwcG9ydDoKPj4+Cj4+PiBSZXZpZXdlZC1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4+Cj4+IE1ha2VzIHNlbnNlIHRvIG1lLsKg
IEknbGwgdGFrZSBpdCBpbiB0byB0aGUgbmV4dCBQUi4KPj4KPj4+IEkgd29uZGVyIGlmIHdlIHNo
b3VsZCBwcm92aWRlIHRoaXMgdmFsdWUgYXMgYSBkZWZ1YWx0Cj4+PiBUQVNLX1VOTUFQUEVEX0JB
U0UgaWYgdGhlIGFyY2hpdGVjdHVyZSBkb2Vzbid0IHByb3ZpZGUgb25lLgo+Pgo+PiBMb29rcyBs
aWtlIGFybTY0IGRpdmlkZXMgYnkgNCBpbnN0ZWFkIG9mIDMuwqAgSXQgYXBwZWFycyB0byBoYXZl
IGJlZW4gCj4+IHRoYXQgd2F5IHNpbmNlIHRoZSBzdGFydDoKPj4KPj4gwqDCoCBjb21taXQgNGYw
NGQ4ZjAwNTQ1MTEwYTBlNTI1YWUyZmI2MmFiMzhjYjQxNzIzNgo+PiDCoMKgIEF1dGhvcjogQ2F0
YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPj4gwqDCoCBEYXRlOsKgwqAg
TW9uIE1hciA1IDExOjQ5OjI3IDIwMTIgKzAwMDAKPj4gwqDCoCDCoMKgwqDCoMKgwqAgYXJtNjQ6
IE1NVSBkZWZpbml0aW9ucwo+PiDCoMKgwqDCoMKgwqAgLi4uCj4+Cj4+IHNvIG1heWJlIHRoYXQn
cyB0aGUgcmlnaHQgYW5zd2VyPwo+Cj4gTWF5YmUsIEkgY2FuJ3QgZmluZCBleHBsYW5hdGlvbnMg
cmVnYXJkaW5nIHRoaXMgYXJiaXRyYXJ5IHZhbHVlLgo+Cj4+Cj4+IE9uIFR1ZSwgMTUgSmFuIDIw
MTkgMTA6NTQ6MjcgUFNUICgtMDgwMCksIGFsZXhAZ2hpdGkuZnIgd3JvdGU6Cj4+PiBPbiAxLzE1
LzE5IDQ6MDIgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+Pj4+IE9uIE1vbiwgRGVjIDEw
LCAyMDE4IGF0IDA2OjIxOjQ2QU0gKzAwMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+Pj4g
VGhpcyByYXRpbyBpcyB0aGUgbW9zdCB1c2VkIGFtb25nIGFsbCBvdGhlciBhcmNoaXRlY3R1cmVz
IGFuZCBtYWtlCj4+Pj4+IGljYWNoZV9oeWdpZW5lIGxpYmh1Z2V0bGJmcyB0ZXN0IHBhc3M6IHRo
aXMgdGVzdCBtbWFwIGxvdHMgb2YKPj4+Pj4gaHVnZXBhZ2VzIHdob3NlIGFkZHJlc3Nlcywgd2l0
aG91dCB0aGlzIHBhdGNoLCByZWFjaCB0aGUgZW5kIG9mCj4+Pj4+IHRoZSBwcm9jZXNzIHVzZXIg
YWRkcmVzcyBzcGFjZS4KPj4+PiBUaGlzIGRvZXMgaW5kZWVkIGxvb2sgY29tbW9uLCBzbyB0aGlz
IGxvb2tzIHNlbnNpYmxlIHRvIG1lIGFuZCBtaWdodAo+Pj4+IGJlIHdvcnRoIHBpY2tpbmcgdXAg
QVNBUCBldmVuIHdpdGhvdXQgdGhlIGh1Z2V0bGIgc3VwcG9ydDoKPj4+Pgo+Pj4+IFJldmlld2Vk
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPj4+Pgo+Pj4+IEkgd29uZGVyIGlm
IHdlIHNob3VsZCBwcm92aWRlIHRoaXMgdmFsdWUgYXMgYSBkZWZ1YWx0Cj4+Pj4gVEFTS19VTk1B
UFBFRF9CQVNFIGlmIHRoZSBhcmNoaXRlY3R1cmUgZG9lc24ndCBwcm92aWRlIG9uZS4KPj4+Cj4+
PiBUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lgo+Pj4gSSB0aGluayB5b3UncmUgcmlnaHQgcmVnYXJk
aW5nIGhhdmluZyBhIGRlZmF1bHQgdmVyc2lvbiBvZgo+Pj4gVEFTS19VTk1BUFBFRF9CQVNFLAo+
Pj4gSSB3aWxsIHByb3Bvc2Ugc29tZXRoaW5nLgo+Pgo+PiBTb3VuZHMgZ29vZCB0byBtZS7CoCBJ
IGRvbid0IHNlZSBhbnl0aGluZywgc28gSSdtIHN0aWxsIGdvaW5nIHRvIHRha2UgCj4+IHRoZSBw
YXRjaCAtLSB3ZSBjYW4gYWx3YXlzIGRyb3AgdGhlIHJlZHVuZGFudCBkZWZpbml0aW9uIGxhdGVy
Lgo+Cj4gSSBkaWQgbm90IHByb3Bvc2UgYW55dGhpbmcgeWV0LCBJIHdpbGwgdGFrZSB0aGUgdGlt
ZSB0byBmaW5kIHNvbWV0aGluZyAKPiBtb3JlIGNvbnNpc3RlbnQuCj4KPiBUaGFua3MgUGFsbWVy
LAo+Cj4KCkhpIFBhbG1lciwKCkkgaGF2ZSBqdXN0IHNlbnQgYW5vdGhlciBwYXRjaCByZWdhcmRp
bmcgdGhpcyBpc3N1ZSwgSSB0aGluayBib3RoIGFyZSAKbmVlZGVkLCBJIGRvbid0IGtub3cKaG93
IHlvdSB3YW50IG1lIHRvIHByb2NlZWQsIHNob3VsZCBJIG1lcmdlIHRoZW0sIHNob3VsZCBJIHJl
YmFzZSB0aGlzIApvbmUgb24gdG9wIG9mIHRoZSBuZXcKb25lIChvciB0aGUgY29udHJhcnkpLi4u
CgpUaGFua3MsCgpBbGV4Cgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
