Return-Path: <SRS0=aBv4=DG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 528FEC4727C
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 22:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED2920789
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2020 22:13:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I2aklptF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="cgZF4707"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CED2920789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RY5VkR/sYqNE34uzCWNiUGpWDO7GaENyHv9Ggld1imE=; b=I2aklptFSB1JbF7+OEk34433/
	WatbIBPV8OjoBJsogAzemsx3SULoBiSfijUpxXXywbgXKEL9svBE0xPIrYyfKhGkVMF/CSCRtGA9+
	+/BqH6HFpwH7fZsox0dDh9JB9zhjVbm+Os26pr5CPc+J8HVwQvoSyRFu8qrIEUD0cMFh7fBdS9PwO
	dJ2SOisFKGsqc02fFhf+Z2iF/t1K8SN7lrOEWBAFSoEwfIXdRFlbQr69Scu3pgmrCrqTT8KdRbXu2
	qvHcXTT+r6XNB0WyeV8AJC0l6nxGCy7cXzoC5pvuwGvh5MhTeXSpCbUQezVUdAW4atKu4RYMonD80
	0LqoQ+jug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNNre-0002mL-2o; Tue, 29 Sep 2020 22:12:50 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNNrb-0002lC-Jy
 for linux-riscv@lists.infradead.org; Tue, 29 Sep 2020 22:12:48 +0000
Received: by mail-il1-x144.google.com with SMTP id o9so6489558ils.9
 for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2020 15:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q5rZuNG2apCosJKlhEHrUGVcJLAmcdJlisM6/km9BsY=;
 b=cgZF4707763NhXAo5cgeyeXCGk4m/CVAb7kaXk4vjMegAl8/fDo48iXC3wAUXrpLo/
 d0eCel9G0LE/2b2V/x86mkuBTo2Zgkav5jnCQHadVPKZnNXTS7c0B0erhS4BnfBuzpVi
 iXJ8CoMvszXAqjCfeDoDZgokej+dF0hmA46QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q5rZuNG2apCosJKlhEHrUGVcJLAmcdJlisM6/km9BsY=;
 b=BWmSj5+j/IecVX3p2V2kCjuTFjRXOVKxs+73S/iAgkrATa9A8YJ3LDbQcp46YcFuYL
 od+Ph2ERt2H/qH6sVz7hKihpOvXwAWMnEfauTE+xLtpvuku3IleqW1RPVt6VvWdEFfdW
 y/pNIA1Qzkqahdbi93R1xjBKFrDx69+J5PJcfrhGOYMyxinfSP3qNyAET3nrX2pJImYF
 LO3SznwlxK7A9/E+er1jqi3hE+abu19xRPsdnKpSpv6JKrIenh2CvMZns3Yb0POqqC7t
 2dq8mFVMnFuN945qUUiZjBmMyQdk9AzqOv0LKXAUQEaLV/PSqIlwEHGsPUBsGkGm2Ufk
 qyKA==
X-Gm-Message-State: AOAM530CTXfB4IrnUB+MBTYPeruZILB4BQgXfIb9K2IEpUOpqGcbuLvu
 pAyn08y602guSKNaK981TtwPA4SnDagl0xqL83dn
X-Google-Smtp-Source: ABdhPJysY6J9rnXYsfREUHOiC+nMpH1IVzBdA0+w4kYMeCgHlOEXszC/A0gVNL0FPQVDY10Pdw33hk4VxU6+gWT07Og=
X-Received: by 2002:a92:9ac7:: with SMTP id c68mr4818119ill.126.1601417565143; 
 Tue, 29 Sep 2020 15:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <1593266228-61125-3-git-send-email-guoren@kernel.org>
In-Reply-To: <1593266228-61125-3-git-send-email-guoren@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 29 Sep 2020 15:12:33 -0700
Message-ID: <CAOnJCUJ-Jdk2GCgvrHVCxVoekysFKZyDWWmSFjmKaJOEcczQSQ@mail.gmail.com>
Subject: Re: [PATCH V2 2/3] riscv: Fixup lockdep_assert_held with wrong param
 cpu_running
To: Guo Ren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_181247_764717_CEAE580C 
X-CRM114-Status: GOOD (  18.75  )
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
Cc: tycho@tycho.ws, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 6:58 AM <guoren@kernel.org> wrote:
>
> From: Zong Li <zong.li@sifive.com>
>
> The cpu_running is not a lock-class, it lacks the dep_map member in
> completion. It causes the error as follow:
>
> arch/riscv/kernel/smpboot.c: In function '__cpu_up':
> ./include/linux/lockdep.h:364:52: error: 'struct completion' has no member named 'dep_map'
>   364 | #define lockdep_is_held(lock)  lock_is_held(&(lock)->dep_map)
>       |                                                    ^~
> ./include/asm-generic/bug.h:113:25: note: in definition of macro 'WARN_ON'
>   113 |  int __ret_warn_on = !!(condition);    \
>       |                         ^~~~~~~~~
> ./include/linux/lockdep.h:390:27: note: in expansion of macro 'lockdep_is_held'
>   390 |   WARN_ON(debug_locks && !lockdep_is_held(l)); \
>       |                           ^~~~~~~~~~~~~~~
> arch/riscv/kernel/smpboot.c:118:2: note: in expansion of macro 'lockdep_assert_held'
>   118 |  lockdep_assert_held(&cpu_running);
>
> There are a lot of archs which use cpu_running in smpboot.c (arm,
> arm64, openrisc, xtensa, s390, x86, mips), but none of them try
> lockdep_assert_held(&cpu_running.wait.lock). So Just remove it.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/kernel/smpboot.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> index 4e99227..defc4e1 100644
> --- a/arch/riscv/kernel/smpboot.c
> +++ b/arch/riscv/kernel/smpboot.c
> @@ -121,7 +121,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
>
>         ret = start_secondary_cpu(cpu, tidle);
>         if (!ret) {
> -               lockdep_assert_held(&cpu_running);
>                 wait_for_completion_timeout(&cpu_running,
>                                             msecs_to_jiffies(1000));
>
> --
> 2.7.4
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Thanks for catching this.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
