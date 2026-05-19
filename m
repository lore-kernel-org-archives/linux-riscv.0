Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE7CD5BAB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JSHtXtw/FgGFqEWtWV16ZngMhG3HYAHg5pl7q5u4s4=; b=KjSJopmPMTncQt
	71cXpWL797jWdn0lTORKbv4QwhWIQyh3jBP7guC8OAyY7AGi9liDGld5EnL2THzBxcl5JnMyVLhNr
	nNwqIe6L4pXS0uU3kYK4x0jXXVXYkwAn9XvxUc1PGOETjUFMA2Noik009SVOwt7zTYlQ1whZ6D90n
	olP5PPPqjcyDEt+d00DohIE98DXMHJwVYWoyDK/l8yq+R8jNSc644WGechZOh089LjorNn1Hg6Yo8
	rgeGln3NhFyB6iAtjSL7HYvGGRfCRhsIJ4GLavOXvFXMx5bf1dah6ydRa8Qgkm2nonVzxdLRgdt7s
	FoTCHs6Ob46P3hbDYg+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKiH-00000001hVQ-12zp;
	Tue, 19 May 2026 13:42:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKiE-00000001hUN-3d0g;
	Tue, 19 May 2026 13:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 332C041984;
	Tue, 19 May 2026 13:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DB5C2BCB3;
	Tue, 19 May 2026 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779198142;
	bh=EdZVTx8mq/+o6OdrLkwiHGmu7Bazb8bJvDYV4PghBGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CxN08qtpOBJ8IAiYT1NGbATSMveN2VuvCz+XRydDhhXI+x5QqjrTyhe5UIS691Kb2
	 bS9w1ztocYeYGUfpqcashfOVc/Pb/0rjFRC4zdEfjCwigY5cmMMgpzI1gKRdtA3pI4
	 v/VV+NqUVSeovPsja64sp9wWP72hVhslEn03pxycaef5UGhc7dYBhy2FZ2/Av0j3h0
	 1dh5UBOVeGESCRqbxSUbKDq9gTnfNXjfMTy6NPbKLtEkxHtIHeWDfR+iPX1ZvW7L/h
	 LBrO+E3xuhU/cNw3kbOQoavYiADtcJMriOizeGdr3j5sT3HlIxKigegez3GS/kKTHd
	 Rpyd30xJMvmFw==
