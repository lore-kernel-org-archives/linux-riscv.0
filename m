Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB2CC83F11
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 20:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM9nm4EmMANxNxqlAk7fIgxtlDh9GEr2rjLFhP7lsdo=; b=f9+Ek3nTqe7Xrg
	5TXzd0vcLW1vHR+ztA0A+3fZYBkXCYk/nehPxKb2OeD6BCpaKWpAkbaIAnXC7lq612vNVouzqfGyB
	VLQYK+iy5uXDeO4HU4EZRoq/KGEHp9y+ydAxS3z1Azygehc6xRZ9qQ6NDT/IWibSm8w2ka60mN0JN
	haX3spf1axve+TOQljLTQxAlFvOl2Dh3BRXAkLWUVXxLbD74jRJb1VQYCLUYSa8yanBgIH8GQjPS6
	xQBSBoikeDJTPhR2FVx5n28jaO1MpCgAVgqBfZdByHA2liOJgTQN5vTWivBGPg/KSesbYD7GLmh4i
	PeMVf24vckaXjw+9wS1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMTu-008RN1-18;
	Sun, 27 Aug 2023 20:35:34 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaMTq-008RMd-1C
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 20:35:32 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c93638322so538407866b.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693168522; x=1693773322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tdmuji/W/78o9EtHwL+JzoXBf9mqsVcxBfeCxlt2PZU=;
        b=aKgXg3fVYHKOzKjCht8IRUo2h7TYJ/yKSoC/n3RcGVetO4Uu331be4SzHs8VbEoyZH
         5PA2lAL3iRUp8bRAdM6e1y407h/zKUKbXy2n0gTTj0QPFLVqtKa8CMO+KT/zVTs3m/7i
         5BAYa5IZnr4lpPbCKq35T9n+jxys3kzID4xGZmAu2tcFd5WO6STkvtr/GY7R5PsOTvGq
         6dkFKsCdYWN9nXq1c131h/i0KIxhibsQGYfDLIagAAkkRlztQUH3VRLHdVViZpb7ue/N
         kj5e5/2VhskRCQghd80wponTWq10ySGgxRe+npr9X4wCG2X264XEbkqpaCq/xrnaRY6W
         wOdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693168522; x=1693773322;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdmuji/W/78o9EtHwL+JzoXBf9mqsVcxBfeCxlt2PZU=;
        b=g5q1OhrU6HDoo6fKGYHHFgWaCufWWKNB9WSxxbtdUzXzIiqem+2KvI7EULtHbFfBv8
         JhfbXOBosOV3MNN6pGtjjwWbtd4aYOZMsJD0aibv1RbKAazcYQJQO52YbmpX8ASIYEYY
         hdRY6UJS+R7TkrzL7P9PGqSOU803FhDeIyJuUYDM2LUNBeun1yEQxXigK/aloJLjTmzY
         /DS/Y/piMANqmfFuKBvZ6YRvF3Zaq0S12mtU65Ng11TtmgwuzOoLjBanTtpfrCzC0i/6
         aLh9tl6SKBH6ONracX6F+7pyJ2kPIPCj2YuqnOiOuOkdKxVm5dHkIllkAubP5yW61CKI
         5BZQ==
X-Gm-Message-State: AOJu0YywZRaABb8N8H2jr1m0PVelx5Hz81UgEFigzAj8ZEn7f8KO6iwd
	PYJYJv8rXvBDKBBiNrxTssc=
X-Google-Smtp-Source: AGHT+IGHniIaOVrRE2PcfpimVnCxJswxCY0hAnsvcig3JUrKxAYxOpkzgXqOvOr/2l1sAhAUOdcVZA==
X-Received: by 2002:a17:907:e92:b0:9a2:25da:d71e with SMTP id ho18-20020a1709070e9200b009a225dad71emr8748989ejc.0.1693168522455;
        Sun, 27 Aug 2023 13:35:22 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id q24-20020a17090622d800b0099d804da2e9sm3770795eja.225.2023.08.27.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:35:21 -0700 (PDT)
Date: Sun, 27 Aug 2023 22:35:21 +0200
From: Nam Cao <namcaov@gmail.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] riscv: Only consider swbp/ss handlers for correct
 privileged mode
Message-ID: <ZOuziWaJpYV0LfB3@nam-dell>
References: <20230827114003.224958-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827114003.224958-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_133530_412531_EC376025 
X-CRM114-Status: GOOD (  15.11  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Aug 27, 2023 at 01:40:03PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> RISC-V software breakpoint trap handlers are used for {k,u}probes.
> =

> When trapping from kernelmode, only the kernelmode handlers should be
> considered. Vice versa, only usermode handlers for usermode
> traps. This is not the case on RISC-V, which can trigger a bug if a
> userspace process uses uprobes, and a WARN() is triggered from
> kernelmode (which is implemented via {c.,}ebreak).
> =

> The kernel will trap on the kernelmode {c.,}ebreak, look for uprobes
> handlers, realize incorrectly that uprobes need to be handled, and
> exit the trap handler early. The trap returns to re-executing the
> {c.,}ebreak, and enter an infinite trap-loop.
> =

> The issue was found running the BPF selftest [1].
> =

> Fix this issue by only considering the swbp/ss handlers for
> kernel/usermode respectively. Also, move CONFIG ifdeffery from traps.c
> to the asm/{k,u}probes.h headers.
> =

> Note that linux/uprobes.h only include asm/uprobes.h if CONFIG_UPROBES
> is defined, which is why asm/uprobes.h needs to be unconditionally
> included in traps.c
> =

> Link: https://lore.kernel.org/linux-riscv/87v8d19aun.fsf@all.your.base.ar=
e.belong.to.us/ # [1]
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202308271841.HlnnHFL7-lkp@i=
ntel.com/
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Reviewed-by: Nam Cao <namcaov@gmail.com>

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
