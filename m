Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5C6C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 08:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZO8/GFhKhSf7/RwfUEj4q1DtAzJRDBYFe0tpQGwOV8=; b=ulPRu8EEk4pvDV
	iUjp1RKVgI1fhAT0KqpOaB8V2X2Pembw0l8wALwQSmIr8Hsqltm82bb2sy/KvoyJMwwSKXKaHYZWJ
	gHcXks38yHfg02XUMbgxATDmHZ0rMyoX//BO7amhXhnDJWbgUcVN4Vtw3NHKKIdpEQwHvaLJo5s6f
	kwfdFiILNIz6G5Af/tnfUs4i9tH7i/Rf43dlrxfPUs6ClrcFFWVjv/Q8Gvr/UAnJvKsv/6lrceTdu
	+qD2tBDzSfib6pvBr4hjDKa+We3Wc267n79TF8ZoJGnNXURfr3q1e5PBb5jBlMJl6Nv6ZtQto218e
	6o7NvRj32h3bVoN3Cp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lBu-001SuL-8q; Thu, 16 Jun 2022 08:49:26 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lBq-001Srg-Rp
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 08:49:24 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-100eb6f7782so1133481fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 01:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wszWZGJqY+TIv4pzEVfLhmbBGlMZezhOKzLkSImN90o=;
        b=G7kbWLfIgcLVNol54yCAa2n3pe1e0+YfcORoFPjNx8Afm/wc36EXWmItzGn/XU+Ib6
         Bd4QYBHYIbAjtA+SW1A7k64Wm9+g6MWrZ5WAGRnDbTOw6Sv4nrBCa337CXMMsrVJjnca
         6E7HjXWTJwSWskRdkBoqyOtXsAsHBnPHhkxOkCalQcIf9O1ASnGW6MFU9ORulKQ4x3uv
         YRx4i2SFXsOg1d7GEnKouTs/Gm2hbYZajKeHSlmCm0ALUODzV1tpp99yWeJYrj1pwpAR
         WgLM2DIgE0b0byeaMc3LxzYKH1e9S0c1cP36abnCVRVawbV/BBCeKWkA5/k8ZFBwUKFo
         XKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wszWZGJqY+TIv4pzEVfLhmbBGlMZezhOKzLkSImN90o=;
        b=Mf+MF0ueNGk0ExD7Jv/FVgyz+B0ePCfzNUES6XUuqYgFUysLb0xozsh0MF5jiZb/kY
         UI6BQGUU4+eU/ZcDh/irW0yKx9m+dWkamPu+s4B3uTKSi+1T2n8sSfe5qblnwaEK9A7d
         HCskt4X3lLIDWBdbx3jHBmhYagP3kn+5xLK6V0bl7J/z+y3ZYGb8mT2LqZrfzbxcg4Dy
         0DTAuyDb88B6zG7JM/R3ESgNq7BlfN8NAomFBwM3nkZkGzefNj+grD8e3CA2KuXonmP4
         ppaW9nsoFz6dE8FunP9dKB/TU79Lv8ES/4+eghjrVHVPa9iF06foXyEPFOu/L+0/x9OZ
         CSnw==
X-Gm-Message-State: AJIora8xPDm4LlrWdNZcCXlUcmzBaZJU972026lPqRBqg+LiOcTyNDuD
	b4jzTxM4WJhBZLoyLvt2Wgpfiw4E8zPxyMB+3hFnGA==
X-Google-Smtp-Source: AGRyM1vPdIKkHdagrbcReKb+iEGgaBM2KyiZOW9NjUqSPQz5DdoTSBDMGKryxtDmKtD5LA5VuWqHXOE9GZlEp0k4Ty4=
X-Received: by 2002:a05:6870:524b:b0:f3:2bb3:b236 with SMTP id
 o11-20020a056870524b00b000f32bb3b236mr2071408oai.195.1655369360192; Thu, 16
 Jun 2022 01:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220609071833.1051941-1-andy.chiu@sifive.com>
