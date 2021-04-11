Return-Path: <SRS0=IRtM=JI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E34EC433ED
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 20:36:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B2161028
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Apr 2021 20:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B2161028
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=ysQwNoP6wjuwEpBzaTdlaFTmHu1GImhFjvWpEZMuwqk=; b=MpAOkusePXH2AqlsnrEdpDesw
	+OQQgKDx5KLYFBMzC68oZW8IT4XuHWxa9cWs1AeTj6IVFIrKeHvNakqOuZW2dAxkqKZM1DZZv8cwg
	AY6Ke0HA9vh0NMVnW8qdmBNjkX3s2Lwun5MUtdREfFsWKV0Fu4cy/GvV+MMRh+rism5JrlAUlnVY8
	F7ZGS4BC6Bb8rc+7skb6jMOqa0duhUUi1QKP8bb3CSrXi75RJNxGNkJwnFZdXe7QMkGYb7kLNEzT9
	2TYXvBPw0JDwqouYRto/p077mvHpu92PeMkFOBT5qzh7zlkAPhx7IfUOd5FEMx3RRADnHdQbGL4NT
	vFPUcxxjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVgoG-0054FT-VT; Sun, 11 Apr 2021 20:35:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVgoD-0054FD-8u
 for linux-riscv@desiato.infradead.org; Sun, 11 Apr 2021 20:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=b/CaNV39sShXmEIRRd6qd6Dixx0bAywACpNaPhGDjYM=; b=zUtlYfTpiSxzQF8GEozv875j4H
 TMlQ/34I/sv1y7wBx5uhdppDNDT/1+7hnlykgLjqbacf1VQoDVI/dWIVNhbL74Zc66Abc4m1T+4Vq
 Bhi9yEsFR/Ukahp58nhWYWUiSZdWswBJeYfj0CKwKn0aw1mdRtldAt2/ZKzK2Zx3IOb5KOyQU+Xz4
 MY4wvvefTPcvIaHtkZdVifqKaKr2/lfx114S05bfK9Pb4TX22B81/e/4q6ZdTpes9sg6xFcC/+6Pk
 kBVn36ZwJQS2tWVWn2E68Q7HT1k59UNfjkUtGmixurkP6nh1+D+dXRs59stRFunscRgASn+vUHQz9
 yaGG5O3A==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVgo9-005h55-9i
 for linux-riscv@lists.infradead.org; Sun, 11 Apr 2021 20:35:50 +0000
Received: by mail-pf1-x42b.google.com with SMTP id n38so7845434pfv.2
 for <linux-riscv@lists.infradead.org>; Sun, 11 Apr 2021 13:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=b/CaNV39sShXmEIRRd6qd6Dixx0bAywACpNaPhGDjYM=;
 b=BOypHbvpUGw2Oa3TEgOtnY89yKfpFYd5tPfBv4ykEr1BhikKqWvNEJUC+oahvo7V6P
 LZCemHs+AsoP5McnwYy7ZlWqgQpSMrtyOuKtQcSoiIUjV3znjJUOWexJQO6mU7uZqkWS
 LJtcm0Z7gobw7q8nI/B0bqe3OkPLpahkHEXXd0dSeTyPFrKDEkcG4+QVjnQ7KEx2FNav
 fCyuJUYbZ80Du5Gt8GHS8y1qB0GxDQsV4Urkqq1dWokQyDqj3B+bN1GjTzaigBk+0DiW
 BbKISD9HfbVkPJnQwMNXO+9+hnHQtrydpTb3Zq/NO2kS3QIbCZ88raobl+EgHUpIEL46
 dXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=b/CaNV39sShXmEIRRd6qd6Dixx0bAywACpNaPhGDjYM=;
 b=Q8LR+/wt2ujDHcEgl2zECOY39Km6A7524nadGeiAh74Tb0HukK83iYUjZynFVSnhF4
 OTNLgsNJEJRNTtrUkFNiJFACmPBgApHO/Tm8xlq0Gf5dMo/JGfrKttbulwvqRc+VyOej
 yFfIrpP+yq7YuG3pIaAN4Rle7WUI06GRZa9MLfHuvtIuygVEkiTk5qITh0TWydTXwPPK
 QhiV/ICNsL92TAOUeCmY/TqiZReLIoeTrbl4mz12c/9Hxf/RERwlNmH5fDCPNrapAbmt
 lmjU2+2Wuf6Lbl2evdF3r2Z2b6SCScj7iqUThGGc75CFP1ek8ADA/cckteOhV/U9NZUs
 0LdA==
X-Gm-Message-State: AOAM531gzWHeWZYu5RcWCqnT5qQbetYU+2o07N6BmnsC63NQQhDRFuCB
 bCNDj2q3/JjQ1zw8iHt58IvoelulgURpmw==
X-Google-Smtp-Source: ABdhPJz2z9E5urFnuVpMcoaiJiImiOlxNjhwcd57cdLcajLBFypSJ0FdvtrMtD4wp77ph5QqD0helw==
X-Received: by 2002:a63:aa48:: with SMTP id x8mr23539960pgo.246.1618173347359; 
 Sun, 11 Apr 2021 13:35:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 186sm4567614pfe.212.2021.04.11.13.35.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 13:35:46 -0700 (PDT)
Date: Sun, 11 Apr 2021 13:35:46 -0700 (PDT)
X-Google-Original-Date: Sun, 11 Apr 2021 13:35:26 PDT (-0700)
Subject: Re: [PATCH v3 0/5] riscv: introduce alternative mechanism to apply
 errata patches
