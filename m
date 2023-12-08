Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5252DC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 02:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nDHU3/K+NOQZ2EngimaLr656/vBQyLJWchYTFg//5wg=; b=X7h/ESL6B+QLDz
	zE8HYrKXNOxyIzaBfFxQA9afR4d5Bx2+t/ZvOATbzOBFRmmUe4L37h1ViZqWiujG/zqavjIe5xwMm
	wwin05iL9FwYFpk/RyHiHvjhpN/EFUWSU41prGAcdpSSBL8zpywrDzegSdSw3r5BDs9L75tGj6VB6
	mk3rb/vmDDTKVGnTijUQVnM9znVsdk3ea/zByl/Ciewe+8EZEDrPQ1e22QNYzgkOLejO3fOHdWTKX
	JfCBFL1TfBYyiOl/15aD0EoqyCAx2edupdd6yZsTj4guyP8tkgDmLD5wBtwF9s7DG6Cn3FTa91Qrh
	SzJLLntQVJCL1EXnWiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQM7-00EWb2-26;
	Fri, 08 Dec 2023 02:12:43 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBQM4-00EWaC-0O;
	Fri, 08 Dec 2023 02:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702001560; x=1733537560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XK9Yt/SMLrEWoCwBwFM6QAIO1g8XMppeBh9NpFJlCD0=;
  b=mGFf0nIVAtVxwpGo6riURBZQ5csUeTaioRkRiPDREpb7Y3uJ7CfrNVHi
   u0IUJsSY1imiFs3+mRtj+9XGOvg5R5v6FCHXMUtX/ii3OQ5vSEZa5ydHe
   h3eD6SqyLAwnYp/R46aWhhEh72LISTlev2L/BSvhcZPfNFzDrCgp5QDKz
   N1uDWZFb7oKMLsOGDmDAiwzs+YEEzFILrRcZa4D0TWp4xQ7WopTFuYBEk
   o9SafaIBz+eSD+1WrVhRfgiYNj9lvv3rftvEN2ZzVD0BtgmUS47YXqNA+
   ZYI2CLY3hv28fdTCGv8No7bCCQHQq+tIPkTV/nMmgO1GC0xFMiRIWeoTF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="15896580"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="15896580"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 18:12:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="748185053"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="748185053"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Dec 2023 18:12:35 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 18:12:35 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 18:12:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 18:12:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKv7toSTg8dMcPZaJQE1frhXkjmz/OEdlE//BDHSN9IhSjShpnCfsknBb0prpf+wDZNyMFTLaLIgWGWfIEhK/jARtOxGWCKeWRJ4RK9/ndLxq8IYDdFWWfad+dC7vMcI5MGfRKyFEogvqijVOiEvDuIkd7/T639CH42c9trzmOS67X29XsyKQFZH1pT1YkMzTGZ+6Y2bR739jhDEmdUj4ux2f+6QGnN4jUTFqWPpXwrm9YF4GpGIqOFo33ic7patgPZdpFVuG5rycQSWQyH12/rP94q8p5U5fHQZRRP3AMUqMy31kZAPhBKI+3/k/2T+P6D/LU3YKbKmRxh0CAJNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Hiu0T/Ntx9mAPoUEEDqaBh0kjDQ/q53+JPP/L4Gru0=;
 b=hYUCY7/XE3J7TNkh/colTRGUV2NN28veVwhltYW257V4R6crTi222AYANWbqjiwACN61RQ4HSt9528SDAYDoZTzbFmbgNKIxStkR8eJToCqpTh+D7T+4VoNsrYvzxYJ4miFsi74Z23GTW+yxVmCpqqGJNZ1R4MxZ7JFFT3WPLidexH1fGABfdn88zwDv7iSG01pb+YNl1ESrxwLRCVgYooMJgOv9dBIUvxgtKgeV4ivdBfQ3AhW3magwFZ3m6o1nX4ufOhwfA5KU+Zl1Hxh+KR8WmTnYzfdXq8tbBRXtPeEnWD8XQurK7bne6K3+9Mb+N9DDJZ2j8mZJlxfc/zvuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 02:12:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::f848:7423:4fb4:8ae5]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::f848:7423:4fb4:8ae5%6]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 02:12:25 +0000
