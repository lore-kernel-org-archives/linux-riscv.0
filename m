Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A2D0C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 04:32:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9A2D6108B
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 04:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9A2D6108B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yiSIXJS0Z5KyCReGWY6OsvBOjcxUzGt3aVWk8FN7sGw=; b=SAp8OIbvVMhRULK/I4vs4nz037
	fTnxicOhkkhcFHf3gLfzvt0hv4k9hRqd8Vh38tlwgm286UDr+EzpwLpGdtxv65nCwP8qe0P7sYnfP
	rcuGCtsoOHl5YiwtEW4XHGNvmSD5VkH4XHQHPSqHSW+tPu2jrYPdp6sDPcjsAw3GEPP6h+8y3yTig
	dcH6EubhJQaqI8eFiN7SvJ457KcPyjO/pROKYjq4rNxPu4nwXEoEtWJEZ8FMu2tXKtIk9HZE3Y4hY
	1eTv76JPcSBFbducuRcfWDYT3vIjIo7HbvCF2MCrDPE+irS2RnbXDE2TWrZ3Ly8MpBwmiqB24D313
	iFHNPA3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGwCO-00A4us-PE; Fri, 20 Aug 2021 04:32:08 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGwCC-00A4uJ-Pq
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 04:31:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id 18so7535163pfh.9
 for <linux-riscv@lists.infradead.org>; Thu, 19 Aug 2021 21:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=kGUsXVjhYVNqqDUplUqGfaMv9a3sMzZvTTWSgXAKeoA=;
 b=vysr45wmx6bUrXF0N/a2X2lB6TLNMruSRTGPFJV/qeHb/7wLiD/NnDnckqkgw8ag9L
 er9i67FuRz37SrgS4x3Lc6pdZrdH6z3JyJ2tUzuAKZWCUDu86DUbWD8T9InE30hGWdpv
 LmSavBQepWO20MenUktfU5N5htBdN6E4djZP1D/qLSbhv3Tm9Mu1EvOWQIA9lQwpgO8v
 GCDumNLUm3X+kL5kEMatRRPkcEze+KkBDVtXpuU4S/ZFkUwflpQZFA06ZeYYS3usefSh
 SpAljBrSt7Qjo7XRH9XzSX/CcNzq4dsKDwR16DEY/EF/n3oypdljgFnoLtyQA6jp4OCH
 6CYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=kGUsXVjhYVNqqDUplUqGfaMv9a3sMzZvTTWSgXAKeoA=;
 b=gwvE55KSEkfkIMiLyoq0Hu4ekq9A1gZL2NHm9P0GQymo0pepM/4tUWrOSCvPF/eJGa
 rf1PYdOUqS/OWzfvB1tuGIZ2JyoVi2dqb9Dk8bDKwXEz9NMqM7kVcyT1kQ6sh9Brn0he
 plu9i/opFhBKMsK1OGNQ2OhgWqI6aSRCu32+b5NUF8mb2fZAxlLUgxRzZMDA420LxYhL
 b7zVrGPHZy8jP9DwkQC+Vqlyr4zeNcqhpjF+iOYrrjyAbe6p1Vz3EnjQtPCCHR+9Ft8R
 Bz0zrA7a263jWFLU85DJrRcmTnvwz0O6iepKUNtvkUXXpjq7IUDGFSE+jMBQBm/wid+1
 EbCA==
X-Gm-Message-State: AOAM530batIuI4YzCBx51y5IjQUV5Pd/USAsf/T4RMtdBEWHB8ZHJFHE
 ANh96XJwqdMd/KTjqIvlisWBvw==
X-Google-Smtp-Source: ABdhPJyS1DqIzxR93iVwZIP2G0nZomzW8c6Lq4fpfYaMPWsqFpt79VvtUo0LKUPICC7P9n/ka3YrGw==
X-Received: by 2002:a63:4005:: with SMTP id n5mr16785065pga.140.1629433914057; 
 Thu, 19 Aug 2021 21:31:54 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a8sm5131173pfo.79.2021.08.19.21.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 21:31:53 -0700 (PDT)
Date: Thu, 19 Aug 2021 21:31:53 -0700 (PDT)
X-Google-Original-Date: Thu, 19 Aug 2021 20:55:39 PDT (-0700)
Subject: Re: [PATCH] dt-bindings: sifive-l2-cache: Fix 'select' matching
In-Reply-To: <20210817174755.541735-1-robh@kernel.org>
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 sagar.kadam@sifive.com, yash.shah@sifive.com, 
 linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: robh@kernel.org
Message-ID: <mhng-25484677-27e9-4456-b497-0c7bd00bab18@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_213156_886898_58CAD025 
X-CRM114-Status: GOOD (  18.40  )
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

On Tue, 17 Aug 2021 10:47:55 PDT (-0700), robh@kernel.org wrote:
> When the schema fixups are applied to 'select' the result is a single
> entry is required for a match, but that will never match as there should
> be 2 entries. Also, a 'select' schema should have the widest possible
> match, so use 'contains' which matches the compatible string(s) in any
> position and not just the first position.
>
> Fixes: 993dcfac64eb ("dt-bindings: riscv: sifive-l2-cache: convert bindings to json-schema")
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: Sagar Kadam <sagar.kadam@sifive.com>
> Cc: Yash Shah <yash.shah@sifive.com>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/riscv/sifive-l2-cache.yaml        | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> index 1d38ff76d18f..2b1f91603897 100644
> --- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> +++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
> @@ -24,10 +24,10 @@ allOf:
>  select:
>    properties:
>      compatible:
> -      items:
> -        - enum:
> -            - sifive,fu540-c000-ccache
> -            - sifive,fu740-c000-ccache
> +      contains:
> +        enum:
> +          - sifive,fu540-c000-ccache
> +          - sifive,fu740-c000-ccache
>
>    required:
>      - compatible

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
