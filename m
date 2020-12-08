Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D74A4C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622F823A5E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 04:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622F823A5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qEyXaB+04+Elw6ot+5RPTcFJmWJoVukBrwpXgswndDI=; b=CrjymRCTcVtUyJCP78i2ZdE1Y
	7SJGQE9hIApyPJTSjKaDXMk8VWvkZlZby29SDNFWzHhOmnABX5SilqEHcP02mDiy7BIraXhLPDZoR
	TKrwU9WQgp8Hw7TDz6rvDKjkU6Js/1ybB4DUvTdqzHTgJ1nVLepiIZfClf6HrlQJGsZTtMOdFyLEQ
	jZhg+hL8qvDEtU9KD2uDS8G8C//HRHyKx3qf/oRTkQ/tyQLl/QQW/VQPR7spdu3/XYogSbKmqL6Av
	LUHmpB2FBSVSIloKWGFCMFthbWNN5nvTIzF5ZKoTw/i4DFIOv1m2/oDqyyAS0CS59TMQRtweAyL9z
	tBPJ0rX/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmV2s-00043C-PP; Tue, 08 Dec 2020 04:56:14 +0000
Received: from mail-mw2nam10on2051.outbound.protection.outlook.com
 ([40.107.94.51] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmV2p-00042j-H5
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 04:56:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JpdnbhmNDjoqQezXpR79IAdSyNDa6OgK+Y7ViAtbKo9CPPQY2BF9Qh8R1tSC8rXwvyG6hxYWJhvnOmd8nJJQWH1G7XnXGMQIODR8bxLyOAKKnSAFlVaQ9/XDlIlkMSdIpdFcdvhWDojfxCZlFvCX3mTd9a54zQZMWBSGKf1b1bj+vLAlAFepoKE7xclbpZdFlYwdxhCiS2n2momGGfZBSEvrVx8ldnDiSHrVH5h5ZVrTUULWe/vfXteW/qQhGO+f2FBnEf2+11mUP4+DZqKM/oY5mxqvzU3mlpNSa3zVtT3MIYx0p5/FF6kOVwAhjRC4b7HZ303OFO6REl0EuNUntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT8eLUmpuBXxA3i6Z4k9G8dZ6vYdUAkZ022dEjqo2qE=;
 b=E8luRmEUgaUJ82qFYR9GRUTousf5rOtvojLulgKNQcazLNIxGHFNwddygzlajLcRRT/Dxk9mecskJ9ZuzeNsyiobVaKSV0dS1/fSsuH9Mp48ju4qE5uxJzZ9N+mPKEQJcS3ar0ieBWEgpbNuKIDHXADL+oXeZUsi+9WICT2nS4lTdnMf4GLPt0GpZWcnt3Yx0Dh7IRYYIsEFe03KbaYhb/vBxeW3q/HT2AfgshxvAa6hIk0ylxAWaLn5h+m9BxSqQWXhqzVZEMIW0F16sBPvHjRBOZ2HShSDd8d0Tt+S50CKHM7TgZpZlnyex1rYk8yjw12W3fa0Fr4xQm0NNSJ5eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT8eLUmpuBXxA3i6Z4k9G8dZ6vYdUAkZ022dEjqo2qE=;
 b=P3iLOh7sA+shjNizb2A2U85+LhUCqk0B9Yis3zpoQhCu3gGLwJgFbP316fqijyravhIY7UhilMFSofPlaX+87I2r6L18FgsmaB1W4pvpi5p2sACCZqJYLPGU5m/SX2M6XAS+hPbAi66WQc/ZH9uwt8IF83CYjOqr1uLlWgoP+lo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from BY5PR13MB4453.namprd13.prod.outlook.com (2603:10b6:a03:1d1::19)
 by BY5PR13MB3745.namprd13.prod.outlook.com (2603:10b6:a03:22e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7; Tue, 8 Dec
 2020 04:56:09 +0000
Received: from BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae]) by BY5PR13MB4453.namprd13.prod.outlook.com
 ([fe80::7c13:1ac6:9f2a:5eae%8]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 04:56:09 +0000
From: Yash Shah <yash.shah@sifive.com>
To: linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/9] dt-bindings: riscv: Update DT binding docs to support
 SiFive FU740 SoC
