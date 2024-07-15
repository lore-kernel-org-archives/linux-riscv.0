Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497F9C3DA42
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jul 2024 02:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScSeYd5TkDCJVo9k6Xtj4VMM4fyuKmdc+UfTl8QVgWg=; b=QDGSN6aDof2P4I
	Mro7PwSQL5A8Yn2dVkvMx7Niy480HW34UI1/h8ZQxPo9hqYfKZrs7UorvV9FK8AT/3q/P/Dca/rZ2
	dUw5ZCqSFdZMp+kzV3mNCLa8x/ECVjQbIaCeth9/9iNGt7U6dd7MhVL5n5ZX+neEBwNKf7EGg9bi3
	74ljDAvKP/TA1u77TuOTc6KfBKobFlraAKPDHIJp/aJMo3WrgX+MqQdsXmH/Jn3TbqNp4Cq2Wv0XD
	avAo8s2uWqBKN2nk/SGOJt97tKW4TUD1PkpA2b76WC91FP3Dt/Ssh+TOA0QQLlTr1jBh/UgvsHdh3
	dGNwuh952CjE5N5gtMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTBqg-00000005gS6-0mQ9;
	Mon, 15 Jul 2024 02:53:58 +0000
Received: from mail-bn7nam10olkn2080e.outbound.protection.outlook.com ([2a01:111:f403:2804::80e] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTBqd-00000005gQm-1GeG
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jul 2024 02:53:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ckSALFit7FRIxdw+z6V1ueNgmKrh/U1j7NpJ6GVJQxldkEG/S9FcZObQET5WCoTpfoQx7n1Ur+Wpl+n+eml4Xh8OHAyeY/DRZZe9p/vf1kARPP4+mpAfkWZ0CBOmdlUMoKRnTJjTfnl7XkVNyD66CdqnsjkRtW28DJzktT9QRAtFqj7NCJBAOngGWAFCIFxP1s1Lcq/y5Wt6WhwJ8dhdNHwzIPbRQcYpXdf+uq3aDKYYFN6X513dR1Uua2xenx/frqAuMOWjP5XoPBO9DDcmxIBlKcOvGG5D2YzE4zuY1ddGIvtVPYPUAhehVwEEMcziYwl9QqgsN1vve0Ga8sLCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voGH9Q93LnT6wC3l/YJUvLhD2BkD43YgE1EttNhZzt4=;
 b=OuRe8xVhwgtsF08Z1R2AAJAhzZeeTNa0APrJ1EHDvY/HB17iSyM+dQdJyinpLIe/W+Bm/Q6YiGxkEoWK/4KnPPX3787poNjOzEwxmvjkNQ4iEtaRgtUNI8JU55SnC/4J7Gjj6rivknkaLUocUklKQGibkpzWfyTMOkruY8SwEZLATULc3ERka6RB3+osOHoK1FmL8uVkuKQ8ivrW0kbbto7vskNRntF18Xl6WFHmOQjufNhqOja8ZhawhZq00b3Z0oa3g5biJ+K1gZY5ba3ss2o48chrFtX7LHzjd26OBJihCtZrgVzrQud4yMrn+AVlnrekJqfFqRomXIjNVtN7/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voGH9Q93LnT6wC3l/YJUvLhD2BkD43YgE1EttNhZzt4=;
 b=aDL5FTnbgosxYzqSCuNqfIDs6CBas+Slhe6ALCGKyzmky9QVwzv3KyEv/ZMQFOPdDPuAfbe44PFQXzner4bri5QPu0dSRkXWiZMFvb++sVwOwwSIBPG4C/ZDZd8D87Etg4rckZprTIHkfPXRqix+PjSnvyAcTyKi+e1a+SGAFMteaxMOSNhPFdAhSXaOkOTVH9hWbJVeCDx+PoK7u+yQqYZH9RO2I34Zqx463+T05ycaFW51b4r7PivGl3B+fFhsAE2R0xlMxtuAFwhaQ6Nym8F1uK0I/yAsGzUG2rjCTPuq8dDUrJvYvZOgzgZMBgCvgtsyCJDvd6SrKNR6J2Wglw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by BY1PR20MB7331.namprd20.prod.outlook.com (2603:10b6:a03:4aa::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Mon, 15 Jul
 2024 02:53:38 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::ab0b:c0d3:1f91:d149%6]) with mapi id 15.20.7762.027; Mon, 15 Jul 2024
 02:53:38 +0000
