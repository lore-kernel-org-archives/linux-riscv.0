Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5547BC7113C
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 14:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41lSV5VfIUgkYMYdryT0qEqASfYyovSv/j9sJjhBnQw=; b=3hu4T96hV9yD0D
	d+i/x/WZXphDsfiF8XlYjGHRRPKTLHHeIL0ElwiXD0rMTXF27Zi40HZ0nEWoxmCg2MalCagjnnV95
	Hcx6rxb+VcKtFlLOvqnWSKvX8PRWPfO5b5JBEl5ygd5sVkx9aaWAENxCALlwopN99Vpx2O9gdDAVX
	qW7iIOsIPlU5M+MPbfSGS6A4bYVb6chrBYqpB80q3VVUN7DK8Ip6sISkktcoh4ga8Jptw4+rOZOC8
	2wcPUX/n0+pL5ER+fEsF/R5SjT30XReCyx9WInwPt/m+3tyuEnE1/Ak+Q3MmPYkClzf6GKrzL7opl
	Yv5XYo2mFYwGKeC1rYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0Mj-009UI8-2b;
	Fri, 18 Aug 2023 14:22:17 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0Mg-009UHc-3A;
	Fri, 18 Aug 2023 14:22:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692368534; x=1723904534;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IAnmNnTvwyl6OZlhyhJHKNq6HLlMjwIGl0zmpbZwHc8=;
  b=bYF7alljbLejc9IABp6QeCUsehugmVJEgZ/8eh7vb/cZq91p4gqsnzJs
   4FJKJAJYSrwkMMp+xhzioXIhF+SpLlHw43/dplL56OnVznTuO9YqooYR9
   suYmJPUnThKVqRzhNBs/poIGeKd1binLgJfavbjwy2L9Yvk2NqsKK95rg
   0+DXQXMuiXY+2AN+mrbishdGb+Kes7JXElGly1rYSyfJLFFes6XgX8R9g
   RNNCPn+t/Yu/X2yBawbGCyEudLs+nnxzj99QLylVXb0dvoOjF3WioDZoO
   5bMz6vjVUyzdsy8mydMNcFEaBNpmzuIdPsFBLPcZtiu0ekaZi6ouhcKsa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="358077929"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="358077929"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 07:22:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770146712"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="770146712"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 07:22:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 07:22:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Fri, 18 Aug 2023 07:22:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 18 Aug 2023 07:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idjz8gtgVKDN9hkWlgrRW7ocTw8+Y6TlPXr7nZwQNh/MJ/NyN8dCRrFRC5YJGHJQ0IOMeJjpbeE+OJQczscAZ2L1XAnt2gu2FjOLCs7sKUYAsdJliBa+VLsDmWi14YLZpNdwpC4/Ubmdx/ejpz/BSQw2YWZR7rVFNWdk68YTNdm7b2VJw1Y7af6ASxt/2H1/89vSYn4En9EJa/omINopGuenVal09EeLqXeDrPCR8ZI+ZIidZ5LokqxjljaEIzJMt2FtZyjBeStfJpi1Jkg9WNB57Jt13iTrIEwNNH/JvsfF9stuVVZJnup3c80IHQ4yFYDmfCDVACu63zBPf9rr0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/riMGyq/FNAe41inPv4C+Vyydhq8c3uZU4XLGhzrrA4=;
 b=YHwIZMw5KZBZ7TewCDiG6uAOoA6Dyj9BTEan1yBjwusg2/S50bcfJUBSXbkPRmV4IpPoVlTUVnT+xd4aTJXz3AeC5anJN/A+7rk7xC/RpzvIBOVhVyIlz19G0A9oxFtWFqH6l6GK9B3zoHglp7dxuQhd86yTvYjNNwDrN9/AJ5F2qlpHWXh4LnyJfQ+GT28POw4e9CfLIpdIWDUweu6VAkOpHCgwsn6SxSRLTcXQk665f76DIYesGQgZIxuCKrMKX8SJwRpVASwROVoS5hlzwiWw9H8D/fNdEubVxEB1uiZpTbrJBDZvOUz+5msg+BNQBbL2jiUfVGSBJnzBQZMZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM4PR11MB7351.namprd11.prod.outlook.com (2603:10b6:8:104::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 14:22:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36%4]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 14:22:08 +0000
From: "Xu, Haibo1" <haibo1.xu@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org"
	<atishp@atishpatra.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
Subject: RE: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
Thread-Topic: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests
 path
