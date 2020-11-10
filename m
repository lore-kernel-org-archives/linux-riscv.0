Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE1C4742C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:22:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D81A2076E
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:22:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xX5OQKN/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="pbHTpo/I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D81A2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TxC7NpiZukTal48tvJIoD791iu35qtjkCLlmrctIF7Q=; b=xX5OQKN/O6cMDSszVb4pSYG7A
	9nW3lsux4bs295DPvhRbjWaZeB+KFCrLJS+YPak8pK2gPWiF+YsJOWp9vFnhlesdHcUnv+VKBBFy+
	0jN5we7TcJssdTRn6CiB0pK6DigQmkPICF92ebfZ5rr5mdh7fbOwfkyfRDiIFFkHZGPQR5vPyHAxH
	R0AjwV+mOzzjKFKWW+GHQwF8gcY3kOKE1PC1PrvXRhrgeGCCfMr9dIhyqG5y61hm0y09eR7+4oQKw
	QsSvza3C5aOX4mpoInAw0E7oDiWYXVz7oeyGYcySbNL+N+25KVKYnRgfcQ6PsQrJsdWxfSd3K4mzV
	eoYMpVJOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcVTe-0003f9-U3; Tue, 10 Nov 2020 15:22:35 +0000
Received: from mail-mw2nam10on2087.outbound.protection.outlook.com
 ([40.107.94.87] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcVTa-0003Yh-3J
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 15:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oe8CiWTT/HMS+x/Tq6I3fJL4F7RaS3A+VFK9ZRNq9O7CfX/Nryp/httPARvmj5iCdT0oCTp4inZ3BHZ8rXDYA6AlbZMjXVVBzV5uiTsCO6QisHCdIorOf02bF1tbGKgIIjK8hEpB5MOSruZUiVnD5ILwjDIwd75fINMqmpJglbKNQH3V5JTVLyUatS2AFh6YOWgdQIXX76+6Wy6JlTRQug+Qw9FS5KNI2qKLaOY0/HfTm9GuL/hI8AajCY77M9Cif2QRlnRCGfTpqQ3Yjjg110YN+wAOjMpP+EXnlk3XdtvqALFMOqa5m1Z2i/HI3jxerE20OprCAwTm/eYTACc1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYTuzDsYVXlx1KZz3pNkMeyEk60Msi5G8+1GvtTBjLU=;
 b=hLBEiJngDRoMyQLBNeC5iP6N4MxXDYsZxurs41qFsPbePqkK/Wf0T4aOOnJFO4K0GdE8x7iAFEh/E2WT8SYmL8mrHrcv7zJoheEN49ZLL8UNCGeG5OZpXgYVOgN2i0XUracLsjv8aHf3g7Gee6farDJCnLoM1YO03Nx9UrlHr54XWmLA4y4iMazfxu7soMOSk0aRQNNviHC1LCM7rK1ggVjvYfM5qFcw6a23vJgb8tJlPI7yyEZCcl5cw1fsYYu8PbhKS/4ubHOGLUpKgx0cwkRxjKu+vu7gEkEIukM1/fr/NOLgx0L1CHkKgFn3Mwr2Hdsi7dAfbkItWT1wBbiE6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYTuzDsYVXlx1KZz3pNkMeyEk60Msi5G8+1GvtTBjLU=;
 b=pbHTpo/Iy0yIjQhkNktGxE0CPXnE67bEi+GhSmFU8JlMqfJ6PqflxHWrXbPK+uydObE8EvXn/BX1tFXTFnxvB73KkCKlLiO1KO1xqiGw0XVLbBM9QEmm1ZTn76PxSC6GuMwPYrCEwXG5+lpHAU/FsDG1cmBhhH/Xtidi+trXELE=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1323.namprd13.prod.outlook.com (2603:10b6:3:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.15; Tue, 10 Nov
 2020 15:22:27 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::d55:1263:fadc:b6f5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::d55:1263:fadc:b6f5%5]) with mapi id 15.20.3564.021; Tue, 10 Nov 2020
 15:22:27 +0000
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dts: phy: add GPIO number and active state used for
 phy reset
