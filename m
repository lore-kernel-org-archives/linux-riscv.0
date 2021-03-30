Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D388C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 06:20:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9DB061957
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 06:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9DB061957
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=6Wef+YnSXt8y5pEpM2M0JTc2PyhKQenAGrtVfI1i0BQ=; b=XVf9pdqlMEo3wElPe6cSLcbfn
	XnHnKKoVqPxJ4X5Mywor7inqUEuANi2QcK5qiudw2mdEaZJyXFglqrgs3w/P6VM7incwkRzvh7qbv
	hWU2vw+593VBTynl9VsH1QLwO+mmk/sOo63a0anJsXGCVyt/ynV4vRCe2CFQKpc732iqUKrdb7bhk
	J6JONqetYWr+Wv/CWv2t4CjQDEnz6pY2mMn2pzzgzbYOwlxPbzZ5bPFAsTo4sUCeGElj+bRGOyt7E
	NWWAeW0DgJaNG+z4kroOm17V4J6uaoVZbVAWxa1/6ogPRdJOHTCmFxJs9S9HipcbYoUaBCNc+xHj1
	Zi+IgnrvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7j1-002pFE-KD; Tue, 30 Mar 2021 06:19:39 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7im-002pDu-2s
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 06:19:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id o2so5608928plg.1
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 23:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Wntns3ARiXICiDfUR6aRU71JIRxADrA3zKs3aGI5BBM=;
 b=efEB3t5k3IG2v7+qm3KM7GePq74NecKE3GfGVw9Bhr0XtS0JIx1vPcbXzIvLS47846
 qwPHetgSOUwC6CaCZxQl+sPhNWulA1c53gISFw+L0aBrZc4HLGhA9s/YXnJRz8mClvX6
 OQVx8gLgrpybX4WIPfESHitRETDX12b53nvsNILif8jlVWNBiec8pv3Mx45hXGXl0feH
 laAxvU5SXPDDVkiUB8c4r9s12EDLH85pbgClK/D9uIvqj97bNRLK2YNgl1jCgQHBsE5J
 RDgFVX4k4AGAyyxgzeLf4UWeVP/nSFvMuLy8BF5Ty1RodbcndUyDGeI5GlUWXmDKXVxx
 YGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Wntns3ARiXICiDfUR6aRU71JIRxADrA3zKs3aGI5BBM=;
 b=TC6+eaHMfoO3bvg2YA7xRdBG0PRA7+9HtwzuYRKUWtCzwZdJtJHsPGIaLogJ7M8Fw+
 w6g94nwrho11PYDPrd9MWvtPvTWJ+QbNobz6Sq65whfGCXyH7IBauARgpaNUjqtnYaRX
 Oy5c7D9/S6gsXKrak0HfhCZiZWGiAGTaOX7Epoq5AkUGJ+Sx+W9Zc8obvu1KDehAR8qy
 W0jWIFni4yMJ+VGUJIKfGift5v7n1ScrNtbs3HzyDOzyTUoIaxVHte2fZVN9+1diQghg
 /Y5VANqsxsbrKWTPQMt45Mz3s6+ro7qbxoIGineRxAstpa/lni41MP3i+ykPU16eCI7X
 mWNw==
X-Gm-Message-State: AOAM533edXsc7HXcsCSVo6AeneFcxJlpeImwCRXwAEtPF+AvYfE9lgaU
 +fo3TMZ8rxFqOlUHqk8sCjCs3w==
X-Google-Smtp-Source: ABdhPJyaqyX4B5bJqmEI0fiz+XDTFousPYZKlhj+LGM0gL7a8gawlvGvUw4nbZ7DULYoj7fsyMICxQ==
X-Received: by 2002:a17:902:9b8b:b029:e6:b027:2f96 with SMTP id
 y11-20020a1709029b8bb02900e6b0272f96mr33264341plp.28.1617085162278; 
 Mon, 29 Mar 2021 23:19:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q25sm18713746pfh.34.2021.03.29.23.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 23:19:21 -0700 (PDT)
Date: Mon, 29 Mar 2021 23:19:21 -0700 (PDT)
X-Google-Original-Date: Mon, 29 Mar 2021 23:19:20 PDT (-0700)
Subject: Re: [PATCH] riscv: remove unneeded semicolon
In-Reply-To: <1616402316-19705-1-git-send-email-yang.lee@linux.alibaba.com>
CC: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, 
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, yang.lee@linux.alibaba.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: yang.lee@linux.alibaba.com
Message-ID: <mhng-f2509677-edc1-4e9b-b718-74ba0b9484fe@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_071924_589149_66933FEC 
X-CRM114-Status: GOOD (  16.64  )
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

On Mon, 22 Mar 2021 01:38:36 PDT (-0700), yang.lee@linux.alibaba.com wrote:
> Eliminate the following coccicheck warning:
> ./arch/riscv/mm/kasan_init.c:219:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  arch/riscv/mm/kasan_init.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index 4f85c6d..937d13c 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -216,7 +216,7 @@ void __init kasan_init(void)
>  			break;
>
>  		kasan_populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
> -	};
> +	}
>
>  	for (i = 0; i < PTRS_PER_PTE; i++)
>  		set_pte(&kasan_early_shadow_pte[i],

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
