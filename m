Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF479C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OXKxQoEHBf85hHKg5Bm0SF76QuBGNQFmzMBC2UXxlc=; b=d+A5d2Zd2HfAb2
	uYmoPOyU+IHhNyJtrCqSBkp+kF41pwHU4iPrI+s3lWwce9udq/DnYV1aUgvW4XkOuBp9GrMQCEEF+
	KnTx1/eAXky28m0bCByVK4fc3q43EF5u9L89ctpbG3UQuAsH+CY/R6oCvjv2v+PAZANznysxQeKqk
	/igHX59CTkERi6ZARv4h0J0pnm6Y5e69dLvagrYZFKxR2Kt4WQWFRPmhcHf/ao45XpQM1Ohp/oxcv
	qwDhv6axJiKp1neQwzZFkf+3DgbqJNWYfrsy6wM8NjYcs73mbdadf0s/K2uh4vkwxfjf1XF1GzggL
	W7g85odnl+Xqv4uV0j7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNdrs-002FtQ-Lc; Mon, 15 Aug 2022 17:27:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNd2W-001hDm-Ak
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 16:34:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660581248; x=1692117248;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Fc7Dxj4HIFpDFSv+DeMGYWc/9y8PNEJeR2JFyT4IO5c=;
  b=vTRN8LVa38RjKNukS+pC5uVnm3GqX3Hnqxc3X2hDwUVlDyEDc5PH6/+Z
   uoyzxVHWCBY+n/8DWFNikI+t6vaNlaQnzL6KRxVUh9nVECfp0+dM6sNsV
   OdZJhUjRXxZmpeA7mR27D0d9F1zGPKpgTVubN3CDkjpnlaom0bKf+tiRn
   VCJQP1lUS7uKfsdsnj1CPGnx15RWkGk/R1hjsDPXZNUDAGMpyle3ZKBWs
   /wFtu1eOlou8UJGwn2LAyo138ZbvBf3p5iwTv+mooIYzGzEP5/HvuJA8F
   4zFyfcJq+DgbSPvobl9n/chVl+LAna8JVqOhtEMFvtIvHxtsACvc4rYzN
   g==;
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="109099045"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 09:34:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 09:34:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 15 Aug 2022 09:34:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4bSYSlF+QUFkm+ZQivGw7arpis1KkGktIew2tRqScnzqlRrnHsuFgA9GzBtSNAls9E5E04sMuo3CXQ3Z+Zq2/niMWjBAjGh5GHTKA8VhTENJ+KZ6QJYHp9qTSbpHvJYt3fE+6rRRleNhM6EPKJpGYgIW3Q+SzmFdvnCIsQ9j3MfX9VeS9caYpAa63ll56FqSu9DZxZP7Re8P1vTDlger8yM0MvfUXJlpR98thTVgO8oI9bjdYq8dcI7vWFB+kJj1oh/KJQp9bLbm2n/fXFZ1Z+H8fTTTb6/YFPuKKWqLoCY8DIzZrZ24KcmJLuIZpsi1a+TOhc1IquA+ZGYWPv/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fc7Dxj4HIFpDFSv+DeMGYWc/9y8PNEJeR2JFyT4IO5c=;
 b=J8VJkBo36A5OQSuZvW+BeKAjH4EZg+ql8+l5XFvq+zED8lUZLmxYCXNHHPTCIQfRtGqWv8OWfe6O9K4/XrieUQH6MihORhvuR9qO/NMQadn+gY65PQ5MK29djYTKYJfOkN9FwLBKcq85wwzSzS7lK3VQQ8bjK/rhXOw8zGNOak6HCl8iO6Pl6wir2YeCdA6M0nczPZkcBjq7fv6si/QL58sMweppgTPIBXFL9+ohk/pUiKXkrCADT2izAfm7wbM3JwFllQY7DhcbY4d8Th9t6OuEM2DZc4bm6j1th+gxN7GC/3YE+RuRvkb4anzGI+Y+lrJS2nICiBJyySxcuntIjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc7Dxj4HIFpDFSv+DeMGYWc/9y8PNEJeR2JFyT4IO5c=;
 b=exqXO2u5Hu+He1mPRmWJX/AWx+mlQX+zRwkQ6UCg72vXLyucH21/DBcpXLcmak9sHWTB3iJezCScpoApKOi9An/6wIwm46DnsV344+dUiCZdgP7/nYXm3P4L8q2agOfiD/KGWYlhsF4DdXm1NGNcmXCeEHDWwTbjkLH2VqyGxuU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 16:33:56 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Mon, 15 Aug 2022
 16:33:56 +0000
