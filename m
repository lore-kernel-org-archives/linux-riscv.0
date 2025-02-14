Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7319AC021A4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TJsw+z8lDID6QSzDwK4MPXi2aBwiuBKZUDn9l6iOd0=; b=lyK6NOYqhuUd2r
	LmaxkFMEnXKxvAxnqmqdcIBgthduCxEWl5qX5RPepPY1wMW4TDEQ25D/jXz2T6dlQFOgf2rW0z1hO
	Ia7km3bhLOdrA4oefFtTeG9jw70zdAE9Gzs7o3kvLy2gGCQEGNtzSAuHlyCupzWu8ncTWy9aZR4TQ
	MuOZDIEMn4jq/DVKUnF9BAxq6YsXa/EkMqWfIitnk4j9F4sTD9CvuPOmm2zl8jE9xXPajsi+WuNXo
	TnLjxDYpQ0EDnAzaz6kp5OoyLLvhemMcUxsci6mijHZo61awvX2NnusWUlbQgt6ehvbpN6cW2+d3c
	GWYqlO7/JsLMgxvLK2wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiq7P-0000000DxXK-221C;
	Fri, 14 Feb 2025 07:28:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiq5b-0000000DxCX-1qJt;
	Fri, 14 Feb 2025 07:26:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2A3D113E;
	Thu, 13 Feb 2025 23:26:38 -0800 (PST)
Received: from [10.163.37.128] (unknown [10.163.37.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57E413F58B;
	Thu, 13 Feb 2025 23:26:08 -0800 (PST)
Message-ID: <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
Date: Fri, 14 Feb 2025 12:56:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Steven Price <steven.price@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
 <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_232619_524450_8C1966B9 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyLzEzLzI1IDE3OjE5LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExlIDEz
LzAyLzIwMjUgw6AgMTI6MjMsIFN0ZXZlbiBQcmljZSBhIMOpY3JpdMKgOgo+PiBPbiAxMy8wMi8y
MDI1IDA0OjA5LCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+IFBsYXRmb3JtcyBzdWJzY3Jp
YmUgaW50byBnZW5lcmljIHB0ZHVtcCBpbXBsZW1lbnRhdGlvbiB2aWEgR0VORVJJQ19QVERVTVAu
Cj4+PiBCdXQgZ2VuZXJpYyBwdGR1bXAgZ2V0cyBlbmFibGVkIHZpYSBQVERVTVBfQ09SRS4gVGhl
c2UgY29uZmlncyBjb21iaW5hdGlvbgo+Pj4gaXMgY29uZnVzaW5nIGFzIHRoZXkgc291bmQgdmVy
eSBzaW1pbGFyIGFuZCBkb2VzIG5vdCBkaWZmZXJlbnRpYXRlIGJldHdlZW4KPj4+IHBsYXRmb3Jt
J3MgZmVhdHVyZSBzdWJzY3JpcHRpb24gYW5kIGZlYXR1cmUgZW5hYmxlbWVudCBmb3IgcHRkdW1w
LiBSZW5hbWUKPj4+IHRoZSBjb25maWdzIGFzIEFSQ0hfSEFTX1BURFVNUCBhbmQgUFREVU1QIG1h
a2luZyBpdCBtb3JlIGNsZWFyIGFuZCBpbXByb3ZlCj4+PiByZWFkYWJpbGl0eS4KPj4KPj4gWy4u
Ll0KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvY29uZmlncy9tcGM4ODVfYWRzX2RlZmNv
bmZpZyBiL2FyY2gvcG93ZXJwYy9jb25maWdzL21wYzg4NV9hZHNfZGVmY29uZmlnCj4+PiBpbmRl
eCA3NzMwNmJlNjJlOWUuLmRiMDA1NjE4NjkwYiAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcG93ZXJw
Yy9jb25maWdzL21wYzg4NV9hZHNfZGVmY29uZmlnCj4+PiArKysgYi9hcmNoL3Bvd2VycGMvY29u
Zmlncy9tcGM4ODVfYWRzX2RlZmNvbmZpZwo+Pj4gQEAgLTc4LDQgKzc4LDQgQEAgQ09ORklHX0RF
QlVHX1ZNX1BHVEFCTEU9eQo+Pj4gwqAgQ09ORklHX0RFVEVDVF9IVU5HX1RBU0s9eQo+Pj4gwqAg
Q09ORklHX0JESV9TV0lUQ0g9eQo+Pj4gwqAgQ09ORklHX1BQQ19FQVJMWV9ERUJVRz15Cj4+PiAt
Q09ORklHX0dFTkVSSUNfUFREVU1QPXkKPj4+ICtDT05GSUdfUFREVU1QPXkKPj4KPj4gSSdkIHN1
Z2dlc3QgZHJvcHAgdGhpcyBmcm9tIHRoZSBkZWZjb25maWcgdG9vLCBqdXN0IGxpa2UgcGF0Y2gg
MSBkcm9wcGVkCj4+IGl0IGZyb20gZGVidWcuY29uZmlnLgo+Pgo+IAo+IFRoYW5rcyBmb3Igc3Bv
dHRpbmcgdGhhdC4KPiAKPiBUaGF0IG9uZSBpcyB3cm9uZy4gV2FzIGludHJvZHVjZWQgYnkgY29t
bWl0IGQyMTBlZTNmZGZlOCAoInBvd2VycGMvY29uZmlnczogVXBkYXRlIGNvbmZpZyBmaWxlcyBm
b3IgcmVtb3ZlZC9yZW5hbWVkIHN5bWJvbHMiKSB3aGljaCBhaW1lZCBhdCBmaXhpbmcgY29tbWl0
IGUwODQ3MjgzOTNhNSAoInBvd2VycGMvcHRkdW1wOiBDb252ZXJ0IHBvd2VycGMgdG8gR0VORVJJ
Q19QVERVTVAiKSBidXQgaXQgZGlkIGl0IHdyb25nLgo+IAo+IEl0IGlzIENPTkZJR19QVERVTVBf
REVCVUdGUyB0aGF0IGlzIHdhbnRlZC4KClNob3VsZCB0aGlzIHJlcGxhY2VtZW50IGJlIGRvbmUg
aW4gdGhlIHNlcmllcyBvciB3b3VsZCB5b3UgbGlrZSBpdAp0byBiZSBoYW5kbGVkIGluIHBvd2Vy
cGMgbGF0ZXIgPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
