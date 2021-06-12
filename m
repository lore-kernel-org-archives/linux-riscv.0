Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5412C48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 23:26:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8001760FDB
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 23:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8001760FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htVbDLP0nqtKJolHovkmBeqipdn887z2bgXS4iEm1Y8=; b=FxoR1Q9VHZOSJM
	+l5YCZXi9aQ72Dg5HubeOoBwVUJNU++9mbgCApJd3IfH1EJRt6si1PfhwBuGSfMI5kSVjv1/n2myd
	UtDMYO0BtdQw7LkiKt0VN3H0MrFIl+zHaVi8tP0EuUJ3qH7LFnCqOJ+h2EvqJtvKOKR+TG45OlZAm
	+0nn9brcsOEcEr4M9c5so0QQtnuZJxsowBLwdvHIHMabgv90NcbdGxmGhXARZvGNK7RNCrStYWy5J
	DcucgApLmMo57GZc2KBjA3K7lu761b3T6Jgp38LCHBGO1ExYddnCDhJenT8QUw4uEpKLInn1HGq7w
	syj/3Sb0P6zE94GKtq5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsD1B-009Ikz-Nf; Sat, 12 Jun 2021 23:26:21 +0000
Received: from mail-yb1-f174.google.com ([209.85.219.174])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsD18-009INp-Cx
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 23:26:19 +0000
Received: by mail-yb1-f174.google.com with SMTP id g38so9775397ybi.12
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 16:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UJvUpxxUz79lLuDu+DpE+fZYWMRbYUvVJx4ks7pc19U=;
 b=DmQcda/f+RdMVBor+q96+WlzKA7xQ+hmjPcyodk+MrY04fJVhsgzJCIFgInoN8sUyr
 dSCReVdFiwZyiTz4n5wU/E+T05DHiKl/NCWWo5AcMP4X+FoRl2ucOeTg8ARE8ESHgNgI
 tLPhtxXzDD05e+GjF+Np0vP84YRP/Xikp76LcEK1l3wJePDEKYGhveKHel/3rTmPG0xz
 3qJr/9l46D+BvVJ3ubLqp5bW5l/ENFCp5DbyjyZJ7ARXLiRSfrI/Lyrb3Rgmk8nqC6EA
 LbGk0thFsC0NO9Hdu4bCJueqhEMWz8WdLP87nxujJdPm1gw6uW4DeFkw9FGFhVfaafc1
 q91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UJvUpxxUz79lLuDu+DpE+fZYWMRbYUvVJx4ks7pc19U=;
 b=i2tvAcR/NplqKlAv2Rx6lUe/yXz6gcXwZkbrFLi6ZodbhE7cjk4+BXmSEmz++cNRrK
 cJXCEiiaPCzbMHtlPEi4+/qAMlOoi6vEunNR5P0W4DpMVFTp6xWcxuEB7s4hmYveciz5
 iDFjBoFCLqCEWvnkZkv9MmsLFsYaKm1oln+ovHeDfxCrwf4nX6y7wPGa3w2OITEeLW0m
 6pnyatK+1ZDYVh53nkmHD04yNAysgNs4uVAYiO45LF4oyGKMWO8TOOsk/IhJLt2+F2yv
 TVrOrAGy1vAOmerVI/MIgnd3oWAGK/Cq+4ZeuIt1IkHfLrMJMTi2STN9qi0YbmPMreGD
 DwiQ==
X-Gm-Message-State: AOAM532zG/Ys24oRrNMGm0d3m3+MQphm7SI3/Rkz3oyRAjrcY9F9LPle
 i0VZ+x6cGzikVmMwc19b8nt2TxJHorlN8Bv2JcM=
X-Google-Smtp-Source: ABdhPJxL7FtlAhag2R0WiXkfjm9WzWMAW0S5Upbz/p6qgfkPgXylLiQ4hnJcuXVFQQ/MfrvQ0eKivkVuA4TRlGJEDjg=
X-Received: by 2002:a25:d4d4:: with SMTP id
 m203mr15640674ybf.393.1623540194716; 
 Sat, 12 Jun 2021 16:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210604114950.1446390-1-alex@ghiti.fr>
 <20210604114950.1446390-2-alex@ghiti.fr>
In-Reply-To: <20210604114950.1446390-2-alex@ghiti.fr>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Sun, 13 Jun 2021 01:23:03 +0200
Message-ID: <CANBLGcy3HrnmrweSpnDZViVstoWJYh4sCBoaX_24AsgWd=Q9XA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] riscv: Remove CONFIG_PHYS_RAM_BASE_FIXED
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, 
 Christoph Hellwig <hch@infradead.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_162618_467111_E611D1FB 
X-CRM114-Status: GOOD (  19.94  )
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

On Fri, 4 Jun 2021 at 13:51, Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Make the physical RAM base address available for all kernels, not only
> XIP kernels as it will allow to simplify address conversions macros.

Am I just reading it wrong or won't this patch make it so that the same kernel
can't run on two chips with physical ram starting at different addresses?

/Emil

> ---
>  arch/riscv/Kconfig | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b58596b141fc..3d8e7e4bb45c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -493,13 +493,8 @@ config STACKPROTECTOR_PER_TASK
>         def_bool y
>         depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
>
> -config PHYS_RAM_BASE_FIXED
> -       bool "Explicitly specified physical RAM address"
> -       default n
> -
>  config PHYS_RAM_BASE
>         hex "Platform Physical RAM address"
> -       depends on PHYS_RAM_BASE_FIXED
>         default "0x80000000"
>         help
>           This is the physical address of RAM in the system. It has to be
> @@ -512,7 +507,6 @@ config XIP_KERNEL
>         # This prevents XIP from being enabled by all{yes,mod}config, which
>         # fail to build since XIP doesn't support large kernels.
>         depends on !COMPILE_TEST
> -       select PHYS_RAM_BASE_FIXED
>         help
>           Execute-In-Place allows the kernel to run from non-volatile storage
>           directly addressable by the CPU, such as NOR flash. This saves RAM
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
