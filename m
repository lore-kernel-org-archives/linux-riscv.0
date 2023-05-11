Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D17C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 00:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Oh7TDEMvmu7JwUq//gmB6v8lYXLxfxrfmErYG574zt4=; b=G4ibMpJax5BmxvMRWRGB3Wkt5o
	lzWPwUcgdnxZ5ZE+u2cG42cX7B1eDvGu2xOaGLAYdrcV/QAV3wGdKOZjPQU+BkLgJt9DEYjmPOEIT
	ejmi6UsxonGO02nwKZAv4W3u189ZutYffjBbP8acxlAax/nMsMLdw+9+AAtwajUdBPSZVwM7zoT6r
	U2A3sVxAQqxZZacUEwzdJt+IuosndhVsOfYxFIuU9TLq8HSUwu/7qF+LwRhFVFG8qMVIfjGL/oMVw
	uelT3RrpPoA/RNDPePJmYZvrmxXDJAZWWSCOUYkGotks7Qqffh3XUbTMv06bYHwasTXl2DyNSGAD7
	qwSmiRlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxGDk-00AQXz-20;
	Fri, 12 May 2023 00:01:16 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxFDF-00AGcr-2r
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 22:56:43 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-24e3a0aa408so8062191a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 15:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683845800; x=1686437800;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GoA6b8k+Exd0U0ufbFopUW0n38kOGMTp9KHmkpW9dzI=;
        b=qrg+w43mXU7clXsw1JU/BRCuLPbsg/FmCcLLiKaJVXDkIYdbMcekVSuDyuLYmDnahG
         aoWFJM7XOuhCoL9Kza4Skgt5TvkioLRCHrWGmsJCBNtkgcaENQ9GsdXaDIdqZiLAeLwE
         8JYpHLXpk4TWQwX1qm+LWGUBkDEIkP/kETgzugtuynF+gpW9D2+BBdXIyyt1tMFH8/4e
         WS5N63t3Uod0yqRKPBD/syA2QiwdQ7vcJptcBKfpkSaiBzoPuheeITqblh0BTHLzfsGw
         rdVmkark3KbyPr0v7lnaeGWa6/jgYm23chkJYafV74+GfOgZx1cgoDYz/y+qowq1DKEH
         fCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683845800; x=1686437800;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GoA6b8k+Exd0U0ufbFopUW0n38kOGMTp9KHmkpW9dzI=;
        b=gbXtFKedvz1f8qlU0vZ4qhY1oaV9NNeVm9zOa3grAu+KO4LJrpMs4UEguTou+/cZno
         eKtko1zEBnEgsOikw39ODqGImd5i5dZtnH+ZlfrDVAsesGAh2ptAWt9JggUu7PDTr5aA
         TEsMZbhz+Z2XDEBcFL3lfnt1xgYwfRVERhHqfeCpElWte/+ygMQAQS+QgdUBFIbswZ+t
         b8hAhpKC0PGZbIPpZkrOdqrs4lnzwSOJX2ipJYweUx4IFXLy2fY7A+J0xUuvWAyGmsw5
         OFbfarqfwVsjeydcTiL5vrjpjPGXoo3TwfX2636dcRsof8gWE9tTBOCGI0AhaL6l21uS
         1ITA==
X-Gm-Message-State: AC+VfDz4izd6HrH9FKZynwMseiYbGszEb1tSFo8X2X+kck9EdBeO2A0t
	P5gCoaOW0CWpidiu/Ep2FiCH7DKT43qYUyIdnGr8AA==
X-Google-Smtp-Source: ACHHUZ5OGGMA5JrZRcx4jC9eIvp8g6pxmJp1IrLfjtc8RKi7zlEHsQENCKnr0SrmKfxQMxxPtiUtlQ==
X-Received: by 2002:a17:903:48e:b0:1a9:baa4:8675 with SMTP id jj14-20020a170903048e00b001a9baa48675mr24340818plb.1.1683845800333;
        Thu, 11 May 2023 15:56:40 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001ac8cd5ecd6sm6457482plb.65.2023.05.11.15.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 15:56:39 -0700 (PDT)
Date: Thu, 11 May 2023 15:56:39 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 15:48:04 PDT (-0700)
Subject: Re: [PATCH -next v19 06/24] riscv: Disable Vector Instructions for kernel itself
In-Reply-To: <20230509103033.11285-7-andy.chiu@sifive.com>
CC: linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org,
  kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, Vineet Gupta <vineetg@rivosinc.com>,
  greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com, hankuan.chen@sifive.com,
  andy.chiu@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  guoren@kernel.org, nsaenzju@redhat.com, jszhang@kernel.org, Bjorn Topel <bjorn@rivosinc.com>,
  frederic@kernel.org, abrestic@rivosinc.com, heiko.stuebner@vrull.eu, alex@ghiti.fr,
  masahiroy@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: andy.chiu@sifive.com
Message-ID: <mhng-6d02bea7-ef2c-4840-96e3-912bfac4ffc4@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_155641_923451_F752E06C 
X-CRM114-Status: GOOD (  19.24  )
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

On Tue, 09 May 2023 03:30:15 PDT (-0700), andy.chiu@sifive.com wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Disable vector instructions execution for kernel mode at its entrances.
> This helps find illegal uses of vector in the kernel space, which is
> similar to the fpu.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Co-developed-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Signed-off-by: Han-Kuan Chen <hankuan.chen@sifive.com>
> Co-developed-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Vineet Gupta <vineetg@rivosinc.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
> Changelog V19:
>  - Add description in commit msg (Heiko's suggestion on v17)
>
>  arch/riscv/kernel/entry.S |  6 +++---
>  arch/riscv/kernel/head.S  | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 3fbb100bc9e4..e9ae284a55c1 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -48,10 +48,10 @@ _save_context:
>  	 * Disable user-mode memory access as it should only be set in the
>  	 * actual user copy routines.
>  	 *
> -	 * Disable the FPU to detect illegal usage of floating point in kernel
> -	 * space.
> +	 * Disable the FPU/Vector to detect illegal usage of floating point
> +	 * or vector in kernel space.
>  	 */
> -	li t0, SR_SUM | SR_FS
> +	li t0, SR_SUM | SR_FS_VS
>
>  	REG_L s0, TASK_TI_USER_SP(tp)
>  	csrrc s1, CSR_STATUS, t0
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 3fd6a4bd9c3e..e16bb2185d55 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -140,10 +140,10 @@ secondary_start_sbi:
>  	.option pop
>
>  	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>  	 */
> -	li t0, SR_FS
> +	li t0, SR_FS_VS
>  	csrc CSR_STATUS, t0
>
>  	/* Set trap vector to spin forever to help debug */
> @@ -234,10 +234,10 @@ pmp_done:
>  .option pop
>
>  	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>  	 */
> -	li t0, SR_FS
> +	li t0, SR_FS_VS
>  	csrc CSR_STATUS, t0
>
>  #ifdef CONFIG_RISCV_BOOT_SPINWAIT

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
