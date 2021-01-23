Return-Path: <SRS0=mxd0=G2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACA1C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:13:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3C9B23B2F
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Jan 2021 04:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3C9B23B2F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=16JGajYxt5XYL8LP4Ee7Et2n0ZtP68XvyJJNBMy1ieM=; b=Qb0Pwo9Fvf/UYOUOVlvsTExqg
	zr0Kv+1VIAeDnnm/Y/Eu83oKcfuntZtOMC07DY8X6pwDuz2Dw25wR+ELfpmiEmi0XNnhSIPNnNter
	TwlUoCEYsw4RNJIl9d1sqdAZGIyKpfuYA3dhzs5Y2YYHBloLGZrJJUQwTKRsZW8OtBa2hmNaKopXD
	IfgYaapp+6srn7c+QweaiQovTvTp8+1hULm4DPj6PI2Gdt6EoZxzKv5oAFXDR2xNHGlSSgWAdvrTl
	PHRGnR+as8WHAXsfVucFfyIt/Agf8JASnyUxx2J0V9/cnmkSH+y0w1RadqEXt4/XJ6umxl5f/02lo
	F/6m/1rWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3AHv-0004HE-2B; Sat, 23 Jan 2021 04:12:39 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3AHq-0004F9-8C
 for linux-riscv@lists.infradead.org; Sat, 23 Jan 2021 04:12:35 +0000
Received: by mail-pg1-x535.google.com with SMTP id g15so5169278pgu.9
 for <linux-riscv@lists.infradead.org>; Fri, 22 Jan 2021 20:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rfxqzONqLpenH9bMcTSEoRtSy4r+OTMclT611uQQPw0=;
 b=VYOj8q7y3B1Ci/zXV0TKKQdP+Hr4DW7yRsr1E+oiVJMPmFipjS5UZ8xLl2xoHoz/6B
 jkpCwgPiLIZPoGfOi1wN88wt16jBRvoyvro7VvrIPcH4RTJznQoHQmoB2t8HyrxAaJdZ
 HBhFM+SE5uT3rPuNDZ63XGBOHfrbXdGCrMh+WmJzIou1s39XhI+QRXq2zuC7lcQ0WAEq
 +J2EBBfVHpHbKs6R2YJuQHl6VFRabnTwOH35OE4IYc02CQ9CIGb17Ob6QmJQaoizK2CX
 qmyOJqbeCl8AsonG5sk05tyhobY+J8YKqRp8zWdSTNaaYU7FnZoryWgNkEnc2zVWMeFD
 MIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rfxqzONqLpenH9bMcTSEoRtSy4r+OTMclT611uQQPw0=;
 b=pNcXC2Q4KBidu6cmGHvpxU86Z/BBF1m7XYPF28yC3ft8ncH0n5ng4XZIHIE0jtfSG/
 1youzqFGG7iVUJZ/bF0Ujwplo8xeYW11UWLnfq6Xix7FsJ7qnwSfEOGN9jrWZQyDewkI
 tVnN/QRAI6nOhV6c9Jz/A9Z+A7yZozQ8t3XuwpryzQKW5wzJK7FSzcObEaSJ2NJVmBhy
 meQl0HPFL6rGewN8bgfXpXokYz+6zRuyz+f4ZZ+ibx1CnHWLnQ0pagFnMHB9WX1amqTR
 QDS40LkUL/CyO2UyRqvOiza/2+5Z0+7OZUpsyNtuaYzM82b/ILRPPp2oO/TAGh2GQ3PA
 eRbQ==
X-Gm-Message-State: AOAM532eNn44kxb4TKbGaRA/r6h65xZ3Gf2pEI1lqKYgzeg3cxAygg3V
 bDk4lLRqzH46o5DU6BoFsiz6JQ==
X-Google-Smtp-Source: ABdhPJz23uPwWexptJVrp5X0oeJBb+aQPxkhO88fX4JWNnDnVCTuobkNxuBQWZrcK1ekbZ/uQmCkcQ==
X-Received: by 2002:a62:2aca:0:b029:1bb:4349:f889 with SMTP id
 q193-20020a622aca0000b02901bb4349f889mr8177532pfq.26.1611375151785; 
 Fri, 22 Jan 2021 20:12:31 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f15sm10628173pja.24.2021.01.22.20.12.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 20:12:30 -0800 (PST)
Date: Fri, 22 Jan 2021 20:12:30 -0800 (PST)
X-Google-Original-Date: Fri, 22 Jan 2021 20:12:28 PST (-0800)
Subject: Re: [PATCH v15 03/11] riscv/Kconfig: make direct map manipulation
 options depend on MMU
In-Reply-To: <20210120180612.1058-4-rppt@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rppt@kernel.org
Message-ID: <mhng-5cbc9b30-ac9a-4748-bf12-8f0de4c89f79@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_231234_350277_DCEF962C 
X-CRM114-Status: GOOD (  19.40  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, david@redhat.com, peterz@infradead.org,
 catalin.marinas@arm.com, dave.hansen@linux.intel.com, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, hpa@zytor.com, cl@linux.com, shuah@kernel.org,
 tglx@linutronix.de, elena.reshetova@intel.com, linux-arch@vger.kernel.org,
 tycho@tycho.ws, lkp@intel.com, linux-nvdimm@lists.01.org, will@kernel.org,
 x86@kernel.org, willy@infradead.org, rppt@linux.ibm.com, mingo@redhat.com,
 mtk.manpages@gmail.com, Arnd Bergmann <arnd@arndb.de>, jejb@linux.ibm.com,
 bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, kirill@shutemov.name,
 dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 shakeelb@google.com, akpm@linux-foundation.org, rick.p.edgecombe@intel.com,
 guro@fb.com, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 20 Jan 2021 10:06:04 PST (-0800), rppt@kernel.org wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> ARCH_HAS_SET_DIRECT_MAP and ARCH_HAS_SET_MEMORY configuration options have
> no meaning when CONFIG_MMU is disabled and there is no point to enable them
> for the nommu case.
>
> Add an explicit dependency on MMU for these options.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Reported-by: kernel test robot <lkp@intel.com>
> ---
>  arch/riscv/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d82303dcc6b6..d35ce19ab1fa 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -25,8 +25,8 @@ config RISCV
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_MMIOWB
>  	select ARCH_HAS_PTE_SPECIAL
> -	select ARCH_HAS_SET_DIRECT_MAP
> -	select ARCH_HAS_SET_MEMORY
> +	select ARCH_HAS_SET_DIRECT_MAP if MMU
> +	select ARCH_HAS_SET_MEMORY if MMU
>  	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>  	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

LMK if you want this to go in via the RISC-V tree, otherwise I'm going to
assume it's going in along with the rest of these.  FWIW I see these in other
architectures without the MMU guard.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
