Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,MSGID_FROM_MTA_HEADER,RCVD_ILLEGAL_IP,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2981C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 14:17:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A75CD20866
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 14:17:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IBFl/Fin";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eWXFuXMI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BNB3oKh2";
	dkim=neutral (0-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="nSZ9X+9R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A75CD20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E5BkzZGqlA2pBGieSB37/9tOQLQOCWlp13i1C1MHxBg=; b=IBFl/Finrmcfidptbh55Dz5JC
	+FJpZDINNkomw4BmvYDd8Vm1oxws39BJIb+p0fh4I0D4IZVDNlH89/NuSNsLUP6Bf2ZgYdy4NPWHH
	5dCFDjFzJa45+AyRlKfIG2zsIgyJH20Sf9LszPCGkJeIhzAGqKBBXuUaXHnYId1h8p/w+EuXXeVQY
	69M/dt/ISsyNlzqRAwzgvAAxmI3ydwiz3o5MOhMgBzYg1XA+QMckd4eJnrb0EtfRUa8yflagX2gRH
	V1rrktnIrJigfP0AVhdyO6OsOuaMCUSmOB/OckSMcqqob3J3DzXPP/6QsdjJFnBErBcTTz1L9b0pn
	m5xeyppaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCkcn-0002JV-7l; Mon, 31 Aug 2020 14:17:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCjmJ-0001Jk-Ti; Mon, 31 Aug 2020 13:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:
 Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=KTtYrBZP4gzZbQ1QIWCsEiIDvdU9FjH5vKDKdqsXGVk=; b=eWXFuXMIPBkkWPT/XBKEkrjHri
 qw3H8IPa7exeTjDc0A5dHkKaFk29CllEM7i58Z8jxv+S5/uImqUYt8Js7SACjaQfa3h8kbNbIiAlr
 3nxDvqwe2NKI9QrzXha/ah8HYa4oLZwF+yMW23LerTnFuwZVM7dpfLPueRgIQA+yT6Ez86/fBISjr
 eZieSEMaEVS6+Z4+C3w4JuQ9PdWTVYj6QNUtwjp16fZ3nL+ekQA5+6TfZv3uXVIX/fU6j1frAUzm1
 Qh4G0VwYv5ZAtIbRnb/qfCTVFnm3odd7YPesh8Y4/GvBddFJMZ0+VWj3KB8V8H95wk5CZu+EKArIX
 TS5kaGSQ==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCiym-0004cb-RT; Mon, 31 Aug 2020 12:32:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1598877128; x=1630413128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=S4y4Vm8tut2wgHeLX6jE0JoYIjXp12q/wp9enCPTsY4=;
 b=BNB3oKh2gdZqBkwuF8gYRKmGkYcV+rJ5dfv6h5lHDJfMK/uXUGwbv7ZS
 Fs0RBW0RKcyl2lrtCHEdSDqA6N66S5IdoP+CnY4S2F6anKjd89HNXy5qh
 305sqQLIV9b/UMVzQ7wH1EgoiEIyKgHNT/k2jtLa1h/2/XV1RWOQaWyLy
 XkjT26e8Q72pIcALT2OUgZGlfD/oUDHxMFUG7H7t9XB0Q5Bq5NXu+Apd+
 eTSRXBS1I3vFiterH4v4LMe9IKRzbBnwVDhSJELSlBy+Xhqsst/cqIQUe
 DLwpylymXY4fefQ8yT3APMWKzp0feUovQA5dTn1CgZzt6otjVWRq9hneR g==;
IronPort-SDR: 3fvFAwSdJy18nOw4K5WyS8+shxvcRqcN60c0lKGXI0NIAeqXPbTz3663LYWbvX0wm3htMhhC0U
 jan9WmA+WnHgVl5G8HscCp+BkxmephQey3CUaJqGPGUr1tqtwGN0T/Hkx+okdYBYAQjsenguoY
 KMDMnL+O6tPYuSuvJEN9pKnJ1Dan99rfrccZY9EyWb+pzAZ4J0sTEo2XDbL2xNtP5YwWUGN17r
 JBLDh1inTuqdSMHa/e5XwPTK2qDB8ilK6bYf6jgg/8Klo8LtqVK6EuTQvSmbbw0NlPDEPzMl2J
 7V0=
X-IronPort-AV: E=Sophos;i="5.76,375,1592841600"; d="scan'208";a="255743429"
Received: from mail-sn1nam02lp2055.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.55])
 by ob1.hgst.iphmx.com with ESMTP; 31 Aug 2020 20:32:05 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDhxE/a+wo3OySTib9Yh91MGwwlpv58xKimFhDgAIKtoMyCgrV4TxdL+c6F7VnsrlnExRSgM1XHIgxIstztg4m/23GgUI8Ivck6SFBnI67l8+uhKwDEIC/q+lfNtrEXemdRwAInB3rIRQk29GG3eyoSTsFdGx9yVLZodCYo6vaY+Cjedbs3WkjjUEpRKHGl4j7hbU/6/giM2CyjxVSXMdET26lMPp0T+dE//Z8KvSnqKZBiXTIKYw2ViWEt19bDrdfdKd3xjjPTgvv6BWMneUOH0cOYjlcrIFY1OWojPHEYM4Wh8eh9H4YkhWvuQ7EAJcSdKiogl7Ui1QQbfsG+xdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTtYrBZP4gzZbQ1QIWCsEiIDvdU9FjH5vKDKdqsXGVk=;
 b=Ad/8wOvjUB12bRQ7lBfVoC1NVxBwt1/vhKxKVPIn0EJdN/6exIRrhqzmQfBxeKR9F/T2UY/0ZcttyBH8LN1gpOVxNG5XMqTYt6VZSNRF3HYXDBCgb6yeZ9DbuJOKbLZo7MczlEQxOBHdZjT4YmWAErXfRikLjAj5wTyJx7ILNpP1wsXQqt9xNbcubMm7ZajQcFkFOWls6VdyUUNrQpZ9+yLByJY1jPa1cCveLK7ll+bQHQ7sYVDCQw4N59ZMNRK6V2torrT9CGDc4ikS8OcxpEmyP2goqoSXH/D09BK6NMd4z889xHPkSrA/apSOolUUwzGX+T3NO/+Jh/mNN2pIhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KTtYrBZP4gzZbQ1QIWCsEiIDvdU9FjH5vKDKdqsXGVk=;
 b=nSZ9X+9R3BM06DgAiBB/TdPTMqN15pWZZdKM5MBD2YwlwVzM/orkEBN7H8mZzrqVCVyNmu5gDwqQh2WP5e/r1y3xpqkGG+YXPQlAp6zeIhTChlvPh/6qfxzbKb2ukPwIUMQGC3y7gMWrfrW2A+qNKBO740AsGJpSU+WXaVByb1w=
