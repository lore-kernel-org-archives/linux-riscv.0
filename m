Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F21C8C25B76
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 18:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l43gDmLh1xoZY5q2xHLsW+IGsnDlkdEBcSQIYRQ1kd0=; b=dwnrnlvtisruxa
	mV9IEbwBwYr8ZL3o+xGuAvamSNhMPmMmZe0umg2j8cRUS+bW+UwtdP6ThSvmQ5EPpkR902Rx6geKS
	yuBi9P5VW7Kse1Vtb+pQx/7PYO1UtRQcVI0vYi6Hzs5zUXg8IwLydHGvpgbM0VgVD2lJ4XRfWEXop
	iGgYLb4eJcWfQ6bEjs8dWqMb/GYfmZiNAGmGGpF4MtkuxUTmCUHrtzjh5z3TufGhTosfg+JukF+eT
	uxihZyEJr2uWjoeu903WDjmw4PmV9amVVzvZ2pfJ2cJxcf0Y8ntSgumdHjmZeDtyDX8bT64zVPV6G
	SdIAdgMjWLmOLuGiQxJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvc9-00000007Bym-3Qre;
	Wed, 05 Jun 2024 18:44:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEvc7-00000007ByD-01uB
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 18:44:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 23D1960BEA;
	Wed,  5 Jun 2024 18:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72306C2BD11;
	Wed,  5 Jun 2024 18:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717613037;
	bh=cmQPW06kzMzdKox9m8m1jh7GNWP+/LQm2wfZlpUN0zE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tkd17MuUFZ+NzMexmWRrZCIilumk1ZP6GDRSJLyICuUDUPzFxa7CV3+asAFu70heb
	 5N2R8rVrAB+2Bt8MHphuorWMSfzUE3IQMfWW65l+CyVbdC9Q8vadChgV28E7pC0qNP
	 UXU+uuOvxYFh+2EYyGt7SZ7oRBEIf58MdN94HT3FJNGOuVtsEo0lppPV9iPU+sdqak
	 HLmTTtO+3aIsY++FO+mNHVaCQQBunkqIBSFEDfhKDNo0+SmfuCCs3WpoxQQ1TFB/PN
	 FR/zNC7SwsnAErI//AxywJXzI2++sHZ15dcKJZ1V+srs1rdGbSpYn4rnhZvYg7cger
	 +IA6w33LNR8/w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/5] PolarFire SoC Auto Update design info support
Date: Wed,  5 Jun 2024 19:42:54 +0100
Message-ID: <20240605-comply-cycling-d9bbc9a4c933@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410-opulently-epic-8654bdac3422@spud>
References: <20240410-opulently-epic-8654bdac3422@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=951blRr0Ng7FD/2XOVi7DbaObReZBWsO7Iyp9j4pFLA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGkJG9dNvfRq/8If/zK3Hrx8NHGW9bzjzP2mp+TdJwfsf fTmyZlf3B2lLAxiHAyyYoosibf7WqTW/3HZ4dzzFmYOKxPIEAYuTgGYSEQPwz8rp3smAn/Xt4Tx +dezbulgWC4tn57X773rYarh6o8vQxYxMrytSTTkeXvNMYGnkf9J7rvE+pttZ113PIvxK9++siQ zmRsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_114359_134652_FED949FC 
X-CRM114-Status: GOOD (  11.69  )
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

On Wed, 10 Apr 2024 12:58:03 +0100, Conor Dooley wrote:
> There's a document that is internally available that the author of the
> design info/overlay format stuff wrote about how it is composed and I
> need to go read it and make a version of it publicly available before
> this can be merged.
> 
> While implementing the design info support, I found a few opportunities
> for cleaning up the code and fixed a bug that had been mentioned
> internally about failure cases printing success. The scope based cleanup
> stuff in particular is rather helpful for the drivers using the system
> services mailbox, so I'll roll that out to the other users soonTM.
> 
> [...]

The document that 1/5 relied on has been published, so I've applied
these to riscv-firmware-for-next.

[1/5] firmware: microchip: support writing bitstream info to flash
      https://git.kernel.org/conor/c/a2bf9dfe0090
[4/5] firmware: microchip: move buffer allocation into mpfs_auto_update_set_image_address()
      https://git.kernel.org/conor/c/e277026b5e2d

And 5/5 too, a conflict resolution seems to have upset b4.

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
