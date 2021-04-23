Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BC0C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:00:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEF4661458
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEF4661458
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=e7DTPU1tsZaK++kZTyoreKRJEMjhW8OoTGJ6FvAff7Y=; b=n/m8PXTU7Aa+iDiOA7etlJf6j
	28F6C3McPljslL0rfKFWWQ6noIIsx702kZd4Rx+bTJzPAa5sy1lz6Nv1BdFHjUBVLrWv5ErJe6gpB
	n3culNqpWqKAvjPJdev4fYFgUagqA38nMyEoWpxFcmtN9c5Nhrr/WycDJNLCjDdcG6yI43Us3vsAC
	bmknJeBCY3qTZ5FPdeH2G3pWjPJwPvO7rz/pVvhZfX16pMC/AvtGH2EflymiA70KuutiaH4T5zcID
	HqLySdKfrCpV7RQiJd0U7yWHfPlW3rw8bk5lA9JTZjwtaLSq3vrVocQ50Uu1/txGdsmrLosOrEyGh
	eK17RzTfg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZm3S-000Q1w-Qi; Fri, 23 Apr 2021 03:00:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZm3L-000Q0G-MW
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=Yuz8rImO9QvcmswnwQEKGjBpNkKgF5UoZuyapY7pMSc=; b=HDTCaqdxIZBWSy7GyZOPbz1/FY
 8EhBBgNij25AdCyT3r/5JvUNSEXJHGFxUHPbWXwfmJ/NykmGATImLfS55hHDwdn9gnOGpnhSnFdoV
 XUMEdqbKIdUhtUeLoiOvQ5wQ2mrLF7JdN3/vnos+hx9xXxFP7JQhk6Ld3bN8FDJIVlB5Q2WKVa9N3
 UPJ+3sNmZyHaK+ad7pBL0tbXpCzc0UPRSL+u/9UfGlqhEDWEZYrKmHu+/SWkyngJwSmb5o32I77v5
 W/hBNXLhkcbLGhqs5kqJmbgwPFBxWLPAzqrbHiX/x+j0no8c5VoMMCHO0V0/frAVGNUwHdudvm/xr
 LXYfpdJQ==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZm3I-00E6ha-UU
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:00:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id q2so1175481pfk.9
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=Yuz8rImO9QvcmswnwQEKGjBpNkKgF5UoZuyapY7pMSc=;
 b=b3AHnJGemTwQxl90/kbu1StYrivLmy7YgLjPLYqYUyHyNE9mXeoisIEmEQdWQ5ndfA
 mpiNkHtTPv5jvWfiUf3UlRD8T4AiixsVkCCizRSoco4HQimffuJvQ4wB7OsFna9iM352
 AclMWn7I2lveN5gZqs9d3SoS9g3YHyUrskDv2nQOjWEbpCzl7F7jo/3KvoQZOExZU1Qw
 rYTUE9yfIBLHKJ1JjwUh4KQMyu0DAAJJ0wybvIJGDjYyIgHDE0FvbNufxpkomxQUYZp0
 UJrm2hR+b6Mst+lzsncgj7lsXZiYSmTNc7Lcgaqz+bNYd0hgOPxgrTFNQHR01LuGHaB8
 6Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=Yuz8rImO9QvcmswnwQEKGjBpNkKgF5UoZuyapY7pMSc=;
 b=EVPkiBhwoHmOKttfO0fzugACbNsSrmt37Es7JmfGs4/bTNL+hNTjy4c9jCGh19ND/L
 M0t23uAEzJBPN7SGThqcXOa5Id2G26Y/VrMKlMyabc2eDfO6xyKrfl4DNf6Q/R22HoAP
 da05sh0zZlzyctsdIfJXHTOOiydm1isgBXTPCT7cZeUkcQBRjezbcqxWvFwRMsKpZlG7
 jsQrCzRNmKvPr1u47/dUNNIxzG29MfTJb+EsXF5CqZzHP4gKzQlHz6ZRhxYNsEhLhcaS
 BvpTgyXlKhDI1eK8NjDWZ7q+LkFLXU37X3eIR46UXXLAgl9pvY1U/w5XbxpCffWXg5NV
 ijQg==
