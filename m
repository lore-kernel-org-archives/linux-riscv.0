Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9F6C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 06:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UldMerGMYXxexwipJx7a9SoHsI+l79IYRU6TucMfQgI=; b=pbeW7c5jRcT1jd
	UQNYoM39iSnvuKj36ePuiPHRJf2vMWcO3jvZ6U8rEPkLDfFIVGgFeyT90Ag8Z7mNQEqxhqEH8rU/V
	7m0fnA0MV+0M2Bei4HWVxXnZuMnN4RrWdpj1eg+DEOWXwsLezNLcWlXbpem03/QFCwVgvH9vxinng
	hLKpXj2NQx+dZe5Ly8WTv0n59K52M9qZAs4orZs/Q03P90TrOUzQFd5F09lPr9GLwUMmL6kYvmmoq
	WigmUEASinuj/Pqb5c57v/KmbKUZxm6fRZdmLczkVBaOpQKbLuoM0/a9OOEx/OYJOmjFeu7rRa3mE
	FXhqfiWk69YPrzkKbEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2dQ-0000000DiEU-496c;
	Fri, 27 Jun 2025 06:32:28 +0000
Received: from out-182.mta1.migadu.com ([2001:41d0:203:375::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV2MO-0000000DgBQ-2hmY
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 06:14:54 +0000
Message-ID: <e33bbf93-ed78-4cbd-9ed7-1e36453549c0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751004880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIqr1G8w341JdjB67nlcBhtQ9EOdz3z9dERZmNVdkZk=;
	b=YfudznCYk3WoX9DBBDdaJTY5VlTsRNSRfpU+C/HCgg4VyCUC021HG0XVnTunKtN57mjv5I
	P9Md7kHGGVfC0XgIc8DZFDdo/bVJqb8S9fohOQPbyv4PUceTJBy2Cwl1fATsK446rJr5f1
	YBewEH6Gy68GWtDSCHkKRwOtL6+xozs=
Date: Fri, 27 Jun 2025 14:14:32 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support
 partial batches
Content-Language: en-US
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com,
 baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, huang.ying.caritas@gmail.com, zhengtangquan@oppo.com,
 riel@surriel.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 harry.yoo@oracle.com, mingzhe.yang@ly.com, Lance Yang <ioworker0@gmail.com>
References: <20250627025214.30887-1-lance.yang@linux.dev>
 <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
In-Reply-To: <CAGsJ_4yjvHzeUTDoALafLddTCTOSzYiFQNvAmSQORLJV1HPhPQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_231452_823306_AD1D085D 
X-CRM114-Status: GOOD (  12.16  )
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

CgpPbiAyMDI1LzYvMjcgMTM6MDIsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gT24gRnJpLCBKdW4gMjcs
IDIwMjUgYXQgMjo1M+KAr1BNIExhbmNlIFlhbmcgPGlvd29ya2VyMEBnbWFpbC5jb20+IHdyb3Rl
Ogo+Pgo+PiBGcm9tOiBMYW5jZSBZYW5nIDxsYW5jZS55YW5nQGxpbnV4LmRldj4KPj4KPj4gQXMg
cG9pbnRlZCBvdXQgYnkgRGF2aWRbMV0sIHRoZSBiYXRjaGVkIHVubWFwIGxvZ2ljIGluIHRyeV90
b191bm1hcF9vbmUoKQo+PiBjYW4gcmVhZCBwYXN0IHRoZSBlbmQgb2YgYSBQVEUgdGFibGUgaWYg
YSBsYXJnZSBmb2xpbyBpcyBtYXBwZWQgc3RhcnRpbmcgYXQKPj4gdGhlIGxhc3QgZW50cnkgb2Yg
dGhhdCB0YWJsZS4KPj4KPj4gU28gbGV0J3MgZml4IHRoZSBvdXQtb2YtYm91bmRzIHJlYWQgYnkg
cmVmYWN0b3JpbmcgdGhlIGxvZ2ljIGludG8gYSBuZXcKPj4gaGVscGVyLCBmb2xpb191bm1hcF9w
dGVfYmF0Y2goKS4KPj4KPj4gVGhlIG5ldyBoZWxwZXIgbm93IGNvcnJlY3RseSBjYWxjdWxhdGVz
IHRoZSBzYWZlIG51bWJlciBvZiBwYWdlcyB0byBzY2FuIGJ5Cj4+IGxpbWl0aW5nIHRoZSBvcGVy
YXRpb24gdG8gdGhlIGJvdW5kYXJpZXMgb2YgdGhlIGN1cnJlbnQgVk1BIGFuZCB0aGUgUFRFCj4+
IHRhYmxlLgo+Pgo+PiBJbiBhZGRpdGlvbiwgdGhlICJhbGwtb3Itbm90aGluZyIgYmF0Y2hpbmcg
cmVzdHJpY3Rpb24gaXMgcmVtb3ZlZCB0bwo+PiBzdXBwb3J0IHBhcnRpYWwgYmF0Y2hlcy4gVGhl
IHJlZmVyZW5jZSBjb3VudGluZyBpcyBhbHNvIGNsZWFuZWQgdXAgdG8gdXNlCj4+IGZvbGlvX3B1
dF9yZWZzKCkuCj4+Cj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS9hNjk0
Mzk4Yy05ZjAzLTQ3MzctODFiOS03ZTQ5Yzg1N2ZjYmVAcmVkaGF0LmNvbQo+Pgo+PiBGaXhlczog
MzU0ZGZmZDI5NTc1ICgibW06IHN1cHBvcnQgYmF0Y2hlZCB1bm1hcCBmb3IgbGF6eWZyZWUgbGFy
Z2UgZm9saW9zIGR1cmluZyByZWNsYW1hdGlvbiIpCj4+IFN1Z2dlc3RlZC1ieTogRGF2aWQgSGls
ZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Cj4+IFN1Z2dlc3RlZC1ieTogQmFycnkgU29uZyA8
YmFvaHVhQGtlcm5lbC5vcmc+Cj4+IFNpZ25lZC1vZmYtYnk6IExhbmNlIFlhbmcgPGxhbmNlLnlh
bmdAbGludXguZGV2Pgo+IAo+IEknZCBwcmVmZXIgY2hhbmdpbmcgdGhlIHN1YmplY3QgdG8gc29t
ZXRoaW5nIGxpa2UKPiAiRml4IHBvdGVudGlhbCBvdXQtb2YtYm91bmRzIHBhZ2UgdGFibGUgYWNj
ZXNzIGR1cmluZyBiYXRjaGVkIHVubWFwIgoKWWVwLCB0aGF0J3MgbXVjaCBiZXR0ZXIuCgo+IAo+
IFN1cHBvcnRpbmcgcGFydGlhbCBiYXRjaGluZyBpcyBhIGNsZWFudXAtcmVsYXRlZCBiZW5lZml0
IG9mIHRoaXMgZml4Lgo+IEl0J3Mgd29ydGggbWVudGlvbmluZyB0aGF0IHRoZSBhZmZlY3RlZCBj
YXNlcyBhcmUgcXVpdGUgcmFyZSwKPiBzaW5jZSBNQURWX0ZSRUUgdHlwaWNhbGx5IHBlcmZvcm1z
IHNwbGl0X2ZvbGlvKCkuCgpZZWFoLCBpdCB3b3VsZCBiZSBxdWl0ZSByYXJlIGluIHByYWN0aWNl
IDspCgo+IAo+IEFsc28sIHdlIG5lZWQgdG8gQ2Mgc3RhYmxlLgoKVGhhbmtzISBXaWxsIGRvLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
