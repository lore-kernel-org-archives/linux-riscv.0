Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC25C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 09:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHMa8w641B+T1rBPQUkmn7AisCNs55b2pS34ogIuzgU=; b=ubzbblHhcbEyy6
	YbrkgWhROhmaHCf6b3kjQpVKAsTzUaPQA21QNMad+uXOHwKXMEiYdSivBmUHWCZ9MIDlrrjBUwGcy
	6aHF3/FV3OSqzrnuUOXGFBTRVwqPQvI74lzeK4tPY60theCdDDaqhD7AejPeBTu2coDlmRUKfjNvg
	W7LAG3EOKCq/YaU9UQ2NAmwGFOH8OTp093Rwlc4f1ef7cQm9t0XXiujXp86iRn5Ip2M6iEgKagLmT
	TpJGln6zsloJmMD73jTxq3zW3gnr2pp2hhd3503ZwH/7Tr+HM0t4kJgo7XIIOzGn5fbKMIXxY72Vc
	xAzNMkC66jR2UeXKqB1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYMow-0000000AjCU-0Wim;
	Mon, 29 Jul 2024 09:37:34 +0000
Received: from mail-dm6nam12olkn20800.outbound.protection.outlook.com ([2a01:111:f403:2c17::800] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYMot-0000000AjB5-0gmO
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 09:37:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dneN8tHjDN22Y4PkW5SQHSdKq6K2W71/UvhRE7yzN7CTXBNaJe10UJspzUkaaqLsdKcjUM3wpIX+xRmMfkB+mPzjPZJs9SMT0+4Mw9pIWT2/WwHi4k6XIOzYWlnmjS+qwcXknildcrYXpqP8Z3dU5LP7Fp0FpZ7+Vc1a1qDdeGWj0XQuX0qEkdF2MuhpUZ/bq1/E+MtVaSdZRpl6dcOs6LAroHUaj0/vLCMjl1VfjUFJHhEc4z1Ns528N2YeFdY/OCnEV/52BldbZtN3bDJz2Vazd+QSgBwlOosFs/2p0bOsUDuwpXt1RgRiDCLZtyBjYcllVip/HkLlSc9FlNQeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7uuD7H5Z0wxuRl7qyJxLb4n5Fjdv49obW8QICZAP9I=;
 b=k5A+FbMFlQoifIuJtwozess0zPPHF5xX/i8Xdo/LSpnoufbGbyxU6ClaxYDPyWTQZ857lsodxeXCvXoP5ELPV9qjZHHlw4nrleFVd9f1YBQbpxFuf0gshtQSUKq/JStn4plzSfrUzscrAGquoefn+6a2uVwuOLlNSgqfm7YuUWPh77x6XAkNIPisJRwM0xTBzLgoc9Nb9zNSfHj83+uu+rZD9Rxka7CpakJzzLNsUGYJ+qY28tpcCJ1psPaIiOsqsojAaAhh0l+q8aiXT0a34/ZI71mP+Buyu+Jehq73ijmtQoCBBY3R8W9fUW/HZJXG6TlSAym1z1uhS8FgLFGicQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7uuD7H5Z0wxuRl7qyJxLb4n5Fjdv49obW8QICZAP9I=;
 b=oBpHymHfgJdkha0X//IS3JBc8ZRLICipOxWJePFmbi1KloZS0xzDYQZNwQQ/MT5antyWHbIpTDUsuii/Of+Rja15dXRAeoQsaZts2vil1avSstWDBGDzUiF2aIu/vWPdqgTabgeOtJp0VHwiaDKbp07PWdoH0WzZz9KD109SKo78CIRXk04AIZRNinU6OFAj7NJexgIOevYzsfNPN6QvNm44HqB0yoi1yGUPEe0ISp4/i5XknCY1SP6eA9MkAi4HkwvOT8ZYuXcE5rsqI0tJt3qBwRQX9FyDxoUIOQjKDWzgDEmtHzyl9ga20ILBU/VGsLUI/xxOLmRY6hTC9r9RuQ==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by PH7PR20MB5057.namprd20.prod.outlook.com (2603:10b6:510:1f3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 09:37:24 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 09:37:23 +0000
Date: Mon, 29 Jul 2024 17:36:56 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Inochi Amaoto <inochiama@outlook.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Liu Gui <kenneth.liu@sophgo.com>, linux-riscv@lists.infradead.org, 
	Chen Wang <unicorn_wang@outlook.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v8 RESEND 1/3] dt-bindings: dmaengine: Add dma
 multiplexer for CV18XX/SG200X series SoC
