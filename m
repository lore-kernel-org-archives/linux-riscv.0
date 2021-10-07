Return-Path: <SRS0=uA0y=O3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301BFC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 12:37:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 020D16105A
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 12:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 020D16105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u34ZkbS0Uh7Y0gK9n/tHy11gNwhFHeO6LA37EsxCGLw=; b=uJ0S6pV8KBKXgY
	Ie/SH90QSn6cNEJsEPc2KHuGz4yNUdC3HJQZ/PrOAVd8y9mpVUlpB5Q/qMxmslRi0ul4bRFYELLCZ
	OcjM+RnEIhPkAoryBU0Pw160rW9AgSDtoY7yTak62NyagXVeAN8e1HMnI0/aUrMC/snku5mmGbhm/
	mtzEZk5GTgVoiej00mlupoyYNnLRSacTlnZBFuf1fvhatdKjoDhtfmGW36tzRykh0Seu8hei17cfz
	J8KH077/4XOGEA+iOB0JZ4ApjaJfU9syqFbJr8GSENKFzCbRE/9k92JpzgMAyo00sg4Vui0Iq7ss9
	/bwPtiVtuPvm2ASnYu4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSeZ-00HIHx-0p; Thu, 07 Oct 2021 12:37:39 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSeR-00HI4w-0E
 for linux-riscv@lists.infradead.org; Thu, 07 Oct 2021 12:37:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1633610250; x=1665146250;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A0RiadUwWBnN6qLQ6baUXXxCN+i01fbrXSIW3KEH9u4=;
 b=mk/Ne+z6XJlw69SRASWDEEWvUQ5Fbuj1OeQiYJ+ueeLpKq3JoR+qhuIG
 IidF0ZPxYaEP0gQA2XRhs9orJ+K7aMY8OiwEa+Ug4P2u+3IMDG/hfAiSl
 9tDtBtkErGR4zG+YFFFPE9kLV7gyai3f07ZQ0sXCr8pwPh0MsJE6SEgTS
 8h+sWXZP0kUnsA2MUPjErYz4++XWywcB7Gq5k+yYN56Pgj3uTAd1kxehz
 OWocwSiZpStzCx982C1FZb+9zSqhtyyw1vIFxHeMlzDGa0ilno5kg1auO
 FvtlCEAI3wUdsZioSm26SAYOHK6zlQ+8/nzaXroZoiADK3xK3mG2inf6v g==;
X-IronPort-AV: E=Sophos;i="5.85,354,1624291200"; d="scan'208";a="186926265"
Received: from mail-bn8nam12lp2174.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.174])
 by ob1.hgst.iphmx.com with ESMTP; 07 Oct 2021 20:37:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFWBZ2QIOnKw+hYRRkq6lQsl+H2cKaxWJCjsMepaWdPoeAT+QMMGb+NOaAq5O2oxRDx3FSpLl1KMagw0Y6RkxsOyRnvdLhl5q04wv/uzJppdkxzJNYan6og16qvBkXg4RenbXWiKFbdRbgZbe8be2HzNVRbDLvfeeLV1gAlrVioWOJNQB06azJVDYrVj8NNlpN5Uscsqr7WkW0gaEZ8yG3D962ZPuCywwYZWm6ef8L0YyG0jF/A3h5qslC9U5q0r7tVnc9d2WXymu4uqWzPy4UuJJGr8zpu+Aux87kaA+I1FTCFTHkfoHoMCb+Kl9mCeThoC3f+8PrYV+OBClUAPJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QIiEX1BGg/RPcL4NTR0Io5dK6z9osq7SQaNwyA2Tmeg=;
 b=Tg61Cwj5R+GPpbVwgugQp9Ri/0TLSGOTfipjYai31/MKDzthby6B9prhgcJO/HSLooiI+fV7pK4/q103lLVYgiVzUEaCt2BFG3/RA3ZvRgn/gQJcRqfJF1Zrv9IGLnmKRVq/EHHkuLLBRaRwGy0TaqBY/Ut4iL9TJPAbawEsdqzbFFeAmxnbYOWgLtvtppVDpoqd6ww3GAcFbue0eklyW5pqrmldq3L+Uq4bAY/rWbodveSeZ3CY6J7kDv0GfkhiBCBnWhfTsTwQ4599aiJYXB1sfcwx3dVhQflwwv2+Di5tlXgIvovzwcDWqcvy4kaE5xkPT2Ql4wLYMAHDpRlE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QIiEX1BGg/RPcL4NTR0Io5dK6z9osq7SQaNwyA2Tmeg=;
 b=ilYsNS7xDZff1gi30r/3V5xilClloagT0efztWHRiUlvke5divx0+awdXOTJLa7Zns39V9LHD6bFal8/gKHBO4QnexVS/PrTAKbEp08vZsLlHxuJhFjRpU3mN6W9lj4QMwFaVtH02CsU9iaLJ8q+TT3sef2HbhlJAAeKGXm41kQ=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7892.namprd04.prod.outlook.com (2603:10b6:303:13a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 12:37:26 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%9]) with mapi id 15.20.4587.020; Thu, 7 Oct 2021
 12:37:26 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [RFC PATCH v4 07/10] RISC-V: Select ACLINT SWI driver for virt machine
