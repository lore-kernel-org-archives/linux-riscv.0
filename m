Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106E0C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:11:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D047F20717
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NiS4j7fM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="GnJa1tYY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D047F20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=0ln5YsIWkGaG4L+VHfWN6g/SYKBcQfE357+sx6LdMbU=; b=NiS4j7fMsLqY1T8hGAY4VXzJO
	NJOdnjyb6BpsaasOxbekooNpBnjjjZIBXzTE0ZjMOsRpMoMSuoZJAWaQCr28Hca0uJaTQ022p3Jm2
	0+Mz5MTkSSbB1lL/PfE316FK3uUsTAwd9RRzm6uAQtt/SfK4Aor6d7V2xRMMnlnH6qhoacjvYQCn9
	dZFDhlCx2Wy2vWDfQu2OoMlORvV3zRASHNdtbPa64yjzoR2LY1GI33yJcb5Jo0babcwgISosFjUEa
	ONZZvkwYBAry/EgQreAiNazlbnafn0Z+2GvKkT824PxdmOOVuYox6+syIgXof2BNTbUBlGmdCahBJ
	l7txrZwmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxgoB-000200-My; Tue, 21 Jul 2020 01:11:03 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxgo9-0001zT-0g
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 01:11:01 +0000
Received: by mail-pf1-x442.google.com with SMTP id u5so9929194pfn.7
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 18:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=gkVwrlwYmgNFDT5XRE1O5q8mSuD5zpRetSCBX/aZTqM=;
 b=GnJa1tYYo+Em6pZ/CY6/bvN2rPpSCTHkGcqeuRF+deo/vPfmwsn61aZMAwz3AU8PjC
 VLBUodyc+p0ogqlYwmbiN7KIW0Aj5/0iebDBzr5RueHUTLAIl9FXN5eXgrCsKkJefnYk
 IlEDVw3mkrB5Oxf/UwJ6JplYT+/y84ysa8SoW+6nfI/iBpu3swXbptcyVvi6qdaUbCJZ
 p2iNqKoO/2saBE2zRtDPVUjqrvXDxszThY2s7oYhLOsYhxoL9AwJHbTlJ4H6ACGJM/ho
 f2cpNUdU666IyDxHGP9VOxj5bpDs8WLoCQpvlaonrFqRpLIlEEPQHGbYKq8O++1KqveF
 iluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=gkVwrlwYmgNFDT5XRE1O5q8mSuD5zpRetSCBX/aZTqM=;
 b=ny/lhkacm/J3rdgeq6dn0YcJiLnQhNUIEqc7Q7k+f0wdK0KIZhCQklcQ2BXdN7ti8f
 yV1M2/FAeDMqFbPFdZw4c59mRmXa12NBG4TtaiG5FXi8TeqQnhVtDOGKUdk1beApTZc8
 o2e8dCYYGMQ94PmYSEC2tXDQFO5XMtz0PQqr/n+ehjFgy2HVyaSQZ+olwu7bGZ5CwXPN
 jVtKDJfUapxDNihtE88O4vlQbZ/U/eAMVgU9CzrmAm6rttbi+RaaQXo4jtxYPR3MfMAB
 MVXTgq+1Hd5GWk2KSke2SlItN2gciMlf4p+wXWaxwljgyR6M8yJPyZGfpkxk7M/3i41J
 6HVw==
X-Gm-Message-State: AOAM530GljxcruBQiC5o1tna/p06WDem6uns/j2NG22ej8X27h2vIj2G
 PzR+Cm/I4kJydNEKExWOrc8PAw==
X-Google-Smtp-Source: ABdhPJzWHRHJJBVUwi3V1plFkQ25UPcKlJIkrQdT/8hoqxVutnlD1bwYMNGLXM6bPFq0ahTawj66JQ==
X-Received: by 2002:a63:7a56:: with SMTP id j22mr19904601pgn.194.1595293856800; 
 Mon, 20 Jul 2020 18:10:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c30sm18043111pfj.213.2020.07.20.18.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 18:10:56 -0700 (PDT)
Date: Mon, 20 Jul 2020 18:10:56 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Jul 2020 18:10:53 PDT (-0700)
Subject: Re: [PATCH v2 1/6] riscv: Fixup __vdso_gettimeofday broke dynamic
 ftrace
