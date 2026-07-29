Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC3CC53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ueP4Ny62solAz2nvL7SVabZuvg5HS0UDjS9VqscgQVg=; b=0Q7C63TXw3i/zR
	Qp3cttG1qL0FIBb2zHm3y4h7BWRcyH7fQpxMIKfuPdjZwXRKYziMeUM2GYLALx1mxdxHCzc7AD04E
	4zGje4Mls7myzCISLQxZWwVxklT8agJYq4OMEEQp1Rbp1DvDSXf5hNdeDxoM81DIsgl+tVu1xvoIp
	3nV0lGNxHVqfWi/FmbNFECfL6tvmqSXyIMtuz3fC17fqacTJTWF0H/DsU7+WS2dtMvfd6OyF8lOhm
	FgJ8wYiln3IYyWG0bM73jY8TObK8o9rkPhlYyJisO8yR2KXYxYEz20Dw08wg4pnpBZ/2KrwICposr
	QyZgW7F79WKPxqM21NBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpA0j-00000008tb3-2sYX;
	Wed, 29 Jul 2026 19:32:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpA0i-00000008ta8-2NTB
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:32:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65441600AA;
	Wed, 29 Jul 2026 19:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1AA1F000E9;
	Wed, 29 Jul 2026 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785353530;
	bh=kYiOewOlOK4zhnWvHf8l0ZQSgomofqVmJqMYyBJxtck=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Moxo9YSyexRe/JEM7ccwAZv5jPIoD2adp6gR4eZyaqRV2L+OXisWZpgIf7P23eUMl
	 HBYNm+ErQ3on0sZJjO0B64yoVXpThcPTr9Iwb/47XS03xSfchlqO/zcfLdIt0g8xk3
	 M/zuZNHycrfpOARhXdrYlmN/r6aOikdvXKg8G/bzXPM6MxXFvRsI4XpnjAcd+ntaPy
	 KHzXJpZyHDztT2Y0GWa/U9ZcCf2Qog0EfV+t/xtYtnRKfg7wOm/7Rs4nmBlZad4/W7
	 gUHnsLDul4O5+V7Um7jSUm1YurEj7T4nsD7Fciq995yTzyB4GluiYz+OwWXP26Mh2k
	 guvNnKoVajs8A==
Date: Wed, 29 Jul 2026 13:32:08 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Nam Cao <namcao@linutronix.de>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    Jingwei Wang <wangjingwei@iscas.ac.cn>, 
    Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Revert "riscv: hwprobe: Fix stale vDSO data for
 late-initialized keys at boot"
In-Reply-To: <50ca78a649faf53f8941bc94c9cf8268b3644d38.1781666867.git.namcao@linutronix.de>
Message-ID: <3540b132-bc8e-0431-a955-17407028efa6@kernel.org>
References: <cover.1781666867.git.namcao@linutronix.de> <50ca78a649faf53f8941bc94c9cf8268b3644d38.1781666867.git.namcao@linutronix.de>
MIME-Version: 1.0
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

On Wed, 17 Jun 2026, Nam Cao wrote:

> This reverts commit 5d15d2ad36b0 ("riscv: hwprobe: Fix stale vDSO data for
> late-initialized keys at boot"). The commit ensures synchronization between
> the unaligned vector access speed probe kthread and vDSO data read. But now
> that the kthread has been removed, this commit can be reverted.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>

Thanks, will queue for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
