Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E787BC05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 17:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gvvhhlK8sc3etnLatyqj+2SQXZlzXe29rkmiZ86Mk68=; b=aW6/81XJ9LT21MtF2xOOeRDfgy
	SBnmEj6bqtuKWzUpSs5HlXQo/owwt53+rI2vge/pU9TYsC+aypVohquuL3N+ksBa85YuGZcUUW5uo
	A0V144TDfa0VQNApgzeNhVbg/VfMD8ecrSEjMr8oiVAMJNOU/N0mECjgv0PB3dAep599ISpVEwEl0
	lNhYveJ28nCeQ+BxSG93Ik4wPvYCTxPKr1hLSFON7spXi4ck8e9BQ/ubQqBcAqzqibnWIZsKqzJRv
	NOywm3ZRd0AHzj5cRJvLMBYohhlgpVnfBeLuelyoOgiFD7gSUtfLXz8XilNFuNc7+wCP2JcwWI9a2
	yMvvYcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPog5-00GWw7-Cx; Wed, 08 Feb 2023 17:56:17 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPog1-00GWuh-R7
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 17:56:15 +0000
Received: by mail-pj1-x102a.google.com with SMTP id e10-20020a17090a630a00b0022bedd66e6dso3359144pjj.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Feb 2023 09:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gG/WkXZTAUlwvzHLZNVpvm8mQ39tyKfuQBX/kYBdkgw=;
        b=iiBzhEUvmFJRwoF+qVJzvzPb7b8rRGARPABcPQV9sI4+/QVnESZ4GsLPIO36w7l2wg
         wT1eHSfgxM/KFitaFrhB2cISovXV6b9GKnrJDBM8UkJbgBhS4/GgZ5MZhfkAaY/SLINf
         rTdStWKVdAwm7Xeo4+MdmGhI10NXBzeLoZUKbGaU9owSnrCg3IIyIHWXtwlQj9RKlf2l
         PKF/mhpK5uuqZlzvp810QvLvlglRPeDw6LT/0uyh+PsIOPiLTFSIzpM8qHn09C+72xcm
         ZwGEo0hdy3opgPTtQBn6+zyTSJj2gM3z9r5zm9Smzl+b5MGGVthl9/lHp1C3X03wrYNT
         KLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG/WkXZTAUlwvzHLZNVpvm8mQ39tyKfuQBX/kYBdkgw=;
        b=ZI/wE055xNksHfvBFDvKFtxzLbrdnwyEHiJMfKtJTewvgNPcntxPQ83gFohuncSL4N
         /wGRLg2C3YDFsqhQw4e5OsGd4RBHDJoQqr07NKxQ335ZYvYYjUfYX0hQUT4Sfd2PcZR+
         yvcqPOlfKnhH2svR+tnuZ+n2ZqlffFHcR5Z/s+20kYzrkp4xd4tBuuBXD89tJ2XcL58U
         v6Lt5FIwORIsAbsyIzXNAkzGIyI12ZUS2u96qJlqD8SoH+QAlN5CGWSuTB+N5fHd4vyv
         RgU+o4RDJqtpPZIYM+ZO1qaLCQG3bNNg4/XRFIHsYkQjZvgPqXNUw5f48UXip94LhWm+
         2RXw==
X-Gm-Message-State: AO0yUKVsdjm/JaSeHa/Qksx/+zTqDgVaTxHDjcLdwIXvBHVOLXozcfGo
	vM5yjOpnJ3aS7UXmMYizhrlMNA==
X-Google-Smtp-Source: AK7set+IvKf9JG8iTJHj7qXU2eE80ms2QI7mR9bDPaVSOxfo071drYvo75zvCNHaOlO+nG1YOZKYdw==
X-Received: by 2002:a17:902:e545:b0:199:60:b9c8 with SMTP id n5-20020a170902e54500b001990060b9c8mr10269320plf.45.1675878968150;
        Wed, 08 Feb 2023 09:56:08 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id s12-20020a170902b18c00b001949f21e1d2sm11208714plr.308.2023.02.08.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 09:56:06 -0800 (PST)
Date: Wed, 08 Feb 2023 09:56:06 -0800 (PST)
X-Google-Original-Date: Wed, 08 Feb 2023 09:56:04 PST (-0800)
Subject: Re: [PATCH] riscv: avoid enabling vectorized code generation
In-Reply-To: <20221216185012.2342675-1-abdulras@google.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, abdulras@google.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: abdulras@google.com
Message-ID: <mhng-4c71ada6-003c-414f-9a74-efa3ccd2856b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_095613_898647_DBF67822 
X-CRM114-Status: GOOD (  21.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 16 Dec 2022 10:50:12 PST (-0800), abdulras@google.com wrote:
> The compiler is free to generate vectorized operations for zero'ing
> memory.  The kernel does not use the vector unit on RISCV, similar to
> architectures such as x86 where we use `-mno-mmx` et al to prevent the
> implicit vectorization.  Perform a similar check for
> `-mno-implicit-float` to avoid this on RISC-V targets.
>
> Signed-off-by: Saleem Abdulrasool <abdulras@google.com>
> ---
>  arch/riscv/Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0d13b597cb55..68433476a96e 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -89,6 +89,10 @@ KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
>  # architectures.  It's faster to have GCC emit only aligned accesses.
>  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
>
> +# Ensure that we do not vectorize the kernel code when the `v` extension is
> +# enabled.  This mirrors the `-mno-mmx` et al on x86.
> +KBUILD_CFLAGS += $(call cc-option,-mno-implicit-float)
> +
>  ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
>  prepare: stack_protector_prepare
>  stack_protector_prepare: prepare0

Sorry to just restart the thread, but there's been discussions on this 
in a bunch of places.  From my understanding, we don't actually need 
this: we have this tricky line in the Makefile

    KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))

that removes the floating-point extenions from what the kernel is built 
with, so adding `-mno-implicit-float` doesn't actually do anything (and 
we'd end up with essentially the same thing for V when it gets added).

So unless I'm missing something, we don't need this.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
