Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA0E606A327
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gOJAt0OY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8h/jj0o/sB2tYEcceruRc3F2uUK3yw+27owY/Nm1vNg=; b=gOJAt0OY7JKowtf3SudsbBQ/8F
	5PP+YkexLmeSHj2d66/gyqmNaU7rtf95nAhnEbbK+/qr7Qzr15NU2q4FDmBy4XPH4dwt726ACCsqF
	cMHDfFtryOuiTRkPUd4ayEjipbKxNOVOROqkoiQPYqhhrqUC9A17oxBrhHx2wbOwKG02JhT8CajdY
	gRK5PPyp65F1VPe+1R9P0KDlCo+kcmgo2Ts++PItH6oG/1YcVkYyt1KLMiRM23DLeoqojbMNGLJ2p
	Vt7T1N4TC92jNL4dl4T/KvRAGXxHEU7xvCyGAZGD6KH9hlXiPHYrtCUaHNeWDsbJ8nNCjjIkOmQe/
	vbvw8DPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS7T-000000038hT-3x1t;
	Mon, 23 Nov 2026 11:22:02 +0000
Received: from mail-sh0chn02on20722.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::722] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS73-000000038YA-0vd0
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 11:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNa2iIJ0jkibaZKAyswrtGc09E5hZzC2fowXjT2rlH9dF5VlnH5i4NNuRtRtEQBglAHUaZQBYYfI0xIamKqDFKcT8wxMIyJeOghVNSEFmfMLWch2Bsi34qWykhN9OZ0NTBlH2oot6bA2aIJMuxxN2IV7BzKDAl+JCofsxzcU45vZFadGTCFAgyrnzVnlFJopmJc10XVGbG1DO6hvE0VS+aJLv8EO6ZiyN2MRYWJw8Ou2dnV+WZsxn3u5qm/qiBYF6NW424lSq8ViN9tcINZMqeTTP4o4bPuLTFYpQGQQGskwKcE0BIroiX4P4YiriF9tHG4h8LVjccWhlihrOqPKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bw3qBcXEa+XxDROqnxrJ1ajBjkHXTqP/bt3brS+FLQ=;
 b=LblylwUQh6JBn2HRcSH7X8HgA3GuJkrkuWJFrAWjyf/PuhEu4rY1R5aZpSozIR2AY5e1LdNk729pFNlR4J4XYeUD9maQW077+oIlO4KXrPVxFHJ4wOAu8egZcU/PPP0ZlY+i9faUZpJ9kDVvhpvUQSBCgn4XbjPgipvsbZVgiLBvjvzjSnHBORx6fPHcaLlnZTH+X2QPqnnAfRkXykE14HFKDkVZxI8eSsgCjzO0jyuWts8/0qI1mldegU80/SJ3Q1V8HEPd3VJyFQJp97drGf1DiXy7rYz/7B230ICr+vxgvS9CCd0Sx6oIb4ZeAysouRn32BWX0xmSRQauTMXeFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1219.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.19; Mon, 23 Nov
 2026 11:21:05 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0615.017; Mon, 23 Nov 2026 11:21:05 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v3 1/6] clk: starfive: jh7110-sys: Fix memory leak in reset controller register
