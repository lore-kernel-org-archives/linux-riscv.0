Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33320C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eh0Kawt5maMnLOWPkGH/vvxGBFxErUMQS2Xay7AQIFw=; b=tyjdN9P5M1pLkk
	cmfpU2JqHOw4c7xUuUR8l/gKANF7LRVBvz+JTkKS1Y/tCMb12CKczwLpWBqKyjiXLVukZp41eS98v
	1dP8lq6Aob4xtFL2AGkQLxoQlDtZtLOIa4DrHg4uUmKJaV4QHAEnvuZpPgUKerenrPFxN8of+GFBs
	lsvaHm7nDiZcBGk48GmyRVuFJPVm9Yy8aJFY45mfOhD9XLTDS8LjECeVMfib9mm3p9jO0wtYOywqj
	tPjAPg9H4DN1dLrQLgc5RZUxca/xnqTHUPWF3kwKtpNGA5z+cbdTyRreoFoAo1ceS2N3s4PziimJz
	XcTh/5imKFoIkCdPGQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8mJQ-001rN8-Bs; Tue, 05 Jul 2022 17:26:12 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8mJP-001rMX-5g; Tue, 05 Jul 2022 17:26:11 +0000
Date: Tue, 5 Jul 2022 10:26:11 -0700
From: Christoph Hellwig <hch@infradead.org>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [RFC PATCH 1/4] riscv: Optimize satp_mode data type
Message-ID: <YsR0M9ZyyUJxSpOk@infradead.org>
References: <20220705100523.1204595-1-guoren@kernel.org>
 <20220705100523.1204595-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220705100523.1204595-2-guoren@kernel.org>
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

On Tue, Jul 05, 2022 at 06:05:20AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Fixup satp_mode data type. Use ulong instead of u64 for rv32
> compatibility. Because the u64 type didn't cause any real problem, make
> it as optimized.

The changelog loooks odd, but given that CSR are Xlen sized this
is the right thing to do even without further justification.

> -extern u64 satp_mode;
> +extern ulong satp_mode;

.. but please spell out unsigned long.

>  #ifdef CONFIG_64BIT
> -u64 satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
> +ulong satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_57 : SATP_MODE_39;
>  #else
> -u64 satp_mode __ro_after_init = SATP_MODE_32;
> +ulong satp_mode __ro_after_init = SATP_MODE_32;
>  #endif

And maybe make this less of a mess while we're at it:

#ifdef CONFIG_32BIT
#define SATP_DEFAULT	SATP_MODE_32
#elif defined(CONFIG_XIP_KERNEL)
#define SATP_DEFAULT	SATP_MODE_39
#else
#define SATP_DEFAULT	SATP_MODE_57
#endif

unsigned long satp_mode __ro_after_init = SATP_DEFAULT;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
