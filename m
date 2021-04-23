Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7750C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:48:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BEC761458
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 01:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BEC761458
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8oZtAmP+MLQ66wN0Je90Om8EzQa6aUoPL8Sy3P0Y1q8=; b=I8BslN6BRRcJukZhtAiKP9eCr
	XLA1LRctO8GcgIZZZBu1ak3i+ISquLhCSA+K01n+wKhvk/ZhUeZ4eofq8LCyBmYWn9++tcdsJM4AI
	AWi3DD1vYuxj9CkbHR2pRmsoVUpBTgJedyLVjR/oTwpFsDqoaVNVdjhnSg4FIJ2S+Z8eyzEMif0EE
	OvklNeFB33iEd+HnD7RZrsPaSshlGvZqHUpJrCaU0WFjmhFil9DLdzmPMTx9D2ODYrVSDz7XEQBjT
	KPXzu6jKJgso303POwEX4NFE3yhhPz5M85c86HBxfC30VEx+jYtJ3fyvZ5yGB3+x0L0oMww84UhrF
	lyt/8P2tg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZkvt-000JOg-Ay; Fri, 23 Apr 2021 01:48:37 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkvr-000JOa-88
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 01:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=XajKNy6aoIfR9fbxhkyLjiEoAllUlrFjsDiP5vSV8KI=; b=hpE+lQErp+qFaUzXsIbNwePuBy
 XEMPiuNXViYpqyEtZyy7WAn7EA2hCtyoKKCWZg3tsfUz7sFMcd9qQzVNKx3uOcHpN0fxWh/nRO6B5
 nU/bjq5nHt2gVaDDhwfYsVMGeokTdSWqbzRxfsBBb4764rE4A8XFQNlV7O07y8vh08tRVpY3so+TG
 0m4BThb2bl8vGcGC3d7/UTjQFTbfFsEWQ5Hq+tzB5IDxLxgcFjkHngOK9p1AlfoX2ktUml2pCx4aV
 sWOrQCJ5Cy3n1EO22Rwx5cA77/5UOY7kO7+i8muFio+IXDdmAhVHS/4f7SmrNpuo1gY+SnMxT0XEq
 jRTl2C7g==;
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkvo-00E5aZ-P1
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 01:48:34 +0000
Received: by mail-pl1-x635.google.com with SMTP id v13so10876539ple.9
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 18:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XajKNy6aoIfR9fbxhkyLjiEoAllUlrFjsDiP5vSV8KI=;
 b=16Qh8D3ZW09f+o41dGeMuO8jYxQStQWUf8WQAcJBxyGephSQEm1pixjYLvHT7hx7uG
 B5IH70i7Vf5dN6C+dPps5sR73nPC7Z0WiasfMoumBSvW9Zpxv1+t+4w6Uo+P5AgwvX3v
 aevwalaXJpmnDNJTZv/QFm88qjzZW+cy+mmV6iU/ZU4LCJYg/nlKj3zvLUmL1X9NOcyA
 6KtO60xIcclIYBfhI4w/sN0j0fSsysXPJ5AB4PujGRXM2AObwsQudjLbhC0adIsHd5wO
 UnRvSk8Ii4bDHs/uYn5p9VHH94bGc5KWzLlhtlf9JptbVH/tc0vo/wFJnK/YyA/UOXwv
 HOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XajKNy6aoIfR9fbxhkyLjiEoAllUlrFjsDiP5vSV8KI=;
 b=ns/8l6Q8EbQC+lMX4Z2ol6UOXl/lMT2l2Ka0wH9t/7SK2ntpPEfbq+fi7OEFe8ZpPu
 WkiQwuJLE7KXd5Udk3H6/RHQBC27904r1XT+FXGT2/QOqMjEEOplplhMa0Vhc6QXXkF7
 NHVZftB6oWIC+ziAjvF9ZwddzzWPt9ZaSWjYDjonVz1Zie6JWrR2gnC8UIRfYnc1EalP
 O6Vzlq7WbZbZbqwwm45RcPgtOMqwFuRHAVgsKSa7ZIXkEWPXMvmc/hJdexndh2zQQrG0
 kidFV3JVXpVKimHTTrQHEiqsO4StARCv1iHQnDjcsLXlfUs0R1ziVE++NC7POEgW5M4a
 Z+kg==
