Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F096DC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 02:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xta4oYB9XuIrCvOSv8aBW589wxWpekmrBn1kAIcYK60=; b=H0NvAttMgt3L4R
	OLWZpsSzOMSlqBAS5Wc4wUqXUJKiTxahir1baUEsgEptfBdMXYaqLriZIsMwDdQU5/+PFtJSg+to8
	r9T/mdWGj5aqABk4OReDFp7D/tFSjM2QQmabD81/ADWLyUVtOXneALc188oMmkN0oWU9cDWUPrJT8
	wwNHHNm71Hoi4K9oeb0y9udZ+e03HIR5mckDNeXxaSuUZ1yOvFCayuWUbgi1hep/o9SgvLLZf//AP
	Xc9LyEtZ+LL0fVsohvpBEO7S2eQuXHwLl8xSB9bxNWSCam0L0iX4vJs8HDDNtiHle3UmdruVnQnZV
	t+dmkJ2u3yXy+8AfvzLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQPK-00EWqa-2A;
	Fri, 08 Dec 2023 02:16:02 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQPH-00EWpK-0j;
	Fri, 08 Dec 2023 02:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702001759; x=1733537759;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+NJ2X/lkwutiKMBB0d/B3mTUUXUCUwaDsHS0RG9/dF4=;
  b=VKa2d2enpSkmt0dbGgwx8nE6niveByQO8eBoltwPlY8GxKL0Sd8vwm0H
   4CYk3nAj8S7nYLjFGCaW15YbCzySx1zCRZlYJkgaONJYICTx1yZ9hdsoN
   aTCIXUmu8buOUzppYu7cBS7F3jPA2V2TOhL4FNhZb8AIzb95xCSDwdq4f
   gU949jaycRyH8uMIfq1Mnh6/OqwF7pYPHW+T6X56qFMBwFVIuPtMVBRGW
   uv6rENmGhAWFuEmgfBrjTNdnTWVvbIaSeIX8B9P8QNBEdDFHzztaLY/oi
   PKvwEO15hk2yuKN3kMdbucRLmAFqi5s6GE4YtbPVd1H+ZM9NOmvf8ARhI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="379348689"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="379348689"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 18:15:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="806237005"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="806237005"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Dec 2023 18:15:54 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 18:15:53 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 18:15:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 18:15:53 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 18:15:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TJcpWwF0bUJJweb9tkiUuqQY7xQnomL/diIrofCWxTz1SqtWsHIZZVLz0wkB9PUAKen7gH8Ix9+eCdx7rvZU5QUu2aVLeTeGYiYCtPYNO89ThM81Mv3bjQFIRT8Upva5lhu0uZA63OSVRix6hlkVmsOo4bNY5CeW8V+pie8y7C2hUc5q9iT3qHoKJnqeQXn0PzvMY5wx7ZV/8+yVZeIOLtw75vkTZqB7ffkUWsWcZG02N36+YOsw7rl1YS9fFbFvaaK8q4j+jsBItUU1AKjvL4ReXp8sN1q0The8W7lK82EMoYwOI6bHPr7ezRKRrP4LlbYsjkxGTxWqTv0etjeoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfffc4Mdooj40xO+Ein9QqXSE0Zcvp1W5QhrxmnewI0=;
 b=Cfqwrf2xwrtwTzTNasUX0S6n9/w1wNdINjg/Ax4/hnN06vtBIDVlgi+At3muIUmTjOG0UwghwsWKOpK5OrAWkke9f4ieH17+LYHjLQ1h5D6msl0c0VlqZcdHju5V59r981XRZMhxO708dUGdwqqPc0AU4JGIsH1edIqFzPYlET4rafMw6aM3nIrkv8PeAnu9moV2IlU/LN2X2IwaeB4AZPcmHHDKRoU1dDNpIeL+raULsyjbZYBlFjP0MzYiN2eTRLAzoqJNkE2hi+9ytDlwlFscfWYyHF9pWE4mr00VDAxuODACJbBrVwunnbxQgO5RFASqnMCI16xeeGav60HPZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 02:15:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::f848:7423:4fb4:8ae5]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::f848:7423:4fb4:8ae5%6]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 02:15:50 +0000
From: "Xu, Haibo1" <haibo1.xu@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org"
	<atishp@atishpatra.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: RE: [PATCH 5/6] KVM: riscv: selftests: Use register subtypes
