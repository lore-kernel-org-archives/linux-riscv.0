Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D38CD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 09:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZQoRVjTyAx3atSTsjr3zqVsEI5qtn5R2mMg1UHA+2Y=; b=vual71kn4GrUJw
	b2wdjERO5zxy7+NA5ZCxpYKW3CLXPPUTskYkWogFc9VkZqn6npld+scSo+c4USxPwzbtEk6E7CPc8
	ZoA24AToT5Or9QjjFFfE9JXQXMGGNFHO9uqJfVYd1pk96agho85YGIcPSgh15u9eSU4janKQSOGBj
	48V4ztzBzAqorcO26Z3n2E+pvqFEGYLzS5s6PhSxEPrXLXyuiwI2alENBHCuMcFL7hf8+SDSeWv02
	E0csjRzP02rfpQFTmqaIY+ObXBtCNR6VeL5V124ja3NV2yRgtTWe/xnHjY76Wc7Y5oCSth+KEaU4T
	uj9xO11kwdYORZWpus5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOugK-0000000F6aR-2EaM;
	Mon, 18 May 2026 09:54:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOugJ-0000000F6a2-2ckm;
	Mon, 18 May 2026 09:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Bc0qUG5ezu0fBTIae+Gg2HH0O7czfnS/tLixkncMJ94=; b=eUMDZXMV7s6hmzBIstWzn/jlQ8
	w8klnNPJE+5PX7SOwZK+SMeKxQxoYbpK/TgJDm8N7QmOP9AVIQ1neyWiDV0EjZkvc1ktCeT3OjhG6
	W4Z3Tpz+GkHOaO4cMF+dg8dOCtLtGcEpsWPHH/IUSqaAQnaZgx7tOLuEjzZNvS/P0htFwzAFjbf+U
	OP1Gli25aAJb655onE03FOETE1W5fuwMLJDd5ZO7B5eCStcqbK+yX0nm7wzI+N903YRIIF7qARmnC
	Cy3Tcj2L1NZ8XbRg9q6EDvG6i6hbe1jjYwt4jLJkrAIqrfA7L74fZmSq6t/buiDKZT0p2TwdsDjWF
	Q+FD+uCw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOufc-0000000AeV1-1UTz;
	Mon, 18 May 2026 09:54:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 66FE542A71;
	Mon, 18 May 2026 09:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A1DCC2BCB7;
	Mon, 18 May 2026 09:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779098029;
	bh=W8Y9KhF7UdtIAt1c+NPri553EDOVp1AAPUaE7TKCmjc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pd65kd8GwKjdONJbfTVC0Cbl/3yXe5p7s3Odr3JoeXeW5LNYe95k6Po6QAxURYpS7
	 B/fp4Vt5Z3BIPBT6bfhGi63GZlBdT1O4IjpTSFgqkdrl1GS76ZEqwVPiCihl8mgw25
	 ewkaG1poBVEHGPVLrhZkCfUmmYcBYaMy8YNHSrh0SLnR/GsnPO8dcDE7DsfBCg+0WR
	 zKuF/vEy1e8RoDYGByJjQS7ArI72vcW8qFhPO+TFbT+RYPfD0MuVuXglet+3AD+81z
	 MO7vGLYPvMjA8AvRMC7wYWoPCUZs2JpKZdhJml4rhXSJWvwHBF9InDkR9UY50YRVCV
	 Cp57Dwam949Zg==
Message-ID: <b65722ee-6476-4038-bfbb-44a32b3544fd@kernel.org>
Date: Mon, 18 May 2026 11:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Barry Song <baohua@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 surenb@google.com
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com,
 jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn,
 lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com,
 chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com,
 nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Nanzhe Zhao <nzzhao@126.com>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <CAGsJ_4w0qcYmukHqsyRd0jomoyYkJjOt8b-Cgp53BgP-8QQghw@mail.gmail.com>
 <afS_L-5XeWIldTXA@casper.infradead.org>
 <CAGsJ_4wk=SDtgin+84Ev2TamU-JFfmrg_SUay=-tcYmnFvK6Nw@mail.gmail.com>
 <afTpoL3FklpQZNMM@casper.infradead.org>
 <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAGsJ_4ysMcrmDLSOwBkf7qwCQrcDWeEMXkHDajTJFMLKUk0bSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105402_684978_66D1E920 
X-CRM114-Status: GOOD (  27.40  )
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

