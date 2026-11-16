Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BF606A31C
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5EdiUlm8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=FXEdP6im
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Mime-Version:Date:Subject:
	Message-Id:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=5fHkyQaP0ziXCatbZH63sD2uWpEMlZuhErzODDaujoA=; b=5EdiUlm8Whho2M3xrukUEGP8DT
	ZjndXmZDO4tahxtsFVyOwCJHBEgEBmYSmnTzx4vQb6A0i+p4FCb3TkKbHYC1H36E5S8vSGnMGCjc/
	icRHUY2q5so4OKtiKTcK3SqATeUESdr0LV5RaVIXo/SUiBN/lbakktmtG4Qo+0Wisovt6mdI/z2R1
	HRvd4HzQFcEms2Mjr8khQ3fZ8hsV69bF4UERcn6SOpl6gRjVjq07wgsLYeUbaYAXcSi58UKrN59Qn
	cXTxgYRAVS1+kOTpWB9LnLbHXVb6/kfWdZKiWDJlK6GGGKbOmSwxfx/j4COnPirhwuRLuGao40N4R
	nDsK+bcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsX8-00000001gdM-1e1n;
	Mon, 16 Nov 2026 08:57:50 +0000
Received: from va-2-28.ptr.blmpb.com ([209.127.231.28])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsX4-00000001gc2-3lcJ
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 08:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819454;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=BTcZk/ysXO+x/psVKKTgMfCcFG9OUCtxSRwx0yIpMrg=;
 b=FXEdP6imxUa80WWfC+36CeHIOP2D7V8thM9xwarmZts2uMZVhoct/Y7OADD7Ck5PPr6Q3D
 xjGB8BJWSsE/W2STuHBeHXve38RtKUI7ocAohE23bUOZkFijUtPn1Y15TvFazNmhFU5gNF
 er+fPmFd8/1AQasJb0jnUzQ6e88/EoJpYcqIskOPWir1+Ng3Wv9eGbNtXVxTmiF23v+qJL
 ZP2cUgAhbGPjLr7ea2cpwU3sDYoZWSX8KwDH6kgbK5EIo4MJAQumJvMJWJWlrk5GtQWgRO
 mXIfAfBx0yIA/q/8WzdFf24ImAlgu3QYwxXs7HjJ8nROVRiFU7hqlPTpJ+0m1A==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Message-Id: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac57c+edce75+lists.infradead.org+sandie.cao@deepcomputing.io>
Subject: [PATCH 0/5] riscv: dts: spacemit: enable WLAN and Bluetooth on DeepComputing FML13V05
Date: Mon, 16 Nov 2026 16:57:25 +0800
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 16:57:31 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_005747_013421_3181668E 
X-CRM114-Status: UNSURE (   4.11  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series updates the DeepComputing FML13V05 device tree to describes
the console UART as 115200n8, add rfkill nodes for WLAN and Bluetooth,
model the 3.3V supply of the WLAN module, and enable PCIe node.

The series is based on next-20261113. The DeepComputing FML13V05 
device tree depends on [1]. The PCIe driver depends on[2], which 
in turn depends on [3] and [4]. The PCIe node depends on [5].

[1] https://lore.kernel.org/all/20261109033154.361399-1-sandie.cao
@deepcomputing.io/
[2] https://lore.kernel.org/all/20260929083755.458238-1-inochiama
@gmail.com/
[3] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/
drivers/pci/controller/dwc/pcie-spacemit-k1.c
[4] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama
@gmail.com/
[5] https://lore.kernel.org/spacemit/20260727094726.890179-3-inochiama
@gmail.com/
---
Sandie Cao (5):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add 115200n8 to
    stdout-path
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for
    WLAN
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add rfkill node for
    Bluetooth
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add WLAN power
    regulator
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: enable PCIe

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)


base-commit: 4bc415760dd40fcff23deb073333984dd15d418d
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
