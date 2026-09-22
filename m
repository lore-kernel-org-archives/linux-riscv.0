Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D92EC982F1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGS8xFcDRT+VcsgDYcQr9J2e/GH/jMm4QJUphCG2Vt8=; b=GFKLZk+JWSc1jB
	fgZ3OmLBw+h8YLqt9skZtZeBYPdLP9Mpj58VgwfUy9AqZ62hadDXc6ZwSI1bKK2CekrN6+CcZcRc3
	nlEpq1b1+A2y59IsznhybvtMjVs2uirK0B/ZyjXsfFpBwvSr5WmBGbklYd/CEHp7ZL8qtA045vvjD
	mThBXZs6QrWU8PqUNHLox+tRZVbwWBNrw9Q0NFp8cHvtcy81B50+nObZQ1MJSqe8z5JjiSpHedqUE
	O+iOXafYGFv3B8B3uk87lowyhfs2V1ijBY+FCNpLfW0UcQXv3tzWYMR2qYC9l/5EyfiNJhOJxcSXZ
	8XcJ7PA8hpaMy0TrtfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wM0-00000004oIH-1aPD;
	Tue, 22 Sep 2026 08:59:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wLy-00000004oGr-0utC;
	Tue, 22 Sep 2026 08:59:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 729CE60200;
	Tue, 22 Sep 2026 08:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB051F000FF;
	Tue, 22 Sep 2026 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067593;
	bh=+cpSLdx5G86GAiYEa1KiKUdyGr9Hwx+hUdwakbZPe5c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=izvJYf3wx7OMx8dtyK2bPgV4goHzPpSwGkfqbgOp88Z2f384iep3os6cqHBe6ioCo
	 IipTl+Y06tX741Ho3LXMdE8qTZBy6i3kW/AG2fyAak47hFXgIbhMztEc/AjEfWJ3gO
	 tR/TutUOUAWlWalvbKQpWlAlEN8YL3e5y5N7pjthg/ab5xsU3bbMXVoOIgsjkQruj1
	 OyekninqCRr4y32dIPdT5Bd+44BDIJNM8eGAdEaSR4P5Xn3uC66ReBLFcE1ilJjyVa
	 Vp4PDuJDDdxPnmrmh8vGIIpx5tDJkTvYEYN2OU5Kmw3iEXQ1oXLsmHDVUD/8g0E2hX
	 zd2wbQtt6yspg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/9] riscv: build crash_mem ranges from memblock
 instead of resource tree
To: robh@kernel.org, rppt@kernel.org, "Wandun Chen" <chenwandun1@gmail.com>, baoquan.he@linux.dev, m.szyprowski@samsung.com
Cc: pasha.tatashin@soleen.com, aou@eecs.berkeley.edu, linux-mm@kvack.org, conor+dt@kernel.org, mark.rutland@arm.com, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, bp@alien8.de, catalin.marinas@arm.com, mingo@redhat.com, ruirui.yang@linux.dev, iommu@lists.linux.dev, kexec@lists.infradead.org, saravanak@kernel.org, pjw@kernel.org, linux-kernel@vger.kernel.org, hpa@zytor.com, alex@ghiti.fr, chenhuacai@kernel.org, x86@kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, kernel@xen0n.name, will@kernel.org, palmer@dabbelt.com, pratyush@kernel.org, tglx@kernel.org
In-Reply-To: <20260922084256.1515554-2-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-2-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 08:59:51 +0000
Message-Id: <20260922085951.DAB051F000FF@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPiAKPiBSZXBsYWNl
IHdhbGtfc3lzdGVtX3JhbV9yZXMoKSB3aXRoIGZvcl9lYWNoX21lbV9yYW5nZSgpLiBBIGxhdGVy
IHBhdGNoCj4gaW50cm9kdWNlcyBNRU1CTE9DS19OT0RVTVAgaW4gbWVtYmxvY2ssIHRoZSByZXNl
cnZlZC1tZW1vcnkgcmVnaW9ucwo+IG1hcmtlZCB3aXRoIE1FTUJMT0NLX05PRFVNUCBjYW4gYmUg
ZXhjbHVkZWQgZnJvbSB0aGUgdm1jb3JlIGJ5IHdhbGtpbmcKPiBtZW1ibG9jay4KPiAKPiBmb3Jf
ZWFjaF9tZW1fcmFuZ2UoKSBpdGVyYXRlcyBtZW1ibG9jay5tZW1vcnksIHdoaWNoIGlzIGZyZWVk
IGFmdGVyCj4gaW5pdCB1bmxlc3MgQVJDSF9LRUVQX01FTUJMT0NLIGlzIHNlbGVjdGVkLiByaXNj
diBuZWVkcyBBUkNIX0tFRVBfTUVNQkxPQ0sKPiB0byBmaWx0ZXIgcmVzZXJ2ZWQgbWVtb3J5IGZy
b20gdGhlIHZtY29yZSwgc28gZXh0ZW5kIGl0cyBjb25kaXRpb24KPiAoQUNQSSB8fCBLRVhFQykg
d2l0aCBDUkFTSF9EVU1QLiBhcm02NCBhbmQgbG9vbmdhcmNoIGFscmVhZHkgc2VsZWN0Cj4gQVJD
SF9LRUVQX01FTUJMT0NLIHVuY29uZGl0aW9uYWxseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXYW5k
dW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KClNhc2hpa28gaGFzIHJldmlld2VkIHRo
aXMgcGF0Y2ggYW5kIGZvdW5kIG5vIGlzc3Vlcy4gSXQgbG9va3MgZ3JlYXQhCgotLSAKU2FzaGlr
byBBSSByZXZpZXcgwrcgaHR0cHM6Ly9zYXNoaWtvLmRldi8jL3BhdGNoc2V0LzIwMjYwOTIyMDg0
MjU2LjE1MTU1NTQtMS1jaGVud2FuZHVuMUBnbWFpbC5jb20/cGFydD0xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
