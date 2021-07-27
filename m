Return-Path: <SRS0=wQCt=MT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89545C4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:28:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FB3B6113B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jul 2021 07:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FB3B6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km18k9xCI3IJvAx9E+aKSPFIPGxsmzBOUugmbkcGWlM=; b=u5GPWEpYKuEYXX
	w9IkuoWEjWcpVipK+Ux+IcEWNMR2eR7GlJsVOhgmQUaP9oDGFeaqW0/YsjCb59swfz7C/aTqPxHRs
	kMSPUJ/jim8RoATF4vk94nBpQ2MhOXnFEKV1CvJGQpqtIZeLZ9trPq/1rYhe9ZVE0dpqOuKVb9yed
	23Ha7BdzmjK2K/3N8mrtpyXkEtHdZYE6J0kK4IjzTgSAGRBssIhG90qJkZ8p3a57zp+tnAf5sKxpq
	sxafaBGU65ar/b+xwXtCJEGenszkZX9v44xmGwwJCcJAOhN72vCbAAlGOmM2hVuIec+wk6vOqsp+k
	MMn+6WgrppCRfjduHAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8HVh-00DpjH-TO; Tue, 27 Jul 2021 07:28:18 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8G4v-00DV7M-TS; Tue, 27 Jul 2021 05:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1627365393; x=1658901393;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=l6NKFEbm0GGOPlUNbm+D3308tGtJVrqSkNSCQClWtfw=;
 b=SficXeqfWNpmuuECGComZPBamilPLAz5koxZOsT2ks9a2tyq5xf9IuC8
 1i9y6G13BK0MuhKjf+/DbpCBuX87ypxwMOdUiLbKJXOFrXc8fJK0JDUE1
 HxpQI+x5k24f9ZhS5uKri3vTkmOoiL9WbPBiX4NFd1DV4ZnS5TciOjM//
 LwIvc4UjOFokizrvWM8FF6n8JTLnBL2xnzPpNZHZfDi/oOvb2ohpCcpbs
 JExZV3GiASGaUtWwsOnuWX+FnJiH3INRZO1BZ6NE8FjlzQYOUITOZHk5A
 h8XXNicA8e6rA6YDak2Umb0owSKufn2TFGWF31gD7qEMwLqA/e8jglJyZ A==;
