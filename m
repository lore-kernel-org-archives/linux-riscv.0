Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C272C43461
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 01:09:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E99A161206
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 01:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E99A161206
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=3sq6R67Zid+mTi/1GAjjoNNC8KTVuh1nvpt7FjEuQbc=; b=Eske0NtJmA979LGA2Qffqxl74
	cKuPhaQe/Xr/VRH2AkZmMZigN7UdNzK9GOBBMiZJQLN/SYKo2TmgUFCDszcb6IXFOUhQiaxPWUm5j
	6Agn8lbUtdz5zl20TnUXWhOPHnMamP1WSrA6neeLD1chQrcGCa2yBmME8ZzM1VabkorGoRGEotu7x
	QcJNYrPPvdY/+YmUoeubo+uWU7FJur76UGY9f/aWlTDqYrNcnU9mEeAcSUGXbSTHHd5duQ/WMV6op
	CsIpKUUSE2dRq5VnUaar9FZvFGT/iC+xbP43Of0l2afQf4dHmwOwNFDItzPqrfzRFVRrzqgKo07oU
	P9m34L2Wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVl4m-005PBb-P4; Mon, 12 Apr 2021 01:09:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVl4i-005PAm-ER
 for linux-riscv@desiato.infradead.org; Mon, 12 Apr 2021 01:09:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=HPxg5JSgOsrOfTmvP3UDKjG3tm7XrRd5oWLPunngUEc=; b=EWmTaiV16yEii/M66IH7TwppdD
 C0LyXq2/g54QL3eXbNj2CehLzOGKaxJFR+KkpQcbz2CXnlfgZ+IFHcjdlGMINVB18P6dSL/QK8U8L
 oZ/cJAGMka6zQGJVDoxD/NeyEVR9JuscHlEC7iNurqIgookdhRnKZm+C+90v83SPa/IHPYE1Enu4V
 B22Clu8FAOyhEShPkfJgvULIK7Paoiol5mcwKrxqbC0xYUEtPiFMEpTXuXiJcDHBhvcuM2yoY373k
 3saDqJDtgSetYwMM5WKMX8d8DrydArHGcN+nAUnu6Dn+O7yY9baL9gqmBoANRNCW+bXuJXdo89rtN
 l7xPDWkA==;
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVl4f-005oox-W5
 for linux-riscv@lists.infradead.org; Mon, 12 Apr 2021 01:09:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id t23so5744622pjy.3
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 18:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=HPxg5JSgOsrOfTmvP3UDKjG3tm7XrRd5oWLPunngUEc=;
 b=sBa6N1X77FArEiHJP7AorZoNOGY8WZi+cW3Z1YuxkJVRXbFD68A86GDaI0bDNOzGj9
 /6Re15e/JfsCr6ttGzDD0HtYiWOQ/XLuBum81cyWucslVyIgnArWQbsZ1aqtJEB/NgxB
 EeJK1aog2kaOitpm4TaaOzkidN4HycJj/UCNBUigOlnVbxhja8sih6FtEBXTQBCIpYQQ
 qMDEQT5L3gQyql0eIhp74ngVXSRTSy4Ls6O7y5UFUR/RP3XCH77aa0iWE0ZhdY1yWeV0
 tHq1ganMvkNdiEfX+mgWQNH72tEv53Jw1E6ing7qMqB2D5lv3J+DMTUIsFjK3lrNPfsx
 RDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=HPxg5JSgOsrOfTmvP3UDKjG3tm7XrRd5oWLPunngUEc=;
 b=rDzGAOsg7Up0LhbwPrpyHdEND2kaMVPV2xRL/GDjc2T60LxCdl0GMXGjnAju7rKMMG
 IUQClqu0DybfHfUpVaCm0vXByk9UZ2qBRdy3Tm4IEaF+PUIn2ce5oAiu9/joc9z7l6tN
 bw1KOiS/tiueJERpj5kltvlVCyH9P855z8EkqNTY9WOw9sgG72HGijvnqUaPpPGXyH2v
 xYMnHys9n+g0u3AiT/zULjFih41RGg2APPqP3SprCmUcHnUuW6vT5fQw03pIMjfZyldA
 dwmxi+1CvppYSIHBkG5xrvej2ZvFMTA83ZMxYbvirw8AaT1y2ZRGAUy+SD3pt8DAMRWg
 lEMQ==
X-Gm-Message-State: AOAM531bU1OaXbU5btZ9Wtod7YEGN5qgG+qzz0155TXfPup1fZjogYyt
 7I5z3gRd7j/13sQZS4oJWtj0kg==
X-Google-Smtp-Source: ABdhPJyyy2bH9fp122etCL1m7vyy654HUV5AqMoCtOX1TBeYgBkF/YBr59h9BQXdOQ80oEkGZ6uzOQ==
X-Received: by 2002:a17:90a:3902:: with SMTP id
 y2mr26519541pjb.202.1618189749186; 
 Sun, 11 Apr 2021 18:09:09 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id g14sm3223291pjh.28.2021.04.11.18.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:09:08 -0700 (PDT)
Date: Sun, 11 Apr 2021 18:09:08 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 18:08:08 PDT (-0700)
Subject: Re: [PATCH] riscv: keep interrupts disabled for BREAKPOINT exception
In-Reply-To: <20210330021624.2b776386@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 guoren@linux.alibaba.com, mhiramat@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-658942ec-8ce7-42d7-87bf-79deb0d0989b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_180910_048945_C2A9DA34 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, 29 Mar 2021 11:16:24 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Current riscv's kprobe handlers are run with both preemption and
> interrupt enabled, this violates kprobe requirements. Fix this issue
> by keeping interrupts disabled for BREAKPOINT exception.
>
> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/entry.S | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 744f3209c48d..4114b65698ec 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -130,6 +130,8 @@ skip_context_tracking:
>  	 */
>  	andi t0, s1, SR_PIE
>  	beqz t0, 1f
> +	li t0, EXC_BREAKPOINT
> +	beq s4, t0, 1f
>  #ifdef CONFIG_TRACE_IRQFLAGS
>  	call trace_hardirqs_on
>  #endif

This is on fixes, with a comment as otherwise I'm just going to forget 
why.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