Thread-Index: AQHZ0Sdase5OfhCnf0WI7zBVus7Tga/wHBNQ
Date: Fri, 18 Aug 2023 14:22:08 +0000
Message-ID: <BY5PR11MB39091C78AF0E9467514956EFB01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20230817162344.17076-4-ajones@ventanamicro.com>
 <20230817162344.17076-5-ajones@ventanamicro.com>
In-Reply-To: <20230817162344.17076-5-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|DM4PR11MB7351:EE_
x-ms-office365-filtering-correlation-id: a8db7f4b-01f2-4544-ae3e-08db9ff68176
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ClwODNYBL3r1FItUT+sWzo3g7b23r9B+ASzEMfdQuXBs+6G4Osw8C3clgEGQdikWTpwFNZviY4z60hgn0M4hWMWBLbKWqR5/6o29zsSAqlIxhMFKvepdyJLqUqmAEgwrwgW6ecStqKf0GvgTjx6SiCeUqtG+5OEt4D4puorY6XY0Xoh0E2UsoED6LsmeblGXmS/zt5D0kEnHbgBLy6ASsNMTO0ZnNHZwE0jlWadqVWYgSuuaklB15avkAWs8oKKIE0YftV0SIp2GYbqRgXG1juIxY0kmqxB0y4P7Ox3ctUyPzTOLs8thTMjK26VJfXnhESR0/U8oRZR2Jr+EAVXLmsf/zHREoMNoxuSGerPPGwlP7VfgVGgFEHvYnf9JEXudNbw9g/q148khgecSkaD6r+Wim8/pi+CJ8OgceMGeXdzT3uvlzzg0HK/E/yiU81kKNKVwxR4dEoxCCdhS5sx+jrVT+GV328If9TQTIkY+0lQlGrnk13LEkPu8HCsriaptHxz3rpvWOfvxtBbC7U25r+YM2UzgJzVG9LijZ8mSKdSm8D2/oh6GjF3WeXr8c9CfBQXbJsUPFCbop2QYr2mHfViDSwicFJUbGuPiKEk1smbikbvASUneoIXgZ0JoWFrK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(366004)(376002)(396003)(186009)(1800799009)(451199024)(71200400001)(6506007)(7696005)(38070700005)(38100700002)(9686003)(122000001)(53546011)(82960400001)(86362001)(55016003)(26005)(83380400001)(33656002)(2906002)(54906003)(64756008)(66946007)(66476007)(66446008)(66556008)(316002)(41300700001)(110136005)(76116006)(5660300002)(52536014)(8676002)(4326008)(8936002)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sKDEVeHivO+HYSs/9nRNe59Oksh9m685K2R74t4U9kdcKd26Icx4jXKIUW3f?=
 =?us-ascii?Q?ahw2pYJVtIeANnbb99fu3E7Y7vw7boMxLsgUiUNbw1jcm5HmQ68KWesJEix1?=
 =?us-ascii?Q?7fCyUI8OyHq1aleGNfav1IjzHJYJ5tqjqGaauxeTauYRuc4Rg6aQq/yrZYFs?=
 =?us-ascii?Q?Ax0axzUMWloHbzjekWQReeOC8jrIHi8RCpzVkdmNKfNLhY4pixqvo14uBwnY?=
 =?us-ascii?Q?P8Rm1IYKDDvnGz18uY9XnEW7sUebO9Rd/2FkQ2ylQCQUWY6dL31pqvuadDBx?=
 =?us-ascii?Q?sFEgruyEYOcSGwZTcL7BIt1Tuctljk8Kts6Su1M+eb7NRsFjeaxuradM/oo0?=
 =?us-ascii?Q?TK7Wu5ritHTWEYD3oHBmIUP0POfNbmU+jVgFlxkDkqdoQWN1K4J4SGArIhuz?=
 =?us-ascii?Q?eX1q70Z8/bvB0qT1A4psH9ZD6aYRmy4TjxA3qhLYW/zk5Y6s6hXvXrwiMjvM?=
 =?us-ascii?Q?MYNAUusxqoHlVs847vLLFhH+82SazB2F/fDkAjz++ULjCZqQynpBQ/bvZ852?=
 =?us-ascii?Q?yLFtsanx0oIdbe6VJfjlD+LXak4YIzOMiq3JbfLI+jKSCG6Hd0wASYOMie8/?=
 =?us-ascii?Q?HX6pu0WP3kBsE8m+oIAXyLmJnEwtkf4rRBwBxdTMePWtDUAH6MPZm9aTWBhG?=
 =?us-ascii?Q?A3Ee1gdBqQyCsHf6i0UDbYiq0jNRn3xCqcne/vEnQhTW6UAqBs0aQ2iE9m2a?=
 =?us-ascii?Q?oH0expCZzKbGpnQudYaVrQ3aFbqbOCeM5HRyRJDy/sEhx4ad2V24sKYpi339?=
 =?us-ascii?Q?5uCqtzAx5/0PTlZ9MEdR2LtUiXPpxcoxBV0mP/3a04EzW90WK6iSEI5XxrV9?=
 =?us-ascii?Q?NW8IMah+m+J7CmheaKhBloomwUNzzhC8rLjHItTRP/XU9ZR/NuaFOavm/ZTm?=
 =?us-ascii?Q?rI3RvxyZVHvT/kvYLpbyDsoWpF8yq8Fz9s05jH0khj/11mHtkufjNt5YHS6T?=
 =?us-ascii?Q?0HDQeTQCnJ+XmBWXA86B6vvmTdyXmSHiLAbDqaurpEljifSBMI4p2KUS0WbZ?=
 =?us-ascii?Q?cTo2psxNNYUNtqlRt6TSrn2Zo/zkgbblUG0lA9DnPjgld5F4iRG9vJKF+V5r?=
 =?us-ascii?Q?LfD/S6ImY9EEEFKoWQHj0ptnZ8LB/nv8xdbmG/DHLoui9oSB02N9ADG3U4Bh?=
 =?us-ascii?Q?d8Ymf1EHwEq45No+P4NugcKrvkHOOsJWTLo6oNKJUqvT8lnweHkyRe4VPBEK?=
 =?us-ascii?Q?pCJDS7/PtlJjr11SkUGCFk1BpbCu9/ejCJSiQ2GxtVnml+Sj0ABvazHokYn+?=
 =?us-ascii?Q?aorQIcYKpH05KXb2AoEq/SGR62L40Ip0NtkK9MzUvehKJEmjoNzLYIkhkBwP?=
 =?us-ascii?Q?JvMK+CCwgfYvbKr4xZc8D5wOFm/tcjlO2H2rmYQ3dGRPLZp4WjmDibr0sxCI?=
 =?us-ascii?Q?8CDbMKOM7YW8MG7GsR1WN+lfqDNV1N7dpGeWXCUAW3YPtAUZLu0QJaQfsvPc?=
 =?us-ascii?Q?ZGLuZXbVPRKhur4s/cqSH2WLOaw9sknmKyzr30UnAHJHLsEyzqQHJWZosDow?=
 =?us-ascii?Q?PDNH1uASnJr/Nc44+acsUwi/Sr1OEGLkSkV0XDvdRQ7G1T0O8U6tcfvTRxQT?=
 =?us-ascii?Q?hpd6dIILrCzXzVV3qlNn+7QXI/aXaalibncwa1iN?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8db7f4b-01f2-4544-ae3e-08db9ff68176
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 14:22:08.5341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sukpgm/ysIaO5qKA/PcATfPaJ6Bye5UIwnaDoD9edmyvWwhCQZI+BMRLibri2VwwS68KYtaAVbtm9FsRTSUjHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7351
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_072215_091499_FECFEF49 
X-CRM114-Status: GOOD (  16.88  )
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
> From: Andrew Jones <ajones@ventanamicro.com>
> Sent: Friday, August 18, 2023 12:24 AM
> To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> Cc: anup@brainfault.org; atishp@atishpatra.org; Xu, Haibo1
> <haibo1.xu@intel.com>; paul.walmsley@sifive.com; palmer@dabbelt.com;
> aou@eecs.berkeley.edu
> Subject: [PATCH 1/2] MAINTAINERS: RISC-V: KVM: Add another kselftests path
> 
> With the introduction of the get-reg-list test for riscv, another directory has
> been added that should be tracked by riscv kvm maintainers.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0f966f05fb0d..8fc9e6e7f207 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11463,6 +11463,7 @@ F:	arch/riscv/include/asm/kvm*
>  F:	arch/riscv/include/uapi/asm/kvm*
>  F:	arch/riscv/kvm/
>  F:	tools/testing/selftests/kvm/*/riscv/
> +F:	tools/testing/selftests/kvm/riscv/
> 

LGTM!

Reviewed-by: Haibo Xu <haibo1.xu@intel.com>
 
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:	Christian Borntraeger <borntraeger@linux.ibm.com>
> --
> 2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
