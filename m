Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD0AAC433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:47:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 638D461A26
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 15:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 638D461A26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dlt4Hn/geL1jZmAtT5jxZrLmCIw62VB4jWImUXZmDqQ=; b=oregIpeZH8jZXv+Jgc+/FX5bz
	6yRhYbhHa83GF11auRpxd0RgqQOCP2rct1a4VafRmG/DbvhEgyWb0tcMbdzZXumusvf+yaMBynsUV
	q5SQgYPv1lb0yFbWke9O8dEw9QS18bH3FzhzpH1wbKTwtBlBpHARNvW2JuffD8b75ubUAFtCoWIJ2
	fW2XOOWZS8h+pPoP+4j3hQLgKZ65ziStARj5qnIGs0++TcJmXP4aJpFnKeNUV/Af4doPepRXtftLY
	MvrwlSXs6Y1bESJ/7zSOOxD1LNBKtCVTCDye8prx68HimUj3/kU7Kca2LV7z4eH5D480+TrlcNWPE
	TLwL/uMKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPogO-003uWj-SY; Fri, 26 Mar 2021 15:47:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPogC-003uVp-N9; Fri, 26 Mar 2021 15:47:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD66A61A26;
 Fri, 26 Mar 2021 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616773639;
 bh=FOq/AGTP4gWQcAqm6gE3CbPMoPZd/s7+r0gDFMG3q6U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AcCDpzU7tp9iwdGG8gDfzEHT/oRIXsIga7wXxu53WqUJhT2ul2T9YDS65RNqPU2n3
 Xvn+RFssUybeWEZgEY2lh1i4UxjZPbwmKsgliPvp0IToMiB2a/WA5KR9z10HdDinOv
 UYM5sw/0IvqfBsKxROncwVaSX/vsAHxPYgALR1dSYHioveObkwXiHIvFx1Yj/tNdZJ
 KMRbv1ObJxkt+zXV5bOiWGyn/1VwvDn/9VCA4p517RmAt9EEHqYSMNig8Oj+y1Zu4e
 B4aIe1rurjyjKfoN2EcYkT1/pA82eHFw94cAgT8CIulbihfa0tOaUKwaviLlzc9Bb9
 p9VnLj0VX7D0A==
Received: by mail-ed1-f49.google.com with SMTP id b16so6839083eds.7;
 Fri, 26 Mar 2021 08:47:18 -0700 (PDT)
X-Gm-Message-State: AOAM530r0LxQod70obWWMN+M3Nl9NtwnlZDI6xdHKNv+ozBg7FNZ0sl5
 HoK4sYoexZb8Ix/GNp1HKv4xJftryQHXGszgdA==
X-Google-Smtp-Source: ABdhPJyGMjMWznP/BbCajkt9nas+eMG/Qmwgar26pPUJYE7aEhO5sSz0Y/IOGFJNx4RiD0k/WjxUTeg0KAhhn6cQx0c=
X-Received: by 2002:a05:6402:c88:: with SMTP id
 cm8mr15784199edb.62.1616773637523; 
 Fri, 26 Mar 2021 08:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7362e4f6a5f5b79e6ad3fd3cec3183a4a283f7fc.1616765870.git.christophe.leroy@csgroup.eu>
From: Rob Herring <robh@kernel.org>
Date: Fri, 26 Mar 2021 09:47:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
Message-ID: <CAL_Jsq+LF-s5K4Jwd5jCHrU8271L5WCiGb0tR7aTUa8ddHF1YQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] arm: Convert to GENERIC_CMDLINE
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Will Deacon <will@kernel.org>, Daniel Walker <danielwa@cisco.com>, 
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>, 
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 devicetree@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 microblaze <monstr@monstr.eu>, 
 "open list:MIPS" <linux-mips@vger.kernel.org>, nios2 <ley.foon.tan@intel.com>, 
 Openrisc <openrisc@lists.librecores.org>, linux-hexagon@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, X86 ML <x86@kernel.org>, 
 linux-xtensa@linux-xtensa.org, SH-Linux <linux-sh@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_154721_039441_E2C9795B 
X-CRM114-Status: GOOD (  11.53  )
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

On Fri, Mar 26, 2021 at 7:44 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> This converts the architecture to GENERIC_CMDLINE.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/arm/Kconfig              | 38 +----------------------------------
>  arch/arm/kernel/atags_parse.c | 15 +++++---------
>  2 files changed, 6 insertions(+), 47 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 5da96f5df48f..67bc75f2da81 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -50,6 +50,7 @@ config ARM
>         select GENERIC_ARCH_TOPOLOGY if ARM_CPU_TOPOLOGY
>         select GENERIC_ATOMIC64 if CPU_V7M || CPU_V6 || !CPU_32v6K || !AEABI
>         select GENERIC_CLOCKEVENTS_BROADCAST if SMP
> +       select GENERIC_CMDLINE if ATAGS

Don't we need this enabled for !ATAGS (i.e. DT boot)?

Can we always enable GENERIC_CMDLINE for OF_EARLY_FLATTREE?

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