From: <Conor.Dooley@microchip.com>
To: <atulkhare@rivosinc.com>
CC: <palmer@rivosinc.com>, <linux-i2c@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<robh@kernel.org>
Subject: Re: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Topic: [PATCH v2 0/2] dt-bindings: sifive: fix dt-schema errors
Thread-Index: AQHYe5EWlaN9eJ6DkkaWySyozCpPXK1VKhaAgBTmLgCAAAMkAIAnEuWAgB9qzICAAAFlAA==
Date: Mon, 15 Aug 2022 16:33:56 +0000
Message-ID: <7595dda7-66db-5db0-b74e-4802e56962f4@microchip.com>
References: <CABMhjYp3xUyQ9q6nXHvEA2zuzhYi0ETn6UETeH1apWf2n2eP7A@mail.gmail.com>
 <7ba0c325-bc1f-f6e4-dd8a-b5d13a04ef93@microchip.com>
 <CABMhjYrDyOoDusE4-y4VzM87Vg=NhPbow_dQ+1C4EcX50LrMHw@mail.gmail.com>
 <fb861221-2e9d-7d4a-dd52-b16b3b581fd6@microchip.com>
 <dd128dec-6092-7aeb-6e66-eb45cea3b0cd@microchip.com>
 <CABMhjYrB+Qn9ZuJ3Lqpu0KVFGeg6avxkYqD=SQWyLjdQ3wSpjg@mail.gmail.com>
