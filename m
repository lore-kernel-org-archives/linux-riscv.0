Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951F0CD128A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 01:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o/7d/9ovMqPFuuLAUTfceGp2KXgqksTLxr/95ZGX8Ko=; b=ZvQqQ1J7rValKg
	wOqrQXY5+a4WhlgQRb2ltFSDZ/LiKLgmaC/CcHGA6EiR+XAO3dKv1HcpY/cnWilH6cPfflPc9dMnC
	nbCm1HL0lYjLnp+06CzLXsb1e1sjX4oAtRLTDCxrQ68wR/wIjf5FAeUzYhSg6H4VscmvI1ChcuTLd
	NxviSXwJc19N9dC78uWsaea2kHlg288IuwvaZBxYKVg3dX3CAtNuVVSF74fSb6MgijMDCzrqL1gGz
	0KmTQmBtXI4LrT5PQz/Ef9Y2SgqgoCA9H/SPazrMukfYvba/JmFX6MD0jEu6ogCWq1VFujrlvgcph
	aGATKUgqjPSGwgRYj5Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruMdX-00000004ZIy-3YLF;
	Wed, 10 Apr 2024 01:20:27 +0000
Received: from mail-dm6nam12olkn20801.outbound.protection.outlook.com ([2a01:111:f403:2c17::801] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruMdU-00000004ZI1-0mnJ
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 01:20:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nR6QuVbG/8UPTce68t7PCMV46zYHfILLApMxy5mL2aBi3+KVhdquB5xYR4mIYMA8un9DI46KPYADMwACoLxnoUwjZpaPK1VzRFPAL+cGExekBE4Vh7eLSsvXrEtGCciR0fV84o2j2iNRhfjiP/3ANK99cnnqSueK/Hfg9T9g7PJ0cOAydINaJ4OK32FNO0ww1cXc5cfb1rtpkmWmrKOS27ikAlkSCQxQIcBeMEqq5pP3MqqARwCGs8p8sxF2HQJtk7FVXVPAftrTEmo1t1MNY/pvvqNkdNAr/BSISwYaaJbM0+If+fy1Xf+tCgP+wG8QeRMoULtEmqYm7cdryFJOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ibs8iOze464yYWMklmHSVYesiAGssNFJihBxVCmIszw=;
 b=db++iqB2cz1NMWs7be8gIY1zBMVP5KS5cycmUtZt35/cGeQ7wjoPyX0XBjzprzZDDc1rfyAhTHKhh8/l2LQIQj/O2ZVwwT2FX6pELRWXPNfqQOWVRaqMurzKffFFEMti+yMpRL63e7u1DW9CGbsVFNAL2yjFd9igaTwhinKHWids1qnsW5S3+JZ7Bqh+FGQf0zQqHbYdKTJLGtHtX0nxTYWEsJD/aWyD6GMR25YSgIckO3GM0nSYAPavW/iifhb4dcjzBv0NAw9Qgw1gf64EKj9Y6vq4fct3enIolmI+qOZCNwxyzRgYHrUu89OpBOAEtpGl29r3Jy3jk7uQUKlzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ibs8iOze464yYWMklmHSVYesiAGssNFJihBxVCmIszw=;
 b=Wtt9ebvTfcj+tM0chQ25uPzVhPRW4uTDrr7mmYnL+HXP0BozMhg/7p16OguZedWJbj8XA5adn8wC5SzxRY0L1GhxC9yjKyjbi7Y5MQ+j9gJ/YGj0pIzfqTAxYCmr8t4rLUEmCXct5CXUmQ/VPD8uhJhfipNG/jn/ZBoP46gIKc6sYRZf0ugBu+iMkZ6RN7fH9oQe+Z+aDT+O/xpIpwZaBs8tTqlJhOAHuuwOACqA0jPK1b4ROYvyXwiJAFB39JpRNgELqkR3ZELDWRLTbcXvvnljKqajgiE9FzCeRYi77gifvgF3NlexmlQW+tH6jgXV9vfT+LMVbT7DQyUmsqy8eQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by CYYPR20MB6833.namprd20.prod.outlook.com (2603:10b6:930:c6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 01:20:17 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 01:20:16 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 0/3] riscv: sophgo: add dmamux support for Sophgo CV1800/SG2000 SoCs
Date: Wed, 10 Apr 2024 09:20:30 +0800
Message-ID: <IA1PR20MB49538A66B7AAE7801C5A7C04BB062@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
X-TMN: [tQf6glBFyMjo2sGxYaXX+u0tL0lAnx5Ut4s7nC75tZw=]
X-ClientProxiedBy: TYCP286CA0288.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::16) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20240410012031.165284-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|CYYPR20MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 3204baf8-0ee5-4e67-99f4-08dc58fc60cf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ThnLXL0NYu+4vvwHHDPLmv1c1NhZR6jfpnFgd1ooLZhrlu3uLLfnfx124AB02BoleuqdCxBtkKEInFaVWr27J570bB0R91OaOGqCSjJPN7LHvpcPhRXip8Hr+m48Wq+YitcWOESSoDI4odZm3fLhbQT23Ci2AXvUr8r29iiKO3V/0prbrY5gwYHpqGGFvzSV1llRaQGTW7wBhLKuUVIqwYFyRnmEbsPG3EvYsnJHIwG1pFDSO3meJukZPj4UcWXGZQ+ebluo1GNw4whSGEvnQkKH4We4onZ1MfpaQTUSPZuUhgd3MROEB/IGq5NbS/c9HDi7h9z54uISPeSDHafyVERrErbPihV5/0rr3/DQ4O9UEebnAgQ6QZ631WUWWaf40Y15TJc5zaQn7xbLYzhELvdi5J15oYnYW80DmpejUDJrK6B2JMqb+NWqD8PDF/l/gJyt197Q+m5fiDxtD/OArEDSDhuZTQAroHhX56fBdAa3Ru8/jHQxRsHzbCCiZkDP4SKvEcM+xLhrLoEkuILxl+YI/M718WCXM6BExt6t3ofPRCzEb4eh2VHBLTd43aMWMT1pP9wIiwyqW0Zx058QVaSAy/C8nlrBOFufLWxLfEs=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HhPkcOXW2TzHbPrY08t19HoAAckxjNuKjxif5xh6jMuGf6zBa2pSC5/cBe3f?=
 =?us-ascii?Q?oX/ZJdrYZePNi3b6GLe+pGyVpwyDhZ+U6SS8By2386HtJnJ794Fq8vUKdkKy?=
 =?us-ascii?Q?H/qww2gtITEYa47yX4Uzs2hsMPcbXIDaxXd5zyMU4eRmDwl2QFVCM6ew743l?=
 =?us-ascii?Q?pg6F6nT6oIGKj6So/F5/ab2GfB+js2D90AdpRwUPVWVfDPu6/4ETPtY86vTn?=
 =?us-ascii?Q?qbiXIcGHKS1X1JsdXGun9cPMGRVojc18B6GEDhKmIZ5OoirfRptQsdGnLIby?=
 =?us-ascii?Q?7t4PKZEFJ5xBqyX2+cs4EQXgIOuYHDn/LXkbhwDtYgzcwLXNecYzuTkt+v4o?=
 =?us-ascii?Q?BPR3Pv8oSeqJgYRjw5cf1ZZUywt9xo2WeiqjFhsoWtJCXts7qroQQwcS324q?=
 =?us-ascii?Q?WQMCa9eR17U83SO3rTn/Dg4ByydP/uWSD+UakIFNiZBnoeKkynmAeD42Pzln?=
 =?us-ascii?Q?GG1jFbSjuHug7yUMuSjjdadhzVsJTTGYvISGrrHDiDstfuuc6/kbd1pTO3wF?=
 =?us-ascii?Q?trxW2aS+1J1oFZhFHtNuIIBGWzkgKmYxv8KrJZbktf/tLyW6mOPuEvGagf7c?=
 =?us-ascii?Q?8xuxgEGb9JZ8diViZj2+DQPlL9DckCOyGAJvL1y+iniPBF6zFotQ7Tt1+LKr?=
 =?us-ascii?Q?VgCkxwbzNJ8GIfKPRCmYi+6n+ycPj/8pyVEyBGwsOrPLS5ZHHKNZzzikT6x9?=
 =?us-ascii?Q?0TC+K4LXPkRnkYvnCK/nK4DL3CFKvNORVGD8K0RCnDnqhlPUudPC1FWIdPql?=
 =?us-ascii?Q?6hoa8R194OD6B6X6t57XDbQlZdV0BwE+LqiFGOXCaBEpaYE7QS0IfcrszrSS?=
 =?us-ascii?Q?KdNC0/TSd/bwVPzH7mcBMCuAjX10KGez+GTj7gwrnZlg9wN9GemAf5xhBS1v?=
 =?us-ascii?Q?+CFLoqCQzS/Ide5zhQ7y7ErFBmY0aJfTgVPuvRxBODrQNy+0nyXrR2KevzVX?=
 =?us-ascii?Q?OiAWANGBrlUBchw7OxpOnCxhBhy3k4gqDeZ0siKf0q7Z5AAWo2jqsTfTiBhA?=
 =?us-ascii?Q?U/Ju/8GBsawN8E4yUkx9yYJkTTmDiAfAcjinovbiB5/uvx29uNkUOp9GHGPg?=
 =?us-ascii?Q?6c4Iem0REIlp8WSmf9r30+BApBRHQnFlIUJMbvgkQs5mSk7zqY+mBhAKCpeI?=
 =?us-ascii?Q?4ii+7f/bA81RWFPqJb1G0NM5pH/Bgzo5qUKJq73ammoMzWiODl+qsU1GFXuW?=
 =?us-ascii?Q?rE4VCXmD3PxJUICJKgzmejjr1RzKjtGMCEBBaaTo6K3qKqItJkDhE10fIJrI?=
 =?us-ascii?Q?+TDhne895ibnrIPftVdu?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3204baf8-0ee5-4e67-99f4-08dc58fc60cf
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 01:20:16.3809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR20MB6833
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_182024_282312_A502E436 
X-CRM114-Status: GOOD (  10.28  )
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

