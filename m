Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A905C3DA79
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EzAAwbvjNXsswCA/rEHGRf6l/zfh8j5yrjVRoztdw34=; b=0Qnh2m0HehSQ0Rx3eL30FzCfa0
	KXb0Slwd0CujWHg+VCQaT3oQlgzh7JpUvkqnMRPALWqvAQF/NoJrNjWd9RN55FBBznsgDEMCHXhZk
	+2n9CP4FvY0/RjKi2Jvy/J6lJy7UI3wzYMX9YSzMQrSiGp/fFTWgoXNN2nJOhtXJZUSyAmuT3IMVx
	pbarOQwzDaA1oIT0M6ZIxotyC93oB6Uh9RR2j8Poz7RR9W5Q8wTLK75KOMvbSmiOG3bRR3YNDdjRm
	AkNlJN8E/VXrZYSmjU4XTUtFAahYQb4Sm4RmyujHphD5gukUstkmnM33Ueb9Jp4ab9hm3yPRuJj8z
	f9eNr1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfw-00HQ6m-E3; Thu, 29 Dec 2022 16:22:36 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAvfp-00HPyA-5u
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 16:22:32 +0000
Received: by mail-pj1-x1034.google.com with SMTP id fy4so19697416pjb.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 08:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2OLkB5mMsHKDwbR+cM0W/wmV6jqAoejRkqxG5WHPUJQ=;
        b=yQiDJFyvnV+prccj0GMjiX10frFzC9Mfv04bocJ0Bh8oX7y+0k1z6Z0xnkfyFjqKTN
         tecrdMMOKsT+GF9HeX5ucR840RKiPVlcQdFksm2EpP7XAJ9W8nteo/euV7HUtU/7XVos
         1gbq8i/EFYMDbJSxlFINjqZCWh0Or2riyQhU8vz0xkkzkh6Xzo+J8F5WBgOl4kH4tth7
         8xSe/BGB6hbIfuiW/binFvc8fGWyKCJQHaCCfH+RS8RzQ2jbZpqI50KJAWYN2ASGpeVk
         C4Ws88CuuQy79JJarYmebhTN4nklASG/JuK2M5upTdnlTHNIhG+lCB/FISII85YP2K5G
         kyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2OLkB5mMsHKDwbR+cM0W/wmV6jqAoejRkqxG5WHPUJQ=;
        b=4d+w3O7Sw7JMQDAolhrlOEY7rmOAJe6xiijxkTWr9hQRZOb4MSGeb9ki8XIFhf+V6o
         WHrMli+cSn5uvyjmBifLEAJmLi03mJ2gcBdH6vShDslK2BX//402OpBQ3NnU1mgGy6NZ
         gid82IdYne9MZaW6/bgpvQXZkCn2Oen8nDyzY5IidhveLr7aQhd9Qe+KeV54Cgwk2iD/
         NAP8oWxHURTdALP/Ismisurod3ucku5ZCV6uG6mF1rwwn9MYpws08eulZCorz8XVnl1i
         uI0Lcs0fiK3ZxouKIgSmfoTXR1AHHZo1H7oGgcRnT0UHP7xctdBIv2jEwwDyp1o5nUw/
         3R+w==
X-Gm-Message-State: AFqh2kpnYNW+MU4AcMmwIUGRIyhVCWMAeJO/HBefr12j3+q8GXVojTzO
	nIHbJOO5kR5lyiBdivBL1D/fEpV6Ec2abWzR
X-Google-Smtp-Source: AMrXdXvbOxeambP1FNrtoSqupKLHR5ZUV5b4qXQ2GRZNGFk8nmQRfBqHImgd60VPFJ/uowpsCdY3Pg==
X-Received: by 2002:a17:90a:d511:b0:225:dce3:8b9e with SMTP id t17-20020a17090ad51100b00225dce38b9emr19076607pju.5.1672330942227;
        Thu, 29 Dec 2022 08:22:22 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id q60-20020a17090a4fc200b00225d963fbc2sm8493338pjh.34.2022.12.29.08.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:21 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:21 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:49:50 PST (-0800)
Subject: Re: [PATCH v3 0/3] serial: Add RISC-V support to the earlycon semihost driver
In-Reply-To: <20221209150437.795918-1-bmeng@tinylab.org>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-serial@vger.kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
  Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  linux@armlinux.org.uk, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bmeng@tinylab.org
Message-ID: <mhng-93a78d3a-6372-4972-94fe-31607664bb67@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_082229_389653_6840F0E4 
X-CRM114-Status: GOOD (  16.55  )
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

On Fri, 09 Dec 2022 07:04:34 PST (-0800), bmeng@tinylab.org wrote:
>
> RISC-V semihosting spec [1] is built on top of the existing Arm one;
> we can add RISC-V earlycon semihost driver easily.
>
> This series refactors the existing driver a little bit, to move smh_putc()
> variants in respective arch's semihost.h, then we can implement RISC-V's
> version in the riscv arch directory.
>
> Link: https://github.com/riscv/riscv-semihosting-spec/blob/main/riscv-semihosting-spec.adoc [1]
>
> Changes in v3:
> - add #ifdef in the header to prevent from multiple inclusion
> - add forward-declare struct uart_port
> - add a Link tag in the commit message
>
> Changes in v2:
> - new patch: "serial: earlycon-arm-semihost: Move smh_putc() variants in respective arch's semihost.h"
> - Move the RISC-V implementation to semihost.h
>
> Bin Meng (3):
>   serial: earlycon-arm-semihost: Move smh_putc() variants in respective
>     arch's semihost.h
>   riscv: Implement semihost.h for earlycon semihost driver
>   serial: Rename earlycon semihost driver
>
>  arch/arm/include/asm/semihost.h               | 30 +++++++++++++++++++
>  arch/arm64/include/asm/semihost.h             | 24 +++++++++++++++
>  arch/riscv/include/asm/semihost.h             | 26 ++++++++++++++++
>  drivers/tty/serial/Kconfig                    | 14 ++++-----
>  drivers/tty/serial/Makefile                   |  2 +-
>  ...con-arm-semihost.c => earlycon-semihost.c} | 25 +---------------
>  6 files changed, 89 insertions(+), 32 deletions(-)
>  create mode 100644 arch/arm/include/asm/semihost.h
>  create mode 100644 arch/arm64/include/asm/semihost.h
>  create mode 100644 arch/riscv/include/asm/semihost.h
>  rename drivers/tty/serial/{earlycon-arm-semihost.c => earlycon-semihost.c} (57%)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
