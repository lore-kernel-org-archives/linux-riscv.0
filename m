Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF65C43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 13:35:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C972B206BF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 13:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I87O29SQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="KYncJB6I";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="QtNhmkru"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C972B206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sf/hDKX2tRhhSadNUO4bNy0CCQ1fVX2HNcOuYicLZ8M=; b=I87O29SQOXmXdQ
	Jvon677sHPGx0iLEJhxHCZfPxESYd6WLJXP7iBuxAGaBtWOBP5VrDmDFQyGebFEWcI3aggpUR9gHb
	s+GslMHRGMJBDEAN+9k04JEBVQxvngdF3XLdpo4G+mqY5nAzg2dyq3AkYXTsknkpKxxxYY14Koe8j
	97ykT2Pt5QOog/Ircm/aOuNSmcc7zwvgNye52GgQRm5H20y91lh+L4j1T1soNiIfpAh4XcniXaKvD
	CecgeNK6DH05EWPuGc78e65oe+9mZhI/jBP7BMoX/JoCcqicQ7ZyBN6UC3Yzmkj3FAl+mMCgVIm9/
	jHH313YmEMwriflAXSBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJeXR-0000Yp-25; Thu, 25 Apr 2019 13:35:45 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJeWu-000861-DG
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 13:35:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556199406; x=1587735406;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=36j7G1Da2dpPvO+9ydhJPf4NyaB4Rn4PcarmYY7mZk0=;
 b=KYncJB6IsTfoEpdPbUBrP9LWCuxASOIFEJcL324nojVOcSifaRj+Yb3P
 SKrmr5rLTVfwuJeHtamhhBvlSkc0TMO/DQOhjYH9s0G88AcucVTQwlacj
 HVTXRfcwEei2gG3TuBXtzDPc9Zf6AJAvcDTOxL/5dkNA4eNIRYbUcA1Hh
 Y/bXM4/CNNAs5HPiMBbed48M1SxQtezrymohhCd6TyCmi4B4F4PjNSWJk
 yETSfjy0cg4vZx9SrPIdOKM9g2mzN+sIa7zYGJNK3DblDrOvnjEvogvqN
 Z41yqz+fYrXB8RZFiAsfwztoJBUPv6TWMkXx9emTc99z2wHgoNTWPFDxM A==;
X-IronPort-AV: E=Sophos;i="5.60,393,1549900800"; d="scan'208";a="205942685"
Received: from mail-by2nam01lp2056.outbound.protection.outlook.com (HELO
 NAM01-BY2-obe.outbound.protection.outlook.com) ([104.47.34.56])
 by ob1.hgst.iphmx.com with ESMTP; 25 Apr 2019 21:36:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36j7G1Da2dpPvO+9ydhJPf4NyaB4Rn4PcarmYY7mZk0=;
 b=QtNhmkru5w+837EKmn2XT0tcrCYWQLgagNZGde4lv+pbCrHBRB8CIheFxXjvYMvAiNBAr3k67IUTwrY4NcRNt6zNhJWpihXhJUxkujoyQFdzVY+owhNiKG4hfUqCCnd4tj6ODVrn/plWT/SySnNUFs1cPgn66PePYFwn8pXf3Sc=
Received: from MN2PR04MB6061.namprd04.prod.outlook.com (20.178.246.15) by
 MN2PR04MB5631.namprd04.prod.outlook.com (20.178.255.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Thu, 25 Apr 2019 13:35:06 +0000
Received: from MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2]) by MN2PR04MB6061.namprd04.prod.outlook.com
 ([fe80::ad2f:3a0f:2de1:6fb2%5]) with mapi id 15.20.1813.017; Thu, 25 Apr 2019
 13:35:06 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>
