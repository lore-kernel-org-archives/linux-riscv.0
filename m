Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53E2EFEA839
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nnWWNEPMCN744v00GmYeC+FUieHVJq9B2los+/uNAec=; b=NS+HJK+/JtH1r/
	IdsNTEFattn36Z51Gaxk2mJ0IYutiFKO6J7wxABtfuZWTJRZ7jZGQj7E8C31g2bJ/cBrg2OnQyrUx
	3ZTcLDfr/9f/MQVJHnxhYYVEWZnSFt84JXKu8FQPyqgJpT1DVh/HYe5+PEbohqHK5tgD1uSgdJLgi
	7/gvgeuRXhQePE/NYKKd2xyEoWw3iiTla3KdH43hCMfSKzbttp8H+AE5PtSyw7ziwoH4k5c4XPMM9
	KUG5mViOjuEGj7qm9yHQfI0mMjypoOv+6W0kRxGUbmOywFI0Obbje3suYT72yFN4AMyiBYK9aC6tz
	/uaPTZjKjCgL6o0FzrIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ks7-000000034lP-2WDp;
	Wed, 25 Mar 2026 09:49:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Ks5-000000034l6-2v8C
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 09:49:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6B7E4383D;
	Wed, 25 Mar 2026 09:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF04C2BC9E;
	Wed, 25 Mar 2026 09:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774432192;
	bh=Vaosi1pX1K3xtkInII2d2k9K5rhC7gGh7uUHH86JsCc=;
	h=From:Subject:Date:To:Cc:From;
	b=E7JtgHhAupTJ8CzREFMJoQ6Bw3YDgrUZkEegxbttFI5MdxI7hDlkknWakc+QOp5eM
	 r+oIJ8QK7tQCAH+b9wIbSxFCJlgzoSq1GxlsqJnFFYUvLmrrX+1bHp8h6PdfJKwEE4
	 O1w4RQJmSoye/Kg9pCN119SOdJ9+HB7nIJmuhW6VwbG0KJOlJc+Rq7CVGhBHo5dBDr
	 2U5TSL254HsHU2Zk3go7QNVojqcWxYFlr19EkIYlFu3bG3x0tb6nb+52g+MDrCypuh
	 K/nMHvYshfhaApZQkwu8/K/ZsRexsmbCGHGenhUU2A2SMBpXd0P5uDSMjqyxPEIDvR
	 z4sR3WeBB2A9g==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/2] riscv: spacemit: k3: Add I2C support
Date: Wed, 25 Mar 2026 09:49:23 +0000
Message-Id: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKOvw2kC/y3MSwqAMAxF0a1IxgbaFAu6FXFQbNQg+GlVBHHvF
 nV4Ho97QeQgHKHKLgh8SJR5StB5Bu3gpp5RfDKQIquM1qgIR4NCLVrnCyqsdaUzkP5L4E7Ot1U
 3nwOve0pu/3jfD+V51wpwAAAA
X-Change-ID: 20260311-02-k3-i2c-6ad52566a9a3
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=641; i=dlan@kernel.org;
 h=from:subject:message-id; bh=Vaosi1pX1K3xtkInII2d2k9K5rhC7gGh7uUHH86JsCc=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpw6+09WRmYMPEjLZE2p7r5oxok1cDWf9KdEPZQ
 Pu2/KGczIKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCacOvtBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3uOQ//XHHfw4wvmtnMP9Dz38p2iSAG318MgZGdUbv54RWlICA0HQaGkKd/n
 +WsgTmmZQ/0G5v/7r280fK6c8czBy4EH+ab2sV2CIIey8+Qcd2bmJhZ4tAstvF+owZbdkMvZ9vv
 T2gQbuqRVXFvuaeq5bEYkJUVn8Ze28I7Q9fwKaXeoYcaBwyrzVG2GFuswZ6w0cMy8DFeV7bfrE9
 MuB9fUb+ezBHDiN9dBUYM6+EgzjRuCUBz7PcTDtem5BwkaCo2PWfbbAizAN8UPC/by81MwI7kgB
 tQReS8tPiEt9nDYilZB5pEB4B8lXQL0qcauEUGTQSrzlX0Zac8wRFfTSvVkS/g82ddWUJ3T0uxH
 H0GM2lXL1aCMsB343AtIhu7P67/crjm0Vhnj7w7dRBDa1bwm+g0/W7+B54psYc+dCUQDZdGoaNt
 ZV8YswieSxXTE1QORxpAgttMMx4zUGP+gzPSNp/r+uHRl7d8QWFrXeT0hrME2MguDnb+RwflTUR
 n3VkY3u56KM6bJUhRIG4qdJwQz7l3FhbMYwe/RMl2HuIN/hfdZQCBQN+ulXo1GU3H+ZPdEFaSiB
 wcucr/S4ItM/7Cm+aII4NctR8lWH1jVxndSHzHHhNweJTdEYxGC4MGGTlZQi/ET2Dph/Ffpt3n3
 xQHoCJ+B56woGmBQPra4geiaLjOcY8=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_024953_761517_949A7A87 
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

This series try to introduce a compatible string for the I2C
controller found in K3 SoC, and add all devicetree nodes .

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Yixun Lan (2):
      dt-bindings: i2c: spacemit: k3: Add compatible
      dts: riscv: spacemit: k3: Add i2c nodes

 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   |  6 +-
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 98 ++++++++++++++++++++++
 2 files changed, 103 insertions(+), 1 deletion(-)
---
base-commit: c68360c0d636dae71f766b7b296ddfcf2827ccc7
change-id: 20260311-02-k3-i2c-6ad52566a9a3

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