Date: Mon, 15 Jul 2024 10:53:29 +0800
From: Inochi Amaoto <inochiama@outlook.com>
To: Yuntao Dai <d1581209858@live.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3]  riscv: dts: add mailbox for Sophgo cv18x SoCs
Message-ID: <IA1PR20MB4953A004BE0E8A08DA19F3D5BBA12@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <SYBP282MB223825D5903777B937A8A377C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
 <SYBP282MB2238CE3A016F21B632E61219C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
Content-Disposition: inline
In-Reply-To: <SYBP282MB2238CE3A016F21B632E61219C4A02@SYBP282MB2238.AUSP282.PROD.OUTLOOK.COM>
X-TMN: [pqc0rj24XLurjgaDBj/2JRFEWmm7i0otZw9NNyBemKo=]
X-ClientProxiedBy: TYCP286CA0204.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::8) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <lz2njdjvrr6nlwzdxknljkeokpz63czb4yg2db4jw3j3d3v5dn@wyamwlq6txy5>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|BY1PR20MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 314936db-3d22-499d-e70e-08dca47953bc
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799006|461199028|19110799003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: gv3+InkOPpsOwHAOIOH2iisvDIjacfMwNGutMR4puBMVQ1uYPOWxbVG99x4c/r4s1qfQlEZbi9NJ42bYh5coqUMUVYrrJP8FXR1Od0j2U/OfLOEWYpjR3RX1782sRK+SRM6DGFbmGvKCniJ12yep1HMBmkeNAZm0MnMzTOB//9C5TeSE21BU67kYnOQzJABimrs/KQrsJ5Qln+78Tq7oFmsTjxV3K1kkbZmQxThrZHKS/mPJQLMw70pUKBJpuzA2JTLCSI0z7PVkPhhs+Vqe/dAw+Ji+cLXQyD+AufutcpTQ+gtrXrkMXPFZkV99zuXjKunwFsWdn2aWhsG+oLuYcvG6iLqfyyILim7JyqYMNs1yxXLZDyh8xfdpjQrBXyezLx+59sYsJHscYZ9z3H7s+jFgfpktx6ebqmgOhDAGlSYCSAoyKHy7bFa/p21Fhniftt6HEtUahnILijhVc9kjiqudGltoDOF2RD1VFLkLYted0CdqRnIi1oL7KwJ6h+Np2MEqEGEDWt28M01KXXYTpOcAc8HCK/dvpAV22UKZXR1a3eUpeHxyAKl19t8uInjs6+uVBQ/HjLc2n52Ps9tC3QzXX1Hkj9Q9p0xYcSVeymSwwnSvKhvungDGpbla0tOoW31B6IxI98Py/poqu6LgRHzNcke9qnp5muJRU95MtCU3HnmhkiKbYDk/zKLjRi48
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MFywK72yOjBUwQcBjfvP0MGSWDW2PKK6dUkr5Xy0DNtxj8rWtLvG7Dqegp//?=
 =?us-ascii?Q?7HLj26MBpIJaaGlGA4gZ/eIPBh5+6SRHSBOnwDzMQWhLxBoalRTvsRw3T/9l?=
 =?us-ascii?Q?whoF9372VDAYknBJGsYkbH1NdE/gDVWrNG85yNbgUaHi+Axqm0am+dLctCdv?=
 =?us-ascii?Q?6Ar4RHSGeIWSqnux8CWUgG/6PlmCTHqg3ezJ2K6GGqpwD2BZ3JAbbhEtMOWs?=
 =?us-ascii?Q?l8AwNJYZUjzBk40Lqp7hwZK3rKaECzvW9d9qnvGv0qVHASyZR0V5rW//gPI+?=
 =?us-ascii?Q?dnUPDoSGnNkJidvbkBZVioUI6nL5VaPMINaZvUDTke5eboPdMAFbLwGWO7EN?=
 =?us-ascii?Q?XypxLh9UQ5N3zqbx8qnDgI4iCDKsADB965sTApaHhDgfLOd00HHdoDjb4R5W?=
 =?us-ascii?Q?uyomsH00y2KiD793xB/tFwdyK9L7iyZWDyjrGk4M2PG9Uxlsvo12NNNQpI3r?=
 =?us-ascii?Q?Na05+nTIQXmpStej02Ydps51a2eQ8DoTNucfxSJ1thct2iahrkEtGcVG/UBG?=
 =?us-ascii?Q?e8euSJD0cJRVMPAnt3/op2hPDIqe3rnYSgfCv/r3ZsTQRmzpOBTq3QCbjt7X?=
 =?us-ascii?Q?qZGHbFpy0Anz/v3OUCbiCDvBO1wa6DJiHTyvAWPUf+Jiqc8mWrtvTnlTq+5L?=
 =?us-ascii?Q?hg26c6XG7gX71fEBTtKAiiCCxi0QE8qclz24skENJMPnUAnQu/q1IILV9xFX?=
 =?us-ascii?Q?GtY0ExCm9/Lo7I4HBckT6rEJJ3pfodXEU4jL/k0JCYLNLlIU90SO73SKpHVB?=
 =?us-ascii?Q?mnT6PweK/82B8AzzKKjp8SRk6tkMKN96E5kgMalgp0Rzvxesxokv/4rSmKlM?=
 =?us-ascii?Q?/PwTDTw9aLbmVz5xlPHcyC9SSZP3upOPwWYTgVRj5Llu+XNxxH7h6CG72J/p?=
 =?us-ascii?Q?/V8hzJCI+XhkWimx4dyoebzLT+8KSu+jyePwuLRyhJdL4HBHVBbqOw7snTBN?=
 =?us-ascii?Q?vuzFy293RKLzHIVv2ou023ofN8tFpzYLWYmnrZmTslH9PiYXWBasSr4/XVV+?=
 =?us-ascii?Q?wNADvW9Me9ecDy3KATmn8CS05uuC7v/C7T2W5l2nEi8bflf6cO8i0B0daKQv?=
 =?us-ascii?Q?eW6WtTiRJRhVH6/8hwoGEW6/HOtJ3L9VGVA02uM/vyuljtxFKGl5fhHuy0fZ?=
 =?us-ascii?Q?wAtvLnlp15Fd5kQGmoeUHVwf61rBw0YL7WGwWqGnib/feiyQ2n6VuEc7NbLY?=
 =?us-ascii?Q?ajWhfWEK+BtaIhOt0wjGIlM0BB2/NkugOaDSVRZb4MM6I/vBDwA9rLzZl260?=
 =?us-ascii?Q?LODmhKWm43GFhGBwD10X?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 314936db-3d22-499d-e70e-08dca47953bc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 02:53:38.4485
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR20MB7331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240714_195355_364792_31F01229 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Jul 15, 2024 at 12:36:46AM GMT, Yuntao Dai wrote:
> Add mailbox node for Sophgo cv18x SoCs
> 
> Signed-off-by: Yuntao Dai <d1581209858@live.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 891932ae4..1c7035737 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -310,5 +310,14 @@
>  			reg = <0x74000000 0x10000>;
>  			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
>  		};
> +
> +		mailbox: mailbox@1900000 {
> +			compatible = "sophgo,cv1800-mailbox";
> +			reg = <0x01900000 0x1000>;
> +			interrupts = <101 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "mailbox";

> +			interrupt-parent = <&plic>;

interrupt-parent is not needed, which is already set globally.

> +			#mbox-cells = <2>;
> +		};
>  	};
>  };
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
