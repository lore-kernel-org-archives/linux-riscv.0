Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7406C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:04:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2913964DA3
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 03:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2913964DA3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=fBq0Szl+FBoBxRElTs/ffO5Esi6TE0vYLotcgEAvvPQ=; b=UCr0StMSA5LlYWo+h94Li2MEe
	24aG41cizoSBIJGr6MDTenNPdQmVTmG+6ullyezMMK+tR9II/LMTUuIzfcHlutMTKuXW7/KcMM9pp
	QxTCft+FOhKNxztP0caMzA36HY5N2LLuuMczBJwvYQDKiP6ZAkLWnKoVFDuskgqToac+dDT0pmWRg
	k3jO023Ff2PVpQK44oi8ZBRxsLfjT68/2WXNnV/iOmd6eoqO8O+9vTWdlRfNF6VRH5INNeK8710At
	IBiyPtsh8vALgqWNOo0i9B2rKQcFG4w4KyQaFDZa9EJpzPvxiXrSwyHvXWivK/Svu4JaqJtFkP1Lk
	2C2Pj9UlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJp8v-005rsS-FP; Wed, 10 Mar 2021 03:04:13 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJp8Q-005rk3-36
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 03:03:47 +0000
Received: by mail-pg1-x535.google.com with SMTP id n9so9455153pgi.7
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 19:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1YN8IaUR1Mu+1HOs/O2B0D40c+eC0rZ/zq/HTR6lO6w=;
 b=XdXjc9K0RS3ILjzJPr9g/Dru5e9KYMtoCzt8QhzKOlbzs05Fq+wgfjZ0xGhbEYKfNy
 5mI449JhfKLltyVCCaStPz0Hbmkrzqyv/EyOQ1dg5rvBz+UbRso7BozDLiT5azXKq9TA
 CAUSy/PJuQuQGjVCIj24x6uJ28N9bl4c8JAbRjkb5PN529+7VzPC6F2UMzTgIedq+zj7
 8goawhoy1sMy2XyRGH7Vv8LSV5X9TtM156R/NPck5P9vowxfatS91OSfML4X6YvRTprZ
 QcwFrNiPNPaUC2htvLzbfrBWFL5U68rWWcvtwXIQAm6ucGp4RMo0rP8vRjueUQx3wPC/
 6rnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1YN8IaUR1Mu+1HOs/O2B0D40c+eC0rZ/zq/HTR6lO6w=;
 b=cQC+/wJzkcRebqIAK7Q4smnp9Zilw6FBzhJfNSt5ijkrqfP+y8WvUbmPxxJM6aYEsR
 /duUfN3nGhYVeJM7KJXHh56DlaK1w6XRaStxFGoB9CQHha8DRj1swFU9U/gVqi3l+nHP
 NwaPmkFl6y90XjmvVri1eghP0BWpf7gvoS86UDC3FgsYgRa5ZLUfFmT5ZgckYUdFB2TG
 DD0ANtnpoUvzGCK9PxrxP63R17qkdOqgQgOP0DRweP4BL5+dD4vahJEg//LB+VdADyUA
 oaM2K+vXNF1Y5BxDfg8KrhgpNCCe6+3uT60R07sqwM156A+GYF+1mIsrrO+HZ/im+Rt9
 6qbA==
X-Gm-Message-State: AOAM533NdpSDkR1Yh2Xl93Msgfiuribt3rD4dteIP++vyeXD9E6POPT4
 Kfo+YzsjmZQXuiF9BykvtZGFEA==
X-Google-Smtp-Source: ABdhPJxl0YqekU2reqvAkEnVPyaoCtK2/VBG955HtdRnP0IqBiMOajFw5iFby8+nAp6JpwOP+5bamw==
X-Received: by 2002:a63:6dca:: with SMTP id i193mr879023pgc.81.1615345420644; 
 Tue, 09 Mar 2021 19:03:40 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s22sm4168279pjs.42.2021.03.09.19.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 19:03:39 -0800 (PST)
Date: Tue, 09 Mar 2021 19:03:39 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:03:24 PST (-0800)
Subject: Re: [PATCH] riscv: kasan: remove unneeded semicolon
In-Reply-To: <1614667008-22640-1-git-send-email-jiapeng.chong@linux.alibaba.com>
CC: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiapeng.chong@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jiapeng.chong@linux.alibaba.com
Message-ID: <mhng-c78e0139-c0f9-4a61-87ab-f9658bfe5a42@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_030345_697398_91EDF3F5 
X-CRM114-Status: GOOD (  17.73  )
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

On Mon, 01 Mar 2021 22:36:48 PST (-0800), jiapeng.chong@linux.alibaba.com wrote:
> Fix the following coccicheck warnings:
>
> ./arch/riscv/mm/kasan_init.c:217:2-3: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  arch/riscv/mm/kasan_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 3fc18f4..e202cdb 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -214,7 +214,7 @@ void __init kasan_init(void)
>  			break;
>
>  		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
> -	};
> +	}
>
>  	for (i = 0; i < PTRS_PER_PTE; i++)
>  		set_pte(&kasan_early_shadow_pte[i],

Looks like this one has already been fixed, thanks though!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
