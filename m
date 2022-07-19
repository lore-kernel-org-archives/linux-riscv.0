Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2878FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Jul 2022 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sy4jYlOn9/ql/ae3LsBE0wCSBmzW3/OoPqbMNB+Xu/U=; b=oGgUSUjSHdi0Vg
	B0CZZZW1pgXu/EhROnvVH/76Q/OT5ZbjX+2NKfLwK9HZub1Y9t7CUOou20xOtLkcx9LnOZ1+XYx5f
	7vyXsqfmkBO2YwRvDcv23Q+frHexh7SWAXcDtWgEhh9/zsnXAMw8mKHlMh3VllSRqusO/K7WAnsBF
	iroE/D7ypZcWu+24awsy1kim1zFcpnucgG+Sqi65CjwqSwv/jmZ12KOcwa56o2zxHnOLdkMz0eQto
	DWMqLELes/W1XiMhx0YUDevYFuqI25KEnDkcSMXt4jrCjjZLt7GLcuKdHT2/ZIbRvw2V/mPDftd+d
	mky61TNMuPA0HXe5arKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkch-0083Au-2n; Tue, 19 Jul 2022 10:38:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDkce-0083AD-6s
	for linux-riscv@lists.infradead.org; Tue, 19 Jul 2022 10:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658227116; x=1689763116;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=y7W0HMXJBBKDSaoL797Gfoy78Pe2e/eW/Clg/yGOU4I=;
  b=ke35Y+VvrcaBJd+kB4WvByVNNMXe+tx5j1zg/ZFrNzitE2CNLOk/jwDv
   NgkDY8q3xTI4mXdkT0TEAkJD3Fhm31nvnL0jdIqfDQnI6pCg2VWPEM5Sd
   1wv+nqTtaUgNQtl7bkdwtxkRtcr2w5ROaEEv4PwKyidh/JYvnYdyFvBbE
   RY8K00WnarR3abohnZ6d5v2BRfRcSiu5c8XZ0wXg53TKFEj210CLbrBVW
   z/zLKTsWwQ5Ch8vEcw9r4N76YpyFMRYsuABA0gAvzFHq+lXEJz3b3Yvll
   1OdjDhJeSkTLiLk8rMhMAiD8PyfAicIsnl7U1eVD1JS5GvGFz0XYABZxl
   A==;
X-IronPort-AV: E=Sophos;i="5.92,283,1650956400"; 
   d="scan'208";a="105110432"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jul 2022 03:38:35 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 19 Jul 2022 03:38:35 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 19 Jul 2022 03:38:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGpKTz3w7pRkIRtAJh+LuysBppOl8D1xW6xm6vIRV08otAMTCjGeFl+nzc4QkhuM+1XAxofMoPFGLozTdFqJN1yWgVcV+kNIAEbOyD7kgVpsDOtQKNZi08dpVDZ4NEm0m/L8yhllA71yvu7mIMHBb3dS4Ukgg6uNsG1uTExekjnTvUTIEmxrWXhBJqWGIfmWT6ue0eyiMIUPGteSNeB9O2kZwC9fG4vF71Q7mqSAJnCRiOGXz+IBAXy2k4WjvAbwlGLSXe6HMjEF363uenKr+CbOyJGcDx0wYMDC7iPPD5UUy+pfhVT0sYIjWvx7bSbGlCLJaAdwPc0Oyt04ljM9AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7W0HMXJBBKDSaoL797Gfoy78Pe2e/eW/Clg/yGOU4I=;
 b=Vul2hRjRm1nmHsrUA7U2h9g01ISc1gwFEPs7np4bvSIjPbizNDc7Aj0imBFuVu1Hp21C6yCYTL8ibSQOMb8ec7UVzoEj/SBbldUfBrOOXptrs5PM+tNwiO+bZGCRNhqooTzchOOi2KYDYbOiHyMCrrPGV7OUT0L8rznh9LIfn6gc4WssZP+PQm78Bf96gQ8QWZ0snJIly2w3znZemkEJPgaJWh2F87ltQs02DI6Fd7+cYmuwcIhUc4p+EfTDkjg31SF5p8wFAnL/oQu8NgFSdOwyrhqT9hFe4DYdw9YqecMszu+85VEnsIdbRIwUG8Px55EG11yVva+0B31eiVDabw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7W0HMXJBBKDSaoL797Gfoy78Pe2e/eW/Clg/yGOU4I=;
 b=ArU9FK0gv1eQA+X0bBEmsNBr5unxr2zWmgKdtV1cyqn1dL7e8O4CBLWCLK1XWwoVHtyUCV871ARA1pcAa6oPClIX2eyj3NnAJfgHGwdVkmtstOMQJinD3LnuEHzljFm67wM6i2DOGYrKkh88vbRDKUOR/TOv0HJezENcPekFyn0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Tue, 19 Jul
 2022 10:38:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::357a:acc9:829e:bf7b%7]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 10:38:30 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <Conor.Dooley@microchip.com>
