Return-Path: <SRS0=fWiV=JZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 398E7C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 19:21:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A80F76044F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Apr 2021 19:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A80F76044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/hcooVWFyKdlofLWN1DiK32S6VpsOvdTtPLMngtVBww=; b=nUtazK6UM1B5ex1O7C/gnJAsb
	bz9YbWlL48Cqp2oAUKgf83MPYQaTYEq+HNKot8WthGgA2w2Erq+wYHC7RcKJgfgAhxaBc0NHps0dV
	1lxLLgGxWxyhdIr+X3PV+miSFot0R5dl3yOuoAgc5f+ZSK9HXDcRtiW/+n/WhS2EvhqWerXRSeuaV
	4Kp7Jj6pnRamTsPXlzueWxzX+2Q/g84N/12/rvZVBiNaDq+HrGQtyGzCw9ek/Z2vflClnaTaoQhwR
	VE26NOJauqQkYB1Vi5ttcVmhpk2M5alIBnn3zir7CjT3nG5iyPLOvhqy/myzb8yX1VQnWpj+hZWYQ
	vXDf0VTKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbpkK-00497B-IZ; Wed, 28 Apr 2021 19:21:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbpkH-00496u-NU
 for linux-riscv@desiato.infradead.org; Wed, 28 Apr 2021 19:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=MH9qTt4sp6g5aiG9JvIFFPoKb7zOPOMhw+/WsWceLvY=; b=k8XBz/JHOqwSgvfPTvrHGhsjc6
 fT2EPQdsNG0zFTGqhkg2q6Zs/nZqG1GOfQCsi99VmCF2NC9RXzgFpFqb8gFWM/wbemjSDDYLYlN8M
 20JGdIVdZmyXr3G7QK8Afro3Kfj694Jbnd+yEYTUtfuW9/vhqE5zlXT8flngDrB7N6Eve2gx/wD1R
 NpJjyxBK/fn8n8NUfQVVWQrSWHI6M/Wt5gUVQ8DTCApgaJsJYDRVJDBFFLmyWY2gD1temTo/EQkoi
 Vc4Y1vWNHfGkchix2/CjVOtT799QjZzrLD6/j7s763p2xIEwzx3M0hHnMC4vxCNUB4wbw9WUm/Hcq
 LV6ABRFw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbpkE-0008Ud-SI
 for linux-riscv@lists.infradead.org; Wed, 28 Apr 2021 19:21:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C7B561003;
 Wed, 28 Apr 2021 19:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619637669;
 bh=Z+hf56Lv0OrVFj6ZxeSzSJ359yIHCQYAjIVswXKPv1E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p/g3l27LmUPWwfUaO1qJ65jhX9dBk9tuFJKOWu3zbqjSX5lA5OzjnTMSx7Ao8NSHU
 YP/9I3hAkW2hYUmhCNaV+jdJaMZ8U5WBCjjoDrildrFWzaA+h75ELokaEnsuVK/zng
 wcd4vzEAV4Vl5SAndYU6mVmzTIXE5vML5OrGMw0TVhDfsVAvMy3nhDIt+DyPxMT44Q
 uDG7fca/HRFqv9bQ9Q6PNlk8SD/mDed4SDIP7nB7JNCU3I1UGrwJ5V/wLT/nHvHsoR
 Iw1Fn+1E2cbWUgAEXr3WSXHgRTYjLtjnsH0VCJ2hLG4Vw5gCu+Y8MDILdfq96U6OU3
 vGSll2/BeMrxQ==
Date: Wed, 28 Apr 2021 12:21:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com,
 davem@davemloft.net, linux@armlinux.org.uk, palmer@dabbelt.com,
 paul.walmsley@sifive.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] net: macb: Remove redundant assignment to w0 and queue
Message-ID: <20210428122106.2597718a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <1619604188-120341-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1619604188-120341-1-git-send-email-jiapeng.chong@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_122111_010409_1CE880DC 
X-CRM114-Status: GOOD (  12.44  )
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

On Wed, 28 Apr 2021 18:03:08 +0800 Jiapeng Chong wrote:
> diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> index 0f6a6cb..5f1dbc2 100644
> --- a/drivers/net/ethernet/cadence/macb_main.c
> +++ b/drivers/net/ethernet/cadence/macb_main.c
> @@ -3248,7 +3248,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
>  	/* ignore field if any masking set */
>  	if (tp4sp_m->ip4src == 0xFFFFFFFF) {
>  		/* 1st compare reg - IP source address */
> -		w0 = 0;
>  		w1 = 0;
>  		w0 = tp4sp_v->ip4src;
>  		w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */
> @@ -3262,7 +3261,6 @@ static void gem_prog_cmp_regs(struct macb *bp, struct ethtool_rx_flow_spec *fs)
>  	/* ignore field if any masking set */
>  	if (tp4sp_m->ip4dst == 0xFFFFFFFF) {
>  		/* 2nd compare reg - IP destination address */
> -		w0 = 0;
>  		w1 = 0;
>  		w0 = tp4sp_v->ip4dst;
>  		w1 = GEM_BFINS(T2DISMSK, 1, w1); /* 32-bit compare */

Looks like this was written like that on purpose.

> @@ -4829,7 +4827,7 @@ static int __maybe_unused macb_suspend(struct device *dev)
>  {
>  	struct net_device *netdev = dev_get_drvdata(dev);
>  	struct macb *bp = netdev_priv(netdev);
> -	struct macb_queue *queue = bp->queues;
> +	struct macb_queue *queue;
>  	unsigned long flags;
>  	unsigned int q;
>  	int err;
> @@ -4916,7 +4914,7 @@ static int __maybe_unused macb_resume(struct device *dev)
>  {
>  	struct net_device *netdev = dev_get_drvdata(dev);
>  	struct macb *bp = netdev_priv(netdev);
> -	struct macb_queue *queue = bp->queues;
> +	struct macb_queue *queue;
>  	unsigned long flags;
>  	unsigned int q;
>  	int err;

This chunk looks good!

Would you mind splitting the patch into two (1 - w0 assignments, and 
2 - queue assignments) and reposting? We can merge the latter, the
former is up to the driver maintainer to decide.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
