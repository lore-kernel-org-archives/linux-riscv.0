Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73425C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 05:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310AF60F13
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 05:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 310AF60F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nk21Ezn2fQvN4JdU0kVMwKou40S5ehs5lxoWw2O2XDQ=; b=uZeMB2Ddtel/yV
	HW7w6cMZytnBOd5GVaya11AYpbr3rNdZPOMcmvm7XN3b5XGIoc13tlJNX6JuwsCffThRpjsObJFBP
	fFXhbGLv0tksLKaIAD4y/+vaw6t0fBsQlBVztM8mhlYTLXuRdkwt5g2gkIhfdCWyiqCwCb8itNEFz
	lTD4hmjmf7u3AstO8w4PD+wktZkwV+egugKkqlWEi5CpjFSIr4/Tn3BDi5/OQ4GPcBt18iP6g8f0C
	rFYkwtJc4Mpp63kMwikS0yUva6tcDTlFqAUQN8TO7mu5TQhIP0MOGewCObt+cjDoaJAuKjAP4WyGW
	rCL8wHFS/5OUZCdwQqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOCxc-008HTg-Jw; Thu, 09 Sep 2021 05:50:56 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOCxL-008HPu-SY; Thu, 09 Sep 2021 05:50:41 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id r4so1616336ybp.4;
 Wed, 08 Sep 2021 22:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rbAwJn7fFiGfPLrVocqe11Q3q7IsLXBF5Gxx03pmlXE=;
 b=CmWrpGJWf7JI1pP0j0mp45iHU8XkQe2EqAUzjV7ZmD/9FcnGbJAjU+KHRVJytckonC
 vujUXfoq2DKOdHDooun6rux/zPb5UUNw6F0/rYYiG63z0gXl5FRo9mM4D/ZHlcjFEoT5
 TSsPsN+5dKnBSLAhkl0Su9JKaQpr90RBEm4Bp9T0uBXdLr0wrGO5QAHwK8IFJ0/Bufj4
 1xgY7VRPTUjHu9eIZWZuoV3u6fgcauS7FWhKhnxCRypxO896NpcBImOjOFxkiiobXx1x
 j7DRcXdP4TINM1IE+y5xZAS4KExdFRwogWOejAehtF6YEY4uO6oaSr2HYcGFJo7eD5l9
 eReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rbAwJn7fFiGfPLrVocqe11Q3q7IsLXBF5Gxx03pmlXE=;
 b=yN4tr2y2jfZFr8UcwJjLOMlowocV7jbFKBHEynipV3fBknHDbOyiv/dtAKsNrAy/lJ
 hrJdNE89s8J6Qw/Og1wDPbAPgTV4YPrUEAxLh0RynNM49wIVneDhT8P6TFeOhjy4npbl
 CpWOOnwTOZItplGhC8ZhZ+eW3ws+aKyurHxQ/NCXPh9g9IuJbsuzZZDmB1jke0Dwfqo7
 iuULlqJ+pTVpiIb22fKkwDFiCTX+68I5cee7dR5KCeqmm4cvdnvbDj2WoLEzCgNF6Jz+
 bYbrMENuNd4fUZThINEybcLGNN6If80Qg0gnLsZvxWtgsJ0Jm5vT7VLZMNQTT1Wki6r0
 CLww==
X-Gm-Message-State: AOAM533NCpaPny0r1v/3OULbL4UMFaGP9Aet6j1yHwXUwONoKAizWt71
 tuGRnqfJLHedYu6zeUuEUCBaZn0zndh0UIKYym8=
X-Google-Smtp-Source: ABdhPJxt1xA0uM8Q0oqALtqvGBUDGndJ4a+HcDFgyDfaBTs5y9qs8UNRpk1kp/Lb9NyUROynnQ45aqXim7JNzY/Zqj0=
X-Received: by 2002:a5b:702:: with SMTP id g2mr1597430ybq.307.1631166635450;
 Wed, 08 Sep 2021 22:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <1631158350-3661-1-git-send-email-yangtiezhu@loongson.cn>
In-Reply-To: <1631158350-3661-1-git-send-email-yangtiezhu@loongson.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 8 Sep 2021 22:50:24 -0700
Message-ID: <CAEf4BzZqoVZ7keWCLmC=A5oPPwj_xMNRWDkJUcjWn9yE_z1gSg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: Change value of MAX_TAIL_CALL_CNT from 32
 to 33
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Shubham Bansal <illusionist.neo@gmail.com>,
 Russell King <linux@armlinux.org.uk>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 Zi Shen Lim <zlim.lnx@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Burton <paulburton@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, naveen.n.rao@linux.ibm.com, 
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Luke Nelson <luke.r.nels@gmail.com>,
 Xi Wang <xi.wang@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>,
 Johan Almbladh <johan.almbladh@anyfinetworks.com>, 
 Paul Chaignon <paul@cilium.io>, Networking <netdev@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_225039_975271_7C9C8B72 
