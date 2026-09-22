Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88783C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kFIX8YHqqC9F5F2yqz3BH/iLpWFko1baqSOsZ2tZ8Z0=; b=wVAYk4uBS28B5w
	xZBWyRP8EKlXR2psJQdftoyhmkqfEo7so42csswI65hqVbNfA0z9RGZgZXtznFf3EPW0AyFJpIF65
	H5R/BuoRZ835I22QkvUw4zu+iPwWYAdrYoC8Molw25TwBqrh4k6bszCSRdFFUq+UEisV6NS4ftw12
	FsFp1leTzaiwoEXwQs6Y3H3Gl4BYHA1nEvF3Uayv9b06Bxpfz0JLr2Gz7MW7Ty5ik5KIGqUOZx7HL
	rqJCqJiPVgwfTzmF6WeItV5M7MCb2hEDTMZCb61FYXIaQPLMh5fM5I6oaqz38i2e4VW8DMdxiykNa
	DrlLeFd1di2UumcR3y7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wOE-00000004oxC-15wO;
	Tue, 22 Sep 2026 09:02:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8wOC-00000004owJ-3HH9;
	Tue, 22 Sep 2026 09:02:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1C7A660200;
	Tue, 22 Sep 2026 09:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E505F1F000FF;
	Tue, 22 Sep 2026 09:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790067731;
	bh=+hsnJ4j4rBIXKKH9ChIwWElTHO5VrNa39QD6tMI8Gqk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ho1NxTfYbdGdeqfpz5XyJWNcpb+7YT6deUPOb7e/Es4jmHjJWSyriPfAAGuVspsae
	 6LKxXVdN1I2udTK271j3pFm2GMHS0XZV8KVHkUGVtsYFv5r2COfiRTH2Y6ht/kxwzI
	 5S7K5mqn5YCKOuNg/yGFFk0fqstHlUc6g6O3EF7XYzAKKBM6Nc/Wql66LhlQ47+4db
	 cKexdcycBQ4ogjwH9iqe0dPw02bHXTGuz5lPnWXYIFrVHZPotADEAFLZn7OCXa8iEW
	 al36CmxULEHPX1q79eXSdQseKONK2FXJbwliGmrP2a2xZ+pxm9/S+EEg+twlKbQ1yZ
	 0wPGdhtnaVu7A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 9/9] crash_core: skip MEMBLOCK_NODUMP regions when
 building vmcore ELF header
To: baoquan.he@linux.dev, m.szyprowski@samsung.com, "Wandun Chen" <chenwandun1@gmail.com>, rppt@kernel.org, robh@kernel.org
Cc: devicetree@vger.kernel.org, linux-mm@kvack.org, chenhuacai@kernel.org, palmer@dabbelt.com, linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, conor+dt@kernel.org, kernel@xen0n.name, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, will@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org, iommu@lists.linux.dev, tglx@kernel.org, pasha.tatashin@soleen.com, dave.hansen@linux.intel.com, x86@kernel.org, pjw@kernel.org, bp@alien8.de, mark.rutland@arm.com, ruirui.yang@linux.dev, catalin.marinas@arm.com, hpa@zytor.com, alex@ghiti.fr, pratyush@kernel.org, robin.murphy@arm.com, mingo@redhat.com, kexec@lists.infradead.org, linux-riscv@lists.infradead.org
In-Reply-To: <20260922084256.1515554-10-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
 <20260922084256.1515554-10-chenwandun1@gmail.com>
Date: Tue, 22 Sep 2026 09:02:09 +0000
Message-Id: <20260922090209.E505F1F000FF@smtp.kernel.org>
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

PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPiAKPiBSZXNlcnZl
IHJlZ2lvbnMgKGZvciBHUFUsIERTUCwgLi4uKSBjYXJyeSBubyBkYXRhIHVzZWZ1bCBmb3IgY3Jh
c2gKPiBhbmFseXNpcy4gRXhjbHVkZSBNRU1CTE9DS19OT0RVTVAgcmVnaW9ucyBmcm9tIHRoZSB2
bWNvcmUgRUxGIGhlYWRlciB0bwo+IHJlZHVjZSB2bWNvcmUgc2l6ZSBhbmQgY2FwdHVyZSB0aW1l
LiBjcmFzaF9zaG91bGRfc2tpcF9yZWdpb24oKSBub3cgYWxzbwo+IHJldHVybnMgdHJ1ZSBmb3Ig
TUVNQkxPQ0tfTk9EVU1QLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdhbmR1biBDaGVuIDxjaGVud2Fu
ZHVuQGxpeGlhbmcuY29tPgoKU2FzaGlrbyBoYXMgcmV2aWV3ZWQgdGhpcyBwYXRjaCBhbmQgZm91
bmQgbm8gaXNzdWVzLiBJdCBsb29rcyBncmVhdCEKCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBo
dHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA5MjIwODQyNTYuMTUxNTU1NC0xLWNo
ZW53YW5kdW4xQGdtYWlsLmNvbT9wYXJ0PTkKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
