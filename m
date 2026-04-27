Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29580FF885E
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 09:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e8PYzgFc9wIHOt4JiG7QQ96mapfJDQhDZmkRvn4+jyo=; b=Le6/x4ENCvm55X
	oE9oTmCBL+wz4iUM4qORQTWLFBHL4gcSBx86oPSVthlK/v2hpQO4d267pZPKzbTxnaAfA2hAceWVO
	4juMQ3ark4KDqB8Teb+DmKCID/JM3cMOl+OrlV/6o+r5hunSUSHXts4/MHjM65rO/Kk4QviPTU7KN
	RireJotyLSzbddTQ6Y1IHgPgSRknyd4yCaDzpxKsCFk1/MvoaNS0GMrNQs2tuBhTGE0UwfmSTFd9t
	9o27yAbFe0RY++Rxem+3Qc8XP/A9aHyLypYkwECQgYMVjJDwV0D7xlrIfPjuJEGziBKY4Qb1/jOxF
	sBQu+b0vcg1fr76WQZqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIHT-0000000Gafx-0a5d;
	Mon, 27 Apr 2026 09:29:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIHP-0000000Gafc-3TTK
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 09:29:29 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso51648875e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 27 Apr 2026 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777282165; x=1777886965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhBsUsRnxGxteXWit32fczP20HqInrjs7pD4raLih9A=;
        b=CUrAs7RDth4UFZSBotCfTuaQ7Dn63FzXaKcdCwtjcD0nXQZF6owwquszZn55I+KkBM
         9BTgiG76T4yRMlzATjJfNh6MrtzMftnq4kYT0Io+oWVJVk7DqdFxwchFQv49rmPSlbR5
         t01W9fAOM5UIMB7/lqsHYLdsgNOKLA8rS0IYNalIAwkKWNoxgK7lIsQ/bBaTsnOdLapT
         izoOUT7rNImbzpb7mV4BopKn8TuCtabO8SPayVCWZIlkWw+IV28hJeJdfuCK3+n9LDZq
         W9StnYN3jCmkMPnGIoLLB+l3NO5/8NIrQTi3bHrga+QJZbdGYiNE36wnCYefRVK8WT9Y
         NV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777282165; x=1777886965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qhBsUsRnxGxteXWit32fczP20HqInrjs7pD4raLih9A=;
        b=X3n+t9zb98Bw+KLM6kcXiGN6MWn5LUmQG8InFSz8AHVK6UGYcflHt2OlElVbiVFFnP
         bE2tcIzyXUPkQ6GCKll/5obXCIvdAeZE8fmmT3LTv57dLaacspSPcEecMZ3AFKqvwPoV
         jVbbZJMcidIgqrVcBm5fA8Y0BbiasOEzSMtgu4uNLYjbi04afP4Q6QHz0kijoTo81/Sz
         H+wLQhD8TQ8viZ5CqqTSqWeJYtp6V4aHTi3+LDIaPchKzqUTTnrhbFMLYYEcbjvv9gth
         ZXo6OQk5rOvN5sr5fewa63D1SJ0ZNmNsrrA45j2J6xmn9lZHwWsfnzEnxbhqmxgO1iD4
         +eRQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Q2o1yaTrKDn1mzalOLUpYSxIUV+d9tanrqL9OGMh8UZaWW41HrL9Qdyyknt1d1naJiH761xLOQ8D0WQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6h1C3ikByFkOoYQPniLTuB4CU0RsbhHdJEZb18+b8q8XLDKKs
	dpqPyRdK37836etc970VdHAbxJo+X4h1Txo0x5m4q7Zsl9ctGVdYDIu/
