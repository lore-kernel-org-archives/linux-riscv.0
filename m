Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225B7C48BCF
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:05:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F9D6138C
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 16:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F9D6138C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qsdez1P/tBr5tByjWJ4koxFamIYBLbtRQj0BEC/IAYM=; b=skwYWER2xWVDPK
	J57k+lgeTW17Rw2CMpf4JR9yKpS7ci2Bi8Ap/r5G/DaDFEYAkO3/xhNrTKgXY+M3q6TH53OvKZt00
	YqEoKqDhBLy5zpeqZmJt6/rqK5mvnjxguqjIIX73NNDvWLo0u2hwo4ZTxG6awTbiPkTm20A4SImp4
	00+XW4DlgzqG7d/338URlW5ajGNh3SJJxfnTx7mIMlQdWAtOUsJhtm2yQBK92KcMb297IAo+/bNSc
	etY7rH6JQtmE03Zw2WNoW3+LCDiDTVSz1PGRFX+5sHMIof6KPA9xfZZIAsrXjOFhmuHz0FG6mouhB
	IPWAH2IrsSgWE0fLVEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls687-008mfm-2G; Sat, 12 Jun 2021 16:05:03 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls684-008met-13
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 16:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1623513899; x=1655049899;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=/TOF79GKntmICFDZyfP1cbA+JNAazsTpkU0+12Rtuzo=;
 b=RjgvSQrVVrB4LiQYSSt8KFE8pT+sWjIbFKXQaBCORhm5M5y603Le+ysB
 IzmROkxo+yDkU6ARDXRabrOXGWAIoSBKwTcNiXZjgmg7KxtEmgcY8QTXm
 cvGxReB6SCk0Ox8oTDwE7fSdFW7RTogyyGgh2S3v9jNTVmHjG+0CcYnge
 I4ztBSEBQ5obnIrRq/hy1SeT8yvlYO5TPdiRIvYL5T/VbuC9EvllNd75y
 Z8z36DryNPU7e6Gm5/93uHLD/PluEF+4dYtD8CiWRul8rNC+PCbNcFJY7
 B/ANT1htKO9RE2eW4kD7FuAnz7nFb3RWXy+IRGGy9VeA5BHuZC40uAei3 Q==;
IronPort-SDR: abVxqMShN8xJGb81EiP3D3f/Pz4zgn3q7KujuhpePK+R71jUujpJKgf+Ll/GlP5MWJ3R42nSFb
 Ax7OBMiHsFcnUtpr35QaYeDCZIydm1S+CuOM2JRSG64hO8Vl9z2JSeEsCWVbbK1if0Pmn6X7EC
 a5FQTiM16IvvIdjh9dMjE83jI4tPxaIM/BZEyCMIYmu8zG5UOgMQWZ9CSwJqZKwA8e3Wl6Eoj8
 NhHpfdaCeAhqaDpHVZ3orC68DBEfkYbC9ErL0NLSnHrm1MyQYmd/eYgygs2sKbXGX5qjnVd+/S
 jq4=
X-IronPort-AV: E=Sophos;i="5.83,268,1616428800"; d="scan'208";a="283160806"
Received: from mail-bn8nam08lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hgst.iphmx.com with ESMTP; 13 Jun 2021 00:04:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KBpxbWEGPnBdl3JPTsyW+5JlC3Z2091TMTd+vtGwszesCRz6pR86GoUQpslKBVRD/Y1vuJIdhlUGi0gQkEgFxNslUp3VanVhAW+HRR39sUzdVLCMiSbNH0i2qEHiHFcvfCqQ0IfHjr1rMhhDzR04Li1duuDnWkJaiHRNKZWg7Rv4nB5YixcB4B0y4tl/RnS6BuXqYWlUDg4WQ2obCONDqOWntjgZh9gfWylrV38UGSVcX1DKDSCs/zbv+Ah1iz++jayp6I5Q2uY0Nwb+auxVH5OENRQ68bch6Kxv7fa+3vcYhSb/URbdGxdrNJeslSbk2uIpKVegRcKv46OIuLz1CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nLI1TcNQ8TgeKEsHOWshXffw0WNzkJEysUa/9uVPt8=;
 b=EMXCYHT+yOLu9t1Xdeokmssm2R80ZqTxuDRYpGCVmR4B31F7LL4u71bh2e+2EDCTWb9IesyoRwUsFYDDFFSDHFPXUwaJe4RQkB+ayKZMPLjQ6798+3erA0fvI1QrSbhipJFWR9sIjh1Yk1ziEphM78dO5vclKDIfq8N3KEaZcVhuCY6L4Fq6WLqM8yRviIJf3SgPQx26ZxhH0Ba9hdkVI7UPDJaU8inWXztcgfC83dQ0GIek31MPCc2UeADj2zZYUSKhElboi94XWzziRtonFDCLjT0pBFLtTLOJh9Td6PVYL7Wqncolo9spWAx3Cd/CSfavjY1fRuOgmnT/v2OHEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nLI1TcNQ8TgeKEsHOWshXffw0WNzkJEysUa/9uVPt8=;
 b=s3wtVqoHsEqzh8oMOhncw/d1yDJ7VLqoWkuisqKh7RfAvAHmJOdTYF5YwKLnPcxRT5GgpsPxzDQ+jxaMcYNv4MvkIlq+DZaMs7s6NS/T1eFMen1edBrufHLKXxDWZvVXmT3qGgsAaI+OyYpohBuIEkMrw2k88Y+ZSqyWmuHAsp0=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (10.242.165.134) by
 CO6PR04MB7795.namprd04.prod.outlook.com (10.242.164.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.23; Sat, 12 Jun 2021 16:04:56 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%9]) with mapi id 15.20.4219.025; Sat, 12 Jun 2021
 16:04:56 +0000
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
Subject: [RFC PATCH v1 00/10] RISC-V ACLINT Support
Date: Sat, 12 Jun 2021 21:34:12 +0530
Message-Id: <20210612160422.330705-1-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [122.171.171.205]
X-ClientProxiedBy: MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::14) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.171.205) by
 MA1PR0101CA0052.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Sat, 12 Jun 2021 16:04:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e0e83c5-e817-410e-2f25-08d92dbbd231
