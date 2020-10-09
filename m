Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B51C433DF
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 18:24:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26ADB222B9
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 18:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x2diKSKg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26ADB222B9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cDxxMuY76I6XPhxIaNTe9WBVjnOdQam66aK+3tV0rMk=; b=x2diKSKgdcp6aJXImBV32z/2n
	AYHXj4EYmSfPVmChjmO+/kSYEm5OwVGGUOVqBbB8+nqFnN2fjOE3iA9WgW/pH8b+r7I2ZG+ShmJh8
	Obuo/p1Kl/2OGX11RHbm5xt+SIyv1IETKDgefg3eRbwRw5jbrHviktKTv7xAdj/Xfuoa9Zaw2iDCZ
	o1kNmf3lGenCedW+uKFFjIMMIbiaNYIsna8FaGN5FfVBQvN5kucTz9ywRcdzy0SZKMej57ZDAJdN/
	GcVVl5qU0b4HydeN5id14/0JZYqFl0LEOBNL26OYfRTGtVm8iDSQq6LxNFsyjMTCfDlWux9M+JVag
	tzMZHZ51g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQx4N-00028R-C3; Fri, 09 Oct 2020 18:24:43 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQx4K-00027V-Az
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 18:24:41 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C7Ggl6dbdz1rsMq;
 Fri,  9 Oct 2020 20:24:35 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C7Ggl5Rsxz1qrDV;
 Fri,  9 Oct 2020 20:24:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2mbYlDZWbOcq; Fri,  9 Oct 2020 20:24:34 +0200 (CEST)
X-Auth-Info: LZoooTdPUM9XaQoDhU03clxRO+LEeX6w/lImTE/OmOPPBdMcRJILnzkfJa/RlVrk
Received: from igel.home (ppp-46-244-168-131.dynamic.mnet-online.de
 [46.244.168.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  9 Oct 2020 20:24:34 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
 id 17F1F2C2864; Fri,  9 Oct 2020 20:24:34 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Subject: Re: [PATCH v2 1/1] i2c: ocores: fix polling mode workaround on
 FU540-C000 SoC
References: <1602257980-375157-1-git-send-email-sagar.kadam@sifive.com>
 <1602257980-375157-2-git-send-email-sagar.kadam@sifive.com>
X-Yow: Dehydrated EGGS are STREWN across ROULETTE TABLES..
Date: Fri, 09 Oct 2020 20:24:34 +0200
In-Reply-To: <1602257980-375157-2-git-send-email-sagar.kadam@sifive.com>
 (Sagar Shrikant Kadam's message of "Fri, 9 Oct 2020 08:39:40 -0700")
Message-ID: <87pn5rp89p.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_142440_485583_63B1E217 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, linux-i2c@vger.kernel.org,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Okt 09 2020, Sagar Shrikant Kadam wrote:

> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index f5fc75b..9b3d1ab 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -686,17 +686,21 @@ static int ocores_i2c_probe(struct platform_device *pdev)
>  
>  	init_waitqueue_head(&i2c->wait);
>  
> +	/*
> +	 * Set OCORES_FLAG_BROKEN_IRQ to enable workaround for
> +	 * FU540-C000 SoC in polling mode.
> +	 * Since the SoC does have interrupt it's dt has the interrupt

Typo: its

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
