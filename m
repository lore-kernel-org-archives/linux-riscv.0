Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFCACA5FED
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 06:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iF0Gb4TMDmw59OYSK86x8WSHVBjb49JRJnQmEupfVQ=; b=xUWb+4Ily5SII+
	HVPxyeLUD+IqK0i1YCo2HMbgdFvhLNuZD4eB0k7NT4c0JaGvafl2B/LxCoSfby6+55iqH8VPoJ0Ob
	Pmbc425kpno21vLr7a2FJ9GbS7SOlL4YeGKgY2NPW4zb28BlnUrpXsiJbg9Qb1jMguGvjrCLQD4ZU
	bawD7HG8zPD5wjX6v/43rs3DIZjkfNtTvOFXu2ZuqSqo9h2TR73/yKh66manGljt89YE9ltjRF4xl
	6OWhC6sNerMnvhWYiB2w2/bF/57q6YEmbcfgKMH8VeCEW9nc7P3Aq7DSVh6oCeIiEyCFmMTYl8da2
	HqeqikVG5SeJUhDg4IbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3nV-00000005acP-23WE;
	Fri, 09 Oct 2026 06:09:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF3nU-00000005acB-1xK7;
	Fri, 09 Oct 2026 06:09:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 879AA602C3;
	Fri,  9 Oct 2026 06:09:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7FE1F000FF;
	Fri,  9 Oct 2026 06:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791526175;
	bh=HaXEEt+6oUYTgk3yLziOOP26vbiRye4IPhhc+D5Un/s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HWkN5KrlKIk6OWt38SO9fMGwArGXNLm8Sc0PCX7ZgeMYOylWuJpHNU8t2FYDltQLn
	 2hKVTP6VzNHCqHXVINEqZTs/LUesNwkJVsuSfNVRWiSG6EM+asdu7XUYpBPEPDbhyg
	 xxL2L457nAJjsnW9ul382bkmFZlkcJ0BfutYNMatFDZqAAKt4pPj7uICuTiy4ojVEP
	 ugz5q4KFQCUm7kDaKATbRD/9S7WIDuKfPfrxc0hLnTMVOL+lI7sBSP7t1MeAxfaysa
	 lqZ9eoh+QQZamGuMRiYovi7Gku403d6K2cuOnrn5lClA+St/Yv/3lziXSu4nT82KA4
	 ZsIxQ2m9QprXw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, stable@vger.kernel.org, david@kernel.org,
 osalvador@suse.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, catalin.marinas@arm.com, will@kernel.org,
 mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-riscv@lists.infradead.org, agordeev@linux.ibm.com,
 kevin.brodsky@arm.com, bjorn@rivosinc.com, apopple@nvidia.com,
 linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
