Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7974C4345F
	for <linux-riscv@archiver.kernel.org>; Sun,  5 May 2024 01:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=74ZHBCj9wea/qmEL4u9KavQeZFPVD5yRA1gzyhH98A0=; b=juKw7V8XVnGmUW
	xakVsdMmfW7Vopd+Dn5n+mPyARTbQZsrdSadBHYOcgyeLf5FMkPT73JJVmHp7f9ztTvzRtxk+/+CV
	IaJPBgNjedMYM5gAK8lZ1DitcJbvbtDU4JLd+hNVpVIpfkrhdRFeamA0rabWedb6UszuDDLRLVXI3
	eJTwkai/H+W78VjtQq0oQOcDMP0ahgWZMoN6sdTGfi3BuOuhPXerjxl0Cb4sc5h5svHokQPHGhzzN
	2Ugk3UgzK2jvM4F14LuPmrfccrke+HcZfSQu/alU4LjATeDjcxJ8A4me3ysJwMeB4p9beS7fhyAko
	vkzOI6JjZAJjCFAgGCMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3R1w-00000003L0V-31b2;
	Sun, 05 May 2024 01:51:08 +0000
Received: from mail-mw2nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2805::800] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3R1t-00000003KzM-3f4B;
	Sun, 05 May 2024 01:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FH+8MGy+02gNHFv0EXiTYNGl+Q8umPcGoywtY+XxfGylAjAP+kDExPh+fNO5X4WtZWFEq1WRAdaCPWEmbWveL/xXfCuusCC4m/34kefg/af4AUSPD/SdSh5gQ+iwTZZOOnfV/cuddsUP00BihUDPJfQqMp3PkxchAWRl5qhrdM9mFGp7IOLRiiKKwXgFptiU3ZXyQPOUKMK6VXhhEsyjxkzfRZwTqJa1nCDBILMvDWbTXyP9fM3WaaM5G/DXrrW1zQj+2Huogy1lcwo+WNfZ3uv1gFJ0Ty+TOkiWKPUApQpSHM409UzpYOZmpK/vwpzFlTjnXNSvNWZ0N9shXHvPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G3TzbBD0Pd7T/mFJRSVqGvIOLOUKQv4D4TKeO7nhL68=;
 b=fJLitdKzNMXiuOgPG9y+4ZWvgyFjqwgYzvkIlaYlfUXalxaEm3YO2iSYn5kknaq41oC8oAQ8Kb/xunBQq1NfLJAxybA4FBs4rcZK7fNJP/apLzSuGRB49peFHOoTI6/ir2ZOvy8q822pIjL8BK1VQ3BDlqwbuKT5gxFmQXk6yWN9zBfbHq7Y+64y93b1lMhBplvKJJhr0ucMVtqZvca9MZpW0uxld5iIOrQpPpnBlOEjMfGFV4I+fmIBBHMJLMh8QmifV7BV0pTp4c+GYRi7JvAiPVX3PEpGpRcLGMrAa0C4QwhcaIR6WfOz1PgV14vLRCGUQHB/cWDtkVuvzm0OvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G3TzbBD0Pd7T/mFJRSVqGvIOLOUKQv4D4TKeO7nhL68=;
 b=MseX6TFvSWJwZqxWQMZ71bGH2IhroGNmDV9BnqQDs72dx6NbnFCERPSAEay5ihHxcPA5pMSUbCsYwFgQ3wDxCNiqFfljSlGNpE70N5XpCKP7EMFfZqa3V4inXxtfiCUwIVTW2Ub+Qv28hGU8ddyuRhmz/w8+ykWJ5Y+9sVhpExYwjW3nsNgo53DjEwTlouPr4aCH6PPkxxQzkju31FtaBv8sb4ZvKccYqPpfEOwxqA0JKXwufSIOzp6DCYQm3j4BiGtFPFe8NYx6wtueVKcnlbo/MPK6CEhqAjutODJ1STN0SjuktJ+3HGTY934hbXLzjzT318pnilGFon3IJJVE6A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH0PR20MB4304.namprd20.prod.outlook.com (2603:10b6:510:12a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Sun, 5 May
 2024 01:50:55 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 01:50:55 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Liu Gui <kenneth.liu@sophgo.com>,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	dlan@gentoo.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/2] riscv: sophgo: add USB phy support for CV18XX series
