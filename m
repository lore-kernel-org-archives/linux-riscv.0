Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96151EB64D7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 17:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=e4ry4Hp2lkMuJ5trweyrLgb1f01s3P3cOrIZw1CtjO8=; b=4qjp1+YakExHvVkFPlzaEmejRV
	WupPikEvXzOZgwie01AbKGik+E0B4d8d7ubsTiFFLyEqKyWROdolkBFmz/nsFlrLsVRZ3P1kniwy9
	GiTk6oo/5Vh4/RMc7ij9GXDgIC7USfvPuYKN6ZcJ3PCYHnqURapdoXOkEsHhV/wYVk0j7sxaYhv/O
	6D7Wk5yMunGg5B5jePRZmZDaICuckGiCh9IMlRwc4ldNz8Mdz5cmcgD67Oq+1w2BBmHWhCUzQ9qmY
	YQnGzJcN8m+pE96uuBZoM+Q0t0+uwU4RAUNIVgJlIc48jLGKUNzpxPtqEsnC67Bu/JfwW6VdSwQjK
	uBItjk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBfRn-00ByQo-2b;
	Tue, 20 Jun 2023 17:47:19 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBfRj-00ByQ4-2P
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 17:47:17 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3416b5df9b3so25001145ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 10:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687283234; x=1689875234;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15DPaA2yeu/H18i78SGzieR0HTDMni/2Vd4N6ujG6o0=;
        b=aTtRZPZqtgwc5I721QSaypapvp1fmtoxp46lXEwwqeV8Cx3/xu0P4O6+j4nDRwEc9/
         BD5x8UZcbcG4mrc78TEeFneGMaEbVM4XNy0+xR9fMHl7GUBysx2Z1kr35fKxtZmBc7Pk
         x6KPn89pvcNeIOVWS4UiPeetwhGwFkCuObOFPTTxBAC/G5kihLlR1X4t/ZAJRiy+JziZ
         ywBITnZhBjVbyLgCFy5eaqyFXpW/A2wLLhEAGeEHaLCi7uoLpEdDdxTrxbVUKkjK7M+1
         lu7sMrI34wK99BFtGJUUGMyfUdPjVWLkygpREtEs0pPkUamt4Y8N/CH1wMtK1oiOzCGZ
         aDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687283234; x=1689875234;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15DPaA2yeu/H18i78SGzieR0HTDMni/2Vd4N6ujG6o0=;
        b=AjOGe/gVAvh5X3yVUXG4Xw59lM6ByWdTj4qHINAIMZ/8WyUsBT3YaICj0yXWH2cbhJ
         CX/PZFOv5dot4wAmn+FJVV5/cDuSdLb5lOp2RiVePcB8ECL69MyiXzPFBjg5VSGoM93c
         zfCSCWGePcqtMGgKYfpY/iJAhLcZWSqxRJbpx9T/pYNS4gNEPw+l0OvOHIfVSmetSxew
         YuqPUOYEmOpdXv+S/3+MrT9Zaul7DZErRU93j0qgV48v53ptBFPu7XU2wfItAewRkjo9
         t/7R8E/MOf2B8F1cL63rSX+OPsxo8kd1vUCA3N7vaCCqrimpvaZlxamschNbpk6WDptQ
         30eg==
X-Gm-Message-State: AC+VfDwucSOtizv3CPY/qMOtybOpt/UjYvsrzzN42WPVT9Cf8oqp3PiP
	0l0BeivbzKpsoG2LwQ1jfwPmHB+s2LGmeC2ec8c=
X-Google-Smtp-Source: ACHHUZ6rjQwegQvtImo7ns7efOyigl4kEmCwH7fakP/gcU5ynvAfw/nPMtbbEjaQoTtSL3YR71n+bw==
X-Received: by 2002:a92:4b02:0:b0:33a:adaa:d6d1 with SMTP id m2-20020a924b02000000b0033aadaad6d1mr11837316ilg.15.1687283233896;
        Tue, 20 Jun 2023 10:47:13 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id l18-20020a656812000000b00514256c05c2sm1561789pgt.7.2023.06.20.10.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 10:47:13 -0700 (PDT)
Date: Tue, 20 Jun 2023 10:47:13 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 10:46:34 PDT (-0700)
Subject: Re: [PATCH 6.3] riscv: Link with '-z norelro'
In-Reply-To: <20230620-6-3-fix-got-relro-error-lld-v1-1-f3e71ec912d1@kernel.org>
CC: Greg KH <gregkh@linuxfoundation.org>, sashal@kernel.org,
  Conor Dooley <conor@kernel.org>, ndesaulniers@google.com, nathan@kernel.org, linux-riscv@lists.infradead.org,
  stable@vger.kernel.org, llvm@lists.linux.dev, lkp@intel.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: nathan@kernel.org
Message-ID: <mhng-70da67b5-db97-4e69-9e0a-041b0b7fe80f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_104715_792501_226110D9 
X-CRM114-Status: GOOD (  21.65  )
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

On Tue, 20 Jun 2023 10:44:50 PDT (-0700), nathan@kernel.org wrote:
> This patch fixes a stable only patch, so it has no direct upstream
> equivalent.
>
> After a stable only patch to explicitly handle the '.got' section to
> handle an orphan section warning from the linker, certain configurations
> error when linking with ld.lld, which enables relro by default:
>
>   ld.lld: error: section: .got is not contiguous with other relro sections
>
> This has come up with other architectures before, such as arm and arm64
> in commit 0cda9bc15dfc ("ARM: 9038/1: Link with '-z norelro'") and
> commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
> CONFIG_RELOCATABLE"). Additionally, '-z norelro' is used unconditionally
> for RISC-V upstream after commit 26e7aacb83df ("riscv: Allow to
> downgrade paging mode from the command line"), which alluded to this
> issue for the same reason. Bring 6.3 in line with mainline and link with
> '-z norelro', which resolves the above link failure.
>
> Fixes: e6d1562dd4e9 ("riscv: vmlinux.lds.S: Explicitly handle '.got' section")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306192231.DJmWr6BX-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/riscv/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index b05e833a022d..d46b6722710f 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -7,7 +7,7 @@
>  #
>
>  OBJCOPYFLAGS    := -O binary
> -LDFLAGS_vmlinux :=
> +LDFLAGS_vmlinux := -z norelro
>  ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
>  	LDFLAGS_vmlinux := --no-relax
>  	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>
> ---
> base-commit: f2427f9a3730e9a1a11b69f6b767f7f2fad87523
> change-id: 20230620-6-3-fix-got-relro-error-lld-397f3112860b
>
> Best regards,

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
