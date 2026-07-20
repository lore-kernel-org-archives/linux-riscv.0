Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA78C44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 19:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ivsyvfmy4ED3OfNaCE17nJ1lD5sHFve6eKxJyd5LvnE=; b=s0LGTFs6ua6esA
	DqcSRWNkG6/3WicMZLmLKgfXBcL/r+zmyaKoUZwbp2sncFAPa61tu/SDxjh6eSJfdB1A14RZoAMj3
	Es1ejqUSoAARsol1gzXQA4mMAgamhvjDnLMzGEhjO8c+ia5vhXmCOESgP8o/A51OoYWjOtBjYKfaW
	1OO8fJjg+eQomjXRo2/ovNrr7EbVv9lPIArPu+CLjxIzqadJMocVb9RA/YzDOUZaG651nB8iy1+qF
	yYBssGXKm4YRxyVle0l5yx8vgl+XknMj5vhsh1uu3R/DWDoPE9KHuiPUieoEBfnRc22CVXx5Bve4c
	z/QcGJPyA4B8Let12Fjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltqH-00000007mSA-1oqd;
	Mon, 20 Jul 2026 19:39:57 +0000
Received: from out-172.mta0.migadu.com ([2001:41d0:1004:224b::ac])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltqE-00000007mR6-416w
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 19:39:56 +0000
Message-ID: <e010eb53-2a7c-46e5-9049-0afc47b09a61@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784576381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/qp0qmX7/lG+2iV/7px+x4IwYJSrixYtqlMKjlDaa2k=;
	b=UEQylVYahUPHKpHwcBPg9WnwTJ4SqNhc1/GHwwewzeeQTWeJBDq8dQc33sgPNQ5xVM+gpZ
	rJOtWPzp/R8wroyp2kpT60GUb6BG9zG8ibFxKCiR1JzYty50EqpxtsmyOXaG2NLaOYuYQx
	jyRfm1vXIHd4Ko6tOlB2ZVX3pIu23H8=
Date: Mon, 20 Jul 2026 20:39:37 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC v3 2/6] riscv/mm: add untagged_addr_remote_unlocked()
To: Rik van Riel <riel@surriel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 kernel-team@meta.com, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
References: <20260720115741.239657-1-usama.arif@linux.dev>
 <13ec2603d5cbfdc493939f182b71e5133c26af54.camel@surriel.com>
 <46dc1b58-f2de-492a-9da5-a5c429c19a10@linux.dev>
 <51c0025d2eb885ff1f4775e4d9ffcf34f478f378.camel@surriel.com>
 <e9703d2e-f815-4d96-b5ce-074aba281f76@linux.dev>
 <f32b1d2d272e9eafaf0a68be236c84a0585a62e3.camel@surriel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <f32b1d2d272e9eafaf0a68be236c84a0585a62e3.camel@surriel.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_123955_154809_575E7C62 
X-CRM114-Status: GOOD (  25.42  )
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

