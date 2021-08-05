Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A88C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:46:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B240F60F01
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B240F60F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G//Xc/+8keZraUmyXMJ8fuxmQ6JmXz8T4zoLwIFy8Sk=; b=YEhN3oIQlqPtFN7ITvGXeRmDoI
	Y2mEo53wErb1iCaJu0dAVf2uOO7YVJdTQamoJcMA3ZpHw9wmoIQc2ozOP9Zj/qViJqcrjB2VTJ0Oa
	p3uE6JFneXx+m3cUr8i30Q3BQQTb5OkFc20EQUqbOVus1TNm3Mf299yGk20+peBMhqGkJXyr5Lv1h
	aALPKNxdxcQ29K2obePnDM5IicSJHsrXkigbvuJBWhJgLMprS5GLPZHp1mgh3aAdpyZBGLPaDHpOG
	Cs+rMHU1EzlVqqjTc6LujS4+0fVjKTLpir6C0qdaRR5jcoLaEUJD6lgcRy9hnvDMxNyrFwFkX6mVC
	4Z/YxkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBiNi-00AYML-CO; Thu, 05 Aug 2021 18:46:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBiNe-00AYLL-Tw
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 18:46:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B215F60F01;
 Thu,  5 Aug 2021 18:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628189170;
 bh=Bdu1IVhpkrpzTBly0e81WLlBUlSkIup7ZFwVra1sxac=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RIRPV49xtzJE48PquQUEG1on9n+WPaEfO6ZM8Psb5nUIv//tzxPvAh6o5Hy8zcxea
 g8e/hmPbBLrL8WQ9dYcb8TKph1uOrBUGtzqM0ERjQE/nS0YXUyIQkVbbPrufayqkd/
 yBL2y54hnLK2pZWplhf8bm00fYRQs5qDMHfAh85kp9CnHbzOeoR3XuBMWO6MQioR3t
 xPgxiyr3nqAGKLurgeml3OmuCnWTZz4SUVxnf4Tgit5IMuv6SBMr8BZDcWtJLAlFtm
 yjqasM3MbExKqZJIBOGykkuxwS7hQ43o/45vmafKgm+qrbfxTtQvC2jLUB7CZw+cg+
 f7kIJt6ZnVHRw==
Subject: Re: [PATCH] kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Michal Marek
 <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, clang-built-linux@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20210805150102.131008-1-masahiroy@kernel.org>
From: Nathan Chancellor <nathan@kernel.org>
Message-ID: <59ce441e-8deb-39ff-700f-4e1c4e871177@kernel.org>
Date: Thu, 5 Aug 2021 11:46:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805150102.131008-1-masahiroy@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_114611_035457_726037E2 
X-CRM114-Status: GOOD (  19.71  )
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

On 8/5/2021 8:01 AM, Masahiro Yamada wrote:
> LLVM_IAS is the user interface to set the -(no-)integrated-as flag,
> and it should be used only for that purpose.
> 
> LLVM_IAS is checked in some places to determine the assembler type,
> but it is not precise.
> 
>   $ make CC=gcc LLVM_IAS=1
> 
> ... will use the GNU assembler since LLVM_IAS=1 is effective only when
> $(CC) is clang.
> 
> Of course, the combination of CC=gcc and LLVM_IAS=1 does not make
> sense, but the build system can be more robust against such insane
> input.
> 
> Commit ba64beb17493a ("kbuild: check the minimum assembler version in
> Kconfig") introduced CONFIG_AS_IS_GNU/LLVM, which is more precise
> because Kconfig checks the version string from the assembler in use.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>   Makefile            | 2 +-
>   arch/riscv/Makefile | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4ab151060931..8b56c9692c3c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -844,7 +844,7 @@ else
>   DEBUG_CFLAGS	+= -g
>   endif
>   
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>   KBUILD_AFLAGS	+= -Wa,-gdwarf-2
>   endif
>   
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index bc74afdbf31e..dcfbd2a87d41 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -41,7 +41,7 @@ endif
>   ifeq ($(CONFIG_LD_IS_LLD),y)
>   	KBUILD_CFLAGS += -mno-relax
>   	KBUILD_AFLAGS += -mno-relax
> -ifneq ($(LLVM_IAS),1)
> +ifndef CONFIG_AS_IS_LLVM
>   	KBUILD_CFLAGS += -Wa,-mno-relax
>   	KBUILD_AFLAGS += -Wa,-mno-relax
>   endif
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
