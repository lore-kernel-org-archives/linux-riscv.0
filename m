Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCE9C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VBrO5PaKWAGjkOTEkMd0GqCY8qnRg16v4pJxx31B5po=; b=2aXIJLQEAOuuH8
	TMwXtW5OoijLNjfT1x0YkKSbyg0s8boaYUIQLqBBQc2e6ajTNc9EhNlSFT7ne/ISetlijrKT3UsQM
	G0deXCuSldvMjChO4XDEcfk9duF1DD+b61HOPuYhx03ti20ctPZRb6NcnY7ZASjbMEny6amUZ3TXt
	S3NULI9O8vPhNrq91xrRy61lDLteZe5gJIKaI+Lh8nfvf0mNr9SyJLIlv1fv0iX2FTdg4tIpBGGD2
	nkjJG2aWQq9Sa5FYLfWzZYYao0CzM/DTGnlwFoNb/c0xwPPBaRvYCbRbyljk7JHmYazoniSBmpBmW
	AeanFeKA146x3+lVjVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHbu-00C0va-J4; Sat, 20 Nov 2021 04:04:18 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHbs-00C0vC-8o
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:04:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d5so21539734wrc.1
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wiAofShoflFRKsOulYdKPfpTNOMSTtibqGr9qj/HKf8=;
 b=qYseHheU1ajfn0MXG0G6P7Eim3CJLt/vMnbfK4soLkBEIsyYSnF09fVZFFO3h14RVl
 SbHhA5PbWdIEAu4JB0eoKFd44F+L65+9m2nzmrgkcQ9kBJVeY0XjHM65h+t2Zz03aiWD
 8X114ZVR83Q/Az0VbLRd+k/scChulSG5smRHi51ekJAloZyDWe1ZjrPwkK6SOIBeTXOU
 EVbItPI7kCKD7N5ZBIBTEJPvppbvsx4m9G/AX+f++2o9MFVy3mY9SV8RDGW6jVeCGi0w
 iEvoP9yLU6quE8cXZ4SVghhSY+5PSLnBa0B3Dcd0tj29JuYSCHMYGStQ1iENYugVJjIQ
 nPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wiAofShoflFRKsOulYdKPfpTNOMSTtibqGr9qj/HKf8=;
 b=DQMJqhbucpWdgdMLvNltsv/FV2C1JtpWTTteNMUIgn33fLH2b7IbI2cAtG4dl3CPVf
 h2/0+oYL4d7IK27/mVINXpDPtfoIQZ0mQISRrjTBkw3Cjw7rb86sCwzExh2Dcl9Fo9g/
 K+VJJ0q/IgJhdJ2zBB8SP0aFXZGiDxzdF4fw2Ifebco88TRqhcRDw13AsGV7YrA8I65x
 M7mLEpnYFhxR04QwZvRhicaqAWEoANyouLZldZy9zcBTGBgI1yR+Da1Rri1gNQHGFCeK
 dY2/l1zA8ve6InvINyJUsaDFX09oXMRSQhPOemQT1Xh6s6e9m0tOxkQkYGhDFtJhdccV
 QVqA==
X-Gm-Message-State: AOAM532Zy2ykUlAyCLrHp5HA4EXt0qR+lfIid/Vxd1YFZdymzAnAQWRs
 QW6e1LAS8at+Capaqos3Da7dw958hQOZAMFJFzC1SQ==
X-Google-Smtp-Source: ABdhPJyFfJrkGZNjGeUeF/l6fgipWtxjoJgXY6uHnnO2N/X1ozSiBmva0AE0wluGiGz+TA2EjxUnIAjANwKYCuRyfjQ=
X-Received: by 2002:a05:6000:1a45:: with SMTP id
 t5mr14114433wry.306.1637381053913; 
 Fri, 19 Nov 2021 20:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-10-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-10-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:34:02 +0530
Message-ID: <CAAhSdy2ssiMAVhPvhTSmR2LtD_qBXENV_of0ytjsrmt7gV9Lxg@mail.gmail.com>
Subject: Re: [PATCH 09/12] RISC-V: defconfigs: Sort CONFIG_BLK_DEV_BSG
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
X-CRM114-CacheID: sfid-20211119_200416_350771_90A6E5B1 
X-CRM114-Status: GOOD (  13.20  )
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
> This should have no functional change, it just sorts CONFIG_BLK_DEV_BSG
> the same way savedefconfig does.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>  arch/riscv/configs/nommu_virt_defconfig        | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 690460f79925..84b87f8bfc8f 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -30,7 +30,6 @@ CONFIG_CMDLINE_FORCE=y
>  # CONFIG_SECCOMP is not set
>  # CONFIG_STACKPROTECTOR is not set
>  # CONFIG_GCC_PLUGINS is not set
> -# CONFIG_BLK_DEV_BSG is not set
>  # CONFIG_MQ_IOSCHED_DEADLINE is not set
>  # CONFIG_MQ_IOSCHED_KYBER is not set
>  CONFIG_BINFMT_FLAT=y
> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
> index e046a0babde4..385cca741b01 100644
> --- a/arch/riscv/configs/nommu_virt_defconfig
> +++ b/arch/riscv/configs/nommu_virt_defconfig
> @@ -32,7 +32,6 @@ CONFIG_SMP=y
>  CONFIG_CMDLINE="root=/dev/vda rw earlycon=uart8250,mmio,0x10000000,115200n8 console=ttyS0"
>  CONFIG_CMDLINE_FORCE=y
>  CONFIG_JUMP_LABEL=y
> -# CONFIG_BLK_DEV_BSG is not set
>  CONFIG_PARTITION_ADVANCED=y
>  # CONFIG_MSDOS_PARTITION is not set
>  # CONFIG_EFI_PARTITION is not set
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