X-Gm-Message-State: AOAM533KzRcmZQBLIf6v83K+IumlSQaCogzQZ7pa4bPSUr2DIc5bqGfo
 bXLdqx8pjf4DADACK0fDSMzG8A==
X-Google-Smtp-Source: ABdhPJw1ENnnLu4yx6yCfd1Fz7CLQQpvpo5VQtb6awr85h0hE19vPBHdzSI44tEwI6Qi/BorPWD4zA==
X-Received: by 2002:a05:6a00:1c54:b029:261:fc0f:15f7 with SMTP id
 s20-20020a056a001c54b0290261fc0f15f7mr1728960pfw.30.1619146819902; 
 Thu, 22 Apr 2021 20:00:19 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f135sm3120048pfa.102.2021.04.22.20.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:00:19 -0700 (PDT)
Date: Thu, 22 Apr 2021 20:00:19 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 20:00:14 PDT (-0700)
Subject: Re: [PATCH] riscv: vdso: fix and clean-up Makefile
In-Reply-To: <20210402212908.6f9b9686@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-847a8bb0-7c9a-446a-971c-ede38543cf56@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_200021_022022_C5879D31 
X-CRM114-Status: GOOD (  23.41  )
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

On Fri, 02 Apr 2021 06:29:08 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Running "make" on an already compiled kernel tree will rebuild the
> kernel even without any modifications:
>
>   CALL    linux/scripts/checksyscalls.sh
>   CALL    linux/scripts/atomic/check-atomics.sh
>   CHK     include/generated/compile.h
>   SO2S    arch/riscv/kernel/vdso/vdso-syms.S
>   AS      arch/riscv/kernel/vdso/vdso-syms.o
>   AR      arch/riscv/kernel/vdso/built-in.a
>   AR      arch/riscv/kernel/built-in.a
>   AR      arch/riscv/built-in.a
>   GEN     .version
>   CHK     include/generated/compile.h
>   UPD     include/generated/compile.h
>   CC      init/version.o
>   AR      init/built-in.a
>   LD      vmlinux.o
>
> The reason is "Any target that utilizes if_changed must be listed in
> $(targets), otherwise the command line check will fail, and the target
> will always be built" as explained by Documentation/kbuild/makefiles.rst
>
> Fix this build bug by adding vdso-syms.S to $(targets)
>
> At the same time, there are two trivial clean up modifications:
>
> - the vdso-dummy.o is not needed any more after so remove it.
>
> - vdso.lds is a generated file, so it should be prefixed with
>   $(obj)/ instead of $(src)/
>
> Fixes: c2c81bb2f691 ("RISC-V: Fix the VDSO symbol generaton for binutils-2.35+")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/vdso/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 71a315e73cbe..7b9f505ba82f 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -23,7 +23,7 @@ ifneq ($(c-gettimeofday-y),)
>  endif
>
>  # Build rules
> -targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-dummy.o
> +targets := $(obj-vdso) vdso.so vdso.so.dbg vdso.lds vdso-syms.S
>  obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
>
>  obj-y += vdso.o vdso-syms.o
> @@ -42,7 +42,7 @@ $(obj)/vdso.o: $(obj)/vdso.so
>
>  # link rule for the .so file, .lds has to be first
>  SYSCFLAGS_vdso.so.dbg = $(c_flags)
> -$(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
> +$(obj)/vdso.so.dbg: $(obj)/vdso.lds $(obj-vdso) FORCE
>  	$(call if_changed,vdsold)
>  SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>  	-Wl,--build-id=sha1 -Wl,--hash-style=both

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
