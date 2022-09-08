Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3117C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 18:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yi2mtj4hn4pMuFUxgGzd0ixQuNZzPutf6UHpB3jHGI=; b=dTZxq+Y0NWhO8O
	XeueqGVfTSITt289Kz+yAxNsJVy5KSnvTi9jAM8PjMfhP+ZhXfUbKbl2IrSb0nb/eRWYEfVNG9CKL
	7JlP/gwfB8j67xYWgnan+DKPhF0TeyDQ4nVUQD/4lgFP1VWfB4dQyNsDaXWkeeGjT8qWZMTF/V/cv
	K17jmKrmNphQiyTC3RdQITdLvcyiwCOD089Zat7afeI+MS7EFqeGRMTuwXH4V9Aa468FN2L5Z70AA
	TLlVTDZU0aWoQzj+bYcJ/+Si9I2e5sxXO5Mv1QjGeapr/RLtabb/V3jdl0F4SDlVLTa8NfzGjis8E
	3aLhEU/93RFwvPpjrrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMRm-006rK1-5V; Thu, 08 Sep 2022 18:40:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWMRj-006rGx-BV
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 18:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662662416; x=1694198416;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=8ONF0ZrYAcUu9jRfiFDeKnfbkf5M+VxFN1q1cvPnxE4=;
  b=uKLQjOrAzYH2DnIzKQYVRn7ZpqwgoTqRj71hcWvQhECoA2ZmByMWeH1h
   nc/Cvbdw0d/+cQDemnBMe2ry7arysm604TVm8F34eMiuICyYrBUY6flwz
   9ZyaTqViXPr2veYfVUh8qQoqhGe11n1YdECSlpJgDUWvb+bEUuYoiQa33
   VN+thb8M13qg1uvBM849F4qs3eXiJRaPLhoLaceT3BWl/pOLjzolUM744
   Z7UMqH+eL4o5G+rBqXYZXYMz0upzK1JZ/ztkGNTMiy5YgtbHYmygHEzXv
   neeUMmcCl0yy86P9KzpisKChVgkyjhk+I3G/2xPzrlSH1p2/TBd7/nZNt
   A==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="179622077"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 11:40:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 11:40:13 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 11:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL2+maKZaOUN7Ol7H4IQyc8qFkQYmjI7Tpn8w/kpqdU/WVOga0x7zS76dUkRsgPvJnkD0v9k7LYmQ3Odk7kOvm2w4j3oWuHnKYY8SxzHPGY8ho9HOHK9mSh74ZKKT35/GugYXlhkBjp60RARy9p1XYbge+NZZ0+0ojaScP4Di551C/c24pJpJCxdnVvxbNF0NJ3SbLxAdxoVKCHRd5bCbXJ/Tpr63uZyZ9yPad3jTSiED6D3uMFc5XodvX24WkflSsbOViOk8EVBkD+ce23capTI1IYjz85wcAe4LNoKs6zcEjdY3eEHKfQtPCyPuv6jIDgvjbMBvVzaZx+zpmVcaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ONF0ZrYAcUu9jRfiFDeKnfbkf5M+VxFN1q1cvPnxE4=;
 b=IP3CSZ5zKPeZREIU0RgTYCK4Hl01Q9BxLXDVouObm5ZboXMTzBNuXkH2bMG8SmffCF2M7XFh7ePzaS4r0WIAqbEyeP6vlQGNXaxBB6oK6qEeRz3hwR44wpBAvEJDnFIWu7Y3U14937eGWId8prpgn6Q4XVOGdqA63tRSoyd3EhgK/5RkVuoYpDEhiLoqk6DKLuTemREaZyidSgrqypNN5UgSPcfzr5onkUlBxhdM2UjI/9gGqU7ewhEIXcKR2Jd2NOjQjbBIPfCUqoNUUDhwp3yowpMzlFuaH2CgrZA9hndNEabZvi2TaUVI/+tDNgO5ht6lDODZC7ZxFYBcOhMlbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ONF0ZrYAcUu9jRfiFDeKnfbkf5M+VxFN1q1cvPnxE4=;
 b=NlVcYiIH39Xu2l0zr4Lw20gYhSJcGmKC+g0sLLaUYdbhO2uBSmrZaWIWTORZ6EK53eCIUclcKGQHp8GGezMtCaxlEz0OtybNgHCEvbORzpBjGKminc/qunWq0hJkDPMgkIxCzGhkfPV3hEGMjlkyzH64goia7VH0lo+OGDEsW3E=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5364.namprd11.prod.outlook.com (2603:10b6:610:bb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Thu, 8 Sep
 2022 18:40:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 18:40:08 +0000
From: <Conor.Dooley@microchip.com>
To: <zong.li@sifive.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<greentime.hu@sifive.com>, <ben.dooks@sifive.com>, <bp@alien8.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] soc: sifive: ccache: use pr_fmt() to remove
 CCACHE: prefixes
