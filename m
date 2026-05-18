Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002FACD343F
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 20:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E85uNwXcnwG92W2sPozR2nAdiCCX15xAJyNAq9GLxlc=; b=a182a3pA1ztGHr
	2yPdndAV7/1WNjKvhxeculZWseYWMxlFNdcRCwXxLhDqFqHNgT9a9XHYQiFyhkXRDSd7mhy+0rbkV
	0tegtXSIi5qpwcTgeFLXvvhhNmY8wq01NtmyPOMc9OpsRcNlt4X/Es6VpqMcxlWZHIETFAeKlg/UL
	Me73odM1ejugZO9GT+4+OeeVcu4+gbk7TFSMJZzw05WD9nTUeByxM2H/IB3TySzE+3y3KsmA+chbI
	aFM9vvTnRghnzYgikMHTKTf383+wrZdiqSODCjxnesMyeOZB71GpixkOh3OWfxXvnx6PO78Ypzm+u
	8+mdhY4vzDPgKIUaKaBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP52j-0000000GwW2-0XzW;
	Mon, 18 May 2026 20:58:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP52g-0000000GwUu-3NlS
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 20:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFC2143F10;
	Mon, 18 May 2026 20:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182E3C2BCC6;
	Mon, 18 May 2026 20:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137904;
	bh=i8rjaRkxopw8OlF0S2A6bM63Z9+AhhS7gHX5DH8OmKE=;
	h=From:Date:Subject:To:Cc:From;
	b=rU/h+E4dh0AdXeFgtVktati3S+YTYqhWKFEnvMd+ft72tUvf6BlIgdPpvVa/0Xk9I
	 /CK1OwsLdiXQ5+Lx8pX5qQJ8+jxxhpjrcY+xB0kN4L00v0QNRZhjbxuOXFhhFjzdeY
	 xrM2OUtdQoKml781VKun8tTTl+i8nlZFYcwm0PuAtbAG7iRWXjlKxgoBf3++o2cf7M
	 myFNQOOMwf9ax4WNEK0R3K4Dwxwr6q+y5vpiRLrkMyBvO+i0U4Z5J7oGyyjO9NfHEW
	 a9IwG3ojWkSRMm0+8IMq7EN9NyTJFuY+fDX6pteSKb5Us4V3gs0Nt3oL1xhl/fu8cR
	 6FhjVXw05NNJw==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 18 May 2026 20:58:16 +0000
Subject: [PATCH] dts: riscv: spacemit: k3: Fix I/O power settings
MIME-Version: 1.0
Message-Id: <20260518-07-dts-pinctrl-io-power-v1-1-abe19c14a726@kernel.org>
X-B4-Tracking: v=1; b=H4sIAGd9C2oC/yXMTQ6CMBBA4auQWTtJC6LoVYgL2w46xrTNTP1JC
 He34PJbvDeDkjApnJsZhN6snGKF3TXg79d4I+RQDa1pD6a3A5ojhqKYOfoiT+SEOX1I0LrQdW6
 ifjjtodZZaOLvdh4vf+vLPciXdQfL8gP15NuoewAAAA==
X-Change-ID: 20260518-07-dts-pinctrl-io-power-1bd33bfe5894
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>, Han Gao <gaohan@iscas.ac.cn>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=dlan@kernel.org;
 h=from:subject:message-id; bh=i8rjaRkxopw8OlF0S2A6bM63Z9+AhhS7gHX5DH8OmKE=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqC31qYwQytJjsLBLJBfc0/6szLw4gCToBXYwaW
 g7gbAcDvQWJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagt9ahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+01fg/9FSqJUEIvu4++shC1RVOfuefElopiNxTv0NbykiV57GNmsOY4TqNBw
 ju5dnVyCPtcGashsbtiiaK74a3jhccrPbk2hBaR2UmTI1p38UVKLv9pO4PZ3BhcpTjXGRp+CvJH
 C56dJm3NASSBBes/PGH86d/R6KXRD6vgLtpDHoLurHRlk2apgklJYE2VsUT/ovU87w2gVRpalqv
 n0SK1J5pglbY/lGDkZRa5JhehAU9CQwcSzcjvCBGG3cO/WWwd31w/GH7bgROImRmep+G6OA6+vG
 cOeAFheTEmqFaDvJD5JX8AIiAqarf+m87mzocbpByxwGzaSpnzoMZvSsu6zIIhbCEuxCrkJ29e/
 yP3RExGnAjf2vukK7/cj6loKvE7Gw3WKS/GB+ME+DlUJG67bTQRttpyTp6jcIjt+wG7RAZMxRwF
 a9hdRSMEDHWbPgzGdaL8rCp72RjQE08aGgMBIKhIy/NrRZKJZL4IwvtqTVlMfiQ+hS2cXDMWkVJ
 lN4mQWyZnPwdILVfHVovrpBbWMCkFEHk+dKP75LXb23nYBpxQc4IMnUHWCKrlCGlXi7S2xghnoj
 pX9UObDowwa1iPNnE9wgIlGCL98zr14d8cprlY7mdhgVKx8oxS/Kp023bt7sdhWXJuQQVHastAk
 ZsvwsyxhDEi2GV7M4P36PUo0ezBUWE=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_135826_899691_E1F9C474 
X-CRM114-Status: GOOD (  10.75  )
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

SpacemiT K3 SoC support dual-voltage I/O power domain, while initially
configure to 3.3v, and need to access register from APBC space to switch
to 1.8v domain.

Fix the GMAC0's I/O pins 1.8v switch failure that will result a broken
ethernet driver.

Fixes: d8944577496b ("riscv: dts: spacemit: k3: add pinctrl support")
Reported-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
This issue is reported by Han while booting kernel from UFS storage, and
found the ethernet driver is broken, we can see the message as below:

 [    1.635881] mdio_bus stmmac-0: MDIO device at address 1 is missing.

This problem is caused by GMAC driver that unable to configure I/O power
domain to 1.8v, which leads to the MDIO communication failure.

We didn't find this problem due to using tftp(net) to load kernel images
while bootloader already configured the I/O power.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..2b0bf9cd755b 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -803,6 +803,7 @@ pinctrl: pinctrl@d401e000 {
 			clocks = <&syscon_apbc CLK_APBC_AIB>,
 				 <&syscon_apbc CLK_APBC_AIB_BUS>;
 			clock-names = "func", "bus";
+			spacemit,apbc = <&syscon_apbc>;
 		};
 
 		uart10: serial@d401f000 {

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260518-07-dts-pinctrl-io-power-1bd33bfe5894

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