Date: Tue, 19 May 2026 14:42:11 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	surenb@google.com, akpm@linux-foundation.org, linux-mm@kvack.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <agxok1UzYWhLu06G@lucifer>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <b65722ee-6476-4038-bfbb-44a32b3544fd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b65722ee-6476-4038-bfbb-44a32b3544fd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_064222_954355_6E81DB77 
X-CRM114-Status: GOOD (  35.17  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTE6NTM6MzdBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJh
bmQgKEFybSkgd3JvdGU6Cj4gT24gNS8xNy8yNiAxMDo0NSwgQmFycnkgU29uZyB3cm90ZToKPiA+
IE9uIFNhdCwgTWF5IDIsIDIwMjYgYXQgMTo1OOKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPiA+Pgo+ID4+IE9uIFNhdCwgTWF5IDAyLCAyMDI2IGF0IDAx
OjQ0OjM0QU0gKzA4MDAsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gPj4+Cj4gPj4+IEl0IGRvZXNu4oCZ
dCBoYXZlIHRvIGludm9sdmUgdW5tYXBwaW5nIG9yIGFwcGx5aW5nIG1wcm90ZWN0IHRvCj4gPj4+
IHRoZSBlbnRpcmUgVk1B4oCUanVzdCBhIHBvcnRpb24gb2YgaXQgaXMgc3VmZmljaWVudC4KPiA+
Pgo+ID4+IFllcywgYnV0IHRoYXQgc3RpbGwgZmFpbHMgdG8gYW5zd2VyICJkb2VzIHRoaXMgYWN0
dWFsbHkgaGFwcGVuIi4gIEhvdyBtdWNoCj4gPj4gcGVyZm9ybWFuY2UgaXMgYWxsIHRoaXMgY29t
cGxleGl0eSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyIGJ1eWluZyB1cz8KPiA+PiBJZiB5b3Ug
ZG9uJ3QgYW5zd2VyIHRoaXMgcXVlc3Rpb24sIEknbSBqdXN0IGdvaW5nIHRvIGdvIGluIGFuZCBy
aXAgaXQKPiA+PiBhbGwgb3V0Lgo+ID4+Cj4gPgo+ID4gSGkgTWF0dGhldyAoYW5kIExvcmVuem8s
IEphbiwgYW5kIGFueW9uZSBlbHNlIHdobyBtYXkgYmUKPiA+IHdhaXRpbmcgZm9yIGFuc3dlcnMp
LAo+ID4KPiA+IEFzIHByb21pc2VkIGR1cmluZyBMU0YvTU0vQlBGLCB3ZSBjb25kdWN0ZWQgdGhv
cm91Z2gKPiA+IHRlc3Rpbmcgb24gQW5kcm9pZCBwaG9uZXMgdG8gZGV0ZXJtaW5lIHdoZXRoZXIg
cGVyZm9ybWluZwo+ID4gSS9PIGluIGBmaWxlbWFwX2ZhdWx0KClgIGNhbiBibG9jayBgdm1hX3N0
YXJ0X3dyaXRlKClgLgo+ID4gSSB3YW50ZWQgdG8gZ2l2ZSBhIHF1aWNrIHVwZGF0ZSBvbiB0aGlz
IHF1ZXN0aW9uLgo+ID4KPiA+IE5hbnpoZSBhdCBYaWFvbWkgY3JlYXRlZCB0cmFjaW5nIHNjcmlw
dHMgYW5kIHJhbiB2YXJpb3VzCj4gPiBhcHBsaWNhdGlvbnMgb24gQW5kcm9pZCBkZXZpY2VzIHdp
dGggSS9PIHBlcmZvcm1lZCB1bmRlcgo+ID4gdGhlIFZNQSBsb2NrIGluIGBmaWxlbWFwX2ZhdWx0
KClgLiBXZSBmb3VuZCB0aGF0Ogo+ID4KPiA+IDEuIFRoZXJlIGFyZSB2ZXJ5IGZldyBjYXNlcyB3
aGVyZSB1bm1hcCgpIGlzIGJsb2NrZWQgYnkKPiA+ICAgIHBhZ2UgZmF1bHRzLiBJIGFzc3VtZSB0
aGlzIGlzIGR1ZSB0byBidWdneSB1c2VyIGNvZGUKPiA+ICAgIG9yIHBvb3Igc3luY2hyb25pemF0
aW9uIGJldHdlZW4gcmVhZHMgYW5kIHVubWFwKCkuCj4gPiBTbyBJIGFzc3VtZSBpdCBpcyBub3Qg
YSBwcm9ibGVtLgo+ID4KPiA+IDIuIFdlIG9ic2VydmVkIG1hbnkgY2FzZXMgd2hlcmUgYHZtYV9z
dGFydF93cml0ZSgpYAo+ID4gICAgaXMgYmxvY2tlZCBieSBwYWdlLWZhdWx0IEkvTyBpbiBzb21l
IGFwcGxpY2F0aW9ucy4KPiA+ICAgIFRoZSBibG9ja2luZyBvY2N1cnMgaW4gdGhlIGBkdXBfbW1h
cCgpYCBwYXRoIGR1cmluZwo+ID4gICAgZm9yaygpLgo+ID4KPiA+IFdpdGggU3VyZW4ncyBjb21t
aXQgZmI0OWM0NTUzMjNmZiAoImZvcms6IGxvY2sgVk1BcyBvZgo+ID4gdGhlIHBhcmVudCBwcm9j
ZXNzIHdoZW4gZm9ya2luZyIpLCB3ZSBub3cgYWx3YXlzIGhvbGQKPiA+IGB2bWFfd3JpdGVfbG9j
aygpYCBmb3IgZWFjaCBWTUEuIE5vdGUgdGhhdCB0aGUKPiA+IGBtbWFwX2xvY2tgIHdyaXRlIGxv
Y2sgaXMgYWxzbyBoZWxkLCB3aGljaCBjb3VsZCBsZWFkIHRvCj4gPiBjaGFpbmVkIHdhaXRpbmcg
aWYgcGFnZS1mYXVsdCBJL08gaXMgcGVyZm9ybWVkIHdpdGhvdXQKPiA+IHJlbGVhc2luZyB0aGUg
Vk1BIGxvY2suCj4gPgo+ID4gTXkgZ3V0IGZlZWxpbmcgaXMgdGhhdCBTdXJlbidzIGNvbW1pdCBt
YXkgYmUgb3ZlcnNob290aW5nLAo+ID4gc28gbXkgcm91Z2ggaWRlYSBpcyB0aGF0IHdlIG1pZ2h0
IHdhbnQgdG8gZG8gc29tZXRoaW5nIGxpa2UKPiA+IHRoZSBmb2xsb3dpbmcgKHdlIGhhdmVuJ3Qg
dGVzdGVkIGl0IHlldCBhbmQgaXQgbWlnaHQgYmUKPiA+IHdyb25nKToKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvbW0vbW1hcC5jIGIvbW0vbW1hcC5jCj4gPiBpbmRleCAyMzExYWU3YzJmZjQuLjVkZGFm
Mjk3ZjMxYSAxMDA2NDQKPiA+IC0tLSBhL21tL21tYXAuYwo+ID4gKysrIGIvbW0vbW1hcC5jCj4g
PiBAQCAtMTc2Miw3ICsxNzYyLDEzIEBAIF9fbGF0ZW50X2VudHJvcHkgaW50IGR1cF9tbWFwKHN0
cnVjdCBtbV9zdHJ1Y3QKPiA+ICptbSwgc3RydWN0IG1tX3N0cnVjdCAqb2xkbW0pCj4gPiAgICAg
ICAgIGZvcl9lYWNoX3ZtYSh2bWksIG1wbnQpIHsKPiA+ICAgICAgICAgICAgICAgICBzdHJ1Y3Qg
ZmlsZSAqZmlsZTsKPiA+Cj4gPiAtICAgICAgICAgICAgICAgcmV0dmFsID0gdm1hX3N0YXJ0X3dy
aXRlX2tpbGxhYmxlKG1wbnQpOwo+ID4gKyAgICAgICAgICAgICAgIC8qCj4gPiArICAgICAgICAg
ICAgICAgICogRm9yIGFub255bW91cyBvciB3cml0YWJsZSBwcml2YXRlIFZNQXMsIHByZXZlbnQK
PiA+ICsgICAgICAgICAgICAgICAgKiBjb25jdXJyZW50IENvVyBmYXVsdHMuCj4gPiArICAgICAg
ICAgICAgICAgICovCj4gPiArICAgICAgICAgICAgICAgaWYgKCFtcG50LT52bV9maWxlIHx8ICgh
KG1wbnQtPnZtX2ZsYWdzICYgVk1fU0hBUkVEKSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIChtcG50LT52bV9mbGFncyAmIFZNX1dSSVRFKSkpCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXR2YWwgPSB2bWFfc3RhcnRfd3JpdGVfa2lsbGFibGUobXBu
dCk7Cj4KPiBMaWtlbHkgaXNfY293X21hcHBpbmcoKSBpcyB3aGF0IHlvdSB3b3VsZCB3YW50IHRv
IGNoZWNrIHRvIGhhbmRsZSBWTUFzIHRoYXQKPiBjb3VsZCBoYXZlIGFub255bW91cyBwYWdlcyBp
biB0aGVtLgoKWWVzIDopIEkgbWFkZSBwcmV0dHkgbXVjaCB0aGUgc2FtZSBjb21tZW50IHRob3Vn
aCBJIGZvcmdvdCB0aGUgY29ycmVjdCBoZWxwZXIgOlAKCj4KPiAtLQo+IENoZWVycywKPgo+IERh
dmlkCgpDaGVlcnMsIExvcmVuem8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
