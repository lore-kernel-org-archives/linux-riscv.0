Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB2A9C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A62564F9D
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A62564F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=WNc9P0vVzEtEZUxmnb7HMtQdsHuo3Cf5oZ6tQWbiI5Q=; b=GQWipdYubvxiK6uvcm1fSuQS2
	pf4Gf+Jh92d4CeVmMZU3zrnF1TVUXjigZq2zhOQZUwCKdlGa2tMx6MAAzABZb+5J8cv7+2o3cbejt
	xCHua8IbnvjYr8iOvpTag6eGykEdIDbTp0AMWzlWwiwlDmkQLuxt4WapK01dM4+WwKc/ftVJ20xG6
	vh73pBSRYG8GkW1QtV5O3JNp52uBwjJVIQgB0wVz3SCVX0Lvhfmp53Y2K3FXiiki+JU8yRhQTYLHH
	Mj6E+Th2utImAIvyKrt575lyrqXdiO7Afa+DebH3FoOKs+D3bk/Khd8q6ZT/DCAM4oz/prrqjLIR4
	2orisYvNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4p-0004f9-Jj; Fri, 05 Feb 2021 06:58:47 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4m-0004cx-Bt
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id o20so3741775pfu.0
 for <linux-riscv@lists.infradead.org>; Thu, 04 Feb 2021 22:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=45oiIlSnEIMV0OPXUhkf967gneJSNkEatrrE2Px5nkI=;
 b=JgcIxav6VgtWCRFlGZm4bOIGB88RSAZQXbeVY93XEPLLXk+XsRIQ6rDMelKbFe19+s
 ZQ6KrDNKHsOI1u7+ZiBFneZkUSJoTOpKN7zNN+036tz9SbjGzBpHqncMwhrMyi4fskOc
 cxZO7MFzxoyb/EEWWYLN0qTaiGM/bXEgHWHxnBrW0Tefr655qJRkjXlVPdUyTQMnj9kk
 xU3pp6P45GjocC1uD2Y1Cl7N+NmiDteiPQ3OwET2gT2WtR7Fhl+AhKo/Ems8/gJOYa9S
 zW0UGQO6YEUCVnF/aSuuKfTbirPnDi+SJ9hyBI9EeS8RhMeB15BrdsF6zFDhjwyuAIEG
 6dSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=45oiIlSnEIMV0OPXUhkf967gneJSNkEatrrE2Px5nkI=;
 b=RN05VYablM58qrHTCNp7SitbR6wUkhyn7UrKmDnHC4lEHy/SPZVaM96j7pClA9XlgZ
 N+pSWzM57AQocpXJqvVtDVABcZN3PQ6Y5Tj5P/R6oeXe4PBgQYCJUbbevQi+hWL9NhJV
 RtKBvnbDejV9vkfZmmQRVMKOpkPi1FqYj3qLpbc/WTrg83BeIJvE4NV56JBZidsn183F
 ia2y30qbvQDNI621NOAVSLSGt24LxqqRcEjZMcCs7Xb9k/eEogS2EQ3gjWXOGvei3Sw1
 Ov03AWTJoqaKQ9n/MsgikJOLAULtvi6PhWHdJfK+Shb3c+u0IY3ckJ3fXK7+s9oq1mw7
 VnTw==
X-Gm-Message-State: AOAM5320VcNO8nq62ktV8/zFvrKEI3BICQuZvQ7gw2cd64R729G6zQW8
 AT3q5Bm+lZc3jVr58JM5IUOVzA==
X-Google-Smtp-Source: ABdhPJyMGXSHnCZ0Wvixs0wt52QtrkTyIBTMLxFz31XJIzGnJlN6MI4XnmPkS8ZwSTQopOGXEEC6Lg==
X-Received: by 2002:a63:4764:: with SMTP id w36mr2883164pgk.127.1612508321529; 
 Thu, 04 Feb 2021 22:58:41 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id t2sm9310675pga.45.2021.02.04.22.58.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 22:58:40 -0800 (PST)
Date: Thu, 04 Feb 2021 22:58:40 -0800 (PST)
X-Google-Original-Date: Thu, 04 Feb 2021 22:58:36 PST (-0800)
Subject: Re: [PATCH -next] RISCV: Add some depends for NUMA
In-Reply-To: <20210203142343.59781-1-wangkefeng.wang@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-3a9465c0-42bb-42de-ad66-855dc2e3c56f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015844_562939_AB5588B3 
X-CRM114-Status: GOOD (  23.98  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 06:23:43 PST (-0800), wangkefeng.wang@huawei.com wrote:
> The numa feature is useless for riscv32 platform(MAXPHYSMEM_1GB if 32bit),

I'm not convinced of that.  There's no reason NUMA shouldn't work on 32-bit, it
doesn't depend on having a large amount of memory just having non-uniform
memory.  I could buy the argument that build a 32-bit NUMA system would be
wacky, but IIUC it works now and I don't see any reason to throw that away.

> and it should depends on SMP feature, this also fix the build error,

I can buy that CONFIG_NUMA doesn't really make sense without CONFIG_SMP, as
there's not a whole lot to do, but I also don't see any reason from disallowing
users from picking it.  arm64 allows !SMP && NUMA, and I don't see any reason
it wouldn't work just as well for us.

>   riscv64-buildroot-linux-gnu-ld: mm/page_alloc.o: in function `.L0 ':
>   page_alloc.c:(.text+0x4808): undefined reference to `node_reclaim_distance'

The only instance of node_reclaim_distance I see in mm/page_alloc.c is already
guarded with CONFIG_NUMA, but the definition of node_reclaim_distance isn't.
I'll send out some patches to add the guard which might make sorting this out
earlier, but I don't see it fixing any failures.

> Fixes: 4f0e8eef772e ("riscv: Add numa support for riscv64 platform")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 22fa17898d29..ac7f5801bd82 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -312,6 +312,8 @@ endchoice
>  # Common NUMA Features
>  config NUMA
>  	bool "NUMA Memory Allocation and Scheduler Support"
> +	depends on SMP
> +	depends on 64BIT
>  	select GENERIC_ARCH_NUMA
>  	select OF_NUMA
>  	select ARCH_SUPPORTS_NUMA_BALANCING

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
