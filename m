Return-Path: <SRS0=Z8g5=BE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67FBC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71EE9206F6
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2020 05:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z3Cd/0in";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="fNwK/byX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71EE9206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=J3A4jv2k2UGj7E4+ApWBkXT0kTDrt8AMNWeG5KmGvuU=; b=z3Cd/0insyEPfLKQ9tpeVyrLV
	Wp27fbRRwTjnF+8nbGKJMOf+wQxmj/G64i6M0z5l49kjnGTv1SL+Rz8skTHY8oUNAyz5qC4r45Qn4
	Hp3Axyu9R71RL8I8HONeIJr+3JQOVNWZVT/JNL8eYDZP/IuPVMtyhBBrVACPgravuAAsTZMtdghsu
	9/TPVRWKwIYk0N+lHv6re9TuUkJR+eBJSEXgsCV+L4hsZPJliOyaNdctKZ51BmOwMACV+U1P5G5pE
	Dz8nA0eMJqlG63IrhCCFPmIU6pj6GwR5eEHkshfWmNBe6bxjh+SvaHuR14TKqPPKYByboijbkXGkb
	5K08YdBdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzCUK-0005EH-Br; Sat, 25 Jul 2020 05:12:48 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzCUG-0005C7-2o
 for linux-riscv@lists.infradead.org; Sat, 25 Jul 2020 05:12:45 +0000
Received: by mail-pg1-x544.google.com with SMTP id z5so6539630pgb.6
 for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2020 22:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Q/SEp1IUfbBlV7LP81dOutu3bytkejFynPFlKD4ZJG4=;
 b=fNwK/byX6yrilqyV2sQALIcpb63IuFOUy0tZ7WtIG0GUB7qNh4L5FssW/tFCNUTyIn
 E/lzsylfzN3ybuqdgd5r3ZyGS8LMth20sRHr5VDXMA3zF3Vn3+0kmTHRe6J7abRoiUeN
 l8aYBLb0Mtjs1M++nehKhuEt7QX+eD/825oGLykzhnVOH3Q0la6O8riJf2WOuZhEYzxp
 dUM+s2n8rjIg4yeNiXg/xDykqnsk5cgupRzGOMkjw7KMzz/EC0+ceaQ083AWsidGgqhP
 G5WpwMTbuqRg+lcpC8xkyOy9bFL5XpCHzUbvI3fcTU3wlwyhKV4eZFlTljjZjhKLNiXM
 DOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Q/SEp1IUfbBlV7LP81dOutu3bytkejFynPFlKD4ZJG4=;
 b=gHP+mdXFMTMzisNWvjcwb0RTdJGt3YiwEvhRc1dDsab9KJuUTksEj3SRJM8mW4w7lE
 6bWd09yXB22pnMVzbUHnT4JvLmxMj/4CJF5xXwlDn5M7Pp7hDAV2WVlMHfLpJOPwzv6K
 liACeD4NXd6l5bomqJRyGiN6n1KNVZLaKY6URKoQwaGQxpxD6VoXGdExSdqq8zaabC70
 z2os7U7o9vw6AdlUh6ALtUcaa+x1CEcPxAMtSe/duc5k+pFWDeE/eGny8qPv6+53y6aB
 t2P2FjqbqhVrk79MVvivPJHTBwqaSDsjFUcvgcckkaUiujelUf97uBxh5AlJrsZKGph6
 bZ+Q==
X-Gm-Message-State: AOAM531ldiitwRvg9HCQ5kIDrB0nVP9YFncUnuG7hLR7mKMA8dkYnaod
 jlZe1716TryRTjzP44Kx+YoEVA==
X-Google-Smtp-Source: ABdhPJzcuuAwbZtUI39T6hZUASv10qjY1nNCHpdIgDnAXqB1zxrR1Ylsrjfjpx+4lPcDfY7HQhFjgQ==
X-Received: by 2002:aa7:9189:: with SMTP id x9mr11393378pfa.325.1595653960471; 
 Fri, 24 Jul 2020 22:12:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 7sm7645777pgh.80.2020.07.24.22.12.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 22:12:39 -0700 (PDT)
Date: Fri, 24 Jul 2020 22:12:39 -0700 (PDT)
X-Google-Original-Date: Fri, 24 Jul 2020 18:57:25 PDT (-0700)
Subject: Re: [PATCH 2/4] RISC-V: Set maximum number of mapped pages correctly
In-Reply-To: <20200715233009.27183-3-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-89ff7200-0f8c-4d3e-af79-f8fa1a9231db@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200725_011244_175259_965F2D32 
X-CRM114-Status: GOOD (  19.46  )
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
Cc: aou@eecs.berkeley.edu, vincent.chen@sifive.com,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 sudeep.holla@arm.com, Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 15 Jul 2020 16:30:07 PDT (-0700), Atish Patra wrote:
> Currently, maximum number of mapper pages are set to the pfn calculated
> from the memblock size of the memblock containing kernel. This will work
> until that memblock spans the entire memory. However, it will be set to
> a wrong value if there are multiple memblocks defined in kernel
> (e.g. with efi runtime services).
>
> Set the the maximum value to the pfn calculated from dram size.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/mm/init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index f4adb3684f3d..8d22973bde40 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -150,9 +150,9 @@ void __init setup_bootmem(void)
>  	/* Reserve from the start of the kernel to the end of the kernel */
>  	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
>
> -	set_max_mapnr(PFN_DOWN(mem_size));
>  	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
>  	max_low_pfn = max_pfn;
> +	set_max_mapnr(max_low_pfn);
>
>  #ifdef CONFIG_BLK_DEV_INITRD
>  	setup_initrd();

This one I'm putting on fixes, as there's nothing preventing us from having
multiple memory regions in a current boot and this seems very safe.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