In-Reply-To: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Frank.Zhao@starfivetech.com, Anup Patel <Anup.Patel@wdc.com>,
 Atish Patra <Atish.Patra@wdc.com>, 
 guoren@kernel.org, alankao@andestech.com, ruinland@andestech.com,
 david.abdurachmanov@sifive.com, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-752a1f05-cc02-4464-90c4-67d8b1f5931e@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_133549_431824_E19CFDF9 
X-CRM114-Status: GOOD (  31.73  )
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

On Mon, 22 Mar 2021 07:26:01 PDT (-0700), vincent.chen@sifive.com wrote:
> With the emergence of more and more RISC-V CPUs, the request for how to
> upstream the vendor errata patch may gradually appear. In order to resolve
> this issue, this patch introduces the alternative mechanism from ARM64 and
> x86 to enable the kernel to patch code at runtime according to the
> manufacturer information of the running CPU. The main purpose of this patch
> set is to propose a framework to apply vendor's errata solutions. Based on
> this framework, it can be ensured that the errata only applies to the
> specified CPU cores. Other CPU cores do not be affected. Therefore, some
> complicated scenarios are unsupported in this patch set, such as patching
> code to the kernel module, doing relocation in patching code, and
> heterogeneous CPU topology.
>
> In the "alternative" scheme, Users could use the macro ALTERNATIVE to apply
> an errata to the existing code flow. In the macro ALTERNATIVE, users need
> to specify the manufacturer information (vendor id, arch id, and implement
> id) for this errata. Therefore, kernel will know this errata is suitable
> for which CPU core. During the booting procedure, kernel will select the
> errata required by the CPU core and then patch it. It means that the kernel
> only applies the errata to the specified CPU core. In this case, the
> vendor's errata does not affect each other at runtime. The above patching
> procedure only occurs during the booting phase, so we only take the
> overhead of the "alternative" mechanism once.
>
> This "alternative" mechanism is enabled by default to ensure that all
> required errata will be applied. However, users can disable this feature by
> the Kconfig "CONFIG_RISCV_ERRATA_ALTERNATIVE".
>
> The last two patches are to apply the SiFive CIP-453 and CIP-1200 errata by
> this "alternative" scheme. Therefore, they can be regarded as examples.
> According to the results of running this image on the QEMU virt platform,
> kernel does not apply this errata at run-time because the CPU manufacturer
> information does not match the specified SiFive CPU core. Therefore, these
> errata does not affect any CPU core except for the specified SiFive cores.
>
> Changes in v3 patch:
> 1. Remove "default y" setting of CONFIG_ERRATA_SIFIVE from Kconfig.erratas
> 2. Correct the affected CPU list of errata "cip-453"
>
> Changes in v2 patch:
> 1. Display a warning message if Kernel finds the required errata is missing
> 2. Provide sample code for a vendor who wants to append its errata
> 3. Create a new patch to workaound SiFive errata cip-1200
>
> Vincent Chen (5):
>   riscv: Add 3 SBI wrapper functions to get cpu manufacturer information
>   riscv: Introduce alternative mechanism to apply errata solution
>   riscv: sifive: Add SiFive alternative ports
>   riscv: sifive: Apply errata "cip-453" patch
>   riscv: sifive: Apply errata "cip-1200" patch
>
>  arch/riscv/Kconfig                          |   1 +
>  arch/riscv/Kconfig.erratas                  |  44 +++++++++
>  arch/riscv/Kconfig.socs                     |   1 +
>  arch/riscv/Makefile                         |   1 +
>  arch/riscv/errata/Makefile                  |   2 +
>  arch/riscv/errata/alternative.c             |  74 +++++++++++++++
>  arch/riscv/errata/sifive/Makefile           |   2 +
>  arch/riscv/errata/sifive/errata.c           | 106 +++++++++++++++++++++
>  arch/riscv/errata/sifive/errata_cip_453.S   |  38 ++++++++
>  arch/riscv/include/asm/alternative-macros.h | 142 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/alternative.h        |  39 ++++++++
>  arch/riscv/include/asm/asm.h                |   1 +
>  arch/riscv/include/asm/csr.h                |   3 +
>  arch/riscv/include/asm/errata_list.h        |  39 ++++++++
>  arch/riscv/include/asm/sbi.h                |   3 +
>  arch/riscv/include/asm/sections.h           |   1 +
>  arch/riscv/include/asm/tlbflush.h           |   3 +-
>  arch/riscv/include/asm/vendorid_list.h      |  10 ++
>  arch/riscv/kernel/entry.S                   |   6 +-
>  arch/riscv/kernel/sbi.c                     |  15 +++
>  arch/riscv/kernel/smpboot.c                 |   4 +
>  arch/riscv/kernel/vmlinux.lds.S             |   7 ++
>  22 files changed, 539 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/Kconfig.erratas
>  create mode 100644 arch/riscv/errata/Makefile
>  create mode 100644 arch/riscv/errata/alternative.c
>  create mode 100644 arch/riscv/errata/sifive/Makefile
>  create mode 100644 arch/riscv/errata/sifive/errata.c
>  create mode 100644 arch/riscv/errata/sifive/errata_cip_453.S
>  create mode 100644 arch/riscv/include/asm/alternative-macros.h
>  create mode 100644 arch/riscv/include/asm/alternative.h
>  create mode 100644 arch/riscv/include/asm/errata_list.h
>  create mode 100644 arch/riscv/include/asm/vendorid_list.h

Thanks, these are on for-next.  There was one checkpatch error related 
to _ALTERNATIVE_CFG locking parens, but I think that's a false positive 
due to all the assembly stuff so I've left it alone.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
