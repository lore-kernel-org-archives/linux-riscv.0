Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D6ECA9EDE
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 15:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbURT3HkaoiniAJTAN0iAyT4b9vECb++NioPI45sj5Y=; b=oZ7venJ2McOiBa
	26mGTCPzIFJf9pCs6tiXDA8n/Cwd8mbzdEsWQIVJ53Y3bWDrVLdthcQOnpbWmqwcgMsl43G7mmuHK
	LhM4vd48gI3gdCtkomQcoukeFSMGUcbaI0OPj9gLQuvJ7n0QFfDQAgaAhZeCo1r5AaVzCuTCRl6+H
	ordrS8CWY3h8HMygE2xGeIyVJ7Cl6CTbuXiGl6B+8d1vTi9DD+jOjPKxvmKIC6e2mDPkumxasaSWN
	Calojzn2rz+IstiVixbFHoe/+yPLWAmwq4iIisaBBMgYb209K942r3u3kmQJ4AkD2Ztm46hbcLOz3
	e1k7ZbrR3OzRGmRhf+oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI0s-0000000AoP2-0IjP;
	Mon, 12 Oct 2026 15:32:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI0q-0000000AoON-1LCJ;
	Mon, 12 Oct 2026 15:32:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BDC2A6020F;
	Mon, 12 Oct 2026 15:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932731F0089C;
	Mon, 12 Oct 2026 15:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819147;
	bh=9RalS/cTcqwsvzfIqCagLYWCk6dkc4dqFyKF+MlULZ8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=BLfowVUDFCXLcBE+jUBEJcCE17njSGG/cEAXjI9SvlCmRgJ0RrMUebOvIcBAL22BB
	 A5D1Ri6caBnDzMOyvw37AhfMKib7RzMuriZqCSELM5q15v3sxBzfQ8n7TqBMg1MALg
	 f3P+U+A9SBVHtbrlZkYfADTjPQJMACeNex5p7EwJsb/Q6fyY5ByM1kTOML9DLEjduS
	 vg1xLLhUq2LLv9TqJQ7596pdNj928fQNhattCPpvQEci98nbFuNBOI20aOTmMGRjbI
	 iabjxCy/wtzovR4naUlpBT1NouVwoL8cfFW609Er4QIxLWEecFqpPCxGaIiRJ9emGT
	 3iz/OYxGy2RzQ==
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
Subject: Re: [PATCH v2 2/4] riscv/mm: fix hotplug page-table destructor
 handling
In-Reply-To: <20261010112457.49485-3-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-3-songmuchun@bytedance.com>
Date: Mon, 12 Oct 2026 17:32:15 +0200
Message-ID: <87ik37aq9s.fsf@all.your.base.are.belong.to.us>
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

TXVjaHVuIFNvbmcgPHNvbmdtdWNodW5AYnl0ZWRhbmNlLmNvbT4gd3JpdGVzOgoKPiBSSVNDLVYg
dXNlcyB0aGUgc2FtZSBtZW1vcnktaG90cGx1ZyB0ZWFyZG93biBjb2RlIGZvciBsaW5lYXItbWFw
IGFuZAo+IHZtZW1tYXAgcGFnZSB0YWJsZXMuIExhdGUgbGluZWFyLW1hcCBhbGxvY2F0aW9ucyBy
dW4gcGFnZS10YWJsZQo+IGNvbnN0cnVjdG9ycywgd2hpbGUgdm1lbW1hcCBhbmQgZWFybHkgYWxs
b2NhdGlvbnMgbWF5IG5vdC4KPgo+IGZyZWVfcHRlX3RhYmxlKCkgdW5jb25kaXRpb25hbGx5IGNh
bGxzIHBhZ2V0YWJsZV9kdG9yKCksIGNvcnJ1cHRpbmcKPiBOUl9QQUdFVEFCTEUgYWNjb3VudGlu
ZyBmb3IgY29uc3RydWN0b3ItZnJlZSB0YWJsZXMuIGZyZWVfcG1kX3RhYmxlKCkKPiBhdm9pZHMg
dGhhdCBmb3Igdm1lbW1hcCB1c2luZyBpc192bWVtbWFwLCBidXQgbWFwcGluZyB0eXBlIGlzIG5v
dCBhCj4gcmVsaWFibGUgcHJveHkgZm9yIGNvbnN0cnVjdG9yIHN0YXRlLiBJbiBwYXJ0aWN1bGFy
LCBpdCBiZWNvbWVzIGludmFsaWQKPiBvbmNlIHJ1bnRpbWUgdm1lbW1hcCB0YWJsZXMgdXNlIHRo
ZSBub3JtYWwgcGdhbGxvYyBoZWxwZXJzLgo+Cj4gSW50cm9kdWNlIGZyZWVfcGd0YWJsZV9wYWdl
KCkgdG8gc2VsZWN0IGZyZWVfcmVzZXJ2ZWRfcGFnZSgpIGZvciByZXNlcnZlZAo+IHBhZ2VzIGFu
ZCBwYWdldGFibGVfZnJlZSgpIG90aGVyd2lzZS4gVGhlIGxhdHRlciBydW5zIHRoZSBkZXN0cnVj
dG9yIG9ubHkKPiB3aGVuIFBhZ2VUYWJsZSgpIGlzIHNldCwgaGFuZGxpbmcgYm90aCBjb25zdHJ1
Y3Rvci1iYWNrZWQgYW5kCj4gY29uc3RydWN0b3ItZnJlZSB0YWJsZXMuCj4KPiBGaXhlczogYzc1
YTc0ZjRiYTE5ICgicmlzY3Y6IG1tOiBBZGQgbWVtb3J5IGhvdHBsdWdnaW5nIHN1cHBvcnQiKQo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IExMTQo+IFNpZ25lZC1v
ZmYtYnk6IE11Y2h1biBTb25nIDxzb25nbXVjaHVuQGJ5dGVkYW5jZS5jb20+CgpOaWNlIQoKUmV2
aWV3ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
