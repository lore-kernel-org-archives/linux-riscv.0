Return-Path: <SRS0=HQJf=P3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F146AC61CE8
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 13:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD3E12086A
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 19 Jan 2019 13:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b6OKmYmY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FlmRrksu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="DYsvFxAl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD3E12086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cPTwxh+MaQtdYRgnY0vhO4XfWrzFSvRm0ilPBG5H0wk=; b=b6OKmYmYcKeb2T
	iLJWc4baig/zjZQ1pRVnyJT6rJE70VCNO56Of1WJUaPB9JdnWkSFbkKheZT/MjP9unz4jhs0OgCvx
	pgr45HtKWZ7id5tG5QPGx84IjGTq+2jLwQ1RYVi5M461bkLO4iLuyCMt0tFzmKfhs5ASl3R4SggPw
	Cxr3AuT1FfiCQAMAN68iqhA2/z3PDsuuzp1sV2cHCkMf7BE5x/gTQcKikagmNiwN0uvbcNjCiBXXQ
	if1otekRtW8uv7uxTOEDLiJOsneLL0ursHwC8a2IC2cA6jK0iqVzUR3Sjqp2U0M/W0/Sh3rfRi5uz
	YQ/J6qsa/eqTZjL45BBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkqfK-0008IE-6p; Sat, 19 Jan 2019 13:28:02 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkqfG-0008Hd-GZ
 for linux-riscv@lists.infradead.org; Sat, 19 Jan 2019 13:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1547904478; x=1579440478;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=wgjAh5Bakfdhrfq4K5eqr0pjrKvCEcCYj/XxcrRKm/I=;
 b=FlmRrksuCmYaTeUPWO1OMbQg4HT/rFcac8zawfpOdbooBSmMzoaLF+Ka
 zISPp/2FQ2jgCG3RCvngJhhndwY7Ss+mDEUx055/XgiXA2HZ8tbShKLH2
 g69rCBcyqjKID7PzwsisssYK6Kvwxw3r1mILY24wDZHlwUA6EBBjVakJD
 eqtQ8fMdVHJUj2gGB45hETXIn7Qt8/5BXcwNsWAOTSa+Y7/mA2nyvxTTU
 GwYakiSyTTxZ7n5pjxtRadEL3aQ/kq1uG5seomHYyQv5P2qeJGAKzdeCu
 4LvYG6zfAMxDZmmR95sEW+O0fWA/HWIdbNnsh1/w+QIO4Dn1xu6CZMNN6 A==;
X-IronPort-AV: E=Sophos;i="5.56,495,1539619200"; d="scan'208";a="204221739"
Received: from mail-bl2nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.55])
 by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2019 21:27:55 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K45QtKpGdsj3pfJZHYrLGaMSZt+hVdf7Z0S7KuW0Rlo=;
 b=DYsvFxAlDXMnox/Q+bkJf3u0Qq/SOapyhfdAKjBFR6epFoUmIQjHEpmnQ+7jpY0Tl+/7Oe/0w7DjFMUxIZZAMJgQQSKW6D6WU/YAN3qRF5nopNhGdoYSHl0VVWA8rJ2Th+azrjzSl6yuWYHONbfLBc4HXMw61jAkZScog+MG3FQ=
Received: from BYAPR04MB5303.namprd04.prod.outlook.com (20.178.49.148) by
 BYAPR04MB6117.namprd04.prod.outlook.com (20.178.234.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.24; Sat, 19 Jan 2019 13:27:53 +0000
Received: from BYAPR04MB5303.namprd04.prod.outlook.com
 ([fe80::add1:92cc:65d7:5d94]) by BYAPR04MB5303.namprd04.prod.outlook.com
 ([fe80::add1:92cc:65d7:5d94%2]) with mapi id 15.20.1537.028; Sat, 19 Jan 2019
 13:27:53 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/6] Fixmap support and MM cleanups
Thread-Topic: [PATCH v2 0/6] Fixmap support and MM cleanups
Thread-Index: AQHUr/rHNH/2/efIlUiV/69TwsVAFw==
Date: Sat, 19 Jan 2019 13:27:53 +0000
Message-ID: <20190119132650.9978-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::27) To BYAPR04MB5303.namprd04.prod.outlook.com
 (2603:10b6:a03:c8::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.52.191]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR04MB6117;
 6:G7JsDvVE+c7wDaaA/oVxO1+bUIzaNOe9pJ920P+QHy2KdGFVA+Yo5tsqipPHwGOuezE95CuUcBqRzyTXdPFGN58OKD/drFCiaCPXBhIiqyeS9xar/IvLeVJHNCPIU1k9kG3iVpSEYlokSEHxD60fHTp/RP5lQbsI2mdeGqhT/HMNctTqLpps2W1tYQ6N/pgd+88ejm9ACaYrD5oi/yZsqsB5CzKiCJ3V0A/cBbUD3hpmrATbtA4tTDmsGaylglg2o7Q/5+SpaEqgIB7ED5KcnkneYcHGnOeAb44REcINu++hytKvg6YN8O1mVdCYlRLfQiV2k05YvC26Oa918wbk9Rroxyh93sD0oxYs8dD/1hdS4pcJ7rc3+OgPBSfqml+qVHZBZzCaHoH15EGFCPvcTFh1FnAtlZNdy/lnnKW0FnJeGKMMARHEs4uoznTQmvp2xzoAGaCo5bYoxTbozRWR1Q==;
 5:0wEbdd7/aVQAPUDyLU1GEB56d+EQ/4IkhfsBgvTxNl4eGvoIfNWb2kiyaKF+sxmSGS/Anv50a/grxCS9npUU4Txqt+hL3U2RoZkZMIyz8pOVfSx8UM8sviXycotOLses5nhtQuf7/DRgic7r8RlmoMLRlqA2K3AkdnasmkapXQIG7cdm45tnJgLxatVq+4Ef6fMJuGtoWlQEXetSz21Xrw==;
 7:q1F+UIaofYL6Wif9PWJp85wSzTDr0p5uqb+jpHN0v0/9gjz9b2M23ZIMuc7f/+PkrvQ7n4gjp8q0AAdrow3n8IHPd3v9DhsMQAftBLJdtp+meRhzAFUiA73XywZFuxjrHQtyJw7F2kFur9OlOrbMXw==
