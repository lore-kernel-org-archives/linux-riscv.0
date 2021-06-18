Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B082C49EA2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:39:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB259613EB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:39:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB259613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HbISebUAe7jAob82iSJDxlzw/ooLE2X6zktJrGNEQ6o=; b=NpnPn3sCTCj49K
	il25w6tiXTfzjizG6ozlKc9JKGhG3gOr6QnHINRz3jH4iTiZIdxVe62cjDkvSEdiTmIMqjq064mkW
	Ldy3KxKp8V6ul7EwK/dg51QdN0ESD/gdRg9n5swR3UNCg8jH4FtTwK4Z247WrwesPRa/FGzZf7sO/
	OdiRW8COlN1FsJm6k7kwQf6UgkzuOSZV6FnVZ2Py4WVRagXroYDRzps4kY04q4iUIlb5GFpqkQe53
	v8sK3TdaUwX3qAsy8YKukFPBQkB0bnSzzbrrIqJ5n9nfuM6rUleEWr7pIk00RM+kTcT0BeFtAqRjj
	sjex/D5WTba0gVsSoE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDmS-00E2qR-F6; Fri, 18 Jun 2021 12:39:28 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDmO-00E2p8-Ib
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 12:39:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624019964; x=1655555964;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=+DbL6fU6jfXdfjWsF+oj2IJiejyYP5KKvPnRLd4jEB4=;
 b=SXzQLFzKp8NDIcMstVJTgGNDZBbHPJJv1YY0EtgeMrloorA2SJk8gxNw
 Y2KaAjxhjTcNgBASJ+1dyW2GYTJqOeu1ajnWwbBGpDo9H41P4l69rqoVA
 wmIU682APHquswbfcOXpIiLJq+2aAcpnArTOqgdt4yZ2yPHJrZWU80kIb
 BZ1O7GuhB51YPflu+ly5LV9Ne1Qk2Q/n+x7AvrQrkdOs98z5pdWZRf/q3
 kUDqbW/WaouBeUpRomlWWM8+s1u1V8uECX33nDzjW+s1iT/JJ+n3pNz1G
 O6nX8JeuPueaetsYIIUlVp1CIW9jOWPRANYVYBfmG5CWLpozk4RVebCTR A==;
IronPort-SDR: +COMjjxxo5GG1+HoLD56yuhhEmJTwucXQQ1XPocTtlny7pOVgQnocm7B9/VR6ydc8CBxChCTK7
 /XT34/Sl9BnWqq2YccJUCRLD6VGfdtA+xmpEnGWpFY7JUq2jNhQlmcTZ67k3LVCXGgEgG+fKZM
 rewvms08qdD7D32d0YOvfBSklrw6awecvAiZo/9o6zEGNbATzLq4Kp0wJgvZhzfhHOrE2E2/zH
 7N067114MlNPjjQPMYMDsPl17Ga1Oj1BflBBdZXkYs1wzMZABfM1NME1oUgtCIwmdbMCxAceic
 4LU=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="171563499"
