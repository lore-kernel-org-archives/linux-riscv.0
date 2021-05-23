Return-Path: <SRS0=jEvo=KT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A31C04FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 22:03:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 639D261404
	for <linux-riscv@archiver.kernel.org>; Mon, 24 May 2021 22:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 639D261404
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=oz90gDMATGNUV03YP1BlyUwUajZD/NYfNcebb3VeN+k=; b=TnXxqnFhoBGDj6Y+Mtn1Dx+Hv
	aQK6GF08QIEjTDJ5lf/oesQM8KjXG012AggeFYDuGh+i6V/vQEW3ER80bZuD6qT0Km6kYCXP1jEmf
	Ev/xJP4ZAJeF30qbfnMX+W2HMBps3KeErs6S+xTyLJU9d43NLiW89MPTVs3030UTCXZP6IYgvMsHx
	TSlIbU4BdkklW9VbLvTHDuNCgMdSYrdqXblvPG3oKB8W2T96Owy0vxstAuD9IiF3j37Yl82Qu0f0G
	i1NHLA+tjlj4usvMIsyQiQzhvFV9KJnMf2LcHcD6KhPprQWgeuamAhVrVg4Oo4urrS5YvmZiMYQb2
	8AA7uCZ0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llIfb-0022UJ-3V; Mon, 24 May 2021 22:03:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkxCa-000bZY-0R
 for linux-riscv@lists.infradead.org; Sun, 23 May 2021 23:08:09 +0000
Received: by mail-pl1-x62c.google.com with SMTP id s20so13673791plr.13
 for <linux-riscv@lists.infradead.org>; Sun, 23 May 2021 16:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=+ek5JEdHmZfkP/iL93ubgamlrQWOFJ7iqzsCNIoDld4=;
 b=b9rYqVvZrGPUtTOmdzx2IYQW08HBtjmdCS12+f1Fa2htEzrqT+7AehgNAje45RL48G
 dTHzRq+r3cLExx3DCx5N+OtXCdGZ/IuFovUOOb81bAfd+lbV5DnlrHubooqc3+zM2VRG
 nuEaVWyGYyGzcd7AxQAOradiTI4qXmSLG3m1AP6BaxkoLCzS/ruCf9QCop650p4aUmIt
 0gbZDbx+S2Zc1Pe6A1i1Gai/sESyWF9IT8de5MR0cK8rrvm7W94H5b2HOsqIKLj/sVV/
 cbipPf0tWdXDDlg9OxeDrAZnCNxp5Hxgi32qDiqJjnFv9HFTEz2xjythOtn9ZVQcSB8h
 y7+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=+ek5JEdHmZfkP/iL93ubgamlrQWOFJ7iqzsCNIoDld4=;
 b=rtKgdos8aLXcaD9c5fkmt4CQkWHK4YcLgdR+/sLcdDhW73kYJPBY6o9sl31FsKs/H5
 KJwLG4Js6pb1xJuA1bLc9IAI5GKptlmpnujF3CSKsjpskQg0J8H4yjHJ01vMnEsg7PfO
 DxwHtTZRD/4o9IL2P0N5cX3mtQh/59ieEG8HaxskTgc/GDn+Zo7gKmAm5FSebwZqo8Vq
 SPB17/u9ziWDp1TM2bpQCWqrAcFqi0CL5xOH1xrrUOBt9ENN9l+Hzf3nCZS9/GSqq7+y
 S/un1r99aO3NQks4GuNhgDtt7RV30qoVjjYtsoOpem2fCkJoqZc4hVVJRVeKzOKp1vvt
 l3JQ==
X-Gm-Message-State: AOAM530q4PdDzOWgshIX0GaiIp7mOk9etQLtZ+xD6Mm+3+WKy+KfGHdv
 4X+5izaeF6k+WhJhlvx4wTACSD8SkkWiwg==
X-Google-Smtp-Source: ABdhPJzU84TojgMs4/tvrGXL40QGrZ9ZKodrHTQcbvB2S/M2El5YjfZmKO+Xg4uIMMSNIwRE66LT9g==
X-Received: by 2002:a17:90b:2397:: with SMTP id
 mr23mr21022021pjb.77.1621811280115; 
 Sun, 23 May 2021 16:08:00 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w206sm9174945pfc.61.2021.05.23.16.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 16:07:59 -0700 (PDT)
Date: Sun, 23 May 2021 16:07:59 -0700 (PDT)
X-Google-Original-Date: Sun, 23 May 2021 16:07:52 PDT (-0700)
Subject: Re: [PATCH v2] riscv: mm: Drop redundant _sdata and _edata declaration
In-Reply-To: <20210514094908.42809-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, anshuman.khandual@arm.com,
 wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-a8cabed1-0c17-4c28-bce4-798ecf3747fa@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_160808_071365_9D7462A4 
X-CRM114-Status: GOOD (  16.29  )
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

On Fri, 14 May 2021 02:49:08 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> The _sdata/_edata is already in sections.h, drop redundant
> declaration.
>
> Also move _xiprom/_exiprom declarations at the beginning of
> the file, cleanup one CONFIG_XIP_KERNEL.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/mm/init.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4faf8bd157ea..3396e9f1b8e8 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -33,6 +33,7 @@ unsigned long kernel_virt_addr = KERNEL_LINK_ADDR;
>  EXPORT_SYMBOL(kernel_virt_addr);
>  #ifdef CONFIG_XIP_KERNEL
>  #define kernel_virt_addr       (*((unsigned long *)XIP_FIXUP(&kernel_virt_addr)))
> +extern char _xiprom[], _exiprom[];
>  #endif
>
>  unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
> @@ -176,13 +177,6 @@ void __init setup_bootmem(void)
>  	memblock_allow_resize();
>  }
>
> -#ifdef CONFIG_XIP_KERNEL
> -
> -extern char _xiprom[], _exiprom[];
> -extern char _sdata[], _edata[];
> -
> -#endif /* CONFIG_XIP_KERNEL */
> -
>  #ifdef CONFIG_MMU
>  static struct pt_alloc_ops _pt_ops __ro_after_init;

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
