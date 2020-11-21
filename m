Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB2DC56202
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 00:14:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B642024101
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 00:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eYsJdLjb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="lFf95V8U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B642024101
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=o1uIW1pZBAYZFibyWflbEZQkq5Mk7fGypelc0DKze8E=; b=eYsJdLjbDP1AwY5LjDHoj1ejR
	64XTdIl9iTVliYYsizxRO9OaH/cmG0w6+tdZbdbsb84Xs8Do07JcFQLgMzVV6qbhBjklukpQdDIxv
	44IEoPYlpTkTL//PETWX7KSp03Ti+pjOlWe9WpC2gF7rK/RkQWOaT1TVkID87Es0OzhUJXtLAhfkn
	6yTVOCc9HrmltrkN3WojXV4AGJOsxMoZLKLfLVTzvyt6ebffaYvZdORw7VxujPD6J9Y5/yDpU7oDA
	yMqajXJy0nvLr45pN9xc+tAJP9tx7RVxt6avX/8l3bz9zVou527FfuUr+hNQovC0RT02jaNMC01Un
	ObqWxInjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgGXh-0001I8-Ne; Sat, 21 Nov 2020 00:14:17 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgGXe-0001HL-Gl
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 00:14:15 +0000
Received: by mail-pf1-x444.google.com with SMTP id b63so9422980pfg.12
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 16:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=U5bxGcfchBQVmEBBbdQ2iExVkYUOiZ88oTXx0NbjtJo=;
 b=lFf95V8UJCgnIR3tVTNzhQbMvHSGH4PFeD3IW3zbQXYRLFulE0tlnHgaGHzjcWqYCu
 M8hHkR/53SfKqioD8PcoDSfRujcXhIfaQV/4wscMe5p1veyQgpfnkiGNMlG/iFFlELI2
 R+jnrlb1lcIbvdAaHM80Q1jzKSH1tQNe0fSdBqV+D0J2l6PK0FnBuYUGjD0oRfCtkbWb
 yBRMmO0oU2eAqpZ68t1sLuhcE1Me2ig6IovdpGz7YsZAS6IFKYitGTBaRwTawdo2ydOr
 1RqKRPvktkKjlrAcwx+nFGdl7vDUwEmNz5ozQf5b7IvvVimu2MbKVYNGjiltrDPohpN2
 XzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=U5bxGcfchBQVmEBBbdQ2iExVkYUOiZ88oTXx0NbjtJo=;
 b=B5M058ORYzw16if1IdoK1zBBBLkGW9WOEFoBNPqQRSpaToGPdZhFaOtZoeBUtKzc1S
 0kFjzXxyfXXtT4GOgXbDpwmh8RHV41GBZO98CkMbmlvZHxT02JDvcxjaJNSR/gIk1k6z
 p+HaKujQ+2cwnNXa2hsY1fGOVHsNEuyc+PY458mRvb+W3Ok8ZW5Agm9nsr0ggEtsv21q
 beNsKU/JUhyk0U2xuhTnW3WJMx03xC8xSk1f8GarACB8Nnmpn8ekIcTRtqG3Ml976c3o
 lpCdMG9vxj9b3FS1rhUd96C124mHgQk3wrdxHYPLHNAv7gDIqglsyL1YIx2tdU8Lv/M1
 T5mQ==
X-Gm-Message-State: AOAM533kjzLGiiAXZStDif0s2S41tkTjSm9k6Wka8KTlNjrH0BRbTpv1
 ZGh8IU3VhbyhveFRvUTprj7GzWqzdX8KXwyG
X-Google-Smtp-Source: ABdhPJykWdoCK3edkgyoG1Ve3dUjBWdlHpE0EPxnlt+Lx3ZCannMjWZK+ue4hlwPPCKu2iPp9+fvsw==
X-Received: by 2002:a65:684d:: with SMTP id q13mr19480014pgt.372.1605917650458; 
 Fri, 20 Nov 2020 16:14:10 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k8sm5080220pfh.6.2020.11.20.16.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 16:14:09 -0800 (PST)
Date: Fri, 20 Nov 2020 16:14:09 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 16:13:38 PST (-0800)
Subject: Re: [PATCH] riscv: Explicitly specify the build id style in vDSO
 Makefile again
In-Reply-To: <20201108203737.94270-1-natechancellor@gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: natechancellor@gmail.com
Message-ID: <mhng-f056461a-d53c-4405-b514-1d01dba13cc1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_191414_595168_AA47C509 
X-CRM114-Status: GOOD (  17.85  )
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
Cc: natechancellor@gmail.com, clang-built-linux@googlegroups.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 08 Nov 2020 12:37:37 PST (-0800), natechancellor@gmail.com wrote:
> Commit a96843372331 ("kbuild: explicitly specify the build id style")
> explicitly set the build ID style to SHA1. Commit c2c81bb2f691 ("RISC-V:
> Fix the VDSO symbol generaton for binutils-2.35+") undid this change,
> likely unintentionally.
>
> Restore it so that the build ID style stays consistent across the tree
> regardless of linker.
>
> Fixes: c2c81bb2f691 ("RISC-V: Fix the VDSO symbol generaton for binutils-2.35+")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index cb8f9e4cfcbf..0cfd6da784f8 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -44,7 +44,7 @@ SYSCFLAGS_vdso.so.dbg = $(c_flags)
>  $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
>  	$(call if_changed,vdsold)
>  SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
> -	-Wl,--build-id -Wl,--hash-style=both
> +	-Wl,--build-id=sha1 -Wl,--hash-style=both
>
>  # We also create a special relocatable object that should mirror the symbol
>  # table and layout of the linked DSO. With ld --just-symbols we can then
>
> base-commit: c2c81bb2f69138f902e1a58d3bef6ad97fb8a92c

Sorry about that.  This is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
