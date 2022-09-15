Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB26CC6FA86
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWpZFVvxieI2AX0DBuDcI9goNZ+U57hlxgwbJ3Hb5WE=; b=CUgMpKlpg6cNke
	sONFjcHjYoFXHAn9Di5YUuH3HgiMuW9GBX1zdjipmNldeydJNpBE3thLVjcqiqwphqGz+O+hMRS6b
	0iYeyhvY5q1mhlpwOahBRT4YRDKLFmBrB5wcS0gWdOShjxFUrQaVJqYQLbCMxFHtxtsgMwbPpTJcL
	6QsxhI7p0LC+d40JKktZuIwEWF81ua8C825v698o1TbtCOn9VxVJ1Gds5AkRVgzGSuiMwRbz5DB+r
	bOAhzHm0wYU8CfAfAPJGmN7mQFigemc5HWye9jeXNvnSBNnq5sXhFmJ9Om5ekRUc8CAteQZTdGj0C
	Z4dniEBKpTLJJZv/uQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYty1-00FiPR-2m; Thu, 15 Sep 2022 18:52:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtxy-00FiOp-Ks
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:52:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663267922; x=1694803922;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9zuCVvnBEF0iGouufv/avKnJ654jwmoS4N2ytuwPDHk=;
  b=fn56185n/YAOPPIm9aygeMgtfszPUHwOUTMh19JCzynCsk3qD6q0SqvP
   ZXVkwjT1egrgAQPiWnJNwbGZLr3VUnO+5UwxsZ5Rotzgs0d0XLrEExqEz
   YRrbZvcx18lYnz6HebPJOkoQdvF1V5IS1aevo9l1uV+seZNzpRbAUazi0
   sMkrfhfD6TaU03gTp1QfT08vL2P8n+TjtvOKKVu83Mm+7qAa5VfVuGnxw
   XhTzXipnoSMs/BEnNspMeqUV9oyGVDS/bkDnFcRg2LSlI7FDjMhyxwWPO
   qNBA7loRX6XAYFG0yXwxDWTXtCtaheoSwbF6aejgsTV/jy2yEDztWDMDE
   w==;
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="113897785"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 11:52:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 11:51:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 15 Sep 2022 11:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEe9cNltulzr6lMiOfoMBSgIQbpOMzjBP2v8ynMBTvpUOgylwdjRKtuuryciDE2URb2hEWlhgiV2j5Kt5IgLNIA/uoVfiJvfyVKxJ7KeP4Hubgi/fQ2D3eiBA5MJjR466TaQlWI/kgLFpa2yuhPxdubPpCT6P8Um1gxPvfipI4feMmEjk/UYy/wOS9Ajd7+hnOrlKg+IqyyJY6ZORg19YXWmnx/QbXb6L4Ut8Qz0OsII5cMKmzPsXnW+qoxFQC4fHLvfESSNOq5ZbHdo9Hiv7afmYQLH1rTqmzbe7m8ZM7IrOxvJ6jSIK2qlfVU/rJqtgPW76PaMMjC79k9c6vPrCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zuCVvnBEF0iGouufv/avKnJ654jwmoS4N2ytuwPDHk=;
 b=STyFLPXvSYImAwsOn6JqnmppCxOacKmfcwFIrv/aPq0uYn6XlWQX6hTTs0pd2dKQXYh5tMXdihLQiDs5fE/2BfPRH19N9diFfKfKUeBxLR8qbH+AvMKBDx/yUie6d9lXynCT+LcRomylwon8+W9dbsnnJRPYBhtlDNEvFVsec2IMRoZFUN4erUoqahwhANUbUke17Yodq+Mn+VVV0WF/gD8QTPQcmu6LgHVx6M08og3siMJqtFfm6MsZlLcpALs0VoXzvxGFAuV+bZZ6F8wsLsrOmdgkPUuBbhZDR5DoiJdxCgSaobhZRIOkkEn9WCHzaPwrN66VvilLnthB59GVvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zuCVvnBEF0iGouufv/avKnJ654jwmoS4N2ytuwPDHk=;
 b=SgDYPc+vj/wtTQsvOhAmd8qsI/y5S9ltLtKEJCwSy3yZ+YdT0G+ReXz8qZvlEZsDaFRLKTLYjcWpX1pogBHWDOuuNJPKy+FI8m3kmcsfh8q3ZfU2Wjr2NIBlupFe2PRdF+aDRHpoJUp2T0nzBTMoPogPPi2dOB2Jvy0ZevxGBvg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 18:51:49 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 18:51:49 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@dabbelt.com>, <ben.dooks@sifive.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <sudip.mukherjee@sifive.com>,
	<jude.onyenegecha@sifive.com>
