Return-Path: <SRS0=sMkx=M3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1ECC4338F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:18:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D54D60E52
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Aug 2021 04:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D54D60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=zsIseqXm+LcjLdrIQvkZS4bFI8xWX7Lv3Z20qAk0d7o=; b=Mfhpu++4YBX1kBTpQDwCOjn2Aq
	umm/s7opTh/4u9uK+20oGCD2pq86SB1of5ZMeGHzAenYc/IR5hGy8F6q9tpps8Zxt80xRIeXN8WqM
	+NZp9Qo7Kiu+Exf5d/Bwkkm7VuQ9Uf7q+SEnzFgiJj/qEEuLaipHVTmLvheJMRYtsAuxetYwoY0hx
	/cveSV6Jd2Gw1g2LxOo+/U81KoyThYytnUSkHfvfs+AgX11HTQbbLN1846oxWuBFpF3LERlyJHMUU
	KssiupXklkn49h2qWBIzDn5asx4vuMMzvHxKxBFsOORDykvjq24rXpcvV+0p97KOwbDwgns5JGKs3
	7Cof3Rqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB8Lg-004k27-2V; Wed, 04 Aug 2021 04:17:44 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB8Ld-004k1W-Gk
 for linux-riscv@lists.infradead.org; Wed, 04 Aug 2021 04:17:42 +0000
Received: by mail-pj1-x1036.google.com with SMTP id j1so1178486pjv.3
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 21:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=vKtpxFfXXonzxQpVSnSTmoh4P23uDt+JR975j7vzGY4=;
 b=or4MtC5Pa4CHAc3sHN8vhHOBNZECV0NeNG52atUIvJ97vUKZ7iKFlI7i7xyi2oWoCl
 OLZ9Z1MyXwztCijqG5Jjc4zOlgeEeMtkXCqA9JED/mzH0JY3F1oR3EYJCmxag21gKGek
 24xvgcmy2Ke9tggxbTUUqWLns8bFbF1za4wLPM/FwEVUSa2g6U+Thg/IU3R5kdAPou+n
 0CGaRnD5rejAOKudXbqqgJBtsCgWJh/QLXTR3yg9XELegw3OADOY/BRn40MXwJVugREE
 7Gv5yx3UkMy4+0NU9dEpuDDUgoJXg81Igw7QbMICjaMxN6VMLWCGS0VsYK2lTjNZDuaR
 o05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=vKtpxFfXXonzxQpVSnSTmoh4P23uDt+JR975j7vzGY4=;
 b=tM47PWPWt6dr0Zqe0RLeGX8S9edZbBhsCptITJo44hrge+a0d7hxKaTG4KOJhaAAuF
 S9KjEem6/eXlvr8fgaB5X+XhpheoZOgLd2LXNADsvW+y3FeOQtdK+R4NRdp6cqI9xQbV
 dOKWHnY/9q9usSKl7nTarIIE9E0BPmkNU1bxJQ6t6QUt8ZDPFNSNfc3dNq4p/uC4f/e9
 7xNSs+6/qYV7sJrlJYvf+tO1oRhHBqS7uvBCww8yOi60IzeQGbQO30vyR2wdgmIgihUh
 W5ewYrgQfqiuXOveWsSOqj+Wf9lYwwXeM46XZCWZm4dP1BQRdYyjaeJqbhpzTNiaBJHB
 q4vg==
X-Gm-Message-State: AOAM533BsILMK1/+JsWv9BWPvK/QDgHjiuvG/9KUFViqK3uhCAU1FHYV
 TbRP9lmjMBOY79lLORl1lzZzXA==
X-Google-Smtp-Source: ABdhPJxT/EuDDdw2vtXk3B6b9kWmMENSSLMKvYVu3SKC68N0WAiRQo8hVGeu4ERHg/s9uOaxjUO/bA==
X-Received: by 2002:a05:6a00:188e:b029:3c3:1142:15f2 with SMTP id
 x14-20020a056a00188eb02903c3114215f2mr8894882pfh.36.1628050660207; 
 Tue, 03 Aug 2021 21:17:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k25sm751605pfa.213.2021.08.03.21.17.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 21:17:39 -0700 (PDT)
Date: Tue, 03 Aug 2021 21:17:39 -0700 (PDT)
X-Google-Original-Date: Tue, 03 Aug 2021 21:13:20 PDT (-0700)
Subject: Re: [PATCH -next] riscv: Implement thread_struct whitelist for
 hardened usercopy
In-Reply-To: <20210702045422.3527469-1-tongtiangen@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 tongtiangen@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tongtiangen@huawei.com
Message-ID: <mhng-f83de915-bef2-4624-9e0f-40fa9fd9560b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_211741_604772_B715B469 
X-CRM114-Status: GOOD (  20.05  )
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

On Thu, 01 Jul 2021 21:54:21 PDT (-0700), tongtiangen@huawei.com wrote:
> This whitelists the FPU register state portion of the thread_struct for
> copying to userspace, instead of the default entire struct.
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/riscv/Kconfig                 | 1 +
>  arch/riscv/include/asm/processor.h | 8 ++++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 821081bdb8b8..5c26c0726944 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -70,6 +70,7 @@ config RISCV
>  	select HAVE_ARCH_MMAP_RND_BITS if MMU
>  	select HAVE_ARCH_SECCOMP_FILTER
>  	select HAVE_ARCH_TRACEHOOK
> +	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_CONTEXT_TRACKING
>  	select HAVE_DEBUG_KMEMLEAK
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 021ed64ee608..46b492c78cbb 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -37,6 +37,14 @@ struct thread_struct {
>  	unsigned long bad_cause;
>  };
>
> +/* Whitelist the fstate from the task_struct for hardened usercopy */
> +static inline void arch_thread_struct_whitelist(unsigned long *offset,
> +						unsigned long *size)
> +{
> +	*offset = offsetof(struct thread_struct, fstate);
> +	*size = sizeof_field(struct thread_struct, fstate);
> +}
> +
>  #define INIT_THREAD {					\
>  	.sp = sizeof(init_stack) + (long)&init_stack,	\
>  }

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
