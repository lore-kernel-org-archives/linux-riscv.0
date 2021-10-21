Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF6CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 12:38:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F05F060E97
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 12:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F05F060E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f37WXxFPE2a+0d7ExQQn8DJHPv0dw+w0+cdIXBjxgko=; b=Xkj7PE51h1mZbA
	S50/ARvPeyLZFGZ69KfMD4JkwUyULNLCk9yzQSFBWgjI85shEISOzCLKWrSWRGGwFFRrAdmoAlCRV
	EPnEzFOHzOSgmxQ+15vfmYUXNd0xBh8tR7O8TrfcvR5zGVVnLrbF+0e8ud6wytnWmgf5Fj8rMrYBA
	GutD7sYaSk2cUm6I4HOfUuH+yxjDL1r6O48r0sO817uDyseLYp/GTp3lNtZVjVm0yIJXLdLDtBmvZ
	9p7SBgptd6v4LSB4g+a9Uf8s59QTw6no5RM4U1yxObeDJ1HmB2ofnj7/YupvusZFrOuSxZBIh/Mlg
	ZuBP4kyqH91Mtsd3EzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXKO-007WDC-Uz; Thu, 21 Oct 2021 12:37:48 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXKC-007W9e-EG; Thu, 21 Oct 2021 12:37:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 738A080FC;
 Thu, 21 Oct 2021 12:38:05 +0000 (UTC)
Date: Thu, 21 Oct 2021 15:37:30 +0300
From: Tony Lindgren <tony@atomide.com>
To: Amit Pundir <amit.pundir@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel@lists.infradead.org,
 lkml <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
 linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v4 2/2] drivers: bus: Delete CONFIG_SIMPLE_PM_BUS
Message-ID: <YXFfCg4iiI0P5JgJ@atomide.com>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-3-saravanak@google.com>
 <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMi1Hd0HvPOT277mx8hNTU9NQH2ti7h5qc5+rxOkRWwbfrhyQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_053736_567972_359C0A10 
X-CRM114-Status: GOOD (  10.36  )
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

* Amit Pundir <amit.pundir@linaro.org> [211021 11:22]:
> Hi Saravana,
> 
> This patch broke v5.15-rc6 on RB5 (sm8250 | qcom/qrb5165-rb5.dts).
> I can't boot past this point https://www.irccloud.com/pastebin/raw/Nv6ZwHmW.

Also, I noticed we now end up with simple-pm-bus.c that does no PM
for the legacy which was the whole idea of the driver in the first
place :)

Saravana, could you consider just adding a new simple-bus.c driver
in addition to simple-pm-bus.c for the cases that do not call
pm_runtime_enable()?

Thanks,

Tony

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
