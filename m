Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4EFC433E9
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:20:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAFB64F38
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 02:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFAFB64F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=PLepE6qfxi8Brlk08VqZVTFr6YXA0Zslr+a+o695Oi0=; b=F083WVR3zDjSmI/3QNrjoETuJ
	ZKhYHsYS9BQ+OL9xxzD4Gy5fIcJrllIbpDCmc5SOKtboP8uLOLsK/eAHf/24fhEwViVuPbgESLzds
	V4SbzRcQ4mp2LymHJh+gL4L9YWjakPEQ0gs22Khq87jQlOp48eJ4ZH1EHFyEgn7qf9Wo6UqEIWcoZ
	0xAQ422fEaeRaMJvQdXJkJUpcueWFbg/fCyIag/JEBGkfxsDdRquK8BHgbn4Tmih9RvzfIppUP8Pf
	W8mNCCW9zRigrCSimObxmpTBpB8lRTDpWGXlvmzv5sMjQ8mZaX3FivZp1ZlzhqfixDJo6+of1cUQN
	WzWYIH04Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJoSB-005nXh-AF; Wed, 10 Mar 2021 02:20:03 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJoS1-005nVi-ES
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 02:19:57 +0000
Received: by mail-pf1-x432.google.com with SMTP id y67so11057496pfb.2
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 18:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=1crlK9qHvxllksE4kmx4P7wHqeyxUPTAXZhajPCUZng=;
 b=WizKgkH5m/ah6CAgDuLLlcv+z+4V7ZVGOA5CpMz2hEu8UzwcQ21FQ7/JGZmkEEPV/n
 cyBS5K0YFQS1wBnml0tDpTosw6IWX6JLgtsNiUAf31QC2P7/zLXREgalfLiEeH/fprye
 wwzRByiQA3K6dI6pr+NXNggYuaCcTW2jZMDWiEte88ih7BLVFBbj7xP+n9/yzls1stdE
 BN/qP5gZJlsOvTJ2IeslNPOf79RdC/bAaVFaxqwZ03TjarhYhyUrhQb4a+uLCDt2ptiK
 y3MClNcC5f3R52G6nYYujaByfhYJIqRmkwAxv2Jp1YwDTukJaTQbU5nB7NNB60Wsqy8H
 UL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=1crlK9qHvxllksE4kmx4P7wHqeyxUPTAXZhajPCUZng=;
 b=V0H8vbDrOiY9SPUPNH6mIzXM9AE9kH5LTl6olcKrwVsUaAI2rFL5Xbve01m7olM6z+
 mX0z8YicLrnZDBdjceAdhV2xcMUJkdcWBUhQ+gUm+x8tO31tMsR62Amol3jD8NVoEV9s
 olIkFiynBXOW7WPwBFuw3a8YRPgY1rtEDpmfdEa5EWi7NQ/3/98Q6X96qlx4Yqm1wExF
 Og6BcTr1RydbrKy8+pPvZvFUT0tnANOLtEA/sTHGb2VL80nFVM6J+p5k27Jh4SduzCNI
 W7//XA6ptSpL1e0+6ri9wIJIwOquSmJUQujFypQ3PeFc/eIejkpu8kE1WpnxVg0xcog0
 SBFg==
X-Gm-Message-State: AOAM533czWYTLFRKdvPxp8OVWzmg7Ip07h8Nrbatz5/kjUwhWb0UOssI
 D+WG++pu0uxvwLmkpsDQw1jAYrrX2dyN7Q==
X-Google-Smtp-Source: ABdhPJwZPOwky/gDO7ZTXms9cfOX0Mu39wOaELUwpQb4fd1ruYq2Gbw+D0hG2yOUX64Q7TbDXGok1Q==
X-Received: by 2002:a62:1ad5:0:b029:1fa:c667:2776 with SMTP id
 a204-20020a621ad50000b02901fac6672776mr921426pfa.6.1615342789997; 
 Tue, 09 Mar 2021 18:19:49 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x14sm14856637pfm.207.2021.03.09.18.19.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 18:19:48 -0800 (PST)
Date: Tue, 09 Mar 2021 18:19:48 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 18:18:36 PST (-0800)
Subject: Re: [PATCH next] riscv: Add ARCH_HAS_FORTIFY_SOURCE
In-Reply-To: <20210225070303.90530-1-wangkefeng.wang@huawei.com>
CC: linux-riscv@lists.infradead.org, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-fd999bbb-8271-480a-88b0-8af158d5214a@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_021955_547029_050FA9F1 
X-CRM114-Status: GOOD (  20.56  )
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

On Wed, 24 Feb 2021 23:03:03 PST (-0800), wangkefeng.wang@huawei.com wrote:
> FORTIFY_SOURCE could detect various overflows at compile and run time.
> ARCH_HAS_FORTIFY_SOURCE means that the architecture can be built and
> run with CONFIG_FORTIFY_SOURCE. Select it in RISCV.
>
> See more about this feature from commit 6974f0c4555e
> ("include/linux/string.h: add the option of fortified string.h functions").
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/Kconfig              | 1 +
>  arch/riscv/include/asm/string.h | 5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 53e66347366f..fa30fbf66879 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -20,6 +20,7 @@ config RISCV
>  	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_WX
> +	select ARCH_HAS_FORTIFY_SOURCE
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index 5477e7ecb6e1..909049366555 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -23,5 +23,10 @@ extern asmlinkage void *__memmove(void *, const void *, size_t);
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
>  #define memset(s, c, n) __memset(s, c, n)
>  #define memmove(dst, src, len) __memmove(dst, src, len)
> +
> +#ifndef __NO_FORTIFY
> +#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
> +#endif
> +
>  #endif
>  #endif /* _ASM_RISCV_STRING_H */

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
