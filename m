Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F8FCCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 00:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgKSZ2A5uyo0aQSlzy0l39eWPzT5V0WDfs1YXs1tzQY=; b=q30WSN1q+Ju1Xs
	zZqhAcX4m0mJj9j95ZUcY4dW/KpKtnjwle+66bTDBXKYML7VBNJs5oaCa5KtsZV4K4dVmtmefSowh
	a63r5LMcAeZHWRhyXq3SUiwNZHD6e46e62LvW6MVmV1gBYocJD18OHKYOwxYaT3cTQyMNq9rmbb7n
	9mtIt+JAMGS0F/zvZkJmc3TGruW5ltRDiuj5rV3kt/v/LaovoVuWcdr6rB/O3nTrdwZ0627HQ0wkc
	ovQhUB5NnsbsEtAao7EG1HEU3EhzakafUP3ycSq2cX9zHbxkrrlLmctySYw9uDD2nnX8qeJcJ4Nda
	LYVIQSQVojUlwwdXXqTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFikX-00000008yYB-3Mi0;
	Mon, 03 Nov 2025 00:48:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFikU-00000008yWh-345J
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 00:48:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD34444953;
	Mon,  3 Nov 2025 00:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F55C2BCB0;
	Mon,  3 Nov 2025 00:48:40 +0000 (UTC)
Received: by venus (Postfix, from userid 1000)
	id 76FAD1822DA; Mon, 03 Nov 2025 01:48:33 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev
In-Reply-To: <20251102230352.914421-1-aurelien@aurel32.net>
References: <20251102230352.914421-1-aurelien@aurel32.net>
Subject: Re: (subset) [PATCH v5 0/2] driver: reset: spacemit-p1: add driver
 for poweroff/reboot
Message-Id: <176213091347.301408.11587695003687450479.b4-ty@collabora.com>
Date: Mon, 03 Nov 2025 01:48:33 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_164842_795098_F511C281 
X-CRM114-Status: UNSURE (   7.31  )
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


On Mon, 03 Nov 2025 00:01:58 +0100, Aurelien Jarno wrote:
> This adds poweroff/reboot support for the SpacemiT P1 PMIC chip, which is
> commonly paired with the SpacemiT K1 SoC.
> 
> Note: For reliable operation, this driver depends on a this patch that adds
> atomic transfer support to the SpacemiT I2C controller driver:
>   https://lore.kernel.org/spacemit/20251009-k1-i2c-atomic-v4-1-a89367870286@linux.spacemit.com/
> 
> [...]

Applied, thanks!

[1/2] driver: reset: spacemit-p1: add driver for poweroff/reboot
      commit: 28124cc0fb8c7dc01a6834d227351e25d9a92c58

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