Subject: Re: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Topic: [PATCH] riscv/vdso: fix missing vdso_data declaration
Thread-Index: AQHYlwUDWewAM0BLJUeq97TdYernnq19aZYAgCz094CAAAVQAIAEXu0AgAa8KwCAAIfOAIArM5+A
Date: Thu, 15 Sep 2022 18:51:49 +0000
Message-ID: <76b2b200-d013-1504-b265-fffa9e713c67@microchip.com>
References: <mhng-192f7819-dbb8-4cd0-af6c-ef89d5579a14@palmer-ri-x1c9>
 <71ddab3b-a38e-7957-d3cb-65d6ba64c4ef@microchip.com>
In-Reply-To: <71ddab3b-a38e-7957-d3cb-65d6ba64c4ef@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DS0PR11MB6422:EE_
x-ms-office365-filtering-correlation-id: 77b5dfa8-3196-43f8-edac-08da974b58e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 76xArko2e/y6eNiOJ8kh0cyVJHyQqzZJVBjN4xjLnYFXDQS+fPscnvZAKXVPrvOo8E5xkyzjCsjvs8uxR9xbk8UfTvefzmFo7R0qYF5xvyY7EKHyjSdaPFi1NnFRVuo39OgNwtnIRpwJiZRY8Ek1ra80OWZn/kZa7VnGBFroYLSY//wr2Dce0/WPVUXd0u5Si3ugub+IO8m7gY2e2DaTDY5AqT10VY4fhxU2/molU3YUXhmpydCh6vVS0E7Jp9hH+1miLppZU9nHsWQJB4s50Cxau4zKYfsllILujtr2pRaj4ql4YIama8tGg+0R8VqHari8WqFF4cLvMxHhOS/cp6NugFSrQF/uZcK+9gp/Jk9BWXkY1lswoI65heC4B1u58DtHaXwxGchBeh0gaxeUwQwx8luLHnCFDdNxLQux8IN5SeEFJu60iUTdv4KBtq5rZulLi0vuxx2NSO2vu9sQWSSwok/JoTAJ0NdYr1chJFRT/iRIHdgdrGlsVbKpuicwnWz3rVXtq5Q2zel0JV8GQZZSxl7AXXO9xLv6XjKUHYMcHXSReoHXmpPNZU+28KBrOdInfOLM9lzXicohozBxd198cC21qcavRD/M0wKm2YHjjsYPASvfN8YFySHIU2Cn3Ge44ANYdFXTKPc0Xa95oD/NakQR2mfNFiG5lHne6FpGWc7Q7cDEOxclvbqFTswPqscgNCHFDZB3JDXMqvGzn3iZZc/9LxZ3EhGBLHYKjROlv+qk49n39B+7m+A0fzqJ+pXoVNAS5n7GVR8EQaX+LcUltxjCoXNfKHi9TxrMUhPqkmrFv8LFDfBYGWDLigfXxptC1FbngiuMgwzwQDB0nw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199015)(186003)(83380400001)(76116006)(31696002)(6512007)(8676002)(2616005)(2906002)(5660300002)(478600001)(71200400001)(66476007)(66446008)(91956017)(66556008)(26005)(6486002)(31686004)(4326008)(53546011)(38100700002)(122000001)(8936002)(64756008)(66946007)(110136005)(54906003)(36756003)(86362001)(316002)(38070700005)(6506007)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0F3amkwNk1lKzhVY25VSSs5SnB6Z1VxSGRWVmFUWHZoQWpUeEY0RFBNQ3Q5?=
 =?utf-8?B?VVlPYlV3NGUybjNjNXJ6UHVReXBUTlgyeFBPVUZXcHhJNVFuYUFpbXN1V0VW?=
 =?utf-8?B?bldOYzhyRlIwSGRwYTY3Sm9TR296VmQzOE9rNkJqbXdWQWltVklWRFo4cGR3?=
 =?utf-8?B?SERIeVJTMytBNFgvdWFJcEh4YllUaUU0OHV6RFFtK2dwejFDTS9nMjhZYTRM?=
 =?utf-8?B?cGEzYnR0RW5BbHRHcTczRDBEN0pBYXV1d1RxVEtydm53dDVxaHVEQy9WTE9B?=
 =?utf-8?B?anNPUXNuRFMvT25rQkNhY1h0NzMwRFRSbFRxelZIVllZRXJIc2xTU2F2UVFF?=
 =?utf-8?B?TXllbkpnYis4MlJjN2VpZTlsaTRqSE1WM3hZYW5ZT1hCaHVDWnYzMVRSR042?=
 =?utf-8?B?aWpBR3BBNlRQVXBiRXQ5OHVOd0NlcTVqMkoyYTlZZFpDVUZ3UWJNNkJtYndI?=
 =?utf-8?B?c2ZNZ25Ca2lZRkRxV2hoSEtHWXNkSzNkR0kzRVMwYWJtWWgvWWhsZTYvc005?=
 =?utf-8?B?WmlPQ1NpZlRMNWpxeklNZVEwRE1pRHR2QWE5ZTZrREF1SW4vRmQ5cnY0SnU3?=
 =?utf-8?B?a1JreENBWm85bWFDUUNPMmZWVHdrN0JLVGtMS1h1MjJwdkh4R2NLOHF3eTk0?=
 =?utf-8?B?S0FqcERDUmpSOFNwVHFYMDZIVXdCUDZaUkpJSXhzVkJPdTBXMWNBRzRJaXBN?=
 =?utf-8?B?azBYazhpYjFtUHBUOWZVTFcvcCtic2FNV2VVRXVXaXh0OUpqdTUvUDZ1MGdD?=
 =?utf-8?B?Y2hDczU0Q1VqRW5rQnlkVXo2bjk2SE55RjRDZ3NhUHhTR2dwblJpbndDRDZ3?=
 =?utf-8?B?YUxwR01pQW96M0tTRVR4RW5pN1lkZ2hSRStvZjFBTzR6RkZORUM2M3pRZGU5?=
 =?utf-8?B?OVY2dGk0RDZLcFU2TjNwT3ZiMndBR0Juc3NYeG9NVXV6SUV5Ni9wVGptWU1D?=
 =?utf-8?B?L1NYeWZjWFkyMFFTQ0g4WlVvMjFVbmR4Q093TTRFeTQ5R3M2RXJtaTVudXhq?=
 =?utf-8?B?eUc4dmFISmlZMmlXcnRrbWpBRXJDc0ZURWw4ZnpZWmtOWkphL0YyQXhpL0pn?=
 =?utf-8?B?Z0JoNmQvc3pFaDlpNTRpT09BVDMyYzZwZGMrYW5aZ0ZvUHBVN3AzUnh5Smpn?=
 =?utf-8?B?SFV6bFRjTzdVNkFnMFZCOThDc2FubVZrVS9DVVJFVm1GRU14RitnSW9FajMy?=
 =?utf-8?B?M251MTVBc1JWS0ZOS1VVTy92MXhYV1Z2YnJDTzdVN0lKVW9mbVNGL1BjNDRL?=
 =?utf-8?B?b2ZFQTFlb2ZlOWRVN05KL0R6OGlMOTV0ZVl4b1cvZ3BSNFJUNDc1Qi82WnVL?=
 =?utf-8?B?aUZVKzdtU1JOR1RxbWdHbzVqMFN6OHZ6dlhrbWZTK0xpTXJXVGZoSXlzWnA5?=
 =?utf-8?B?RThORjg3TjNuWTVrUDJEMGVCbVlwRzBmSmxqTHVlZ0JhTmpkUk5YbHJCUkds?=
 =?utf-8?B?ZGgwdjR2QVRqbEQ1L1ZtdktEdml6L1d2L25DNFR0MzA5SUNyOUExYllQNUU4?=
 =?utf-8?B?K20zYTNHZjJaTDNEM0MrU0I4TDBYclM1dUdZWlNQTSt2cko4WWRmeCtFcGtz?=
 =?utf-8?B?M2U3T3VsWUxvYWRQQk1HSWhBMk1zN0N5dEVPVEJNWmdhRUZWNWgyby9NVUJ0?=
 =?utf-8?B?VTh4T3pMNHUxbG1jOVlXUk5panRHMlk5dE42Tld5NkhoYkVMMEZVSTl3RHVX?=
 =?utf-8?B?K1pMMW80MHNITncrOEkyQk1FaGtWTVk0aTdaTlJmc2d5a2JraUxpS3AzY2Rr?=
 =?utf-8?B?WU95UVAxZzFBb1FkYTQrK0tEbzVsU1FYaGdFbmIrYTg4M2NpODF0TjFSOXlB?=
 =?utf-8?B?YXR2d3FWSHd3Z0pNc2g3TzYxa1Q2WHB3NHBGOVYvem9KT0FBWVZhbEluUmIz?=
 =?utf-8?B?RXcyclY5TGRyQzM4MkJqclM5Z3BTYTlmaWdLcUNzZFNBTDBheG9GeWxmZDdi?=
 =?utf-8?B?aXNJM1dmU3JQZVREUlZhNFZEY2h6dUUzek13OW9sWld6N3NzMSs3M0YrZEhS?=
 =?utf-8?B?SUc4ZjBwZmEzZ3pNY0ZZM242QU10Q0J0U3pkOXZGNG1pSWhwcUREWmx0R2xQ?=
 =?utf-8?B?VEErMnBhYklXSzNnbmZ6TjFxa3ZHc1h3czEyaFhweFVPVW1VMkxYaWxBWG0r?=
 =?utf-8?B?VUdadjZpdTA0RHAyL3RrUDZmZDJJeDBLK09abGlLNVdnSlh5WUI0anJiMXNT?=
 =?utf-8?B?anc9PQ==?=