Thread-Topic: [PATCH v3 5/6] soc: sifive: ccache: use pr_fmt() to remove
 CCACHE: prefixes
Thread-Index: AQHYw5GhawiXHMEYgUiKfN64A8yNka3V3bMA
Date: Thu, 8 Sep 2022 18:40:08 +0000
Message-ID: <36fe0073-7fa2-9733-7041-d9f70da1a5ea@microchip.com>
References: <20220908144424.4232-1-zong.li@sifive.com>
 <20220908144424.4232-6-zong.li@sifive.com>
In-Reply-To: <20220908144424.4232-6-zong.li@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CH0PR11MB5364:EE_
x-ms-office365-filtering-correlation-id: 65866ad1-f8bf-4e6c-15a1-08da91c98e5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J794hwrT35OWwnYoki3GA3TDf6yklX+JcW+9Wg7EZZOkNNihwSKFo4us0owovnsn3amWDHcrYurk3iPowVX7j9vMajoJ6hXFeogMV9l3EZS5Oa7Tz3Jrj/tIf58kNKjpL24J6yUwHsUowkgj7pXRRrkG03i/K82F+/c31ddTrADP/PPscL6jJb+2sRwL2x5QlHAqcVsYrbrZiHnDR0VxmcK5/0JaBQbxRlwFJ7VP4L6hXwRaldJd1AYRKlHIwWCUf+VlcqnbUxLRjGt8EbJVYFeg3C5q9uIkwXxRP3RCU8ATxJRl9m/Xfm8srM1LUJmXjMSOYduXTArr+TbH/0/l0SXu/mmh6C7506UhDX3OMAPcQu4ktMV9NlQsquFHt1A+HXPe3zQvVeRbPn7qnEwgq3Ty1aqbhqmuHhNYBIYVwsjv03nwvQA7YB8VR5mPYbw30FQcuTB7CiBEfjBIZXKe1b3zAtbsKKpom9tDQWhYVY7fquGWNpL2k0l12eR3UJ9Q3TEQcpfZ1fmdUrp8BsuN+nr5jx1jg4F9PTE04wbHgm0RqG78ZuF2rIpnu/2YOEWgghDCV/8HCrn4qpJNlf1A9arxZaR1E79Fn2eZeG/IZLkz4mbX1CEiqQZG61hgj15azPYexjRXCR19XCFEDoRkZi2iRo/I4RWxPgDTOLQZ1wQTZMJFlBC/M36ABhl8DfJTdiUpV7sWfmErNSpLX31lP9mgZ4TsglJzl+VFZoS57NPOLBqd28iG1bPgGAZxFPuN+P9c0rN1pYxqyJGPVahODQFRK8Ua0PpahjduApMnw0/qngUGWdX+CxF283o0h/LRLUEsz1JND+duI5ptrIAneaPSAilSyXQbPMUqjgG46ow=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(136003)(346002)(366004)(2906002)(83380400001)(38100700002)(2616005)(186003)(110136005)(36756003)(8676002)(66946007)(76116006)(7416002)(91956017)(316002)(66446008)(64756008)(5660300002)(8936002)(66556008)(31686004)(38070700005)(26005)(71200400001)(86362001)(921005)(31696002)(66476007)(53546011)(122000001)(478600001)(41300700001)(6512007)(6506007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NWFka1dBVlVDMm9CclNlZnVQbTlzbTFkbTFQRldZYkxqYmdHN0NZc1dqNEVF?=
 =?utf-8?B?UWJlTWkxcUZCbllUbUt4blhLdzBpWUhhbEExTWRqaUplbk50aEdzL1IvQmRz?=
 =?utf-8?B?TlNSMDJ1aE8zbWpzRVhnbkxpRjA5R1NEamJmcGQ3WWZSeGVOek16VFVRSW0y?=
 =?utf-8?B?N0RKbmlwZTVMOU9PUExnLzFxM2wwQUMxVFdJYzdSV2dpdVBPcHZHSm04Y0N5?=
 =?utf-8?B?a0MvREQ2eXJuRTF6SjgzNjdSN3FqU0Zjejl3b1ZlUnFvRUtlR0owMlpWS043?=
 =?utf-8?B?ZE9DMk1sWlNrTWs4OGpIVUpPYW43Y1FLblRFcjJpc25MRG1Jc2N2cXZKNVFr?=
 =?utf-8?B?d2pSRmRtY1RBZHI4R2I1Q2VraVJESXRnVWhkdDZVaDJrMzVwb3pBSnVrUjZz?=
 =?utf-8?B?Y2dWV3hZQVRvb2E0aFp5d0lsOXRjN3VseUVLRHQ0SllhUk50ZHU1bGEvbFV2?=
 =?utf-8?B?OEFQRUk2eDdzRFRXcmlZUlVPempIczNiS29yWC9UYkc0cDVBK3NzNlZBa2tW?=
 =?utf-8?B?ZFAvdFQwR1FyVzVxVTNoeEZqd1pxL2F5M0RjRGYvL29RNi9TUXdDbDVaRGwr?=
 =?utf-8?B?RkQ3T1VrOCtvYWhMaHpDTVBtd0RxbFRxYmdsUUtBcTNnZlFQTmg4R1ZvTWNF?=
 =?utf-8?B?NHVPdDdCLzJnbjl1NHpoQTJ3Mk9uSnlYSG1TalVhc2xHRyttRDgrV21ZN0hE?=
 =?utf-8?B?SDh6RXNoUlQzbHR5VzF6RVZoZDQzYzh2dnp5cGhHWklGN1F6TGdxMmpTSzlZ?=
 =?utf-8?B?OUQrd0ZCL2hSZS9KMXk5Rnd5QS9hcXVURm1GZ1pYUlJRRC9PMDhSYlIyc2JQ?=
 =?utf-8?B?Q2dMeUNWZEQ2MVdUMGZ2anFBSG1neTBBU3RrQzRXWjc2SWQyUjVJSndKRTUx?=
 =?utf-8?B?MkdvTmNSbXRCa3Jvck9NRW5aVWRiVk1HQjFqU1JSbzFuY2ZXR1FwOHZ3c1BE?=
 =?utf-8?B?Tk56QW01SER2WGtkU2VsRm15eG1ia0x0a2xkVXhGdDloVWlvMGdxNFhLazdD?=
 =?utf-8?B?VERXM3F6NkFnWXZvbFlmb2dLS3ZWTDN1a2ZyTk9QaTFsQlF2NkVDbTd5NjNE?=
 =?utf-8?B?WFdIY1QycGtidTQ3aWh1clVQN2prQ2QzbHhPUHUvSU5EYm02amZqSGtoZVlx?=
 =?utf-8?B?cS9pZ25PME4zT2c4OWNwM24xUURZNjY4TEV4U0Fpd1lkV2JRYXlHcW9xTjJk?=
 =?utf-8?B?dVlyamw1Rko4M1JaQjlwY0VLdUMwR0hIcXRTY1BnSUc5eTRFTUZlOHZiM2Ru?=
 =?utf-8?B?NGpiRGdHMTFRb0FxY2htYWJESkZzTHJCMVVyVzhGdVJQVmxpcUhrRmEzYnJ2?=
 =?utf-8?B?L0xEUWJrUmt4TzI2TjU2ZWdNWk5OZk50Nlk3UUdQc2RZb3FBWW5EQ3RhNnhY?=
 =?utf-8?B?bW9yZlVkOFkxODVpR0VDMmpGWE9mQmw1cFdxdmE1YUVMekhMUmNnK2R1R0xv?=
 =?utf-8?B?alpRRERsVFVLY2Z5UE4wZU9sRzJGeFhob0pUaG4wSzVKbEkrYlJqNWppbWFV?=
 =?utf-8?B?U2I3L2x4TmcxRDdnbExBNXJRS05rMGRHb0YxSzlwUnVQUnF5WHJ0ZzAvbVph?=
 =?utf-8?B?Vms4VTZFT0o1SytYM255OXVPUXMvUVd0R3l0WXc4N1JMeUJRbUZ0dEs1ZnRX?=
 =?utf-8?B?NkJFeGJBOEFnRi9jdWZaaG9hdjVnU3dYYXFVTjd2WlFTM3Y3ZW5LZ3ZleUlm?=
 =?utf-8?B?VEgxOUVHM0xsbFJwMzN3WWZRTkEvcXlhb3c3SHNQNnRCYjdNb1V0QTNXQ29m?=
 =?utf-8?B?WWdxWUtYbHhkMGFXSTd2eE5yc2RiNkxoK2U0dXYvRk1TNlpac3JySGE5WGdU?=
 =?utf-8?B?VmN6QXdrZ2N3NnpldytjbVA1M3gwV3RJdlg3NjM1QllHcVlBWEtSOTcrYWNL?=
 =?utf-8?B?Y0ZMNUNSb1AyejNxQ2t0c0dWYy9lRStIa3FsYjhMeVBlZE92WFRsR1RGTUI1?=
 =?utf-8?B?VHFrcjV6bWxkZ2VyZGpBWUYxeUlZbU94MkdKd3dpSE9GUFUzd3VGaFVUVHMx?=
 =?utf-8?B?Vk51VlVkeFBpR0xKSHlhMzBselh4cEtFOUtnQ2YrMFJqMm9MZG5xSzg1L3F3?=
 =?utf-8?B?SU05c244MUZudG5aVlVPdTdiVzdVQlZLVVRRb1B5QnU1dTdQZzNPNTh2eXdn?=
 =?utf-8?B?K0ZaWDBxWnZyeGFuS29xUGpkdldCYUoxUVhWN3VVKzRUQWN3ZTcwdGZ1SzRn?=
 =?utf-8?B?UlE9PQ==?=
Content-ID: <803CFA9C7A7D0E49A060B2AF4270149D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65866ad1-f8bf-4e6c-15a1-08da91c98e5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 18:40:08.9044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: heatiuvS6LPDnflXqfRiefzTEXklQ6NLd5qquEhL9jnWY5ywLiV1deabtMNfFnCNqBMezzp+r7mXDsW1cMvMuSv5f0AaM1ziPoZOuhxxV20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_114015_428049_9FA0ED2B 
X-CRM114-Status: GOOD (  20.63  )
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

On 08/09/2022 15:44, Zong Li wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Ben Dooks <ben.dooks@sifive.com>
> 
> Use the pr_fmt() macro to prefix all the output with "CCACHE:"
> to avoid having to write it out each time, or make a large diff
> when the next change comes along.
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

btw, I think Ben missed a print - a pr_err() in init().

> ---
>  drivers/soc/sifive/sifive_ccache.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 58d14f11a63a..b3929c4d6d5b 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -5,6 +5,9 @@
>   * Copyright (C) 2018-2022 SiFive, Inc.
>   *
>   */
> +
> +#define pr_fmt(fmt) "CCACHE: " fmt
> +
>  #include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
> @@ -85,13 +88,13 @@ static void ccache_config_read(void)
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> 
> -       pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> +       pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
>                 (cfg & 0xff), (cfg >> 8) & 0xff,
>                 BIT_ULL((cfg >> 16) & 0xff),
>                 BIT_ULL((cfg >> 24) & 0xff));
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> -       pr_info("CCACHE: Index of the largest way enabled: %u\n", cfg);
> +       pr_info("Index of the largest way enabled: %u\n", cfg);
>  }
> 
>  static const struct of_device_id sifive_ccache_ids[] = {
> @@ -155,7 +158,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DIR_CORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
> -               pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DirError interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain,
> @@ -175,7 +178,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DATA_CORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
> -               pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataError interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain,
> @@ -185,7 +188,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DATA_UNCORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
> -               pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataFail interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain,
> @@ -227,7 +230,7 @@ static int __init sifive_ccache_init(void)
>                 rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
>                                  NULL);
>                 if (rc) {
> -                       pr_err("CCACHE: Could not request IRQ %d\n", g_irq[i]);
> +                       pr_err("Could not request IRQ %d\n", g_irq[i]);
>                         return rc;
>                 }
>         }
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
