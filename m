Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551D9CCD183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 00:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=byuJUvlGmT5sVfzcvscz25vSdD0LB0BtLJDDB9neqRs=; b=3/7cMfWym+aAWO
	G6WtpirVrMoCeHJt/phc8deaiH3BTmJg0VOpJa61OP6+4aPhjhDUtH3la+VE+DHrFLbplGDpDGkG9
	KQd8U6YP73W5X7ZDrr2I4pFmpLLlzzhPR0duvw+J93UD1GZiTMFUuCytZn6gz74aakpd2Dqx4QHL5
	Oz0Sjgx7vRBRrzV8YzFAJWS/J8K+tcLwhxzR5XSgzv/gmkr1SY04uamgLx/C3+HVIcFBaD8G83LIJ
	nSFRvVAej8ECxVfbV6KqLjHsRdo/YWOJ7C1JbFpXMWtJutTBTC+NcLqVpJtTwUHuXEMr+jG0OoJjy
	/HT3XRahLv/gD/dmi2EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SSZ-0000000EnhG-2kcp;
	Tue, 14 Oct 2025 00:00:11 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8SSW-0000000Engj-2UEN
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 00:00:09 +0000
Received: from ofsar (unknown [116.232.147.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B457E340861;
	Tue, 14 Oct 2025 00:00:01 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: Yixun Lan <dlan@gentoo.org>,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
Date: Tue, 14 Oct 2025 07:59:41 +0800
Message-ID: <176039992624.852221.13654333780922349248.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
References: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_170008_654799_24C085AD 
X-CRM114-Status: UNSURE (   5.30  )
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


On Wed, 17 Sep 2025 08:59:07 +0200, Hendrik Hamerlinck wrote:
> Add UART pinctrl configurations based on the SoC datasheet and the
> downstream Bianbu Linux tree. The drive strength values were taken from
> the downstream implementation, which uses medium drive strength.
> CTS/RTS are moved to separate *-cts-rts-cfg states so boards can enable
> hardware flow control conditionally.
> 
> 
> [...]

Applied, thanks!

[1/1] riscv: dts: spacemit: add UART pinctrl combinations
      https://github.com/spacemit-com/linux/commit/1187f9b3f6ebde806289877fa710ffd58f950104

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