Date: Sun,  5 May 2024 09:50:31 +0800
Message-ID: <IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.45.0
X-TMN: [3foKvUZL/86PvYO/IvNO6BesbAt8pKGLIsh/EaoSx6w=]
X-ClientProxiedBy: TYCPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::18) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240505015032.752143-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH0PR20MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: ad4fdd9f-d60c-4747-ee1e-08dc6ca5cd6d
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|3412199016|440099019|1602099003|1710799017;
X-Microsoft-Antispam-Message-Info: nzbfIpmcJJUpEpi845Ivd9mNXYxyK8R02hSNSbUIJ54DOmNRDs+e+KPFVHiEtILq+QkmNhZqV0CrvxqGFtdqZpaxQvbQ6rhmoCto+oN3nxW6PEcyoVnivR1jJaZm8rHwOD3+A4xfA7N1D2ej549NZtx1qGl+/XtG8claqF0RA1r/csAFnudb72DvnivP0+bmOOLDFO4hZ6eBYriTyPKf/TwFNydWSKdmGYjcKEEDOraLMpIh60/fm3P/NiH51l1Zv3CIIv+oY7JJyPJXPH0FROHA72huF2Ur+GwC/OqHkfWEFmiEL4DOl5oWlVEvpY0W1Cljv/9NoCsHa/csuiBTq/qOjayz2IJweht+a1i6d8gRfN6meZ6AMXMdA27UM+woYQRnT8cyNo+pQpKxacvfmTQFR/WYuTaQF6dpoN33RxGJJKoXi4w1DE+WM+V/suMsgv7vnxzxD+B+fiLg93DkICYih83Cw9Syn/+FlKZacFbWFGT29ISLUsVQLRZY0r7jso57QSg5rtoQKTe/m3+wekyEYhYVWmtIMtochN8WEmj70XchZaajaF0N02nNDJTqSGpxvs8/6X27m7JgsJviNIjQRwjAHCJSfB2rJCBiQ52oho6/shwRQfnRaEiR5eRs92COnN1G4eeyG94OVYt7hCGNYX7GVAJoHFB3t7pfrE491wPURiBlPi4GKoFOdmFN
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G2VVOrjGTmnKLTQ3of8iwSfjKGxxxZfsPOHJh064Qky2Ai/BEbSSZPacA6ui?=
 =?us-ascii?Q?lmINeR4jid8u54MJS+pyQYYi4KzcnEucperBxk0nnX6TCLWR387v7t63hf+C?=
 =?us-ascii?Q?NyTJv+9evAZO6dfvZ8RWigJY9D7lwr5Im+ZnPwSoG9AQTEjuCONEWQjG16ie?=
 =?us-ascii?Q?/QAssyi0IAh19pIopGx0zyTp29vZ3PYlEKmXsHN3SKgwsllvOjdDW6I8yIur?=
 =?us-ascii?Q?CJWpxIogLIOZkR8JLri5zEB5yjaNxOHNMLf22CmmwHAC1yNpF4C3RNv04XQr?=
 =?us-ascii?Q?MGieQJ2Xb7JfBDDOY59z3KMHpXTtq2AfeEzp7nDmzEkdS0dCrz0+Iv43Etol?=
 =?us-ascii?Q?sxGNMqEIuckFgzLm2FOtvH59UxicYUP//rP5QZXMZPX8GVvW9Ge5YE2bgIGe?=
 =?us-ascii?Q?uGpCMysm4UBY7aJO9aRShjRpelA0/H4gWLMHdsPRoynEaA9HX3FjyVwoanTW?=
 =?us-ascii?Q?fwjNJMUpxpRmi863ba800qUJTZvgH20GqcHWabXQ3BOGxBJhpsU3EwoqUe7k?=
 =?us-ascii?Q?sHNei2irwUhN9nZiXU6fnemVCpVcEFaoIXdaJywlk1y9LldtGqYfqBNuG4T/?=
 =?us-ascii?Q?8rawIZBSeWy4gUhLP/cga9rQzR0blMhR9u6qZEwmUaF1GhagLqJtI6TKJUxJ?=
 =?us-ascii?Q?w+kLBknJfrlMqjKWeIKIxAfzuA49HlRir+fksWpYiHTwfH5QHk12yGYHpXMY?=
 =?us-ascii?Q?EmfmpsuBR50ROxIntv5yo8DrZGAOnOL0A/jYYq7XOWNv/r/dSmV1p42SZ5rR?=
 =?us-ascii?Q?FLygLx6IoYEz5rMAQjbrCWqvrxH7TgnXFNk3Mp7yCW5C6aFLdn/CYrFPEOb8?=
 =?us-ascii?Q?++uKwRpfM3ODJFwGR8SnFM5FYOQaxcSFOOXkh6QAeIOtgJzKddrgRpf70B72?=
 =?us-ascii?Q?6dfOrLC/UcHYMbc3Jq7TZ2vVUy6aLdg0INjaniN1UlY8eJ7fD0zWsJHMz/CU?=
 =?us-ascii?Q?KFtGojeZadq2SfR0/HtLVtXhC5xeBexkms6rTmdw7SMAbjj7VfrKg/p2z4DB?=
 =?us-ascii?Q?+lqQx3YyiWeg68W58m15B47aB7d4lXNzpew8Zw1uCRC70UY89n6vg7jxcwpo?=
 =?us-ascii?Q?J9AQMdUWOIynH6tRJYjkvEX67uNKdb4rKzB/a4zOy5jHwHLhduFm/seMEIb/?=
 =?us-ascii?Q?THtucZ7jdXCRGIAvagwvkzAnQaID8jwcqPGZLmku/CDk7z+dsDLkcQcx/cX1?=
 =?us-ascii?Q?0kIkcDHTaFJRPsAPIR38noUcODX+DWyPMVOBix0FeAxAT/ZtPv4gcoc/xWl2?=
 =?us-ascii?Q?jXDekxSTpuwVOHqVXxG4?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad4fdd9f-d60c-4747-ee1e-08dc6ca5cd6d
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 01:50:55.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR20MB4304
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_185105_923046_9B9A9286 
X-CRM114-Status: UNSURE (   7.94  )
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

Add USB PHY support for CV18XX/SG200X series

This patch depends a header to build from another patch:
https://lore.kernel.org/all/IA1PR20MB4953BAA0F8E06CB202C5C2FBBB062@IA1PR20MB4953.namprd20.prod.outlook.com/

Changed from v2:
1. add item description for switch gpios.

Changed from v1:
1. remove dr_mode property and use default mode instead.
2. improve the description of `vbus_det-gpios` and `sophgo,switch-gpios`

Inochi Amaoto (2):
  dt-bindings: phy: Add Sophgo CV1800 USB phy
  phy: sophgo: Add USB 2.0 PHY driver for Sophgo CV18XX/SG200X

 .../bindings/phy/sophgo,cv1800-usb-phy.yaml   |  71 ++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/sophgo/Kconfig                    |  19 +
 drivers/phy/sophgo/Makefile                   |   2 +
 drivers/phy/sophgo/phy-cv1800-usb.c           | 378 ++++++++++++++++++
 6 files changed, 472 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb.c

--
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