In-Reply-To: <20261008073021.2512665-3-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-3-songmuchun@bytedance.com>
Date: Fri, 09 Oct 2026 08:09:31 +0200
Message-ID: <87jynrs8v8.fsf@all.your.base.are.belong.to.us>
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
dXNlcyB0aGUgc2FtZSBtZW1vcnktaG90cGx1ZyB0ZWFyZG93biBjb2RlIGZvciB0aGUgbGluZWFy
IG1hcCBhbmQKPiB2bWVtbWFwLCBhbHRob3VnaCB0aGVpciBwYWdlLXRhYmxlIHBhZ2VzIGFyZSBu
b3QgYWx3YXlzIGFsbG9jYXRlZCBpbiB0aGUKPiBzYW1lIHdheS4gTGF0ZSBsaW5lYXItbWFwIGFs
bG9jYXRpb25zIHJ1biBwYWdlLXRhYmxlIGNvbnN0cnVjdG9ycywgd2hpbGUKPiB2bWVtbWFwIGFu
ZCBlYXJseSBhbGxvY2F0aW9ucyBtYXkgcHJvdmlkZSBjb25zdHJ1Y3Rvci1mcmVlIHBhZ2VzLgo+
Cj4gVGhlIFBURSBwYXRoIHVuY29uZGl0aW9uYWxseSBydW5zIHRoZSBkZXN0cnVjdG9yLCB3aGlj
aCBpcyB3cm9uZyBmb3IKPiBjb25zdHJ1Y3Rvci1mcmVlIHZtZW1tYXAgdGFibGVzLiBUaGUgUE1E
IHBhdGggYXZvaWRzIHRoYXQgcHJvYmxlbSBieQo+IHVzaW5nIGlzX3ZtZW1tYXAgYXMgYSBwcm94
eSBmb3IgY29uc3RydWN0b3Igc3RhdGUsIGJ1dCB0aGF0IGFzc3VtcHRpb24KPiB3aWxsIG5vIGxv
bmdlciBob2xkIG9uY2UgcnVudGltZSB2bWVtbWFwIGFsbG9jYXRpb25zIHVzZSB0aGUgbm9ybWFs
Cj4gcGdhbGxvYyBoZWxwZXJzLgo+Cj4gUGFnZS10YWJsZSBjb25zdHJ1Y3RvcnMgcmVjb3JkIHRo
ZWlyIHN0YXRlIGluIFBHX3RhYmxlLiBDZW50cmFsaXplCj4gcGFnZS10YWJsZSBmcmVlaW5nIGFu
ZCB1c2UgUGFnZVRhYmxlKCkgdG8gZGVjaWRlIHdoZXRoZXIgdGhlIGRlc3RydWN0b3IKPiBpcyBy
ZXF1aXJlZC4gS2VlcCByZXNlcnZlZCBhbmQgY29uc3RydWN0b3ItZnJlZSBwYWdlcyBvbiB0aGVp
ciBleGlzdGluZwo+IGZyZWVpbmcgcGF0aHMuCj4KPiBGaXhlczogYzc1YTc0ZjRiYTE5ICgicmlz
Y3Y6IG1tOiBBZGQgbWVtb3J5IGhvdHBsdWdnaW5nIHN1cHBvcnQiKQo+IENjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IExMTQo+IFNpZ25lZC1vZmYtYnk6IE11Y2h1biBT
b25nIDxzb25nbXVjaHVuQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvbW0vaW5p
dC5jIHwgMjkgKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCA4NTdmOWE1NTAz
OWMuLjQyOWEwYjAxNWVjMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gQEAgLTE0ODYsMTAgKzE0ODYsMTkgQEAgc3RydWN0
IGV4ZWNtZW1faW5mbyBfX2luaXQgKmV4ZWNtZW1fYXJjaF9zZXR1cCh2b2lkKQo+ICAjZW5kaWYg
LyogQ09ORklHX0VYRUNNRU0gKi8KPiAgCj4gICNpZmRlZiBDT05GSUdfTUVNT1JZX0hPVFBMVUcK
PiArc3RhdGljIHZvaWQgX19tZW1pbml0IGZyZWVfcGFnZXRhYmxlKHN0cnVjdCBwYWdlICpwYWdl
KQo+ICt7Cj4gKwlpZiAoUGFnZVJlc2VydmVkKHBhZ2UpKQo+ICsJCWZyZWVfcmVzZXJ2ZWRfcGFn
ZShwYWdlKTsKPiArCWVsc2UgaWYgKFBhZ2VUYWJsZShwYWdlKSkKPiArCQlwYWdldGFibGVfZHRv
cl9mcmVlKHBhZ2VfcHRkZXNjKHBhZ2UpKTsKPiArCWVsc2UKPiArCQlwYWdldGFibGVfZnJlZShw
YWdlX3B0ZGVzYyhwYWdlKSk7Cj4gK30KCklzIFBhZ2VSZXNlcnZlZCgpIGVub3VnaHQgdG8gZGV0
ZXJtaW5lIGlmIHRoZXJlJ3Mgbm8gZHRvciB0byBydW4/IE9uCnJ2NjQgeW91ciBjb2RlIGlzIGNv
cnJlY3QsIGJ1dCBtYXliZSBmb3Igcm9idXN0bmVzcz8KCiAgfCBpZiAoUGFnZVRhYmxlKHBhZ2Up
KQogIHwgICAgICAgICBwYWdldGFibGVfZHRvcihwYWdlX3B0ZGVzYyhwYWdlKSk7CiAgfCAKICB8
IGlmIChQYWdlUmVzZXJ2ZWQocGFnZSkpCiAgfCAgICAgICAgIGZyZWVfcmVzZXJ2ZWRfcGFnZShw
YWdlKTsKICB8IGVsc2UKICB8ICAgICAgICAgcGFnZXRhYmxlX2ZyZWUocGFnZV9wdGRlc2MocGFn
ZSkpOwoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
