Return-Path: <SRS0=jBL8=HZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987A7C433E6
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:58:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20C9F64DF3
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Feb 2021 02:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20C9F64DF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=oLQ7PIol/ucSZk9OFiTjpFIUjJvKHrqIfQk4tm8bAJE=; b=Ku81+0T1Es1O5piMy8+SRkQBW
	PN3yv5ONEgOCODMW+WY0vxWuerbwkWFIcunW7T53g2xdl0+Y77ZfqrzibdLYE01qDGuBecP8p0CRj
	dCLLioQAzhfukTzbykZ93f+iJ6upESxWiJkhKkPIX7Ip31dPIU67a1L3HTRJMzrqZUpfs09ILHdw5
	+310bfoSndgbT4r+RZVdkA8M2/pxuta70bqpMx801DYfnkpoCpZqihLBIzb7fOk1QfCbhdD8tJmte
	6W8fe84MxBPW7VFjVGbFBeaVkE3Do1R7wh6mTHzbdvAif0VhseI0cwEuev3ZrfsvAPOU3FUT174IG
	81Pu/1Fbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lENu7-0000ZD-6M; Tue, 23 Feb 2021 02:58:27 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lENu4-0000Xg-7V
 for linux-riscv@lists.infradead.org; Tue, 23 Feb 2021 02:58:25 +0000
Received: by mail-pf1-x435.google.com with SMTP id x129so3155091pfx.7
 for <linux-riscv@lists.infradead.org>; Mon, 22 Feb 2021 18:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=2wngzZ6mx+/Vpq7Q62N18mbJmvOCii5bU10fpk/sXk4=;
 b=xAg0RMNyoNjVqBWz98xEBHilAwyiq4dVzFeg6Dcn2mxnsprTZuZVDvmhFj0hnOYlF9
 kXlJkDzFE7W19jKisQdSIOBFhB5ZyAX+x7RPnmHddiQkoxm+FsBr1OgI+GOUyIxapFIw
 Qop4NoeEVYKNQuyPBSRrhi5oTHNEnZRUnmEUOjmrGCTG55UX6AWVD6TfAKxPC4o7SB0h
 NuN4D+8LUliVI0usdqOe2ETZbzBuy3kB2aurjf6FBarGPRuwJTLJqv8+3XNlUAHAx+0z
 mA2e0IeGQjEyhPBZ2jbfCaqT1k+8c6FbuLToyM7pt16FeBXPqeXfr5jV0miqzHIeMGN8
 e5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=2wngzZ6mx+/Vpq7Q62N18mbJmvOCii5bU10fpk/sXk4=;
 b=oKZkGydDS9gCNAmwbKrRATjZRTdHnx4LYFmYktmGkeynT4IgPhKaKJCqp8rzQvPL8e
 /+i4xzzSUykani6itrWTEdh5901BO6LXA3I0dL9b0+VJbUI9qrpcTj3E5jJvATs+GqzB
 qcO4F8ITmyY3Sf0O6s/Lruns6h7+8u9ZiusrUmUZ2hOUfYbfh1YlBjzRrBoLniiOFl1k
 dus6etNb7uCxdVaQwZEC3C1RHfs8vbcpnmQSB9AoYvnTP7YvsPFH8U3+3WxDPRyPVTi9
 MItksnRhoxux9ihPTtUg5MqTUNX/XoFrR6xJ7UGa3bpn+xQwI3lxsXYMvzGoGfBKLh/S
 ENog==
X-Gm-Message-State: AOAM5332Xg8cse1Le7YyrTsUkS99QSpNuW+sdXWYNR3Srr6XgtxqcIu/
 KuW+OZERbkayW/1MsBlk4CTSdAL8HMisKfgk
X-Google-Smtp-Source: ABdhPJw1AaHpGEYHoBeg/cY+uSWG/zywCJNkfv/3STu7tc190XSaa8k+yi7WYSOLbrSsLV5/tlXPkQ==
X-Received: by 2002:a62:e401:0:b029:1ec:fdce:b052 with SMTP id
 r1-20020a62e4010000b02901ecfdceb052mr24176262pfh.79.1614049101866; 
 Mon, 22 Feb 2021 18:58:21 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o20sm874032pjt.43.2021.02.22.18.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 18:58:21 -0800 (PST)
Date: Mon, 22 Feb 2021 18:58:21 -0800 (PST)
X-Google-Original-Date: Mon, 22 Feb 2021 18:39:01 PST (-0800)
Subject: Re: [PATCH] soc: canaan: Sort the Makefile alphabetically
In-Reply-To: <BL0PR04MB651408C561B5E4B6889F6841E7809@BL0PR04MB6514.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <mhng-987a3cd7-9d3e-4471-b47a-67aa97629e7b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_215824_410597_913309F6 
X-CRM114-Status: GOOD (  21.13  )
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
Cc: peng.fan@nxp.com, linux-kernel@vger.kernel.org, joel@jms.id.au,
 pczarnecki@internships.antmicro.com, linux-riscv@lists.infradead.org,
 leonard.crestez@nxp.com, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 22 Feb 2021 18:31:43 PST (-0800), Damien Le Moal wrote:
> On 2021/02/23 11:19, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> The rest of these are alphabetically sorted, and leaving it this way
> causes a merge conflict.
> 
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> ---
> 
> I missed this when reviewing these patches, but happened across it when
> test merging from Linus' tree.  It goes back a way so I'm hesitant to
> rebase this one out just for cleanliness, but if I have to go back that
> far before sending the merge window PR I'll squash it in.
> ---
>  drivers/soc/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index fa7071246546..34b23645be14 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -7,6 +7,7 @@ obj-$(CONFIG_ARCH_ACTIONS)	+= actions/
>  obj-y				+= aspeed/
>  obj-$(CONFIG_ARCH_AT91)		+= atmel/
>  obj-y				+= bcm/
> +obj-$(CONFIG_SOC_CANAAN)	+= canaan/
>  obj-$(CONFIG_ARCH_DOVE)		+= dove/
>  obj-$(CONFIG_MACH_DOVE)		+= dove/
>  obj-y				+= fsl/
> @@ -29,4 +30,3 @@ obj-$(CONFIG_ARCH_U8500)	+= ux500/
>  obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
>  obj-y				+= xilinx/
>  obj-$(CONFIG_ARCH_ZX)		+= zte/
> -obj-$(CONFIG_SOC_CANAAN)	+= canaan/
> 
>
> Yes. Should have sent that... Thanks.
>
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>

No problem, it's on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