Subject: [PATCH] tty: Don't force RISCV SBI console as preferred console
Thread-Topic: [PATCH] tty: Don't force RISCV SBI console as preferred console
Thread-Index: AQHU+2uxkGjV+x23F0K05mNsSIEedQ==
Date: Thu, 25 Apr 2019 13:35:06 +0000
Message-ID: <20190425133435.56065-1-anup.patel@wdc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BM1PR01CA0138.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:40::32) To MN2PR04MB6061.namprd04.prod.outlook.com
 (2603:10b6:208:d8::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Anup.Patel@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [49.207.55.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 26d70f3c-4ee4-4339-a9eb-08d6c982d3e1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR04MB5631; 
x-ms-traffictypediagnostic: MN2PR04MB5631:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MN2PR04MB5631D3A88549F6133226D86A8D3D0@MN2PR04MB5631.namprd04.prod.outlook.com>
x-forefront-prvs: 0018A2705B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(136003)(346002)(39860400002)(376002)(189003)(199004)(81166006)(81156014)(2616005)(8936002)(110136005)(2171002)(50226002)(6116002)(3846002)(54906003)(97736004)(6436002)(8676002)(386003)(6506007)(305945005)(86362001)(36756003)(6486002)(7736002)(6512007)(186003)(25786009)(14444005)(26005)(1076003)(256004)(99286004)(5660300002)(486006)(2906002)(73956011)(55236004)(71200400001)(14454004)(71190400001)(52116002)(66476007)(66556008)(64756008)(4326008)(476003)(316002)(66066001)(72206003)(102836004)(53936002)(68736007)(44832011)(66446008)(478600001)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR04MB5631;
 H:MN2PR04MB6061.namprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Wq6uKU5r3Ny5pcyPe1OuHotEmuYTuDZSRv6Q1mIbxc4r+ZbsE52lQB9bDwHRuwML/UddVVuqn18r6rdSc0Qc0W2kSgHzYVzIun5n55Ro7vKX567297ktvWruXtPvdMMXY2XSfBsnDS064OWnKCX9Q4qI/Widml6lSO06D2FzM/tH2MI8nae+6Sm9BRmu0kStyDUvHkbBbPWMZKNctcrPSr4XOy03vsvwLzzO7RgQmuAQh+8Zz3ss0AeT1igrNoG9iVAw/GrfOHhnP2cZIZz8YmrGFr8Q7bWtANS10hVGfPG1vljdqItmNbOmMJ927/g4V+RxwNc8Md1nkWonyAPJNQUszFBIEWpwndaImubmgy3WkSfQaxzRlx75n7YzuSiJrpzx1ymFnBhQOMg87ECAR0jlh+zzB/eba+3slXOQ0E8=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d70f3c-4ee4-4339-a9eb-08d6c982d3e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2019 13:35:06.2931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB5631
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_063512_967836_AC1ED5F2 
X-CRM114-Status: GOOD (  15.37  )
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
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The Linux kernel will auto-disables all boot consoles whenever it
gets a preferred real console.

Currently on RISC-V systems, if we have a real console which is not
RISCV SBI console then boot consoles (such as earlycon=sbi) are not
auto-disabled when a real console (ttyS0 or ttySIF0) is available.
This results in duplicate prints at boot-time after kernel starts
using real console (i.e. ttyS0 or ttySIF0) if "earlycon=" kernel
parameter was passed by bootloader.

The reason for above issue is that RISCV SBI console always adds
itself as preferred console which is causing other real consoles
to be not used as preferred console.

Ideally "console=" kernel parameter passed by bootloaders should
be the one selecting a preferred real console.

This patch fixes above issue by not forcing RISCV SBI console as
preferred console.

Fixes: afa6b1ccfad5 ("tty: New RISC-V SBI console driver")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Patel <anup.patel@wdc.com>
---
 drivers/tty/hvc/hvc_riscv_sbi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 75155bde2b88..31f53fa77e4a 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -53,7 +53,6 @@ device_initcall(hvc_sbi_init);
 static int __init hvc_sbi_console_init(void)
 {
 	hvc_instantiate(0, 0, &hvc_sbi_ops);
-	add_preferred_console("hvc", 0, NULL);
 
 	return 0;
 }
-- 
2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
