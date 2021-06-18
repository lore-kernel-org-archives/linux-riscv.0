Return-Path: <SRS0=UO3w=LM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DD3C48BE8
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 588A1613EB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Jun 2021 12:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 588A1613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pe8e6Ssp4JSWvgMv5qf+DjwRYhfadhveljrIrsblmhQ=; b=sbbBS9evVjqjUX
	jQxnpsrHRMZ/O2nQkbTLzTLhTw2Hu63oNWHhvUPFSjfUfb3Q3F+c+xs4KwYgTfpSxOaFQjzjPjYTx
	sniFucLHAiDr5va8H62MWx4NdkZTdgxGYaKy9pTEwlACvOujvgkZfZJIaVKW4Nic3qGxIUshv1dtN
	2gVewUr8pD4yV4UVCXOUFxnZtaTO6sg8d+XuwHdP5Amm0RmU4Q4BsZI76tgnb39TWpFCMIPfqKrco
	Z1jpBQzkufdFrRX6YgUJ6/Hof8Z6oETFo6/NI6kARP62AG4Fj2G3QMCbjjhmDD7kBBsJ2erBlRMqh
	NMb2h5+Tkc65f0bBv+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luDn0-00E36j-Pi; Fri, 18 Jun 2021 12:40:02 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luDmx-00E2t8-JV
 for linux-riscv@lists.infradead.org; Fri, 18 Jun 2021 12:40:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1624019999; x=1655555999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=DqkClFgqsnapo7ExFYeqPGKwbgwciANsWxvz9W/SZlw=;
 b=ND0lbkmTyFhQoBpmA8Cb0wqXIiWOChBetYd674UKlCJw50IIpgjx+cE6
 Dgps7gHLdSZKnrWUQNpD3Dk7YFdqQzd9qATemhhBfIQJF2d0KRNMZlDib
 SHoREmeEKeUzNy1Jt+aqzOATHfDYfVnbXTi1zwQok8wyXGZww0UXJFvwA
 mAp1LeG1O6RHVZf2dEWEWjwBgkDusXZSzNu9Y4mYW9Y2xYTS0ijO4VJSG
 +nj6bQv9a523/jg/8DovTHyFs5axRgFfXSvwJyK6bFvBtcHBYKB7wRIEZ
 rKxsR6mjET93fuws1UkEYrWh6fyRBwtxZ8ntilhdiUgRULYQybrlkaIBq A==;
IronPort-SDR: PG1dKjXCjjZkAxHisfr37kwSHtoUp+0By62Uybi4krqhgb6a9giuRStBnsBZNy/u3TjeJkkCaa
 /x5Bwf+RMOdIxKzLBZFoFIJ1j3m8rCt0MJPJjmaxmk7dd0fgzjiDJxJOGyfGS32V6njv1zd8nB
 mVqMbbRbbjHjxRzh83jQam8PqOBeC8CJCf9C3pCZwc/PxJHv0o/AFG7I8PMvo9HHh8ZhELFYy1
 RjzkTm6V/NmvTAojK1650nNkqz+Cx4kKQWojbxSdOwo+rvIAyjm6PmJl4FccRrUphWRjv2M7rB
 t/Q=
