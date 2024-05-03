Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDB63C25B10
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 14:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TS3FVFn4t8dddK1fpY7uGtpEiZjYy08YehWTLS1qwM=; b=O/EnEzyR8j1WN2
	HDjRxgIP01DLLKyyxKUFPCIfMQ97ZwCAnv0T1BJPbl+brIew9d5l8kLrGYMkkey0R13Yk1YyLO6d3
	7wccErkE8a8eBB3cFa3o1PJLUDtV0tgSNwfob3j0W6dAAj7ni3F/V7x8NOi9yYAVoW5+fLbrN5LmE
	bjGVeD86W6lCukD/Q+nYlxGTE5uVHb3bQZyzzNrHByJegaJFQ5KV746xysw8gzV3LuIEWE4EwZGJ5
	MSgRpYwUpEE4rufXAsy2YkOruLdu+aSagOEvjh8Y5JbbDR7HtoD9Ozvzt1+L8b0syAOfovZW6gdch
	3utAtDVcUL3EQtHBCFSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tvm-0000000Grya-2zgD;
	Fri, 03 May 2024 14:30:34 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2tvj-0000000GrxK-0gbU
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 14:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YkLvbvGXUm01nkfrbDy3yckolxec9uJtymjr2A/6X7g=; b=XZxK2me0z2h/ITciGSZaGwelK+
	mdZyit0sucxhJNoOYx+6W2/dIlKvDbPJ6tDnGtgb197r6IbU9eQEacxfH0myWiWivbVeF/kEXHCNq
	Y2OjHjC1vrPnC0BSNZCE6xAIGeZOJRB6w3YrImpZvlRWQb0VX2AcVr4uqk8bYMR0SNafcQOxmeqEa
	mKL5N5qZPdHNdMM4pfj79EpOKZwpFb5KLdXu+hdGow36q4nwyzbcJbuDkxNqBLHKYkvX3f03l2dKr
	T0YnEsIdcjvo5bsunrh3wY6aym5vFmtzM/hGD7dU+ZO5alsOohnVZ+o4hiw83ALjbWonK1b9saWMZ
	4gIn/tpA==;
Received: from [167.98.27.226] (helo=[10.35.6.244])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1s2tvR-004QUo-J1; Fri, 03 May 2024 15:30:14 +0100
Message-ID: <4a04a462-3eab-4382-83b2-ce6ed7104883@codethink.co.uk>
Date: Fri, 3 May 2024 15:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: uaccess: Allow the last potential unrolled copy
Content-Language: en-GB
To: Alexandre Ghiti <alex@ghiti.fr>, Xiao Wang <xiao.w.wang@intel.com>,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: jerry.shih@sifive.com, nick.knight@sifive.com, ajones@ventanamicro.com,
 bjorn@rivosinc.com, andy.chiu@sifive.com, viro@zeniv.linux.org.uk,
 cleger@rivosinc.com, alexghiti@rivosinc.com, haicheng.li@intel.com,
 akira.tsukamoto@gmail.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240313103334.4036554-1-xiao.w.wang@intel.com>
 <7ebc5b28-7115-494f-a607-e46c71214cce@ghiti.fr>
 <4bc238eb-410b-46b1-98e1-4aaa35e34404@codethink.co.uk>
 <daa955d9-b554-4e0e-a08e-835c4cd5a366@ghiti.fr>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <daa955d9-b554-4e0e-a08e-835c4cd5a366@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_073031_340207_C77CB30D 
X-CRM114-Status: GOOD (  20.37  )
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

