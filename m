Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98456EC1EA7
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 11:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=erPolokfY3cS95WwIbOyry8y8Z5qj0Nal+4Mt4dBpf8=; b=iR0GHiNVngyp/r
	homKw6PafihWexm/YHqgHuxrQujCCjd0n2S/fD3t0l+0NkKxiVz/15YE6dgj1obEbdAnlLiCTslk1
	Y9N2rY2KTE+GzZjmsfdDgyBdwwkz3yeIvDLgG08B2p9ncZeS4vzN1oATuvTuZFAsRiV2ICRjHtNBa
	F4D2PBw8DqNvGQwm+JUdm6iJHeNDUvC5WvP9Se8yHWFO8bys3y9sLA8COPP4vhNxmPtn5oPe6hpN6
	SD9Hh9uuAiwDBQgqaj1gVBoRK0+Cd6z0v+Ggz0w7pMmouWuIVJOSs4MUhqvwFVhtNvG+cx13hDZZD
	GXqWanIFFDRweC88G34g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vny0X-00000009r1w-38cf;
	Thu, 05 Feb 2026 11:58:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vny0W-00000009r1p-11XL
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 11:58:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 192EC6013B;
	Thu,  5 Feb 2026 11:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D731FC16AAE;
	Thu,  5 Feb 2026 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770292726;
	bh=GDq3H3vjByLJ3Ey0kNEDQ9d9kRtQLl25iHAO3wBE/5c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XhP7ik1LXXfjNBnyfS22rv87pd9aNzA7BcYBKsfG9RyitOwBNzkdha7F1F7HZtWZr
	 RKBCmDD51vVC22UoKfyH6wrLbffbTfdiC0gTQD1JCJbEACzWG3TJwKQG/VkBznINwu
	 /ZA4R3A3YI4nncmqbyPAzJA02dOTh2cDW8EN8Ao7jJ3aA77B5XeVNy/ovVk5CZ8w8X
	 e1Y+tNsNKXvgMZKwU9kCYPB4yfbIR1uDWadA8KUph+ddThGFdlkvOYT/Qwb5KlwwBB
	 0Jwoq95Os8O3bf9Vk7HiDT6jtCWjHqVHLE0NxlQQrPerNxMnNkhUWXvnE8Ti5NvXpy
	 eGcEwZJrSTb6A==
Message-ID: <8deb6010-3abd-48dd-8b77-40dbf2d48c65@kernel.org>
Date: Thu, 5 Feb 2026 12:58:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 02/17] mm: Change the interface of prep_compound_tail()
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-3-kas@kernel.org>
 <a61bc0a8-cf5a-418a-aeb4-96553b87f043@kernel.org>
 <aYR-YULI3lBtl9y_@thinkstation>
From: "David Hildenbrand (arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <aYR-YULI3lBtl9y_@thinkstation>
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

