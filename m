Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E18C4741F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 10:23:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254E422243
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 10:22:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SnKtwTiF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="oDkd83Ut"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254E422243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DU64vh5Bh9246PhA+u8Hrvx5OqElSKvoieQxJ/BCzLc=; b=SnKtwTiFtDVQSCD6zq+sPtj24
	BLyDHGycsjVmeYGcQa58MzLrvgdR9TlhpVIDSd0+Zs6klrVMpNMNa/WISCpJg7fAaoKAbpedYbt8W
	rEzNnv9tarf+6c7WhJfmPNEhFp0jmx2qosjVJsvUN4LUrmitHxKAqMxaeKQU0eQZHf3+5MeI7+F2B
	MLoiq+r41U8PCkTJTxzfxFjLjp+JdjoESz+EnTtu7gtZY2ofHBDfmh7mYQBrfE1VmWE4AsylI9OMY
	/XB7BqKtxe6xtJufc3r3PEyOfcYGmyUipgz29gEnmq03XKVVGJzEv1uE01Kx1kwfnz49mcImK1kAO
	ZCdXLjSjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaFwG-000886-4x; Wed, 04 Nov 2020 10:22:48 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1] helo=ozlabs.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaFwC-000863-MO
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 10:22:46 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CR2lS6ZW8z9sTL;
 Wed,  4 Nov 2020 21:22:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604485355;
 bh=L70AG7tzTd7Z55u+Fj8DTKuCWP9ecgUCCOxcamNMHIs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oDkd83UtH0Srm5gou9o8FbK7V4IaynA9LCA2YJKhl+5lUnI+xkZjuVD5VI7pJ+a2M
 HfsMI0MoloEkD3kwT+0vUtyCVb5PM2a9WPF6rkPmZB+9idXkIb7EMvyH3VOFzyp/Ps
 68txSVLNJRowCRuykY+i+5Ewg7c/SwxbVOrNc5RWW00H/82L7EDvL4Qy2KV2oBLDUb
 2yVheHA/7sjVh0E3O3cAIx/q6Zcp5FGUuuzsq1Mfee0O7JtPXB0z7fnfD69DrTlxhD
 Ug36BFsOA8q9k55mb81BwQUF1fU4SM3xLLRlc5FTkEqiwDPXMtmP7ZL6xkIZIdCtj0
 qdybn2J+0q8JQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: YiFei Zhu <zhuyifei1999@gmail.com>, containers@lists.linux-foundation.org
Subject: Re: [PATCH seccomp 3/8] powerpc: Enable seccomp architecture tracking
In-Reply-To: <4ec2970fcc819eb4d5dac2bd35233ccdadfda845.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
 <4ec2970fcc819eb4d5dac2bd35233ccdadfda845.1604410035.git.yifeifz2@illinois.edu>
Date: Wed, 04 Nov 2020 21:22:28 +1100
Message-ID: <87wnz1to9n.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_052245_023374_09C04134 
X-CRM114-Status: GOOD (  14.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

YiFei Zhu <zhuyifei1999@gmail.com> writes:
> From: YiFei Zhu <yifeifz2@illinois.edu>
>
> To enable seccomp constant action bitmaps, we need to have a static
> mapping to the audit architecture and system call table size. Add these
> for powerpc.
>
> Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
> ---
>  arch/powerpc/include/asm/seccomp.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/seccomp.h b/arch/powerpc/include/asm/seccomp.h
> index 51209f6071c5..3efcc83e9cc6 100644
> --- a/arch/powerpc/include/asm/seccomp.h
> +++ b/arch/powerpc/include/asm/seccomp.h
> @@ -8,4 +8,25 @@
>  
>  #include <asm-generic/seccomp.h>
>  
> +#ifdef __LITTLE_ENDIAN__

As Kees mentioned this should (must?!) match the configured endian.

But I think it would still be better to use the CONFIG symbol, which is
CONFIG_CPU_LITTLE_ENDIAN.

> +#define __SECCOMP_ARCH_LE_BIT		__AUDIT_ARCH_LE
> +#else
> +#define __SECCOMP_ARCH_LE_BIT		0
> +#endif
> +
> +#ifdef CONFIG_PPC64
> +# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC64 | __SECCOMP_ARCH_LE)

You use __SECCOMP_ARCH_LE there, but previously you only defined
__SECCOMP_ARCH_LE_BIT.

Is there some magic somewhere that defines __SECCOMP_ARCH_LE based on
__SECCOMP_ARCH_LE_BIT ?

> +# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
> +# define SECCOMP_ARCH_NATIVE_NAME	"ppc64"

What's the name used for?

Usually we use "ppc64" for 64-bit big endian and "ppc64le" for 64-bit
little endian.

> +# ifdef CONFIG_COMPAT
> +#  define SECCOMP_ARCH_COMPAT		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
> +#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
> +#  define SECCOMP_ARCH_COMPAT_NAME	"powerpc"

And usually we use "ppc" for 32-bit.

> +# endif
> +#else /* !CONFIG_PPC64 */
> +# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
> +# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
> +# define SECCOMP_ARCH_NATIVE_NAME	"powerpc"
> +#endif
> +
>  #endif	/* _ASM_POWERPC_SECCOMP_H */
> -- 
> 2.29.2


cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
