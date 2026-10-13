Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324BCCC6B19
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P58pwRjH19Lb2XgbpS6+isjBJ7A202OOxUEHlxduKig=; b=BlRqdZ0nZ/JV24
	WbWleWI0xA+TZOpsB9HSyuWPpJTelTiiK2sSXbKw2SJOWJDxDwwbE4QRYHbJE368Jaz4P0GiN7GPP
	t0eoDAguUJRjF0AI+EW3/6d+VjDKLTt6sJBGg8lrMnxrV7V86ovKfvTUIblUx+0vu4bDysAIcbo2n
	4REvbPFlzX3JdS8Jgta9/SLu2JjiDv5KpKpQwBywFe6FXFvkm+0PNRqxc0hXooXw10iHxvvGs5v+c
	vRbPZ03m85NmWRLJQSmm+Z/BKg0ijXJMTO/4K/R1JDpG+VCFrY8oVuegi5+UuHuz91fhz7hxoypR6
	RBg577YAWv5NmuToKr+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGehs-0000000DPMj-3pQI;
	Tue, 13 Oct 2026 15:46:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGehn-0000000DPLQ-2bBW;
	Tue, 13 Oct 2026 15:46:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3BEF1650;
	Tue, 13 Oct 2026 08:46:11 -0700 (PDT)
