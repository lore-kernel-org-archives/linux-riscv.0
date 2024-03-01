Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E37C1C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WudCuSTxRpVnvwlueRXYN5wRAuGtIGlAsLWshNG0gv8=; b=znds7odrmyDgMH
	avqdxw3A7qmYRH5QzZKCCHQeDguKQwARfiTesc69MisVNKTkuGWy62dQ+DqEQpt1//3zvrJx3S2Ji
	Nt/YenkjgtV34bk6q4aK40ohI82q1hjwEzsmCCux39YQPCeTZl8iMU6zIL60awXHzaZZh9/4xHaSk
	0sXVog9kppeis6ve1J8n0e+qlOctsXsJEhqHuCDjHmnwVvGCRX7PpVuYZ3WHYVN2w0mXYKoltqqP8
	akCdA/XEvD1rNNtwl/mmUmC562szbzsEtT1yrWzQJr00yqxsyZKZ5QKRcCQ64fc/A1ea75VuFUjnm
	4hM51OuTjHOIH9wPmUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1DT-000000002Lc-1u0l;
	Fri, 01 Mar 2024 11:38:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1DP-000000002Ja-1h7Z;
	Fri, 01 Mar 2024 11:38:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DD371FB;
	Fri,  1 Mar 2024 03:38:47 -0800 (PST)
