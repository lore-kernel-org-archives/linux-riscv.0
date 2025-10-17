Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5DDCCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:Message-ID:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lzHubndUD7/dnmgItfK3Hoa4yc3yzQWJ8GyC6VRai6I=; b=e2ekJEOf0O1d3y
	gfLnxUaGltP7k/SMH4THozysz7ZHYkWEBMMX7VhLwi9fxUrbJNcA3ScvmnqeeuvYfoFAfyDSAoE1t
	eV2x1IPIrBDgxBzmgC3TJpMmHdp2cGzmznQ/VOU4A6YlIs9AMnNQtPhH1gqAlmvULqRlIkYJKZfKz
	LbsVKSRV56cH9EumKPED3YVOYgG+BBU4cvaxAoOUkGILbtrbA4ZXuWVtNjl1ZYtdKBjg4HyrL9YQo
	NHLu0FSdHb2miwqJSvvL+BevO3qFgp778GibG1S6iX9lcNy5r/IVcIULBdt6lRNS14kYBiDXYrFg2
	9m5LMKUhMXYhs2KHB39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hHq-00000007Omz-2JOC;
	Fri, 17 Oct 2025 10:02:14 +0000
Received: from shrimp.cherry.relay.mailchannels.net ([23.83.223.164])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hHn-00000007Olr-1p7k
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 10:02:12 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 1B9C36C1D14;
	Fri, 17 Oct 2025 10:02:03 +0000 (UTC)
Received: from fr-int-smtpout18.hostinger.io (100-115-140-78.trex-nlb.outbound.svc.cluster.local [100.115.140.78])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3C3AF6C2291;
	Fri, 17 Oct 2025 10:02:00 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1760695321; a=rsa-sha256;
	cv=none;
	b=TXW27wNJt4/+8Z04Lm3g/B7/51r7m4ov5Hc/UNatt+og4skFMW0RvU1WmUC68GvZ4ou5Q4
	pqpiPPX2s/PsF4Z4EHUfKoaABBuNM+mrzvMTvts32X4IjgVsMC35YDkgRG2/0QEyXZZio5
	0VFGnLZ1fgTKwKzm4lUmPBzjzQhUip4uikVgCPSbcoCGPdOjByhQ8LCjSOVdD/Lub5gHuV
	b2DchPuWqtibbt85iukMfqzrCa+uGWIh0T0Qp9RxfZncjTFK88lo3BOTlx5CCXdl3p0FUY
	t6/uqPJrBrZYw1doXZ3hD4cL9g8ExOLXsWhw8jGKs1eIh0OkoKqvYge2Y5R99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1760695321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=qGEnhSheJoEqcu60pi/DEZDDbkSSdNteIImGfsUbqG0=;
	b=azhRVSLZUYzrlPkNxOGK/qhRrOiIXOeEIoT5nyU+EGSR5DvqKCQF5uSgC1fhPxaCosWNjn
	GrWce5r1kunInp4SA+2LSoJn1bl7dQGM1ZKHAbuU8QRlqx0UmD2way+9zxBUzX4ayEiXe4
	URhT7YHBIsfpC4s4GRKN5dC7kb6cPihhLnmRovsxn7M03vC3pWFGbOV+vAr+FE93qDWa1L
	XHAUjur7/t3u6LQcGMsKO48FxCaic2/8Ixaj9irHtLkHo6HDeVmmpPPMx6m6+5wPM3idCf
	PBRI+OaxWADPnAdFDdIJRPpJuqoRpza5a37SGl3uDfZxXP/yigvOC8F1G4egyw==
ARC-Authentication-Results: i=1;
	rspamd-645b74df65-q299k;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Desert-Well-Made: 68ca577f68e21bc6_1760695321722_3278454488
X-MC-Loop-Signature: 1760695321722:2519607227
X-MC-Ingress-Time: 1760695321722
Received: from fr-int-smtpout18.hostinger.io (fr-int-smtpout18.hostinger.io
 [148.222.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.115.140.78 (trex/7.1.3);
	Fri, 17 Oct 2025 10:02:01 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:2f55:e31:2877:ead4])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cp0jF71NLz1yVS;
	Fri, 17 Oct 2025 10:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1760695315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qGEnhSheJoEqcu60pi/DEZDDbkSSdNteIImGfsUbqG0=;
	b=P3uIphv6TuvU2KukoXZfbM9od7ULUFE4AYPgIKnuyF4obnbhSRqDioGmPI64Zf89zgRif0
	3u2pXSzF0S6DpyhIAYVIJS/SSx7i+imJebopwbLG5AFXVWmG9ywVCgFSjB68eMoREeVGuG
	DSST9EL4sH8cCAXKJivr+n4ace7AqSgam7S6Ms45NInHch/oWitNGMxOQ4ZgnIGcUND5+f
	W4strNX0LEx/DgXmbu02MzjwEQZ2UJ4RiXuqkrnrI0pDGqzmlqDROrBYHw/P9/m6Ie3NrV
	CRmZncbEQ041+8pXd0x98LSS1BaEu1pZCmBTP889TV3Zz/k/o5Xof+7xpYso0A==
From: michael.opdenacker@rootcommit.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: [PATCH 0/2] Add Ethernet and PDMA support to OrangePi RV2 board
Message-ID: <20251017100106.3180482-1-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Date: Fri, 17 Oct 2025 10:01:53 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=68f21413 a=/5xBaVTRis1tCxhfvtIJdg==:617 a=xqWC_Br6kY4A:10 a=d70CFdQeAAAA:8 a=O77HVgpYsiCAk9oUrtsA:9 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfCmQ6haBE3+dAHAkeWmDApBDqarKqcT2IJ+xC//tDDrJh3LJGBAaN15EEyhkdCINLm/iuzCZJHIT/uRnnpgn9jHQDIE3MzwPNER0hmQWgzJ5Xk0HEFx9 DrUAFgwnGfvTAQvxGPoQFlpI9KlnxyqbJV96FujsQ2fZ1pQXySJt71pUVL1PoSmn1nKZ2zrzgHr8osOMVW/y6EKlmnPd4PH732WiTJRKoYZeMjBW9R8Tn1V+ 2xJTNfdW11GVOnypyUTjfAgR/csr47k22jrLj3+QpFy/lXftw8VIQBBswcmTpoM31hQaMLidlVGgogBhp7uL0/r0PzpNtHO7hcokyX2nSqSaKfBvvOcv1D6P NHCqluIJWS9jSh9to49ozTtJyCEDo0M/whj81QDza4xkYfVKdpxe8bmdh+2flyWGLk5tWsWun5EReP4ejYr0qLHywozrRlWYs906nzzC035FVpgXraDG3z5h /kXRG4daMtfBE7G/CIIHLesElYzMcxOhcpJPLrgsAYoi3oO70Pf0WfbS5WI=
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_030211_724307_A7090740 
X-CRM114-Status: UNSURE (   3.15  )
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

From: Michael Opdenacker <michael.opdenacker@rootcommit.com>

Tested by booting the board through NFS with these additional
kernel command line settings:

nfsroot=<server-ip>:<path-on-server>,nfsvers=3,tcp ip=<board-ip>:::::eth0

Michael Opdenacker (2):
  riscv: dts: spacemit: add Ethernet and PDMA to OrangePi RV2
  net: spacemit: compile k1_emac driver as built-in by default

 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 50 +++++++++++++++++++
 drivers/net/ethernet/spacemit/Kconfig         |  2 +-
 2 files changed, 51 insertions(+), 1 deletion(-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
