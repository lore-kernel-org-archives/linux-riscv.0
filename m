Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506CAECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 17:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfoJBFShe6sf++pVtRjIZ7t2AUseClet7v4oRw6kOTU=; b=Ge1sPtvavFehND
	kxHeHDxGWGzMmGgsaz2ms0+C51BRw+P5OAOvcBB2QEAk5rUH0tiztzYgav/n8+JNx/C29e4GmN80d
	qMO3EJeSYdY2dk5P9CWgmL5uoeMPpgunbMalyZXdOwW0mcgmkz6odDV2sn7Vb/vPpd1dOQOu0a6mg
	qBbCBsQnKPMjiYyhMkCQCmGyKCI+TCfWQpyzWg5FkGr9Pns7ZVcdrSxuEH2ovzgxTrXjQhfeIt6OS
	AojwPPUim0XJz4UlaqR5DZkaGz7HFZe/LBgu6UzwkmDckCEUnwwYcnDhvVcQ8coL6WO+baA5YTkLT
	yPaYME98/C7R9lXVmhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsR3-00Dy4g-Hr; Thu, 15 Sep 2022 17:13:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsR0-00Dy1r-UR
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 17:13:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663262034; x=1694798034;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Lgo7oNHJc9e4LTVWR4dGO+3HO3XIddZDIxeinnrpey4=;
  b=g6qdausv65273AgZj3H3ItUScC5jDLxMIpsDpIeqeD5I87VBNvzpDzYm
   3dMFoylKIFjqUCcf7XKIXbccCbJM7qS5fY2VNrzXdPb6S4xSCcupLZ7t0
   fy27Ptuv6Ff0ru9/o+uZhy8XVUD6MDY0YeE2wrNweZwxbQkR9++w5wHEm
   wXg82YytijCJi7rbJWMQWYdRVbf9Oh+hQzFrpffUz5augb2bfVfm6a3WP
   b5NU09ixHJr7OIrVpAekKWcelpFF27Fe8lc/U6eByPzdgb86uvRgUOfrY
   Bjhwsi+h6TuhKn0qQySZhKdKgUQfTrs+XKdJZ3qi60RCteRHWFbM+0voi
   w==;
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="177355895"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 10:13:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 10:13:54 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 10:13:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aueMBf+dfVT4XB9Zp8jecCK40bYNlVygVDRnenOu2KdtN9ZkXLq196nJu9NujeLVG1l/Cv7wiy24/d/yyW+YFnpUzx/E4XTeusLktmCQiM3d60fRt7R8vppxZ5pSG7HOzRVY/NjkvWg2iV8ZT+QtyNfPKiYMP+Dqvn14amDsCDoffDhjoW7ml0CKGXezhFutEB45J1kLw8cdWjZP74KC0hPwQnJISwwHgSpcQ2NyIDTbPURNo+I9lEzpjpYaLJFlMM+KRDBHaqRfruScIL6h98K42y5vtB+3M6aqyYuw3ZD5nhZcA1ilcIz2531tOJOjFB+OVu1elrx/8CtpSgsCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lgo7oNHJc9e4LTVWR4dGO+3HO3XIddZDIxeinnrpey4=;
 b=Ca/0RQxY1OnlRHibG5bxwY+c/FOv6b14/U66UeSVKCcdC2NXZJIm9PqfaJUXk6shrZo5ZMQrNTWMmB4UL3A6c3b542JshETOV93gSohvcO7dfF8amhNPCk8wFp8TIxOKIlnRE9HEDRu/hgkD2EMxFZbjet52OM4jAwfhdd6oY0zt9GLWCb9ybZN5qSuR5RMRMTA1/PbJNiCSE1OiieW2KZdJBFbDYSaV+SmDt8ZO519a9NgPeMlrLsKsl4ZN3EiA7YefGfCG4URpi/xslpVeKt29ZqKrDOttkWzVGXKCMTlbNi1X3tgWtWIzNsORVSAsGcSxudblmnFaU9zhvsG/Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lgo7oNHJc9e4LTVWR4dGO+3HO3XIddZDIxeinnrpey4=;
 b=Ub1fLefL6BZNcXdT1nhai9zaV7MBAH3+T5YMNHui77riPLHwjXJSBT2nhLODUZ4X68hnqCkGfY7mmF+VZfqeXx2GP5Hd0NfKR74KsDh4UX0ebqOAN6cvcgjo5NiZtYj9MD1exNDXYtCO5UHG8qHKaYWxLLOhCivkBkHHYm3KnlE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL1PR11MB5286.namprd11.prod.outlook.com (2603:10b6:208:312::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 17:13:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 17:13:49 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <linux-riscv@lists.infradead.org>
CC: <stable@vger.kernel.org>, <lkp@intel.com>, <Conor.Dooley@microchip.com>
Subject: Re: [PATCH] RISC-V: Avoid coupling the T-Head CMOs and Zicbom
Thread-Topic: [PATCH] RISC-V: Avoid coupling the T-Head CMOs and Zicbom
Thread-Index: AQHYySX04J3T8cLKWE+kVDCBPlpova3gur0A
Date: Thu, 15 Sep 2022 17:13:49 +0000
Message-ID: <4d943291-f78f-31ed-0d67-7073e1f762e2@microchip.com>
References: <20220915170900.22685-1-palmer@rivosinc.com>
In-Reply-To: <20220915170900.22685-1-palmer@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|BL1PR11MB5286:EE_
x-ms-office365-filtering-correlation-id: 62ae44ad-a70d-48d4-6fe3-08da973da7d0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Lcw/rWun3B0FV5MEhtvoNbWdN26sUbqSSAX9hDzB2yUOWl9Pjqek3UO6kGCOQORV5A8Gflcj4N2BwWVmeZNpFQJyBLf/3LJXsMg6wjDfxy8Tq/yLdEzzOdBXXvYb8bCCVjzH8SIvBbyHsJpcj33cWzXkgQCGoATqFciFyOfOLM0VaxA8pK2D3o9lJQCSsUlr4oBF+ZUeLxo6Fp0xRyUjERQ8erjKokTkRT/DcyK2ivXV1W3K7mfqhjHHuPfeNj7YUG98G6w3hes49UJVKSy6xi5w/F0R486mGzl/Bhjhd0ysXN6K+jajEtNeV76tGySPnsTqNmTTMPy/I+SHnY5phyxrFfs9X74Yg3Pj33hgfbJc+CTjbM+wU2yN1Mw9LnhNrq8f+auM6/YxxymgRN3A7w6ggiW2MC1PdzQsWbZf2z4r+XAVGikfvCS/GQGWlnsVTdX9ZfHwnyI5Q1xoJWncP5bykNoNCIjlibORNPYVZFPWc1z8FFXfiBfjdFFLNipXeoroobbnNwldDy60N2/4ESFW7hrzw42FHTEtxoYmAnhc2JuEpQnfBLYcvmYLxmGoCEyEFzBeDPDStZDivDACpK7VtWLostmzrVEMcM2PG73zNHtBC4FgsIqhqvShS4xc6JOR2Gkbtp9YGVsSRXtF60IkBAQOKoMT8E/q38yefSnncrHVZzvDLUGq4Q8yiKCKwNHiHKC/SYt+wjxTEPMaHGFDvX+sle/CkP+PvnyDdZ9MePSB6adukrz2SVS+QvODlDW4af75SQHJYD0l8o9K/ZKjeZJ258O6Zi6CRUCZwYSNFtZKwOYjoVkQr2qc6GK/qMZ+YoQHRjRxzkvpMayZGg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(136003)(39860400002)(376002)(366004)(451199015)(91956017)(76116006)(66946007)(66476007)(66446008)(64756008)(66556008)(31686004)(4326008)(54906003)(6506007)(316002)(8936002)(110136005)(31696002)(86362001)(5660300002)(8676002)(41300700001)(38100700002)(71200400001)(38070700005)(2906002)(122000001)(6512007)(36756003)(478600001)(6486002)(53546011)(186003)(83380400001)(2616005)(107886003)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDZxemRCYTAvUHB1NVZidTJvVWplZWVyUWcxZUNDSGpRWHh1MVo5RUZOOTlV?=
 =?utf-8?B?YU5tWUQvRVJ4SEtGbEFjZlREcnlBL2NuRlk1b0YyUHdBcTN6R3doeW9EREJV?=
 =?utf-8?B?T3BwZ1A5TlVDSjVNTjNQWmZXVEZKQkdYN3hYTGRoTEpLVThWVndMalZvT0tE?=
 =?utf-8?B?MzFnRnJJU1VnZXhjb3FTa0t3bS9pVGdKdHcwSjZGVk03NDlEcTJUb2w1SSs4?=
 =?utf-8?B?K3JHeXQzUnA5TDcwU0k1dGt1VGhXTnhKcjRBWUZGVnBVL3RPOURWZU8vZnYz?=
 =?utf-8?B?d1lzY3YvRE90dEZOYTVKU0ZORFRtVzFsR1pETmVuSDgwZkMxaHA3NUJ3dkNH?=
 =?utf-8?B?RjlQM1RvQmtjTTJkR204QUkxOE9xR0NPVUJaTSt4TEduWk92dDZzM0JqeTZz?=
 =?utf-8?B?TXdQUUMyYmdERFNqcHJlL29wazZpVUExdFUvNURhVnlhYkV4dTN2VkZTOXJ6?=
 =?utf-8?B?TElYMWJua2doU3V1VDVYNUFTbnR2L1ZOVDY5MmdHQ09IbzI2eFovTlBXeWFO?=
 =?utf-8?B?aVBnVFNFSEJVb05ab0diU3RuTE9uNzUvVzgwY2ZoSFFDd0Zid0hzbFpHRC8r?=
 =?utf-8?B?TUM3THQvTkdmL0YxcS9aR29PbDhTWG5KdW9TeHF3TThPOHhzNExNcEZzT0U2?=
 =?utf-8?B?aWIxcVBLRHpYeWpiYVZFR1RrVmJRQTZUdkxvTCtsSkphN2k4aHBDQ2tjUWNP?=
 =?utf-8?B?bXhncDhYSjV0K1RaN0VWVUVVS0M4RWJ0QVdrZUVFWHFlMExiQW5tbGtRbUpC?=
 =?utf-8?B?VnZaUWRaMy82S05DUTBVZ0FtUGRIeEhZZHdZajl3cVQ5Vys3NmpSc0ZZR1Ri?=
 =?utf-8?B?NG1pNkl0OEdWOGJobnM5WWlDNUN1WXlRR20yNzViTk82WVVCMnVqOFVnSUJH?=
 =?utf-8?B?RUpYbWlMRWN4Nk05NEd0dTFzakFodlZxSkozek9zMExuQlJCUGIzdEZTb2hU?=
 =?utf-8?B?ZkJkMnFiNTh2VWx3Ui9TWDRkL0ZHdXE3RzVRbjdFbWw3R2tpUFphdnFVeCt3?=
 =?utf-8?B?Ulh6cjAzc3dhdk54VEtXdmZ5UnhSSC9LWkkrQ2JWdE9sSStRbGdsN1VvcGJW?=
 =?utf-8?B?MEs3VjZHNmE5eWhzTmljNUV0cHZRcWprbURNcDZpeDloR0QyRVVudFFkNFZs?=
 =?utf-8?B?dTJxM1RiNC9GVk1rS3NFaDBhSTRFV3QwVEdhTzErT3BPOVRwaU5SaHltc3pa?=
 =?utf-8?B?ZzNHWFB0bGovZk9tc1J1NXpuZFpob21pQTdvWjNXMFFaU3VnK0tSaUF0dldR?=
 =?utf-8?B?Wm9hK3drM0Z3NHpKRjAxcVlnb0toRFBVWld1VFNoWnJkWE56ZmRSTk1JQU9o?=
 =?utf-8?B?S1NwNUdxY01oSWtZeHFQU2NEOWZLc3FMUE9JZDhwNU5Od0JiODlQaXRhTGRB?=
 =?utf-8?B?dGFwWW01OTVyUkVKZUg0dUFzV0t4RnNGSGl0dHY4eEVNUmhWRG1VbGY4RTE1?=
 =?utf-8?B?Y3JMTzdTMGtia0tTcGl3bW5aUVk4bUtUS2F0Z3UvZjdOSWM4UitOd1NRdjMv?=
 =?utf-8?B?a3EwTHNpQXByRlVyOStqSkdVY2kwTHprTWNWaGt6NXRvbllXRDNZMUdxbkt4?=
 =?utf-8?B?YzVDVlZNTm5ENEdES29GYXVvdmg0SHBVeUpaWVVmc1N4TEJ6NTVzbzgrQm1w?=
 =?utf-8?B?OVBFbEZxd1RkcHlvZlJRKy9FL0JZQWZDME5laWN0emI4YTBDRFlIbmF3ampm?=
 =?utf-8?B?SklTVDV2bG85WDc3V01BTmRIL1NNNDRkNkJaT3NDUTRPKzl1N2ZVVEpUcWpI?=
 =?utf-8?B?eFRITkpNS2srd3g5NlJoVXJwL2lHZXdhc3Q1UG5pK2x2Y1FOZkE3ZlR6TW92?=
 =?utf-8?B?SEFQWjFWK2c5bXdrUXI2clFZSk5pQmRuQUNKa1VESkU2bmFycFJDQWRrK2la?=
 =?utf-8?B?bTNRZFJ2TW9Jam1PMXMzMnlNNE5TMmNmT0JFV3NraFlTTjBqUnRYekxpeWlk?=
 =?utf-8?B?cVdjVkZOc2tFL1pPMSt3MHluWGhzZDUxNjdDVEw3N3R0NXppVnFZRVh4Z0sy?=
 =?utf-8?B?dTIwY3FUcTAzMlFISWNGMU1Ha3BHUityV2lJWkhIZTdBL1ZDWmRJV0ZIUFVP?=
 =?utf-8?B?dURKU2xCRWEvWXQ4OTFWVHdNaGNYUmN4RkdnbUs0Q2l2VTRBUWh0QzFIMFh1?=
 =?utf-8?B?dWJhVnZmaFFFOUJnNzVBRzlHNTZpbSs1Q0RCaUlZYSt5UGxoSzdCMnJYcU5E?=
 =?utf-8?B?Tnc9PQ==?=
Content-ID: <78F9AB1B71A4EC41A7678A50FD8F1EC4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62ae44ad-a70d-48d4-6fe3-08da973da7d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 17:13:49.0444
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZv577JelyRGCN2F7vcW7qKzEvcGK9tzSMgb0vdnX4OFviGuveOonQZj7Gf2Rw2sHJD9i/KBch4k3NOfiyurMfMBfWyV/dlGXnFJJO9neLg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_101355_067799_11F1D496 
X-CRM114-Status: GOOD (  16.70  )
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

On 15/09/2022 18:09, Palmer Dabbelt wrote:
> We could make the T-Head CMOs depend on a new-enough assembler to have
> Zicbom, but it's not strictly necessary because the T-Head CMOs
> circumvent the assembler.
> 
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Cc: stable@vger.kernel.org
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>

I build-tested this last night when I accidentally found it so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/include/asm/cacheflush.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include/asm/cacheflush.h
> index a89c005b4bbf..273ece6b622f 100644
> --- a/arch/riscv/include/asm/cacheflush.h
> +++ b/arch/riscv/include/asm/cacheflush.h
> @@ -42,8 +42,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local);
>  
>  #endif /* CONFIG_SMP */
>  
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> +/*
> + * The T-Head CMO errata internally probe the CBOM block size, but otherwise
> + * don't depend on Zicbom.
> + */
>  extern unsigned int riscv_cbom_block_size;
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
>  void riscv_init_cbom_blocksize(void);
>  #else
>  static inline void riscv_init_cbom_blocksize(void) { }
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