CC: <emil.renner.berthing@canonical.com>, <ben@decadent.org.uk>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
Thread-Topic: [PATCH] riscv: Fix vdso_install target with CONFIG_COMPAT=y
Thread-Index: AQHYl3QKKSCWWhX0s0WwUnXgqKZ/ra2CpM8AgAAPeACAAIcBAIACP7uAgAAHIQCAAAOQgIAAAgqAgAAAzgA=
Date: Tue, 19 Jul 2022 10:38:30 +0000
Message-ID: <52924b04-7d24-155d-b34f-6e9e1cd99bca@microchip.com>
References: <Ys/8SFo/oC1TFZYk@decadent.org.uk>
 <CAJF2gTSS56vzp2K_93P3fnUC4t=2v+jbnn11vMocuwVSrnW7bA@mail.gmail.com>
 <f59e4a64c541c5781bd10dd81c8622249d785c70.camel@decadent.org.uk>
 <CAJF2gTQ3V=TWib_cbw=r-wFtH9Ee=m7tG9OzizQhiZOU11Fa-Q@mail.gmail.com>
 <CAJM55Z8Eq-iUBFb79HJpykgGOFD-QykNdOJ7Xvj2-azeFJehLA@mail.gmail.com>
 <CAJF2gTTtEUL-o9Y+AbxWzT0Uf-8UwUqw8EgihZFn7D7huJvkmg@mail.gmail.com>
 <e896e651-89ef-6205-b2b5-ad9f4905f698@microchip.com>
 <CAJF2gTTFg3+0k57kdE4qVAsO=r=76k_rnJ1-CrLoqfTUwURVqA@mail.gmail.com>
