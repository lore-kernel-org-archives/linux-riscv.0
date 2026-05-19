Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636F4CD4F5B
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 12:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1boaujot4LYl35eaAPLeWbM3jINJ2XZK34RJmsA1d2k=; b=GIZFCYfVc5OCMK
	wvIEyfGOBrAb6wxGvB31SClbpaVXlYDxS1X3A5QPWrTlxwHryhY0e5KtXwUFFCLfbKiC/gCUjBpIx
	WB/xJnh0q78GqqzEp1TEeYxGk6QEdHkUrBvqD7GAGg45uNOKgTSDxkhlIok6Cze4ZnrxKSz7XKL0f
	QyhlPj0g6BuL2K0f/R/r820mBhIwpOfv4t4q6Xb6nycAhyk8CTLmBC5iebqUHYkVK6fgJvk/5EDRA
	jq08kD6Yy7w/AbvHyl//2OmRl9wGWZIlr0LOUzH2M4Zt4AZb8AjIdZd1rrufuS6MU9KaT7c+U2bwB
	opcejhPrd8m3vXLH8/FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJpg-00000001Wb9-3771;
	Tue, 19 May 2026 12:46:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJpd-00000001WaS-3KSP;
	Tue, 19 May 2026 12:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 070F240267;
	Tue, 19 May 2026 12:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B010C2BCB8;
	Tue, 19 May 2026 12:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779194756;
	bh=0tEY/ViETcYWqMbew+LgZ2oRYOW85rqGc3tYxA7i0ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FfLpklXMkKT1W9LjHbc6orFesNSR/WYbThmN3RY3KQ+Sj526oZ9knAqWz1hOSb2V8
	 dNS1B12b6zt9T5UOXQ1nrMbNWtECIR2msv6pUBdn/ZjxEPvXzm8/CRvLKqnqCU51sq
	 haxA77qodnAWypw1XScQZfjJLKwh9FciR3mqwcEzxbVxwnrLWlqLfHqEPk5J3o8Cmy
	 0Wlh1tz1PaNb1cIMkhcRqDoftNLeYh74seeYdw4fbd1+VoscIEyfDFSquLrWTQHUK9
	 L8E52Y782Q8/1j6v9de5qhI08YuU7rlNh8jgJpwnmYyrNumFGmR+cEYpT6UhTkfXca
	 +brOZETnCxkNA==
Date: Tue, 19 May 2026 13:45:46 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Barry Song <baohua@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>, 
	Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org, 
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com, bhe@redhat.com, 
	youngjun.park@lge.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <agxbJHfa6J2UAtSf@lucifer>
References: <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
 <agrWuDNGddNmvMFD@lucifer>
 <CAGsJ_4zqLfdWoTH9s7FFaqWWj0mESfikYgr7=GcV64qcuXrPxA@mail.gmail.com>
 <CAJuCfpE0WQrB3zJp9qn3jvn5DthS=ttpX7gJJvyEhA_BJGrp5g@mail.gmail.com>
 <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4zgeE3ebEJ+j7GJFzWVoVYHeiOn4dOoOsmWCLA6s=oECQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_054557_871614_0E5716BC 
X-CRM114-Status: GOOD (  25.67  )
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