Authentication-Results: dabbelt.com; dkim=none (message not signed)
 header.d=none;dabbelt.com; dmarc=none action=none header.from=wdc.com;
Received: from DM6PR04MB6201.namprd04.prod.outlook.com (2603:10b6:5:127::32)
 by DM6PR04MB6092.namprd04.prod.outlook.com (2603:10b6:5:12b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 12:32:05 +0000
Received: from DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e]) by DM6PR04MB6201.namprd04.prod.outlook.com
 ([fe80::607a:44ed:1477:83e%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 12:32:05 +0000
From: Anup Patel <anup.patel@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v14 17/17] RISC-V: KVM: Add MAINTAINERS entry
Date: Mon, 31 Aug 2020 18:00:15 +0530
Message-Id: <20200831123015.336047-18-anup.patel@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831123015.336047-1-anup.patel@wdc.com>
References: <20200831123015.336047-1-anup.patel@wdc.com>
X-ClientProxiedBy: BM1PR0101CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1a::32) To DM6PR04MB6201.namprd04.prod.outlook.com
 (2603:10b6:5:127::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 BM1PR0101CA0046.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1a::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Mon, 31 Aug 2020 12:32:00 +0000
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [103.15.57.192]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 63f2b7f9-f63d-4072-c9d2-08d84da9de1b
X-MS-TrafficTypeDiagnostic: DM6PR04MB6092:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR04MB60923A765DCDAC4DD643EA008D510@DM6PR04MB6092.namprd04.prod.outlook.com>
WDCIPOUTBOUND: EOP-TRUE
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uF0dvvn57m69yLMB5wgxvLLL6oCcCgjU2iLnvTcoKMQQa/uxN2BX0RpgUZL/ONZah2JzaVV1rtdGb+dUFtTLi7d/4KZKHAVuSy3mhmwijRz8N4E81wyCGzr5gsg53sl22TGTZi428fIpMvkIXGSwbKBdfdEcAURFT35+B814NDCgY/VMa1yU5P1GC7hdgmrhauvfX6q5TCcTf/qTbMHy+DbHt5Ly9zm9lANN/FnMxJ9G8gDkyBJHBj0dQTjOiHGmy1awQrOs6HMDYGakBKp+ah9EB4l+kI/DC2uQA1l2KFmhA6/XwmFnQL6TFmLYdrjleowc/FA4f91S/rHKQZbDSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR04MB6201.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(44832011)(6666004)(52116002)(8676002)(86362001)(36756003)(478600001)(6486002)(7416002)(110136005)(8936002)(54906003)(66946007)(1076003)(66556008)(2906002)(26005)(186003)(66476007)(956004)(316002)(16576012)(4326008)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 3CdA+Vwe4hnIMtwnCQHT/DIsebF9NPU9QtzCc1L4kPfIBGy5v0lay1A2KU5kjvFaf70SsI7zVRVSdv2rkofwAr3fH3chb+Sd4f5tkpCAIV+2+ZjavjlFaapL5eVpfG2G71E+IrnhEjWnBIavOGoowZFxj8MPAQAsqhOGAkJhLRsvddGJT695hS30u2V3Aca3M0IPV3JyRjsifFFKjs3cEubvY6uTaE+yORWeuv9Ldi1jpjiqVVj5Qyk5AxFwoLX/LazjvEIaEZiy7PQVFjyV82KT3jZhakORZI0xY10QnqddV3GPunGs0VfVq1qqlN2M2RLZxNdyfbKuOJBGYak99zNCGhxvXiwgyc9Cttw9OC1AVi5djX4auqp2vEIdO8URsO2NuY5suCJ+hE9L/pn3YWVa5G14Sv1SqZcx49jc9J7RbmR5jO6wVD1MQPWH7sQl+B1z64FqZS3zalrZm6OhuxFFZC8ugqnHguTL7mQjTA338CwEyGbDTrjVv9Y3BFVqe2IOdOrR4K1tRmbikAqQXBqLE8XN+wZJ4P45KjOcTcVLnzoc4B97gkWCr9Vbpvg17KtFDp7xAY2psjLqakS1JkRbAh9agA9wXcSKM0FGDlsvLCKUD4WHnw1StR6J+z17gYaArlRc46LdDYZpAtxEGw==
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f2b7f9-f63d-4072-c9d2-08d84da9de1b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR04MB6201.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 12:32:04.9426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fiRno5ICaalwDzpVodDZxIU0Ms/Fd9cndjLxJQQUUVBzsWM/Dl7Q60FCMQfaZeUVbrlL+rLw2ecIHroFJH769w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_133209_287106_97AFA52B 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, kvm@vger.kernel.org,
 Anup Patel <anup@brainfault.org>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, kvm-riscv@lists.infradead.org,
 Alexander Graf <graf@amazon.com>, linux-riscv@lists.infradead.org
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
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e4647c84c987..abecd5bf990e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9564,6 +9564,17 @@ F:	arch/powerpc/include/uapi/asm/kvm*
 F:	arch/powerpc/kernel/kvm*
 F:	arch/powerpc/kvm/
 
+KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
+M:	Anup Patel <anup.patel@wdc.com>
+R:	Atish Patra <atish.patra@wdc.com>
+L:	kvm@vger.kernel.org
+L:	kvm-riscv@lists.infradead.org
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
