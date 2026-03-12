Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F81FED2EB
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Mar 2026 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eiv/b+YO4n7W2fauJsb/jz9kiRhCMZuvr5KhL0kfq/o=; b=T20npVjm3bQ+OQ
	4a9X6J9QiSVkhbZbo61tQ7kqoA3j+mDWLdckm+Lb92PrGTvEzuTl/QinLWM/lQbSuLMvdY2ZfTFj0
	lSELlD7yKAcSYpIcpfn4p34osW3q/G2Nm4RET4UkBqCAMbxLiYkuZ3V9B4amfYZityONXCZlO5oBk
	WecM6DSBOKa7d4AxruF4RUPcw/JuZxCAnX7DrGTq2TX2Bhby8xG9sRZ5EgUpr1DnBX5ok3+Zw9yFb
	S9EJmzh89HTEH9baILqp8wtR9OBnySkGDsBof7c7xhmPcE9YxUJkxBRIaDnjBQYOtmoFbEoQOTU5W
	VjBS1UKdkchkpsANHsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bZM-0000000DeSP-3ate;
	Thu, 12 Mar 2026 08:39:00 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bZL-0000000DeRN-12Y4
	for linux-riscv@lists.infradead.org;
	Thu, 12 Mar 2026 08:39:00 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48374014a77so7748155e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Mar 2026 01:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773304736; x=1773909536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tXrAFYR5bIhSumOFjuc1G0swOeqj6K0Pq1d0oWdhjWU=;
        b=kWXVmDGOrEI/c0dfGsKm/XXJFuYc1x/lnyO+3N/5VLpeCHtXRjuwJRmyfiL3pOzOHF
         xmBeLEkngRGDzecE4mkaac6NrrilKw51bHgItokf3gHXUFAf/56RyB5aTlJPsHMzDCUJ
         8eze2Dt8k46mcEnC9YEdiAirVgSZHKMEnVpaP6mCZD4KVILxeX3MgsWjTqdr00w26HMY
         0Q7qH9M0BX7562RTR+7lq0KjhPsQQ8nhFmo8nl0ZWRL+N1le2Tc3jJr0JdX7J6WirTso
         SpHkC2ZCPA4miolQWr8BTE1hUiHd78K9eHAl7OykfckSkOXGEm8OhN9fdYNgxRwwltFS
         MMew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773304736; x=1773909536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tXrAFYR5bIhSumOFjuc1G0swOeqj6K0Pq1d0oWdhjWU=;
        b=NCftxXtKZz9mN8vRWFJZpzQes9HAQkLvhPfwwIFdLH4BA60sYuhyf6epec/VopD7ZS
         aL+0Z4+loA+F52vao4A3Kxy024Ku7WSVbs9BNn0VUB1kg5NDQHBJYSxrPgnvJYxL3JxF
         k18jvxVgj+kPbT/AGAObBEDZr7jV6ASkTIWT1slQGUoHhpMyJV6PrVdstaaW6dhaJKtB
         DNloDQ6J9bEkSU0mM5mhyaPCDqQuIxxp2rlXbnQKagmSYOWfU5hWu9tGP05RrYDxDHnT
         3KrRfJfd5NOaPREvGSzaYiFyXNJqdw530Gch0/Mrv77kEcGUP8v6Fr0AfIuxPBNLAmyL
         janw==
X-Forwarded-Encrypted: i=1; AJvYcCWVpzHukoY6urQgq5WQaBx8TRQ9pGng7t4lLUhij325U7QtLNu3P2VnVtgfanDsTwMFB7IKqBE5L2F5oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3SGan4PECCej0paS2EquAEIuhJT7v42S66QRMfrXNCE+icZ9+
	lAYV8oyZnK5bHfirKiouS8zrNLz35xq/X3VGy6zDWLmj9ebuL4jOovvU
X-Gm-Gg: ATEYQzx6cGGy8deF2F7VXMgMkG28FJbflwVFehRuMCa0r0O7mpXZ8boKyl1PutQvCln
	Ag08fY1t/kGQ2kTGp6KvZiajKN5Use6JpLbKrL6GltGsvdkLztwTkoao11sDakB8VtUSlw0hlnj
	pdT8S3a2XumdTJwVOYxKcnGUUwC5V8TkNfdV9WgYReWcMniPYxHXAE83vELhV0QH6iqctN35OM9
	9PDeByszTpQ7iz8c29S1/rXF8GWyRBehq65ffDSteoiQUNzYaI/1d4hwXL8dGj6KnaNPM5UsWBK
	IixeCSjahPHoF6rxkdJmTQmc08DJ3rg3HSKi2BCopKo1nmd74GKTSU8YgOlt5kqvaVapQClKWa5
	j41BWseViM0R9LjUNODmfnuQGTLnTTvmL+6IxmWj/i9aKo89PF58xnXbUr+W8+BXMikribrCtUF
	NMHSsjzONfmkeMKfDdC300heT3sUKs08mpspDJoPZInmrNED1qlCCmsplAu69ohP9J
X-Received: by 2002:a05:600c:3551:b0:477:7b16:5fb1 with SMTP id 5b1f17b1804b1-4854b0cbe81mr96719315e9.7.1773304735965;
        Thu, 12 Mar 2026 01:38:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5f6bb4sm111774365e9.4.2026.03.12.01.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:38:55 -0700 (PDT)
Date: Thu, 12 Mar 2026 08:38:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Richard Henderson
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Magnus
 Lindholm <linmag7@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas
 Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, Anton
 Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Herbert Xu <herbert@gondor.apana.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, David Sterba
 <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>, Song Liu
 <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>, Li Nan
 <linan122@huawei.com>, Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld"
 <Jason@zx2c4.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 26/27] random: factor out a __limit_random_u32_below
 helper
Message-ID: <20260312083853.01dc18d3@pumpkin>
In-Reply-To: <20260311222935.GA3161@quark>
References: <20260311070416.972667-1-hch@lst.de>
	<20260311070416.972667-27-hch@lst.de>
	<20260311222935.GA3161@quark>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_013859_335679_B37D8817 
X-CRM114-Status: GOOD (  25.35  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 11 Mar 2026 15:29:35 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> On Wed, Mar 11, 2026 at 08:03:58AM +0100, Christoph Hellwig wrote:
> > Factor out the guts of __get_random_u32_below into a new helper,
> > so that callers with their own prng state can reuse this code.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>  
> 
> I think I'd prefer that the test just uses the mod operation instead,
> like many of the existing tests do:
> 
>     prandom_u32_state(&rng) % ceil

Or possibly what the old code used:
	(prandom_u32_state(&rnd) * (u64)ceil) >> 32

Which distributes the values evenly across the range although
some values happen 1 more time than others.
I suspect that is good enough for a lot of the users of the cryptographic
random number generator as well.

	David

> 
> Yes, when ceil isn't a power of 2 the result isn't uniformly
> distributed.  But that's perfectly fine for these tests, especially with
> the values of ceil being used being far smaller than U32_MAX.
> 
> There's been an effort to keep the cryptographic random number generator
> (drivers/char/random.c and include/linux/random.h) separate from the
> non-cryptographic random number generator (lib/random32.c and
> include/linux/prandom.h).  This patch feels like it's going in a
> slightly wrong direction, where random.c gains a function that's used
> with both cryptographic and non-cryptographic random numbers.
> 
> And if someone actually needs a fully unform distribution, then they'd
> probably want cryptographic random numbers as well.
> 
> So I'm not sure the proposed combination of "fully uniform
> non-cryptographic random numbers" makes much sense.
> 
> Plus the '% ceil' implementation is much easier to understand.
> 
> - Eric
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
