Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCC1D1170E
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Dec 2025 16:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vth+lNiIh+IsosuvQLtBFRGf7r2e8n5GR374t2J1vVs=; b=l81g69I2Y2IUTi
	nljO8EvUFgMg9v1RlA5AY4/q+H2OyUhea3YkdI4V2glCtbLQpMrMaOqhIZqlvrGKuI2HEgUHniHRN
	2cemil38n06wajB8tG7QmPGnqhXkuBZK/oUA25QwYcFV3YglmTZ6sRbs5r/DllF7p0kN8mjREqyvR
	53eZklTzNA5Q7T6uTroV8PIIEs780xm7Cfzxw9bqbzLAuq69yyqHdEk2e/UZcy5Vcu/hN1EeuWdnb
	u4syQ8LAC+O5bkeZmLu4iCB4bjfNz/joGngwEfHpUu/93Z55nOv3rHh4Jtt4i/TOqOHpbnCrJae1T
	T7jgBpRh1WRVJAOl8DMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTN1-00000005cvV-49GU;
	Tue, 02 Dec 2025 16:36:55 +0000
Received: from mail-westeuropeazon11013053.outbound.protection.outlook.com ([52.101.72.53] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTMz-00000005cus-24EK
	for linux-riscv@lists.infradead.org;
	Tue, 02 Dec 2025 16:36:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGFKiO9GWo0T9BIVaV9wGvYODNzJnvMA+ga8zXpL6/rSRyoPhZbouCJv+ECj9JvCgor2+jP3VznC+y2cfkX4Siy80ApBAgvojgeLuaROeVazD4NqQWtH4SUFHEkLHr1PIaLTz7HZwf3RzrDorlGK8L+y2jmt1uvfQLO0E6fe0V7pbYBqVZIM/htHe2Ft8KgmW/pyErNOfaX3gStQ+BPWUUKG1EAofHODWXR1GQCEA4KNPW7eKCW5kLuBlv3gWKqZkIbkV1+ncHHmKYWYqNQgS7gy8DRNaKc699vmw9iCDURBl/Ne+tecKMZYgOqRzs9en5yUrT8aXzOtxTPk39XNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70k2T6mHIP3rL1FTpvweOixxD+d8C5Aw44lPH76GP1A=;
 b=bLzRpNIkbLeCFvbxLvaI3caB4is5B96NNMxkxMTlySK5VpvGelAOHVP9nko5rEuRQuEnpYuIOS0kxf3JZ4McoFGi58m/uGqHeyEXQOC5cmiKKobkSOfwRFikr3lNsxLxbnM5JCAjS32SNlvHUW2Qq1f6xgl5M6fnIRyN7tNeDd1YWFep0BZKdpZVnT4D7LRYGrMr7Zy5DBiR3UQaepsZKgwg+HB6B5+UFcCKIVvzHV0wp3yy9VMKoItyBepNpCEYtrsRI+k3o+DVd2nCnoRc1lPnbZxOrHl0hcdcWN2Mqf4MEJub1+3OOdO3psx61PZhLlV9QjWML0srao9XAQJMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70k2T6mHIP3rL1FTpvweOixxD+d8C5Aw44lPH76GP1A=;
 b=nFoJFL2lbm3zkp5I+aWTG2HH7VvMpdpLD+6XaqRQaVCt3/bmtmxsQjarqkaWJsvoss9O2npqKzCIU/VT5PBv0Irl2YgJ0XfLufHo1Hq2goolZ6TnLJjhq4jfwp6NHMoPTDNSIo9k6EJBH1y7GrJpwKZCKnShH8VHfHWv8EspU7jaaXPptmeiUNrtsqG6O3/WP2vIQDXKv4C7ifRjxCm411tFmAZR++YBHNU7iObv88wRwFhf/YbSZX6VwNUGDwgHJqBgZirkRtbqa8ixegvTjY0pk+HQHaZLeyuKKSjaObXeytrRSkKfn4RO4tN5XODh15bwMo8nslKJWSlkdix61w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by DB9PR04MB11534.eurprd04.prod.outlook.com (2603:10a6:10:5df::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 16:36:45 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 16:36:45 +0000
Date: Tue, 2 Dec 2025 18:36:41 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, 
	Marc Zyngier <maz@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
X-ClientProxiedBy: AS4PR09CA0030.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::20) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|DB9PR04MB11534:EE_
X-MS-Office365-Filtering-Correlation-Id: d11a68d8-791a-447a-e147-08de31c0fb86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|19092799006|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJ1Qzl1STcwOUNldjdUMjQ0bzU4b0tHWGM2S3dlNUtqcGovV0Y4NzVUdE80?=
 =?utf-8?B?M01EWHh0SjZnYlNhWmZkcWs3MG5VNUZFb3ZrUDJWK3VzR3dENVcwdm1KQnRm?=
 =?utf-8?B?cEZwNVdMbDBhTk5VUDVMcUNaTVM1QmhFbTkybDZJUzVjSEw2bmpuTHpuRTVl?=
 =?utf-8?B?NEM3WEJEelF2ZUZtclZ0dmJXNkNZRnZrUVJiYUVNUS84dEIwaGxnY2ZCbW9N?=
 =?utf-8?B?eHJhUHlpeDFIVGtROVdhNFFCNDBXK0c4Y001Witqb2FEMFNkMWc4VnRhSSty?=
 =?utf-8?B?WGVCOUJZMFU0UmVUL2tZYnEvT2N5Q2ZwRVVyWld0bzcvek1lUVJreDZKcDlJ?=
 =?utf-8?B?WWZCbDVBTlBxblhaUkdEU1FFOExETXppbzBTQUU1bDhzUzhCaysyWHJVaXBC?=
 =?utf-8?B?QkppdXJVOGdxWVRjVTN2NHlZOXBGZkNQZzYzcUd5OXVpSGZ1QXpaM1J4SU9O?=
 =?utf-8?B?aWxpTTkvYzR5V1BDL01IcDdvV2xhakhjZHl5eGpsWXZJRGJDMWZiQmxXVmZG?=
 =?utf-8?B?U3RLdG9RU0JsbzdXYjVDUjlaVFdmVlRwd0hjRnlIUjE0V1dvUlo3TTZyWEZK?=
 =?utf-8?B?ME9uNzlhUmIvSElZb2lkTFVNY2g0NFNVeklRbEs4YkpVRExNMzJjU3RMK01v?=
 =?utf-8?B?cFZRa25Jd2ZNNEM0TXVGQURudS8wZENYLzhnRVpIZXZvU2piWmxlL3NQSXE0?=
 =?utf-8?B?L0g5OGJYOGhSeGVoRHR2QUpFdHlpdDF0TlVIS29ZQXJxb3dPelpaYWl3SUxi?=
 =?utf-8?B?cisySmZ1elZUc1A3WmN2UVFqdnh1Zmo3YW1STHRZY09RcnlLdWpoTk5GdHF4?=
 =?utf-8?B?Ym9hbWg5WGZiWGdpT2VCNXhnNjZlUkFIRHdXWUwvaytCWW5QRTE0bjdlNGlu?=
 =?utf-8?B?d3U1ZnVUSTN3R1NyeEFrelNuWDBPZHNRVWoxbkxZK0d5SGN0cGJWWHgyWTUv?=
 =?utf-8?B?UDhVVkFHRkNJckJ2S3ZRSTh2WVhNN3pHUDh5ZWxHMVJEeWd4WFNPaWRROXl6?=
 =?utf-8?B?R0Q5KzM0ZWQ5Rko2V09BTWJvNHBhSzkxd2k1NGhQYUVud01kSWZ4cG9JSDNr?=
 =?utf-8?B?SVZ1OGlQVmtkNkxxcnRmOHZnR1R4SExVbGlXWkRmNjFaZThuZE83aVNDYjUy?=
 =?utf-8?B?QmIvYnlBdERjbnpNQzFDaEt0bUpsU2x6bGJvbko0WHlCcFYrUy9xY0tSTlZw?=
 =?utf-8?B?RmJHcm95YlpDR2dNeHNQSkFEZjRoZlg4VUhWVFU2U2VOMmV3MmxBdExYUW1i?=
 =?utf-8?B?bWY5bDk4c04wdlJ6SG5OVnVOZUxwZ1VLMld5enJWSVVYR2pyYlc0YW8ycWYw?=
 =?utf-8?B?NlM1bUc0RURWOG5uUWRGalFqSjZlKzFQN2NPNDZJOFRPR3lMWncxY3NGVFR2?=
 =?utf-8?B?NVJWOFZtK21SaTRiOWZ0b1RWZ2gxTkFBYUdrMWFOS0tudkg0Rkk4T1lUckpu?=
 =?utf-8?B?Vk83TlpXVXBrL1AzdWtGUHBaOUEyemVZRUZwNDVSN0JMSGI1My90aEIzaEVM?=
 =?utf-8?B?VVVONmZFUHMrcTBhY09UNzR5d0RXU0ZFbW1kYzN5VkMvNU5rMDBaTCtNUGpN?=
 =?utf-8?B?c1YyS1g5bERvaVJtQ3lzZ3d3azZZRythY2UveENmRnBzVjByM2NOdWJJL0px?=
 =?utf-8?B?aVljMGR1ajExbFpDYmtJeHppWEJJRzkxQWJFNWkzcmRPWVRvYWxlSkJlRnhm?=
 =?utf-8?B?cm9pZjNlRWFaeXYyVlJLZG9mMjBBZmo3QVpjRzNXZnZzQ1NzNFNjQkpRSVpF?=
 =?utf-8?B?ZmxIMGQxTU5DUURja05UUUIwU1lnc2htZnVRbjU5NE5OSDVmeFNSakJMZ1VG?=
 =?utf-8?B?NEpDaFJZUVc1bUhra2k1U3doeHdXK2NQNDh1eUlScjV2SDRLSlI2eVN4M1JY?=
 =?utf-8?B?Q1ZPTmowZlhsVUg0MTV3YXM5RVdDM203VW9yM2pSdlkwVUFURXlaZU9ncTkr?=
 =?utf-8?B?bTFmQ3VMZGVmZlNlQW1NQnJqVTQvZFNGb09jT2NER1o5STlPSy9nNk5hSmNo?=
 =?utf-8?B?WkpYR29hSXdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXBWVC9XSU5pQ1hDSHRadHJoanJ6MmtWcGc2UnFyMkIrS01Xc2RKU28yMUNB?=
 =?utf-8?B?Z0ppQXRreDRPbC9CWkZTWkEwT01DQis5SUtZY3JOdkJvUlN4OXdMVlpWRWZq?=
 =?utf-8?B?OThMbFB0T1JEbFFndE9GekdrYXhua09pR0lZTGlBUTdudHozaU15ZFJ6cTRm?=
 =?utf-8?B?Q1FOVVdTdU1KclVkRkkvSnNHcVF2Vm9BMGpZVm1FdnRHVVVOWkw3WVhoeU53?=
 =?utf-8?B?Q2RiUzMrUkRONGxucnZBeHFDczlJYU1zYjZYK2RZNDB1RTRQbHZJa082Y0pG?=
 =?utf-8?B?bmNCSlp5UlQvYXY0SmI2M0VxZ1J6SWx0SmpQMFc5czZVWGhrTFVrWFlLcEZz?=
 =?utf-8?B?cVAzSWtFaHVVZm0vcTRLSERxbnpnendCS2RXSEZmVENMditHYzdoV2lyOFVm?=
 =?utf-8?B?ZEJ5UmZrdDFlMlRBZFNoeDBCVWFra2trT1hTUHI5MlN6TldVRERFMjNHQVRt?=
 =?utf-8?B?Y1Rlam1Kd0tnMzk1ckJDcXRXblduRnJ6aGtMa0wvVmYra2VaSThzbVRGUjJ0?=
 =?utf-8?B?dFNEK3U1Zjg2ejd3OVZIa0VmM3Rlc2tqMUNkV3RJVit6OEMxL3JLalhiMEow?=
 =?utf-8?B?emtYMlBaOS9RMFp0dnIxa3BoaFlqS2Z6SHJuNUZGYjBJemdTelJpTXNtR3Jy?=
 =?utf-8?B?K1plTlhQK1VlSDlIUXcxUkxJb3hKZlR6cHdsWnlEclhFRmkvbUtGdmFCcHpj?=
 =?utf-8?B?U1p6K0k3Z1FlMVU5ZnYzU2Y0VlFOd1VOMEZRNHp4cTVmckR6SklqR21UcVNz?=
 =?utf-8?B?QXZTMFBHQ3RFSmJsbDRnSkhzN2pRZlZFdUxVeVpzUk9ZWmgzZWExN0lNQ3Ax?=
 =?utf-8?B?M1cyanIzNGZ3UmJ6MEhZMlFsT3NDdXVCQUNyRXNTb0JtNHZMRWRKWk43eERK?=
 =?utf-8?B?VFQzSXpQdWQycysxSnQvQ3JhRGJITTZTaUNibGNpSTRaTmRIT0ttSCtGb3Ey?=
 =?utf-8?B?cWRsWEpoZGxXNTV1cmN2MUQyODM4TFU2c1o2R3UvY2g2a0NiMjRRdUE3K000?=
 =?utf-8?B?eWVTVmtwaWVYcWFsWTRaV25saWpYaGdXazJMRnBnZG9MSTJlaytXcEtvdDlY?=
 =?utf-8?B?L01iLzNYNmpXd004bnZkcll3WXlybWJVRkVkRU5qRUZsbU1OL3o0WGJMMWhX?=
 =?utf-8?B?L051eU1CV2JuM2M4aUJrNnJNUklpa0puMU42UHlBd0krQ2xXcm5rV2QwcjNu?=
 =?utf-8?B?U1V0N2xaYkpNU2lmNXJmd21Qak1ZaXQ2YXdoUkxyUjZOZDFJSlY1UjEzbWh0?=
 =?utf-8?B?V2poVUtHd3E1a3B5YmlrSVVUdUM0VGRENklIVktzRGRORzBZK3BzWnJTbmtI?=
 =?utf-8?B?QmRaUTF2WjdoSVNveThtVHhrOE5NUWFBY2ZmRFNpV3BCZzB6VzhTZE14T1cw?=
 =?utf-8?B?WE0rei9UendhOTUzQmpBeE9DRC8rTUt1SEE1N2lXamcydDFKdFI3KzVQYkNk?=
 =?utf-8?B?YWJ3N2NpVTRYclJsblVRbzFDUGJTRTNBMUQrYmxhTm1JOEFqeWFXWEtDek8z?=
 =?utf-8?B?S2g4ckdEdG0vNm1LYnNQcmxid3NHU1BjK21XOUJSeVFieUFQeGE5SEJHYW11?=
 =?utf-8?B?eFczdFJLamlKVzhFUEVvVjdEQnYxaU1xbmwzZUIrQ2V4YkRwZUlMZHdPeTFk?=
 =?utf-8?B?NzZ1dmVHNTVIYk16S2d5b2wwTmczNTdRSWhhOC9IbVp5RmFUYVFmZzViaUY1?=
 =?utf-8?B?eSs3Y2VxMm52WFhlN2tlRjNudzljQlArZ2NoL1R5eXc0TEVFV1c3Z1VsVzlF?=
 =?utf-8?B?eSttZkVlbW1wU2k0dU1KcXhmL2lNOUxrMkJTWXBzT2RvR2ZaRjdJZUVlYitz?=
 =?utf-8?B?RHExWDZrMkhxMkwvNXNhK2IzTmEvTHI4VktSekJKbU8zRXNxbXVleFlyc2Vk?=
 =?utf-8?B?ajh5QjR6SHZoVG9TcGVoeU5nVFpBV0x1M0JkNFlBQnptSSswSlBlY1NWWGNF?=
 =?utf-8?B?cGQvTWkycndUV2ErZUtvbUNOMWQvdldQdEhGaFROSmVHRjlLRWIrMUhrMkdE?=
 =?utf-8?B?SmNycWN6YlVSRENXQnRDdkcwNlJCRjVBRjRkS3ZPVk5DTjNxM3haU3Yrb1dT?=
 =?utf-8?B?YUtCOHZTTUhISis1Q3BhclNRcUphNVFhc3BLVmtlVkJ1NHZRSGlSS2VsZXVJ?=
 =?utf-8?Q?tTbZaR2xVT7gA28ukowRScjuY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11a68d8-791a-447a-e147-08de31c0fb86
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:36:45.8121
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6CnPdcagZhQt/Dq3KN1VtBnpVlRUxmm5ZQ1ZxtlJk2QsYSwNgofOGB1k3c0Ee0R47n4cypN88oky7b/NhmYlLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11534
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_083653_556939_C2D19F4F 
X-CRM114-Status: GOOD (  37.64  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMDEsIDIwMjUgYXQgMDY6MDk6MTlBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gRnJpLCBOb3YgMjgsIDIwMjUgYXQgMTA6NDPigK9BTSBJb2FuYSBDaW9ybmVpIDxp
b2FuYS5jaW9ybmVpQG54cC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTm92IDE0LCAyMDI1
IGF0IDExOjQ3OjU0QU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gVGhl
IERldmljZXRyZWUgU3BlY2lmaWNhdGlvbiBzdGF0ZXM6Cj4gPiA+Cj4gPiA+ICAgICBUaGUgcm9v
dCBvZiB0aGUgaW50ZXJydXB0IHRyZWUgaXMgZGV0ZXJtaW5lZCB3aGVuIHRyYXZlcnNhbCBvZiB0
aGUKPiA+ID4gICAgIGludGVycnVwdCB0cmVlIHJlYWNoZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xs
ZXIgbm9kZSB3aXRob3V0IGFuCj4gPiA+ICAgICBpbnRlcnJ1cHRzIHByb3BlcnR5IGFuZCB0aHVz
IG5vIGV4cGxpY2l0IGludGVycnVwdCBwYXJlbnQuCj4gPiA+Cj4gPiA+IEhvd2V2ZXIsIG9mX2ly
cV9pbml0KCkgZ3JhdHVpdG91c2x5IGFzc3VtZXMgdGhhdCBhIG5vZGUgd2l0aG91dAo+ID4gPiBp
bnRlcnJ1cHRzIGhhcyBhbiBhY3R1YWwgaW50ZXJydXB0IHBhcmVudCBpZiBpdCBmaW5kcyBhbgo+
ID4gPiBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGhpZ2hlciB1cCBpbiB0aGUgZGV2aWNlIHRy
ZWUuICBIZW5jZSB3aGVuIHN1Y2gKPiA+ID4gYSBwcm9wZXJ0eSBpcyBwcmVzZW50IChlLmcuIGlu
IHRoZSByb290IG5vZGUpLCB0aGUgcm9vdCBpbnRlcnJ1cHQKPiA+ID4gY29udHJvbGxlciBtYXkg
bm90IGJlIGRldGVjdGVkIGFzIHN1Y2gsIGNhdXNpbmcgYSBwYW5pYzoKPiA+ID4KPiA+ID4gICAg
IE9GOiBvZl9pcnFfaW5pdDogY2hpbGRyZW4gcmVtYWluLCBidXQgbm8gcGFyZW50cwo+ID4gPiAg
ICAgS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IE5vIGludGVycnVwdCBjb250cm9sbGVyIGZv
dW5kLgo+ID4gPgo+ID4gPiBDb21taXQgZTkxMDMzNjIxZDU2ZTA1NSAoIm9mL2lycTogVXNlIGlu
dGVycnVwdHMtZXh0ZW5kZWQgdG8gZmluZAo+ID4gPiBwYXJlbnQiKSBhbHJlYWR5IGZpeGVkIGEg
Zmlyc3QgcGFydCwgYnkgY2hlY2tpbmcgZm9yIHRoZSBwcmVzZW5jZSBvZiBhbgo+ID4gPiBpbnRl
cnJ1cHRzLWV4dGVuZGVkIHByb3BlcnR5LiAgRml4IHRoZSBzZWNvbmQgcGFydCBieSBvbmx5IGNh
bGxpbmcKPiA+ID4gb2ZfaXJxX2ZpbmRfcGFyZW50KCkgd2hlbiBhbiBpbnRlcnJ1cHRzIHByb3Bl
cnR5IGlzIHByZXNlbnQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPiA+IHYyOgo+ID4gPiAgIC0gU3BsaXQg
b2ZmIGZyb20gc2VyaWVzICJbUEFUQ0gvUkZDIDAvMl0gb2YvaXJxOiBGaXggcm9vdCBpbnRlcnJ1
cHQKPiA+ID4gICAgIGNvbnRyb2xsZXIgaGFuZGxpbmciWzFdIHRvIHJlbGF4IGRlcGVuZGVuY2ll
cywKPiA+ID4gICAtIERyb3AgUkZDLgo+ID4gPgo+ID4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsL2NvdmVyLjE3NTk0ODU2NjguZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlCj4g
PiA+IC0tLQo+ID4gPiAgZHJpdmVycy9vZi9pcnEuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9vZi9pcnEuYyBiL2RyaXZlcnMvb2YvaXJxLmMKPiA+ID4gaW5kZXggYjE3NGVj
Mjk2NDg5NTVjNi4uNWNiMWNhODljMWQ4NzI1ZCAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9v
Zi9pcnEuYwo+ID4gPiArKysgYi9kcml2ZXJzL29mL2lycS5jCj4gPiA+IEBAIC02MTMsNyArNjEz
LDcgQEAgdm9pZCBfX2luaXQgb2ZfaXJxX2luaXQoY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAq
bWF0Y2hlcykKPiA+ID4gICAgICAgICAgICAgICAgKiBhcmUgdGhlIHNhbWUgZGlzdGFuY2UgYXdh
eSBmcm9tIHRoZSByb290IGlycSBjb250cm9sbGVyLgo+ID4gPiAgICAgICAgICAgICAgICAqLwo+
ID4gPiAgICAgICAgICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9wYXJzZV9waGFu
ZGxlKG5wLCAiaW50ZXJydXB0cy1leHRlbmRlZCIsIDApOwo+ID4gPiAtICAgICAgICAgICAgIGlm
ICghZGVzYy0+aW50ZXJydXB0X3BhcmVudCkKPiA+ID4gKyAgICAgICAgICAgICBpZiAoIWRlc2Mt
PmludGVycnVwdF9wYXJlbnQgJiYgb2ZfcHJvcGVydHlfcHJlc2VudChucCwgImludGVycnVwdHMi
KSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBv
Zl9pcnFfZmluZF9wYXJlbnQobnApOwo+ID4gPiAgICAgICAgICAgICAgIGlmIChkZXNjLT5pbnRl
cnJ1cHRfcGFyZW50ID09IG5wKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBvZl9ub2Rl
X3B1dChkZXNjLT5pbnRlcnJ1cHRfcGFyZW50KTsKPiA+ID4gLS0KPiA+ID4gMi40My4wCj4gPiA+
Cj4gPiA+Cj4gPgo+ID4gVGhpcyBjaGFuZ2UgaXJxLWxzLWV4dGlycSBhbmQgY29tbWl0IDZiYTUx
YjdiMzRjYSAoIm9mL2lycTogSGFuZGxlCj4gPiBleHBsaWNpdCBpbnRlcnJ1cHQgcGFyZW50Iikg
ZG9lcyBub3QgaGVscCB3aXRoIHRoZSBpc3N1ZS4KPiA+Cj4gPiBUaGlzIGlzIGhvdyB0aGUgRFQg
bm9kZSBpbiBseDIxNjBhLmR0c2kgbG9va3MgbGlrZToKPiAKPiBscy1leHRpcnEgc3RyaWtlcyBh
Z2FpbiEKPiAKPiBJIHRoaW5rIHNvbWV0aGluZyBsaWtlIHRoaXMgc2hvdWxkIGZpeCBpdDoKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9pcnEuYyBiL2RyaXZlcnMvb2YvaXJxLmMKPiBpbmRl
eCAyMjcxMTEwYjVmN2MuLmMwNmM3NGFlZjgwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL29mL2ly
cS5jCj4gKysrIGIvZHJpdmVycy9vZi9pcnEuYwo+IEBAIC01OTMsNyArNTkzLDggQEAgdm9pZCBf
X2luaXQgb2ZfaXJxX2luaXQoY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2hlcykKPiAg
ICAgICAgICAgICAgICAgICogYXJlIHRoZSBzYW1lIGRpc3RhbmNlIGF3YXkgZnJvbSB0aGUgcm9v
dCBpcnEgY29udHJvbGxlci4KPiAgICAgICAgICAgICAgICAgICovCj4gICAgICAgICAgICAgICAg
IGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9wYXJzZV9waGFuZGxlKG5wLAo+ICJpbnRlcnJ1
cHRzLWV4dGVuZGVkIiwgMCk7Cj4gLSAgICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0
X3BhcmVudCAmJiBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLAo+ICJpbnRlcnJ1cHRzIikpCj4gKyAg
ICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0X3BhcmVudCAmJgo+ICsgICAgICAgICAg
ICAgICAgICAgKG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1cHRzIikgfHwKPiBvZl9w
cm9wZXJ0eV9wcmVzZW50KG5wLCAiaW50ZXJydXB0LW1hcCIpKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9pcnFfZmluZF9wYXJlbnQobnApOwo+
ICAgICAgICAgICAgICAgICBlbHNlIGlmICghZGVzYy0+aW50ZXJydXB0X3BhcmVudCkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ID0gb2ZfcGFyc2VfcGhh
bmRsZShucCwKPiAiaW50ZXJydXB0LXBhcmVudCIsIDApOwo+IAo+IAo+IEJ1dCByZWFsbHksIGF0
IHNvbWUgcG9pbnQgaXQgc2hvdWxkIGJlIGNvbnZlcnRlZCB0byBhIHByb3BlciBkcml2ZXIgYXMK
PiB0aGVyZSdzIG5vIHJlYXNvbiBleHRpcnEgbmVlZHMgdG8gYmUgaW5pdGlhbGl6ZWQgZWFybHku
Cj4KCkkganVzdCB0cmllZCBjb252ZXJ0aW5nIGxzLWV4dGlycSB0byBhIHByb3BlciBwbGF0Zm9y
bSBkcml2ZXIgYW5kIGl0J3MKcHJldHR5IHN0cmFpZ2h0Zm9yd2FyZC4gVGhlIHByb2JsZW0gaXMg
Z2V0dGluZyB0aGF0IGRyaXZlciB0byBwcm9iZSBvbgp0aGUgbHMtZXh0aXJxIGR0IG5vZGUgc2lu
Y2Ugb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSBpcyBub3QgY2FsbGVkIG9uIGl0cwpwYXJlbnQgbm9k
ZS4KCkkgd291bGQgYXZvaWQgY2hhbmdpbmcgdGhlIERUIGFuZCBhZGRpbmcgYSAic2ltcGxlLWJ1
cyIgY29tcGF0aWJsZSB0bwp0aGUgcGFyZW50IG5vZGVzLiBUaGUgb3RoZXIgb3B0aW9uIGlzIHRv
IGFkZCBhbm90aGVyIHNpbXBsZSBkcml2ZXIgd2hpY2gKanVzdCBjYWxscyBvZl9wbGF0Zm9ybV9w
b3B1bGF0ZSgpIGZvciBhbGwgY29tcGF0aWJsZSBzdHJpbmdzIGRlZmluZWQgaW4KZnNsLGxheWVy
c2NhcGUtc2NmZy55YW1sLgoKSW9hbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
