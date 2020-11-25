Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D92C56202
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 22:21:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 210E120857
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 22:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLz5qqVx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="iS32R2mg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 210E120857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=if5dSrdMsf71Sn/5DwY702t89hsTmwv7uNTfIldzDxM=; b=NLz5qqVxz3eY5YC+bdv+Lh3tM
	yCtx3H7hoywqnSk4LWoW+Vo/xSX6RSSweHRYDl8kz2Vf2icNAgHvKPXGiIhElqs/B7utFcdkaAj1+
	V5/Sq0eVFMgOgyYvfsNCDqvEpdBKVEvtYMNgVGSpssE1jtha1z+WJSmKFCQi2kHcOoU6AdeYteo1n
	BHsMbuMRUS2zDxx4/790oRcvg+E6/hfhSzaqNQQu10vwTVWG8Qd6NhL3CNf+k2TKQ4CG89ekMotRD
	UsY2r4I+snkkF+HMcSg7pSEx0Eyj43yYEhhgica1Tcz7sMA5Wyj5b/fdEFdhQhpbx/rgOQeQgNRcf
	njfARZyqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki3A6-0004RY-Vn; Wed, 25 Nov 2020 22:21:19 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki3A5-0004R3-3k
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 22:21:18 +0000
Received: by mail-io1-xd43.google.com with SMTP id i9so3705126ioo.2
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 14:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Obc9oAa4Q++XALRlzrUyrRVqc1agZSp46AW1HZAJ6As=;
 b=iS32R2mgmHC3X/C+hrw0PXQbrW2VERKpl9Z2Cse+Ovi3uPLnRjTEoe4GfsV1BtFZg8
 yVGSiclouCKm91AF0yPUYfOanK2b7cNEXnT/hBu3xxqMKvOJT+f46tHss9DSykP2cPCC
 ioCFMGGUCbN1XpybdnCMOMfKyr9OJA8ycaZpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Obc9oAa4Q++XALRlzrUyrRVqc1agZSp46AW1HZAJ6As=;
 b=haTeEpUYGJL9q9nMLPdcLCISK5B0FbGRPoqnMPA9RMrJhiKpQIhewZPgDbBghnFzt8
 F0+jvH08ZEoXS90gc1hom6jmDD9cfe/pNSje+U3IadPLlBRshyjGXNskmz9SOrogg+/Y
 DoO8NVTPIjiGCc+/dsW6uFdncqjNoFmUyDQ5fD06NI2j9Dc7f4fdgbQRe14GJfnmKx/2
 XOrwxw+pz/kst7O8X94y/6YVXJgTP90zFMc0ADhLBOXjXRPshBYvvkNSOUQtz8P++BEI
 ZePkLevkqwmhBi1Q6JxPVSHNG1lXgZYsSnSI29ZgA9KCJLEWPm4rD/a81dINKgHJqCVt
 UMOw==
X-Gm-Message-State: AOAM533ZiDMbdUV2I0mkFKpeEMwGKIijDzrkK85q64crTi7hTYgevLuN
 uc9nddB8H29bWtKi5V8w1yVXNryuziHgmhq9S5gY
X-Google-Smtp-Source: ABdhPJw8xPmtCSTPzn7dL9AudIvr9U3Uq5NwzFsYNtN+rNjpBobNaG83Oz0+EKNsctVCLpaxVqj4OoBF2HBIFXzP/A8=
X-Received: by 2002:a02:6603:: with SMTP id k3mr383106jac.24.1606342873600;
 Wed, 25 Nov 2020 14:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20201125114415.94912-1-wangkefeng.wang@huawei.com>
In-Reply-To: <20201125114415.94912-1-wangkefeng.wang@huawei.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 25 Nov 2020 14:21:04 -0800
Message-ID: <CAOnJCUKPEAp5G-O3-hS5h_Hb3=CcHWJdg7heGmLioGMjefrTNg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add machine name to kernel boot log and stack dump
 output
To: Kefeng Wang <wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_172117_270617_261CB105 
X-CRM114-Status: GOOD (  21.21  )
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
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 3:40 AM Kefeng Wang <wangkefeng.wang@huawei.com> wrote:
>
> Add the machine name to kernel boot-up log, and install
> the machine name to stack dump for DT boot mode.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>
> Here is the message after patched,
>
> root@(none):~# dmesg |grep "Machine model"
> [    0.000000] Machine model: riscv-virtio,qemu
>
> root@(none):~# echo c > /proc/sysrq-trigger
> [ 1519.475346] sysrq: Trigger a crash
> [ 1519.476004] Kernel panic - not syncing: sysrq triggered crash
> [ 1519.476480] CPU: 0 PID: 64 Comm: sh Not tainted 5.10.0-rc5 #246
> [ 1519.476877] Hardware name: riscv-virtio,qemu (DT)
> [ 1519.477169] Call Trace:
> ...
>
>  arch/riscv/kernel/setup.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index c424cc6dd833..901ac0c680dd 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -54,8 +54,15 @@ static DEFINE_PER_CPU(struct cpu, cpu_devices);
>  static void __init parse_dtb(void)
>  {
>         /* Early scan of device tree from init memory */
> -       if (early_init_dt_scan(dtb_early_va))
> +       if (early_init_dt_scan(dtb_early_va)) {
> +               const char *name = of_flat_dt_get_machine_name();
> +
> +               if (name) {
> +                       pr_info("Machine model: %s\n", name);
> +                       dump_stack_set_arch_desc("%s (DT)", name);
> +               }
>                 return;
> +       }
>
>         pr_err("No DTB passed to the kernel\n");
>  #ifdef CONFIG_CMDLINE_FORCE
> --
> 2.26.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

LGTM.
Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
