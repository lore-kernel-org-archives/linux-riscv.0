Return-Path: <SRS0=kDER=NE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DB75C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 23:20:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA18760E97
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Aug 2021 23:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA18760E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubNINiUTbuflhdbxQjPdgGtchvV4M8jJu9DWpWRscS8=; b=gJpJB9sdlThZ/N
	v2wHXzdhEMclfqdqTm/qV+jsu2NhQ0w4hgS8iNRJqJyPV/AdlROW9p55UeRYhS0bq+V30VawwUDOh
	rkNTb9CncEj6chi8ySVzxOUp8AhPPhGvD6RB+eg3FJJbgd4DzjL5ctDuYLzAv31H96b0WnLssZy01
	FH8P4Xn8DhDfJedOn/pPAyxIYuekx5y+7WHqrkgFRWAqQJPlK0OtunzTNgsGucrVY/ErXMbHrYilT
	EQLSxcYAhXQSM/rm90ZGxH+CsUBy9qFlCmDLd/XhumzBBb2zox38FwHHEaOtSzpr0tqRPWVXbRwfW
	IkKg7HwGBfN/elC0xM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEgTD-00Dfsk-DT; Fri, 13 Aug 2021 23:20:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEgTA-00DfsS-FM
 for linux-riscv@lists.infradead.org; Fri, 13 Aug 2021 23:20:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id BC112610CF;
 Fri, 13 Aug 2021 23:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628896806;
 bh=T2A21R94Fzcz0y7VLVrd8w/ME4Ih2eGUotIe/d4lqnM=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ScXVnwYQPmfDFTf7eq09z3qUgspNCmhluxoTkOCcJ8OuCS9ZCMOik70fQRsQnKzbO
 7yAU//lXumyf60KP6BCKM3S/4e4c6VdIVmk21df//gDHdtM+5R68OwLdUGgw5FDW4W
 gJaZBJjOs1pai78ieWGxMA55ifhaUaIBopRcXTF+cU+YuKCHmT3ycm2jUe29IJq5qW
 bC9ZhvOquJ0Xn9DU5R6eNrDwQX6MigcASyEeH7pwQqCNe1R4Cza93Qj1yT+ohCVWc6
 XtiiLlU8CMj1MCIvtsB2Ii72IC0Q0AlU6pVeXlYWBSJBi/7PQ81ywSTaBQn6eGhVQj
 ZHzCd5Ycmjgqg==
MIME-Version: 1.0
Subject: Re: [PATCH net-next 1/2] net: macb: Add PTP support for SAMA5D29
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162889680670.8729.9762612075032276005.git-patchwork-notify@kernel.org>
Date: Fri, 13 Aug 2021 23:20:06 +0000
References: <20210812074422.13487-1-Hari.PrasathGE@microchip.com>
In-Reply-To: <20210812074422.13487-1-Hari.PrasathGE@microchip.com>
To: Hari Prasath <Hari.PrasathGE@microchip.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 davem@davemloft.net, kuba@kernel.org, linux@armlinux.org.uk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 robh@kernel.org, devicetree@vger.kernel.org, mpuswlinux@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_162008_572962_D5B03FEB 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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

Hello:

This series was applied to netdev/net-next.git (refs/heads/master):

On Thu, 12 Aug 2021 13:14:21 +0530 you wrote:
> Add PTP capability to the macb config object for sama5d29.
> 
> Signed-off-by: Hari Prasath <Hari.PrasathGE@microchip.com>
> ---
>  drivers/net/ethernet/cadence/macb_main.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Here is the summary with links:
  - [net-next,1/2] net: macb: Add PTP support for SAMA5D29
    https://git.kernel.org/netdev/net-next/c/7d13ad501169
  - [net-next,2/2] dt-bindings: net: macb: add documentation for sama5d29 ethernet interface
    https://git.kernel.org/netdev/net-next/c/593f8c44cc8b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
