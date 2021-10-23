Return-Path: <SRS0=+XCi=PL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 191A6C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:30:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0BBF60F5D
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Oct 2021 20:30:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0BBF60F5D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:CC:Mime-Version:Message-ID:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=PziGX8MaJFim1+swk6KAQxXN0KyDAYLIPZ9Jzy9eqVo=; b=oMp6mBVto+D891DresDg9x7YH9
	1T7qwjBih2/nuV8lZ3yLjymsnn6t7VQcA+1521WbZM8ZwB2XyJDz8fcBT+UcuaHSW5flULQr20e5y
	1H/cJQv5Ev7H9+7gqvWKDNd4ibkqpwPgXI5bf8cCoFMDzMGfpY/ZCiszq2VcScCpz7s+FWC3rZgtL
	NaggEXakXu/DnrVsDvobxWl6/gfrofPUtaYleoMbw/DDzQBhrELkEKw7jxzpyH/aJAAeg5YUwPj6P
	/DTlbXtgCry2yevLTKX3o5C/r+k8evc/UkeLCQJFm019bN0A0G2ZN7nPVVksNcWiLPU154wjqLelK
	I89aohSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meNeZ-00DGHL-C4; Sat, 23 Oct 2021 20:30:07 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meNeW-00DGGL-Uq
 for linux-riscv@lists.infradead.org; Sat, 23 Oct 2021 20:30:06 +0000
Received: by mail-pl1-x62c.google.com with SMTP id f4so2416025plt.3
 for <linux-riscv@lists.infradead.org>; Sat, 23 Oct 2021 13:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=u8fb+wH2NugqB0P0dy0KwRekwdYMOc1cKowuVaNB8zU=;
 b=BYzi+ijedWYHIbvvonMnqO6xMeE600lzFCc1izpDmST8aT3E+1hLvZ9JPMLhSHjGLm
 UbrJpn+tPQYlDAj9grHsXlAu1Z+Vbp6rfrW/wVtpJEsvGR3YPi4RJMLIocne1DV0yazD
 FLtKiJGo1dOj6Dy62rH3HiK+ggp3RMeJP8CqXiS+sketcokQ0KPLvkbT3o4G+2x6Dce2
 Tlu2nOXva7mQ6H3YlrFuCwwMh8bTclIT/Dk9KZBBwE2uBZqkGzoksVBd2n69sy5wHnu8
 UtW8VjlIvr+olpt2mBO/fMAyLySuubKrxuZnHYW51pvStOtbbSqGC3kqkfbht11XMpaR
 zxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=u8fb+wH2NugqB0P0dy0KwRekwdYMOc1cKowuVaNB8zU=;
 b=Rjt0tMOrP1/Cy6uwywcdFSRF4t5XHc/Qbx41plI0+MXC4I1LPQALZRiRzMBqZ05PCi
 kaHivRRcxxyGFw+oMItk9oZa6Wz09FHmO1OdPXVq2Rf4X7lxuxbIms7vT/fFWq5De3TA
 rK95IjUbbkNV7UxC0Zq07e2NQzno6H/LDTRHYzO+shY/+73I5mX3VUnloL/ASU5fpkKo
 rMGF0rG5pdZZI0i46ImyDdsyLWUV3NRBqeFVEhr3QENUFxjOXVdVVfqCV8MtgFl+VEid
 PlMW30Xryz23pfgKfYLDRVt31uNxUJYku3VwwPXqAffMS9ltc2qzzsyi+JT/PUEP6dH5
 xtPg==
X-Gm-Message-State: AOAM530ZM1iQ9TPfz3UdG4FAvq+BrF2WpXz4/AJnEFLbVtUxNa8cTY7e
 EEgjaWa8JnqvsVRbamRvjyFraw==
X-Google-Smtp-Source: ABdhPJyqTSjW0oaeNA/j9VV5Rk31/sFw4dzBMlR9+7/U0TrUbIhO5h4Hg+7BUC2wxRJ6NBAmLjM2ug==
X-Received: by 2002:a17:902:6b4a:b0:13f:8e99:2149 with SMTP id
 g10-20020a1709026b4a00b0013f8e992149mr7692407plt.87.1635021003104; 
 Sat, 23 Oct 2021 13:30:03 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w11sm12276589pge.48.2021.10.23.13.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 13:30:02 -0700 (PDT)
Date: Sat, 23 Oct 2021 13:30:02 -0700 (PDT)
X-Google-Original-Date: Sat, 23 Oct 2021 13:29:35 PDT (-0700)
Subject: Re: [PATCH] riscv: cacheinfo: fix typo of homogenous
In-Reply-To: <20211008205628.3073014-1-georgedanielmangum@gmail.com>
Message-ID: <mhng-51275835-4c34-4099-85f5-13c6dbef4e19@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
CC: georgedanielmangum@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Atish Patra <Atish.Patra@wdc.com>, peterz@infradead.org,
 wangkefeng.wang@huawei.com, will@kernel.org, tglx@linutronix.de,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: georgedanielmangum@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_133005_020712_4E0987CB 
X-CRM114-Status: GOOD (  17.73  )
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

On Fri, 08 Oct 2021 13:56:25 PDT (-0700), georgedanielmangum@gmail.com wrote:
> Updates 'homonogenous' to 'homogenous' in comment.

I don't really know spelling that well, but checkpatch says

    WARNING: 'homogenous' may be misspelled - perhaps 'homogeneous'?

when applying this.  It looks like they're both words, but "homogeneous" 
is the right one?

>
> Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
> ---
>  arch/riscv/kernel/cacheinfo.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index 90deabfe63ea..ff98546b1152 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -29,7 +29,7 @@ static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
>  	/*
>  	 * Using raw_smp_processor_id() elides a preemptability check, but this
>  	 * is really indicative of a larger problem: the cacheinfo UABI assumes
> -	 * that cores have a homonogenous view of the cache hierarchy.  That
> +	 * that cores have a homogenous view of the cache hierarchy.  That
>  	 * happens to be the case for the current set of RISC-V systems, but
>  	 * likely won't be true in general.  Since there's no way to provide
>  	 * correct information for these systems via the current UABI we're

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
