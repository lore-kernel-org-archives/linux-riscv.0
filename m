Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0B7E77182
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Dec 2024 15:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5g1oOBG1GC2eWyvHo//MXYekXutpZ5CJZDf386bpH4o=; b=4si67Zk3Olko4G
	xwu4ayA3jVvMwotj2i/k5G2gEULpeAjwjkLrCPBckEb48v4u/gcVkw5F9vrrvlFM8mtjDS041HU99
	QPO+69Y9zHcbwblxMgCBCy0C7EUWpnJcrRTH4F56eIjaFg/GXxwJOcuWxefsVGbzHvXo/UDy8QrEh
	xWuJhGvvMeTlq/AYi/v+g58zV2WHnVL2GJp5HgzGe6uqCb4lrFkSWIocJ8NLaQkLk5z7bB5TO9wGT
	7PNoN9O8nc4pU4F4sEUCqHgvCeGMMLp911ARb5qW6/fBtOOJhOCVJjbmbi3RM5usmBZ34xGQTva0k
	OeMSqwQVnAJxv8ZF7Sjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkqA-00000000i1H-1Xm3;
	Thu, 12 Dec 2024 15:10:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkq7-00000000i0f-2FYp
	for linux-riscv@lists.infradead.org;
	Thu, 12 Dec 2024 15:10:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E829FA41C04;
	Thu, 12 Dec 2024 15:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F974C4CECE;
	Thu, 12 Dec 2024 15:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734016253;
	bh=0vtbrOrYixbByfdmk66uzpNcSH77xhWI3fb1PysP9lI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=P5W1KWBF68AAiY0vBM/YnnpTt1t4LwE8HtLendCapfFre+Ib2gGnjTHPvpyGPeq9R
	 GB6FR9WVvpSz/q8VAEqNKpty9881HwNX9vS4FTwMSALfWpgY/2jbbyC2NuWL5FvAgE
	 MmUI6bkpgAXGU56iYVTKolyAZo02NNRW+PIjznTnvUwiXZKK3OpVAvDAd9iz3utbgS
	 ZAUMXkzSzzjNFKuLWDYR9NcOrH6sDhk49dNh6Ql2lJZ/6vdQ7O1xT4JdQQWMvw+SuC
	 qO831lSajPQCe4J9Cb3icPW6Rj0VUicSI12i6zvq0KAGoHfavVePbkS37UJFT8Om+a
	 NUFbOhAnmFbnQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH] MAINTAINERS: Add myself as a riscv reviewer
In-Reply-To: <20241212131134.288819-1-alexghiti@rivosinc.com>
References: <20241212131134.288819-1-alexghiti@rivosinc.com>
Date: Thu, 12 Dec 2024 16:10:50 +0100
Message-ID: <87seqtos1x.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_071055_637698_6B5CAD98 
X-CRM114-Status: UNSURE (   4.33  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoZSBn
b2FsIGlzIGZvciBtZSB0byBnZXQgYSBrZXJuZWwub3JnIGFjY291bnQgYW5kIHRoZW4gc2VuZCBw
dWxsIHJlcXVlc3RzCj4gaW4gb3JkZXIgdG8gcmVsaWV2ZSBzb21lIHByZXNzdXJlIGZyb20gUGFs
bWVyIGFuZCBtYWtlIG91ciB3b3JrZmxvdwo+IHNtb290aGVyLgo+Cj4gU2lnbmVkLW9mZi1ieTog
QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKSXQncyB0aGUgNnRoIGFu
bml2ZXJzYXJ5IG9mIHlvdXIgZmlyc3QgUklTQy1WIHNlcmllcyBbMV0gKEkgdGhpbmspLgoKVGhh
bmtzIGZvciBhbGwgdGhlIGhhcmQgd29yayAtLSBrZWVwIGl0IHVwIQoKRW50aHVzaWFzdGljYWxs
eS1TdXBwb3J0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+CgpbMV0gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMTgxMjEwMDYyMTQ2LjI0OTUxLTEtYWdoaXRpQHVw
bWVtLmNvbS8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
