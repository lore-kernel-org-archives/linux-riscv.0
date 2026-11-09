Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81AD606A31C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 03:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t4+A+4gI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=mazc4Bmw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:Mime-Version:From:To:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=E9YOJPECle+LeqoFdW4UftsvfEK514/QKzavHMVR2pA=; b=t4+A+4gIOb/pVGxjH/Pwmuc2Zr
	Pd4FDSxaf36KJEWqwK9tSEuJszLVIR9KannRN6mQzuSegRCL89n5qXgmpD4FzMmYzgfmVZ2irdXQT
	54UK2fpto71nWN1rCK82gxFk6CPldko3k1/cjAATDOEXer6/RgO4/whcoqdXpWg6fKH+VVlG9tgsF
	zwBT5B/teV4EtRQ8idSqzaTGXCeOtvy+oQfqh8uXOTixVvViCxybJmHNcWD2PHKh9qxZBeBBwefoJ
	1Gq9fi0H1Ly4tjaVWI4FrTeka1Mm4BLGuCYNohqZl6whCjFUnpy5N79YCXI5sCKYu+/pBcKw+B4it
	RA45aang==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQG7L-0000000HCiL-0sxZ;
	Mon, 09 Nov 2026 03:32:23 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQG7F-0000000HCcB-2Lvk
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 03:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794195129;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=YzDaYCBdSlrb9LFHCCjVU8KX83BPN0Qfxpy4gBXOK+o=;
 b=mazc4BmwyxscUch6uiRgmt/4eFAe3sxKGToaNVbJvQVveZgFoCoM4xkGtNJMUT2WOctWyW
 s8V6uikNfzU7SdeF2SUGB32Z34b0wLjmXmNvss1JC0K4BX+H/GPXrPWVIzGfh3L0eToMYy
 mzOsJe+rHfQIO7EsErS3EVIG0toDoLRhbrsEeTbhmkcMgDuzjfWlLSIbs13EM7XMBmVSc9
 OWrML56W/AlCwhrfvsKmXPPWKAAzeqguLrsR/S43lYNhvKW3kHUa7b8bWZVLaG60MAeASZ
 enC0EKytx5p/ddAv1+kFXfgHN/54RA4WfiWypnTFmbJZXDM7JWsvdt7JxqfnSA==
Message-Id: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26af13eb7+43f0ad+lists.infradead.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 11:32:06 +0800
Subject: [PATCH v4 0/3] Enable USB and SD for Deepcomputing FML13V05 board
Date: Mon,  9 Nov 2026 11:31:54 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_193217_683103_B486D3DF 
X-CRM114-Status: UNSURE (   5.41  )
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

This series is rebased on next-20261105.

---
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

 .../spacemit/k3-deepcomputing-fml13v05.dts    | 220 ++++++++++++++++++
 1 file changed, 220 insertions(+)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
