Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF3DFC590C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WDrSDRWkjdd8U16Vt5RQWJL2uTqmnVcUoWrWrSkB4p8=; b=VNBXiKb8o27/qi
	x1C1MdXZWm3tWsmAeZcYgUJw38evE7G4LV10bKSZpC3oanOrq2RF3YfhY894AolWJHY+Ej1avBGjX
	5aTGiHXWQIIPbP5SA98eUCsEvtbSMoSDx52RlGbiG9vNtYkdQ7r9it072HK19p06uJ3eCtbeklgFd
	UOlofy/uKwJvHpm6t2H+iI/Po28bAd0VdLH4O5uAZ0ZlMgT9uWehGUkWoeg+Bx7AvmsdqHZbed0OG
	sbP6DZsdZq5qIZRY9Y9/Ein/nsHhTrzzkxvg9iXfQddhaAoVOHGyviIq9jJACvE6BTi0pn4mNEBp4
	wM2XMZDz/+2Ur1pEuL6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWZh-00000005d4n-1II5;
	Thu, 26 Feb 2026 08:18:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWZg-00000005d4e-34lV
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 08:18:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BFEA0600AD;
	Thu, 26 Feb 2026 08:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308EDC19422;
	Thu, 26 Feb 2026 08:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772093899;
	bh=MEIK9bAonaqTMisJPkjUMTcLudbo3u5sZqZBpvbIB+0=;
	h=From:Date:Subject:To:Cc:From;
	b=mdrD0MoulcE3hvsq+DbnqJn2wHesZBge4nDY/7hXL4B3kOIcJBacjzAaRX09/CSKm
	 2vf13Of9r2e6+yInQosbgdDfDcPnV8b65rWVF3KpiDqmwvUEK1H++9U2tX9J34ySHa
	 WHoapQzMVIUO3qwhdXzfSapuTKkPXO3kz9KbSnO8oIUewfq+9gWyHimsXV+0MwtXs7
	 UQHVbhxwF6pjQ7EQt4/zICK+JStVu5FhMRMHzzkOOP9LFpZrDI98gg2r7ekdeWi2gw
	 xLLflivY0+5svHa7VWDndGmvR6YZJoNYBeTMQRSlzN6D7EZyl1yY0donOsYyTIw5z3
	 esn2t9/0J2e9w==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 26 Feb 2026 08:17:55 +0000
Subject: [PATCH] riscv: dts: spacemit: pcie: fix missing power regulator
MIME-Version: 1.0
Message-Id: <20260226-k1-pcie-fix-pwr-v1-1-94b493cd27e5@kernel.org>
X-B4-Tracking: v=1; b=H4sIALIBoGkC/x2MQQqAMAzAviI9W7A9TPEr4kFmp0XQ0YEKY393e
 AwhyZDEVBKMTQaTW5NeZwVqG/D7cm6CulYG7th1zA4PwuhVMOiL8THsAzuigZgWD7WKJlX9x2k
 u5QNLtrPHYQAAAA==
X-Change-ID: 20260226-k1-pcie-fix-pwr-7f26118121ac
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949; i=dlan@kernel.org;
 h=from:subject:message-id; bh=MEIK9bAonaqTMisJPkjUMTcLudbo3u5sZqZBpvbIB+0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpoAHDFweVSpXqP1GdH2N3rzRsEFkwSU6zAJFJj
 GFXCeWkutuJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaaABwxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+13WxAAgYPAolKHGdv6bCQUFjtMpZGrsG90LspaVZap1XKgJ9x2ed9s1nKFH
 IBunzIGn9g796xq3ly0CK5SfputpNpYW0ZNjQLaCjy6DXvOSXbD1AxDviEvTBO1nslXc09IqfXi
 ZHGQWr/Bh2YzNByCSJiK4Ej41UQS7engrmTU2FZ94JGDarDQuuQ4d8TvJK6xr7zL3YHDKypQBdD
 D0O+J13Cm6xvQ+azNZk+zDZZxyqLWvjsPMUi1zwlQgrwFpgJgaOjrNp1SQajqbN/fXfrm3XW8qe
 7DELIq6sOIB17DFfYrNgflW7Z/cS9gMKwmZH0FVu6jnfvy4WOm/rDMQuN/uJbgKsb3kqyP6ihs+
 zufIAJGJQ8dkLffmrW8Z1hwisK0O9UXkkx7XcrcdO+dmCe/1J1IoC7k+kwGG+NipGLyGMbafE77
 Yc+gdYVer6GeG1/VwVy1vIYIuBm76CMIYD8U2flA1GrOKLK+9m2WDcoEenvW91vqIGRhwrMM+v1
 q4FVjLpLYpzYaFbv+BR1F33xZytlm+5vSY/EovGbdCV+MGXLEI2pMoXxEmIOvOuetlYfuSCbyUj
 aaT3BK4/2xrMr5qLJPpM5yRWZT0xdmSJkIjGfyxB1ohhGnARqHdXgeMxk76Xo9Oeibo+54RjhBW
 wHwBYjo3Bv+j3coR+k/4Eqw8JdFKjw=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

The PCIe port require 3.3v power regulator for device to work properly, So
explicitly add it to fix the DT warning:

arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: pcie@ca400000 (spacemit,k1-pcie): pcie@0: 'vpcie3v3-supply' is a required property
        from schema $id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml

Fixes: 0be016a4b5d1 ("riscv: dts: spacemit: PCIe and PHY-related updates")
Reported-by: Conor Dooley <conor@kernel.org>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This patch try to add power regulator to PCIe port node, thus will also
fix the dts warning when doing DT schema check.

Please also note driver of spacemit PCIe request 3.3v power regulator, see
drivers/pci/controller/dwc/pcie-spacemit-k1.c:312, it's not necessary
because the controller itself doesn't need it to work. But I do see other
drivers that request the regulator in host controller driver, for example,
to power it up early before PHY initilization. I'd intentionally leave
this problem out of this fix, and will do further check & address it
later.

Problem reported by Conor Dooley, so I added a R-Y tag for him here.
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3..51f6c6a774b0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -305,6 +305,7 @@ &pcie1_phy {
 
 &pcie1_port {
 	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
 };
 
 &pcie1 {
@@ -320,6 +321,7 @@ &pcie2_phy {
 
 &pcie2_port {
 	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
 };
 
 &pcie2 {

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-k1-pcie-fix-pwr-7f26118121ac

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
