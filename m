Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD240C55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 07:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bH9YZk75JE7keFs/kFsYJFpSdi3Zn7gng6r17HzEkP0=; b=Nh03PltAQ+zBKQ
	XxtKtikbAFji3XxsxK8mtxlKP4LS087BOezHO2dWOqCmqOUpPC6yjJyqT5LImzAmFlOzshbIAhBY2
	ea/dLo9O6Zyb+Fy6hWZkm0niA3ivLTEMz+Gb7+z5Ri8srEC+KO/Lw7kY4+DiGlnK6ko7IsPZffkFs
	+wRX9T14PwFXdBBJVX1cw59E2idLzrs48ZHVZgw4/fOzkCHoMq/6j3uEAeNJoaWUGj1sEjEVIIDHQ
	gMqpw40/VeA7lPI2N5B0sOALsVIQXw1gsyHk5f8q8EYBcmP2KG1N7CYqgedlseeWC79pJTkaDEAat
	YnR6BOXVmeuqvcRqnv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9C5-00000001AvK-0DVp;
	Tue, 04 Aug 2026 07:04:09 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9C2-00000001Arx-0dVA
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 07:04:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785826987;
	bh=GImfhL+KrnsR6yE46cScayoU/oHI6MI5dbzBtOBfDtI=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=XOgqIWtfiJ6OXcStDIR+LMtk2As2wIWbX5KT0WloaeYjCj3s0PifaYRakAsdeFmy0
	 B60G1C3soQF/V+0OO5j4KggSLNCBBIGDL6+n3EhMibKZHDZs0Izm1PtKrqogRbe84H
	 0m9YDNl4pSZ/s52c/daQV7PQOxgmqRyWwoNL8evs=
X-QQ-mid: zesmtpsz5t1785826984te45056b7
X-QQ-Originating-IP: 6Q8/nwFx0eDR6Ricx/U13Cqzlvs5o09g4RmQ9XhTVkg=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:03:02 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11833633272755698400
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] clk: spacemit: fix PLL init and add K3 1.8 GHz rates
Date: Tue, 04 Aug 2026 00:02:54 -0700
Message-Id: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCwMj3Wxj3YKcHFMQYaFraGFgkJtRpZtsYWhhbppokGhpYqIE1FpQlJq
 WWQE2NjoWwi8uTcpKTS4BmaVUWwsAZOdEj3gAAAA=
X-Change-ID: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1264;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=IW6D+IWdo8RtEKyPetD9zVM5Djt1dC9dceqZ6CPr9gc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmFfYtkTV5o983YLS3xqe9/+2+mA3uutLnvZM3aoSb25
 pxbVu2bjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIm4H2BkWC4SbqxxxPTJtN9+
 b51m2HC1hx1yb9zj//Bv1YKayTmt8xj+F/zanH24JqrfPKey8yiHSpRIEX/wrLwSW1WHmzyfso2
 ZAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M+ZHGjti0A6oh9FAwEzDT/kiYFrs9+o7BPPgEoEV3tfHNOGihGf2QhF3
	8YLQQRSneIWsKQwvLwGjB2PfMiU00Cr+KqHX/LHFHv9MwpIVYYdosGNTrpVv2vt26wz8AxE
	FYYfJhL7Z1Z/bP2IYiA8IzmSkrDlJ2KDAXvzf1cNxIME+lmoO/sy6kHzqgZeUUoe/AF7DFP
	RQw3fp/J0/XPe5XmrynbTc2+jiqKY/IhuEsjZMwmC9GXNM0mUOnTyVfAScXKcVJWApHv4Ln
	mMTiFJFMqcaiefaDhNo8IQUGoZLutmfLBJWEOmg9X7TiqaymjZkjD3SjOk59QZlxbR4ZbzK
	d8Zp2EnmpEbySdJeQBsoXIKtniMKDsSNJOtkGlAywv8eVjHvoqXgOlOoxxL4PcBnu0Vi6/A
	oUwIaYv93nKTA7QnufOQFS/HNR61I3g6EJMHQAa8SPkr3LOHTakoLc/s7iecN52JuzHA2Dc
	MjxeoFdNVJm1X0pW42iz9Ce2QnJu7QyEkg/0xcJlW8cQL26pLbrnr1qt85hQFdn7v/UqtIE
	0zL2YbaVrgquzlMKK8D7qjIxY6haw2aTBOPLrOKVqeLQl9G86JjuL5m+CFbIAwQhSadRaE/
	XU5RGcroDZBfBoqbUyginHGOa3491ZfStiqc3B2yCyr0+V0+yD+opR+jVFyZ3JVXmHzx9R1
	JauLdpjWTfw5uHFSX3KOiKzBknOHevRPfeJr1iw8E8Y9o9tQXkUntFTcEX1RFHF5i6dazJH
	hEA0uMxyDy3l4uKfVT0I+p6zzujQrAmWApfrmE5mvGEbkEYNchLF4aaFpaFqjwAGF1bP0yA
	t226dTmuKuwgs8k5Pty1j970s5+HVIxWI0/J8+QbfVTgP5K8FGYu9FKipYLqOtDpCE21Uy+
	YhED2fZZ8GU/iHPUf7ChfI6TZmjX43pZQvx8xtU5gxxpUtmQTS85WzUJeNxKNWDz/H44qX6
	mS3G16BChH0NlyHJymBhohu1qqXkH2xIg8STgv7dLveUzycy+jhooPVld61v1MVRdnQfP0S
	vhX8esSvefKSZANX4ZLKfUJnn2D1jABqEg41y3CKHsagFEA4gM9zWfq//cKJVjJ45Od+EPS
	fI4waqVpGpEXpgFWrEVswNG6PRP3mGc9U2O0xGwW8BWWtugc5QqxjrC37BiJ2z3Xp2OPwfx
	iFYe
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_000406_962083_B6A3A0F3 
X-CRM114-Status: UNSURE (   6.61  )
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

The PLL and PLLA init callbacks leave a PLL gated off once they
reprogram an unmatched firmware configuration. Re-enable the PLL to
complete the disable-update-enable sequence and propagate any lock
timeout to clock registration. Apply this to both the K1 PLL and K3
PLLA implementations.

The K3 SoC may not remain stable when its A100 CPU clusters operate
persistently at 2 GHz. Updated U-Boot firmware therefore configures
their C2 and C3 clock domains at 1.8 GHz during early initialization.
PLL5 feeds C2 and PLL8 feeds C3, so add 1.8 GHz as the default
rate-table entry for both PLLs.

The related U-Boot change is available at:
https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b5a1b3e5cbbee223faf352

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      clk: spacemit: re-enable PLLs after init
      clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates

 drivers/clk/spacemit/ccu-k3.c  | 2 ++
 drivers/clk/spacemit/ccu_pll.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)
---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