In-Reply-To: <20220609071833.1051941-1-andy.chiu@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 Jun 2022 16:45:56 +0800
Message-ID: <CABgGipVpafnRB6VhTonq3U5uFrLxCwJBqW9JZBCvYjA93gGESQ@mail.gmail.com>
Subject: Re: [PATCH riscv/for-next 0/4] Enable ftrace with kernel preemption
 for RISC-V
To: aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, rostedt@goodmis.org, mingo@redhat.com, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_014922_980746_D8CB79B5 
X-CRM114-Status: GOOD (  26.59  )
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

Loop in: Guo Ren


On Thu, Jun 9, 2022 at 3:21 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> This patch remove dependency of dynamic ftrace from calling
> stop_machine(), and make it compatiable with kernel preemption.
> Originally, we ran into stack corruptions, or execution of partially
> updated instructions when starting or stopping ftrace on a fully
> preemptible kernel configuration. The reason is that kernel periodically
> calls rcu_momentary_dyntick_idle() on cores waiting for the code-patching
> core running in ftrace. Though rcu_momentary_dyntick_idle() itself is
> marked as notrace, it would call a bunch of tracable functions if we
> configured the kernel as preemptible. For example, these are some functions
> that happened to have a symbol and have not been marked as notrace on a
> RISC-V preemptible kernel compiled with GCC-11:
>  - __rcu_report_exp_rnp()
>  - rcu_report_exp_cpu_mult()
>  - rcu_preempt_deferred_qs()
>  - rcu_preempt_need_deferred_qs()
>  - rcu_preempt_deferred_qs_irqrestore()
>
> Thus, this make it not ideal for us to rely on stop_machine() and
> handly marked "notrace"s to perform runtime code patching. To remove
> such dependency, we must make updates of code seemed atomic on running
> cores. This might not be obvious for RISC-V since it usaually uses a pair
> of AUIPC + JALR to perform a long jump, which cannot be modified and
> executed concurrently if we consider preemptions. As such, this patch
> proposed a way to make it possible. It embeds a 32-bit rel-address data
> into instructions of each ftrace prologue and jumps indirectly. In this
> way, we could store and load the address atomically so that the code
> patching core could run simutaneously with the rest of running cores.
>
> After applying the patchset, we compiled a preemptible kernel with all
> tracers and ftrace-selftest enabled, and booted it on a 2-core QEMU virt
> machine. The kernel could boot up successfully, passing all ftrace
> testsuits. Besides, we ran a script that randomly pick a tracer on every
> 0~5 seconds. The kernel has sustained over 20K rounds of the test. In
> contrast, a preemptible kernel without our patch would panic in few
> rounds on the same machine.
>
> However, we did run into errors when using hwlat or irqsoff tracers
> together with cpu-online stressor from stress-ng on a preemptible kernel.
> The stressor would randomly take a cpu from 1-N offline and online using
> hotplug mechanism. Nonotheless, since we think there is little chance that
> it is related to our changes in ftrace, we are working on it in parallel,
> and may come up with another patch soon.
>
> Andy Chiu (4):
>   riscv: align ftrace to 4 Byte boundary and increase ftrace prologue
>     size
>   riscv: export patch_insn_write
>   riscv: ftrace: use indirect jump to work with kernel preemption
>   riscv: ftrace: do not use stop_machine to update code
>
>  arch/riscv/Makefile             |   2 +-
>  arch/riscv/include/asm/ftrace.h |  24 ------
>  arch/riscv/include/asm/patch.h  |   1 +
>  arch/riscv/kernel/ftrace.c      | 135 ++++++++++++++++++++------------
>  arch/riscv/kernel/mcount-dyn.S  |  62 +++++++++++----
>  arch/riscv/kernel/patch.c       |   4 +-
>  6 files changed, 136 insertions(+), 92 deletions(-)
>
> --
> 2.36.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
