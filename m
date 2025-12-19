Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DDED711CA
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 06:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAQGVOy3pk/C7qTHY8cIymBenmzFR5leOlKkeTj62AU=; b=ipP4NA5E2fa0Wc
	9YyLaeJglYlfwv2h3+zuqiJHjuW82/n+lxtidPTCOeYOn/B7snlHLdrbix6VKLLZ6wHniL2U6d0Ch
	o5RdiBMVDAbnYtW1RT1OEkHaZzp7zRafCV3/MagvdemCnjotoaCA4H6tlHVXpreYucqxrWrb3Az3C
	kOwzRUcYIDHq/NG8Ir1cOU5KYWudg2r09DiVsyFCHNmb3poUwaL2xn9P3EdW8FGJXP2xCzhkRKv14
	nLJRZUMZGQ542oEGMVYu66PYznz34uYqMUQBeuHkl7sY7zxWdxQVoZaKVUMehjy6+lQPfxK6sHP2E
	1+NPeJiwWeAHm0gZLl2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTka-00000009hPn-23Ar;
	Fri, 19 Dec 2025 06:14:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTkY-00000009hPc-2hVb
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 06:14:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABCD860008;
	Fri, 19 Dec 2025 06:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00031C4CEF1;
	Fri, 19 Dec 2025 06:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766124841;
	bh=fpp+RqGdOfeNhoOl4yFFqEiGPr5KLb+tEsiopJhtJ8Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EVzl6xJHootXl5U66WYKjPigWhllML8t2eFx7gR1rzs163UBU9syfQBGmZSjw7c8i
	 z4QRSnTO7UTMa0f4OOvFAWHboC7GzOxSVkJrjH5VF0vnghM5Snl+QXNNXAS5b2mBPg
	 FzAMkkTUJq4WuNkhOMU3L6Pu4qN27vWTzJNaJcZs6y2mXcY0C52bYFUip9sYx7NE0h
	 vGBshnjTyYWtRCF5aGo3z1NwEbxrj0qN98ay/pnuCBOicyHCq3H2qQXyTTBBm5DSn6
	 G3ceP4nqOOqGUpVi1gKbgaTiLqI2gcYpaHWZq6ZyhJOTjPCDbka3UUMquhnkcVCjIB
	 ro5B91Op54COg==
Message-ID: <64a9ca24-2968-4532-ac04-594c340ec2a2@kernel.org>
Date: Fri, 19 Dec 2025 07:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov
 <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, x86@kernel.org, linux-arm64@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20251218114154.228484-1-sourabhjain@linux.ibm.com>
 <83920c44-47f5-4a46-bfa7-76713197d7e4@kernel.org>
 <1fddcf72-26f7-4fb4-84b8-1328e486d58e@linux.ibm.com>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <1fddcf72-26f7-4fb4-84b8-1328e486d58e@linux.ibm.com>
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

