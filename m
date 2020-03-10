Return-Path: <SRS0=s16l=43=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D42CFC10F25
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 02:20:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55F92146E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 10 Mar 2020 02:20:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tgvfnA+h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNlcB2rL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55F92146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=L6pCXyqDcdFgwMbY6i5R+BKWlatqyMzumWd/kP/8VIQ=; b=tgvfnA+hbCytOc5PbkydUZ64o
	RorXLQYOX/cRa0L4DwlGwWSX4CyB+RsukJj4qrrDYZXI+7U/5SRdtrtPRYT12ETfGUAkJOHa171ln
	IeNUN/BwOymJeJu3QMceyufwgVrqYbbNPX3BVeASRobuzbExCQ+QLPW7NDsjecTvnMYJx5N1Sq6iG
	cpoR6n+u68ePsfYDvJYEDZSN4iKJ+Lqtie0GQW+7CyhJTbngARdJ3S1jiiqJYKeRtHHFm5J3ldf7E
	uqLdXStXIYBi9Wd6+FF8ctfJbFbFhW7nUvXtvz/exEb3TDZ3ePWOjZz+cruxONZwkJYN6+enq4dlq
	Ce9BiOxjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBUVB-00063E-9u; Tue, 10 Mar 2020 02:20:13 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBUV7-000586-Dn
 for linux-riscv@lists.infradead.org; Tue, 10 Mar 2020 02:20:11 +0000
Received: by mail-il1-x143.google.com with SMTP id p1so6622765ils.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2020 19:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6pCXyqDcdFgwMbY6i5R+BKWlatqyMzumWd/kP/8VIQ=;
 b=UNlcB2rLgG6pr5mr7Qkp5QgEXXpD9BF8/+1CpOOUiOkIrbAMfJy8nz+CaQEc3vBHZ0
 ekiwRkHzNxtaySBL0Kku6lqnJ2vWFGyKBaawroWq9miobOATOBTs3R/vQ3qsUdQu2nPi
 MiOSO4d08txXpOviwvUEapqMTOgzqHEFJkTn9vgl6R3HbKOhMpmABvRblo6XMm7GtZL7
 GNWRbnbznjeuWfGR3wONAPqe3eFcHMmUw5RkwEZttZ/UCPm39XCAmwvzEiKvsvTuFDqE
 a0YN+aivcAh11jBmKLpceitwspyh5/ZYml3/gl6xxE3DEGhpZUpmpYeWvnx/YhQzx9rh
 RUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6pCXyqDcdFgwMbY6i5R+BKWlatqyMzumWd/kP/8VIQ=;
 b=Ny3YW1CQ33jIBBHZdpgrB5xOyfEG74o41ufz+KITXKM2oNHhyHbqzF9dFNFu7xkvLU
 RPHRnws48+DPSad9rpoKNtens+jTu24Gxd/fErbrHIt2FacQYg92OA/DIo57QJa9Mkgi
 4tbenTx0kyE9JCUrXnupRAE0nYd0vviumIpmVsFPGYdAbipyHrXWGMpgI3HQix0hTcUB
 coJ7F9bLBqiULKagoTu9ys4TEsOWqTN6SnfLN37e+PYhF0KygBzMrWZiPLqGzwlA1ghm
 E1/2CdgRIpua68yfNiZG+NcFibJLrc5OzpuRvTcH6z7IcCJe02WwLoWCG9Ftciw7E4Tm
 jdEA==
X-Gm-Message-State: ANhLgQ2iB9BxnQrM3Rv3KfGmRHPhlit+34PQswvue461mDyzFXP4rrDA
 84/paAWV047UThx0F1DioHGYRQeAhH4ZR4g6Qv4=
X-Google-Smtp-Source: ADFU+vvIrTlf8Gh1C40sGbrVNezt1ZTTHbHdjDa7x7F5WsoEPaoIZFLWBKwq+XlT5L9+QUvgzv6uuKw/vRHavmi/Dk4=
X-Received: by 2002:a92:8f91:: with SMTP id r17mr16485609ilk.97.1583806803111; 
 Mon, 09 Mar 2020 19:20:03 -0700 (PDT)