Date: Tue, 10 Nov 2020 07:22:11 -0800
Message-Id: <1605021732-268521-3-git-send-email-sagar.kadam@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605021732-268521-1-git-send-email-sagar.kadam@sifive.com>
References: <1605021732-268521-1-git-send-email-sagar.kadam@sifive.com>
X-Originating-IP: [64.62.193.194]
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To DM6PR13MB3451.namprd13.prod.outlook.com
 (2603:10b6:5:1c3::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from gamma15.internal.sifive.com (64.62.193.194) by
 BYAPR21CA0005.namprd21.prod.outlook.com (2603:10b6:a03:114::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3589.9 via Frontend
 Transport; Tue, 10 Nov 2020 15:22:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a3b8fad0-30ef-4181-84a6-08d8858c6ea6
X-MS-TrafficTypeDiagnostic: DM5PR13MB1323:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR13MB1323C63CFF71B10AE54CD6FF97E90@DM5PR13MB1323.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+H/CY6hv/L1/Tc16gm2qtKKT9hVeVFQeV3XYVWjEEU2Df8PNV4Mxz+vBX1KDhO2DwUUEMzWkkJ4DjVbi18B40ehu2fM6AvVTBElrTXc6G/5z/2Pnh62UjZyKqH42vKRian3c/qCxCs8PrjDi+dXcuVpq68UpxFsrD0pvPZUT4/AelOCoteewuLxcgGMD5b6CMk1UCGM2Akxo6RgGV1DJb1NGKw9d7slOou6wgd0MNE8w71pKnCMJMn29diivRqQ2dyf3COxST+Qei4GDnsta4njga03Nkh1OWNZVrpNgA3XSPWk1CU7X7yOPiNtq+VIhNJXGIN1snmWHLqbitR7HA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39850400004)(376002)(396003)(366004)(4326008)(83170400001)(6486002)(16526019)(2906002)(7416002)(186003)(2616005)(6916009)(4744005)(8676002)(956004)(66556008)(42882007)(316002)(66476007)(107886003)(8936002)(7696005)(66946007)(36756003)(5660300002)(478600001)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: G7vSwP0Lef+n4uZj5aoOqCiVkmxVQe2I3tWeCm22GTLIy1YKmip371uJjJb0YvaeUkcv3CFWF45gvRzOHYwgKxVZEAEDuH4uGIdDCdPjIF9+50FZWGcBjg9htMFJ8dQP37Xd9eK+J3FrTsn2mxifX0mD3dchDUxf3t+TsG2NgYEyI3NzEZOMI3M5qTJaUKdY7OFtdLoSmpnkiLhmfmCDvcPSZB4hrfzbe0LdOktm93uR1r+rUEQS6V+LANGA4NxMds9gR2IKNCVavzZeFB2AgzAZNLTDhIco0Uex/ny+lzGGfj3kLFkzMqCrpY8UIdPbtBWB0cmsIcDmi+LH95a/gSr/5PfpgtbJypqjiw4fDcjFFr1HlQMPDkCqnJ439JsgVHf5fr2Zg0ct15l0OVv+lZoxcWm9gTFG/y7pF2a6Le7uv2azraZ3Bm7LLHPexcmDwT3D7cmWaVUPTAMo0SeFQl/Mmwp4cj5np6xRA80BKArrxIL4NAP4d7BwEuKUyDHGSfKSuQ/hFZppn3PVp9BbC+o3Rl3ZGpH959hkIEBGwi1OUvZ7jd5ZOLP6K5RL6hCq/viyBuwdkBgNgYxb5feMVbJeSJcFkGMEOVVrN+AuWUfREab1gEuPBqBQYd8DhXP1GpCYzf7PFtZas2Uv6ZxPBPePzuOtq/EPFM4z4QUbOBtdqyinlgCheTmZVGwfDLArCsD9sIVip//4pcg6IQLWxX/3fxa+2Ac0zBmbJIaiUVfoXlOKPkN5n0duLHMv6hXBmF/q4P/DVi+dGUW7RKy4Hr6pB2FToLbuliVArkshMVCbmWe+7Lt0f7oCSxPMt+sW0zXHqO2FSQXFcV2f43pGiinITAtWMS53EF/n99GrG/NBzTGkngjW3Pt8P90UnzGC4dq4h3Nn7bGF9hPswKtuOA==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b8fad0-30ef-4181-84a6-08d8858c6ea6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 15:22:27.4135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +bEvHcmlBpxlGFKkOFx2J5a+0r6te9E9UuhZKkvMg4yVTvmgrqP2iL8J/Wf2nMnKkfAciD5oXbhZkKwwRo6cZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_102230_279729_1F22A5AA 
X-CRM114-Status: GOOD (  11.12  )
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, kernel@esmil.dk,
 anup@brainfault.org, atish.patra@wdc.com, yash.shah@sifive.com,
 robh+dt@kernel.org, alistair.francis@wdc.com,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The GEMGXL_RST line on HiFive Unleashed is pulled low and is
using GPIO number 12. Add these reset-gpio details to dt-node
using which the linux phylib can reset the phy.

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 60846e8..24d75a1 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -90,6 +90,7 @@
 	phy0: ethernet-phy@0 {
 		compatible = "ethernet-phy-id0007.0771";
 		reg = <0>;
+		reset-gpios = <&gpio 12 GPIO_ACTIVE_LOW>;
 	};
 };
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
