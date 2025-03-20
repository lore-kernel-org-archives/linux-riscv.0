Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA4DC35FFC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Mar 2025 03:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BJbFzKGup+XeU79J/F8gHbQdKOstoPYLHbMpvQVeogE=; b=X/yHXsfEGVI6tv
	Eb8+NgB7l90+N3maWNugxAx7vQlry5GIy4HhMjy5JBCA6ES2NRzFKWgrj6s2o/7vZmKkctyNbY+Cy
	Mj/KfOyyOoYJVBNYhFA1ZQy1A1Rfr+NAevP+sLxaGteSl42+L8n7lwpX4MALuYdKmnMWjC9AHzedd
	+eiENyJePXNUWE3Ml77CPk2SnmPjqSMmQcs+0HyhbvTLVeK8/ftA0J6u4gzeur8Rn0y77hKWl1MR3
	d14YXWqa6xi68i90FhIeZqHsBSWpcyw7T10iJ29mXFr/FwjTnJwzeVWYTK9qTu5Loi58dDFReTQG+
	O+0/M9rA4Ma30etPlDjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6YC-0000000Ayps-3aFq;
	Thu, 20 Mar 2025 03:26:32 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv6YA-0000000AypW-3ksy
	for linux-riscv@lists.infradead.org;
	Thu, 20 Mar 2025 03:26:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1742441186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Vl0qbl5XE6Lxe22oobcSmJVsOTYtLdN51JgGkibTOQHVB5aynyq8CLzN+XGebz+pgOwM/mulH3ynURijA3OTubVKE9eKZvK+hZEsHnNv9ekHwYFOs0ayXawe8qFRy6aQsD35vUIyoSWCh1xA2P6R37YN/Z7wijmTQGWEUADpWJM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742441186; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IZEOGRPQdIAuy7t1kBlB3O60qdUgdlWHRtKQYF/eCNM=; 
	b=G3nLCvlCJ0UYozTWndXCx6+BOpMVsayQZQzwgUmXF7Y1opJLR4wr46BgUr0xOoq1OsG2nBKUf52zP69rdd5kH4CS7/h8TswOLU7oRjDSsHtfqS1QyqUOt2eh5x9MQlABRvbvYx/z1pEjfIn0nLKDmjlX2nTGfn3Cz/UPOxhto7I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742441186;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=IZEOGRPQdIAuy7t1kBlB3O60qdUgdlWHRtKQYF/eCNM=;
	b=ATvArLG0nkskCgKjMk/p9CgS6HgNF8WeRqRRqXO3SdInaMDxtfpJkxIwuuWpQ5Ln
	j9xHwLXZVbsKsmnd09QiHLaHsSG8Nv/QQVZ8Gxx4DMyPY5jyJv3qC7x/dxJzOXgiL4d
	Thl8EELaeZbpUnOusE26TLwZOpUcYhgvGjCPoqF4=
Received: by mx.zohomail.com with SMTPS id 1742441183420882.3439263012918;
	Wed, 19 Mar 2025 20:26:23 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH RESEND v5 0/3] riscv: canaan: Add support for K230-Canmv
 clock
Date: Thu, 20 Mar 2025 11:25:34 +0800
Message-Id: <20250320-b4-k230-clk-v5-0-0e9d089c5488@zohomail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAK6K22cC/3XQPVPDMAwG4L/Sy0w4W7IjuxMDrAwwcgyOJNNcK
 YGk9Pi4/nfcAgehxZOd3CO90ns16tDpWM1n79Wgm27s+ofy8Cezihfp4U7rTsq7AgPOgmnq1tV
 LQFPz/bKO4DNiVmkYqiIeB83dy77aTXV1cX1xeV7dfn4f9Om5FF9//WzTqDX3q1W3ns+MaoqBT
 AgJQAglWI1NECV0xMKkPrpMny3Smhcl03wmKgnZEWRTTs7iDIsIcW4EW6+lkiQS3idYdOO6H17
 3Y25wH+FrIppMtMG6XFpL0dsQlOjsrV/0q9Tdn5a0uwCFeWMBDlmbM3mfOHLm4wwMHjJsgClac
 J5gynbBN+5XWOum3BVu2UROTYsupH+6WjpkPkWf0PnQRHukq/3VFeKU28IBbIqWNBiVIxy+eVm
 VCVMOO04tmgScPBzj/ofj35X5wskFKduAgIp/+Ha7/QD6HJqE1AIAAA==
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
Feedback-ID: rr08011227318529e2e261679ed8e157d9000052ddf1e192f43c076ef4881b909aac4a283b00d496f39086b9:zu08011227c4023cca91e625ce0f4267130000410389648ac060c1c7084c9e177b6a7fd65a38534edf6afc35:rf0801122c56fc2fbff7e87a8c8236bd1b00000357e19e7ba3b7948a3a27412d5347d8e680bfd97ab4871daa18892ae482:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_202631_001319_D42D696B 
X-CRM114-Status: GOOD (  10.27  )
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

This patch series adds clock controller support for the Canaan Kendryte
K230 SoC. The K230 SoC includes an external 24MHz OSC and 4 internal
PLLs, with the controller managing these sources and their derived clocks.

The clock tree and hardware-specific definition can be found in the
vendor's DTS [1],
and this series is based on the K230 initial series [2].

Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arch/riscv/boot/dts/kendryte/clock_provider.dtsi [1]
Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

---
Changes in v5:
- Fix incorrect base-commit and add prerequisite-patch-id.
- Replace dummy apb_clk with real ones for UARTs.
- Add IDs of UARTs clock and DMA clocks in the binding header.
- Replace k230_clk_cfgs[] array with corresponding named variables.
- Remove some redundant checks in clk_ops.
- Drop the unnecessary parenthesis and type casts.
- Modify return value handling in probe path to avoid redundant print.
- Link to v4: https://lore.kernel.org/r/20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com

Changes in v4:
- Remove redundant onecell_get callback and add_provider function
for pll_divs.
- Modify the base-commit in cover letter.
- Link to v3: https://lore.kernel.org/r/20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com

Changes in v3:
- Reorder the defination and declaration in drivers code.
- Reorder the properties in dts node.
- Replace global variable `k230_sysclk` with dynamic memory allocation.
- Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
- Use dev_err_probe for error handling.
- Remove unused includes.
- Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com

Changes in v2:
- Add items and description.
- Rename k230-clk.h to canaan,k230-clk.h
- Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock definition for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   43 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   25 +-
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 1711 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |   69 +
 6 files changed, 1847 insertions(+), 8 deletions(-)
---
base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
