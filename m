Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12E8C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 08:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fWnIOMfYUNsM0A+WBkooGt8M8IQt9sKzHMYjMGR4zE=; b=r1R9vIpVFD5cJr
	pDaZbzngGKAIxS0yplH6IctJOWVI4hpgJj/unrnltrA4s54uZYA6Ef4tlByeKhOxfzog1wWdK27XJ
	BHSDsdP6yWur77oagIZeANmzJWKpdgNY6pCfpjex8JfZWnWbnC52rzMGu96ILhnNs6bEfS8Rttp75
	agLrWgMIqDvgrHdPn3LGPZgxR44qsDfvcRabP/PMP+7mNmyNO4r6eZUUqcs2LvFHK9jgQaZiG3tZ7
	xBCtUqpDen005BOnYnKgPhlFvdNbpdtrrJlHIvP3KcWFNSPRhYw8YHT2V276Nj/7ZegJF/MSLBC+t
	nHlxO6XQ0G4EXw5x2PPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnn9-000vU4-Mx; Fri, 22 Jul 2022 08:13:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnn6-000vPg-9B
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 08:13:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658477618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HFrJKjNNYU0491FNuTI8t6vKob0kktI0zA4xaCL8j/E=;
	b=bMbf+oBVlrk1twJb30ICPIS1DGfAnG1YtQ1QVSvqzxK2Vq9+qqVHsAf1LOcs711+icfxEd
	k0z8sbJD+IsLjav+hptHGGN6NUun5cLLpfSI2DKp5kwPWP4Nf8RoC8cNhAlcPmKsaGGrlh
	G8/Hib4Q22u/UyFmTHxYg9aR+PRkiTE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-aGHM2KT3MHO8fB27AQD1Ow-1; Fri, 22 Jul 2022 04:13:36 -0400
X-MC-Unique: aGHM2KT3MHO8fB27AQD1Ow-1
Received: by mail-wr1-f71.google.com with SMTP id t12-20020adfa2cc000000b0021e564cde06so711865wra.17
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 01:13:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HFrJKjNNYU0491FNuTI8t6vKob0kktI0zA4xaCL8j/E=;
        b=w+4SOOcyUREyQtz0cjFObFedSTb92WdTKd5dTlrU1+yCMGP5usaRIxpR3OwS8/Lf6p
         D7GnAtjoPlpxzjxgxiNJnzZD/zfioF+C2+B2ttDtadSHrQxVbHv0ZoUI7bK9Bq7bL34E
         ml/tVZz+VyJ3qLk/58vSC1m4u9R9tCvt5eyZSnDsD6XjHh5S03/Wq5k+B4R/oU2+etPa
         8vemZT7KF/kOXVa5eF/lUurx5zMZNOn5R2ulhH5YJ7cajQSSJ4yh8t8Zf2RsSdKT703K
         uUZs15zwla7CLRT9dEnZirvIFwPSXTzGM8v+qTbPuVan+aM5i637LCDf6HFimwnCQo5b
         KPsQ==
X-Gm-Message-State: AJIora/DQLcqQ/CCJ2duC8mb5pV5lJD8IIV4woZuts66IepBQJ/7Q2MM
	c4So0z/ZlxlgsVBTiFZryp76rVE5kBTfnOjNTloWmtFIXxYD7jFeHbcBm/aEawHqTYF4yBKTfxk
	ChwJY+yI1YgLFnnlu2k+iYamfuNpu6PjjCrdoHYi1vzAq
X-Received: by 2002:a1c:1901:0:b0:3a3:1be3:4df2 with SMTP id 1-20020a1c1901000000b003a31be34df2mr1603467wmz.146.1658477615397;
        Fri, 22 Jul 2022 01:13:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVB+HIi9H23yr75K8PX/2qN+oLoitA0TnKRsCF5mFx9I8K+Vyw9ABD6g/5ZglB5xC20l6aZRQ/i9F1r2pHv/8=
