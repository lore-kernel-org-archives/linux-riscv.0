Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0842CC77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 01:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+FNCKjxN5V6LHEkRhm9BHVC29ClGl/ZEd0XeLxVu124=; b=eIYIDTx/J8GE4y
	g8J4SOxkSzGtpW+NY3ySOzRPBMaHeo82o0QnRKIqgHiDp7ocmddSPCpwdg2ziLBjCykSdwICvpqTt
	crXtPyxp8T2qA1fB82RnrOCsNUqfqH8uZKxj100jF3BrAL+rQbRjzEbe6HJxSLGJbYnhy02hiPpba
	ooq83Z6Mmjw200NmtzdoSLTk2wCgdgdrcTOoG3RdeGFPNpL0a4eODibiEGHYjeq1+48KCebTgMe6P
	2Ggz88nSGPuLpCFabNyJeBlO8UxkZ0FaANb6dht0hOABbCuk7wcYb7azglfachLXFL9tog4pbUAj4
	hzu8zRvPfsw06rZ82u5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbFP-0000000AO5J-2oqU;
	Thu, 26 Jun 2025 01:17:51 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUbFM-0000000AO4t-480K
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 01:17:50 +0000
Message-ID: <42343413-7089-404e-8ce0-dd0025dca04c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750900666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/mKaCqAOOiAqgd0HRwof3OK6yOq5hDWh6JBXZFbX3c=;
	b=eQC/N5AQvanuC7OqZCZ2wPmyrZ0ioxCa9JUW83LYLMRJAjmHovEfQEFsrT0ybVpqok1KVf
	W8sl6sksNaJU2UyrQqwdsCkZ9XZzcI0M91ODFaE5+ns5n8ksfSxI1liRF/El6i+kpXAUkV
	hSNMrXxp+B00xFNqxmEmvAlnPyxAvY8=
Date: Thu, 26 Jun 2025 09:17:33 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>, David Hildenbrand <david@redhat.com>
Cc: akpm@linux-foundation.org, baolin.wang@linux.alibaba.com,
 chrisl@kernel.org, kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, lorenzo.stoakes@oracle.com,
 ryan.roberts@arm.com, v-songbaohua@oppo.com, x86@kernel.org,
 ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com>
 <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev>
 <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
 <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
 <6179dd30-5351-4a79-b0d6-f0e85650a926@redhat.com>
 <CAGsJ_4yTH5ngM++e=c+P7g0fXs-QQsOk2oxd1RWa3Qww97Knrw@mail.gmail.com>
 <5db6fb4c-079d-4237-80b3-637565457f39@redhat.com>
 <42f1d84f-2d17-43b7-8fa2-83322fcca44f@linux.dev>
 <9bb1e917-891d-4e1b-915f-98cdd5fc578b@redhat.com>
 <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4woYd_TmZU94nedH=x_+HTwLxz94ih1jFmxoj4CxuhqzQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_181749_229625_A4F613F1 
X-CRM114-Status: GOOD (  11.64  )
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

CgpPbiAyMDI1LzYvMjYgMDU6MDMsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gVGh1LCBKdW4gMjYs
IDIwMjUgYXQgMTI6MjXigK9BTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4+Cj4+IE9uIDI1LjA2LjI1IDE0OjIwLCBMYW5jZSBZYW5nIHdyb3RlOgo+IFsuLi5d
Cj4+PiBIbW0uLi4gSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhlIHJlZmVyZW5jZSBjb3VudGlu
ZyBoZXJlIC4uLgo+Pj4KPj4+ICAgICAgICAgICAgICAgIGlmICh2bWEtPnZtX2ZsYWdzICYgVk1f
TE9DS0VEKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBtbG9ja19kcmFpbl9sb2NhbCgpOwo+
Pj4gICAgICAgICAgICAgICAgZm9saW9fcHV0KGZvbGlvKTsKPj4+ICAgICAgICAgICAgICAgIC8q
IFdlIGhhdmUgYWxyZWFkeSBiYXRjaGVkIHRoZSBlbnRpcmUgZm9saW8gKi8KPj4+Cj4+PiBEb2Vz
IGFueW9uZSBlbHNlIHN0aWxsIGhvbGQgYSByZWZlcmVuY2UgdG8gdGhpcyBmb2xpbyBhZnRlciBm
b2xpb19wdXQoKT8KPj4KPj4gVGhlIGNhbGxlciBvZiB0aGUgdW5tYXAgb3BlcmF0aW9uIHNob3Vs
ZCBiZXR0ZXIgaG9sZCBhIHJlZmVyZW5jZSA6KQo+Pgo+PiBBbHNvLCBJIGFtIG5vdCBzdXJlIHdo
eSB3ZSBkb24ndCBwZXJmb3JtIGEKPj4KPj4gZm9saW9fcHV0X3JlZnMoZm9saW8sIG5yX3BhZ2Vz
KTsKPiAKPiBCZWNhdXNlIHdlJ3ZlIGFscmVhZHkgY2FsbGVkIGZvbGlvX3JlZl9zdWIoZm9saW8s
IG5yX3BhZ2VzIC0gMSk7Cj4gTG9va2luZyBiYWNrLCBpdOKAmXMga2luZCBvZiB1Z2x5LCBodWgu
Cj4gCj4gZGlzY2FyZDoKPiAgICAgICAgICAgICAgICAgIGlmICh1bmxpa2VseShmb2xpb190ZXN0
X2h1Z2V0bGIoZm9saW8pKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgICBodWdldGxiX3Jl
bW92ZV9ybWFwKGZvbGlvKTsKPiAgICAgICAgICAgICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgIGZvbGlvX3JlbW92ZV9ybWFwX3B0ZXMoZm9saW8sIHN1YnBhZ2UsIG5y
X3BhZ2VzLCB2bWEpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICBmb2xpb19yZWZfc3ViKGZv
bGlvLCBucl9wYWdlcyAtIDEpOwo+ICAgICAgICAgICAgICAgICAgfQo+IAo+IEkgYXNzdW1lIExh
bmNlIHdpbGwgc2VuZCBhIHBhdGNoPyBJZiBzbywgcmVtZW1iZXIgdG8gcmVtb3ZlIHRoaXMKPiB3
aGVuIHN3aXRjaGluZyB0byBmb2xpb19wdXRfcmVmcyhmb2xpbywgbnJfcGFnZXMpOwoKQWgsIGdv
dCBpdC4gVGhhbmtzIGZvciBwb2ludGluZyB0aGF0IG91dCEKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
