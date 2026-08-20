Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3233EC5DF82
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 06:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sGN7abj2bkulvnzznoyAMv97GRYAFbARrZhusS0sXg=; b=xvq54trH4rimgg
	Z0cB9trCaU3b5X4F4DaeNdt8VrolIPOhDgZv+7NqpXC7Pff/TOh2YYbu1/tiZVTewt0emD0QLj7Cy
	IVbnRjFtMi33cQ/IsRbml9FVOK54z0t+WVuahafjWgtRw5KFItmybpSfPfB14xsOLdQ9oEyCKOo+R
	YAceyRh6hdmC7E77DP13r0Sj1Soh4EijrpKhCDahZ5C6jOphu9BPSLk6dAM/qj2y7FjSJA/mLlbuj
	dKNxvG/eLwEwRGIys5KChCXyNPDCenMl/IBsFvzh5FW8JSM6zPfaEMRrOtX/p+9dFPbUXzLT4N/WH
	X9P4f1CzVqcR1dbdmO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www0T-0000000Auzq-464W;
	Thu, 20 Aug 2026 06:12:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1www0T-0000000Auzj-1fha
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 06:12:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9963360A84;
	Thu, 20 Aug 2026 06:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 406361F000E9;
	Thu, 20 Aug 2026 06:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787206324;
	bh=8cMcgXFjzqn4OTSHoue7n+IbE1w0j0pCNeVFbh6GGlg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=CJgwjULFFMWgz2kF0kKg1mYwFqhGiXf+W/uplILwyBcQ6+bRGop3IYO9VeROfQqCh
	 jiXx8rXKlp77C2oVPry6wfaaiQWTRghUhGKMvrrOWsQM1YhEOatS6R5Og920ajecmX
	 ah3/iHbJ0gk70gwPZ5oOI1E0TAhwanBlJj5ewtT+2DzRzj6+4fLv8RSwUNnyZ8leXM
	 W7dJBntqLPlJE8UsudvKTjX4ABSvZ7mudYmkvsJqri5unGr6r5WtgI5DZ8nJqlLfjs
	 gyXvSDEolDiia4TIEfahxYwnBBrBwvHS3gNKJJJ0Z4H9/obIdgwhAz3/3bXwrFcl21
	 GWD0OQFJhxsdw==
MIME-Version: 1.0
In-Reply-To: <20260814092211.2158337-3-pedro.kopper@microchip.com>
References: <20260814092211.2158337-3-pedro.kopper@microchip.com>
Subject: Re: [PATCH] clk: microchip: mpfs: fix regmap_update_bits() mask/val order
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, daire.mcnamara@microchip.com, mturquette@baylibre.com, bmasney@redhat.com, valentina.fernandezalanis@microchip.com, conor.dooley@microchip.com, pedro.kopper@microchip.com
To: Pedro Kopper <pedro.kopper@microchip.com>, linux-kernel@vger.kernel.org
Date: Wed, 19 Aug 2026 23:12:02 -0700
Message-ID: <178720632220.4726.4647859230125526989@lazor>
User-Agent: alot/0.12
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

Quoting Pedro Kopper (2026-08-14 02:22:13)
> mpfs_cfg_clk_set_rate() passes the mask and value arguments to
> regmap_update_bits() in the wrong order. The resulting write becomes
> reg = orig_reg | val, causing bits to not be cleared if the clock
> divider changes.
> 
> Pass the arguments in the correct order so the divider field is updated
> as intended.
> 
> Fixes: c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")
> Signed-off-by: Pedro Kopper <pedro.kopper@microchip.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
