Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67260C4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UgxLTF8las95CexzxYvbxA+fqNwzidISXeBowUPK0FY=; b=NSE6Mn3fCfFmy7
	hE6Au4bfoZTiQS0xLttn3kaapPZs3wp9P3lc1CRfFTPEdVpA9mzWhy6CbsSGFAIg50bquJpC65Y5s
	g5hljFV1GAqG8NLCJbabqOFE+ui68ICPu1LdFonE35AmrBSbPAOi1pqEncg8bu3QaPnaG7YQ/K01Y
	ZD7jdt7zRJFvuaodT1Zgi28KW6CdsuWQFGXHmGMrSOefSRQl1WqfifyDcxS5sb3DfJKqwjbt9LoN6
	2iihUQDE5Dc1bQqQdPGYLbu+5uy5cOt1Ljv53/FeC95BwEzPwpNkxSaruTclVO83Yu65xlZJ+zycU
	GMYmvBrQKeHX4um9U2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09n2-00Bc8z-Gn; Tue, 29 Nov 2022 23:13:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09mz-00Bc8Z-Lm
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:13:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D37F61941;
	Tue, 29 Nov 2022 23:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CEE5C433C1;
	Tue, 29 Nov 2022 23:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669763600;
	bh=aQKpeOFpW69ooTs1xwWqEZTPx5WEiJ2oeybjsnwqbmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGNosxmXTlJfTcC6l2owHcZ3tpMWy7ZlKJBNQ/52hrJsmUvsnVGyoMClHFOB4lEeg
	 IBtz0agEPQ6aqKq0gJ7p0n8eoJdj5dVgBouKyOB79Rt46mFiz/XMZsM/iIcKEGbfnA
	 5ZNhKEYoVnvt3xMN/BE8cYzZDbjMxpk2YPFiUazeX5w0idBmUTrN9yyS8C5fh71zwN
	 SF0B7bt7kmIIMcf0HC0m5T3bWdIdsoAdWx3Akf8bzW7VYQTkUo4kSOCQ3SZM8BeE+b
	 phbyF2vGL6pibTGWUUYi1DVd+LnD0E2C3ybUD2+EkQenkPoNeUS4R9r43Hghp5F9mN
	 9ToIHN/eROjjA==
Date: Tue, 29 Nov 2022 23:13:16 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 05/13] RISC-V: rename parse_asm.h to insn.h
Message-ID: <Y4aSDIXBywjtJQbD@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-6-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_151321_772307_13E55F8C 
X-CRM114-Status: GOOD (  18.18  )
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

On Mon, Nov 28, 2022 at 11:26:24AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> The current parse_asm header should become a more centralized place
> for everything concerning parsing and constructing instructions.

Heh, I opened this mail in mutt without reading $subject and my gut
instinct was to say "parse_asm" doesn't feel like the right name for
this content...

> We already have a header insn-def.h similar to aarch64, so rename
> parse_asm.h to insn.h (again similar to aarch64) to show that it's
> meant for more than simple instruction parsing.

...and then I realised what that patch was doing :)
rg parse_asm | wc -l
0
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Still doesn't build though due to trailing stuff from prior commits.

> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/{parse_asm.h => insn.h} | 0
>  arch/riscv/kernel/kgdb.c                       | 2 +-
>  arch/riscv/kernel/probes/simulate-insn.h       | 2 +-
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename arch/riscv/include/asm/{parse_asm.h => insn.h} (100%)
> 
> diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/insn.h
> similarity index 100%
> rename from arch/riscv/include/asm/parse_asm.h
> rename to arch/riscv/include/asm/insn.h
> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
> index 61237aeb493c..2e0266ae6bd7 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -11,7 +11,7 @@
>  #include <linux/string.h>
>  #include <asm/cacheflush.h>
>  #include <asm/gdb_xml.h>
> -#include <asm/parse_asm.h>
> +#include <asm/insn.h>
>  
>  enum {
>  	NOT_KGDB_BREAK = 0,
> diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
> index 29fb16cd335c..a19aaa0feb44 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.h
> +++ b/arch/riscv/kernel/probes/simulate-insn.h
> @@ -3,7 +3,7 @@
>  #ifndef _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
>  #define _RISCV_KERNEL_PROBES_SIMULATE_INSN_H
>  
> -#include <asm/parse_asm.h>
> +#include <asm/insn.h>
>  
>  #define RISCV_INSN_REJECTED(name, code)					\
>  	do {								\
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
