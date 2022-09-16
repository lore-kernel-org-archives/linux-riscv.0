Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDA8C54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 06:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFjZNywsz1RqEWtHSv16YqH92En2DS79h1gNZfbSraM=; b=UYOaZicE6kJNGI
	OL9CoUbt3WC549kKFvXoW6jhRD0d5D3+oBhfHvtbqz5NvOSiQvh69iwVM6+0n8owJf7RagXkKUsNa
	yT9fjEyhhvwzgqxVGFKOuMneYgpZe0NLfzr2VMVxeNgh9l5U/0hQXrxUihuyZvEk/nIym5i2/FEpu
	PEJAk1Zh7eLDgKkc2L04BVVL0FAEFUa2LyLFV419MyYU2S9FMIquz7DJ+pcujgh7vwHREmfDAU3Aj
	Cz+LCEX++GpSYxwUmtg9IJLkB/fJqwB2tn3SQ6VLlbGqRNjMVs2W/77QMw9T+Z4nrCp2ABO+mDPXT
	r5m1VkEb43tf6gYbPedQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4xC-009Fep-Pk; Fri, 16 Sep 2022 06:35:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ4x9-009FdT-G4; Fri, 16 Sep 2022 06:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663310156; x=1694846156;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=oZPHZalGK8mqgqO7ySVxdY1v9gFHJIh57IbwuYxLLxU=;
  b=HkYh4oSrmYNAyEFXUz6bkcD4EaBICOLzdXqrtLsx3PmXlXp95KpH7vus
   /wC081HAilI//dW06EsUpx8Y4aOEWCu6WMyYpATaVz7kzCB76/nT599+d
   psnoFatWwhbKMBako649lW4D4bdpftZhzD5GV9VSJcO59oLHTdCaFll3X
   SDnUqFKEN5YnJiDjmM/cZflg71g6gYq+o8sjKnCr4clHkrCuXv6MW6u36
   ncB4vza7TSy2HUvdfcO0GeB7dH9zlK1ltcfdbxoZ8wA+4NyORfjmjPqxt
   pMCAuudFiPH/6f8/gBZBBUIOQhfKODKGSUlJ2xu9akQq8Hh+xZyQfzOT5
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="180648682"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 23:35:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 23:35:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 23:35:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCCyuw7c2VNjbKjpwXtLma4LgreLHp/WDzaw8Lwv1gjYV45f0kHR3hkpfgAU7cqBWLTNqHp5UnQrtFoJc6M9v6I+gTz3f8pX5Sr3eCR1zbj10ifkXUuBdI+a4YtqHaGKQqFzsmcQR4U1iN4lIhCFeF6lepMX/RF4F5KYevcYC/A0unpfeO8Ul7YcPxHNOt+97dGf9Czl8ykChZXODSQLPRnm/aYC+FV5a0OOV0Ew1fNZrnHrWASvdO98dazQXLSkFUFQofs7IOreDCcT1ez+OoMRjC/jiUr9B4b6Bk+uhyZpmDW583r45vM4pOoUbdDbU27EHTimDOKsUZodJohPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZPHZalGK8mqgqO7ySVxdY1v9gFHJIh57IbwuYxLLxU=;
 b=R6dvdUPD85xTO1Uyfth6DPesDe6nbxpEbykcRtM/o4ZWknPqMoyd5vQmeRKoyBNE8T7QAQst5z//hXKQt46lser4sA+vwiPyNx93gr8Ilk3sYZunSUFv1M3Wf+MAO+HO1qiCQGB3J+0BS+SQIaL0ZaYSpsx3vZ2P+N2IDy46A6kn0l6f6t9+KsknvxAp5lmq5u8IF5aJyNqK8IdF2riuhHp2eBqQEuHEXmmf2L04xF5cuO5M32j1lA+rMVgb56t8rZJM9qmZJOIYFjTBJQWBaXAB7SVwcyJeNHIQiJT0Qf/dgsbriH7+EZzfu3QpizqPzziOF4VHHp2mD0/hxlzESw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZPHZalGK8mqgqO7ySVxdY1v9gFHJIh57IbwuYxLLxU=;
 b=bGDS1Cczysm2UwMR1WYjVTj2j2mdGdHeVPkCgbPvjy2exfIYqZ9qbAcKEVSMJ4LVLHQfkvq2Zxox6gLMdvbzNykwcZRaXFePPAdB+WXZg+5zPNPpfFLeDLYuClv4NoGKq0ikbIRG5R0/wTPy21HUbZROaCQw5wEFgS/LhuPNB2g=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MW4PR11MB6620.namprd11.prod.outlook.com (2603:10b6:303:1ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Fri, 16 Sep
 2022 06:35:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Fri, 16 Sep 2022
 06:35:49 +0000
From: <Conor.Dooley@microchip.com>
To: <mchitale@ventanamicro.com>, <anup@brainfault.org>,
	<atishp@atishpatra.org>
CC: <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1] RISC-V: KVM: Allow Guest use Zihintpause extension
Thread-Topic: [PATCH v1] RISC-V: KVM: Allow Guest use Zihintpause extension
Thread-Index: AQHYyY/Rn2YG1izLd0SIHg/gAooheK3hmemA
Date: Fri, 16 Sep 2022 06:35:49 +0000
Message-ID: <647f5ac3-e910-e808-7f32-6eeaa543db2d@microchip.com>
References: <20220916054637.24133-1-mchitale@ventanamicro.com>
In-Reply-To: <20220916054637.24133-1-mchitale@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|MW4PR11MB6620:EE_
x-ms-office365-filtering-correlation-id: 5dd2a695-69de-4ea4-934b-08da97adb20f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jzr+G+aiDgXA1CsXtr1LyfRKXtePyRPPBbjV3ggfzU+kTWp1CTNlE5jSyQbmfsga6swpQWatddHMf9pfxZ9mFaotelaDaatCXb51xUNk74kWZQu08JL88+9UCKxbLdL2QbqNkG/fE7pX/wJUQMCvFb89609AFFM/smW6TAuq1QDUz35vaIr80Nus1Y39I2e/tLI6ZXhaonsqUKqgzX3mqbqvw2TgqMJgG0umqFTE/75zdcKP+XIOfWKGJmyGw7pBdSrGynKI+fSRvvz3h5Vv7PmFJviyYsZ14tXc9/jRIka/V6RlOfCKNuvsMlWSFAaRDALg7iFijyTFAJFOgpJXFNwJIQIa9VeXiDQPCziJsqpbauWAEJQQKppakVrGatJA5ZA177Y/R3H4T2hpvde+pP4YpLlcam9s2/F99Y1PoZ2XSBqG8ftI7ftWCOHXUGCNMzNsTlMd92Sruwq4J01CZcY9PBDJoSPRr0Z3o9tPhbpTbbyxX8lZ/x+4lICoHQZsX9YLb/dhxgeJP/26E/iMRD/EqHrlE0tASj4sCfKxu/esqQIvuC6ZEL5ZqxM1IFPJw33Pdoojw7KpY2DmisvUPhWFjjn7YpNY5A3BzwtKebj1PgYoGknHaBEs1sO6U/MOXjCe/E6COagvHbDJZJ5ijBVi13M/AN0+1CvGPAv34o6vcD+Yl+cCeI1NzvGnoir6eiVDIDTE5OnSNf5EHH7cbuoE16K5hAuskvruHXDAq0zhin5osWswcZ8doF6r03sYje9VbDWHJhWvV7jLvUIlCJN82Hdn0ATpi5FUG+/UyVxL0jCVsW9KQS6I9QNo07cfFv3xaQ5MYNBzshUBK9d9QehFBmAeJhh0IJDuVS6YSK60f2vvWBFKBMSboDjbNm7L6sDT33IyYwB26hrKD8JoqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199015)(122000001)(38100700002)(41300700001)(38070700005)(2906002)(71200400001)(186003)(26005)(2616005)(53546011)(966005)(478600001)(36756003)(6486002)(6512007)(64756008)(66556008)(31686004)(66446008)(66476007)(91956017)(66946007)(76116006)(316002)(8936002)(8676002)(5660300002)(110136005)(31696002)(86362001)(54906003)(4326008)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RExVVHpQRHhGdXpOeG42ZXJsYk8wZUdaWTloMUtOd3ZqalFmU3lJNlRHSDhJ?=
 =?utf-8?B?R0d0ZC9MTDErekJVOUJaaFdlZ0hKR3dyS1BOb3l4aWxLRUhDdmcra2h3T0Rs?=
 =?utf-8?B?enoxbVJ5OXNNTklRQ3QxeGRjelVLbGtDRmZEYWdmMmJCU2JXV1kyT2ZBQ2Rz?=
 =?utf-8?B?UGxNT2t2cTZ1emRsVWpXMUhjbEVrQ1ZraVBWVytvTTFKdmxzS3NNSHgydFQr?=
 =?utf-8?B?OEI1eHdYeEwvZXJhay9Fb1JURlAveXg5Y2E1bEFUditTWkxiM2VKQnFYWFNU?=
 =?utf-8?B?MUJBM2dVQ1d2ZEx5bmJSVWRDcVRMbEFKcWZBT2gzZEpRNGkvNW5jSWVxUUV6?=
 =?utf-8?B?VGM0OXhpdDlHOVdLek1jSnp0dTdJa1NtN1Z2bC9NK0orVG5JWnJzRDVzci9Z?=
 =?utf-8?B?Y2dUbkNHTCtuU05tMWw0UVNLMGlzZnZKVGlGSEVpVlpaYmNleWhSSkJtTkVV?=
 =?utf-8?B?cWwzcTVxZWQrNjcyVHA4NlNIeXV2b3haRjlIMDQ1d05Nem5mVy9qNUI2OVdF?=
 =?utf-8?B?S2ZmODh5enQ3YVBkREluaEZSUkJnem56MVF2U3dUVDdnMDU0dE9CRmlzT0g3?=
 =?utf-8?B?cUpLUHJVVGRPSGlDZzFXS2V1ejJxSVREejJFYnhTWUkweTdZem1vTGJwSVh0?=
 =?utf-8?B?amxoZ3FZd1BWa3pTa2hVN0c3QUI0VmhKaFZ4ZkVyY2preGYza1dtUzMwQjFU?=
 =?utf-8?B?dzBQNlZIV3poakRhZUNGamlEeGNpc2RYUXRaY2FiNWcvWlhhTlJocG8xU2oz?=
 =?utf-8?B?c3NwOFJiVFFJMFpOd2NUdEVpOTlxU1hrRkVDc09HaE8xK3F3YTNuZXNHWnQv?=
 =?utf-8?B?VzI2MmIvWUZXTUtlb2t3REdXcDBtdWp0RytVcC9lOFJhWVpoN215dGtsRkRR?=
 =?utf-8?B?YTRoN0lCYXdaMHAwZnc3bnFMQ2kwQ3p1cWJMeXBpdGVvcVRnZTRESXI0UFR3?=
 =?utf-8?B?VlVmQTN3Z0ZzcEQxTmh2eStWcC9CSTc2V3Q0cFg0RDd2a2I0ZU1RZGF6N2V2?=
 =?utf-8?B?aUN6dUJ6eis4a2tQMFdIL1lteG4zRFoxbEQ5MTZsNkEyTmIvVnRJWllxNEVh?=
 =?utf-8?B?SDlLSi92anVSV0lnaUQxdnI5bURpOWdSc0ZOWjkyelh2UTJVak1FWWh5Qitp?=
 =?utf-8?B?bVc1cWZZTTE4UjhkTE9PVWxXeXVmNFU3V3BucmFSQkpKZU5UWUY0MDBvbGhl?=
 =?utf-8?B?Wit0eVZqdFFKa2xVUGxNbEZueHlMU1MvdWtzblhEUUJ1MXB4VXFLY1J1M0E5?=
 =?utf-8?B?dGxuYnVvckltNTFtT3ova1dtMy9WcFBRVXhydlY1M2tXNW9MR3ZoR1hRMEZT?=
 =?utf-8?B?RGUyaGFWcTFxcjNUNklJckllc0d4M0pZN3V4STJYclZIRFNuYjFyUkZwaHVk?=
 =?utf-8?B?VHRzTW5WdjEvSVNJY2VwVmxBK0ZPMkdMa2loV3VvQXhQampzK0xna3JUa0N4?=
 =?utf-8?B?dE5Ka1ZwTmw3M2tpelVNVE5TN3dFVDVxTWxVZUtpd1dWVXJBL0dkUjZhVjls?=
 =?utf-8?B?RlNzbWtESFFXS1VEK0cwSFkrbnZPTzlwUWk4aUc2VDhHUlRnbzk4eGl2MWtH?=
 =?utf-8?B?RTVUa1lpN2VFS3RPVm9JY1pDb1d0N1BabXplcEM0Yml1MUh2S0dSaTdhZE1Z?=
 =?utf-8?B?dkxLNHE1ZlJ2QmRSTGx6eU5HcVF4YkNxMUFRT3g3YWgzQ0tOZytPMlExRk9G?=
 =?utf-8?B?LzZObFFRUE04OGxuRDY0NWJJNk9VVllSZWVsZG1ucGo5TlNFdjZESEtxVUxz?=
 =?utf-8?B?dEc3bEVnRmlJTHVibWJjL0dUL2lpRnNpTHU4NXpqOXk5VjBKb05EYUZRcmMr?=
 =?utf-8?B?NzdFY0Zqb0o2ampXRE9QQWJ2TG4vR0pmb0RLSWxzQ0dsbk5POUk5UUlXWXVa?=
 =?utf-8?B?RUpJUm90ZXJuaWlpQk1KcnF0aHRQb0ZwaHNoVGdZRUxVZlhzdnlhdSswTThp?=
 =?utf-8?B?S1hrUm50RFdHQTJjTEdJYmhuOWFuYS90eVZqK3ArM3YxZy9sdDVOZTRBODZL?=
 =?utf-8?B?am1tYzBTU0VEUGE1YlZlN0w2ZWpIOVhYdk9CY2VFMzdsbUxreCtPSUQ0WWUx?=
 =?utf-8?B?bXJwNDMxODhVeE4ybWdyMlRUN0IxVHk3NElmRnBzRFh0eWptK1UrV2s2Qmhz?=
 =?utf-8?Q?5dnevHC3HyhxcJzDZeZw6cdGz?=
