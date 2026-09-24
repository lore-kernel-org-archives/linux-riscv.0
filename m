Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59625C98321
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 15:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh+3MlNVf6/YDay7h/M0sDOuMd3fgF3IOM1yUF9ae9s=; b=UYKRRIeLNaXvGb
	dMoH2v7u0fYZTyJCZVLzuq/KVKXRhE2CS18FVXBQ2/hD+ibD/qZvPK6HsV+fr/FATuic+nP7pJdN2
	ik49CiEY9T5wES3WuiaF6ss0YHngcMY2oprHvL9mXPvexTnxOXLrTI6aVwlQaAqEJKoUgYjiULZEG
	oPEf+KFpIfn4A8qR1Jj4dtEo11It4irnwGI6GfqHVQe1wptCDqDnsEiH9a1ww9DJp+APPTWcImLAD
	k+3muUCjhtEmyJhaS21E+x4G3qKubXBUT/uDi3PchRjsemR3Zl2OKNu6/do48Px55ZUZdUbO53CY3
	YX9Xu5O6N0D2st4pIOuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kyl-0000000BKWc-0oDX;
	Thu, 24 Sep 2026 15:03:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kyk-0000000BKWU-08Yp
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 15:03:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 15C92601DE;
	Thu, 24 Sep 2026 15:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441851F000FF;
	Thu, 24 Sep 2026 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790262196;
	bh=rbI3J5MByOqOf6dl+z31TMJPnlEaks35mTvEW1B2isk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=CKKlX2PDopw4V/FG5N+J2hHi95G/OP+TAIXWBHQEO1AKEU0nskH8Xd1WjjBpAHaej
	 qbQrqjWXnN7jt1t6tS49pbAys1YTcSbvK8HycJpXul+v1jpuCEDwV6Gl1jN3zW0tWh
	 j48OOJ5XWAJMgPLfDUh0TbX7OVTZYtzV9gazFKBY0htB+yRccKfU9KxPbeA5fdqPXz
	 lNVyfbU2Qe9jcIVAIpz2tr5j/Ln+wA0bGihFeni+XTPzrpp8f3Jpovw7BSEciXA4ag
	 +3b7lka90+Y5U1enhzdCgNZL+kM2w7upW0UY/lDsWkhulr2X+hhjiWk7yd/zqWB5EU
	 RHrc1vZrLL3Hw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, memxor@gmail.com,
 puranjay@kernel.org
Cc: ihor.solodrai@linux.dev, eddyz87@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, pulehui@huawei.com, pjw@kernel.org,
 palmer@dabbelt.com, shuah@kernel.org, guoren@kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 0/2] bpf, riscv: Add support for indirect jumps
In-Reply-To: <20260924102938-gotox-v2-style-question-cp0613@linux.alibaba.com>
References: <20260923130856.1157-1-cp0613@linux.alibaba.com>
 <20260924102938-gotox-v2-style-question-cp0613@linux.alibaba.com>
Date: Thu, 24 Sep 2026 17:03:13 +0200
Message-ID: <87ld8qpu8e.fsf@all.your.base.are.belong.to.us>
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

