Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DE7C4332F
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Nov 2022 11:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UI6ASrTNMH5xmzdvbhyQFG1+L2MWs6MN4i8YBxl+sao=; b=lTLzrto14Paqyy
	CmVptaCkc5sxsXBB8dnitpSueNQ/mswsYkiEBnqVbYO/mYjoPi0zzqKnEacMVCWwTts74VB/sw6UB
	eCBe8lwEiRCI3Zj5Hp81VttE2liMFXLjTg85aY67h/BSkPZlVNahn3pIYBl4o2O0RrpVFnsiLpoT6
	/lJ3+NnTsa6lQ7iN9MTWHH6++7hZp1N11hb3mZ6wdy68RHwDB9VMOjPqGrEBFSp6epnf8lpQNI3TS
	ELL4CvaMSTIc2u57g5mlnnANi9u5MP3Gfxn/wbK2sueBk5FRO4fKJytMN9TGPH40uWnmXb3ejW3nG
	O/4iRCvEDHoUgJWzkq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ordje-0085nv-N9; Sun, 06 Nov 2022 11:22:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ordjb-0085mx-98
	for linux-riscv@lists.infradead.org; Sun, 06 Nov 2022 11:22:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AE65C60C05;
	Sun,  6 Nov 2022 11:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459D8C433D6;
	Sun,  6 Nov 2022 11:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667733757;
	bh=OwdTq6vSYCGMHzoUM+Ktw7CRJaOcLC4+kIT/bLyvSOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oydxPb/Hw5UAOU7joCSB3r72ZuzIWLb2EcYR6UWqAkIy/Ow2xlnvWY6jkJuytjMfT
	 lkwtNOEaKb92/NcQVC3NVU5gNol8DMYKo13xSZr9SVgnAcUyI4O7F26hWr0illqpV2
	 X/4woT6dhwfUhaVglPmzOBUCvXoNOmWwLPV4NNBnLMdA/i4vm0xYClQQxaqlk5KGXS
	 AhFRUq9sQKEMlc49ZR0Ff40AoW7XNThwOXtZ8nk9U2hH0vHlfN4nXpRss7xMia5u+o
	 ovdU7HETFyscLiM77/o6wXkEXAYptDvnLpYWvXJwjkgisN0VPlpZpiwddy031ath3r
	 AYUnKvc9o7isg==
Date: Sun, 6 Nov 2022 11:22:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH] Documentation: riscv: tableize memory layout
Message-ID: <Y2eY+LulWaKm7MHl@spud>
References: <20221106100239.53704-1-bagasdotme@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221106100239.53704-1-bagasdotme@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_032239_441687_AF4F8D82 
X-CRM114-Status: GOOD (  19.01  )
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

On Sun, Nov 06, 2022 at 05:02:40PM +0700, Bagas Sanjaya wrote:
> Documentation: riscv: tableize memory layout

Minor nit about the $subject - but this is the docs, so I guess there's
nowhere better to mention grammar: "tableize" is not a word. I think
what you want here is "tabulate".

> The memory layout is written as table but it is inside literal code
                                 ^ as a table           ^ inside a

Anyway, those are minor nits I saw in passing, one actual comment and a
simple question below.
Thanks,
Conor.

> block, which renders as preformatted text. Write the layout in reST
> grid table instead.
> 
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/riscv/vm-layout.rst | 120 +++++++++++++++---------------
>  1 file changed, 58 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/riscv/vm-layout.rst b/Documentation/riscv/vm-layout.rst
> index 5b36e45fef60bd..139320e35de81f 100644
> --- a/Documentation/riscv/vm-layout.rst
> +++ b/Documentation/riscv/vm-layout.rst
> @@ -30,70 +30,66 @@ the RISC-V Linux Kernel resides.
>  RISC-V Linux Kernel SV39
>  ------------------------
>  
> -::
> -
> -  ========================================================================================================================
> -      Start addr    |   Offset   |     End addr     |  Size   | VM area description
> -  ========================================================================================================================
> -                    |            |                  |         |
> -   0000000000000000 |    0       | 0000003fffffffff |  256 GB | user-space virtual memory, different per mm
> -  __________________|____________|__________________|_________|___________________________________________________________
> -                    |            |                  |         |
> -   0000004000000000 | +256    GB | ffffffbfffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical
> -                    |            |                  |         |     virtual memory addresses up to the -256 GB
> -                    |            |                  |         |     starting offset of kernel mappings.
> -  __________________|____________|__________________|_________|___________________________________________________________
> -                                                              |
> -                                                              | Kernel-space virtual memory, shared between all processes:
> -  ____________________________________________________________|___________________________________________________________
> -                    |            |                  |         |
> -   ffffffc6fee00000 | -228    GB | ffffffc6feffffff |    2 MB | fixmap
> -   ffffffc6ff000000 | -228    GB | ffffffc6ffffffff |   16 MB | PCI io
> -   ffffffc700000000 | -228    GB | ffffffc7ffffffff |    4 GB | vmemmap
> -   ffffffc800000000 | -224    GB | ffffffd7ffffffff |   64 GB | vmalloc/ioremap space
> -   ffffffd800000000 | -160    GB | fffffff6ffffffff |  124 GB | direct mapping of all physical memory
> -   fffffff700000000 |  -36    GB | fffffffeffffffff |   32 GB | kasan
> -  __________________|____________|__________________|_________|____________________________________________________________
> -                                                              |
> -                                                              |
> -  ____________________________________________________________|____________________________________________________________
> -                    |            |                  |         |
> -   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules, BPF
> -   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
> -  __________________|____________|__________________|_________|____________________________________________________________
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   |    Start addr    | Offset  |     End addr     |  Size   | VM area description                                      |
> +   +==================+=========+==================+=========+==========================================================+
> +   | 0000000000000000 |    0    | 0000003fffffffff | 256 GB  | user-space virtual memory, different per mm              |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | 0000004000000000 | +256 GB | ffffffbfffffffff | ~16M TB | ... huge, almost 64 bits wide hole of non-canonical      |
> +   |                  |         |                  |         | virtual memory addresses up to the -256 GB               |
> +   |                  |         |                  |         | starting offset of kernel mappings.                      |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   |                             Kernel-space virtual memory, shared between all processes:                             |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | ffffffc6fee00000 | -228 GB | ffffffc6feffffff | 2 MB    | fixmap                                                   |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | ffffffc6ff000000 | -228 GB | ffffffc6ffffffff | 16 MB   | PCI io                                                   |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
                                                        ^
Will these numbers remain right-aligned in the formatted doc? They were
aligned before in the text form & no longer appear to be.

> +   | ffffffc700000000 | -228 GB | ffffffc7ffffffff | 4 GB    | vmemmap                                                  |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | ffffffc800000000 | -224 GB | ffffffd7ffffffff | 64 GB   | vmalloc/ioremap space                                    |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | ffffffd800000000 | -160 GB | fffffff6ffffffff | 124 GB  | direct mapping of all physical memory                    |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | fffffff700000000 | -36 GB  | fffffffeffffffff | 32 GB   | kasan                                                    |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   |                                  Identical layout to the 39-bit one from here on:                                  |

This one /is/ sv39. I'd leave this as a blank to match the styling in
the original document.

> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | ffffffff00000000 | -4 GB   | ffffffff7fffffff | 2 GB    | modules, BPF                                             |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
> +   | ffffffff80000000 | -2 GB   | ffffffffffffffff | 2 GB    | kernel                                                   |
> +   +------------------+---------+------------------+---------+----------------------------------------------------------+
>  
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
