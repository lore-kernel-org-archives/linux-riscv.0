Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC6C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 09:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYbYa0xwBVOWOswo41BHXvnVDVY2sCnt+D8sWw6ki/w=; b=pMrI6Ga8YaQ9J2
	QpowwmC9owJLsR/ZLyefoDbNtM9E2EBTJS5yzXUyr0UkfoQ+k1ByTtOFZQeCwp5KtghRq9ddu1NKj
	ZLKF9SQNEqZzOqoqtQOLd/59p6EMyZUZ+eKBbMAgVjHj1qvmoKi/OEUzyGseHE3knn308q/q8BhjF
	ISc9Lm7DAy+MQYyAP+S67fu6JoNb2XWh07ZIrs7VMb+2/BxL2FtQY3/LEXEVRvfeZEFl137nfk6zj
	3AFeJtOYFbTpyM7/qgwxI4/YLUsmL6wHj+GAyBwUfaaJMdBxnuWnTQ75g8OvK7j/UNKHBXSnK9tGa
	Y0qTvTmz5TdwuFTKcsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxtU-00000000IvU-0qVo;
	Thu, 08 May 2025 09:50:20 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxQG-00000000Ere-0XEq
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 09:20:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxQ4-0003WE-Tb; Thu, 08 May 2025 11:19:56 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxQ3-001hZx-2i;
	Thu, 08 May 2025 11:19:55 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uCxQ3-00049l-2O;
	Thu, 08 May 2025 11:19:55 +0200
Message-ID: <5a72aff989d9e3e00fdae7a66c39e746db2bf501.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] reset: canaan: add reset driver for Kendryte K230
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Thu, 08 May 2025 11:19:55 +0200
In-Reply-To: <20250507-k230-reset-v3-2-c85240782ea5@pigmoral.tech>
References: <20250507-k230-reset-v3-0-c85240782ea5@pigmoral.tech>
	 <20250507-k230-reset-v3-2-c85240782ea5@pigmoral.tech>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_022008_166705_6B06F6D6 
X-CRM114-Status: UNSURE (   6.32  )
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

On Mi, 2025-05-07 at 21:25 +0800, Junhui Liu wrote:
> Add support for the resets on Canaan Kendryte K230 SoC. The driver
> support CPU0, CPU1, L2 cache flush, hardware auto clear and software
> clear resets.
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
