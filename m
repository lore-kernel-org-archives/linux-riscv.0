Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389A6C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 03:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJJm6D3xE7l2jVVvLh4VecNk90TYfsp32DwmdjulqsE=; b=2Gw0oJxM0WBH4W
	zqS+GXu7kCT6fGp6BgoC+4xreO3j5aLgXQ4ESoRTxIuh/vnGt4YkeWR4hwfxfS8Zfw0yDrD2KR5OY
	kKXiinIcx7RRY/5V67zqd5UrL+1LagkFxRv8R4yebBxoZm0tsE3yaabBuFgb/0oUblMb0spETNypb
	DANqRBFEQmE+60zzbiNsXrNKEtTyEySNcoMyh/vj0KRQuSdMY2++i5wYOyStCAE5mBaBz6RtumqeV
	sVg3AVw/0feUAfnhchX5KLv/1rIdNzfRUfjaksOdH6qbNZgeZsaipUa8NdhUzLWIEaQeDgI4/hJnL
	sIuIj4KDnZCLW/R/oPNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPyDs-004Re0-Rf; Mon, 22 Aug 2022 03:35:33 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPyDn-004Rbt-Oc
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 03:35:29 +0000
Received: by mail-pl1-x636.google.com with SMTP id 20so8769569plo.10
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 20:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=/YXgJtX1zG4Y/XEzXgjAM2Md3fX5lW2S4LUS7dbSdLk=;
        b=l2GX2fzSLXyI87nq1OZFQ9PX3nZexbq9JA3WgTWQclOfXbsbMYdirlM1ktVMDpWmWJ
         SdKO/4w82svkn8gTDo61LUbCK0GwesP+eNKs/pU9xwcKYHlbWdORYsXHwEbwDO5MCZN6
         doGq+0VldV4khnU7VrA1EYCZB0eRhJufjIaAbryGSJT2kHXMzHE3GApgSw/hzoRmrK+P
         r0METwiuagmWwuMfKdDTXPCF0R3U6EiZz9HqXOiWL0GyeHRGeW2ad80tUUhJA89u6FCH
         3YzcJJAdwdaRtdh9GSqDChGdlbXUr1uxR4LBKN7RgiFuz2NyaQOyDPzNsDd1zEyQwYFy
         iQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=/YXgJtX1zG4Y/XEzXgjAM2Md3fX5lW2S4LUS7dbSdLk=;
        b=qlerUcUlt9zLGYLxYgmOSyCAKwknCRkKdkJMSeeKr9LWjO7pmBmd6zuU2NgLyp91Vy
         C9V+Gmm4kDLQiBPvcnX0LG+/SPt6Nfk+or9wJCnWaMIPDUEnLlN9cw5ufmECjQxlnffJ
         GNz24JR4awks6OzEcxp++0nKPAbpnj1s1pLBEFpq+QhU13LGgScvDf+J7wSTBrFYrVB/
         OY7iJiO3A0bYE08tWG8vvRF6yr25/WRizyPS2OOmrKKzOTiCWDWs7vgBPKBu9ZpSzb2t
         88Q8NqFds2ztDi/tzVgXAhzjsHAvYVmgHN+wIIEsNTyxY/7Mfu43oVxLdCmvaILBEY/y
         8EJg==
X-Gm-Message-State: ACgBeo32u2VxWKf48KKI6u4mxs4ybF0gpJJ9oU7tknpbExxazoM3TNjy
	mGL3Vx33TsVdohpfm7fdlRSYmlCtNzmDOEN575A=
X-Google-Smtp-Source: AA6agR5k7A4UV7ZDAX5IP+0c/5x94DAHUudBjlBU4Q+EhzG7bJuC/8IxTuChAUTgqiDm/nweduu+VQzNGK/MNDmZndM=
X-Received: by 2002:a17:902:aa4a:b0:172:f24e:2e54 with SMTP id
 c10-20020a170902aa4a00b00172f24e2e54mr1101316plr.25.1661139325478; Sun, 21
 Aug 2022 20:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220810184612.157317-1-mail@conchuod.ie>
In-Reply-To: <20220810184612.157317-1-mail@conchuod.ie>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 22 Aug 2022 13:34:59 +1000
Message-ID: <CAKmqyKP0Cs-cpmX2rdNfi4UACoHzA2VOrc-ejR9cDrow2-mjMw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] QEMU: Fix RISC-V virt & spike machines' dtbs
To: Conor Dooley <mail@conchuod.ie>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_203527_892781_7744BC01 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Aug 11, 2022 at 5:09 AM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
>
> I mostly opted for what appeared to be the smallest change that would
> fix the warnings, partly due to my inexperience with the QEMU codebase.
> A "sister" patchset for the kernel will clear the remaining warnings.
> Thanks to Rob Herring for reporting these issues [1],
> Conor.
>
> Changes since v2:
> - move the syscon subnodes back to the top level instead of into the
>   syscon node
> Changes since v1:
> - drop patch 1
>
> To reproduce the errors:
> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
> dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
> (The processed schema needs to be generated first)
>
> 0 - https://lore.kernel.org/linux-riscv/20220805162844.1554247-1-mail@conchuod.ie/
> 1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
>
> Conor Dooley (4):
>   hw/riscv: virt: fix uart node name
>   hw/riscv: virt: fix the plic's address cells
>   hw/riscv: virt: fix syscon subnode paths
>   hw/core: fix platform bus node name

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  hw/core/sysbus-fdt.c    | 2 +-
>  hw/riscv/virt.c         | 8 +++++---
>  include/hw/riscv/virt.h | 1 +
>  3 files changed, 7 insertions(+), 4 deletions(-)
>
>
> base-commit: 2480f3bbd03814b0651a1f74959f5c6631ee5819
> --
> 2.37.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