Received: from [10.57.13.106] (unknown [10.57.13.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B34B3F673;
	Tue, 13 Oct 2026 08:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791906375; bh=XuWA6CDAD0oKpnT54prmMz8xHDjG+uiR1e6XzEDjg3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZjFOOBmKsahlAoLaaCP80butvn34rJwBxI/KlXTDwEbOHXbvc9w6p2iFn5xnwkUbY
	 8pX/C4RRzfAkFQXwAN03mQEp1RDWDe34NtNMndsb900iRhte6mST01qKnGH7YZpnF8
	 66UGXrxvp+Iivp9v6L5hUgLq6glrE6G5Ev0gmlEU=
Message-ID: <2552e0bd-0e50-4dd5-a3d9-00e9204eb2c2@arm.com>
Date: Tue, 13 Oct 2026 17:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] mm: fix missing page-table destructor in
 pagetable_free()
To: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Dave Hansen <dave.hansen@intel.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alistair Popple <apopple@nvidia.com>, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Muchun Song <muchun.song@linux.dev>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
 <20261010112457.49485-2-songmuchun@bytedance.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20261010112457.49485-2-songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084619_734964_05CF2115 
X-CRM114-Status: GOOD (  25.65  )
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

T24gMTAvMTAvMjAyNiAxMzoyNCwgTXVjaHVuIFNvbmcgd3JvdGU6Cj4gU2luY2UgY29tbWl0IDQ5
ZjU5OTY2NjQyMCAoIm1tOiBjYWxsIGN0b3IvZHRvciBmb3Iga2VybmVsIFBURXMiKSwKPiBwdGVf
YWxsb2Nfb25lX2tlcm5lbCgpIHJ1bnMgdGhlIHBhZ2UtdGFibGUgY29uc3RydWN0b3IgZm9yIGtl
cm5lbCBQVEUKPiB0YWJsZXMuCj4KPiBIVk8gKEh1Z2VUTEIgVm1lbW1hcCBPcHRpbWl6YXRpb24p
IHVzZXMgcHRlX2FsbG9jX29uZV9rZXJuZWwoKSB3aGVuCj4gc3BsaXR0aW5nIGEgUE1ELiBSZXN0
b3JpbmcgdGhlIHZtZW1tYXAgYmFja2luZyBwYWdlcyBkb2VzIG5vdCBjb2xsYXBzZQo+IHRoZSBQ
VEUgdGFibGUsIHNvIGEgbGF0ZXIgbWVtb3J5IGhvdC1yZW1vdmUgZXZlbnR1YWxseSBmcmVlcyBp
dCB0aHJvdWdoCj4gcGFnZXRhYmxlX2ZyZWUoKSBvbiB4ODYtNjQuIFRoYXQgcmVsZWFzZXMgdGhl
IHBhZ2Ugd2l0aG91dCBydW5uaW5nIHRoZQo+IG1hdGNoaW5nIGRlc3RydWN0b3IgYW5kIGxlYXZl
cyBOUl9QQUdFVEFCTEUgZWxldmF0ZWQuCj4KPiBNYWtlIHBhZ2V0YWJsZV9mcmVlKCkgZGV0ZWN0
IGNvbnN0cnVjdG9yLWJhY2tlZCBwYWdlcyBhbmQgcnVuIHRoZQo+IGRlc3RydWN0b3IgYmVmb3Jl
IHJlbGVhc2luZyB0aGVpciBtZW1vcnkgdG8gZml4IHRoZSBwcm9ibGVtLgo+Cj4gRml4ZXM6IDQ5
ZjU5OTY2NjQyMCAoIm1tOiBjYWxsIGN0b3IvZHRvciBmb3Iga2VybmVsIFBURXMiKQo+IENjOiBz
dGFibGVAdmdlci5rZXJuZWwub3JnCj4gQXNzaXN0ZWQtYnk6IExMTQo+IFNpZ25lZC1vZmYtYnk6
IE11Y2h1biBTb25nIDxzb25nbXVjaHVuQGJ5dGVkYW5jZS5jb20+Cj4gLS0tCj4gdjI6Cj4gLSBN
b3ZlIGRlc3RydWN0b3IgaGFuZGxpbmcgZnJvbSB4ODYgaW50byBwYWdldGFibGVfZnJlZSgpIChz
dWdnZXN0ZWQgYnkKPiAgIERhdmlkIEhpbGRlbmJyYW5kKQo+IC0gVHJpbSBhbmQgdXBkYXRlIHRo
ZSBjb21taXQgbWVzc2FnZSAocmVxdWVzdGVkIGJ5IERhdmUgSGFuc2VuKQo+IC0tLQo+ICBpbmNs
dWRlL2xpbnV4L21tLmggfCAzNyArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBp
bmRleCA1Y2NhOTBmYzFkZjYuLjc3MWE3ZDYwYjBhNSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xp
bnV4L21tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKPiBAQCAtMzk2OSwyMyArMzk2OSw2
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwYWdldGFibGVfZnJlZV9rZXJuZWwoc3RydWN0IHB0ZGVz
YyAqcHQpCj4gIAlfX3BhZ2V0YWJsZV9mcmVlKHB0KTsKPiAgfQo+ICAjZW5kaWYKPiAtLyoqCj4g
LSAqIHBhZ2V0YWJsZV9mcmVlIC0gRnJlZSBwYWdldGFibGVzCj4gLSAqIEBwdDoJVGhlIHBhZ2Ug
dGFibGUgZGVzY3JpcHRvcgo+IC0gKgo+IC0gKiBwYWdldGFibGVfZnJlZSBmcmVlcyB0aGUgbWVt
b3J5IG9mIGFsbCBwYWdlIHRhYmxlcyBkZXNjcmliZWQgYnkgYSBwYWdlCj4gLSAqIHRhYmxlIGRl
c2NyaXB0b3IgYW5kIHRoZSBtZW1vcnkgZm9yIHRoZSBkZXNjcmlwdG9yIGl0c2VsZi4KPiAtICov
Cj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBwYWdldGFibGVfZnJlZShzdHJ1Y3QgcHRkZXNjICpwdCkK
PiAtewo+IC0JaWYgKHB0ZGVzY190ZXN0X2tlcm5lbChwdCkpIHsKPiAtCQlwdGRlc2NfY2xlYXJf
a2VybmVsKHB0KTsKPiAtCQlwYWdldGFibGVfZnJlZV9rZXJuZWwocHQpOwo+IC0JfSBlbHNlIHsK
PiAtCQlfX3BhZ2V0YWJsZV9mcmVlKHB0KTsKPiAtCX0KPiAtfQo+IC0KPiAgI2lmIGRlZmluZWQo
Q09ORklHX1NQTElUX1BURV9QVExPQ0tTKQo+ICAjaWYgQUxMT0NfU1BMSVRfUFRMT0NLUwo+ICB2
b2lkIF9faW5pdCBwdGxvY2tfY2FjaGVfaW5pdCh2b2lkKTsKPiBAQCAtNDA3OCw2ICs0MDYxLDI2
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBwYWdldGFibGVfZHRvcihzdHJ1Y3QgcHRkZXNjICpwdGRl
c2MpCj4gIAlscnV2ZWNfc3RhdF9zdWJfZm9saW8oZm9saW8sIE5SX1BBR0VUQUJMRSk7Cj4gIH0K
PiAgCj4gKy8qKgo+ICsgKiBwYWdldGFibGVfZnJlZSAtIEZyZWUgcGFnZXRhYmxlcwo+ICsgKiBA
cHQ6CVRoZSBwYWdlIHRhYmxlIGRlc2NyaXB0b3IKPiArICoKPiArICogcGFnZXRhYmxlX2ZyZWUg
ZnJlZXMgdGhlIG1lbW9yeSBvZiBhbGwgcGFnZSB0YWJsZXMgZGVzY3JpYmVkIGJ5IGEgcGFnZQo+
ICsgKiB0YWJsZSBkZXNjcmlwdG9yIGFuZCB0aGUgbWVtb3J5IGZvciB0aGUgZGVzY3JpcHRvciBp
dHNlbGYuCj4gKyAqLwo+ICtzdGF0aWMgaW5saW5lIHZvaWQgcGFnZXRhYmxlX2ZyZWUoc3RydWN0
IHB0ZGVzYyAqcHQpCj4gK3sKPiArCWlmIChQYWdlVGFibGUocHRkZXNjX3BhZ2UocHQpKSkKPiAr
CQlwYWdldGFibGVfZHRvcihwdCk7CgpUb29rIG1lIGEgd2hpbGUgdG8gdW5kZXJzdGFuZCB3aHkg
dGhpcyBpcyBmaW5lLiBDdXJyZW50bHkgd2UgaGF2ZToKCsKgIMKgIHB0ZGVzYyA9IHBhZ2V0YWJs
ZV9hbGxvYygpOwrCoCDCoCBwYWdldGFibGVfKl9jdG9yKG1tLCBwdGRlc2MpOwrCoCDCoCBbLi4u
XQrCoCDCoCBwYWdldGFibGVfZHRvcihwdGRlc2MpOwrCoCDCoCBwYWdldGFibGVfZnJlZShwdGRl
c2MpOwoKQWxsIGdvb2QsIG5pY2UgYW5kIGJhbGFuY2VkLgoKTm93IHdlJ3JlIHNheWluZyB0aGF0
IHBhZ2V0YWJsZV9mcmVlKCkgc2hvdWxkIGNhbGwgdGhlIGR0b3IuIEJ1dCBvZgpjb3Vyc2UsIGlu
IG1vc3QgY2FzZXMsIHRoZSBkdG9yIGhhcyBhbHJlYWR5IGJlZW4gY2FsbGVkLiBZZXMsIHRoaXMg
aXMKZmluZSBiZWNhdXNlIGluIHRoYXQgY2FzZSBQYWdlVGFibGUocGFnZSkgcmV0dXJucyBmYWxz
ZS4gU3RpbGwsIHRoZQpjYXN1YWwgcmVhZGVyIGlzIGxpa2VseSB0byBiZSBjb25mdXNlZCAobGlr
ZSBJIHdhcykuCgpUaGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHJlYWxseSBleHBsYWluIHRoaXMu
IEknbSBub3QgYSBiaWcgZmFuIG9mIHRoZQphc3ltbWV0cnkgd2UncmUgY3JlYXRpbmcgYmV0d2Vl
biBleHBsaWNpdCBhbGxvYytjdG9yIGFuZCBmcmVlIGltcGxpY2l0bHkKY2FsbGluZyBkdG9yLCBi
dXQgSSBzdXBwb3NlIGl0J3Mgc2FmZXIgdGhpcyB3YXkuIChBbmQgbG9va2luZyBhdCB0aGUKcmVz
dCBvZiB0aGUgc2VyaWVzLCBpdCBkb2VzIGJyaW5nIHNvbWUgbmljZSBjbGVhbnVwcy4pCgpJIHVu
ZGVyc3RhbmQgdGhpcyBpcyBhIGJ1Z2ZpeCBzZXJpZXMgc28gaXRzIHNjb3BlIGlzIGxpbWl0ZWQs
IGJ1dCBpZgp0aW1lIGFsbG93cyBwbGVhc2UgcG9zdCBhIGZvbGxvdy11cCBzZXJpZXMgcmVtb3Zp
bmcgYWxsIHRob3NlIGV4cGxpY2l0CmR0b3IgY2FsbHMgdGhhdCBhcmUgbm8gbG9uZ2VyIHJlcXVp
cmVkLgoKTm93IGRvbid0IGdldCBtZSB3cm9uZywgSSBhbSBhYnNvbHV0ZWx5IGluIGZhdm91ciBv
ZiBtb3ZpbmcgYXMgbXVjaApoYW5kbGluZyBhcyBwb3NzaWJsZSBvdXQgb2YgdGhlIGN0b3IvZHRv
ciBhbmQgaW50bwpwYWdldGFibGVfe2FsbG9jLGZyZWV9OyBhIHNlcmllcyBJIHBvc3RlZCBlYXJs
aWVyIFsxXSB3YXMgYSBzdGVwIGluIHRoYXQKZGlyZWN0aW9uLiBJdCB1bmZvcnR1bmF0ZWx5IGhh
ZCBtYW55IGlzc3VlcywgaW5jbHVkaW5nIHRoZSB1bm1hdGNoZWQKYWxsb2MvZnJlZSBjYWxscyBb
Ml0uIFRoZSB3b3JrIHlvdSdyZSBkb2luZyBpbiB0aGlzIHNlcmllcywgYW5kIHlvdXIKcGxhbiB0
byB1c2UgcGFnZXRhYmxlX2FsbG9jKCkgZm9yIHZtZW1tYXAsIGFyZSBleGFjdGx5IHdoYXQgSSB3
YXMKcGxhbm5pbmcgdG8gZG8gbmV4dCwgc28gdGhhbmsgeW91IGZvciB0YWtpbmcgY2FyZSBvZiB0
aGF0IDopCgpXaXRoIHRoZSBjb21taXQgbWVzc2FnZSBpbXByb3ZlZDoKClJldmlld2VkLWJ5OiBL
ZXZpbiBCcm9kc2t5IDxrZXZpbi5icm9kc2t5QGFybS5jb20+CgotIEtldmluCgpbMV0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vMjAyNjA3MTQtcmVtb3ZlX3BndGFibGVfY2R0b3It
djEtMC00NGJlOGE3Njg1ZDdAYXJtLmNvbS8KWzJdCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW1tLzZkMTY3YWFhLWU5YjAtNDY4Ny05NzBjLTFjNjdkMGRmNjM0NEBhcm0uY29tLwoKPiAr
Cj4gKwlpZiAocHRkZXNjX3Rlc3Rfa2VybmVsKHB0KSkgewo+ICsJCXB0ZGVzY19jbGVhcl9rZXJu
ZWwocHQpOwo+ICsJCXBhZ2V0YWJsZV9mcmVlX2tlcm5lbChwdCk7Cj4gKwl9IGVsc2Ugewo+ICsJ
CV9fcGFnZXRhYmxlX2ZyZWUocHQpOwo+ICsJfQo+ICt9Cj4gKwo+ICBzdGF0aWMgaW5saW5lIHZv
aWQgcGFnZXRhYmxlX2R0b3JfZnJlZShzdHJ1Y3QgcHRkZXNjICpwdGRlc2MpCj4gIHsKPiAgCXBh
Z2V0YWJsZV9kdG9yKHB0ZGVzYyk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
