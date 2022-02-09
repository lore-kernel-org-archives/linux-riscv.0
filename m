Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A682C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 04:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1e7Me+6AyDBo/WOO9MX2nZOzGttaYp5gKRjL3fFuFIY=; b=YW/DHwHEsbD83y
	wj4UCmhS548Um5MVljsWDgbmBLhvK4gnoFIwXCnppe4D30hMnDYPBY+HXB+ytmruYq1SIfSs8ojaF
	w57LH1Gm8jqh/O+OEB8c7drjYOFnFsa6pt5GI771lzTzqAfsmI3Wh0OfNCGp36cLu24ON2Q14zWA7
	iqbFF0Zq0mgy7YnMgHI8Nn1nRkwtY6eFGEBKtLFmL2cd5MDFjEGMVCPiBDYCrJxLQI0c/rPKza8mU
	rUopPTTAetbELrpFe7H73PQDJaF7bRH2q0gUeA/Q1RV1u8zX8F62Pf7TL2yKhLfG5G4Y3XyGezzno
	RHrz5lgDPhY7Hhojg3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHeBd-00GB3L-P1; Wed, 09 Feb 2022 04:02:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHeBa-00GB2s-T5
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 04:02:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id r131so631201wma.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Feb 2022 20:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Wpy8NcUW7r1t9gIGQmOAOeJtU1QzBLDbREH5B+mHRQ=;
 b=sMzCTM28O0czSttYjvbuC5//lPNV3PRc+46M9yOPwDChmJs1/24SuGhBRxvnJFf/rG
 ts43DlYdxrCbsVOeJksoZkyDw/QZJy8Z+34HlJvkhuB3db2jI1qogSRgOZywRswld2uc
 u/euTww/FqQ3PSZxwitNH61snDB8uoMgJorPCV8kKb85GcZ+9NF9aXK3NWL61XdmWBUa
 erJs1I21fDT6YYEPQ7rY/XXePM0bJFown7yrsEeLqj9VGlPjia7K6QdJJ8djfUmnXS0U
 Y4wXtLQEeWiY3y+dj0sVL0EovAoD0TUMZA7k4d4REtv5VD4XvxsnR+PW+RN4juCoj3uM
 dZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Wpy8NcUW7r1t9gIGQmOAOeJtU1QzBLDbREH5B+mHRQ=;
 b=pjOQqX+iinpuPhyo5EiO34da6Jzag9NLDkUWoSoBxoKYNOLB+4QKkHi/r5PhXVBNPv
 BmgYrMYUhqZ5gPw7Efwti9bDUG33RfIOujPN1Km6M488gnspfGWafuXgunOHa695HNLe
 DFaN3se9JPHdz/NntujBCMu3bZrKfPm24i6skIpwlCMMl9XnaS6ozMeQYoBZyKDWZ/MR
 990gRpxUiE9IxXdI+Gyj9RBiV3ZnIEiboKbY3YJKGU0Fslhd/i585wqCJXMMWNKfrSdS
 rxtWpgIxbI+C7Xtk4LBppU+a1qxDuPv8rj7Laen6YEdN9wiFRK8K1Ce0PQT7gJgx8CJe
 cUaA==
X-Gm-Message-State: AOAM530RcAysV2DqLZP5PJM1yQFoBNvBUxYQtux9afDNSAu0HGmJ8RqK
 dYMGol3PmsLNMaU568gxwodDlg1zR/3c0MDSahCZXg==
X-Google-Smtp-Source: ABdhPJzdFWxQIQOIprT1WhB+jk6J1VJoG+E36PrvHY8njcY28+x2aUddr638ZKbr22AEzypPi19xR0DnJQtc0sqbiCY=
X-Received: by 2002:a05:600c:2211:: with SMTP id
 z17mr840742wml.59.1644379346235; 
 Tue, 08 Feb 2022 20:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20220209035623.243675-1-damien.lemoal@opensource.wdc.com>
In-Reply-To: <20220209035623.243675-1-damien.lemoal@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 9 Feb 2022 09:32:14 +0530
Message-ID: <CAAhSdy1LgV-rxXmx+=vEF75w08jqo9A2oDG7B+riqiOdRnNKqg@mail.gmail.com>
Subject: Re: [PATCH] riscv: fix nommu_k210_sdcard_defconfig
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_200231_028289_10B1A754 
X-CRM114-Status: GOOD (  16.28  )
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

On Wed, Feb 9, 2022 at 9:26 AM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> Instead of an arbitrary delay, use the "rootwait" kernel option to wait
> for the mmc root device to be ready.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> index 2a82a3b2992b..af64b95e88cc 100644
> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
> @@ -23,7 +23,7 @@ CONFIG_SLOB=y
>  CONFIG_SOC_CANAAN=y
>  CONFIG_SMP=y
>  CONFIG_NR_CPUS=2
> -CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
> +CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
>  CONFIG_CMDLINE_FORCE=y
>  # CONFIG_SECCOMP is not set
>  # CONFIG_STACKPROTECTOR is not set
> --
> 2.34.1
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
