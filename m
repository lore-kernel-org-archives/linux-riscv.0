Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D8FC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Date:Message-Id
	:Subject:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIed4O6wP7lMoTPgF+n5QREVYNrcjTxNlMYO8sOs+jo=; b=0XTcZPbEdZrN2X
	60VYHIfQjT4eeiGzmTsJrCKjC2k2Hwns8kyKIuh5o6XQS+hD8lklE2ugn+qSkMc+YAKLdCqKtcTm2
	8wnKDHdqZ5w6d7tVt47o1jHEiDf4Y3qaJN7M221k8xG8cWoU8i1VwYhiJniGF38S4yJ0W9dZVKvIU
	M9sMGYIOnaNOZ465ZDVopzuKLx3hEJO9h3cdAvXBEfWE+KMj89T6coCUhdG1dYLRtNFoI4MUQAYrp
	sMQ1Rr4rmORo4Uue6pNcfSY+igS/OOXrxspWGnJfgqn+H/pf4LklX7FX4gRW1EV6ShcLocaH0hExE
	EQQfqw2x9MhIHwsJwWaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongma-009Xva-HS; Wed, 26 Oct 2022 13:49:24 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ongmD-009XhS-1T
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 13:49:03 +0000
Received: by mail-qv1-xf29.google.com with SMTP id w10so5175458qvr.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Oct 2022 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKFRv0zM9kMluPQ3+hHI7EIzkLtxGEc8lwOlSBqM7+8=;
        b=RPvo9GZ9F6TwIw7A0fjA6QSO9W3jcPv50/4lWroYKxeuCqonf/4q/oMdH6lzyQjbkR
         lcnpvxPLCNsCxJgGc34bD7+VVsaPhHFSMd26Go+hj1TtvQFd4s6yxPzn0BK8PUGFAFVj
         rrDI/HWdcXi90GzguqjpqrQsWonoNZR4iLg0m0IypxjIPcoRig5a2Sb1XFSBxMZ5EaW8
         KqIajKKdXwH8UhjdkhHpocjl8bOAMvozKyOozJ3U0Ux8rh8BlK5WRraxays1gWVtFnCt
         GvkCrX2lsF+ctvRabev0+wy3UJlze/MesBoJ2zpUb03SVjHKFRruOD3qHhLA1Ej/L+Rv
         NzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AKFRv0zM9kMluPQ3+hHI7EIzkLtxGEc8lwOlSBqM7+8=;
        b=veB9I6SPGy2WoYMinHPKUEG9M7B4mFYVf0vsX+lo9BxHWJDnzzUMG2X72KHrbZDv55
         KdtXK+sDBD5xJabop/g9zsOeYztHKkY5w9OkUPSzDVcoLp1G9uJw+MZs6SIc0h0YpWPT
         aDlSseZTQ1hqBtyIOqBuECgYBbgUcTfQHEAzyqVFEh9aogWq58UgXPmPzN3gCC+1Gr1Q
         dDpGgfvwjEjwDYi/N1cIsiXaSEiGakaj02nDLl+Ckd2xcQ+35qBkT0ky9Y3UVEhuCLL4
         VCciwXFDm2a+0n9F9a4IyHis91856C+XdEqbLN1lZr3wEEtVPHHDWiTfK5naVuIzDoMG
         6gKQ==
X-Gm-Message-State: ACrzQf2kl0Eb+lAnvg39ogwuAEexKE0uTg2iqUFSdjbcT0epn8gS/555
	i9o/HpJGikL4ZAXoE36fKExQlrJzlfjzhg==
X-Google-Smtp-Source: AMsMyM4Iwzkt6Srcrk4gx6gtg+JjdQxqOxgx2b6dNxZl9uzmX1WjFH0HKC1etqmNAoTPp+5pkSjkug==
X-Received: by 2002:a17:903:1207:b0:185:4042:23d2 with SMTP id l7-20020a170903120700b00185404223d2mr43403332plh.143.1666792127247;
        Wed, 26 Oct 2022 06:48:47 -0700 (PDT)
Received: from localhost ([135.180.227.132])
        by smtp.gmail.com with ESMTPSA id i129-20020a639d87000000b0046ae5cfc3d5sm2790473pgd.61.2022.10.26.06.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 06:48:46 -0700 (PDT)
In-Reply-To: <20221008145437.491-1-jszhang@kernel.org>
References: <20221008145437.491-1-jszhang@kernel.org>
Subject: Re: [PATCH v2] riscv: jump_label: mark arguments as const to satisfy asm constraints
Message-Id: <166679181922.18979.10448305327462266940.b4-ty@rivosinc.com>
Date: Wed, 26 Oct 2022 06:43:39 -0700
MIME-Version: 1.0
X-Mailer: b4 0.11.0-dev-36ce3
Cc: linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
  llvm@lists.linux.dev, Andrew Jones <ajones@ventanamicro.com>, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Tom Rix <trix@redhat.com>, Ard Biesheuvel <ardb@kernel.org>,
  Steven Rostedt <rostedt@goodmis.org>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
  Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>,
  Nick Desaulniers <ndesaulniers@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
  Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_064901_099517_6EBC79F0 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

On Sat, 8 Oct 2022 22:54:37 +0800, Jisheng Zhang wrote:
> Samuel reported that the static branch usage in cpu_relax() breaks
> building with CONFIG_CC_OPTIMIZE_FOR_SIZE:
> 
> In file included from <command-line>:
> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
> probably does not match constraints
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:285:33: error: impossible constraint
> in 'asm'
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> make[1]: *** [scripts/Makefile.build:249:
> arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> 
> [...]

Applied, thanks!

[1/1] riscv: jump_label: mark arguments as const to satisfy asm constraints
      commit: 89fd4a1df829187d4d35f6a520cc531de622e6f0

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
