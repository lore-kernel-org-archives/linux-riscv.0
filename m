Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABFD0C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 13:39:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 234BC61243
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 13:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 234BC61243
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zXL/wnaJ6YM9hot6d15arRJnx9L8ckxeDcMs/LNR+Uk=; b=K03SKx9Jn2RL701qgKp8uEGig
	CDj61/kFWK1QNsOKPU7xKCc6Xt3ukT3P6XnKb17QzfqIkNggDdJXeeeePJWRa3Y9gunRoQbzbPHyT
	QuSowBHoKH3mU+gxmCFJ7dburOK1pQvs9o5QXdhK3WH0FQIA4xiUfIsfalQJp6ljk3lWZsdDde1+f
	heZNBfus2SmgccjTC+cU4K1JoYTiTwDq/sXdQitdqSu44rQNVxrEx0hzCISLS4KbtnhtNmh7wXaxb
	4jKgmh/oo0VvF+wiwFokV2ye6i1YRAoeQTS+V/78FIDzbtkAA1jChLmU/o/gzs6ElPyC08XNpqIxD
	4NRL8OjsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRxXE-009hyl-KF; Thu, 01 Apr 2021 13:38:56 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRxX9-009hwp-CM; Thu, 01 Apr 2021 13:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617284331; x=1648820331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=gbEeqE7IXQyE7B6U35h1b4WO2Dbcqssp+dN8BlXbt90=;
 b=Xi2DJTiS9sQq4w7ZR0O6EEGPuzCpAP2SrQtsFkZUH7kB2nxivsK6rVXp
 famAE5cURSQP2OehnQz6zu3mu55sYGF1ldOW4XV3ztYVDsDttIGWnpK92
 Pg3XEyNbwllxmZESF1SKHV0680+pBisKvdhaTWMgMlrJTsyh62y7N+WCY
 EHtRiTQ0XxDOxnhEKQcW8Huuh1VnbGT8/qaykT7vLMvdizixgRSgHTU1y
 Q2BSNFZzaWFfV7B+YRi+Qh3o8/WujVTNCp6zNtpJjCOrUkActqlf/UgQl
 KD6EQL5kb9boHExYuudoVS5Wy+9CVXiOIXQD0pPCMUfwYVSJM/xANpzLx g==;
IronPort-SDR: 4ibcV9UsbHANbCSw+cYEgCWkCKYQqvSeGKzpL82XLNgLfOthJNNLLK+1+V0CfgCXBsy+yAV229
 Qwsan+pcE/EPZARHgZ00q+CPOBOz9I5ywhv4UVnxKJLIuWzruIo4DC+Kk5eivoB32+a36MrDBN
 8fb010R1J2uWz117OgDEv6B5G0G+k/47XAnRox6aciTrHZ9dufEDvVhSych7lfJ3WQl6+6fdUi
 Y0xFkgsAbUf9jipCIZ3oK8MqpxGzEu9VNhZ+IN743hynmZFlZTpcNWfvIkiUHjBaGEmBJjGKa1
 GjQ=
