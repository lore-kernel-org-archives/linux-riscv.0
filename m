Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B33C982D8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 23:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVWhhisLBhN/nuI9dZqVQnqKcbLfUaocUsnv8//5brs=; b=z7smXj43m1Xgfi
	nI/uOI57UsLMVBxXPbc7L5fepRBOutFzSd+su1y40H6ujdsek/KEEsvEARQtb8kcuv6CPfzqJ2Fzw
	tBRn8JEysYYyecTQ5kGoScKR3Am54qkB5ce944l+ZhZZu5R3zC0/y38Hpk+tHM46G+RYYlg5j0qWJ
	v6AG7PpuCd/Mj+5+kY+PvAjJZNwtZOe+sTpYU7UX9UFptnQay7ypzKsrdPGjP43OU1w80OMoehKAW
	oTYAbW+UiLHcXK2mBJ5ozheRi5R07F9ve+VDrfYCyKfmjbnc6izvYkqPWeiyQb2VmxylVON49cFtV
	Y0VEg0Qk+Nb5rFETDzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iCK-0000000Fi2v-0QZC;
	Fri, 18 Sep 2026 23:40:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7iCJ-0000000Fi2m-0YFA
	for linux-riscv@lists.infradead.org;
	Fri, 18 Sep 2026 23:40:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 80E226053B;
	Fri, 18 Sep 2026 23:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF251F000FF;
	Fri, 18 Sep 2026 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789774850;
	bh=7/OmzgRdcVgmVYiDhUfrz6X0XSFQ8iwDW84lgQNGZnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z0pkNeyZsEAbbj461SlBcKzBNGBOi1V1G5aAeOzsKiKJDrzZC2eWAaZxr1NfBe26m
	 PLw2+t8iAdcBuqQsCV5FaeLT3uxlDTE8x+elEsOWEsf6r4FVuA2E0lP6VcXcXkiVV7
	 FqMteFnGjbgFFRteci4HWCZFs01S7OUwmDaW0MxpU1g/aiIjPk88V5rnMuL6M0MbEj
	 SOb8depbGNKUzbreROneazwJPYr6OFA3oSKrchc0hasLF4mZtYLR38mdqOmQjS3aCG
	 dYKOXwpN/325KtHBmzo0crwHMGiA/MHh8Inm8K7LS9DwnjBS62NsOVI5nl0J/Ysl1T
	 vCIwo/gZJcDFw==
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andre Heider <a.heider@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 0/3] riscv: dts: spacemit: add cpu scaling for 3 boards
Date: Fri, 18 Sep 2026 23:40:45 +0000
Message-ID: <178977476488.1116261.11214063403240767107.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804133236.205668-1-a.heider@gmail.com>
References: <20260804133236.205668-1-a.heider@gmail.com>
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


On Tue, 04 Aug 2026 15:32:31 +0200, Andre Heider wrote:
> This series adds cpu scaling for 3 boards, each authored and tested by a
> community member on their device:
> 
> - k1-musepi-pro
>   fixed include order
>   v1: https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/
> 
> [...]

Applied, thanks!

[1/3] riscv: dts: spacemit: k1-musepi-pro: add cpu scaling
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=2961d968d0cf1f8f696e822b900943d6c1072a66
[2/3] riscv: dts: spacemit: orangepi-rv2: Add cpu scaling for K1 SoC
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=e56e2800e994d251486a3988209e07a711eb95b7
[3/3] riscv: dts: spacemit: orangepi-r2s: Add cpu scaling for K1 SoC
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=4947ee60bf48caddf5caefc08dbbc84d09fbbc6b

Best regards,
-- 
Yixun Lan <dlan@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
