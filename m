Return-Path: <SRS0=MB+m=T5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F04C28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 21:13:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD10A241E5
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 29 May 2019 21:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VmGlDJi+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WOw27bn7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD10A241E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0+AZB5rfmIMPgLYc5O3RwYIitax5KbdPtfcCZs0eAt8=; b=VmGlDJi+5VUquBf4OjKNFIckG
	rS5pNQiAnHvK8HqZp/H94NkJGZLcwORJ8gkOT4R7KyOEaHLhAbXKS/aoxeqAEW7KQMATRBTGrHxfI
	9q/qIUyL0ZIwNDhl8BMqfaiWeMixrO2VPNDNyVb+MtdOB9s3OtJxbCgU8uCZgoxGb1G1n4d3yHWXC
	eM+FP3pui18KW46akCsC8zdQUYU4v9Nap65Fh5Zy//I9ZatcH1yh8vRlLTtRybcgNtvs0qahS1inE
	DcDRaaG9xhxszlQYef34PHP5qBahQrvd7V6w5xWhmDKX/CTtapmo1mQKwPJG7JLoccdlaefgCwHjQ
	8znM+2eWA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hW5tH-0005L4-Dp; Wed, 29 May 2019 21:13:43 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hW5tF-0005Kl-Bw
 for linux-riscv@lists.infradead.org; Wed, 29 May 2019 21:13:42 +0000
Received: by mail-pf1-x444.google.com with SMTP id c14so25764pfi.1
 for <linux-riscv@lists.infradead.org>; Wed, 29 May 2019 14:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yJDufFVaadbUIFo6v/4NICdBNGJUg295kYHaJwHNbPY=;
 b=WOw27bn7XkkeABJ6tllWV/bW6WfJM1kc79id79fe1ZoYKB6F/bUtc5CzYQ5z6utKSh
 oM1lPyHTVh5Ac5A2JRGkmIg6SDiutiGiGJ2xacrWg0t1CSncukyH11jkQ01wcAuhmRzJ
 V2wQWMrR2Xw4LKAL9wipD6/yWiS4noFdp7u4aRE3VlbxMzKXWnIOQjwlqlI8andTW/tY
 CGyOn4U4viXTmfLLFnVJw9bj0zM3M1rRcP931+5C9Vi8KCJzwZby8I9jm2yW2/PWxMmV
 3R9v2/xo9dr61LkKSQZ0U/4lHSvwKmsJa5pBqPOPS9IP+FTu8O9OB04yr1fbQyHTYbSD
 s9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yJDufFVaadbUIFo6v/4NICdBNGJUg295kYHaJwHNbPY=;
 b=cNhbN+8dXd49SufIDi38EpBUDkA/RDoSuT/HEalJL2oNEcwsf8I6tuS09bc57hhwzQ
 rsPip4TDcJiIK/qtHEuT1itjaeKfGGNagMCqAo7a0zj+HFg/zIJd5x6AVNZnBVCpb0cR
 Krfqigpo86NfHHUzJQtK8V9u33tbO0A1l63lC/fHtacOC5BsB8h+nJpbU7PSUTxRhqX2
 NQkgWEGaQT/kZm9qa8wMkN8L655kgkeE2zZlDOvLjz/AFiEM1/m5PTXx/+9Fi83gC4CU
 i9Mnux1SJyopWVGwAA7nsQbkjd0bx7fFum34BNAk1ePpVqu4NxTuhl7zvhOphM+OdX3/
 6Qhw==
X-Gm-Message-State: APjAAAVPF57Oqyb0LTjJoMOlygHUgjrW76xskSH/P7nns53gzRupgM6i
 NaKkBSd5INZff/q1ajUbyjCAvdSLNAUhqQ==
X-Google-Smtp-Source: APXvYqyJFl8ZYuYKbgaQftp7b7t/zHBTknO8/x97UD+tBfa1FwOfAx4tt5Gt9KBA/BMLWEqGTHfMBg==
X-Received: by 2002:a62:6444:: with SMTP id
 y65mr153238597pfb.148.1559164419256; 
 Wed, 29 May 2019 14:13:39 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j11sm614047pfe.46.2019.05.29.14.13.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 May 2019 14:13:37 -0700 (PDT)
Date: Wed, 29 May 2019 14:13:37 -0700 (PDT)
X-Google-Original-Date: Wed, 29 May 2019 14:03:49 PDT (-0700)
Subject: Re: [PATCH] riscv: remove free_initrd_mem
In-Reply-To: <20190520063326.26083-1-hch@lst.de>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@lst.de>, Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-37ed4bee-df0a-4dc3-adbb-a6bf98952241@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190529_141341_464379_C7C00F60 
X-CRM114-Status: GOOD (  14.87  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 19 May 2019 23:33:26 PDT (-0700), Christoph Hellwig wrote:
> The RISC-V free_initrd_mem is identical to the default one, except
> that it doesn't poison the freed memory.  Remove it so that the
> default implementations gets used instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/riscv/mm/init.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 8bf6f9c2d48c..b2341979d3eb 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -92,11 +92,6 @@ static void __init setup_initrd(void)
>  	initrd_start = 0;
>  	initrd_end = 0;
>  }
> -
> -void __init free_initrd_mem(unsigned long start, unsigned long end)
> -{
> -	free_reserved_area((void *)start, (void *)end, -1, "initrd");
> -}
>  #endif /* CONFIG_BLK_DEV_INITRD */
>
>  void __init setup_bootmem(void)

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
