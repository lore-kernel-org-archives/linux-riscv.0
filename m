Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEF0C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 14:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D9qgq4kNA7M+BuYFAA6iLh2XMO1kX0Uu2S2uLmV4QNE=; b=CrTAwLYu4HjAwO
	UTr3rHvIXws0FiRUHCoGnCPwvJKsDLLCMJvnjd4tC/23qVbxwsnmCrYxJL2PAZZSOrF8s1CEi6+hG
	nUcuCTeBPNQxB6O2B+3M0J5FEWVQnDwTE+ITa8Etd7nb41Ks/GwH/mkDDvwDjDYsHaK7zIpWRI07o
	MdPmhz4CvG6ac36c/MgnmzQ6v1TMrtXujyYw5bdTjY7FvgK3Xk5jRutWx50gIWucrL+dLvSxaaX/c
	ke7dr73Vg95XcOKjmegOrfGhocVTUmi4Ktt2hFBND+eIDRoGWvqiz3y5MtuYyecK0RNgtHJwaqdnc
	pidPujCd92zIjlYoV+kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpGE-004RK3-8K; Tue, 19 Apr 2022 14:55:22 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngoN5-0044Kv-TI
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 13:58:25 +0000
Received: from workstation5.fritz.box
 (ip-088-152-144-107.um26.pools.vodafone-ip.de [88.152.144.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id AC8923F773; 
 Tue, 19 Apr 2022 13:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1650376692;
 bh=9TNFholiRJXqbGHcOH+prBcFcS5rnvuKQv52QUBJe7U=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=hVFPWrPbONBJB2tlLgQ2nNkvJy1NRd6M41wxLPj/RxKiK4EkPj2WPZGLsEbMzRDTb
 y3csCsWnCAuzFo4w2aDHEyB+NGzo4Z7pUowo7f58YT2d7ZWV6vAwGgmF95g4kpQOne
 pxvc4Os4g8wJKmEdacpsYkM8bXd70hP0pmiXFHb68SylREa2lMvezcm8aNbMEJm9/A
 Q36YCkYZ8eBvCOopTyEzWUA/nPOxwyJnyQIIX+8sEBy95NEEfMI7KeRnDwtT4Rm3Dn
 EHySt2Nwno2k9q8xvUhkW0ppRfnhfiU2Z49cNu+zSUY4T+1tLLrKzLcaIRcf1YUPzH
 v5uEVfomjlbUw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
 Jens Axboe <axboe@kernel.dk>, Mayuresh Chitale <mchitale@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] RISC-V: defconfigs: add VITESSE_PHY
Date: Tue, 19 Apr 2022 15:58:07 +0200
Message-Id: <20220419135807.164266-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_065824_159468_784E1830 
X-CRM114-Status: UNSURE (   6.97  )
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

The PolarFire-SoC Icicle Kit uses a Vitesse VSC8662 dual port PHY.

Enable CONFIG_VITESSE_PHY by default to provide network.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 30e3017f22bc..12908aa7766e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -63,6 +63,7 @@ CONFIG_MACB=y
 CONFIG_E1000E=y
 CONFIG_R8169=y
 CONFIG_MICROSEMI_PHY=y
+CONFIG_VITESSE_PHY=m
 CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