In-Reply-To: <CAJF2gTTFg3+0k57kdE4qVAsO=r=76k_rnJ1-CrLoqfTUwURVqA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d70fc660-49a6-44d1-d992-08da6972d2a5
x-ms-traffictypediagnostic: MW4PR11MB6714:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3aUn4Sq9D2Rri1gr0djnAZ1wm/yLPuNEE3XIFYjsgZQJ68kvg/H6GrBNUOOEJJ7IH+Qe86GZOJRfYWpUj5BCAA8HCa3jwH+9a2B9TU05oxB0/01qOc5VB40+caGsV+r5KDze2arWAQZEjORcPsvBN53XNJJyAWIvmZxupA0dLK2bX5f2PMBGXnnFLqfEHZASWEuWNTNkH/8R/T9PtLQvdx/H8Rx0VzN1y1hmh8V+dCHLDDd4erYshJcIV1lxHUWZQa/xF3WHt4g15gekoXyWnCRgITq7BZMp3L8I63MOILN03rfTvkPsIboNOfsFN+ylsEnQ4NAJin7g3hBFx/VbMQrYcguE75AIcyWON5PAr2bGrRsmSbT8VsZeFcraABT+3xNYLp1Jj3rgAvLF3czroSovbsG5z90AOhYQTu9CMIA6iLDaopkhqG2oLcWoS0d6n7GbTpUzClybSsPCFG9iqgDmPRQQMBJmNwG6QTFCXi2DF5CL3wcciy6HAOsjfgw+PMO9Q+wnrdRPpyvPzfEOvR+NwuIpUgVX826SOANYrKrK4bQAOaZPpCuOA1TCx7Ce8qqqac8+FCxookzpADHkG1KtDCjNr+Tm7KMToAgOsuCqnyBw2g1HkKDrTwWs2BAGOoZF4u+Gl6y6S90LI4krRiItc8ow8SoHjWYD4e6s9SBWpUS4PX4zg5TsDqcZuW53qlusxfdtYCirmPPcegEP7PtzLZCTgLF58LCslXsBqzfdwjNADXX+hjopjj+AFphx2bqAW3QgFe4oN/UZqO4CgZt/z414HPFlCCIjfnh2xyJ0KYld2/RUVgDm4F661vqXsT/nhchzz+01piz4oHBSoLT9OmePG8f2idvKZTvlJw2muVEmGAQCOb642IwJZwDD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(39860400002)(346002)(366004)(396003)(6486002)(186003)(71200400001)(31696002)(86362001)(38070700005)(478600001)(26005)(31686004)(110136005)(6512007)(41300700001)(53546011)(316002)(91956017)(6506007)(64756008)(66476007)(38100700002)(76116006)(2616005)(66556008)(66946007)(5660300002)(54906003)(8676002)(4326008)(122000001)(2906002)(36756003)(66446008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1BqUkxlMitxQ0xkK1VicnIyejEzbE9vbEt0ajFVZkpHd21qaGRhN21GeDRk?=
 =?utf-8?B?SWk5aDVSdlRJTjhFRU1DblRhZ05KUUlYdHhCakxZQ0RZeXY5VkcxZWNqK2Fz?=
 =?utf-8?B?emEvenNITVVQdUoweXhEVFBZWnZ3MkhHSGJBdzdjNXdaL3Q5Q00rdjgxbENB?=
 =?utf-8?B?bk4xaVU5RWwxZnZPRlNKa09NNUZIbThVbFlhOElSMWRDMXQ3OUM1bVpRQjBN?=
 =?utf-8?B?dUc0T0lWc20rWklVOERIY3pZU2pvOFpjelpvczczZHNBSnVWVFRENGJDQzUr?=
 =?utf-8?B?a3BiQTFQNVJraktLWGxzOVl1d3Z0VmxSL1NGNGFyZFdGMkMzYW83Q0pVaFJ2?=
 =?utf-8?B?c1FlbmZmUk02VWYyR1BuanFoTUhjL1JBMnF2MTVRdElhOE9hZUljeVlqNTVV?=
 =?utf-8?B?NjhZQmdZby9RZnZBVFF6Yi9NRmlWRDJQQkorcFAySVJDVkFrNnpLODl2Q2ox?=
 =?utf-8?B?NzN3V3o2RXVSVWxrTzFVaHg0NXkxRC91K3VxWHowc2hGTXZ3dnZYZHZqbXlw?=
 =?utf-8?B?dGtSb3ZXVzlyVHRSN3paL1dwNlJMaXhBL3hSMUNkakphMkszU0kxU28xOXlu?=
 =?utf-8?B?YWpXNHZ3NE5jVjhLMEhBcnBNamdYNzFsSWF4NmN4TUo3YWRqTE5QWHFlMkhO?=
 =?utf-8?B?NUJCTytveG5qT09wQk5DcWI4RXpxRjJqRGMvREsyd2FYcXR6L3JWcjJvUzlN?=
 =?utf-8?B?cUs4OUExamc4aG1XWTJMeTZidFFTd3lHZHJnMXJxUGc1MGxVNklKdlV3TGlD?=
 =?utf-8?B?UnpRU3hMK2ZKYzhtOVNmeFdPOUpZTGZGb1lVTUZWWkZ0ZFZHN1JuaTluWThN?=
 =?utf-8?B?bDc2WjBDaUJmMEJSMFRnN055bWZkclJqZzV3WGhnSndVTXRuU3hvOC8xTFJl?=
 =?utf-8?B?TWJiVHVWRnU5a3ZNRFo1S2o0NjdnUHNFYkN1Um5zSVZOWG9BRXFUYzhDLzdL?=
 =?utf-8?B?WDFrbXkydkt4bDVKTklqRkkxbnhTUklxNGN5QjRMMGpyUDVhSjQ3bmZuMjVW?=
 =?utf-8?B?Z3p4RWtqTWJVZkNLV0xpd1ZLaXdGL3RoL2NMZGtXdFhWRjI4TGloRHYrUS9v?=
 =?utf-8?B?dHgzcHltU0JBV1dMUlB0K1pPQW81TmdwMndxS1pmNWJxUEZZeXlwMmpJcndn?=
 =?utf-8?B?eEo1b3FNRTQ2eFdLQXVSYjFYZ0gzdDQzYzZWUUxTTTQyWXpWREgxRjdTTGFH?=
 =?utf-8?B?bEpQL1A3U1RBcW90Zlk3Y0I1MVdTS2liY01yVXMvcmZ3V2xpUmMrMzNBQmxQ?=
 =?utf-8?B?NmZNb0prVkg0M2l6N0MvMDU4QW5wcG9SSkJYb1JHa1RPK3ZtcWJhY29DVHcw?=
 =?utf-8?B?K2ZqdFFqVFhXNnJxRUE0blJsTE9IbmRtSkhxUWRqWlBCRVVPSDBSaW5ENEhm?=
 =?utf-8?B?UERaVENxWWtqVXcvOEpZa1p0N3JscEIwdTc0eXJ5TEZPWXBwR1NjcGI3SFRl?=
 =?utf-8?B?TkprYmlJc1plTG5lNkE4NHg1TEtNMlF4SHptUExJcHhQemJiM2dFSDlIQWtC?=
 =?utf-8?B?cGdUZEhRcWlCL0VvMHBMaFhCWi8wNFVvRHBWcWUxbGk1Vnl3TDlRWW43WFY1?=
 =?utf-8?B?TXI3a2JVbVdCK3VqdGtLY09YMGU3ZWNmdGJRWUx5T3plUk1mWWxNQ1dYQ3Qx?=
 =?utf-8?B?YWxDMStiZXlnbk1FaGphbS85RUp5Z3QyclRyNkFnRXE2NER1VmZ2b3NpbTlP?=
 =?utf-8?B?MjU2UGp2VDFnLzhza0lQaEpKNWFrZG9DcExWMTJQZ3hTSjVwOExMRjhmRlYv?=
 =?utf-8?B?NGxtNVF5VFJrVGYwNjRhTkNPditFNGZtV3ZmMmlybkVsanR4VmwwTDFVTkJW?=
 =?utf-8?B?OS9lVUVPcEpjZDhjTG9wSzZhU2wySHpPaUhOV3d3L3dPckNudXJYQ2hPV3J1?=
 =?utf-8?B?MndDS1BDTDI4L0ZTWkhKeldpeS8yZUtNUnNWaElnZVJLRkJiQ1d3VXJYdWxE?=
 =?utf-8?B?eE4wWlVLZVRRaVFiNHd3ektIb2V5cndrTWJ1Z2F4RkRVd2FzaFV1Y0FZV3ds?=
 =?utf-8?B?b1dXY282Rml3ZWF3QzJSUndYTncwMUd1Z241NUhjWTF1TFJLalgwZDNrV0dZ?=
 =?utf-8?B?dUp4dGR4NzZGdEt5NWJLZ1Q3U2pnTEh2b2lzMHJaUjcyaldIQVlUREV3dC9X?=
 =?utf-8?Q?aaZP8swu9HMiODYxtUz0XpF1J?=
Content-ID: <5E94154961B2664385B52198FEDE7498@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70fc660-49a6-44d1-d992-08da6972d2a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 10:38:30.6994
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mIEmlKU+A3bWMRkatgpLmJBKolXl8ipCoNoYW3uiDemVtOERZ45fjMlEAkq+k38H+mGYhaW5GhiBlGLBhXoDey2gWQmgZfYKQyuIgWVCB5E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6714
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_033836_638073_382AEEC8 
X-CRM114-Status: GOOD (  14.40  )
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

On 19/07/2022 11:35, Guo Ren wrote:
> On Tue, Jul 19, 2022 at 6:29 PM <Conor.Dooley@microchip.com> wrote:
>>
>> On 19/07/2022 11:15, Guo Ren wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Sorry, I missed your patch. You are the first person to catch that.
>>>
>>> + $(build)=arch/riscv/kernel/compat_vdso compat_$@)
>>>
>>> The above is also good for me.
>>>
>>> For that one, Could you add "Fixes: 0715372a06ce ("riscv: compat:
>>> vdso: Add COMPAT_VDSO base code ...")" in your next version of the
>>> patch from Ben's and add "Ben Hutchings as Co-developed-by:"?
>>>
>>>
>>
>> Why would Ben get a Co-developed-by?
> 
> Just a suggestion to "Emil Renner Berthing".
> 
> My reason is:
> 1. I think the "Fixes:" is also necessary, and Emil could directly use
> it from Ben's patch.
> 2. He also found that problem and shared the information with us. The
> key effect is to make Emil's patch quickly reviewed (Although I missed
> that patch).

Tbh, I don't think either of those would result in a Co-developed-by.

Reported-by: would be more accurate, no?

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
