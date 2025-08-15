Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA1CCA0EE6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 20:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0NN3KPBCXtCfzrmm8dmvF3AytG4/dvBEOF0VHZXfz8=; b=uEXepS8CYKPaOj
	kr1lGECix2zcfzhLS6xFBs9A7TV0mEyacZV9J4C/FEP8xyzt9cbh8HOUuAIFc6d0g4hIS7l4ll+Wi
	phL5DB04TS31R+mc516w4Ldhpd+0S6aG2EvRpXuJZ/Axo7VYGj3b++9VmsURJztyKX/L7bLPYTcRe
	PILke0kacEIg2FhNwDLpp53Gt+Bh5z3/8kQVT1Fu3b96/8Ce5wnJbZo5e9GjdcPe/q+tomF3Ez2GA
	soMZ+QHRS5QdaZVtdjHAzozLbV8B+xQeRnNc4UDVfSS8SfxFYW0upNgi1A2xmSwuOXVJDZ8yvNYXC
	jpBII7am807O7hZ0QD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0ul-00000003RlZ-4Bt8;
	Fri, 15 Aug 2025 20:20:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0df-00000003Onc-48Or
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 20:03:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E855B5C6B68;
	Fri, 15 Aug 2025 20:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC057C4CEEB;
	Fri, 15 Aug 2025 20:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755288178;
	bh=be6Z+JaouOJVE3f+RWzpBxVj1NE79aYm+OuV+AsEfnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KgrZhln9EWqW26u3laNIrqswrW3VFQLifij7Y8RzhmCLnPLEED92ekMhguM835om5
	 4UbDVkTmZ1dU88wfQymmXaTAty2c76ksxpxfrfaquF9jbiB37RGuX1snx+GxAzlsMg
	 1YDFD9ZTOUo9KixQrNUS7k/r0m2lo1mD7M3+CU5crMMOEceN1KdrF0+VGXWOMjgx+t
	 XrW+Em64tmvZAaUTJ+8N5pxdYWv7PkjSzDEEPwy8C1codCaGYzs4HxnPP9rf1UhdaJ
	 QCpn5uOBpSkaH8whe0qEdMH8YJQioRrMalTB8ixx7lFopCu0mlYthAZ92XS1VdxbgI
	 eT90vNihdy6sg==
Date: Fri, 15 Aug 2025 13:02:56 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org,
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	kan.liang@linux.intel.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	guoren@kernel.org, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH RESEND] perf/util: make TYPE_STATE_MAX_REGS
 architecture-dependent
Message-ID: <aJ-ScOp3ZCG6PQmD@google.com>
References: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815182742.45541-1-suchitkarunakaran@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_130300_106038_73F1D711 
X-CRM114-Status: GOOD (  14.33  )
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

Hello,

On Fri, Aug 15, 2025 at 11:57:42PM +0530, Suchit Karunakaran wrote:
> Replace the fixed definition of TYPE_STATE_MAX_REGS with architecture-
> specific values for better accuracy across multiple CPU architectures
> including PowerPC, ARM, x86, RISC-V, MIPS, and others. This change ensures
> the type state registers array size matches the actual register count of
> the target platform.

Thanks for the patch.  Unfortunately we support x86 and powerpc only but
this looks like good information for later work. :)

Thanks,
Namhyung

> 
> Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> ---
>  tools/perf/util/annotate-data.h | 45 ++++++++++++++++++++++++++++++---
>  1 file changed, 41 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
> index 541fee1a5f0a..0dfb12a8f1cc 100644
> --- a/tools/perf/util/annotate-data.h
> +++ b/tools/perf/util/annotate-data.h
> @@ -189,11 +189,48 @@ struct type_state_stack {
>  	u8 kind;
>  };
>  
> -/* FIXME: This should be arch-dependent */
> -#ifdef __powerpc__
> -#define TYPE_STATE_MAX_REGS  32
> +#if defined(__powerpc__) || defined(__powerpc64__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__aarch64__)
> +#define TYPE_STATE_MAX_REGS 31
> +#elif defined(__arm__)
> +#define TYPE_STATE_MAX_REGS 16
> +#elif defined(__x86_64__)
> +#define TYPE_STATE_MAX_REGS 16
> +#elif defined(__i386__)
> +#define TYPE_STATE_MAX_REGS 8
> +#elif defined(__riscv)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__mips__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__sparc__) || defined(__sparc64__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__alpha__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__s390__) || defined(__s390x__)
> +#define TYPE_STATE_MAX_REGS 16
> +#elif defined(__sh__)
> +#define TYPE_STATE_MAX_REGS 16
> +#elif defined(__nios2__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__hexagon__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__openrisc__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__csky__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__loongarch__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__arc__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__microblaze__)
> +#define TYPE_STATE_MAX_REGS 32
> +#elif defined(__xtensa__)
> +#define TYPE_STATE_MAX_REGS 16
> +#elif defined(__m68k__)
> +#define TYPE_STATE_MAX_REGS 16
>  #else
> -#define TYPE_STATE_MAX_REGS  16
> +#define TYPE_STATE_MAX_REGS 16
>  #endif
>  
>  /*
> -- 
> 2.50.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
