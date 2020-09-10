Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A78C43461
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 19:46:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F7FB2080A
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 19:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j5kV7OF1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eC6xHFZe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F7FB2080A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5v/lwCwIXHLxjLTBcwtudJ2ishN2SPaeWPeRli873VE=; b=j5kV7OF1o0etiuLNvyXgXipPU
	/LRTIEvKdLp3jaKVxrU2aC1uxN8dNjSRDKDt7KI4RioyIlB8dRcMpAnZjJRJa+qW04Al9+SJPA3AH
	hVCahiiZJrJ/3F7zJ9kxkIXmHB/fQnjVfg936yNt9Hg5l3HA+Q4hMuMVOUTieXv1QoQZMFhNl3ETU
	kAfGtjIbwobreTwMkOfwUL6MobVDVVoEg6KaRIYiTLIzs7gmqv3A0xlkRW8FUm7RR6GNBo1CudOjK
	nbcdZHW1fwhxyEt37ym7GpO5tU9yWR62ky/ZuWXhUg1OrCjw3RlxKGem/GOCs4oRs4V2njsF/Mp6/
	6glwwphHQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGSVz-0008EQ-N1; Thu, 10 Sep 2020 19:45:51 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGSVw-0008Ct-NT
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 19:45:49 +0000
Received: by mail-pf1-x442.google.com with SMTP id k15so5283518pfc.12
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 12:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kT3st5L2W/yGrskNA7hV4WTKcp+VzTZ5Pgaqe30vqT8=;
 b=eC6xHFZebGzDOu2iJFlC4sYhGBsPBPtk9a7oklICzLNlEMzSAdGnasLCc1rhvVduzw
 WWGkAB927UqclP1++HPY0zndFIqCAsSEoCB33GsJW1zgx9zdnqi9fNwkG+wGtFEr+T3z
 bUYjH1Oc2jBMRnj0f0FQ3tH0tHQIOzzYF+914=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kT3st5L2W/yGrskNA7hV4WTKcp+VzTZ5Pgaqe30vqT8=;
 b=qi8V4bYd5ofG6G9VDRxmlDp/7EUClfZtf6jYFzqgQuj/NEM4liAbVtbUbQsqukhQae
 tOfc4/HH5j6CYmBir6l69tdhyKql2r+SqpolDc9IJXhBYMBTbcygdxVFoV7OOAgk1qWi
 dr/9JFlePK41srZkZtt6RV/OV0ozoCdhKr+8A1OWjaX4nIB2FbVoK4yqrEioOWW+Yk6S
 VqPY9vG0zU2FmGewreF5Gv7pp937NAP0aN55aJP/wWFVvct0JGnGhpp8OIMvDQiIvlFd
 rBrjFSUDHV5ZRktG2uP39z9xCMGecD8GvuSAtH3UwdSJ9j4POxJvGiAaXKky7neNCd0P
 PsYQ==
X-Gm-Message-State: AOAM5314oKqjiNZGtvSE9Zdik4WdcymL0yUQGfIM8al1sywKdYYM7lMP
 U9O+5YwoeP2FyoE1l4Eq06gH+Q==
X-Google-Smtp-Source: ABdhPJwWpKs77i2Pw4YhFhAT5cZe6s0qx17kIVE+as0BWVJNc55TKLnEBagdP5cQWEjWPugWxrbACw==
X-Received: by 2002:aa7:858e:: with SMTP id w14mr2753410pfn.95.1599767146631; 
 Thu, 10 Sep 2020 12:45:46 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id l79sm2905776pfd.210.2020.09.10.12.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 12:45:45 -0700 (PDT)
Date: Thu, 10 Sep 2020 12:45:44 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: preprocess module linker script
Message-ID: <202009101245.493610D05@keescook>
References: <20200904133122.133071-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200904133122.133071-1-masahiroy@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_154548_811730_555DFCC6 
X-CRM114-Status: GOOD (  16.78  )
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
Cc: linux-ia64@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Jeff Dike <jdike@addtoit.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 Michal Marek <michal.lkml@markovi.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jessica Yu <jeyu@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 10:31:21PM +0900, Masahiro Yamada wrote:
> There was a request to preprocess the module linker script like we do
> for the vmlinux one (https://lkml.org/lkml/2020/8/21/512).
> 
> The difference between vmlinux.lds and module.lds is that the latter
> is needed for external module builds, thus must be cleaned up by
> 'make mrproper' instead of 'make clean' (also, it must be created by
> 'make modules_prepare').
> 
> You cannot put it in arch/*/kernel/ because 'make clean' descends into
> it. I moved arch/*/kernel/module.lds to arch/*/include/asm/module.lds.h,
> which is included from scripts/module.lds.S.
> 
> scripts/module.lds is fine because 'make clean' keeps all the build
> artifacts under scripts/.
> 
> You can add arch-specific sections in <asm/module.lds.h>.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
