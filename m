Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B43BC4332D
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73AFA23110
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 01:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73AFA23110
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n5Ub4icfffpGYxgqaLGGZocz/e3gRgwdny1Az4mJ+5A=; b=BIUvX3EUZtt3EA3uqKXcB7Vb+
	2ooOMeBH68pc4sP9NrKB1I2eP7K3T6aicBsCPiNiyDEPANJoWzp3L8jbT9YvA3LzV6lJ0bDBDloes
	v8p7vEHUN6Z63Lwy92x4Tcd5VCMAEvMnjNP0Ko4tdWDoY/WgbMZxjOTrlT+xLXFcn9ymFDPh7DVKb
	WNtZwj5eaCBvps2WmbN+jxH8F1LsRXms1e6LkBe51LX2psD949Gn/gHD7dqeYuKf8lFnhfnfbkLS9
	z6/IHSYOI4CRDc5Bti8ne9WxsosfIekQ8EyYWCYVzQYgHisDVVfBhwaXisiuO+3o4iHcOivp/nitm
	DmRtA/AhA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l22HH-0003Du-4J; Wed, 20 Jan 2021 01:27:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l22Gg-0002qo-5t
 for linux-riscv@lists.infradead.org; Wed, 20 Jan 2021 01:26:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C1AD22241;
 Wed, 20 Jan 2021 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611106001;
 bh=3G3E7KWC6d4c7VoJN3B4ZwtGBHWj7WRyCTjKW4mNPCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hu5v67N1ncDAIBT7W+wknGyzXsQY3x6CUKXJ4EgI4cvMv08rmkqUPjOpub7oXMS6z
 LefJZT0JVLbVposI1Jcw8K76BRwwWdxdxWSw2y8L7HTtDg217/dOJffYTmWhPvdKOY
 r9+24L8XN4gmI1FMU/o/nTW/bMsEFv1AAaQd2L6wOZBl+FMyKSE7fTeWBrIIRYfUJR
 uCAIcKmijQAJO8gIBOTYdtCA1JJh8QMfpsM6SdFX5OTSRPDsal90Gxax03j7XqTORS
 SeZYBWmrA+uQyWdxJGEj06R/3sq4ZU89hQAVOObdQvKXPMOnMeR1eL2WkTN2DSALB/
 Ra1yb6LHOyqPQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 29/45] dts: phy: fix missing mdio device and
 probe failure of vsc8541-01 device
Date: Tue, 19 Jan 2021 20:25:46 -0500
Message-Id: <20210120012602.769683-29-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120012602.769683-1-sashal@kernel.org>
References: <20210120012602.769683-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_202642_330597_36C6DBF3 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>

[ Upstream commit be969b7cfbcfa8a835a528f1dc467f0975c6d883 ]

HiFive unleashed A00 board has VSC8541-01 ethernet phy, this device is
identified as a Revision B device as described in device identification
registers. In order to use this phy in the unmanaged mode, it requires
a specific reset sequence of logical 0-1-0-1 transition on the NRESET pin
as documented here [1].

Currently, the bootloader (fsbl or u-boot-spl) takes care of the phy reset.
If due to some reason the phy device hasn't received the reset by the prior
stages before the linux macb driver comes into the picture, the MACB mii
bus gets probed but the mdio scan fails and is not even able to read the
phy ID registers. It gives an error message:

"libphy: MACB_mii_bus: probed
mdio_bus 10090000.ethernet-ffffffff: MDIO device at address 0 is missing."

Thus adding the device OUI (Organizationally Unique Identifier) to the phy
device node helps to probe the phy device.

[1]: VSC8541-01 datasheet:
https://www.mouser.com/ds/2/523/Microsemi_VSC8541-01_Datasheet_10496_V40-1148034.pdf

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 4a2729f5ca3f0..60846e88ae4b1 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -88,6 +88,7 @@ &eth0 {
 	phy-mode = "gmii";
 	phy-handle = <&phy0>;
 	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.0771";
 		reg = <0>;
 	};
 };
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
