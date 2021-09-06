Return-Path: <SRS0=oCzz=N4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76674C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 14:23:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341DE6056C
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 14:23:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 341DE6056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxsJ9aPsIy0PF3gmcF32KU7KBcujYA47/F6O/BBqJ8s=; b=qDTJT8ocroFbLy
	1JzZEIFCwmSs0IQ1HuN8NOWF8pVlMxfIs/vtdxzMvVPw9VNZQfAR3exwvWcj1aMlsjC14p5DvVCmb
	dpnd9yxF9ZeRJhIbfyqzY9xo/M/6Hymt4NH+M+LFlNC4a1yUxI4/gc68/oFU6/L3tW+fm7jbyww1n
	Rr6xLbyWl1b0irEL0PdjnElTbV9KX4Ol7956rWV2dHRC6wBkxmw5MROy9B0XytkfvpzhpqEkJu6TH
	Ve3+vLP0WCiLUnOG3Dl7sPthAOGCDSwBjwNEaxY4OsYm7zmG+OKNlGtnlhpJj8pOq+WqqOzAX7Wcy
	vur6YZzaJn6HV1SZL+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNFWs-0016Mu-5U; Mon, 06 Sep 2021 14:23:22 +0000
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2] helo=ozlabs.org)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNFWf-0016LL-9C; Mon, 06 Sep 2021 14:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630938178;
 bh=a1ig8YTFMn8o0S8xZRd6vor5m3Cp6vgqt+R8f3Aaqr8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gPDFVvcgFKVCtnnFcqifi3/U7sQu2oKLjlWmQLo9QKNWq1U2MACHRnqyFWKrnad56
 uL+i5BVZJzimDdNdOdWWL97qyY3vQEru4eOyRsCgGll1qxWgWbklqZekpDGcAGKuCf
 7DC9/fmleSs/J6PLf3UKelktEfEUDK/VqMn/+w368Z5+i7rKCZizeZ9JNKFm1pNAA5
 h4LY2z9lptO/oPnnmWr1502XTFsZvG+pEmckwN3k0Ifrq04O0itioFFI4oF6PBSbWI
 occtjlLIAW9X8Cbc98/3bwK1W8QWf6J3uswp0ONhi5bpMTYeu0fzaFaimB7DadN/5M
 jHul5fcpFPOCA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H39bX6gcYz9sW4;
 Tue,  7 Sep 2021 00:22:48 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Weizhao Ouyang <o451686892@gmail.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>, Greentime Hu
 <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul
 Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "David S.
 Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, Weizhao Ouyang
 <o451686892@gmail.com>
Subject: Re: [PATCH v2] ftrace: Cleanup ftrace_dyn_arch_init()
In-Reply-To: <20210906111626.1259867-1-o451686892@gmail.com>
References: <20210906111626.1259867-1-o451686892@gmail.com>
Date: Tue, 07 Sep 2021 00:22:46 +1000
Message-ID: <87v93dn5qh.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_072309_574103_EEA56DFE 
X-CRM114-Status: GOOD (  14.06  )
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

Weizhao Ouyang <o451686892@gmail.com> writes:
> Most of ARCHs use empty ftrace_dyn_arch_init(), introduce a weak common
> ftrace_dyn_arch_init() to cleanup them.
>
> Signed-off-by: Weizhao Ouyang <o451686892@gmail.com>
> Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
>
> ---
>
> Changes in v2:
> -- correct CONFIG_DYNAMIC_FTRACE on PowerPC
> -- add Acked-by tag

> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index debe8c4f7062..d59f67c0225f 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -61,6 +61,10 @@ struct dyn_arch_ftrace {
>  };
>  #endif /* __ASSEMBLY__ */
>  
> +#ifdef CONFIG_DYNAMIC_FTRACE
> +int __init ftrace_dyn_arch_init(void);
> +#endif /* CONFIG_DYNAMIC_FTRACE */
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #endif

That breaks the build for powerpc:

  /linux/arch/powerpc/include/asm/ftrace.h: Assembler messages:
  /linux/arch/powerpc/include/asm/ftrace.h:65: Error: unrecognized opcode: `int'
  make[4]: *** [/linux/scripts/Makefile.build:352: arch/powerpc/kernel/trace/ftrace_64.o] Error 1
  make[3]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel/trace] Error 2
  make[2]: *** [/linux/scripts/Makefile.build:514: arch/powerpc/kernel] Error 2
  make[1]: *** [/linux/Makefile:1861: arch/powerpc] Error 2
  make[1]: *** Waiting for unfinished jobs....

It needs to be inside an #ifndef __ASSEMBLY__ section.

cheers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
