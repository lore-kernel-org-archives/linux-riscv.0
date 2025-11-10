Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A6DCCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wjlLnSc9zquJwXANHNhqObV1ryS7H1phkhZHbcMWqgc=; b=EvnK4ip81+WZVpFdnN5VZKwLoA
	yv/QLKZwMRg9GPq2418t5VvkeRDpmQHZybnzD6dYc4hZPH/rNvNNLiAaGrmUJhe5h/vgV4dvLVXoM
	Scz6tTym7QC0ICoVTtLmw+Doe0YNrPwXdJyQxMg9w25ANEFTMjGoYQnrR8LFAFU+MIfdktfaDFuX+
	Gy9F+7meEdidztBljYU3x1tK+STZlWKnJz3JDrANPHi55B/+WmXcNJYT+PInyjY4lIuw8xMUeoU+a
	bJ67gPhL+PlMz+xZCM99zAyxHEDpzw+Udv04qKgxkpBgkyh8DUaoSKMMjQfiQ6EO+WMtoFGgvhcpC
	xYCg/+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOrz-000000059ZR-3OGi;
	Mon, 10 Nov 2025 10:11:31 +0000
Received: from egyptian.ash.relay.mailchannels.net ([23.83.222.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIOrw-000000059YO-1TXg
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 10:11:30 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0FDF24610B4;
	Mon, 10 Nov 2025 10:11:26 +0000 (UTC)
Received: from fr-int-smtpout19.hostinger.io (100-124-152-27.trex-nlb.outbound.svc.cluster.local [100.124.152.27])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6535A4618CC;
	Mon, 10 Nov 2025 10:11:23 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1762769485; a=rsa-sha256;
	cv=none;
	b=nRLB6YBrKv1gNpsdHHYHa2Qin4+LoX7V2CnJOsadfIzntZ0XsFS2mTpu1svs55MPbD6a+W
	UlT90d6S1M6Z7TdxJxdbtsoEwTezXHXr5/alYfYeSPBTLGZjIARbebdb5CMO7XA8LSLX7e
	mBa/RE3UAPz5d3CvGbQ3fiME+ugQe50s3ZeH7HUs0wtZ1Ma+PqlfThanNTQIp8w4ARJSyT
	zXZ9/S3xfiso0gd3LmbxM7wp6LplQOpI4qQhjeVXxfSapUmrMf3EGIDzksc8H6S6gqMOcM
	1qjwt9bEh9DY2mfb/3jeQQder8zrDXDHdZ4RO2VYcufHFKROKymNCGGEy0a2Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1762769485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wv3nqbaAcoK237kl6M6hgh2lZMBA0q3s8XRwe89wOGs=;
	b=ouvUe+TOSC/n7x949nM35FzWp3wtM3ji+V99CAJo5qVHBETkUmIIyWgOM9g2pT/dGYGLxb
	f20MeUz6wKGZwMaZVVb1rhtf6JaoKI42AiAa6Ip7oiU+dJaPs3ora6/7XNDeUC7TEz79/g
	V0C+GCA6GVsbp4EwDWWF+DYA9VcLEMwZWZhCZIUbb2ucjIBkL9PUHX7IC2GHTCV9QUE2f+
	iNjnYBFiRcxshnC/LsABR+r6kw/elGqj8j3vejqkebmYBVcLYOy8B9fDVkonsUprZkNuSl
	1c3yWCeN8hkWdraBNNfOjqc6rsq4ZTECes2CSAH6l7Zvhk/vbMXvPrPWOBZBlg==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-r7qnn;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Tart-Spicy: 172f72206bbb80f7_1762769485924_4217622453
X-MC-Loop-Signature: 1762769485924:2509645552
X-MC-Ingress-Time: 1762769485923
Received: from fr-int-smtpout19.hostinger.io (fr-int-smtpout19.hostinger.io
 [148.222.54.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.152.27 (trex/7.1.3);
	Mon, 10 Nov 2025 10:11:25 +0000
Received: from localhost.localdomain (unknown [IPv6:2001:861:4450:d360:7d90:b645:1639:d009])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d4ln45wnJz1xxR;
	Mon, 10 Nov 2025 10:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1762769481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wv3nqbaAcoK237kl6M6hgh2lZMBA0q3s8XRwe89wOGs=;
	b=KyD/G4sZrY3FoJOXp24zKmDhvUcwjt35jtW90wNhh72vXf+GNweIbJ5FykHHOyOWkR01Rc
	mujg41iHMrzwezeEkl+esmKcTWFJDAUKoQsaZCAm9usWElgXusX1bgSpgvq0z4QA//GLUq
	4/+Grv1U47vHQTIj+nOvrTcbV8vPtX05Pvz++w+qW04cZ/B/OSXP0nT2HsbdgO40+1/YOK
	YEwm537AUK/C3U0ZFStfxZ4LCz0ZzsOxJ//hEovsyoG6uqXBbo0m7w06MKVW+S9r2NK5B/
	f+wed+Hn9+LVe60LJKcwsR7q40oxXkJfQOU/W/LS2Bhrn8IfLvjVAK7lLp9w8g==
From: michael.opdenacker@rootcommit.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S board
Message-ID: <20251110101110.948198-2-michael.opdenacker@rootcommit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110101110.948198-1-michael.opdenacker@rootcommit.com>
References: <20251110101110.948198-1-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Date: Mon, 10 Nov 2025 10:11:20 +0000 (UTC)
X-CM-Envelope: MS4xfKatZgfJ8jxp/fEczryQ1HCdtNpCrfQ4+siPi4GjxU1OYoXHupJHe/BWZ3ZKT8zMiKFQ2MoJxWEVQJFR3DqjbGhVbDwmqEyohlPobaLvBfDY3I187Dx7 ffsGa7LJRQAv03F1tz3Ot0DZAhoaSc3X0U7ZNgOi9JRIFhhM6pU77getIgJ+qqkdl0n3Y+5lcFMmtu480pjJnUtnskkJzphLYG1ptLuvGCk2uN9Z0N+UPYf7 jETQeBY6GDXWuyQeHEjOMeBUnDOVKhsPTGO1gJyW05Z/Zt2di/OcCO+YxSXzXkRP5zMXRzPF7dbeQAluV7NbY4R2ymBvSZ9SX6mhRdY0MRClZzu21YsrQ3yU ziyvKkxcjSvVqix6S3rY7gGb8Jhi5rWQLDqSZke76qHMmv/WR2MAmsd6bXDNjGtSkjEfV/8ZY6UFhMX84AtsxNuZ/pjKudnsqWkFwl+FY/5o5CoVQ8pP6IU6 lNn0dxN0kKjNjqElPXfrxB8ev/L2HGI0c669r5Hnztg5W5paTBd9AowlIpaOWpwIFaJYEOfXYCXyRcJCl10i6DqyZcYkaihLSZYAeVmwJjT+k67LuWF3en8C 95wXW4J5rNJQdMG0WVfuhqp+oNatc3POcQ8jrVhZwN9afeMGD2HjwDTLLbc6UDkUfmv7+r73+JH1Kwz1Yi1kPFWmOMP3tp5ufl48D660kt/xCMoGYZQO8snH E5PF5/pAiGI=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6911ba49 a=G6G7neK3IwemRqrlzYSHdw==:617 a=xqWC_Br6kY4A:10 a=5dAzR5NRAAAA:8 a=lv0vYI88AAAA:8 a=d70CFdQeAAAA:8 a=ahLzFxuTVLoCwVWoPR8A:9 a=9STjDIb-X-UA:10 a=ZKAZAlVgJm32z6MX8p4a:22 a=9qqun4PRrEabIEPCFt1_:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_021128_653508_96E4AD43 
X-CRM114-Status: UNSURE (   6.40  )
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

Document the compatible string for the OrangePi R2S board [1], which
is marketed as using the Ky X1 SoC but is in fact identical to
the SpacemiT K1 SoC [2].

Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
Link: https://www.spacemit.com/en/key-stone-k1 [2]

Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 52fe39296031..1b2f279d31f9 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -24,6 +24,7 @@ properties:
               - milkv,jupiter
               - spacemit,musepi-pro
               - xunlong,orangepi-rv2
+              - xunlong,orangepi-r2s
           - const: spacemit,k1
 
 additionalProperties: true

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
