Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A01AC48260
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 02:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIwv04omjJgE0qgMhBp7KmpFw2WPAZc07joX7C/lMHE=; b=YGFhAO+V/V3BFt
	dld0A4i+gYQ7BXkLpLZo21qMV/RY8Uz1erk/5KiNdNs8ZBPxf+ZJOoCfK2O/Aof9RpVwBU/DX58rF
	7TpfyZDEt1GMCdLSMLdVoXvs2gxxArr5Ymo17egfQwBr162Ay1NjoQLY7WDHVMB2BRcyp6pyhtnLt
	QZ6+YGRdAmL5Mrq1IpxSpW76tv4QOM0bAoJKxjngykiS1jWYi4grU8ulnMuNdqsCZa6D3z5bZaTsI
	EXBpiWmSUAQidbAzzS3Ql9PYtz4Q2F6JtOilAGLJKBcgT51mPKNEFhnER+7m8kB6g3/c1B0ZMAi1g
	d2L05cMJpMzg+kgW+C+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5He-0000000BXn1-0IhA;
	Wed, 14 Feb 2024 02:46:02 +0000
Received: from mail-bn8nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c18::800] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5Hb-0000000BXlO-0fWZ
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 02:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ESn6CGUx8OIOFocFyf5NBfqpv1GsdivDLNS82LeqwkPjyeZxuUwSU8XG6dpPPoGMtPbooUps1SLSC0pHQ9ytfohm9KJYvggT4VEc+/RRerncbwHBH8oXxIYj8D0OYeU5HuKq5dVhJnw23t7IRxGCR9sWq2U0qOXTJKJkjg1h/f2PFgW8t+YiFEBaWqWOSa4F7+E0KIAWGd20q2gbjIw7PcT/tai+CP7sBmA5toyVHbpeYzJqJqh0vr5awxKCmSpZrinoohBlzXvgDh34bnAC7/x6WSYuqfDi571ZYSRnOpVQ0ZZhWbf933vmMLJo1iA8M+KbxOCfxGHVBlHU0RVLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94k3JfKWEls+7907kp1nt5YO2OSY2Jh6iUZUYZw86ug=;
 b=hJJYHTEZ8HQb6bB7xZR0ABTuhCELu1DiP30m2O09+00i3i4bhLXusBh5JoxZmTFSCif1BJkF29R9xHWj1qZM8NlPS8sHwxI0f96ejPR4oYKp+nhQEzJN+DxWPQ5YKp9CGg2g5IJv2siPxb3OE5MVTVk41c7LNwnXQ8MMxWz3ZPg/sXZWLiv90wizPSaIUc/N5NkeFMK/PkMvZp0B1sPFJKJBGd4bHSQzIz04341aX/cv+dfx99rLqSTnzsGWgCOZCtJoGoMyTGe3v3ivkBenM5pq9mgrtg21wJp17E+o2UaQmig/Rkrwl964UwKxCjHL5nnKvxaHmwFtqTNm16C8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94k3JfKWEls+7907kp1nt5YO2OSY2Jh6iUZUYZw86ug=;
 b=XXk/v/g83oUdQM0eBx6Ufv1JbrIzwmLdChAgP3YeUZXVZjATi50nnHPDMzh/2+PQ5Izf9+XcqTNlPUes4kJ8MeDWp6n3DzAP27BkB/UGlZQUBBMhkwy6rf3cOwD3Ta/EYO5f6nN6Y0ryW2A62lD6TylT2a6S56Q/ww+dHPgVC9+dyyjfQf4cZEWGnI2vcEe/s0rzPfNQWUh4f91NrjEQNeicwp2Yu+DymFWgeITt6dPKefUaCPjr2EnQDgvOwczPi3/qwIGaenfJT3GJ+z87Wjh3ew+LvAof9aFiwKAa7rh+lPEqB1bBXZ9KOZkCeJYuCb8g9oX0UmPBsrPSFm0vDQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH0PR20MB3788.namprd20.prod.outlook.com (2603:10b6:610:dc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 02:45:54 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::406a:664b:b8bc:1e6b%2]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 02:45:54 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/2] riscv: dts: sophgo: cv18xx: add top misc system controller
