Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF0AC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 18:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qPl5mZ+zHYorbvLpkeoSpg9aXObA7jjf4AVZAVLFVCA=; b=X36oKGzac3dLOi
	OqMeqA10Wqayg3IUXWgbXJApErdznGKFYara3zOhxjPwDtsmXOMwfLZeERV0kmznjmU4KisNhveKc
	u4A3S8RqoDNtwvugMviFVh5UvDoPHbF3QajBYTnYzU2tfc0SyooYqLFKJdXstD/yTpO5fdjcG7t19
	iJaLvFBXDjqOUzGno24kJqLezKVDJ0JpgNFbB4E7KdGM1gjQfQ8EPr6ImCwgbhQbp1f/6Pg9sRm+p
	iG8AIqUbdoF2H/BjkLL+qpbwqprjcHFSI26WQLc2zoVXTdg/oEZU3PJF2ROeYc2hc/tJtfk2juBeH
	Qo75dYxH8+DAVZA5Mv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKMc8-00000006Jxy-08MJ;
	Thu, 20 Jun 2024 18:34:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKMc4-00000006Jx3-2JoC;
	Thu, 20 Jun 2024 18:34:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3F9A62278;
	Thu, 20 Jun 2024 18:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78444C4AF16;
	Thu, 20 Jun 2024 18:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718908463;
	bh=X8RvfZsDwX1HuokLfVZANOU/YZgt7uFrJznkcLH5SG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQghWg9qBgi4835TbD+dPoOdmgJcCwq9mlXvsmUA5UqG5jEoEuaxyHuX9X2YcRouC
	 A1Nv9w5Rl2T/rNm14ozxUBc5HEkT3vHZtpk43c5gEDldDEstHPZb61w9H5czlvEyTD
	 bDCooPk7HICkrbcdtJ3uNbfyoUw3LCrUAwjPDLOkM4pgbe7y38CgotR9e4Z4c0ZWwE
	 VBuJar8XPjHFYFcmhXr17Sv64Hps4i0NIjiDJahymIKgcpuM/LBkPzHZ/w+opZY+JG
	 rZBzohwRkUmMAnkTypKTuwVJM1flNglFcrWA53kdh4PjqTK5SiIfiPh9Y4PE6GqMGe
	 VijAp1Lor/9vA==
Date: Thu, 20 Jun 2024 11:34:22 -0700
From: Kees Cook <kees@kernel.org>
To: "liuyuntao (F)" <liuyuntao12@huawei.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] randomize_kstack: Remove non-functional per-arch entropy
 filtering
Message-ID: <202406201127.17CE526F0@keescook>
References: <20240619214711.work.953-kees@kernel.org>
 <98381dbf-f14e-4b6c-8c96-fb6b97ed46e1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98381dbf-f14e-4b6c-8c96-fb6b97ed46e1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_113424_751093_6FB4DF53 
X-CRM114-Status: GOOD (  22.24  )
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

On Thu, Jun 20, 2024 at 11:47:58AM +0800, liuyuntao (F) wrote:
> 
> 
> On 2024/6/20 5:47, Kees Cook wrote:
> > An unintended consequence of commit 9c573cd31343 ("randomize_kstack:
> > Improve entropy diffusion") was that the per-architecture entropy size
> > filtering reduced how many bits were being added to the mix, rather than
> > how many bits were being used during the offsetting. All architectures
> > fell back to the existing default of 0x3FF (10 bits), which will consume
> > at most 1KiB of stack space. It seems that this is working just fine,
> > so let's avoid the confusion and update everything to use the default.
> > 
> 
> My original intent was indeed to do this, but I regret that not being more
> explicit in the commit log..
> 
> Additionally, I've tested the stack entropy by applying the following patch,
> the result was `Bits of stack entropy: 7` on arm64, too. It does not seem to
> affect the entropy value, maybe removing it is OK, or there may be some
> nuances of your intentions that I've overlooked.
> 
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -79,9 +79,7 @@ DECLARE_PER_CPU(u32, kstack_offset);
>  #define choose_random_kstack_offset(rand) do {                         \
>         if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT, \
>                                 &randomize_kstack_offset)) {            \
> -               u32 offset = raw_cpu_read(kstack_offset);               \
> -               offset = ror32(offset, 5) ^ (rand);                     \
> -               raw_cpu_write(kstack_offset, offset);                   \
> +               raw_cpu_write(kstack_offset, rand);                     \
>         }                                                               \
>  } while (0)
>  #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */

I blame the multiple applications of the word "entropy" in this feature. :)

So, there's both:

- "how many bits CAN be randomized?" (i.e. within what range can all
  possible stack offsets be?)

and

- "is the randomization predictable?" (i.e. is the distribution of
  selected positions with the above range evenly distributed?)

Commit 9c573cd31343 ("randomize_kstack: Improve entropy diffusion") was
trying to improve the latter, but accidentally also grew the former.
This patch is just trying to clean all this up now.

Thanks for testing! And I'm curious as to why arm64's stack offset
entropy is 7 for you when we're expecting it to be 6. Anyway, that's not
a problem I don't think. Just a greater offset range than expected.

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
