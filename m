Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E9D3C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oc08BjBKWhKBy1jzQojHbkLb3LJ4DNwavD4pP70UoD4=; b=Hx2fJL5Hy/WzNC
	zdw6BSNH736SgvW8kuuF5M7b3Nai5WY9bA6uyHh1LsjAg9a7hAptaARMiCGrCs88ibchsx25YtZuW
	uMadOLudmV7psaqnYj6fQ66gaLICt/P7z+TRqz3Ux4wmvRQFlYvS+T3/o1RBc9L/ZKsJU4lIld1zf
	AQb7mAAaw++GLBTY0CxNRYyh5WbYRyH36Vaycd86Ld2m6lTLs/2Y6NggOSVE9OQeagUlEE5bgOgYQ
	JuHVNTHZt4jGzbMVWfzrQB+DZ8YDohUtvBS0DfP+/9EeKFVGvNiGbXatMx7646nBNOh4R6KEDETjT
	pI01oszmI91wZGGhRvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wP8-00000004pML-0gnk;
	Tue, 22 Sep 2026 09:03:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wP6-00000004pKz-1Mmj;
	Tue, 22 Sep 2026 09:03:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 16E0440C4A;
	Tue, 22 Sep 2026 09:03:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542831F000FF;
	Tue, 22 Sep 2026 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067788;
	bh=pHgvoHnJIwe3nC5S4OY8z28uWVR9gAOlu7YWol56jKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l+JOE4ryLKIP3w9q5Wm7pSG1JLgmDJMTih9bWxagWnLP0XhQLvugLdVxdO/i7BZ1b
	 uvX39GjRiLtbNCtIwl6kbzM07pHvNRM7sLWrfKdwu5cRDBDhhUW14JQEPxQgJCJcpo
	 zteqI1bXRF1+ErMo/W206HGKtuTl5xYGFoYzr8R+VyzOeETVbKARobUvCKiqV/1H5G
	 ZG2bS7BFom8VmX+m2cO+RlPZM8u/HRlPHtdDSKYxDCuUCo7GUN/ZasJtPMbhOvS5BW
	 mJMwC/BAeODqKEf4NJtp6Oe/JkjP/uh/PV3O0rpjhB5shaJzPxmBPBVxFXQ+Q6GbJt
	 r1KqQABQ7lA/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] crash_core: serialize crash header preparation
 against hotplug
To: m.szyprowski@samsung.com, "Wandun Chen" <chenwandun1@gmail.com>, baoquan.he@linux.dev, robh@kernel.org, rppt@kernel.org
Cc: devicetree@vger.kernel.org, ruirui.yang@linux.dev, linux-arm-kernel@lists.infradead.org, alex@ghiti.fr, pjw@kernel.org, tglx@kernel.org, aou@eecs.berkeley.edu, bp@alien8.de, hpa@zytor.com, akpm@linux-foundation.org, mingo@redhat.com, linux-kernel@vger.kernel.org, dave.hansen@linux.intel.com, saravanak@kernel.org, x86@kernel.org, will@kernel.org, kexec@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mm@kvack.org, chenhuacai@kernel.org, iommu@lists.linux.dev, mark.rutland@arm.com, loongarch@lists.linux.dev, robin.murphy@arm.com, kernel@xen0n.name, pratyush@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com, conor+dt@kernel.org, pasha.tatashin@soleen.com
In-Reply-To: <20260922084256.1515554-4-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-4-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 09:03:05 +0000
Message-Id: <20260922090306.542831F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPiAKPiBjcmFzaF9w
cmVwYXJlX2hlYWRlcnMoKSBjb3VudHMgbWVtb3J5IHJhbmdlcyBiZWZvcmUgcG9wdWxhdGluZyB0
aGUKPiBhbGxvY2F0ZWQgY3Jhc2hfbWVtIGFycmF5LiBUaGUgd2VhayBpbXBsZW1lbnRhdGlvbiB1
c2VkIGJ5IEFSTTY0LAo+IFJJU0MtViBhbmQgTG9vbmdBcmNoIHdhbGtzIG1lbWJsb2NrLm1lbW9y
eSwgd2hpbGUgeDg2IHBlcmZvcm1zIHRoZSBzYW1lCj4gdHdvLXBhc3Mgb3BlcmF0aW9uIG92ZXIg
c3lzdGVtIFJBTSByZXNvdXJjZXMuIENvbmN1cnJlbnQgbWVtb3J5IGhvdHBsdWcKPiBjYW4gY2hh
bmdlIHJhbmdlIHNvdXJjZSBiZXR3ZWVuIHRoZSB0d28gd2Fsa3MgYW5kIG1ha2UgdGhlIHBvcHVs
YXRlCj4gcGFzcyBvdmVyZmxvdyBjbWVtLT5yYW5nZXMuCj4gCj4gVGFrZSBkZXZpY2VfaG90cGx1
Z19sb2NrIHdoZW4gcHJlcGFyaW5nIGNyYXNoIGhlYWRlcnMgZHVyaW5nCj4ga2V4ZWNfZmlsZV9s
b2FkKCkuIFRoZSB4ODYgbWVtb3J5IGhvdHBsdWcgcGF0aCBhbHJlYWR5IHRha2VzCj4gZGV2aWNl
X2hvdHBsdWdfbG9jaywgc28gY2FsbCBfX2NyYXNoX3ByZXBhcmVfaGVhZGVycygpIGRpcmVjdGx5
Cj4gdG8gYXZvaWQgcmVjdXJzaXZlIGxvY2tpbmcuCj4gCj4gU2FzaGlrbyByZXBvcnRlZCB0aGlz
IGlzc3VlIGluIFsxXS4KPiAKPiBGaXhlczogMzc1MWU3MjhjZWYyICgiYXJtNjQ6IGtleGVjX2Zp
bGU6IGFkZCBjcmFzaCBkdW1wIHN1cHBvcnQiKQo+IEZpeGVzOiAxYmNjYTg2MjBhOTEgKCJMb29u
Z0FyY2g6IEFkZCBjcmFzaCBkdW1wIHN1cHBvcnQgZm9yIGtleGVjX2ZpbGUiKQo+IEZpeGVzOiA4
YWNlYTQ1NWZhZmEgKCJSSVNDLVY6IFN1cHBvcnQgZm9yIGtleGVjX2ZpbGUgb24gcGFuaWMiKQo+
IEZpeGVzOiBkZDVmNzI2MDc2Y2MgKCJrZXhlYzogc3VwcG9ydCBmb3Iga2V4ZWMgb24gcGFuaWMg
dXNpbmcgbmV3IHN5c3RlbSBjYWxsIikKPiBTaWduZWQtb2ZmLWJ5OiBXYW5kdW4gQ2hlbiA8Y2hl
bndhbmR1bkBsaXhpYW5nLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRoaXMgcGF0Y2ggYW5k
IGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlrbyBBSSByZXZpZXcg
wrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIyMDg0MjU2LjE1MTU1NTQt
MS1jaGVud2FuZHVuMUBnbWFpbC5jb20/cGFydD0zCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
