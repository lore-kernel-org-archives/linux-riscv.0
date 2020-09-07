Return-Path: <SRS0=+z5f=CQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37971C2BB84
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:48:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76E532137B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2020 05:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QZ/kdBgd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="nB6M4BtK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76E532137B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4N7agkIsREXdz4ZgvYSmZAa1b4B8JWGlbrEIVwiRFL8=; b=QZ/kdBgdyRqnCFP105wx3TnCyu
	RmJKSkC9ZJHN/vwx9QkFzfadpBlB61Z3ZbYEDXGt1sPxSr+8C3KBaYFivY0pOv01YJSLkNM9+n/ky
	NHO8dd/+MrsDO9fjd7UqBUn9ywfkz71Yd5GnL3ue1PpYfLfnWs0FExp72sySZ6LsRUicRi67PIOC/
	HmyVEeUp85igG64C2bx7GbmO6gvW2Vyc4nbpIOwKeCqHkbYoY3/gxgddbljptHmDspTN1lzv5YGrh
	IbRB4auMUMObwR8CJDB0Yfb+RVkIAiijyl+qhwOEfyUyGwPkGzeY2scT11No043RXZvpvmgVwDkwf
	89PANQgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFA11-0003Jb-0t; Mon, 07 Sep 2020 05:48:31 +0000
Received: from mail-co1nam11on2047.outbound.protection.outlook.com
 ([40.107.220.47] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFA0y-0003It-1t
 for linux-riscv@lists.infradead.org; Mon, 07 Sep 2020 05:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7vGKJll2bJUuJ7q5uef+gugcl+nEGbdFfEp2R5+9OvO6aaMvjztg94m2cJVE9O16YPIegiglFWMtoEQVSmwif/GU21quQDOTYmzraWar0yX1rXg3IiYua19z/xWgUun8OpXX57waOGiFffpcx7oJEec/LA1OfFXSoyDuwzXratPOR96QQwUzbJhc8VIn4gBztSJY7GaK1n1ujmp0RtnKrjg8mjDz1JUslf6fQVwmW23P2y3eGoZQbt2bwosCibHX+hMLoEhWU91cM3Zu2DD4P819d6v0dONGSvFOxp4ukj8W9o19TRiMLADARxn6BqPsSnUvewP6DOUnS3YsOQKPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOtC9iz/E6eVHS/3efJ/OmCc8WXcDySAiruMK6Cl6T0=;
 b=BtP6n+P0bkb8dBta7yUC3PepNgVqVI7JHEXopjA7ypR7onWTT5BOwl2N9lz4btlvLS6Y6LViw6amh2KiyVS9X+ji7oEW5ynoON6o5ErORHLadeIxyYD2yYbOrJrC3CD26vCvCU+o8oY4oAhWGZ9h9DwSTgs7EfK23YMG4YVkoccxOb9iWd/422Gg2aF7vvFJANGBOL3jDbqAd1M74Xid3fnrPdbvkiA/coVNnWAMrR59QaxFM0puTOl+bk72jeEXemUUhSLJdD0PBRDiEXnYcv67Lir0xNjNojHC7r0OVvR1UrQdFQMMycP/vRPcs36lOk2Yb7ppspiD0fI9m5aCaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOtC9iz/E6eVHS/3efJ/OmCc8WXcDySAiruMK6Cl6T0=;
 b=nB6M4BtK7ubsXlZnsgmci+TospRKjhGBwNlz7utzCtvTIS8gMy/v/zpseZqbmN2/jC8MptK8mol/KP3DpioNcMUlYK87ntH8sJKD8HQF/VYCUZX6igC61ZRsGistkL9D/GPwswqcc94qyeRILEOuoLqGBCxU7kSyj0MzeiTa3vM=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=sifive.com;
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 (2603:10b6:405:34::34) by BN6PR13MB1569.namprd13.prod.outlook.com
 (2603:10b6:404:119::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.7; Mon, 7 Sep
 2020 05:48:24 +0000
Received: from BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::4596:33b0:db2c:dea]) by BN6PR1301MB2020.namprd13.prod.outlook.com
 ([fe80::4596:33b0:db2c:dea%3]) with mapi id 15.20.3370.011; Mon, 7 Sep 2020
 05:48:24 +0000
From: Yash Shah <yash.shah@sifive.com>
To: robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 bp@alien8.de, mchehab@kernel.org, tony.luck@intel.com
Subject: [PATCH v2 0/3] SiFive DDR controller and EDAC support 
Date: Mon,  7 Sep 2020 11:17:56 +0530
Message-Id: <1599457679-8947-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: BM1PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::35) To BN6PR1301MB2020.namprd13.prod.outlook.com
 (2603:10b6:405:34::34)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 BM1PR01CA0141.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:40::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3348.15 via Frontend Transport; Mon, 7 Sep 2020 05:48:20 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [159.117.144.156]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a93c577d-70ff-4c69-1a6a-08d852f1a289