X-IronPort-AV: E=Sophos;i="5.83,283,1616428800"; d="scan'208";a="283779334"
Received: from mail-dm6nam12lp2171.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.171])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jun 2021 20:39:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNfJVRzNhSyQ/fz4ILyXnh2Jbq0G3a0f5TsNOm/8XvdzCzU8tNr1101wpsencdenAgCqAQLEVfxcV5rlhKdK21UViCZOiE8AHNBEozwgGZvNg1q8klGPfIy08a/V3HUO0rxWlYrMo1uopuEpZ/rXyBc6/i3zo/pZFL71x4YAeYkikeFHNHTq28+kDjU/rrZ1kcFgXIBFgHlmxUXv8KlD360vrsRoevs7juNg1o8oy2cp/gat8KJKIsyjbhWbdGajlxKFR/5OphXSX8hkJyIwLjVzfTz6NR4nAovToddretpRjVqKqJNIdhjwS1HxCtkGv7Ep9FQLrQbJBQ/1/Bs/Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGezVQAZvFl1pf3WlSCvFL5HKNG/bh/KgCa/0igADZU=;
 b=fBAvr89kwyyqz9yWAwsWSOd8QfcV0wFHhSASGLlp3CzCVPwDXng2XsdXepXycyuVleHI0fweD8VSRdFLDbvl32dz4p8aeV63zGHQ1yRpeMdZFwS7zruFXm4v4ZbaHRVr9Ex5zHbnXQkdVbdoWV9TE/bxv40yrm8EvSiPm7+sXfx6SpI0X/bCpSf8QGaaagLy2r+3JeZmTcpFQkFdPiLFmppZkZnleBK3r8jaU2V4luJQOasN7xOTbfxHq9bJPaL0a3StIpeyRObbGzUaVR2m4TvenpDlEvz8mPvljKa1uyDN0fxLjdvuVtirv7w/EglRQePzz9qLLr1z+jFPvpXQNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yGezVQAZvFl1pf3WlSCvFL5HKNG/bh/KgCa/0igADZU=;
 b=GE1egMcJ3IMcitvTCW1dM3QmFOfD+pmtU30n9UOtyCAf8iR5cbH8hchBZ5xIOE358wG6mCnkTQ2yITZsKRhq+J1UU1SYuDS6ZCId+8OwZBaGW7Nep2P9rt/3VZ+zXJeeTBpHq2aNREB3ig1wKfSn8ic3SUTy0poRKIyydNxVVuo=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7857.namprd04.prod.outlook.com (2603:10b6:5:35f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 12:39:57 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4242.021; Fri, 18 Jun 2021
 12:39:57 +0000
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
Subject: [RFC PATCH v2 09/11] dt-bindings: timer: Add ACLINT MTIMER bindings
Date: Fri, 18 Jun 2021 18:08:49 +0530
Message-Id: <20210618123851.1344518-10-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618123851.1344518-1-anup.patel@wdc.com>
References: <20210618123851.1344518-1-anup.patel@wdc.com>
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
 Transport; Fri, 18 Jun 2021 12:39:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 500a6c3e-0a3b-40b0-275e-08d932562dfe
X-MS-TrafficTypeDiagnostic: CO6PR04MB7857:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB785792493C505D62F908E4748D0D9@CO6PR04MB7857.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mzrunNa8l4B0ptsU5G8bjndQuoWK+9x/B86CMnFtvp9/h3NtvClPInc83QyG6oa7xz5kI/qFb0MWj4DiVs8Ra/covRDUPdpLzUNzNxU5F285mxPautEtn0Y23C67oFGV2uHeTSmjtXN2akS49ukbIjBhSdnASDMdUyfnrqqeYUsHZ2d0r+1vHNswhTv1758gcg7CMSN2hcr0IP+Rw4IpwlzVpUNOj9kNJw6Bf11ZcWvx3HvrbxjjYE5sbf1Pjh5ZeWdV0UvrPpLeEYx4kQDblhWGM8VZV+FEBvExxEwsQcOWH+eI+/mUIFFkbLRoGrY1vgn7k7hULJ7nLc6qj4uNoc+Pq8uJxT23JyWyUt9z+POFO57p5Y0k9+4jCJFD3EhDxIDjP7czurfwMwq7zwRlARjELzstVQ5wue5d8nd9vM0+VCkbXL21o9h+bNCQzoQfoO/2bD7tBttpXTxgoZvhifYNH99K8ssnagC6GQJX2/ZUWGhBz4I9bKgYmc4Aeb1iqbUwYTvDFX4jsnzCPkO/37vg1uhonD/4P1Z/9NnJtcjMT8j+FcrYT52wK0fZfvBHR7My2yheieCxu9wdnx0a6vsK4syPpWYMZCeAfc1XXD0Mn9Pg+A/fPfm1WORzUdbKzFLA0HraRD3h+GK0ytgn9ZPCN9L0SAJULP/unL5KwU7Wvv99RiZXJVVl0GxruzBehl6fTCRaba+Q4AGsD6tsldGTlUAs/gI0M2bzyh0D9iyCBjoq+w64yJ2fbFlPRiYkh1S9BginJM4WtnXXLV4IzhQ2ooVXkifh/8M7hwfUekDEoOwXAlnGJIAqfceFvZO2O/LdZI3Mt5g5EVMU75BmnA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(39850400004)(376002)(136003)(956004)(2906002)(478600001)(316002)(86362001)(52116002)(8936002)(44832011)(2616005)(8676002)(4326008)(186003)(36756003)(5660300002)(55016002)(83380400001)(6666004)(7416002)(7696005)(110136005)(66556008)(54906003)(66476007)(66946007)(8886007)(38100700002)(1076003)(38350700002)(26005)(966005)(16526019)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ECq07MtUIobe/q67iQBKBfbLSirp1RzSNmg00hRRjVLNw6wRDIOV416x0vqY?=
 =?us-ascii?Q?y9k3/c3+dyHyJM7EaV2TwFQFWukBb60uWcbdP+CJFFcXPi+mLqT6V1o3jSI0?=
 =?us-ascii?Q?Q5yEqPP4tIkfeD8uuGmRs/ITxCu5zp1jfQZry7f15XMmxJCzzIkgp8dlU/BN?=
 =?us-ascii?Q?cAHGeuiyxFSIhhUqahUVEiFo6v9xgATLk4TvpXXbjVCyFIZ7i8EdopuBYK9J?=
 =?us-ascii?Q?QPgr8WNhP+nLr5ZUy3bMj9Tp2ILgeOGQIuZYvkAYt77qUyGRcvlzuUEGdT/h?=
 =?us-ascii?Q?Wf266OE6Tf1xywcsgJ2JbUPfbcxo220ket8WQbEG7XLQD/oNm9zgZ3ID0oCp?=
 =?us-ascii?Q?UJnEfgqw4ejoU7sdZYNjdGlE8HYgWSf4X+Q496DpeeTOrk2Ew8o8lb0KLJrH?=
 =?us-ascii?Q?WDzH1+ZUSaVrMaSYuq/92FUC/VhnSJn0DBNp6j5TtvwZix46tyH+Y8SgsHfz?=
 =?us-ascii?Q?NdLleUeh3I8k+WpV6A+WVbYP5LMywfK3SSqtSfNamY1J+Bx9t9COB9i/xHhj?=
 =?us-ascii?Q?I/zEUASlbpE6DW4fPsxXGdWV9gTIsap0MCjqYQdlYqQjFBOrsh3mfK7jbLIT?=
 =?us-ascii?Q?/Em/4qDYFcuNYUMy/zA9SYNfPTCLQjGvfNwgh4BMIZ0ZJLZdEW1M0anwpM8g?=
 =?us-ascii?Q?C+wah99BTFsyMHDGqcaDGBwg5tiTtC0sSFlZxSzknpzAYCMAW9uCbP4u3rdT?=
 =?us-ascii?Q?RQERw8FevXTrotNwXW4u9tdEjS/kfsEG4hfQQDe+PspWOHbyz89bfCoDUcFW?=
 =?us-ascii?Q?c2vja4bsAaKpUo3NoRGjXzNNLtMm6bGjtGdiaNVHSZecPbj6jzHZr89baeh2?=
 =?us-ascii?Q?JIQprmaEKE9kwbEUHWdv25/py5bGcWm2JzwmpkYWB8iDr6H+SDFcLNFSyix9?=
 =?us-ascii?Q?szNNkuqrGz6AM4OV+OJeX7hZiOtbs8y97t+qJPMzJlC6Q1HH7xgaOPJKoB/u?=
 =?us-ascii?Q?WLKNv+el+Qq9ZWCdTJY/fieterujjVCrkEVV8hkS1nDhNPMGcIRfyUcNFuh6?=
 =?us-ascii?Q?Xfn1jCAT5C/BF7RUG9t6li13Hz+K8JUuTB8FgX3c9V/t8IOcTrvV5KnMPhzi?=
 =?us-ascii?Q?FJkYHfn9BFvAXfgIrWzreuaPB4nrwlxv2Bp2QnJT3Kvo7BqxrvBsEdOh8tqq?=
 =?us-ascii?Q?YiTVRAleon77KZA/fqfyo9SdOKkDzm/McrtV6uwfhVs5oFD/E8jkCTkqOKN1?=
 =?us-ascii?Q?uBPRw7jqRx5A1nNi19941hftHac2yD2ufSgiI5vKEgJHbfmQ1RYe+2z2TdvV?=
 =?us-ascii?Q?t/8CHWKaYN+uva+s1gsJvAwTR1OwUgmOL+3dIGskvQrlukl7OTOIDdE81HT/?=
 =?us-ascii?Q?RbWmz2r+oNikqR6O5LXpN8xP?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500a6c3e-0a3b-40b0-275e-08d932562dfe
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:39:57.0828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMfYPaFH8Pg2B8yLlmCDEjX0YsVNNajwKaGFgyP4C9Xjf1ZLEIie9ue5YD4PFnCdRPmy3XnzlFWvVMTIdiyfTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_053959_697995_936EFFE3 
X-CRM114-Status: GOOD (  15.37  )
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

We add DT bindings documentation for the ACLINT MTIMER device
found on RISC-V SOCs.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 .../bindings/timer/riscv,aclint-mtimer.yaml   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml

diff --git a/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
new file mode 100644
index 000000000000..1f467c869d44
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/riscv,aclint-mtimer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V ACLINT M-level Timer
+
+maintainers:
+  - Anup Patel <anup.patel@wdc.com>
+
+description:
+  RISC-V SOCs include an implementation of the M-level timer (MTIMER) defined
+  in the RISC-V Advanced Core Local Interruptor (ACLINT) specification. The
+  ACLINT MTIMER device is documented in the RISC-V ACLINT specification found
+  at https://github.com/riscv/riscv-aclint/blob/main/riscv-aclint.adoc.
+
+  The ACLINT MTIMER device directly connects to the M-level timer interrupt
+  lines of various HARTs (or CPUs) so the RISC-V per-HART (or per-CPU) local
+  interrupt controller is the parent interrupt controller for the ACLINT
+  MTIMER device.
+
+  The clock frequency of ACLINT is specified via "timebase-frequency" DT
+  property of "/cpus" DT node. The "timebase-frequency" DT property is
+  described in Documentation/devicetree/bindings/riscv/cpus.yaml
+
+properties:
+  compatible:
+    items:
+      - const: riscv,aclint-mtimer
+
+    description:
+      Should be "<vendor>,<chip>-aclint-mtimer" and "riscv,aclint-mtimer".
+
+  reg:
+    maxItems: 1
+
+  interrupts-extended:
+    minItems: 1
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts-extended
+
+examples:
+  - |
+    timer@2004000 {
+      compatible = "riscv,aclint-mtimer";
+      interrupts-extended = <&cpu1intc 7 &cpu2intc 7 &cpu3intc 7 &cpu4intc 7>;
+      reg = <0x2004000 0x8000>;
+    };
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