X-CRM114-Status: GOOD (  21.67  )
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

On Wed, Sep 8, 2021 at 8:33 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
>
> In the current code, the actual max tail call count is 33 which is greater
> than MAX_TAIL_CALL_CNT (defined as 32), the actual limit is not consistent
> with the meaning of MAX_TAIL_CALL_CNT, there is some confusion and need to
> spend some time to think the reason at the first glance.

think *about* the reason

>
> We can see the historical evolution from commit 04fd61ab36ec ("bpf: allow
> bpf programs to tail-call other bpf programs") and commit f9dabe016b63
> ("bpf: Undo off-by-one in interpreter tail call count limit").
>
> In order to avoid changing existing behavior, the actual limit is 33 now,
> this is resonable.

typo: reasonable

>
> After commit 874be05f525e ("bpf, tests: Add tail call test suite"), we can
> see there exists failed testcase.
>
> On all archs when CONFIG_BPF_JIT_ALWAYS_ON is not set:
>  # echo 0 > /proc/sys/net/core/bpf_jit_enable
>  # modprobe test_bpf
>  # dmesg | grep -w FAIL
>  Tail call error path, max count reached jited:0 ret 34 != 33 FAIL
>
> On some archs:
>  # echo 1 > /proc/sys/net/core/bpf_jit_enable
>  # modprobe test_bpf
>  # dmesg | grep -w FAIL
>  Tail call error path, max count reached jited:1 ret 34 != 33 FAIL
>
> So it is necessary to change the value of MAX_TAIL_CALL_CNT from 32 to 33,
> then do some small changes of the related code.
>
> With this patch, it does not change the current limit, MAX_TAIL_CALL_CNT
> can reflect the actual max tail call count, and the above failed testcase
> can be fixed.
>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---

This change breaks selftests ([0]), please fix them at the same time
as you are changing the kernel behavior:

  test_tailcall_2:PASS:tailcall 128 nsec
  test_tailcall_2:PASS:tailcall 128 nsec
  test_tailcall_2:FAIL:tailcall err 0 errno 2 retval 4
  #135/2 tailcalls/tailcall_2:FAIL
  test_tailcall_3:PASS:tailcall 128 nsec
  test_tailcall_3:FAIL:tailcall count err 0 errno 2 count 34
  test_tailcall_3:PASS:tailcall 128 nsec
  #135/3 tailcalls/tailcall_3:FAIL
  #135/4 tailcalls/tailcall_4:OK
  #135/5 tailcalls/tailcall_5:OK
  #135/6 tailcalls/tailcall_bpf2bpf_1:OK
  test_tailcall_bpf2bpf_2:PASS:tailcall 128 nsec
  test_tailcall_bpf2bpf_2:FAIL:tailcall count err 0 errno 2 count 34
  test_tailcall_bpf2bpf_2:PASS:tailcall 128 nsec
  #135/7 tailcalls/tailcall_bpf2bpf_2:FAIL
  #135/8 tailcalls/tailcall_bpf2bpf_3:OK
  test_tailcall_bpf2bpf_4:PASS:tailcall 54 nsec
  test_tailcall_bpf2bpf_4:FAIL:tailcall count err 0 errno 2 count 32
  #135/9 tailcalls/tailcall_bpf2bpf_4:FAIL
  test_tailcall_bpf2bpf_4:PASS:tailcall 54 nsec
  test_tailcall_bpf2bpf_4:FAIL:tailcall count err 0 errno 2 count 32
  #135/10 tailcalls/tailcall_bpf2bpf_5:FAIL
  #135 tailcalls:FAIL


  [0] https://github.com/kernel-patches/bpf/pull/1747/checks?check_run_id=3552002906

>  arch/arm/net/bpf_jit_32.c         | 11 ++++++-----
>  arch/arm64/net/bpf_jit_comp.c     |  7 ++++---
>  arch/mips/net/ebpf_jit.c          |  4 ++--
>  arch/powerpc/net/bpf_jit_comp32.c |  4 ++--
>  arch/powerpc/net/bpf_jit_comp64.c | 12 ++++++------
>  arch/riscv/net/bpf_jit_comp32.c   |  4 ++--
>  arch/riscv/net/bpf_jit_comp64.c   |  4 ++--
>  arch/sparc/net/bpf_jit_comp_64.c  |  8 ++++----
>  include/linux/bpf.h               |  2 +-
>  kernel/bpf/core.c                 |  4 ++--
>  10 files changed, 31 insertions(+), 29 deletions(-)
>

[...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
