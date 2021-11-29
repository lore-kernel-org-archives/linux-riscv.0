Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E702C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Nov 2021 02:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQ74UMY1Pk+NiCN0qb1y92/rLJEYnPI/tFrcNcZBhWo=; b=gJFa/xMk3oBZY/
	5PiHiY+idMNmZqozOcWBnJQTJ5Ve5uBwd4bdWaBzaisMi4PfiHbruE/e6B3NUVHt+EfG1vDjJIIQ/
	rh3h7UOZClkCp6GaD3043aMTszJCX5+S4IrNXO2coZpkTCdOF01uBAFbQLEZEZ2XleBvP/r8nX3Vp
	M4XzpufR2JlyVsJIGaeobK4PpJ56DTnUdzISvJal+eXPcxXs37IpXwOwWsnWgUdlupfHLP1/iywbe
	Hhkb6KZejfIXfdhwdFgO8H+D+RV5i9Z9Ycm3ea4f2jWeVzWZi7xt50aUmgYtpSAbCCw11ZKMviczQ
	EdZidb/dm0typpmdYmTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrWod-00H8kb-CX; Mon, 29 Nov 2021 02:54:51 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrWoP-00H8i8-W8; Mon, 29 Nov 2021 02:54:39 +0000
Received: by mail-qk1-f178.google.com with SMTP id 132so21309035qkj.11;
 Sun, 28 Nov 2021 18:54:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qbTe+lH71a6p8wzsCbhSxpErG9OzglSEt6YvNDwG21c=;
 b=7x3e//GuLpDXEMy770aEXTOUu95U3e+pdOdazRGx0nJZ+RKf4ziYrYAYifG4xYo2gI
 GrvSGlrLlzLfwoYCeYACIJKzKPop0ps1qT1+mGKXYcqF0ev3WUPlBOTmU4ya72/i+0EW
 joiuuKUlV6otkUolY35nAO3KJzXOTdfpBbYwGVNYr5EsW85D7YA/dN6gAZInZwYnMcM3
 rGui3LTa3VgS2pjVvQkEeZWRkCGSYuNvu9KmLZID43mV+uhsUsB+Tz2POB7tFoBZ25yN
 GYtkFs+0dAMEQ+77dLEe5N849RIwdOH4AbK/C8zeZkDzR0HqhIPqAUg/tMwuHseZMsSG
 4yVw==
X-Gm-Message-State: AOAM530Luk8oZwutBCFWRh584TgpP7O3tTON8NCPBQvXQGyN2YMky2AF
 V0w2Pxzx0giOTVaVJk4cSjw=
X-Google-Smtp-Source: ABdhPJyi7aAcRBTHZ33Xv2m6ARGtjYSUACLIAGWWBFseVcXDEPx4RpqRlD7ZTzSfnjCXSQaXvSA7XQ==
X-Received: by 2002:a05:620a:1468:: with SMTP id
 j8mr36368878qkl.170.1638154476884; 
 Sun, 28 Nov 2021 18:54:36 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id s6sm5164326qko.43.2021.11.28.18.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 18:54:36 -0800 (PST)
Date: Sun, 28 Nov 2021 21:54:34 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tj@kernel.org, gregkh@linuxfoundation.org,
 cl@linux.com, catalin.marinas@arm.com, will@kernel.org,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Message-ID: <YaRA6o0pHU6/206a@fedora>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_185438_056945_61511209 
X-CRM114-Status: GOOD (  13.07  )
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

On Mon, Nov 29, 2021 at 10:51:18AM +0800, Kefeng Wang wrote:
> Hi Dennis and all maintainers, any comments about the changes, many thanks.
> 
> On 2021/11/21 17:35, Kefeng Wang wrote:
> > When support page mapping percpu first chunk allocator on arm64, we
> > found there are lots of duplicated codes in percpu embed/page first
> > chunk allocator. This patchset is aimed to cleanup them and should
> > no funciton change, only test on arm64.
> > 
> > Kefeng Wang (4):
> >    mm: percpu: Generalize percpu related config
> >    mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
> >    mm: percpu: Add generic pcpu_fc_alloc/free funciton
> >    mm: percpu: Add generic pcpu_populate_pte() function
> > 
> >   arch/arm64/Kconfig             |  20 +----
> >   arch/ia64/Kconfig              |   9 +--
> >   arch/mips/Kconfig              |  10 +--
> >   arch/mips/mm/init.c            |  14 +---
> >   arch/powerpc/Kconfig           |  17 +---
> >   arch/powerpc/kernel/setup_64.c |  92 +--------------------
> >   arch/riscv/Kconfig             |  10 +--
> >   arch/sparc/Kconfig             |  12 +--
> >   arch/sparc/kernel/smp_64.c     | 105 +-----------------------
> >   arch/x86/Kconfig               |  17 +---
> >   arch/x86/kernel/setup_percpu.c |  66 ++-------------
> >   drivers/base/arch_numa.c       |  68 +---------------
> >   include/linux/percpu.h         |  13 +--
> >   mm/Kconfig                     |  12 +++
> >   mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
> >   15 files changed, 165 insertions(+), 443 deletions(-)
> > 

Hi Kefang,

I apologize for the delay. It's a holiday week in the US + I had some
personal things come up at the beginning of last week. I'll have it
reviewed by tomorrow.

Thanks,
Dennis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
