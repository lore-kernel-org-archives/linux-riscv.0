Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DD0C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 03:53:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C829613A9
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 03:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C829613A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fOG0/xd5Vuo8dEDS9vdaCGDyQvbsTyb4vFWiS10jxzY=; b=jHlDc3NlN1TaiFKJ53G6qkydj
	SBSe/LqiAA5MZ7cbD/J9puHV3YdrMEp512UCYD5JrQ8yw+gVfvnil6Vk1bn1wpMFsZYpkSdUmkEg/
	k8uyWm2zBtuhZpRd5Uf/TlX4OiLCJSVQOyHFFEuaeXAP/yRlrCUBD0O0vC3wNW4boHCT9zrg9KbBH
	v3b0sT+HofvF/dUIsxdWUrNyGOSukvczQTQqOJodAKg7c6d5xHCjXR4YxBTxpsOURiD8qUhyFpnXJ
	G33RkzQWK5yVKwKGScnZsvjdFtNNzsRO+Cd8gZi2fqvjTPOFBdFlcTltmeSQQop/JNdsKvhe69X+m
	m9MPy/F4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWA6l-008CDl-DF; Tue, 13 Apr 2021 03:52:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWA6i-008CDM-57
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 03:52:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=toKmCz2nisSRdvrgW5rw5Wc/krsSKTFMT20yb/oxMiM=; b=xRFV/eqygKzl2+F3OpOb5dQ/J9
 hprPNgVzKxRYVUAISBvLEYn+KbnBt8i1yeZ0IapcinCfx4F4TojwTHVE63Ig72NS6L4D/rl+Opljc
 KMBRLIBJHiPqKV6IeedQhiNailrgtb7AmtztUj4VP6h+utVE4frl/K2T3jCmOzNfAT6XbNMD0XYBh
 wq7XAC1TJMi4Nw2pDpN1Q79cf34mCf9KXi9qyRN8pZJew3iVvXTWdd5Y0xdQB2sfgLpfcqIcUslA6
 UpSOtpkVF2X2ukS1PUTrFYeZrLdvhpXhFU45fVU+KOPTrVIXbrIrJq4F6GsJFFByy7FJNRwxthqXO
 vaBZX8Uw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWA6e-006huS-Az
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 03:52:54 +0000
Received: by mail-wr1-x435.google.com with SMTP id x7so14930195wrw.10
 for <linux-riscv@lists.infradead.org>; Mon, 12 Apr 2021 20:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=toKmCz2nisSRdvrgW5rw5Wc/krsSKTFMT20yb/oxMiM=;
 b=lf4OkhjlcR1kToEmRa6nmkjI3wMVGCnZgqn23FXt1FDtTpqKXfidSPbzW1nyDSg2vt
 7m0DcGOH70QNXBI31oncfOL8gJ4BHbRv1OhvoOTdEANVdrdVOhY0MhzsJsv3tv4N5e5d
 m7sLLRaDyj5zgTZqR9FH7azQ5DdOWAaO2mUaOBjgp5UCBMQG0wvKaruPNGL3Uph6MscZ
 gAfYo3c7IC0EVkkhwu91zNMxj+B/27BNNbZIausax3qezuHGh1mPM8RagBEuZBY8w/3t
 C03dFV/BMJ1npPgcx1+WKZpM8VZfOCSq1L7gnAFA7AC+7xv1Cyv1ReMzzyazlhZRMOZh
 /YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=toKmCz2nisSRdvrgW5rw5Wc/krsSKTFMT20yb/oxMiM=;
 b=LT/hpl/iS+U+28W4ACqEQrrQhVnt5TzmyXzBE1KWWfkygOzWJe0sb70S5gIfnju2uu
 mguDCoVQf4BBJTX99TgSHikY1h0JJ2MpjrzJGMU588HGD0yJUk+gg/Zula61CuOEgJow
 3w7gIJpzpTa85O4P9C6UYyTVUhov9lzEskzQiAGMuNhjSMDCRL1gv61d/58dQvcAw+PL
 +Z7miF+2wCtv4LhqJZSUSfmxe80ZuzWZQXq6fETLvDUO1WpRSdgxXBbzBPFJj9Yob3mQ
 S9KL/+hZtcOoBZqeF6dG7dXvlBzfGxq5ZJAtlqZVp6YGji89YvdG5PuRw1N5Au7nKsVU
 247A==
