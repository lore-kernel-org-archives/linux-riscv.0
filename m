Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC16DC7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 14:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbO67h5FVownNE6gBebhSDWaM7dlFbu586a0O3q/9bU=; b=4JaTCTQwMR/b2l
	67rJWO2lR7uujmwBHniHMvAsVa1mzCwggVWUOfxWc4sdM/iAE2Wupinqs82J+k9g5qskd7QvRGzET
	6zePcZDs9ks8JcSVu1YVckoARCYPj3r/n0FXxMWp4LPEcvDOfZr7oHs4TxphUD2L+FdwkivkwoHfz
	yJUkjKsrOM6X0ZxxFgbmppg8QRiraC7esJxurPeUVaCq5PZkimYmyW3ydev3+abfu9PrZp5ucRFgb
	eHc6VBW0lMn9a8sNStOcDsy81eky9oT7vNc1C5ctcgLXxibqH7ji95rIRdodM5vD1mOejxIY1Hpmm
	hOo+JIUHvd6TZG+IJE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puZmN-0083rk-0N;
	Thu, 04 May 2023 14:17:55 +0000
Received: from mail-dm6nam11on20611.outbound.protection.outlook.com ([2a01:111:f400:7eaa::611] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puZmJ-0083qn-2O
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 14:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BQl5W5aEWohbDIrwk1SrK5JWirgLv+GMwu2Hvs6E3cpuSKLxKYvR/JYtqgVmqusrwUdu4mSzq41u5SmrV3IvlCjma60/cskLCG7zRd/tAvT/YaPRmJJJ7uTIDECEX5AXFQehnrgYtqAuICeJkh+tDBlM/4TlRR2LeWAxAGiYtT9Gq8E8hcliOwY1I46DTHd44eeLtdW1RjZoF0moPfcpQZcEXzfyHJGTSfWSQwTT69Yj/2teNQsqyKxoR7EWLkbjTgdmYhlqSU6ImgSfoCZkuKUkZeUTR2eDGEl+tmpzB0L8qy3nm1CTRdpI17cfH0yHlMThlMvkLQeKLTXxR5xuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1/ckkGwqYkDGXAjTDbpF/6Pgv+qdOrBIOvR1QO3vcU=;
 b=cBsjY6N1luM4SgoIoGChBZe8i/ppP4KqlCqdPhkHrdzZLvJf9ZuwR6lL8cBQvtTKHleCzSrxXRSZUrnUr7NGBNWD0OAmsOKYJL6TMfNr/pWX96pGeyBjuLOttfByn/O5cn1VVa3jnlYGn8muAKY863OtTTxYiEUWQzjRm4oz9ANtQEDqmATr9VwaHoVGur4qUxEr5/KrRQFKGcSHIqDqFIaX0cg1CbwyoqfwvqhJk2cH0wtRDJsFcvgy+e4KLvlmT3Fa+HyleZCDzlD4WBaOg0mDiPwQmtUAGPNJmbr5MiKKK0KfNe7cf0l1dAZCk+zLnOJ7gb4aFMnTebrONV0/OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1/ckkGwqYkDGXAjTDbpF/6Pgv+qdOrBIOvR1QO3vcU=;
 b=t0r6aYWsCMUubO9PgxTbBAZR49kRyYXsaMJjG6bI/H23OXxCh1SC/bRnG5hIkIMqiS9TNJSC000YkGFQUobdHlJroK9fNeA6YpE0SZQCYUfHQ5g0HfHIcORkTDLteJEuwvi/j9YlAnJRDiMRN5mvdDiPjL1VTCeIcMolqfd7ILk=
Received: from MN0PR12MB5953.namprd12.prod.outlook.com (2603:10b6:208:37c::15)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 14:17:45 +0000
Received: from MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::723a:4152:5bb0:3763]) by MN0PR12MB5953.namprd12.prod.outlook.com
 ([fe80::723a:4152:5bb0:3763%2]) with mapi id 15.20.6340.030; Thu, 4 May 2023
 14:17:45 +0000
