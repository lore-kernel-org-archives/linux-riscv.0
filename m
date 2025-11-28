Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEB3D116F1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Nov 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0r0drkbNRoi5yJJxgRpeI3dyRA+lU0dFmsnrAnxVTk=; b=0voyr4ZxPbPOW7
	y1Ea02si9L6Atg7hppUGzrxIcUtTweW8Vam6QQ/3iaWh/TExKBwsE2UHfnXv/0gKJmo2CHMtMJuK6
	WZ0jpaVXMz+U9rDracgVjmsDPYoVm5dOLy1Jl52mLtlwl0xdxm+KzlOYzzOf5edcUa3aYBu5X3ar7
	ppRwzd6ZAgCEim4suoJCMw4QwnhcgszhCKhH9eP3d18kiy14ravhJ4HA+BzNMNAkjILWdR2SKeS4U
	PE+DUChgtOlhy6smA5j74LvAaEsoYykgvrGp1TKHdDeleIvonh1zkzuK+4tmUPH8SKvtrDy9t6QRG
	Dxia/GPSnf6pAceF1EPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1y5-00000000i1L-2tGp;
	Fri, 28 Nov 2025 17:09:13 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1y3-00000000i0w-1vJ6
	for linux-riscv@lists.infradead.org;
	Fri, 28 Nov 2025 17:09:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6A4j5O2D0oB6xzfoC5fD/YElIEpsOOpgRSE4RVu92bRnXoFCMj4UDU6TqTj7laY5Y1ebD6nqBZXMcfl/cKStYvgNUuviUmshSKpG0uiQ4szEBoQeFhcxQ6+BQeYRkZwgtFe92A/qpbK2EwnQ4TPmrU3SwijCIVqKFlvFMGYjhVyuadAbPWxG4bDdArzokF68WjG/F9KkBS7Lu//naDH2evrzHXQYgYAKhZasEwY+jkGNOV0I63OicxAfbduSkYl7yCL65NC2wq77HpW4uVB7IbW2S6i/x6NKE9hr1BkFKijcVM7O1gJs6vYRtbZ6kgSX54HJgrsVqkKGy8s+SjY1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qIJR7vyJw2DMMvwELrVyVph2ThstWc27SqwXsd968OA=;
 b=rKOpR2PbaaoDmjNGet4B37Guypeax7RhKVXRz0fO/Ye4/m+p5alphz6ZLuLlmmQWkL8HJIg30s5bofUZCeBoePOv6fNAW+yAlB2Upt2EkUdPKsLR7aQoaj+X0+LZ2IoFyNhhY4Puv8iajBkjNl9vnzc4rS8U+7Dm7ldYbfLJNnw7svLnNfNp/+VYnicIoHNwnTbef9Sn6lUw5sctHITwzreNx+5XejyN8XqvH+uMSmRxuE6isnjzTlaaujKFw8LODK2sTqxb2zjZHNE8EOdqwrxriYNQ4uF7mKDI6FTpmTckCEezALDUdu7DuWL+u29dnWGJgjGhz7ELE2vf5MvdPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qIJR7vyJw2DMMvwELrVyVph2ThstWc27SqwXsd968OA=;
 b=dsSnBhvJsT9kMYqX9RWFlNpHBH01OjqVuxi5y7e1NDzcryI+MxV5o6PjYyT56lF7JG5Zk+YeYEQ69mlRuUyQ27K2Zi26Lx/ISis6yPjxoADXsvIURM/XBVPPETOkSTd3yBPvpDk5GA2ZyXnosLhRewQa/6L9rRk0l3dmyPqzfS5y+3IU1iG5xk8c3PHC5XVD+njoI8gRwkbERHr89HwziF30UmK/1uEiVyMbFx+I3Yx0HVlLGR9Jxq9gJq3wmjOY3NH6B7VCAbqzMXAxE7zsilfJ8YopqBOqX0NkHnYmXdhRR4Kns+pVitp6ma8DWRLjEAca/sRgUa3agKBQFJqETQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.16; Fri, 28 Nov
 2025 17:09:07 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 17:09:07 +0000
