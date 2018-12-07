Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C079C07E85
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:31:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E043A20672
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 18:31:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jqzcGyQx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="DQe7Ioyx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E043A20672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=SUnfRk6z0tQZ8aGGMe8kG/5TwUCg43gNUBw6mTlQqiA=; b=jqzcGyQxdgKHXpOTVPYYQedeV
	vAe4tqj69HqXkx0eT5cqOppCBcYB2Ose1Xfe7wj0EbtsadymB20ag36Fuy4ADIq1yRPTp8l0RRbuw
	r/XsNDOBkttuh397Q1/+SRNyChQRrIeX6gJPlWBG4L30A6DaEhi0mH5Au/R7VHDUTh3vAH3TWvV4A
	Ir6mD9Ms2g+G4j5v9vvNm8ZznO8MMZr1GczKNpX+ZLoFUBHSjCBHzrxh9BD1GP/TjxXlzRIyntg+q
	RFlzOhsvJJ6NzPWYDfUh/34TXEK1/1ENHZ2INMRWJN3b2MBZ7OytiA4hHeQfbWwIyVbeGERYUbCLG
	8PcVpHe2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVKtw-00069y-If; Fri, 07 Dec 2018 18:31:00 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVKth-0005sG-OI
 for linux-riscv@lists.infradead.org; Fri, 07 Dec 2018 18:30:58 +0000
Received: by mail-pg1-x541.google.com with SMTP id 80so2077928pge.4
 for <linux-riscv@lists.infradead.org>; Fri, 07 Dec 2018 10:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XSSMSULfAytnxie2DsEU0LDybwmkejAR17D3/hDbfbE=;
 b=DQe7Ioyxn4rM5SD2hvHuBSvu2hLQgPkppx8RxtmvCmDTqaOsCGQqxTpHIUhahN9g4r
 cn4xVgPamU190S9Mr3TGbIi+b5ifAOzpxImMvD2tb09UAmbIRLwfEyMPbSK5tBtFl8Ik
 7rb2Qv7TS4RjE8DMasRoOs8ZnUQbfVe+KgjHVMbMeCm/Y18ZZheU1wHWikGH0o0oUVep
 qw8uqx58g+Rr4ceadSs96giLax9zLzQqroB8ZfKA6Rjq11V9ajk3gQkxQdca/8+4f9H8
 6W0D27NHUlz2Fsx4PUmhN8lm8qhYpm/9E1cbGNhMWBygLFqHIcbHJ54Wzfz/IDIHG/QG
 soLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XSSMSULfAytnxie2DsEU0LDybwmkejAR17D3/hDbfbE=;
 b=ApbhjDVckjpDTV8N3vokirOB2xfjxIvK5Nr+rcW6cBE1wDsMtUkEgz9lfITEG9cXrw
 ldgunwKRXiWxXI4YniO4RB94U4pWL+lSw2sPpSzCZq/qFBkB8KRx+1u+RfKr2KPjVVx2
 zbvZzaap88eWZeydjtuMFVNS5ln6w4HX7PXehmaEWUScAqacpZh15cuBhhDjb0Hj0s5b
 4uOlcmZR7+o6Usm2RpWhiKTIjJsdobpb7Doe7ywDBWThgQXo1mrKejZlVy6BAdEtkf+b
 MzJNptNg2czO99HpKnpM6NINWM18k1Jl3fvh62lZ1TMIjg40lJ8ALLc4qJwr5RBHTTnT
 gU1w==
X-Gm-Message-State: AA+aEWbUi/Jtfj7esmcYawa4deS5uI35izKQDnKNe4+Vulq7z99zRqsQ
 gdMrFlVCX/dMilVYwiZetMtN8w==
X-Google-Smtp-Source: AFSGD/WMxbhCzfK78f+8OkNMEj7eM17qLZcfnCKqIdGsDaDhQm2/NBMpzjABAIFkopUMo/eY+xFVag==
X-Received: by 2002:a62:9111:: with SMTP id l17mr3292831pfe.200.1544207434804; 
 Fri, 07 Dec 2018 10:30:34 -0800 (PST)
Received: from localhost ([216.3.10.7])
 by smtp.gmail.com with ESMTPSA id s2sm5867597pfa.167.2018.12.07.10.30.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 10:30:33 -0800 (PST)
Date: Fri, 07 Dec 2018 10:30:33 -0800 (PST)
X-Google-Original-Date: Fri, 07 Dec 2018 10:30:08 PST (-0800)
Subject: Re: [PATCH 0/3] RISC-V SBI earlycon
In-Reply-To: <20181204135507.3706-1-anup@brainfault.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org, Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-e67fd38e-d244-43da-817b-0b703347aa83@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_103045_890692_3AD8DBBF 
X-CRM114-Status: GOOD (  15.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: robh@kernel.org, aou@eecs.berkeley.edu, anup@brainfault.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 04 Dec 2018 05:55:04 PST (-0800), anup@brainfault.org wrote:
> This patchset adds RISC-V SBI earlycon and removes RISC-V EARLY_PRINTK.
>
> We should use earlycon over existing EARLY_PRINTK for SBI console because:
> 1. It's a more generic way of implementing early console for debugging
> 2. Current RISC-V EARLY_PRINTK is a compile-time option whereas earlycon
>    is enabled at run-time via kernel parameters.
> 3. To use earlycon with SBI, we have to pass "earlycon=sbi" in kernel
>    parameters. If earlycon kernel parameter is not provided then kernel
>    boots much faster which is very useful in real-world RISC-V deployments.
>
> The patchset is tested on QEMU virt machine. It is based on Linux-4.20-rc5
> and can be found at riscv_earlycon_v1 branch of:
> https://github.com/avpatel/linux.git
>
> Anup Patel (3):
>   tty/serial: Add RISC-V SBI earlycon support
>   RISC-V: defconfig: Enable RISC-V SBI earlycon support
>   RISC-V: Remove EARLY_PRINTK support
>
>  arch/riscv/Kconfig.debug                |  2 --
>  arch/riscv/configs/defconfig            |  1 +
>  arch/riscv/kernel/setup.c               | 28 -------------------------
>  drivers/tty/serial/Kconfig              | 12 +++++++++++
>  drivers/tty/serial/Makefile             |  1 +
>  drivers/tty/serial/earlycon-riscv-sbi.c | 28 +++++++++++++++++++++++++
>  6 files changed, 42 insertions(+), 30 deletions(-)
>  create mode 100644 drivers/tty/serial/earlycon-riscv-sbi.c

I'm adding these to my for-next.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
