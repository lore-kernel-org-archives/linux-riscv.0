Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197C9C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=au6TfiH7vHXhbMHqMhcGReR4Xc9ZPT5+OvzzoaiIbpk=; b=NxFKztfeRPfqPm
	E6CHam5Gf1/NmLaMT+KE0cz6fuKWPiXf2i2yEiamvtESk07ZS0wu3Lm7ebXM/bEJ0LQ3MvrJtk3QA
	5+8scnuCQ+x1BeVVHGWi8zBWyjjzXZb2FStweVLOld9pK334c+qI86VweKG/AA3M2YyFSjSkiuCem
	btZSdIPGSiXZI+egBMmj4PDOZDZdMygvzERSp1uGkBYKnXZiOj+YpQQLMfxYNdtdFUejRGRt1R0vo
	KrVlPaibEKVGvkW7WWAkKZJbULshAYyDsH3w0kxDpUbKWG4+ZXsN3kvsuX3KHX1ajmrSgqPd44PTD
	zweuVyWo1FKMxNK9yqbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpci-002NFJ-5Z; Fri, 22 Jul 2022 10:11:08 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEpcf-002N7O-9u
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 10:11:07 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Lq4vg2j6Kz1r0nJ;
	Fri, 22 Jul 2022 12:10:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 4Lq4vf4FwVz1qqkp;
	Fri, 22 Jul 2022 12:10:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id rbkTNUbe7Ccr; Fri, 22 Jul 2022 12:10:53 +0200 (CEST)
X-Auth-Info: 5V4d3Fnr8BDMPb3jkQu0EDJRSLyYFrjOv2Xdf5FYdjjFzWdHQsnOnSqJzPDYV4V9
Received: from igel.home (ppp-46-244-169-212.dynamic.mnet-online.de [46.244.169.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 22 Jul 2022 12:10:53 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 6F9AD2C3A72; Fri, 22 Jul 2022 12:10:52 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: paul.walmsley@sifive.com,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  anup@brainfault.org,  heiko@sntech.de,  guoren@kernel.org,
  mick@ics.forth.gr,  alexandre.ghiti@canonical.com,
  linux-riscv@lists.infradead.org,  linux-kernel@vger.kernel.org,
  crash-utility@redhat.com,  huanyi.xj@alibaba-inc.com,
  heinrich.schuchardt@canonical.com,  k-hagio-ab@nec.com,
  hschauhan@nulltrace.org
Subject: Re: [PATCH 4/5] riscv: Add modules to virtual kernel memory layout
 dump
References: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
	<20220717101323.370245-5-xianting.tian@linux.alibaba.com>
X-Yow: You must be a CUB SCOUT!!  Have you made your MONEY-DROP today??
Date: Fri, 22 Jul 2022 12:10:52 +0200
In-Reply-To: <20220717101323.370245-5-xianting.tian@linux.alibaba.com>
	(Xianting Tian's message of "Sun, 17 Jul 2022 18:13:22 +0800")
Message-ID: <87wnc5xxsj.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_031105_532860_50E74007 
X-CRM114-Status: GOOD (  10.94  )
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

On Jul 17 2022, Xianting Tian wrote:

> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index d466ec670e1f..2c4a64e97aec 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -135,6 +135,10 @@ static void __init print_vm_layout(void)
>  		(unsigned long)VMEMMAP_END);
>  	print_ml("vmalloc", (unsigned long)VMALLOC_START,
>  		(unsigned long)VMALLOC_END);
> +#ifdef CONFIG_64BIT
> +	print_ml("modules", (unsigned long)MODULES_VADDR,
> +		(unsigned long)MODULES_END);

#ifdef MODULES_VADDR ?

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