Received: from mail-mw2nam08lp2177.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.177])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 20:39:20 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hIeE031A2OsPKx3h4cdBvEdD+GSbKXLp40ys4l7Lpa9yz7+ajWwi3h8HDisqgwA3A5srqvRprgrU1NKTMwQ2DLWyhyinHBBqVKPg1q214A+tU49miD+Ew+Mi0P32KNAXAzcNGKDpfllO1Z53nVUmPZxwfH66zASkHWnN+1Cb5B1dbmbeAtvTgk5ee60apL7OmxDBPuzsoXeKKZs9Dpg+pspVjVKP1C3UKjUESkYZpSnaQm0kdYBRju3kc1JLIC1rE5XeobQenPpFhAVu9+Po1DuNl+MBOuUJq8zFYklu+H78tkzt+Pxk6YUni1wQadcpQNzaSoctO8GVJFoSijj0Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTgpaX8FOx6cZEfiQTiCJx+I24MdL0XfhNyguJ1IVrs=;
 b=oBGPghuL1QCVYfa/NCytO1lGgA00AGNLWAFQL8Gvp89EVQ+PArhsOonlG6vLiNTYVIh11zw8aTz+naKHAd6uFPtH9PN/y4uwIR6W4sV5TfhP7PCnI+ldk9tGTXJBtTGJapu8McVpgiZWbdpMWqsyVVBiIfLnoiwqyJYnHj5pZDy5DiDQmghFPBx8UUdTPkT7Qj8yyU2j1U8c6u0fvv7gzmDMNfucG55sTEec4xW96pKGsARHu0IA8Zuohio87PFH9voPQjbxHwz37iFfT3G6pnmEbF503TkMDB+0hojoQB7sjv6CgUCa4evihpSLR5tgUcO2EMy5aRvbeyg6JVg+hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTgpaX8FOx6cZEfiQTiCJx+I24MdL0XfhNyguJ1IVrs=;
 b=JtUg+m6ULJJxKKQsamiz1z7Klb2lxz0A8UFbSUiBztrusVhbNxuQlc2+T0tCjkhGwOrEwqS+twsImPydJj8ZIze6KF4JkhM5WHoeZZgCPFfsC/uYFSh2dj3HHl2prwVoxJWAF2qUsu5cfEQsOHlPgBcrQLaTSEuzZHPcI2frb/A=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7859.namprd04.prod.outlook.com (2603:10b6:5:35e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:39:19 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:39:19 +0000
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
 Anup Patel <anup.patel@wdc.com>
Subject: [RFC PATCH v2 00/11] Linux RISC-V ACLINT Support
Date: Fri, 18 Jun 2021 18:08:40 +0530
Message-Id: <20210618123851.1344518-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.171.164.186]
X-ClientProxiedBy: MA1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::11) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.164.186) by
 MA1PR0101CA0025.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15 via Frontend
 Transport; Fri, 18 Jun 2021 12:39:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29fdd2a4-c6d5-45de-2972-08d93256174a