T24gMi81LzI2IDEyOjM1LCBLaXJ5bCBTaHV0c2VtYXUgd3JvdGU6Cj4gT24gV2VkLCBGZWIgMDQs
IDIwMjYgYXQgMDU6MTQ6MTJQTSArMDEwMCwgRGF2aWQgSGlsZGVuYnJhbmQgKGFybSkgd3JvdGU6
Cj4+IE9uIDIvMi8yNiAxNjo1NiwgS2lyeWwgU2h1dHNlbWF1IHdyb3RlOgo+Pj4gSW5zdGVhZCBv
ZiBwYXNzaW5nIGRvd24gdGhlIGhlYWQgcGFnZSBhbmQgdGFpbCBwYWdlIGluZGV4LCBwYXNzIHRo
ZSB0YWlsCj4+PiBhbmQgaGVhZCBwYWdlcyBkaXJlY3RseSwgYXMgd2VsbCBhcyB0aGUgb3JkZXIg
b2YgdGhlIGNvbXBvdW5kIHBhZ2UuCj4+Pgo+Pj4gVGhpcyBpcyBhIHByZXBhcmF0aW9uIGZvciBj
aGFuZ2luZyBob3cgdGhlIGhlYWQgcG9zaXRpb24gaXMgZW5jb2RlZCBpbgo+Pj4gdGhlIHRhaWwg
cGFnZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBLaXJ5bCBTaHV0c2VtYXUgPGthc0BrZXJuZWwu
b3JnPgo+Pj4gUmV2aWV3ZWQtYnk6IE11Y2h1biBTb25nIDxtdWNodW4uc29uZ0BsaW51eC5kZXY+
Cj4+PiBSZXZpZXdlZC1ieTogWmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4KPj4+IC0tLQo+Pj4gICAg
aW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmggfCAgNCArKystCj4+PiAgICBtbS9odWdldGxiLmMg
ICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tCj4+PiAgICBtbS9pbnRlcm5hbC5oICAgICAgICAg
ICAgICB8IDEyICsrKysrKy0tLS0tLQo+Pj4gICAgbW0vbW1faW5pdC5jICAgICAgICAgICAgICAg
fCAgMiArLQo+Pj4gICAgbW0vcGFnZV9hbGxvYy5jICAgICAgICAgICAgfCAgMiArLQo+Pj4gICAg
NSBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4+Cj4+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmggYi9pbmNsdWRlL2xpbnV4
L3BhZ2UtZmxhZ3MuaAo+Pj4gaW5kZXggZjdhMGU0YWYwYzczLi44YTM2OTQzNjllMTUgMTAwNjQ0
Cj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaAo+Pj4gKysrIGIvaW5jbHVkZS9s
aW51eC9wYWdlLWZsYWdzLmgKPj4+IEBAIC04NjUsNyArODY1LDkgQEAgc3RhdGljIGlubGluZSBi
b29sIGZvbGlvX3Rlc3RfbGFyZ2UoY29uc3Qgc3RydWN0IGZvbGlvICpmb2xpbykKPj4+ICAgIAly
ZXR1cm4gZm9saW9fdGVzdF9oZWFkKGZvbGlvKTsKPj4+ICAgIH0KPj4+IC1zdGF0aWMgX19hbHdh
eXNfaW5saW5lIHZvaWQgc2V0X2NvbXBvdW5kX2hlYWQoc3RydWN0IHBhZ2UgKnBhZ2UsIHN0cnVj
dCBwYWdlICpoZWFkKQo+Pj4gK3N0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBzZXRfY29tcG91
bmRfaGVhZChzdHJ1Y3QgcGFnZSAqcGFnZSwKPj4+ICsJCQkJCSAgICAgIGNvbnN0IHN0cnVjdCBw
YWdlICpoZWFkLAo+Pj4gKwkJCQkJICAgICAgdW5zaWduZWQgaW50IG9yZGVyKQo+Pgo+PiBUd28g
dGFiIGluZGVudHMgcGxlYXNlIG9uIHNlY29uZCsgcGFyYW1ldGVyIGxpc3Qgd2hlbmV2ZXIgeW91
IHRvdWNoIGNvZGUuCj4gCj4gRG8gd2UgaGF2ZSB0aGlzIGNvZGluZyBzdHlsZSBwcmVmZXJlbmNl
IHdyaXR0ZW4gZG93biBzb21ld2hlcmU/CgpHb29kIHF1ZXN0aW9uLiBJIGFzc3VtZSBub3QuIEJ1
dCBpdCdzIHdoYXQgd2UgZG8gaW4gTU0gOikKCj4gCj4gLXRpcCB0cmVlIHdhbnRzIHRoZSBvcHBv
c2l0ZS4gRG9jdW1lbnRhdGlvbi9wcm9jZXNzL21haW50YWluZXItdGlwLnJzdDoKPiAKPiAJV2hl
biBzcGxpdHRpbmcgZnVuY3Rpb24gZGVjbGFyYXRpb25zIG9yIGZ1bmN0aW9uIGNhbGxzLCB0aGVu
IHBsZWFzZSBhbGlnbgo+IAl0aGUgZmlyc3QgYXJndW1lbnQgaW4gdGhlIHNlY29uZCBsaW5lIHdp
dGggdGhlIGZpcnN0IGFyZ3VtZW50IGluIHRoZSBmaXJzdAo+IAlsaW5lOjoKPiAKPiBJIHdhbnQg
dGhlIGVkaXRvciB0byBkbyBUaGUgUmlnaHQgVGhpbmfihKIgd2l0aG91dCBteSBicmFpbiBpbnZv
bHZlbWVudC4KPiBIYXZpbmcgZGlmZmVyZW50IGNvZGluZyBzdHlsZXMgaW4gZGlmZmVyZW50IGNv
cm5lcnMgb2YgdGhlIGtlcm5lbCBtYWtlcwo+IGl0IGhhcmQuCgpZZWFoLCBidXQgdW5hdm9pZGFi
bGUuIDopCgotLSAKQ2hlZXJzLAoKRGF2aWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
