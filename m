Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F725C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 05:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQ0+qzniO3V4nMSI4jjJq3U9s5FwUZMuI3UaUfj2db0=; b=x+CMYwBzttQtyz
	mz65JSGWUk5PPo1J2dNwHS9yfVoDtPqySEx1Kl+5+Z4/fQXtjeX7mHkfCJngl8+f4lbTp7Ge3lkqh
	X0Mrx43GpWGDhY5qyrvwIodl6zYTb7WYy9sr4e91P3O5VrbtX0Rbti4f+ETwCk53CZtIslaIeZy3v
	DpuXBmG/VsuAdyMja0zvh4rwVgQlLNX5lM4cMRXyvttqdHoeQOAhDc7ijT+vFzHjBz8YcUAzoYnfm
	PB8DjGcA9aLH0RwlQ3P3A38bBpehBBx7Gbh43Dkr0RgnFI7XjvAdj0f75TqAQgcjMAiBvdDtkRfy3
	9gjjpiu7c4A8HQ7E1JYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77N1-00000000X15-0xK0;
	Wed, 15 May 2024 05:40:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s77My-00000000X08-0kJ1
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 05:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46E0461297;
	Wed, 15 May 2024 05:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1DDC116B1;
	Wed, 15 May 2024 05:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715751600;
	bh=qFeWv8GsFEP94NiH8hpu0MILQkrgqqI5f7XEUQ/bekw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ca5UtmZXO0PHjPXUUdc+VZYnkPVpb5jib4ktCpzzV3ZhA546YhW9UHk5pBrTsB8fs
	 5OCudtSHCOl3d3tTP3zo7RdBrJ8iHRR/KdAfFY0cca7m/EF0pacW8X7Wpz3cWwdto7
	 QOq82dcN4g4o9WbzMkFB9Q12wjhuxcMlhN5k61iDy/Hdzzp2lWztAOY+rqK8b1NDji
	 7PoAKLqCS0xjrsOBxo4Pjl81GboukdaMGq7BdQUF1nz0FsP8sokZnjlqgS/O9SKSKy
	 ASyYdWBijdb1z+6/2VB4SVQs5vdkkYQlveAVRDdcnzToprQ2NzuYIZYWyPJQVwjBm2
	 +I5sghOxb1v1A==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v2 2/8] riscv: mm: Change attribute from __init to
 __meminit for page functions
In-Reply-To: <ZkPKazeHI4CENSP3@localhost.localdomain>
References: <20240514140446.538622-1-bjorn@kernel.org>
 <20240514140446.538622-3-bjorn@kernel.org>
 <ZkPKazeHI4CENSP3@localhost.localdomain>
Date: Wed, 15 May 2024 07:39:57 +0200
Message-ID: <87r0e3k502.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_224004_287329_DE03FE5E 
X-CRM114-Status: GOOD (  12.48  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Lorenzo Stoakes <lstoakes@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T3NjYXIgU2FsdmFkb3IgPG9zYWx2YWRvckBzdXNlLmRlPiB3cml0ZXM6Cgo+IE9uIFR1ZSwgTWF5
IDE0LCAyMDI0IGF0IDA0OjA0OjQwUE0gKzAyMDAsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+IEZy
b206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPj4gCj4+IFByZXBhcmUgZm9y
IG1lbW9yeSBob3RwbHVnZ2luZyBzdXBwb3J0IGJ5IGNoYW5naW5nIGZyb20gX19pbml0IHRvCj4+
IF9fbWVtaW5pdCBmb3IgdGhlIHBhZ2UgdGFibGUgZnVuY3Rpb25zIHRoYXQgYXJlIHVzZWQgYnkg
dGhlIHVwY29taW5nCj4+IGFyY2hpdGVjdHVyZSBzcGVjaWZpYyBjYWxsYmFja3MuCj4+IAo+PiBD
aGFuZ2luZyB0aGUgX19pbml0IGF0dHJpYnV0ZSB0byBfX21lbWluaXQsIGF2b2lkcyB0aGF0IHRo
ZSBmdW5jdGlvbnMKPj4gYXJlIHJlbW92ZWQgYWZ0ZXIgaW5pdC4gVGhlIF9fbWVtaW5pdCBhdHRy
aWJ1dGUgbWFrZXMgc3VyZSB0aGUKPj4gZnVuY3Rpb25zIGFyZSBrZXB0IGluIHRoZSBrZXJuZWwg
dGV4dCBwb3N0IGluaXQsIGJ1dCBvbmx5IGlmIG1lbW9yeQo+PiBob3RwbHVnZ2luZyBpcyBlbmFi
bGVkIGZvciB0aGUgYnVpbGQuCj4+IAo+PiBBbHNvLCBtYWtlIHN1cmUgdGhhdCB0aGUgYWx0bWFw
IHBhcmFtZXRlciBpcyBwcm9wZXJseSBwYXNzZWQgb24gdG8KPj4gdm1lbW1hcF9wb3B1bGF0ZV9o
dWdlcGFnZXMoKS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJp
dm9zaW5jLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBPc2NhciBTYWx2YWRvciA8b3NhbHZhZG9yQHN1
c2UuZGU+Cj4KPj4gK3N0YXRpYyB2b2lkIF9fbWVtaW5pdCBjcmVhdGVfbGluZWFyX21hcHBpbmdf
cmFuZ2UocGh5c19hZGRyX3Qgc3RhcnQsIHBoeXNfYWRkcl90IGVuZCwKPj4gKwkJCQkJCSAgdWlu
dHB0cl90IGZpeGVkX21hcF9zaXplKQo+PiAgewo+PiAgCXBoeXNfYWRkcl90IHBhOwo+PiAgCXVp
bnRwdHJfdCB2YSwgbWFwX3NpemU7Cj4+IEBAIC0xNDM1LDcgKzE0MjksNyBAQCBpbnQgX19tZW1p
bml0IHZtZW1tYXBfcG9wdWxhdGUodW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBl
bmQsIGludCBub2RlLAo+PiAgCSAqIG1lbW9yeSBob3RwbHVnLCB3ZSBhcmUgbm90IGFibGUgdG8g
dXBkYXRlIGFsbCB0aGUgcGFnZSB0YWJsZXMgd2l0aAo+PiAgCSAqIHRoZSBuZXcgUE1Ecy4KPj4g
IAkgKi8KPj4gLQlyZXR1cm4gdm1lbW1hcF9wb3B1bGF0ZV9odWdlcGFnZXMoc3RhcnQsIGVuZCwg
bm9kZSwgTlVMTCk7Cj4+ICsJcmV0dXJuIHZtZW1tYXBfcG9wdWxhdGVfaHVnZXBhZ2VzKHN0YXJ0
LCBlbmQsIG5vZGUsIGFsdG1hcCk7Cj4KPiBJIHdvdWxkIGhhdmUgcHV0IHRoaXMgaW50byBhIHNl
cGFyYXRlIHBhdGNoLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LCBPc2NhciEKCkknbGwgc3BsaXQg
dGhpcyB1cCAoYWxzbyBzdWdnZXN0ZWQgYnkgQWxleCEpLgoKCkNoZWVycywKQmrDtnJuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
