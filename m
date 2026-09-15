Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4ABC88E72
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 00:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvxJhK/PwRhJrdwAwOk+OiBgZ7K3T+WD32ZCISjghMM=; b=WA5lTPEm+w6rPv
	K6UAmrrywiBCYDnwQ5oiCAcriVrOf3Rn51ZoXwERfkxsETBa4YdhNgWBn+S1romFu3Y2kSAZElwnR
	SzmGim6qgtDqGbY+LKI8O8wh8Tx3m+yYHHBb97GCRytNWebU4kI7c9Z2ACCgnBP6x1p85rP76SaLb
	+jV7uwPItzFdnlkjSVnAZ4MnPxD9YJJB46BbR0a2Z23S8xRRd4zGb17b3DN9aYB3i0TW5GuZAqCKR
	loTvhxXlEaL9bGDiTmdY9+EyhT5zs+S2pQHhrKx2VrQyZy79oH3M7sBiN/LXTFY1gJ0McnEQR9FUX
	RjQnNnWqJpYWagyqf2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HTp-00000004vhg-0e6A;
	Tue, 15 Sep 2026 00:57:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HTo-00000004vha-05Vb
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 00:57:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7750C6025F;
	Tue, 15 Sep 2026 00:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE89F1F000FF;
	Tue, 15 Sep 2026 00:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789433819;
	bh=wcaw6NoI/kdvca0JXoKnjNv3/X5K6pgBkW8BYKOnOuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fPRXoBEhj0nJfAaDgCU5/rcUP9wvyPbQMQDm4uJGGblfqYh0F0qTiXy849SuBATio
	 wpFsYblv7nyAOClfA92CWKAi6FG6en+PtbaqUk70v1MDGUMVjuFl+MoxyP7h0QUdJZ
	 NFtXVueWrxGRYOwdSYWpuPqrcTQX9kIGSiYUdRjVq082aZxCuC7lBk9qpYkET50YWP
	 B0GKujRaLhWQvp4KdTZ0NWMGgWE9JfYyVzsnwUSMKMtTh1JxZq1dBD+XSTEczP8DD/
	 rr+BlIa5M0xqAPM27ZBn9yyMzecBPu0uGbUbNuXiV1vFR95r/VTGxSWMF0SdncOb0e
	 IwbhG31dECOOg==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
Date: Tue, 15 Sep 2026 00:56:53 +0000
Message-ID: <178943376986.3673424.9823989406709059197.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260802100101.327815-1-amadeus@jmu.edu.cn>
References: <20260802100101.327815-1-amadeus@jmu.edu.cn>
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


On Sun, 02 Aug 2026 18:01:01 +0800, Chukun Pan wrote:
> Sort the nodes for DT. Also reorder the properties of the sdhci0 node.

Applied, thanks!

[1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=d4871c29f21dda76990cd3138c72ceb71c856b93

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