X-MS-TrafficTypeDiagnostic: BN6PR13MB1569:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR13MB156943207B40DD32DF78DAD682280@BN6PR13MB1569.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1pVHTiy95vfEcJ8oB/q1mIB2H7wTEEinQJaYNi5yI4speQHN9x1HqaUE4SEYmntDC3/UV1j2PuOjyQgSV29gxWINZwHD7FUd8XsAnNHP0TKKTIrzO9Ph9noC+eqapUs7m9qsQLknLrtjrcE9M1HdIGPwjlOXvuMUNBUJEIBDb+W6rfhEUtyis83Op+uHTgXBgCXdTV4kwQol+KrpL0KpKitwLncS7lOSC4JZF8Ko8L68CoAKP13Jk9GK1pfQruU8312I3sKysKMICfilEewIF+0gsLd1M4h6YuUekxRAKVGK6Cs8Hq8ivVoYUHEPgYPwLyOkJzBiBoW3fOda/ETzBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1301MB2020.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(376002)(396003)(136003)(366004)(39840400004)(346002)(83380400001)(44832011)(5660300002)(6506007)(2906002)(36756003)(6512007)(4326008)(6666004)(16526019)(186003)(8676002)(316002)(2616005)(956004)(52116002)(8936002)(6486002)(26005)(66476007)(107886003)(66556008)(66946007)(83170400001)(7416002)(478600001)(4743002)(42882007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: QqKYom2F9Tlf2ghh7lcRK/VsbTDnZwAywqfIUYLVohQu/AWbrsEmw98VFsNeuGe4+qErMY3/D0HDtUUpPfoAE6cch+Ykow9s/6ECWjWVPfyCpn8JhcDoxZeQMCOk58D4YP0EXW2tGvtdeTvRRVE0LZQf8eZkqOMKAqaN88D30zs4R2WYz4+kkEnXKc8CnthmJvDP+ni8Vqt7f38dTNClysm6cfK5KMMdIvuQXKPHbIBraF2yFm69r/AKxBkMl85Xt7vxHg0QASm4qi13mfv7HUZv6V2cR2+BEhYYD1KmMONWdg1shbVcHaMr/N8G0kVl6IL5PWC8+ySHFyO3CQUjmdAMUZ4u240baI44TY4Fsd0EeWVeL6qixWxxBXZtTDa6Fe728VZ8vHYQbCCCp7xrIw2Ucl/Xbr2xZpENRsHsQZBUaebsA+vEJqnm5z76Yx4gR7Sjz27VKPVUupd/FS8W+lEy8nCY565CFVOx2I77XgBoo2I4IFhzbhn9qCjzVtOaNMgK7xKopIOVr9kvnYgvwY5eObRKF1DDrVSymSG2FbUVybvBmddjcwykL2xZVRM+oPztXNiilNnd3taveBdH87QaXkxfb2R2alJb1UJeTJzfo3aaxyUKDyds/PjXME30qEroLnI4MKKngLCzEOq0NQ==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93c577d-70ff-4c69-1a6a-08d852f1a289
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1301MB2020.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2020 05:48:24.2634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PeSSBTUR6HQlAyQ07UAmEHWbhsmS5iLKLXM3ZtqZQNxzvWFR9uM9CqjYbeqd79XV74KcElykbkyW0X3ucy6KYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR13MB1569
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_014828_299765_7AC16115 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, rrichter@marvell.com, james.morse@arm.com,
 linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The series add supports for SiFive DDR controller driver. This driver
is use to manage the Cadence DDR controller present in SiFive SoCs.
Currently it manages only the EDAC feature of the DDR controller.
The series also adds Memory controller EDAC support for SiFive platform.
It register for notifier event from SiFive DDR controller driver.

The series is tested and based on Linux v5.8.

For testing on Hifive Unleashed:
1. Enable the ECC bit of DDR controller during DDR initialization
2. Erase the entire DRAM in bootloader stage
3. Using FWC feature of DDR controller force ecc error to test

Changes in v2:
Incorporate below changes in EDAC patch as suggested by Borislav Petkov
- Replace all ifdeffery with if(IS_ENABLED(CONFIG_...))
- A few textual changes in patch description and code

Yash Shah (3):
  dt-bindings: riscv: Add DT documentation for DDR Controller in SiFive
    SoCs
  soc: sifive: Add SiFive specific Cadence DDR controller driver
  EDAC/sifive: Add EDAC support for Memory Controller in SiFive SoCs

 .../devicetree/bindings/riscv/sifive-ddr.yaml      |  41 ++++
 drivers/edac/Kconfig                               |   2 +-
 drivers/edac/sifive_edac.c                         | 119 +++++++++++-
 drivers/soc/sifive/Kconfig                         |   6 +
 drivers/soc/sifive/Makefile                        |   3 +-
 drivers/soc/sifive/sifive_ddr.c                    | 207 +++++++++++++++++++++
 include/soc/sifive/sifive_ddr.h                    |  73 ++++++++
 7 files changed, 447 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-ddr.yaml
 create mode 100644 drivers/soc/sifive/sifive_ddr.c
 create mode 100644 include/soc/sifive/sifive_ddr.h

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
