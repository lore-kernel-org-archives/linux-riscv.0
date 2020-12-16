Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCF5C4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:03:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85D5323355
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 06:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85D5323355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OB/bUcY70ExHFWxIKt88ANlZup22V3rsHPBlth4zEEI=; b=JFHiw0TPC0COtieaqA/pJSbVR
	D2b9J0Xk2lRiG1uTjagPLZOVY5FYaQ+5O5KGyByaLs8dF4jBMUBAN3sRC/YJp9m++/Pi7D3NQs95z
	8txUGJe8SuAUkzvML10oEClYFZfHCyKR1TmkaXV5Ez+PtuGj59JYNc4hHQA5WhTt2pQbgRmAyqIpZ
	7ZYvOa+7pnNKvajQo6GP+8TGVJ8cSGslWR5yN/8Z3I726Yf+D0E4KF+5Qzyz0RM6T2RlyPvCYaYEG
	ojx9m1d74UfD/EnZvzUiqOjxp7sVf18FId5P0xL5g5TgLN295Tmg+hrOFDh43hHby0XJYcsYfnrLb
	SwtcLSPyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpPtu-0001nc-PZ; Wed, 16 Dec 2020 06:03:02 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpPtr-0001mB-8l
 for linux-riscv@lists.infradead.org; Wed, 16 Dec 2020 06:03:00 +0000
Received: by mail-pl1-x631.google.com with SMTP id g20so11498704plo.2
 for <linux-riscv@lists.infradead.org>; Tue, 15 Dec 2020 22:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=dEIBkjaz1JW9MJFloIUwr6rBoz6T3L6jcYcfmy6MbLM=;
 b=oVQ1b2fn/FCW5ZZKajet+Qvo0XQF1rCG/NqwLfjNEnb85YRdmWcKxi8ic9qVEPXJ5A
 TMz5sBBjUT/a81k3ilJG4mKQo6mehjER6tNTzKDWc2Y9pRUMNtEbSvhGZCOUCZZBCHMH
 uZ2Fh3kSClNlRZOXKMXrwX9ehbTaQrJzoEiQpmwg1/v9QH6ZdFo3ePdSFD/43gBAj6Yp
 utS3xpoV4Oer5Jt5eWnc8+ByVPEt1PjSZlzvtaTwGzpFz8nAp2lgZtXSHwgz0U2IPmjd
 6MxTkJXuv0AHXcZw3mGf3sfDQxkltgG5aj4936GM3TFU4rCJKlu2iaLvuB3iUys54pFC
 X6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=dEIBkjaz1JW9MJFloIUwr6rBoz6T3L6jcYcfmy6MbLM=;
 b=Y+Dd0a8SEPqRXxywzwxmNnY+wRt5SFE8W9Z7s18GeXvC3TsxWycfXguIWzuOalDGvC
 /PxOTB8w2/EKGOpRphLinHDMLwQ8cbujhz0bG+ALm/YbG87Pr84C+cEk1IrQ5l3FfOpw
 nxTOkShnLP/v5S9idPT/BLwXtBHlAo9C2J9aTkMq2Aq0ANFb3xjpsQCClOrdGiHKQ9/t
 DaMQTfVoKqvRY5ZHoGFz5UGHSlKbxb6uILp6ExQVA5+tz5lQSDDnzstPMxfGw++GC+Uz
 lHYKUTxWqvGrywS2jheXf2mJb5GlD+w52FTNufEPwaH+vhz7AG6eThWTICCBYzkGf4CE
 TjwA==
X-Gm-Message-State: AOAM530vGpxgIhXyACtpUwW611Heiy2UyrBa6YaEAvFxR3lxmokpN5UH
 n4oUSqUYk8xVJ9pi8uNjMTk5iQ==
X-Google-Smtp-Source: ABdhPJxKdwdNAxQUtCLfd/IMbi11HU9qicNckr4xevWaGtrPv5uwG19ZxWQCWZxhfsGVowD8JgfQkQ==
X-Received: by 2002:a17:90a:e60d:: with SMTP id
 j13mr1870046pjy.52.1608098575211; 
 Tue, 15 Dec 2020 22:02:55 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id v6sm953257pfi.31.2020.12.15.22.02.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 22:02:54 -0800 (PST)
Date: Tue, 15 Dec 2020 22:02:54 -0800 (PST)
X-Google-Original-Date: Tue, 15 Dec 2020 22:02:50 PST (-0800)
Subject: Re: [PATCH v3 3/5] RISC-V: Align the .init.text section
In-Reply-To: <20201105000439.1491243-4-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-5b9a6df7-f6a2-4db8-aaf9-b4e89115522d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_010259_427335_963ECE63 
X-CRM114-Status: GOOD (  25.24  )
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
Cc: aou@eecs.berkeley.edu, zong.li@sifive.com, anup@brainfault.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Atish Patra <Atish.Patra@wdc.com>, ren_guo@c-sky.com,
 Paul Walmsley <paul.walmsley@sifive.com>, ojeda@kernel.org,
 greentime.hu@sifive.com, akpm@linux-foundation.org, walken@google.com,
 ardb@kernel.org, rppt@kernel.org, Jim Wilson <jimw@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 04 Nov 2020 16:04:37 PST (-0800), Atish Patra wrote:
> In order to improve kernel text protection, we need separate .init.text/
> .init.data/.text in separate sections. However, RISC-V linker relaxation
> code is not aware of any alignment between sections. As a result, it may
> relax any RISCV_CALL relocations between sections to JAL without realizing
> that an inter section alignment may move the address farther. That may
> lead to a relocation truncated fit error. However, linker relaxation code
> is aware of the individual section alignments.
>
> The detailed discussion on this issue can be found here.
> https://github.com/riscv/riscv-gnu-toolchain/issues/738
>
> Keep the .init.text section aligned so that linker relaxation will take
> that as a hint while relaxing inter section calls.
> Here are the code size changes for each section because of this change.
>
> section         change in size (in bytes)
>   .head.text      +4
>   .text           +40
>   .init.text      +6530
>   .exit.text      +84
>
> The only significant increase in size happened for .init.text because
> all intra relocations also use 2MB alignment.
>
> Suggested-by: Jim Wilson <jimw@sifive.com>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/kernel/vmlinux.lds.S | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 3ffbd6cbdb86..cacd7898ba7f 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -30,7 +30,13 @@ SECTIONS
>  	. = ALIGN(PAGE_SIZE);
>
>  	__init_begin = .;
> -	INIT_TEXT_SECTION(PAGE_SIZE)
> +	__init_text_begin = .;
> +	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) ALIGN(SECTION_ALIGN) { \
> +		_sinittext = .;						\
> +		INIT_TEXT						\
> +		_einittext = .;						\
> +	}
> +
>  	. = ALIGN(8);
>  	__soc_early_init_table : {
>  		__soc_early_init_table_start = .;

Not sure what's going on here (or why I wasn't catching it earlier), but this
is breaking boot on one of my test configs.  I'm not getting any Linux boot
spew, so it's something fairly early.  I'm running defconfig with

    CONFIG_PREEMPT=y
    CONFIG_DEBUG_PREEMPT=y
    CONFIG_PROVE_LOCKING=y

It looks like that's been throwing a bunch of warnings for a while, but it did
at least used to boot.  No idea what PREEMPT would have to do with this, and
the other two don't generally trigger issues that early in boot (or at least,
trigger halts that early in boot).

There's a bunch of other stuff that depends on this that's on for-next so I
don't want to just drop it, but I also don't want to break something.  I'm just
running QEMU's virt board.

I'll take a look again tomorrow night, but if anyone has some time to look
that'd be great!


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