CgpPbiAyMC8wNy8yMDI2IDIwOjIxLCBSaWsgdmFuIFJpZWwgd3JvdGU6Cj4gT24gTW9uLCAyMDI2
LTA3LTIwIGF0IDE5OjQ2ICswMTAwLCBVc2FtYSBBcmlmIHdyb3RlOgo+Pgo+PiBTbyBteSB1bmRl
cnN0YW5kaW5nIGZyb20gZXhwbG9yaW5nIHRoaXMgY29kZSBpcywgYW5kIGhvcGVmdWxseQo+PiBz
b21lb25lCj4+IGluIENDIGZyb20gcmlzY3YgY2FuIGNvcnJlY3QgbWUsIGZvciBleGFtcGxlOgo+
Pgo+PiBUYWdnZWQgcG9pbnRlcjrCoCAweGFiY2QwMDAwMTIzNDU2NzgKPj4gUE1MRU4gMTY6wqDC
oMKgwqDCoMKgwqAgMHgwMDAwMDAwMDEyMzQ1Njc4Cj4+IFBNTEVOIDc6wqDCoMKgwqDCoMKgwqDC
oCAweGZmY2QwMDAwMTIzNDU2NzgKPj4KPj4gVGhlIHRhcmdldCBWTUEgbWlnaHQgYmUgYXQgMHgx
MjM0NTY3OCwgYnV0IGFwcGx5aW5nIFBNTEVOIDcKPj4gdG8gdGhhdCB0YWdnZWQgcG9pbnRlciBk
b2VzIG5vdCBwcm9kdWNlIHRoYXQgYWRkcmVzcy4KPj4KPj4gUHJldmlvdXNseSwgdGhlIG9yZGVy
IHdhczoKPj4KPj4gVGFrZSBtbWFwIHJlYWQgbG9jay4KPj4gUmVhZCBwbWxlbi4KPj4gVW50YWcg
dGhlIGFkZHJlc3MuCj4+IExvb2sgdXAgdGhlIFZNQS4KPj4KPj4gQ2hhbmdpbmcgUE1MRU4gdGFr
ZXMgdGhlIG1tYXAgd3JpdGUgbG9jay4gVGhlIHJlYWQgYW5kIHdyaXRlCj4+IG9wZXJhdGlvbnMg
d2VyZSB0aGVyZWZvcmUgc2VyaWFsaXplZC4KPj4KPj4gVGhlIG5ldyBvcmRlciBpczoKPj4KPj4g
UmVhZCBwbWxlbiB3aXRob3V0IG1tYXAgbG9jay4KPj4gVW50YWcgdGhlIGFkZHJlc3MuCj4+IEF0
dGVtcHQgdGhlIHBlci1WTUEgbG9va3VwLgo+PiBQb3NzaWJseSB0YWtlIG1tYXAgbG9jayBsYXRl
ci4KPj4gQ29udGludWUgdXNpbmcgdGhlIGFscmVhZHktdW50YWdnZWQgYWRkcmVzcy4KPj4KPj4g
QSBjb25jdXJyZW50IFBNTEVOIGNoYW5nZSBjYW4gb2NjdXIgYmV0d2VlbiB0aG9zZSBvcGVyYXRp
b25zPwo+IAo+IEkgc3VwcG9zZSBpdCBjb3VsZCwgYnV0IHdoYXQgYXJlIHRoZSBwb3NzaWJsZSBv
dXRjb21lcyBoZXJlPwo+IAo+IC0gV2UgZmFpbCB0byB1bnRhZyB0aGUgYWRkcmVzcywgdGhlIHZt
YSBsb29rdXAKPiAgIGZhaWxzLCBhbmQgd2UgZmFpbCB0byBhY2Nlc3MgbWVtb3J5Lgo+IAo+IC0g
VGhlIGFkZHJlc3MgaXMgYWxyZWFkeSB1bnRhZ2dlZCwgbWFwcyB0byBhCj4gICBWTUEsIGFuZCB0
aGUgYWNjZXNzIHN1Y2NlZWRzLgo+IAo+IEFyZSB0aGVyZSBhbnkgb3RoZXJzPwo+IAo+IFRoZSBW
TUFzIG9mIHRoZSBwcm9jZXNzIG5lZWQgdG8gYmUgaW4gdGhlIGJvdHRvbQo+IHBhcnQgb2YgdGhl
IGFkZHJlc3Mgc3BhY2UsIHJpZ2h0PyBUaGUgcGFydCB3aGVyZQo+IHVudGFnZ2VkIGFkZHJlc3Nl
cyBzaXQuCj4gCj4gRm9yIHRoaW5ncyBsaWtlIC9wcm9jLzxwaWQ+L2NtZGxpbmUgd2Ugc2hvdWxk
Cj4gYXV0b21hdGljYWxseSBnZXQgYW4gYWRkcmVzcyB3aXRob3V0IGFueSBvZiB0aGUKPiBoaWdo
IGJpdHMgc2V0Lgo+IAo+IEZvciB0aGluZ3MgbGlrZSBwdHJhY2UgcGVlayAvIHBva2UsIEJQRiBw
cm9jZXNzCj4gYWNjZXNzZXMsIGFuZCBvdGhlcnMsIEkgcmVhbGx5IGRvIG5vdCBrbm93IGlmCj4g
dGhvc2UgY291bGQgZ2V0IHRhZ2dlZCBhZGRyZXNzZXMuLi4KPiAKPiBXaGF0IGFyZSB0aGUgZmFp
bHVyZXMgd2UgbmVlZCB0byBwcm90ZWN0IGFnYWluc3Q/Cj4gCj4gV2hhdCBpZiBzb21ldGhpbmcg
Y29tZXMgaW4gd2l0aCBhIHRhZ2dlZCBhZGRyZXNzLAo+IGJ1dCB0aGUgcHJvY2VzcyBkaXNhYmxl
cyB0YWdnaW5nIHdoaWxlIHRoYXQKPiBzb21ldGhpbmcgd2FpdHMgZm9yIHRoZSBtbWFwX2xvY2s/
CgpTbyBJIHRoaW5rIHRoZSBhYm92ZSBxdWVzdGlvbiBpcyB3aGF0IG5lZWRzIHRvIGJlCmFuc3dl
cmVkLgpBIHRhZ2dlZCBwb2ludGVyIGNhbiBiZWNvbWUgaW52YWxpZCBpZiBQTUxFTiBjaGFuZ2Vz
CmJlZm9yZSB0aGUgb2xkIG1tYXAtbG9ja2VkIGxvb2t1cCB0b28uClRoZSBtbWFwIGxvY2sgb25s
eSBkZWZpbmVkIHdoZXRoZXIgdGhlIGxvb2t1cCBvYnNlcnZlZAp0aGUgb2xkIG9yIG5ldyBtb2Rl
LgoKRm9yIFZNQSBhcyB5b3Ugc2FpZCwgaXQgc2hvdWxkIGJlIG9rLiBJIGRvbid0IGtub3cgYWJv
dXQKb3RoZXJzLiBJIHRoaW5rIGl0IHdvdWxkIGJlIGJlc3QgdG8gZ2V0IGlucHV0IGZyb20KUklT
Qy1WIGZvbGtzIGZvciB0aGlzLiBIb3BlZnVsbHkgaXRzIG9rLi4KSWYgaXQgaXMgb2ssIHRoZW4g
YWxsIHRoYXQgd291bGQgYmUgbmVlZCB0byBiZSBkb25lCmlzIHRvIGp1c3QgcmVtb3ZlIGluIHRo
ZSBjb21taXQgbWVzc2FnZSB0aGF0IHBtbGVuCmlzIHN0YWJsZS4KCj4gCj4gRG9lcyB0aGF0IHJl
cHJvZHVjZSB0aGUgZmFpbHVyZSBjYXNlLCB3aXRob3V0Cj4gYW55IGxvY2tpbmcgY2hhbmdlcz8K
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
