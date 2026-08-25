Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33819C61DB4
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 06:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+WYwNTadTmbHMsEA8uF3tKiamPyUV+IxiEj+1rCNn8s=; b=qPIIF1dGem4f01
	FL9Q9m7peZPzMHgF1uCITDdJwJSLCYZMpNX7HB8APL9pbYWHgkJbgVBvWN1FEjrWgsf8ifyWbWpVF
	nWvjbOfPe0oFLiJkx3DFUAivWU4STu+ZSFFOAnRR+nazaa7YNABTWHDwdyfjBRQIHlj09dYU0xe9C
	hqriA+SB7FqAUyckn1L7lLcCsfT7WFfkQQi7hhBpWkfodYoDPL8rLdbvQncbpSAgLfcD0IjcDsKFz
	zODgoOTqBbxdodoQHv0IqY/2m4iFUkLj82xbzWr8Z85aLY7Vy9Zc1nmYFVhmhx8MWOeVbDWf4vuV1
	+FwvumPQid694aCP8/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykzA-00000000F0z-0hsG;
	Tue, 25 Aug 2026 06:50:16 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wykz7-00000000F04-1bpk
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 06:50:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c2074710751so794169566b.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787640611; x=1788245411; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K08wIoLpKqBSGnc7x1avgOkXlHWiSRY4zZXK6Rw84Yw=;
        b=UDkeCKP3aBgTeUV4fLi85yuyIfwG3LHh955hZtIEsEwrrbfVv2SepkyYVpi95Q9vAd
         Xykl7ye7C6Rdnut8jxCuKDnlq7G+g4MFqnRI3vZd13Qs6krGzx9S0AqouSDvNph2PV3K
         TB2nnnnP1rBHvfu+rExbRO8N46+VX07VjojNE+u//15DNNAA1KYMhbD/PMS2ngVk0dpl
         inkhpxu0eCeDUQ/4Ulsb+HhtgHqfmAz/NStsQWAKRNVyfdXdioXIerfL1x3Az+CIkHhp
         O6j+92OFUUBDueq/htkR/pjwRYtpk0aR4lNWNYvYUH8bnuf/QqKP1+bEP42qcVj5nESX
         sE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787640611; x=1788245411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K08wIoLpKqBSGnc7x1avgOkXlHWiSRY4zZXK6Rw84Yw=;
        b=N4lS1+EgNUuA0fYczz1YZGyWFH5DVsgyXvIo7YZFVTOXVx7wgATvdZXtTc7zv3mEQH
         Buu/2Dhtl9j/slMsJYajzD1nVOF/QsDBamwQIKUwoZUHW8sLfCqdb3z55UqRuONS1Uob
         9MxUAoCdqq8TvUeNxfNJtXVwPurGgrBjC/viFYTdZSFaX0bTzM9okOgzED1/EiNuWUFs
         Pie4sdyGBaS/TYezIfAQxuEc8JEzdIdDSER6k51V4P9S4FsJhQWAHHKIS+mfJwX5yVUr
         dRfuN8HEhuQ0Q4+3YuUVUgAv4D3YgMcF0R8eI5cycKt/jo3Z0ZH+ssy9M0AGJPL1+riw
         n5gw==
X-Forwarded-Encrypted: i=1; AHgh+RrNoFbWWOx/4jhoAqRCiMlaniyR3NkjRR1X7SgSJLsxuJ82uHDQ5lTvkJebAo7EX3MNBE4FozZj2JEaWA==@lists.infradead.org
X-Gm-Message-State: AFuF++ndigeXR9A5RmSY8ANWUsu5O1oJADgAV3aLDExwppt+t8dVgQ3E
	Zh0f2j3c9HhS3KAYJ4roW7b/J15V0v+pxixxN3VgkRkaRX9ZF6Q36e/B