Content-ID: <DE1AC12BC7C8D848B6E56BAB1CE9BF7C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b5dfa8-3196-43f8-edac-08da974b58e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 18:51:49.5395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWQ1ljXF2fGeXVlbE0BC7IUegA82MDLsXFIRg+x0URWiKNWSOy/4WLrjZSkT44x+JIpPSzMUsooKzfF12CwXEZsBEcWUBBk4WI5KVMoPJSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_115202_796270_F3BAD096 
X-CRM114-Status: GOOD (  27.94  )
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

T24gMTkvMDgvMjAyMiAwODowNywgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiAxOS8wOC8yMDIy
IDAwOjAxLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToNCj4+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRl
bnQgaXMgc2FmZQ0KPj4NCj4+IE9uIFN1biwgMTQgQXVnIDIwMjIgMDk6MTA6NDggUERUICgtMDcw
MCksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+IE9uIDExLzA4LzIwMjIg
MjI6MjYsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+PiBPbiAxMS8wOC8y
MDIyIDIyOjA2LCBQYWxtZXIgRGFiYmVsdCB3cm90ZToNCj4+Pj4+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPj4+Pj4NCj4+Pj4+IE9uIFdlZCwgMTMgSnVsIDIwMjIgMjM6MzQ6
MzYgUERUICgtMDcwMCksIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4+Pj4+
IE9uIDEzLzA3LzIwMjIgMjM6MDYsIEJlbiBEb29rcyB3cm90ZToNCj4+Pj4+Pj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoZSB2ZHNvX2RhdGEg
aXMgZGVmaW5lZCBieSBoYXMgbm8gZGVjbGFyYXRpb24gYXMgdGhlDQo+Pj4+Pj4+IGFyY2gvcmlz
Y3Yva2VybmVsL3Zkc28uYyBkb2VzIG5vdCBpbmNsdWRlIGFzbS92ZHNvL3ZzeXNjYWxsLmgNCj4+
Pj4+Pj4gZm9yIHRoZSBkZWZpbml0aW9uLiBGaXggdGhlIGZvbGxvd2luZyBzcGFyc2Ugd2Fybmlu
ZyBieQ0KPj4+Pj4+PiBhZGRpbmcgaW4gdGhlIGFzbS92ZHNvL3ZzeXNjYWxsLmgNCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gYXJjaC9yaXNjdi9rZXJuZWwvdmRzby5jOjQyOjE4OiB3YXJuaW5nOiBzeW1ib2wg
J3Zkc29fZGF0YScgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4+Pj4+
Pj4NCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQmVuIERvb2tzIDxiZW4uZG9va3NAc2lmaXZlLmNv
bT4NCj4+Pj4+Pg0KPj4+Pj4+IFJldmlld2VkLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPg0KPj4+Pj4NCj4+Pj4+IFRoaXMgb25lIGdpdmVzIG1lIGEgYnVuY2gg
b2YgYnVpbGQgZXJyb3JzLCB0aGluZ3MgbGlrZQ0KPj4+Pg0KPj4+PiBIbW0sIHdoYXQncyB5b3Vy
IGRlZmNvbmZpZyBmb3IgdGhpcz8NCj4+Pj4gSSB0ZXN0ZWQgd2l0aCBteSBkZXYgZGVmY29uZmln
IGFuZCByaXNjdidzIGRlZmF1bHQgb25lIGF0IHRoZSB0aW1lIGJ1dA0KPj4+PiBzYXcgbm90aGlu
Zy4gVHJpZWQgYm90aCBhZ2FpbiBub3cgJiBubyBlcnJvcnMuDQo+Pj4NCj4+PiBSZXByb2R1Y2Vk
IGl0IHdpdGggcmlzY3Ytc3lzdGVtcy1jaS4NCj4+PiBMb29rcyBsaWtlIGl0IGlzIGhhcHBlbmlu
ZyBvbiBvbmUgb2YgeW91ciAzMiBiaXQgZGVmY29uZmlncyB3aGVyZQ0KPj4+IENPTkZJR19HRU5F
UklDX1RJTUVfVlNZU0NBTEwgaXMgbm90IHNldC4gSW4gdmRzby5jLCB0aGUgaW5jbHVkZSBvZg0K
Pj4+IHZkc28vZGF0YXBhZ2UuaCBpcyBndWFyZGVkIGJ5IENPTkZJR19HRU5FUklDX1RJTUVfVlNZ
U0NBTEwgYnV0IHRoZQ0KPj4+IG9uZSBpbiBhc20vdmRzby92c3lzY2FsbC5oIGlzIG5vdC4NCj4+
Pg0KPj4+IEFkZGluZyB0aGUgc2FtZSBndWFyZCBhcm91bmQgdGhlIGluY2x1ZGUgdGhlcmUgZml4
ZXMgdGhlIGJ1aWxkIC9zaHJ1Zw0KPj4NCj4+IERvIHlvdSBtaW5kIGp1c3Qgc2VuZGluZyBhIHYy
P8KgIEl0J3MgYSB0b3VjaCBlYXNpZXIgdGhhbiB0cnlpbmcgdG8NCj4+IHNxdWFzaCBzdHVmZiBp
bi4NCj4+DQo+IA0KPiBCZW4gc2VudCB0aGUgcGF0Y2ggc28gSSBkaWRuJ3QoL2Rvbid0KSB3YW50
IHRvIGVuY3JvYWNoIGJ5IHNlbmRpbmcNCj4gYSB2Mi4NCj4gDQo+IEJlbiwgRldJVyB3aGF0IEkg
ZGlkIHdhczoNCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby92c3lz
Y2FsbC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3ZzeXNjYWxsLmgNCj4gaW5kZXgg
ODJmZDVkODNiZDYwLi5lODJjZTk3ZDI3ZDIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vdmRzby92c3lzY2FsbC5oDQo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
dmRzby92c3lzY2FsbC5oDQo+IEBAIC01LDcgKzUsMTAgQEANCj4gwqAjaWZuZGVmIF9fQVNTRU1C
TFlfXw0KPiDCoA0KPiDCoCNpbmNsdWRlIDxsaW51eC90aW1la2VlcGVyX2ludGVybmFsLmg+DQo+
ICsNCj4gKyNpZmRlZiBDT05GSUdfR0VORVJJQ19USU1FX1ZTWVNDQUxMDQo+IMKgI2luY2x1ZGUg
PHZkc28vZGF0YXBhZ2UuaD4NCj4gKyNlbmRpZg0KPiDCoA0KPiDCoGV4dGVybiBzdHJ1Y3QgdmRz
b19kYXRhICp2ZHNvX2RhdGE7DQo+IMKgDQo+IEJ1dCBJIG5vdyBJIGFtIG5vdCBzdXJlIGlmIHRo
YXQgaXMgdGhlIGNvcnJlY3QgYXBwcm9hY2guDQo+IFRoZXJlJ3MgYW4gQVJDSF9IQVNfVkRTT19E
QVRBIGluIHZkc28vZGF0YXBhZ2UuaDoNCj4gDQo+ICNpZmRlZiBDT05GSUdfQVJDSF9IQVNfVkRT
T19EQVRBDQo+ICNpbmNsdWRlIDxhc20vdmRzby9kYXRhLmg+DQo+ICNlbHNlDQo+IHN0cnVjdCBh
cmNoX3Zkc29fZGF0YSB7fTsNCj4gI2VuZGlmDQo+IA0KPiBJIGRpZCBhIGxpdHRsZSBtb3JlIGRp
Z2dpbmcgc2luY2Ugd2hhdCB3ZSBhcmUgY3VycmVudGx5IGRvaW5nIGlzIHRoZQ0KPiBleGFjdCBz
YW1lIGFzIHdoYXQgYXJtNjQgZG9lcy4uIEkgc3BvdHRlZCB0aGF0IGluIG91ciBLY29uZmlnIHdl
Og0KPiBzZWxlY3QgR0VORVJJQ19USU1FX1ZTWVNDQUxMIGlmIE1NVSAmJiA2NEJJVA0KPiANCj4g
V2h5IGRvZXMgdGhhdCBkZXBlbmQgb24gNjRCSVQ/IFNob3VsZCB0aGF0IGhhdmUgYmVlbiB1cGRh
dGVkIHdoZW4gd2UNCj4gYWRkZWQgdGhlIGNvbXBhdCBzdHVmZj8gSWYgdGhhdCBpcyB0dXJuZWQg
b24sIEkgY2FuIHRyaWdnZXIgdGhlIGJ1aWxkDQo+IGVycm9yIHdpdGhvdXQgYXBwbHlpbmcgQmVu
J3MgcGF0Y2guDQo+IA0KPiBhcm02NCBhbHNvIGhhcyBhIGNvbXBhdCBzeXNjYWxsIGZvciBfX05S
X2dldHRpbWVvZmRheS4gSSBkb24ndCBrbm93DQo+IGFueXRoaW5nIGFib3V0IGNvbXBhdCwgc28g
SSBjYW50IGNvbnRyaWJ1dGUgYW55IHJlYXNvbnMgYXMgdG8gd2h5IHdlDQo+IGRvbid0IGhhdmUg
b25lLCBidXQgdG8gdGhlIHVudHJhaW5lZCBleWUgaXQgc2VlbXMgbGlrZSBCZW4ncyBwYXRjaCBp
cw0KPiBleHBvc2luZyBhIGRlZmljaWVuY3kgaW4gb3VyIGNvbXBhdCBzdXBwb3J0IHRoYXQgbWF5
IG5vdCBoYXZlIGJlZW4NCj4gbm90aWNlZCBiZWNhdXNlIHdlIGhhZCBHRU5FUklDX1RJTUVfU1lT
Q0FMTCBkaXNhYmxlZCBmb3IgMzJCSVQuDQo+IA0KPiBFaXRoZXIgd2F5LCBJIGRvbid0IGtub3cg
ZW5vdWdoIGFib3V0IHdoYXQncyBnb2luZyBvbiBoZXJlIHRvIHNlbmQgYW4NCj4gYWN0dWFsIHBh
dGNoLCBqdXN0IGVub3VnaCB0byBtYWtlIHNvbWUgb2JzZXJ2YXRpb25zLg0KDQpIZXkgQmVuLA0K
RGlkIHlvdSBldmVyIGdldCBhcm91bmQgdG8gbG9va2luZyBhdCB0aGlzIGFnYWluPw0KVGhhbmtz
LA0KQ29ub3IuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