T24gMTIvMTgvMjUgMTQ6MDYsIFNvdXJhYmggSmFpbiB3cm90ZToKPiAKPiAKPiBPbiAxOC8xMi8y
NSAxNzozMiwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+PiBPbiAxMi8xOC8y
NSAxMjo0MSwgU291cmFiaCBKYWluIHdyb3RlOgo+Pj4gU2tpcCBwcm9jZXNzaW5nIGh1Z2VwYWdl
IGtlcm5lbCBhcmd1bWVudHMgKGh1Z2VwYWdlc3osIGh1Z2VwYWdlcywgYW5kCj4+PiBkZWZhdWx0
X2h1Z2VwYWdlc3opIHdoZW4gaHVnZXBhZ2VzIGFyZSBub3Qgc3VwcG9ydGVkIGJ5IHRoZQo+Pj4g
YXJjaGl0ZWN0dXJlLgo+Pj4KPj4+IFNvbWUgYXJjaGl0ZWN0dXJlcyBtYXkgbmVlZCB0byBkaXNh
YmxlIGh1Z2VwYWdlcyBiYXNlZCBvbiBjb25kaXRpb25zCj4+PiBkaXNjb3ZlcmVkIGR1cmluZyBr
ZXJuZWwgYm9vdC4gVGhlIGh1Z2VwYWdlc19zdXBwb3J0ZWQoKSBoZWxwZXIgYWxsb3dzCj4+PiBh
cmNoaXRlY3R1cmUgY29kZSB0byBhZHZlcnRpc2Ugd2hldGhlciBodWdlcGFnZXMgYXJlIHN1cHBv
cnRlZC4KPj4+Cj4+PiBDdXJyZW50bHksIG5vcm1hbCBodWdlcGFnZSBhbGxvY2F0aW9uIGlzIGd1
YXJkZWQgYnkKPj4+IGh1Z2VwYWdlc19zdXBwb3J0ZWQoKSwgYnV0IGdpZ2FudGljIGh1Z2VwYWdl
cyBhcmUgYWxsb2NhdGVkIHJlZ2FyZGxlc3MKPj4+IG9mIHRoaXMgY2hlY2suIFRoaXMgY2F1c2Vz
IHByb2JsZW1zIG9uIHBvd2VycGMgZm9yIGZhZHVtcCAoZmlybXdhcmUtCj4+PiBhc3Npc3RlZCBk
dW1wKS4KPj4+Cj4+PiBJbiB0aGUgZmFkdW1wIChmaXJtd2FyZS1hc3Npc3RlZCBkdW1wKSBzY2Vu
YXJpbywgYSBwcm9kdWN0aW9uIGtlcm5lbAo+Pj4gY3Jhc2ggY2F1c2VzIHRoZSBzeXN0ZW0gdG8g
Ym9vdCBpbnRvIGEgc3BlY2lhbCBrZXJuZWwgd2hvc2Ugc29sZQo+Pj4gcHVycG9zZSBpcyB0byBj
b2xsZWN0IHRoZSBtZW1vcnkgZHVtcCBhbmQgcmVib290LiBGZWF0dXJlcyBzdWNoIGFzCj4+PiBo
dWdlcGFnZXMgYXJlIG5vdCByZXF1aXJlZCBpbiB0aGlzIGVudmlyb25tZW50IGFuZCBzaG91bGQg
YmUKPj4+IGRpc2FibGVkLgo+Pj4KPj4+IEZvciBleGFtcGxlLCBmYWR1bXAga2VybmVsIGJvb3Rp
bmcgd2l0aCB0aGUga2VybmVsIGFyZ3VtZW50cwo+Pj4gZGVmYXVsdF9odWdlcGFnZXN6PTFHQiBo
dWdlcGFnZXN6PTFHQiBodWdlcGFnZXM9MjAwIHByaW50cyB0aGUKPj4+IGZvbGxvd2luZyBsb2dz
Ogo+Pj4KPj4+IEh1Z2VUTEI6IGFsbG9jYXRpbmcgMjAwIG9mIHBhZ2Ugc2l6ZSAxLjAwIEdpQiBm
YWlsZWQuwqAgT25seSBhbGxvY2F0ZWQKPj4+IDU4IGh1Z2VwYWdlcy4KPj4+IEh1Z2VUTEIgc3Vw
cG9ydCBpcyBkaXNhYmxlZCEKPj4+IEh1Z2VUTEI6IGh1Z2UgcGFnZXMgbm90IHN1cHBvcnRlZCwg
aWdub3JpbmcgYXNzb2NpYXRlZCBjb21tYW5kLWxpbmUKPj4+IHBhcmFtZXRlcnMKPj4+IGh1Z2V0
bGJmczogZGlzYWJsaW5nIGJlY2F1c2UgdGhlcmUgYXJlIG5vIHN1cHBvcnRlZCBodWdlcGFnZSBz
aXplcwo+Pj4KPj4+IEV2ZW4gdGhvdWdoIHRoZSBsb2dzIHNheSB0aGF0IGh1Z2V0bGIgc3VwcG9y
dCBpcyBkaXNhYmxlZCwgZ2lnYW50aWMKPj4+IGh1Z2VwYWdlcyBhcmUgc3RpbGwgZ2V0dGluZyBh
bGxvY2F0ZWQsIHdoaWNoIGNhdXNlcyB0aGUgZmFkdW1wIGtlcm5lbAo+Pj4gdG8gcnVuIG91dCBv
ZiBtZW1vcnkgZHVyaW5nIGJvb3QuCj4+Cj4+IFllYWgsIHRoYXQncyBzdWJvcHRpbWFsLgo+Pgo+
Pj4KPj4+IFRvIGZpeCB0aGlzLCB0aGUgZ2lnYW50aWMgaHVnZXBhZ2UgYWxsb2NhdGlvbiBzaG91
bGQgY29tZSB1bmRlcgo+Pj4gaHVnZXBhZ2VzX3N1cHBvcnRlZCgpLgo+Pj4KPj4+IFRvIGJyaW5n
IGdpZ2FudGljIGh1Z2VwYWdlIGFsbG9jYXRpb24gdW5kZXIgaHVnZXBhZ2VzX3N1cHBvcnRlZCgp
LCB0d28KPj4+IGFwcHJvYWNoZXMgd2VyZSBwcmV2aW91c2x5IHByb3Bvc2VkOgo+Pj4gWzFdIENo
ZWNrIGh1Z2VwYWdlc19zdXBwb3J0ZWQoKSBpbiB0aGUgZ2VuZXJpYyBjb2RlIGJlZm9yZSBhbGxv
Y2F0aW5nCj4+PiBnaWdhbnRpYyBodWdlcGFnZXMuCj4+PiBbMl0gTWFrZSBhcmNoX2h1Z2V0bGJf
dmFsaWRfc2l6ZSgpIHJldHVybiBmYWxzZSBmb3IgYWxsIGh1Z2V0bGIgc2l6ZXMuCj4+Pgo+Pj4g
QXBwcm9hY2ggWzJdIGhhcyB0d28gbWlub3IgaXNzdWVzOgo+Pj4gMS4gSXQgcHJpbnRzIG1pc2xl
YWRpbmcgbG9ncyBhYm91dCBpbnZhbGlkIGh1Z2VwYWdlIHNpemVzCj4+PiAyLiBUaGUga2VybmVs
IHN0aWxsIHByb2Nlc3NlcyBodWdlcGFnZSBrZXJuZWwgYXJndW1lbnRzIHVubmVjZXNzYXJpbHkK
Pj4+Cj4+PiBUbyBjb250cm9sIGdpZ2FudGljIGh1Z2VwYWdlIGFsbG9jYXRpb24sIGl0IGlzIHBy
b3Bvc2VkIHRvIHNraXAKPj4+IHByb2Nlc3NpbmcgdGhlIGh1Z2VwYWdlIGtlcm5lbCBhcmd1bWVu
dHMgKGh1Z2VwYWdlc3osIGh1Z2VwYWdlcywgYW5kCj4+PiBkZWZhdWx0X2h1Z2VwYWdlc3opIHdo
ZW4gaHVnZXBhZ2VzX3N1cHBvcnQoKSByZXR1cm5zIGZhbHNlLgo+Pgo+PiBZb3UgY291bGQgYnJp
ZWZseSBtZW50aW9uIHRoZSBuZXcgb3V0cHV0IGhlcmUsIHNvIG9uZSBoYXMgYQo+PiBiZWZvcmUt
YWZ0ZXIgY29tcGFyaXNvbi4KPiAKPiBIZXJlIGlzIHRoZSBmYWR1bXAga2VybmVsIGJvb3QgbG9n
cyBhZnRlciB0aGlzIHBhdGNoIGFwcGxpZWQ6Cj4ga2VybmVsIGNvbW1hbmQgaGFkOiBkZWZhdWx0
X2h1Z2VwYWdlc3o9MUdCIGh1Z2VwYWdlc3o9MUdCIGh1Z2VwYWdlcz0yMDAKPiAKPiBIdWdlVExC
OiBodWdlcGFnZXMgdW5zdXBwb3J0ZWQsIGlnbm9yaW5nIGRlZmF1bHRfaHVnZXBhZ2Vzej0xR0Ig
Y21kbGluZQo+IEh1Z2VUTEI6IGh1Z2VwYWdlcyB1bnN1cHBvcnRlZCwgaWdub3JpbmcgaHVnZXBh
Z2Vzej0xR0IgY21kbGluZQo+IEh1Z2VUTEI6IGh1Z2VwYWdlcyB1bnN1cHBvcnRlZCwgaWdub3Jp
bmcgaHVnZXBhZ2VzPTIwMCBjbWRsaW5lCj4gSHVnZVRMQiBzdXBwb3J0IGlzIGRpc2FibGVkIQo+
IGh1Z2V0bGJmczogZGlzYWJsaW5nIGJlY2F1c2UgdGhlcmUgYXJlIG5vIHN1cHBvcnRlZCBodWdl
cGFnZSBzaXplcwo+IAo+IEkgd2lsbCB3YWl0IGZvciBhIGRheSBvciB0d28gYmVmb3JlIHNlbmRp
bmcgdjIgd2l0aCB0aGUgYWJvdmUgbG9ncwo+IGluY2x1ZGVkIGluCj4gdGhlIGNvbW1pdCBtZXNz
YWdlLgo+IAo+Pgo+PiBDdXJpb3VzLCBzaG91bGQgd2UgYXQgbGVhc3QgYWRkIGEgRml4ZXM6IHRh
Zz8gQWxsb2NhdGluZyBtZW1vcnkgd2hlbgo+PiBpdCdzIGNvbXBsZXRlbHkgdW51c2FibGUgc291
bmRzIHdyb25nLgo+IAo+IE5vdCBzdXJlIHdoaWNoIGNvbW1pdCBJIHNob3VsZCB1c2UgZm9yIEZp
eGVzLiBUaGlzIGlzc3VlIGhhcwo+IGJlZW4gcHJlc2VudCBmb3IgYSBsb25nIHRpbWUsIHBvc3Np
Ymx5IHNpbmNlIHRoZSBiZWdpbm5pbmcuCgpJIGRvbid0IGtub3cgdGhlIGZ1bGwgaGlzdG9yeSwg
YnV0IEkgd291bGQgYXNzdW1lIHRoYXQgc3VwcG9ydCBmb3IgCmdpZ2FudGljIHBhZ2VzIHdhcyBh
ZGRlZCBsYXRlcj8KCkl0IHdvdWxkIGJlIGdyZWF0IGlmIHlvdSBjb3VsZCBkaWcgYSBiaXQgc28g
d2UgY291bGQgYWRkIGEgRml4ZXM6LgoKPiAKPiBJIGFsc28gbm90aWNlZCBhbiBpbnRlcmVzdGlu
ZyBpc3N1ZSByZWxhdGVkIHRvIGV4Y2Vzc2l2ZSBtZW1vcnkKPiBhbGxvY2F0aW9uLCB3aGVyZSB0
aGUgcHJvZHVjdGlvbi9maXJzdCBrZXJuZWwgZmFpbGVkIHRvIGJvb3QuCj4gV2hpbGUgdGVzdGlu
ZyB0aGlzIHBhdGNoLCBJIGNvbmZpZ3VyZWQgYSB2ZXJ5IGhpZ2ggaHVnZXBhZ2VzIChodWdlcGFn
ZXN6PTJNKQo+IGNvdW50LCBhbmQgdGhlIGZpcnN0IGtlcm5lbCBmYWlsZWQgdG8gYm9vdCBhcyBh
IHJlc3VsdC4gSSB3aWxsIHJlcG9ydAo+IHRoaXMgaXNzdWUgc2VwYXJhdGVseS4KCkknZCBzYXkg
dGhhdCdzIHJhdGhlciBleHBlY3RlZDogaWYgeW91IHN0ZWFsIHRvbyBtdWNoIG1lbW9yeSBmcm9t
IHRoZSAKa2VybmVsIGl0IHdpbGwgbm90IGJlIGFibGUgdG8gZnVuY3Rpb24uIEl0J3MgdGhlIHNh
bWUgd2hlbiB1c2luZyB0aGUgCm1lbT0gcGFyYW1ldGVyIEkgd291bGQgYXNzdW1lLgoKLS0gCkNo
ZWVycwoKRGF2aWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
