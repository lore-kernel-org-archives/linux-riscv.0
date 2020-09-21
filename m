Return-Path: <SRS0=aYu6=C6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0896C43466
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 15:01:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3981620758
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2020 15:01:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jIVUy3Vl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lS2A5epG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Np9xI6HE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3981620758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+TqI5a9R41V8yx3rM9mpNHVN4cCsQY4yw0GmnSvVDJE=; b=jIVUy3VlPs/L6G50VoCbPG4d3
	iE4m9MvVnDYpAij4YcqITUnvsGBc1bknw2lC3MnpGmePZIcBYd76n+w7mOtF1kC8lZ5/YFwirjXoJ
	OXSd9W08KMoYRhnfsqeflyRmUGkOF4TeJ2S7vpMAp/+iN6DOlqEvVPbdrgP2Yvg75oA426+I/w0rC
	P0dWe+auqZnjkR/DwOr4RDVy4jTufO75bHxoaidRQszhiUlSGsLycK9+/Edh4eJ1TfoLJxTGXCjNP
	EsPe9JufPihRIqyQdVnXPc9iRnBAJCNkBeQpcClRqaUMa8o72HurPjHEWgi+qXlBnV3YHbtTy2FEX
	/+PR05E/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKNK3-0003Z9-Hy; Mon, 21 Sep 2020 15:01:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKNJt-0003Xj-I1
 for linux-riscv@merlin.infradead.org; Mon, 21 Sep 2020 15:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tmsWZpm5Hh5vfgm0iPY1FvJ1Lddd+IG1MjivURqlGAI=; b=lS2A5epG/xryNQFCYDVv3rWDGo
 ScbxlSI2a+Oss7pyX+3FIpaZyqhKtMVIF8nrW7W222C3lYvIo8FHVDHp8LCcy9/kjZIdi8puMYKl2
 lvsjE7azqFUV1lQKy6KtICOMiVUmXL2s4S4an5a/YI1ndnA2bU+KFlQGEYD6ZxQC8Ft59yv3gcPKx
 Wp4g1uo9b6iD77wtZThaj9+bslCa3GEFbwf8ZZxBgDOk8xfmw3IYZ01qxXO3Faofg5rwplbdW8SQ8
 Yjbf5whW8jLgK1oVFl20EpcpJjdpLg8N8SLxWCd3juD5Knjcu0A9krHZUKrJpj0aKy9cMoJ4YqyRb
 3n1am0lw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKMzv-0000Qz-Gx
 for linux-riscv@lists.infradead.org; Mon, 21 Sep 2020 14:41:03 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CDA5423787;
 Mon, 21 Sep 2020 14:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600699253;
 bh=FmF/pbUJKzdSITSRYqcFNxLSTZy8+HviO1AYZWdz6Y4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Np9xI6HEtyAPHhyAQjaKte+AqInv4ee4nuCQ3q8acZYja8DHC9y8a8nPq2SjmB4yn
 0n3H1bYpLkbtzTZr9GGx2tvN33SI/ccW8ykXZiQyHWm28rk8IoVPql5IgG4/AjTzyW
 HP+4XcIm9ToBfSbRfkltX0AWXDnL5rNVF+ac5YRM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 20/20] riscv: Fix Kendryte K210 device tree
Date: Mon, 21 Sep 2020 10:40:27 -0400
Message-Id: <20200921144027.2135390-20-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921144027.2135390-1-sashal@kernel.org>
References: <20200921144027.2135390-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_154056_068422_7AA01E98 
X-CRM114-Status: GOOD (  13.28  )
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
 Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Damien Le Moal <damien.lemoal@wdc.com>

[ Upstream commit f025d9d9934b84cd03b7796072d10686029c408e ]

The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
(sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
inline with the sifive timer definition documented in
Documentation/devicetree/bindings/timer/sifive,clint.yaml.
The device tree clint entry is renamed similarly to u-boot device tree
definition to improve compatibility with u-boot defined device tree.
To ensure correct initialization, the interrup-cells attribute is added
and the interrupt-extended attribute definition fixed.

This fixes boot failures with Kendryte K210 SoC boards.

Note that the clock referenced is kept as K210_CLK_ACLK, which does not
necessarilly match the clint MTIME increment rate. This however does not
seem to cause any problem for now.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/kendryte/k210.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
index c1df56ccb8d55..d2d0ff6456325 100644
--- a/arch/riscv/boot/dts/kendryte/k210.dtsi
+++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
@@ -95,10 +95,12 @@ sysctl: sysctl@50440000 {
 			#clock-cells = <1>;
 		};
 
-		clint0: interrupt-controller@2000000 {
+		clint0: clint@2000000 {
+			#interrupt-cells = <1>;
 			compatible = "riscv,clint0";
 			reg = <0x2000000 0xC000>;
-			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
+			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
+						&cpu1_intc 3 &cpu1_intc 7>;
 			clocks = <&sysctl K210_CLK_ACLK>;
 		};
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