Date: Fri, 28 Nov 2025 19:09:02 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <6omgrhmuh2tsmg3u4ymqnihsru2mwal55zbtw4pgiepc4ai2ls@4bjet2l3zs24>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
Content-Disposition: inline
In-Reply-To: <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
X-ClientProxiedBy: AS4P250CA0004.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:5df::12) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bece1f0-0a26-4f5e-24b7-08de2ea0d6eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lTDlLypOWuFclUXENoYysi5ROsCwxSqdtWEK6FHAMC3ulHsQPhZbcXdnkI4y?=
 =?us-ascii?Q?a2cVHZyN8e6AQKa4U/fiISefxoXrHhESf9nTsg4DN2XSEbZ4vOFX5V76fauy?=
 =?us-ascii?Q?j8r+EINkgUboNUuxrmVmfVxXHzTNuIhqP0SQat1JqXPl1/MP3wo5mB9fC/4d?=
 =?us-ascii?Q?R4eUYs31MO+3V8CpIUXPJeaKfnTkmd/vvBTo7VlsMMuGyG5aXY/LGVktSVLR?=
 =?us-ascii?Q?WTIZGu7cTfUFXxp3bpFI/jwUXAClGPNxLt7NvtK2MiLpFcxBJu6/pZHJ9FBM?=
 =?us-ascii?Q?vnJ140SJUfvIwmO8PGSghCQG3Ng/mne0vBpdbwL0ChOX8rnPpGbQjtgrqBhT?=
 =?us-ascii?Q?iT0W7ESPWdWzKaB+hQ36XcMLRp4pSGQ9N4orh7Eh4t92jQ7ArOuPdeyMzWTJ?=
 =?us-ascii?Q?mLcrBslZmVOH0QwKMR3oHoPx8JOz3LK/sB86J3+eVL0XMSW4WsPwfxOKYcuf?=
 =?us-ascii?Q?nw2ZuAMcTkLiInnsI4Wv2dL/YCIMto+B7Wo2Uc8Jfih5kmsr2Bvda7ipk/q9?=
 =?us-ascii?Q?5ibX0NnTyUTC+0OVy7v/5Fq0TAJJ4xB/4VFJSZMOjCi8OxegwoaL99AH0+DV?=
 =?us-ascii?Q?EgJpTCpNA2oQ6cJRLfc0DU1X+qpjKnQaFJnumKAh+mjGmA7ejRKkdvQ9XKKu?=
 =?us-ascii?Q?v6XlEBYS3/bwexRAr/LApKzflbSjM5UIzL+TPIhJ4zf1x+j4EfPN8eHViAdR?=
 =?us-ascii?Q?87KFWtVpySYbOziUqL6hID7DhBq/eIDaMd7CJtiJweNBitA99wTJ7B2bTZm5?=
 =?us-ascii?Q?tmzgHmHKMLbTVsx+8bxZCaXt0Zw3wL5QYNhBgAVIdCSmVya7t/Rzi82/3wo1?=
 =?us-ascii?Q?T2eFhNppEYMDdiJy6+S3aZ0mJ3NVbo6upG8twTVzTZU3tuKBZlMpvSKDlgCP?=
 =?us-ascii?Q?5hpvPiZbUY+NswJkbGpwgB+6QYCXNk4Y1RSvQy4NXW5spIPp9XYYTtbeIRRl?=
 =?us-ascii?Q?c/mn7t5bg9/YSgpl3SFsl/divYKGksGjV9hSxMATfwVVKYHua6/Tr/Qmbq2R?=
 =?us-ascii?Q?hcNP/8Eq/s2UAX85v43QDRTI2KdR2IwWgvkmZRexKnysit/fiHtXLWCk68fB?=
 =?us-ascii?Q?cHHWtPhMVVtYt82Pk2aN2I2Pymi9MMwgUhiBPdtaATVQAj39XlowNlsT35xt?=
 =?us-ascii?Q?KHTX3mRhSiwNGjlS8nBjrRgSPY9mn3OSrTIk1ALETwCI+zq9K7ZgRZGmwHel?=
 =?us-ascii?Q?hf9toLRHZnQ51e0oLWNi9cRuohnkQryPEAa00JhwzOby9vlnk7MzZCArfgIK?=
 =?us-ascii?Q?YtMFNV7MLDrw5AwQjZEF4taunLsa4rM5/SU5GwzIcwzlMnoAXyjv0HbbVcir?=
 =?us-ascii?Q?lDJhH5NMVcxKeO3t7puHP8BDSM0lPEU+QyN3Vovf+TQOnGfWO0OY8SS9STy/?=
 =?us-ascii?Q?p7+nugn0yJ8a9c4LLItuUWpB2CA6NQjUqaQubb7tHsT4rTJDncSFR9vpoilC?=
 =?us-ascii?Q?PZoC3+3wYVDG+5cY/QEFfmqF0TuAo5LdgUAPgu9BMynkDXFyWHb28Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GjpQSD/WtUQTq2jza7X6Tz0vtMhpWRmb0swytoDITFolSRrTp/VZLbD75Lnu?=
 =?us-ascii?Q?j0xjr7zmnNzfo30s2r7B5Zfqb5pC8N7FXRxvVUWr31WR82Y4th7tGSrv4uV/?=
 =?us-ascii?Q?xQxq2H6ECWBtueHluDT9+e5oOiH7POaL1sB/0THvn4Rty4oFM/1p1n3cXB+N?=
 =?us-ascii?Q?JMZgIwQ7JMU7UTzejI6E/MM5UkUtEz0A2bdAc27Sf4kI7jLlP1/whwup9lGb?=
 =?us-ascii?Q?s8VEIFCa45WoQ3VN7q9p1WfUcUtqg+dsB1k7TWe58uwfXW6ZCaN5YSV29N7b?=
 =?us-ascii?Q?0+S5mW1sRN5H+IpT3F/8KzurcfU1XUh/Ttilwm35MYcRLLWMl5y7kHmmZn3z?=
 =?us-ascii?Q?qRP3XunraalbVNfj8FWs5TYOCpJLI+fc/E3qN0edySp65MC1ZPsZ2ROG915J?=
 =?us-ascii?Q?fJhrmuSybksRM2Q/8LNMgOSkQcTI0ChLZAh+kU97yPPS+TYV9SPr4v30htO8?=
 =?us-ascii?Q?3UxYzhUc0gGRlEkq5eRAAczJcr9Fa60KDzwA9S4C57yFUu37lQ9AE2iMSRAt?=
 =?us-ascii?Q?SiqXejVsq6ISpNsf1d1b5F5/qed6XO4siFanwQukzIMa1O0Zdf+Pi7k4mqUm?=
 =?us-ascii?Q?CrfK+cAznYLWFlmctLSC+Df4Yr+sHLwdNZMLY9ctwvQ2j8xky7k6VFr301f4?=
 =?us-ascii?Q?zS0q7TECVnihAVD+wILapP729LOD9ibsWXZ5WbAnPckutwckk3IYlg5gxSck?=
 =?us-ascii?Q?sUeGF4aB52j2HqSlz181qpnkrgFU4Yt82fsdmmuIhDWPVzlRBhk1KapKP+Ey?=
 =?us-ascii?Q?aHbEI6x1EqjtIjsBUMitPI9fZEI29fRlMveeNNWv13wgDIE5dNjksN/93n1S?=
 =?us-ascii?Q?hGD/ZDamgRSGKghtYzGYp7xm4dqEWJeICvE+yXQJd/DxYfqo5Xhpeo5TebJl?=
 =?us-ascii?Q?xRIKHQh0P1gfiNq57dRIjy9WDnb8oqbpOsaEW+ZFAICJSU/ugQiiIoT38XTq?=
 =?us-ascii?Q?PFEO625So934eQqwtYNJMqlduY3DJoZxQnvYr53jvuEPbDy0m+AeF1qv/srj?=
 =?us-ascii?Q?pWGF9QeO9IUW/1nlhoqggGtAH3gAYp/KuMw3ACwDUuIWJEKB1ssv6MkIxapK?=
 =?us-ascii?Q?+3p9l0Rw/3FMg0CgU0j+rGJERm8cDCQHntDGcpxq5/fjMETx8kb9zV2CMgxn?=
 =?us-ascii?Q?tGuoKCCHF5FbrC/5YeRUlfIcXFeQCc8VsbIQZhOaSEK9dSXswh0EpHvWoL9i?=
 =?us-ascii?Q?uuRgEnl91pkdrSxnRz0hETgV/j7ig6ZduaMn6hp7atkjEmRbuejo6+csOq2O?=
 =?us-ascii?Q?PfF9/o7EI8tAoIHBx12WhWRn3VikpbHft+KP5nas4ViwagKESNt/Z5zpriqK?=
 =?us-ascii?Q?DgtSwJSXDCTFCIvso/LD5SlWbjNfSdOgmIw5bSmd9IfzEjNQ8KRXztfnzt6X?=
 =?us-ascii?Q?qai0SP9mOiBAk81Kd8GtqCvrEWEh3SXO82Se4VzttcOUPK1K0bNYyFiIPjFX?=
 =?us-ascii?Q?G9ceq7Ios2GTsHyNqZ+H0SmJ1hn+qskCj3Dd5lTkiyBMsyQLXbSQpHDlEpiO?=
 =?us-ascii?Q?B90xJKVavWQJO48VwwKNN+0F7Pyia51fUxalVhx+ILibbTB43NGIaXEok97Y?=
 =?us-ascii?Q?rnwSvOuvuE3HVS3YXhxKP44h4eGUwlKlZzfzAtSf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bece1f0-0a26-4f5e-24b7-08de2ea0d6eb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 17:09:06.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gjgp4t302YU9xrkKbu2DOgKeuajHPxVWHEtAlOKApPuTeJDdCw1yPbWRZmIAzLVA1+j162QJTWXUGTjmjWZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_090911_499585_779BD133 
