Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B8C10F15
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bdqos6erxH8bvYrrp92Px5VynY/7gNstejaiuZomljI=; b=kBD0Ccsx87TCvY
	3yks2DWvCjSMK85/2/vUM80Yyjm+Xfz97B/S5oGhbVwym5IcpDj0RzOsRSam77uYzWU3/Dd2u8XGE
	z2PFPfttJCOSNfejG5eA5nHn7lFJGpLYLCtJo+xQJ3rgSXpaMkFIPFBgsr1JXdgLiMS6mcWdnocIn
	tH072XP2329SDTeSBxWDvCHnvX3Jk0hVvonWSFUSQUqmgzhplvLYmVg5yiz61ytOwkvQe009BRtQv
	4nBdspJO+Deqp81jbH09B9fKW8v1RYmgP3Vt+p6CuWNlZoU7NbpKE4My3cmUYEW1Bq8II6siAN07c
	UE9iTDCf4CJimmp8KmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypOJ-0000000Cl2C-2mAa;
	Mon, 22 Apr 2024 08:51:11 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rypNr-0000000Ckhi-1dXV;
	Mon, 22 Apr 2024 08:50:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C3796000C;
	Mon, 22 Apr 2024 08:50:34 +0000 (UTC)
Message-ID: <f6488073-b93f-4945-9d30-1ceb548d6bb4@ghiti.fr>
Date: Mon, 22 Apr 2024 10:50:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
Content-Language: en-US
To: Will Deacon <will@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: alexghiti@rivosinc.com, ryan.roberts@arm.com,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mm@kvack.org
References: <CAHVXubiH64beFuB_GHSq5BKCus=O_+bqYTCwWQ+=2Q-F=T=ctQ@mail.gmail.com>
 <mhng-911ba065-e6c8-4d42-978c-e47897bcb493@palmer-ri-x1c9a>
 <20240419110306.GA2972@willie-the-truck>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240419110306.GA2972@willie-the-truck>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_015043_818912_FE5E2CDB 
X-CRM114-Status: GOOD (  16.25  )
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

SGksCgpPbiAxOS8wNC8yMDI0IDEzOjAzLCBXaWxsIERlYWNvbiB3cm90ZToKPiBPbiBUaHUsIEFw
ciAxOCwgMjAyNCBhdCAwMzoxMTo1NlBNIC0wNzAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPj4g
T24gRnJpLCAwMSBNYXIgMjAyNCAwMzoyOToxOCBQU1QgKC0wODAwKSwgYWxleGdoaXRpQHJpdm9z
aW5jLmNvbSB3cm90ZToKPj4+IE9uIEZyaSwgTWFyIDEsIDIwMjQgYXQgMTE6NDXigK9BTSBSeWFu
IFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPiB3cm90ZToKPj4+PiBJIGNvbmZlc3MgSSBo
YXZlbid0IGxvb2tlZCBhdCB0aGUgcGF0Y2hlcyB5ZXQsIGJ1dCB0aGlzIGNvdmVyIGxldHRlciBy
YWlzZXMgYQo+Pj4+IGZldyBxdWVzaW9ucyBmb3IgbWUuIEknbGwgYWltIHRvIGxvb2sgYXQgdGhl
IGFjdHVhbCBwYXRjaGVzIGluIGR1ZSBjb3Vyc2UuCj4+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVs
dCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPj4KPj4gaW4gY2FzZSBzb21lb25lIHdhbnRzIHRvIHBp
Y2sgdGhlbSB1cCB2aWEgYSBnZW5lcmljIHRyZWUuICBJJ20gaGFwcHkgdG8gdGFrZQo+PiB0aGVt
IHZpYSB0aGUgUklTQy1WIHRyZWUgaWYgZm9sayB3YW50LCBubyBydXNoIG9uIG15IGVuZCBJJ20g
anVzdCBzY3J1YmJpbmcKPj4gdGhyb3VnaCBvbGQgc3R1ZmYuCj4gSSdkIGRlZmluaXRlbHkgbGlr
ZSB0byB0YWtlIHRoZSBhcm02NCBwYXJ0cyB2aWEgdGhlIGFybTY0IHRyZWUgKG9uIGEKPiBzaGFy
ZWQgYnJhbmNoKSwgYXMgaXQncyBhIG5vbi10cml2aWFsIGFtb3VudCBvZiBtbSBjb2RlIHdoaWNo
IG1heSBlbmQgdXAKPiBjb25mbGljdGluZy4gSSdkIGFsc28gbGlrZSB0byBzZWUgUnlhbidzIEFj
ayBvbiB0aGUgY2hhbmdlcyBiZWZvcmUgdGhlc2UKPiBlbmQgdXAgaW4gLW5leHQuCj4KPiBXaWxs
CgoKVGhlIHJlYmFzZSBvbiB0b3Agb2YgdGhlIGNvbnRwdGUgbVRIUCBzdXBwb3J0IGNoYW5nZWQg
cXVpdGUgYSBmZXcgCnRoaW5ncywgSSBoYXZlIHNvbWV0aGluZyB3b3JraW5nIGFuZCB3aWxsIHNl
bmQgaXQgc29vbiwgc28gbm8gbmVlZCB0byAKcmV2aWV3IHRoaXMgcGF0Y2hzZXQuCgpUaGFua3Ms
CgpBbGV4CgoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
