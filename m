Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28780C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:17:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA43564E9A
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 21:17:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA43564E9A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QvPPHAo7jVJeUTOQqYHP9UQNSPVc8dvVustz9CJ4rOw=; b=pdFStsWCq7/h+fFwdHtScWrCw
	P77PYxU6pGgpyBKuibDv+KExWNLYVRAuDc09Pk8+f0IfyxjFkMPFRk4G6PaK6waR50rFm6/jzUk9y
	jtUmqDvBzhvQgrE5rq6H4vZONt5LQSnHz/ZYQ8ACs1S+nxzrcMGNIOHD5UKrQU+7y4s744RyylSw9
	0fxEj+2u1tkYKSegCf8yYNNnJp2uALIGdxe/DmdP1WjehXn7nf7NXurJrjf2pNGoLMwtxOJ2yg+A0
	1/zE9Cx5YuE4/PHQirOm1Z6yNMyxhVV1g0+0dCQxbJ1pkBgWhcVo2+nWnumnk1Br0XtwU6/QScHpL
	DqqeS1ZOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9DuS-0000cW-FA; Mon, 08 Feb 2021 21:17:28 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9DuP-0000bX-9D
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 21:17:26 +0000
Received: by mail-il1-x136.google.com with SMTP id q9so14174476ilo.1
 for <linux-riscv@lists.infradead.org>; Mon, 08 Feb 2021 13:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YPekpaVxBBmlUw011gors2rC08GDz16aB3ewrIFwNMo=;
 b=bmHV0vRtpxI0y65dOZ0h3WCqdTjiQnzS+i5K/T3/5UQ0jwKFBs5jbwzfcY+GNtFDCL
 Rrb5eqDW1MWBhgcwkF+EFKbVLaYLhSPknD6TSZ93BAVcljUo+2+0osahmLA81BBYD2kY
 KUvI/sz26bB3ebhgrYXNb9tO0uHNI5/p8aBAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YPekpaVxBBmlUw011gors2rC08GDz16aB3ewrIFwNMo=;
 b=O03l7JHuZBqM5DzYReDt2JA3wVukV8h/tYHY8SuMjRRNSTiQ/vSSbYqe4El1yWG8BW
 ZE3Oo1uF2GdNI2A99f4ayUPuhJ0LxLKjNT1Z/NLiTUlU85u8bPfOMTSNsRiPA/CkLpDe
 MgArWM1IXIFgrxr8Cdd2+xIMBcQd6xBOoAtnOocauJOP9Df7RVZrLdMPuJ5F1F9maVLv
 6PyKALFsrVHF0MawdTSjE3VEPbVxJWk7+RCHD7OzY5eLhGMjAYjzi9fCgc521ERRgDJf
 cu76eRMkzLRZmG0q54A+mhUqBmt5b74yPiWTccUlbjwnDvEoG8pzf5Q8kja7Y+41+EtE
 +aXQ==
X-Gm-Message-State: AOAM531aIrzZTdYsWr4jmtehU3Nw6AQhIxOghwId1XvbxlrFbbi1ThhK
 nZSLiYEWJZNnQ/oWm4fFlZUx/rBaE48XToadOewy5nvrfu8d
X-Google-Smtp-Source: ABdhPJzkQOAhhVeVCWR6J45M6kJ1IMiKMDfPIiOUMNGAwkZ+pNYdPnS+t4B0+4+3Qw+zLjvTG0EtQ3Aa4tkIo/s5Th0=
X-Received: by 2002:a92:ce50:: with SMTP id a16mr17473075ilr.219.1612819043314; 
 Mon, 08 Feb 2021 13:17:23 -0800 (PST)
MIME-Version: 1.0
References: <20210207081053.94133-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20210207081053.94133-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 8 Feb 2021 13:17:12 -0800
Message-ID: <CAOnJCUJV_OB67cFNCVrWdHOr7+owezsEft6P7spLKkt_2g5HKQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Remove unnecessary declaration
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_161725_365629_4005AD5B 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Feb 7, 2021 at 12:07 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> max_low_pfn and min_low_pfn are declared in linux/memblock.h,
> and it also is included in arch/riscv/mm/init.c, drop unnecessary
> declaration.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/include/asm/page.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 64a675c5c30a..adc9d26f3d75 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -97,9 +97,6 @@ extern unsigned long pfn_base;
>  #define ARCH_PFN_OFFSET                (PAGE_OFFSET >> PAGE_SHIFT)
>  #endif /* CONFIG_MMU */
>
> -extern unsigned long max_low_pfn;
> -extern unsigned long min_low_pfn;
> -
>  #define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + va_pa_offset))
>  #define __va_to_pa_nodebug(x)  ((unsigned long)(x) - va_pa_offset)
>
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



Reviewed-by: Atish Patra <atish.patra@wdc.com>
-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
