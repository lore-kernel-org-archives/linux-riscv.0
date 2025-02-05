Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FF1C02199
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 17:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r65q5zmVLSFiAOjc4mq7R7mJbZAtHVrAEezn4LJlKTY=; b=hyuZUwXJUdHvKA
	028/3hLxc6f3x/xMYxx7m92l2n/bDMWwaKzTbHf0D0p73NKWpYc4J/wpxzMAbcdJ7oEz+9sr1j1dI
	N7tGnG7uRdbnYhHHNwjZ1wktm+0d3Aw3HcXc5W1JNSQ3weXyHiyiMpnkIJlTTgnK+Vn88PO0dzfSh
	cnvR3oT2O4sOM+tPcNEr/0EKDyhVlIiAn2l7D0i3zWOXD/hGD3ZUfkORAvDeXf7hUP3Y/AJ/vnQxZ
	ASY8IoJ6biXEE6IWNUzJu6HXq+sKifsyL2J+NfSSH/omkiPt4hoUxfUbBvJ2BMTXgvLazm94vWna1
	O8ZBxOFsJzbntR9BV0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjVB-0000000492R-2c8L;
	Wed, 05 Feb 2025 17:47:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfiI3-00000003zB8-2MTa
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:30:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5028A43851;
	Wed,  5 Feb 2025 16:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E9BC4CED1;
	Wed,  5 Feb 2025 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738773014;
	bh=+6aRCaTOfyio0lD6Nw0WgylHhIrEaav3y6vOHne/HNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O5k97lnmHoTCWPHwhXO4sMZQ+ZVHFuBDyOUF+AVba3Vvh1td7KZFGSP8TjEEKgY2f
	 EbbEslN/TE620B2ceOqQ00z86QFEiH0yfElimctL165QIPD1M/UEKq3r2W8UASpOzu
	 SBxMyNRBXavz6kIC6ntm7AQ4ugor0w/ND7eLB8HjRagjWsTDXs02lTf/ghNxnKU5ev
	 v5mdhiPNYnm+BxBia25hS5WJy1TeHZuuNGGQFNW7Jb7KOnjEXYmrRuQ7i+vVuNCDKS
	 ulfaC6xywoffDRvpFBSVg8UsWFlRgjpLWJrZ2FiOipmMiQ6XrA5nFbhHgNNhmCwSuu
	 zzTrDBxsbpBVw==
Date: Wed, 5 Feb 2025 08:30:12 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, ardb@kernel.org
Subject: Re: [PATCH v3] riscv: Optimize crct10dif with zbc extension
Message-ID: <20250205163012.GB1474@sol.localdomain>
References: <20250205065815.91132-1-zhihang.shao.iscas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205065815.91132-1-zhihang.shao.iscas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_083015_734759_CD232458 
X-CRM114-Status: GOOD (  19.93  )
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

On Wed, Feb 05, 2025 at 02:58:15PM +0800, Zhihang Shao wrote:
> The current CRC-T10DIF algorithm on RISC-V platform is based on
> table-lookup optimization.
> Given the previous work on optimizing crc32 calculations with zbc
> extension, it is believed that this will be equally effective for
> accelerating crc-t10dif.
> 
> Therefore this patch offers an implementation of crc-t10dif using zbc
> extension. This can detect whether the current runtime environment
> supports zbc feature and, if so, uses it to accelerate crc-t10dif
> calculations.
> 
> This patch is updated due to the patchset of updating kernel's
> CRC-T10DIF library in 6.14, which is finished by Eric Biggers.
> Also, I used crc_kunit.c to test the performance of crc-t10dif optimized
> by crc extension.
> 
> Signed-off-by: Zhihang Shao <zhihang.shao.iscas@gmail.com>
> ---
>  arch/riscv/Kconfig                |   1 +
>  arch/riscv/lib/Makefile           |   1 +
>  arch/riscv/lib/crc-t10dif-riscv.c | 132 ++++++++++++++++++++++++++++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 arch/riscv/lib/crc-t10dif-riscv.c

Acked-by: Eric Biggers <ebiggers@kernel.org>
Tested-by: Eric Biggers <ebiggers@kernel.org>

This can go through the riscv tree.

Some minor comments below.

> +static inline u64 crct10dif_prep(u16 crc, unsigned long const *ptr)
> +{
> +	return ((u64)crc << 48) ^ (__force u64)__cpu_to_be64(*ptr);
> +}
> +
> +#elif __riscv_xlen == 32
> +#define STEP_ORDER 2
> +#define CRCT10DIF_POLY_QT_BE 0xf65a57f8
> +
> +static inline u32 crct10dif_prep(u16 crc, unsigned long const *ptr)
> +{
> +	return ((u32)crc << 16) ^ (__force u32)__cpu_to_be32(*ptr);
> +}

Maybe use 'const __be64 *' and 'const __be32 *' for the pointer, and use
be64_to_cpu() and be32_to_cpu().  Then the __force cast won't be needed.

> +static inline u16 crct10dif_zbc(unsigned long s)
> +{
> +	u16 crc;
> +
> +	asm volatile   (".option push\n"
> +			".option arch,+zbc\n"
> +			"clmulh %0, %1, %2\n"
> +			"xor    %0, %0, %1\n"
> +			"clmul  %0, %0, %3\n"
> +			".option pop\n"
> +			: "=&r" (crc)
> +			: "r"(s),
> +			  "r"(CRCT10DIF_POLY_QT_BE),
> +			  "r"(CRCT10DIF_POLY)
> +			:);
> +
> +	return crc;
> +}

A comment mentioning that this is using Barrett reduction would be helpful.

BTW, this is fine for an initial implementation, but eventually we'll probably
want to make it fold multiple words at a time to take advantage of
instruction-level parallelism, like the x86 PCLMULQDQ code does.  We also might
be able to share code among all the CRC variants like what I'm doing for x86.

> +#define STEP (1 << STEP_ORDER)
> +#define OFFSET_MASK (STEP - 1)

You can just remove the above #defines and use 'sizeof(unsigned long)' directly.
You can even use the % and / operators since the compiler optimizes them.
arch/x86/lib/crc32-glue.c does this.

> +	p = (unsigned char const *)p_ul;

Please use 'const u8 *'.

Thanks!

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
