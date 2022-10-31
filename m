Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FDEFA3741
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 16:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AFFt4LwwLxBoqsbh9jWXKhd6OG+UZrTUpyC5QGoVd78=; b=I9IpYP7xF2Qs1Z
	F0vySF+GGG622SDZbT1SLVyMUAAI/PKCaA3cx+3oa84FXABr3KOwdqPu95mljEU9+f6w/MbS17EFn
	Qgq1ZLq2Iln1Ybe3zJD1F5XDW5yQEvOWs9u9xZfpOHV1omyRPdO5lLxN1O7lmBs5Te3j6tulNy9/h
	VwhKNAlr93SAwTIb45PK9ZOCesReogG+1AoCYxjx0eUd4K+sWoVOiu7+OVJRDg9gJVqxkgVAV28xG
	6qcic1vWEWUM2ChNjy3fMalqI5fcKeTheWkJtFYlnTqLil+QcoohRAWnRxzCGoFLB5Y1ohoxR05hO
	u8CPvjlkpckipRSbQa8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opY7k-00D8ry-BD; Mon, 31 Oct 2022 16:58:56 +0000
Received: from mail-dbaeur03on2064.outbound.protection.outlook.com ([40.107.104.64] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opY7X-00D8nA-QC; Mon, 31 Oct 2022 16:58:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNqzhBeeSBeE3WoJHNC9AqhGAPYU/73G3tEPjtct35ZghXB0/j//k/0TBljiBg65sVfX0f47ppqD7S/DLZb9+Hbl/NQ1KGcPxUYa9M7KYs4vCXLStMi83s2kJPWP/BvJVuvoOrEvcLIA2GgHdJmfG05eOKlmMaj0PwvsAAwBcPVMqGznsViy9fR/cfddKM4GuiJCSAJUmqhowdJm9dmjRfqmYX/sws6vnrc4+Xod18WTxVYlOaJ8VyIQjPbEK8c3g9sGuxm0CsxyBSrfE/tu4oGIvrS12vwByp1sbTzFx4msAOoo7zOJO8m3uEI+yOb05RS3zrpr088xk5qGziRJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qjdmRa4hwfk1IW36GLjw5p1LKOlQHLRRwhelWoKcgg8=;
 b=nBHAKVXMETZp4yN67stjDQXrJbhh/VIDkmE8rGfdCjVv4Q+DO0gMqoP1dDdKWuP0covbn6tj/5/bT0SjWbL6ONfRur8B/+2ECb7MHOvXril5NohCYYLoAqwJ0+ER01sVjiSy/Oyw1pAnT8sJAo+wOEf4bCoTbkV3E5wHPN2csPjv8qTGRR7KgItdX4KUlLn2wHe2EwktqJkRn/xkdgGNEQl4U2YVXH1OBfjl80i1DkVyWO8VbuEku7mMXTriplLuM7JgUm4mov+mdZuWRH71LvH1pIJBKrHd/41vhvTKIdEFjoWo6Vjq3fD7PjPVIYwpsNDavqScK+qa2lxycjORtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qjdmRa4hwfk1IW36GLjw5p1LKOlQHLRRwhelWoKcgg8=;
 b=ff6BweGlVyhrd9T/u4oYQ2NMCaY2E3CM+2AoaU553rrq2xIjeyd195cI9SX8QQMZKh/CHXefhzw5fMoAcfHfxy0LmkGvsm2Vx1vdM+CoIKhzsXXnmQ2aE+qHpBRP7A081KP/8RRSSA5ib/Vt928yqQAuo7G/BBJRMTa1dhU7+Z4=
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (2603:10a6:803:cc::27)
 by AM8PR04MB7377.eurprd04.prod.outlook.com (2603:10a6:20b:1de::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 16:58:38 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::8bad:8bfc:e078:f403]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::8bad:8bfc:e078:f403%4]) with mapi id 15.20.5769.019; Mon, 31 Oct 2022
 16:58:38 +0000
From: Roy Zang <roy.zang@nxp.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>, Tom Joseph
	<tjoseph@cadence.com>, Rob Herring <robh@kernel.org>,
	=?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kw@linux.com>, "M.H. Lian"
	<minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij
	<linus.walleij@linaro.org>, Toan Le <toan@os.amperecomputing.com>, Joyce Ooi
	<joyce.ooi@intel.com>, Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, Daire
 McNamara <daire.mcnamara@microchip.com>, Shawn Lin
	<shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Bharat Kumar
 Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>,
	"bcm-kernel-feedback-list@broadcom.com"
	<bcm-kernel-feedback-list@broadcom.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, Bjorn Helgaas <bhelgaas@google.com>
