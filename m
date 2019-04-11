Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04DCC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 20:54:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56132146F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 20:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OZ596yCl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mje1Lb+n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A56132146F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zEPYb6zmwnZrtmvsiUT5iMk+Js+nBzpgeYtLPbJDcQI=; b=OZ596yClqrRE4q35K4wqma/XH
	JYcCpEh08JxPmDyq6NsJ2fuM/W9JTHoT7u/Ilvs2y3/nCEiAH4EwbSXoeD0QRLcGo7FxOhS2t251b
	ajvuRS1UlJGGhutDJoptQpxsDboDhuLB5n6R8XeC21JehiyofjMDZHUp8Zuk8G4rZc+YfRkakBkSm
	n+b1LuGicAT1USnY9bzT9BMhWwLAZTDWURQCBKW7ymlmis32/5WoduWtKMdlq1/4+3lsFCaxz1HmE
	DIMjRrI5hq5Io4CpLgMkLESrbcpzGomBQAfTy1EXmvXz/aZUjrvlFvszMQcdqlFWQQweuTMSn2ZEF
	5wAssha3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEgiX-00019K-K0; Thu, 11 Apr 2019 20:54:41 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEgiU-00018X-3Z
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 20:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1555016078; x=1586552078;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=troCto/qZB/5pL/VkvmQeeBE1EgQKWQq0zrrUTiDlgA=;
 b=mje1Lb+n3rhjJNXC1scHYYSIBGb2voPLWukV3SgoBCMi8enqhF09lVAA
 NOk7UpTcYimezOfNjAy5z8hUgVuQubIqVFf7nz/f9puRNT8JiT8j3+6dW
 mzG8DV4hP/VS4/OiZVCewsm0Trd12IREqiXxJNCBVBRYYZkn8+Sb75SQ3
 mAW3OWIOTikaC9J74ZGyzQ0CKFU6nTkPiDsWPzfRUK0IHiNKU9iOkbhdk
 UJXypehW4fh5Qa32+L2OFLkTdZWLCYqLPUlIZ88QoD9SqDWDskzG/aXGG
 0oTy5KkBfIYEYZfEg/NFZ/VC61K1V3vSzrbY9ytBjwM6L0sw4Wqae2hii g==;
X-IronPort-AV: E=Sophos;i="5.60,338,1549900800"; d="scan'208";a="211422584"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 12 Apr 2019 04:54:36 +0800
IronPort-SDR: 4AKajtS5ydTgUa+8by3u+Nqdx08BAELK6zUe2R4mOyDx0RrS3wAgdcrWrn2DGX4KL6UhlBaxpX
 b35cAq37TpCeTenJI6OhT/OjS5GdPrgic9qMTlU7znIyokpb90fmmlTM/ng7Hq4V3hXDVNbfal
 Xr7wvAgzpKZHJlVErHvQBNEn5GVv4ukeiveO1EhOS/ETT+8+3Yx98yvfyiC+6UKABhBWwGiwsX
 mQvtOLZhvOaA05Uv1dLM8iSMH51L2yKTZ5QXAJgLUNk8+NyJPQ473ZMvqtBeyE6VN2HvLrVCoi
 f9Ls3BOnGK3lqyIVY/VrW0dN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 11 Apr 2019 13:31:29 -0700
IronPort-SDR: EAkss+b4pbIOLdYOr8v4Z3fMC7cQT7FM/0SqNeAS/JhwG75DMRBgeDLYu1cEUmqo4jSmmb7gKU
 IBab1hvZzMcD8ff1WrLFZOjG2ThaAsUb2H7LbTzUZNV1m/4JusALijJWfFqdZk08C476Dx8ahg
 +VO/vMfhpFUZ4pY9ahK5zzv7eQc2E45IEpNjaaXhv54VPifjiqdRSgxzfNuBvuGB6IiyfUcR1r
 38Imn0XQut0deMzeFXF+oEYRyTmOKRzzZ/yvZpnbELDDkXj1Ts6gfpJBDjECy2L67lfsRRyO2v
 Y04=
Received: from usa001883.ad.shared (HELO [10.86.51.17]) ([10.86.51.17])
 by uls-op-cesaip01.wdc.com with ESMTP; 11 Apr 2019 13:54:36 -0700
Subject: Re: [PATCH 5/9] riscv: simplify stack pointer setup in head.S
To: Christoph Hellwig <hch@lst.de>, Palmer Dabbelt <palmer@sifive.com>
References: <20190411115623.5749-1-hch@lst.de>
 <20190411115623.5749-6-hch@lst.de>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <7f22e0c2-66d0-180f-0cdc-362be24a5aab@wdc.com>
Date: Thu, 11 Apr 2019 13:54:35 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190411115623.5749-6-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_135438_290695_1E0C7C02 
X-CRM114-Status: GOOD (  16.03  )
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
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/11/19 4:57 AM, Christoph Hellwig wrote:
> We don't need THREAD_SIZE in asm-offsets.c as we can just calculate
> the value of init_thread_union + THREAD_SIZE using cpp, just like
> we do a few lines above.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   arch/riscv/kernel/asm-offsets.c | 3 ---
>   arch/riscv/kernel/head.S        | 5 +----
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index dac98348c6a3..578bb5efc085 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -312,9 +312,6 @@ void asm_offsets(void)
>   		- offsetof(struct task_struct, thread.fstate.f[0])
>   	);
>   
> -	/* The assembler needs access to THREAD_SIZE as well. */
> -	DEFINE(ASM_THREAD_SIZE, THREAD_SIZE);
> -
>   	/*
>   	 * We allocate a pt_regs on the stack when entering the kernel.  This
>   	 * ensures the alignment is sane.
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fe884cd69abd..9344d9ceda24 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -68,10 +68,7 @@ clear_bss_done:
>   	/* Restore C environment */
>   	la tp, init_task
>   	sw zero, TASK_TI_CPU(tp)
> -
> -	la sp, init_thread_union
> -	li a0, ASM_THREAD_SIZE
> -	add sp, sp, a0
> +	la sp, init_thread_union + THREAD_SIZE
>   
>   	/* Start the kernel */
>   	mv a0, s0
> 
Reviewed-by: Atish Patra <atish.patra@wdc.com>

Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
