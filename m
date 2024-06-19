Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A34C27C79
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 16:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJUjW0+kMk5C4Xbbfj9oXDx78jVgwCsIg6WYMe39kHk=; b=2C+hPNUBm6/AKU99KV+FXv+Ipj
	PEj9e6c4/Tpf5+IZQLjLoVai6tB6WyCryDLQAkPx32/SAOCYsLOCS8HcNyhuRjkDE9q4LLJqBGAEw
	eOClh5tZZLivGoje4bNDIOUVudqLgotPxjZBfqDzJ0WvNklbXcr1f14Mma0I/LATMy/6jzeSaJacM
	Pv4nCSYxuXSQLMOWFOtsNi1tu1kRrySN5o/HwnGMYh0lpDrtjVgHG/almegyMH0SPeLZCvcatLG7O
	RhCUzdqEafFGvjatFQmDFWo7/DxC2JBfJBF7r9xefPoI1rKiKsQ/GvbQeTVuJjdGUYP07ei+0eAVI
	b7CxYpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyCU-000000022Gu-0Fd3;
	Wed, 19 Jun 2024 16:30:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJyCO-000000022Fo-3xS9
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 16:30:19 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-705b9a89e08so24115b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jun 2024 09:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718814613; x=1719419413; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LFnXBBCEP1zENhQqFr7hAM7gxfLMtKTQ/XL+1dQ5OE4=;
        b=ytZDnZO49WmiBxVK8mQdhfTN2E1cwJ+/kS4xZN/XOdB//+cjY+o6KiIFn/3YgxrCZq
         r9HEdMumBKOW/BxLXl2yi94wBCPj1vXE2L8pJs11liL+SJpKmdW150dMPvozeX5yyi9U
         xRuMuMY+V4ujSXkkqhRaPfuhxfdSUVyjt7fyKznf6+KlXrDghWv47ZqkZ4dACdQNLsGo
         PD625paeSjlSiBiOnXgCOrzabZzhjlOSMHzmH7giP/9UCWvLuDr7PmXmSXO3akjrog7f
         xoVREoEoNLf+G6o6VISNcIcY++5mDbyuxYFlowziZ2wDjvOO7eJbCkV3VAzojEqoFQ+6
         2v2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718814613; x=1719419413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LFnXBBCEP1zENhQqFr7hAM7gxfLMtKTQ/XL+1dQ5OE4=;
        b=qoZ2OlhMnH4y++/xgjDQ34Yz0OFaiIL9NRmI+eqdDCMjJoehFaRFfpO/BVvle8Gy1E
         Dl2MmOOf9POo1X2xS28F07yWu1XQWto4GCuDdmI5e7H7dwW3vkoF7lt9mHMOKi49CjIL
         930CzMK00BRetuKHsFZ6ZA6L5sQecNpW6Req/j4ml58QyLXefo0+aK/vZu9br2LieIVn
         Mwe1+DZFqh1NyMPPmrQ91/NmBoGJQaEsVF2+6DpgqsdjNZtXnCyDy8pQ+Bg5TkyJ0PPQ
         z3LeAU5g6qSKh2oTOhCpyUIY94pwGFnplky31/9kZwuZrrFuS8FgYmlrXGhXZ67Azqhf
         F6qw==
X-Forwarded-Encrypted: i=1; AJvYcCX6iEzGKcBuSJHTHdILo3CnRwQPH0V5HOIDU8WzhWvq2bY/NogmeLOEBX6kDLCgr2iVU4GINCQDc8J0RnstF622A9SS+F/Mdor3CjkJ/SJi
X-Gm-Message-State: AOJu0YxMYw/UszJMCp/E4dr8fPs8hitsNDwR5NTwfsN+9RXOXniZpvqZ
	NigkUjUamNoEMQ+m6nE+bGi1swUtfItsxMmJeaNdOj4w6OU7vvHLxTH5aA81U0w=
X-Google-Smtp-Source: AGHT+IHXKN8DL34VymsPnaJwN/SMjnVjtOibIBszp5LGFbCG2Rghjc6BQa/Sa/zE4+NekK/vXzWdfw==
X-Received: by 2002:a05:6a00:2d89:b0:6f8:f020:af02 with SMTP id d2e1a72fcca58-70629d01686mr3766318b3a.34.1718814612752;
        Wed, 19 Jun 2024 09:30:12 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7062cb0a402sm1665445b3a.33.2024.06.19.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 09:30:12 -0700 (PDT)
Date: Wed, 19 Jun 2024 09:30:10 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] riscv: convert bottom half of exception handling to C
Message-ID: <ZnMHku8LSGmuHZQS@debug.ba.rivosinc.com>
References: <20240616170553.2832-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240616170553.2832-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_093018_207593_419F2936 
X-CRM114-Status: GOOD (  17.52  )
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

On Mon, Jun 17, 2024 at 01:05:47AM +0800, Jisheng Zhang wrote:
>For readability, maintainability and future scalability, convert the
>bottom half of the exception handling to C.
>
>During the conversion, I found Anton fixed a performance issue
>and my patches will touch the same exception asm code, so I include
>Anton's patch for completeness. I also cooked a similar patch to avoid
>corrupting the RAS in ret_from_fork() per the inspiration.

nit: Probably corruption is wrong word here giving the notion that software
got some capability to corrupt uarch structures. It's simply mismatched # of
call and # of rets. Imbalance (instead of calling it corruption) in return
address stack (RAS) leading to incorret predictions on return.

>
>Mostly the assembly code is converted to C in a relatively
>straightforward manner.
>
>However, there are two modifications I need to mention:
>
>1. the CSR_CAUSE reg reading and saving is moved to the C code
>because we need the cause to dispatch the exception handling,
>if we keep the cause reading and saving, we either pass it to
>do_traps() via. 2nd param or get it from pt_regs which an extra
>memory load is needed, I don't like any of the two solutions becase
>the exception handling sits in hot code path, every instruction
>matters.
>
>2.To cope with SIFIVE_CIP_453 errata, it looks like we don't need
>alternative mechanism any more after the asm->c convertion. Just
>replace the excp_vect_table two entries.
>
>
>
>Anton Blanchard (1):
>  riscv: Improve exception and system call latency
>
>Jisheng Zhang (5):
>  riscv: avoid corrupting the RAS
>  riscv: convert bottom half of exception handling to C
>  riscv: errata: remove ALT_INSN_FAULT and ALT_PAGE_FAULT
>  riscv: errata: sifive: remove NOMMU handling
>  riscv: remove asmlinkage from updated functions
>
> arch/riscv/errata/sifive/errata.c         | 25 +++++++---
> arch/riscv/errata/sifive/errata_cip_453.S |  4 --
> arch/riscv/include/asm/asm-prototypes.h   |  7 +--
> arch/riscv/include/asm/errata_list.h      | 21 ++------
> arch/riscv/kernel/entry.S                 | 61 ++---------------------
> arch/riscv/kernel/stacktrace.c            |  4 +-
> arch/riscv/kernel/traps.c                 | 57 ++++++++++++++++++---
> 7 files changed, 81 insertions(+), 98 deletions(-)
>
>-- 
>2.43.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
