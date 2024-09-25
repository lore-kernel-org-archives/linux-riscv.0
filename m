Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA8BCF9C6C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Sep 2024 05:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Cc:Subject:Mime-Version
	:From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W3tarJYNA+lT2UP7GBbtpQZ4IY02dUZ8u30POCbw6W8=; b=PZintYj7/cs4AA
	Sb5ZAN8UNR9tJL4GLIdJfC7wxZbBXr1CFWfmPc6SZd8BG297LgPIXxxVY+RjvOebH5Bn9jl0g7qc9
	kiZs9n6gPZxMPK9ny5pKVsmCdW6wC/wWORrJJf6nZ0CGjhUcJxUj8+Hosewo7vpW+UMbL1AQ4CLB/
	dxGvoLWXMC9C0gF8AZWuqMoarIqXx7tRJ1uK+4w98s6CEKs2A9iua0v4Bf7k2TXUjddRIqIOD7vi5
	mCQOM790jF2EIKvLcvKocrQC81v3qIfsK6D5cgCImmfSDmZYZGSnwhuLRvF0d/dwi9Vg5A5Jhfc+E
	LcynWh1fYAVQqlDjwflQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stKdj-000000043l3-08nZ;
	Wed, 25 Sep 2024 05:32:39 +0000
Received: from va-2-33.ptr.blmpb.com ([209.127.231.33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stKd6-000000043bu-17KD
	for linux-riscv@lists.infradead.org;
	Wed, 25 Sep 2024 05:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727242314;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=iy42TWjLv/vDM34ep/68yh7Y4irPt0UekOnR/gtNfl0=;
 b=E05DyR1RNb8queUCubKTEN3uMM6XfAn6VsNShwMqcLw1tMfezT7op6z/ZRV2LXHVI9vbm/
 frqjCWzUyfnYBKV1HBKbFeHM5tEX7s3KOM0mRn9a0ostCmhQvxEWtC4lSHLOTAUQBqLRU3
 ioSWiL9k04u/QS0q1o73LlqP0q6difjzDIDigvLRmjyTrkZjD3rNdRPd9iX1/wGvhnO6ZL
 cXnNahRAz1Fkq+bcOSXLrO60oWTYznKr0v9mc6INcz/iiXMqVwXaJhj24HTCMFWo7ltJnf
 IsGwS1Ezvg25SCGa/nlzhLJGNKH9KDT4Pam0dKRypvkeNl/dyYP5JN804hXdrQ==
To: "Emil Renner Berthing" <kernel@esmil.dk>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+266f3a049+97f8b2+lists.infradead.org+sandie.cao@deepcomputing.io>
Subject: [PATCH v3 2/3] dt-bindings: riscv: starfive: add deepcomputing,fm7110
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Wed, 25 Sep 2024 13:31:52 +0800
Cc: "Conor Dooley" <conor@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heiko Stuebner" <heiko.stuebner@cherry.de>, 
	"Neil Armstrong" <neil.armstrong@linaro.org>, <rafal@milecki.pl>, 
	"Linus Walleij" <linus.walleij@linaro.org>, 
	"Michael Zhu" <michael.zhu@starfivetech.com>, 
	"Drew Fustini" <drew@beagleboard.org>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<dhs@frame.work>, <ams@frame.work>, <gregkh@linuxfoundation.org>, 
	<yuning.liang@deepcomputing.io>, <huiming.qiu@deepcomputing.io>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
Date: Wed, 25 Sep 2024 13:31:22 +0800
Message-Id: <20240925053123.1364574-3-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.34.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_223200_579720_F7388E6F 
X-CRM114-Status: UNSURE (   6.00  )
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

Add deepcomputing,fm7110 into compatible list.

DeepComputing is creating a RISC-V Framework Laptop 13 Mainboard 
powered by a StarFive JH7110 processor.This is a developer-focused 
product, aimed at making tinkering with RISC-V more accessible.
The Mainboard is under development and we'll share more on functionality, 
compatibility, and availability as the program progresses.

For this Mainboard, the Model name in Framework is Framework FRANME0000;
the Model name in DeepComputing is DeepComputing fm7110.

The board features:

- JH7110 SoC
- 8 GiB LPDDR4 DRAM
- 1x Type-c(PD3.0:60W Max;usb3.2 Gen1;usb2.0;DP1.4:4K@30Hz/2.5K@60Hz)
- 1x Type-c(PD3.0:60W Max,usb3.2 Gen1;usb2.0)
- 2x Type-c(usb3.2 Gen1;usb2.0)
- 1x eMMC slot Support 32G/128G
- 1x MicroSD slot
- 1x QSPI Flash
- 1x PCIe Wi-Fi (Support AMD RZ616 Wi-Fi 6E,Intel Wi-Fi 6E AX210 No vPro)

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 4d5c857b3cac..778617e1dc43 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - deepcomputing,fm7110
               - milkv,mars
               - pine64,star64
               - starfive,visionfive-2-v1.2a
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