Received: from [10.57.68.58] (unknown [10.57.68.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E30923F6C4;
	Fri,  1 Mar 2024 03:38:06 -0800 (PST)
Message-ID: <63b9dc1c-7bf6-4de7-8d23-cf54e3408207@arm.com>
Date: Fri, 1 Mar 2024 11:38:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-GB
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
 <b99f47f9-18d0-4619-aae7-19274197b85e@arm.com>
 <CAHVXubiH64beFuB_GHSq5BKCus=O_+bqYTCwWQ+=2Q-F=T=ctQ@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAHVXubiH64beFuB_GHSq5BKCus=O_+bqYTCwWQ+=2Q-F=T=ctQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_033811_637407_4784C185 
X-CRM114-Status: GOOD (  23.36  )
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

T24gMDEvMDMvMjAyNCAxMToyOSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IEhpIFJ5YW4sCj4g
Cj4gT24gRnJpLCBNYXIgMSwgMjAyNCBhdCAxMTo0NeKAr0FNIFJ5YW4gUm9iZXJ0cyA8cnlhbi5y
b2JlcnRzQGFybS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBBbGV4YW5kcmUsCj4+Cj4+IEkgY29uZmVz
cyBJIGhhdmVuJ3QgbG9va2VkIGF0IHRoZSBwYXRjaGVzIHlldCwgYnV0IHRoaXMgY292ZXIgbGV0
dGVyIHJhaXNlcyBhCj4+IGZldyBxdWVzaW9ucyBmb3IgbWUuIEknbGwgYWltIHRvIGxvb2sgYXQg
dGhlIGFjdHVhbCBwYXRjaGVzIGluIGR1ZSBjb3Vyc2UuCj4+Cj4+IE9uIDAxLzAzLzIwMjQgMDk6
MTQsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4+IFRoaXMgcGF0Y2hzZXQgaW50ZW5kcyB0byBt
ZXJnZSB0aGUgY29udGlndW91cyBwdGVzIGh1Z2V0bGJmcyBpbXBsZW1lbnRhdGlvbgo+Pj4gb2Yg
YXJtNjQgYW5kIHJpc2N2Lgo+Pj4KPj4+IEJvdGggYXJtNjQgYW5kIHJpc2N2IHN1cHBvcnQgdGhl
IHVzZSBvZiBjb250aWd1b3VzIHB0ZXMgdG8gbWFwIHBhZ2VzIHRoYXQKPj4+IGFyZSBsYXJnZXIg
dGhhbiB0aGUgZGVmYXVsdCBwYWdlIHRhYmxlIHNpemUsIHJlc3BlY3RpdmVseSBjYWxsZWQgY29u
dHB0ZQo+Pj4gYW5kIHN2bmFwb3QuCj4+Pgo+Pj4gVGhlIHJpc2N2IGltcGxlbWVudGF0aW9uIGRp
ZmZlcnMgZnJvbSB0aGUgYXJtNjQncyBpbiB0aGF0IHRoZSBMU0JzIG9mIHRoZQo+Pj4gcGZuIG9m
IGEgc3ZuYXBvdCBwdGUgYXJlIHVzZWQgdG8gc3RvcmUgdGhlIHNpemUgb2YgdGhlIG1hcHBpbmcs
IGFsbG93aW5nCj4+PiBmb3IgZnV0dXJlIHNpemVzIHRvIGJlIGFkZGVkIChmb3Igbm93IG9ubHkg
NjRLQiBpcyBzdXBwb3J0ZWQpLiBUaGF0J3MgYW4KPj4+IGlzc3VlIGZvciB0aGUgY29yZSBtbSBj
b2RlIHdoaWNoIGV4cGVjdHMgdG8gZmluZCB0aGUgKnJlYWwqIHBmbiBhIHB0ZSBwb2ludHMKPj4+
IHRvLiBQYXRjaCAxIGZpeGVzIHRoYXQgYnkgYWx3YXlzIHJldHVybmluZyBzdm5hcG90IHB0ZXMg
d2l0aCB0aGUgcmVhbCBwZm4KPj4+IGFuZCByZXN0b3JlcyB0aGUgc2l6ZSBvZiB0aGUgbWFwcGlu
ZyB3aGVuIGl0IGlzIHdyaXR0ZW4gdG8gYSBwYWdlIHRhYmxlLgo+Pgo+PiBZZXMgdGhhdCBtYWtl
cyBzZW5zZSB0byBtZS4gVGhlIGludGVudGlvbiBmb3IgbVRIUCAoIWh1Z2V0bGIpIGlzIHRvIGZ1
bGx5Cj4+IGVuY2Fwc3VsYXRlIFBURXMgYmVpbmQgc2V0X3B0ZXMoKSwgcHRlcF9nZXQoKSBhbmQg
ZnJpZW5kcywgc28gd2hhdCdzIGFjdHVhbGx5Cj4+IHdyaXR0ZW4gdG8gdGhlIHBndGFibGUgaXMg
YXJjaC1zcGVjaWZpYyBhbmQgd2VsbCBhYnN0cmFjdGVkLgo+Pgo+Pj4KPj4+IFRoZSBmb2xsb3dp
bmcgcGF0Y2hlcyBhcmUganVzdCBtZXJnZXMgb2YgdGhlIDIgZGlmZmVyZW50IGltcGxlbWVudGF0
aW9ucwo+Pj4gdGhhdCBjdXJyZW50bHkgZXhpc3QgaW4gYXJtNjQgYW5kIHJpc2N2IHdoaWNoIGFy
ZSB2ZXJ5IHNpbWlsYXIuIEl0IHBhdmVzCj4+PiB0aGUgd2F5IHRvIHRoZSByZXVzZSBvZiB0aGUg
cmVjZW50IGNvbnRwdGUgVEhQIHdvcmsgYnkgUnlhbiBbMV0gdG8gYXZvaWQKPj4+IHJlaW1wbGVt
ZW50aW5nIHRoZSBzYW1lIGluIHJpc2N2Lgo+Pgo+PiBZb3Ugc2VlbSB0byBiZSB0YWxraW5nIGFi
b3V0IGJvdGggaHVnZXRsYiAod2hpY2ggdXNlcyB0aGUgImh1Z2UiIHB0ZSBoZWxwZXJzKQo+PiBh
bmQgY29udHB0ZSBmb3IgVEhQIChpLmUuIG1USFAsIHdoaWNoIHVzZXMgdGhlIHJlZ3VsYXIgcHRl
IGhlbHBlcnMpLiBUaGV5IGFyZQo+PiBwcmV0dHkgc2VwYXJhdGUgaW4gbXkgbWluZCwgc28gbm90
IHN1cmUgd2h5IHlvdSB3b3VsZCBiZSBtb2RpZnlpbmcgdGhlbSBib3RoIGluCj4+IHRoZSBzYW1l
IHNlcmllcz8KPiAKPiBJIGRvbid0LCB0aGlzIHBhdGNoc2V0IG9ubHkgZGVhbHMgd2l0aCBodWdl
dGxiLCBJIGp1c3QgbWVhbnQgdGhhdCB0aGlzCj4gc2VyaWVzIHdhcyBqdXN0IHRoZSBiZWdpbm5p
bmcgYXMgSSdtIHdvcmtpbmcgb24gbW92aW5nIHRoZSBjb250cHRlIGZvcgo+IFRIUCBzdXBwb3J0
IGluIHRoZSBnZW5lcmljIGNvZGUgZm9yIHJpc2N2IHRvIHVzZS4KCkFoaCBnb3QgaXQhIFRoYW5r
cyBmb3IgdGhlIGV4cGxhbmF0aW9uLgoKPiAKPiBTb3JyeSBteSB3b3JkaW5nIHdhcyBhbWJpZ3Vv
dXMgOikKPiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAo+Pgo+PiBUaGFua3MsCj4+IFJ5YW4KPj4K
Pj4+Cj4+PiBUaGlzIHBhdGNoc2V0IHdhcyB0ZXN0ZWQgYnkgcnVubmluZyB0aGUgbGliaHVnZXRs
YmZzIHRlc3RzdWl0ZSB3aXRoIDY0S0IKPj4+IGFuZCAyTUIgcGFnZXMgb24gYm90aCBhcmNoaXRl
Y3R1cmVzIChvbiBhIDRLQiBiYXNlIHBhZ2Ugc2l6ZSBhcm02NCBrZXJuZWwpLgo+Pj4KPj4+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIwMjQwMjE1MTAzMjA1
LjI2MDcwMTYtMS1yeWFuLnJvYmVydHNAYXJtLmNvbS8KPj4+Cj4+PiBBbGV4YW5kcmUgR2hpdGkg
KDkpOgo+Pj4gICByaXNjdjogUmVzdG9yZSB0aGUgcGZuIGluIGEgTkFQT1QgcHRlIHdoZW4gbWFu
aXB1bGF0ZWQgYnkgY29yZSBtbSBjb2RlCj4+PiAgIHJpc2N2OiBTYWZlbHkgcmVtb3ZlIGh1Z2Vf
cHRlX29mZnNldCgpIHdoZW4gbWFuaXB1bGF0aW5nIE5BUE9UIHB0ZXMKPj4+ICAgbW06IFVzZSBj
b21tb24gaHVnZV9wdGVwX2dldCgpIGZ1bmN0aW9uIGZvciByaXNjdi9hcm02NAo+Pj4gICBtbTog
VXNlIGNvbW1vbiBzZXRfaHVnZV9wdGVfYXQoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPj4+
ICAgbW06IFVzZSBjb21tb24gaHVnZV9wdGVfY2xlYXIoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJt
NjQKPj4+ICAgbW06IFVzZSBjb21tb24gaHVnZV9wdGVwX2dldF9hbmRfY2xlYXIoKSBmdW5jdGlv
biBmb3IgcmlzY3YvYXJtNjQKPj4+ICAgbW06IFVzZSBjb21tb24gaHVnZV9wdGVwX3NldF9hY2Nl
c3NfZmxhZ3MoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPj4+ICAgbW06IFVzZSBjb21tb24g
aHVnZV9wdGVwX3NldF93cnByb3RlY3QoKSBmdW5jdGlvbiBmb3IgcmlzY3YvYXJtNjQKPj4+ICAg
bW06IFVzZSBjb21tb24gaHVnZV9wdGVwX2NsZWFyX2ZsdXNoKCkgZnVuY3Rpb24gZm9yIHJpc2N2
L2FybTY0Cj4+Pgo+Pj4gIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICAgICAgICAgIHwgICAx
ICsKPj4+ICBhcmNoL2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICB8ICA1OSArKysrKy0K
Pj4+ICBhcmNoL2FybTY0L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICB8IDI5MSArLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwo+Pj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHVnZXRsYi5oICAgIHwgICAy
ICstCj4+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmggfCAgMTEgKysKPj4+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICB8IDEyMCArKysrKysrKysrKy0K
Pj4+ICBhcmNoL3Jpc2N2L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICB8IDIyNyAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCj4+PiAgbW0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
IDMgKwo+Pj4gIG1tL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKPj4+
ICBtbS9jb250cHRlLmMgICAgICAgICAgICAgICAgICAgICAgICB8IDI2OCArKysrKysrKysrKysr
KysrKysrKysrKysrCj4+PiAgMTEgZmlsZXMgY2hhbmdlZCwgNDU2IGluc2VydGlvbnMoKyksIDUy
OCBkZWxldGlvbnMoLSkKPj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbW0vY29udHB0ZS5jCj4+Pgo+
PgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