X-Gm-Message-State: AOAM531q5fIw4qwuvTg7E83vXGeUqDxoMqpo7Qsxg0D0b+LnQiER5/rG
 vyBgVZ3JG7aimmzPUKpn4eDo4QFblOstxGVaK8rbXA==
X-Google-Smtp-Source: ABdhPJxF8Ap2B3rFfsdCGZvn0W8SVY/w9eSFkKaViSy95uQrDB0vuEVVn9X6euWV3lnDIIVQFrQPm4lROcZ9wzEP4qc=
X-Received: by 2002:a5d:4e01:: with SMTP id p1mr33895853wrt.128.1618285970840; 
 Mon, 12 Apr 2021 20:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210413001110.7209bae6@xhacker>
In-Reply-To: <20210413001110.7209bae6@xhacker>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Apr 2021 09:22:39 +0530
Message-ID: <CAAhSdy059rO99MmZ4ZYePjB9gnJzb+=14uK1-heV+vco-yKc-w@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] riscv: improve self-protection
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_205252_396606_A11432DF 
X-CRM114-Status: GOOD (  18.86  )
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

On Mon, Apr 12, 2021 at 9:46 PM Jisheng Zhang <jszhang3@mail.ustc.edu.cn> wrote:
>
> From: Jisheng Zhang <jszhang@kernel.org>
>
> patch1 removes the non-necessary setup_zero_page()
> patch2 is a trivial improvement patch to move some functions to .init
> section
>
> Then following patches improve self-protection by:
>
> Marking some variables __ro_after_init
> Constifing some variables
> Enabling ARCH_HAS_STRICT_MODULE_RWX
>
> Hi Anup,
>
> I kept the __init modification to trap_init(), I will cook a trivial
> series to provide a __weak but NULL trap_init() implementation in
> init/main.c then remove all NULL implementation from all arch.

Yes, it makes sense to do this as a separate series.

Regards,
Anup

>
> Thanks
>
> Since v2:
>   - collect Reviewed-by tag
>   - add one patch to remove unnecessary setup_zero_page()
>
> Since v1:
>   - no need to move bpf_jit_alloc_exec() and bpf_jit_free_exec() to core
>     because RV32 uses the default module_alloc() for jit code which also
>     meets W^X after patch8
>   - fix a build error caused by local debug code clean up
>
>
> Jisheng Zhang (10):
>   riscv: mm: Remove setup_zero_page()
>   riscv: add __init section marker to some functions
>   riscv: Mark some global variables __ro_after_init
>   riscv: Constify sys_call_table
>   riscv: Constify sbi_ipi_ops
>   riscv: kprobes: Implement alloc_insn_page()
>   riscv: bpf: Write protect JIT code
>   riscv: bpf: Avoid breaking W^X on RV64
>   riscv: module: Create module allocations without exec permissions
>   riscv: Set ARCH_HAS_STRICT_MODULE_RWX if MMU
>
>  arch/riscv/Kconfig                 |  1 +
>  arch/riscv/include/asm/smp.h       |  4 ++--
>  arch/riscv/include/asm/syscall.h   |  2 +-
>  arch/riscv/kernel/cpufeature.c     |  2 +-
>  arch/riscv/kernel/module.c         | 10 ++++++++--
>  arch/riscv/kernel/probes/kprobes.c |  8 ++++++++
>  arch/riscv/kernel/sbi.c            | 10 +++++-----
>  arch/riscv/kernel/smp.c            |  6 +++---
>  arch/riscv/kernel/syscall_table.c  |  2 +-
>  arch/riscv/kernel/time.c           |  2 +-
>  arch/riscv/kernel/traps.c          |  2 +-
>  arch/riscv/kernel/vdso.c           |  4 ++--
>  arch/riscv/mm/init.c               | 16 +++++-----------
>  arch/riscv/mm/kasan_init.c         |  6 +++---
>  arch/riscv/mm/ptdump.c             |  2 +-
>  arch/riscv/net/bpf_jit_comp64.c    |  2 +-
>  arch/riscv/net/bpf_jit_core.c      |  1 +
>  17 files changed, 45 insertions(+), 35 deletions(-)
>
> --
> 2.31.0
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