In-Reply-To: <CABMhjYrB+Qn9ZuJ3Lqpu0KVFGeg6avxkYqD=SQWyLjdQ3wSpjg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c06c8e8-cc6d-4adb-c8c0-08da7edbf302
x-ms-traffictypediagnostic: PH7PR11MB6403:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KUlmO4Ky6NJ0vniE0JqiMFAc3/nnn3RjCzIXPCwxhu9gkaf7jOIs/rbiJQh0ovBlfK84Fg1nJAzAHUkMsqorvSVfa/Uzl4b+YvBN0NvvB77GR+CuqbKc6c+0w2qND0pVSlVAWHDZYygcuLsX6/PlftlpHQmIZGtrEhvvpZ3p4ixFcbFHkUsFekzUMAs2aGKGehCmvUvTvFAOmq1TQyUX8Xy7xoBR06dnYPQDO+OOaLTobt9vhTF75egcYReHJj8buy/EQ+/PL8VRT3vVKblUNerELnJe0gumwlvURwgbyNnYYikPK929AeolfGGGHpnzJ+iBGBeUPLdmXHlxxPKUil2aXYYKLi8eoIzqrjHm361t1CoEBf1bDw1juQwTEGYlNlhG/ELpq8DXi/53U6kFAb64o2SqfneeUArNuuVFJmbDmjZjNfqkJM12SK4585vJCoX98uLEv2YlOij8ElKFaKLsfkuPRD8gWhVyU9PSVg7YyKX/vfVdH8ED2AUa5DsxkGpGYQTeUO8P57d2dZwNfBp6yGwM0FFdA0m89kjxW20MJtagMAZxd57IK/6xZ+ZDUaezWN97S7PLTjvxmoMT2MHCQxlLfdhqIRoA4gDAfIjDLfHs3NzTuDNHzSMdPVaRoKxzinkwl/bNsP7TvQzDJ1cOp4R8qko5sVqMoP821U7IZPNCq+trC5dMontc/msLzYeLtOZJ1h2gQ66ja3jj3NMf90wf6lnSpOu7X6ozyAjUdWrmIcH4zz7+sM74PHgeo7lG/AAhAeAUgytJ3hncSLJxz0Q3ZxJH7gMfwMv83FvysgWtV2F62kHd2wQfNFND4HNz1vlJIHFmi0KGRdAx1a7hycOiB1Yp5eslKQfPs+HkV58biN0iwOWWkITQ6BfV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(366004)(376002)(136003)(346002)(83380400001)(31696002)(86362001)(122000001)(38100700002)(66446008)(38070700005)(91956017)(76116006)(66556008)(66476007)(316002)(66946007)(71200400001)(478600001)(54906003)(4326008)(8676002)(6486002)(64756008)(6916009)(186003)(2906002)(41300700001)(6512007)(6506007)(26005)(31686004)(53546011)(5660300002)(8936002)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjF2NDFQVWNVT291Yk1lSThlK09Sd3BtS291V0JKVHNERjBGWkJtUWJpcjdW?=
 =?utf-8?B?SUhQZFB5Zk1PT1hXdmtvS2RpUS9BdDgweXROelhlYVZCS0diMDJicXBQMTlt?=
 =?utf-8?B?WGNlVEhHUkVVNUI3Z3Z0aVJVeSs5RjBVYjkwSXp6NmdWM0ZNSWc0UEtHVkww?=
 =?utf-8?B?Q1VMS25SSm9hUjlMTVpPdFZ1ZkpPMGc0STRDODBkMVdvKzFXVGZmckkrdU5t?=
 =?utf-8?B?VnhXRkY3NFJIZ3pnYjlVdHZnUG1LZURmUWpwdFNHN0hNWHJ5dmk0TzJncU5N?=
 =?utf-8?B?bngwN25FZjY0eU5wKzAxYTZwRFhBWjdrQW5FZmkyZ0NacER3SGNaSDk5QzJL?=
 =?utf-8?B?UzM4MUVLbzV2OEZxMkpZQ2JPcnU2V3hDbEZKS1RDekJFSTB3NVhNUDhqbmZ5?=
 =?utf-8?B?SlowQmtkdGx6SmNVMkRydmpnUWpmVVZLSm5vbHRCdlZldytUc2cySmdxOXcw?=
 =?utf-8?B?WUx1V05Ic3VJeXliYmdoM0JJUm1HOXlvWlhOMk9XN2Z2U0xCM2d1T2dTZUJY?=
 =?utf-8?B?Q1dzZFQ2bHVWM3ViOFpQdjBVRS9uSVAvaXQzSjVvcnBDZ081Rkt5bVR2dVcz?=
 =?utf-8?B?V0pUVklFWHFqU0I0dmRVNmFXZ1g3NnRONjlTcms4WTh5VVZGRFdGNFNlV2ps?=
 =?utf-8?B?OVlXSFMxZjd3R2hCcXliNXV1d3J0TGxnTTVhWklEdFc1c1R3OW1YMitRSGE3?=
 =?utf-8?B?cWFteCtjZlJ3MkJiT1d2QUplVzhxQ2xDbkJ0cmF2ajdkN05NR1hEM1BQVk5K?=
 =?utf-8?B?bkQzTWZETFBia3UrRE8vQlRwcWkyODF3TWZtSi9rSHVWRkZGdkRpSndDZGM2?=
 =?utf-8?B?K25Ia0dDdDRpMXF2K1pNYUdPZjBrTU1oYS9sb2JvQVd5cVkzMndmaXVlbHVQ?=
 =?utf-8?B?NlI0aTVrNGhSRStwMmNNbFV5RUhPc2h4Q0pwMTJpQnZ1RHUxcjU3MURPVWdZ?=
 =?utf-8?B?dmFkRmZLTnZqNFAyQ3hBR1RPMW91bnRUMXJTVW5lNG85dHBycDNESkE0OHV3?=
 =?utf-8?B?ZlNyRjlQN3lFS044VU1INEFGcncreS90L0tIOU0vcUo4SHlEMXlBOVdUVTNM?=
 =?utf-8?B?S29XOS9ZTDJDRklXazM1VGQ3ZEpmMXQ2NzJwZnl4UFpwNWRPcTBWZWtDWmFj?=
 =?utf-8?B?M0hOdmZmcXFKcHhpcEw5Z0JIUHRtSFUvNGRZN1AwT1pFdndzRmlDV29WK2Mr?=
 =?utf-8?B?a0JoUUM2akxLZDJIOGcva2lnbnpXelhlWW9XVFRONkM1bEtqVml2TVFVWm92?=
 =?utf-8?B?d3lZRVY5YTYreW4wejIvN0p4SEdsaldSc0pwSXFEL05kV2FvTzB2aDRjTXl3?=
 =?utf-8?B?b25vYU5naFErbFBYcEkxbnBuZGljOW9DYS9jUDE5L0NYR1RnQXQreXN4cUky?=
 =?utf-8?B?WmtqcHIycXJQblkvdjVaOU9xOGwwRUx4TURFUWtIZi93OTR0QjJ0RUFjUk9t?=
 =?utf-8?B?M2FTeUQyd2YrUUxscUhnbmFCbkVnVDZDZWNmd0xqWVZya0tUZHI3b1VvYTMv?=
 =?utf-8?B?ZGsxUmorS2VURTdLbm5zdW1XWmZjS1ZFZ3A4dzU4eEFpcXRERGlvNjdNTzF5?=
 =?utf-8?B?TUh6L2IwRWJ2VlN6S0lQVmVBMlg2NDhyWHhjWUZSckpZdFNQbXFVcy9ESWhU?=
 =?utf-8?B?d09yREYrTXJjMUlGS0RrNFZtakNDVUFiRTdyV0F6eGVReWwvdjdrVXFtTXpK?=
 =?utf-8?B?UkU4bjR0R2RjYzZNNFlxcWs0TFAxNGVXdE9maWtOL2NUbUZ2QlFIczdkVzNS?=
 =?utf-8?B?N2JWNHBhSlZ4L1Q1QmN5cm9tWFdhbmM5N1BCeVJkblVjV25FeUlSQytPdDgz?=
 =?utf-8?B?VFp1QWEzamllZzZFOFp3ZUdwclFnQTU4ZlZkczk4eHJiVlpKdWRQckNQbTVk?=
 =?utf-8?B?U2lQNFVYMzM0YTZsYjA1MkxkclpJK05VaG0xbWsvNitId0tzdERRTGZ0bUpx?=
 =?utf-8?B?Szhia2dQYU1CeXNBOUZ3Z3hIVzJ0dWtodGdpS1RDMENkRzhHcWtDUW9hdVVm?=
 =?utf-8?B?WXF3S0I2RUZlYmQ1b2xJd2hqelQ5bFlyWUl3T1VGa0sxR0dXZVVoL3Z1UUZL?=
 =?utf-8?B?aCtJalFZZllsQVZ3WlRRZGl4SUZOM0Z3WDhYMTJKbHI0c3Q0cElndWVRbjZ0?=
 =?utf-8?Q?LhnfZ/pXeo2wSLBwS6Vm48l2g?=
