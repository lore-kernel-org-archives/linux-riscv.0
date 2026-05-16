Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579C1CD4F3C
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=982RKAqSCjJN5w+wmNWeZh372oTh5FXBAccOO+mmKBI=; b=eRsZNmqhkaNCG9
	y7S+/m0Zk3u0x3Px0Db/Og+v9NncxMQ4/e4N7C/sA3f9drAaeL23lZj+IprbGAqMOtVKN/bSqDNv7
	VcK/I8DV6qcWqs1krlyG20Y0GtvyI+x/Cr4ytu3c/pX7qa9KbFpETjFbHne7FFr5B5KadlRY2RBdF
	yo725MAPrN1tK1vRjhC3DIxyCczgA/7jgziFRYwgt/a5aL8JwV3/yaCaXoSZv7QwQoG8OmTgWgaor
	dJCqyrAlUlZ3CX4Ov9bGgTsHhrmTPubvVc8ZY98p22cVgynUgfHVa2opDOJ9PWMhbsD7GS2m1KPp5
	3vy/hPh157JE8K+ybb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEfj-0000000AlGY-3mMM;
	Sat, 16 May 2026 13:03:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOEfi-0000000AlGB-0hfS
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 13:03:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F397960142;
	Sat, 16 May 2026 13:03:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92EDC2BCB3;
	Sat, 16 May 2026 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778936592;
	bh=dXwJVxBzLDPTQmhMePfb0+XfT5+tnxSv3a1I+i+98DI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tdT+D4gBvPobLn19zUvY24kDKJ0phI+u1qL3gYDYs93tjb7e1U04HsinY3qL/sAHT
	 68FlBmGKL4wIehAyGVQRvQz64Wkti5KdaD9fyqYPARH1/kZ1PKVPkMSbr2gw700beL
	 DVne4Jb0nSugq3iG0ninz4dDpm7I8MejjKCROZGbr+N5v9dhKyfYGJz0X1FDjMlI9P
	 pL3hpKwBTjuIfCSwdISLFfzUhr7qLM+js2p4LpT5glVMiTh8g+uxw3N7tRiZXVQNva
	 9VrmB69jCr30yxthrkjZcs5v/vy53vBsq+9qDbeLjhX4fclzpd4gZQEDml4a579HJn
	 z/IkW5a7g1oMQ==
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
Date: Sat, 16 May 2026 13:03:06 +0000
Message-ID: <177893657188.2456968.7429508961699495905.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
References: <20260516080030.1736836-1-amadeus@jmu.edu.cn>
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


On Sat, 16 May 2026 16:00:30 +0800, Chukun Pan wrote:
> Enable the QSPI controller and the XM25QU128C SPI NOR flash on the
> OrangePi RV2 board. Add a flash partition layout from vendor UBoot.

Applied, thanks!

[1/1] riscv: dts: spacemit: enable QSPI for OrangePi RV2
      https://github.com/spacemit-com/linux/commit/dd5c5b54c3be5a1422f05a23370779235043434d

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