T24gMDMvMDUvMjAyNCAxNDowMiwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIEJlbiwKPiAK
PiBPbiAwMy8wNS8yMDI0IDE0OjE5LCBCZW4gRG9va3Mgd3JvdGU6Cj4+IE9uIDAzLzA1LzIwMjQg
MTM6MTYsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+IEhpIFhpYW8sCj4+Pgo+Pj4gT24gMTMv
MDMvMjAyNCAxMTozMywgWGlhbyBXYW5nIHdyb3RlOgo+Pj4+IFdoZW4gdGhlIGRzdCBidWZmZXIg
cG9pbnRlciBwb2ludHMgdG8gdGhlIGxhc3QgYWNjZXNzaWJsZSBhbGlnbmVkIAo+Pj4+IGFkZHIs
IHdlCj4+Pj4gY291bGQgc3RpbGwgcnVuIGFub3RoZXIgaXRlcmF0aW9uIG9mIHVucm9sbGVkIGNv
cHkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvIFdhbmcgPHhpYW8udy53YW5nQGludGVs
LmNvbT4KPj4+PiAtLS0KPj4+PiDCoCBhcmNoL3Jpc2N2L2xpYi91YWNjZXNzLlMgfCAyICstCj4+
Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4K
Pj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TIGIvYXJjaC9yaXNjdi9s
aWIvdWFjY2Vzcy5TCj4+Pj4gaW5kZXggMmU2NjVmOGY4ZmNjLi4xMzk5ZDc5N2Q4MWIgMTAwNjQ0
Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TCj4+Pj4gKysrIGIvYXJjaC9yaXNj
di9saWIvdWFjY2Vzcy5TCj4+Pj4gQEAgLTEwMyw3ICsxMDMsNyBAQCBTWU1fRlVOQ19TVEFSVChm
YWxsYmFja19zY2FsYXJfdXNlcmNvcHkpCj4+Pj4gwqDCoMKgwqDCoCBmaXh1cCBSRUdfU8KgwqAg
dDQswqAgNypTWlJFRyhhMCksIDEwZgo+Pj4+IMKgwqDCoMKgwqAgYWRkacKgwqDCoCBhMCwgYTAs
IDgqU1pSRUcKPj4+PiDCoMKgwqDCoMKgIGFkZGnCoMKgwqAgYTEsIGExLCA4KlNaUkVHCj4+Pj4g
LcKgwqDCoCBibHR1wqDCoMKgIGEwLCB0MCwgMmIKPj4+PiArwqDCoMKgIGJsZXXCoMKgwqAgYTAs
IHQwLCAyYgo+Pj4+IMKgwqDCoMKgwqAgYWRkacKgwqDCoCB0MCwgdDAsIDgqU1pSRUcgLyogcmV2
ZXJ0IHRvIG9yaWdpbmFsIHZhbHVlICovCj4+Pj4gwqDCoMKgwqDCoCBqwqDCoMKgIC5MYnl0ZV9j
b3B5X3RhaWwKPj4+Cj4+Pgo+Pj4gSSBhZ3JlZSBpdCBpcyBzdGlsbCBzYWZlIHRvIGNvbnRpbnVl
IGZvciBhbm90aGVyIHdvcmRfY29weSBoZXJlLgo+Pj4KPj4+IFJldmlld2VkLWJ5OiBBbGV4YW5k
cmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4+Cj4+IE91dCBvZiBpbnRlcmVzdCwg
aGFzIGFueW9uZSBjaGVja2VkIGlmIGNhdXNpbmcgYSBzY2hlZHVsZSBldmVudCBkdXJpbmcKPj4g
dGhpcyBjb2RlIGJyZWFrcyBsaWtlIHRoZSBsYXN0IHRpbWUgd2UgaGFkIGlzc3VlcyB3aXRoIHRo
ZSB1cHN0cmVhbQo+PiB0ZXN0aW5nPwo+IAo+IAo+IEkgdmFndWVseSByZW1lbWJlciBzb21ldGhp
bmcsIGRvIHlvdSBoYXZlIGEgbGluayB0byB0aGF0IGRpc2N1c3Npb24gYnkgCj4gY2hhbmNlPwo+
IAo+IAo+Pgo+PiBJIGRpZCBwcm9wb3NlIHNhdmluZyB0aGUgc3RhdGUgb2YgdGhlIHVzZXItYWNj
ZXNzIGZsYWcgaW4gdGhlIHRhc2sKPj4gc3RydWN0Cj4gCj4gCj4gTWFrZXMgc2Vuc2UsIEkganVz
dCB0b29rIGEgcXVpY2sgbG9vayBhbmQgU1JfU1VNIGlzIGNsZWFyZWQgYXMgc29vbiBhcyAKPiB3
ZSBlbnRlciBoYW5kbGVfZXhjZXB0aW9uKCkgYW5kIGl0IGRvZXMgbm90IHNlZW0gdG8gYmUgcmVz
dG9yZWQuIFdlaXJkIAo+IGl0IHdvcmtzLCB1bmxlc3MgSSBtaXNzZWQgc29tZXRoaW5nIQo+IAo+
IAo+PiBidXQgd2UgbW9zdGx5IHNvbHZlZCBpdCBieSBtYWtpbmcgc2xlZXBpbmcgZnVuY3Rpb25z
IHN0YXkKPj4gYXdheSBmcm9tIHRoZSBhZGRyZXNzIGNhbGN1bGF0aW9uLiBUaGlzIG9mIGNvdXJz
ZSBtYXkgaGF2ZSBiZWVuIGRvbmUKPj4gYWxyZWFkeSBvciBuZWVkIHRvIGJlIGRvbmUgaWYgdGhy
ZWUncyBsb25nIGFyZWFzIHdoZXJlIHRoZSB1c2VyLWFjY2Vzcwo+PiBmbGFncyBjYW4gYmUgZGlz
YWJsZWQgKGdlbmVyYWxseSBvbmx5IGEgZmV3IGRyaXZlcnMgZGlkIHRoaXMsIHNvIHdlCj4+IG1h
eSBub3QgaGF2ZSBjb21lIGFjcm9zcyB0aGUgcHJvYmxlbSkKPj4KPiBJIGRvbid0IHVuZGVyc3Rh
bmQgd2hhdCB5b3UgbWVhbiBoZXJlLCB3b3VsZCB5b3UgbWluZCBleHBhbmRpbmcgYSBiaXQ/Cj4g
CgpJIHRoaW5rIHRoaXMgd2FzIGFsbCBnb25lIHRocm91Z2ggaW4gdGhlIG9yaWdpbmFsIHBvc3Qg
d2hlcmUKd2UgaW5pdGlhbGx5IHN1Z2dlc3RlZCBzYXZpbmcgU1JfU1VNIGFuZCB0aGVuIG1vdmVk
IGFzIG11Y2ggb3V0Cm9mIHRoZSBjcml0aWNhbCBTUl9TVU0gYXJlYSBieSBjaGFuZ2luZyBob3cg
dGhlIG1hY3JvcyB3b3JrZWQKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIw
MjEwMzE4MTUxMDEwLjEwMDk2Ni0xLWJlbi5kb29rc0Bjb2RldGhpbmsuY28udWsvCgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIxMDMyOTA5NTc0OS45OTg5NDAtMS1iZW4u
ZG9va3NAY29kZXRoaW5rLmNvLnVrLwotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cuY29kZXRo
aW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5nIEdlbml1
cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