Subject: RE: [PATCH v3 5/5] PCI: Remove unnecessary <linux/of_irq.h> includes
Thread-Topic: [PATCH v3 5/5] PCI: Remove unnecessary <linux/of_irq.h> includes
Thread-Index: AQHY7T8RqoJVzoqIkkOemdfdOjjY4a4ouT/A
Date: Mon, 31 Oct 2022 16:58:38 +0000
Message-ID:  <VI1PR04MB596765E30FEC4F2E867FEE878B379@VI1PR04MB5967.eurprd04.prod.outlook.com>
References: <20221031153954.1163623-1-helgaas@kernel.org>
 <20221031153954.1163623-6-helgaas@kernel.org>
In-Reply-To: <20221031153954.1163623-6-helgaas@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5967:EE_|AM8PR04MB7377:EE_
x-ms-office365-filtering-correlation-id: 8d730c5c-f8ee-4355-0201-08dabb612822
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  pUAHJWR2lfXf43QnvJJ3kN9oR6uAE9FBorIsryB1mccwGlFpWDT8HWCjBqhKL69lBPxVKk/+HJjIPyfJ3xJ7Vqz1O5HrrT7kYVybwgAIdsABO90NmbbDoKd7yPqMQz23KRa+yqUTdMHKAU4/AhxlabxhlA5aGwZ78tIXskC2r8sAnu6U7CBDUQV/YG3KZDnaYvZGqPlPyF2ZJp9ACuPBeR1pFNxPwGLIyaPogiNAaB49xY0W9L8LQErHEAHhV5MLvYkz0M3eXgN/gHa04GLPqcTbPQdGFSZ6MHMyC73eLcOsgWVoZ25S9n2QVq8M0PzkfVRtisnNAQKyrWdWLoKGiQUpdsBtfUlaVIos94ZLzQHEGiuXzvwN81pWhGhAmM19a1W11a0TvTc79FBaSB1VsdbB5dHwqdOPRLtXB+ltqUZyx8j6Al2Q8O5tEi2Zy3tdHb8PZ38W5EzXqMlY/rhfrrR9feZillPrHa9xxdBeShMVLEOwq51+7DLvQUGty/pJ9NdxRTAo1ANXL+ZL6cUZyip+1druf5CTTwZpv2txpBgsYPsvZMYkYoOpRemTxj6HvL/ZlNLu3Pk9ZDKXEtSVNF23Tzz3CMHNMXH4EJyqdf2wTtkaquRT7N4EPqHuFKB9nC3jpUp42Y3aa7llJL62cm+YoWEyGJBnLgAkkjugQk4ZemAtAfiG9wpBSiVIPJoE335FZPScjXyMteBSVDQI29U2xcwND4UuWb0bu1qjH7SwwZYsfE+TxuPbEdZlGYqpJuRRJaiOrhQl72ZcpT9h3w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5967.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199015)(38070700005)(44832011)(66556008)(66476007)(55016003)(4326008)(64756008)(8676002)(66946007)(66446008)(76116006)(316002)(33656002)(110136005)(54906003)(7416002)(8936002)(9686003)(7406005)(52536014)(5660300002)(7696005)(26005)(55236004)(86362001)(41300700001)(186003)(6506007)(71200400001)(38100700002)(2906002)(83380400001)(122000001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?0pIHWk4Xst9MAiv65H1Y7FFSVfBr3vARzlWeupsbsTpq7OK9cb7ecPPtpC?=
 =?iso-8859-2?Q?dcQN0QFld8RLXNerRqwVE3KeSvDmyc//ATx27A3ZTRk5DANuz82zysbJj4?=
 =?iso-8859-2?Q?rsl16B4xB9MkYIbDL3SodGN5p/qExAl6Vfqne8rtPWt9T+3FPMwsfgflNr?=
 =?iso-8859-2?Q?n3n+VeZAiaUyXbxIMVnTlcWydm4BTRfUEsYKya+/r6AaX+xBiy3gHbF0pK?=
 =?iso-8859-2?Q?HUG2w1N5/QKmnsngtF5UiMHkUqgTR6NYDAeM14XYjIhrECmYNODv5uVIbv?=
 =?iso-8859-2?Q?diXoTWHuLP3Cql/dkn3xOaNfy7rCIYZOzi5REa++OaMfIxe+CpEjtA/Ecl?=
 =?iso-8859-2?Q?S11cMv37mADxrj8udc7N89zG4PTNtHG7eHke65ecnwQM69dDv5B8arZLS/?=
 =?iso-8859-2?Q?IZQBXRJXm8HOegGe2+Ps/zMKrTcdBj5NUGYR/fNmyKuQ5X/MXeAxj2wGEu?=
 =?iso-8859-2?Q?bDARFdociO7QJve9IBbjFEtqtgtTXMiP47N5+SVohwplYw1nS8qaAUaDHW?=
 =?iso-8859-2?Q?5Z//YIbupGaAYDgzUvQySqxDbu36MboEhTWAfc/NVVM1yfoLCb+1mnKhuA?=
 =?iso-8859-2?Q?VMSlgbYO05likKU1eIpLMdXB4iagSWZrPsit6jjXc7SDRJTU04iZrndx6z?=
 =?iso-8859-2?Q?DxWmA8TzTlMxqQzj6WQnGKrCsQwJDxB2eKn/aTGzmKZN2oT04AHQJgsmKQ?=
 =?iso-8859-2?Q?fiek6qqtrqXKWp8vDTVkb5ho69t9dLmDHXQmn2N3Sdkr62Oq10C7mqzpsj?=
 =?iso-8859-2?Q?kvTCWUm9yv/3K4dsxBijkUBrrn6XP1GqiZxMSlMB2luSsOEe/Jpr3y4LGS?=
 =?iso-8859-2?Q?EjqUpCwXbJhp/w8P/EFv4rFZ7j1QczViW7XChwXclvURCASwaeTZD92OBB?=
 =?iso-8859-2?Q?X9K/PxFcPKjlo9ut6kvOppwK1CKzAO3szFeu4lv4PApDxCkytUGT+XatlZ?=
 =?iso-8859-2?Q?hGjbTkyXUaPrn7vMUB7FQRQYrgeXxwT6q+4aCh2UPMwaa2mrdLcz2WX+5p?=
 =?iso-8859-2?Q?ZU8gKFzPJOXShmde+krvJmCAU2XfejnQ/FQZbzQ+KLsL2xKw3dYoe0hG2y?=
 =?iso-8859-2?Q?Z90j76yqVYHWb7lU87esugDOlSl6RYDgJwJmmnOYZxVFjHn1hT2asU0gxN?=
 =?iso-8859-2?Q?dyQ+N8YuSxrt034/JzcCx6wAJPV8N4nHVbNDVQ6x41ssPrnt1z5yB0LMGL?=
 =?iso-8859-2?Q?z549AeWuP1nuEjTXPpFYkAFliVvpXJprhd4OCGSjDqA7xl4PHn0qXeBVAi?=
 =?iso-8859-2?Q?R6JjYfo5GOh6A3XW8/s0GCe7V1GG7iiF/P8kCQeLCe/qcP3lh3IBay5IBs?=
 =?iso-8859-2?Q?5zuVlgQNL4WQjthaHgFeelh3g+g1TpmZjcHvHBLyWxXjBYgCp9CTTMBp6g?=
 =?iso-8859-2?Q?YlrD2O6D8bpaIeLxMfKrTT8ECOaEtJJWYAKzUmvokIX7it0hdtI1Bm7w14?=
 =?iso-8859-2?Q?nFw4gnYNugFIm4XVJwzvBDx+Z+bavIFLPwuYvC8J4bUmnun5dSDfQZNhBq?=
 =?iso-8859-2?Q?1eOnFWJgl7KA0tcrjIMqFvKHNsHRUTM3fyzEAdQtGHxK51h4rT5XnnGQRe?=
 =?iso-8859-2?Q?lSjdvY3Rq/wHUrWUZwAk0icHYBvtbIBnGKaX02VRMkOl7PRulTCquePk5B?=
 =?iso-8859-2?Q?c4PqcG6IrlMhY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5967.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d730c5c-f8ee-4355-0201-08dabb612822
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2022 16:58:38.5260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /1BSGBupK0MCKDCpeljjAj/ma0ZlTYiJ8kDab7CmiNjRxVfhVFmwQrklYdCYSfjAnF+iVFYYXrFBfYvT+VXVUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7377
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_095843_891428_5B415449 
X-CRM114-Status: UNSURE (   8.72  )
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


> -----Original Message-----
> From: Bjorn Helgaas <helgaas@kernel.org>
> Subject: [PATCH v3 5/5] PCI: Remove unnecessary <linux/of_irq.h> includes
> 
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/cadence/pci-j721e.c   | 1 -
>  drivers/pci/controller/dwc/pci-layerscape.c  | 1 -
>  drivers/pci/controller/dwc/pcie-armada8k.c   | 1 -
>  drivers/pci/controller/dwc/pcie-tegra194.c   | 1 -
>  drivers/pci/controller/pci-v3-semi.c         | 1 -
>  drivers/pci/controller/pci-xgene-msi.c       | 1 -
>  drivers/pci/controller/pci-xgene.c           | 1 -
>  drivers/pci/controller/pcie-altera-msi.c     | 1 -
>  drivers/pci/controller/pcie-iproc-platform.c | 1 -
>  drivers/pci/controller/pcie-iproc.c          | 1 -
>  drivers/pci/controller/pcie-microchip-host.c | 1 -  drivers/pci/controller/pcie-
> rockchip-host.c  | 1 -
>  drivers/pci/controller/pcie-xilinx-cpm.c     | 1 -
>  drivers/pci/controller/pcie-xilinx-nwl.c     | 1 -
>  14 files changed, 14 deletions(-)
Acked-by: Roy Zang <roy.zang@nxp.com>

-R

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