X-MS-TrafficTypeDiagnostic: CO6PR04MB7795:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7795162D2C49D221A6DBA74B8D339@CO6PR04MB7795.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 59qyTZY4iBTvmz75UK64voO0DW1Qtpd8iJjHegWaZdouffJNbjazBnWck9RoTGjPLz7NWUmy1hVvyTXEDKyBnNmyTtljLKabPj+KJkigRZIQ/NDUBZMfkYqGGZjJYpApqT0eIsIbtMY4zgTGI7b8e3iVPXgQ5eY3ZnlA6YWpKc5lE8Kjk2amL6OWOBo66MS7YYAQSopWxi3ySTszDfkj0bhqOpZuLoRYg7OAQSFtWQN0blJXIfApQ2mg0i6833Lez+Xxv6CLDL7VHM6ZND0cxx55KvRpuaWOw2nFVZbqbuhid3L7oOflhVZKNTfVRzPNRq6UbgdRxd+yzU1eYGbXULgpxc4bPvCYxh+XSvqMua8qQBKwe0TnB7/wHbEgwUNKRCfUl0fM4hcRw1NZE6nDYIYpsiXg41+wFZcfm6VRdZLPeT8YB0lA4D6KWxem/snE32f3hxvjT6RGsgcWLcqAQ0jNhOhI/Nr7wqNPhm9Ds+4mLcDwAs2K0nwLLwNmbfVDc2GKS8rOQWYAZusjVRFRstxUJknjypOQ1WY9mgOdxt7eZodKRegdkEd+2wCwk6KUhVZtQfZZ+yY0KbOv9ZyCvL4f2kYZJJnerZZEfMOizXJmrGXTJpTHpnlmKeRzYP4aoHN50mpkVGVWTeBi8Hf1eWUs+e86UlmuJ3FdsDD5jwZBU8K9GXBvIGXvoaUKKsJk56bFVuxnoiTgrL6kmnVMEGkfy3SFb6FIU6z19xz+cP4ijEGGpXOvG85czy4npVedNoe0QMb/EDCc3kre6yYydp9UsvlKgn9j+7qkJrmR7SwMRVxyNf8GluSuTNKlEWr5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(36756003)(66946007)(316002)(4326008)(38350700002)(86362001)(966005)(8936002)(55016002)(1076003)(66476007)(54906003)(66556008)(38100700002)(5660300002)(2906002)(7416002)(8676002)(8886007)(6666004)(44832011)(26005)(956004)(16526019)(83380400001)(478600001)(186003)(2616005)(110136005)(52116002)(7696005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DTpNMOwI0Thph6jYL942uVlrTySuMZiRRZuEIvIsSMLeGlctNNDzlV6zNjLR?=
 =?us-ascii?Q?5KzN+wogILUdVNVPRIk9B8Nykuulbs9jI/NnAfjVQQIVEeZBIwcBQCEmz4+C?=
 =?us-ascii?Q?qhR4TTXwv7Sse/MTu0fz9GdiTbnyvdfgMJDTANdsSkp0rCdQtVAQ4iHaZVMw?=
 =?us-ascii?Q?NRypw2Z2W2MFKETFXXKcuC5/JWeTNcw1rTlSMa5pEMzxJT+Q/y9/T0SzRNhl?=
 =?us-ascii?Q?iBUul+0mSggJ66cMfa52m6NTlAh3+3Lr3b3Tn+46dvjECGh0oEe41ScED2Mr?=
 =?us-ascii?Q?c6R4pcdj3HYOUuPK+0/LONO2riUrRqDde0Cfn/WzyHQssbQSOtIfB2kiAlEg?=
 =?us-ascii?Q?HgW3vLESd0BJt3xxkqPYyStVu2vxBVMTqRj5rJs+L7oUS8U1i5Vd8yGGGA20?=
 =?us-ascii?Q?p/PNRcsdogWWnaVJDAI4FPnCWwp0iPkK58J+yhT8kc3OcD2GGvHA0djqV2zX?=
 =?us-ascii?Q?uyNPNLP62NR/7+V0CMH4I747N4Th0Qf/O2to8ubeFUnC9i3ya+Jfg+gwK9bg?=
 =?us-ascii?Q?EzcJXdSx154kX6wZQ6+CeELTqLBLPcC8m7yFQdco9ySVD9uDDso07aD7gOhH?=
 =?us-ascii?Q?3P+pfbffu8Bar1LsQcDGB3inq5jLvKMgz+SmLFQ4/XwDknuVC+/zktNG9ser?=
 =?us-ascii?Q?vU6Vaw4JfQyyd7JjxuGMTJqiuKbKduE16jUyBKJFGfuKbxAgxzG5IpG21xhz?=
 =?us-ascii?Q?eTcMeTW/qfayOG+oG0sOiHVpYJsiesfgixl1w260yzFTfm69WYj+YMNuE2Ej?=
 =?us-ascii?Q?KB3sAAJlJ692xyw6ZWrzmqbMqWI1hsFYaeI/AqvBceRbsSl5s+4jbszCMJvS?=
 =?us-ascii?Q?2mm15ZLKz1Pdvi9qCr+sW9dzbOSGP8Wm3Js3znC1fA89Gzm2R0dgAlavgq1K?=
 =?us-ascii?Q?kGtwOXsHlQYU65cQqw42xFxL2yus4kco527F+6dtdpv+9LFixElbV4ie2vVo?=
 =?us-ascii?Q?nxRbySyQ8dcVcOPAhaCa4CvF+60b9213cUv+g9OPoL+mFM9NIy4zE1uGPvhs?=
 =?us-ascii?Q?Y9Uq1hm75hf4pqT5XWumOCiWNK9kJvnfuO09lrQvZ3b59v+jGRRm/HGtdo3H?=
 =?us-ascii?Q?2/lIpqwxdJ6a/KRNMLaCkEi5dd55g9wxcjfeCiD1scGmb0luIt5kL1QC3wrg?=
 =?us-ascii?Q?B4Z9EG4yfmDCdR9qhiMZ8NofPxL68AyxRT2k7rBZSD5BWJz+qgDx3RneR5Qc?=
 =?us-ascii?Q?ar8B9MDz4nXcbp/IG3oWVjbQOg2h995RqdI5tR82UaL8h/M5vnrGygUayXQF?=
 =?us-ascii?Q?WxaMyD/sVpsgR0fTzqLVbHSX5ENL6nMagY3dJxSDSBrx0hcE47R7F1otV+Ob?=
 =?us-ascii?Q?S+alAM3QssLgv8cx6E6unNRS?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e0e83c5-e817-410e-2f25-08d92dbbd231
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2021 16:04:55.9811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gmLtwkH8qqbRWm1uOsCvYxEW5Mcf6nFldiEjHnZLi2rhh7VXR/anexaze5dHLJvfdBpShZUTtD51M5vsxZtxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7795
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_090500_105117_22EC4551 
X-CRM114-Status: GOOD (  12.93  )
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

This series adds RISC-V ACLINT support and can be found in riscv_aclint_v1
branch at:
https://github.com/avpatel/linux

To test this series, the RISC-V ACLINT support for QEMU and OpenSBI
can be found in the riscv_aclint_v1 branch at:
https://github.com/avpatel/qemu
https://github.com/avpatel/opensbi

Anup Patel (10):
  RISC-V: Clear SIP bit only when using SBI IPI operations
  RISC-V: Use common print prefix in smp.c
  RISC-V: Allow more details in IPI operations
  RISC-V: Use IPIs for remote TLB flush when possible
  irqchip: Add ACLINT software interrupt driver
  RISC-V: Select ACLINT SWI driver for virt machine
  clocksource: clint: Add support for ACLINT MTIMER device
  dt-bindings: timer: Add ACLINT MTIMER bindings
  dt-bindings: timer: Add ACLINT MSWI and SSWI bindings
  MAINTAINERS: Add entry for RISC-V ACLINT drivers

 .../riscv,aclint-swi.yaml                     |  82 ++++++++++++
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  55 ++++++++
 MAINTAINERS                                   |   9 ++
 arch/riscv/Kconfig.socs                       |   1 +
 arch/riscv/include/asm/smp.h                  |  15 +++
 arch/riscv/kernel/sbi.c                       |  10 +-
 arch/riscv/kernel/smp.c                       |  36 +++++-
 arch/riscv/mm/cacheflush.c                    |   2 +-
 arch/riscv/mm/tlbflush.c                      |  62 +++++++--
 drivers/clocksource/timer-clint.c             |  45 +++++--
 drivers/irqchip/Kconfig                       |  11 ++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-aclint-swi.c              | 122 ++++++++++++++++++
 13 files changed, 415 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-swi.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 drivers/irqchip/irq-aclint-swi.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