X-IronPort-AV: E=Sophos;i="5.81,296,1610380800"; d="scan'208";a="168041654"
Received: from mail-bl2nam02lp2057.outbound.protection.outlook.com (HELO
 NAM02-BL2-obe.outbound.protection.outlook.com) ([104.47.38.57])
 by ob1.hgst.iphmx.com with ESMTP; 01 Apr 2021 21:38:47 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=abkSO64Jd39p+KhLAqtmpQ4KUTV2R/+SRFvPO3ZlNjBcy0ishRr1pNGgUwdWpC7I40mId7M2SQB2YBw6Rq6ChnUuPtOoM5m2hFKP3ZnvEW8RD4edzDIi00XrtY0LnbNPQgbAnR0FP5+aYAdg4p2Yi/rcywU5gJ8tUi0HzNlvdde/1r5YvNXAkBPG6Nu7wOH7zZYyGMBDpBmWZd7V08B/YDC7AqQzyxEXCx5cNNhlJ/JkgCHzDD6yXYpR3zSMHqsXH1TFkh2tA0h/yqvuq14fEGgKRj2H+LaLUaRC2T1j9cEV097WixC+d/nW+sgluzz4YsnUXmU2fe6DakkYCSpHGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhQDwjlwYZ5VAZoTo5Owq8GdgfKLCyrOlCUxobZ8rAQ=;
 b=I+p5e6aa4+An4rSiMODIcEYlp5UUkCCZ4Dld2yCLrZvIIcY9+5UEH2u9LBDgsc3RbE3XJxHCnEyxD6kTyCxhbBLahx8Xhu3P//r4qNDt/UeimLQgI6MsF2wxSpYCXjC6Sv2BRiyS4vrxO4v5kqkE+WtlGIYyHEizncC42HBLXrlRZZpFf3mgu9L5y+iCNfmo09SmsuboOpA2WOIsaaD4R/odugjFkt/GyHUbeWsqJsh/Lv22xJHt0ozmx2jPl1NRhSE9x73r1D//x01vcnehQDMxibvgmchbQQdQmy00Qf/4rwxqGjTYT/rMyvQA/0ooJ6Inygfd7rYNaAsRdFJ1eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhQDwjlwYZ5VAZoTo5Owq8GdgfKLCyrOlCUxobZ8rAQ=;
 b=Hd9LRx3HWnBKkQMsZyKfFKCi2yhrL8hXmD0dx93Wis1RlAJyWyRMqgR2NMNp2Ctiglhr1icFRr4TLy4bPkPRXmG1jhRd3jZ30Wt8Ts8ZHYrmZY+6lvym4DDjKrV/gGRkZARzaNwrQr6EkiIvzjlNCVx/uLetgEOQdVj7N4Dp1JM=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM5PR0401MB3624.namprd04.prod.outlook.com (2603:10b6:4:78::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Thu, 1 Apr
 2021 13:38:44 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::38c0:cc46:192b:1868%7]) with mapi id 15.20.3977.033; Thu, 1 Apr 2021
 13:38:44 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Alexander Graf <graf@amazon.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>
Subject: [PATCH v17 14/17] RISC-V: KVM: Implement ONE REG interface for FP
 registers
Date: Thu,  1 Apr 2021 19:04:32 +0530
Message-Id: <20210401133435.383959-15-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401133435.383959-1-anup.patel@wdc.com>
References: <20210401133435.383959-1-anup.patel@wdc.com>
X-Originating-IP: [122.179.112.210]
X-ClientProxiedBy: MA1PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::20) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.179.112.210) by
 MA1PR01CA0104.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:1::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28 via Frontend Transport; Thu, 1 Apr 2021 13:38:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 199fb893-0644-4802-6ff9-08d8f5137813
