Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57A5CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SazfcE1NW7i2A4wYto0iSNZAnLINSZ9gdMKJ+Pb7FI4=; b=obOgEMx5z/eklC
	sGj18mHcIQpu8bC0iY8Gcj0v/9cslRfIe3AKFq5tcoRd/IXvwybFCQRjdQOwvur4E8L5GONWDQSVo
	Id2EUXyfJp5pZfCW5x4ss7Rqlnn4wryprUJmuvRNIKzMzRIzZV0AO0BN9Fj9C17wq62cAOLYPgSTe
	c3h9B1xY2yB7TujkpeUpPhcI6SW5Xny4SjSuVRs8y4fUGXMAXtwi7jnB3lpqkCk5CvV2VP1g8MRtb
	AxVZtTDsJ6sKAe32dyOkJK1fKo2P3mSAsBzmMwPK5lvdo1tchUr8OylMPJIKgf0IPWpOrqCJpcFgy
	rQfVUtcL8Zcgyhgfkngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruiYb-00000009hsC-1BfC;
	Thu, 11 Apr 2024 00:44:49 +0000
Received: from mail-bn8nam11olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c14::801] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruiYW-00000009hrG-2n4N
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:44:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnZttv+VyN0JQEEdHobqk42+nvCJreIe6TQqwOkYT5edd8ie2ue8VKimI9eWn9EomgBpFK4/ZF7mSUpS6uYFcFbWAcNNunp5tl1foiT3Ov2J5r4zo1OBPH19iHSua5coQ2wXRd/ZomITRU48bQf8zEtK8YNYz2+gvnil9GLpc1I3Piw7zKhtepPLM1j93fEDAittMHjU/DL3v204gQiuPB+DICyfs6QXIijdRHGKfbGh2VLPjz6laW4Dtj2Czcn2fSNP/u+uF5tqgeEcibpS/3au80F9DLPpL3ggTstXa5X0/CJx0ry4cj7Sy8PAtaRDiMmLfEgFSc6SVc87+9Qf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzbUPzLMhB6olHj0Ld8L+Qki9ewrD/KTqF0szTsIRxk=;
 b=MKhhJKbKQnW1SyLsP4v68odcQWaSzQqo4LCJavyus3lRxYVqeMFlZC+9ilT/hNuVWRHz69efEjZVXm/y2oz8MfaC30+zOy7Uh3M2Kn4VcA4jJrKa1zx46/HEKifMgZDUXkS8vKAioqoUVvE4kU5dgsUWe23z2lEbPlWcZGeFRxzsW2pCCuRDPDVhN/raF3sttq7zq2XuYhqy5cnPvH3HPcxdklzNHDCux0SL1dmaMPG15ysrNimbg4IKta2gsNlmhYvw9GdWh1vHm738pXq5eb+aZgulf0ypnJozM2WVJjWlsZUB/bD2XTDL4F/pbJ+rBCqJL6q5s2xpwcWeAC2yWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzbUPzLMhB6olHj0Ld8L+Qki9ewrD/KTqF0szTsIRxk=;
 b=C66UwGc5eA08C0jRF1izFN/g931gAQbFjXgesh8XkVUsDPiqd9gxjqCTOb6pB3iC6rS7Pm2rb1/LQ1jaxRNBtfsmOLKlQjXIAdu2uQpq5HYvVxmzsVVKY1qJ67EcroOVU8LUKl5wbU4h4Sp/LbCvbmh5UjcAuNBhOJq+fq3rhwwBDhyaMrC0hLkCzCLznzFJ4tUjmC2U1vALAVxmzlLJOpgiakWH2/AYnbFCdIC7G7c2mgCiFV8rFjuSA+eouL9vBI4PHLD7NlwM+6/bO8X5Rp+Hgcpzh880T2umZzb7yJLdWUfWJ6+tpEMbIhTuRigEeF9/JSMgu6/JxdO/XeD0Sg==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CH3PR20MB7542.namprd20.prod.outlook.com (2603:10b6:610:1e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 00:44:39 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.042; Thu, 11 Apr 2024
 00:44:39 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: sophgo: add reserved memory node for CV1800B
Date: Thu, 11 Apr 2024 08:45:00 +0800
Message-ID: <IA1PR20MB49531F274753B04A5547DB59BB052@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
X-TMN: [i8c0JPUcoOpE9Dee97rt4DyhI1LY/h8X/z38rQYUXVM=]
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240411004501.120425-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CH3PR20MB7542:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bd24e2-71ad-4c6b-0f14-08dc59c09194
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VhQCi5oMx6KuOKZNhkqI9V5+NxFqSsMS3TVI3HszTOBXH7P31xaHmLO+vLIcqTq/p5EKkNsHgFoufNuz+vCbF7+EuIeP9o/wfDm1DTu/7nTfCXpzHPjCSnlUw73Zmvgv0ENkp8bFxQYoDuX151fTUJDoK6uGpdilba8Kwkkpv4DTyife6TjCP7z65pfsrZFXiKI1sBw+2BRVnO9Iy4d7b/TFunUXypfE1hVbFLmGqP99tvFldxmZY1HweBaW48VH7ML0gXDL0kWI6aIWJNbyQFkOFtueiinB3lKCPfcqV5ePoXreT0njmsNcYclBQQNXvn/RI/gnw9Aov0xR6jeha0U9pdFVFH2JfGj9wBx6TQ7VAUtFAPg2AZRn/WjkpQB0u0/jFpsAdOESokh8BHfI/9FuCqS7ISX9Ogm4cQ4PBsJu2cZDCPHnq1kroCGkLgAHBxXTjDmQkw1maTUi0CmNOxk9gs8vOmuL31SDbYjJs1ZP+4e6hVBeQrn4bg1QM4KMU5IgZ0jQehPMNKPflDOb9STdEMTcV62rLT+lPpmva516v0rSIRlFcsqV4g6QM32s54cJXPpdKEhte3jM9yQ8eWMDe/kQQCDw5jNg81JtPfY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?muIEf8Iq3REblYipQ8V553YIkty3xRn4BjTlmSdshVC+LlbMS2cgGpd1p79N?=
 =?us-ascii?Q?/EOWuc2F0/TmRyPKpwVWbYSttLTXhLFFr8xcQAJbp4L1DnqKG2ke8gzBEeXS?=
 =?us-ascii?Q?4D2h/sFBuUcG+UJKpNuOs2N7jDZURhigTOhk57bKf8HFyrF7hVl4DwJwKQYk?=
 =?us-ascii?Q?OKLCXmcBqw3UZ/7hzHYAui0h8bRRX9Jp7VoxHie1PACICF6vaRxObwCpDORw?=
 =?us-ascii?Q?VJaVWVC5KCdrPC14azOMr/cApVbUnvUdh/3T6ddRtDd0qhY/MY4BSD9LDsxk?=
 =?us-ascii?Q?SzovqmeE4evuO3F/fAHanr8gJqEZgNDVFdBO1RgIW4Vl07rIAmcse1uSDKW9?=
 =?us-ascii?Q?B1r2fIVoOoUuOkS/HbTzDSR/DDA/+dfGiPryvvuGKBOhnp1t37489kRljoWl?=
 =?us-ascii?Q?nG8VhgwxQZ5l6p5sQ/igLuZESSGm0M1gF2oDAwB4klGwRJ8dd342rkVO1hcu?=
 =?us-ascii?Q?36rSTyBbG9jMsUohPEF6dp9UsndiL89ZWFdSsUjv3Okn4U0sZPlEqkTGR2nT?=
 =?us-ascii?Q?NLVax9HeGYPPAKEgv3/+8ETz19mvts7InWdUkQuAnBQWtrK/vm8vJFggrEPE?=
 =?us-ascii?Q?yA4Uwlpa4sGcsMXBAoVm1ATbL/BCMxv2qSmgkzLyuotWdspd7jnIInyXV+sl?=
 =?us-ascii?Q?R4whovAuECfJ0Z3XxG+jTVAfIeAAaMRlrDhrKaA9ruVIe3MjR2HGFRtyqRCS?=
 =?us-ascii?Q?uxGGWt6iEFCGfab43HR3pzM1BJ1GDGTVyHchgc1RDyFWk8qRXjeTeKRmdZr5?=
 =?us-ascii?Q?5/uQyQst4XZzmDqvr0dz1dZKmAOprd9WBte2hq3XDJpdYA4kLmQYlUzud901?=
 =?us-ascii?Q?CNeO+bVv/VYQooCiyv4uY6ivqVISQ8p4ptB+dbLQXrSgmq5yh02z772Mx2Ub?=
 =?us-ascii?Q?AXHOEiylZD3EHD1KnCFjQsNb1EzIW0bHoFZeWzNWbMkM+eDQIh4Tzbh0CYeq?=
 =?us-ascii?Q?OY8vSjRfg8Ht6+IUDH5gFygzk/FvloluUWgz1cz63XcndvH3pxJ3BXQwV0/I?=
 =?us-ascii?Q?zxJJbMQDhF1RLSSAt7LNZf47yfkN8KCoItDNGywYVjH1CDXi7xeiFEzACHC6?=
 =?us-ascii?Q?LsSRT18nb0oWYflvJgFaMQ6sq/+5615WlGpdk/JGfSRrLfYbqqI+iAEBz3bz?=
 =?us-ascii?Q?3M7YZrTm21/cn/t87v+tbG/T82iVC5f7SvM5wa180nnGjx+ogWH4lJY//ytz?=
 =?us-ascii?Q?sMuNS+PfLPHqkV026Rr91rc1/0TH3sbqWN0BxwDsLU0rQ76WGlq2PF34kNYW?=
 =?us-ascii?Q?ICTVC+zeUjpFAPmAD5JD?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bd24e2-71ad-4c6b-0f14-08dc59c09194
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 00:44:39.2521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR20MB7542
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_174444_839472_783E8BD2 
X-CRM114-Status: UNSURE (   9.16  )
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

The original dts of CV1800B has a weird memory length as it
contains reserved memory for coprocessor. Make this area a
separate node so it can get the real memory length.

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts | 12 +++++++++---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi          |  5 +++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
index 3af9e34b3bc7..0b9128513357 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
@@ -23,9 +23,15 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};

-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x80000000 0x3f40000>;
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@83f40000 {
+			reg = <0x83f40000 0xc0000>;
+			no-map;
+		};
 	};
 };

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 165e9e320a8c..17ce8aa415a8 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -7,6 +7,11 @@

 / {
 	compatible = "sophgo,cv1800b";
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x4000000>;
+	};
 };

 &plic {
--
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
