Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09241C388F7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:22:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0E220795
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 15:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qlVAra1+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sifive.com header.i=@sifive.com header.b="keKRJtF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F0E220795
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SFErzZFgbtkiOZoQGRYVGgfjY3vqQZbrCkpTXqlT1fY=; b=qlVAra1+9tBNooMbv/gYyndaw
	z+XtHwN47RuXxpbR/3HuxvOx+uYAoiEDFflagfI9Oj20F1xUSKiiD0A1JERpwXf8fBOJIha45nvfZ
	e+cgIrSgbOLovPgMqEGV5cu7/gw33F9OqvrxExtMw5wvtkt0Vwla83tH7zgiUvws4NhHB5RdKG+Jw
	LBENHxtUZh3oEHCMDP18MxPl2e6cXNzHjjhJ0Dj4pX1VAYr1rt+XMzMmaUCRzabcPUneuuTvc8czA
	eLVUDn4LTh76KOVwbJg6JVWrfAWrkE4BDRDJmbBOEMibxr3tY8odw9xTxZ3IS77+GxOs4llLwu4Wh
	lpyySKs0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcVTc-0003e2-Vu; Tue, 10 Nov 2020 15:22:33 +0000
Received: from mail-mw2nam10on2087.outbound.protection.outlook.com
 ([40.107.94.87] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcVTX-0003Yh-2M
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 15:22:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCS1Q0zW91iSiMYl92JAVT9E6UoKHCZfTB44uv+W6HQWHcZ8ysd5bvsRRMNArlcwYItCTpSEojOowx76mbmxY44R1ZDRgtVP6GTSGsLpjBBVDcHxyaYc2webQQgjp64f941zBk8BOL7oXywsuH+fv9zFKWsfvMEgAc/Jd0CKqRm9PX+mDpdHWdd2lrsgjrw7jRy8nzaq5mcLd0kSaeGjY6SW0pMU4eZ7iR7E2vHPPBPt48NNMBdvTpoZ6QdhDrTNpLedyTF53IhxhBktKDrH18acPSQU+CZURCf1yUEw0E02xmvk6Sx9OJPLZPkAaaJRIJcPicrFZA59nfE1CO4DpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IkFQ0gVQhd11+PvyLvhEyJcGCGUSHSu7uezfzUFz/I=;
 b=ftdxQLZ3dXcOU0+Rx9sTflC3oCm2iuO07xAbGupHud6bQUWvU7zra6yi56FZNy6+SwccElgKrTpQz2KskvSHk7SuzyvvM3iNjzJ7bbZAdd7Lli4n4iTea8lbGMcspOoknYJpW8bZAS1HfoUNI7EpIz1einHDb6H6FlHWI3QmOFSEhhnzA7eqbAAkPobDFXcHQQTAKzel9g4STISE1/9Mvpvq3QcjzBnz96dWC68Lp69PiH0W6HjphHJ7eE1mLMUKZbRb5FIGmG3nMy5RYNd35wBYgGBOxXTCtLuPSDiN2wEyyjrbOp0Wf1XWyeKnhOVQxfAe6b09r3BRMItE1or8EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=openfive.com; dmarc=pass action=none header.from=sifive.com;
 dkim=pass header.d=sifive.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/IkFQ0gVQhd11+PvyLvhEyJcGCGUSHSu7uezfzUFz/I=;
 b=keKRJtF5GDs6aULbdiyhmy7H/Xu49VhL9bUzP3Hm7cBYjA92HC+ddR2Hf8eHPTSUfskg7U6maO/G1B8Yf/gWy6UM3y8VQ0lBr8OO0m0fCPS7CY0FgH7MyaySSGAG6Nv3j4a6g+frMOG89aR08F8VnWsHXriPF3Ogpy0KCFg7G5s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=none action=none header.from=sifive.com; 
Received: from DM6PR13MB3451.namprd13.prod.outlook.com (2603:10b6:5:1c3::10)
 by DM5PR13MB1323.namprd13.prod.outlook.com (2603:10b6:3:28::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.15; Tue, 10 Nov
 2020 15:22:24 +0000
Received: from DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::d55:1263:fadc:b6f5]) by DM6PR13MB3451.namprd13.prod.outlook.com
 ([fe80::d55:1263:fadc:b6f5%5]) with mapi id 15.20.3564.021; Tue, 10 Nov 2020
 15:22:24 +0000
From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dts: phy: fix missing mdio device and probe failure of
 vsc8541-01 device
Date: Tue, 10 Nov 2020 07:22:10 -0800
Message-Id: <1605021732-268521-2-git-send-email-sagar.kadam@sifive.com>
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
 Transport; Tue, 10 Nov 2020 15:22:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c89d592b-cac0-48f4-4868-08d8858c6d39
