Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C934C04FF6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 11:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnBFaUfZWq/MyEFdHdKc7Qt+8x5unrtqteKkJWarnqU=; b=Lc7MwyFcLPWOIJ
	5Jw/e+W3/zetgQa1XI1YCKqjAIQhi7B55Ly0ZUdJtAvVfxej/NbWwCOnbV5YCypVoIUgjdciomHxG
	WykJdG8xmoEhQmoG1yaLzbxz60od4AvAwysbEviueg61oXsx+EV01TIv2+YwGCKrNUJoX4vkIlP6J
	QmGZztU7FzBBKNn4H1YaizPfR67+x/J1DxCshKZdKIyNTqD/1ke8IsjrSydbb0kJaSCUWecc1OE7D
	c7W5hG25ILJioT17zyT02upeqBSD2Bgq5q5p5H8t9234QldaCrGpgKhbrFy1Wcbh0mLSHxeJPy1RD
	moi8Z0oMpubhHh6ISLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxm1V-00000005OQH-05H0;
	Fri, 19 Apr 2024 11:03:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxm1R-00000005OOL-0zGw;
	Fri, 19 Apr 2024 11:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEDFE61977;
	Fri, 19 Apr 2024 11:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18D71C072AA;
	Fri, 19 Apr 2024 11:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713524592;
	bh=uWAY6LlF7v6+sqojjMdbCQRzzgR4DjCY8JKq5y18Ehk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4CnkOV8TzpWGtuWggKvbOgGgmDnwWfihPiKWDyeKOBgfMQgKbYqAWbV0zNi09unu
	 F6w+nEDNflQn9cwHTby2xXiJ9MTWm/QrSda0u4cpCBYLoa/RqiLmzG8NXqvSfQenri
	 5k8ACsd7zdPRvLqTOV8cnP8JLL9bC+spTsesgIhlB/onl2LiCvS517GIm7uSG5M51A
	 KAD4Q+WYmNz+CpMnYngIUdlMwvyrC1G/Y561SbvIf6XO7FNgFU5AVjNW8K27bBgQ0I
	 uxbd91aRxGTbT0+nw8jptnCTZ00/9p7sog6tB/HmoZtM5pqFNusVV3/ASfza6XMse1
	 41BbtdZO+HI1g==
Date: Fri, 19 Apr 2024 12:03:06 +0100
From: Will Deacon <will@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: alexghiti@rivosinc.com, ryan.roberts@arm.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 0/9] Merge arm64/riscv hugetlbfs contpte support
Message-ID: <20240419110306.GA2972@willie-the-truck>
References: <CAHVXubiH64beFuB_GHSq5BKCus=O_+bqYTCwWQ+=2Q-F=T=ctQ@mail.gmail.com>
 <mhng-911ba065-e6c8-4d42-978c-e47897bcb493@palmer-ri-x1c9a>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-911ba065-e6c8-4d42-978c-e47897bcb493@palmer-ri-x1c9a>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_040313_420270_3380181E 
X-CRM114-Status: GOOD (  13.91  )
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

T24gVGh1LCBBcHIgMTgsIDIwMjQgYXQgMDM6MTE6NTZQTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQg
d3JvdGU6Cj4gT24gRnJpLCAwMSBNYXIgMjAyNCAwMzoyOToxOCBQU1QgKC0wODAwKSwgYWxleGdo
aXRpQHJpdm9zaW5jLmNvbSB3cm90ZToKPiA+IE9uIEZyaSwgTWFyIDEsIDIwMjQgYXQgMTE6NDXi
gK9BTSBSeWFuIFJvYmVydHMgPHJ5YW4ucm9iZXJ0c0Bhcm0uY29tPiB3cm90ZToKPiA+ID4gSSBj
b25mZXNzIEkgaGF2ZW4ndCBsb29rZWQgYXQgdGhlIHBhdGNoZXMgeWV0LCBidXQgdGhpcyBjb3Zl
ciBsZXR0ZXIgcmFpc2VzIGEKPiA+ID4gZmV3IHF1ZXNpb25zIGZvciBtZS4gSSdsbCBhaW0gdG8g
bG9vayBhdCB0aGUgYWN0dWFsIHBhdGNoZXMgaW4gZHVlIGNvdXJzZS4KPiAKPiBBY2tlZC1ieTog
UGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+Cj4gCj4gaW4gY2FzZSBzb21lb25l
IHdhbnRzIHRvIHBpY2sgdGhlbSB1cCB2aWEgYSBnZW5lcmljIHRyZWUuICBJJ20gaGFwcHkgdG8g
dGFrZQo+IHRoZW0gdmlhIHRoZSBSSVNDLVYgdHJlZSBpZiBmb2xrIHdhbnQsIG5vIHJ1c2ggb24g
bXkgZW5kIEknbSBqdXN0IHNjcnViYmluZwo+IHRocm91Z2ggb2xkIHN0dWZmLgoKSSdkIGRlZmlu
aXRlbHkgbGlrZSB0byB0YWtlIHRoZSBhcm02NCBwYXJ0cyB2aWEgdGhlIGFybTY0IHRyZWUgKG9u
IGEKc2hhcmVkIGJyYW5jaCksIGFzIGl0J3MgYSBub24tdHJpdmlhbCBhbW91bnQgb2YgbW0gY29k
ZSB3aGljaCBtYXkgZW5kIHVwCmNvbmZsaWN0aW5nLiBJJ2QgYWxzbyBsaWtlIHRvIHNlZSBSeWFu
J3MgQWNrIG9uIHRoZSBjaGFuZ2VzIGJlZm9yZSB0aGVzZQplbmQgdXAgaW4gLW5leHQuCgpXaWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