Add dma multiplexer support for the Sophgo CV1800/SG2000 SoCs.

As the syscon device of CV1800 have a usb phy subdevices. The
binding of the syscon can not be complete without the usb phy
is finished. As a result, the binding of syscon is removed
and will be evolved in its original series after the usb phy
binding is fully explored.

Changed from v6:
1. fix copyright time.
2. driver only output mapping info in when debugging.
3. remove dma-master check in the driver init since the binding
always require it.

Changed from v5:
1. remove dead binding header.
2. make "reg" required so the syscon binding can have the same
example node of the dmamux binding.

Changed from v4:
1. remove the syscon binding since it can not be complete (still
lack some subdevices)
2. add reg description for the binding,
3. remove the fixed channel assign for dmamux binding
3. driver adopt to the binding change. Now the driver allocates all the
channel when initing and maps the request chan to the channel dynamicly.

Changed from v3:
1. fix dt-binding address issue.

Changed from v2:
1. add reg property of dmamux node in the binding of patch 2

Changed from v1:
1. fix wrong title of patch 2.

Inochi Amaoto (3):
  dt-bindings: dmaengine: Add dma multiplexer for CV18XX/SG200X series
    SoC
  soc/sophgo: add top sysctrl layout file for CV18XX/SG200X
  dmaengine: add driver for Sophgo CV18XX/SG200X dmamux

 .../bindings/dma/sophgo,cv1800-dmamux.yaml    |  51 ++++
 drivers/dma/Kconfig                           |   9 +
 drivers/dma/Makefile                          |   1 +
 drivers/dma/cv1800-dmamux.c                   | 260 ++++++++++++++++++
 include/soc/sophgo/cv1800-sysctl.h            |  30 ++
 5 files changed, 351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
 create mode 100644 drivers/dma/cv1800-dmamux.c
 create mode 100644 include/soc/sophgo/cv1800-sysctl.h

--
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
