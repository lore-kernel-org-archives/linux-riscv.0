Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56251E66886
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 08:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0oxhss5hUa3RX8d1/O3Msl5ZGge5red+iS8nXd+aHQE=; b=2Q4Gw7OqWLk1y0
	w/LEe0ls6q19nDgVcwu58Zqny87hOSCYF2/1d4HPjmvWmfOUqZswZ12vcRo6/YStKFujJOxNxoxPI
	eDwp6Rnb4zn5vsFThkmDmscndY2rohPaAAdiTZ7mSIwZrGHmUJK2m9BwOdqYt301ZpueAnFwEsehx
	UEOYWjtg9+tCoJmvdKh/XfcMEzA6z3fMqvHC8/2N2PR2Zi+TRQhsUPuESrudI3e1bQ+jnj9Y85Hki
	7at2allMwHG2xZ1qJIHLg+PHbStroWgnd8sv4eAbjwOvVLg1YITZSLpkB/hnk2c9lMacTfKvxPF8J
	HeVLEqJAAnNXwfFHU4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgY-0000000CFJF-2i8h;
	Sun, 21 Dec 2025 08:21:02 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXEgW-0000000CFIp-1c7F
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 08:21:01 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 38FBC341073;
	Sun, 21 Dec 2025 08:20:48 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/3] mmc: sdhci-of-k1: add reset support
Date: Sun, 21 Dec 2025 16:20:25 +0800
Message-Id: <20251221-07-k1-sdhci-reset-v1-0-6780af7fa6e7@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMmtR2kC/x3MMQqAMAxA0atIZgNNVUq9ijiIjTYIKo2IULy7x
 fEN/2dQTsIKfZUh8S0qx15AdQVznPaVUUIxWGM7spbQONwINcRZMLHyheS9CUTOtI2D0p2JF3n
 +5zC+7weVBIgGYwAAAA==
X-Change-ID: 20251221-07-k1-sdhci-reset-1990d1170437
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=fwDvpWFME/C3CoNwdgQwLHWmN81cJv0j91O9vkwGH0c=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpR63TYA7dRtb2KLL1GGbovWqV0rjPXrxxtgSgP
 P3Of3F6n6GJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUet0xsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+07Ug//UVu3AxsoKrERtL5yNRs3jBYzDq6Cv5supSGRzMfHGcancvH7MiOf+
 ZZ07qWPFJ1a1qV5yoDwqTVDpWGzBt2pOsO8Q1TZPhMqu5G6Zt8TdXJHvbLRqEeykTSyDIY0Zz4+
 qOl6c9nxbyJaxpDHNa+/Blqe2gEzWs6hX5qcSqI4bhZhl8IbFK20NxNTfrKG7pl40/Rupn4Xdl/
 QJy66SL/YOSFH1F8mYIyABcDHZ92Uq3+5ITYP/IezvMHQvkunxvF3UZna2susEHMHGbcpxCuv8R
 JrtCr/HOn0GoRc4+BzXwQEBwjCENoL2EnprQpWOzHKhJsyjQOuWU1URn6829rA8W+4m3UCYwJAv
 6Pm6ljmbnTav8jCeAC9LgQft+2b88EuVtDYZi9OaQq7+kIuciedBomikfhZcQgoabumVrTLeol+
 GUm3DcMIpd374rUoSCnOAAfSdnAHPVUcEwl2Dh00H/wmWNAsQT13LeKHilKBOAdYthvCrLAiY2E
 O3QYCYqrp4TB6qEMgbfGa9vxff4AsqRdmeuHJ6Cjh9muHf4ZGauakHyi0sp+DHX/dKRt1SWkia0
 XP0pb1kNgD47u834WVk8Ahum6d0c4ccWY42ALVOXkB6uIxJuSczqN+Y1uZsLdC3cfL3zHXg2TJ0
 o2GPCUD7THxT7qqBMprv7EtDql/vnM=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_002100_458939_447CE6F8 
X-CRM114-Status: UNSURE (   5.34  )
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

This series try to add reset support explicitly to SpacemiT SDHCI controller.
Previous it works well for eMMC due to it's already initialized at brom or
bootloader phase.
  The controller has two reset lines, one connect to AXI bus which shared by
all controllers, while another one connect to individual controller separately.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Yixun Lan (3):
      dt-bindings: mmc: spacemit,sdhci: add reset support
      mmc: sdhci-of-k1: add reset support
      riscv: dts: spacemit: sdhci: add reset support

 .../devicetree/bindings/mmc/spacemit,sdhci.yaml      | 14 ++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi                 |  3 +++
 drivers/mmc/host/sdhci-of-k1.c                       | 20 ++++++++++++++++++++
 3 files changed, 37 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251221-07-k1-sdhci-reset-1990d1170437

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