Content-ID: <940F4EB649134C4C9600CAFAF6A0D192@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd2a695-69de-4ea4-934b-08da97adb20f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2022 06:35:49.8223
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 84DvqdcrxAuoFp+OzgjmAbQ5MEQo34/HFOM60XpANRkKcW2MNYoHnDkaq6LrcQIt69j7/BNavHYDxgaUXGhOKbeFxiLIAfdxPtjuDEQDTRI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6620
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_233555_568597_D08965CC 
X-CRM114-Status: GOOD (  16.84  )
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

On 16/09/2022 06:46, Mayuresh Chitale wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> We should advertise Zihintpause ISA extension to KVM user-space whenever
> host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
> to pass on this information to Guest via ISA string.

https://lore.kernel.org/linux-riscv/20220915152933.816459-1-mchitale@ventanamicro.com/

You sent a v1 yesterday, what changed between this "v1" & yesterday's
actual v1?
Thanks,
Conor.

> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   arch/riscv/include/uapi/asm/kvm.h | 1 +
>   arch/riscv/kvm/vcpu.c             | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b6770ee08872..9085b90cf324 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>          KVM_RISCV_ISA_EXT_SVPBMT,
>          KVM_RISCV_ISA_EXT_SSTC,
>          KVM_RISCV_ISA_EXT_SVINVAL,
> +       KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>          KVM_RISCV_ISA_EXT_MAX,
>   };
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 901bb5c0cb50..0de0dd22e734 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>          RISCV_ISA_EXT_SVPBMT,
>          RISCV_ISA_EXT_SSTC,
>          RISCV_ISA_EXT_SVINVAL,
> +       RISCV_ISA_EXT_ZIHINTPAUSE,
>   };
> 
>   static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>          case KVM_RISCV_ISA_EXT_M:
>          case KVM_RISCV_ISA_EXT_SSTC:
>          case KVM_RISCV_ISA_EXT_SVINVAL:
> +       case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>                  return false;
>          default:
>                  break;
> --
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