X-CRM114-Status: GOOD (  30.30  )
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

On Fri, Nov 28, 2025 at 06:42:53PM +0200, Ioana Ciornei wrote:
> On Fri, Nov 14, 2025 at 11:47:54AM +0100, Geert Uytterhoeven wrote:
> > The Devicetree Specification states:
> > 
> >     The root of the interrupt tree is determined when traversal of the
> >     interrupt tree reaches an interrupt controller node without an
> >     interrupts property and thus no explicit interrupt parent.
> > 
> > However, of_irq_init() gratuitously assumes that a node without
> > interrupts has an actual interrupt parent if it finds an
> > interrupt-parent property higher up in the device tree.  Hence when such
> > a property is present (e.g. in the root node), the root interrupt
> > controller may not be detected as such, causing a panic:
> > 
> >     OF: of_irq_init: children remain, but no parents
> >     Kernel panic - not syncing: No interrupt controller found.
> > 
> > Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
> > parent") already fixed a first part, by checking for the presence of an
> > interrupts-extended property.  Fix the second part by only calling
> > of_irq_find_parent() when an interrupts property is present.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > v2:
> >   - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
> >     controller handling"[1] to relax dependencies,
> >   - Drop RFC.
> > 
> > [1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
> > ---
> >  drivers/of/irq.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> > index b174ec29648955c6..5cb1ca89c1d8725d 100644
> > --- a/drivers/of/irq.c
> > +++ b/drivers/of/irq.c
> > @@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *matches)
> >  		 * are the same distance away from the root irq controller.
> >  		 */
> >  		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
> > -		if (!desc->interrupt_parent)
> > +		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
> >  			desc->interrupt_parent = of_irq_find_parent(np);
> >  		if (desc->interrupt_parent == np) {
> >  			of_node_put(desc->interrupt_parent);
> > -- 
> > 2.43.0
> > 
> >
> 

Sorry, I somehow removed the verb from the initial email just before
sending it.

s/This change irq-ls-extirq/This change broke irq-ls-extirq

I also fixed it below.

> This change broke irq-ls-extirq and commit 6ba51b7b34ca ("of/irq:
> Handle explicit interrupt parent") does not help with the issue.
> 
> This is how the DT node in lx2160a.dtsi looks like:
> 
> 	extirq: interrupt-controller@14 {
> 		compatible = "fsl,lx2160a-extirq", "fsl,ls1088a-extirq";
> 		#interrupt-cells = <2>;
> 		#address-cells = <0>;
> 		interrupt-controller;
> 		reg = <0x14 4>;
> 		interrupt-map =
> 			<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> 			<1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> 			<2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> 			<3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> 			<4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> 			<5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> 			<6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> 			<7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> 			<8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> 			<9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
> 			<10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> 			<11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> 		interrupt-map-mask = <0xf 0x0>;
> 	};
> 
> with the following being in the root node:
> 
> 	interrupt-parent = <&gic>;
> 
> Ioana
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
