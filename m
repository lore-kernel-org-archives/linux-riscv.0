Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D52C98306
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 06:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyM79qTnxt0nbv0GhwIThSDIACfdceGk6HJqHIQ6rsc=; b=su5M97SVCrFnY7
	0EbXOnatZvWCg8kE3ACWOPjcliAKN6H3FiTDkiv+bLn3k3FT8gXpVmcSOXfcE4N8BHx0f4QWu7gHm
	HQKf1f/+noK/5uCH6sUjXPuPxzqugbWKyZsZyNU9yKWliSb0QgwqjEuJrZ65jVe5O9/U0O5kc/f3d
	aDyOkFaiT3hnMZ8rMefzsxxgTqtdjb6z+U+gAiSrgFsIpXTgKZGr8UZn0oCExAW5XR2IF5UA9ar0C
	s/WQfDOmVQ9lyxzl/FRfUgO9wxdEdIF4z2P7qBazs7vjWsLJNLl4wmaflo4BCEz3pg9lfqdipOgu1
	6t/k8CsmjuQ86FqlDkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zaJ-0000000ClKL-0CxB;
	Fri, 25 Sep 2026 06:39:03 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9zaG-0000000ClJd-2yNO
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 06:39:02 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-341027843a5so309121eec.2
        for <linux-riscv@lists.infradead.org>; Thu, 24 Sep 2026 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318340; x=1790923140; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XCKYNMunQtwjsoXeGr7yLk4ydEdG3nbjO5mlaJXoXQ=;
        b=OwYqKSFbx/Y0utufRgPr8TwcFOJMcnJPQRbyx0cjMoy12C1bMHZ0NtPmRJjo6svn8t
         Lhf1Oa0eP65Jpkq3FD8bxNKoDbinfuRJbGMsfmMKGVZOCVCPR7e1K/38+7AlHnh+e+AH
         MtiTG3TnP/9bDJgtahsLz77Duj7AKA/aSIL7UKquz2i8azBfVq9ln909C6G9hlO3WMKC
         LdnexxuEKzJ+QKBDP/uN8vs28Fui1oVxeP4BDmdlVIyja4zcAn8/zVMwKg3H6dp8QUJ/
         KS4QlQiDenMSbho8pWQaS8rm7hPezX58/hXettqOyNRaRwyg2q93kX24AUw1hITN0MKC
         hucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318340; x=1790923140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XCKYNMunQtwjsoXeGr7yLk4ydEdG3nbjO5mlaJXoXQ=;
        b=2pE1oQhX8st/RC9YomeSDCJuyZ23E0R6j+gnE5O/61fJCT40CIEVrgZ6DhPF+bHURS
         PtDUnd/0+NBr9ZG0SqXzwAiSEHZNBhxnl/ib7qQhTJF+ig7TuzQ2eeR8DdfExaaIppGJ
         ihggLOlaxevbL9GKXxdNl3lq7sO9/3pyizK8D4od/SAgkIz8ghz7yBytQ2rWOjbeyndA
         eYOmklYUbYFg+8yNwFcG/jr4kw4eW0vURTXbs5ClMF+cQiu1nGZnSp0EvsKiTGThrBRr
         QAdODhrESrB+whBudcRgALe/6SNktQKBHUbau1kccr888hC89NWOGsql0VhufV4AIl7P
         UfOg==
X-Forwarded-Encrypted: i=1; AKwUvBwvcSiFnO6zWoKyBSJgfCH14aPGxtotOqHf1EB2zWpgvtr7VRKuaHlEgN2J9pznzjf5msBXD0F2rxII8w==@lists.infradead.org
X-Gm-Message-State: AFuF++k25XKlrjKgGZSG91EwClKEvTbh5s/8irqJRQEZigX5GD/Tj9TO
	a/H52OIsUn6FbnHiQKr3OIUYbpwsmO4H6IRIybgn9F9VKbt3cj44mUXu
