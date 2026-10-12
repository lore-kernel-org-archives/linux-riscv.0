Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92A0CA9EC5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krUJosdBqpZVWECh6CMVNtRC46cRLsI0H6oduTMThdE=; b=wENxJ1uiXvESxC
	YERqZkxAPoRBJd/Y6JirXBOmEhyfCmc3BLDcwwX0ZkR5gpPZWbyelMYSIAyRDOCpRUQ7Bnl6BCRD/
	Ao6D6CdjWFASngJx4c45ia3saBZj3Ge5ynOvECEWWjJXqXBGiskUFqie/c/BEZuOj8iea5fp5eOYU
	5dRQZdqSEtUwBZqyaaQFQHnjyG4CJqC4GZwpDXpojYxF2e3Cya9MpEXOcE8Z0B78Du3YNQB1AmxrQ
	SenyqpfQLUVqENvxzEbVq6NemzsyHKaF4OTLQJr6ZCJltNudww9IdPKxjQevfgOynUiGYTHpl858+
	qP8+pbT6puNohhra6Saw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI4H-0000000Aox4-2EaC;
	Mon, 12 Oct 2026 15:36:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI4E-0000000AowG-0DwG;
	Mon, 12 Oct 2026 15:35:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 28D0B6020F;
	Mon, 12 Oct 2026 15:35:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4809D1F0089B;
	Mon, 12 Oct 2026 15:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819356;
	bh=3NlCppqlh9IN+OUBU1U01H7S97jTJiDfAUXtzFgU1ic=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fDeKJRIQoUWqxjV7n4Ky9J09n+IIRHAAi7VsV3lDRQxJgy0ajNzavSe2IJZmQo8C+
	 RFQGyiEnACBiv5JFmeVZTOsdi3v30Gj4yk94TzBtLIIO8a3K+zzt3e2kYb/MpOqpsN
	 S/+jNKrosp68mtox8Fy1xkpF6qC5OhaodQPuyRKoiXo40wqvP6dkzgXSUl3tGh6DUW
	 fnVEzWB+2DotZlfr0oTJcLRUG8dNtWoNaCE2loO2fTGN+IDvS2QOpYPUOxhhMsPF3O
	 bMByXt7/Tkqi/81h6Ol/avfWmWeC0EoLgSqd26mtPqr6YaHXb00BhQkpkPtrGZfDyn
	 ba5o9eQotuKzg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador
 <osalvador@suse.de>, Dave Hansen <dave.hansen@intel.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?B?Qmo=?=
 =?utf-8?B?w7ZybiBUw7ZwZWw=?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin
 Brodsky <kevin.brodsky@arm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Alistair Popple <apopple@nvidia.com>,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, Muchun Song
 <songmuchun@bytedance.com>
Subject: Re: [PATCH v2 3/4] riscv/mm: fix missing destructor for hotplug PUD
 tables
In-Reply-To: <20261010112457.49485-4-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-4-songmuchun@bytedance.com>
Date: Mon, 12 Oct 2026 17:35:53 +0200
Message-ID: <87a4ojaq3q.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
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

TXVjaHVuIFNvbmcgPHNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbT4gd3JpdGVzOgoKPiBDb21taXQg
ODQ3MmNjNDUwM2ViICgicmlzY3Y6IG1tOiBjYWxsIFBVRC9QNEQgY3RvciBpbiBzcGVjaWFsIGtl
cm5lbAo+IHBndGFibGUgYWxsb2MiKSBtYWRlIGFsbG9jX3B1ZF9sYXRlKCkgcnVuIHRoZSBQVUQg
cGFnZS10YWJsZSBjb25zdHJ1Y3Rvci4KPiBIb3dldmVyLCBmcmVlX3B1ZF90YWJsZSgpIHN0aWxs
IGZyZWVzIG5vbi1yZXNlcnZlZCBQVUQgdGFibGVzIGRpcmVjdGx5Cj4gd2l0aG91dCBkZWNyZW1l
bnRpbmcgTlJfUEFHRVRBQkxFLgo+Cj4gRnJlZSBQVUQgdGFibGVzIHRocm91Z2ggdGhlIGNvbW1v
biBmcmVlX3BndGFibGVfcGFnZSgpIGhlbHBlciBzbyB0aGF0Cj4gY29uc3RydWN0b3ItYmFja2Vk
IHRhYmxlcyBydW4gdGhlIG1hdGNoaW5nIGRlc3RydWN0b3IgYmVmb3JlIGJlaW5nCj4gZnJlZWQu
Cj4KPiBGaXhlczogODQ3MmNjNDUwM2ViICgicmlzY3Y6IG1tOiBjYWxsIFBVRC9QNEQgY3RvciBp
biBzcGVjaWFsIGtlcm5lbCBwZ3RhYmxlIGFsbG9jIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwo+IEFzc2lzdGVkLWJ5OiBMTE0KPiBTaWduZWQtb2ZmLWJ5OiBNdWNodW4gU29uZyA8c29u
Z211Y2h1bkBieXRlZGFuY2UuY29tPgo+IEFja2VkLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCAoQXJt
KSA8ZGF2aWRAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