From: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
To: Zong Li <zong.li@sifive.com>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] dmaengine: xilinx: enable on RISC-V platform
Thread-Topic: [PATCH] dmaengine: xilinx: enable on RISC-V platform
Thread-Index: AQM0nkIBn2SIbKxZ1sPr4cLSUSuz66yT6OPQ
Date: Thu, 4 May 2023 14:17:45 +0000
Message-ID:  <MN0PR12MB59536CEE65DBB0EF343650F4B76D9@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20230426074248.19336-1-zong.li@sifive.com>
In-Reply-To: <20230426074248.19336-1-zong.li@sifive.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB5953:EE_|MN6PR12MB8490:EE_
x-ms-office365-filtering-correlation-id: aa3776ca-368b-4f09-dbf4-08db4caa54db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NkTf7pLY1Ga05eeB+6yR6xn6vth+YCdfntoRkXuUNsqpjTf3Nz9VROMp+Sy6iclLZcgBj1PlfxLhLZ0feuJOFs8h/wQ36VrjrKz2LT6pOwnndhJzqWuKK5FpTknusku9oYke0dFJCMbRUzs3XEgPLxzaAxV+3yZLiBhM4P2NfKdHUlepzJz1CqOzFrRu7hQ3Lg6NV7xHDghxriAB9a3CgYi3xMnR8O5iMKQkyYByOVSjXfW5oyRP90aWSfW/DpxOxdfjHDFtgRoypOw+dAZpXx8f4IQr7NYY1GJ32ybF94pdLOQd7LNedETsJ+mjWEJrNifNIhYtEVcs4bjvmi/d8QZnPCmWw0asEXnlPZdtxAEHZRGtwFaB22PUPBy5BNJ3O9Q4i/2rbR1f7vyZ1sbLDCHy+kEWxyrGzrszfklKJ+TD7Abs46Pkv1HDTsJy6X8LaKUiMByRfufUuyWorxBwrg/Mr3LhbPk+1O3K3GuBEIBI2bBgc6MxMGJb0BpKc5XnfrBt71FXjoucKPmPMz1YPp9IbkKOYbebLvOeJgwLaRN1YdDNOCqPZEZEvx6Sp7XArCYptb3e8ilVncqX4LUuOEZTv805qPAaTZagOBorJVI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5953.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199021)(83380400001)(110136005)(2906002)(33656002)(478600001)(316002)(55016003)(5660300002)(8936002)(66446008)(41300700001)(8676002)(38070700005)(66946007)(66476007)(64756008)(66556008)(76116006)(52536014)(122000001)(38100700002)(86362001)(7696005)(71200400001)(186003)(9686003)(53546011)(6506007)(966005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?bCAk+6+o4/UzUsFmSFfpZ2LF9MfaEjcYFRZhAmBEJ1F6A/+yde2OHcqH0/Sx?=
 =?us-ascii?Q?exrRhTf+S58z3noq1kjulE0CtSYkiCm6rRIFrNokMvEw+WdjnOpOhj7S/2BT?=
 =?us-ascii?Q?YuE+mdrzmOW4Wg/OvlYs7+iCgeFnMQLyxLPfXrId4bM60p/RLuMwiRRDX3um?=
 =?us-ascii?Q?EvstBw/LOrJDYCtuJsZQwZNXmPvvYw+Oai90BYTg11Ro0pTfHhnssxKw9Eid?=
 =?us-ascii?Q?Rubu0oFaOrLMU0tK5vqnKNrueiOGohzbHcudJoEa7cMqSyd0Dmm9Iav+pMc/?=
 =?us-ascii?Q?d2ciOuZ06KyxGQ3ZLfxv+aAwLGULKnnH3pzweAsm4mXirSHxnzIWriirx6F9?=
 =?us-ascii?Q?TJ3qDtxXmZlT73AKANoEW3n2slbe+1hNQEubIGb0VzGhwo90qTsv7FDJuRHe?=
 =?us-ascii?Q?ObMpb61oBWEs7HuqH8IUVjyfKEktuwt2G3CzqT2TW4dFoJmTbhxc66xVEVki?=
 =?us-ascii?Q?Znm4UsimDHLmxOamGclFwSZ3Xn/40Mjzp+672qxXniwf6zYq6Tc0ZRkyO9u/?=
 =?us-ascii?Q?A7iL9sZG0wD+RokNLb4wYDmBCDQ+rMhwMyqytpML9rW87d3uL5/Aq56QTl+k?=
 =?us-ascii?Q?ZlMoLMK8Qz5OevX6VSO5CqkNRl26/luMsozMkeEU2sJ7ShjbFGnHzDRDk8Pn?=
 =?us-ascii?Q?wcI/goKMcsUoHr9I/grzOW83CdLfVFP09hsABvwmyG/XfP7iSSFHGkViWJ5k?=
 =?us-ascii?Q?Eysjek4pWE1/6H0uoYuUwcITN3rKZ0+9GB6tn3qWXWA0hcMnF8uTUpjdItud?=
 =?us-ascii?Q?CojFLgc8YdF51ruxHLYbAXOKVYXDSMwGvUf6OnUmLSveZ3ZmGj1tvazs+C0b?=
 =?us-ascii?Q?mp6dGF49yiB5YfryzqUqORXMznnD2DDFh593uE4hrg+JsOoR5LrXKZrZBBPY?=
 =?us-ascii?Q?PKT2NSZw5OeitPTIXAPZVbR1IkTlw4lK2y7K3w3Wv3nc5iQbvbtZ0IaJNhZZ?=
 =?us-ascii?Q?zUx7uHXEJ88R9juPqfbRRF1fahX3PzpW6hIIxdhyvPqP0akZrhM2zXpfKntx?=
 =?us-ascii?Q?knTHo1ihx+MNrNr3xWAU6TVp7MJElsFdDGZhrMTfzyyxRsCg8IIn1Ygw2C9f?=
 =?us-ascii?Q?pzHEvnCojCPndPMjtiitZ6GQXC8ZzFYTotMY/u/e1xE7WApRR58oaYRQ2/rp?=
 =?us-ascii?Q?xxbD9LcF7wNbXE/dhrvjcfkLTFU800IP6QGCoYG7yKntrNsS1E0u6AbtnoIJ?=
 =?us-ascii?Q?TNdeJI81tcEC0S6xQOj83ux/lexo8Byx0qpIeCJBFayZ0fBXK95xx45FmpRZ?=
 =?us-ascii?Q?XyLgVkBXlFj4EEfO8fWuvSZ6LXT3bln+oG623YBRx+SVbKQG2bEo0YckFFHl?=
 =?us-ascii?Q?+5sKNoZp+Jrv0KFmlNfcEgPcJJzlJg5gW5O/0ro93JAHxiCKsaPKQ/JPyUAs?=
 =?us-ascii?Q?eo3+Ef5RnukLhYc5YFaAGs9a6YqvKIvA1qT9SlYs3Ql8GphwAcWkmyqfTEj0?=
 =?us-ascii?Q?pFdu2YKveAt2W+ab4Km/LwyLEn3u+qk1ANnzPmbFYuhHZz/kMPiyDvmmidEN?=
 =?us-ascii?Q?m6j3sgfZ466I7Tn0Xr6/jUVPbWoBHVU3kY+Ckb1dKsSjkchO6R9F7tIA8XFz?=
 =?us-ascii?Q?eAsHwDP4BSn4EmhGk5sdAfrLgIn83VlhXaj+ITpR33EDtX8DO7TQMrIWGIi9?=
 =?us-ascii?Q?igtTlIJ+aHdKXEWFhIEqSaU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5953.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3776ca-368b-4f09-dbf4-08db4caa54db
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 14:17:45.4902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MGN9KWUfSRCM9EGfjFvMgRbxg0HRFKZkFg4qeLj9xMhwFfEs8HC5hbYnBn9wemON
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_071751_801587_1AF19525 
X-CRM114-Status: GOOD (  16.84  )
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
> From: linux-riscv <linux-riscv-bounces@lists.infradead.org> On Behalf Of
> Zong Li
> Sent: Wednesday, April 26, 2023 1:13 PM
> To: vkoul@kernel.org; dmaengine@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Cc: Zong Li <zong.li@sifive.com>
> Subject: [PATCH] dmaengine: xilinx: enable on RISC-V platform
> 
> Enable the xilinx dmaengine driver on RISC-V platform. We have verified the
> CDMA on RISC-V platform, enable this configuration to allow build on RISC-V.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/dma/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig index
> fb7073fc034f..816f619804b9 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -695,7 +695,7 @@ config XGENE_DMA
> 
>  config XILINX_DMA
>  	tristate "Xilinx AXI DMAS Engine"
> -	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64)
> +	depends on (ARCH_ZYNQ || MICROBLAZE || ARM64 || RISCV)

Instead of adding one more dependency I think we can cleanup this 
dependency list. Similar changes done in ethernet subsystem. Please 
have a look at below commits:

e8b6c54f6d57 net: xilinx: temac: Relax Kconfig dependencies
d7eaf962a90b net: axienet: In kconfig remove arch dependency for axi_emac

>  	select DMA_ENGINE
>  	help
>  	  Enable support for Xilinx AXI VDMA Soft IP.
> --
> 2.17.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
