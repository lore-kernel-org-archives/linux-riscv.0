Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D190C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 15:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/qr2Sn8qxeOXe6piddzmGsu46IFvZo8+k+81Gdyvtg=; b=I5AJfMUSnYZ+nQ
	YAUd8zvtFl4XVKWSHRCRrYBuQIWlBTegsypt0SlphIx0ik9QiDfI3yKluKf3ysYFpaoNdYSR/eN8p
	RkOx8v3D+PwDbSKwXZq1cuG34dXgmCUkXTsi8s7Y6N1XhIoMJ3+TJIKjKSTTU0bO/G/HF/RhYS5pj
	QKjbFSnulxoZGs1XoH1vP6F764zNBlvV3IkejtGtCL//oIQ6VTRcWI3eB9M1Z0kw8IdN35Unehwak
	kEixoHZb12J4cWcsTnJ6F0lbV4zEhgZ2zQtZAdfGE8wShJwjmcrlFa4jsbwpJNw9Mp8Rh8drgBxg7
	ZqemFXT9ZGLy+gyomIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVEJW-002FNV-OP; Fri, 18 Mar 2022 15:14:50 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVEJR-002FKi-MK
 for linux-riscv@lists.infradead.org; Fri, 18 Mar 2022 15:14:48 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N2SXX-1oF3tf3Ndv-013sPC for <linux-riscv@lists.infradead.org>; Fri, 18 Mar
 2022 16:14:40 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 k8-20020a05600c1c8800b003899c7ac55dso4755627wms.1
 for <linux-riscv@lists.infradead.org>; Fri, 18 Mar 2022 08:14:40 -0700 (PDT)
X-Gm-Message-State: AOAM533gic95uxXmc6SzlsDx9COtKuLqCNdZVDAh6/1uv2o4rUp/JKai
 k7/+EbWHJiQRz1oyuhUoUJJgSgiPveIfoxzxhXY=
X-Google-Smtp-Source: ABdhPJyG75Va4ian/qtyVs0DtDxDOdXf1Kw2qjsALgoDol5bS7vxyzqlPO2dsFv+pN1cEkBXYiX3AvgM1nzPhb5pvtw=
X-Received: by 2002:a1c:f20b:0:b0:389:c99a:4360 with SMTP id
 s11-20020a1cf20b000000b00389c99a4360mr16133111wmc.174.1647616480413; Fri, 18
 Mar 2022 08:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220317035542.272547-1-apatel@ventanamicro.com>
 <f1079093-54db-bd20-3342-b06d069c5d1f@codethink.co.uk>
In-Reply-To: <f1079093-54db-bd20-3342-b06d069c5d1f@codethink.co.uk>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 18 Mar 2022 16:14:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Gt7TOT2zpNw7YNR=MNLBWVAADL5dBgY15ZL8sDW20HQ@mail.gmail.com>
Message-ID: <CAK8P3a0Gt7TOT2zpNw7YNR=MNLBWVAADL5dBgY15ZL8sDW20HQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Increase range and default value of NR_CPUS
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Atish Patra <atishp@atishpatra.org>, 
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:fd1u9rHgAd7ToAYCKAdlJ4LCx3GahbXy9XIuK0MQqYNkMyrJeMl
 LGDLECuqwPF34CHkdjHj1Yo88wFDHPkoq7tKLuDmLF6hudBCiWdjRJtN4sWwy+2thrEZUUi
 ISc/BZvnjYNtysuzRk7lirr+JIjnnN6xZ5OtxC0uNnyRvfyP362wi7jP3PD+tE7jqrrvBam
 tqqMganULKV3Kn5dIdBqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OtIA9/y0lYQ=:RLpa9gRwX5LOw2Zqak2tia
 FbOiMS5ENFeaSTloGaj/A/GnOtayVPKRx6mmEpqcxNgJDFo8Ed2SbtteisXwz4zgBqwuNJ0fL
 hFjVAGTS5bGP6BAyQIG7QDetjsK9hKiMfBSLNpUw/xy/TnTcLypEo0b4NrKVsmKNyiFmbOnCR
 dwPSxYY64TcNsF7SIQF5FCxaKTB2w4ND1gpXx4lBasbUDcU1ZSaQHqJKIEAypMFVjDy18w09s
 /G2WsoykAFlUkSKyTsVTrXUMJLQWtCVvB5HyZ4GfTShqq8wwfp1jwQ/WRiqmkrMe83G7oh3fs
 hTRYb3weksX+MhSzNI/AkjK4LxqLeSshZTu3J+IKnlV5AVza4UBrMyPUPevxLUb4D0kKcy5U+
 WkJRjZP1lICcpobbWIiqCiKUEB9cvkuKOwAUmytvLxFYjEwTxyvPvaGMSJn+KHKAZ+xRk2inS
 XErMLvQ+tZIhOIAFifZM1Ivae0YSMKAMBQks61yrs1tbLDmZWsVRDhvjJadnc1kMip8iQGR7I
 2NlaQp0zm4UAyxn8xdvfAr4Ux2tFZkxlTt9vtUBWcv5V3JJ5kXEATcR6RlG9LW3M8szxO5Mkh
 Nzk9PtyhVGsSoFXXCnWCylir8AMJV9peXK/uEZhmut85Xm3Ce/vIEFJdZtgg8ItAsz3vUcTt5
 HoK7Kw13OUJqI49mklU1IYGlZ+Qphht4jF40EeTXqqNCYBCAugP0e3zZM/YhIHsZB3Sg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_081446_082863_E5DAA9EA 
X-CRM114-Status: GOOD (  15.80  )
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

On Fri, Mar 18, 2022 at 3:46 PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> On 17/03/2022 03:55, Anup Patel wrote:
> > Currently, the range and default value of NR_CPUS is too restrictive
> > for high-end RISC-V systems with large number of HARTs. The latest
> > QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> > restrictive for QEMU as well.

If qemu allows 512, what is the reason for limiting the kernel to 256?

> > Other major architectures (such as
> > ARM64, x86_64, MIPS, etc) have a much higher range and default
> > value of NR_CPUS.
>
> What's the memory overhead for increasing this?

It's supposed to be very small, I would expect three main sources of overhead:

- cpumask_t variables, those grow once you go beyond the size of
   an unsigned long (32 or 64 bits), so with the default just on the limit, this
   makes no difference.
   Note that you can run out of stack space with NR_CPUS values if
   CONFIG_CPUMASK_OFFSTACK is disabled. Should not be
   a problem for 512 or below.

- percpu variables: these are dynamically allocated based on the number of
  CPUs at boot time, so they should not have any real impact.

- NR_CPUS sized arrays, these are sometimes used in place of
  percpu data. This is only a problem if the array members individually
  are more than a few bytes. There are not too many of these in the kernel,
  as using those is discouraged.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
