Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1478DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ounAkEyi5BHQ+HkS0/DXabsbAFcCBh8V5iFkrCWVxfk=; b=KETsI3MpLPMQvr
	bK/bp4YfKKgF1sjitHPCMcML24IRyyh707lZU0Do2zP2JJI54uSDsGUeL4vnk88vb6OVD8XYJmA4d
	C5fiQJnVswFkhBJLRQk+uZRBIZivsZW/R85jdgh5+S65wFG/5NX+XepWG7f0w9YQGRqfx3E/eAc24
	pfcvpgfVIhlC/b6Fm8rVl8yn+2w660NDkaYGXqRoV3Ib1hjfaI4iPeSAjTbOq0IEaiLuX9FiYvwmg
	U5xhZBuNLhVsTaiNnbrlFntdtNSub9AIqNSqOFmBAWg3jBU34KmDRQIAoJME/mfVMGeg4o9Lhw0Ul
	uVVbHiDhKzykLB3zcZJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkhtm-00Dqw2-32; Sat, 30 Apr 2022 07:52:14 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkhtj-00Dqua-FS
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 07:52:12 +0000
Received: by mail-pj1-x1030.google.com with SMTP id fv2so8873963pjb.4
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 00:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bDVSZwPRgcAPJ3fWKSzR6sElFikHXLwmOFE7dJ7yN/I=;
 b=cBvuaGmInnkqUkO0kS3bKHO4L9FR56pjEwE1demPcEhzi4K0j5S/88Cvsqk/k+Inec
 HRNetMhU3zxfoHzCqM8kX568jD8Dtk8BgoHBbxGb1+5Lfut0JnkbfZDqadABIRQCFVU8
 Wo8HnY8dAuKrV4Zk3L0bKRoGE+7tBTVFhdpSpChcwqKwSoBfgopMEv8GbFIxW/ajrKuH
 Kjcps/SLOfTCowCaf9zG6VUOTe+uKTf59l/KkuTkrcHBWGJhBpP+3yDdjMEW5Seg+W+H
 rMvSXfYuTQtuhfcIFZvf5onF37T127wCsbqJZEKo/CMeGotJDXQAfMH4oQ4CP83apdSw
 sFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bDVSZwPRgcAPJ3fWKSzR6sElFikHXLwmOFE7dJ7yN/I=;
 b=mP73H8C4kCJV34g8yTcYDafb1BQvWg867+aBcWXQSW9H+ApQ+NUyR1vRLCskVFu0cK
 ener1nT/mebrqlfeu2mDtx6hWH8vZVY/T61PQw2W/NzuEwZNidaM9QAqTdKZYQRsmdvg
 Yi/jJrUao+iKFLLKbZCbaTzDdWImKhiQ8/sRls7yturZ6xrdMQtiURzQTusC6w58olJZ
 8qa9tmC/fEcDyuMtoI/G/ZiFiMsdtB0nHSyv+w+tr5to2NhSKpROD8nFiOl1BvdhpOjg
 IoQIZANT5jXfCP+Yw+veKq6PSaAzLhdWuipQXBuad0jFQnngjvyjLpMaa/PY0n9gjX4B
 oVFA==
X-Gm-Message-State: AOAM530gJKjjLcOw3FnK7BUveiWZMetiBVHMmjnHwTjKI5/YwPJq7ZTL
 1FWZwaQD86s50N9T9AE8zhY=
X-Google-Smtp-Source: ABdhPJyRLygBdsWCWCiMOr7lmCiKPgf60Yhl9qtmmd4xMBQ4UAqn4VA2VymZU0SJZeL72jYgAdA+ZA==
X-Received: by 2002:a17:903:246:b0:153:87f0:a93e with SMTP id
 j6-20020a170903024600b0015387f0a93emr2969288plh.171.1651305128433; 
 Sat, 30 Apr 2022 00:52:08 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a170903110500b0015e8d4eb252sm851999plh.156.2022.04.30.00.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 00:52:07 -0700 (PDT)
