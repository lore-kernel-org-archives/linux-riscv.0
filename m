Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22914D3CCA5
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 02:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nSSc9iHhwyV5y/b0CZk+DnB17VZgkkah8xtRCxWBrTU=; b=rSubV6CwNACbgD
	4umBp5qw+Qy4ohg3BflNTtTeW/jbZRLKggu0RjOt0o6ZkwmvlWUE8ZalVRzmctS99vSqR/zISFlig
	owoLWHa4/5MGgV6xgJ9+QHTB0BR/fVw7kbyyfsyjfTy4PnM1A9Rh9dn12QJp20mTpWgjf0/Cl0hBx
	91srI3xpJQa/Y5DXdGccoCM91Awej5mBnUfJ+gobyOPTxSMJPv8RsO63vrF+E0ss/GMmhnqsXzsUk
	heDWWQ1golFTYUZamp8pGNIlt1Zq34mGb5/TWqYsNgnzE45qO7irg30prr5x0rbCWwbKdvlOfqOba
	P1dqp5kjhW6ftsvYrsew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDQB-0000000BaY7-0fEH;
	Thu, 15 Jan 2026 02:49:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDQ7-0000000BaXM-2UlS
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 02:49:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A408C60141;
	Thu, 15 Jan 2026 02:49:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4D2C4CEF7;
	Thu, 15 Jan 2026 02:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768445350;
	bh=Gdl7RMwiGHYUfkVy01tC/Zcmn5FI7OUbWkR9ludCO74=;
	h=From:To:Cc:Subject:Date:From;
	b=NBlkTZO/hktFc+hqzzwkoP5o8dDhwBTov+JRn5GpjUf/QeF2aYUnNk76hUPs1xrwV
	 ji4A3lXqrCwmqnBCOXmRYsVPHN+OlI83yc0yqg4QjpkqssmdEHjs4Vj6BngHo+epG8
	 CkWlnV32+EPl+WOVoSoy/MqZCruyROpzbUsmUVfzch1tvV6QzTp67xS3Tw8RJz08Le
	 qaGUerOjUFLEUHE9thZoTxzX51b9byh954OjHLWHCu6wyOHDeadWe171w9C2vTiNAu
	 +SM+a7uf2cwF2G8GiEqVbpAAPOoNdNp4+XA1UNOHAQu1DTbMym8IZWgJPiX+w6nzwO
	 /vBSqXTuivj8Q==
From: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Yixun Lan <dlan@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: [PATCH] riscv: defconfig: spacemit: k3: enable clock support
Date: Thu, 15 Jan 2026 10:48:55 +0800
Message-ID: <20260115-06-k3-clk-defconfig-v1-1-646a0711dc00@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Change-ID: 20260115-06-k3-clk-defconfig-e4b3e4344d07
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=dlan@kernel.org; h=from:subject:message-id; bh=Gdl7RMwiGHYUfkVy01tC/Zcmn5FI7OUbWkR9ludCO74=; b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpaFVX3Hw23kCZw+6imSGIGB1Vz2LDe6eKVblTC 7k87bRRCi6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaWhVVxsUgAAAAAAEAA5t YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU QACgkQMarqR1lNu+0V1Q/+MnpmHP/jZ7Y3kJeZfZ3BErXEF8p864fT6teYOs1v9wyISMrfbs4G1 Stsq0TA+KBo+72GsPwm3yzXYqQUKMMMe7onY72blGHL63CD1HVUkoGLTuv6IbBwsKnyYKhHOyGN 7VqRB26SoCB2LH7FiRiKKDcPF1z0W6nXc9445jSfhm04XJdmB2NqILKjqPmWj9wvsY3SaF1wjIY eA3zGBWRA5wGgNAy33X4i/GSz/MqsCVphzE/uvsMbydRN55VC9qt98t5hfwM1+2Zv3fKG7m/Bxo dOMoXk6JkkJ/8aoFHrR66ww6ups6uboz1fhPVaNtrzk2LXFoIdeN31WozAqqjPPx6wk+CU3qRtv i64dO+8fZPyIKwwk6u/CnerWwRxeuoCSu9DZtPk/Hd692yACkqa8+qwYdvob/rCgU/b78Owjd+O mfQIw3xb0qtXa/Mk7PZk/Cx+HoxfiF/VBIhg5MTAoHvgxqC94gc4UyspxdwnRH1h5rZQCw59CXp ocb96i0YVds01
 yhT+oxazVJD8EIUFnmU/vXoN3NnUsT2uTYlwREBPNp4GOWKMwhL2fxTypXH5xC weJETDzBDu46hOcsY2UTmYt08NrwVy6m0yzSBzb3WScjsmHzJR5L5PVS680iUKGUE+OP5aqM7pX T1jYhSFnbY4CYS5aNVu7paoNZCNnxo=
X-Developer-Key: i=dlan@kernel.org; a=openpgp; fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Enable the clock driver support for SpacemiT K3 SoC, configure it as
built-in by default. Users should be able to change to build as kernel
module if needed.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This patch depend on clock PR[1], it can be merged once the PR is accepted.

Link: https://lore.kernel.org/spacemit/20260114092742-GYC7933267@gentoo.org/ 
---
 arch/riscv/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index cd736a1d657e..6ce600081a6b 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -255,8 +255,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
-CONFIG_SPACEMIT_CCU=y
 CONFIG_SPACEMIT_K1_CCU=y
+CONFIG_SPACEMIT_K3_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260115-06-k3-clk-defconfig-e4b3e4344d07

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
