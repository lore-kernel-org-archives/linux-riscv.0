Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED157C433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 22:29:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 843596023B
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 22:29:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 843596023B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=OwaAoe47YI3wmggtb5Cf+fJaloTf6jlf/+4wAuCAFmU=; b=B28mjKRQUn3bjyZ3j6ubtbcXB
	2iQAxoeXsPSFGj7tCFqHFFi5QlaQDOrbqPgd/agmmfxxcNYF/xYV5eBfz4jvfhJ/mdjD9tjGQE3xg
	W8JqrPCxi/3iiaz8Rdw1AChtyuz7o66p3PNeOPIIvjbNn9BT81fkFYufRMKKj3QQQze5mEY/HQIhb
	6zEramesEj3hNxWJSPnyqWyhtEFBynbFIubt/cvpeTI0YvM53k7Etvzh9MzN/YnvD5T6hQBg3hB/c
	5tzsq0E9kmPpW5MS9tgMU7eSr6x81JViHQOrHLTwYLeXt7fMwwIsmpWef1LrMsbS1i1mfgaGJ2kx/
	YPC7iveow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lViZT-005E2L-DN; Sun, 11 Apr 2021 22:28:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lViZQ-005E28-6I
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 22:28:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=NL103HsN0FLtSC0bDkk0cKVEMZDZXWVDk3KCjvpyLsg=; b=HdbhQAMFRoJcgDjQKKyiolrahb
 bKSwNDONdTVkCmJAQpJS0ly5eup5/nfLOe5vPjEj136Qs8lpALvxCkHVf/MRU1txE+Vd8HqAXL/U6
 lGU/usGXgcMRfx6gnRCHxfwrSy8ehxhtpkU0o4gH6QJnP46kmHpc0AjL6IDAD2RHnwTTDXr1x+aEp
 DW1tM4mqfRervpz7impJP2Ss4qFVQvV3bsCbURz33gSNGqD++OvtUDpKla42jD1T1CRANA0Ozgp04
 lt2GSEpu9UBt4QJ38xTPpaVY70lul6oENBYlxQ0sEfkS3rfpPf65T5UGwaNJ/ZwHe640h4JvSCpru
 /ub2lYFA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lViZL-005ls9-OG
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 22:28:41 +0000
Received: by mail-pg1-x534.google.com with SMTP id t22so7932301pgu.0
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 15:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=NL103HsN0FLtSC0bDkk0cKVEMZDZXWVDk3KCjvpyLsg=;
 b=JRntyPFBVIaenW3MYt0SEjXz8mFFPhPnj1KcZs2ugZaRP5y8k+W1stlu/6fVvKvx3m
 WZbR/L/phUEhsex1JyC/00jlyufHtgnn51gPrCh81724AK/uuIYW3WlgoYXT9Dv0U5L6
 Y7Y2Q94KJA/fzaHWtE//AinMUjRweE2F55l079/XaLJT/L0oBtBY4e4SmWUktf8DD4U0
 EnmtwdmWsAk2e0/JfDqu62TB3toJRz0Z6Z4nyEya7AQiYjt4nykVqwkOFc9VryhXjpHa
 ad6txIJwmpSe3Z5CazDQzGOlsaVXPelugZxzu+xP5ngEgRvWnicbI1XUK+5V/+wnYwDU
 so4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=NL103HsN0FLtSC0bDkk0cKVEMZDZXWVDk3KCjvpyLsg=;
 b=VQGtqhAuCAeAuMtSj5hioEDp/djSctCnp/5mnxzp3gysGRfNp69F7cYbZa+27fUaaq
 YSRutPOXB+DIzj2n6RXP2P2PQcvVsh0UEkQdJLrnyU2qfr8GK0sZu0sLZWDrpKkqriSY
 /KxBbl5YdCulWheQ27WU+/TkdziLJs5lvRSYMdlMDhWSCnpQlRWEpMFyk5DP2hbE2UFz
 7YUqtRKb46z4kNaI/u4nBZ8eYEwSj77XQm4s4ayEYYvXj8mb0ajR+dNNaMFVNwPhxb0Q
 wHmBvRQsGpzJhmlNPVAb5Ln5baO3dKds8eoLUPcdtCbAADypGWzADGJqDzzRWyNeK5Wj
 BG+Q==
X-Gm-Message-State: AOAM532T28r4iHV2hLKV7gvf182LCbW4vNPZxhedbCp9EIb8Mku96WaS
 Qo+AzOH7s1qXV5UtU53yl/b9nw==
X-Google-Smtp-Source: ABdhPJwh75ar/j8paxM9YzIOWuxm/rCiYRHozOlQyZ1WOu9vu4T0wL6pxR+AUFRP+0FiIpZwfqa30Q==
X-Received: by 2002:a65:5849:: with SMTP id s9mr24542845pgr.309.1618180118609; 
 Sun, 11 Apr 2021 15:28:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y193sm8307600pfc.72.2021.04.11.15.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 15:28:38 -0700 (PDT)
Date: Sun, 11 Apr 2021 15:28:38 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 15:28:36 PDT (-0700)
Subject: Re: [PATCH] samples/kprobes: Add riscv support
In-Reply-To: <20210330020416.129505e6@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 corbet@lwn.net, mhiramat@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-8e3addbd-903d-43ee-b16b-e81919583271@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_152839_813630_5627575F 
X-CRM114-Status: GOOD (  15.29  )
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

On Mon, 29 Mar 2021 11:04:16 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Add riscv specific info dump in both handler_pre() and handler_post().
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  samples/kprobes/kprobe_example.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/samples/kprobes/kprobe_example.c b/samples/kprobes/kprobe_example.c
> index 331dcf151532..c495664c0a9b 100644
> --- a/samples/kprobes/kprobe_example.c
> +++ b/samples/kprobes/kprobe_example.c
> @@ -47,6 +47,10 @@ static int __kprobes handler_pre(struct kprobe *p, struct pt_regs *regs)
>  	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, cpsr = 0x%lx\n",
>  		p->symbol_name, p->addr, (long)regs->ARM_pc, (long)regs->ARM_cpsr);
>  #endif
> +#ifdef CONFIG_RISCV
> +	pr_info("<%s> pre_handler: p->addr = 0x%p, pc = 0x%lx, status = 0x%lx\n",
> +		p->symbol_name, p->addr, regs->epc, regs->status);
> +#endif
>  #ifdef CONFIG_S390
>  	pr_info("<%s> pre_handler: p->addr, 0x%p, ip = 0x%lx, flags = 0x%lx\n",
>  		p->symbol_name, p->addr, regs->psw.addr, regs->flags);
> @@ -80,6 +84,10 @@ static void __kprobes handler_post(struct kprobe *p, struct pt_regs *regs,
>  	pr_info("<%s> post_handler: p->addr = 0x%p, cpsr = 0x%lx\n",
>  		p->symbol_name, p->addr, (long)regs->ARM_cpsr);
>  #endif
> +#ifdef CONFIG_RISCV
> +	pr_info("<%s> post_handler: p->addr = 0x%p, status = 0x%lx\n",
> +		p->symbol_name, p->addr, regs->status);
> +#endif
>  #ifdef CONFIG_S390
>  	pr_info("<%s> pre_handler: p->addr, 0x%p, flags = 0x%lx\n",
>  		p->symbol_name, p->addr, regs->flags);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
