Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6286C3DA66
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QooqDyV4JzW8xzyHMbe/tNZBhwy2Y9UTJktcvDS2Wg=; b=at0Ib6goISft9l
	qZC0a/pux61LCFIN1jWHUSNZGGV0ycLzb0bEqDXytSEpgnw7Cborur+nZfSkp66CirHfphH572/Bp
	AJXWzl9DqbGxqEulnrfa7RfBBZxuIfmt2IzL2S5sglX28/Y5jRok+TWtCNgWiFdvZ6Acx4cB0MZDh
	hyQ+HHI9g5LJWQJkgKi57UaGwVhzEglLX6G+kqGPkLh2+7XRqvFGbtBVOgV1HI5veScHhCXbGck1i
	164oM7dTRCoI6bdlyQDKUOdZhezksDkTi6Kob1YJePKPrNBGSdf7Ux3dKywHf3DZg1hhqYCDx+EYD
	4vxQZU8yoWhee9mqOJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWoIy-007Tr1-17;
	Fri, 18 Aug 2023 01:29:36 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWoIt-007TqS-1R;
	Fri, 18 Aug 2023 01:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692322171; x=1723858171;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ddU2QNx+YZtNbEm6DL7mlkZ88VJREm5wC71gGliK1e4=;
  b=CjzcT0sOq4WOWgcB784M/urnwYidOieisoqtK3eY4guSwknrHn5t6E8K
   yuMyENNbyDzXT5DwsdA+H51NctdbO9lHfkUc5B4gFkkO6/COoIWGXAGna
   fTazbwHJegE4ChV791g+iziIakwL7PMgeE0bxMhVB52nTh+dARU39+pcT
   HnCaLDLNi2HU18hH13Mf5DfOETdex+oCP4dnwvZr7OnE3OZgtqFckwu7y
   WRDtMuewKKAzJng0FJKRLuxOzKxac7mPStKXPoFsa6uTUjQcZA1mlpPG5
   uK3fNfxejr/qIS0zAbl38PB4yHp7V8Hbf1SOYcKBkywoQJa3oWC4CHCjN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363143287"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="363143287"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 18:29:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="800282684"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="800282684"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 17 Aug 2023 18:29:28 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 18:29:27 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 17 Aug 2023 18:29:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 17 Aug 2023 18:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fjkr8juaQACErFYgRB3Ap1BQH0MfHoPpby4/Dx7S93j04bf5IOcXx/3l+KSIMdmriOy/zA5T7GNGVNaWGDwPI9tZLapSuuGEJMZv5MN9sZqgvc1dkcjD+XvsRWjPU5rKJeaADqDESeYrVkCjP7aPVVdcvxCT6XMC15Jhb3XAX+6KPP+/lECQcq8/PlrK2chRVut2EmQRVlQvjbp6a5S1jCUq6ayrP7nnSscATPly5MuEU/6UE985aSw0QgNPIpNlI/QevccwhwZRgLJx4FSvLVHksxSHvKMrVcQD2Mdubvjn6zTBFl7It3UYNX/q/6NyHUTgWjjScDD5iSG4jt2zMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VupgQxaNhDvRlHbo1D8F2wyS8rHyulL5qTFr39Zzadg=;
 b=EibKUmsREaeyT7uKQdynHfuVGc09kQtfpmycJb8p2ImQWGSqeyQMWeK2sXQx73UkzE0jnC1OFJFOjQhaKVHRVxRokQenMHYXOl3PT7aGSD2xyv2sBgDiuwmnZwTmCifqjS4LCzaX8lHJH1l1HmlW/cWTuICvC7KtP/vYwHqNwSXtjhEdINbo0NKs6AF7CnC7XYsD2sYjUz370ziOnA+MOAyERkx6W0WCi2jzmoFe8Cco4TCN1nsgmQz2k6oQID4kSb6XlWeftMS+UM5+tmgKO38Gyr10BOLvTxXQ+jwqy1C4HUXTTTntrt1XUVGmpJiruGjbls7KcxybnxEI+o4+Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 01:29:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::713b:b9da:7c2e:ca36%4]) with mapi id 15.20.6678.031; Fri, 18 Aug 2023
 01:29:26 +0000
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
Thread-Index: AQHZ0Sdase5OfhCnf0WI7zBVus7Tga/vRE0w
Date: Fri, 18 Aug 2023 01:29:25 +0000
Message-ID: <BY5PR11MB390964AB15E7BB3C64EE3DA7B01BA@BY5PR11MB3909.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|DM4PR11MB6382:EE_
x-ms-office365-filtering-correlation-id: 25e85dc2-480e-4184-717f-08db9f8a8f37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KWaWxbFUXAECljdiRDtNYp/NADWNjASp5tp1DRI3iwPKGTtSWj9zu2zzBvZ7EsgTayKX4wtCelDxgQw+DE2sxfipmmAqzksfcI0WwGWKhIr5mvul3UqRHKbFiqz27S627s4yVIF2ApsOtdQV14NILC/3ktP6HAJKWdILD1AhpHMBhUPriPS4OMVGudfJyaCdWWCF35i16xptDNFz+ptj+F38gMxq+tBhUwK9BXO1p/f19jxWnwaDgRKcTJx3BjW72rmBxba5GhAEW1rOuqAOaqrgkcrOVzWX2vIUh0X7//4o3RDWAGlFRHwPBXj+iUoJKZAC9BazEkEl+N9WEkr4ZxclfjnwXKK+OuSRW8pbNTywsLEMdmil6rnUQPDTrEFdnevJayYXlWU47WZoNeEsh33+uVRtoIN2jWi9svpq2Pbyl6YMch4elFvEqtSu4q1PouFMXO0peLoJEp46ZeeJ+NBoZ7DyIeTkGSc3vnThj6TfZtIYxQ8lsbt740p/urA4yfRU9mENEWyfOTwRG77RSf2y8ASmRkEhnT9gDBkMgU7x156YiLBNOWAclWo0lMLMFSPu+9reb5VOBVI2lF4TdPN9BDHM4OwJO28gsSBxMY0PMvAnRmUz2GeyuJ83dv6g
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(83380400001)(26005)(86362001)(478600001)(6506007)(7696005)(71200400001)(33656002)(53546011)(9686003)(55016003)(5660300002)(52536014)(41300700001)(66446008)(122000001)(316002)(54906003)(66476007)(76116006)(64756008)(66946007)(66556008)(110136005)(4326008)(8936002)(8676002)(82960400001)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YFnsTF2ilQzvxc/EcUqgQSD/1SqFyAS5DVQbqEfAto6dgBoeCY3QO8BMfyiq?=
 =?us-ascii?Q?K66xKxHIzGycZGNqlETV34VxByUyMbu6k1j9Od/C6/jvsCoRSz6CthGjl7cv?=
 =?us-ascii?Q?ww1azg8n+qz91kduoz0Wn3Bz8QLkEq6f3qYnVxax1sxoMSJWdVZuoIWFU3Et?=
 =?us-ascii?Q?LrSHgN87H6M8jlsg2V4lLrLiVeMcs1fzkFgdZ+H2rvfDJQ9kGhENkvlS9G6p?=
 =?us-ascii?Q?EdV8TLJrhlgGBpQf0CNredeM2HlrxtJEJuzWth/D58nCAnmnlgmbcv8wwSpX?=
 =?us-ascii?Q?zOvGtZPq83JCFELtuUvv63PVnmU6gMUtgBmBah3jLaUBupEHcXtkkXZy/9hO?=
 =?us-ascii?Q?45B421MdQ/Ox6jTYmbT4aTfoWaPVdMBLdB7lijmhvojIz4ZEuie8TiF5OMp7?=
 =?us-ascii?Q?XGN5DsotWpJvDrqekqmIHHI/cdZ9BdWbtnAi6CZdXyoRoiH3GKG6QZsPPE92?=
 =?us-ascii?Q?JuOkQ2vi+BAY7yqECwavfjtfQAnyrA5oivohbFxXr9rc828y1NrMxVPznASi?=
 =?us-ascii?Q?/0XJNSMEPXf86YFVMsnHjLtwM4W2PaQG6PUsPVrPDuLhN3QtxxPsWpyvzvIN?=
 =?us-ascii?Q?2+idIvyK22UrmpebSmH2SIQTJh2mMtdxrdywuIsKSuz13+5z7NLS6iKjamzq?=
 =?us-ascii?Q?UE3PmnE2vtubgnAIrMbfLm8FbBseCmoaQbyzJlHxvEs4oy/yo0Cd5WNCGJMK?=
 =?us-ascii?Q?wH+0Br+cthXFPA82ZnKV4WFM7Hi/gYAHKdnoalILL8eL7D4gsmJanDN2vDE1?=
 =?us-ascii?Q?x/Xc1W1NPcbgHQzSyvXFPHKTEg8u+ixn5arOgX7xBFHTNZrJDuPQtgk4Ewt9?=
 =?us-ascii?Q?uxs7b/Gi9e569uEKytsJxw18tv7X93LbZcGrTJK5cHy18+rmWsimE5nQCvbr?=
 =?us-ascii?Q?56hTK/ySIhL5V6Wie7DmFB4veKtuEcGe4bH5FDHmEM1Y6Ztco4hgQ9Czzmr0?=
 =?us-ascii?Q?sE/+EOwQ6y4HBAqJjr+jbwvaQCDF6Sfu4XvIf6aBFUtTwhycba3xB6JpKHtS?=
 =?us-ascii?Q?U4GVVBbwrUsSnNwp1rE1Ete6fD5KafZc7PRLCBSA2FVPOCYQEGneFdOUGWaQ?=
 =?us-ascii?Q?n+Q/swk4VpeUqL0BdbIjpSj6IUQUHiy2CfFunCMf85kG5SfDlEr8i9v0r8jf?=
 =?us-ascii?Q?bDpIMSMwSBMmwnJhY6eqtfw6bmKCeiqxBsvdHBWpJLvzMauhPruuHmBu19LM?=
 =?us-ascii?Q?Kzaya21QxnUvpVIGRKWhrgoJxL+CIJAHSGEDDY4g6DhcvzyTIQrLYqeirlJ+?=
 =?us-ascii?Q?UdNQtrAJ1duUQiBB8gJxnY5d6MzoPOzbEcH5T3ma+VJr+hJZ1LyCG1Jc5p8G?=
 =?us-ascii?Q?+yWoRvAk0TkZMJeLYbLekBRDvTPle9xM+QNOapuIynBSui+kmzmQqkh1byNG?=
 =?us-ascii?Q?0tpfmwVhfSyeqB0HcD0FXIyPURxCZ1StuETYqTZ5U1sFt/AVDqZ3QaqKCA5a?=
 =?us-ascii?Q?uBFXR6dMTOT1niSS+Gp//zckWh9lc/XbgTuSMcImxHBkKxLqqDYTrh0TROEH?=
 =?us-ascii?Q?9DjSNz6/UINPtxFQj6gsA/AuhsX4YKdMFxSFNx5MvBaRHqAA77tfC4qogIO/?=
 =?us-ascii?Q?tMcjPCCpXQ6NkRiN9XbYec8bVWrzFCct6kg45L1X?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e85dc2-480e-4184-717f-08db9f8a8f37
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2023 01:29:26.0060
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 71tuScWcIrQLq7sJ8gt7kiwU/ilcVO3VF08YwFR0/ZqaIId2PY8ZHDybuQXBElUKptlXSIUkiJ9Dy7BQb4AkKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_182931_554926_8F671D30 
X-CRM114-Status: GOOD (  14.16  )
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

Thanks,
Haibo
>  KERNEL VIRTUAL MACHINE for s390 (KVM/s390)
>  M:	Christian Borntraeger <borntraeger@linux.ibm.com>
> --
> 2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