Date: Mon, 23 Nov 2026 03:20:48 -0800
Message-Id: <20261123112053.20400-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
References: <20261123112053.20400-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0008.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::13) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1219:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a0fe006-2760-438c-207e-08df4953dd65
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|52116014|38350700014|10067099003|261026140227099003|56012099006|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4s5u7EnKoQ37k9rsVKvfh5Kytd7AJQs1/MFwCU3JLd1eJ2P1RQKLlDAOPYycLcorgpZVs85LJ6ldauLy9+Qbk93sp86YyqjLFErA/iyiuo8nDeuEVbVaA7inwaKKEW1YIaWjUSRR88UQftgklz13LL0cuVPvEQu1cxED2NDLH3WnXSOOjhMzph+WNVtt1sefta7gVjAAF7YySJEHCTlJwxUcOHX4qMFnOicLQ4bXo8xIfxbOUc/orabdxGPFfHTEzY/TfZF4izOjL7LzrtNuK06INmk7iM2wkZISqMu4yQxvFXtNdT6qTo+SxCVMACCyXYMAuZpER5TS3SmK7/6I2arf0/PwZnnW21MQ+fkEr27zP9V9821QLQLyf5/FOuVcxbje/HXZOK92nns2eM5DBXsEcRinlRGtumqEfyc3a1x+rfjBEtEzI2McXdpVbDkxKf+gJY7n1xaU0LNQEmL1DKjzrle597FeHfjxv1SBUtlT6T+Y7y1B4plSSRHvSoUeUzjZ/J+uPGMaGmIp8lo+J5YxJI3VK55WAxXEesmRvXrZg6rx5u+nYS+E6cbyOZNN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(52116014)(38350700014)(10067099003)(261026140227099003)(56012099006)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bz2q62BDjd4m4Yjmp39UIOWY1R557gD5+r9V3zHQeMpCMpGPL2bkOJXsuXXU?=
 =?us-ascii?Q?i3YvA46An/YWNq+6CFFQ+vw0k+180Y5ySPrLYxu3DaoZbrdLxLLFc3xDHSMW?=
 =?us-ascii?Q?O1n8qvOE9PLw2LaxTIpscgj187B9tYMomotztun+HJJ5FfGwKQzTJ5D/N/PE?=
 =?us-ascii?Q?jM7371/JmujLFIBf2xT/psQC65xfLQS8G3ZPtIK95CyI128XWsradaf2ttJO?=
 =?us-ascii?Q?WZAwiD5B9e7jNWOwkvkFMknWr/xW0m2y8ykvJimWXtvyb5YZlFXtemzZR9Zy?=
 =?us-ascii?Q?rERVmhLYwdSvOgl30PU66Cpa5zkPMb6imYENz/N7M+z98PVc7Zc+n7oiHkJk?=
 =?us-ascii?Q?cfKL+wmGQGrozVGpJxuvyawlSQs9ldM4kMwDCqFHfMWSZ0DK1VTGqRQtCdbI?=
 =?us-ascii?Q?k+QxOtQ+oGxalKoLF2V5QaxIgxlMGle/swI+Ntj8OiGdq/CpXSiIvZZu4dWR?=
 =?us-ascii?Q?vgFl/y6B5W5SySN/Jyo6uuXjqCO8Eqy5tKVY6HOs+vnyVReo/0ll48GZ+EAo?=
 =?us-ascii?Q?ypXsw9lMylLe9Z8nTa0PKib0kmLcoCTcxN4Dsb77fSvrcsfB7akQpELGuSSd?=
 =?us-ascii?Q?SIn2ry5CFae2WCtAU4aEjCgq6PaajHXcp+78V1/eroxFk92l5waw5IF97PO/?=
 =?us-ascii?Q?zeNdBqMKbgoydK2ZDWTESpf+bAIhhELB2lDsxLm/bWMiu1U312IG6+vouu1t?=
 =?us-ascii?Q?gtrZJ6wd1gYZP38Wz5dqfcL8oORzJxm2VhXUwCs9fHq0RYnxcS8+2gR8ll25?=
 =?us-ascii?Q?5xNBiHGcV2LYE0o9VgK7bvv9RfLbKcSPYssoB/TwkiU3gMXYTN5s7mGZE67P?=
 =?us-ascii?Q?qk54xNliuwDc8ILCkm3lIO+t0KhdhmypPS+vqWNKOtA/6oiZebO+cdmIC/yt?=
 =?us-ascii?Q?4eYeSobCOVT8g3YMH3OLJzuLNeobzr4z06UH43Wt1N3oMrFdh2OG1G5tcuaF?=
 =?us-ascii?Q?t9HDT886Pss7P0Nh1EHjt2dcsrQTtVl2x9kOQcbycIyy6wa08rZEgYBnLSvR?=
 =?us-ascii?Q?MWmWTDIAbMkGZT600DY9itOdOkQnYjmujoHJWEuE9Wf5FBJxm31PIdaYbf9+?=
 =?us-ascii?Q?gT9ZVQ5aEwWePTPvFCbl872uL5u4HZj4mtVlMk7DgjIzLngwBcDeAMqDXTmW?=
 =?us-ascii?Q?TTnIua4UiOMTlsdAfwQb7mtmn0g+qykQHSdo/Zg6jqoXMUzkNdmx8nkcBtmk?=
 =?us-ascii?Q?qaS9KGCYKjDd5MlUWeSd+Tf898/HZUin93X6iQEsY4kA9G0RVHCIVhDqGd0s?=
 =?us-ascii?Q?CRYHAUIaKJsPsPikCLmxKtHFzlrNOKNpFoBJi3ddvzIz40VqmoJ1a1kWtmCE?=
 =?us-ascii?Q?s1+8sP6pOYnNXtnAP61yu9hEnVHkbiuicHE3MLRqiySeS2PowHFFHP8Ug9/t?=
 =?us-ascii?Q?f+CBZqAru55wEFrtT/oGmj+KJvDo6kblewFOIVlzx6eL7B91eVw1d/W4aGtB?=
 =?us-ascii?Q?2+iM9WQB6p9asHxH/tI5UlKXY3PfqzPKszXgOWqlUP2z3bjuJH66Ie/Dagi4?=
 =?us-ascii?Q?OhJlnO1fO4KgokAhq2LnLBymZXgLunbo7DjpqKyYNUQKfye56lblI3V37zVh?=
 =?us-ascii?Q?F7t3KjIzf8WKuxpBhsx6M90cDLXKAEaxCd9Y3yn+ECtKk6VWEf8iZ8IBPiUf?=
 =?us-ascii?Q?RnNgbhCb9UxNAIMyY7Y+LD5S9QSi5sxYRVipdx9467ue191rcAE06FP+Q034?=
 =?us-ascii?Q?RZmXDTlXBIGwE8srvx7vTF0WpCmGGHl+pwlGfQFv+9H0TcNrUDfWMXhQbK4S?=
 =?us-ascii?Q?8MiAE9caoYADH+gOVUEX3GvKneOaVlPsAvDzmQxmASnOneyt1Mqr?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0fe006-2760-438c-207e-08df4953dd65
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 11:21:05.7142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S5lPraaBHjNN1VkhiMYis04bk0n3DYm/xT98CmaT++dqUVTLoIjuN25mUmhm6JnFCS9TEtm0rpZa1MwUQ3cbmNSKRNAgtv2mtiwe2ohRWWoLTT/28aUcomXByzwo4TuG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032133_274551_772EBE1A 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

auxiliary_device_init() returns an error before device_initialize() is
called, so the release callback never runs on this path and the rdev
allocated in jh7110_reset_controller_register() is leaked.

Free rdev when auxiliary_device_init() fails.

Fixes: d1aae0663023 ("clk: starfive: Avoid casting iomem pointers")
Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Acked-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 44766b094b60..c938c62a863a 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 	adev->id = adev_id;
 
 	ret = auxiliary_device_init(adev);
-	if (ret)
+	if (ret) {
+		kfree(rdev);
 		return ret;
+	}
 
 	ret = auxiliary_device_add(adev);
 	if (ret) {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
