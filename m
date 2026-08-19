Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A699C5DF6D
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4ztsqn79wIrVcq/SmNxrQsZQ048Y8zES9i38StPzjM=; b=RGGJ21tKIisVqQ
	GxU2+r7z8QPXZn1M3ZtfCJomlh7hCV5yXDOXb1HjUhpGH+1XkGqkqnB6k3XVrECdUI3FnLmaoJw2v
	WrlRcicbQqpPuMtcapEmysGy59Lx9SzORkGzWvoKXkA94dOHB5Kw+kWqQbIiYRlXk2b/KbojUb6Ne
	tSXQvTDKqjHh35GJNWZklAwvtXpP3LmKak/6sodK0bzPCIlQZtw+mh7f5oY9OQpfMnyNmlgbF+k8i
	OPpBKuuzH5idFnUCMdbabonKdBlQf7dmVyxRtcGS8QkhAVr93G36YAOvBKMbFnuupwLkUfzHnE1tU
	7FIKVmG+8Q/xpqjgVylQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcK6-00000009O1F-2OA0;
	Wed, 19 Aug 2026 09:11:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwcK1-00000009O0D-0K9F;
	Wed, 19 Aug 2026 09:10:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B23A434CA;
	Wed, 19 Aug 2026 09:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515771F000E9;
	Wed, 19 Aug 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787130655;
	bh=J7SSYr9IcCYlpEA9on/0aKPIvhje3Akfn6JxapVuH8c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jm+Wv4aOzeOFTNGkTPTh1XF0zLQEggF3fxwAzmzCyumgDLdn0f12E8o3GI6dpHpkx
	 ETq719cOrx8P/ruQ1OJxqoaV19IPggFEEVmEBqif88yyb5XrXMNEfPHKjO7dmA0zCS
	 XaFElWeGHWsTS30cQNtt/qevs6nQq/+keyts6TX3TXgRXhfvB1K4d3ql/t8lPKcszG
	 IdyqmlqIkRCGbPEzYxe8te0Su4J+GenFyDoXocfpKndU9TV/tVXa/Ltjh18TONIhIP
	 7RHGNtpbny9da2Ar64FJ4mMWrHdQLxuAtcmC0/40KEVCTsjb1sNCzLYzFb8a/cj9DV
	 YxESBVfYEonbA==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mukesh Pilaniya <mpilaniy@redhat.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Mark Rutland
 <mark.rutland@arm.com>,  Huacai Chen <chenhuacai@kernel.org>,  WANG Xuerui
 <kernel@xen0n.name>,  Paul Walmsley <pjw@kernel.org>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Alexandre Ghiti
 <alex@ghiti.fr>,  Andrew Morton <akpm@linux-foundation.org>,  Baoquan He
 <baoquan.he@linux.dev>,  Mike Rapoport <rppt@kernel.org>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Tao Liu <ltao@redhat.com>,  Philipp Rudo
 <prudo@redhat.com>,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  loongarch@lists.linux.dev,
  linux-riscv@lists.infradead.org,  kexec@lists.infradead.org
Subject: Re: [PATCH] kexec: return -ENOEXEC from image probe functions on
 mismatch
