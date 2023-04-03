Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF164C76196
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZApUU8S1XWdCOXHClpS2Ud7zWthnlC8sR/zcL45q1Q=; b=gtICxgeD/RCymk
	q079xgF+CqQlkiu3kGYq3tyjCAmFZ5LEGB8dUEw7SJa0gxADlWNHJmcp9z1O5/J5rnB7L3Kbo1vaj
	Y5Co3Yiqu3NqgqlekSbGnIyvS/x6STnirsb+zvgx+Iuyv7mGY7XiB1OLBIrP4MTcFc5RzyjQ7RJUk
	rlGojQbvm2SNB1Iqhiuchi5aLUCXD4/GFLr0+kGRHm2DB/rwrW6DH6TBCv7Gi6v1X34Cn4vV5F9Y2
	A4sqXi/V2yYS1Zmlzl7Sb+jIF6cvf2VJLI0sEgmDYW71mF3/qO/E3TSHhSCbaqjI3jp40sWkTsffo
	+Cu8ltLg6KRLzn7jMyXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOvH-00GChD-1D;
	Mon, 03 Apr 2023 18:28:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjOvE-00GCgK-28
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 18:28:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F0CB619EB;
	Mon,  3 Apr 2023 18:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3814BC433D2;
	Mon,  3 Apr 2023 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680546529;
	bh=yICN110vzqQ8myDytASlXudxGw7tRNZQDNQFPj+jn84=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rkxh0Fw9pjkBlgfWD12YHOFOF2sf+jozOVwUbjptahBf3OzVzzOmPSARg2M/b/9/r
	 Feh8DNH0EVkpT4vXvl7RqkEn1aHGYNScZY8XOY4CZCfLVRksLf+PC6BSPMrgel69/6
	 bO1Dohjt/+C5svwlblOCq2Q90bTrG0TxeURJPU5U2j0LFtIc3K+xDLL+WZnxHE+Z2k
	 zBL6tY8gEyHHQvUv+wvek+uoWsu+e43EIGkRmv8BilEmdoH2z8K+tcsXjq5SHOTGcs
	 pWZxpdKhLa5jk2VQO4PgI6x6UP66080+3ioBg813MBKdsHUbwP1X01VYFOAUV2ngqq
	 Ubg8yaj7bhHcw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] Hey Jassi, all,
Date: Mon,  3 Apr 2023 19:28:28 +0100
Message-Id: <20230403-punctual-placidly-4898955d636c@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307202257.1762151-1-conor@kernel.org>
References: <20230307202257.1762151-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1412; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Bo7lkVcAUQ2XqrBpPsqSpiTg2cX4hn+UuEXZeqaQLm8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnaUqf2xEioLN3AVfL95UEtTdMyj3VftrL8ljLiCbgkX a0YKnCio5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABM518XwT/lBUAjfB47p5jUq 9rIT6z1ftj/+vppxsZGutreoR9qMBIb/qUGb2Z8+mtdevfnmwXvPX064brRA3JPrkstk9fc6dnq POQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_112852_739596_03FFF71C 
X-CRM114-Status: GOOD (  11.75  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 07 Mar 2023 20:22:50 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Here are some fixes for the system controller on PolarFire SoC that I
> ran into while implementing support for using the system controller to
> re-program the FPGA. A few are just minor bits that I fixed in passing,
> but the bulk of the patchset is changes to how the mailbox figures out
> if a "service" has completed.
> 
> [...]

Applied to riscv-soc-for-next, thanks!

[1/8] mailbox: mpfs: fix an incorrect mask width
      https://git.kernel.org/conor/c/75dfbcbfd781
[2/8] mailbox: mpfs: switch to txdone_poll
      https://git.kernel.org/conor/c/b5984a9844fc
[3/8] mailbox: mpfs: ditch a useless busy check
      https://git.kernel.org/conor/c/da82f95f7c07
[4/8] mailbox: mpfs: check the service status in .tx_done()
      https://git.kernel.org/conor/c/37e3430176ff
[5/8] soc: microchip: mpfs: fix some horrible alignment
      https://git.kernel.org/conor/c/5ca631ec757b
[6/8] soc: microchip: mpfs: use a consistent completion timeout
      https://git.kernel.org/conor/c/4f739af1934a
[7/8] soc: microchip: mpfs: simplify error handling in mpfs_blocking_transaction()
      https://git.kernel.org/conor/c/7606f4dfffa7
[8/8] soc: microchip: mpfs: handle timeouts and failed services differently
      https://git.kernel.org/conor/c/8f943dd12eef

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
