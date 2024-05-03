Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E79C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VusaW5l9kXSVT4m6q3rAzUtvXozbK01V8EGXg+vK2k=; b=WBcsO8s8tDQAzd
	ouORTOsbH0bsP3uTCDXTDxW7tM4GqTeaTxb5JzMO0NVfEzoFB1x84VPg0YH404PHfVSK8shVV763w
	v5y8mF2yJOlG+fDknr5PZ7vG3iAi1h9T/G2AeHIlQADe7fuuyIZCkJ2/v/KVm9spP+z5JvCve0P+V
	N6Z+1tXEvlqvcWkow3kW9Yg06j1854IZ4XHUzhQNcMOc611IPkvGD8I55MrhnYppDPyQtwHn6Tfrp
	6VQ7ZKxtFKZxNtV39BAppSajSfY1q+momtvcN1GFwcYYjz4Yjn6NWBhoW6SP68ENBvznZGN0wzY0s
	vUuG1/7xMBReOMNJRuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rmL-0000000GNUA-2HyU;
	Fri, 03 May 2024 12:12:41 +0000
Received: from mail-dm6nam10olkn20819.outbound.protection.outlook.com ([2a01:111:f400:7e88::819] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2rmI-0000000GNTY-3Pz8
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 12:12:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdAX6736UVlI8GFLVYPy0bUUzw+HMYkggQhgwByQ39D8u2OGPkE6LeQSp9/YdUvI6IaWTr3K7RU9DQrW8bFjjI7CUjGGIEllnDllnN9WuxgG+2U3MbyN8DzaIS3o4HC8P6kQgWb9Q7tBu5iMPq4098mHnfa4cCSRRNgl22HIIKx6J1XklRTYXNmpoZiLreNtgaD7uxCSB0M3kgcE5Z9FKLVqjRc9v48AJb1bQekx2LOHf1YFKQ9dRAsNp8cscQw7bl8+5yfGiwID/bTEuhTPR0yXgh/0uy9v1gM6M0DaVKpoQLuL2Ks+ozboy2UqEpOgVNmlCZSDUzXfjesaHGGvnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEudfOAVb0NZU9TWajeluAN8FVjEjHclU/DmQ+mHQz8=;
 b=N1hSAC+7k7dT/RJWg8KDs9rU6Ek3en+ifmbFiJ+fMy3my/YxVv53BUc5cLgJyNA9sUXXOeEE36X2e79rSzUo1eC73P8HpZOf1eaqEy8p/aCYf8WGSfndYDAMh/tA3dke5FhKfzRCFKEejDn9u89Tq5Ev/Rk4WFlCE4FYYEexAGH8J1qxGccm+f2tMGH+sJPkOg8NG052IY1cLFK7/xWcfjt8yFpALUtRsmeVfoEyUN0EJT5oWWSPg/tXldozjANHnRfxEuBvcM6N9C+/7RT1aqcDRtlvlkGKdtRjR59mxNX63/SOhjoszuFBjv+GTBMwrnylN/U/tqFwLh5AzEB1BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEudfOAVb0NZU9TWajeluAN8FVjEjHclU/DmQ+mHQz8=;
 b=dAf1TBnphU2ZsSWtNt77f4TYDMBKMGXUUPrtjK9Ka3F1hk2LHviXewzoMjOHs0Emfg15KTjlDVar1LfTpjefG5KtFAep6+2UKmLQ3BsESZgoykJcgH30QmwNXzA3Q/nGprA4kVhB9AFI5+RIzANLiZtxV9HzEXKIPTYSMJv76+QDxXcjUVxqxZLbLoyC56J7dwRDtQ69m882Pm4FsV9co8TN0QXdzF/VSahsDFAmjlCpPC+HZsF9cHZjdD0P7EaXXdWhqjvpr6KRV/MlnMVsZEYTSDmXYt5mFoPLjM++3ww6gwPV5E6zQEDJKcNk8p51XdzXU8R+xQM4ye6RsSZL/g==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by SJ2PR20MB7062.namprd20.prod.outlook.com (2603:10b6:a03:568::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.33; Fri, 3 May
 2024 12:12:31 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7544.023; Fri, 3 May 2024
 12:12:31 +0000
Date: Fri, 3 May 2024 20:13:01 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add Sophgo SG2042 external
 hardware monitor support
Message-ID: <IA1PR20MB49535CF3617665EC8370F2E0BB1F2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49534B54403ECFB15D952A8BBB1F2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB49538E47932808E80B2DC781BB1F2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <cdad08fd-1162-471a-b060-d560f38e50f6@kernel.org>
Content-Disposition: inline
In-Reply-To: <cdad08fd-1162-471a-b060-d560f38e50f6@kernel.org>
X-TMN: [d1lzmvvFZh58vUQg2gzz8AB7rL01s3WpVG0ftq+vrRo=]
X-ClientProxiedBy: TYCP301CA0086.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::12) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <bvgzh2pkqxrbrqm6alumqymrfwpjtgd6at7tirywaohwwsvzzq@soeo22psugtv>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|SJ2PR20MB7062:EE_
X-MS-Office365-Filtering-Correlation-Id: bc461935-efc2-42fa-82c5-08dc6b6a4e99
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info: wiz7Q4J8B8H+zWALd02B+oY2fJKzCjFieubEyE0KB7r/FpaVs1ZDzmzg7iOF4rXc34CG+xDrUO85/HcJMOwXSEnYDBk1wL0BMG6ij+85pxFJqlU2U788o/PIGFvvpDqQ0r6kWVzdzUEBg9PlNe580I/7uY37W6Ew+mjyDpVmMTJDDcjwBCdZUZHji7uZkNr9PJ5pgi+jvPueG/dIQSpBi/JNpPZhD017vCPNfjDVdIWLkhnyaObqELOJNlzP1cEJsHs/w+2X0vHo0DHbGNu9rseDPi5dg3bq7Rw66SCLoOBDkBiGZBJc6mOWHGd0hniMhRUOJOwD9MyOMZzNKtqHsARM241sbxOwShHtffPR3E/Sgv7RptZCCL8lbtIpWCD7hDXugB0acYNxCw2CI0tZ5tmCSabd/FKVA6vNu91++ni29nSGxbGCipzWzvFiHXqt/sOPWN0V3iJxohsBgqtbGhAEd6RFhSryQ5knqmzWys3Q1WFuN5+dbG3AlB6wwHYJPG5jWGRo9XJSLe6ZWrsgkQb87vxCsXGavJPif/nFHlDtizK45ktCbLmT1AwjxqaESg8uQSgEtVlFpTNT2NIwKbe3MVKePP8O/xImA6cOimndAx6mj4atdmRQl2mo8SqI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QFhyfWbBKxLN3fcQtiFINTX1JzIUb/f9/LuFJmEVEgRSiqgsn5FdNmfJkEXR?=
 =?us-ascii?Q?I8/Jl63eWHZcgeqGuj2BPPlR+Y2WMOXA9DFPHaW9ylCl0RNvs1mgxpFXoiNx?=
 =?us-ascii?Q?Pb3I/QOJnXKY2BH/DotU/LusgharBMHTqEuFnpzd7aqy9vtgNSvxvDSfdeSh?=
 =?us-ascii?Q?HymlsVJwEWfVD/Q+wdmNB+T896DIlfE+wQMeeprIDl0n4tA+In4DHhP0S1MV?=
 =?us-ascii?Q?NS6/uSxFffA/mORue/lYhp2Gn4jHRESPo0UfowzjQTbeujGBx/QJPTUHThnZ?=
 =?us-ascii?Q?YoM9MlvhKX1PVEZm3kNJ0fbOP6i1VSFnZLbjCx2/z7h98TQ0DWlhhBfibVtK?=
 =?us-ascii?Q?os3iFdLdlL16PA8o8UiFNEXcdJnhymB1PbHn9OHV/+b17DJA6C4fc2KV68Co?=
 =?us-ascii?Q?dQW+UrYlcaFlQk6T82cI0rzQ0uGDSxp5xv22e16pmMVPFH4TrwcZ4vS6TXLw?=
 =?us-ascii?Q?h2vKzflfEI3Qda+5aKBIOiicb083E3dLuY8Qpj7FNv9vT3J9o/Cf38UyiwLr?=
 =?us-ascii?Q?NbYwpTT4qA9Cmx2NF+tTX3ZnTMwexW7cSi6wOMTn4DOM68UoYCMTxrI6YiTN?=
 =?us-ascii?Q?1z0KA+uNmZvVlCq6KpyA7uoqj0dfbeppUyP4nT8HpXYVdvGYl/S4pnfgn1aL?=
 =?us-ascii?Q?HHguyYPE/hgbjVOv7Zqq3PVsWoy8ENvSdtfzhiftRLCeYgGskn6eKrEwbc8e?=
 =?us-ascii?Q?sRisoavbqcKfKdPBYDw8i7/facNnfyDQCt68OPDUxn5d3ywSfGcNckA1oYzI?=
 =?us-ascii?Q?gXogcPSdw1bla0xGfHMs5tJaWEtNEW4vRdS0ql+eJ1fdrh7xDIN2zum5e82Z?=
 =?us-ascii?Q?Y2Z0LOiJ/scB9JaHpxt2gH1NzfAvldgOV0DPMo5bBUPi4zhA3LJCPsamvInw?=
 =?us-ascii?Q?67c6dRZ9ilda5eRr2WlOVGAvOITYV+hfbCEZ2uJbNmsAZU7WWch3M34aOI6I?=
 =?us-ascii?Q?WqOLj1F3KsRPchsPhX7DnzK9DiOlnfly45OLYfupoWrcxuovdoyemSvC+5vZ?=
 =?us-ascii?Q?57YRgaHWF9rYG/JfzxXrpS42BTrdX8/TMbzNVzvhuYX/mmpsjRTEHWl9ZKQo?=
 =?us-ascii?Q?zTN75C/kPGeuHqS6tJcrCwpTgrmZHcTGmLD/c0AaINQy/tSO0jZOKgE90KFk?=
 =?us-ascii?Q?hv3IkF2lhAMXDTrZercodLf2t+SGpTLwIMcBj4oc74XMV8Cy7QpDry4fK8CZ?=
 =?us-ascii?Q?At3sbGVnQCU4swRhzaM2bObArpCQKR4d+XoZ7sPGw4R5OX8D7vneGZEuKJMU?=
 =?us-ascii?Q?WeCSPmQl2aTZiTjI32L7?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc461935-efc2-42fa-82c5-08dc6b6a4e99
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2024 12:12:31.2923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR20MB7062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_051238_895711_CEB26CDA 
X-CRM114-Status: GOOD (  12.51  )
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

On Fri, May 03, 2024 at 09:09:30AM GMT, Krzysztof Kozlowski wrote:
> On 03/05/2024 04:20, Inochi Amaoto wrote:
> > Due to the design, Sophgo SG2042 use an external MCU to provide
> > hardware information, thermal information and reset control.
> > 
> > Add bindings for this monitor device.
> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#thermal-sensor-cells"
> > +
> > +allOf:
> > +  - $ref: ../thermal/thermal-sensor.yaml#
> 
> Where did you find such path? Please use full path instead, so
> /schemas/thermal.....

Thanks. I will change it.

> 
> > +
> > +additionalProperties: false
> 
> unevaluatedProperties: false instead (even though currently it does not
> matter).
> 

Thanks, I have checked json schema doc, using "unevaluatedProperties"
is more suitable.

> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
