Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56ADEC433E7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 02:59:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2256E20792
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 02:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UtshQAzS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="KScI1b+b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2256E20792
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=j0j2y4FSXt5WylF0xXa2P+CWIrp4w8RtoOPl8PuyoAI=; b=UtshQAzSZgQ5DzB2eXu8DaVkc
	onQq1yqgKrH2MFWR5ec46o0E6jgDqJXCExkV1SPToaAzva1ojxisxhRuIS2ZbZVNc++naXaglNrBf
	DLQMp/hkZyadtodfUxWWtTGu3Gg57vaDrA2cH4mdknOL3TYL1Y4TJ80sR8kZLVUf3v9TFbhn4Q8ge
	Ur/Qaz1MQ50Thd6XAntiTZmClsmmtkV4Vr5/ssTQRAGqrpsfKmX6eFZFxpjViwhdn0CW93tDXIP6v
	dUGg772NKR7nwVSo6V+lT40M0oqrqviszbh+hX0hmg1rjmkPSREXCpzwrx8TsFkfY0Xr0ECusEo/6
	NYYfEn8IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy4yJ-0002fx-20; Wed, 22 Jul 2020 02:59:07 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy4yF-0002eE-VW
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 02:59:05 +0000
Received: by mail-pj1-x1043.google.com with SMTP id f16so419366pjt.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 19:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=jwmIpuIZKpcc0Q+zuIwHWh3kDRMkK5YkPe/3s8OgK8M=;
 b=KScI1b+blKBYy4f3sDkI9g0G1j4jqclpWVB09gXAVq7+FMeao6EDj4GFpK8+ZW/DlN
 iPB28KdBUXJOwAUGX+Y/0cbiCEWwuR5OvrF5+TnFFsGt5BGKhepXulde5ZASR0q6EGKE
 +jSLRSj9R4sUKOfx3DHQOxvYDuJCUgldBQxOevkGiuYuVhXuDowKgey7aiA0mzl30/1I
 TRmtFRYTuvdinZ3RJazsktJJl8UJPcXcnbIOJ8HTVCs+OURHpiaJI8uh/Vq0+kkR3zM0
 GGUCwXGvD4u/NxgqS03C3IjBUVKI2xvcX3WNLG6EZiCBWmmauDkuULEaM2Wyf5CZatic
 1TfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=jwmIpuIZKpcc0Q+zuIwHWh3kDRMkK5YkPe/3s8OgK8M=;
 b=IpevOHNsMgJyEgdI3b/O9BFidhJXDTiPgvAvqd1E935Y8wbAHugJSkjg2E3xmbA7xJ
 ccvGPan4Ze9a+fZQixH/S42guvWKhwuhGYFLa3lJB/30NJtlsqeH4JGXd8E4z5VqIFFA
 xAdm5K76CS++DWkCPdnrG3w8YLPHS8ffk7gF2GfZbo0Z6w3X0+86HWwKNXwT4QzK+PDg
 jeZxVcR/30t5TGPibgymEcGq+jJ03anfnS/Gns3k6n5XDskSPFW6ofzgcTBi1EMImiNy
 mdM2pTIsx2uuWs8phS3fDdkCo/uWi3mFYtOfpYluyFnH9qUGR/VKtSUmMfQQCbjVXYvX
 6wYQ==
X-Gm-Message-State: AOAM53288XIHodezcCCDIn8zhhdBV9a6NbhtYzu20UaSmLP/X0LqprnA
 uyqWdTt6aCSeYpiwLPNDRI/fRw==
X-Google-Smtp-Source: ABdhPJyMGFdJRFFM26XdtP/bLX9ofuQ9mihGMzeIGOthRaB7mjiEKCQeljlCDhckItGtse2CXo9VUg==
X-Received: by 2002:a17:90a:ea84:: with SMTP id
 h4mr7888106pjz.128.1595386739541; 
 Tue, 21 Jul 2020 19:58:59 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x9sm18811539pgr.57.2020.07.21.19.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 19:58:58 -0700 (PDT)
Date: Tue, 21 Jul 2020 19:58:58 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 19:47:23 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Fix building error in entry.S when
 CONFIG_RISCV_M_MODE is enabled
In-Reply-To: <742f0a82a9d4ab62d8616784db5a88a95d8b5389.1594629047.git.greentime.hu@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-ca23efdb-a932-4c2c-9b67-223fe779a284@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_225904_120576_1CD9916C 
X-CRM114-Status: GOOD (  19.99  )
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
Cc: aou@eecs.berkeley.edu, lkp@intel.com, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 13 Jul 2020 01:32:15 PDT (-0700), greentime.hu@sifive.com wrote:
> arch/riscv/kernel/entry.S: Assembler messages:
> arch/riscv/kernel/entry.S:106: Error: illegal operands `andi a0,s1,0x00001800'
>
> This building error is because of the SR_MPP value is too large to be used
> as an immediate value for andi. To fix this issue I use li to set the
> immediate value to t0, then it can use t0 and s1 to do and operation.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/kernel/entry.S | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 6ed579fc1073..000984695cd6 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -99,7 +99,8 @@ _save_context:
>
>  #ifdef CONFIG_CONTEXT_TRACKING
>  	/* If previous state is in user mode, call context_tracking_user_exit. */
> -	andi a0, s1, SR_SPP
> +	li t0, SR_PP
> +	and a0, s1, t0
>  	bnez a0, skip_context_tracking
>  	call context_tracking_user_exit

Looks like this one already got fixed, I guess I saw the build report go by and
fixed it?  I don't remember if I actually pulled this in, but I ended up with a
3-register andi so I guess I didn't do it that well.

I'm not sure why my build test aren't catching the M-mode stuff, as the
defconfigs are in the list.  I'll go take a look...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
