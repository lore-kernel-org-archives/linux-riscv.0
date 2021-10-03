Return-Path: <SRS0=8Hg0=OX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C11C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30D2C61381
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Oct 2021 17:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30D2C61381
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bAhMljdKNGm2r3GP1qPs/QPfoWdrK+zCVEIkwichk5w=; b=FqueN51fHbWtjKyUKiWxLeSLMC
	L9tDBvC/d16L7KLVkTi+ghyal9rWfdY0qFVY2/A+OOPwYubTFKG4kX+AqiATtSgAYfupEOkqH89cW
	GRFlJPtG/4Fe7nUwD5nJ+hon0D8wTkwAGguZILAjEnhoq3l/El+vLDxS/PyyhBKoYuiz60cMzpXSU
	SeMRFSpevpH5+wbcOWkSqV7GwQUYzLG8lmcitBDaeseZr0Fl4TmxFVwIvQwnHCf8eWgenoZEnJLOV
	loBkw9hcSNzX/mO0uqH7WdO/NZ7vo7pMFnRKhquUR0XSPPANTRLwPX/U3+8EhmMR8ACD9D3ukxzXS
	j0wsVOCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mX5Xy-004CQU-ME; Sun, 03 Oct 2021 17:45:10 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mX5Xx-004CQG-3X; Sun, 03 Oct 2021 17:45:09 +0000
Subject: Re: [PATCH] riscv: add rv32 and rv64 randconfig build targets
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
References: <mhng-a1bcb222-57a9-4ef5-82bc-bed70d1a7e38@palmerdabbelt-glaptop>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <08028a91-0150-a6ee-67ac-73ca53c4d7d7@infradead.org>
Date: Sun, 3 Oct 2021 10:45:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <mhng-a1bcb222-57a9-4ef5-82bc-bed70d1a7e38@palmerdabbelt-glaptop>
Content-Language: en-US
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

T24gOS8xMC8yMSAxMTowNiBQTSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVGh1LCAxMiBB
dWcgMjAyMSAwNzoyOTozMCBQRFQgKC0wNzAwKSwgcmR1bmxhcEBpbmZyYWRlYWQub3JnIHdyb3Rl
Ogo+PiBIaSwKPj4gQW55IGNvbW1lbnRzIG9uIHRoaXMgcGF0Y2g/Cj4gCj4gU29ycnksIEkgbXVz
dCBoYXZlIG1pc3NlZCB0aGlzIG9uZS7CoCBJdCBsb29rcyBncmVhdCwgaXQncyBqdXN0IHRoYXQg
SSBkb24ndCBzZWUgeW91ciBTaWduZWQtb2ZmLWJ5IG9uIHRoZSBvcmlnaW5hbCBwYXRjaC4KPiAK
Pj4gdGhhbmtzLgoKSGkgUGFsbWVyLAoKSSBzZW50IGEgdjIgd2l0aCB0aGUgbWlzc2luZyBTLW8t
YjoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDkxMjAzNDUzOC4xOTQwNC0xLXJk
dW5sYXBAaW5mcmFkZWFkLm9yZy8KCgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
