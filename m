Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C1CC3DA78
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jan 2023 21:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Aae75CW1bhObTOXGregMaByuDr/O9NSA/2gGTv511Ug=; b=NVDKEdx/UhaJgl
	87fpY7LdQJG2rtirSvTywAg+F/Qukkt7Uv2nU9FNPlndR7UIdXhjqKkcy3evO0gVNGMJvAwTZRISU
	cpIrw4W1blopCtasrvXZxvNX9WwFiahNFijeWY2DM/yotmnuEEXrZ3qjwClmzm7XnhVKq2wLeusTp
	jwEa0lTrgmMunDnoUU0VJZXeWqW36m3suI33xqYarqVbNcpL8VbJzLDtFa3UTwH1gizZRHkD/nOCw
	YtrRuigZQVHPMaE7gYE3ZdOGPSjBt0b0YnYywBETIokwNzC+I9FXVrE09n1X4q0/OsY34Kl/VdQAY
	P1ttaqUDKnnTqblNgqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRWu-004b2Y-Al; Fri, 13 Jan 2023 21:24:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGRWl-004axJ-Q3
	for linux-riscv@lists.infradead.org; Fri, 13 Jan 2023 21:24:00 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pGRWk-0003WV-27; Fri, 13 Jan 2023 22:23:54 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH 0/4] Zbb + fast-unaligned string optimization
Date: Fri, 13 Jan 2023 22:23:47 +0100
Message-Id: <20230113212351.3534769-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_132355_909619_F2AE1CE3 
X-CRM114-Status: GOOD (  12.01  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

This is a follow-up to my Zbb-based string optimization series, that
then adds another strcmp variant for systems with Zbb that also can
do unaligned accesses fast in hardware.

For this it uses Palmer's series for hw-feature probing that would read
this property from firmware (devicetree), as the performance of unaligned
accesses is an implementation detail of the relevant cpu core.


Right now we're still in the middle of discussing how more complex
cpufeature-combinations should be handled in general, so this is more
of a concept on one possible way to do it.


Dependencies:
- my Zbb string series
  https://lore.kernel.org/r/20230113212301.3534711-1-heiko@sntech.de
- Palmer's hw-probing series
  https://lore.kernel.org/r/20221013163551.6775-1-palmer@rivosinc.com


Heiko Stuebner (4):
  RISC-V: use bit-values instead of numbers to identify patched
    cpu-features
  RISC-V: add alternative-field for bits to not match against
  RISC-V: add cpufeature probing for fast-unaligned access
  RISC-V: add strcmp variant using zbb and fast-unaligned access

 arch/riscv/include/asm/alternative-macros.h |  64 ++++----
 arch/riscv/include/asm/alternative.h        |   1 +
 arch/riscv/include/asm/errata_list.h        |  27 ++--
 arch/riscv/kernel/cpufeature.c              |  33 +++-
 arch/riscv/lib/strcmp.S                     | 170 +++++++++++++++++++-
 arch/riscv/lib/strlen.S                     |   2 +-
 arch/riscv/lib/strncmp.S                    |   2 +-
 7 files changed, 245 insertions(+), 54 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
