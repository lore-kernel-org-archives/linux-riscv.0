Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721FECA0FE6
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Sep 2023 05:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eTtTOhPHVfQbqYEBcNA/WBHyBcpcTaQ7bnuOy5GFQCM=; b=r0tYi53HIWV/Uh
	TT72zB0l59DQ6MJfdQYekHpPwh46L35YWrnCiE5Z/ZJOVm1r9Q26PJFGCbq8Znx3/JshN8VXGX42u
	iXMjFSLpA74ZEegQGxxYWfVifeu2VssmpJ1t9zrnBHi5V+xGIYMR9g7zJggwwOzaVh4haNA87GFvM
	49uQJ/fKJ8jZ4NiKwux1zfgE+6iomS1di6EOVWLDWjJ//zACbuc5fk9K1JDzJ+vjkjOC0jYUvyjHl
	USUaHNmF7jhI1bHIj21fU8Z94HhDmBcJI+/cd5Lq6+jh1qwW6OXdzO5zanopXlL+1GfaSDzQjV6Dp
	N0FWC1nbe4TbVty0pyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbwmt-00GUxE-1P;
	Fri, 01 Sep 2023 05:33:43 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qbwmr-00GUx1-2O;
	Fri, 01 Sep 2023 05:33:41 +0000
Message-ID: <33a5e278-fb4b-b5db-e4f6-bb5a1e4228ef@infradead.org>
Date: Thu, 31 Aug 2023 22:33:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: linux-next: Tree for Aug 31 (riscv: ANDES errata)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20230831135535.13c67178@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230831135535.13c67178@canb.auug.org.au>
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



On 8/30/23 20:55, Stephen Rothwell wrote:
> Hi all,
> 
> Please do *not* include material destined for v6.7 in your linux-next
> included branches until *after* v6.6-rc1 has been released.  Also,
> do *not* rebase you linu-next included branches onto v6.5.
> 
> Changes since 20230830:
> 
> The risc-v tree gained conflicts aginst Linus' tree.
> 

On risc-v 32-bit or 64-bit, when CONFIG_MMU is not set:

32BIT:


WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
  Depends on [n]: ERRATA_ANDES [=y] && MMU [=n] && ARCH_R9A07G043 [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
  Depends on [n]: RISCV_DMA_NONCOHERENT [=n]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
  Depends on [n]: ERRATA_ANDES [=y] && MMU [=n] && ARCH_R9A07G043 [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
  Depends on [n]: RISCV_DMA_NONCOHERENT [=n]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

WARNING: unmet direct dependencies detected for ERRATA_ANDES_CMO
  Depends on [n]: ERRATA_ANDES [=y] && MMU [=n] && ARCH_R9A07G043 [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
  Depends on [n]: RISCV_DMA_NONCOHERENT [=n]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y]

../arch/riscv/errata/andes/errata.c: In function 'ax45mp_iocp_sw_workaround':
../arch/riscv/errata/andes/errata.c:29:23: error: storage size of 'ret' isn't known
   29 |         struct sbiret ret;
      |                       ^~~
../arch/riscv/errata/andes/errata.c:35:15: error: implicit declaration of function 'sbi_ecall' [-Werror=implicit-function-declaration]
   35 |         ret = sbi_ecall(ANDESTECH_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
      |               ^~~~~~~~~
../arch/riscv/errata/andes/errata.c:29:23: warning: unused variable 'ret' [-Wunused-variable]
   29 |         struct sbiret ret;
      |                       ^~~

64BIT:

I don't see the Kconfig warnings, just the error/warning messages from errata.c

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