X-Gm-Message-State: AOAM531nuINyOvfSkNnnowKdqPGtMxjO/35Dd9i4CIGnuGZZwRogn7zb
 QOE+GKlwqn72PqHuj9XvYF5mDA==
X-Google-Smtp-Source: ABdhPJwe7Y0d6/UnJxQlMZahTCa3FPgMdPek0KQGrK4wDzL21FZNrfZYihgBPY83nUxvyLVUn921Iw==
X-Received: by 2002:a17:90a:c3:: with SMTP id v3mr3158756pjd.55.1619142511541; 
 Thu, 22 Apr 2021 18:48:31 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w123sm3004405pfb.109.2021.04.22.18.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 18:48:30 -0700 (PDT)
Date: Thu, 22 Apr 2021 18:48:30 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 18:48:29 PDT (-0700)
Subject: Re: [PATCH 0/9] riscv: improve self-protection
In-Reply-To: <20210330022144.150edc6e@xhacker>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, bjorn@kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang3@mail.ustc.edu.cn
Message-ID: <mhng-c1b60b87-7dd7-43e7-91eb-1f54528384f8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_184832_834501_45B66D41 
X-CRM114-Status: GOOD (  15.09  )
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

On Mon, 29 Mar 2021 11:21:44 PDT (-0700), jszhang3@mail.ustc.edu.cn wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
>
> patch1 is a trivial improvement patch to move some functions to .init
> section
>
> Then following patches improve self-protection by:
>
> Marking some variables __ro_after_init
> Constifing some variables
> Enabling ARCH_HAS_STRICT_MODULE_RWX
>
> Jisheng Zhang (9):
>   riscv: add __init section marker to some functions
>   riscv: Mark some global variables __ro_after_init
>   riscv: Constify sys_call_table
>   riscv: Constify sbi_ipi_ops
>   riscv: kprobes: Implement alloc_insn_page()
>   riscv: bpf: Move bpf_jit_alloc_exec() and bpf_jit_free_exec() to core
>   riscv: bpf: Avoid breaking W^X
>   riscv: module: Create module allocations without exec permissions
>   riscv: Set ARCH_HAS_STRICT_MODULE_RWX if MMU
>
>  arch/riscv/Kconfig                 |  1 +
>  arch/riscv/include/asm/smp.h       |  4 ++--
>  arch/riscv/include/asm/syscall.h   |  2 +-
>  arch/riscv/kernel/module.c         |  2 +-
>  arch/riscv/kernel/probes/kprobes.c |  8 ++++++++
>  arch/riscv/kernel/sbi.c            | 10 +++++-----
>  arch/riscv/kernel/smp.c            |  6 +++---
>  arch/riscv/kernel/syscall_table.c  |  2 +-
>  arch/riscv/kernel/time.c           |  2 +-
>  arch/riscv/kernel/traps.c          |  2 +-
>  arch/riscv/kernel/vdso.c           |  4 ++--
>  arch/riscv/mm/init.c               | 12 ++++++------
>  arch/riscv/mm/kasan_init.c         |  6 +++---
>  arch/riscv/mm/ptdump.c             |  2 +-
>  arch/riscv/net/bpf_jit_comp64.c    | 13 -------------
>  arch/riscv/net/bpf_jit_core.c      | 14 ++++++++++++++
>  16 files changed, 50 insertions(+), 40 deletions(-)

Thanks.  These are on for-next.  I had to fix up a handful of merge 
conflicts, so LMK if I made any mistakes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