X-Gm-Gg: AeBDieu/4CDHT4RknuLsz9pBcZ9ml8AZgP/kPqi2jGAQ8BrAL/384rTUfgk/LFVW48F
	ogdeca3bcXAcFGdPvjGxkyNWepJxExYmAsLRxMoLunLoBJsOVqOiRDNpd+TpOdeIJYSCMtwZ7SV
	5WhYGz/3yC1MOW0AkxTQqDHpZel4W3t1egTqv4nHUZ1kSjY4YQPIyWvm5NANANacIFXGb2UbfSW
	/Bz2s8eo/MGFPRcXNiR6MH0rqMm3jEG4I5lhvd98vc21MKJlzWzpmcOdzG6wc8wC6g9zX17brFt
	AMzQUh98t0W1BcmFEhVf0KUn6HyjvB/2VWrU8Auxker4/Z7+ekFvDllH3RtuvLUwr1b1fY3byY3
	v7DrIOu+BZVvDcSNBB5hyQvhA7/mQcJ2cOvJPNvTsMsjOVCgYr1WLmniEtCutjdPQ6C3sbaDzS9
	DSdBqCGqY5ZvJwsk6aqWAnRpYOxk+dw5wG7b2+QPmaS5EExaEFHgFAUeqO8N3YWF5qt8WEvc8jK
	qU=
X-Received: by 2002:a05:600c:c177:b0:486:fb0b:ad79 with SMTP id 5b1f17b1804b1-488fb78129emr534667615e9.20.1777282164670;
        Mon, 27 Apr 2026 02:29:24 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb7ac6aasm249078295e9.25.2026.04.27.02.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:29:24 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:29:22 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Ard Biesheuvel <ardb@kernel.org>,
 linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] riscv: fix building compressed EFI image
Message-ID: <20260427102922.08d0bcda@pumpkin>
In-Reply-To: <20260425185151.477442-4-dmantipov@yandex.ru>
References: <20260425185151.477442-1-dmantipov@yandex.ru>
	<20260425185151.477442-4-dmantipov@yandex.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_022927_930782_0D601054 
X-CRM114-Status: GOOD (  17.09  )
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

On Sat, 25 Apr 2026 21:51:50 +0300
Dmitry Antipov <dmantipov@yandex.ru> wrote:

> When building vmlinuz.efi with CONFIG_EFI_ZBOOT enabled,
> '__lshrdi3()' is also needed to fix yet another link error:
> 
> riscv32-linux-gnu-ld: drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
> __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'
> 
> And since riscv64 can have CONFIG_EFI_ZBOOT but doesn't need
> these library routines, rely on CONFIG_32BIT to manage linking
> of lib-ashldi3.o and lib-lshrdi3.o on riscv32 only.
> 
> Reported-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Closes: https://lore.kernel.org/linux-riscv/20260409050018.GA371560@inky.localdomain
> Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v6: adjust to match recent upstream changes
> v5: rely on CONFIG_32BIT rather than dedicated Kconfig symbol (Ard)
> v4: use more meaningful CONFIG_EFI_ZBOOT_USE_LIBGCC and adjust tags (Andy)
> v3: initial version to join the series
> ---
>  drivers/firmware/efi/libstub/Makefile | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index 983a438e35f3..e1c11d02a5cb 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -95,7 +95,9 @@ CFLAGS_zboot-decompress-gzip.o	+= -I$(srctree)/lib/zlib_inflate
>  zboot-obj-$(CONFIG_KERNEL_ZSTD)	:= zboot-decompress-zstd.o lib-xxhash.o
>  CFLAGS_zboot-decompress-zstd.o	+= -I$(srctree)/lib/zstd
>  
> -zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o lib-ashldi3.o
> +zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o
> +zboot-riscv-obj-$(CONFIG_32BIT)	+= lib-ashldi3.o lib-lshrdi3.o
> +zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(zboot-riscv-obj-y)

Doesn't that specify lib-clz_ctz.o twice ?
I think you could also use:
zboot-obj-$(CONFIG_RISCV)	+= lib-clz_ctz.o $(if $(CONFIG_32BIT),lib-ashldi3.o lib-lshrdi3.o)

	David

>  zboot-obj-$(CONFIG_LOONGARCH)	+= lib-clz_ctz.o lib-ashldi3.o
>  lib-$(CONFIG_EFI_ZBOOT)		+= zboot.o $(zboot-obj-y)
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