Date: Wed, 14 Feb 2024 10:45:50 +0800
Message-ID: <IA1PR20MB49537FD67EC96F611360D3FEBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <IA1PR20MB4953C0B48F84A3F3A500253CBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953C0B48F84A3F3A500253CBB4E2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-TMN: [DblxDWTvrU+sBLIxCjTPQhDfMPe4pwVMsxFfDfoysKjJ7M4FXcNI4lK42MhMVyiY]
X-ClientProxiedBy: SI2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:194::15) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240214024551.292853-2-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH0PR20MB3788:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2fc80b-6c43-425d-4adb-08dc2d07101a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GI8haswNMnIhU+Ux2mr8UbA37vczA/b1GaZCQ1Vi07zIny3t3U0vpc+Q5YbHtv+pyEQcDODgT0IP3IJAtJTNp7jeMNo04B+B/STDlYmPUfaanLX+DzV5Lu9dTFT0fUzABoltofM2XRRFzxK3gqgsvipG5zqV4wej8YxYhTkHzZX2A/6/P/TvH6oDnUf8WLwjjTRg8M79lLqfxREhdYb/ogIgp7WSKiYcN0YwZ3GiyWbNih34cnDbo8RGPIk4jztBgi32JcsqVImSLL7plO7G+Waaa5F0BFed0v2VAcm/abvi/NjMMJ2fma5GBY4MJTGrT9FDCLW7Uwm7r9efEUq8Q6xXH084Z2BpBa6hwzHn0Z70VSmarkviD7tpq7rIsyZdUaZL5HZvPizyg0Sf4BqJkl+W0+51sg8hCQ1Jk6Jp6muuOaA9qmrHzIP514z55oF9QRwlLpPmkWLIixSnGFwdwAN471GmMelcldnj9mltnKjn3KxMQuXHfEItHR6mUo+C/pB1wd4k6ZwaoU7AeLjzaLvXFj9o8Fqv7rjW0x9USzYpJASyZUfa8UvLSIuNXZGR9ALHBw5MfYqGENaApzmJJ4HGIrGU67KxuPwsQiihFbU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1Nx98l+NmUfbNlK4pqj/EHBqmYFAdIhF57DS9s/rr8tLTyf/JCSEVVKGxFP?=
 =?us-ascii?Q?9tl/Dgkr8iJgJ10G3LWCxtMUQjg9qaEJxd6t4z/SI1TBXQHce5IRhJ4Ge9SW?=
 =?us-ascii?Q?BRSAOSwFbE0At5MgYGuJ/gwCBszz/K865h02rBLPAyx2vn8ISJI9JGXDu11b?=
 =?us-ascii?Q?tFfqmbFN/MgnO1dLuEQV88xsz0VWGvQJAlfJo1l9ZapicZ0xH06b8ZdK8wjd?=
 =?us-ascii?Q?CMYWpjmZqKOQNhCOo98LpW36b3EuuiBBL6oAqjZkqWdreX6U/QjEPrpreo3G?=
 =?us-ascii?Q?8TMo4cv995qAMi8Gcr1mYzgLoGOt1bC8m26hesKxbGLqwLCZyTP/ZxNrH52A?=
 =?us-ascii?Q?2dXFJAQHPMA4R2rcaqSg4UDikh8J896LOUZB/Xb8hIzn7zlMBCoCjxSSNzN3?=
 =?us-ascii?Q?meY4Gjc+xpFwFnetK74g8Dc0btB7VGfVWCgJWbHgOfMsr+37u1HUHYs99Ij+?=
 =?us-ascii?Q?cQXE560wJmo0VEzq9ULLoohZyPDnxd1bgHpbTwH0CVVG6q8dWaEH8J5RR1R3?=
 =?us-ascii?Q?mFXAKEDQjMsau6+JNx9N1O7dGg75cZt4zsaNQIbiETKL2bXKzTe76tbern12?=
 =?us-ascii?Q?dAq1/bTdSpcCfgRlhlo+cdnU6/+UxtMspREqWR+eQiSUg7PR3NguQ0YnCtnj?=
 =?us-ascii?Q?TMSi4QL5WwlG9BWGvnDswXFKAZ4Vjgyu7+el78lIMrN2VhI/b6dljbKxmwbq?=
 =?us-ascii?Q?+qw+F/h+dLxxQpi6MvkASZuDZJq/LANUPfvkg/EvUJZT3PBO0EWpFuKlf5Pz?=
 =?us-ascii?Q?F613FeRXIAY+nPu+i/qK6sW7hPMCGOEOQZqeTkj3zSnHHfqKGxiIk5FTTp0N?=
 =?us-ascii?Q?5n4MKhDcMROWTBwUEKdWDH9fiMJB4CdBlhcTQ3+e8B+R4hqPSgnVLdGxzXYX?=
 =?us-ascii?Q?9Qy3wR/XNAU5rOJXk5RDZ5l9ocVfIWvLqlTpxaxIjODUVVCbqZzjrzkNM5/l?=
 =?us-ascii?Q?klDG3tBdQGHYAP6JO/q8wz+1Sq6cblwmMbIPqPywG/HtAhnsNTx1AOFP0FFq?=
 =?us-ascii?Q?7XQgtGkI3YH2aCPTAxkft3lx1twXQOM57irft32V0Fl4j01lc0pQ8bqqmevY?=
 =?us-ascii?Q?ko/QRr4TIdJqLR8b3wS+rGI+Bc0srdVPVMkReGN2dd8zfixCmEjBZMQ78M8O?=
 =?us-ascii?Q?Z0hfJa/Jo2GauWIwAoyESwFDcVm6qPtZC2x1pEQ+PPF4slt/FX09kasnNKln?=
 =?us-ascii?Q?wKxIa0fQADcjjVulCySJhZYUb8iy0UNQIbukc+GCgSy3fKKrKIRs6qUsqgya?=
 =?us-ascii?Q?yaZH+Dt1IqunzW1SzWvx55kbV2x1YRIYBBFR2gxz529DdSHr420I57y6wbOH?=
 =?us-ascii?Q?7YE=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2fc80b-6c43-425d-4adb-08dc2d07101a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 02:45:54.3204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR20MB3788
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_184559_221318_15FF7A60 
X-CRM114-Status: UNSURE (   6.90  )
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

Add top misc system controller dt node for CV18XX/SG200x.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index 2d6f4a4b1e58..908d858a63ab 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -53,6 +53,12 @@ soc {
 		dma-noncoherent;
 		ranges;

+		topctrl: syscon@3000000 {
+			compatible = "sophgo,cv1800-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
--
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