T24gVHVlLCBNYXkgMTksIDIwMjYgYXQgMDU6MTQ6NDVBTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBUdWUsIE1heSAxOSwgMjAyNiBhdCAzOjU34oCvQU0gU3VyZW4gQmFnaGRhc2FyeWFu
IDxzdXJlbmJAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjYg
YXQgNDoyNuKAr0FNIEJhcnJ5IFNvbmcgPGJhb2h1YUBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4K
PiA+ID4gT24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgNTo0N+KAr1BNIExvcmVuem8gU3RvYWtlcyA8
bGpzQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gU3VuLCBNYXkgMTcsIDIw
MjYgYXQgMDQ6NDU6MTVQTSArMDgwMCwgQmFycnkgU29uZyB3cm90ZToKPiBbLi4uXQo+ID4gPgo+
ID4gPiBJIHRoaW5rIHdlIGVpdGhlciBuZWVkIHRvIGZpeCBgZm9yaygpYCwgb3Iga2VlcCB0aGUg
Y3VycmVudAo+ID4gPiBiZWhhdmlvciBvZiBkcm9wcGluZyB0aGUgVk1BIGxvY2sgYmVmb3JlIHBl
cmZvcm1pbmcgSS9PLgo+ID4KPiA+IEkgc2VlLiBTbywgdGhpcyBwcm9ibGVtIGFyaXNlcyBmcm9t
IHRoZSBmYWN0IHRoYXQgd2UgYXJlIGNoYW5naW5nIHRoZQo+ID4gcGFnZWZhdWx0cyByZXF1aXJp
bmcgSS9PIG9wZXJhdGlvbiB0byBob2xkIFZNQSBsb2NrLi4uCj4gPiBBbmQgeW91IHdhbnQgdG8g
bG9jayBWTUEgb24gZm9yayBvbmx5IGlmIHZtYV9pc19hbm9ueW1vdXModm1hKSB8fAo+ID4gaXNf
Y293X21hcHBpbmcodm1hLT52bV9mbGFncykuIFNvLCB3ZSB3aWxsIGJlIGJsb2NraW5nIHBhZ2Ug
ZmF1bHRzIGZvcgo+ID4gYW5vbnltb3VzIGFuZCBDT1cgVk1BcyBvbmx5IHdoaWxlIGhvbGRpbmcg
bW1hcF93cml0ZV9sb2NrLCBwcmV2ZW50aW5nCj4gPiBhbnkgVk1BIG1vZGlmaWNhdGlvbi4gT24g
dGhlIHN1cmZhY2UsIHRoYXQgbG9va3Mgb2sgdG8gbWUgYnV0IEkgbWlnaHQKPiA+IGJlIG1pc3Np
bmcgc29tZSBjb3JuZXIgY2FzZXMuIElmIG5vYm9keSBzZWVzIGFueSBvYnZpb3VzIGlzc3Vlcywg
SQo+ID4gdGhpbmsgaXQncyB3b3J0aCBhIHRyeS4KPiA+Cj4KPiBUaGFua3MuIEJlc2lkZXMgdGhl
IGNyZWF0aW9uIG9mIHByb2Nlc3NlcyB2aWEgZm9yaygpLCBJCj4gYW0gYWxzbyBiZWdpbm5pbmcg
dG8gd29ycnkgYWJvdXQgdGhlIGRlYXRoIG9mIHByb2Nlc3Nlcy4KPgo+IE9uZSB0aGluZyB0aGF0
IGNhbWUgdG8gbXkgbWluZCB0aGlzIG1vcm5pbmcKPiBpcyB0aGF0IHdoZW4gbG93bWVtb3J5a2ls
bGVyIGRlY2lkZXMgdG8ga2lsbCBhbiBhcHAsIHdlCgpXaGF0J3MgdGhlIGxvd21lbW9yeWtpbGxl
cj8gOlAgeW91IG1lYW4gdGhlIE9PTSBraWxsZXI/Cgo+IHdhbnQgdGhlIG1lbW9yeSB0byBiZSBy
ZWxlYXNlZCBhcyBxdWlja2x5IGFzIHBvc3NpYmxlIHNvCj4gdGhlIG5ldyBhcHAgb3IgdXNlciBz
Y2VuYXJpbyBjYW4gZ2V0IG1lbW9yeSBzb29uZXIuCj4KPiBJbiB0aGF0IGNhc2UsIGlmIHRoZSBh
cHAgYmVpbmcga2lsbGVkIGlzIHBlcmZvcm1pbmcgSS9PCj4gd2hpbGUgaG9sZGluZyB0aGUgVk1B
IGxvY2ssIHRoZSB1bm1hcHBpbmcgcHJvY2VkdXJlCj4gY291bGQgZW5kIHVwIGJlaW5nIGJsb2Nr
ZWQgYXMgd2VsbC4KPgo+IElmIHdlIHJlbGVhc2UgdGhlIFZNQSBsb2NrIGFzIHdlIGN1cnJlbnRs
eSBkbywgd2UgYWxsb3cKPiBwcm9jZXNzIGV4aXQgdG8gcHJvY2VlZC4KPgo+IEkgaGF2ZW4ndCB0
aG91Z2h0IGl0IHRocm91Z2ggdmVyeSBjbGVhcmx5IHlldCwgYW5kIEkKPiBtYXkgYmUgd3Jvbmcu
IEknZCBsaWtlIHRvIGRvIG1vcmUgaW52ZXN0aWdhdGlvbi4gSSBob3BlCj4gdGhlIGFwcHMgYmVp
bmcga2lsbGVkIHN0YXkgdmVyeSBzdGlsbCwgYnV0IHdobyBrbm93c+KAlHdlCj4gaGF2ZSBzbyBt
YW55IGFwcGxpY2F0aW9ucyBpbiB0aGUgbWFya2V0LgoKWWVhaCBsZXQncyB0cmVhZCB2ZXJ5IGNh
cmVmdWxseSBwbGVhc2UsIHlvdSdyZSBwaWNraW5nIHR3byBvZiB0aGUgbW9zdCBmcmF1Z2h0CmFy
ZWFzIG9mIG1tLCBJJ20gbm90IGdvaW5nIHRvIHdhbnQgdG8gc2VlIGNoYW5nZXMgdGhlcmUgdW5s
ZXNzIHRoZXkncmUKc3Vic3RhbnRpYWxseSBtb3JlIGNvbnZpbmNpbmdseSBhcmd1ZWQuCgo+Cj4g
TWVhbndoaWxlLCBpZiB5b3UgaGF2ZSBhbnkgY29tbWVudHMgcmVnYXJkaW5nIHRoZSBkZWF0aAo+
IG9mIHByb2Nlc3NlcywgdGhleSB3b3VsZCBiZSB2ZXJ5IHdlbGNvbWUuCgpBcyBhYm92ZSwgbGVh
dmUgaXQgYWxvbmUgcGxlYXNlIDopCgo+Cj4gQmVzdCBSZWdhcmRzCj4gQmFycnkKClRoYW5rcywg
TG9yZW56bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
