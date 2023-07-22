Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F80EB64DA
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 10:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8lrkFNazn7koRvISm5hoh7ek9k4ZikUlXRMZrETNIk=; b=0A+E2cm8WpGXHQ
	+B8Q5gF/hXP/CEGVYeJg1xgDRWa6GciQk6pZfqRfvdOHgy6IKboOaKyc7BDjmrlU206NjPPjBF4E8
	eqOjIbsmD/hhPGwgyigGDkR9j4OmsfIRfioR2YVQyuLc4h+ScSelLnY9PYuIOBzWITACxlzQmyEJd
	ZfN2f1DMAyRfH2B9BlUkP98OeOFvXbEqkWZ6GuwJO66WDI31XxIhorGvF7NTmaLhq/KqQ5eqH9tou
	ouxfglWLs+0n/DCRJMLsopz/lG4Ro7fcSziwOpmmyba1roLW5JbnVgv7mU/ttWZxJs+QuIXyVkf1N
	L7gtRBhbPELql3tr0MAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNABe-00GWeC-0K;
	Sat, 22 Jul 2023 10:50:10 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNABZ-00GWcu-32
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 10:50:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D08EDC0003;
	Sat, 22 Jul 2023 10:49:56 +0000 (UTC)
Message-ID: <d8db4fc3-12b4-43f1-ea94-5dc53ce2d55f@ghiti.fr>
Date: Sat, 22 Jul 2023 12:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/3] Documentation: arm: Add bootargs to the table of
 added DT parameters
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Sunil V L <sunilvl@ventanamicro.com>, Song Shuai
 <songshuaishuai@tinylab.org>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>
References: <20230626143626.106584-1-alexghiti@rivosinc.com>
 <87v8edas8d.fsf@meer.lwn.net>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <87v8edas8d.fsf@meer.lwn.net>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_035006_132043_45364156 
X-CRM114-Status: GOOD (  15.83  )
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

Ck9uIDIxLzA3LzIwMjMgMjM6MDcsIEpvbmF0aGFuIENvcmJldCB3cm90ZToKPiBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+IHdyaXRlczoKPgo+PiBUaGUgYm9vdGFyZ3Mg
bm9kZSBpcyBhbHNvIGFkZGVkIGJ5IHRoZSBFRkkgc3R1YiBpbiB0aGUgZnVuY3Rpb24KPj4gdXBk
YXRlX2ZkdCgpLCBzbyBhZGQgaXQgdG8gdGhlIHRhYmxlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
bGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4+IFJldmlld2VkLWJ5OiBB
dGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFNvbmcgU2h1
YWkgPHNvbmdzaHVhaXNodWFpQHRpbnlsYWIub3JnPgo+PiAtLS0KPj4gICBEb2N1bWVudGF0aW9u
L2FybS91ZWZpLnJzdCB8IDQgKysrLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiBTbyBJJ20gbm90IHN1cmUgaWYgSSdtIHN1cHBvc2VkIHRvIGJl
IGFwcGx5aW5nIHRoZXNlIHBhdGNoZXMsIG9yIHdoZXRoZXIKPiB0aGV5IHdpbGwgZ28gdGhyb3Vn
aCB0aGUgYXJjaCB0cmVlcz8KPgo+IEluIHRoZSBmb3JtZXIgY2FzZSwgdGhleSBkb24ndCBhcHBs
eSB0byBkb2NzLW5leHQsIHNvIGNvdWxkIEkgZ2V0IGEKPiByZXNwaW4gcGxlYXNlPwoKClllcyBz
dXJlLCBJJ2xsIGRvIHRoYXQgbm93LiBCVFfCoCBhbGwgdGhlIGFyY2ggZG9jdW1lbnRhdGlvbiB3
YXMgbW92ZWQgaW4gCkRvY3VtZW50YXRpb24vYXJjaC8sIGJ1dCBub3QgdGhlIHJpc2N2LCBhcmUg
eW91IHdvcmtpbmcgb24gdGhpcyBvciAKc2hvdWxkIHdlPwoKVGhhbmtzLAoKQWxleAoKCj4KPiBU
aGFua3MsCj4KPiBqb24KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
