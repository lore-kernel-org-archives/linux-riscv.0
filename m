Return-Path: <SRS0=mTxS=FP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DE0C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:43:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBBAD2312C
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Dec 2020 01:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBBAD2312C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ZXHpbdIKnrGdJ4rVSfdovSUF/mBZRzAy0UgFyNSbK2g=; b=tiKeIPKvjRCmxzZXiVKQ/DJlB
	noz4BofP9IImsz+Kjb6nNUfWAvVeeR8yrN0o87+BTm7IJ2u5WniXH0TIMsNC1XHhGndW1JF0wwedF
	Qkz4t0z/bzvzF9ftCpbnJYJHZkrENKdK8fiH8mF8qgsLc5bqu+t16Mpz4PH810ffN5qiNrL7BOwBz
	RKrGezI9J4987iqUUaat9006hy9jQU6OnyR4IMRqX34X37fW2u4FR+7520gGDC4hlRPzZXpVfs4AS
	JSNotAvw+kvIGQQwuCR4vl8jM693kl+1tVXojQgC6T/t0PySUVty0ipSgW1oh/XAMkiO9zNDfEKZ5
	NaIPiqQDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knXTJ-0002uS-HU; Fri, 11 Dec 2020 01:43:49 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knXTF-0002tD-Vb
 for linux-riscv@lists.infradead.org; Fri, 11 Dec 2020 01:43:46 +0000
Received: by mail-pg1-x544.google.com with SMTP id f17so6063845pge.6
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 17:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=o4IO9x5aEMAZkJsJ8UcOzO1BYQWTgRN9yYy1EDB9wVE=;
 b=jrsMsJGnCkHq40AaAwZQoBsb76eJzvdy+Ov+GMBJr1OjpkhHiI32W1id4TXubdcxQb
 6IqHydCYezugiYO1b06GID82LAQoE85XYjUXEIo19sZrly4sIZqg4DlubBBc+lFAiqQg
 WWFPwR1S1ChmCRzkPC2N4h91MqweoJ2ZJl91N1pTG2iPy0bhZBGXIbUt1EbErHI0yz4P
 ugeiYUFGEsZnC0BWiqdgmuR5sCHWBw7kAu3Kz2HjjOCV5CUQFZwlAGLNJo//m8ncAbhd
 WL8K7rYQQR1P4ayGVqXb9n5+updU1NQUTUNb3Vaz6ron3R+sTLIGiWh2CkqR9K1CVytN
 nu1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=o4IO9x5aEMAZkJsJ8UcOzO1BYQWTgRN9yYy1EDB9wVE=;
 b=GCMG5WHrbj8WXzt6Fb+EtrvZU9MSqZSdSatz96PxASTXfEcD3ooynZiuFJZ9uaYpzl
 QjsGjvnLoGEL+KLJBrClv0SUO7iWSyCiGQIJxO6jSyQFm+HMZRW6vqHvljv/dzd1osKY
 haonoChODvWctZPdT7aIAKivqK/zKercG3GRfJBNLB8qipMCX35Od9MqDz4F0cBnVYnA
 SkHrq7+w8DjUrbTr0BmwC0VUmtH/7v5JLVGMWTDZTqWqS6o3JKRcbyzOsrnEJSZaEwQ0
 wVNgHlAcEXMxOLEgMlLWFM9wqD3S/8QmxMox8+coZeKm78boq2Lk7alOccngehlzH+L3
 MV5w==
X-Gm-Message-State: AOAM533UwyfqaKAOqXsJlKXPTrBbHstjcqlUL0GUtJQVfbSdZfV6fyJm
 UJTR/As8wjMskZ/vDiU7aR1ly+GSw3PnEgOx
X-Google-Smtp-Source: ABdhPJwD1RYPyFMu5Hiyg/+NWIZoyGHbeSJzysO2I5afZck1DDhHH566ivRitSSkDre91/oAcgmsIA==
X-Received: by 2002:a65:4d48:: with SMTP id j8mr613713pgt.392.1607651022288;
 Thu, 10 Dec 2020 17:43:42 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gp14sm8032183pjb.6.2020.12.10.17.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 17:43:41 -0800 (PST)
Date: Thu, 10 Dec 2020 17:43:41 -0800 (PST)
X-Google-Original-Date: Thu, 10 Dec 2020 17:38:44 PST (-0800)
Subject: Re: [PATCH v2] riscv: Using printk directly in __show_regs
In-Reply-To: <20201126133338.125608-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-749d2791-936b-493d-9b8b-89dfea7ec9da@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_204346_095234_C0A1A6C7 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 wangkefeng.wang@huawei.com, john.ogness@linutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 26 Nov 2020 05:33:38 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Covert bulk of pr_cont("...\n") to separate printk calls.
>
> Note that a pr_cont() message with a trailing newline will
> "terminate" the continous line so that it can no longer be
> continued, also it is possible to sort out simultaneous dumps
> from multiple CPUs with CONFIG_PRINTK_CALLER enabled.
>
> And align the printing formats.
>
> Suggested-by: John Ogness <john.ogness@linutronix.de>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/kernel/process.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index e41b733abeaa..2119d49feea5 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -44,30 +44,30 @@ void __show_regs(struct pt_regs *regs)
>  {
>  	show_regs_print_info(KERN_DEFAULT);
>
> -	pr_cont("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
> +	printk("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
>  		regs->epc, regs->ra, regs->sp);
> -	pr_cont(" gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
> +	printk("gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
>  		regs->gp, regs->tp, regs->t0);
> -	pr_cont(" t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
> +	printk("t1 : " REG_FMT " t2 : " REG_FMT " s0 : " REG_FMT "\n",
>  		regs->t1, regs->t2, regs->s0);
> -	pr_cont(" s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
> +	printk("s1 : " REG_FMT " a0 : " REG_FMT " a1 : " REG_FMT "\n",
>  		regs->s1, regs->a0, regs->a1);
> -	pr_cont(" a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
> +	printk("a2 : " REG_FMT " a3 : " REG_FMT " a4 : " REG_FMT "\n",
>  		regs->a2, regs->a3, regs->a4);
> -	pr_cont(" a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
> +	printk("a5 : " REG_FMT " a6 : " REG_FMT " a7 : " REG_FMT "\n",
>  		regs->a5, regs->a6, regs->a7);
> -	pr_cont(" s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
> +	printk("s2 : " REG_FMT " s3 : " REG_FMT " s4 : " REG_FMT "\n",
>  		regs->s2, regs->s3, regs->s4);
> -	pr_cont(" s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
> +	printk("s5 : " REG_FMT " s6 : " REG_FMT " s7 : " REG_FMT "\n",
>  		regs->s5, regs->s6, regs->s7);
> -	pr_cont(" s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
> +	printk("s8 : " REG_FMT " s9 : " REG_FMT " s10: " REG_FMT "\n",
>  		regs->s8, regs->s9, regs->s10);
> -	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
> +	printk("s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
>  		regs->s11, regs->t3, regs->t4);
> -	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
> +	printk("t5 : " REG_FMT " t6 : " REG_FMT "\n",
>  		regs->t5, regs->t6);
>
> -	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
> +	printk("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
>  		regs->status, regs->badaddr, regs->cause);
>  }
>  void show_regs(struct pt_regs *regs)

For some reason I remember having these as printk()s originally, but I don't
see that in the git history so maybe it was from before we merged the port?  I
don't really understand the difference here, and I thought using printk()
directly wasn't recommended?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
