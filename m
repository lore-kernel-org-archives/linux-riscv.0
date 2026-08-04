Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DBBC5518F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 07:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56EHdSIADZBlo2db/ebgkPlrqucSKliugs0E3CCDWEM=; b=bXxXUDtnGEQXlO
	khvP5K9H0Lzkjpl544L8vMaQHZPMKdFAYhodNBYVVhYnVr23dB4jehqpJsc0nTbRp0rxyBIcSut0v
	OLHkTQCQBXHUDPN5dMdt23acb6wenm0MqB31D/Fmp6unlT3AcwvLcRMmB0IouASvYVL05XUXEOrFG
	hWXhc3Jbhaf6lg1hFYZlTuiHK5hyxToUC97QLoC0+zcGG7HRCUtduoSzSClg19nOldPIoDczgivv8
	HuAUnxuCfHPWPBMeVaE2COgTlABnfrePIEpd6o6koBMFN3xhOX59S1ctWAPY9fe7IoqO7vZdZXVQ/
	Z3EKofQ9/RB0xrUQEGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9C1-00000001Au2-43lR;
	Tue, 04 Aug 2026 07:04:05 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9By-00000001Arw-48vM
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 07:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785826994;
	bh=JxeHR9WR6YbITz8Accvq6oKveJ/YQXL91bc8ukBr7BE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=rGpwmOaTQ2WSjSWyY4HSb6mUNvYyzvA0Fo7wYX67VDEhDRbJDPdc8KbPwj3473efL
	 twrZnrVkvp78or732ZbLVq+D7KI/d+uyk9W++O8/qzMUYcdZEgCiNe60QdI0jw6u/K
	 qcioEx8FDMHg7rTRakmk86HPnRwSvwYfYjmvpKzY=
X-QQ-mid: esmtpsz10t1785826993te7252ff3
X-QQ-Originating-IP: oPWhoeyklrLrczWg0K86LHDJPUuUkvmNCuHodKu6Nfc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:03:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10466597976480000085
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 04 Aug 2026 00:02:56 -0700
Subject: [PATCH 2/2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
MIME-Version: 1.0
Message-Id: <20260804-k3-pll5-pll8-1800mhz-v1-2-a3a75866ce32@linux.spacemit.com>
References: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
In-Reply-To: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=s8SW+2iT48s0IYV1Q5M+r8l+mfKCLpiBxd0Xenj5kRU=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmFfUunZh2qWFuza/KFos78Vv+wRRNrA25480wwPznl2
 aPyWlmtjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIl8nsXIsDdBMPzK/pJZV5O2
 xb7O8DdbzfUkbL3oC+17xw+1mB6Ifcjwh8/o4KTzTA5i53dqfVMNNa3SeXL0sf71iD0zA79mKr0
 I5wUA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MOrL9Q2bZwNSa47uGVjg/tFZ7iyplumvBW41UC6yVDIdr2du8QecfXEG
	+xf/QsiPD4vLlvbKYe1/GpSiU5aZooh6uKtSz3NpHgzU6EZJ1yHvILTf4C0jZfQwm2eaffO
	3c9CoSv0yzIgJbGqc2epDZ+IHVVD8MKv/qzDWRLDeWwvhqqWl6D0BpS7BAafeNydVWV7gFm
	VB25XFs4uInAK6JeRs7C8w4a2oNFRmUeIPLorqOrsN8MUxWNpIz/j3bO8vEtRexz3+PXvIr
	L2kjUL1EY02M6hmstfe3NkMAymxG0O1pFAwMBmeokFuDtyC82bR4WvpuzWMmjPCk68WmWZi
	8feB69ioxA3wANOxCdyU/gAk2QOLeDr8ISqG26x65yCbsqBquK9at4fagwBsIxAwHy12E9k
	FI3EK2bb3Cetcc9UijDoJDloYwCpO4UPCgQmT85q8lQCo13CylFZTnOUpLBSnQG6HEtdDL0
	UJb2f+/LIfYg+Rf0WtOJz5v+OOejXW90tuvbDXaRz4rcs8syvC/cpoGoaM92rtJBwqWqJeI
	zb1FwAwF3CzXm3MvJIJIxi8X2HP96Ycznt5V13cNnSE7R2HoSb0V7lApNa+VTat/MawDUU5
	56Pseb4OQEMQdQoYXq95+LloOEEASGW4rNc25poEbRSyIvW+tqpW7HH/f1YYDXlx+Mwav3d
	6GbNU/g4iJ6pFmNQwGE7CG98sCTQjHIu/4k2wtLPEZkClRv6WOy8lEk+o059bGxNAUuGBRL
	Ir/CdPfHj4YPMik3TmznGrAwfdzm3hW5oRD5iraFEh67mLhU829sp79DNRUJPPV3qFoyKFZ
	13cZqbhgTOzVbZiS9V4EbCZoF2jlPXGpy57cnykk5dRapTn+Z4pfhsmQxrezVyFzPeMfnOh
	7vFwwvnPBGn35OkcebbW4os24Zica50S77YwdEUpmhjOhzOLu3Mrd80st2wSQKC37R9qI9C
	bVUUv8EQqTiGCRAHRp8Kz/M2Rt/V3ipzkv8tFmncfqbcWSAKM8RWa+5F1EJLnrEGDVcO8sE
	Yyy9pNWzp7pQGDn0zMH6aLN2TZtBeTCc2DIOeC8cPHKqGt8/Gl8uNxYqrq+E+bqHHQ19gYS
	egsXdfs55o/2TaehwSEyCO2zPB3sZQ8Qg+WkSYet+wElCQLn4oIHEtwQkELluLAw4WGJprz
	V1jO
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_000403_440850_3FF32F31 
X-CRM114-Status: UNSURE (   8.27  )
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

The K3 SoC may not remain stable when its A100 CPU clusters operate
persistently at 2 GHz. Updated U-Boot firmware therefore configures
their C2 and C3 clock domains at 1.8 GHz during early initialization.
PLL5 feeds C2 and PLL8 feeds C3, but 2 GHz is currently the only entry
in both rate tables.

Add 1.8 GHz as the first entry in the PLL5 and PLL8 rate tables,
switching the driver default from 2 GHz to 1.8 GHz.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..e8b7ce89c2cb 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -38,6 +38,7 @@ static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll5_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 
@@ -50,6 +51,7 @@ static const struct ccu_pll_rate_tbl pll7_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll8_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
