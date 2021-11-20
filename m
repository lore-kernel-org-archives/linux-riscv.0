Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D4DC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvD4iv1pM3fRNMThMqfaAvXff5lw+vEYz3povaHui5k=; b=Etk304867Vxtry
	SLEA1gKKUCYa6C/u0e7fuwEhzH5tXWBkPUeDilr8ix4GP2ZNqK7hXVHaRXus3kc4foOEZ6kB7QzH5
	qTiFEJXuik2uePRQI6RbV40CwL3a0c2FWM+XPJawGbqQTnGUIJsOo0WRAcY6HS3xsD04uRsgErLqZ
	+uemr70EnhlGHaMBvMDoRPerqJ84jpEYBmGeKp8GnTb926vcDW8ei3fgL5qyLB2axOFnCqV3rvxMP
	UjxVhjEAU9XNprOZU+yQWiLR/boEQ8CLGqD0tYCtV0NUBPqRnkGSNGPcofoKYRqSxE2u1CYG7Anfh
	ZHH+AhjTwDKSuSsSdgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHa3-00C0gf-Hl; Sat, 20 Nov 2021 04:02:23 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHa0-00C0fm-MG
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:02:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id s13so21516568wrb.3
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kXDYFUbtK5blbIHxgSBnYcG4kvaxmY3jttH/eZ1V35Q=;
 b=pl686RiDOYZZ+UFgC0xAnclHtqmLOetZLriBRBz82fthdUGAiDkPE9tnMsI8+qcnwU
 SQvAg8cc/OvaJ8YBoBHqSO7CN583qlSxR9Y/nW86TH/dTWS6ZDBwOqa3/VS7wwINqNlh
 eEY9Ffsts3NqjjvK4u13TES4mgN99dm1Vn8oMqz1hAhzvtRIMOuzbWVvklyKtKYYoeUh
 /sPG33PHKIij1zZixQFkMmoasd0y/fwXqVTrkQ6rwkfRENGkSGpt3TMbnpa7puX98UXp
 9+CGhogcdQxWl5gVDSez/7Y1m4rG/aFb8yXfc2/MawvbglkNcna2bkjUyYiBGY1O6x1h
 hggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kXDYFUbtK5blbIHxgSBnYcG4kvaxmY3jttH/eZ1V35Q=;
 b=MgVCde3mADlR2TB5Wbp/FoPKQfdhankf9RUT2+yxmtzLkfGjha+9bWqyEjrk5qPs/H
 qkOWzxzbiDRdUJPEZEElcjffINWMjHsezNWoSOAOtdW28+WaZX4/hrFpyEjyFxF/Hog6
 Kt2i80XR38zk/2Ma+zAERaDLYbpgCwN90ZQj+PVm/RitQMrFUSeeXom5Et7QpGBPNgN4
 n6O9WL7Y7aGvlwx5OsoNmTadr0V+paPSiluwkewNEKXbCbX3JHjDvQduoBklmA0rDwVW
 uDXORXdA6VxWqlGUIUp8rbuhiR41bhZuo/FX5f8spAYgWO7Mr+uiTGJmEeNBzokLvqa/
 kYtA==
X-Gm-Message-State: AOAM532zCDitD3+0eEJIrEPLiY2Yw9kGHxfzMwYbuEZ8JfhSOyEIXSK9
 hCW2UdubLh8JkNQHYXZpd4jPu3lHbpcCZxTVmdGJcw==
X-Google-Smtp-Source: ABdhPJy4Bdo/2RoEuOQcWEe6rClCXaTStSZ9m9VeTdDUQ4H3Nvfcy7pqKZWoFaS5TuTHzrMkQ9+Ec5lRp6ph5BpMTS4=
X-Received: by 2002:a5d:4846:: with SMTP id n6mr13651427wrs.249.1637380939141; 
 Fri, 19 Nov 2021 20:02:19 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-9-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-9-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:32:07 +0530
Message-ID: <CAAhSdy3vdiOoVJ=M7JYQ-oFZukxdp9rc0_4F7B1cSXxrXYofTg@mail.gmail.com>
Subject: Re: [PATCH 08/12] RISC-V: defconfigs: Sort CONFIG_SURFACE_PLATFORMS
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_200220_748218_B84B0DF7 
X-CRM114-Status: GOOD (  13.51  )
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

On Fri, Nov 19, 2021 at 10:15 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> This should have no functional change, it just sorts
> CONFIG_SURFACE_PLATFORMS the same way savedefconfig does.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
> index b16a2a12c82a..89ab76349ea8 100644
> --- a/arch/riscv/configs/nommu_k210_defconfig
> +++ b/arch/riscv/configs/nommu_k210_defconfig
> @@ -75,7 +75,6 @@ CONFIG_LEDS_GPIO=y
>  CONFIG_LEDS_USER=y
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
> -# CONFIG_SURFACE_PLATFORMS is not set
>  # CONFIG_FILE_LOCKING is not set
>  # CONFIG_DNOTIFY is not set
>  # CONFIG_INOTIFY_USER is not set
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 61f887f65419..690460f79925 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -72,7 +72,6 @@ CONFIG_LEDS_GPIO=y
>  CONFIG_LEDS_USER=y
>  # CONFIG_VIRTIO_MENU is not set
>  # CONFIG_VHOST_MENU is not set
> -# CONFIG_SURFACE_PLATFORMS is not set
>  CONFIG_EXT2_FS=y
>  # CONFIG_FILE_LOCKING is not set
>  # CONFIG_DNOTIFY is not set
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
