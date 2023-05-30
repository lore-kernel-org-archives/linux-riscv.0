Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BEEC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 06:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6SxTp1XjaR5A8uhiUH2/fwkMP+I6wQrqU2vC9GJ9qE4=; b=ihrvQ2yF8dZ6sg
	CRXPO73He4KkIJFHexTgLrMEsIFRK9l+U+N4PD277m2cSV3f4/WqgQ/lvP2CBbD85cicy7vnsmtFG
	kibf5Bw0lkSg35qGqk9FMum6Ou2qOi8N0/aL1rBITiFSZlkaBlnOXWe2krAdnrBFeU8g/woclqZcd
	v0/B9zZRG+5v3RQY54CPd8lRa+FIfelHf/+lsJYP6XxPsQWrkxjAi45diemmRioxgE8mfUCHfSUYC
	OpB4Cy6wEKm/B2XA0LsHDUPiYvB5eZoq4uigom2rbXLK/0WkjAaBSA1gltXePUxRMLy8hRpgpOAmc
	lis8K2b+XkFZYVNUK6AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3syx-00Cab4-1H;
	Tue, 30 May 2023 06:37:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3syv-00Caab-0m
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 06:37:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C05F262940;
	Tue, 30 May 2023 06:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C60C433EF;
	Tue, 30 May 2023 06:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685428640;
	bh=SsEFykTTr1Y+kZYyRqrdoefiJQaCTMcgpE7uD+V55Ow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OWDqbvWlIm7OcMQaGlT+EtXnC54BfSzGWgOzgp5j/7ydS/dewMezjQOwRKCHPIOHe
	 TL051HGjO/RDOZjAL0Y+hLp1zKulj0+SdesJUstAg7+V1AYaACvbwkWZOFwyOLoquG
	 awMoPUgNJ8SVHbU98ceJNJxa+JjwbY8tOzQtF2AMzz0d8qRkmgx9DpmFFTa3dZ5zl1
	 zp0pnAAu8cf8xuN/gn/mMGXQo3SsfxZT5anmzHl+FPItlPFjQv/g+hIRFpHqmMMIDZ
	 ykHwy9qcqwBUlDwGHk7LUvgSux9HeyHuTv2yp/sv4ee1+ADOPUQeky9Us0pLZNu0XU
	 NMy7pb6+v+YLA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux@rivosinc.com, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] riscv: mm: Pre-allocate PGD entries vmalloc/modules area
In-Reply-To: <20230529180023.289904-1-bjorn@kernel.org>
References: <20230529180023.289904-1-bjorn@kernel.org>
Date: Tue, 30 May 2023 08:37:17 +0200
Message-ID: <871qiyfhpe.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_233721_318854_D024F726 
X-CRM114-Status: GOOD (  13.89  )
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

QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgoKPiBGcm9tOiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4KPiBUaGUgUklTQy1WIHBvcnQgcmVxdWlyZXMg
dGhhdCBrZXJuZWwgUEdEIGVudHJpZXMgYXJlIHRvIGJlCj4gc3luY2hyb25pemVkIGJldHdlZW4g
TU1zLiBUaGlzIGlzIGRvbmUgdmlhIHRoZSB2bWFsbG9jX2ZhdWx0KCkKPiBmdW5jdGlvbiwgdGhh
dCBzaW1wbHkgY29waWVzIHRoZSBQR0QgZW50cmllcyBmcm9tIGluaXRfbW0gdG8gdGhlCj4gZmF1
bHRpbmcgb25lLgo+Cj4gSGlzdG9yaWNhbGx5LCBmYXVsdGluZyBpbiBQR0QgZW50cmllcyBoYXZl
IGJlZW4gYSBzb3VyY2UgZm9yIGJvdGggYnVncwo+IFsxXSwgYW5kIHBvb3IgcGVyZm9ybWFuY2Uu
Cj4KPiBPbmUgd2F5IHRvIGdldCByaWQgb2Ygdm1hbGxvYyBmYXVsdHMgaXMgYnkgcHJlLWFsbG9j
YXRpbmcgdGhlIFBHRAo+IGVudHJpZXMuIFByZS1hbGxvY2F0aW5nIHRoZSBlbnRyaWVzIHBvdGll
bnRpYWxseSB3YXN0ZXMgNjQgKiA0SyAoNjUgb24KPiBTVjM5KS4gVGhlIHByZS1hbGxvY2F0aW9u
IGZ1bmN0aW9uIGlzIHB1bGxlZCBmcm9tIErDtnJnIFLDtmRlbCdzIHg4Ngo+IHdvcmssIHdpdGgg
dGhlIGFkZGl0aW9uIG9mIDMtbGV2ZWwgcGFnZSB0YWJsZXMgKFBNRCBhbGxvY2F0aW9ucykuCj4K
PiBUaGUgcG1kX2FsbG9jKCkgZnVuY3Rpb24gbmVlZHMgdGhlIHB0bG9jayBjYWNoZSB0byBiZSBp
bml0aWFsaXplZAo+ICh3aGVuIHNwbGl0IHBhZ2UgbG9ja3MgaXMgZW5hYmxlZCksIHNvIHRoZSBw
cmUtYWxsb2NhdGlvbiBpcyBkb25lIGluIGEKPiBSSVNDLVYgc3BlY2lmaWMgcGd0YWJsZV9jYWNo
ZV9pbml0KCkgaW1wbGVtZW50YXRpb24uCj4KPiBQcmUtYWxsb2NhdGUgdGhlIGtlcm5lbCBQR0Qg
ZW50cmllcyBmb3IgdGhlIHZtYWxsb2MvbW9kdWxlcyBhcmVhLCBidXQKPiBvbmx5IGZvciA2NGIg
cGxhdGZvcm1zLgo+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDUw
ODE0NDA0My4xMzg5My0xLWpvcm9AOGJ5dGVzLm9yZy8gIyBbMV0KPiBTaWduZWQtb2ZmLWJ5OiBC
asO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+CgouLi5hbmQgdGhlIGJ1aWxkIHdhcyBi
aXR0ZW4gYnkgbm9tbXUgWzFdLiBJJ2xsIGhvbGQgb2ZmIHRoZSB2MiBhIGJpdCwgdG8Kc2VlIGlm
IHRoZXJlJ3MgYW55IG90aGVyIGNvbW1lbnRzLgoKCkJqw7ZybgoKWzFdIGh0dHBzOi8vcGF0Y2h3
b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9wYXRjaC8yMDIzMDUyOTE4MDAyMy4y
ODk5MDQtMS1iam9ybkBrZXJuZWwub3JnLwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