MIME-Version: 1.0
References: <202003091047.yO0wlUGy%lkp@intel.com>
In-Reply-To: <202003091047.yO0wlUGy%lkp@intel.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Mon, 9 Mar 2020 19:19:51 -0700
Message-ID: <CAKgT0UcHjPqF-djZWYXBg=vqkBfp295QihvPrWn6xq_jY4NNYg@mail.gmail.com>
Subject: Re: [linux-next:master 7003/7050] include/linux/virtio_config.h:113:
 undefined reference to `page_reporting_unregister'
To: kbuild test robot <lkp@intel.com>, linux-riscv@lists.infradead.org,
 anup.patel@wdc.com, 
 atish.patra@wdc.com, palmerdabbelt@google.com, alistair.francis@wdc.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_192009_502904_C41D4830 
X-CRM114-Status: GOOD (  12.92  )
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 8, 2020 at 7:54 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   b86a6a241b7c60ca7a6ca4fb3c0d2aedbbf2c1b6
> commit: 120359931943d2b801ce51a1a045dcc0a5d1a55b [7003/7050] Merge branch 'akpm-current/current'
> config: riscv-randconfig-a001-20200308 (attached as .config)
> compiler: riscv64-linux-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 120359931943d2b801ce51a1a045dcc0a5d1a55b
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.5.0 make.cross ARCH=riscv
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/virtio/virtio_balloon.o: In function `leak_balloon':
>    drivers/virtio/virtio_balloon.c:281: undefined reference to `balloon_page_dequeue'
>    drivers/virtio/virtio_balloon.o: In function `__virtio_test_bit':
> >> include/linux/virtio_config.h:113: undefined reference to `page_reporting_unregister'
>    drivers/virtio/virtio_balloon.o: In function `virtio_cread32':
>    include/linux/virtio_config.h:423: undefined reference to `balloon_page_alloc'
>    drivers/virtio/virtio_balloon.o: In function `fill_balloon':
> >> drivers/virtio/virtio_balloon.c:233: undefined reference to `balloon_page_enqueue'
>    drivers/virtio/virtio_balloon.o: In function `__virtio_test_bit':
> >> include/linux/virtio_config.h:113: undefined reference to `page_reporting_register'
>    drivers/gpu/drm/virtio/virtgpu_drv.o: In function `virtio_gpu_remove':
>    drivers/gpu/drm/virtio/virtgpu_drv.c:139: undefined reference to `drm_dev_unplug'
>    drivers/gpu/drm/virtio/virtgpu_drv.c:140: undefined reference to `drm_atomic_helper_shutdown'
>    drivers/gpu/drm/virtio/virtgpu_drv.c:141: undefined reference to `drm_dev_put'
>    drivers/gpu/drm/virtio/virtgpu_drv.o: In function `virtio_gpu_probe':

It looks like somehow the config has CONFIG_VIRTIO_BALLOON enabled,
but didn't select CONFIG_MEMORY_BALLOON nor CONFIG_PAGE_REPORTING That
shouldn't be possible since in drivers/virtio/Kconfig we have the
following:
config VIRTIO_BALLOON
        tristate "Virtio balloon driver"
        depends on VIRTIO
        select MEMORY_BALLOON
        select PAGE_REPORTING

I think I traced the problem down. It looks like it is related to this patch:
    RISC-V: Add kconfig option for QEMU virt machine

    We add kconfig option for QEMU virt machine and select all
    required VIRTIO drivers using this kconfig option.

    Signed-off-by: Anup Patel <anup.patel@wdc.com>
    Reviewed-by: Atish Patra <atish.patra@wdc.com>
    Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
    Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
    Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>


The problem is it is using select to enable things that have
dependencies, and as a result it is enabling things without enabling
the bits needed to support them. That isn't recommended and is
actually called out to something to avoid in the kconfig-language
documentation:
https://elixir.bootlin.com/linux/latest/source/Documentation/kbuild/kconfig-language.rst#L143

