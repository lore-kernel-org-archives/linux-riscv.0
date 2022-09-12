Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374E7ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 10:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXgim+RjMjqINMIkxEBVTW+3w09MCWs9zmaMNzQSUIU=; b=Yi1SrnP5PxfFi9
	1gPQfRCYGq5Z4WEusYIJ4XsRi21CxmuC2vZbOc/4ATpR7t7F7kktvfABE68Mw01baTpDxWnN4TJl8
	JuIiVYcYFBYXa7ycSAgSBHpkFrNztP3r/EfOLravPUbjuflkVB0OsERYBmfs1Zqn8527KMQ5NX5Mm
	iiv4DfSIKvHhrvrdyi0HBpQi99bL9NpU57yaPWkPORrJvRiaFpENrEpo43RlFAo9Q4B9qGEaOZLGP
	Fbd38SrmdKxLIkXBve/KhsFkVPnU+YPoSXtCAckaJ23EmorvHQqdZHnVGjaohMQVAbKGe0Bu/ONBl
	lAe3l2o0ZMQ/aoi3oSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgdU-008jC4-21; Mon, 12 Sep 2022 10:25:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXgRE-008dTu-7c
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 10:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662977591; x=1694513591;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=zr5/X3SmxgcWjggchAstoxhh5KzqoaOcRO9NX6oqDTg=;
  b=g45sanIVfUOx9Wvk7dwEnZ+KuoLHwQWsZXLBdfnAr+1aI/BaOzZNJRtj
   VLLoWwzqP4obNa1cCQsxk8uQXKPWL74ovR/52hQmY6hlTAUfKWKet+NJJ
   98BPDGbRKsS+E+zkrZy+WpWrKkYkjgsPw+D/koTP1qtT257gdkWK0sTmJ
   IXEeJfQxAAcEcYer1AYqOb+frWCZJPszcWJ9YPUQg2pluQGthCPwimFdk
   IXt1oDVrW9rD41D1CY+fOppHXYXT3SmFkXE9zT5qnvf/M3GD0YfpqEXJ8
   LH32RR1Hz5/8n7+p4IsegJrFcbGbH3pCOcrulKsc40uNfpeRSVGH7AIKa
   g==;
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; 
   d="scan'208";a="176677539"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Sep 2022 03:13:06 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 12 Sep 2022 03:13:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 12 Sep 2022 03:13:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDN1s/CHnBAOUSCJZEk3g7AMEAbMWdPFA//ohYwF1lXurWwAQ5ovFbUhUnx0dCpRTXE1cqL2OKuJ/T4yhbshd9xCpD14lLVRNUdu8Nxg6+TzP7WH1jRYXnPvdp6eVmTHRN48KYUYmqrsHZCkLwKfZfo3JA9Fjf48VuZzEcdtEUB3Y/FVBPh0cRF2EJHUPxFGc8oH4/PgDS8QX2bT+/p/LBUFZGrnQ2Kk/IFLupdtxT8TSrASxahCyTnBYzawtmiPdIEYYozjvyb2iC2qpR+yNJJtZh8rctGyyT6ywRJ3fDOaiF3LlhcUxMhZv/7Huen1RwDST1r6Ojci7H4no7LrFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr5/X3SmxgcWjggchAstoxhh5KzqoaOcRO9NX6oqDTg=;
 b=Y6YqbVo0GmIC7GBu/wU5pTkmzQYlCpJaWdNEp1MSDzcTlU/dXLZTKSkjZfMK6tfP3mXeisKcDFnx8eAcDoW8q8jCYZMeAeEVaZ678nWqXW1ZL7EbjrAEFx9xQQtHgr9TBaokg9s969lVhkNp0zK8o+UG5U8xiJOeCDIi8y5Vvpy2CzJtxiiy4WLVGwGgTfnR1Aywc8NxNjD8PULJlEDIWRsbwomJGvIwtgdV1m/UMEHPpzRFcRu0/EhXFe91qQYMiSAuCmrWoVtq+9iTJoUv9TbVVX8rY1qhn+6UMzFJLneaNoGCsdGa7bsSbFC2uBJN5lYBBeD+M+cHvq+BjnaRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr5/X3SmxgcWjggchAstoxhh5KzqoaOcRO9NX6oqDTg=;
 b=nQjwY6zSm8R6/m4d70bb/6QEQTGN13RICiTh/mC65u2EblsHq2eY+kG2qkx/7pauhD18bxRImeD+w1LsZNUbLDB1kXhQVi+mIOr18TbVW8+ah4ax1utSgTiAIbs2/kQGVrfSRl/GHHUPSkCj7yvGU4xg7b7Nr5x/RUeo7D+oyxg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.16; Mon, 12 Sep
 2022 10:13:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.022; Mon, 12 Sep 2022
 10:13:04 +0000