X-Received: by 2002:a1c:1901:0:b0:3a3:1be3:4df2 with SMTP id
 1-20020a1c1901000000b003a31be34df2mr1603426wmz.146.1658477614949; Fri, 22 Jul
 2022 01:13:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220717101323.370245-1-xianting.tian@linux.alibaba.com>
From: Dave Young <dyoung@redhat.com>
Date: Fri, 22 Jul 2022 16:13:23 +0800
Message-ID: <CALu+AoTpiQh7NUJJZs+6A7MCUNWJq=NeSimoF=AVHpRptd36eA@mail.gmail.com>
Subject: Re: [Crash-utility] [PATCH 0/5] Fixups to work with crash tool
To: "Discussion list for crash utility usage, maintenance and development" <crash-utility@redhat.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	anup@brainfault.org, heiko@sntech.de, guoren@kernel.org, mick@ics.forth.gr, 
	alexandre.ghiti@canonical.com, huanyi.xj@alibaba-inc.com, 
	hschauhan@nulltrace.org, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	linux-kernel@vger.kernel.org, heinrich.schuchardt@canonical.com, 
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ruyang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_011344_423543_A6575AF4 
X-CRM114-Status: GOOD (  19.48  )
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

Hi,

On Sun, 17 Jul 2022 at 18:13, Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
>
> I ever sent the patch 1,2 in the link:
> https://patchwork.kernel.org/project/linux-riscv/patch/20220708073150.352830-2-xianting.tian@linux.alibaba.com/
> https://patchwork.kernel.org/project/linux-riscv/patch/20220708073150.352830-3-xianting.tian@linux.alibaba.com/
> And patch 3,4 in the link:
> https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
> https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-3-xianting.tian@linux.alibaba.com/
>
> This patch series just put these patches together, and with a new patch 5.
> these five patches are the fixups for kexec, vmcore and improvements
> for vmcoreinfo and memory layout dump.
>
> The main changes in the five patchs as below,
> Patch 1: Add a fast call path of crash_kexec() as other Arch(x86, arm64) do.
> Patch 2: use __smp_processor_id() instead of smp_processor_id() to cleanup
>          the console prints.
> Patch 3: Add VM layout, va bits, ram base to vmcoreinfo, which can simplify
>          the development of crash tool as ARM64 already did
>          (arch/arm64/kernel/crash_core.c).
> Patch 4: Add modules to virtual kernel memory layout dump.
> Patch 5: Fixup to get correct kernel mode PC for vmcore
>
> With these 5 patches(patch 3 is must), crash tool can work well to analyze
> a vmcore. The patches for crash tool for RISCV64 is in the link:
> https://lore.kernel.org/linux-riscv/20220717042929.370022-1-xianting.tian@linux.alibaba.com/
>
> Xianting Tian (5):
>   RISC-V: Fixup fast call of crash_kexec()
>   RISC-V: use __smp_processor_id() instead of smp_processor_id()
>   RISC-V: Add arch_crash_save_vmcoreinfo support

Vmcoreinfo changes need to be documented in
Documentation/admin-guide/kdump/vmcoreinfo.rst

Otherwise, I suggest to always cc kexec mail list (added in cc) for
kexec | kdump patches.


>   riscv: Add modules to virtual kernel memory layout dump
>   RISC-V: Fixup getting correct current pc
>
>  arch/riscv/kernel/Makefile          |  1 +
>  arch/riscv/kernel/crash_core.c      | 29 +++++++++++++++++++++++++++++
>  arch/riscv/kernel/crash_save_regs.S |  2 +-
>  arch/riscv/kernel/machine_kexec.c   |  2 +-
>  arch/riscv/kernel/traps.c           |  4 ++++
>  arch/riscv/mm/init.c                |  4 ++++
>  6 files changed, 40 insertions(+), 2 deletions(-)
>  create mode 100644 arch/riscv/kernel/crash_core.c
>
> --
> 2.17.1
>
> --
> Crash-utility mailing list
> Crash-utility@redhat.com
> https://listman.redhat.com/mailman/listinfo/crash-utility
> Contribution Guidelines: https://github.com/crash-utility/crash/wiki
>

Thanks
Dave


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
