Return-Path: <SRS0=OQtk=I7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FD3C433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:11:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25BB0610D2
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Apr 2021 04:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25BB0610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v/AaPas+/QWeldpqNXWYd8m4vqcH6edq53DpErAmVKY=; b=Y9PWtZUSaaErDiNMn3rmaKqVg
	rWHaZDQXLUvnMjnXEnRmJfKVb3RGFzCQY0eO2H79sfFthjiAlAwudw9fxhBfUhxYo8ewv1NR3HKIF
	8TGVCYvQoantLNltMf6d1sXhLvB3EY3zAw67Dg+GC+2AvUXdTiUbxqL+y4IjmGsLgvhWAv8u2pOBu
	QPGb3q6ymCvG4EIl6STB7V+dfwaA0nAevNSJEs7KbajfcbeBpXKUPBF0xVfKnrx0NnWS77lqZCWaO
	1vRh2I4bau9VS8qIKhtcNSdcxJ+fUVE5U175L8r8q9AVw81KGO5m0wS+HkrL14TRvrlx2ZY4mAczH
	8KOmx8lWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSB9T-00Btxv-OQ; Fri, 02 Apr 2021 04:11:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSB9M-00BtxN-PP
 for linux-riscv@lists.infradead.org; Fri, 02 Apr 2021 04:11:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id k8so3680139wrc.3
 for <linux-riscv@lists.infradead.org>; Thu, 01 Apr 2021 21:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QCaXwDV10dhKrn8kJuleYfg1EWrPXQo+wqW+nmg1Iys=;
 b=lp64j9zqOiwLGu7j1wSqsGR/RAb8Ee1i3et6xgUDAbzdA+QpDFE0aLgHsL9jsHgzcU
 RZlOp4S9wDe4lNplN9yjW/sJ3fH1ObNF0VQ9S7YdFL5xGOdwCOkKoPt0FbkQn+K5Pz0d
 dTlVZQgwFq5tjZparLLk1GmvROKpce86nGGep+MENfReUfxSIsFtKgvP8klfixq25v25
 TVfI2VNfMnZgfXqwkiYjEzb1aa4/Yhdx0p5tpqzqLqfgBEivsYLdeTE2J7SnDmxgF03w
 OQWv38q8F3dGnyreCxXt5+tDHlOeK9bvUI8trp7iVFdlaTfWUpJn7QEoEaQU+g92xU1m
 +32A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QCaXwDV10dhKrn8kJuleYfg1EWrPXQo+wqW+nmg1Iys=;
 b=mXmRA5xQ0o9Kf7INx2zFnJdjQHbcKQ3RIkiP4df6C1UflUN4vRGULPv8gwNA4ueQO0
 t8dz6BIEpYxxXOPqz1VL34GqfrWq0+ju8AKPIfxSjkj3TFmKdW5Gg/jOcdp1OnGkfuoC
 yPrvjv4KywoG6GMLZ/l3iOVT8Vukm59sV+GV9pUvQCR97AV+1OyvId9p+LS4XYYQV0e/
 2VG5wL91h0urVitAaTNzey0Tbxdubowlpekf1IMVCLD5aAR4xuqjn9gJ9cSKR4n2MjkC
 7QL5q9cy7R5i4Z6X4GPVKYRV30an2UeUaIdAqilmskXWeVpwO+QY+SWtWwFSY1lrad/T
 7N2A==
X-Gm-Message-State: AOAM533YJ7LB/aO1TpDCAoxcXwRSFocy7Zzes3AwIsT1Cn37hjiDX6fe
 mEgrXo9allUTlJMFAQ9jigRm41VzVI7Cyc2uODWtsA==
X-Google-Smtp-Source: ABdhPJzYA4Ar4sFBPoRR7zZ5FTywncmiqYFdtbksFa6kQzbDtCwCH1G/RDQn8/MwpunRwtnjKys7ykkkxpBe/8z3mns=
X-Received: by 2002:a05:6000:c7:: with SMTP id
 q7mr13166768wrx.356.1617336672119; 
 Thu, 01 Apr 2021 21:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210401002442.2fe56b88@xhacker> <20210401002621.409624ee@xhacker>
In-Reply-To: <20210401002621.409624ee@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Apr 2021 09:41:00 +0530
Message-ID: <CAAhSdy3-n7ASkPXN=UsQW72gY5JH-J3Rf7W6kfUxXV6Zdb5hDg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] riscv: Constify sys_call_table
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
X-CRM114-CacheID: sfid-20210402_051112_969887_74A746F7 
X-CRM114-Status: GOOD (  18.49  )
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

On Wed, Mar 31, 2021 at 10:01 PM Jisheng Zhang
<jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> Constify the sys_call_table so that it will be placed in the .rodata
> section. This will cause attempts to modify the table to fail when
> strict page permissions are in place.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/include/asm/syscall.h  | 2 +-
>  arch/riscv/kernel/syscall_table.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> index 49350c8bd7b0..b933b1583c9f 100644
> --- a/arch/riscv/include/asm/syscall.h
> +++ b/arch/riscv/include/asm/syscall.h
> @@ -15,7 +15,7 @@
>  #include <linux/err.h>
>
>  /* The array of function pointers for syscalls. */
> -extern void *sys_call_table[];
> +extern void * const sys_call_table[];
>
>  /*
>   * Only the low 32 bits of orig_r0 are meaningful, so we return int.
> diff --git a/arch/riscv/kernel/syscall_table.c b/arch/riscv/kernel/syscall_table.c
> index f1ead9df96ca..a63c667c27b3 100644
> --- a/arch/riscv/kernel/syscall_table.c
> +++ b/arch/riscv/kernel/syscall_table.c
> @@ -13,7 +13,7 @@
>  #undef __SYSCALL
>  #define __SYSCALL(nr, call)    [nr] = (call),
>
> -void *sys_call_table[__NR_syscalls] = {
> +void * const sys_call_table[__NR_syscalls] = {
>         [0 ... __NR_syscalls - 1] = sys_ni_syscall,
>  #include <asm/unistd.h>
>  };
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
