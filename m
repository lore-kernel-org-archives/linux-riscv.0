Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECC8C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:55:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D5D2064C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 17:55:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Se+nEZpB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ALmFqLJm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8D5D2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=TfUauZBIzsz+FzxnS02QYVciEZ+d1wzVBN/ie6NsB58=; b=Se+nEZpBK1cVswhxrmhMZIv8h
	jXedX+QDBb62GAvyc3pe5v4rj1xsiMrvIN4grJ+cKQtRRBeTc/bZpgviBs/vXknJzZiO6fgM21Vpk
	t1YkhTKerALlrUbxIh3Bq6CBkVcZqeIYSKZo0RAZa+/NA4zd+C2EjEgyJl/zt5ud4ORcs+UFpxR4B
	K290d/XkgDx1LsaLKHpVCfbujQReHIvZV3N9zvT/YrvfaLn5vqCodZ47Agt233fURi+yRgGBiS7Yo
	yLcM3bTPE6H3DoXvUQIyDngMrDFIGFaDNE53b8rYsHYfnWPZ6jxeO9dNAn4k2fQp8BjTws15Rm0CI
	26j1BLk9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIHBO-0006Rt-IH; Thu, 01 Nov 2018 17:55:02 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIHBL-0006LD-GU
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 17:55:00 +0000
Received: by mail-pl1-x644.google.com with SMTP id x6-v6so9310373pln.0
 for <linux-riscv@lists.infradead.org>; Thu, 01 Nov 2018 10:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=xfaHN79ex2Wr+Aa6snj5pZBSVlURtG42kIKXYmk9NYc=;
 b=ALmFqLJm9tUCTwEpu+w3HkgzbBXM6eOlXVSK6UnGRkwgwFCUfssCMly/4D8vRNvbKm
 S8mo7sP93+DRtceMw5b+Y/mGnCAyVkpen5PDBZxar7l7TW9DeyD6vAPgad8wshumuxzZ
 BhOIyxl76f88Z2KbvcbiWZQ+ao+bIN89HY1HufyfrVR1+eWn+1Hj1O8yf8FQHo6rkbd1
 7P9nuziE99L9sxB25XD3mR/CNh+DKngU4d6RlTjBIvKOF/0GCPsBgQD/KMJejaNWCp0N
 BvEoc/bAbagYT3AzNWRc0KVK17iUcHbRTJT3hCU3a2wZnaV/e8HH9oaGeyrxrxw5WCaS
 hlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=xfaHN79ex2Wr+Aa6snj5pZBSVlURtG42kIKXYmk9NYc=;
 b=BDJeG712vDD/irtYopprjF7cQ8ok/EbjHvnh1lfKgoiECfExAoaM94uVmr2J6kvxvC
 FSwF0mII/I+zxCN8qkkJaap9gNZMfhM+WX799NrW2nw6Ts17xIqwIF8HqFN/ISO77NE8
 ShHtw+PiyeajygmU3wn/66lqvIspcqrVggc+MNFlIdC0+7aRiaJ9rMLufYBMScVM7j7H
 EbW7sAiKvD17tq2+VE0h5KsWmmEvQOLTaOR+V/XQCZoYrp1UGK5fX0EucDGfYW3DQLFt
 tyszZF68HPOMobNm49ZTX3EVmwSgUNntRv5JqtJg5igmoJBFJx8FrJ49pB9BSKUqYJg4
 xt0w==
X-Gm-Message-State: AGRZ1gIrdmaNOgBCwmGz6z5Mxb2Y72GWWAKtk4XRDjV8NgL6L6s4evKP
 BvdXSYkTArhUmC6wfnHH/yrPZQ==
X-Google-Smtp-Source: AJdET5eE/znqCSQRZmJHzFeLG/xzBozxNF1yLJbPKGzIZSnzV0P90ZpHrRLSe+sYE64sksuYWjrcdA==
X-Received: by 2002:a17:902:7045:: with SMTP id
 h5-v6mr8514883plt.211.1541094888775; 
 Thu, 01 Nov 2018 10:54:48 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id g3-v6sm9245166pgr.40.2018.11.01.10.54.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Nov 2018 10:54:47 -0700 (PDT)
Date: Thu, 01 Nov 2018 10:54:47 -0700 (PDT)
X-Google-Original-Date: Thu, 01 Nov 2018 10:54:29 PDT (-0700)
Subject: Re: [PATCH v2 2/2] RISC-V: defconfig: Enable printk timestamps
In-Reply-To: <20181101051033.10089-2-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-f1ed976f-ca28-42af-bdb2-ee53e4585c2a@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_105459_547082_75F2C92A 
X-CRM114-Status: GOOD (  17.38  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 Olof Johansson <olof@lixom.net>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101175447.hhHPLVLGqaZo1AS5ZaLHlWPPSL0X36frbRPkL2bcC-U@z>

On Wed, 31 Oct 2018 22:10:33 PDT (-0700), anup@brainfault.org wrote:
> The printk timestamps are very useful information to visually see
> where kernel is spending time during boot. It also helps us see
> the timing of hotplug events at runtime.
>
> This patch enables printk timestamps in RISC-V defconfig so that
> we have it enabled by default (similar to other architectures
> such as x86_64, arm64, etc).
>
> Signed-off-by: Anup Patel <anup@brainfault.org>
> Acked-by: Olof Johansson <olof@lixom.net>
> ---
>  arch/riscv/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 07fa9ea75fea..ef4f15df9adf 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -76,4 +76,5 @@ CONFIG_NFS_V4_1=y
>  CONFIG_NFS_V4_2=y
>  CONFIG_ROOT_NFS=y
>  CONFIG_CRYPTO_USER_API_HASH=y
> +CONFIG_PRINTK_TIME=y
>  # CONFIG_RCU_TRACE is not set

Thanks.  Since this is a functional change I'm not going to rush it in, but I 
think it's OK to go in after rc1 so I'll include it as part of my 
regularly-scheduled PR next week.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
