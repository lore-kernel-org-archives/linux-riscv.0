Return-Path: <SRS0=t+O9=OG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE403C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:35:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A9520817
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:35:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qVunzzNO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1A9520817
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ydKTIxDR3CCROF8VgMM35h6hsUh92aafzvQjXvAG4D8=; b=qVunzzNOdp72sg
	HnaRnou8I4pTNkYfRYZXUgKJJIm8JCBtCu/J2m+QavDGVwZOE6VrNyKYP4qiVaj0c9qAg3I2XkZ8J
	/Q6wegI4FqRpzJkfMHpShA+Q4OQV3fs6Xj8nqkmA8HZz0xwcxkfWk0Qy+0i8rC7U8fbi1OHtwgk9D
	58EPgLUEtKzpj2jZIgN6CSzrmXqffLoOhbku+FtFzpyX89xtuAzTagv+8i72ckk36GrfG2W2rbPk5
	BmQ+0R080q6Q7kn6IHew1q28r9KC4r6DbyittWiuv6wcy+qjVpOVX9oJGqejykwqnPddPv7rDNskJ
	63gqph8Cmg90YTJ5K7Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRahv-0008B1-Vr; Tue, 27 Nov 2018 10:35:08 +0000
Received: from ozlabs.org ([203.11.71.1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRahg-0007gc-2O; Tue, 27 Nov 2018 10:34:53 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 4340X95kDkz9s29;
 Tue, 27 Nov 2018 21:34:33 +1100 (AEDT)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Dmitry V. Levin" <ldv@altlinux.org>, Andy Lutomirski <luto@kernel.org>,
 Eric Paris <eparis@redhat.com>, Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v2 16/15] syscall_get_arch: add "struct task_struct *"
 argument
In-Reply-To: <20181121004422.GA29053@altlinux.org>
References: <20181107042751.3b519062@akathisia>
 <CALCETrV1v-DPRfDRwiH=xn29bxWxiHdZtAH1nw=dsmDtnT0YGQ@mail.gmail.com>
 <20181120001128.GA11300@altlinux.org> <20181121004422.GA29053@altlinux.org>
Date: Tue, 27 Nov 2018 21:34:29 +1100
Message-ID: <87in0ihkqy.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181127_023452_294115_4BDA89AE 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mips@linux-mips.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 Eugene Syromyatnikov <esyr@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, linux-audit@redhat.com,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181127103429.fsPSlzSvgWOhARD-LziglIKOpxgljXu05a9Y0hJ686A@z>

"Dmitry V. Levin" <ldv@altlinux.org> writes:

> diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
> index ab9f3f0a8637..d88b34179118 100644
> --- a/arch/powerpc/include/asm/syscall.h
> +++ b/arch/powerpc/include/asm/syscall.h
> @@ -100,9 +100,15 @@ static inline void syscall_set_arguments(struct task_struct *task,
>  		regs->orig_gpr3 = args[0];
>  }
>  
> -static inline int syscall_get_arch(void)
> +static inline int syscall_get_arch(struct task_struct *task)
>  {
> -	int arch = is_32bit_task() ? AUDIT_ARCH_PPC : AUDIT_ARCH_PPC64;
> +	int arch;
> +
> +	if (IS_ENABLED(CONFIG_PPC64) && !test_tsk_thread_flag(task, TIF_32BIT))
> +		arch = AUDIT_ARCH_PPC64;
> +	else
> +		arch = AUDIT_ARCH_PPC;
> +
>  #ifdef __LITTLE_ENDIAN__
>  	arch |= __AUDIT_ARCH_LE;
>  #endif

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
