Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E52C47082
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 18:41:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F4761009
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 18:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F4761009
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=I23NlroUsQL3jc7ZGuB/Ggmnd5Tbc5oIjes3szjBa4Q=; b=aYKQYSdezYC6EQJGjAi5D9FOIf
	7O+PQjGE+edD7uH4aHsLTn5fDJ6XgWNaRXnePNaKd73jg/J/tK+BkFYFbsTaBRpA6Zrah1ExcNTDw
	f0Bsl0gxe9mkq6dqnAibQDOMasU4fSCFdToefFtvvf8o5nsOJqmn5jyARUkDsrzMaG+8hQUH62HtZ
	dBY4QnikjY8LiKuNFUnMiMyKyRxmKnyGBbAyGWYkSNlwtLfZDNtVkZQkYHr2dPCnFYFEP6DGkq35h
	3NBpzGyKR+/QCqqGxo7fkRphZwc7vu/Sg75r+sDQp+oeHMdrAsRa3OEIYlLkWAE6bxO7pg1YoLS2V
	8wa3LsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln3t6-0086DX-N3; Sat, 29 May 2021 18:40:44 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln3t2-0086Cd-La
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 18:40:42 +0000
Received: by mail-pl1-x635.google.com with SMTP id u7so3195744plq.4
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=wUlCbnys0eqW915jnbNuaHW9wIXlmhiIpLYJvmfP+lw=;
 b=iKKFs34fTmItUqBhdRk+IEXVVcnf3R8oJDfiSor3pC1Qs1lAjlphFQgZiGpOKSOUnG
 Gkwf4A0SKeh5FLRfHWhUgms9bieY88Cry7HSOlEMNqn1D3qKi2nWAZTl2zg3nCQ67RIn
 tGHAl8ziTm+4SuM5eiP1NjJZdjTmztwk4C1/4Bn3Q6imvDmY0j1sbY4XpOHY967WjhGX
 2KS7uWM2pbFWVCA3GA6Z+aGzDJ2UGqgrcfKHydK9hYg4IasrlqVrmPdlEgrfHklmuGw/
 A4vnbSNDA5RB6R+Jn8giyjjXheQ9XrwvUNNycSuocI2JWIkSAg11PyabJ0nt+LHd5d+S
 CC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=wUlCbnys0eqW915jnbNuaHW9wIXlmhiIpLYJvmfP+lw=;
 b=UfxUlRTURqMw5SD8MSTNZYjd0IRMEsi6lGmiA8B+e57aqVVmAzrHS9QnVFJzFXd3EF
 xN7hcI2D9R3neCKPksJlT/XDJqADcu6C5LTZXkk9NAfEYa6sYrU7y6Q8Quyg5bPWvW+s
 PyswSh+74V9gtEPMOXlfqwuCYHLmozN+gVVm69dimdAk3vDtcf2usn4cOe0u550mh7gP
 ukGHNPm9M8ztqMJeADFXf07Tm0mFtxFoUqPK7v8cThS3n5BGa26LKhmRAaxtfvwJpkkg
 0P+dcHVfYHhXYCQVB+13MHSrTN0k36620AJsT2c2Tid3OyEY4KyWGUwC4pqffqzeCMn6
 JS7w==
X-Gm-Message-State: AOAM531ZVbFQEMaW9OYHvDLss0VyhTb3MFx1bq+Amy1TstRcdcA2yCaB
 zk9NB6nynBllGKH6MhcSB+hfBLjZZySZYQ==
X-Google-Smtp-Source: ABdhPJyhtEFQGN1+SGlkRcmnFQBTY6V+93vO2lkk6yXRr5Guu970VtMPumOBUAN24WEsAbyzkAF3pA==
X-Received: by 2002:a17:90a:1d0c:: with SMTP id
 c12mr11066337pjd.122.1622313639577; 
 Sat, 29 May 2021 11:40:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f9sm6801608pfc.42.2021.05.29.11.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 11:40:39 -0700 (PDT)
Date: Sat, 29 May 2021 11:40:39 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 11:40:27 PDT (-0700)
Subject: Re: [PATCH] riscv: Use -mno-relax when using lld linker
In-Reply-To: <20210514205643.383422-1-raj.khem@gmail.com>
CC: linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com,
 Khem Raj <raj.khem@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <mhng-d39fe45d-7a16-4287-8cbb-1233abe46729@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_114040_727719_9F3B199D 
X-CRM114-Status: GOOD (  16.50  )
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

On Fri, 14 May 2021 13:56:43 PDT (-0700), Khem Raj wrote:
> lld does not implement the RISCV relaxation optimizations like GNU ld
> therefore disable it when building with LLVM=1, Also pass it to
> assembler when using external GNU assembler ( LLVM_IAS != 1 ), this
> ensures that relevant assembler option is also enabled along. if these
> options are not used then we see following relocations in objects
>
> 0000000000000000 R_RISCV_ALIGN     *ABS*+0x0000000000000002
>
> These are then rejected by lld
> ld.lld: error: capability.c:(.fixup+0x0): relocation R_RISCV_ALIGN requires unimplemented linker relaxation; recompile with -mno-relax but the .o is already compiled with -mno-relax
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/riscv/Makefile | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 3eb9590a0775..519f133e0d53 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -38,6 +38,15 @@ else
>  	KBUILD_LDFLAGS += -melf32lriscv
>  endif
>
> +ifeq ($(LLVM),1)
> +	KBUILD_CFLAGS += -mno-relax
> +	KBUILD_AFLAGS += -mno-relax
> +ifneq ($(LLVM_IAS),1)
> +	KBUILD_CFLAGS += -Wa,-mno-relax
> +	KBUILD_AFLAGS += -Wa,-mno-relax
> +endif
> +endif
> +
>  # ISA string setting
>  riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
>  riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
