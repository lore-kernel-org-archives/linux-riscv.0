Return-Path: <SRS0=yw/l=N4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BF9C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 02:42:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD0C20858
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 17 Nov 2018 02:42:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cd7hjjpR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lixom-net.20150623.gappssmtp.com header.i=@lixom-net.20150623.gappssmtp.com header.b="x8B41Iyq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD0C20858
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kTfpt+vQ/pWTc/DlXiag1qGvrAV289K9nn3i+7JQbZk=; b=Cd7hjjpRqRqUpR
	cLeJqXZqIJq0x5wDkG0wbH50/0EgFZAkMQOpswc4iqkN2tLb3jG+wF9rjRup1AMmEfjc9ra1Ef9WG
	jw4A1wV8vSrOnwCj6oQFnT90R5zeFC9xv4jWU7B7XHme6FceOPWmMhpGAAxS5PfOP//uWysQ9/LOu
	X9539tUR9btAZVlnhNWv35Ksqk++HAo4xV2N1V5VKSTzvW/uwoSY+wPWNMRHcm7frf/BCqWx7u3Ex
	aXRSIWZJQtP2aVRQ9c7Cg2EY39L7CZL+mEpCxoYwaC0LOBXKIHcjaKfx9JJn6+kUekSl5oNSZdqHm
	0ScgG5e25hr0H38WujMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNqYQ-0008NI-J2; Sat, 17 Nov 2018 02:41:50 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNqWn-0005WT-HV
 for linux-riscv@lists.infradead.org; Sat, 17 Nov 2018 02:40:12 +0000
Received: by mail-ed1-x541.google.com with SMTP id h15so16369832edb.4
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 18:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rK55K10od5KYXUDhRkOOQG4qCOgAE6VjlwueDIfT6eE=;
 b=x8B41IyqwkR+8JIku9ErRUCcujMhepzC/abYbKH23pqdpBn+js3qL+qnaZZo6+BhX3
 h9ma14kxxPc9tMriWk776mL4cAK2e+o/LEpzjG7ed/FewyKZ+D/DKBATLkvLZNr3S2Zs
 Tqjalqs35PO+YhgIaF7/eWkroXKUw0txp+b79GPtJ/G67VG9ZXKnCH9SILU2tZf/Sd3c
 6jp5UjuRTxPfcS+3zH2EP0vrsB7+aPWVgaXOSpCyRkt7tc9fwdoocOUZs+Rnvr2ENW+s
 i6DPzjKRiS+xWx34Ub3jpQr2snImC4jmrIJZO644goWi1GekpTZPc7PoHZCgNgsQWTHc
 6eAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rK55K10od5KYXUDhRkOOQG4qCOgAE6VjlwueDIfT6eE=;
 b=Rz+OT+2OrfJ6r89i3PZ79uQbYd1Iw9LrTRp6D02Whf7fpG0KTL536iil/kDXr7xwyk
 9spjG9VkGmCOgtHSk2u7NQmS1zfy7ZCYg/rQlGSA2XDmmS386ZTFSatU20rCszx1ATpF
 ASdVVx2y1p5u/8/AGqwUPZtWZMZ7+/oIe9o/fI3nhvyNrAa7SmqaTS+Neb0DToVXB7p5
 82CoWg3QzCtHBSIcmkedICGeYExD/LMr1J1EsYJre/7XMg3FP143G+153LTg5llHA/OF
 B2E1JgMmUYb7e0j0rz5BZy16VLj7SvB0Vx/Wg9ybcbD32cktxIOVb2uxOoM5klOX7YEc
 6gEQ==
X-Gm-Message-State: AGRZ1gKlt7gr4QtQBNKgyFMzL/4Sny5qhsfbt2y2FmTNdERXJcLBMEyC
 JPJtZ2aLvyVjKR+SPSWTSjH4J4636USEwfGB8OxxxA==
X-Google-Smtp-Source: AJdET5cKorbgQ61H/+F6Jrw4kmXqbASvSbu+gyYqO0Xk5gvvO6TRn/jKC47N3/5oi5l3Hg8nGfcYhnSmWl2ekXSyK8k=
X-Received: by 2002:a50:9977:: with SMTP id l52mr11142793edb.277.1542422397183; 
 Fri, 16 Nov 2018 18:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20181108190239.29633-1-david.abdurachmanov@gmail.com>
In-Reply-To: <20181108190239.29633-1-david.abdurachmanov@gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Fri, 16 Nov 2018 18:39:45 -0800
Message-ID:
 <CAOesGMhgBxu+L-R5OaEdBjv4jGSY3AnB9LqaKvWKKUgEKBabjw@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add asm/unistd.h UAPI header
To: david.abdurachmanov@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_184009_611459_84C80BDA 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 marcin.juszkiewicz@linaro.org, linux-riscv@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181117023945.hlVbFj8L4WfbzSxJ2OZxfk_Pmsg4Ty9svxEB4HIz88M@z>

On Thu, Nov 8, 2018 at 11:02 AM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> Marcin Juszkiewicz reported issues while generating syscall table for riscv
> using 4.20-rc1. The patch refactors our unistd.h files to match some other
> architectures.
>
> - Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT only for 64-bit
> - Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
> - Adjust kernel asm/unistd.h
>
> So now asm/unistd.h UAPI header should show all syscalls for riscv.
>
> Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
> generated asm/unistd.h UAPI header thus user didn't see:
>
> - __NR_riscv_flush_icache
> - __NR_newfstatat
> - __NR_fstat
>
> which are supported by riscv kernel.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Fixes: 67314ec7b025 ("RISC-V: Request newstat syscalls")
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>

Acked-by: Olof Johansson <olof@lixom,net>

This fixes the 32-bit build error I'm seeing here as well. Palmer, it
would be nice to have 4.20 compile 32-bit kernels still.

Per builder logs:
http://arm-soc.lixom.net/buildlogs/mainline/v4.20-rc2-133-g1ce80e0fe98e7/buildall.riscv.rv32_defconfig.log.failed,
actual errors are:

include/uapi/asm-generic/unistd.h:247:29: error: 'sys_fstatat64'
undeclared here (not in a function); did you mean 'sys_fstatfs64'?
include/uapi/asm-generic/unistd.h:249:27: error: 'sys_fstat64'
undeclared here (not in a function); did you mean 'sys_fstatat64'?


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
