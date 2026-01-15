Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58639D3CCA0
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 02:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jnR9JOhUb9Z6k0vjTb7WW46DPxSsa6IAI1Utd3NXlTU=; b=iOA3M/MKV5WUvR
	mXbEa1/3g0r6DTuBtt0hPQG2+ntJam+7fRTp6/15uny9PRP1jhnGQYrzMK1aph7IBqOJ9drELzRx5
	5n0bwIyzYIrYjivIaxtC1jDpudnvLyHERY+ubYtBfSiiahdze/YpyD8p+sqcQOA/TFcU7ssqadbo1
	bDB0q6x3kxcAsFIw7BFyuR8tFf6abRRV/wGCO/fNgEVHvQhRhw3hVw0fiBG3NoyegA0oJXDSo1hOF
	dnSpG0mhdxBHojO6NKrr4ZZrwCMZqlmZVV2iHpFgQJ+YCLcnU4mx6EMIr3NcLffgTfWOMkE24az5r
	iS76txCfKFtnXtWk8YxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgChq-0000000BUME-1uM0;
	Thu, 15 Jan 2026 02:03:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgChm-0000000BULg-3K9I
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 02:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA50B6012B;
	Thu, 15 Jan 2026 02:03:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69DFC4CEF7;
	Thu, 15 Jan 2026 02:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768442600;
	bh=O7klGUKze+JmEoVWfPW64zehXyQ9vx/NEeQSIvzysoo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jSCSXaUWHa4wn6LLzvefUJ/dDd3nhwq7Dm1CTj97CClkvihy4hZ6tg/zFiCeGg5Se
	 Qqlaq1MHlOyAWgvS3Kh4vnJcJ14JKHInzdpdQ6MWXstaTTbUQM3Yk7RnWL3vLYHXil
	 kGDXatKy4yxMzCkw0/TkbDocXEI0qC3CA7nFYjW2NNUD/mjQJACekmv2di7Hz//apK
	 8A+o+POj1XQoOaqKmECpdydI0wZ0oPZwf6KFLLaQSeR3mWSddgGhyHiCzXwixnE5uG
	 4WXj+ZN5o/NDHIoCZrPu2L/79b4j10kwWjBsTg1+031Reb7bUpbgfGpsQjQVYOj0BF
	 /71iiDlpFOIBQ==
Date: Wed, 14 Jan 2026 19:03:17 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Feng Jiang <jiangfeng@kylinos.cn>
cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
    samuel.holland@sifive.com, charlie@rivosinc.com, 
    conor.dooley@microchip.com, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: lib: optimize strlen loop efficiency
In-Reply-To: <20251218032614.57356-1-jiangfeng@kylinos.cn>
Message-ID: <d356705a-843c-06dc-38a3-77eae7d2ef59@kernel.org>
References: <20251218032614.57356-1-jiangfeng@kylinos.cn>
MIME-Version: 1.0
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

On Thu, 18 Dec 2025, Feng Jiang wrote:

> Optimize the generic strlen implementation by using a pre-decrement
> pointer. This reduces the loop body from 4 instructions to 3 and
> eliminates the unconditional jump ('j').
> 
> Old loop (4 instructions, 2 branches):
>   1: lbu t0, 0(t1); beqz t0, 2f; addi t1, t1, 1; j 1b
> 
> New loop (3 instructions, 1 branch):
>   1: addi t1, t1, 1; lbu t0, 0(t1); bnez t0, 1b
> 
> This change improves execution efficiency and reduces branch pressure
> for systems without the Zbb extension.

Looks reasonable; do you have any benchmarks on hardware that you can 
share?  Any reason why this patch stands alone and isn't rolled up as part 
of your "optimize string function" series?


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
