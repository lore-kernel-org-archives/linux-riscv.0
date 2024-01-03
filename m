Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D0DC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uyEKo+z2Zheuncq3UBQj8c4i+ZwI37xSgWPF1SArcW4=; b=pal8EkPD6W8hSo
	QFJzAODipWEdCPmQn6LqHBe4EAWdmZlpCGy6p5Ux6yErp/mL8xc0Z371bNiQOmdgDy0PrrLwu2YzJ
	uqp7cQhJGCym2+Vof8mhEnNICwT1+0Lzd7Q3zql2xdaSl1Z+fqOqb68MBNlW7qRz2fOnUKHhk7IEC
	Sm+QIa51lscXA8Hnx+96Mh+RTdx7QnLkVmAOjzejmhgvZnF1XVFY1LMYhMKen510a09frg4mAVZbj
	MQB2J7adw/BbidAfbBKiHWWed+4lpbEkDZJjbNK3iRDmg96LBbsaszfWsuIq9HvTqMxkliaM30M/f
	1Q1Z7wOHEhpQAHmEqy2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1E6-00Avls-1n;
	Wed, 03 Jan 2024 13:24:06 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1E3-00AvkW-2U
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:24:05 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55590da560dso4964394a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704288239; x=1704893039; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zjuqnf3N25kGg3bcromih2YZCCu3eUy4Efc6JFq8J5c=;
        b=nq4JjoEqTFaQXa12nwAevodTY50Ifx7o6ql4xBSLjYUNhEslC2EdxG+ctTTCgCFh5Q
         TH5+avQrQiDH5/RgiuOWfcHkWKxmjQgjl5Zk6sx+a+1c4XlEP3i3LZc9MhTk5kjOj85J
         bAZyHsw+Xo1siFlWPs18YNw2mQxW3DybB61VjS9bKU3FYnNcowOwp3o4z/Caups4Dmy1
         pNgF/mJ6GVoGO8C1jWw6xHklL6UGKOv+S9UgnI6C5EcezUC6o6cQatKWiaLyOiBi+0hO
         N4jYPVLvpXl0yqWt7DN1wxJ0lZ8gcZP0MmH1HbqEJXbrScBADSgaeRS9O6TqbTFQs3Er
         JllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288239; x=1704893039;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zjuqnf3N25kGg3bcromih2YZCCu3eUy4Efc6JFq8J5c=;
        b=c3FiAGmBBOxMraKRekNDxtehEfoiEo2pYZTwTh84SO6y8GKMd6hGz7B4wT5qusKDVP
         5+uWXVkPaUS2xsai5dv6hhw8TG3ufMXAOSvxAHWENpTgsZqInGjiHsz746YkWN7E4diU
         i8y3CjZP6UozNqY/nVbFGOzMZvU8IqbAvn+0HPy/rd6jKtSPvVg3m9fb2OgI4cOBJNIm
         HQKuqO3bLxNQMYAzXLRsqNVVRtz2h8bgBd8I5te7d7R8J98sVnVVEuSu4W/yJrVFUyJ9
         aPuT9lsDOLwAP/i4Eb053xUalcsGydKFPt414+a4lzLvjGJjEWQgZ0QH2dWykaQsWjih
         RVTw==
X-Gm-Message-State: AOJu0YwtsA3WkpR5aAArKgPPZwaRrGkdZnhxR7eslWavRUII9D7pnyXm
	cipqEEc91EefP+nizVrXI4bF23lqUPnwGw==
X-Google-Smtp-Source: AGHT+IEbQcreBN3xdQ6TIETVNWD8s+N1vzyORlQMntSC/NLww3pxm8hml18SNScFt7Id6m/nNTU4Fg==
X-Received: by 2002:a17:906:958:b0:a1d:3b3b:8d76 with SMTP id j24-20020a170906095800b00a1d3b3b8d76mr9478592ejd.27.1704288239203;
        Wed, 03 Jan 2024 05:23:59 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ez10-20020a1709070bca00b00a289a8839d9sm562357ejc.164.2024.01.03.05.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:23:58 -0800 (PST)
Date: Wed, 3 Jan 2024 14:23:57 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: hwprobe: Check for the reserved flags
Message-ID: <20240103-4665626eafc3c8ad049af13d@orel>
References: <20240103121220.26506-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240103121220.26506-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052403_810326_C13B3CED 
X-CRM114-Status: GOOD (  19.25  )
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

Hi Palmer,

On Wed, Jan 03, 2024 at 04:12:20AM -0800, Palmer Dabbelt wrote:
> This check got dropped when RISCV_HWPROBE_WHICH_CPUS was added, but
> we've still got a bunch of other reserved flags.  So check for them,
> just to make sure userspace doesn't get confused later.
> 
> Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")

I'm having trouble finding the tree/branch for this commit hash.

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/kernel/sys_hwprobe.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
> index ccf61b040536..10d72893b04f 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -347,6 +347,10 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
>  			    unsigned long __user *cpus_user,
>  			    unsigned int flags)
>  {
> +	/* The rest of the flags are still reserved. */
> +	if (flags & ~RISCV_HWPROBE_WICHH_CPUS)
                                   ^ WHICH


We shouldn't need this check since the way v3 of the series has
do_riscv_hwprobe() is

 static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
                           size_t pair_count, size_t cpusetsize,
                           unsigned long __user *cpus_user,
                           unsigned int flags)
 {
       if (flags & RISCV_HWPROBE_WHICH_CPUS)
               return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
                                       cpus_user, flags);

       return hwprobe_get_values(pairs, pair_count, cpusetsize,
                                 cpus_user, flags);
 }

And hwprobe_get_cpus() starts with this check

      if (flags != RISCV_HWPROBE_WHICH_CPUS)
               return -EINVAL;

And hwprobe_get_values() starts with the original check

      /* Check the reserved flags. */
      if (flags != 0)
              return -EINVAL;


IOW, we don't check flags at the top level, but each branch checks for its
flags and hwprobe_get_values() doesn't have any.

Thanks,
drew

> +		return -EINVAL;
> +
>  	if (flags & RISCV_HWPROBE_WHICH_CPUS)
>  		return hwprobe_get_cpus(pairs, pair_count, cpusetsize,
>  					cpus_user, flags);
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