X-MS-TrafficTypeDiagnostic: DM5PR13MB1323:
X-LD-Processed: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR13MB13235770B4B624B7E528BE2F97E90@DM5PR13MB1323.namprd13.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZaGT8wuXkBhRfdS2fD5qLohpgzS9nV7rDPbpMemfY5gOrFgTkWVhsA+PziIJ2MZ2MBmTTX/Td7wW8TpRBjS5ZL+ZjktqtWa619/m3T0WEP+SOAVzG93hivIxKpx1/gU/qUaGcc2y/DFXWUyZm/javZEhPAFYdEIA/oKSkvOhaKrTHP/dBFxNBiuiftOUCr7Pgh2vCtELlMfc1gpO1N9nyHOJ/gEe/s7zjvC7/RlPYZGzEEQWxkFE/YJZgyaBDvxL2dYmZLbNc27j/LaXQ1SlPyGDQjPd+CeBtrXdSiB+spz8aSOS6uCqYn8x84J50isJxgcVnQZ8L0HOoZdmEwnHvogMClIuGdVvCCAFBXCxYQ11vmpULm2wmkm+IbAVza/A+sL01/nYBBOLfiz5J6LvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR13MB3451.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39850400004)(376002)(396003)(366004)(4326008)(83170400001)(6486002)(16526019)(2906002)(7416002)(186003)(2616005)(6916009)(8676002)(956004)(83380400001)(66556008)(42882007)(316002)(66476007)(107886003)(966005)(8936002)(7696005)(66946007)(36756003)(5660300002)(478600001)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: xoQDiFe9C9E6AS2yxm648GAl8lAUISMA/py3bjFQeBU2ORD1xA7jaOu+bkzvpwzJrcJn8RAkimIcdUehUIlvIUsyeIcR+hM3cHU/uD4wEz2uWMyxPvxwdfKrEWPFbgqKpnAbLmq3mG4O+GbpvDXXiPL7bmiYApbCce4sFp6NsqHVRJt6Xpo2oP9yw8EhsM1QRuiJeqSovPcs5VIkUtbqDcgx4NRb9XmdnAa5zwsWFm3P27hcIKyqTYsPnpHznQMR1nN75KU6bLLNQP3h9Ze2nheN/Vj0pI10pC1QEFUIX7ilx5Xnfp/ZbfFCgpLcFanDvlcbTq6cu7lQNgnshKvTNmA7BXkZ9Gi4twEIAuruLXC9IMlZrPBTgD4SHeKJNRDL8821eNK6/OCQY6DcGV1d1PWYgo3AItbeV0nzc2u1VahX642T6M/uqyh5yQdfcfQBcB7b/hIeQgtuNQpY9/9xqoLemKM8ahmc6efPc6sjmZfEWgi1qD9vF/eHPCuI9ztZEy7wDhmAae+C1PD8D0W4cDu452Q2hBaRM2K+S7VQovt+JxtZBNvY6I6/5zpAP863YhFH2E/yuUWBI5QzDfvciqywbK6l11GGEUYzV2geaqEq5s5u6cJ6PhoKQxm2y+go9JREaKs7tr1gBF1ViNGHPLrAL9yJVYDhrJHokUtcEEAkM1Ob5xcVj97IbhYjc518YR3bqzqtMSZiUUqrfPJp/SbZ59tvUiU3Al5jvyPNPq0nuoIrlrEnSstgXUpWqWg0qwd4LWYedu3BQdieZW+G93pwApAtFLZbUi8sKMQYBJ78GH3CtxiDlh5qov2vv32OcpV2bUvsbTHrXAGC8eMpnA6iLRHmTYCZ9hWtqioDQ/J2td4/oO/UjfgzPvz68f6HJNWCEjcMolKolZsf1+kbew==
X-OriginatorOrg: sifive.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c89d592b-cac0-48f4-4868-08d8858c6d39
X-MS-Exchange-CrossTenant-AuthSource: DM6PR13MB3451.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 15:22:24.8190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 22f88e9d-ae0d-4ed9-b984-cdc9be1529f1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /W1DZmGqHXCFnBfbPd8EB+XKirvyRkExaLHNLCU3XBlrHOAOGtFsbAuBqCOiVVm1a5eaAonyPUsCGH7d92bbDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR13MB1323
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_102227_208229_ACDD23F3 
X-CRM114-Status: GOOD (  13.99  )
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

HiFive unleashed A00 board has VSC8541-01 ethernet phy, this device is
identified as a Revision B device as described in device identification
registers. In order to use this phy in the unmanaged mode, it requires
a specific reset sequence of logical 0-1-0-1 transition on the NRESET pin
as documented here [1].

Currently, the bootloader (fsbl or u-boot-spl) takes care of the phy reset.
If due to some reason the phy device hasn't received the reset by the prior
stages before the linux macb driver comes into the picture, the MACB mii
bus gets probed but the mdio scan fails and is not even able to read the
phy ID registers. It gives an error message:

"libphy: MACB_mii_bus: probed
mdio_bus 10090000.ethernet-ffffffff: MDIO device at address 0 is missing."

Thus adding the device OUI (Organizationally Unique Identifier) to the phy
device node helps to probe the phy device.

[1]: VSC8541-01 datasheet:
https://www.mouser.com/ds/2/523/Microsemi_VSC8541-01_Datasheet_10496_V40-1148034.pdf

Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 4a2729f..60846e8 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -88,6 +88,7 @@
 	phy-mode = "gmii";
 	phy-handle = <&phy0>;
 	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0007.0771";
 		reg = <0>;
 	};
 };
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