X-MS-TrafficTypeDiagnostic: DM5PR0401MB3624:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR0401MB362475B3573338E4486E11148D7B9@DM5PR0401MB3624.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3mqNLfNN+vD8Rk1CsVhc8RtngW4covEVFGjQZ1xyQUrG0IlMhUK7aLUhoxWR35I/unoEsE6npuTLp/roT/KpY6oxmDTqwcJrG4hRJ0VGzrwophWN0Os3CViZxhCPimyR40nwHGExNpeFq8406Lszcm9vCyyS1gmrqAtY360ayJbu0u00qp51EftZTbs1/eQP9ASPVXXmImWfoIG8/mb+YhSwpkusIP4CuviOgtLem76zqKz8nS1cmcok1NGb0iCOQOgv6m1pxS/cMghDtTGuamt3eXF25jbw3x0fx/YpaatUbQiRInSZakJv9co+C+bWHejkGJ6gMOBLVs2BZsl+H7kyGI9Hi+3FQeBpFHLJKhrBeVbCHIVGirHZfseAolNF6BNlpz+p/lfr4Bx/rdhPDqsVDFjaHrk333qeT0AEbJMA2SgfYFu9RT4lnf0uRbZNS5qvACptVpExLc0BxsgZmwYlJ4jy2OAtbD/xNrp+agA1d0c1i9DQX+bfOY50S36EnBVrZ6WcnCIDjhx1wUoFHB1oMZRcpFsdFuyUpyJEeUvTGmWPGhd/DWtm5X9cwwm91+yf5DeSZvR9UUK4VxObcw4azDKUzDucS3L+DAEn+t01jiuxSzejOpUe4kXjnJiGlL83SNjiUuxQ9g5IMZNGyEudpaI7TQspdQmLPcfrtFY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(5660300002)(55016002)(956004)(2616005)(7696005)(8886007)(38100700001)(86362001)(26005)(44832011)(4326008)(7416002)(8676002)(66476007)(66946007)(478600001)(36756003)(1076003)(316002)(54906003)(110136005)(186003)(16526019)(8936002)(6666004)(52116002)(66556008)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Wdl/jfBr8VrdPdkJGbu2pSqx2XQx/ubMtW+zl7cHiQkK3UjEP+SBV+pm+7dC?=
 =?us-ascii?Q?smWD2scMTVWq23iuQEINPRM09tuHj3Lb+/rQMU9uv6MRsDHzNGK+hbKu8tKO?=
 =?us-ascii?Q?FzjGzgUjRqt0DAsfXfLifyfTKCxv0Ii6PAOrUj+f2/N9C0SnhN6+1uTelObT?=
 =?us-ascii?Q?Ct5FUfLY8700OBoLEeN2ajjgX3s9DFoSv0h+nLT4XhysPCb9PFFYziDdc38d?=
 =?us-ascii?Q?B9HJKyUiBK7wa3hszofHwGXZPq9oAzhSp+1aUo57C+R3HEqp7u9gD6H+qPxW?=
 =?us-ascii?Q?+i3eetFcuiJiRN9Bi+08tnA3FhE/R10NaVwwW2P9UmLdHPvrBOVWSDKnPr5Y?=
 =?us-ascii?Q?/zRHWSFuuzF7vkzVWObSX93G5gp3d/0mAZJKCL4YeiQpHQ3cALyUpcbEv+qd?=
 =?us-ascii?Q?VijD454H+SeTqtH+UcNAG2oeqXP+bsgwp6e5P5f8Cq8KIvA1Z4uaxvLVkUA5?=
 =?us-ascii?Q?fnZH7V6puN7KMENABTxcH6WZRAXnU8LIKufooe74M40AnE5wfYvJhj+bLkb6?=
 =?us-ascii?Q?nBAylrwwqUnQsnwwBaQml/TO8DXIEDgj41E/q9ljwnwbHl5G937vrRCioDJ9?=
 =?us-ascii?Q?VlCzH04xjvOST+7iUF5kQQUzL6idLPssdzJqUm1b95BM8PESAoydirt6rQR6?=
 =?us-ascii?Q?8NTm6BAB/DWJjp8/Py/hwfWB+d4hV3D9zY8fZiivbfaz4TYtb9TUdpyWUoXC?=
 =?us-ascii?Q?6foMFlxAkeftBiUc1Ur8lV3Hf0FCHV7UEORWIZ+UXwNEQhF4sMgrozOdfuY8?=
 =?us-ascii?Q?pdWR2G3ErtW1xqa2EALwU3G2aMVhfHyw1FEAvN0XGI5dTUojAS9URvJNLKYD?=
 =?us-ascii?Q?P19138Fc61Ek2bORdwM96dzlT/StQnX2mbpkIibLIjzpDkUl9sj/Pg1RLZed?=
 =?us-ascii?Q?CREpWMcWOXqUdY6sMKK+x5R9BPZeDkYblcHNTD01GNBPirtDABGI1U4Ine2m?=
 =?us-ascii?Q?dwIIJt7wPlheKu7ICxhfrEj2U5Rdb42ZU6FY95rTLRAEAwYusOHBTay2Chev?=
 =?us-ascii?Q?fyESeOuhrs/tQFbah2Tx9AWte6+Gca94qP8a/DgfF5FTvepHpPAMhanY08XA?=
 =?us-ascii?Q?6JbZBxatcqDwLXbDacYFEEWWbShlcpvAUToiFeNQsZs5m/9RefKA3VgNKBox?=
 =?us-ascii?Q?rVuObysW/KHdoVsrCMgIjwV7IGXe8jg9hvfsXRrSTFCn2QJm6WtKjkoGiQ06?=
 =?us-ascii?Q?yQV6qCqsG46LEjQ/YCNCyHYnuzDUpTCFgOhBEXU/RW/+rS6AUbRpLiilAEuo?=
 =?us-ascii?Q?6Kkx/XrvfJoPDdjIw4KoyJ4UbqqKjZYi9GqFc6r0tUCyaRSfVSK6BTywr/rD?=
 =?us-ascii?Q?xP3TCHuL2RAE7UBbF/7gMDkzkoxw3y9Kjwp3gmH9eT2FuQ=3D=3D?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 199fb893-0644-4802-6ff9-08d8f5137813
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 13:38:44.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24VFPN3K+6WPHC0/bh1ObTxKnQxPWNN+RNPHGueK8T5VkPCcDUjsnWopA4IfKRA2b2kBMJE5tSnJ7zkROUaW9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3624
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_143851_837503_0F28546E 
X-CRM114-Status: GOOD (  15.53  )
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

