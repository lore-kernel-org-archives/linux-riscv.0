Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B0EC369CA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 10:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dyxOpAyVtaaC51k+o4AY06f+Md4a09qZayn3m2CfrTY=; b=1pFdu5bOcD6nXz
	hQ3+tHP2HGg1mT4A0jlWfMlNOHwNtK9ligIBa3TdQe5Aj+q7x6WIenaTOAhZUgwzmpvpfqh7mJyQR
	FkX7dBNhZ/MS9L4mEZibenv65sTG4YLToAO0wYk7715TJGIWDqwGB0yFVacgo/6I5lf2EaCSJ2Q6e
	rGHRv/5Ms6F0WFXttdFetAvMDrMqJcuua2a7Fk6peN/EJsdQuL5E7uVCLJqlLUzHXTOeFpffCjlW7
	bRw12mbfWV+mkzKJ0INihhpYPIddywFye7GiE4GUun3owV34juV3QlHOzu1Q0HguIRDyklaSxOU/v
	CVeVkc8GkwhxP08TgFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stPOJ-00000004lCs-0vPI;
	Wed, 25 Sep 2024 10:37:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stPOG-00000004lCW-0HCR
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 10:37:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stPO5-0008UY-A5; Wed, 25 Sep 2024 12:36:49 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stPO4-001QZj-28; Wed, 25 Sep 2024 12:36:48 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stPO4-0007Bn-01;
	Wed, 25 Sep 2024 12:36:48 +0200
Message-ID: <dcdab2a4e6a5eda99ff5e9523ccb9c6edcfbf732.camel@pengutronix.de>
Subject: Re: [PATCH v2] reset: starfive: jh71x0: Fix accessing the empty
 member on JH7110 SoC
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Emil Renner
	Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
Date: Wed, 25 Sep 2024 12:36:47 +0200
In-Reply-To: <20240925095929.1729726-1-changhuang.liang@starfivetech.com>
References: <20240925095929.1729726-1-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_033700_124253_B3C42031 
X-CRM114-Status: UNSURE (   6.59  )
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

On Mi, 2024-09-25 at 02:59 -0700, Changhuang Liang wrote:
> data->asserted will be NULL on JH7110 SoC since commit 82327b127d41
> ("reset: starfive: Add StarFive JH7110 reset driver") was added. Add
> the judgment condition to avoid errors when calling reset_control_status
> on JH7110 SoC.

Please add a Fixes: line to make sure this is backported to all kernels
that contain commit 82327b127d41:

Fixes: 82327b127d41 ("reset: starfive: Add StarFive JH7110 reset driver")

> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> Acked-by: Hal Feng <hal.feng@starfivetech.com>

With that,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
