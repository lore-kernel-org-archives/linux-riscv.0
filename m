Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA7CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 12:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gcb2YWcEjEXn5cKpW70Vk86Z+LFtMlW0je15Mqwg+7E=; b=tSkFKc5MAjZgTV
	dTMM/YSHfnCg7nDEHsOjtIUX7o1itGLWg1MviXrlqGTMhnXS1CZH3e5zbJ9dspavnRzSmq3KX9A0E
	HtYEq+C58iaaeW6ZMpvI7KTOG/TVFR5RssSsu0b0WfRT5/T79+2il4dLJC2kFMPbp2ySfI0qK7hkf
	BwN5wcdqJ/V6onKzw1hvNYJQKBCMAs/ZqKN6vBLkTdoy5WuviSS0m1Q1/ka27b9vRsPwXqJHG1gLi
	wjFjoi1kKHN7e7sPfHBz7vQV5eu9YIFyfDd3B2bxSRQvU1Dafuw/jer0/Km1RQO5STAOj7AaMOI0A
	H5PtvqFbK42g/C5kkSBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntTLB-007vPr-5W; Tue, 24 May 2022 12:08:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntTL8-007vOW-Lw
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 12:08:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so1266265wmr.1
 for <linux-riscv@lists.infradead.org>; Tue, 24 May 2022 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B1kHWNn2FlYrScuJpDzEvYfxEoq+6pgVlJajpmZJO8Q=;
 b=MitxO5noWfkkjrDtLTJi13ymJxmHezjD+E5DuEVPaVncx1oma+enD3jH1aVLkhwzkJ
 WdhemjXMo9QnDd93aMDo5dczJ+gAgCXTKvK9tITNSJlL3EXbOBNrPilYk9cilRodPtN2
 exoqg6Mte3n0BWMUbvjN3CpXMDiyJeu+0LwBs3jA3AWr0iTJ9quRBpYLVwp3Qy3MVfE5
 891W6liT9KNXxCx/9BOVZ+sS9plpdPcOGqglhZKvUIVP4vir7ldZ/lnawF9GayTEebzX
 Fv1tgUQE3asHoYQ2lcPQK7Xs76PjxyOSreGfpXpZGeFLNpmt2PE8l432dCQSkWRSelLV
 ppnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B1kHWNn2FlYrScuJpDzEvYfxEoq+6pgVlJajpmZJO8Q=;
 b=Tlo3nHjIdMtG6EuiqHBmt/AQAg+mMpXeyiaLDYQ7RKXWX1Pq/5QGDoDpNnnl1OrIwU
 KTZgq1cKu8q2H/2y60jgreppOyWPGoWNeFOf9qA5eiRy9qhbk0KCsMA2+R1/kSmxQ4CG
 BS5CnwPryY3lW9+5wJodJh2KVHVKHZ1j9lerxAGadPW6PQV//aGv4mSHbEfN5GRKUOd9
 XGIad9Ye/eNb39IyDL77xueqAyomqZPNblBN//jzgA6IYOf7RxJ+CnvguuBw86jOPirq
 aYYtXTo3KPoCG+x9s66lhwcpFUKzCCuPofeWN2fHT5yuda9BOdU0j0xk0Lr9MJB8ov9D
 Jq7A==
X-Gm-Message-State: AOAM5328N1tDwa3qmu7px0o0VNxIrfb7RFW2Etc6AuqQgTVo47kat99F
 LW58/6QVVKAtC8uDX7oIlEeV8yiM00HV2kQotNxZ/w==
X-Google-Smtp-Source: ABdhPJzCjSjJu5FZr9HKDJXj80WuWPTLIslId0a/UEE5mngDqDBNme5tGWlgfcoenQV71EZpI9dNoJlf1rYo3x49IaQ=
X-Received: by 2002:a05:600c:1d28:b0:397:65ab:4b3e with SMTP id
 l40-20020a05600c1d2800b0039765ab4b3emr38103wms.137.1653394119857; Tue, 24 May
 2022 05:08:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220420112408.155561-1-apatel@ventanamicro.com>
In-Reply-To: <20220420112408.155561-1-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 May 2022 17:38:28 +0530
Message-ID: <CAAhSdy15v3-_2bbJuCVm5zp1nNHHLjtypAESOoPkcChjgFsssw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Increase range and default value of NR_CPUS
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Arnd Bergmann <arnd@arndb.de>, 
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_050842_758833_90517028 
X-CRM114-Status: GOOD (  19.98  )
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

Hi Palmer,

On Wed, Apr 20, 2022 at 4:54 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, the range and default value of NR_CPUS is too restrictive
> for high-end RISC-V systems with large number of HARTs. The latest
> QEMU virt machine supports upto 512 CPUs so the current NR_CPUS is
> restrictive for QEMU as well. Other major architectures (such as
> ARM64, x86_64, MIPS, etc) have a much higher range and default
> value of NR_CPUS.
>
> This patch increases NR_CPUS range to 2-512 and default value to
> XLEN (i.e. 32 for RV32 and 64 for RV64).
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Can this PATCH be considered for 5.19 ?

Thanks,
Anup

> ---
> Changes since v2:
>  - Rebased on Linux-5.18-rc3
>  - Use a different range when SBI v0.1 is enabled
> Changes since v1:
>  - Updated NR_CPUS range to 2-512 which reflects maximum number of
>    CPUs supported by QEMU virt machine.
> ---
>  arch/riscv/Kconfig | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 00fd9c548f26..1823f281069f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -275,10 +275,13 @@ config SMP
>           If you don't know what to do here, say N.
>
>  config NR_CPUS
> -       int "Maximum number of CPUs (2-32)"
> -       range 2 32
> +       int "Maximum number of CPUs (2-512)"
>         depends on SMP
> -       default "8"
> +       range 2 512 if !SBI_V01
> +       range 2 32 if SBI_V01 && 32BIT
> +       range 2 64 if SBI_V01 && 64BIT
> +       default "32" if 32BIT
> +       default "64" if 64BIT
>
>  config HOTPLUG_CPU
>         bool "Support for hot-pluggable CPUs"
> --
> 2.25.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