From: Atish Patra <atish.patra@wdc.com>

Add a KVM_GET_ONE_REG/KVM_SET_ONE_REG ioctl interface for floating
point registers such as F0-F31 and FCSR. This support is added for
both 'F' and 'D' extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  10 +++
 arch/riscv/kvm/vcpu.c             | 104 ++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 08691dd27bcf..f808ad1ce500 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -113,6 +113,16 @@ struct kvm_riscv_timer {
 #define KVM_REG_RISCV_TIMER_REG(name)	\
 		(offsetof(struct kvm_riscv_timer, name) / sizeof(__u64))
 
+/* F extension registers are mapped as type 5 */
+#define KVM_REG_RISCV_FP_F		(0x05 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_F_REG(name)	\
+		(offsetof(struct __riscv_f_ext_state, name) / sizeof(__u32))
+
+/* D extension registers are mapped as type 6 */
+#define KVM_REG_RISCV_FP_D		(0x06 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_FP_D_REG(name)	\
+		(offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 581fa55f7232..a797f247db64 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -416,6 +416,98 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+static int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
+				     const struct kvm_one_reg *reg,
+				     unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_to_user(uaddr, reg_val, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
+				     const struct kvm_one_reg *reg,
+				     unsigned long rtype)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+
+	if ((rtype == KVM_REG_RISCV_FP_F) &&
+	    riscv_isa_extension_available(&isa, f)) {
+		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+			return -EINVAL;
+		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
+			reg_val = &cntx->fp.f.fcsr;
+		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			reg_val = &cntx->fp.f.f[reg_num];
+		else
+			return -EINVAL;
+	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
+		   riscv_isa_extension_available(&isa, d)) {
+		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.fcsr;
+		} else if ((KVM_REG_RISCV_FP_D_REG(f[0]) <= reg_num) &&
+			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
+			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
+				return -EINVAL;
+			reg_val = &cntx->fp.d.f[reg_num];
+		} else
+			return -EINVAL;
+	} else
+		return -EINVAL;
+
+	if (copy_from_user(reg_val, uaddr, KVM_REG_SIZE(reg->id)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
@@ -427,6 +519,12 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
 		return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_F);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_D);
 
 	return -EINVAL;
 }
@@ -442,6 +540,12 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
 		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_F);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
+						 KVM_REG_RISCV_FP_D);
 
 	return -EINVAL;
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
