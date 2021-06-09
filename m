Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63145C47082
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 00:20:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25BFE61208
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 00:20:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25BFE61208
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=+n8fm9paWVEdPuo/MqgaiOv+HNw29iZVXmXIH7ulC9o=; b=zbSaZgf1ElVH8lqLWu3EKF5fui
	Cr+m/d4rI6VVJ4ioXPPouoCSaAmqLUW9qph/rUFiqmGz4Dfl4/paQwFoWYLz3ZuXFvJ8LEw2lIE4s
	wqBr8HxbssYJ7GPOmfKoACYbTmgNCtFNOSrCCWepF55a4veoYxLHMFMmalGxI9RDRSeuzFpMGluHy
	fTcx6mp39hRhVgvAonHDXt7V+vkY3zdFeZRE+Re+91zIssh+yOSZ/qgvzqr+H5OV8D+YV00qpXSnk
	Cjb/CWSv/li7Gaqpd4yIIUEvpWDcYjgcWuPtiBUYj0LCgGmeiQHDmAz+wn2YGeYphXS64k/z67q0X
	BL5sorHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqlwf-00ArXa-92; Wed, 09 Jun 2021 00:19:45 +0000
Received: from mail-pf1-f181.google.com ([209.85.210.181])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqlwc-00ArW0-Ab
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 00:19:43 +0000
Received: by mail-pf1-f181.google.com with SMTP id d16so16986111pfn.12
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jun 2021 17:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BL8LYfLiW97gYs50mMRPWFDzO43ZPs/0nLhvyiI1l9k=;
 b=TwN6pJqmDjnw1jUF78frKPE3sQLHszqGjFRAVBbsP15o7eht+rzG9v0aT4xjB7Oi4y
 4KHRy6xnA6ntzPCsKiXtaqInCJv35Uyvk1ntGoSG3vg6Cc595QGvVlcaFvyFV5/tMfnv
 4laIKokxgf6or5+ToPBfFxXd8B3bxeVCslRrte5JKXpVEJ6w5vGi2o0atO52gEC74K4w
 Ay4VVIqMRCU+owvvl21mgw5JLyAFwyBKGKvEfV0KAMDi1ps/z1jCvHMZGd+AxmmRc7sl
 j6rbVn6PQgNDpk0YEyqBG42n5dOsYMvc+Sm59ws7BqIKaEUb2AZF5wpkpvszBOpvpa8D
 r6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BL8LYfLiW97gYs50mMRPWFDzO43ZPs/0nLhvyiI1l9k=;
 b=BR77X5AxS3IG0iYYD12nfO+t6hHez9BX+/cf48sl6/nJ0pf4SJiYFz8GqkEJ0SqRt+
 SmXFVSETISQRPb2y/tZjVBb7hEbZUjHq730jnGDYHFTKTJUIevWwNefgi74r1DfUExiY
 iBBoSbsiiAnCszDOb9CiWh5zu7Ozo63hUz/6FTzQ1x1rmBkebs38lGRkfnFcZ/plWjEv
 9u9gcz8t3szX/N840YClZdSC/83Vz2KY0xlWFd7rFobJC1uSf6cQ3+Pqi9dT6DZmXCOH
 3M46tr0T3qNOQ85AZKM1GIEhzAaSar3W2/W5UTYB4EJwAsDm+aZUgkkr0NxKhOdnlF/X
 7Qgw==
X-Gm-Message-State: AOAM531uJlTrB9gfFMIyZcT86LUaQSosXySlVForczXSspSxuZ1egWR+
 RMy7GI2T4H3QlwYfhfTZq3tCzw==
X-Google-Smtp-Source: ABdhPJwmp1Lk7bsoywWHJKG1fB6e9hWnUEMNIoCQ52jVaFnQVitNhNkU5zua3Ug1Kgzuz7vqyQvFPA==
X-Received: by 2002:a65:520a:: with SMTP id o10mr920386pgp.172.1623197918663; 
 Tue, 08 Jun 2021 17:18:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j5sm10143402pgl.70.2021.06.08.17.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 17:18:38 -0700 (PDT)
Date: Tue, 08 Jun 2021 17:18:38 -0700 (PDT)
X-Google-Original-Date: Tue, 08 Jun 2021 17:18:24 PDT (-0700)
Subject: Re: [PATCH V2 1/2] riscv: Cleanup unused functions
In-Reply-To: <1622350408-44875-2-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 guoren@linux.alibaba.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-c8795d34-beda-4ef5-85fc-932ac36a726e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_171942_421610_171B67BD 
X-CRM114-Status: GOOD (  16.47  )
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

On Sat, 29 May 2021 21:53:27 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These functions haven't been used, so just remove them. The patch
> has been tested with riscv.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
>  arch/riscv/include/asm/page.h | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 6a7761c..a1b888f 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -37,16 +37,6 @@
>
>  #ifndef __ASSEMBLY__
>
> -#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
> -
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)	(((addr)+((size)-1))&(~((size)-1)))
> -#define _ALIGN_DOWN(addr, size)	((addr)&(~((size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr, size)	_ALIGN_UP(addr, size)
> -
>  #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
>  #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)

Thanks, this is on for-next.  I'm assuming you want the other one to go 
through the microblaze tree, and it looks like it's already been picked 
up.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
