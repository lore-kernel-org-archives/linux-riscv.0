Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD47BC433ED
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:14:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40DA361056
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DA361056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O5TYz+2xRnJ5cnaQrj1a9TMgq5j+KPacDCrAWk3Cqbk=; b=CXl/E5KODS6fDPAssJuwu6RRy
	t8KYCRvb3ZCFRyAlKV2plg+zS3P2uKY+VRBj4ayyRWxv35kK7mBx86+8t26RpAG4fWIkuDDWNK7XB
	kQwQxi0uoanzKzDOXCkx7MhplZRULB3SkUOuXi8GstM2SFTcf+HY3d+XzeWT9bO1lcG2FEqoE8P1A
	GnvtQTaJccj7KyWN0rPKsG9SgJRsEiegalggb7GuHbrpS3Ma7PMp6TJDkB8zNjRE/2TfaRq4X8sKw
	2qPsqr0waDMSR3bZcfo+cGqypfK6ICoRKmWOc8OqMccf17K5bHYPR+H8luIEGcqEygy85le1wyT5k
	qI4jJplmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSBCh-00BuCd-Ju; Fri, 02 Apr 2021 04:14:39 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSBCc-00BuC9-Pq
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:14:36 +0000
Received: by mail-wr1-x432.google.com with SMTP id j18so3678211wra.2
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aTF4DSgy0PHbD8hdS+0qJlLOgVDSXpSKNN+yUg9A0Hs=;
 b=IOwAv1pJyRJV4gn9mjCUoyrx9uKAxA+FBfNG9Mf4HIXV+pvQHAitUv7k5D3+aOt41l
 GgTI/wiTUT5w5zeKpjSfD/MrilhGKYx/6q2TpM7IabcdfcmJOlAjTqWunt61zo7wi708
 CGGDUhtD+1zL/KGi9MTQdV0YcKnKiDUn+wcriEoGsN9rH9BZ++dDSV4jof7EyvkIkNXI
 NNcdilvjzbV3PJxlQf0UEA3QYia9hqMrQl8WTpV0itVsIDOcez06rZ9/cRYZ9Rk3UFNu
 hg9I/2eIGjJ47UU7VT2oRMh14v1ZJQaKH9Zi8YWoZZCH+xi5ybGoghfYn4cHqMlRz8z1
 1dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aTF4DSgy0PHbD8hdS+0qJlLOgVDSXpSKNN+yUg9A0Hs=;
 b=nx49MKoYC75Se4xsEzbSFMZ6bcZ+vplHo0mScW/SltgQDEqKVznDqutO6XFfxppp7a
 pJdoBkqlGVStnnHp2hUD/qca0Cp7hREWIvO5DqnODrnT97+bWnTRxGxOUut/1IXZT0w1
 PeTB9PECq0qs+CoypJ0n1jtioGM4zkTlQtKryrYxxL2GHJVjcrkAacbvA/ODYSwRBIzJ
 EX3KY6oqdGtgVOM7wjy8WEv0IOQKy373GIGNpmvrkWlg3xc8yORgqBfNPjv/zmHArRV6
 R0LqRUNRsdDWcERnv7ct7HszTJfW3d0TJnHpUUVuxCJ1nczJ1zBSzrzMdJFOLIcDOGtS
 Gytw==
X-Gm-Message-State: AOAM530R9G0PoYfJ/bljTuKgASQv4Zth5PaKHHhfqhco/strDXT1y4ti
 5EIDF/Lk2eGpWG08jNrlFK/fT28J2EWh5+N1IxHu3w==
X-Google-Smtp-Source: ABdhPJy7kkYMQxTXJp2WyoNHqq3yHqeByHqHc7dSE27OX8CeJmSRxaQ0rEoYl8xvHJs4qnnACcmvyAiguHo7lXT6Tuw=
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr13176764wrx.356.1617336873672; 
 Thu, 01 Apr 2021 21:14:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210401002442.2fe56b88@xhacker> <20210401002949.2d501560@xhacker>
In-Reply-To: <20210401002949.2d501560@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Apr 2021 09:44:22 +0530
Message-ID: <CAAhSdy0p4g1o2xLbHXzMer7P=DgLjYfbiO4nYTU1gqPbLgLUKg@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] riscv: Set ARCH_HAS_STRICT_MODULE_RWX if MMU
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Song Liu <songliubraving@fb.com>,
 Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_051434_961782_57192C7C 
X-CRM114-Status: GOOD (  14.83  )
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

On Wed, Mar 31, 2021 at 10:05 PM Jisheng Zhang
<jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Now we can set ARCH_HAS_STRICT_MODULE_RWX for MMU riscv platforms, this
> is good from security perspective.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 87d7b52f278f..9716be3674a2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -28,6 +28,7 @@ config RISCV
>         select ARCH_HAS_SET_DIRECT_MAP
>         select ARCH_HAS_SET_MEMORY
>         select ARCH_HAS_STRICT_KERNEL_RWX if MMU
> +       select ARCH_HAS_STRICT_MODULE_RWX if MMU
>         select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>         select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
> --
> 2.31.0
>
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
