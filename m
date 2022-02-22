Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBD3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 10:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pOdT7xSy6xSxQSaYcy+5tJMbrkkQtIeeTGGkdTZ92jk=; b=Fiao5v9yooyW0w
	0vq8fWnMXYqoGrdyXxVhBnRT0iXCzh7OOx07Fa8kmx4kzk8ATopSNP9AkGsVHqBHdEADuFIoby0Y7
	N2sz0Ka3dYGsNwRlNfR0jOiLPg06U71SSptw2sEfc2G6gIeQlxyRIkmFCyBSmU8AggVM/5FeX5ch5
	EhffCZR39UXRdkD/jp4AJOqC3gyTRPO9HqxdpTjl2rxm7wdQpwMzplZvp5aH1XBO2RBOQ6v6nBgAS
	LlHIVLkBQQII8rdVsPcLB5tT/YHsiDXglTT3mRb1KM8txeZddT2pRcISP9aAqd18v4TaHiCVsmjoR
	y0Sva16VvD1H6TbwlP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMSVy-0095yp-Is; Tue, 22 Feb 2022 10:35:26 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMSPZ-0092jI-9D
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 10:28:51 +0000
Received: by mail-il1-x131.google.com with SMTP id d7so12152091ilf.8
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 02:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eS2A2SDIO/vp8PmlyWTYQFrSZtShYqNTX+yWJ9M+0YE=;
 b=DLkDqBLdcGNOzANvpMjGVxmycBjJ8eQh4h1LoBysLfd2y+YbDaXBykiqIcmdP5G8sL
 Ia0sqOOIwPTBZlBvMYfiZ1YH3LdwBPuDA7xIGGw3LXytjESyafL1BrBMU78Ark6gsWNs
 Lh+cDryQPwsMlv8MlvmFXNIL/SBVAw5YAfsh0wRwO7oFIMBPR1qfGK0Csn0LkENjfufS
 YiCxl9x9qyIBAHDu1XeffFwUiMU396z7WIEcaQEJo3+HA9FMuIQ0T0JAmoXhMgBXhixZ
 nef+txSPZ8AVffXJUYlytFS5sSVRylCtIopU549RgCWmTZCt8P9bqBzBFHQ4zZhOOJdR
 emHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eS2A2SDIO/vp8PmlyWTYQFrSZtShYqNTX+yWJ9M+0YE=;
 b=61L7Ky62ij9Wb5aP81ytqrv6pYc0V5/QrYynpuCsRjxAKpXZMaNlhGy1Y85kEJV9gs
 ZdTLT3z1dFmL0BWyxYKyipsCVYL/+ThS60ZAV8P+1D8DQiAZLxgnaB5f07283xycTW+6
 mPegxWfXSCttrjepRcNmuB+q+0pVQravb3D51Uk8Q4MTaRfKiECYpppEb2OFuDXsXYlR
 vUViiRjMPwK53dap6Rj9/h6wjZrl3RoIQ0NajaOCTeiimVriTARW7B2no7IhUCzzo9xP
 zC4KiQuO9zla3ECFgmPbBejUVSWWk9km/8fB8aOzTsd649yak5jq3aQphAI/e+WMIAfB
 ywMg==
X-Gm-Message-State: AOAM530fpl9+lhCOPpTjxk+xg/NsxjRwREbgaW2QM/jTy3ffWK8AzwK7
 YvhvCmw8UL+PhBzzo4M893TqT7cOH8xYl95Fedw7Ig==
X-Google-Smtp-Source: ABdhPJwZ8M29hMLuk1QpkBFpIL0BWV208pLSo5ryfETeW0mPZT8zIxdMPaMaJjkKgXCrzibMRiHMS/UGYcmgFxqLxFk=
X-Received: by 2002:a92:c241:0:b0:2b9:80f9:e2a with SMTP id
 k1-20020a92c241000000b002b980f90e2amr19663534ilo.208.1645525724716; Tue, 22
 Feb 2022 02:28:44 -0800 (PST)
MIME-Version: 1.0
References: <20220221161232.2168364-1-alexandre.ghiti@canonical.com>
 <20220221161232.2168364-5-alexandre.ghiti@canonical.com>
In-Reply-To: <20220221161232.2168364-5-alexandre.ghiti@canonical.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Tue, 22 Feb 2022 11:28:33 +0100
Message-ID: <CANp29Y7M=wSLBE8m0-CHKtYPkqgcxNiUPEyRNv-VHeR5O2BTYQ@mail.gmail.com>
Subject: Re: [PATCH -fixes v2 4/4] riscv: Fix config KASAN && DEBUG_VIRTUAL
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>, 
 linux-riscv@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_022849_378114_C612E827 
X-CRM114-Status: GOOD (  17.34  )
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

Hi Alexandre,

Thanks for the series!

However, I still haven't managed to boot the kernel. What I did:
1) Checked out the riscv/fixes branch (this is the one we're using on
syzbot). The latest commit was
6df2a016c0c8a3d0933ef33dd192ea6606b115e3.
2) Applied all 4 patches.
3) Used the config from the cover letter:
https://gist.github.com/a-nogikh/279c85c2d24f47efcc3e865c08844138
4) Built with `make -j32 ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-`
5) Ran with `qemu-system-riscv64 -m 2048 -smp 1 -nographic -no-reboot
-device virtio-rng-pci -machine virt -device
virtio-net-pci,netdev=net0 -netdev
user,id=net0,restrict=on,hostfwd=tcp:127.0.0.1:12529-:22 -device
virtio-blk-device,drive=hd0 -drive
file=~/kernel-image/riscv64,if=none,format=raw,id=hd0 -snapshot
-kernel ~/linux-riscv/arch/riscv/boot/Image -append "root=/dev/vda
console=ttyS0 earlyprintk=serial"` (this is similar to how syzkaller
runs qemu).

Can you please hint at what I'm doing differently?

A simple config with KASAN, KASAN_OUTLINE and DEBUG_VIRTUAL now indeed
leads to a booting kernel, which was not the case before.
make defconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-
./scripts/config -e KASAN -e KASAN_OUTLINE -e DEBUG_VIRTUAL
make olddefconfig ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu-

--
Best Regards,
Aleksandr

On Mon, Feb 21, 2022 at 5:17 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> __virt_to_phys function is called very early in the boot process (ie
> kasan_early_init) so it should not be instrumented by KASAN otherwise it
> bugs.
>
> Fix this by declaring phys_addr.c as non-kasan instrumentable.
>
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  arch/riscv/mm/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
> index 7ebaef10ea1b..ac7a25298a04 100644
> --- a/arch/riscv/mm/Makefile
> +++ b/arch/riscv/mm/Makefile
> @@ -24,6 +24,9 @@ obj-$(CONFIG_KASAN)   += kasan_init.o
>  ifdef CONFIG_KASAN
>  KASAN_SANITIZE_kasan_init.o := n
>  KASAN_SANITIZE_init.o := n
> +ifdef CONFIG_DEBUG_VIRTUAL
> +KASAN_SANITIZE_physaddr.o := n
> +endif
>  endif
>
>  obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
