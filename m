Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2CFAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5373tr0YcUAoLN8yl3qQYBo2vq22nwfzrHWQFMtif0E=; b=ekpRRUXnMaMsDWtwnKVZcgogH2
	sqxv6ZaZ8/z6HOGEGZlrMmjDq49d2waDHmnhemvvfrPDlsa4R+VwknKfK0TuLsLo4ImswBIYs0pM+
	Yce2Pl5oZNzjDdqGRfukGCmpMNlsIgUG2hnkM+LqyA/ukYktbk4cgmRCvt9NoPOLh8fWUqeG7WMPY
	DLK5MGu/npuniI9qutN/QJmVu1yZvK57LdYST8n3F5HQPt+cKTQYP29LXvaerlxqgaTNLaUG059Tv
	WxxwtlFfC/f5C4XVYNL3FgIhacKWt3ZxQWxtSfQ9geR1uJjA5+ZsZ3oOGIMm4hbDTli5Bpn/c40zU
	AxFyprgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAccB-00Csod-Vv; Thu, 20 Jan 2022 18:56:56 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAcc9-00Csnt-CG
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:56:54 +0000
Received: by mail-pg1-x534.google.com with SMTP id p125so6073990pga.2
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BLjtA7Aums/ilXFg+4gjh+nfchSZIUu6a21JuAeXehM=;
 b=1r7ggSjoyjiEd0AgERULWPQKaqUaILvMLutii1XqZIybZBPD173WhgtoRWQ5dB7bxJ
 pdVZtqJWOHBYqyrmwsfefuhQ0coEepqdXHfu5zQnB1VpbSCOR1LRNmkFnW5/HiUW0oNA
 eojnyHhq6AsFTvbWG5Tk+6coYuGPWIFa7meblIfUBMhjKSqMGNcLYn9om51xCcBiS6c0
 3cu03oNy8YmWTky1JwuR3D+7cVMIEQByfN8SqvEhSujckzxsJkA2sdRD0v21DkdVjQRm
 ShzllnfXIy3Zx6gHc/PdNmLTHn5/X/Y+TqvnszOEq/+BTRfVrvKTxzTRA8YEMlAGjlEz
 6Y+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BLjtA7Aums/ilXFg+4gjh+nfchSZIUu6a21JuAeXehM=;
 b=Lr1L//r0ER2U6P4WkPPlScq1Xkga2nXOm2h8p6fH63apW+mrh5J214SR0QYYJBMEaB
 7WsdSE6jCbSiiYv8P08VhlF5gmKe2H1T3uBdxSrhST9EI8DfWNXRODax1b7kpfRAh/WD
 shISUn2AZR3M3JJf4SMUCaclnnM8Enhhp7asajS6v2ALhBag7C+elt4ZNbXx2oqCMxHw
 NT0aUy7FI+kSQ7sS65jvd7OyDSyYxSEQ6aTpvwxhP0fii3Ey+puULWtXklSA2HyNFXJ2
 oxsvHMldjYZTborT0ROjDGVMoPvVG9+dBP8KUIY5E0mFE+DjxBfdoTXvvAQLtXG0G8hj
 lZ5A==
X-Gm-Message-State: AOAM532wot3OLMXRs/OLEA6H2f98Up2Sahv5Y2Zh7H3k4AT5j12Fq38I
 61udGAhUaNsntv9JObvXPtuFlw==
X-Google-Smtp-Source: ABdhPJxdE/w6f1aJwRVw74resTa1XXc33k37AYF3EbNOLlPLmRzeKe7qDQ0i6GxH8YBBPkP+X3A5HQ==
X-Received: by 2002:a63:610b:: with SMTP id v11mr111312pgb.183.1642705011241; 
 Thu, 20 Jan 2022 10:56:51 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id v17sm4231250pfu.220.2022.01.20.10.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:56:50 -0800 (PST)
Date: Thu, 20 Jan 2022 10:56:50 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:56:08 PST (-0800)
Subject: Re: [PATCH] arch/riscv/kernel: remove redundant err variable
In-Reply-To: <20220112082729.667743-1-chi.minghao@zte.com.cn>
CC: oleg@redhat.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 chi.minghao@zte.com.cn, zealci@zte.com.cn, cgel.zte@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: cgel.zte@gmail.com
Message-ID: <mhng-c795fe10-28e3-4762-92ae-0b8a99b58f96@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_105653_445577_456BE19E 
X-CRM114-Status: GOOD (  16.42  )
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

On Wed, 12 Jan 2022 00:27:29 PST (-0800), cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Return value from user_regset_copyin() directly instead
> of taking this in another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
> ---
>  arch/riscv/kernel/ptrace.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 9c0511119bad..a89243730153 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -42,12 +42,10 @@ static int riscv_gpr_set(struct task_struct *target,
>  			 unsigned int pos, unsigned int count,
>  			 const void *kbuf, const void __user *ubuf)
>  {
> -	int ret;
>  	struct pt_regs *regs;
>
>  	regs = task_pt_regs(target);
> -	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, regs, 0, -1);
> -	return ret;
> +	return user_regset_copyin(&pos, &count, &kbuf, &ubuf, regs, 0, -1);
>  }
>
>  #ifdef CONFIG_FPU

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
