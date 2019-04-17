Return-Path: <SRS0=fLp7=ST=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69729C282DC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2019 16:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD5B20835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2019 16:55:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YH0Ff6eh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="QIgJrEdF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=akkea.ca header.i=@akkea.ca header.b="ibfYq1L9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD5B20835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=akkea.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5vOVR5sXDzXpkd7YE2KcnMbZ1GvnW3gVkLO8DlFI4zI=; b=YH0Ff6ehff37dPP+FmnXY1ZkvU
	OquIn34S3mb2HpYZ6fZrWke4nYtMfXWeO3JzYPJpbarj0+JdCRZVkYOgasK4bJZcYmq4vYcmOZ1NM
	tucjz2rPnNo9JHanHmIW8K1yjMLYp4wVxirwbGDQAgKSXfhz6jYBfd0Yf1F/a/doX3VfcyoFYV7KF
	s/DYob48GHGgoOSDrUxrTWVomscioVBdGMwiCQByhVOj+BoAjagyNaWlH8KP1/HXy3tQ+tBIYW/Ml
	Zcnk9ahDdvU9DJC/RwaNGF+IgHdEIDGdOOHOqQelCavFkUsi2ZZtCvKrTEXdYJi+tQYerbeYz3Qb+
	iF8mgjlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGnqW-0004EQ-Qq; Wed, 17 Apr 2019 16:55:40 +0000
Received: from node.akkea.ca ([192.155.83.177])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGnqI-0003wX-E6; Wed, 17 Apr 2019 16:55:27 +0000
Received: from localhost (localhost [127.0.0.1])
 by node.akkea.ca (Postfix) with ESMTP id 420FF4E2056;
 Wed, 17 Apr 2019 16:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1555520126; bh=kefJ10uT59admwoknv1hs5rk9yWioJDK7dziWO0gvdA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=QIgJrEdFxgOx6s9vpm775UDCobbGWGTDIyWrXccfAKfWs8GU2nupDD6DVFgwDYiqO
 nVob+6q7sdP7muY8HW1TxJxb0pfMPPRWI3iyP4GUYIPADDhfTvU1fWd6ky/UnAbIsE
 ZljVy74IUkuTIp0G2uLIRc9zL+D8thCZ2J4h+g9w=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
 by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbzLa_ohFWT7; Wed, 17 Apr 2019 16:55:25 +0000 (UTC)
Received: from midas.localdomain (S0106788a2041785e.gv.shawcable.net
 [70.66.86.75])
 by node.akkea.ca (Postfix) with ESMTPSA id E03E34E204B;
 Wed, 17 Apr 2019 16:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
 t=1555520125; bh=kefJ10uT59admwoknv1hs5rk9yWioJDK7dziWO0gvdA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ibfYq1L9A3iISZGVT0wVMwNhjy740i/SlzgEEFzGY05klbo+/vyKOFPkSNRMPNjfc
 HpKjSr/KdcTsdYsEPBVq0t5sVi0ULQ42YmawyZDkexHBjwQ1YTE6tHfTtOMrziMoqF
 jnOecpPuII5LigKBiqQh+gJFQOZBVhEI4DLP89dQ=
From: "Angus Ainslie (Purism)" <angus@akkea.ca>
To: angus.ainslie@puri.sm
Subject: [PATCH v5 2/3] dt-bindings: Add an entry for Purism SPC
Date: Wed, 17 Apr 2019 09:55:13 -0700
Message-Id: <20190417165514.18689-3-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190417165514.18689-1-angus@akkea.ca>
References: <20190417165514.18689-1-angus@akkea.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_095526_529146_13F3E124 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Jacky Bai <ping.bai@nxp.com>,
 Palmer Dabbelt <palmer@sifive.com>, Bruno Thomsen <bruno.thomsen@gmail.com>,
 m.felsch@pengutronix.de, Guo Ren <guoren@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Aisheng Dong <aisheng.dong@nxp.com>,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add an entry for Purism, SPC

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 40f632db7bc2..44ba42e48007 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -331,6 +331,7 @@ poslab	Poslab Technology Co., Ltd.
 powervr	PowerVR (deprecated, use img)
 probox2	PROBOX2 (by W2COMP Co., Ltd.)
 pulsedlight	PulsedLight, Inc
+purism	Purism, SPC
 qca	Qualcomm Atheros, Inc.
 qcom	Qualcomm Technologies, Inc
 qemu	QEMU, a generic and open source machine emulator and virtualizer
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
