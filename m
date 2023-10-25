Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61549C25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 07:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHco3TgT8sFjKyU0P4BfM/R5jfDlHdXXDduDdveC7Bc=; b=ofqVlKyxMPjBjs
	k3qd/+THDx3atDbWQz93TZqzRTBRvqqCf8a0Iepj0yLHc6uLDiX+tAMl54ib21q20t2OZAWzJaQ1b
	1q8Jzqx5x/FVW4eoJVoM4m9jHoFRqlCljX4WKU8Nzv13En1tV5JEzVdYR+WdLCHMVjLE2+djAtFS9
	HRMJeaoMJOgK2ttafwRzzrv29Uqpqiha3ZpMJSaVuIhhxxjxP/ygBnOrRqnHDF3b9lwmyOvPd8jcE
	Sw/VoqGLT9n9fmicUss32jCIb6t3pqI4koweV05gIuKtw7wfTSSqm+S447zg+YytgOAz3ggyBm6fh
	MvwwoJS0TwO5Je7NeeKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvYIx-00BZKH-35;
	Wed, 25 Oct 2023 07:27:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvYIu-00BZJX-08
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 07:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2C96CB82207;
	Wed, 25 Oct 2023 07:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 549BEC433C7;
	Wed, 25 Oct 2023 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698218865;
	bh=OHCzEzIthYtsFmRjwqYLqDLJQoNHQxGwdn/4gsYlYco=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tVy7heX01oupfPjT2/Ni5AsNmXXmvzGx3m0csV3xk8ovUfuxQ0rTb0Uq5kGXLeSio
	 dETsK4pcTzK1jgkquXiejbDpK60fiVGDlBqp9rU4ontKu9+Mjzdsx5HbIsZdX7imG0
	 9+wkFzVFxbUIxnxC4m9juYPQhPPbCXl7rit0d4+j1pkNKykoBYHUFMfV6XXpFB+Wg1
	 I8MRoqKBprf8HWcB9hEI+cxC/4jhlj/uRdPnBIQ4oAICt8EnkxyMrblQZqgfh9o02H
	 4+taBrFSIhC8XzauuGFTfGtBqMiILElOJjAREgPWyqw26D7l/7JH58cSMMQFlQBx0k
	 Igg4BItzXkLwQ==
Message-ID: <01ca878e-aeb1-4fb9-adda-47eaa6f07408@kernel.org>
Date: Wed, 25 Oct 2023 16:27:43 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: boot: Fix creation of loader.bin
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti
 <alexghiti@rivosinc.com>, Song Shuai <songshuaishuai@tinylab.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1086025809583809538dfecaa899892218f44e7e.1698159066.git.geert+renesas@glider.be>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <1086025809583809538dfecaa899892218f44e7e.1698159066.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_002748_239358_672287AE 
X-CRM114-Status: UNSURE (   9.01  )
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

T24gMTAvMjQvMjMgMjM6NTMsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiBXaGVuIGZsYXNo
aW5nIGxvYWRlci5iaW4gZm9yIEsyMTAgdXNpbmcga2ZsYXNoOgo+IAo+IMKgIMKgIFtFUlJPUl0g
VGhpcyBpcyBhbiBFTEYgZmlsZSBhbmQgY2Fubm90IGJlIHByb2dyYW1tZWQgdG8gZmxhc2ggZGly
ZWN0bHk6IGFyY2gvcmlzY3YvYm9vdC9sb2FkZXIuYmluCj4gCj4gQmVmb3JlLCBsb2FkZXIuYmlu
IHJlbGllZCBvbiAiT0JKQ09QWUZMQUdTIDo9IC1PIGJpbmFyeSIgaW4gdGhlIG1haW4KPiBSSVND
LVYgTWFrZWZpbGUgdG8gY3JlYXRlIGEgYm9vdCBpbWFnZSB3aXRoIHRoZSByaWdodCBmb3JtYXQu
ICBXaXRoIHRoaXMKPiByZW1vdmVkLCB0aGUgaW1hZ2UgaXMgbm93IGNyZWF0ZWQgaW4gdGhlIHdy
b25nIChFTEYpIGZvcm1hdC4KPiAKPiBGaXggdGhpcyBieSBhZGRpbmcgYW4gZXhwbGljaXQgcnVs
ZS4KPiAKPiBGaXhlczogNTA1YjAyOTU3ZTc0ZjBjNSAoInJpc2N2OiBSZW1vdmUgZHVwbGljYXRl
IG9iamNvcHkgZmxhZyIpCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4KCkxvb2tzIE9LIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IERhbWll
biBMZSBNb2FsIDxkbGVtb2FsQGtlcm5lbC5vcmc+CgotLSAKRGFtaWVuIExlIE1vYWwKV2VzdGVy
biBEaWdpdGFsIFJlc2VhcmNoCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
