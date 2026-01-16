Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7289DD4A5FD
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 04:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n2zAKvd7AVViGwvw4cGU+6ll1Nw4PAqoa7rYhzZsyZk=; b=X1mql/hVUeLzuqf7QmBiVFmjSj
	YPMCAEQE4Mlp6+67AC+AbiBKBO0NAovYZqT3XQQardBZCt8Ln/oFsrabh/HHIvLRlWadBeRxxfILy
	j4VqatHB6T1XJDlDBvqzNeJECVh0CTBVYL/qO67V6k43syQV2G9Pl98Mwk/JiIkAR8DXpGDthyqll
	21M+a6QvoXtiRSKJ+OspgF8PN/R4jC4XsmDIlZyO0lamFWiLFNIow2ifyraqEeWF7ZLCclKRiB5JK
	9R4imB0aAOsjgkgaCklgofz69g3IrTvu8U28sEMrA0m+VYiuYlFRNtuphvjzrrOYihnPZIUe8D31V
	miwNfGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgbn2-0000000DazM-1Snt;
	Fri, 16 Jan 2026 04:50:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgbn0-0000000DazF-3mGh
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 04:50:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0545E60167;
	Fri, 16 Jan 2026 04:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9F3C116C6;
	Fri, 16 Jan 2026 04:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768539025;
	bh=kiycUkgYcgP1rwT2HKpckX+ZMBlhPbMFV0u9l5UBtVA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M1HAIxiaNSgnnbYVvX2rbeJoR1ZrmdFrSF0BZoVYznoedvnk1t8YFNHgtCemyMQSX
	 +KJ9gP08uqGsXTTby4RjAwcJdv5Ga7fxMJSSidWJlUCboGintOutstXE96HDpXrU3Z
	 6g+B7vDMTAyWUL/jNMsX+ps2XH49D9IWWcOA8Fn6SRWgKJby0JVaB66M3yf9GhNCIJ
	 ZoOEW75IRfJkOpTbGY4I7qqSNc/XwjqY/yJ3hAMPEA6Mrz0+H5CMRBk5png7XO5uFG
	 uLJXbFcnKt25JYpHIfBNGNRCpSmULQXLbyIoXI/W9QkdAD6HNVo8cDOxYT0KzkWs4F
	 WksLORM4so+fw==
Date: Thu, 15 Jan 2026 21:50:20 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Implement ARCH_HAS_CC_CAN_LINK
In-Reply-To: <20251222-cc-can-link-riscv-v1-1-633e39e4a60d@linutronix.de>
Message-ID: <74cdaaf4-598d-29f8-584a-3c6a242adee1@kernel.org>
References: <20251222-cc-can-link-riscv-v1-1-633e39e4a60d@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-984989649-1768539025=:2705266"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-984989649-1768539025=:2705266
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

Hi,

On Mon, 22 Dec 2025, Thomas Weißschuh wrote:

> The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
> These are not supported by riscv compilers.
> 
> Use architecture-specific logic using -mabi instead.
> 
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/Kconfig | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6b39f37f769a..b4c1f922eed5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -25,6 +25,7 @@ config RISCV
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>  	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>  	select ARCH_HAS_BINFMT_FLAT
> +	select ARCH_HAS_CC_CAN_LINK
>  	select ARCH_HAS_CURRENT_STACK_POINTER
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
> @@ -1351,6 +1352,16 @@ config PORTABLE
>  config ARCH_PROC_KCORE_TEXT
>  	def_bool y
>  
> +config ARCH_CC_CAN_LINK
> +	bool
> +	default $(cc_can_link_user,-mabi=lp64d) if 64BIT
> +	default $(cc_can_link_user,-mabi=ilp32d)
> +
> +config ARCH_USERFLAGS
> +	string
> +	default "-mabi=lp64d" if 64BIT
> +	default "-mabi=ilp32d"
> +

Any reason why this patch shouldn't use the non-d ABI variants, as the 
rest of arch/riscv/Kconfig does?  I suspect this may not work for 
!CONFIG_FPU builds.


- Paul
--8323329-984989649-1768539025=:2705266
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-984989649-1768539025=:2705266--

