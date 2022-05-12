Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD0AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 12 May 2022 04:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqVfXIE+cmmfte6kgB88w0CeQIYfB+mWDng05l9mXIE=; b=bzyHSaFfRhg0MY
	0OSnoQqllGGGkb7MVzVMbK5x3VvSw0j2IS+oO0X+T4j/UBnUppMBseZUODb33YDeKZD4MDEx6QPFx
	1yemhkpUC9Vn1vzK4hrUHvpK+VTI0cdomgkFre1uCekWO/fv3k+EQAcfScGnVlsAWxHyHUUOIRwn1
	LQPzEJGbSoQAECSudVf0TIeHbEyOwtIQ8liV9ydyHwJOP6m4rH6EisYqfIsNN0bUXEM399eBbPtO7
	JrRz+frgERjSB2mCMEGgMKpJ95BDBO+HhDK2NQef/0jaz0u5KrRyY1oM/C1hdWD9+Qt1q6IVgL7Ry
	brFw1U90xbLXZwq+tEcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np07Z-009sgU-8j; Thu, 12 May 2022 04:08:13 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np07W-009sev-8u
 for linux-riscv@lists.infradead.org; Thu, 12 May 2022 04:08:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so2258880wms.5
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 21:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GyMW7JKE5ri9UseraSETF0tOwJpGQyvrKdzSI8W/128=;
 b=m0wkWQXmzJubMmCCz3hb0dBvjSodoZ9dQEYU1IkfHAfvxK3OJVHUpU+yoYJBVnJxDJ
 7OmwhngCjmUyw0p79fkFhu5/hOx3+ItIrSrqmgZ2HZ3uGLyKsBPxmvY14JaG1+v7p63C
 5pNqUf95Fy9OVplO1h2hIvuiPVSrQ12ryf0D1e7Ex6veIDPHwIVYLZbLFBR04kKOMMK+
 NsflxS5PvtG9YuQOz4jXaMTTi9q+1a7YBKBmprZquPgeCgmEvybP4ON8ixUzc8d42qb/
 yICTaYvM9QmtCkAdcdfy8N41+RFnIUNaEVbSJ/66vvVLvjccI+2Z1Yl47VCpcO+o/6Jy
 em1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GyMW7JKE5ri9UseraSETF0tOwJpGQyvrKdzSI8W/128=;
 b=ws8jwM0Z1Qz8zvEY2buxfDfywcno9buQ+oV/lE8Tyka9lgHDfQkluFNL5pPVfJCEZ9
 v0GhzGCxMwa0kSARQS9pw9hAbMXj+smnAWbqcvJliNg5J15Q+LLNdqpYvKOjL5v4q8Vn
 HdEHMk+8YTRmYYoOW013qnN8SK0cpTvwtwfiikCVNaJpVBc+tl55hNMCq1NsqkdR6mGQ
 aep4jyXwAfs08WYnxW3XsLcqz/X6UtveBMJua7N9gjGIRGyRYr6+EsfW+81sSo2C75pX
 SfEGuLHklLtFUfC0gqkjmhBP/FyW4pHm0OP+jeHXjmdSNtmRa0doYXs8R3v8pRe4lxcV
 o1xA==
X-Gm-Message-State: AOAM533NddpLw9Y3DBaYM7wj9UhSZwwG39vHO20iQKzmabIXynFCogJT
 pU9D/fRY1B/MuQrqQuppQspxADt6w8MM+HBPxKuLtQ==
X-Google-Smtp-Source: ABdhPJzSoWdXfBkndIBZoZOFwrpb7uDQjD1gAUcPFwN57z7F+LfwyMvq3mjZg+CNFRS8Bl4vV/eiaroxEfBg1N23Sko=
X-Received: by 2002:a05:600c:5113:b0:394:800c:4c36 with SMTP id
 o19-20020a05600c511300b00394800c4c36mr8028307wms.93.1652328486531; Wed, 11
 May 2022 21:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220511184408.2751850-1-masahiroy@kernel.org>
In-Reply-To: <20220511184408.2751850-1-masahiroy@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 May 2022 09:37:54 +0530
Message-ID: <CAAhSdy1XvMV02ye-+mZ-DewmmpQz+NZZb8HqRcxhssy=WBmNUA@mail.gmail.com>
Subject: Re: [PATCH] riscv: move errata/ and kvm/ builds to arch/riscv/Kbuild
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_210810_571623_15AF5793 
X-CRM114-Status: GOOD (  14.71  )
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

On Thu, May 12, 2022 at 12:17 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 909548d6c578 ("riscv: add arch/riscv/Kbuild") intended that
> subdirectories in arch/riscv/ would be added in arch/riscv/Kbuild.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

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
>
> --
> 2.32.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
