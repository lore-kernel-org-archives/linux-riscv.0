Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9395C25B67
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 14:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MReVWMoAp4Vo9ntFNj+TUejmNSMBroO6n76SEBDvsrY=; b=pHxWZhEcAbA3PF
	JgaP65b3idclIk7pOPbaGfQd88Gkgnmas5SVvLdC0afkzO4MJFOqVdJQS8h5lsN7gHnDg6dMEdwcT
	LRVWfwjEwm8hpx0Ctxo50k8W7QMe2xPKDFlHcyIIMBqNpojPPe5FRxVG2VlQJOMjGba9fdUY4tFrA
	IOnE8pnXrh57vz+YBbwNsxitw6SBLoO4PMDHN+K6FmkPFjI7mMrqpVhZaylaFo5Jon3lABRkqa6Qo
	6xrkt53xIT2Z5OaS5Gr3hw5PXgkpIErWdzcwhw6GM0Kq+HVmRH0HYo17OM7q8u5cAYUiQ0gwYtIEE
	rXpoNCVHO4z+87ERaj7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Nv-00EgHI-0q;
	Thu, 26 Oct 2023 14:30:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw1Ns-00EgFu-10
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 14:30:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3362D2F4;
	Thu, 26 Oct 2023 07:31:29 -0700 (PDT)
Received: from [10.1.36.151] (XHFQ2J9959.cambridge.arm.com [10.1.36.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C3673F64C;
	Thu, 26 Oct 2023 07:30:46 -0700 (PDT)
Message-ID: <36aa1ec7-df13-4741-be09-c53a05f3d591@arm.com>
Date: Thu, 26 Oct 2023 15:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes 0/2] Fix set_huge_pte_at()
Content-Language: en-GB
To: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton
 <akpm@linux-foundation.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <20230928151846.8229-1-alexghiti@rivosinc.com>
 <305b4dec-c99d-3cee-4563-8d7dcbae9384@ghiti.fr>
 <20231003090443.67a2e2692b68211e05b53248@linux-foundation.org>
 <CAHVXubi5C0hBaXx5tqVHZAJSd1zvHRqoxUEkk9ZbmZ5mq2=mAw@mail.gmail.com>
 <20231026071300.e12dab3be1edd26007db85ee@linux-foundation.org>
 <32d9627c-821a-48f0-b430-0532a47b8699@ghiti.fr>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <32d9627c-821a-48f0-b430-0532a47b8699@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_073052_464056_FCA5C058 
X-CRM114-Status: GOOD (  10.24  )
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

T24gMjYvMTAvMjAyMyAxNToxNSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+IG4gMjYvMTAvMjAy
MyAxNjoxMywgQW5kcmV3IE1vcnRvbiB3cm90ZToKPj4gT24gVGh1LCAyNiBPY3QgMjAyMyAxMDo1
NzoyNyArMDIwMCBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4+IHdy
b3RlOgo+Pgo+Pj4gT24gVHVlLCBPY3QgMywgMjAyMyBhdCA2OjA04oCvUE0gQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4+Pj4gT24gVHVlLCAzIE9jdCAy
MDIzIDE3OjQzOjEwICswMjAwIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4gd3JvdGU6
Cj4+Pj4KPj4+Pj4gK2NjIEFuZHJldzogV291bGTCoCB5b3UgbWluZCB0YWtpbmcgdGhpcyBwYXRj
aHNldCBpbiB5b3VyIHRyZWUgZm9yIHRoZQo+Pj4+PiBuZXh0IHJjPyBUaGlzIHBhdGNoc2V0IGRl
cGVuZHMgb24gYSBwcmV2aW91cyBmaXggZm9yIGFybTY0IHRoYXQgeW91Cj4+Pj4+IG1lcmdlZCBp
biByYzQgd2hpY2ggaXMgbm90IGluIHRoZSByaXNjdiAtZml4ZXMgYnJhbmNoIHlldC4KPj4+Pj4K
Pj4+Pj4gSSBzYXcgd2l0aCBQYWxtZXIgYW5kIGhlIHNob3VsZCBhY2sgdGhpcyBzaG9ydGx5Lgo+
Pj4+IFdlbGwgSSBncmFiYmVkIHRoZW0gaW50byBtbS5naXQncyBtbS1ob3RmaXhlcy11bnN0YWJs
ZSBxdWV1ZS7CoCBBbGwKPj4+PiBiZWluZyB3ZWxsIEknbGwgbW92ZSB0aGVtIGludG8gbW0taG90
Zml4ZXMtc3RhYmxlIHdpdGhpbiBhIHdlZWsgdGhlbgo+Pj4+IGludG8gTGludXMgc2hvcnRseSBh
ZnRlci4KPj4+IFRob3NlIGZpeGVzIGZpbmFsbHkgZGlkIG5vdCBtYWtlIGl0IHRvIDYuNiwgSSB3
YXMgaG9waW5nIGZvciB0aGVtIHRvCj4+PiBsYW5kIGluIC1yYzYgb3IgLXJjNzogZm9yIHRoZSBm
dXR1cmUsIHdoYXQgc2hvdWxkIGhhdmUgSSBkb25lIHRvIGF2b2lkCj4+PiB0aGF0Pwo+PiBUaGV5
J3JlIG1lcmdlZCBpbiBMaW51cydzIHRyZWUuCj4+Cj4+IDZmMWJhY2U5YTlmYiBhcm02NDogaHVn
ZXRsYjogZml4IHNldF9odWdlX3B0ZV9hdCgpIHRvIHdvcmsgd2l0aCBhbGwgc3dhcCBlbnRyaWVz
Cj4+IDkzNWQ0ZjBjNmRjOCBtbTogaHVnZXRsYjogYWRkIGh1Z2UgcGFnZSBzaXplIHBhcmFtIHRv
IHNldF9odWdlX3B0ZV9hdCgpCj4gCj4gCj4gT29wcywgc29ycnksIEkgbWlzc2VkIHRoZW0gdGhp
cyBtb3JuaW5nIQoKVGhvc2UgdHdvIHBhdGNoZXMgdGhhdCBBbmRyZXcgaGlnaGxpZ2h0cyBhcmUg
dGhlIGZpeCBJIGRpZCBmb3IgYXJtNjQuIFdlcmVuJ3QKeW91IHJlZmVycmluZyB0byB0aGUgY29y
cmVzcG9uZGluZyBwYXRjaGVzIHlvdSBkaWQgZm9yIHJpc2N2LCBBbGV4PwoKPiAKPiBUaGFua3Ms
Cj4gCj4gQWxleAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
