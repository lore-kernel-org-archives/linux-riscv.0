Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B789AC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 20:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STcKDUFED7yOtuuIdbzUUyi8SVj8i+EnRDOwKJKG4gw=; b=h9gndvkfzuSTsJ
	nPxiq4z5VqKw+mk4GqYS2c+mc/2QpQDLCSIGGNQ/pHtQsuDfxjPA1ufHBiX42NSona/FJbUlinZpe
	c54x+SgXgURflhzaSu9GzthJU0bzKouDZDs7pGENLgZkYBYsXsr0q8nXnY2YYfTYnANTqxV9Um0Si
	GnO6tDm3k/ljpgfBXa9FPvGQ5MtJYltPifkYuj/SZZAAO/aI8maHS4RHC8NRCsW5oTiW/L8yRvUy3
	gk8GvcDbxKfB+4aZuIk0UCcYMYiIhLwHPRMVvRa9TlmUvhJ+nRY8h4P261ek14Qz2w/TzWXtYn3Qk
	SIEaHecn05ssvTaJlBqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhErC-0000000AadU-0kFc;
	Mon, 04 Mar 2024 20:24:18 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhEr9-0000000Aacn-2eMF
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 20:24:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6B750CE16DE;
	Mon,  4 Mar 2024 20:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A67DC433F1;
	Mon,  4 Mar 2024 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709583852;
	bh=uFdMSM3qZM+dt1Bib9NpBh7aRqMQlZ7L+ConpzhZ4zI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=esKk90ckOpB4uFBQnt/GYpn0GrhgyghLnGC7L0zw12stK+8uozpCBiKrOB4m1a0ZA
	 pRMxW4h6bymwqgtxGEcA9Hif4E32M+6hzng349/9lt4ejmj6/LKjrMzzPLuvTecAd2
	 CePkDGtzs8UDm+NCl/rBP5HAuAl27/VYYe1iv0WUDBNruGoOdjnsylp81rLl9ADv5v
	 MxYyqkQTeNQ/lGDsVoYsfYpV001tkYqcXMeotIgkURA5k5NyEJzodV6euzmmG/syIX
	 dwV4PjWi4j0mid1r6gLBZ2gHiKpHnnvxIXX0u4RerpFB+bC5vdX1iwkHdAJ/0IuuUG
	 XnLhQXVAShCtQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor@kernel.org>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri
 <andrea@rivosinc.com>, Samuel Holland <samuel.holland@sifive.com>, Steven
 Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Andrea Parri
 <parri.andrea@gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: Fix text patching when IPI are used
In-Reply-To: <20240304-makeshift-bakeshop-26c9611de1a3@spud>
References: <20240229121056.203419-1-alexghiti@rivosinc.com>
 <20240229121056.203419-3-alexghiti@rivosinc.com>
 <20240304-makeshift-bakeshop-26c9611de1a3@spud>
Date: Mon, 04 Mar 2024 21:24:09 +0100
Message-ID: <87msrdzqxi.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_122416_090618_88093F4F 
X-CRM114-Status: UNSURE (   9.43  )
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

Q29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IE9uIFRodSwgRmViIDI5
LCAyMDI0IGF0IDAxOjEwOjU2UE0gKzAxMDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gRm9y
IG5vdywgd2UgdXNlIHN0b3BfbWFjaGluZSgpIHRvIHBhdGNoIHRoZSB0ZXh0IGFuZCB3aGVuIHdl
IHVzZSBJUElzIGZvcgo+PiByZW1vdGUgaWNhY2hlIGZsdXNoZXMgKHdoaWNoIGlzIGVtaXR0ZWQg
aW4gcGF0Y2hfdGV4dF9ub3N5bmMoKSksIHRoZSBzeXN0ZW0KPj4gaGFuZ3MuCj4+IAo+PiBTbyBp
bnN0ZWFkLCBtYWtlIHN1cmUgZXZlcnkgQ1BVIGV4ZWN1dGVzIHRoZSBzdG9wX21hY2hpbmUoKSBw
YXRjaGluZwo+PiBmdW5jdGlvbiBhbmQgZW1pdCBhIGxvY2FsIGljYWNoZSBmbHVzaCB0aGVyZS4K
Pj4gCj4+IENvLWRldmVsb3BlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
Pj4gUmV2aWV3ZWQtYnk6IEFuZHJlYSBQYXJyaSA8cGFycmkuYW5kcmVhQGdtYWlsLmNvbT4KPgo+
IFdoYXQgY29tbWl0IGRvZXMgdGhpcyBmaXg/CgpIbW0uIFRoZSBidWcgaXMgZXhwb3NlZCB3aGVu
IHRoZSBBSUEgSVBJIGFyZSBpbnRyb2R1Y2VkLCBhbmQgdXNlZAooaW5zdGVhZCBvZiB0aGUgZmly
bXdhcmUtYmFzZWQpLgoKSSdtIG5vdCBzdXJlIHRoaXMgaXMgc29tZXRoaW5nIHdlJ2QgbGlrZSBi
YWNrcG9ydGVkLCBidXQgcmF0aGVyIGEKcHJlcmVxdWlzaXRlIHRvIEFJQS4KCkBBbnVwIEBBbGV4
IFdEWVQ/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
