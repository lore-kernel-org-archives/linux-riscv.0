Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8EFC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:59:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90865222B6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90865222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYne9QtjJrNw0hp0wKa/yz3SfGu5d9Rgqq62vOakF3U=; b=LRautsPlj/+taEjew6DxUt1vU+
	pFjlfr6GuSREnTMTReFX2k45jZmUUGXK66rQnJ9Mdc2BUALopasDnSf9ZMNWp2HQ+krBoaDNennBy
	q40OgUc+k2g6SPqmN1N0SODZO2D+YzHSjaiDlDQVKxAH5MqDz/tAMjToy3uJZtBbidgRisPKmmp6c
	MfzhlC2M9v5mj9VirP9Q0agdORjEypIH0UoDC9Sx2Sh6y1nR/ieNf8BBgIv0f+c6IYs+LkjkUZ1af
	cYWadvhfPsKYJqRK8KxQ8R3joQXZ+QHWjMRHlBieR4FQaja3g0o1+QC2FO1QSNm0zn0t9UWs/HTwB
	p+FG8ZfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6vW-0002i5-Dz; Fri, 04 Dec 2020 08:58:54 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6vK-0002co-UW
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 08:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607073488; x=1638609488;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ri+FugxHPT3MU1bKnCzzrP+ZZtjxordrdt8HgAEL6gc=;
 b=Pp3J6wk6w2A6XiJooNHZXjOIBO32aVG9rmZrWdECTnWZNVSJZ2sx3LJN
 LsPeA9u0dn03Xzzrys1J2ve+inLoeDUdbzD5EK7R7Q/V5rLlb2SBGIMOv
 RGI8CadoxaSiQdbexMubXZQfdtdQ5SmWQwUTLrrm7gtBl1cBkLSOUO1/K
 di5VhPP07Tart8lX2HUWjXY7mjOyThlDmnZz21Tz9VO4qm80rUak2Eu8h
 +5IRvfHBipV3OAS3mhKUB9SNSDezU9bTT1Balc5NqkEe6NMOMVKirAamg
 fu9QEuQCWSM7ZDCucIUHbSU0W2Kk1es4Dh3T7mkNRRYpTqdqHs+chYH4d A==;
IronPort-SDR: ntYZIIYTX/M4QE4AkIbE3yAGRGfjCjpcPm7vBeaGbn8872LKB45TFuGGGb6YID6SVxrHxUm9I5
 A6WMqkpfzGVtm9THmrwuP6Y4wWXotN6Jd43Z1ZjD0nt/W8Wuxfn85hz7qq/IbVwZuyvEz7rDZ5
 GnQpa/VifJL7c3mJVcphNj/5Hq9v6z0NbKh0uPFxQaTYbWN83nzdOXylw4DfnoNQKG/yQ6ubaS
 4u7xbWy1+ZqzkrV3u1UOK5UF0HklGtuSaN54iqd0By/WfLnuj/5AFt4qCs8NSn9FMnsSd+Fwba
 zXM=
X-IronPort-AV: E=Sophos;i="5.78,392,1599494400"; d="scan'208";a="258129841"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2020 17:18:02 +0800
IronPort-SDR: iKdcHPAfiGtyvBXavVWAiGMr7iLzm92z8jGPBiW2jHwE/NY3HM4z50q3dBiRqYnFrSH6crEFGu
 d3djrnTcICeJUeAKPX/C4JGopuI3P+ELg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 00:44:11 -0800
IronPort-SDR: wMWeORjOx1e44CXOWGwWCo0FXrHcpnja4cGMJP9tOytGyrXmo9BVRTO3xMmCnUadpfwslPT4a0
 oJ8PXjwCJL4g==
WDCIronportException: Internal
Received: from cnf010505.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.200])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Dec 2020 00:58:38 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Add Microchip PolarFire Soc Support 
Date: Fri,  4 Dec 2020 00:58:30 -0800
Message-Id: <20201204085835.2406541-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_035843_121861_6174422F 
X-CRM114-Status: GOOD (  18.14  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Bin Meng <bin.meng@windriver.com>, Conor.Dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Ivan.Griffin@microchip.com, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
It is rebased on v5.10-rc6 and depends on clock support. 
Only MMC and ethernet drivers are enabled via this series.
The idea here is to add the foundational patches so that other drivers
can be added to on top of this. The device tree may change based on
feedback on bindings of individual driver support patches.

This series has been tested on Qemu and Polar Fire Soc Icicle kit.
The following qemu series is necessary to test it on Qemu.

The series can also be found at.
https://github.com/atishp04/linux/tree/polarfire_support_upstream_v3

I noticed the latest version of mmc driver[2] hangs on the board with
the latest clock driver. That's why, I have tested with the old clock
driver available in the above github repo.

[1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
[2] https://www.spinics.net/lists/devicetree/msg383626.html

Changes from v2->v3:
1. Fixed a typo in dt binding.
2. Included MAINTAINERS entry for PolarFire SoC.
3. Improved the dts file by using lowercase clock names and keeping phy
   details in board specific dts file.

Changes from v1->v2:
1. Modified the DT to match the device tree in U-Boot.
2. Added both eMMC & SDcard entries in DT. However, SD card is only enabled
   as it allows larger storage option for linux distros.

Atish Patra (4):
RISC-V: Add Microchip PolarFire SoC kconfig option
dt-bindings: riscv: microchip: Add YAML documentation for the
PolarFire SoC
RISC-V: Initial DTS for Microchip ICICLE board
RISC-V: Enable Microchip PolarFire ICICLE SoC

Conor Dooley (1):
MAINTAINERS: add microchip polarfire soc support

.../devicetree/bindings/riscv/microchip.yaml  |  28 ++
MAINTAINERS                                   |   8 +
arch/riscv/Kconfig.socs                       |   7 +
arch/riscv/boot/dts/Makefile                  |   1 +
arch/riscv/boot/dts/microchip/Makefile        |   2 +
.../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
.../boot/dts/microchip/microchip-mpfs.dtsi    | 331 ++++++++++++++++++
arch/riscv/configs/defconfig                  |   4 +
8 files changed, 453 insertions(+)
create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml
create mode 100644 arch/riscv/boot/dts/microchip/Makefile
create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
