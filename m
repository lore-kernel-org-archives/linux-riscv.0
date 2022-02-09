Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A02AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Feb 2022 03:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pNc/KiswpFN3JxqVKHQjIJiLennupwYuOTMbQ6ql7wU=; b=yH8eQwRP2tXKMV
	mWrPqAkVnIhxYV1eJeTXdtEnar/UGgFd2FIeMGn3U0LPsAZakwnVV3YtdKUoJ97skihfZAQpHO8HY
	HNtAK5A1CbW74lV8IcZRf0au5HlKqO6UWULUxc8ZLBR7oz7/z0fuscfm2+i7HYYt3NmrcZ8AXMS4m
	UGEDXJjOQ2P1gXl3mRn+mkRMwFUxF4/9ylbbzS6IWoopUGSYV/PeZhvAk485P8RMgBSXl/4rWkiMq
	wQJuAItrvrW2rkvw1mItE59+zpnnBO+1ibB6I2GnLMCv7FCrU4aDysoSpY4/9NPWgBqzw4vD7qhB9
	3Xt5Xe9Gb80+FqYSZJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHe5m-00GAnc-Bf; Wed, 09 Feb 2022 03:56:30 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHe5k-00GAgW-22
 for linux-riscv@lists.infradead.org; Wed, 09 Feb 2022 03:56:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1644378987; x=1675914987;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6xBdQeFHs5Q8rpsiPOuL0FT5W8+R6uONp1peQ6TMhmY=;
 b=cYRManAglGZAZJnV2Ux0eAXkGkrfIDINFu4035nY9HduaMJyoXIM+1er
 cW/B3cPMMaoCYo+cHtyARWeE8LjyHlMO+cqzg9rNjM/PqJvn98bK+OkcL
 zyCG42Cj3GptbvMs/kWeG4A+8q6EGN+jQVWjwztNtTQUTFJRZWv20Qz+D
 g1iCUtKovRfrng5018CwtKq3jg2klSx94xoAm2Kfel4mSp0Lf27HSXICL
 yMQE7VMX7MNYwH5B8xbgdYtxlO6bF9MtocS0JtbgtKrsDb6/staYO8zHm
 5k6O1Rblyar2Z4yKvupJWvyHs5/aOXBbm3Tfn2v6uZofEGAFzVn6zs2qj A==;
X-IronPort-AV: E=Sophos;i="5.88,354,1635177600"; d="scan'208";a="192472466"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2022 11:56:26 +0800
IronPort-SDR: czRYQZUOJGF3HqdrwXOu9IH7qiT8ofo1Dioq0XE+8itWH4dpYklG95GnrxzfNooCGYLSkTyQla
 1fJXjM4fvu3aD3ArjX/BqH8Ky3ldDCOTL4FMvpI3bsjJdfQUUSawXKpLJLatl2pCigez/SQ9GX
 nyFDq0BzxQ8ZRkBrvnkOIVtouFpYszgYDGBfnSG0E02CeNRup82WRUPgzQFFemLZlXqsMKg4Ud
 Ezszz6RZOf2/O88maYZyV/p5zyXon5Y+NUoufyFt7vv3GQEr55rveN5Aqa/HfJCRJc6k5rY0Ww
 6y07RqEUBteJEIHaE77bvrBo
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 19:28:15 -0800
IronPort-SDR: EzbGpF7j/PVzwwxJrA8CJlLfhPLs1pOtOBgFLWS1p6EIB7Kri9x66B6XuBxsLI1/lsucNR6BQK
 pGDH7YyB68HkmJRey6+1j1CaqivpRtwW/Q+NOmjjBH1LPc2pjdKv+K19DvNaubecCnshFSQvBU
 TzSJDl0+2h0w/uKXzQ4vXk83km81AevcaJQjharV4P/mjfg88VkoQpC3g+Eq+6E+YrgfW7CWZp
 0zClDNttkUkx7iK5uVeLx1zNg4QQpgFtufrKW1S2d0+yRl4u9isRT+8Y1nrW+pD+f7oJprnAni
 tuo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2022 19:56:27 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JtmJp2yrLz1SVnx
 for <linux-riscv@lists.infradead.org>; Tue,  8 Feb 2022 19:56:26 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :x-mailer:message-id:date:subject:to:from; s=dkim; t=1644378986;
 x=1646970987; bh=6xBdQeFHs5Q8rpsiPOuL0FT5W8+R6uONp1peQ6TMhmY=; b=
 bImfyICL9Zcct6gF1PRrgQBNcDpcHkZypqUa/yJpJDFsyVPJRxyOVdSJEonosH+Z
 xfFUqRk7ovlgoysPInXKb8OVi7ph//6fK0E40swtVj5/WjwKDLz5nYLAt9aTa6yo
 ZS+L07BENuvsRb+nbmw9IPVZPXHDNjuA3nb1fNFXnClJwsSBjcC0WUFkHYp561Vz
 wKoKQ6Flkdu8CP1Rs9aF4FFN+z0b8Os7D4wEJIIQAOZQTqvtKp/3a+ZIUL1fL64g
 s5Pn1oiFi6FQbG+y9LQhbItClPZL+aC+PyIG7lTyOoyBA7M8vI8Pdx9Y87r5BVoc
 j14NPY8B5CQmLMe5nbIL3A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id JE2p4cjo4AMR for <linux-riscv@lists.infradead.org>;
 Tue,  8 Feb 2022 19:56:26 -0800 (PST)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JtmJn3JyWz1Rwrw;
 Tue,  8 Feb 2022 19:56:25 -0800 (PST)
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: fix nommu_k210_sdcard_defconfig
Date: Wed,  9 Feb 2022 12:56:23 +0900
Message-Id: <20220209035623.243675-1-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_195628_183419_94DF1C52 
X-CRM114-Status: GOOD (  12.74  )
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

Instead of an arbitrary delay, use the "rootwait" kernel option to wait
for the mmc root device to be ready.

Signed-off-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
---
 arch/riscv/configs/nommu_k210_sdcard_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
index 2a82a3b2992b..af64b95e88cc 100644
--- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
+++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
@@ -23,7 +23,7 @@ CONFIG_SLOB=y
 CONFIG_SOC_CANAAN=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=2
-CONFIG_CMDLINE="earlycon console=ttySIF0 rootdelay=2 root=/dev/mmcblk0p1 ro"
+CONFIG_CMDLINE="earlycon console=ttySIF0 root=/dev/mmcblk0p1 rootwait ro"
 CONFIG_CMDLINE_FORCE=y
 # CONFIG_SECCOMP is not set
 # CONFIG_STACKPROTECTOR is not set
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
