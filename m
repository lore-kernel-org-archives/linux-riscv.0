Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F17C4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Oct 2022 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pzJ274ySJFA8BLma6Bbrat9wfWrZbzJa1bazBVYT8uo=; b=ZRqguCp0UZXuSb
	dKHdig8FfvuAo63qrZvtxJT7n4WVt1R10HPmcQXNO5Zk5dOcSzRNNYYqOLbwMtZEoK9XgndptoJDW
	zLbf8dRVBImZThUD8Oo5ydJv33emxeQ3wvJukynawT9sreTJw0Vrsu7TONj1tRXImMT4JvRmnNGu1
	r6zWHkhgxRe4vQUmbnQSy0SFcuiZAB6G5fjp6j0B9tzXRj8EyaydeVMUCP8VhHTor2GdyZPOs9ShY
	19yaIQ+dT96T1BtOSuXGCG92Wzgipvnwww2nViykIcujFbXEy4NDK8UC48CAladu7BNofxFkdCv3k
	FRoFeHjCaCTh1Y6q42Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oebkf-00EezT-N6; Sat, 01 Oct 2022 12:37:53 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oebkd-00Eexc-7d
	for linux-riscv@lists.infradead.org; Sat, 01 Oct 2022 12:37:52 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 29so9110519edv.7
        for <linux-riscv@lists.infradead.org>; Sat, 01 Oct 2022 05:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KvoW78AAzLT7ogprsLkszyOkAENilZD0ZsEjEIY7x0Y=;
        b=DFj9co/s7Si11tq78pS0zSw2gbw+Tb+WKkxc28fGQUGrUfLtzLs1Q3MI4kpUD46dGa
         NwAVCwApxbS6WizMyL8P7D562jyBRCaYv5Dw552oYAbeHum0paFabcUC3KhJpEEQnLIW
         QvHVqNsHijnKo+wUYXVmX+VU3tPSsI5i1/5L04MDJK660hCBk9vdUuX8rfocbx88Q34Y
         qsjcnKBUa+Ibn+gVEOSD5BmlDGZHkRCMd5qsR+IjFg70g9z++SnpRGnGMM+rwYk0UrRs
         QUq9x9RbgyqV+ii8DSvWPt/CMpIvSt19TVO91MYrHUo1MscOuJ9hUhP/065oo9u22pBh
         8qoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KvoW78AAzLT7ogprsLkszyOkAENilZD0ZsEjEIY7x0Y=;
        b=oCeMaCYN6sVKcZA6y9miSWVhx89YW7qiDtRR1Cy2sVtaDP5gWl+Zr7FND2fDJbqK1M
         yfLceKz3Nb4lcQlyykqIIkFJq7iYfztn0BPsTb8HXN8oDD7PEfrxTRuWDb6NddjokAxp
         CBkPx/qUEF3mNYPRGXBR/OHrvV+NYBf482pip0lwty5xJRS0QKQCBEE+dGpHQNzEt826
         UPF9q6rM2rR8WwVp4kpBKbyWgomKX1iTLE+pLBuPPchrAfuAvgTtIarZSEzReXoX+M8U
         qSHmiPCnRInIWTxDzHtW8psqd8fzzMMvvZUlqfDb/F9PHQ8NlEexND5SOuz0dujvzBiu
         b4iw==
X-Gm-Message-State: ACrzQf28WYV52HzHKQyjVWT2l7QRWJoTNxXJHLH4An7p2Iq+aZTL/EDP
	dKrYWrfIIyCaxp7eG39TQJxltQCYZW/Z2mzBNxqSoQ==
X-Google-Smtp-Source: AMsMyM5Rn68oIVyanTIFge59Tc6+8hXWa4NwyznUv2aygvathNANcu50e/yq0hAeqQd89XVbRJqBQAwDhSZIuB4NTmM=
X-Received: by 2002:a05:6402:b4e:b0:458:9b11:da56 with SMTP id
 bx14-20020a0564020b4e00b004589b11da56mr4132875edb.140.1664627864469; Sat, 01
 Oct 2022 05:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220925162400.1606-1-jszhang@kernel.org>
In-Reply-To: <20220925162400.1606-1-jszhang@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Oct 2022 18:07:33 +0530
Message-ID: <CAAhSdy0qtH=N_LQ8KfiYTJFoNLeO_wYzhmQD8-TtSTNE5doLBw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] riscv: kvm: use generic entry for
 TIF_NOTIFY_RESUME and misc
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_053751_492851_1B33D594 
X-CRM114-Status: GOOD (  13.93  )
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

On Sun, Sep 25, 2022 at 10:03 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>
> This series is a preparation series to add PREEMPT_RT support to riscv:
> patch1 adds the missing number of signal exits in vCPU stat
> patch2 switches to the generic guest entry infrastructure
> patch3 select HAVE_POSIX_CPU_TIMERS_TASK_WORK which is a requirement for
> RT
>
> After these three patches merged, the left RT patches are similar as
> other arch.
>
> Since v2:
>   - splict the series into two separate ones, one for next another for
>     RT.
>
> Since v1:
>   - send to related maillist, I press ENTER too quickly when sending v1
>   - remove the signal_pending() handling because that's covered by
>     generic guest entry infrastructure
>
> Jisheng Zhang (3):
>   RISC-V: KVM: Record number of signal exits as a vCPU stat
>   RISC-V: KVM: Use generic guest entry infrastructure
>   riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK

I have queued this series for Linux-6.1

Thanks,
Anup

>
>  arch/riscv/Kconfig                |  1 +
>  arch/riscv/include/asm/kvm_host.h |  1 +
>  arch/riscv/kvm/Kconfig            |  1 +
>  arch/riscv/kvm/vcpu.c             | 18 +++++++-----------
>  4 files changed, 10 insertions(+), 11 deletions(-)
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