Date: Thu,  7 Oct 2021 18:06:29 +0530
Message-Id: <20211007123632.697666-8-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007123632.697666-1-anup.patel@wdc.com>
References: <20211007123632.697666-1-anup.patel@wdc.com>
X-ClientProxiedBy: MAXPR0101CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::31) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
Received: from wdc.com (171.61.64.222) by
 MAXPR0101CA0045.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18 via Frontend
 Transport; Thu, 7 Oct 2021 12:37:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 921f3a4e-9737-454c-2a34-08d9898f37dc
X-MS-TrafficTypeDiagnostic: CO6PR04MB7892:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78925AC4CA2F01CD04B92A268DB19@CO6PR04MB7892.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7dpO1kEWJBPmx1nmbdByFNoB7XfxKmbrfGfjqgicUe95k84yY2S3phgSCWsXxWvbzHZs7d/cFa132JI4f6xP0UHAi9EjSz2XkIrAwutc1PJUKaNRFjj0VP5S6roto4MRPm776X9opMg/yV1HBCo/su44k8fOM/XjM9EwZcnl+90UndvlIIY/Xwai1R8kQMB96F8rOkVM4r57yLzWBwSmgkOPNlPxcTqRk0dmIyE0yRFJ7InTXl0YKPR6jnWBurz/n3/ziVNffCRppGZ2ApYc54vQaV+H2LBPXBy1IqC7dzJZeniJggltIctFiI0NWwQxlvYNnxVvKzD6bPuaYPfYoUaaeq5Dol7u+QpLybq4VyBMu7T/2Hx35ANPkWzXGOMNA4EUIo7woSCYBq78ToVuIL+n4A8A8gCUcK9p58tg5wYKYOw6g6hh6vLuVS9a9dQsu9hXgkOjitchcoqeYlWAaaHn6jWubAT5UIS/VR4ac7ix0aqbAUy7WaKow1gWdoy07EOFdA2UqZmsGaeOxBjMsNSOkTLLUFyt4eUnFgrfUq4Xy70h9uXodDRcG9v+8HNCW6KyfGkwGvC5QAo8XbnZmR01sIQVmNPYI409lKp7VGfYvZ8eOw3czHX4CpyY7icqwCn6aYgG3RwCOEXmCbCwebohGTY8YATzaVjsstDRq7lIDI6cleJVyMZRW2BUQrWu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(5660300002)(8676002)(110136005)(316002)(8936002)(508600001)(8886007)(4326008)(36756003)(4744005)(186003)(26005)(2906002)(38100700002)(66946007)(44832011)(1076003)(55016002)(956004)(2616005)(52116002)(66476007)(66556008)(7696005)(7416002)(86362001)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pPX7ygS3z/IwVteLU/kZzCZ05cCuFdwOq0Y0QfxWQTP1Q+Bjs5v1SYxwrD9g?=
 =?us-ascii?Q?O+HzGI5DDfOC/+7oKUn8P71ac91jLd1VivSOOT/7/t5AdQGRFa+7btgiIWfy?=
 =?us-ascii?Q?ftPVRePR0bhfW4ReYSNeQYWaMz0Tv46R1GDsQh5VPalGt+qZX2HtIdVtgo5F?=
 =?us-ascii?Q?EaELr6pNNUQ1rCyZF4u2OhKJ8/BTwpHsq1McT/0kDRCUj5sYyq41QwcIFkwb?=
 =?us-ascii?Q?1zE2voPXaPnnBrvMotZs3OZAUGs1l7EoERvT7Y9kqRftcbggxB6OMPTQoUy8?=
 =?us-ascii?Q?NiKEk+nOxsWc86Y7On46X+J+T+eob7ReD+n6nojoZ2z3KPifjD1lRRMIuUud?=
 =?us-ascii?Q?iYKW4xfA94rYmUpthulVP0dNnnsTvOziIE8KbQ61kCtN1AZ73X8yu+MTtUaS?=
 =?us-ascii?Q?hFdfUNE9oYiYEG01cpCRQVL7M+MKu3pDPb60AaRqJMF4031aB8cbPxMavfZj?=
 =?us-ascii?Q?uLsOcXht6SoY9AUN+8LczmYhW3XgRLpHbwq4ww3z2bHzs6Dxsn+0/lW1j3lW?=
 =?us-ascii?Q?fWDJZw907+bcoDWs4+Ve13xhUSuQ/1HatCIObyU+FXqRXakX8aZLVQQzGF7I?=
 =?us-ascii?Q?qaaUcNbzHlMUIApJmHEkmOdLYbHFXDnAMClxYWDlHJVcXxQcFb15fkISr68v?=
 =?us-ascii?Q?4xBRoqA6HXiJ12cMHnwL/1xUnPH23nsV655XS2qRNL8sbBOl/u8sVKXZ+MGY?=
 =?us-ascii?Q?dHmJ7R8ZNSP/TaIrkDMWagp0NEr7zlaQttx5yirOutCw9hAWjfOsqFhnq9iZ?=
 =?us-ascii?Q?oqFLPIbHLh+sgB24MoAd0ZwEXZp0Wyb55nF+nkCh9Hsh4b9OVhk5mjtHfXMX?=
 =?us-ascii?Q?oPdCE5pCFXdJJ11x9edqjV2fSO8xVzkniTo7S/4v2UGEyvFmYGTcjrD5m6Uf?=
 =?us-ascii?Q?/BPcPo0Gyk75TxmjcwKgA8QBv0mbc+0KhhGQ668mKD+0n9cByrp5/+dw9W9/?=
 =?us-ascii?Q?axvZtxxLXuY/HHpL6SCiWgXloG14UexbLPtvIpi2rI+UTYsK7u9LHV7GY+kR?=
 =?us-ascii?Q?RlPFRrE1X6Nacv8MnvILe6tkb3U3I81ZFxQQdhAUozXR4Vuvb2zOTipwhdl8?=
 =?us-ascii?Q?1Duvh/h4AauwhZVqmhBUXJQQWgfMnuvxoATvdXTInBUvie/tXN1Gv4mImLzO?=
 =?us-ascii?Q?CbBirYdhZA00a16/kcM+RZhTH041QRVOwRirMlAwsjPwMebzv4K6Ogz+h4Vq?=
 =?us-ascii?Q?6fAoG+AGG4R4uMzwfjidC8RGgvDxXtwnmKLVwYagKMxlXeiXhFdQxkArrHof?=
 =?us-ascii?Q?uJmeSNER+g1rLl7ooxAtWzLtjGVXQtGcntNnyQGU5baHJ+y7tCD43xlVP8RR?=
 =?us-ascii?Q?h+OiYCIzHAezVQs8wD2iV7Hb?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921f3a4e-9737-454c-2a34-08d9898f37dc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 12:37:26.3754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZ8Athy6vw35pzuS/VfAwcrBUGabeQkrZ2wJ6PGCa/+YjFOZLvBwRqc8gRBrFw9r5228DtU3I20xi/fZS6hVgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_053731_122139_78B6946C 
X-CRM114-Status: GOOD (  10.98  )
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

The QEMU virt machine has provision to emulate ACLINT SWI device
for supervisor-mode so let's select corresponding driver from
SOC_VIRT kconfig option.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 30676ebb16eb..651da2ed93bc 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -28,6 +28,7 @@ config SOC_VIRT
 	select GOLDFISH
 	select RTC_DRV_GOLDFISH if RTC_CLASS
 	select SIFIVE_PLIC
+	select RISCV_ACLINT_SWI
 	help
 	  This enables support for QEMU Virt Machine.
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
