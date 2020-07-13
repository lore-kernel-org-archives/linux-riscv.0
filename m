Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AB6C433E1
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 20:11:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B6320674
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 20:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YuPNYdsZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="e/NsNBEU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B6320674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=EIj5fTRLYu5mycXiEPmCF9Zy0FHaWB9rbwe3IlHdDUU=; b=YuPNYdsZPULKZzknl2nu8jdHJ
	7hzu1rDisyizSM16R8/fA0mg7kf0WL2Ofa/Pho01aCvVgyz2O9xnk+Y7joMuGlGWbvkxYEKbC+GO0
	r4imjqWTGbaIZuLn2THO5e9ANuT1JvObn/eBELcmTNVXK/9Jrb4CSk6QH0OS5KIxzcPVW3Cu5AuKV
	Uih03q3xYeC8S6iInH1l6mJP7PHEqx8peFWSN9yv6QD7W9QeukcW//y/EmT9+mhx3eHOZsMqcTiJX
	gdIwEWz7SDwggHs5rFfuoeB5qsz/IkE6p4eFwaNTQLSOUEqkuIYbv0zJz1n95nh8q3Ai/MGJJuM27
	rObvEzmHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv4nA-00017k-Ix; Mon, 13 Jul 2020 20:11:12 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv4n8-00016t-EU
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 20:11:11 +0000
Received: by mail-pf1-x443.google.com with SMTP id x72so6506608pfc.6
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 13:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=09LknHY9dkU2M2OX/SgfAySnftMBQc2JUvSKGgKRJCQ=;
 b=e/NsNBEUiK2c9tIx0w5Wa2nFM/f6fn0Dm1wPMhDzZoNngENUVV+uLYf/RdwYXo0OWg
 pqMuzaqoK6PBQ47TV56KgWEUB7BSCB6NWS91anQRwBTg6NN6jVoiCntB7R1NGAa7IMEu
 pOYVUaJ8BPj5TB7BsSxZhZW7ekzkxmN8XVvVg6jTa4Tdknmq6EZXKeF/ZeZjg8x8T80c
 3r3GH5P20vEZf1P6edjZ1pnfbhof/ZafcmoyiXZ34pcNiPunHTpuBMl3lX7B46shBCdI
 xMvJofQ6An2Xe8pGb9uTXECGFHIQ1+hWY6YWIxdVTJZPt3vxpDuWeJ6OmeEdQsHWKXXm
 40gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=09LknHY9dkU2M2OX/SgfAySnftMBQc2JUvSKGgKRJCQ=;
 b=rEZyqJkDlpzA5k1qhPTY+ilhUpUhR6rSANsSBEnvekc48oq0DM+D4CupZa9Lb/qGjI
 onaLjok0q4ggwL2MOrHAy/HUKBouXuhTsuSjUGTuQA3JRLah+jI4EOujBkUSDK5febtJ
 WfIAtOsIQJwryxXyfhb1I+hd0D2lHEenlcU+hGNWj4u+ck67fyPYHZCdpSB7CZDziDh8
 x9EDKalHXwcZCI55w6pEusKUgdnhgd/OxE6XVlLY2w+xetSOr/oOwPBy5RIY7LlgZXDj
 RurZrn5mpS/OyLt66lQnGoAp6ygmY1VbocaB02YsVci7LsD3LQYQuS6uQIEuPn1w3HJB
 pi5w==
X-Gm-Message-State: AOAM531gvBHvb/09AwGxfeixnRElKqTey79/+gaLrKkiP6F/otbWIe3+
 HlGEJQwZbZ8FbYXsHeNJ37DoLA==
X-Google-Smtp-Source: ABdhPJyIavVroDJAFXHGVH3iAha82aBR6fPl20kp6ciqNkYezNXkt68WOlU0Q8ksIhyn8H06/JbttQ==
X-Received: by 2002:a05:6a00:224c:: with SMTP id
 i12mr1417007pfu.18.1594671066404; 
 Mon, 13 Jul 2020 13:11:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d16sm15290442pfo.156.2020.07.13.13.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 13:11:05 -0700 (PDT)
Date: Mon, 13 Jul 2020 13:11:05 -0700 (PDT)
X-Google-Original-Date: Mon, 13 Jul 2020 13:11:03 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Fix building error in entry.S when
 CONFIG_RISCV_M_MODE is enabled
In-Reply-To: <742f0a82a9d4ab62d8616784db5a88a95d8b5389.1594629047.git.greentime.hu@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: greentime.hu@sifive.com
Message-ID: <mhng-f7d831a1-d892-4c55-82e9-4427539f1337@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_161110_513994_945029B9 
X-CRM114-Status: GOOD (  18.40  )
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

Thanks.  I guess I must have something wrong with my build tests, as it's
supposed to be building the NOMMU stuff.  I was just about to fix this up in
the patch, looks like I also lost my own Signed-off-by so I have to ammend it
anyway.

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

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
