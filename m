Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIMWL_WL_HIGH,DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD94C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:24:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A13206A1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 11:24:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ebAtW6SA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ql6X9aY8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Dk7LaBzk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6A13206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mGCxclYj6Gof8NyafUV+TQo2iIC9rVmYaUnKWwru8pw=; b=ebAtW6SAtP1ZgB7iHUq7Q3Zlu
	XZWC3ptxZvzQPydaNqbugb8JGzXSxw8SMhMSKTi4WCORpu3+vYXJoMdUXejwnotm9qJcxJuEvyIhl
	7hpmcpSiZ0B8zsOWxutM2I9FbEKmAhDCOlnU+wzTZyQ3Lz1SBNG5qgigT5H9VfyMuvs0cN81dMzvM
	j8LAgo7Ltn7ne3iyzn+pwbFIey1Nqs/MXCnoMHgYrNNOzGo9El6nPMTzrIdnI6gNI6NfkkpjNAWp9
	b5skYXw2u9iroXqaA0iLGfx6IpztF2McNH91S2Dl3XOwrw1CWq+nEBDGlNirnMuJNrOHSpCHtFQBr
	RF1EN0ZTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomSe-0001J0-BA; Fri, 26 Jun 2020 11:24:00 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolE3-0000hS-1D
 for linux-riscv@merlin.infradead.org; Fri, 26 Jun 2020 10:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
 Content-ID:Content-Description:References;
 bh=RUInkwppGEY2OD1Zn1NZcICY8BU7HziGnuCYCO6xNi0=; b=ql6X9aY80klkZvqdvLOUm2dWHP
 EH6mAGCQ/EIth/HxAmZPhrQilaCaNTgz/brFvr2ZM6ucoBQWMzhV3zUS2nE5HzlOLCqnnvN/eoDOh
 WE2hUG/piCRApRvGTO6ee+ycFX1iAEXhpw1omjfS++Ae9u05sJ2Z8IflEknl0/OaHtE3XZsIpEFFM
 oNocbmrF7hdh/2ZiE6tAFfjEAjqLtX/IYT90/srn6Haw4DfUGl7EN6JRnG/TpWU54xpEYclkZq3hp
 q/Tmc+2oEUxkjNzG9z8tMjbEXc66DdanbvoGsKHiibEBc01ytE5IzYOYuwDfllhhDfaW34eak2sID
 4KyvQrIw==;
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jol3z-0000pt-9r
 for linux-riscv@lists.infradead.org; Fri, 26 Jun 2020 09:54:33 +0000
Received: by mail-oi1-f196.google.com with SMTP id w17so6865808oie.6
 for <linux-riscv@lists.infradead.org>; Fri, 26 Jun 2020 02:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RUInkwppGEY2OD1Zn1NZcICY8BU7HziGnuCYCO6xNi0=;
 b=Dk7LaBzkZouRRNfHAOBhsxXZqT/quWHc+saz9T8BMocYoA4hfvFN+SB+9Xy+JzS+h8
 hz9ef4aVKlxpaXUNngDXfGEAiGBAc896SmB+7T+Uj66MXzK+x1nQnhImxmfSWkvccrKt
 SLE0SknkV8zpDteERUsmk4xI738WCtjEltMVkIvnGY0I8Yg3QXJSD9k9LiGNWfkKjChF
 iWwE50F/dCuD8pHFusibRuyWuvi4N2iYU/knBwJMFjJfZle2KNQIsn+BWoJRGFPepDX3
 WhNKx1SK3O5mfJpnw9I0zDww8F1Md3xYZLoKqy63Af1U0mwUdZ3hmHt7kitvLij5icwP
 mbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RUInkwppGEY2OD1Zn1NZcICY8BU7HziGnuCYCO6xNi0=;
 b=CqJlUi0O6ReS8YmSmVgdnnSxHAEgFZFokoNpM4uy3O0kRleqI89u4mrShAG7vp5Ltb
 +awmmzPMQrw2Rx4p8x87uN+shZT3xOKgQVQa0jkOoSjsKSIqOzV12uDipkRVGPs23XSx
 KagJnADj0lC8XtatKLHMLDW3v7QEP4fcDXuHxgxh1fV118jOaAgiFCNYCRwZp/6Ap/9/
 UvmEArjWHc47XSCPUBIhe/+9A3pttoZZBf8KYHlLD+/E81qXRTEH0gGhqVj4NXWwhcIf
 WL4PvZNpgJSkdqtTUFEzeQxMYlYIBLuma15zNTzGaK8TdojNxteWBlI2ZlD0WDtKvSR6
 tP1w==
X-Gm-Message-State: AOAM5316QT5MpxJv+sOSb4wX2Dm/yslqqifJazuAsx/Z+Di8PF5CLdno
 tmkPw2OJ5DbXwY2mgnzASY2DK+yP2jHr4w==
X-Google-Smtp-Source: ABdhPJxxAaJZG05Y+ZHLJYNtwRZoWhDrbFDYa5i5HzUiieCkN7a6GU6Sczv8+78ybu3YEuJgnbOllg==
X-Received: by 2002:a17:90a:1996:: with SMTP id
 22mr228055pji.171.1593125300117; 
 Thu, 25 Jun 2020 15:48:20 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y26sm23563581pff.26.2020.06.25.15.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 15:48:16 -0700 (PDT)
Date: Thu, 25 Jun 2020 15:48:16 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Jun 2020 15:39:37 PDT (-0700)
Subject: Re: [PATCH] riscv: Fixup __vdso_gettimeofday broke dynamic ftrace
In-Reply-To: <1592905854-60833-1-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-14238943-d2f5-4dd2-9f23-90203fc1786b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_105427_959346_99BD414C 
X-CRM114-Status: GOOD (  20.08  )
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
Cc: guoren@linux.alibaba.com, alankao@andestech.com,
 Atish Patra <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
 vincent.chen@sifive.com, aou@eecs.berkeley.edu, green.hu@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 23 Jun 2020 02:50:54 PDT (-0700), guoren@kernel.org wrote:
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

Thanks, this is on fixes (with a slightly modified commit message to fix some
checkpatch issues).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