T24gNS8xNy8yNiAxMDo0NSwgQmFycnkgU29uZyB3cm90ZToKPiBPbiBTYXQsIE1heSAyLCAyMDI2
IGF0IDE6NTjigK9BTSBNYXR0aGV3IFdpbGNveCA8d2lsbHlAaW5mcmFkZWFkLm9yZz4gd3JvdGU6
Cj4+Cj4+IE9uIFNhdCwgTWF5IDAyLCAyMDI2IGF0IDAxOjQ0OjM0QU0gKzA4MDAsIEJhcnJ5IFNv
bmcgd3JvdGU6Cj4+Pgo+Pj4gSXQgZG9lc27igJl0IGhhdmUgdG8gaW52b2x2ZSB1bm1hcHBpbmcg
b3IgYXBwbHlpbmcgbXByb3RlY3QgdG8KPj4+IHRoZSBlbnRpcmUgVk1B4oCUanVzdCBhIHBvcnRp
b24gb2YgaXQgaXMgc3VmZmljaWVudC4KPj4KPj4gWWVzLCBidXQgdGhhdCBzdGlsbCBmYWlscyB0
byBhbnN3ZXIgImRvZXMgdGhpcyBhY3R1YWxseSBoYXBwZW4iLiAgSG93IG11Y2gKPj4gcGVyZm9y
bWFuY2UgaXMgYWxsIHRoaXMgY29tcGxleGl0eSBpbiB0aGUgcGFnZSBmYXVsdCBoYW5kbGVyIGJ1
eWluZyB1cz8KPj4gSWYgeW91IGRvbid0IGFuc3dlciB0aGlzIHF1ZXN0aW9uLCBJJ20ganVzdCBn
b2luZyB0byBnbyBpbiBhbmQgcmlwIGl0Cj4+IGFsbCBvdXQuCj4+Cj4gCj4gSGkgTWF0dGhldyAo
YW5kIExvcmVuem8sIEphbiwgYW5kIGFueW9uZSBlbHNlIHdobyBtYXkgYmUKPiB3YWl0aW5nIGZv
ciBhbnN3ZXJzKSwKPiAKPiBBcyBwcm9taXNlZCBkdXJpbmcgTFNGL01NL0JQRiwgd2UgY29uZHVj
dGVkIHRob3JvdWdoCj4gdGVzdGluZyBvbiBBbmRyb2lkIHBob25lcyB0byBkZXRlcm1pbmUgd2hl
dGhlciBwZXJmb3JtaW5nCj4gSS9PIGluIGBmaWxlbWFwX2ZhdWx0KClgIGNhbiBibG9jayBgdm1h
X3N0YXJ0X3dyaXRlKClgLgo+IEkgd2FudGVkIHRvIGdpdmUgYSBxdWljayB1cGRhdGUgb24gdGhp
cyBxdWVzdGlvbi4KPiAKPiBOYW56aGUgYXQgWGlhb21pIGNyZWF0ZWQgdHJhY2luZyBzY3JpcHRz
IGFuZCByYW4gdmFyaW91cwo+IGFwcGxpY2F0aW9ucyBvbiBBbmRyb2lkIGRldmljZXMgd2l0aCBJ
L08gcGVyZm9ybWVkIHVuZGVyCj4gdGhlIFZNQSBsb2NrIGluIGBmaWxlbWFwX2ZhdWx0KClgLiBX
ZSBmb3VuZCB0aGF0Ogo+IAo+IDEuIFRoZXJlIGFyZSB2ZXJ5IGZldyBjYXNlcyB3aGVyZSB1bm1h
cCgpIGlzIGJsb2NrZWQgYnkKPiAgICBwYWdlIGZhdWx0cy4gSSBhc3N1bWUgdGhpcyBpcyBkdWUg
dG8gYnVnZ3kgdXNlciBjb2RlCj4gICAgb3IgcG9vciBzeW5jaHJvbml6YXRpb24gYmV0d2VlbiBy
ZWFkcyBhbmQgdW5tYXAoKS4KPiBTbyBJIGFzc3VtZSBpdCBpcyBub3QgYSBwcm9ibGVtLgo+IAo+
IDIuIFdlIG9ic2VydmVkIG1hbnkgY2FzZXMgd2hlcmUgYHZtYV9zdGFydF93cml0ZSgpYAo+ICAg
IGlzIGJsb2NrZWQgYnkgcGFnZS1mYXVsdCBJL08gaW4gc29tZSBhcHBsaWNhdGlvbnMuCj4gICAg
VGhlIGJsb2NraW5nIG9jY3VycyBpbiB0aGUgYGR1cF9tbWFwKClgIHBhdGggZHVyaW5nCj4gICAg
Zm9yaygpLgo+IAo+IFdpdGggU3VyZW4ncyBjb21taXQgZmI0OWM0NTUzMjNmZiAoImZvcms6IGxv
Y2sgVk1BcyBvZgo+IHRoZSBwYXJlbnQgcHJvY2VzcyB3aGVuIGZvcmtpbmciKSwgd2Ugbm93IGFs
d2F5cyBob2xkCj4gYHZtYV93cml0ZV9sb2NrKClgIGZvciBlYWNoIFZNQS4gTm90ZSB0aGF0IHRo
ZQo+IGBtbWFwX2xvY2tgIHdyaXRlIGxvY2sgaXMgYWxzbyBoZWxkLCB3aGljaCBjb3VsZCBsZWFk
IHRvCj4gY2hhaW5lZCB3YWl0aW5nIGlmIHBhZ2UtZmF1bHQgSS9PIGlzIHBlcmZvcm1lZCB3aXRo
b3V0Cj4gcmVsZWFzaW5nIHRoZSBWTUEgbG9jay4KPiAKPiBNeSBndXQgZmVlbGluZyBpcyB0aGF0
IFN1cmVuJ3MgY29tbWl0IG1heSBiZSBvdmVyc2hvb3RpbmcsCj4gc28gbXkgcm91Z2ggaWRlYSBp
cyB0aGF0IHdlIG1pZ2h0IHdhbnQgdG8gZG8gc29tZXRoaW5nIGxpa2UKPiB0aGUgZm9sbG93aW5n
ICh3ZSBoYXZlbid0IHRlc3RlZCBpdCB5ZXQgYW5kIGl0IG1pZ2h0IGJlCj4gd3JvbmcpOgo+IAo+
IGRpZmYgLS1naXQgYS9tbS9tbWFwLmMgYi9tbS9tbWFwLmMKPiBpbmRleCAyMzExYWU3YzJmZjQu
LjVkZGFmMjk3ZjMxYSAxMDA2NDQKPiAtLS0gYS9tbS9tbWFwLmMKPiArKysgYi9tbS9tbWFwLmMK
PiBAQCAtMTc2Miw3ICsxNzYyLDEzIEBAIF9fbGF0ZW50X2VudHJvcHkgaW50IGR1cF9tbWFwKHN0
cnVjdCBtbV9zdHJ1Y3QKPiAqbW0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm9sZG1tKQo+ICAgICAgICAg
Zm9yX2VhY2hfdm1hKHZtaSwgbXBudCkgewo+ICAgICAgICAgICAgICAgICBzdHJ1Y3QgZmlsZSAq
ZmlsZTsKPiAKPiAtICAgICAgICAgICAgICAgcmV0dmFsID0gdm1hX3N0YXJ0X3dyaXRlX2tpbGxh
YmxlKG1wbnQpOwo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAgKiBGb3Ig
YW5vbnltb3VzIG9yIHdyaXRhYmxlIHByaXZhdGUgVk1BcywgcHJldmVudAo+ICsgICAgICAgICAg
ICAgICAgKiBjb25jdXJyZW50IENvVyBmYXVsdHMuCj4gKyAgICAgICAgICAgICAgICAqLwo+ICsg
ICAgICAgICAgICAgICBpZiAoIW1wbnQtPnZtX2ZpbGUgfHwgKCEobXBudC0+dm1fZmxhZ3MgJiBW
TV9TSEFSRUQpICYmCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICht
cG50LT52bV9mbGFncyAmIFZNX1dSSVRFKSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dmFsID0gdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKG1wbnQpOwoKTGlrZWx5IGlzX2Nvd19tYXBw
aW5nKCkgaXMgd2hhdCB5b3Ugd291bGQgd2FudCB0byBjaGVjayB0byBoYW5kbGUgVk1BcyB0aGF0
CmNvdWxkIGhhdmUgYW5vbnltb3VzIHBhZ2VzIGluIHRoZW0uCgotLSAKQ2hlZXJzLAoKRGF2aWQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
