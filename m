Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3197D4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vtntpim1fqNdnRB04up0fxPyTko8ENB6n6sGvqOPjt0=; b=peYj5417jmYcgr
	Oq53pN+/SLjuluB30hwwseDuTWD3WSQEb/8tFYZ9YvTKgwjgKJhmyZa8NItQn69uM9xbjF2p/lwZu
	hb5RsuiOQLv1mLWYwi9d2xNp7N/7vhZ0PncoNnR+UIrDdHySoKvePn7fDAyi1ZfaCdAICK8bt3Tkt
	Xw5aX0LHzlJSkKp5fTZ9v81W6GOyJ7g8W+qJLI6wttUVkBT00WGcelQAMu/gaPGleEsNdA4OA8UMz
	YAIC6Xrmw32txbGO+EgUuWB+M6bzJux0kOZssgR96XeG/X8XRcOfOvNRpEo1BMfLhyAlrSqlQpftN
	oaFUttxqW8L4yTJhYPIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSqC-0000000D2Da-3NHW;
	Thu, 15 Jan 2026 19:17:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSqB-0000000D2Cv-3Lmi
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:17:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F127E60167;
	Thu, 15 Jan 2026 19:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25815C16AAE;
	Thu, 15 Jan 2026 19:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768504626;
	bh=p7/JBpmEwg/DLwt21Ltch9GHHNbDYW0F+YNcovqYc6M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gze0JJsTR4dkLJ8HSQtzZheXfVmd6BQo5UzzVu0W2rLaaeGj1I9OVOW5kRWJ0xtx1
	 KU6RdCEcSHuCo1JrYpU1UPoRxLZV5BVVIUp5BwpeTieWbzVJ5neMuiMOqqHsb4TaAw
	 1MEDPn+ftAfF6yb0qH6ipouKsz8SFyXkT4lEd1g1iUV0XBPc7L7XR8I+eUuGpHJHMS
	 3KfxvJqN82X5+ykgoFShDW8t5ieEhijUzrM+MLPmnIqgxyHAXm+/JD7wfTwhNhe1cq
	 /NSlcHaNIgK9orqUOhReR+5JCYVyfYoLUmB+HuyCD6+gMGuzQblVgXD4r/jOOuDQRo
	 6QQFbPXFQNnZw==
From: Conor Dooley <conor@kernel.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	daire.mcnamara@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()
Date: Thu, 15 Jan 2026 19:17:02 +0000
Message-ID: <20260115-jukebox-material-b3a74f84744a@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251228124836.3681318-1-zilin@seu.edu.cn>
References: <20251228124836.3681318-1-zilin@seu.edu.cn>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=542; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=lUBg3Z2kDNpx01FYQs5VphyryZRhXcrmuNWIkmfWTn8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmZtnoPH7DeFovdFX5j+71IlZvTnzoyXDcyWKTbFhS17 szB1Ie7O0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAnCRL4wMDwS+fHt2ZY2XEUvo Q1PnjXUpwhOsVaf58s6+y8coVFNsyvBXlG9Bv6+ESsv640v7XQvVkw179hn+nXvY/ejfbdeZ3tT zAwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

On Sun, 28 Dec 2025 12:48:36 +0000, Zilin Guan wrote:
> In mpfs_sys_controller_probe(), if of_get_mtd_device_by_node() fails,
> the function returns immediately without freeing the allocated memory
> for sys_controller, leading to a memory leak.
> 
> Fix this by jumping to the out_free label to ensure the memory is
> properly freed.
> 
> [...]

Applied to riscv-soc-fixes, thanks!

[1/1] soc: microchip: mpfs: Fix memory leak in mpfs_sys_controller_probe()
      https://git.kernel.org/conor/c/5a741f8cc6fe

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