In-Reply-To: <1594261154-69745-2-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-43aa4e60-5754-4bfd-9502-7b0efe369c79@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_211101_071971_44EF9D8A 
X-CRM114-Status: GOOD (  18.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: me@packi.ch, guoren@linux.alibaba.com, alankao@andestech.com,
 vincent.chen@sifive.com, anup@brainfault.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, penberg@kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, guoren@kernel.org, mhiramat@kernel.org,
 zong.li@sifive.com, Bjorn Topel <bjorn.topel@gmail.com>,
 greentime.hu@sifive.com, linux-riscv@lists.infradead.org, green.hu@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 08 Jul 2020 19:19:09 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> For linux-5.8-rc1, enable ftrace of riscv will cause boot panic:
>
> [    2.388980] Run /sbin/init as init process
> [    2.529938] init[39]: unhandled signal 4 code 0x1 at 0x0000003ff449e000
> [    2.531078] CPU: 0 PID: 39 Comm: init Not tainted 5.8.0-rc1-dirty #13
> [    2.532719] epc: 0000003ff449e000 ra : 0000003ff449e954 sp : 0000003fffedb900
> [    2.534005]  gp : 00000000000e8528 tp : 0000003ff449d800 t0 : 000000000000001e
> [    2.534965]  t1 : 000000000000000a t2 : 0000003fffedb89e s0 : 0000003fffedb920
> [    2.536279]  s1 : 0000003fffedb940 a0 : 0000003ff43d4b2c a1 : 0000000000000000
> [    2.537334]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : fffffffffbad8000
> [    2.538466]  a5 : 0000003ff449e93a a6 : 0000000000000000 a7 : 0000000000000000
> [    2.539511]  s2 : 0000000000000000 s3 : 0000003ff448412c s4 : 0000000000000010
> [    2.541260]  s5 : 0000000000000016 s6 : 00000000000d0a30 s7 : 0000003fffedba70
> [    2.542152]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000003fffedb960
> [    2.543335]  s11: 0000000000000000 t3 : 0000000000000000 t4 : 0000003fffedb8a0
> [    2.544471]  t5 : 0000000000000000 t6 : 0000000000000000
> [    2.545730] status: 0000000000004020 badaddr: 00000000464c457f cause: 0000000000000002
> [    2.549867] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004
> [    2.551267] CPU: 0 PID: 1 Comm: init Not tainted 5.8.0-rc1-dirty #13
> [    2.552061] Call Trace:
> [    2.552626] [<ffffffe00020374a>] walk_stackframe+0x0/0xc4
> [    2.553486] [<ffffffe0002039f4>] show_stack+0x40/0x4c
> [    2.553995] [<ffffffe00054a6ae>] dump_stack+0x7a/0x98
> [    2.554615] [<ffffffe00020b9b8>] panic+0x114/0x2f4
> [    2.555395] [<ffffffe00020ebd6>] do_exit+0x89c/0x8c2
> [    2.555949] [<ffffffe00020f930>] do_group_exit+0x3a/0x90
> [    2.556715] [<ffffffe000219e08>] get_signal+0xe2/0x6e6
> [    2.557388] [<ffffffe000202d72>] do_notify_resume+0x6a/0x37a
> [    2.558089] [<ffffffe000201c16>] ret_from_exception+0x0/0xc
>
> "ra:0x3ff449e954" is the return address of "call _mcount" in the
> prologue of __vdso_gettimeofday(). Without proper relocate, pc jmp
> to 0x0000003ff449e000 (vdso map base) with a illegal instruction
> trap.
>
> The solution comes from arch/arm64/kernel/vdso/Makefile:
>
> CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os $(CC_FLAGS_SCS)
>
>  - CC_FLAGS_SCS is ShadowCallStack feature in Clang and only
>    implemented for arm64, no use for riscv.
>
> The bug comes from the following commit:
>
> ad5d1122b82f ("riscv: use vDSO common flow to reduce the latency of the time-related functions")
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Pekka Enberg <penberg@kernel.org>
> Cc: Vincent Chen <vincent.chen@sifive.com>
> Cc: Atish Patra <atish.patra@wdc.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Alan Kao <alankao@andestech.com>
> Cc: Greentime Hu <green.hu@gmail.com>
> ---
>  arch/riscv/kernel/vdso/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 38ba55b..3079935 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -27,6 +27,9 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
>  obj-y += vdso.o vdso-syms.o
>  CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
>
> +# Disable -pg to prevent insert call site
> +CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
> +
>  # Disable gcov profiling for VDSO code
>  GCOV_PROFILE := n

As far as I can tell this is already in Linus' tree.  LMK if I'm missing
something.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
