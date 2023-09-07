Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A7CEC8729
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMa/diG0fwsCT3a2k9MB+k5tXdiZ0GycP342MZufyv4=; b=Ig3d6qTv6/irs1
	NeROGNZv2kmCyl79ZxjtnTPo4VCvqeWZAbVSAfPOg3B6a6tQb5EK9tN6ZKvCZEd6BkZBY6STnx1tr
	uAmvc9eIazvlPxz0aYsUCqYQ01bTEz2J/kgwfJ333CFI5YC4+r/iEkt3prsP0PfoUeKPot283kkyH
	b0aDOOA7IEDH5t3RV0h0/LybNUZTN7ZX5/anP4t9+IwGkv5yR6inkg1m964ROdkAMeeHOkTpQMDAB
	OCUZR7EhPuWrJV1jP5MN9g17y99fHvM15QiWh8uY0RzyUeGJ3RdETn1zdysDE5Xol3KLjUS8xXiib
	j0K7ujOws3Kfr1w4yzVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeFMf-00C9iZ-08;
	Thu, 07 Sep 2023 13:48:09 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeFMb-00C9ht-2Y
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 13:48:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B6A040026;
	Thu,  7 Sep 2023 13:47:52 +0000 (UTC)
Message-ID: <4c4bb7ec-9ad8-6b6a-cea0-a4c779db6ac3@ghiti.fr>
Date: Thu, 7 Sep 2023 15:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 4/4] riscv: Improve flush_tlb_kernel_range()
Content-Language: en-US
To: Nadav Amit <nadav.amit@gmail.com>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Nick Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Vincent Chen <vincent.chen@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-arch@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
 linux-riscv@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20230801085402.1168351-1-alexghiti@rivosinc.com>
 <20230801085402.1168351-5-alexghiti@rivosinc.com>
 <CA+V-a8t56xDqMTQfoKcsvPF8errkTMydaDz5V6nejLvVfJrW3g@mail.gmail.com>
 <C92430BE-4DA3-487B-BFD2-58EE4A93396F@gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <C92430BE-4DA3-487B-BFD2-58EE4A93396F@gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_064805_988068_D345102A 
X-CRM114-Status: GOOD (  17.45  )
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

SGkgTmFkYXYsCgpPbiAwNi8wOS8yMDIzIDIyOjIyLCBOYWRhdiBBbWl0IHdyb3RlOgo+Cj4+IE9u
IFNlcCA2LCAyMDIzLCBhdCA0OjQ4IEFNLCBMYWQsIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5n
Z0BnbWFpbC5jb20+IHdyb3RlOgo+Pgo+PiBIaSBBbGV4YW5kcmUsCj4+Cj4+IE9uIFR1ZSwgQXVn
IDEsIDIwMjMgYXQgOTo1OOKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5j
LmNvbT4gd3JvdGU6Cj4+PiBUaGlzIGZ1bmN0aW9uIHVzZWQgdG8gc2ltcGx5IGZsdXNoIHRoZSB3
aG9sZSB0bGIgb2YgYWxsIGhhcnRzLCBiZSBtb3JlCj4+PiBzdWJ0aWxlIGFuZCB0cnkgdG8gb25s
eSBmbHVzaCB0aGUgcmFuZ2UuCj4+Pgo+Pj4gVGhlIHByb2JsZW0gaXMgdGhhdCB3ZSBjYW4gb25s
eSB1c2UgUEFHRV9TSVpFIGFzIHN0cmlkZSBzaW5jZSB3ZSBkb24ndCBrbm93Cj4+PiB0aGUgc2l6
ZSBvZiB0aGUgdW5kZXJseWluZyBtYXBwaW5nIGFuZCB0aGVuIHRoaXMgZnVuY3Rpb24gd2lsbCBi
ZSBpbXByb3ZlZAo+Pj4gb25seSBpZiB0aGUgc2l6ZSBvZiB0aGUgcmVnaW9uIHRvIGZsdXNoIGlz
IDwgdGhyZXNob2xkICogUEFHRV9TSVpFLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPj4+IFJldmlld2VkLWJ5OiBBbmRyZXcg
Sm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+Pj4gLS0tCj4+PiBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3RsYmZsdXNoLmggfCAxMSArKysrKy0tLS0tCj4+PiBhcmNoL3Jpc2N2L21tL3Rs
YmZsdXNoLmMgICAgICAgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4+
PiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQo+Pj4K
Pj4gQWZ0ZXIgYXBwbHlpbmcgdGhpcyBwYXRjaCwgSSBhbSBzZWVpbmcgbW9kdWxlIGxvYWQgaXNz
dWVzIG9uIFJaL0ZpdmUKPj4gKGNvbXBsZXRlIGxvZyBbMF0pLiBJIGFtIHRlc3RpbmcgZGVmY29u
ZmlnICsgWzFdIChyei9maXZlIHJlbGF0ZWQKPj4gY29uZmlncykuCj4+Cj4+IEFueSBwb2ludGVy
cyBvbiB3aGF0IGNvdWxkIGJlIGFuIGlzc3VlIGhlcmU/Cj4gTm9uZSBvZiBteSBidXNpbmVzcywg
YnV0IGxvb2tpbmcgYXQgeW91ciBjb2RlLCBpdCBzZWVtcyB0aGF0IHlvdSBkbyBub3QgbWVtb3J5
Cj4gYmFycmllciBiZWZvcmUgcmVhZGluZyBtbV9jcHVtYXNrKCkgaW4gX19mbHVzaF90bGJfcmFu
Z2UoKS4gSSBiZWxpZXZlIHlvdQo+IHdvdWxkIHdhbnQgdG8gc3luY2hyb25pemUgX19mbHVzaF90
bGJfcmFuZ2Ugd2l0aCBzd2l0Y2hfbW0oKSBzaW1pbGFybHkgdG8gdGhlCj4gd2F5IGl0IGlzIGRv
bmUgaW4geDg2Lgo+CgpOb3RlZCwgSSdsbCB0YWtlIGEgbG9vayBhdCB0aGF0LCB0aGFua3MgZm9y
IHRoZSBhZHZpY2UhCgpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
