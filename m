Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9284EC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 05:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SmGGKg2pZvOJ7QbBQZVd0qtqhSDABUFNzjDe4sVu2/o=; b=CXhICOXsxrw1r24YE1LzvBRPgM
	PyD+Owfbal5ZswbKFBuFyoFipGJhY2/evdfHjh5Qk16UfFgrZJ8C7mQ26JmsuAvLzoMrluWD3u28b
	Z7AxnW0Ogwd1FW1GPsBGzQ5kuiiVIpDwF7PaHPyiFKbTc3KSbgjdn2RIMf6XBj413/b6K+uTuX7af
	I64+6bUCfbCf5MiAaeDUBGV0jqmIvcyoUj5/EFj7P6xuVOxRCAu5sEqBys9x4ZY0pP+zxUwHBXEGJ
	w3afUE1MihT6vfio8baFjIU60nG1eRkb6eTWPr20iox7K9/cRWm/ISC3nOaKgFZ1cc2OKv6tia0YH
	8NM39daA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdpr-001Znl-J1; Thu, 02 Jun 2022 05:57:31 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdpn-001Zkl-O7
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 05:57:29 +0000
Received: by mail-pg1-x52d.google.com with SMTP id q123so3878136pgq.6
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jun 2022 22:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=eCxEx+lGKntTG7Fb8tQyhburmQhM2/HBYS9YgGU41Xc=;
        b=edIKWMrX1gHLqKaFFQg3AuQnb/ENAgn6yaiyBB5RU1h8WL7s78CjgBV8+TMSixJl+v
         XJqxry4JLFf0bQ8lAPAcuO9GuwjT7Baa39Wnu/CqWFDHiymb0Q4gk5phbYwIzshjlq61
         w9wxqtjJXJ/WDtrGeHQJ9TFn0rGeqayHbNLfvBHBDoftA//VRHcI2G/4m5xFAkguwZGA
         RejZ0N3djpuQH5KcDr8bcTtigJO+6T9y66N1RMJfhqlDIBJQ+LQPfhnFjUSS19gSKsdH
         G2F/FSq+boEJH0ukdCyM9I/BtYHkIoX0/HG/xWdJENzvptRByHTHILfNPfrbBbm2bNMK
         bVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=eCxEx+lGKntTG7Fb8tQyhburmQhM2/HBYS9YgGU41Xc=;
        b=txxhWIb4k9j2C9i127GkMMmYmtHCOgc0wj6vUm/XwNxSwmIg90V71UqhUSi2ITiD8H
         CebKJ2uVuBFC2I6+WgjgNgPXNd6wZvQu3WwbhqW7QJFkETaqxswC8r7qhdMNJxsAfMwx
         nWBrtiUEGwoWTOWE8NIgE1NsxVU4G1PrCiUioyieXaJAdk5LxeVQRYLuKQpUyxdZTL4F
         0gEhfw/lEMt8YNTS36SKHPekPXaQD6oH5m6S5Xt3Ql+Om4eoUHlGzhxydppEhSBbfkjA
         +SDtNToSZlKLnBufSbsHFYvD/892XYjNWj/lT3X+R2edYS3xOF76B+4Dq5eIpMZwTiJn
         dt7Q==
X-Gm-Message-State: AOAM532FnRTmxAO+qF8pyrMIxDvBun93H1gy///w2uF/Olf/39qGctQ2
	TsT52wtvcFN9+ZTA15rrQOH0MA==
X-Google-Smtp-Source: ABdhPJwTM+tBIHInbx5RKvyF5S2E6WESh5R2YOu2NgwnGGh45y+xb7slw3W2Zxikj/QtLGmUateXog==
X-Received: by 2002:a63:e603:0:b0:3fb:c191:9b65 with SMTP id g3-20020a63e603000000b003fbc1919b65mr2808347pgh.12.1654149444846;
        Wed, 01 Jun 2022 22:57:24 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id f82-20020a623855000000b005184031963bsm2517317pfa.85.2022.06.01.22.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 22:57:24 -0700 (PDT)
Date: Wed, 01 Jun 2022 22:57:24 -0700 (PDT)
X-Google-Original-Date: Wed, 01 Jun 2022 22:14:14 PDT (-0700)
Subject: Re: [PATCH] riscv: move errata/ and kvm/ builds to arch/riscv/Kbuild
In-Reply-To: <20220511184408.2751850-1-masahiroy@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, masahiroy@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-4c843db6-5d0a-4b89-a724-9d141b08f1c1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_225727_830192_AF8425BE 
X-CRM114-Status: GOOD (  16.04  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 11 May 2022 11:44:08 PDT (-0700), masahiroy@kernel.org wrote:
> Commit 909548d6c578 ("riscv: add arch/riscv/Kbuild") intended that
> subdirectories in arch/riscv/ would be added in arch/riscv/Kbuild.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/riscv/Kbuild   | 2 ++
>  arch/riscv/Makefile | 3 ---
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> index fb3397223d52..525ef2482253 100644
> --- a/arch/riscv/Kbuild
> +++ b/arch/riscv/Kbuild
> @@ -2,6 +2,8 @@
>
>  obj-y += kernel/ mm/ net/
>  obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
> +obj-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += errata/
> +obj-$(CONFIG_KVM) += kvm/
>
>  # for cleaning
>  subdir- += boot
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 7d81102cffd4..fd9fda67c038 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -103,9 +103,6 @@ endif
>
>  head-y := arch/riscv/kernel/head.o
>
> -core-$(CONFIG_RISCV_ERRATA_ALTERNATIVE) += arch/riscv/errata/
> -core-$(CONFIG_KVM) += arch/riscv/kvm/
> -
>  libs-y += arch/riscv/lib/
>  libs-$(CONFIG_EFI_STUB) += $(objtree)/drivers/firmware/efi/libstub/lib.a

Thanks, this is on for-next.  There was a conflict with the 
CONFIG_RISCV_ERRATA_ALTERNATIVE removal that I had to fix up, looks 
pretty easy but LMK if anything went wrong.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
