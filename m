Return-Path: <SRS0=N2Fr=ZY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F94C432C0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2019 23:33:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62405206E1
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2019 23:33:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pNfUC17h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="a7pSC3sy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62405206E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:In-Reply-To:Subject:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=7TAZdObr3Wsaq6AqNCQ3ocKAwtP5AdKLiKZrWMX2Qt4=; b=pNfUC17hwPg0QzteIAN70xsxu
	hL4xjppHUDTma7QJxnlljsyQPuZcbBU9XiI0URZRGezW6EUsJcZAoah4f2RMQEJBv8a0cN58DVNzD
	c1BZ9QAFMnaAOQU7bqA5cilmux6gOy97s6kL5EUrJV6uU8CT7pFAxERlBs8bcm06xsoTKkHxCqmvD
	OtUQ2HbmEW7pCfwWNRZKIH0ZdNM7yFGx7ucie0AfgPb6YKClefuMCXuzuLL7xT7syQzUgjXmymd3e
	54SQbr1Gt5nmtNkd1sT2A21tEHV6QvNu3ie2weQwzS5tP0iNg+FExcvwfIcniul9eGA8XFqRqUnvR
	xmCOakrqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibvBf-00041I-CP; Mon, 02 Dec 2019 23:33:03 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibvBY-0003qh-Al
 for linux-riscv@lists.infradead.org; Mon, 02 Dec 2019 23:32:57 +0000
Received: by mail-pf1-x444.google.com with SMTP id y206so671803pfb.0
 for <linux-riscv@lists.infradead.org>; Mon, 02 Dec 2019 15:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:subject:in-reply-to:cc:to:message-id:mime-version
 :content-transfer-encoding;
 bh=9v4dAOFWeUoulcUWR2FPbEilDOjTg0ynLEW3tZkwRN0=;
 b=a7pSC3syJXJ/RzJ6cFp/GYto5jHycfrj8u1u8lC8a2c3lRWcXzc/QGsA82Guq3sXiR
 CDBqqCdc7lWYT05yWdZXwT5bdktUuATDSQZh/jUMgHzioXWa5wEi8U+9wLMGGBoBQqw2
 wBHbd7jcbJ27qOYKhb0NXTTzqAHc5RkYLNss8J/YwWWsuZ+ZjdpU0qUbDvpyxjsX2TTA
 TozvZASd16ZIGAzt7VrBP38+PHaSpC4aKre4cehhYbIJVkK2wUPPpROE7s13YIs6ee2Z
 84werYyTJ4AneJirfQwTqHVKQ82Ix/Bj/ZPs6wNMdn9HAi3to5IizNAEusVUPlGZKSKv
 xczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:in-reply-to:cc:to:message-id
 :mime-version:content-transfer-encoding;
 bh=9v4dAOFWeUoulcUWR2FPbEilDOjTg0ynLEW3tZkwRN0=;
 b=GcVpQnh5I68+YObZ1rfTYP576Rz67bnB03cjyaCJlVXtzXg9w8nYV6dChfm4RxWpCR
 CUKaId+pvusB/o/Euzja5WVjb0SftVEeRhsK6gPleul/no5rDfg/CrC5hZsy9/4tfnQj
 qw03XeMAZvQe86woRuY3I1CGNklzkqyo6UDBZZE9YrlrTWUjJ5pZeOue1ek2kBhdFKOs
 JTRaheGrlTbZpl83Ex6nN0PCAUwmaz/YiyN5GlYL8lKTVPUxsH28ycYRDwnKK1fyLFcl
 FMphHGUEPwoXUrmInk0XsAvL7aZ6wqdCVkpNGv6Qx4A+C7d4l7FmCbn4XiOrEsP4JW84
 7aig==
X-Gm-Message-State: APjAAAUQlJXFLS1D3BKSAJ/fmW7+uznJEjoIj0OGnx8nUud50gcnZOSK
 YGbwQnyN37720OoG8zuLaodrhg==
X-Google-Smtp-Source: APXvYqzsJlkbx6bHlCnEaOUxEXBTCoTlfxjxE47Wgg1nbutvA7Rhpy0/MWfBFr4TYzQFuyYc/+hSQg==
X-Received: by 2002:a62:447:: with SMTP id 68mr1399108pfe.70.1575329575638;
 Mon, 02 Dec 2019 15:32:55 -0800 (PST)
Received: from localhost ([2620:15c:211:200:12cb:e51e:cbf0:6e3f])
 by smtp.gmail.com with ESMTPSA id 16sm665895pgm.86.2019.12.02.15.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 15:32:54 -0800 (PST)
Date: Mon, 02 Dec 2019 15:32:54 -0800 (PST)
X-Google-Original-Date: Mon, 02 Dec 2019 15:32:42 PST (-0800)
From: Palmer Dabbelt <palmerdabbelt@google.com>
X-Google-Original-From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH 0/4] QEMU Virt Machine Kconfig option
In-Reply-To: <20191125132147.97111-1-anup.patel@wdc.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-2aaba21d-2b4a-45aa-9c76-809cb5b61e6c@palmerdabbelt.mtv.corp.google.com>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_153256_379207_546D5CAE 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: aou@eecs.berkeley.edu, anup@brainfault.org, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 25 Nov 2019 05:22:13 PST (-0800), Anup Patel wrote:
> This patch series primarily adds QEMU Virt machine kconfig opiton and
> does related RV32/RV64 defconfig updates.
>
> This series can be found in riscv_soc_virt_v1 branch at:
> https//github.com/avpatel/linux.git
>
> Anup Patel (4):
>   RISC-V: Add kconfig option for QEMU virt machine
>   RISC-V: Enable QEMU virt machine support in defconfigs
>   RISC-V: Select SYSCON Reboot and Poweroff for QEMU virt machine
>   RISC-V: Select Goldfish RTC driver for QEMU virt machine
>
>  arch/riscv/Kconfig.socs           | 24 ++++++++++++++++++++++++
>  arch/riscv/configs/defconfig      | 17 +++--------------
>  arch/riscv/configs/rv32_defconfig | 18 +++---------------
>  3 files changed, 30 insertions(+), 29 deletions(-)

Thanks.

LMK if you're going to spin a v2 with the updated commit message.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