X-Gm-Gg: AYBFou3SztLRD/nbfnVUgA5kYZXoG2WVElrn/XotlPfDM0TMCpYi0u21hWb5e53j/9U
	YgTmAbPDfymoXjIA0h6IcCmMJQViHYU6mclgeEBwfvB9bVZ6Rl9V7MW3/AdBSEgOUwyNWhQ5hQn
	4IL/XbOEPbdMdbHH3f2QIPqOzZQvHOxlTw0SbRNBH8BTckelCMHQwitfPJZ65iy68AESS0bYtvY
	us9x+JBKILqL5CYq/OiVWk88XKaOLan+/9I4vXUtC9RuHZYAmWKN6jBVKDPHefa+CYDt/kRgibg
	Zdj+xHwJgbPO3DzQcLfd9jTY0h2Y/4XTQNUgOZvjFdqoyjx7CgQUcLK8d/2UdyMyLphEOsKBAs8
	pXawsRBkX6fNiy2kPxDfjFEG+US+IiYHz+TuBAYzuTQVWXEtRpcBgFSz69a3Uy9jxqa1eeytG4r
	UqlhyDPv0/ufe6d5f3CmuB8lrx+r1KP0M8gtwwcSbeJK0bTtCyyZUFGzqPEJ/dKb6tNHbiiHory
	r6rnPlgujdvAO2HQYp3Mbsr3HEpSMjamuCz/ekPsn0U
X-Received: by 2002:a05:7300:7315:b0:33b:e9a7:d81f with SMTP id 5a478bee46e88-340031cca3cmr5226961eec.11.1790318339666;
        Thu, 24 Sep 2026 23:38:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757f31sm6418823eec.14.2026.09.24.23.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 23:38:58 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:08:38 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, jszhang@kernel.org, japo@linux.ibm.com, 
	jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com, thuth@redhat.com, 
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net, 
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYWpnhia9icB-60@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_233900_774671_CE72810C 
X-CRM114-Status: GOOD (  15.83  )
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

> Untested thingies for arm64 and s390x.
> 
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 914282016069..3d8a969eab5f 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -987,14 +987,13 @@ void do_serror(struct pt_regs *regs, unsigned long esr)
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long addr)
>  {
> -	/*
> -	 * bug_brk_handler() only called for BRK #BUG_BRK_IMM.
> -	 * So the answer is trivial -- any spurious instances with no
> -	 * bug table entry will be rejected by report_bug() and passed
> -	 * back to the debug-monitors code and handled as a fatal
> -	 * unexpected debug exception.
> -	 */
> -	return 1;
> +	u32 insn;
> +
> +	if (aarch64_insn_read((u32 *)addr, &insn))
> +		return 0;
> +
> +	/* Match ASM_BUG_FLAGS() / BUG() instructions. */
> +	return insn == (0xd4200000 | (BUG_BRK_IMM << 5));
>  }
>  #endif
>  
> diff --git a/arch/s390/kernel/traps.c b/arch/s390/kernel/traps.c
> index b6ba4465f59d..8bbb082fd5e3 100644
> --- a/arch/s390/kernel/traps.c
> +++ b/arch/s390/kernel/traps.c
> @@ -26,6 +26,7 @@
>  #include <linux/entry-common.h>
>  #include <linux/kmsan.h>
>  #include <linux/bug.h>
> +#include <linux/uaccess.h>
>  #include <asm/entry-percpu.h>
>  #include <asm/asm-extable.h>
>  #include <asm/irqflags.h>
> @@ -55,7 +56,12 @@ static inline void __user *get_trap_ip(struct pt_regs *regs)
>  #ifdef CONFIG_GENERIC_BUG
>  int is_valid_bugaddr(unsigned long addr)
>  {
> -	return 1;
> +	u16 insn;
> +
> +	if (get_kernel_nofault(insn, (u16 *)addr))
> +		return 0;
> +
> +	return insn == 0x0001 || insn == 0x000e;
>  }
>  #endif
>  
Thanks for this.
lemme test these and i'll send it out after verifying.

Regards,
Mukesh


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
