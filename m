Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714C8606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 05:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gPDVfkEV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=JDC579OF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:Mime-Version:Message-Id
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5ry1FN9N/x1ybjf5IUrM0WLRF+Y7Ex4XBwigIV9Mt1w=; b=gPDVfkEVHY1QnyxE9i6msmM7OP
	9TvuI+LuuLJMwE9ADPo1gFmYYhDVCcQRmqp6OpTKMeLEvLNpLGDshy2pat9qnSfHuTla2yCtmnc81
	0MnGbOKFe9raCV3nJ72I0ETwYiYKC9wXq/ZngYZItVcwef3gqf85Foz71lWny3I0uEQO1nQoqk1lH
	v6kVE1BV2yrERZPySV+W5C7NHYunqVeMmRBjJn90jLBC+Za3iJXDR+WkFShhvW7xZS0Q9pClco+kA
	s8Wa4xfsW/Qj+w4vz4dGH5q7kNW59essCjAcCpWRECsPYr4Isqroix4rS3CrzqEidrunv3BApo/Yq
	y88EORLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBzA-00000004cZv-3qjU;
	Tue, 17 Nov 2026 05:44:05 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBz6-00000004cWt-2s0G
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 05:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794894226;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=DsGLFo3Ah3ZqBE0pL0mtcci+TztznhZ6bWOpznuGZd8=;
 b=JDC579OFQHDMJLEY8/2cDuh+6kxCeH6CAuDCtZG/kNMcXsZG92uOASeqvqHvaNE0lR2ewi
 qSGfFaqDIGqA4vAioanyMjnCwyapoUDQzuJIOQU7RAtOfUrnAz2xbmCkd6/u5g6B+vfcIn
 dH9iLKb4DVF3iQmCjoBPnPSKBrgjlfSqT6NuHb2cNHmTeQEWVAvd4/zIIrT+GUun09Fte3
 dang5QLOaX8hNW+DDNYvJVhEgP8s4yF7C99+0Rm3p7sH6lDciMNg5BAtz8FM5DaY/rkw/a
 N0uNmxTGm4Qy9SU1E/M3O1tu9IoB704+dRQow/zwXLDwz7P+/qfmUGJ2nXpqAQ==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afbe990+1d4567+lists.infradead.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20261117054324.1048767-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([183.23.101.74]) by smtp.feishu.cn with ESMTPS; Tue, 17 Nov 2026 13:43:43 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v5 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Date: Tue, 17 Nov 2026 13:43:24 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_214401_423052_F7BC1D13 
X-CRM114-Status: UNSURE (   5.03  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261116.

---
Changes in v5:
- [patch2]
  - Correct commit message.
- [patch3]
  - Remove Onboard SD Card comment.
  - Change non-removable to broken-cd.
- Link to v4: https://lore.kernel.org/all/20261109033154.361399-1-
sandie.cao@deepcomputing.io/

Changes in v4:
- [patch1]
  - Remove unused reg_aux_vcc3v3.
  - Rename p1@41 to pmic@41.
  - Add regulator-always-on for dldo4.
- [patch3]
  - Correct Onboard SD Card comment.
- Link to v3: https://lore.kernel.org/all/20261102060012.100623-1-
sandie.cao@deepcomputing.io/

Changes in v3:
- Remove useless gpio header.
- Add Onboard SD Card comment.
- Link to v2: https://lore.kernel.org/all/20261020081633.3673704-1-
sandie.cao@deepcomputing.io/

Changes in v2:
- Remove usb3b, usb3c node define in k3.dtsi, it's already uploaded by 
other patch.
- Add phys and phys-name define for usb3b, usb3c, usb3d in 
k3-deepcomputing-fml13v05.
- Remove cd-gpios, use non-removable for sdhci0. 
- Remove vmmc-supply for sdhci0.
- Link to v1: https://lore.kernel.org/all/20260922110231.3426011-1-
sandie.cao@deepcomputing.io/

---

Sandie Cao (3):
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add P1 PMIC regulator
    tree
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller
    and USB phy support
  riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card
    support

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 215 ++++++++++++++++++
 1 file changed, 215 insertions(+)


base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
