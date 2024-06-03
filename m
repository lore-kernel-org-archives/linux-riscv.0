Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F2BC25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0xpejqi3nXJzUPI2RQ6XDsqU2NCuYg3Pqi1Ir9aYnew=; b=ietdJbJGV6+dKu
	ZaBIj6Pfb0fc5EV+BN64/jUNDt0WC5Qf/ugYkar4zLRuk3H1jOp/eJBSyrJhGSxXPM8KkijX8FuN0
	c5l1HYqoFTLXFQ9ry/5XqvfDHCe9iRpQZ2kWtevq3wdRD3dbF+R7O1ir1GIk8qgISVQc7SWpNcQ14
	4Eqtzt1IYxqAC/RXEHcF5XPb5y4H28qdBdwcSRZltvLpvE129huydhG8xg9ufqgdTi4GL0OTZ3Sql
	YP1BW01NfkKT4GP1WjHvq5n+QaNsRCDYyMxFrh39E8PlgBETkUWRQA8yU2eeDraLpH0BbRVmTWII7
	RzECYSw74gAWOo3JhuVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9IM-0000000HC21-1lUl;
	Mon, 03 Jun 2024 15:08:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE9IJ-0000000HC0n-0vR1
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jun 2024 15:08:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A6154CE0E07;
	Mon,  3 Jun 2024 15:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23808C2BD10;
	Mon,  3 Jun 2024 15:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717427288;
	bh=1LghNGb+MlPDCrG2ALXq6pd4e28ByNfi6yCj4rKbg7U=;
	h=From:To:Cc:Subject:Date:From;
	b=kJl7ltLtHUBtHw+dr8yY2gqLfLNOC3nQYXX1l7bOoXEf9k7ClSc6CkObMHih0qC4L
	 7L/y0c3JEhyQoCgNuAoYKgEwTFywuKwt2e8H9Tuio7sOG+4m1RCfMQ6uJNO9ymVBYK
	 VM78MLPb0GsBmAufn6njEb6zRypuOG7KsR91/kbrZLFVgtTQxbjnO3HqjrKxM623rY
	 cNp2+kZZx/1v1+KpGDJTV7KlOBNtZgE+5/l75Mjw9u79T7+FqLSKa9HIThHP/VXS2r
	 zsSzr3mZWZzyUQc9X3uDbimh7Wk+so+ppMk8mi+HsehIXoV/J5LIH2i3TlULjwGFMf
	 JrFsewrkg7uXA==
From: matthias.bgg@kernel.org
To: kernel@esmil.dk,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	aou@eecs.berkeley.edu,
	duwe@suse.de,
	linux-kernel@vger.kernel.org,
	palmer@dabbelt.com,
	heinrich.schuchardt@canonical.com,
	paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] riscv: dts: starfive: Update flash partition layout
Date: Mon,  3 Jun 2024 17:07:55 +0200
Message-ID: <20240603150759.9643-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_080819_443747_4476D964 
X-CRM114-Status: UNSURE (   7.80  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Up to now, the describe flash partition layout has some gaps.
Use the whole flash chip by getting rid of the gaps.

Suggested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 8ff6ea64f0489..37b4c294ffcc5 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -321,16 +321,13 @@ partitions {
 			#size-cells = <1>;
 
 			spl@0 {
-				reg = <0x0 0x80000>;
+				reg = <0x0 0xf0000>;
 			};
 			uboot-env@f0000 {
 				reg = <0xf0000 0x10000>;
 			};
 			uboot@100000 {
-				reg = <0x100000 0x400000>;
-			};
-			reserved-data@600000 {
-				reg = <0x600000 0xa00000>;
+				reg = <0x100000 0xf00000>;
 			};
 		};
 	};
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