Message-ID: <IA1PR20MB4953E8436095217610B333E2BBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535EC188F8EE3F8FD0B68DBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953865775FA926B2BA4580CBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <172223050278.2763977.11180028101195359000.robh@kernel.org>
 <IA1PR20MB4953E3AEACAC85765AE9442BBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <2e4b504c-6413-42fc-a544-472d4cc1a06b@linaro.org>
Content-Disposition: inline
In-Reply-To: <2e4b504c-6413-42fc-a544-472d4cc1a06b@linaro.org>
X-TMN: [sb0JTKb2GpaXOw6sdtoW5fV5M4dt6ekqKXx/BJUFAak=]
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <3ii4xqzzniqkwiwlycscikjv57de6kc7zaksr6yvqvm3ht6k77@nfsmknvmfzsy>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|PH7PR20MB5057:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d13113-89d9-4f40-48f6-08dcafb20c81
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799003|5072599006|8060799006|461199028|1602099012|440099028|4302099013|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info: Q7sxwQgtj7fVmgknjbj7xDtPj4KDVe3S8qTUgMcV5IVpKfCqlC10eCDaclwHdmOrQLwW5NntEzzWKk+2um53ISIZ8NUO4HQ4fYPCcCB4XpAF3+JgnZHck5ELy2RB1Ohf9UKELVxrYrfjNnkGKJzzXxfwv8x1zgJIPq52bODIIevpiHKOM/0DRZiNIFahbFe+7etnoFR23w0AIMmXsFbcwNSGwQh+qerrZtq6Ps4BTfpNnRKJtE4BLWUDN3jyrjU52LdYt9WsCvI2978gWvRKs+vZvKJu5200DLf/pr7MlXRPaTHh0pLnTbwEwuC+VMXAELJgQyFFGlHbnAwNIpICzmUTRMU9FVXylDfFbbNuiDC3WJAl+QjsuggOKHTXIJxPsk3Netqxb8UFp7uDpglvG5UqRMvUg2t3PNpcoAI0QCm6jGMnagA9/zPdk8a+ETJMdBETurdrJtRQZDiORup4ZkcLOdhPaTfNw8otg72QN2HvZpzC++zPDkvX5eGmiL5QTJsN0cDZM2fAlCfiqzqCniFw3V1IrQgz2hyaWuhpiW0L79oT/Mn9N1/sLTYVPHW9ofhy1/imq5Zy+ZUco86PiF4XONAqKbJaNksShNnBuYa/0PiYAq4JrSU5yTkcdBxGVVkRDDfomyXw9lwx47hjL+GaecW6cgqcUgYbaGTjWaS5J2+isOikwLZs9IOODTAkL7G3aO3uV665vOD6htRpiGv91Alpn26INqoa0v2QWO0GG+r/Wq/hu4ovvprHS0ApcHgJH2UVjXOzF/mJWayeWXAu7U8eOAhT/lb2483FWV9B+71Wqpj7YxGHZpznx7J4
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Gxafybrm1Iv2pprayFHi3ZZ6fEUo9yZ1lM1TKadBx8j8jhYjFpOgeNW8acn5?=
 =?us-ascii?Q?+d+pFJE2tNs3U1s7WEByblNCBbhYcHSEElS6XcHHejPwekoxOztbPl67ONKS?=
 =?us-ascii?Q?JJOu4KAkpsW5rLGeaRrDy8K5jrTw8RQbMa9nUytBa/6kII7/ciW5mjYS4oZY?=
 =?us-ascii?Q?45ZObDf4VH6zIpNbB6AvSssrPJExHGOgoTpeiVlMh/tagZXO531lchJfVunR?=
 =?us-ascii?Q?1sKPnswr22biuF0WiIHR0erfSyzwahzQ4meGfvXZ9Vm9RDzfiz3YyBclyUMt?=
 =?us-ascii?Q?zeExyi9anjjlNsb0XJ8mcJeUACFpcpoZl5qC5r52K/Qkmyc4SD3ZMVCyt0Qy?=
 =?us-ascii?Q?LIZV/YEmTC/lmSJ2UhZ0hJqaz7Wv1+PLSdbigPcTjDnCLTObw18TajQm8Fdg?=
 =?us-ascii?Q?ntZzngUZN76yyBmO9gwO4KwJx1OqUCuwTroOjURpfaGUTkXtqZz4DKGbX15C?=
 =?us-ascii?Q?U7jwVV/dTdp46ZXhCavHQHmgJfkyqFegSh/XEy+jP92ld9QNB66ogxxzaEuH?=
 =?us-ascii?Q?vjLG8USlSiBeCDgjP81NXQJxCwkBlk9/QU4SUJGOWwNww1uWSdrfRINdvRET?=
 =?us-ascii?Q?GiyDa2MNzi3wLUBy0pKdrTMO7XBcs0BKq+alntk+PZOS7G/sE3XN6fQln2QV?=
 =?us-ascii?Q?qjJMRvmcM5LiYSA2/RdnXw8uwXLOSolFGDCuv4pemG/L6K/HdfohP9X14ctQ?=
 =?us-ascii?Q?91B8PAmcowA37xZVQEW5gEddQ96eV1G0SU+1L8Du0W7kuaYFK06c9E6i0YR2?=
 =?us-ascii?Q?iJW/oy/ZfkdhPNcw+ddODTx42QY27Qb6gKbXU8MJvoWkpgLu11bVWYiPnb5L?=
 =?us-ascii?Q?1JBW5q+gdZeXG9TMeHy0JE48yzYSLjWrd3JhSzpeSbrDKjVgGzcQGeEB0aEk?=
 =?us-ascii?Q?wfUFnXhiPlfbSibQOLkl2MKUv+ybm7xuJtc18KAViHXTJbtWL2wm2slnB+tZ?=
 =?us-ascii?Q?Ofm+Via5cYNKmL2rrmKP186hY/rHu6kdHUjst+W4YKXM/UfV092y8vr3k8Xo?=
 =?us-ascii?Q?L5rShZ21f6upZxvyfBSl9EZ9IRulq+biutKVTGGUYtQdIuZoSwZSKAMrh1ni?=
 =?us-ascii?Q?kIvG5hPD6+q5Mvjx47eNyEg4H6t/qonL/6y9nle0D0X2KuJRVytSM0Rr/Yk7?=
 =?us-ascii?Q?o9FgpzjypelYz6JkqM/j9I8AhAXuwK0GYBei9eRE0jGoJF0g4sh4XaQ+XMNE?=
 =?us-ascii?Q?lnz5UAYsy/Tiv7iq8D3pJe3wJYdQ4z4lK5SGBfAg7b6Q4o2UGlUGGzHXxcUU?=
 =?us-ascii?Q?fu9ZzOuGl2jLjYasS0ni?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60d13113-89d9-4f40-48f6-08dcafb20c81
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 09:37:23.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR20MB5057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_023731_241454_B790EC9C 
X-CRM114-Status: GOOD (  11.34  )
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

On Mon, Jul 29, 2024 at 11:30:20AM GMT, Krzysztof Kozlowski wrote:
> On 29/07/2024 09:00, Inochi Amaoto wrote:
> >> yamllint warnings/errors:
> >>
> >> dtschema/dtc warnings/errors:
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
> >> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
> >> 	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
> >>
> > 
> > Hi Rob,
> > 
> > Could you share some suggestions? I can not reproduce this error with
> > latest dtschema. I think this is more like a misreporting.
> 
> You would need dtschema from the master branch, so newer than 2024.05.
> 
> Best regards,
> Krzysztof
> 

Thanks, I will have a try.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