Date: Tue,  8 Dec 2020 10:25:33 +0530
Message-Id: <1607403341-57214-2-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
X-Originating-IP: [159.117.144.156]
X-ClientProxiedBy: PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::27) To BY5PR13MB4453.namprd13.prod.outlook.com
 (2603:10b6:a03:1d1::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from osubuntu003.open-silicon.com (159.117.144.156) by
 PN1PR0101CA0041.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 04:56:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22037d76-f026-4bb3-9436-08d89b359410
X-MS-TrafficTypeDiagnostic: BY5PR13MB3745:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR13MB3745F49C25E5286C6AF1EECA82CD0@BY5PR13MB3745.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FXsDnO4Em7uLDSZv9R9uma84dDVMvUwO9m913ZO5SPW/gvpMWyAO9q/QDPBzcKkuZ86g8sixK+t5r+WAYiJUfhoAjZB7vEJnaEbIsk76T9KR90UFFHP51zuznq3wBXaB38bJaFhsxf81TtjM9f0e3jgv/dKTLK6Rt068x38FI2q8CQrtu+rhL92ugperkgBc2DoaNzJz5+awB3+odfiVmEUd4MnGdeuPNTMm/aVmE5r5vrR2UE4s9DW8WqZiqFHIKjAisQycynCbz4Z2/LsufymfdCsjvVjMOfS4xN76LqlXd332M52ffaO0WYLrzZfp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR13MB4453.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(6029001)(366004)(376002)(396003)(39840400004)(136003)(346002)(4326008)(6666004)(6506007)(956004)(16526019)(66556008)(66476007)(7416002)(42882007)(2616005)(6486002)(4744005)(26005)(478600001)(186003)(316002)(44832011)(36756003)(8936002)(66946007)(6512007)(107886003)(5660300002)(83170400001)(2906002)(52116002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZpkPyUVYbX0FFcVUSakNlZuVvIy0gQ8n0WTwKIuWdX8X8PeU6t3Vb5wY0365?=
 =?us-ascii?Q?UV6H3KQtJFD9GhQyqxLZHuhq5T+fgIinRSQPOv9DIUElVZDWtz8wA/+DDDQk?=
 =?us-ascii?Q?CKR2zJXTwJAUiRIvs3ba+Pw2sSHLHgFAqXHxv8oy4JysLS0//X0m6rWnyeyR?=
 =?us-ascii?Q?QSI8UDy3AgYlFEFC3eODtNtZaQzBSO3h6Qkq4uuCnyou8H3pd78uAs0u93O/?=
 =?us-ascii?Q?ZnmQ2brt9DW37TPqFwbAJDf8pfal31S10TTtKPop1X6wGUkcBus/x6NedP7Z?=
 =?us-ascii?Q?FtRpmuyY9eTaEceotdE8T2/HMwChYo+/4ponQv44a1f+0EOuNhf0XHj3Z6ro?=
 =?us-ascii?Q?biJmQpfwSClCdla/Uq9R1JJU6EnPSUw/pXJVxPoV/ZsJCSrhyJEZ7HTE34xW?=
 =?us-ascii?Q?oSkxgbyEvdOWvGnVyV3kt/BcoByUNjhF02r9KchDgKyN1QaN5vRH0of8/iJl?=
 =?us-ascii?Q?uz8f3Efac5cg5W7trUpQxknZFy4yYHnO7/75RtACKr3pgO50Tm88UjgDaFHY?=
 =?us-ascii?Q?geTZcH3Fd/DvioGikYwgQrgqy0BZOBmUVYUFtG9FhaBLlkHcPrPH9id9DJBB?=
 =?us-ascii?Q?a1s/LPKTXQ+U4tDQK4Hi2n+xnJa3nwuliGibfKUpzWGOzqi3OIkblWzqRoil?=
 =?us-ascii?Q?7odIPJ69ILdmIkhrEVdYrvhOLGo6d1VMwHPBj7yUhcHVobUq2bONk5CVDGaG?=
 =?us-ascii?Q?Y9vYlwPObMztVVFUo5y+IrXBLZ55cEnF4HrTSD0uqxWTLIyypMxlhtdISB0Q?=
 =?us-ascii?Q?5JKcN2xEsJmAy/M17v1W/mbTIF4NWogQjBZWfN42FeFDtyePMqcDel+UoeUU?=
 =?us-ascii?Q?6+o62ae4eJrl3eG36XtwjBnfLyPk4cKmE9labWMOeMwVY0L9UxPmAs9pjdzR?=
 =?us-ascii?Q?o6FZkhOCEmXZGFozy4ChAkutE9fXjwaiS+pKGifKqcCx97UBI4Kijt5lyO4w?=
 =?us-ascii?Q?dQjd63E6Jrz2AQNWgWq+lXFCCi8lOGG4VaCi/4FVqBMDH61HVPeaqZTs89/S?=
 =?us-ascii?Q?2+29?=
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR13MB4453.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 04:56:09.1108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-Network-Message-Id: 22037d76-f026-4bb3-9436-08d89b359410
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGrUb+vnO6HdWuYfbVZlT2wEPK2ssj22AyQ02gF7Ekp1AAMKlkW3wQ+/Ovsizagx1tYClFW9qK1cxbrwZYgODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR13MB3745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_235611_583501_1A46AB17 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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
Cc: andrew@lunn.ch, peter@korsgaard.com, aou@eecs.berkeley.edu,
 gregkh@linuxfoundation.org, broonie@kernel.org, paul.walmsley@sifive.com,
 robh+dt@kernel.org, bgolaszewski@baylibre.com,
 Yash Shah <yash.shah@sifive.com>, thierry.reding@gmail.com, palmer@dabbelt.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, linus.walleij@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add new compatible strings in cpus.yaml to support the E71 and U74 CPU
cores ("harts") that are present on FU740-C000 SoC.

Signed-off-by: Yash Shah <yash.shah@sifive.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index c6925e0..eb6843f 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -28,11 +28,17 @@ properties:
       - items:
           - enum:
               - sifive,rocket0
+              - sifive,bullet0
               - sifive,e5
+              - sifive,e7
               - sifive,e51
+              - sifive,e71
               - sifive,u54-mc
+              - sifive,u74-mc
               - sifive,u54
+              - sifive,u74
               - sifive,u5
+              - sifive,u7
           - const: riscv
       - const: riscv    # Simulator only
     description:
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