X-MS-TrafficTypeDiagnostic: CO6PR04MB7859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB78596420BFDC286A28D5A09E8D0D9@CO6PR04MB7859.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cbin+kv/yzGmrmzHLTZIm995EV2PUw7DK4CqKIIPs8WVU6VrLezyVDTP4sRHtOAq73b1NY0r1BtRDUfEv5Ug9BuHCkihbLAllt7rJDIqAzGSsWYeNShtT7esk02cDtsEunFSPtHkKR8jMHzey3GvwmX3yuUwCjB6vNpKkL3Qd/pke5dOxuT+26O/j/rmGTe5DlzBzMmZCzRTNO2GHlCMSqdxFpzQJiJ6TXzebbrGeWtmMMO7WhhRBFABtIgnWZcuIOq7/WClzfQYTEM/0c9jFIuEBVNzPNz10KzuCIl4hzkBBZIbc/Nit2Br4yfQUBwOs+CsPU2HHwnnyUh+BKIe672dvnv2ZW6naoOoo6EnZKzrgslc63qluyEgpYQzdN4DwJzp9FrGzCA0T6A8T3vK0RJVJRcmJFPWllfm/RMR45RhNHHODfbY+DRGzpiquL6LEl9hVkZGPmC/gMKNCX5jNMqVXax/ouhkHCmZ29D35+qopEvftk9TqclQEInbDQjZMTnxASgDDHDIOV1/gpuTB1kcCGZdW0BE7UR3mEiOLuodAz0RbNQGOZ6ae5ApDMKDUJ56PzFIrrARH141dcAJ6rRPX4y+W7eKO2pkLA6RBbCD1SItLoT5sQvE4GOqDWrpYwR5AlLOtDGZ9+ixSra4L6UiCqp57yQzHjz9N4BasCO2I/n6TpWF+K1M4DZWDXmXaR7/qA5coN8g+8NUeQP1xY+X9XLyw1o8FluCEJW2rpudhx2Y+BjDIAuPYucjv+j36UfK214KU6HHeT9meyCTW7lk+DMFXYh6NpsjTGrnDuDw6A90k47KkmOvGQvdvxB7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(39860400002)(396003)(136003)(44832011)(956004)(2616005)(7416002)(316002)(8886007)(83380400001)(26005)(1076003)(6666004)(52116002)(186003)(7696005)(66556008)(55016002)(54906003)(66946007)(2906002)(966005)(8936002)(38350700002)(38100700002)(4326008)(110136005)(8676002)(5660300002)(16526019)(86362001)(66476007)(36756003)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jy53BOP4ELhAgIvekWa2eXaFmhh8A95WZp06kOSLyrxPpEt16ohyfa0SMeug?=
 =?us-ascii?Q?S8XDXzl+EFv4WA4CdAZeLqhtECcsj+ki4QF6xx5oUp4eNTxhsM0u3wba37Zc?=
 =?us-ascii?Q?GGSMajE/+CgW8RGbxTUQT2NIDZ3IJOyAIcZwptV5d1jBfpPOkZH6aO55IBux?=
 =?us-ascii?Q?rsMIw8z4VcXD80uKlrjGoo1DwDEu6TWzjEXJHlWRMLCiR0mmNEIznr6Uz6Ch?=
 =?us-ascii?Q?5Kz0z5/7AmIhmjoecGEg9tWhiTXfeeHx1lsvedT/GvRRlp+WyKQSo7RLjqZX?=
 =?us-ascii?Q?L3S44UFZhkU7pqRiEE9O9DYgK7ACDhi6vdl0ksYIoA6mJbJt3gZidAhyGXSN?=
 =?us-ascii?Q?PcAXORWt/JnbGq7/hHYlLkRzkZeGpRbWj24jVkTOGWCMitKox+xnvNBiGeQB?=
 =?us-ascii?Q?LxWAqCIyj5nW7wZElPpdIiGEoI56ZKvBilEzhQ7S5DHwH4OmoTOx3dg7Ho4c?=
 =?us-ascii?Q?DU7EbF7F9urIlj+rwfMLbLhL6ecP5opwmhx7r6YORw+UQEwyCsXLIQ+mNVNo?=
 =?us-ascii?Q?sOQDKZ+pNRVdDfiVhDmHmi3kjxG3h0fLHbTtUdtcwjzRIftHBCgLO4AguAol?=
 =?us-ascii?Q?Sgdg35f2oNEym+EU4sZDFh+APov0nTBYC4MJ1tP0hwhcRF4UiepcRyUi4aa2?=
 =?us-ascii?Q?eNotXbwLXiOFsIEi71H6g7KGPr2WXN44S3IuD8dlfbyErfvio2QMdvuY4GIW?=
 =?us-ascii?Q?CC4v0o/1EcTCung6MVGmvux4rrqvAjFzt2UGzIz48qYqnnaBqqfLdz8IrUCm?=
 =?us-ascii?Q?HJYsK2sIXSty9E+PN3ny3MpjOFQxJSkQViG4UubyzDth+Ny8QjrL0NeBNJZk?=
 =?us-ascii?Q?10YhjlsCKhHRw+ZYzGHB3rSBlRtmUez6LoAcnw4itsDxYlr/m1J/hqiYvPFK?=
 =?us-ascii?Q?xWIb0VtT9wpNDLdvmHY8V52rQO2eEISNswtsx1+UdqH2nxLtgrjQU/su1LSZ?=
 =?us-ascii?Q?lHDATN/8esBHJy9Vq6bN4TKQnLpe3HWU7lmCzb3JeMTTmPa1YDBEIJm/q1WI?=
 =?us-ascii?Q?R46Xce/MacOCxlV3+Zp6pbfeWYeniUyVCcZzbFXhE7jgohYlbD7ZZXA3Zrcj?=
 =?us-ascii?Q?Hd+rH6Ym48YOlgvfjq6rruon8Lt4qnJ6KCycFCfdf/k6ScxCMc+/JeFcEsE8?=
 =?us-ascii?Q?+WjmeI67fPcHQWMkg+mtEFQCWQjOOk6/qFxiP4raA+LFJVCM3+P/bpT7ovLk?=
 =?us-ascii?Q?YxLI6qbsif8c833UGO9Ag30QlAKRpg7bd3DtuwnXY+ovcBrP7+LaB+vVSMod?=
 =?us-ascii?Q?PJGo2WTi2MoibVmS7p79nWj4iFqgIAC2WP+eU6AlLe7PNdOeRDVRld+Yevsx?=
 =?us-ascii?Q?A4vIrUeQ4wWR5JtlSDMlkoTK?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fdd2a4-c6d5-45de-2972-08d93256174a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:39:19.1088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esCQxps9Xw3wZH6J4hFNQScbZ765J/dfBidcrozoD5/k+rc87/4lf3lz+1f5rbBpjxqr8dwWDLBghSMmidva+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_053925_207071_3F481000 