x-ms-office365-filtering-correlation-id: e1071271-30d1-44ce-186d-08d67e11ea42
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR04MB6117; 
x-ms-traffictypediagnostic: BYAPR04MB6117:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB61172C94E031A3DD4C9D6DF78D9D0@BYAPR04MB6117.namprd04.prod.outlook.com>
x-forefront-prvs: 09222B39F5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39860400002)(396003)(346002)(366004)(189003)(199004)(54534003)(476003)(8936002)(52116002)(102836004)(55236004)(36756003)(6506007)(386003)(2616005)(2171002)(50226002)(8676002)(6486002)(4326008)(81156014)(81166006)(25786009)(44832011)(105586002)(106356001)(53936002)(71200400001)(71190400001)(186003)(68736007)(99286004)(97736004)(6512007)(6306002)(305945005)(3846002)(72206003)(478600001)(6116002)(256004)(86362001)(66066001)(5660300001)(7736002)(1076003)(316002)(2906002)(26005)(6436002)(486006)(14454004)(54906003)(966005)(110136005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB6117;
 H:BYAPR04MB5303.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RErfhc4W4h6XsT28mvqomN2GmqaKBTLxc1pALLGvsUJV6T2CSahl/UoGzcMXvogyN08/l17dARopjOF6sS62KOeIUtT24qsj1WRwP1F8ag2La3G1oukB1ch8NRAWprRrpSLKJAnxfutjcRM9sdPmJDTCUWCAY/0l5RWX+GLpGM3h63JNyIUXkrWMS4tlGpJhHAs8dntOhejUFF/yLcJvgCfi4/LkYbl2/kfiEiJjfxoFVBMbTVhQH4bJ1/MwOLM7bjQBN4cvzps8KgrYhj+nZpB8K31N9ZmNMhLraaA6HUf4RtG6JYBDddY8Njj5KEAJl+vsPSB/DlyjpOjorTabZ4qhwLbqAdwU7dqZOcm81klqiPd2u62euev8k3VL5E0XLmilZDycIJ5T2CxkQdDA1UlQm1+CsvZ8zhl1O35ILCM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1071271-30d1-44ce-186d-08d67e11ea42
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2019 13:27:50.7215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190119_052758_724941_9C280814 
X-CRM114-Status: GOOD (  14.83  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset does:
1. Moves MM related code from kernel/setup.c to mm/init.c
2. Implements compile-time fixed mappings

Using fixed mappings available, we can now get earlyprints
even without SBI calls. For example, we can use kernel
parameter "earlycon=uart8250,mmio,0x10000000" to get early
prints on QEMU virt machine without using SBI calls.

The patchset is tested on QEMU virt machine. It is based on
Linux-5.0-rc2 and can be found at riscv_fixmap_v2 branch of:
https://github.com/avpatel/linux.git.

Changes since v1:
 - Use more characters per line in changelog of PATCH3
 - Removed #ifndef __ASSEMBLY__ from PATCH5
 - Use more characters per line in commets of PATCH5
 - Added PATCH6 to implement keepinitrd kernel parameter

Anup Patel (6):
  RISC-V: Move free_initrd_mem() to kernel/setup.c
  RISC-V: Setup init_mm before parse_early_param()
  RISC-V: Move setup_bootmem() to mm/init.c
  RISC-V: Move setup_vm() to mm/init.c
  RISC-V: Implement compile-time fixed mappings
  RISC-V: Implement keepinitrd kernel parameter

 arch/riscv/Kconfig               |   3 +
 arch/riscv/include/asm/fixmap.h  |  44 +++++++++++
 arch/riscv/include/asm/pgtable.h |   1 +
 arch/riscv/kernel/setup.c        | 114 ++++++----------------------
 arch/riscv/mm/init.c             | 124 ++++++++++++++++++++++++++++++-
 5 files changed, 189 insertions(+), 97 deletions(-)
 create mode 100644 arch/riscv/include/asm/fixmap.h

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
