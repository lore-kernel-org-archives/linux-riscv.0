Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF002606A326
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 06:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IwZhmTCE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=NlNO657O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Cc:Mime-Version:Message-Id:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8r3lP1597hxu0vlRzOrVdp2rBbY9AHdhFXmCM/vZw/M=; b=IwZhmTCEFSPFO2xdJHZR3+vGW5
	9I0EPqYBTz41dq6L0xnhd2C6n8jX+8RilZug9lcXDuHeSlWjSGvhWga7moAKA6O7gT5AHN+XUqIWF
	vsFVYwbp49pnr8/kPSbhpI8455bcmZiR9N9FUPNxrnmyt65q+SX16LvCZ8DGNDCvpgfx1IBLID8n3
	fQUOEypAnYCR7HBupOHxd4DSdl8mHIH7aq7SjsqRRB9IzA/1r6QN1ACwBfMP6dbmYsClTp2DJhPK8
	sv3nOGztvULOy1QEr6Am6C2eZxvRsmqSXLgaJq8deOsA4rWJxFmNjC8go9NCKIEKJYH/5/LSOscZ6
	lOUFK9PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNl63-0000000Fc9B-3Zwm;
	Mon, 02 Nov 2026 06:00:43 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNl60-0000000Fc8q-2G5z
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 06:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599229;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=A/tLJoR6OHH3WDx1lVKoWYGKHOjQjb/b8PFhHuwJhxc=;
 b=NlNO657OTtDs1MO3Bi375pa3WRIykXshvZk68y4dublKsxHAI27SUJ2i4l4037ZU2uY84a
 4gvhYleRByst9Zq1qa1a6lrS7vnTq3rdR82akc4OHPea7hy43YyJKy8lQl0P6UjnUzNNU1
 anfp5JHMJ7vz8d2brKrwVjTdMsTAkSDVjt6XEQ/WVGnKuK2AvhEt/46W/KadyRx7YecIRS
 LUAx7xBsVZMsNfg+QM8Q1kEp0+bi7r/mXrjiq6x0R6Orc4ZLOWKC+u15yF+0y/UoLvB0E2
 0cMfr0G3W9Nt9ofaCA5qFgGvaGp3NfU4zJuD8kSc4aOGZLO2DW6K7/MIlwgBkQ==
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:00:26 +0800
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v3 0/3] Enable USB and SD for Deepcomputing FML13V05 board
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Message-Id: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Mon,  2 Nov 2026 14:00:12 +0800
X-Mailer: git-send-email 2.43.0
X-Lms-Return-Path: <lba+26ae826fb+2a94b2+lists.infradead.org+sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_220041_107731_BB1BAE9A 
X-CRM114-Status: UNSURE (   5.01  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series updates Deepcomputing FML13V05 Device Tree: Add P1 PMIC 
regulator tree, add USB controller and USB phy, Enable SD card.

This series is rebased on next-20261030.

---
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

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 227 ++++++++++++++++++
 1 file changed, 227 insertions(+)


base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