X-Gm-Gg: AR+sD11EaH78U1TIX9f9nJortzcLlZl0s+TzUVsXMBee0REnjxcU+5oibNMA3eV3NpI
	6XC1IjRptid0+Bza5qd0r3BIOgTKHKLs/0loqcDXK0zmUxfHk1CFtKMVhzAaMxwAM7iQlOzEZgq
	KWDiIeJayaNeqFhVyV24+V1Dbih9X9iaY3eJHYnTTpAavPnUD6KFD+kwgWcRjyUkmfI37yzX2Vc
	YolXUOgFnEjYA/YqQgKhAxMFjZ/gHxtPm4zwWOyagyrd/5cLgEYgnSEDg+FEHdEE0Nr/HvcUidQ
	HaXvts0478y+04qrqkPK3GnoWAxmtHeoCRGSE4RhNqIjviivCumSn5Unmy8qu1Pb7p3Vlr6h3bT
	uhvUCbUK17fxbqcJ3zT6ij2E7R/XLJhZ8uARJ/QfDpZxcCwtuEMhRB61i8iSS7+8RmSok+GIF98
	+Lg6/hxYwFSkCafXCPs2hLKeuWJNeBFzPIz+aG6ujkQuNtVQgGXYPSQEMQMgWGc4pb79t1cBQOK
	+2KviMIYMOWQXJpmsKK8ZgirkzLlGKwBSOq84VMygwU8xwXOt1T+6SAmQ==
X-Received: by 2002:a17:906:eecd:b0:c20:f871:1018 with SMTP id a640c23a62f3a-c24920d5db2mr2716175666b.21.1787640611076;
        Mon, 24 Aug 2026 23:50:11 -0700 (PDT)
Received: from GOLDENAXE.office-radnicka.localarea.network (c82-214-103-66.loc.akton.net. [82.214.103.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249672becesm1658627666b.42.2026.08.24.23.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:50:10 -0700 (PDT)
From: Bruno Banelli <bbanelli@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huang.ze@linux.dev>,
	Alex Elder <elder@riscstar.com>,
	linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruno Banelli <bbanelli@gmail.com>
Subject: [PATCH v2 0/2] phy: spacemit: fix and enable the K1 USB 2.0 PHY
Date: Tue, 25 Aug 2026 08:50:05 +0200
Message-ID: <20260825065007.69353-1-bbanelli@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_235013_460827_FCA45253 
X-CRM114-Status: GOOD (  10.23  )
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

v1 was a single patch adding "default ARCH_SPACEMIT" to
PHY_SPACEMIT_K1_USB2.  Automated review pointed out two pre-existing
Kconfig problems in the same entry, and that change makes them easier
to hit: enabling the symbol by default means configurations that would
previously have left it off will now build the driver.

So fix the dependencies first, then enable it by default.

Both were verified against the driver source: phy-k1-usb2.c calls
devm_platform_ioremap_resource() and devm_regmap_init_mmio(), while the
Kconfig entry has neither "depends on HAS_IOMEM" nor
"select REGMAP_MMIO".  PHY_SPACEMIT_K1_PCIE, directly above it in the
same file, already has the HAS_IOMEM dependency.

Tested on a Milk-V Jupiter (SpacemiT M1) running mainline 7.2: without
patch 2/2 a "make defconfig" kernel has no USB at all, because
dwc3-generic-plat cannot get its PHY.

v1: https://lore.kernel.org/linux-riscv/20260825052158.66367-1-bbanelli@gmail.com/

Changes in v2:
 - new patch 1/2 adding "depends on HAS_IOMEM" and "select REGMAP_MMIO",
   with a Fixes: tag
 - no change to the patch now numbered 2/2

Bruno Banelli (2):
  phy: spacemit: fix K1 USB 2.0 PHY Kconfig dependencies
  phy: spacemit: enable K1 USB 2.0 PHY by default on ARCH_SPACEMIT

 drivers/phy/spacemit/Kconfig | 3 +++
 1 file changed, 3 insertions(+)


base-commit: 66498c75b4f8017f62d720d9b59675bdf3abce91
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
