Return-Path: <SRS0=tUGE=J2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0F6C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 23:00:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A96D961445
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Apr 2021 23:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A96D961445
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6s0nM3urzY+nqgLlW/vj9NKT4EwRV1qMdcd8ThYOQVs=; b=KB7EQKb/5e/A16n8lorReolHO
	fB5aH40xW1HgiIaqkqrGN7Fv4dizoaWkXIKyfHQs2wTWRTNDK/FLLm36iBGjvl15bl1X25u0sJwin
	kQOPHeuK4DxIrq1hpuFIAnzV+hPZjLkQFLaUycR2VfTmO7esHGzqCGlL6XY+L8ORo9Zqa9pHmxBWu
	ZmcfxY/a5BmjpHRxeE42QgkXaSnjy0o8FVXRm8hNFVakPu2NyQuhpDv00IjvP9Pq+PzG5TRyB5f5H
	1WUorgO+laSA96GIFEAMT8xLlthLuMTSqBMomy4+rW+HAUcYuYNBEqZ7HJ5LquWhQpPc6IJEBDsH6
	HxBvAMacg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcFdv-006gqU-Sg; Thu, 29 Apr 2021 23:00:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcFdp-006gpA-FW
 for linux-riscv@lists.infradead.org; Thu, 29 Apr 2021 23:00:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id D458061476;
 Thu, 29 Apr 2021 23:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619737210;
 bh=VmQwPldmlN2nyv3cnGWLqCsvMgb7xgrToKOX+Ho0tE0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=ckGGHShyvUtvil0ENv0LDYksqTZ1O9GMe1Xd4z+j29OCvu7O6wWM6q3pBhhBDdFX7
 83/25YrgVQNATilbaA3Ighhvf4MKcr8nYUdMKeJP+gvi37HXgxnb7jxt3SSGXNeYS3
 xohSNIDMBVq0eLpV7Y/u3f1kzIcqGUGaqlmoLj8mwD81k3z1Z2JNDmOlh1+lZqRFxS
 purCF0Y4MYPKREOcWhKfbx9Izx8tBHmbjmKqo5BegbTcnmQTcDymVz7QrmprhXa2mu
 T5rFmCQ+Py9NjlUfSmIVRqMDNkOgFBl3SftTOzpbnH/PPdMd9/A5+84oXZWGk6AlB2
 gh/DoxNGBhI0w==
MIME-Version: 1.0
Subject: Re: [PATCH] net: macb: Remove redundant assignment to queue
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <161973721081.25365.11886420591596326237.git-patchwork-notify@kernel.org>
Date: Thu, 29 Apr 2021 23:00:10 +0000
References: <1619691946-90305-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1619691946-90305-1-git-send-email-jiapeng.chong@linux.alibaba.com>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 davem@davemloft.net, kuba@kernel.org, linux@armlinux.org.uk,
 palmer@dabbelt.com, paul.walmsley@sifive.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_000018_607386_B4F5DF50 
X-CRM114-Status: UNSURE (   8.73  )
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

This patch was applied to netdev/net.git (refs/heads/master):

On Thu, 29 Apr 2021 18:25:46 +0800 you wrote:
> Variable queue is set to bp->queues but these values is not used as it
> is overwritten later on, hence redundant assignment  can be removed.
> 
> Cleans up the following clang-analyzer warning:
> 
> drivers/net/ethernet/cadence/macb_main.c:4919:21: warning: Value stored
> to 'queue' during its initialization is never read
> [clang-analyzer-deadcode.DeadStores].
> 
> [...]

Here is the summary with links:
  - net: macb: Remove redundant assignment to queue
    https://git.kernel.org/netdev/net/c/bbf6acea6ecf

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
