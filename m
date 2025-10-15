Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2997ECCD185
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 15:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4gwo0+X7qFMLKybNpxRKZhbs5MQxj440LhSL0QThxE=; b=oU8n41HoKc6cXj
	41/hoEkVybJmn/XGbxfAMboggeaOV16L0kd+opPeh2QHq9iiE7jYf+agHbxOlyHAXFckzxxT+qsvM
	spiTS+EYu8cM9LJ1n2FKmfXRbxCXRENm1xWerD+fUF/Q302qWWkr8zvA1aSv6zT9woaDBmYW9HTMt
	SPpKn8PK9ubuFjWwD6IiH5JuOm9Gt7VL0l6rtjId2AHTXufjVB39C7WAEHw9sPiBHgQBBRpwLM04z
	30EK8HVJo3fbIhY+2MyVvw75yzfPoNjVltgK12qeMRBn0e71jnxY8Soew2erk7fj255PigGWda2qy
	kI8NsveCkK1b9VNuzWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v933p-000000022BW-0ngh;
	Wed, 15 Oct 2025 15:05:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v933m-000000022Ap-0c08
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 15:05:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B1124459D;
	Wed, 15 Oct 2025 15:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842CFC4CEF8;
	Wed, 15 Oct 2025 15:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760540701;
	bh=Wdbu91UHG7NXXe6k08cBk3T/+pvUqlyl9VvW3phwgNc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aYGsImU3Per5JLsRWKEDgSU53GVias3oxkv3lcMOJyTF2/c5lzyw2mtJxaYSCavuH
	 wbaCEkmbUtHKcgzV8+Rd9HkAU542mDJJNLVv7ZLIwh7hHX65uxF02j6/qf+HBCWCr5
	 a3SDnYLcIaJLj3CG8shPVh1uDD9PGHxB0uwfo6dsz01FKRPCdWlYOJ5Fr2Ur+oEy8m
	 HzxrY4ov7Z1kbMBdW2sPJBcEDJVajDnhRpxhR69uKn2pllOAh6ktBWAQvIYb8QmygG
	 i9hUEjmhdzalFSGO5bNoADPFDFBTlJjew3xdACovDj0EokV3my/h3MUgQn0EZN/yiO
	 mzmbfLOBm1LVw==
Date: Wed, 15 Oct 2025 08:04:59 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?0K/QvdCwINCR0LDRiNC70YvQutC+0LLQsA==?= <yana2bsh@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH 6.1 00/15] genetlink: Test Netlink subsystem of Linux
 v6.1
Message-ID: <20251015080459.6e681582@kernel.org>
In-Reply-To: <CAEP49o+-=HeW4NgB5a0H6gM9tPJg=oNeUA1iCbXq_1qZPPaGnA@mail.gmail.com>
References: <20250912195339.20635-1-yana2bsh@gmail.com>
	<20250912131722.74658ec0@kernel.org>
	<CAEP49o+-=HeW4NgB5a0H6gM9tPJg=oNeUA1iCbXq_1qZPPaGnA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_080502_229696_7A443526 
X-CRM114-Status: GOOD (  10.58  )
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

T24gV2VkLCAxNSBPY3QgMjAyNSAxNzo0OToyMiArMDMwMCDQr9C90LAg0JHQsNGI0LvRi9C60L7Q
stCwIHdyb3RlOgo+IFRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIHdvcmsgaXMgdG8gaW1wcm92ZSB0
aGUgdGVzdCBjb3ZlcmFnZSBhbmQKPiByZWxpYWJpbGl0eSBvZiB0aGUgTmV0bGluayBzdWJzeXN0
ZW0sIHNwZWNpZmljYWxseSBmb3IgdGhlIGNvcmUKPiBhZl9uZXRsaW5rLmMgYW5kIGdlbmV0bGlu
ay5jIGNvbXBvbmVudHMuIFdoaWxlIHRoZSBzdWJzeXN0ZW0gaXMKPiBjcml0aWNhbCBmb3Iga2Vy
bmVsLXVzZXJzcGFjZSBjb21tdW5pY2F0aW9uLCBpdHMgY292ZXJhZ2UgYnkgdGhlCj4gZXhpc3Rp
bmcgc2VsZnRlc3RzIGlzIHF1aXRlIGxpbWl0ZWQuCj4gCj4gVG8gcXVhbnRpZnkgdGhlIGltcHJv
dmVtZW50LCB0aGVzZSBuZXcgc2VsZnRlc3RzIGFjaGlldmUgdGhlIGZvbGxvd2luZwo+IGxpbmUg
Y292ZXJhZ2UgKGFzIG1lYXN1cmVkIGJ5IGdjb3YpOgo+IC0gbmV0L25ldGxpbmsvYWZfbmV0bGlu
ay5jOiA4NC4wJQo+IC0gbmV0L25ldGxpbmsvZ2VuZXRsaW5rLmM6IDg4LjglCgpGb3Igd2hhdCBp
dCdzIHdvcnRoIHN5emJvdCBoYXM6CgogICAgYWZfbmV0bGluay5jICA5MSUKICAgIGdlbmV0bGlu
ay5jICAgNjglCgpXaXRob3V0IGEgbGluZSBvZiBjb2RlIGFkZGVkIHRvIHRoZSBrZXJuZWwuIE9m
IGNvdXJzZSBpdCdzIG5vdApmdW5jdGlvbmFsIHRlc3RpbmcuCgo+IEludGVncmF0aW5nIHRoZXNl
IHRlc3RzIGludG8gdGhlIHVwc3RyZWFtIHN1aXRlIHdpbGwgcHJvdmlkZSBsb25nLXRlcm0KPiBz
dGFiaWxpdHkgYW5kIG1ha2UgaXQgc2FmZXIgdG8gcmVmYWN0b3Igb3IgYWRkIG5ldyBmZWF0dXJl
cyB0byB0aGUKPiBOZXRsaW5rIGNvcmUgaW4gdGhlIGZ1dHVyZS4KCkhhcHB5IHRvIGhlYXIgZnJv
bSBvdGhlcnMgaWYgdGhleSBkaXNhZ3JlZSBidXQgd2hhdCBrZXJuZWwgdGVzdHMgZ2V0Cm1lcmdl
ZCBpbnRvIHRoZSB0cmVlIGlzIHByZXR0eSBzdWJqZWN0aXZlLiBEbyB3ZSBoYXZlIGEgbG90IG9m
IGJ1Z3MgCmluIGdlbmV0bGluaz8gQXJlIHlvdSBwbGFubmluZyB0byBkbyBtYWpvciBkZXZlbG9w
bWVudCBpbiB0aGlzIGFyZWEKYW5kIHdhbnQgdG8gY2F0Y2ggcmVncmVzc2lvbnM/IElmIHRoZSBh
bnN3ZXJzIHRvIGJvdGggb2YgdGhvc2UgcXVlc3Rpb25zCmlzICJubyIgSU1ITyB0aGlzIDdrTG9D
IGlzIG5vdCB3b3J0aCBjYXJyeWluZyBpbiB0aGUgdHJlZS4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