X-CRM114-Status: GOOD (  16.71  )
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

Most of the existing RISC-V platforms use SiFive CLINT to provide M-level
timer and IPI support whereas S-level uses SBI calls for timer and IPI
support. Also, the SiFive CLINT device is a single device providing both
timer and IPI functionality so RISC-V platforms can't partially implement
SiFive CLINT device and provide alternate mechanism for timer and IPI.

The RISC-V Advacned Core Local Interruptor (ACLINT) tries to address the
limitations of SiFive CLINT by:
1) Taking modular approach and defining timer and IPI functionality as
   separate devices so that RISC-V platforms can include only required
   devices
2) Providing dedicated MMIO device for S-level IPIs so that SBI calls
   can be avoided for IPIs in Linux RISC-V
3) Allowing multiple instances of timer and IPI devices for a
   multi-socket (or multi-die) NUMA systems
4) Being backward compatible to SiFive CLINT so that existing RISC-V
   platforms stay compliant with RISC-V ACLINT specification

Latest RISC-V ACLINT specification (will be frozen in a month) can be
found at:
https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc

This series adds RISC-V ACLINT support and can be found in riscv_aclint_v2
branch at:
https://github.com/avpatel/linux

To test this series, the RISC-V ACLINT support for QEMU and OpenSBI
can be found in the riscv_aclint_v1 branch at:
https://github.com/avpatel/qemu
https://github.com/avpatel/opensbi

Changes since v1:
 - Added a new PATCH3 to treat IPIs as normal Linux IRQs for RISC-V kernel
 - New SBI IPI call based irqchip driver in PATCH3 which is only initialized
   by riscv_ipi_setup() when no Linux IRQ numbers are available for IPIs
 - Moved DT bindings patches before corresponding driver patches
 - Implemented ACLINT SWI driver as a irqchip driver in PATCH7
 - Minor nit fixes pointed by Bin Meng

Anup Patel (11):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  RISC-V: Use common print prefix in smp.c
  RISC-V: Treat IPIs as normal Linux IRQs
  RISC-V: Allow marking IPIs as suitable for remote FENCEs
  RISC-V: Use IPIs for remote TLB flush when possible
  dt-bindings: interrupt-controller: Add ACLINT MSWI and SSWI bindings
  irqchip: Add ACLINT software interrupt driver
  RISC-V: Select ACLINT SWI driver for virt machine
  dt-bindings: timer: Add ACLINT MTIMER bindings
  clocksource: clint: Add support for ACLINT MTIMER device
  MAINTAINERS: Add entry for RISC-V ACLINT drivers

 .../riscv,aclint-swi.yaml                     |  82 ++++++
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  55 ++++
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig                            |   1 +
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/include/asm/sbi.h                  |   2 +
 arch/riscv/include/asm/smp.h                  |  48 +++-
 arch/riscv/kernel/Makefile                    |   1 +
 arch/riscv/kernel/cpu-hotplug.c               |   2 +
 arch/riscv/kernel/irq.c                       |   1 +
 arch/riscv/kernel/sbi-ipi.c                   | 223 ++++++++++++++
 arch/riscv/kernel/sbi.c                       |  15 -
 arch/riscv/kernel/smp.c                       | 171 +++++------
 arch/riscv/kernel/smpboot.c                   |   4 +-
 arch/riscv/mm/tlbflush.c                      |  62 +++-
 drivers/clocksource/timer-clint.c             |  58 ++--
 drivers/irqchip/Kconfig                       |  11 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-aclint-swi.c              | 271 ++++++++++++++++++
 drivers/irqchip/irq-riscv-intc.c              |  55 ++--
 20 files changed, 879 insertions(+), 194 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 arch/riscv/kernel/sbi-ipi.c
 create mode 100644 drivers/irqchip/irq-aclint-swi.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