Date: Sat, 30 Apr 2022 16:52:05 +0900
From: Stafford Horne <shorne@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, heiko@sntech.de, guoren@kernel.org,
 peterz@infradead.org, mingo@redhat.com,
 Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 macro@orcam.me.uk, Greg KH <gregkh@linuxfoundation.org>,
 sudipm.mukherjee@gmail.com, wangkefeng.wang@huawei.com,
 jszhang@kernel.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 4/7] openrisc: Move to ticket-spinlock
Message-ID: <YmzqpVCEenOXRTga@antec>
References: <20220414220214.24556-1-palmer@rivosinc.com>
 <20220414220214.24556-5-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220414220214.24556-5-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_005211_557882_75C7BF8B 
X-CRM114-Status: GOOD (  19.00  )
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

On Thu, Apr 14, 2022 at 03:02:11PM -0700, Palmer Dabbelt wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> We have no indications that openrisc meets the qspinlock requirements,
> so move to ticket-spinlock as that is more likey to be correct.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/openrisc/Kconfig                      |  1 -
>  arch/openrisc/include/asm/Kbuild           |  5 ++--
>  arch/openrisc/include/asm/spinlock.h       | 27 ----------------------
>  arch/openrisc/include/asm/spinlock_types.h |  7 ------
>  4 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 arch/openrisc/include/asm/spinlock.h
>  delete mode 100644 arch/openrisc/include/asm/spinlock_types.h
> 
> diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
> index 0d68adf6e02b..99f0e4a4cbbd 100644
> --- a/arch/openrisc/Kconfig
> +++ b/arch/openrisc/Kconfig
> @@ -30,7 +30,6 @@ config OPENRISC
>  	select HAVE_DEBUG_STACKOVERFLOW
>  	select OR1K_PIC
>  	select CPU_NO_EFFICIENT_FFS if !OPENRISC_HAVE_INST_FF1
> -	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select OMPIC if SMP
>  	select ARCH_WANT_FRAME_POINTERS
> diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
> index ca5987e11053..3386b9c1c073 100644
> --- a/arch/openrisc/include/asm/Kbuild
> +++ b/arch/openrisc/include/asm/Kbuild
> @@ -1,9 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  generic-y += extable.h
>  generic-y += kvm_para.h
> -generic-y += mcs_spinlock.h
> -generic-y += qspinlock_types.h
> -generic-y += qspinlock.h
> +generic-y += spinlock_types.h
> +generic-y += spinlock.h
>  generic-y += qrwlock_types.h
>  generic-y += qrwlock.h
>  generic-y += user.h
> diff --git a/arch/openrisc/include/asm/spinlock.h b/arch/openrisc/include/asm/spinlock.h
> deleted file mode 100644
> index 264944a71535..000000000000
> --- a/arch/openrisc/include/asm/spinlock.h
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * OpenRISC Linux
> - *
> - * Linux architectural port borrowing liberally from similar works of
> - * others.  All original copyrights apply as per the original source
> - * declaration.
> - *
> - * OpenRISC implementation:
> - * Copyright (C) 2003 Matjaz Breskvar <phoenix@bsemi.com>
> - * Copyright (C) 2010-2011 Jonas Bonn <jonas@southpole.se>
> - * et al.
> - */
> -
> -#ifndef __ASM_OPENRISC_SPINLOCK_H
> -#define __ASM_OPENRISC_SPINLOCK_H
> -
> -#include <asm/qspinlock.h>
> -
> -#include <asm/qrwlock.h>
> -
> -#define arch_spin_relax(lock)	cpu_relax()
> -#define arch_read_relax(lock)	cpu_relax()
> -#define arch_write_relax(lock)	cpu_relax()
> -
> -
> -#endif
> diff --git a/arch/openrisc/include/asm/spinlock_types.h b/arch/openrisc/include/asm/spinlock_types.h
> deleted file mode 100644
> index 7c6fb1208c88..000000000000
> --- a/arch/openrisc/include/asm/spinlock_types.h
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -#ifndef _ASM_OPENRISC_SPINLOCK_TYPES_H
> -#define _ASM_OPENRISC_SPINLOCK_TYPES_H
> -
> -#include <asm/qspinlock_types.h>
> -#include <asm/qrwlock_types.h>
> -
> -#endif /* _ASM_OPENRISC_SPINLOCK_TYPES_H */

Thanks for this, a bit late but.

Acked-by: Stafford Horne <shorne@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
