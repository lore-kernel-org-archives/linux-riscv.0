Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F43EC87FC5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 07:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:Date:
	Message-Id:Cc:Mime-Version:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mUxCUVIyUPtElsF4SxuM1qNFBMyX2bQ8L2bl4ojz9w=; b=LZ5NAHR2YLVvhC
	HMLWmYq+4/wi8VddniZsE0ymYv0XDQWVbu2TOoOPkfgRp9xethSm/aYwZVcYWtMYxpF5fHTUDr/Yw
	w3q0tyqEYCfAak3O/uO+V8/kp8qzgAXvbsVjy6hiED/YjCNACtiN9xywjcv9RSj4xJ2aLotbyyiM9
	VIr/7ZERs5ECoT2SRCzwnojW8Ae5w8l3tnGaiU6NuZkdZAjuIwouGT4rzRKrcH8HyXQY/3mozQX5n
	a8kuFYxrsLNRF1R6jY4SUcupLfLbgqK5lxSrUHFTimnuCHLnspCqdLWBCxbP1fggZNLujYUbmpl3G
	paxfzaXEDEovEda8fcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlMC-0000000GZEg-43oX;
	Mon, 21 Jul 2025 07:54:44 +0000
Received: from sg-1-12.ptr.blmpb.com ([118.26.132.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udlK4-0000000GYnf-0Frd
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 07:52:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1753084336;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=iPv+sitKDBk+AkqJ/K8rYIXbyZ6KkpKpVwlxt13ZGCw=;
 b=V5FXtHiMAnfws8mMWpFs/k78FHEa3CiLXqsQDMWLAgyf++RVjq6p+03bXskDotQLhCQ6kQ
 RE0dOxFq4HK6RkPMb7gSdATJsfGLzHvnVUonnSVMvWE/HIknMGFYmixcd+gcow4bDK5yYV
 v6Pxc2VuelawTTLxITc0Xpz1Bx/UbAWge3k6HjJ7O4EmMROqzddFK03qF0epNxZaKR2obY
 Ruw3weJM17rCqwSX6ugSa8bt7PBDQoRNpZXiSyVEI6KMwJzgsJawDmoDCOPJlDtniVHqj0
 FK/SDPEe9grkOkIlvWyyzXRB2HjAi/PPRcIvAp7pB87UbGk7bhYO1SusZs1xNQ==
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
To: "Chunyan Zhang" <zhangchunyan@iscas.ac.cn>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Charlie Jenkins" <charlie@rivosinc.com>, "Song Liu" <song@kernel.org>, 
	"Yu Kuai" <yukuai3@huawei.com>
Mime-Version: 1.0
Content-Language: en-US
X-Lms-Return-Path: <lba+2687df1ae+9364fb+lists.infradead.org+liujingqi@lanxincomputing.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-raid@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, "Chunyan Zhang" <zhang.lyra@gmail.com>
Message-Id: <5c879527-221e-45df-86ea-b564ee49c473@lanxincomputing.com>
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Mon, 21 Jul 2025 15:52:13 +0800
Date: Mon, 21 Jul 2025 15:52:11 +0800
In-Reply-To: <20250711100930.3398336-2-zhangchunyan@iscas.ac.cn>
User-Agent: Mozilla Thunderbird
References: <20250711100930.3398336-1-zhangchunyan@iscas.ac.cn> <20250711100930.3398336-2-zhangchunyan@iscas.ac.cn>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Subject: Re: [PATCH V2 1/5] raid6: riscv: Clean up unused header file inclusion
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_005232_288461_07B33FD2 
X-CRM114-Status: UNSURE (   8.64  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 7/11/2025 6:09 PM, Chunyan Zhang wrote:
> These two C files don't reference things defined in simd.h or types.h
> so remove these redundant #inclusions.
>
> Fixes: 6093faaf9593 ("raid6: Add RISC-V SIMD syndrome and recovery calculations")
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>   lib/raid6/recov_rvv.c | 2 --
>   lib/raid6/rvv.c       | 3 ---
>   2 files changed, 5 deletions(-)

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty
> diff --git a/lib/raid6/recov_rvv.c b/lib/raid6/recov_rvv.c
> index f29303795ccf..500da521a806 100644
> --- a/lib/raid6/recov_rvv.c
> +++ b/lib/raid6/recov_rvv.c
> @@ -4,9 +4,7 @@
>    * Author: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
>    */
>   
> -#include <asm/simd.h>
>   #include <asm/vector.h>
> -#include <crypto/internal/simd.h>
>   #include <linux/raid/pq.h>
>   
>   static int rvv_has_vector(void)
> diff --git a/lib/raid6/rvv.c b/lib/raid6/rvv.c
> index 7d82efa5b14f..b193ea176d5d 100644
> --- a/lib/raid6/rvv.c
> +++ b/lib/raid6/rvv.c
> @@ -9,11 +9,8 @@
>    *	Copyright 2002-2004 H. Peter Anvin
>    */
>   
> -#include <asm/simd.h>
>   #include <asm/vector.h>
> -#include <crypto/internal/simd.h>
>   #include <linux/raid/pq.h>
> -#include <linux/types.h>
>   #include "rvv.h"
>   
>   #define NSIZE	(riscv_v_vsize / 32) /* NSIZE = vlenb */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