SGV5IQoKQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4gd3JpdGVzOgoKPiBIaSBh
bGwsCj4KPiBUaGFua3MgZm9yIHRoZSByZXZpZXdzLiBQYXRjaCAxIGlzIGEgcGxhaW4gd29yZGlu
ZyBmaXggYW5kIHdpbGwgZ28gaW50bwo+IHYyLiBGb3IgcGF0Y2ggMiBJIG5lZWQgeW91ciBpbnB1
dCBvbiBvbmUgdGhpbmcgYmVmb3JlIEkgcmVzcGluOiB3aGljaAo+IGZvcm0gb2YgdGhlICNlbmRp
ZiBjb21tZW50IHlvdSB3b3VsZCBwcmVmZXIuCj4KPiBQYXRjaCAxLCBvbiB0aGUgY29tbWVudCBh
Ym92ZSBicGZfcHJvZ191cGRhdGVfaW5zbl9wdHJzKCk6Cj4KPj4gVGhpcyBpc24ndCBhIGJ1Zywg
YnV0IGNvdWxkIHRoZSBjb21tZW50IHNheSAic2hpZnQgY3R4LT5vZmZzZXRbXSBieSBvbmUiCj4+
IHJhdGhlciB0aGFuICJzaGlmdCB0aGUgbGluZm8gYXJyYXkgYnkgb25lIj8gVGhlIGppdGVkX2xp
bmZvIHdhcyBhbHJlYWR5Cj4+IGZpbGxlZCBpbiBieSB0aGUgYnBmX3Byb2dfZmlsbF9qaXRlZF9s
aW5mbygpIGNhbGwgYWJvdmUsIGFuZCBpdCBpcyB0aGUKPj4gSklUJ3Mgb3duIG9mZnNldCB0YWJs
ZSB0aGF0IGlzIGJlaW5nIHJld3JpdHRlbiBoZXJlLgo+Cj4gQWdyZWVkLiBGaXhlZCBpbiB2Mi4K
Pgo+IFBhdGNoIDIsIG9uIHRoZSAjZW5kaWYgbWFya2VyIGluIHZlcmlmaWVyX2dvdG94LmM6Cj4K
Pj4gW1NldmVyaXR5OiBMb3ddCj4+IFRoaXMgaXNuJ3QgYSBidWcsIGJ1dCBkb2VzIHRoaXMgbmV3
bHkgaW50cm9kdWNlZCBtdWx0aS1saW5lIGNvbW1lbnQKPj4gZm9sbG93IHRoZSBCUEYgc3Vic3lz
dGVtIHN0eWxlIGd1aWRlPyBUaGUgc3Vic3lzdGVtIGd1aWRlbGluZXMKPj4gZXhwbGljaXRseSBy
ZXF1aXJlIHRoYXQgbXVsdGktbGluZSBjb21tZW50cyBoYXZlIHRoZSBvcGVuaW5nICcvKicgb24K
Pj4gaXRzIG93biBsaW5lLCByYXRoZXIgdGhhbiBiZWdpbm5pbmcgdGV4dCBvbiB0aGUgc2FtZSBs
aW5lIGFzIHRoZQo+PiBvcGVuaW5nIG1hcmtlci4KPgo+IEkgd291bGQgcmF0aGVyIGNvbGxhcHNl
IGl0IHRvIGEgc2luZ2xlIGxpbmUsIGJ1dCB0aGVyZSBpcyBtb3JlIHRoYW4gb25lCj4gd2F5IHRv
IHNwZWxsIGl0Ogo+Cj4gICBhKSA4OSBjb2x1bW5zLCBjbGVhbiB1bmRlciBzY3JpcHRzL2NoZWNr
cGF0Y2gucGwgLS1zdHJpY3Q6Cj4KPiAjZW5kaWYgLyogX19UQVJHRVRfQVJDSF94ODYgfHwgX19U
QVJHRVRfQVJDSF9hcm02NCB8fCBfX1RBUkdFVF9BUkNIX3Bvd2VycGMgfHwgcmlzY3Y2NCAqLwo+
Cj4gICBiKSAxMDEgY29sdW1ucywga2VlcHMgZXZlcnkgbWFjcm8gbmFtZSB2ZXJiYXRpbSwgYnV0
IGNoZWNrcGF0Y2ggdGhlbgo+ICAgICAgcmVwb3J0cyAiV0FSTklORzogbGluZSBsZW5ndGggb2Yg
MTAxIGV4Y2VlZHMgMTAwIGNvbHVtbnMiOgo+Cj4gI2VuZGlmIC8qIF9fVEFSR0VUX0FSQ0hfeDg2
IHx8IF9fVEFSR0VUX0FSQ0hfYXJtNjQgfHwgX19UQVJHRVRfQVJDSF9wb3dlcnBjIHx8IF9fVEFS
R0VUX0FSQ0hfcmlzY3YgKi8KPgo+ICAgYykgb3IgYSBzaG9ydCBtYXJrZXIgdGhhdCBkb2VzIG5v
dCByZXBlYXQgdGhlIGNvbmRpdGlvbiBhdCBhbGw6Cj4KPiAjZW5kaWYgLyogZ290b3gtY2FwYWJs
ZSBhcmNoICovCj4KPiBJIGxlYW4gdG93YXJkcyAoYSk6IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2JwZi9wcm9ncy8gb3RoZXJ3aXNlIG9ubHkKPiB1c2VzIHNpbmdsZS1saW5lICNlbmRpZiBtYXJr
ZXJzLCBhbmQgInJpc2N2NjQiIG1hdGNoZXMgdGhlIGd1YXJkLCB3aGljaAo+IGlzIF9fVEFSR0VU
X0FSQ0hfcmlzY3YgJiYgX19yaXNjdl94bGVuID09IDY0Lgo+Cj4gSSB3aWxsIHNlbmQgdjIgd2l0
aCB0aGUgcGF0Y2ggMSBmaXggYW5kIHdoaWNoZXZlciBmb3JtIHlvdSBwaWNrLCB0b2dldGhlcgo+
IHdpdGggYW55IG90aGVyIGZlZWRiYWNrLCBzbyBwbGVhc2UgbGV0IG1lIGtub3cgaWYgeW91IHdv
dWxkIGxpa2UgYW55dGhpbmcKPiBlbHNlIGNoYW5nZWQuIElmIG5vYm9keSBoYXMgYSBwcmVmZXJl
bmNlLCBJIHdpbGwgZ28gd2l0aCAoYSkgaW4gYSBmZXcKPiBkYXlzLgoKTWF5YmUganVzdCAoZCk6
CiAgfCAjZW5kaWYgLyogZ290b3g6IHg4NiwgYXJtNjQsIHBvd2VycGMsIHJpc2N2NjQgKi8KCmJ1
dCAoYykgb3IgKGEpIGlzIGZpbmUgYXMgd2VsbCwgSU1PLgoKRmVlbCBmcmVlIHRvIGFkZCBmb3Ig
dGhlIHNlcmllcyBmb3IgeW91ciB2MjoKClJldmlld2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9y
bkBrZXJuZWwub3JnPgpBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