In-Reply-To: <0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com> (Mukesh
	Pilaniya's message of "Wed, 19 Aug 2026 11:28:10 +0530")
References: <20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com>
	<2vxzv79c23j6.fsf@kernel.org>
	<9cbe111c-ff63-4f24-b518-094ddd7cea30@redhat.com>
	<2vxzbjaz2269.fsf@kernel.org>
	<0d7acb43-2eb4-44ec-9bfb-b89440afc605@redhat.com>
Date: Wed, 19 Aug 2026 11:10:50 +0200
Message-ID: <2vxzqzjuzd9h.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
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

T24gV2VkLCBBdWcgMTkgMjAyNiwgTXVrZXNoIFBpbGFuaXlhIHdyb3RlOgoKPiBIaSBQcmF0eXVz
aCwKPgo+IE9uIDE4LzA4LzI2IDM6MTQgcG0sIFByYXR5dXNoIFlhZGF2IHdyb3RlOgo+PiBPbiBG
cmksIEF1ZyAxNCAyMDI2LCBNdWtlc2ggUGlsYW5peWEgd3JvdGU6ClsuLi5dCj4+IAo+PiBTbyBo
b3cgYWJvdXQgdGhlIGJlbG93IGRpZmYgaW5zdGVhZD8gKCoqIG9ubHkgY29tcGlsZSB0ZXN0ZWQg
KiopCj4+IAo+PiAtLS0gODwgLS0tCj4+IGRpZmYgLS1naXQgYS9rZXJuZWwva2V4ZWNfZmlsZS5j
IGIva2VybmVsL2tleGVjX2ZpbGUuYwo+PiBpbmRleCAyYmZiYjJkMTQ0ZTYuLmNmYjJiOGNkNTY3
OSAxMDA2NDQKPj4gLS0tIGEva2VybmVsL2tleGVjX2ZpbGUuYwo+PiArKysgYi9rZXJuZWwva2V4
ZWNfZmlsZS5jCj4+IEBAIC02NywxNyArNjcsMTYgQEAgaW50IGtleGVjX2ltYWdlX3Byb2JlX2Rl
ZmF1bHQoc3RydWN0IGtpbWFnZSAqaW1hZ2UsIHZvaWQgKmJ1ZiwKPj4gIAkJCSAgICAgIHVuc2ln
bmVkIGxvbmcgYnVmX2xlbikKPj4gIHsKPj4gIAljb25zdCBzdHJ1Y3Qga2V4ZWNfZmlsZV9vcHMg
KiBjb25zdCAqZm9wczsKPj4gLQlpbnQgcmV0ID0gLUVOT0VYRUM7Cj4+ICAKPj4gIAlmb3IgKGZv
cHMgPSAma2V4ZWNfZmlsZV9sb2FkZXJzWzBdOyAqZm9wcyAmJiAoKmZvcHMpLT5wcm9iZTsgKytm
b3BzKSB7Cj4+IC0JCXJldCA9ICgqZm9wcyktPnByb2JlKGJ1ZiwgYnVmX2xlbik7Cj4+IC0JCWlm
ICghcmV0KSB7Cj4+ICsJCWlmICghKCpmb3BzKS0+cHJvYmUoYnVmLCBidWZfbGVuKSkgewo+PiAg
CQkJaW1hZ2UtPmZvcHMgPSAqZm9wczsKPj4gLQkJCXJldHVybiByZXQ7Cj4+ICsJCQlyZXR1cm4g
MDsKPj4gIAkJfQo+PiAgCX0KPj4gIAo+PiAtCXJldHVybiByZXQ7Cj4+ICsJLyogTm8gbG9hZGVy
IGZvdW5kLiAqLwo+PiArCXJldHVybiAtRU5PRVhFQzsKPj4gIH0KPiBOaWNlIGNhdGNoLCBQcmF0
eXVzaCBidXQgdGhpcyBkaXNjYXJkcyBhbGwgbm9uLXplcm8gcmV0dXJuIHZhbHVlcyBmcm9tCj4g
cHJvYmUgZnVuY3Rpb25zLCB3aGljaCBtZWFucyByZWFsIGVycm9ycyBnZXQgc3dhbGxvd2VkLiBG
b3IgZXhhbXBsZSwKPiBrZXhlY19lbGZfcHJvYmUoKSBjYW4gcmV0dXJuIC1FTk9NRU0gd2hlbiBr
emFsbG9jKCkgZmFpbHMgaW4KPiBlbGZfcmVhZF9waGRycygpLiBXaXRoIHRoaXMgZGlmZiwgdGhh
dCAtRU5PTUVNIGJlY29tZXMgLUVOT0VYRUMsIHdoaWNoCj4gdGVsbHMgdXNlcnNwYWNlICJubyBs
b2FkZXIgZm91bmQiIHdoZW4gdGhlIGFjdHVhbCBwcm9ibGVtIHdhcyBhIG1lbW9yeQo+IGFsbG9j
YXRpb24gZmFpbHVyZS4KClJpZ2h0LCBnb29kIHBvaW50LgoKPgo+PiAgCj4+ICBzdGF0aWMgdm9p
ZCAqa2V4ZWNfaW1hZ2VfbG9hZF9kZWZhdWx0KHN0cnVjdCBraW1hZ2UgKmltYWdlKQo+PiAKPiBI
b3cgYWJvdXQgdGhlIGZvbGxvd2luZyBpbnN0ZWFkPyBJdCBrZWVwcyB0aGUgcHJvYmUgcmV0dXJu
IHZhbHVlIGFuZAo+IGRpc3Rpbmd1aXNoZXMgLUVOT0VYRUMgKGZvcm1hdCBub3QgcmVjb2duaXpl
ZCwgdHJ5IG5leHQgbG9hZGVyKSBmcm9tIGFueQo+IG90aGVyIGVycm9yIChyZWFsIGZhaWx1cmUs
IHByb3BhZ2F0ZSBpbW1lZGlhdGVseSk6Cj4g77u/Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9rZXhl
Y19maWxlLmMgYi9rZXJuZWwva2V4ZWNfZmlsZS5jCj4gaW5kZXggNTlmYjlkNzFlOWQ4Li5jZWI1
Yzk3Y2VkYWMgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2tleGVjX2ZpbGUuYwo+ICsrKyBiL2tlcm5l
bC9rZXhlY19maWxlLmMKPiBAQCAtNjgsMTcgKzY4LDE5IEBAIGludCBrZXhlY19pbWFnZV9wcm9i
ZV9kZWZhdWx0KHN0cnVjdCBraW1hZ2UgKmltYWdlLAo+IHZvaWQgKmJ1ZiwKPiAgCQkJICAgICAg
dW5zaWduZWQgbG9uZyBidWZfbGVuKQo+ICB7Cj4gIAljb25zdCBzdHJ1Y3Qga2V4ZWNfZmlsZV9v
cHMgKiBjb25zdCAqZm9wczsKPiAtCWludCByZXQgPSAtRU5PRVhFQzsKPiArCWludCByZXQ7Cj4K
PiAgCWZvciAoZm9wcyA9ICZrZXhlY19maWxlX2xvYWRlcnNbMF07ICpmb3BzICYmICgqZm9wcykt
PnByb2JlOyArK2ZvcHMpIHsKPiAgCQlyZXQgPSAoKmZvcHMpLT5wcm9iZShidWYsIGJ1Zl9sZW4p
Owo+IC0JCWlmICghcmV0KSB7Cj4gKwkJaWYgKHJldCA9PSAwKSB7Cj4gIAkJCWltYWdlLT5mb3Bz
ID0gKmZvcHM7Cj4gLQkJCXJldHVybiByZXQ7Cj4gKwkJCXJldHVybiAwOwo+ICAJCX0KPiArCQlp
ZiAocmV0ICE9IC1FTk9FWEVDKQo+ICsJCQlyZXR1cm4gcmV0Owo+ICAJfQo+Cj4gLQlyZXR1cm4g
cmV0Owo+ICsJcmV0dXJuIC1FTk9FWEVDOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgKmtleGVjX2lt
YWdlX2xvYWRfZGVmYXVsdChzdHJ1Y3Qga2ltYWdlICppbWFnZSkKPgo+Cj4gVGhpcyByZXF1aXJl
cyBwcm9iZSBmdW5jdGlvbnMgdG8gcmV0dXJuIC1FTk9FWEVDIGZyb20gZml4ZXMgaW4gcGF0Y2gg
MS4KPiBJIHdpbGwgYWRkIHRoaXMgYXMgYSBzZXBhcmF0ZSBwYXRjaCBvbiB0b3AgaW4gdjIuCj4K
PiBEb2VzIHRoaXMgbG9va3MgZ29vZCB0byB5b3UgPwoKTEdUTS4gVGhlIG9ubHkgdGhpbmcgSSdk
IGNoYW5nZSBpcyB0byBwZXJoYXBzIG1vdmUgdGhlIGRlY2xhcmF0aW9uIG9mCnJldCBpbnNpZGUg
dGhlIGxvb3Agc28gaXQgY2FuIG5ldmVyIGJlIHVzZWQgb3V0c2lkZSBpdCwgc2luY2UgcmV0IGlz
Cm9ubHkgdXNlZnVsIGluIHRoZSBsb29wIGluIHRoaXMgZnVuY3Rpb24uCgotLSAKUmVnYXJkcywK
UHJhdHl1c2ggWWFkYXYKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
