Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E6AE77198
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 19:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UNoRl5g05Eo1uO+jD8IhnkzklQNjxNVnP9er+2Da1pI=; b=XdUS/41tiCSRaN
	FnT+eMRVbsKDuSK8UQ1NwzaMHcNVb7Le+XimSkGQAL3DxPjmdxAe6T11WLvQw42Rd5v3PyQZcaVpz
	LMFm89uo7Z1rNhNqNNg3fp0TwysByoJBuPNAG9MxKC/Ppe+D/1+7aoROI1G0NzhZB4fF3/Qc4yv1m
	Xolg8236UCJm0k9qtlqNaeJDME1DftmdJaD04w8RTtfbR7S06ly4QOrctaloJwgrJviPahZX7l1j9
	AXzJNTazucbwD3dd4ooSFEbMQg3nlgOq/m9QlnCEU7Vs/n3BWbkA8m51Js7uGTFPxngmxFe/ymjTF
	jqysGKzygWPBh8OATs/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR8m-0000000BIoG-397V;
	Thu, 02 Jan 2025 19:45:56 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR8j-0000000BInq-2XdW
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 19:45:55 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 8F1D6B4B3275;
	Thu,  2 Jan 2025 20:45:49 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/5] riscv: dts: starfive: jh7110-common: Sync downstream U-Boot changes
Date: Thu,  2 Jan 2025 11:45:06 -0800
Message-ID: <20250102194530.418127-1-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_114553_789086_B9A29C80 
X-CRM114-Status: UNSURE (   4.24  )
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

U-Boot boot loader has adopted using the Linux dt-rebasing tree for dts
with JH7110 VisionFive2 board target (and related JH7110 common boards).
Sync the minimum changes from jh7110-common.dtsi needed for boot so these
can be dropped from U-Boot.

E Shattow (5):
  riscv: dts: starfive: jh7110-common: replace syscrg clock assignments
  riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2
    cycles max 100MHz
  riscv: dts: starfive: jh7110-common: assign 24MHz clock-frequency to
    uart0
  riscv: dts: starfive: jh7110-common: add eeprom node to i2c5
  riscv: dts: starfive: jh7110-common: bootph-pre-ram hinting needed by
    boot loader

 .../boot/dts/starfive/jh7110-common.dtsi      | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)


base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