From: "Xu, Haibo1" <haibo1.xu@intel.com>
To: Andrew Jones <ajones@ventanamicro.com>, "kvm-riscv@lists.infradead.org"
	<kvm-riscv@lists.infradead.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
CC: "anup@brainfault.org" <anup@brainfault.org>, "atishp@atishpatra.org"
	<atishp@atishpatra.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>
Subject: RE: [PATCH 1/6] RISC-V: KVM: Don't add SBI multi regs in get-reg-list
Thread-Topic: [PATCH 1/6] RISC-V: KVM: Don't add SBI multi regs in
 get-reg-list
Thread-Index: AQHaI8KzcUNK70xC/U6Sx/K/HPFTk7CesEFQ
Date: Fri, 8 Dec 2023 02:12:25 +0000
Message-ID: <BY5PR11MB3909A954D3FC81F3644673C0B08AA@BY5PR11MB3909.namprd11.prod.outlook.com>
References: <20231130183537.55203-8-ajones@ventanamicro.com>
 <20231130183537.55203-9-ajones@ventanamicro.com>
In-Reply-To: <20231130183537.55203-9-ajones@ventanamicro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_|CH3PR11MB8315:EE_
x-ms-office365-filtering-correlation-id: 32729775-3148-4056-19db-08dbf7931ee2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wlIVs1ILQux2YCHWP66D6Wj6NqqU+DcGmbdmvHRMwjADHYBjsZqFotQqf3dpHednIQBeEJKxIjuPnSvCrA9JcVLKDWzU4zu7Mphxj5thzBx6zI9SzCOILqMSeN42NeG2bxc0kRzdNWn25CKADX9BYASqRN+i+EHichw4AuJDkJyUaue9no424t1ebkjEoA0arcgINlBN0oc0rCFQyLUKO/3ASyr5ALFcwO2+jh3z7sAGKSycR5nWnoVBCxkX0DEVe+UNTsLj1gudsql5BCWqsVrHbnFWh/RRak37+IzyMMhejlplK2rtEMP1JZlhZ4ekQhVQSeZWf8tN0q+l76DrWEjCEmWpsqd9Igoba7igO0pF210zVDLfVp6qdzoYhdm9/IpD+YXv66eSGpJivtaV5QhFXPM84mJo3zVVtnenXfiXG/l4nNIHVVJwrhPQAqw0SDCbrrtymql8oZKCC+nRIRjcsi8tNEzawF9Z521kJNLZCTLA7zhKAIE0aPLfkU5wG23yEdggRZIETp6gbfBjl034LRpwzgO4RoXatkGIUv47UAvTVDD1o1rGtzNH4bKan9YA0WhImq35YLF4FtqUl4Mf9+ykiUYr6mEV8nFkzA13jQjjXXuS8Ub0kQQV+mq6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(376002)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(83380400001)(9686003)(26005)(33656002)(7696005)(6506007)(71200400001)(53546011)(478600001)(122000001)(316002)(110136005)(66556008)(66476007)(66946007)(66446008)(64756008)(76116006)(54906003)(38100700002)(8936002)(8676002)(4326008)(86362001)(52536014)(5660300002)(2906002)(82960400001)(55016003)(38070700009)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1u47VOVI4aQ0WUjI+WtH/ibtFmwu7oz+Grl4Nk8I+8SYS8FyS/axjR6R+gTF?=
 =?us-ascii?Q?hMIDeeD+PCAVS+VLXeNHeGrhLJ4Wnu8sb+anQzsGKNhCOdRERyl3igGyeyV/?=
 =?us-ascii?Q?Zq94g8LFUoACnGkKvPcBDvjaCd2s2RgMOb6agPkSfYuOJYnxd+JMTz2oFrrl?=
 =?us-ascii?Q?57RcT2/Is+cjaNREfGwNMez8WHTCkLumFVzcsPNSJ15l8Qrdb8PJWIw4dR+o?=
 =?us-ascii?Q?t3Vuj3cIlzXo0lCPZ11/ji7eghuqQLST4RqXMzZY4vuHCorissXa4PFC3DlO?=
 =?us-ascii?Q?mx57tMgydq1GC6LBCyy/qdw0klTES+oiAIYJuqicL+Wrj1ZUSJBCJqbl+dCW?=
 =?us-ascii?Q?bKz0rmt1JYjeeOwvkx/+Ytgz8S4a62EU/iF1M9qio/goXh/ryR0Qq7hca0S3?=
 =?us-ascii?Q?1jGNx4jL0LWbfM/n5DLk/h9Z9XhOjlQhHv4g3m+xTvDXIIoNQ3cy9q4yl3+W?=
 =?us-ascii?Q?xBwwMVfcpt3hn/SzzDUzAimDoSWvjE9sBO403MfPIkU4beNdVs6r2zB/mA5p?=
 =?us-ascii?Q?XdZc0HeVHlQTJGB4NPL0c6GDZ7dexSTGiS2JIeLLACFXDstNK+kOgrRsghEg?=
 =?us-ascii?Q?SCpTnA20FdUFrm1ZyDXDUA23HpTnxHioW5ZOSHTOdIqTTPUUJzT326coseGP?=
 =?us-ascii?Q?FRUpKv6q7qWMgRvU8ABCSfPsV0E0eOr74fVbBoi7QAlI/BgKaQmUbsT8ObLP?=
 =?us-ascii?Q?70l325OMaIzlVLqtDCSo0xb01SJ4bz3q+9HHtcQx8HnaU7j9PPpiH+5eFqjH?=
 =?us-ascii?Q?i0oMMCklFK12usWxXgbn2yXcKTsa3NpYFogwhUejP+sfHQ9aXpIyYaVrGow2?=
 =?us-ascii?Q?A5k9eAJWyHrx8FxGEFXjdHT4lFLz/Rjkk42Sz3Zw8bh8XIMq4rMIpQrCr6lN?=
 =?us-ascii?Q?4aiZT2+n1rGRmwqEbEP0v3xNWTyjwQxywU/pf4uZsJ7Ke90uE0WyAM2m9gZR?=
 =?us-ascii?Q?GCbiqRbJwh7Rk1XfLlLMpAZTk5S5TxsIPJwqQmC6s1QGApyV6pMdv1Fga27S?=
 =?us-ascii?Q?0EnTlHkTcmxopTsYC+ziWsI/mReUvUToo1/FVsfUXlfzGSixlrl0bumxDhRC?=
 =?us-ascii?Q?nVktp8toV89DJgGgM7MDDrosK7iHndtSmRpsMe4gZylcUIh++WfCeRgtYe32?=
 =?us-ascii?Q?AO0aiIJqq0n42PSbGMUS8BRPqGPW3f1HTY+BwFniRlll1yNr9F7eEQCUiXH4?=
 =?us-ascii?Q?hBGLUDp72NIUXB1IYYcvYX/jQoJXUhF2Ru+LHbdbt43Qf6Ya1MOAQ2i3WeXp?=
 =?us-ascii?Q?5I7B0OkXpH4v24hITxbB1OSpbHqyDQKX2IVKYSPC8Ghl9rp47t7UQSvFMx2Y?=
 =?us-ascii?Q?2wOWNkl9ZUy/CS8H/zPsm3xA30XHusy+Z2tu+M1fjfhGHpFk3AThs7NwfaSc?=
 =?us-ascii?Q?A2SdoL2QNokb/mOUwHZYGOTlMFwL8QoXReQTsq6C52CbJi2fLdEA/m2CijT2?=
 =?us-ascii?Q?uIFqf2VOJQCmDrl6/2swNgcYnuk811Yc+U3i5Wab/YXDab+BtDguTROdIw6c?=
 =?us-ascii?Q?v64x3Av6G/7Fd0aYSkcveUGf7Y+WFTctqXoqjFd77DPyWwoNj+FVVHClziwn?=
 =?us-ascii?Q?428nAHlLlpUuv3+k/ib00GhaSJnAYSscXLsp31/Q?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32729775-3148-4056-19db-08dbf7931ee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 02:12:25.3369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 16ZwSF+PBtArgTyNRzwaVAH/slM/8eWniZ91YBTuY8LxW2Wc96rD8dsME3CZzYfA6Lre6brpGvBwot0JRgFhOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_181240_210677_4FA0156E 
