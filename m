Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9D1C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 04:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xCNlTOSbiOfVv9IQK+mKGXAfJ/yKCb3MQ0pmVwvu8g=; b=K5qB/IUjmP2nGB
	nF5Hxv4V3Ajw46ps8axmQXyV7Z1GcUfv4DD2rR8BPoIOMp+ZNmjiKuqqI0kutv3bONoT/8Fu3HPhI
	ZfoaP3zHpSXVRJnchpVgWzZziZKdD9tmWQdQK3bnfgywsTXyuOmDajdDTJhBg3cHQZXntBdl3OXho
	0f/XDJVauuglvuIPN8t3qW39S9B7ilVbE9P0rOAWxMv+mJ9bpkfbtWwkLKqimYhGn+d/zKDsnJXzp
	XSszXiaPZVC2O9A7HV+1lj/+MH/rbtJc1Xv2hBu1g+5X+8UoXUNJOOLmcKzWk5mlIz8u6K7KKa6De
	eStIRLTp1hRZAT8yfgdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXDkd-00F4Or-Fd; Wed, 01 Mar 2023 04:07:35 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXDkb-00F4OS-3U; Wed, 01 Mar 2023 04:07:33 +0000
Message-ID: <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
Date: Tue, 28 Feb 2023 20:07:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
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

Hi--

On 2/28/23 16:26, Jesse Taube wrote:
> This patch-set aims to add NOMMU support to RV32.
> Many people want to build simple emulators or HDL
> models of RISC-V this patch makes it possible to
> run linux on them.
> 
> Yimin Gu is the original author of this set.
> Submitted here:
> https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html
> 
> Though Jesse T rewrote the Dconf.

Dconf?

> 
> The new set:
> https://lists.buildroot.org/pipermail/buildroot/2022-December/658258.html
> ---
> V1->V2:
>  - Add Conor's clock patch for implicit div64
>  - Fix typo in commit title 3/3
>  - Fix typo in commit description 2/3
> V2->V3
>  - Change from defconfig file to a PHONY config
> ---

Is this 'rv32_nommu_virt_defconfig' target the only build target
that is supported?

I ask because I applied the 3 patches and did 25 randconfig builds.
5 of them failed the same way:

riscv32-linux-ld: drivers/soc/canaan/k210-sysctl.o: in function `k210_soc_early_init':
k210-sysctl.c:(.init.text+0x78): undefined reference to `k210_clk_early_init'

because
# CONFIG_COMMON_CLK_K210 is not set


Maybe SOC_CANAAN needs some more selects for required code?

> Conor Dooley (1):
>   clk: k210: remove an implicit 64-bit division
> 
> Jesse Taube (1):
>   riscv: configs: Add nommu PHONY defconfig for RV32
> 
> Yimin Gu (1):
>   riscv: Kconfig: Allow RV32 to build with no MMU
> 
>  arch/riscv/Kconfig     | 5 ++---
>  arch/riscv/Makefile    | 4 ++++
>  drivers/clk/clk-k210.c | 2 +-
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
