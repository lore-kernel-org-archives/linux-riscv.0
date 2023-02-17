Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675F2C636D4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 11:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSAoCsPBTg7YW7TO85ueyOR62ffEu+npUlqTtT8Fbuc=; b=TcZYHJEAgMc8Ak
	gJpUx9MYxSPLOpqDvbyGcZF/J7yxKeCaTXzV0ZxemKCre9KLNXXDUCkWOXiwhQ6q1PJFZwMzqMVcZ
	Ztph4mF9NZosMLnavVmRuiatFS4m1NL8QXuiIrvAeBdSxQ9ZqCdodun1ojIGbIY92Zz9FyTLTk/wB
	n8hucZv8u7nBSitok2wNcdejtDUNow7+vjQrvWiU9RFimmj2NZ4OGkhE2wyHIwvcv8VJJTSNIY+gU
	IxbnntQXBMVR8RXDCiX5y7kGyYzjM50WtQ1n2ZlVvhfHGrZXfs7PTPKw37Ql3oWAXtmU4jFqh3efs
	hPIHKHgfc1dfhID9vA/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSzG7-00E1lq-7g; Fri, 17 Feb 2023 11:50:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSzG4-00E1jm-Ad
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 11:50:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3EC0661ADD;
	Fri, 17 Feb 2023 11:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CEC6C433D2;
	Fri, 17 Feb 2023 11:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676634628;
	bh=4IWmFISaxKmIBlvYi5tinpHd5wzh/1iH3X4fDAlUEA4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hvqRlujjx7SyYlN8zwMuR8MyS5x3afCa9htNftsvYhvXgdjM+eJs3W6FvcAfEvMTs
	 B2xJl5+Vzf5+xEqQsYX4lIsIoy1UL5ai1FnC2Vr87Jq3TEnY00014XAtshfbkBbmh/
	 4TqxLO5mZhGhDTejP7yzImvphY44i8QpnXV7Uyw8529xyXBfSBMdRE3+7IIggrr9vk
	 iqnV072FlQ/8Xe3E7l1HCLFb/0FpzP06emc5k1VV4xKCe2jAYdV8dahU0SRJUVo3W/
	 eD1rUanrQnJd1tdtOfRHiC+WvPjUDgZNVzAsYikguJtD8QQ6ylWuDciSAvdh8NvZHR
	 ujl+4RIevBkTQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Andrey Konovalov
 <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 1/6] riscv: Split early and final KASAN population
 functions
In-Reply-To: <20230203075232.274282-2-alexghiti@rivosinc.com>
References: <20230203075232.274282-1-alexghiti@rivosinc.com>
 <20230203075232.274282-2-alexghiti@rivosinc.com>
Date: Fri, 17 Feb 2023 12:50:25 +0100
Message-ID: <87r0uotsse.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_035032_440872_4817BE9A 
X-CRM114-Status: UNSURE (   7.65  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IFRoaXMg
aXMgYSBwcmVsaW1pbmFyeSB3b3JrIHRoYXQgYWxsb3dzIHRvIG1ha2UgdGhlIGNvZGUgbW9yZQo+
IHVuZGVyc3RhbmRhYmxlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L21tL2thc2FuX2luaXQuYyB8
IDE4NSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgNjkgZGVsZXRpb25zKC0pCgpSZXZpZXdlZC1ieTogQmrD
tnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