X-CRM114-Status: GOOD (  17.51  )
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
> Sent: Friday, December 1, 2023 2:36 AM
> To: kvm-riscv@lists.infradead.org; linux-riscv@lists.infradead.org
> Cc: anup@brainfault.org; atishp@atishpatra.org; palmer@dabbelt.com; Xu,
> Haibo1 <haibo1.xu@intel.com>
> Subject: [PATCH 1/6] RISC-V: KVM: Don't add SBI multi regs in get-reg-list
> 
> The multi regs are derived from the single registers. Only list the single
> registers in get-reg-list. This also makes the SBI extension register listing
> consistent with the ISA extension register listing.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 36 ++----------------------------------
>  1 file changed, 2 insertions(+), 34 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index ba18587ae8c7..0ec265a107b5 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -987,20 +987,12 @@ static inline unsigned long num_isa_ext_regs(const
> struct kvm_vcpu *vcpu)
> 
>  static inline unsigned long num_sbi_ext_regs(void)  {
> -	/*
> -	 * number of KVM_REG_RISCV_SBI_SINGLE +
> -	 * 2 x (number of KVM_REG_RISCV_SBI_MULTI)
> -	 */
> -	return KVM_RISCV_SBI_EXT_MAX +
> 2*(KVM_REG_RISCV_SBI_MULTI_REG_LAST+1);
> +	return KVM_RISCV_SBI_EXT_MAX;
>  }
> 
>  static int copy_sbi_ext_reg_indices(u64 __user *uindices)  {
> -	int n;
> -
> -	/* copy KVM_REG_RISCV_SBI_SINGLE */
> -	n = KVM_RISCV_SBI_EXT_MAX;
> -	for (int i = 0; i < n; i++) {
> +	for (int i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
>  		u64 size = IS_ENABLED(CONFIG_32BIT) ?
>  			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
>  		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
> @@ -1013,30 +1005,6 @@ static int copy_sbi_ext_reg_indices(u64 __user
> *uindices)
>  		}
>  	}
> 
> -	/* copy KVM_REG_RISCV_SBI_MULTI */
> -	n = KVM_REG_RISCV_SBI_MULTI_REG_LAST + 1;
> -	for (int i = 0; i < n; i++) {
> -		u64 size = IS_ENABLED(CONFIG_32BIT) ?
> -			   KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> -		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
> -			  KVM_REG_RISCV_SBI_MULTI_EN | i;
> -
> -		if (uindices) {
> -			if (put_user(reg, uindices))
> -				return -EFAULT;
> -			uindices++;
> -		}
> -
> -		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_SBI_EXT |
> -			  KVM_REG_RISCV_SBI_MULTI_DIS | i;
> -
> -		if (uindices) {
> -			if (put_user(reg, uindices))
> -				return -EFAULT;
> -			uindices++;
> -		}
> -	}
> -
>  	return num_sbi_ext_regs();
>  }
> 
 
LGTM!

Reviewed-by: Haibo Xu <haibo1.xu@intel.com>

> --
> 2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