Content-ID: <EC09419AD74B59498A39CA46AA0EB520@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c06c8e8-cc6d-4adb-c8c0-08da7edbf302
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2022 16:33:56.5705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njhkmjv2UdEKAKOzDXh9ZCPBycipKlKty09IrYlnAN0CuECoEvYcn6wtIBp7iT4C7biCZT2NK5VbiwRQcoF5ZiDhZ15/gXPiMFB29dA2zns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_093408_590995_98A166A8 
X-CRM114-Status: GOOD (  17.79  )
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

On 15/08/2022 17:28, Atul Khare wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Conor,
> 
> Thanks -- really appreciate the help. Dell had to come out twice to
> fix my laptop, and it's finally done (hopefully), but moving back and
> forth between  the different distros has been really disruptive.

Ye, no worries. Not sure if you saw or Palmer told you - but I
resubmitted the GPIO patch & a revised version of the interrupts,
so that all made it into v6.0-rc1 :) FWIW they are:
5cef38dd03f3 dt-bindings: gpio: sifive: add gpio-line-names
b60cf8e59e61 dt-bindings: riscv: fix SiFive l2-cache's cache-sets

I assume it ended up in your inbox but you weren't actually set
up to reply properly.

Thanks,
Conor.

> 
> 
> On Tue, Jul 26, 2022 at 9:42 AM <Conor.Dooley@microchip.com> wrote:
>>
>> On 01/07/2022 21:00, Conor Dooley wrote:
>>> On 01/07/2022 20:49, Atul Khare wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Conor,
>>>>
>>>> Apologies for the delay, but my laptop died a couple of weeks ago, and
>>>> I have been scrambling to get things up and running on the
>>>> replacement. I will try and get back to it ASAP.
>>>
>>> Nothing you can do about your laptop dying :)
>>>
>>>
>>
>> Hey Atul,
>> Been another couple weeks so I am going to send a v3 of these
>> patches (although without any changes to the v2) and we can
>> resume discussion about the cache binding change there.
>> Thanks,
>> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
