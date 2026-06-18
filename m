Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692CBCD98F2
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BmbdUyxIW5jBooID1Ggdy8MWswzFmo/J72l1Htv4+Y=; b=bY2rY3OATqnOzW
	alE32gwzhISrgfem5w9D07H1gHynm2NtUJtFcJvmebJqfVeGNcC9BIGD9ll/LKXlY9bpEUbySrN9s
	GTCU+fOPhZKYHoJBNRhCnNF0BGnSZmLVj9pW1cGiEu2NzHJwRlhz1C3Y5QXUodh3AIRazQOujnx3N
	+fBFpIZblqFmQR3A//rtEauFgROZf5DJUr0Jao+ObIv2pgdL331yCF82dnXdJcFeg0j3Gr4I8zoEi
	NYZ1on1XxJftTM7bASuoOxue/lm78lrRAYOydzO2sVEFF3guz6hqkKpRflJLyfuJe2pLleZI+NDH7
	QlOfPQ7AcGRdd0UYXWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9kj-000000014YY-31CX;
	Thu, 18 Jun 2026 10:13:41 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9kg-000000014YB-22iv
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 10:13:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 768E7200275;
	Thu, 18 Jun 2026 12:13:36 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9ke-003QAj-1B;
	Thu, 18 Jun 2026 12:13:36 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wa9ke-0000000068k-1BWP;
	Thu, 18 Jun 2026 12:13:36 +0200
Message-ID: <0af47f978c8a93165cbdbe4ca88a186acbb35157.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] reset: spacemit: k3: fix USB2 ahb reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Junzhong Pan
	 <panjunzhong@linux.spacemit.com>
Date: Thu, 18 Jun 2026 12:13:36 +0200
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
	 <20260518-06-clk-reset-usb-fix-v1-2-14fc235e692b@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_031338_697557_4E1DE21C 
X-CRM114-Status: UNSURE (   4.83  )
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

On Mo, 2026-05-18 at 02:58 +0000, Yixun Lan wrote:
> According to SpacemiT K3's updated docs, the USB2 ahb reset and USB2 bus
> clock enable bit was wrongly swapped, the correct one should be:
> 
> Register : APMU_USB_CLK_RES_CTRL
> bit[1]   : usb2_port_bus_clk_en
> bit[0]   : usb2_port_ahb_rstn
> 
> Fixes: a0e0c2f8c5f3 ("reset: spacemit: k3: Decouple composite reset lines")
> Reported-by: Junzhong Pan <panjunzhong@linux.spacemit.com>
> Signed-off-by: Yixun Lan <dlan@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
