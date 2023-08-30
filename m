Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1ECC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLXGYMU1hs+HcWNuYS78vOGz8b7CJb6fLyOLCTtpJnU=; b=JJKBLQwRRFjnue
	qwrqqhRknr1p4cB/ZAANBPdL/1WUfLoPidP+b6jiadwKdCGO1tuyD/fiS10B6ltH49pDidprtCFZf
	OHQsdiQzkQwZ80UmgmCLBGmIT+MoYTSDsw5dSHlvDPZ9nrZydnf2JzU13quRhBBuBy2qiZXfhp3O6
	LG85n4kkFavysznkHI+w8FnE73O6DeseDvWRNZnbXSSrX4Ba9f00mlCndCOzzWkfjr+GFhTz5EyVa
	24H3NM4lwP4qsxd/lUq77FlOMyHCqgrka29U8++aJiDpx0o4my6PW+4VUy2DDRBIFFnTmYeaM1NFq
	AZgbMy1Hsrvk7k306wUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbNyC-00DqTF-2m;
	Wed, 30 Aug 2023 16:23:04 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbNyA-00DqSj-1F
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:23:03 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-401ceda85cdso29401885e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693412579; x=1694017379; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j+wvqE02epXHuncYqczfKaHUuShfR7zlmM7dmtciawU=;
        b=aI417wxyKMw2s8HOSTpqUECb8MhkN3yqyrVw2PHLwAB3Bq2k+XvHZJFK2TkfWmtcYO
         EFn+udfj9r1xXpcRGOO4Mr+Ikl+gWbN4g44uQww2bQoPGxJ03TCbslQlUbQP5byjvTHG
         QA2a2DVkymwH36pqqbr2yDO973ubUytRE3vxX0COUpRWc/b8XrTz+Hy61VTHwhYc25Dw
         wnmtn7tbbZZiGeQ7KDtYXo5Wh36wzSI36Wd27E1yuraMSKK90A/azcfRJEu2NAZKM2fN
         Fhae3v+gr6bm+yJp4/B51u9AK8MzK1B3j8vbl6EF/xufvyVmqLGWPDTguQBmLjrsyXc9
         btaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693412579; x=1694017379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j+wvqE02epXHuncYqczfKaHUuShfR7zlmM7dmtciawU=;
        b=dJzF/x334UYMrYWw8zDn+OWf2CLBLGKfqUH2GydmINchkzNZfSkMaticf2Njrnt1sK
         1o2h8DIITGFA6qI2FbnVehDOMnLdrrWRdXeM96+NXkoVKxK67YkxqOJZvMAEuH6pnGd/
         nYnhzubOHpG9sQREMC3Ye9xGHMMGDR/veh+os2rjsyor1mb4VIwd7qW90+soM+PLWKGm
         EqAf5kAKmdp+WWoC/OYkITp+o8hME0b4fBMTcdivYpQG6BgfGyZGXDLpsOiUnLHzR8Bi
         uewwFVRDA/RXQ8icMhLihXg7YT04j7u/wp+3I/w7iBgfhbwjYKDIkdkwCXljOy2xz+Mm
         ZNiw==
X-Gm-Message-State: AOJu0YzsA2Nj5tcmZA9rMgj8S5Usp4bq1JccgzcekoSG9/CgzkCUlomS
	ygyud9nJNTo35k6bEk4jUmVNIQ==
X-Google-Smtp-Source: AGHT+IGOHxswzh+EE8Z6WEOpuGv2Tv96IpNEPUBcTd42dEBTFrKzr5zl8pPLHyGur9y3VAV79xSTEA==
X-Received: by 2002:adf:e387:0:b0:317:5fe7:6844 with SMTP id e7-20020adfe387000000b003175fe76844mr2309228wrm.39.1693412579595;
        Wed, 30 Aug 2023 09:22:59 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id f12-20020adff44c000000b00319779ee691sm17119594wrp.28.2023.08.30.09.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:22:58 -0700 (PDT)
Date: Wed, 30 Aug 2023 18:22:57 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: patchwork-bot+linux-riscv@kernel.org
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, evan@rivosinc.com, 
	conor.dooley@microchip.com, apatel@ventanamicro.com
Subject: Re: [PATCH 0/6] RISC-V: Enable cbo.zero in usermode
Message-ID: <20230830-416e25b9fc6054b36bf81aab@orel>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
 <169340163447.19859.7372275191513999075.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <169340163447.19859.7372275191513999075.git-patchwork-notify@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_092302_434023_44635F94 
X-CRM114-Status: GOOD (  19.85  )
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

On Wed, Aug 30, 2023 at 01:20:34PM +0000, patchwork-bot+linux-riscv@kernel.org wrote:
> Hello:
> 
> This series was applied to riscv/linux.git (for-next)
> by Palmer Dabbelt <palmer@rivosinc.com>:
> 
> On Wed,  9 Aug 2023 13:55:17 +0200 you wrote:
> > In order for usermode to issue cbo.zero, it needs privilege granted to
> > issue the extension instruction (patch 2) and to know that the extension
> > is available and its block size (patch 3). Patch 1 could be separate from
> > this series (it just fixes up some error messages), patches 4-5 convert
> > the hwprobe selftest to a statically-linked, TAP test and patch 6 adds a
> > new hwprobe test for the new information as well as testing CBO
> > instructions can or cannot be issued as appropriate.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [1/6] RISC-V: Make zicbom/zicboz errors consistent
>     https://git.kernel.org/riscv/c/66e02b1d6430
>   - [2/6] RISC-V: Enable cbo.zero in usermode
>     https://git.kernel.org/riscv/c/090925374690
>   - [3/6] RISC-V: hwprobe: Expose Zicboz extension and its block size
>     https://git.kernel.org/riscv/c/d45243f8c239
>   - [4/6] RISC-V: selftests: Statically link hwprobe test
>     https://git.kernel.org/riscv/c/0ca410a80172
>   - [5/6] RISC-V: selftests: Convert hwprobe test to kselftest API
>     https://git.kernel.org/riscv/c/d79a646354a9
>   - [6/6] RISC-V: selftests: Add CBO tests
>     https://git.kernel.org/riscv/c/026645838c86
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 
>

Hi Palmer,

This series needs a v2. There were couple minor comments on v1, and
I just found out that I broke the compiling of the nolibc vector
selftest.

I'll post v2 in the next few minutes. Sorry for the hassle!

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