From: <Conor.Dooley@microchip.com>
To: <uwu@icenowy.me>, <paul.walmsley@sifive.com>, <greentime.hu@sifive.com>,
	<lpieralisi@kernel.org>, <robh@kernel.org>, <kw@linux.com>,
	<bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] PCI: fu740: do not use clock name when requesting clock
Thread-Topic: [PATCH] PCI: fu740: do not use clock name when requesting clock
Thread-Index: AQHYwnx0NYa6w3eDKkCEt2xzrlxSOa3V2JAAgAUzLQCAAI/GgA==
Date: Mon, 12 Sep 2022 10:13:04 +0000
Message-ID: <752ea700-bdef-25ca-c922-fd79ea34c8af@microchip.com>
References: <20220907054020.745672-1-uwu@icenowy.me>
 <8d7b8514-efe0-d3e3-8458-f4f003f10154@microchip.com>
 <b1a3f887fd037fd18c45ac020c6142cedba58ca7.camel@icenowy.me>
In-Reply-To: <b1a3f887fd037fd18c45ac020c6142cedba58ca7.camel@icenowy.me>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|SJ0PR11MB4992:EE_
x-ms-office365-filtering-correlation-id: d3a8d8b1-b314-49e9-ad29-08da94a76169
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fw38IkuAwxHKQ1KHaGmOSFcVUd7B8quh1xWwl0JGXcSpO+wpnVJQ5ShsMOX15DlKHFAtJRA46hcj1Hxx3ikepLFt5pxzQwlQUWZ24PwSwMinf8P+AOdhTZ9f3iuud4mJJEZtL0FNMCa2djqPSSdbjyhv1szYjuMhjIOXP+eNTms6CFqduhespFreioLAhz94yZqP8sueSRjlGmorJcF7G4Ma3qx+8eaMYMQI54DySRaShb/3xIEWotuNRL0k2grv2OsBbayAOFyiXtoSGeiptZy12yCYTJ16tWTh8gPLSyA1gWEf4MRsConfFG9SDR+OExuWJTFFTLnJvF2+TRiyqNe4En8bNKFCBCOKce9AE6oum7b1q8oTGRTcwdYCy4JB+vV2MeD32r8v7EXTX5WlFm5mFg8OPZ3EhJIGUvuLCQ6S0RNLOD4ZDyEmnQ8MYC1yXLhJuDpdTLB3eFHr6jDm1HC6BP1DbANXN8mAgFuPQD6xuAoYJHSkNAM9kL8MLTbY9b2GFE3lqUfVv9kXQEX/3bubgLXEJji5rou/3aZssnyatEryba4xEmJOrQL8pgvNqK2e4K7DdC5Mo+VuS3gaMkBShw2jKntgUdLfFlteUafzHvgDRS/aIWfc5HFfzgRvyrOaEuCZfqGJTb5VhvfjDhUwjLS7aGGwXoTrS9u+Jy0OBdT8caf7xmknRI2bvvg3T9ahsuFHZyylAcunVFWbxEwqblLpQQl+/EDlYwwVfHM+wul5Y5DSEr0e7YyNeeM6mz1ELU8cgxC/OFmZuGHcv1r/qFDXvxBUYuccf3U72I0gUVv4W71Vv8Hbb6m5V6bj3QJCCuayE8ZPIsiXYRPf1BfZMfIoco4BWkE8gQqHd2dc1i6dsm89QOlKlj7nQ1YsUjg+2hRW1LNPA7AnnTZ8Cw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(396003)(39860400002)(31686004)(122000001)(38100700002)(6512007)(6506007)(26005)(83380400001)(2616005)(38070700005)(186003)(53546011)(54906003)(316002)(966005)(86362001)(31696002)(91956017)(64756008)(66946007)(66556008)(76116006)(66446008)(41300700001)(478600001)(71200400001)(8676002)(66476007)(7416002)(5660300002)(4326008)(6486002)(110136005)(2906002)(8936002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlVtL29mUGJYZDl1aXZObXhNZTNVNXNKdkp5Qk51emgrQjRyYm9HdG0zbUpu?=
 =?utf-8?B?UFc0NXcveWtzUzB2UlNHWTlGa2Q5TlZrTlJ4VFg1STBlT0FXYmxNazMrUnFn?=
 =?utf-8?B?b2MrVDBmYnBaaENJL2xFUDFZK2JMWFdXOVE4OVc3VWxIWnVRcWNwOGM5SWdZ?=
 =?utf-8?B?ODVxNmUvR2FJbTB0UXBRMGRQMW5SY0xoT2k2UXpXVnRsRU5DYU83Q3FZcjgw?=
 =?utf-8?B?QXpOSU9OaEZ4N1RqSVc4MjMrdk9hNWdEV1Q4d3N5Z2NIMU1penJIWVMrNnow?=
 =?utf-8?B?WkE3VjlCRG01d0VtN2FvaTUyd3ZucXM3bnQxVm5hY2hrRTR6Qndic1dZZ0kx?=
 =?utf-8?B?SElrRUltYVNqYmdhdm5YeEpBeUNWTTBLVjA3eXVLdDFDdWtUOWJDalhMNE10?=
 =?utf-8?B?QXNTdWxyc0NQaDBPaU1oWmY5Zy96YnlRdGpIYWtvKzBFSnVpZUVGR3NCN0tZ?=
 =?utf-8?B?UlN0SmR0bGVNZGNxSWtVMkNMTTB3NXh0ZEl5cTNLanNNOThjOWhCSmRaWWtn?=
 =?utf-8?B?WDRKOWcxTVYycFdaQXMvc0lHMHlKWTkzZ3pPZzdLZEdmNllTYzVuSWZKVzlj?=
 =?utf-8?B?Ujhvby9na3JqaDBMK0RVRVc4U1Z1YkxGMEhQUko0cXYxaW1jVEdTVlROYW5Q?=
 =?utf-8?B?QytEZUl2YTN3Z0pDOTdRbmw1SWNvbkpYdm5MSndJMGxIcVhBMzZJNUttNjlJ?=
 =?utf-8?B?Sk52bW5aYWRYcXcxMW1oQ2tZNWNHSXN2K2I4L05CSUltSWwyTzcwckhBZmtM?=
 =?utf-8?B?TWlYMlMrdHdwOGNjM0ZsN3JCeG10K0xEM3NmeU1Ka0E5dzY0OC8rNGMvM2pr?=
 =?utf-8?B?SmlUZXlvakxsSWk4d1gyMWIvYzgzeVJ3N2FyQ2NBWVNjVTRSQk81WmptMTFw?=
 =?utf-8?B?OWtiaWJtZENvcDcrMllleEdCbkltVUZzQnNSdkY0UUpFYmVRenFPc1FKelBu?=
 =?utf-8?B?UWI3aWlMNTAvM1lWUkRzSGF5ZlNZY09Hc2Z0bmFIVG5uQ0xpYjRuWWQzSVJW?=
 =?utf-8?B?cndvU1VURCtMcVRlYzV4NURBT2p4NVNXYVRSNFo3a0ZjSzlPM3Bza255OWU4?=
 =?utf-8?B?SzJTNjUzVEE5WkthQXplaU4yWGtxU2t5M25rbmVmR2wvWGhTRWY4V3hHTlhj?=
 =?utf-8?B?T0hiMlYyczE4TGQrZXNabzVMTXZoZjlacnNIMGY3OW05MHQrT1B6eEVwSG00?=
 =?utf-8?B?Z3duMHp0bEF6Qk1NdnlpejkzOGc5OUJGYVBTd0JMdWZZV2dKYUZOVW9qRERT?=
 =?utf-8?B?QjBYN3RDM3pmd0dVRlFvUXRmbHRFVWxqZFQzcmRkUWRlYU1jQ3ZsbldrWlVG?=
 =?utf-8?B?TUVqd3JFSHRoclVGNU1taysxbm91dWNZMnlXR291bU5wVkdydzlWRTNtUFlG?=
 =?utf-8?B?MzRqT1I4d2tNQVRFc2FLbm5KNVVSRlo3Z003NGd4cjNqYTV0MVlPMEdTYi9T?=
 =?utf-8?B?Yk5wbkluZmtHcDJlSDhxR2o4OE1XSnhDTC81TUxUNE1mbXhRbFprQ1l6cFZK?=
 =?utf-8?B?VlpabFU2QUFUSFZDNzdrYmVxdkNUWFpsa0pSZ3BpckdGMjE2UVBORzM3SXBC?=
 =?utf-8?B?S2JKWS9IbUhIK1dVTWkwRzA3VFIrN0xSQ1ZqbUZZUG9YOEs2YmtNRzV6YXZy?=
 =?utf-8?B?dmxBMlRNMkJKb2tWYzRMOWw3UXpEL1BLREJOMkFZRHJ1dEIwblg0a2RCMU51?=
 =?utf-8?B?dE9WM0VzRmJmeXc0THNpa3lFcWlFSVp0eVRqU0RBbmsvSWhTSW1NczBjS1Zp?=
 =?utf-8?B?d2w4Z05ldFc5NnMwK1FSYmtleWNRelpzdy9rbDh6bFppeXFra1hrb2pPbmJv?=
 =?utf-8?B?V0QxK2JUem51VlVheWEvMVNjc2VnaE1jNXVhdHUxNmRJTTFCMXdlaUtqc0hU?=
 =?utf-8?B?ZXJFOFdRZUcyWDVESUkyK21hQ3VzTVpxbDBtK0p6S3UwUXFZNUhQd3AyM3FW?=
 =?utf-8?B?U2tCYnlyTit3Yi9YVmdiaVpiL016eVFnQytBT3hLUlpzNk13WitQU3dtSHBP?=
 =?utf-8?B?b2F0VmVWNHF5VzNwazlXdUhaTmZ1VC9QRUl4Z25iMklON1dPZlBpaVNlU3dD?=
 =?utf-8?B?Y0hFKzNEWEtybGFBSWdsL09lcVpMRVEyOVozMmFNSTkrb0d5OVllL2k0ZmI1?=
 =?utf-8?B?Wi8zNTljRDFLZ1EvRWVTRldVUnF1eTYyajVrQ214QTJjMlg2bGQrNzRyUzNy?=
 =?utf-8?B?clE9PQ==?=
Content-ID: <9D0D7AFA68162141A47FECB08F6C53F6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a8d8b1-b314-49e9-ad29-08da94a76169
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2022 10:13:04.0486
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRL98KlHcxPzDk2exizHuxx8cmn4Gqn5yRYNU/WZSBDo2lZbYvx12Y7dMhgYfRGKakyh0mdWjgeOXZbhSJ5jc/hRNxG7egXRArjtTmwjthA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_031312_868099_562BEE0B 
X-CRM114-Status: GOOD (  20.21  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMDkvMjAyMiAwMjozOCwgSWNlbm93eSBaaGVuZyB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiDlnKggMjAyMi0wOS0wOOaYn+acn+Wbm+eahCAx
ODoxNCArMDAwMO+8jENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29t5YaZ6YGT77yaDQo+PiBPbiAw
Ny8wOS8yMDIyIDA2OjQwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91DQo+Pj4g
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4NCj4+PiBUaGUgRFQgYmluZGluZyBvZiBGVTc0
MCBQQ0llIGRvZXMgbm90IGVuZm9yY2UgYSBjbG9jay1uYW1lcyBwcm9wZXJ0eSwNCj4+PiBhbmQg
dGhlcmUgZXhpc3Qgc29tZSBkZXZpY2UgdHJlZSB0aGF0IGhhcyBhIGNsb2NrIG5hbWUgdGhhdCBk
b2VzIG5vdA0KPj4+IHN0aWNrIHRvIHRoZSBvbmUgdXNlZCBieSBMaW51eCBEVCAoZS5nLiB0aGUg
b25lIHNoaXBwZWQgd2l0aCBjdXJyZW50DQo+Pj4gVS1Cb290IG1haW5saW5lKS4NCj4+DQo+PiBJ
IHJlY2VudGx5IGFkZGVkIHRoZSBtaXNzaW5nIGVuZm9yY2VtZW50Og0KPj4gaHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbHBpZXJhbGlzaS9wY2kuZ2l0L2Nv
bW1pdC8/aD1wY2kvZHQmaWQ9YjQwOGZhZDYxZDM0Yzc2NWMzZTAxODk1Mjg2MzMyYWYyZDUwNDAy
YQ0KPiANCj4gVW5mb3J0dW5hdGVseSBiaW5kaW5nIHcvbyBjbG9jay1uYW1lcyBlbmZvcmNlbWVu
dCBoYXMgYWxyZWFkeSBlbnRlcmVkIGENCj4gc3RhYmxlIHJlbGVhc2UgKDUuMTkpLCBhbmQgdGhl
IHJlYWwgY2xvY2sgbmFtZSAicGNpZV9hdXgiIGlzIG5ldmVyDQo+IGVuZm9yY2VkIGJlZm9yZSAo
dGhlcmUncyBhIERUIGluIFUtQm9vdCB0aGF0IHVzZXMgInBjaWVhdXgiIGluc3RlYWQpLA0KPiBz
aG91bGQgdGhpcyBiZSBjb25zaWRlcmVkIGFzIGJyZWFrYWdlIHRvIHN0YWJsZSBEVCBiaW5kaW5n
Pw0KDQpEb2VzIGFueXRoaW5nIGluIFUtQm9vdCBhY3R1YWxseSB1c2UgdGhhdCBjbG9jayBuYW1l
PyBUaGUgY2xvY2sgbmFtZSBpcw0KY3VycmVudGx5IGJlaW5nIHJlbGllZCBvbiBieSBib3RoIExp
bnV4IGFuZCBCU0QgKGFsdGhvdWdoIEJTRCBkb2VzIGhhdmUNCmEgZmFsbGJhY2sgdG8gdGhlIFUt
Qm9vdCBwcm92aWRlZCBuYW1lLiBUaGVyZSdzIG9ubHkgb25lIGNsb2NrIHNvIGl0DQpzZWVtcyBm
aW5lIHRvIG1lIHRvIHN0b3AgdXNpbmcgdGhlIG5hbWUsIGJ1dCB0aGUgRFQgaW4gVS1Cb290IHNo
b3VsZCBiZQ0KZml4ZWQgc28gdGhhdCBQQ0kgd29ya3MgSU1PLg0KDQpmd2l3Og0KPiANCj4gQW55
d2F5LCBJIGhhZCBzZW50IG91dCBhIHBhdGNoIHRoYXQgc3luY2hvcml6ZXMgYWxsIEZVNzQwLXJl
bGF0ZWQgRFQNCj4gZmlsZXMgdG8gVS1Cb290LCBzZWUgWzFdLg0KPiANCj4gWzFdDQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIyMDgyNTA4MTExOS4xNjk0MDA3LTItdXd1QGljZW5v
d3kubWUvDQoNCiBGcm9tIHRoYXQgcGF0Y2gsIHNob3VsZCB0aGlzIGJlIGNoYW5nZWQgdG9vPw0K
DQotCVtQUkNJX0NMS19QQ0lFQVVYXSB7DQorCVtGVTc0MF9QUkNJX0NMS19QQ0lFX0FVWF0gew0K
ICAJCS5uYW1lID0gInBjaWVhdXgiLA0KICAJCS5wYXJlbnRfbmFtZSA9ICIiLA0KICAJCS5vcHMg
PSAmc2lmaXZlX2Z1NzQwX3ByY2lfcGNpZWF1eF9jbGtfb3BzLA0KDQo+IA0KPj4NCj4+IFNpbmNl
IHRoZXJlJ3Mgb25seSBvbmUgY2xvY2sgdGhvdWdoLCBJJ2QgaW1hZ2luZSBpdCBtYWtlcyBsaXR0
bGUgdG8gbm8NCj4+IHJlYWwgZGlmZmVyZW5jZSBpZiB0aGUgY2hlY2sgaGVyZSBpcyByZWxheGVk
Lg0KPj4NCj4+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tPg0KPj4NCj4+Pg0KPj4+IERyb3AgdGhlIG5hbWUgaW4gdGhlIGNsb2NrIHJlcXVlc3Qs
IGluc3RlYWQganVzdCBwYXNzIE5VTEwgKGJlY2F1c2UNCj4+PiB0aGlzIGRldmljZSBzaG91bGQg
aGF2ZSBvbmx5IGEgc2luZ2xlIGNsb2NrKS4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEljZW5v
d3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPg0KPj4+IC0tLQ0KPj4+ICAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jIHwgMiArLQ0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jDQo+Pj4gYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMNCj4+PiBpbmRleCAwYzkwNTgzYzA3OGIuLmVkYjIxOGEz
N2E0ZiAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1
NzQwLmMNCj4+PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMN
Cj4+PiBAQCAtMzE1LDcgKzMxNSw3IEBAIHN0YXRpYyBpbnQgZnU3NDBfcGNpZV9wcm9iZShzdHJ1
Y3QNCj4+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+Pj4gICAgICAgICAgICAgICAgICByZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYWZwLT5wd3JlbiksDQo+Pj4gInVuYWJsZSB0
byBnZXQgcHdyZW4tZ3Bpb3NcbiIpOw0KPj4+DQo+Pj4gICAgICAgICAgLyogRmV0Y2ggY2xvY2tz
ICovDQo+Pj4gLSAgICAgICBhZnAtPnBjaWVfYXV4ID0gZGV2bV9jbGtfZ2V0KGRldiwgInBjaWVf
YXV4Iik7DQo+Pj4gKyAgICAgICBhZnAtPnBjaWVfYXV4ID0gZGV2bV9jbGtfZ2V0KGRldiwgTlVM
TCk7DQo+Pj4gICAgICAgICAgaWYgKElTX0VSUihhZnAtPnBjaWVfYXV4KSkNCj4+PiAgICAgICAg
ICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihhZnAtPnBjaWVfYXV4
KSwNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInBj
aWVfYXV4IGNsb2NrIHNvdXJjZQ0KPj4+IG1pc3Npbmcgb3IgaW52YWxpZFxuIik7DQo+Pj4gLS0N
Cj4+PiAyLjM3LjENCj4+Pg0KPj4NCj4gDQo+IA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
