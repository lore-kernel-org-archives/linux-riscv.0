Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E534CC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5509D64EFE
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5509D64EFE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=02b8tTrbQd6+Z0OKdC/OmKiZ8fqJPMNnCZXjbLzPlV4=; b=Dd+jqnDFP1HYfYxfqkIiXqSqZz
	yIZpqHp6cjHo5BqkRmaz4m1qtaEDy6diWpcSpLO5zI/27YuunQPRh31Ms1NVJ/x5IzgpBb20OlJZx
	Id5hdjIdh8s32XHPMaOvTJLiUst7t1ytFNPX+xgKtV3L6UfweSHc+LivNgX9aUZQEmWHRghFkTkAd
	cef75Ra70onKcOJ8eRGUttKrgOaLqICdVaRpk5mS/4hbq4cNHF83gAg2oc88g4Y2xJObj8BiwHKWq
	Mb8td1gHJiveczCAG/FQOA46lBIgZySVwKOfuMxXrcDGAXKNtS2FkSq0vAaEMN9Xek2rrKObR0gzd
	ZuDR9+xA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcEN-007F72-3l; Thu, 04 Mar 2021 00:52:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmY-006MDS-Kf
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 20:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=xKd60XH69xvbTC0UNLkUnlWKHowahfQpZUklLMe3JDk=; b=drCDlZOBzRj+EUxz37cZp/CmXh
 Z1nsAHZUtiqrxra2wg8zLfvseDdhvWUKLLBp3sh7O8xkt2HDHJVSHpN9B7z9rAD2zQLnbyL37MXAw
 eevLe0HwU/FUevz6muEfZPF+v7vGhJ52kLw1l9Lzfc4Ox3h0BkYbmdcNPqBHKvFNrXL1sCQce+sbV
 BElusBk3zUaryzBw7CvN2xu4vUluInoHxWMGjvRnt5nwcvUH2k2rTQuL7aIIaIdC4G8uWLKSho9sM
 3xcWSpIV96ECNUKz3QVrHHYiQtwawNPzgcsR+Mh/U4pWDSxDyYMxNzNSVUPgLO666ElYCTCWEki1m
 uMYLMOvQ==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmG-0041Eb-Tb
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 20:07:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614802044; x=1646338044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cjT47Y+Foav4IUdFGeBZNjaxykl7ywcHlPHQ263WpSI=;
 b=I0hBaU5hAlr5WHfGupGenNq3psFw7mrsyWs7ZE4M6kHzdd3/nvnIcVMl
 SN8NG4Hcd0ilouiKMIiQ6cFJNl1DAOqe0EJl2hAJ1UA7E5t7N3Z0NlsSu
 4hGSrFVhU5ilhHtPAZBHdgJtFy8tqMZYo4vQDmwswq6hz1dZ1EYoTDqlv
 qsdkJvsixuY16myIolvVxuOmLavwrzzD5+D8U+1NC4W4gSeWM48V7LWfS
 u4VTmV6V4pC2yMUvBoUpHhLjCbqaEJWxcYMVkzaROx2TV1TFZcXLSIsqY
 TZX5wOqhgeEmXI5LUPT4t+om0ylG+DsGthg4jfHXx2pjlfqzrUJVBXHQI Q==;
IronPort-SDR: ueRBh8Okj0esl8tq3b9TbXBMoHHqF0hXfL3ULKZZVwd1i6MAOpDDGKCxu/HL4cyvxMgXKgsXGx
 JxDd9oC6cZhOzEDqGFQQ/AQbodPWs1KsBMb0aw8FVzsL+CHi0VuSXczinxgmeCC9BwsrmcpRN7
 +cywuAsD0V3p5ylgKc+x8qWP8XKh8LMcPIVs76BDe2m19Y+8wZ4MYJN1BayY6Ra2g99NHhGrnl
 rjK1cu+P2Icqb4FdbTQVgaGwXnD9n95pKZpJgxwyEj3E5F5TJv45e2gYFrp6w+0OB4BqHPcuFK
 aQk=
X-IronPort-AV: E=Sophos;i="5.81,220,1610380800"; d="scan'208";a="271907144"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 04:06:57 +0800
IronPort-SDR: PrO7OS3DwJKhawLCchgMNnf6fVwN0hoUsYceaFwhfILNd0GLbZd74I7fOFs29Y8dX4sAmaNtGi
 5GXbNnvxzgJQTcutvgydXEha1hMrsvmMa+cMax+xcMR7YmySDEyrzoVHpbv2ZgszyzH92j4sKe
 72bZn6OrGSosZB4N5Dlq+UNqPshePEDwVtHNq3Kt9HuctfI4xWpQorCxi5MUCmOsfLXWHKLj9s
 0jl7HxSg7VhJtg6+DkmhmCElIJ9K4QggqQnZ3PVAwAr7y0OPUaOilcfmN+9eRqACxy2bXTE9I8
 /BAVUoamHqj+q3H3oQjeTMow
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:48:11 -0800
IronPort-SDR: lrp34JjvSOAuSzQgVDJ41RlatV5pePGDpkn4S+cKVuDlZtpeAAItGSWrNtG69Fihlf5tw5C0yZ
 lXPb4beU7vrOdo2k0rpc8bEvI3IPwOZQ+Yh6Mqt5KHpoaNjiayy9VhS8lvSIjLx2ACJ25V5jmE
 b2a5ueWc5o2sHqoKZ1DjyzXSkQwTf8pTlnZ1Ym/UJsWuIEdtQTxxtG/XHza63jFK/Q4NaEvArx
 a4SCUCrs9VP78Tbzy2ehWrVPUM2uqpb2zrCCpM8I3K+YIs2VBmOgwZB8dIDTex97SChR63ae46
 YQg=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2021 12:06:57 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
Subject: [PATCH v4 0/5] Add Microchip PolarFire Soc Support 
Date: Wed,  3 Mar 2021 12:02:48 -0800
Message-Id: <20210303200253.1827553-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_200739_544889_B589F639 
X-CRM114-Status: GOOD (  14.20  )
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

This series adds minimal support for Microchip Polar Fire Soc Icicle kit.
It is rebased on v5.12-rc1 and depends on clock support. 
Only MMC and ethernet drivers are enabled via this series.
The idea here is to add the foundational patches so that other drivers
can be added to on top of this. The device tree may change based on
feedback on bindings of individual driver support patches.

This series has been tested on Qemu and Polar Fire Soc Icicle kit.
It depends on the updated clock-series[2] and macb fix[3].
The series is also tested by Lewis from Microchip.

The series can also be found at.
https://github.com/atishp04/linux/tree/polarfire_support_upstream_v4

[1] https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
[2] https://www.spinics.net/lists/linux-clk/msg54579.html 

Changes from v3->v4:
1. Fixed few DT specific issues.
2. Rebased on top of new clock driver.
3. SD card functionality is verified.

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

.../devicetree/bindings/riscv/microchip.yaml  |  27 ++
MAINTAINERS                                   |   8 +
arch/riscv/Kconfig.socs                       |   7 +
arch/riscv/boot/dts/Makefile                  |   1 +
arch/riscv/boot/dts/microchip/Makefile        |   2 +
.../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
.../boot/dts/microchip/microchip-mpfs.dtsi    | 329 ++++++++++++++++++
arch/riscv/configs/defconfig                  |   4 +
8 files changed, 450 insertions(+)
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
