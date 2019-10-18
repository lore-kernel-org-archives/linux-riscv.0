Return-Path: <SRS0=JNhR=YL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 671FDCA9ECA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 01:15:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DA4521D7C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2019 01:15:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lkIPnJjj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="awDrOrTN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DA4521D7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mxDqZUU3XI4IY7q8NKlLaB5ZgEIEaS91vJuak9VN+v4=; b=lkIPnJjjKaNwzI
	nksCP5qgGiczpYSny0WK8j1O5fcrfkqkiAnVzQWQ08G1k1hHcokpyG5Nk95w55LJy0A5pSn7iXxfV
	HwxbMP8o4nkLnBYqS1b4BSKo7hPoqxwBIUCJ0aUkv93pohchTq/Vwyjlp/T0nKOUTCItK2XpwFi6k
	2gPxJH23CA+bFw53tsy2SQCFCc5QTMAtiG3maENm+ztW6ANXeZ+ITeekyrd37XlpRLnZYiMPC1ZtY
	Od2d9yxMouNobxfUyH+IbwvDMDAwjWa61CbhfPH5IrMxyCpYkNEiRiK7Ly2ZxpCnHgUPfoyPnj83A
	6x8P6bHHFsbh0CJAUWGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLGrf-0003xx-6d; Fri, 18 Oct 2019 01:15:35 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLGrc-0003xf-GK
 for linux-riscv@lists.infradead.org; Fri, 18 Oct 2019 01:15:33 +0000
Received: by mail-il1-x143.google.com with SMTP id l12so3991903ilq.4
 for <linux-riscv@lists.infradead.org>; Thu, 17 Oct 2019 18:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xMVFVGLiYSSLdYjE6VASkhDClgpi5ByjWpde3EPzDTo=;
 b=awDrOrTNZsTliFwdBDUIyxs4uX5joR2/y276X1UXTxr76eI9fflr4Pp//BNKhw4LDP
 udF5JY/ajGrCY8RdxmG2kJGXyipHWyNWPld3aZCqGILhwuTzivqGa1IDcV2DNRnj84q3
 jlhnWl/WK/LTKjgg1pinyZrNLcMWVxx9FOwlZFX2iHQXHVfBZCuyWYvdWDFdVSM66+B4
 SHBwMkz/wzQWkQVbZR+r2lNRYuiUTKLqYPo0e3CA1LavnCJGdkOF8sRgaNGe05WYeZC+
 xG/cSojbKWDQHv1N8NC8pVWLjReHS2jTlxCJFM1wMFgozUD9nbcTIJIUroCyYj2/DMdi
 Udlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xMVFVGLiYSSLdYjE6VASkhDClgpi5ByjWpde3EPzDTo=;
 b=AQd3Q7irOH7OOOe3ooDnf/xPTnQ9Teig+W+2TYH/OXoA9haZMAhOKHdPf3MXqUkEKZ
 Qh2p+fLwj2HwCa8UZWhu9ACEpMNt3y96aUtzRJZBNlHbKGKwrwD0WFqZom8SLA08oejN
 hk6Rk6u1ylSyNNB8rzyjFD1ey5/hdxd4w1dvyXPZhJQM/pJN2odUzBs7MFjacfSH1aty
 P0NSzCD8bpIMOwCkse1bUrkRBNzr3vU2JrLv8/bVGWZ8NBDmpaBGW6+MouzetQw2OKpj
 duT2JVgS7HBwCOmdkAQ6C3ikg0CvcqawOFYc8EBBvH2ABKD9zQUZdThK1TsVUrTDX7Is
 E9dg==
X-Gm-Message-State: APjAAAUHM+xpMtadlayr5B+N/mMI/uaG/jhegP+KOWgmHUrTr1XU9zp7
 9Co990vRLGTBIQdYzM5neQM2fmsqDDI=
X-Google-Smtp-Source: APXvYqzDVQiMyZIgvTZC/Q7ZcqBa0pFaN3EJ5m9p1+F6LuzHOYBWFwOn3qLkn0mFMNJ187/UdFrNTw==
X-Received: by 2002:a92:83c5:: with SMTP id p66mr7527394ilk.204.1571361331720; 
 Thu, 17 Oct 2019 18:15:31 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id t86sm1829722ila.21.2019.10.17.18.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2019 18:15:31 -0700 (PDT)
Date: Thu, 17 Oct 2019 18:15:29 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/8] riscv: add prototypes for assembly language functions
 from head.S
In-Reply-To: <20191018004929.3445-3-paul.walmsley@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.1910171814310.12651@viisi.sifive.com>
References: <20191018004929.3445-1-paul.walmsley@sifive.com>
 <20191018004929.3445-3-paul.walmsley@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_181532_572160_D77B4DAF 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Oct 2019, Paul Walmsley wrote:

> Add prototypes for assembly language functions defined in head.S,
> and include these prototypes into C source files that call those
> functions.

[ ... ]

> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 96add1427a75..ec15a9b15448 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -18,6 +18,8 @@
>  #include <asm/ptrace.h>
>  #include <asm/tlbflush.h>
>  
> +#include "../head.h"
> +

"../kernel/head.h", rather.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
