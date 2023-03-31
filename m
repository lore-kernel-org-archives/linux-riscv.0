Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CB6C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVLvkzS0JbEJdRGjmHXrbbZklgLm/N97k3hzxxViJhc=; b=p9MztIYph0427Y
	DJvn/ZlqqVqxOqak35nepNgEd43TcDbkfeSbxhxUcvucKniIZkcWjMwr3f4XyGERMoyI+n7QggM4r
	ihPPnIdhM4//hFeK9Fr4UOVuhV8Qad1pJuvJpOe2UwCEhGv7RPIPfFEczOKX5ZddnQ4BhhbKUcWgm
	u7zP64ctebIUJhAq8X63dce/26tCB+2E84zdpichChzOUyKEyUzj7/yaPI8nX2JWAauEXZWtoJBce
	SM96w9XZ9GK40cEuzPPLojYpG1LtTRVYR+FIF1BtDOJsxJ8S9qcHf/pKHqpm/8N9vowivA0IG5gGW
	20GlCtxIVUuqqe2kjU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCQf-0070iz-0R;
	Fri, 31 Mar 2023 10:56:21 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCQY-0070hY-3B;
	Fri, 31 Mar 2023 10:56:19 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1piCQW-00034D-HX; Fri, 31 Mar 2023 12:56:12 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org,
 atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com,
 Vincent Chen <vincent.chen@sifive.com>,
 Han-Kuan Chen <hankuan.chen@sifive.com>, Andy Chiu <andy.chiu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Andrew Bresticker <abrestic@rivosinc.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Andy Chiu <andy.chiu@sifive.com>
Subject:  Re: [PATCH -next v17 05/20] riscv: Disable Vector Instructions for kernel
 itself
Date: Fri, 31 Mar 2023 12:56:11 +0200
Message-ID: <3227690.44csPzL39Z@diego>
In-Reply-To: <20230327164941.20491-6-andy.chiu@sifive.com>
References:  <20230327164941.20491-1-andy.chiu@sifive.com>
 <20230327164941.20491-6-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_035618_403169_0A53E248 
X-CRM114-Status: GOOD (  17.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Am Montag, 27. M=E4rz 2023, 18:49:25 CEST schrieb Andy Chiu:
> From: Guo Ren <guoren@linux.alibaba.com>
> =

> Disable vector instructions execution for kernel mode at its entrances.

nit: Might be nice to just add the simple explanation from the code-
comments that this helps for example to find illegal vector uses in the
kernel space, similar to the fpu.

> =

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

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

> ---
>  arch/riscv/kernel/entry.S |  6 +++---
>  arch/riscv/kernel/head.S  | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> =

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
>  =

>  	REG_L s0, TASK_TI_USER_SP(tp)
>  	csrrc s1, CSR_STATUS, t0
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 3fd6a4bd9c3e..e16bb2185d55 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -140,10 +140,10 @@ secondary_start_sbi:
>  	.option pop
>  =

>  	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>  	 */
> -	li t0, SR_FS
> +	li t0, SR_FS_VS
>  	csrc CSR_STATUS, t0
>  =

>  	/* Set trap vector to spin forever to help debug */
> @@ -234,10 +234,10 @@ pmp_done:
>  .option pop
>  =

>  	/*
> -	 * Disable FPU to detect illegal usage of
> -	 * floating point in kernel space
> +	 * Disable FPU & VECTOR to detect illegal usage of
> +	 * floating point or vector in kernel space
>  	 */
> -	li t0, SR_FS
> +	li t0, SR_FS_VS
>  	csrc CSR_STATUS, t0
>  =

>  #ifdef CONFIG_RISCV_BOOT_SPINWAIT
> =






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