X-IronPort-AV: E=Sophos;i="5.84,272,1620662400"; d="scan'208";a="279400165"
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jul 2021 13:56:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ki3OhycZIasZ07ZpWg6NXD7nzR6NyyJQCvcU7K2T0yqATWXie/6NyA+5YeMpPcShKzNRZNezBONbYR5IDj7xSyodV5HvQ9oA3/emRKQTpem++SsmnlIANH2xgSSc94+KuTJaGDNCm92QNn2XPB0yokJDAzfPNs0F/isd62R5d+BPlFzGVRTZfFyWqfYm5z1Bfkspyt74BM8e5IO33KYz4GMHp6I3UyUGskyc64WWgobEvqCaWaT+eUlfTel6KWIo0bzj7K1t7tXOM3aZ/EWG/5g3wESDeR/TFCozKt8JKbou37WwkBKZ49h1Mc7Rs2DKH+BdJglxpj8fKrD1ha3Lug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Om0xITupGRAUFtMRAon5e0Z1oKVMkXNdcYUrd/eB5UA=;
 b=Lo0rE8iKZ8U68Ub1SxUgX1xNaeWEzuvN2KH3gvqGAu2jz8hIsGUnL/7DMRcsDySPJ2+yGSMVvonOi0fxA2Cax7e/0ZiVXbV8Mqcll7xaZaybBTHf2ElhTBOF7TnwiE59KhYnPuEQQJAhE9V1zLJqd3pFFfAtib9vR7aEAwOBGm6aDnDIqRFFfWXYLuTwVDE8SSw1lHCILe0ZU8VX+PM3VLaORX72LQVqWJL44j3NYoSJLJIgXJUf2KwchgzozOW9OWMI4d0h5T2ggl+Sm93vzf0ekf+Z22kYicX1jRPEXUaemVYEk+CIULiDG7eckhRTq0lZCCdaDzOSvnnqI1PNhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Om0xITupGRAUFtMRAon5e0Z1oKVMkXNdcYUrd/eB5UA=;
 b=tuo2uvfVGo1FGvRNR/vzorNUC1m5G8gLoHOU2PwW9GCSZLuw2UQHmjoJ/pxRdBo1i1o5ztFqDUClmKUCBjZUBCC5SzPpGpvXgFgqJwkwtUT9r8rOe28A1q2cTPjcCKR7tAwrWny1hlGtN6mxr3j3CRqIZvE3tQyNWYfQSDA58E4=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7842.namprd04.prod.outlook.com (2603:10b6:5:354::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Tue, 27 Jul
 2021 05:56:31 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::a153:b7f8:c87f:89f8%8]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 05:56:31 +0000
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
Subject: [PATCH v19 17/17] RISC-V: KVM: Add MAINTAINERS entry
Date: Tue, 27 Jul 2021 11:24:50 +0530
Message-Id: <20210727055450.2742868-18-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727055450.2742868-1-anup.patel@wdc.com>
References: <20210727055450.2742868-1-anup.patel@wdc.com>
X-ClientProxiedBy: MA1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:22::16) To CO6PR04MB7812.namprd04.prod.outlook.com
 (2603:10b6:303:138::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wdc.com (122.171.179.229) by
 MA1PR0101CA0030.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:22::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26 via Frontend
 Transport; Tue, 27 Jul 2021 05:56:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b781e90-f9f5-43e2-67ef-08d950c3482c
X-MS-TrafficTypeDiagnostic: CO6PR04MB7842:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR04MB7842DFA20945894F11ABB9358DE99@CO6PR04MB7842.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y7Caj1oirNCegfWNxTpD4a2NT0qX+nOGh5WcmRUKPeDcglTUkHohRB9/oKA3dBo54yO2t1dMq0/giYW0hLSUjfY8X6/WORZnVuz6XyNIuYNrB8MVQN74qUotzf6wCT2ZJKhGMwcVW7YrwR9esK5mbi3VygcYWegQqPpVlTzQgEqaUdjTWX2DLe9YR2UR7grHIbNSF+/dNbuwC/F4mcxdhqUr0ryowkEmEZBrsZkVmrPAqPenl3RwIW4nBMBrDzyriKlWr2oqdjGoNX+NmsLlYvHnFVZEV4IbpfsNdMYfWaXR95+/8PjkTrXNteHgoSqPrAM7LYkL5jm4GhXRdwBGjot4JcCX7opmFNs5+3WB5pg+CQullCimdHLondzDMjEAu564Wewnir5sX5ZFDHuBZJlG/Zm3upxo64i98XOdFSax0w/e58vyHMCuxRmQzbv0a3bLDT1Z4EGKiY6aOOi5mKo7ANP2gXjRbWJ0wIsSR+/2ihAa9bG8HkAPMPJV1b60H96KVp3sYm2UUN2aFp6acwGR+DE7hM66UdNKmehgZ6xpXiAV2oUS1YKkONuwQf4XZMfNcWEs/+FORH54ALU8rMJSYvR/1aMwoKtZ2q3zW9akBXOFkdURDBu009H0NFvE/ucV9b6Y52Z881pzanBLUIW6rBPihvsToEMTbTnFY6JUI/so0QqB0nNmzRvBxQDmZHS2LcPSPf85T91RcNj/Vw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(44832011)(956004)(2616005)(8676002)(316002)(26005)(54906003)(110136005)(38100700002)(5660300002)(478600001)(66476007)(66946007)(66556008)(8936002)(55016002)(7416002)(8886007)(2906002)(1076003)(86362001)(6666004)(38350700002)(36756003)(52116002)(7696005)(186003)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mR0ropT9eSgRl9IZSD8dz+RAbyfHuRXPlVYlibCzEzlyE0uKFOQZZEi+W59n?=
 =?us-ascii?Q?3oWP1e3m3EjHhI/caodO47Lf+Msty+ZNWzYt/0yWByPdB/uyBIIniuXeJ/6j?=
 =?us-ascii?Q?ejGxsTiz4fY8lHURtvMIcAEK8BrIj1cpKD0WaSwrCJB+VhRI+wWgenss3FjX?=
 =?us-ascii?Q?JGqPFIPJEk3Ok2lBrUxrQwapZp6JU026HzpB1cYzhuxHNLwj0rbKujgEYpQd?=
 =?us-ascii?Q?eYrLf8+ImaofTE13rZgQinXdps93NdlgMdPKCI3WQkKpxk315uGAltxj7rOA?=
 =?us-ascii?Q?mFiRTFpRWidfcUdE24WLHvtkYrwZbg69WjlWms0AkWD0vBlyDh2BPgq4CkND?=
 =?us-ascii?Q?KBi6JivAsiKwQEt1kkYY5m9TF7zW6fsKfLDnu6k5nT+85HN8DRYc6guTvO2k?=
 =?us-ascii?Q?QcB4Y2NJWvZ7OtdNsA20PeWY0vzDuTbLuzhgNCyCHOIKS2QT97c17GaFPKg+?=
 =?us-ascii?Q?1us6/puDZDR1a9ErJ/o0a2hdzA/TZAaaoZI32o5sesfOS5FLHBb4BYw7r3Ol?=
 =?us-ascii?Q?/htqd9sFevu795qSBaxys3dFrGcK0Pul38l0icjluMuPZYyeri9lhyua1tKq?=
 =?us-ascii?Q?FXhwFI/FA4UUOZrqqqzxlO2p8nCkmjcKek1q0rSgN7XE53eVm0ixvlM+xkY/?=
 =?us-ascii?Q?R5QHIQqzd+yOJQCaB3Y0aX7tExl6BHsX5ujGU6z2WMhNY43aCgpt2C2t2L1A?=
 =?us-ascii?Q?Q21HLxUzuXru7K1U+ilmxC7U187C1sb7vWskDF08t8kY4t/h1IjRw4iIifj6?=
 =?us-ascii?Q?FMjObvFAhw/yKI1hk+T/Cb7kpGelYPkBcW6Sgh1uR+0WNdipnqAG6T8Y0w35?=
 =?us-ascii?Q?HgWOvY6rrNDiYhM1zwLx4F1upF5eQnYwoQJkjrXIfbi0uJ3sN9wOij1IJS/b?=
 =?us-ascii?Q?ETzMC9eWUmDWulKFjRxbnpOwM8zfLAbiNc3xMUjjtWygWulArP3b6M+8TojH?=
 =?us-ascii?Q?yVhWUR4VW2hH+Iq+BwwEAKdprG5Rks5IB2waBGcNXdiPnFst8hhpdVYj274E?=
 =?us-ascii?Q?0spOHvVLFUHjlOah/z9CqqlyXICqoVstw+wLfRMyr2MiCxEQEWrF7Nig3Al1?=
 =?us-ascii?Q?6Di84JltNacjNyy3+PnMnLPzRf63cPr+iuSSOWCH2AFzpbAAqbMUdj5h0C+t?=
 =?us-ascii?Q?DHUC5sbs4ULFgk6tAWYXGRGpgAHnfhqCXWdJhnX7fPtxF8QY6LRaeIvFT7+P?=
 =?us-ascii?Q?C/c64ghhGyqMWnMb0Y//TokA/0rf3cfj6OLTrrYeVYHjE4V7w3AZo1HQkG88?=
 =?us-ascii?Q?Lcx4JBt+FzT4WencOo5XMFnjjx54qL6uJML3U00JwJF2L323z6OHwZRsNss8?=
 =?us-ascii?Q?58dik8SexKSesyfXOO/PO1p6?=
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b781e90-f9f5-43e2-67ef-08d950c3482c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 05:56:31.3024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKoTdLBw0rJPjliWgMHqbnpHFloEc3TYY/u1B+Dkqt3FF5+UUa2OWbtCz19OMbNbkwzPU6DQWPypwUR4YFDScg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7842
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_225634_083569_6B4C4B20 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Add myself as maintainer for KVM RISC-V and Atish as designated reviewer.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Anup Patel <anup.patel@wdc.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alexander Graf <graf@amazon.com>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 19135a9d778e..f972685b9dcc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10176,6 +10176,18 @@ F:	arch/powerpc/include/uapi/asm/kvm*
 F:	arch/powerpc/kernel/kvm*
 F:	arch/powerpc/kvm/
 
+KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
+M:	Anup Patel <anup.patel@wdc.com>
+R:	Atish Patra <atish.patra@wdc.com>
+L:	kvm@vger.kernel.org
+L:	kvm-riscv@lists.infradead.org
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://github.com/kvm-riscv/linux.git
+F:	arch/riscv/include/asm/kvm*
+F:	arch/riscv/include/uapi/asm/kvm*
+F:	arch/riscv/kvm/
+
 KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
 M:	Christian Borntraeger <borntraeger@de.ibm.com>
 M:	Janosch Frank <frankja@linux.ibm.com>
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
