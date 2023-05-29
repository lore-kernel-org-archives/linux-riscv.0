Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1B5C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gh4AD+TfiKjKs0MAxW9Sr1vq3a/1BYa+NGAnSVT4cyk=; b=l3Xe3Rg7V1HXZS
	FuV0iFdhaZIv9kgI53zM2UQ1zxovkIQApTLPRWTxNEe54QPBn2XByc16oxMI/996tey2nAp18LUpO
	o/geLP+w4xriDuN3nv8i8aYanJRUNGNnJeEmYdVSw6nkMSJ2U0shfOhEHgSek8/T78q9VGmWzYGgv
	O6l1heEgbKmTrN456xM/75H4kurDe/9Ow54zIAWNZG5xcRkB/AhruWc7a2TBDTPjUeiyfzKjDuGnP
	czBg5EdKyey07bECNu6kF0RsF0rhhQvzS2tREQdsuc2seIqMIOQ2yz8J4Ec5pgL1d1KrSGyFXoNHD
	TFTS8OrJ5qUE4HB90ZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iga-00BWhM-1j;
	Mon, 29 May 2023 19:37:44 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3igX-00BWfm-0u
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:37:43 +0000
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
X-GND-Sasl: alex@ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5EEFC0006;
	Mon, 29 May 2023 19:37:28 +0000 (UTC)
Message-ID: <41e57bb9-ce0c-7772-abeb-5c01d5ec19bb@ghiti.fr>
Date: Mon, 29 May 2023 21:37:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH -fixes] riscv: Fix relocatable kernels with early
 alternatives using -fno-pie
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Schwab <schwab@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230526154630.289374-1-alexghiti@rivosinc.com>
 <20230526-clergyman-wriggly-accc659a3fad@spud>
 <20230526-rockfish-moody-f6d3e71f9d24@spud>
 <f6522c82-01bd-8a03-579d-a5b294784480@ghiti.fr>
 <20230527-hyperlink-doctrine-ef22cfcb508a@spud>
 <CAHVXubgx3uBEjMLHXTxr0192ZHbSb=qK4NggZyWQTDfgrJt2-g@mail.gmail.com>
 <20230528-darkness-grandly-6cb9e014391d@spud>
 <cf0d2d2a-c407-7b3d-a5ab-ea5c19e7b890@ghiti.fr>
 <20230528-uneatable-earpiece-3f8673548863@spud>
 <b71dc2f5-fdc0-2a8d-e1f9-696cd9a1529e@ghiti.fr>
 <20230529-skillet-quarters-3fbc3b6edb3a@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20230529-skillet-quarters-3fbc3b6edb3a@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_123741_585048_5DEC4446 
X-CRM114-Status: GOOD (  24.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 29/05/2023 21:06, Conor Dooley wrote:
> On Mon, May 29, 2023 at 08:51:57PM +0200, Alexandre Ghiti wrote:
>> On 28/05/2023 15:56, Conor Dooley wrote:
>>> On Sun, May 28, 2023 at 03:42:59PM +0200, Alexandre Ghiti wrote:
>>>> Hmmm, it still works for me with both clang and gcc-9.
>>> gcc-9 is a bit of a relic, do you have more recent compilers lying
>>> around? If not, I can try some older compilers at some point.
>>>
>>>> You don't have to do that now but is there a way I could get your compiled
>>>> image? With the sha1 used to build it? Sorry, I don't see what happens, I
>>>> need to get my hands dirty in some debug!
>>> What do you mean by "sha1"? It falls with v6.4-rc1 which is a stable
>>> hash, if that's what you're looking for.
>>>
>>> Otherwise,
>>> https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vmlinux.bin
>>> (ignore the release crap haha, too lazy to find a proper hosting
>>> mechanism)
>>
>> Ok, I don't get much info without the symbols, can you also provide the
>> vmlinux please? But at least your image does not boot, not during the early
>> boot though because the mmu is enabled.
> Do you see anything print when you try it? Cos I do not. Iff I have time
> tomorrow, I'll go poking with gdb. I'm sorry I have not really done any
> investigating, I have been really busy this last week or so with
> dt-binding stuff but I should be freer again from tomorrow.
>
> https://github.com/ConchuOD/riscv-env/releases/download/v2022.03/vmlinux


Better, the trap happens in kasan_early_init() when it tries to access a 
global symbol using the GOT but ends up with a NULL pointer, which is 
weird. So to me, this is not related to kasan, it happens that 
kasan_early_init() is the first function called after enabling the mmu, 
I think you may have an issue with the filling of the relocations. Sorry 
to bother you again, but if at some point you can recompile with 
DEBUG_INFO enabled, that would be perfect! And also provide the 
vmlinux.relocs file. Sorry for all that, too bad I can't reproduce it.


>
>> I tried with gcc-12 and it still works fine on my end, so frustrating!
> Crap! Also, should you not be enjoying a public holiday rather than
> debugging?! Or maybe debugging is enjoyable for you...


Ahah, this is what I enjoy doing when the kids finally sleep :)


Thank you again for your very quick feedback, really appreciated!


>
> Cheers,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
