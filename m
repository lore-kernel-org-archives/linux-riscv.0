Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCD8C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 20:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUH1qY3R2YBkPnAYYSZaPLmdxdZ8LN9mS3bjfunyXvE=; b=sH7FddPFQ7dohk
	z6k5UegYrQPyWGXNMWjNQeNETxaRff8GIed6+412fRXVg8b7yjpY3TCGS+rsJS9FdYu8P7SKdI20S
	B1MGcCGSQVAi3jVzaRKtq+rNxCCQPqEeO6AD0EtSsfaP3zyRAOhuWCeK0DFVF4ZghogDWyhMezGvF
	p6tu57wB2IN/P3DyVygmy690EcVTFHaDZqQd4XaTj5wCxHe5urd9AljjpOQWGMw28P2tC26ZvCi7M
	+409QtOuyaQPwijsEAcLagemm9lf0tle+uFzr0OtjTKSnoXWScgLe8MzfnnkxL/UK1Rl8nM6gWK/a
	aYSCGBxxqiW4YKaGh3wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3OOA-002R5G-HD; Mon, 20 Jun 2022 20:52:50 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3OEJ-002M4A-VJ
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 20:42:41 +0000
Received: from mail-yw1-f178.google.com ([209.85.128.178]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MirfG-1nQk1P1gjE-00eu1m for <linux-riscv@lists.infradead.org>; Mon, 20
 Jun 2022 22:42:35 +0200
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-31780ad7535so85458297b3.8
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 13:42:35 -0700 (PDT)
X-Gm-Message-State: AJIora+a+NKUOoUKN7IM7p1HukNSR4v72sVHalgct5luhSpIrZNXz831
	fFQSIye3Pv1B4LoxHC1vh1CdUnULPnCZAVeOG6A=
X-Google-Smtp-Source: AGRyM1sIFEAcARCpUAqHrTpOeRmkN9ZFqetDdPpULBWhN1/m9GTMKCzSuXlUzIGbL4Fwbk9/rb6lbI4rEuazL0L0JVg=
X-Received: by 2002:a0d:ca0f:0:b0:317:a2cc:aa2 with SMTP id
 m15-20020a0dca0f000000b00317a2cc0aa2mr14210907ywd.347.1655757754247; Mon, 20
 Jun 2022 13:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220620155404.1968739-1-guoren@kernel.org>
In-Reply-To: <20220620155404.1968739-1-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 20 Jun 2022 22:42:17 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2enbvE9a5V=JpUFt7FfyDGLQHTWTszibqqLVoeiMAo5Q@mail.gmail.com>
Message-ID: <CAK8P3a2enbvE9a5V=JpUFt7FfyDGLQHTWTszibqqLVoeiMAo5Q@mail.gmail.com>
Subject: Re: [PATCH V5] riscv: Add qspinlock support
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, 
	Peter Zijlstra <peterz@infradead.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:H3MRcAON1mmS3oKAnNjVTI4HRv3gedXKQts/YFbPuvRrvxaKTh9
 gEYDENIQ8rPR0yDYAIM5Fuq/ztRd2xp1XkQZ742ar/Yv0CLSeMdzzpde8FERCo/Jeaw+ju3
 58SB3ZBSkmtAOHeJRdvjzWpcp1P+yF8xXO8TwH0zEH8ZxZpjmFU+wrXnhz8OuHAbH6/sekJ
 en1d/9UvdcOra6+Jnuw3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:p1FlnR+HAQ4=:tDXs+FhhfNbbr/W8OhJSLI
 FDYFarcYacBH3qwXhhn4EK7FnMfSBMPgRfTXbTzj2kwOrjzKHYkpVj7do72MNeXW4NsVCPkLX
 IG3kSIIeJaOXUjakeFN7uuwxE/OLi+uiDj8ZoQBX3ABh/O/YU0qeXCe6VC1ib3sUPX4q6rI1r
 gB6PyOIPgJX+ixDSelu4VzhOCPKlAgwG07ghl8/2tYzqq8s8+KWpWljbxCGpMTgIVDL9bo2R4
 tBINLdtdhKNTytPhiHCN3x6XrexBjNQpRWX1VELYI7G8I3dMXTUvyV6IL1YM1boeBNjZ0nO1r
 bjiQ534FQm9QcZFAxyNcC/TXVDM+ogL5m//JY67w/ri1EXKaZgA6+IshPMWImBdQhopQKjD41
 CD050qKpFpxh0Strm0nKTj8rpgiUt6qvamGYy56GeMoMIa7+EC7HFkSi3fTJX9OJDffidE+tA
 jTHVqJlgSU1Nz2UzL/VHgaT5YcKJFZFv3TIyS15Dtt1J0j1It1tgB1okQdojcWOgtOp/hPxut
 Q4/jpQxtF6icP9YyJvPRaXDD2306kA0xY8QV7cjN7/gRuF4vdGLT+wpKqXSjRE/1K0eYZeANe
 wiBMXlhQxiYGSM2BYLfkjF6tVrw3zUa5OLuyj6O/C0gJEoveT24YQo8BLbEtPIRrXaV3wqYXp
 RkgoKrxtwgJPLGo0wWUnOYvbOaxwqXsAazm6ZR4xQG2yqPSNmb5e03q8UPwI7UYDQPoMJOt64
 IomaykQCLY+nZuVBkuoOiqWv3f/t3+EyetqcWg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_134240_374745_5C190546 
X-CRM114-Status: GOOD (  15.28  )
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

On Mon, Jun 20, 2022 at 5:54 PM <guoren@kernel.org> wrote:
> >+config RISCV_USE_QUEUED_SPINLOCKS
> +       bool "Using queued spinlock instead of ticket-lock"

Maybe we can just make ARCH_USE_QUEUED_SPINLOCKS
user visible and give users the choice between the two generic
implementations across all architectures that support the qspinlock
variant.

In arch/riscv, you'd then just have a

        select ARCH_HAVE_QUEUED_SPINLOCKS

diff --git a/arch/riscv/include/asm/spinlock.h
b/arch/riscv/include/asm/spinlock.h
> new file mode 100644
> index 000000000000..fd3fd09cff52
> --- /dev/null
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_SPINLOCK_H
> +#define __ASM_SPINLOCK_H
> +
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +#include <asm/qspinlock.h>
> +#include <asm/qrwlock.h>
> +#else
> +#include <asm-generic/spinlock.h>
> +#endif
> +

Along the same lines:

I think I'd prefer the header changes to be done in the asm-generic
version of this file, so this can be shared across all architectures
that want to give the choice between ticket and queued spinlock.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
