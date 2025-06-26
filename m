Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CF1C7EE31
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5uHC08p4+UF1+Og+E2mGBuoP77nsv0cQmnGU9g3bNU=; b=iJb0NMrxJqEck6
	+sEvhfMa1DFykebQLEsUv2ou45dEQQHnepQ6LZKks8DtaucLnv6MJuHcTIToG+nQ1A7Lx2M2R+Gck
	9Pwf7IJ6FPb5khUnJRWE1cWacy3xIL/tPXFEIAo3rAGGBCxM+tm/GpN+mzbofjAr7e2r2SE7ncGNZ
	GMsK5DD0lsHM2l1H+9irBDS1QNnqf0S2ViJfhmKp4qOIeBQaC+nZJqFFULb/+Bv8L1iYtAjsaOsj/
	Wp1chOh/mbINxJrshKsS7YJA5Ba/QwQUnEJfRH6k62B8U1em2V8WSms4H3gsQNSHnjyCEsXhb3Zay
	7oMtSH5W4xCqxvQetBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUp6Z-0000000CDRq-1Doj;
	Thu, 26 Jun 2025 16:05:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoCh-0000000C3ab-3Z0Q
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Jun 2025 15:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kBC/1zbAsFpTgrTOlWvqmN/0W6sOeRbe2I8GaEuZn+U=; b=rN5U/UknVKo9wqqNaaCAEFxbtG
	921ZBrs8CnMweAIjiutwOpSV090ywab1uK78PRt1ds7HzUzjbODfv5TE8x9vujr2PF1PYNXpEhnTv
	Y0Cv6G3nJ/wWRHfkdcCQYhO4rH9qbuAANUjq9TNbXW6HFIKHTALEzUEG2byEcwupbfASUgJzFDDpT
	ccFP6+RmmDjKGU5MFMAQXhts4eEb5MXVp7+PMg12zuTKLGKKF82HRSd8SnpxsG1PcKBULWeT59V5Y
	BsX6XKdzxOEf9Hl+mLpElVH2bv42eBYprZmBsg9GXeO96eM19hq9g8xvkSYPVLHTAz1pk9sMvV/wL
	dSOt867g==;
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoCe-000000067fE-17Eo
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 15:07:54 +0000
Message-ID: <424599d3-9bd0-4cd5-9ad7-37cebdc765e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750950438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kBC/1zbAsFpTgrTOlWvqmN/0W6sOeRbe2I8GaEuZn+U=;
	b=rwXJthZvAow/TQ7NghrfNCplJc1HKGgRLL2BT/VCLAVS9iExHzIvFe76KM5Ym+drnT9iNK
	I7eq87HK3WMGi/9Y+aMJIQQOZ4EVrCIDZNQKaKIUbL0aGyMz4LGpRNYOOURq7W4o4CbUDK
	om962XvRHAyMXkvg+foBGCsYMvV/vvI=
Date: Thu, 26 Jun 2025 23:06:11 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: 21cnbao@gmail.com, akpm@linux-foundation.org,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com,
 Lance Yang <ioworker0@gmail.com>
References: <20250626092905.31305-1-ioworker0@gmail.com>
 <20250626124445.77865-1-ioworker0@gmail.com>
 <1a55f9f3-f5b1-4761-97ba-423756c707fe@redhat.com>
 <ce78181f-b8f0-4710-be22-eff123760a51@linux.dev>
 <6fbcf806-eb3c-4bcd-8daf-8d87fd759d2b@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <6fbcf806-eb3c-4bcd-8daf-8d87fd759d2b@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_160752_971002_FF92F045 
X-CRM114-Status: UNSURE (   8.40  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDI1LzYvMjYgMjI6MzksIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgpbLi4uXQo+Pj4+
IEBAIC0xODcwLDEyICsxODcwLDEzIEBAIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50Cj4+Pj4g
Zm9saW9fdW5tYXBfcHRlX2JhdGNoKHN0cnVjdCBmb2xpbyAqZm9saW8sCj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIDE7Cj4+Pj4gwqDCoMKgwqDCoMKgIC8qIC4uLiB3aGVyZSB3ZSBt
dXN0IGJlIGFibGUgdG8gYmF0Y2ggdGhlIHdob2xlIGZvbGlvLiAqLwo+Pj4KPj4+IFdoeSBpcyB0
aGF0IHN0aWxsIHJlcXVpcmVkPyA6KQo+Pgo+PiBTb3JyeSAuLi4gSSB3YXMgc3RpbGwgc3R1Y2sg
aW4gdGhlICJhbGwtb3Itbm90aGluZyIgbWluZHNldCAuLi4KPj4KPj4gU28sIElJVUMsIHlvdSBt
ZWFuIHdlIHNob3VsZCBjb21wbGV0ZWx5IHJlbW92ZSB0aGUgIm1heF9uciA8IG5yX3BhZ2VzIgo+
PiBjaGVjayBhbmQganVzdCBsZXQgZm9saW9fcHRlX2JhdGNoIGhhbmRsZSB3aGF0ZXZlciBwYXJ0
aWFsIGJhdGNoIGl0Cj4+IHNhZmVseSBjYW4uCj4+Cj4+Pgo+Pj4+IC3CoMKgwqAgaWYgKHB0ZV9w
Zm4ocHRlKSAhPSBmb2xpb19wZm4oZm9saW8pIHx8IG1heF9uciAhPQo+Pj4+IGZvbGlvX25yX3Bh
Z2VzKGZvbGlvKSkKPj4+PiArwqDCoMKgIGlmIChwdGVfcGZuKHB0ZSkgIT0gZm9saW9fcGZuKGZv
bGlvKSB8fCBtYXhfbnIgPCBucl9wYWdlcykKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm4gMTsKPj4+PiAtwqDCoMKgIG1heF9uciA9IGZvbGlvX3B0ZV9iYXRjaChmb2xpbywgYWRkciwg
cHZtdy0+cHRlLCBwdGUsIG1heF9uciwKPj4+PiBmcGJfZmxhZ3MsCj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5VTEwsIE5VTEwsIE5VTEwpOwo+Pj4+IC3CoMKgwqAgcmV0
dXJuIChtYXhfbnIgIT0gZm9saW9fbnJfcGFnZXMoZm9saW8pKSA/IDEgOiBtYXhfbnI7Cj4+Pj4g
K8KgwqDCoCBtYXhfbnIgPSBmb2xpb19wdGVfYmF0Y2goZm9saW8sIGFkZHIsIHB2bXctPnB0ZSwg
cHRlLCBucl9wYWdlcywKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnBi
X2ZsYWdzLCBOVUxMLCBOVUxMLCBOVUxMKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCByZXR1cm4gKG1h
eF9uciAhPSBucl9wYWdlcykgPyAxIDogbWF4X25yOwo+Pj4KPj4+IFdoeSBpcyB0aGF0IHN0aWxs
IHJlcXVpcmVkPyA6KQo+Pgo+PiBUaGVuIHNpbXBseSByZXR1cm4gdGhlIG51bWJlciBvZiBQVEVz
IHRoYXQgY29uc2VjdXRpdmVseSBtYXAgdG8gdGhlCj4+IGxhcmdlIGZvbGlvLiBSaWdodD8KPiAK
PiBZZXMuIEFueSBwYXJ0IG9mIHRoZSBsYXJnZSBmb2xpby4gSnVzdCByZXR1cm4gZm9saW9fcHRl
X2JhdGNoKCkgLi4uCj4gCgpBaCwgZ290IGl0LiBUaGFua3MhCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
