Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E5EC5B572
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 01:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8IypSBez1vnnk0zYfwBhMi+VZrLxq0wKeGzyYIwF5Gc=; b=OgeE5E+PJGQiSJ
	vkpZ5Eb1HIQmjoYtqHqRqkCVhJ2LbICBA6rfqwygpwJSpAXE2AMHVMqOPBfUcD7FFaOec0brpeyxi
	R6fgpSrwaGD6np4/Ke/KT35iIT2J8h/349QhDRnPKkWySOP7GFYD47j/lJuLmmXBcTkWgmShr/tX6
	p7xMME4mEX55XEwdjJ6bJelRUoKPq0njvzGak7VvxAlUeWb5ayKfQ/erhqDvRqQ7kPFiI7emFbKoR
	ejhCKsi1y+/O7cEY+fIAEs9K7YosPIflIBx6cLWYD6UUS7Wh25k6vTFwvSwtApOzKrYR9xzQ4bnXZ
	Ee0Gp4jPwQbNT3UUpayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3es-00000003NoU-3HSD;
	Sat, 15 Aug 2026 01:58:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3er-00000003NoH-2PEd
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 01:58:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A759260008;
	Sat, 15 Aug 2026 01:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FBA1F000E9;
	Sat, 15 Aug 2026 01:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786759080;
	bh=rx1u2vR9HpIVmw5IjJJbTK6HYVGFK1DvmadtnCk63NI=;
	h=From:To:Cc:Subject:Date;
	b=Y1ZnTeLFgA3QtO+GxscAANY2o3OpcXW4mZIY+kueO923p4v+VIT92LwsTUVijS5r8
	 YIomW2R3I1qRWGPiSQFnBz+Vqh6trsYhblcsKxLW5yfOC4Eu35JWik1E7ueQLObdDl
	 FnfpSn8qb+9EIBBF9JzQQwsl3hm1UuWluODrTuGDxKGr4O+8Aiz/JJncpU1JLsgR0W
	 mxuELNGB9QKFEe2/hlkxD1tHeycbFLivweTZmkiIoqGgDxbeI1P0meri81Z+aqTfeN
	 d61sJKa6Yg+CdQY2g7OXppekm5VXwYuvqulRKUyTa4mkcYddS4+moTdA/i54qc7T01
	 +nSl2USH8pjWA==
From: Guo Ren <guoren@kernel.org>
To: robh@kernel.org
Cc: devicetree@vger.kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	conor.dooley@microchip.com,
	krzk@kernel.org
Subject: [PATCH 0/2] dt-bindings: Add Xuantie Semiconductor Co., Ltd.
Date: Sat, 15 Aug 2026 01:57:20 +0000
Message-ID: <20260815015722.1736831-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

The RISC-V CPU bindings currently describe the XuanTie C906, C908,
C910 and C920 processors using the historical thead vendor prefix.

Add xuantie as the vendor prefix for Shanghai Xuantie Semiconductor
Technology Co., Ltd., and add corresponding xuantie,* compatible
strings for these processors.

The existing thead,* compatible strings are retained to preserve the
Device Tree ABI and compatibility with existing device trees.

The vendor information is available from the Xuantie declaration
page [1].

[1] https://www.xrvm.com/declaration

GUO Ren (XuanTie) (2):
  dt-bindings: vendor-prefixes: Add Xuantie Semiconductor
  dt-bindings: riscv: Add Xuantie C906/C908/C910/C920 compatibles

 Documentation/devicetree/bindings/riscv/cpus.yaml      | 4 ++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 6 insertions(+)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
