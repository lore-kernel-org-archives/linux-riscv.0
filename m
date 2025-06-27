Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E942C83028
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 17:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ELm9L+/L8FS5v1sJt7O2y4frib5cx1SNszWAGvozPFY=; b=Lho/+zcPBZSvth
	d3JUWVgzDXKpvH0HGHQQ7qBw12baGmaXIvoeJDaqdpcvhzXIsuH1ppqaLtcWL4l9hIqHQybVkEaQ+
	F72qgUeYowKTonMwjyI0qnl2+VqqEQ5b4oxEWr5pTQ6KvbqI4WHEkWNkTRX0eyWV3sPsV3tJ3ELq7
	sGzD/4ALoZLUhjH5x/47ALRFTBSksW+rvzq10QqU8TWeYHwoA8hbMw+rbln4f8wUrAEbl53BALh7l
	1W5MzNhnsXluErt1UgQ7yv2DK4wSQuxy9QtMKCHJDL2dio2wKlt9lq2zujWk+3odPELEpP5cEG4JZ
	rN9G6uWLOSCjiJfGY0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCnp-0000000FOrf-3gLj;
	Fri, 27 Jun 2025 17:23:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBq9-0000000FF6N-1n42
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 16:22:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpq-0007BZ-Jn; Fri, 27 Jun 2025 18:21:54 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpm-005e59-0I;
	Fri, 27 Jun 2025 18:21:50 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBpl-000QYv-3A;
	Fri, 27 Jun 2025 18:21:49 +0200
Message-ID: <e569866ba4a2290b89b5bbd427d5cee71364612d.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/4] riscv: sophgo: cv18xx: Add reset generator
 support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Alexander
 Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, Ze
 Huang <huangze@whut.edu.cn>, Thomas Bonnefille
 <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Longbin Li
	 <looong.bin@gmail.com>
Date: Fri, 27 Jun 2025 18:21:49 +0200
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_092213_469334_30D9674A 
X-CRM114-Status: UNSURE (   5.58  )
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

On Di, 2025-06-17 at 15:01 +0800, Inochi Amaoto wrote:
> Like SG2042, CV1800 Series SoCs also have simple bit reset generator.
> Add necessary code and bindings for it.

Applied patches 1-2 to reset/next, thanks!

[1/4] dt-bindings: reset: sophgo: Add CV1800B support
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=5a5c61f7ef96
[2/4] reset: simple: add support for Sophgo CV1800B
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=811fe8ad1db9

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