Thread-Topic: [PATCH 5/6] KVM: riscv: selftests: Use register subtypes
Thread-Index: AQHaI739E3YmlARpLk64YiH4s1Z7hLCesULw
Date: Fri, 8 Dec 2023 02:15:50 +0000
Message-ID: <BY5PR11MB3909BA1FE3809A51D413B98FB08AA@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
 <20231130183908.55860-2-ajones@ventanamicro.com>
In-Reply-To: <20231130183908.55860-2-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|CH3PR11MB8315:EE_
x-ms-office365-filtering-correlation-id: 77a7e1e4-f716-4623-ffac-08dbf7939965
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7AP5VSWxa6WPZ6I4BLPa2xoRXU4aCyDAsPWuLvKnafPvtGeFgJUZ8sWjK5GOECmyUkfQOs80AQgOYlB2AcjSC0pq4uFMDLeM50/Nfw6WTvEqUiEvXBhGUN9nHLvZgfYPGkzhddb7+t8Kfj/6iG64tN7pdR4ZN8o5cffs9JOtDtI+2KfNowDHs1il9T3qt9C1HHI47NUP1c8BzfF3toQKDCTkYNzUkuvmcx8MlifSm6x0d5UMCOeICB4KVF+z5t7f12dRNTjbEpM/XZFxeTrh3QFf0ktf/OAgUVbruNpuI/fFjU0lJDC1FkYuVeMTuR1d+2xsuxVlI9ENw9erdEJn0iFWRnRULaOBLWRGzL9IKq/Y37/nVOyDMJoS6UZDyMHCvHrNE/Jg07n6DXvdQ8Pqo/6JQ1n6MzPnsAAzpsThf0cF0ehOGCsZdZMht0KrI2iMmkaJs5NulUWckzOej3mgbWAVdGl41wMu77/vVPzKxSXvojag0W/dKt7BbkBdSJ593L74O2IeKjani/Ksa9LPALckgfCUoe2lJlVGH71n9+ooAVrCevmvZ75VggvMshaQmQiy1+jufCZXp2kAzz9gzMSHVWZfY6G4atOjerNvXi5sxKS7+jx3FbGpQVTOLM5G
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(9686003)(26005)(33656002)(7696005)(6506007)(71200400001)(53546011)(478600001)(122000001)(316002)(110136005)(66556008)(66476007)(66946007)(66446008)(64756008)(76116006)(54906003)(38100700002)(8936002)(8676002)(4326008)(86362001)(52536014)(5660300002)(2906002)(30864003)(82960400001)(55016003)(38070700009)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fcVBpSXe9LiqUh3vkzu+x8vKF+IxMxWdVbsMmtieMIJGOVdEzGPiNv6w2rMN?=
 =?us-ascii?Q?Fw3/zZ+8Nx5DClI9eb7GKh3Hmu3WEsvcWcIZoxGpd0ZrG9BbB8yBxjgVYoGT?=
 =?us-ascii?Q?xR4uCi8TWJLZeXvDJ7vOHhthzGMIRQSEKW8rWiWFWPe0wtef3hFa7nII73oj?=
 =?us-ascii?Q?lXocI8p0VeIjlFr6BdZWKV16s/aYSeHHo0dgq5/qGpAlRgevdx0gJWsvmBf6?=
 =?us-ascii?Q?G3gvUYLlgosN50VF5tyZywPpavXwWxmgMJKo/FOcGGgAnjuhnGbdKcGGOMBn?=
 =?us-ascii?Q?L+yO4hIYKTVo1UQJldGbEwkrktvhFcMe5+gLgYzTFAaDxnUIJi9r2yRV+hwV?=
 =?us-ascii?Q?IBFJfTRUqF8L/2tNUu3adydPwNYZu+brG93o3BWE9G9l1ckk1RNflLVqgTcY?=
 =?us-ascii?Q?3zXaETf2NhYagtyiXPu0EZRfTGPTqym/ol32sU4pa2ge5pTEj8tq1XT5VXOa?=
 =?us-ascii?Q?Q1oUk/p4N9pww6fYp+/TQrh/9tUGF/LG0+ig6fcQH2SDHNIHLZ2krnej+Bmf?=
 =?us-ascii?Q?hOrmFlFtRrbM7nI1IEp+pLbHb1GwWfD1jNr7z592LOG607k3XmfjvKqZ/ce8?=
 =?us-ascii?Q?SqqYVvrnlXjxDl5xPO2I3GkvZzGCzuYHKd797FrmhlqsKcm1dEeTpqRkZZpO?=
 =?us-ascii?Q?RWCQkCRXHbOGjcurXykgUHSPM04e7TY5mjUAD4UlI49BzfdlAPskNvmYUbvd?=
 =?us-ascii?Q?yK3+V1CDA0ekacS1MuKUkeb/OktcwNVfMFdnjp6cipLUYQMzzYOi/4Myv5lV?=
 =?us-ascii?Q?+Ko3b0n2+7d9MmWoTaxsGxmsyxJ+ds6/eW2+QTyxgr4DgWKf7Fh322kHZt/y?=
 =?us-ascii?Q?1DbrPhmF4dFJ05Tnc5reLo/pGsNBOo4m9q5yjj3GMFLWlWeLo7Vs2yT7gvtx?=
 =?us-ascii?Q?GV6FAUvmyGof+NOn0ufLROYNgQIOKBt4SgpbURKL2Nx2D7zjtj+rBJqudhR1?=
 =?us-ascii?Q?sJEHyo3V7gYky8wy6oJIP5pEwgu75Oc+QeXk+gkL/NEsYbQ7XF64W3q0U+M4?=
 =?us-ascii?Q?+Cp8t3uP3/Ps27JsLyDLfauhldA35ahBJ/axD69MrcgZpghvowSB4ITGseBj?=
 =?us-ascii?Q?aWCvBQ0lhKsVepRMoOsCo0UEH7nHFZuRdyO5+RliijLl3DPFwc0Uv11lpcex?=
 =?us-ascii?Q?+886Ose9dW+2iAEXR1imc3Y44iFwfEjZZ+0bpORmIbCH13B9W9iNfwdYBgAw?=
 =?us-ascii?Q?oK2wB4qpMZB3V5O7a/u3rZqMFroHk9x0y8sxIO5x+aR/WaU9CdTrs+PW/FSu?=
 =?us-ascii?Q?Lbw12CDYlEqYn5WyMCTm83lNu3ZHPTt+2EiF0DOHeul8yerct6JzRau+xyz2?=
 =?us-ascii?Q?H17EbgJCWMzP3uDWD4h+x+q5XYvcZ9LXVUg9Hz1MYQdomU2ei+Od7pd67gMb?=
 =?us-ascii?Q?O5BKHZe/bYj7aqGTWTcHQ6dyDDrMl+APjcHhKuJinj7ZQ5+TkFsT2rKuO2/w?=
 =?us-ascii?Q?1gYM6PgKYPsJnFFd1qBOM7iBP6MOEcIiY8li1EGEcj/n48L+jYxndB3kA+im?=
 =?us-ascii?Q?Cxsw2hDnUFj7roCMStz2bDA+yLliKvIsJfbAZ3z5aADmhharSajN974ss8l/?=
 =?us-ascii?Q?2vy+WmThOptxyQdoqWrAZom5VG5wSiCp98BoAy4V?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a7e1e4-f716-4623-ffac-08dbf7939965
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 02:15:50.8689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NVs1xAX/1XnrX+GynLKIl+zZ2AsSKjGCKUNNFJRMgxCKUrU3WmgVzJ/byVhxmbvMP6Q8D64yBrSV0xP93GP1GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_181559_329396_09941B02 
X-CRM114-Status: GOOD (  15.88  )
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
> Sent: Friday, December 1, 2023 2:39 AM
> To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> Cc: anup@brainfault.org; atishp@atishpatra.org; palmer@dabbelt.com; Xu,
> Haibo1 <haibo1.xu@intel.com>
> Subject: [PATCH 5/6] KVM: riscv: selftests: Use register subtypes
> 
> Always use register subtypes in the get-reg-list test when registers have them.
> The only registers neglecting to do so were ISA extension registers. While we
> don't really need to use KVM_REG_RISCV_ISA_SINGLE (since it's zero), the
> main purpose is to avoid confusion and to self-document the tests. Also add
> print support for the multi registers like SBI extensions have, even though
> they're only used for debugging.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  .../selftests/kvm/riscv/get-reg-list.c        | 167 +++++++++++-------
>  1 file changed, 100 insertions(+), 67 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 42c6244c8d6d..c3aebde0708a 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -28,58 +28,58 @@ bool filter_reg(__u64 reg)
>  	 *
>  	 * Note: The below list is alphabetically sorted.
>  	 */
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SMSTATEEN:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVNAPOT:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBC:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKB:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKC:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBKX:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFA:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFH:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZFHMIN:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICOND:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICSR:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIFENCEI:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTNTL:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHPM:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKND:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNE:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKNH:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKR:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSED:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKSH:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZKT:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBB:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVBC:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVFH:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVFHMIN:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKB:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKG:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNED:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHA:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKNHB:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSED:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKSH:
> -	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZVKT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_A:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_C:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_D:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_F:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_H:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_I:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_M:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_V:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_SMSTATEEN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_SSAIA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_SSTC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_SVINVAL:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_SVNAPOT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_SVPBMT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZBA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZBB:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZBC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZBKB:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZBKC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZBKX:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZBS:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZFA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZFH:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZFHMIN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZICBOM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZICBOZ:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZICNTR:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZICOND:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZICSR:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZIFENCEI:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZIHINTNTL:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZIHPM:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZKND:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZKNE:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZKNH:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZKR:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZKSED:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZKSH:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZKT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVBB:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVBC:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVFH:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVFHMIN:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKB:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKG:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKNED:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKNHA:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKNHB:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKSED:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKSH:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |
> KVM_RISCV_ISA_EXT_ZVKT:
>  		return true;
>  	/* AIA registers are always available when Ssaia can't be disabled */
>  	case KVM_REG_RISCV_CSR | KVM_REG_RISCV_CSR_AIA |
> KVM_REG_RISCV_CSR_AIA_REG(siselect):
> @@ -362,15 +362,10 @@ static const char *fp_d_id_to_str(const char *prefix,
> __u64 id)  }
> 
>  #define KVM_ISA_EXT_ARR(ext)		\
> -[KVM_RISCV_ISA_EXT_##ext] = "KVM_RISCV_ISA_EXT_" #ext
> +[KVM_RISCV_ISA_EXT_##ext] = "KVM_REG_RISCV_ISA_SINGLE |
> +KVM_RISCV_ISA_EXT_" #ext
> 
> -static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
> +static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  {
> -	/* reg_off is the offset into unsigned long kvm_isa_ext_arr[] */
> -	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
> -
> -	assert((id & KVM_REG_RISCV_TYPE_MASK) ==
> KVM_REG_RISCV_ISA_EXT);
> -
>  	static const char * const kvm_isa_ext_reg_name[] = {
>  		KVM_ISA_EXT_ARR(A),
>  		KVM_ISA_EXT_ARR(C),
> @@ -427,11 +422,48 @@ static const char *isa_ext_id_to_str(const char
> *prefix, __u64 id)
>  	};
> 
>  	if (reg_off >= ARRAY_SIZE(kvm_isa_ext_reg_name))
> -		return strdup_printf("%lld /* UNKNOWN */", reg_off);
> +		return strdup_printf("KVM_REG_RISCV_ISA_SINGLE | %lld /*
> UNKNOWN */",
> +reg_off);
> 
>  	return kvm_isa_ext_reg_name[reg_off];
>  }
> 
> +static const char *isa_ext_multi_id_to_str(__u64 reg_subtype, __u64
> +reg_off) {
> +	const char *unknown = "";
> +
> +	if (reg_off > KVM_REG_RISCV_ISA_MULTI_REG_LAST)
> +		unknown = " /* UNKNOWN */";
> +
> +	switch (reg_subtype) {
> +	case KVM_REG_RISCV_ISA_MULTI_EN:
> +		return strdup_printf("KVM_REG_RISCV_ISA_MULTI_EN | %lld%s",
> reg_off, unknown);
> +	case KVM_REG_RISCV_ISA_MULTI_DIS:
> +		return strdup_printf("KVM_REG_RISCV_ISA_MULTI_DIS | %lld%s",
> reg_off, unknown);
> +	}
> +
> +	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype,
> +reg_off); }
> +
> +static const char *isa_ext_id_to_str(const char *prefix, __u64 id) {
> +	__u64 reg_off = id & ~(REG_MASK | KVM_REG_RISCV_ISA_EXT);
> +	__u64 reg_subtype = reg_off & KVM_REG_RISCV_SUBTYPE_MASK;
> +
> +	assert((id & KVM_REG_RISCV_TYPE_MASK) ==
> KVM_REG_RISCV_ISA_EXT);
> +
> +	reg_off &= ~KVM_REG_RISCV_SUBTYPE_MASK;
> +
> +	switch (reg_subtype) {
> +	case KVM_REG_RISCV_ISA_SINGLE:
> +		return isa_ext_single_id_to_str(reg_off);
> +	case KVM_REG_RISCV_ISA_MULTI_EN:
> +	case KVM_REG_RISCV_ISA_MULTI_DIS:
> +		return isa_ext_multi_id_to_str(reg_subtype, reg_off);
> +	}
> +
> +	return strdup_printf("%lld | %lld /* UNKNOWN */", reg_subtype,
> +reg_off); }
> +
>  #define KVM_SBI_EXT_ARR(ext)		\
>  [ext] = "KVM_REG_RISCV_SBI_SINGLE | " #ext
> 
> @@ -635,12 +667,12 @@ static __u64 base_skips_set[] = {
> 
>  static __u64 zicbom_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG
> | KVM_REG_RISCV_CONFIG_REG(zicbom_block_size),
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> | KVM_RISCV_ISA_EXT_ZICBOM,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> |
> +KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM,
>  };
> 
>  static __u64 zicboz_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CONFIG
> | KVM_REG_RISCV_CONFIG_REG(zicboz_block_size),
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> | KVM_RISCV_ISA_EXT_ZICBOZ,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> |
> +KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ,
>  };
> 
>  static __u64 aia_regs[] = {
> @@ -651,12 +683,12 @@ static __u64 aia_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR |
> KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(siph),
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR |
> KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio1h),
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR |
> KVM_REG_RISCV_CSR_AIA | KVM_REG_RISCV_CSR_AIA_REG(iprio2h),
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> | KVM_RISCV_ISA_EXT_SSAIA,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> |
> +KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA,
>  };
> 
>  static __u64 smstateen_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_CSR |
> KVM_REG_RISCV_CSR_SMSTATEEN |
> KVM_REG_RISCV_CSR_SMSTATEEN_REG(sstateen0),
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> | KVM_RISCV_ISA_EXT_SMSTATEEN,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> |
> +KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SMSTATEEN,
>  };
> 
>  static __u64 fp_f_regs[] = {
> @@ -693,7 +725,7 @@ static __u64 fp_f_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F |
> KVM_REG_RISCV_FP_F_REG(f[30]),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F |
> KVM_REG_RISCV_FP_F_REG(f[31]),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_F |
> KVM_REG_RISCV_FP_F_REG(fcsr),
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> | KVM_RISCV_ISA_EXT_F,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> |
> +KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_F,
>  };
> 
>  static __u64 fp_d_regs[] = {
> @@ -730,7 +762,7 @@ static __u64 fp_d_regs[] = {
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D |
> KVM_REG_RISCV_FP_D_REG(f[30]),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_FP_D |
> KVM_REG_RISCV_FP_D_REG(f[31]),
>  	KVM_REG_RISCV | KVM_REG_SIZE_U32 | KVM_REG_RISCV_FP_D |
> KVM_REG_RISCV_FP_D_REG(fcsr),
> -	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> | KVM_RISCV_ISA_EXT_D,
> +	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT
> |
> +KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_D,
>  };
> 
>  #define SUBLIST_BASE \
> @@ -754,7 +786,8 @@ static __u64 fp_d_regs[] = {
>  #define KVM_ISA_EXT_SIMPLE_CONFIG(ext, extu)			\
>  static __u64 regs_##ext[] = {					\
>  	KVM_REG_RISCV | KVM_REG_SIZE_ULONG |			\
> -	KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_##extu,	\
> +	KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE |	\
> +	KVM_RISCV_ISA_EXT_##extu,				\
>  };								\
>  static struct vcpu_reg_list config_##ext = {			\
>  	.sublists = {						\
 
LGTM!

Reviewed-by: Haibo Xu <haibo1.xu@intel.com>

> --
> 2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
