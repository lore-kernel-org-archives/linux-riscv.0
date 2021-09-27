Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109FFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 15:13:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A496101A
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 15:13:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6A496101A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tc0ZIOHisVsyw/Ef4Qj1UWLChXbHmgr/CBF0A2du1wE=; b=nV3jpHzNfjbWCK
	q4GsTP+dNLvMC5DGfFPGZmfCDU0eajOZRrosdUTrq2AbuPjugLTS4kUsuJDaofobU1qInej8BdASH
	oY6nPACugzbdLtjUyxHyWRDrxjrYctKKPFV3QBzLrKKcvnaA6Yq9ScxQ1+8tTdtOTrjJt0ljYsBUV
	1yR5D3kAe+FPF9uO2PY54uNdMslhgjfpApnPcZ+5AJB5x+riBOcPZirX5a6w0hAMcmydOEw7OoccS
	zkxWwzT+qCCNbav38K0XUpNByuSx8oltEc7heIJqBMHGHf9cEpzi7kh90iZQn33zVcK2wc7i5kVeY
	QUiWh/AyjJ0Ne6VGjPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUsJj-0034RF-8g; Mon, 27 Sep 2021 15:13:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUsJV-0034Mp-7g; Mon, 27 Sep 2021 15:13:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E813760F44;
 Mon, 27 Sep 2021 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632755584;
 bh=CKBeZqx1JroYNLrGq5H114mf1zFlMql7osjtvpITDCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MHaBJHMUonfFqA3IRGyEJ0Mc+N3B+pO9oNUd4UkBMfcjdFw8BfQUPOeKVcLuKpWcE
 0v/VR78gwd8CZiOoAu6PMZBqWswWPvOIC5a0yMYiRA7o6l3g+QPszdwS5c5SFrORxt
 IXNssH5McdqPrg944i5dHPhlDxRfdv3AP644ywFomxAreNXN6HabPUaMZDWLYCjzNp
 TuVWlKleoXprfPYBX3kbjK2GichgSujcrXgUlUUAUPcFPq8Xbz6OIwPPeQ1Y0Y6qUI
 G0qxqPSlrkiFiEyVaIyW4O+WG3ak39pd03Cu3m6MNRfrf+BjpjpFs1bWgqWI99GCFc
 bMSmEVPTB8vow==
Received: by mail-oi1-f181.google.com with SMTP id w206so26037831oiw.4;
 Mon, 27 Sep 2021 08:13:04 -0700 (PDT)
X-Gm-Message-State: AOAM532H/7Y7qeXNvdeLex5h3PlUAMB90MMyKPHfni8uCajK44RQet22
 DrVEQtdZ/77x5oCNQkJ8zl7jueczLr7Ez8YUmkU=
X-Google-Smtp-Source: ABdhPJyeC8BgibE5zzxbqU0l8Tut8FIpgncaCT3Q0Qb4RyOfhbEhCIFLxw2ikpv+mDHPe9VMwWn8YxftPxI0HPTWIJ0=
X-Received: by 2002:aca:32c2:: with SMTP id y185mr501704oiy.47.1632755574136; 
 Mon, 27 Sep 2021 08:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210914121036.3975026-1-ardb@kernel.org>
 <20210914121036.3975026-5-ardb@kernel.org>
In-Reply-To: <20210914121036.3975026-5-ardb@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 27 Sep 2021 17:12:43 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
Message-ID: <CAMj1kXEojbQbNzCP39KT4EzFAyW3J1Tfm_stCZ+fGo8_SO90PA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/8] powerpc: add CPU field to struct thread_info
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Keith Packard <keithpac@amazon.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>, 
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:S390" <linux-s390@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_081305_312444_F0D17B19 
X-CRM114-Status: GOOD (  19.48  )
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

On Tue, 14 Sept 2021 at 14:11, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> The CPU field will be moved back into thread_info even when
> THREAD_INFO_IN_TASK is enabled, so add it back to powerpc's definition
> of struct thread_info.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Michael,

Do you have any objections or issues with this patch or the subsequent
ones cleaning up the task CPU kludge for ppc32? Christophe indicated
that he was happy with it.

Thanks,
Ard.


> ---
>  arch/powerpc/include/asm/thread_info.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index b4ec6c7dd72e..5725029aaa29 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -47,6 +47,9 @@
>  struct thread_info {
>         int             preempt_count;          /* 0 => preemptable,
>                                                    <0 => BUG */
> +#ifdef CONFIG_SMP
> +       unsigned int    cpu;
> +#endif
>         unsigned long   local_flags;            /* private flags for thread */
>  #ifdef CONFIG_LIVEPATCH
>         unsigned long *livepatch_sp;
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
