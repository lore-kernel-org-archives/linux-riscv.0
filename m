Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA13BC83027
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 17:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OWFgnsKpK8N22GEWbEtyjGVXR8s9/hzLSTJFvPQIgaM=; b=aKZAIqTWCIMUes
	e2vF1SmK/t0vRAPus/Q4YrXkXL/wMt9QO9HNjJksC2IOx+GfzujNgpnGmsCthNXnbs3WUEhADHj+G
	FruVTp449ZBwoLBC4EKhmWmUZkWTpf1S/vT59eju10aZQAbqRpDhFaDfePlHuj/pAlBvBD0z8sHpe
	PQ5lKEjfIre66CCm0x+Amh2+DNu73/O5PhuDMGL1jsZiefE+yM2771olj46xRfM5Ooz4XGMR9TWy6
	l2/f/V2f1zshv3zjhKWbsTtSETIaZ+56TVzpfho0Z31BKWyXj80G+4ftOGgxCK/dQGtzWAiasmOh+
	s2okpyGcEoH6ykUeCSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVCno-0000000FOqP-2bDe;
	Fri, 27 Jun 2025 17:23:52 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBkf-0000000FEHI-2IFD
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 16:16:35 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBkT-0007a9-Rg; Fri, 27 Jun 2025 18:16:21 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBkS-005e4J-1v;
	Fri, 27 Jun 2025 18:16:20 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uVBkS-000QFX-1g;
	Fri, 27 Jun 2025 18:16:20 +0200
Message-ID: <52a7648a2c86c39189012e5379c53b4362b1f9cc.camel@pengutronix.de>
Subject: Re: [PATCH v4 0/2] reset: canaan: add Kendryte K230 reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Junhui Liu <junhui.liu@pigmoral.tech>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>,
  Chen Wang <unicorn_wang@outlook.com>
Date: Fri, 27 Jun 2025 18:16:20 +0200
In-Reply-To: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
References: <20250613-k230-reset-v4-0-e5266d2be440@pigmoral.tech>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_091633_582490_DEF240ED 
X-CRM114-Status: UNSURE (   6.82  )
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

On Fr, 2025-06-13 at 16:49 +0800, Junhui Liu wrote:
> This patch series add reset controller support for the Canaan Kendryte
> K230 SoC.

Applied to reset/next, thanks!

[1/2] dt-bindings: reset: add support for canaan,k230-rst
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3c2968fcd72c
[2/2] reset: canaan: add reset driver for Kendryte K230
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=360a7a647759

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
