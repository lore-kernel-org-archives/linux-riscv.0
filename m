Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579D1CD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2k4rUSNwx5VOy7T2nuitZEl6iUXnxwfc/BGq9vQkAI=; b=YZMl1fwMScTEOY
	SbZ0CevanvLjdU4PpMEXW0LElqDvcs0O76VUu4VOA/9oMVlQysjd//cwdB+y3nROdUyyhG/vu84WR
	c0g7krDT72B2RdEoqpUwRqCZALRUGMeAKNhdlNikhCfOTTfbg1zUOrfgOvDIk/jPojsxcKWCPctE0
	CXG7qvNPI0V+iU5Gd/1QoqLKZkMlzqxqU/lmblOAyNbWY5i73RRWmfXyrEHJRPeEQHw8CzQYwjN28
	HTIFRiGjxaoSZ2zDChbtl2QraN+ThzKNCgThJ4UIWz+5bWSbpQmTL89vEn/4I8NS8yAOu1Q2GsR+y
	6YyIgZop50fjejjonKFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmsc-0000000FId6-3P0i;
	Wed, 03 Jun 2026 14:47:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmsb-0000000FIcj-1FW4
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 14:47:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 717C3601DD;
	Wed,  3 Jun 2026 14:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FFAD1F00893;
	Wed,  3 Jun 2026 14:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780498056;
	bh=Ex3dPkDbHhXsmXVq8gwIpJx6uQL7vpbu9YWBPFHr2h4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ud72UZNi7Bps1ZJu6hDU7CGgLn5sdB6sXsTc4lfA9lBIgX7ij3Fumb4RkY8hZNB0N
	 LHLh9aHPJvyeHFcqIZAbZ3n3+EXjbtQo8EW224T6dK45E7taS5b3Te7+n9B59Yy3UW
	 NgkJzKqNGQc6qFdpS+eyKOnFaCotLvme/5/9EfNeORWFh9MnRVPTl8kpJAXh9VnDBn
	 KQmtI+DeuS/xMjN5AnV5zUf7BI60rX7u4173VSak+DXjNhNYTtAEyTam4VIivTwlYh
	 w9p5WMbANVIXbwkeSEzwBSZNfOs2jD+Siy5gwmdHUqv4VLR5Th9fXA36JyLgKNjmJc
	 ZJzmVhCKmgHDg==
Date: Wed, 3 Jun 2026 14:47:33 +0000
From: Yixun Lan <dlan@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Philipp Zabel <p.zabel@pengutronix.de>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller
 driver
Message-ID: <20260603144733-GKB3727415@kernel.org>
References: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
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

Hi Guodong,

On 06:26 Wed 03 Jun     , Guodong Xu wrote:
> Add a MAINTAINERS entry for the SpacemiT reset controller driver
> (drivers/reset/spacemit/) and its reset-ID header. I intend to
> maintain it: the K1 and K3 instances now, and future SpacemiT SoCs
> that reuse the common code.
> 
> Link: https://lore.kernel.org/spacemit/20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com/
> Acked-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Looks good

Reviewed-by: Yixun Lan <dlan@kernel.org>
-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
