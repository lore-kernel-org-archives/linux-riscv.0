Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED0FC55178
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 17:34:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4035B206CA
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 17:34:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tGUIT/Nf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="y7P19SKn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4035B206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=UerigagJtP7NEq89Ztu3gyq3H+AZfTMitd08/W/kOa8=; b=tGUIT/NfbkZGSSM8+IMVDJw9+
	ieDQuCwsyKkoK3mIrPgwAFoc/7Kg0ocHeJngV5OgWjJqQKjuCnE83KT3Z3sBKA9J+1LYX0671PVwS
	7fqULtRUUBxVta2vzHzNopd3OJezG8Knp3M9yWpDcJc+neU6kTHK6Fj4A4XRgCT/0ZQ+zYVeg3o5f
	puUOZ1xFf6XAkVOOSoodryqWyIWNq2hbsVpa83OnZAFtGbrnBzFD1EBfbFz2a1lCSRaQcJVJazthW
	Ia8XkG474MbaH+VzuLH1YE7GIO/XGCreqLw8pygpQ2KsZ3b8XMESMUxgfbI5tqOWjjwjf/ApA0lwT
	PP7SgvvtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaj9D-0005cs-Oz; Thu, 05 Nov 2020 17:34:07 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaj99-0005Y5-BR
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 17:34:04 +0000
Received: by mail-pl1-x642.google.com with SMTP id t22so1110561plr.9
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 09:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=bXK3jEO2zIpAnRvRC4dY7e8rL0kXVixnI/E7VIB9j4U=;
 b=y7P19SKn2el77vCjC8Zi5jhTeHuNO1vf+R4w/I4lIr1Fcr1RnLf/J5JMJlJOwxEc05
 S+2KbUj8SV5wmt3fbRwbo4gG3rp9Uk2PVM8BFH8sLzuRymXpEf4+zsZZey+Z6RRLqpyG
 NzkCyZakbpyOB48Yk37enTbuRnQeF8wi2a7kFkGczVEBJBpybxqiqRHxp7RDKtQ66bcY
 GwOB0wfZxuo/0ivYLgc1wdb6ABpFy0q6G2/DyCI1OwEB45Fuek32V9GFSphmS+/kJQaH
 HIZZApZ1DoHrqZDnty2ZxUe62tu66CfFjQ0p3qX7q+drFTmj14c7NPYdHGVUSwML6pLH
 +FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=bXK3jEO2zIpAnRvRC4dY7e8rL0kXVixnI/E7VIB9j4U=;
 b=Hi+LUWLbjobAhv1pacr0Zuf8BlrDeckolOiZhYMpcECWD+jKvoYRTmN54g9H9pINF9
 /wLlZYojCYZjUbzu+1HXx+GCW/bnMo9wpdT7yas7MeqGqSq95c4re3uxtkWNjk5NvO1Y
 GncoaH7ni4hs2F7tzoia8nH10DRbY0JXkk/Thuoje05bOd4pIxDEFplhXFxEINdcP3WQ
 07tRAis4UtJaUEPOxsQxwySocTtxY11nQp2F65GDFTb6SdIeLKyMmPU3rCBZiUM+kyRl
 wAr2kbDWwr0ef8rwfwfLSm1EnmCdmvCu80yNd33jRhjkGmA/rUCbBYLVv245wOtzsQ13
 RKMQ==
X-Gm-Message-State: AOAM531Zqgguj1lU4GBcOIvQf0/xLhELa2xogl0F3ImAhAhAQaxC7tse
 p9MljcXjfo9dLrhoc1+Suh1Xlg==
X-Google-Smtp-Source: ABdhPJzHOvTRbzaRy9XAdwgGhXwcAkSxq3p3MAxWFwaFCnmoGFFYGFWOpx4CbhYVVGhTPaItUenZkg==
X-Received: by 2002:a17:90b:1942:: with SMTP id
 nk2mr3445495pjb.168.1604597639530; 
 Thu, 05 Nov 2020 09:33:59 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 192sm3407429pfz.200.2020.11.05.09.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 09:33:58 -0800 (PST)
Date: Thu, 05 Nov 2020 09:33:58 -0800 (PST)
X-Google-Original-Date: Wed, 04 Nov 2020 13:29:05 PST (-0800)
Subject: Re: [PATCH] risc-v: kernel: ftrace: Fixes improper SPDX comment style
In-Reply-To: <20201011030351.4619-1-ryanpkosta@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ryanpkosta@gmail.com
Message-ID: <mhng-f7c021fe-0eab-497f-8eb5-7daf0f3b7799@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_123403_565962_F31DBF8E 
X-CRM114-Status: GOOD (  16.82  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 ryanpkosta@gmail.com, mingo@redhat.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 10 Oct 2020 20:03:51 PDT (-0700), ryanpkosta@gmail.com wrote:
> Signed-off-by: Ryan Kosta <ryanpkosta@gmail.com>
> ---
>  arch/riscv/kernel/ftrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 99e12faa549..765b62434f3 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +// SPDX-License-Identifier: GPL-2.0
>  /*
>   * Copyright (C) 2013 Linaro Limited
>   * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
