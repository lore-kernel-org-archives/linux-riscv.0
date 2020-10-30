Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C896C5517A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 09:08:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD7BE20825
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 09:08:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WWgnD1Ls";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Pbc9yb6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD7BE20825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+hOK7q086bIIpf7fXu7LMmGWpVr13Axn8Ec7sa0IQo=; b=WWgnD1Lsq9HlhvPLVqWMRqJau
	aeCNYQTt4RqjE6Zcpg/2J3+liOVMZue73fKRSjIKoHl9IczZDo/Zaj19zUEAz/M/t5iQMCEA77Awn
	95ZrD/iGtqfKdg7vSHV6v5SJIxDgyGA0D+TVTiMuKRn4RlMugUOvFqVnEZp8U5lErMJwCJGoSfV7N
	VJb+/rZJuW+b5Ej8/AdMQJkaV6iTydbP+jE4tXIYtRwbUwebPd2gDoY68ZUdgZG1pi3FbyHxr2R7l
	zXDALxLx1wNIwnbhWwk6H9Zj7cgZy1mWQevaulXuErfZkQ5cTuhMattFDo22ubbrdGEDGpM6xdHyH
	tn/UfCS4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYQOd-0003lj-Qc; Fri, 30 Oct 2020 09:08:31 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQOb-0003kk-J2
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 09:08:30 +0000
Received: by mail-lj1-x244.google.com with SMTP id d24so6044705ljg.10
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 02:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c3nqhr01eQvSJI6e+N1t85n2JUuDRDQvN6DV/F+qtOg=;
 b=Pbc9yb6+BtXWo1L5tuGBtUvLjbqwm8vybLhFatacNFqibwrwzRpTS1ds3Zvak0xcKM
 V8P8DuKXdbc+a6Ys+3QbJ5f5quGNRRmM0WyphpMhiJGoqAPyXW04d2UyiYyatvzvLNrh
 4gKHIvkWMvdV3C++5KUU95Ml4r3h/PIVS7ve1IglLFYhMmtShvv8EyNSBp9/5IY5OsPr
 qTejUAekNMJwYtQesHJ7J6nFxSnAY0XDT9GIRrSpg3W4+sPzais1l89GOmnJJPjxqyQ2
 AHcyCbdLkBHEYCRJH0aXliCp/mXw00OYwaPBEML+r4pIIweZ6TMnfi6jLYoOslg8IipD
 MWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c3nqhr01eQvSJI6e+N1t85n2JUuDRDQvN6DV/F+qtOg=;
 b=ilztb7168TCcRq4kKFraAfn5nvYvJmBsfbZZjaIlB9LV9iFsS6Tx2mVUdXvYKYZQQC
 TC4KqIRy8o19Nqa/83yPhoor0/ulcsicq+hwwnzll8v1iMYlwPcIn+C1ASt9jEFMkalr
 c8XtPMWxXWZnjVR5y3Pltwg8eJRMmhU4sqnOHIXLW0FVs/nrYKAHz3mSQ9AihDgCyzFb
 DoqjyWJodLzOeRFKSMfmhqD7e9xTNuS2enCeuX3PsYytYU/hQhF90cgb7pmdNEINBVqc
 xCMpdg8qSBl4q2U5L6Gx8coAd67If1Ja0Uvu/HBPW0GdLLj9ecrwx4SePxt70APdAm11
 /tlw==
X-Gm-Message-State: AOAM532hQZV1cA720u3qpWfA95uzoTNAuK2cMqWZ0LjbQqhOfZ/YdvNZ
 +IFZj93pwdXSJI/5oPr5OwXfSaRfoMje9lr0BN7syQ==
X-Google-Smtp-Source: ABdhPJxkLrO+rJWRgS6d7zV8/ubv9r6UYekRS16NxBfxGeFBlNnomGPzrvg/AntYqT8EDdFMBhFZ1RH0FCIF+gOiV0k=
X-Received: by 2002:a2e:819a:: with SMTP id e26mr623157ljg.469.1604048907900; 
 Fri, 30 Oct 2020 02:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201028232759.1928479-1-atish.patra@wdc.com>
 <20201028232759.1928479-2-atish.patra@wdc.com>
In-Reply-To: <20201028232759.1928479-2-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Oct 2020 14:38:16 +0530
Message-ID: <CAAhSdy3bf6gTrb5qA8aHm+KzrZQTKqSdBkGNpN1k_+_Vn3=uuQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] RISC-V: Add Microchip PolarFire SoC kconfig option
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_050829_695985_F1053C7B 
X-CRM114-Status: GOOD (  14.68  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Padmarao Begari <padmarao.begari@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 4:58 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Add Microchip PolarFire kconfig option which selects SoC specific
> and common drivers that is required for this SoC.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/Kconfig.socs | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 8a55f6156661..74d07250ecc5 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -22,6 +22,13 @@ config SOC_VIRT
>         help
>           This enables support for QEMU Virt Machine.
>
> +config SOC_MICROCHIP_POLARFIRE
> +       bool "Microchip PolarFire SoCs"
> +       select MCHP_CLK_PFSOC
> +       select SIFIVE_PLIC
> +       help
> +         This enables support for Microchip PolarFire SoC platforms.
> +
>  config SOC_KENDRYTE
>         bool "Kendryte K210 SoC"
>         depends on !MMU
> --
> 2.25.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
