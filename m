Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77CEC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4LgoZFvE919w0r6KiuqfWnqbss0aisgoMVprFUg8ZY=; b=aFnww0EPzhCcGn
	H9vbSi3YoKjqhpc+IP+9V6PxUnWeEI7Bve1dq5pkllSTU18t0eAujBhikTrwks+hDKHC0sxEqm5v7
	oE56s21YLA9zdMWRNZutNrboHDzd6KBYaz/YEZ7iPq7g1tzhlG68w3xQKJseXosQ8wjhUN7SEeO+n
	wZ9LlH5ddOAHABWQekxCMFzOuBwfiFpcpPcE5ufRkk2Ifb7B2/Vc0wqjkUuh5DgbmGQyMTOrHKwf0
	98l81gvP4LluXmOyq4CtUunMKgrVFCNCOedHPOa9wggV6Vf09+lh/ZkexRRmAh1hjODTfeb5+SJep
	sEA2jyArX4LO8ARLv/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9uSA-005lXV-Jg; Fri, 08 Jul 2022 20:19:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9uS6-005lVw-CB
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 20:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657311590; x=1688847590;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=236UK5xt7BF2KYiQxITsEUBu/dK7ay59XfQlU85k5HY=;
  b=iY7VJFVZHiMCmCAVsU5vX6A9cN3arSDmipc0vAg/uNLRUUlP0NtCe27a
   IeIgyx7srT3T7wGsvga0XEJNw179iRjalv6A8/SLkoTB5BT9BzUdm0Vsu
   CoQqix0u0eWDQndbnJMNVS6YNx/g11fuo9ub+g1ULtNOCtBYu03UTCPc+
   Z9DBylnaezTJSSu7tyoBtlzy6jEp/3Rxes1/eF1M8nUD3I8Io+iQIqPiA
   R7nQ+T7N+tc2JStYM3XvUt3ZQYEy5jl5J0HWBK4cTYI98+iPtykhsFcuf
   cFlJlldjlfLxkqDEYkl1IyqVomB2Le6E64V6tz9j7YVw4zAdH3t45cUyn
   g==;
X-IronPort-AV: E=Sophos;i="5.92,256,1650956400"; 
   d="scan'208";a="167066601"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Jul 2022 13:19:41 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Jul 2022 13:19:41 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Fri, 8 Jul 2022 13:19:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv+mgk2c3S91TGX2R9bsYmDJ58wBxyB4TMbkrAv/5JQt+mmWd/onLhzUEKKIOzMMeP/xPh1mPaAa7y8duRbplrbOnPuxDq2RTPWBflnmCSXM2JmbJ6h2X86iHjnwUkoZ2u+jq0kfIkIqIzNAW3vbITutJ51T/BC+6BmmZe8BrvO+jh8PLT+rL8GxqlU9WIGi9f1YAFCalJgT0RnGzHRhXcM6ZvUSK8EukkW8K6GHl9SHlJBefw5ILGy9m0tlwktTIwEZkAPXrZIhzMW/hpZnCkfzSvJKyBC5wbPKDLsyXkOW1/HGf0Fn1WLrlpLlmXdyiMf4JUM7QUfGZQfK0ePuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=236UK5xt7BF2KYiQxITsEUBu/dK7ay59XfQlU85k5HY=;
 b=eoxowYpv7oEgziT+NszO/V8E1csjlm1aj7sYH/uuo/Pga19zq0hLZrWB58vczk61wJeEnNPY3sOdI920KCL582vSE56BI3pEIEc4BkOC5T02BQXa9pHel1m9VrBWcnAV2uYcWjuDgH0aocVnv0cQgqcIMMhxyT3/Vz9VEUkYbx8qYi2LEqvTt9VIkAJeSuHp+lBYJGj9ORMCCNLdJfH1XJ7oV/0pmk/ic1VncLp4J5EMUiP14o3553AE6ynqe30u0cp8c81E3SngSQHYzzZkgnegfT84ivdCTIXMw4i6WfwTLPoXB1qkj2Tr2RCGu+2TYTjDLGqY+ogqMRgrncJV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=236UK5xt7BF2KYiQxITsEUBu/dK7ay59XfQlU85k5HY=;
 b=HkZxA2djjBlurH+hRNO3qsXZT761YrWsx1y2xVfreuL0hshUcMS4rwL4XMMUG4a/Ud7S4Nol/uLYZVmMsSgYVTdoxct9aeAEbUAS3PxviVS4VPVHA0uaFVCFPXLzSEkGsXwUoXBC/CPAOIXC+DCOwBuN/6j6soeOqubV4RUCMpg=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2597.namprd11.prod.outlook.com (2603:10b6:a02:c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 20:19:35 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 20:19:34 +0000
From: <Conor.Dooley@microchip.com>
To: <zephray@outlook.com>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] riscv: always honor the CONFIG_CMDLINE_FORCE when parsing
 dtb
Thread-Topic: [PATCH] riscv: always honor the CONFIG_CMDLINE_FORCE when
 parsing dtb
Thread-Index: AQHYkwb6Xt0fxugHH0q3a6opYrWrl6106gUA
Date: Fri, 8 Jul 2022 20:19:34 +0000
Message-ID: <737467de-c8a9-75e0-3f78-a6ab0860a6e8@microchip.com>
References: <PSBPR04MB3991F5AF4EEA354A658A3BAAB1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
In-Reply-To: <PSBPR04MB3991F5AF4EEA354A658A3BAAB1829@PSBPR04MB3991.apcprd04.prod.outlook.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1880e6c-2fab-4f98-4220-08da611f2cb5
x-ms-traffictypediagnostic: BYAPR11MB2597:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SPht6IaqZvoq2V21DI0C47WjaBZKz6ODUCSy0UWR1Zb4lQoMIycgU3DoLw0+HLladAqHZm79xh0otG5YNMtfwU1e2MF8oCDMM/b+ij5BIKpJq92HmFxN7wchQdwi4S7cjgfPdiACq/OE6ONTOFQhBE5JCxQOMOm5gQCzrFSMkR30aiI0ZHxlWjdNDPS8bU65+4oilTUmpIOooSdjvMvAkhRVbwcMNnBbhS+K6YyuRANBZdlG2E/tLotcDaUMu/AUr5GxtmmtxA/ll27+CN41X7BnxOAKINnDynQ4mnOSTzF91WOxb2vr1lK/JmiCflfzRejzrIdyCHxrvvKrUYKa84DpTQrXnINlks/u40qBU87ZHHNo5Uiure8U0nUm3SjwPHoY1nYXeQ1rjTi7jCkItu0jRtJ8CyaXyfpq9I4J6MLqE396JrVdioqnZjavrU0Edl6NT00Yiz+63vVto83J+Thretp5ytJ2nbLnEbQlqAD7XjIZj1wjIYEirVLoAtK01uKdGyTEN6GyChGW+CabcmalGpfFkjw9oRrhe8WFTTL+YKIB3wappw3Hz9Ik8IKwZi75J9pHmBeJICHzcO4ZVPZ5pWnsmcmVQlx8Lls6/UAzKyFRO46MvGK/iQPvvn04gHTD+nHIg4T6tHX1TEFCRmnh3jQQQctEYTHdcgOOCcziVvHspEys1k7cH2aVADCZuqnZKOLhIBtCoMKaBAhYzSRkUjMEsLipVxPcVvjPrTgYNXFJUGPujD2niizzOr5ikdQO5gHesxnVQGvAuj+rhkgd2Y9/QFr8tnQ8kjD2SC8uF1qgoSwxbW95PHKvBo6odvnchM03yZgS30c0fZTchDWiJDZPtmnNP0yJIiYCPycPg+S2XDXKP+djb+ifYgeF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(376002)(39860400002)(366004)(91956017)(122000001)(31686004)(66476007)(66556008)(316002)(66946007)(76116006)(64756008)(66446008)(83380400001)(110136005)(6512007)(478600001)(26005)(8936002)(71200400001)(5660300002)(8676002)(6486002)(36756003)(86362001)(53546011)(6506007)(41300700001)(38070700005)(186003)(2616005)(2906002)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFpzTHR6SGFJdVZBSDZ2cWNUNktuNzQ5YmEwY1dweGJEWTFBaWU1OStEamJM?=
 =?utf-8?B?cm94aFoxb1ZFVDlaZkIyVE9JWDNFVlgyOEx2amg3c05TSzVlTnFDU1F0dzNV?=
 =?utf-8?B?ek1RTzdvMGFJUXB1S2ZrUzFVUThmdUg5ZEZtdk9ycWkvaWRrRVF5RzhycllX?=
 =?utf-8?B?WkcxYitrQWtDK2pxOVhRNUpoN2dON1E0RWxqaGQ0UHZidUZkWnYyOExuVXBJ?=
 =?utf-8?B?eFlVN3dwSHQzWERpNnFRME1PUHVRY2d1Szg4M3Q3cTZZbGRacWg1ZStTRFBx?=
 =?utf-8?B?UHl1dDJrRHY5S1NUSUJVOEVUQXExNlBpTitHczUyUWlraU5rUy9oSUJDOW9T?=
 =?utf-8?B?MlJGM2IxUDRLQWFFU0g3aTBSallrWWVteCtBQkJsTGZSWGhYV0pYeDZXSWVo?=
 =?utf-8?B?NU5XUzljZm1heC9zalFoUytCajJBSVNUbzR5S3c2SHdrQXdFSzB1NEo0Zys0?=
 =?utf-8?B?T3lpandXQkpWUGhXRnFXbzVDUzJ3REpxL01JbzBYSXhJbSt1MDVRbXpsRi9I?=
 =?utf-8?B?NzVWZVNYVmpLamZmeUEyQkRrc0daRnhNdTdIMnFOL1FLSG1ZZE11U1g1dzVX?=
 =?utf-8?B?Wi9WMC9HdFd0cEU5Y1diMk83QnFXemQxTjdSQzd0Qkpnd3cxOUtOTXpYZnB1?=
 =?utf-8?B?Rm9PbGUyZWluVnN0Y0k4NDBFVms1VnJEaHdmK1plcmx2OFBUSnI4K1U5VVQ4?=
 =?utf-8?B?bWJzVEVUR3c3WjZHY3JZcW5YSi81b1B3aDIxUjVyR3FJUk5IQUVaRmZncm14?=
 =?utf-8?B?RmU2VE1xRjdGeCtubklET211bEZ1cklkMTdJS1EzU3AzZ3d6ZU9ZRkE0d0Zu?=
 =?utf-8?B?bHBVWUtGR1pzc3U5TUZwczQ0cXNUZFVOdXFQS29Sb1UxQWk5dzZQY0huMEJY?=
 =?utf-8?B?Qkkra1hWRDg5YkttOER0Q1Z3VmdNOWVwS00rK0x0QWg3d3JUcjRkR0ticmJo?=
 =?utf-8?B?L3ZxME4wNHFjaG5JUDdYWVFHcTcyMytwS056VndiWWd0clFSYTRzYStTZTUv?=
 =?utf-8?B?TVdvU1AzZldpY3hQQ0t2ODNBWVI5UUtVS0JJQ2g3OWNGZ2Y2cTJHdE55T29U?=
 =?utf-8?B?Zkh4K3BqRjkrQmJzZ1lwcElWeXZ2dmZQRU1BbUt6UDJDYnB2OHA0OXNwSnND?=
 =?utf-8?B?Nm1NY25DYkxpaStxTittMG1pRDJCd2xtRnAyMkNKUDRmTHdBV2R5cEhjUlZV?=
 =?utf-8?B?TXJZd01aZUlWYWJzc2JkSE9sbFk1UlNycHFSUzc1emw4dElleHJJVVVXdnUr?=
 =?utf-8?B?R09SQmRGRHFBZGdnZkp6dWFDM1dUc0dVNDBGd2VaVVdGMk12SmZoTHQ2ZFFt?=
 =?utf-8?B?Qi8xRVkvWkFOUFNsTnNwcmN6azhIeTN0eGdqbm5oTjNLNFdhZy93VUVoRFZC?=
 =?utf-8?B?SS9OVkVVMlNSUWRldXRYYVRMOGl6OFhjNWsvcCtMR0x2Y21nMVhFQk8zUGRq?=
 =?utf-8?B?eDVkMWRPaTlZRkx0YThCcWJpSzRKMEU3cS85dDVmQnRFZzc0QWlPbmhabGpt?=
 =?utf-8?B?REt1bVR5RE5TUlp2MlZadXdVV0pFd0ltT011RXpWeWs1VHlqaUoweVhTdVBX?=
 =?utf-8?B?eEJocUFVczU0ZE1ieE5wa05kWjRWOVRFeFp2RDNiOFB1U1RGZHU5eklYTXlT?=
 =?utf-8?B?SjZzYXE0RWtTTitBK1pxeFJxdlBsbWpxQXZVN1IwR2loRmY1UENFanltV0JG?=
 =?utf-8?B?YVlBSXMxWEhRYVB5KzZua0ZjOU9QUFRzZTJ2ek5EVEFSQ0FRU1lwaGFXT0c4?=
 =?utf-8?B?Vmx4TDJycXplZkhxMFlHRVMwMWJRMFJWVTVKUG9ZMUVPUXVhUnhYSmZYYktB?=
 =?utf-8?B?K3VyRDRtb1VXVVE0VXo0eUdTd2NhZGpnQTRrQTJGaXNIRDkyNkJnaXZnY2Qw?=
 =?utf-8?B?ell3MVVxUmg1NmFYT2dZeDZheDdtVWZiZXNLblk2aTY4TTcwNFl1L1htbDZ0?=
 =?utf-8?B?bDlOUnZDR0p0bEV1Y1EzREIyTEkwUk5NTDBWMStmc1c5enp5bjVLM29xUFdP?=
 =?utf-8?B?QVRRNE5lMkhEaUYrNW9KT2FZVjlaZkhFNEc2NUkvb0xxUnUzU2c0TzViNjdp?=
 =?utf-8?B?dVdvMi95TDU2T3Q2cW9vNDZrbEhrUSthU3hmLzYwcUw4OE9admlIbDBIZmFv?=
 =?utf-8?B?NkJDQ2wxVXdYWWZMWkk0Y2JwOGFVdkEvZS9EN2ppdnNRdGpTdjNLK2luNWpD?=
 =?utf-8?B?Wmc9PQ==?=
Content-ID: <DC4FC5FB1EFF57448843FAAF9DA7DD5C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1880e6c-2fab-4f98-4220-08da611f2cb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 20:19:34.7677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cYD9wYCr4yqy6Q8mdw4vt7ycrlcoVC6VGbMHEhTZSV6JFWad+vaE2ZnkVps0+YGHvB9aMxEgeVlBRmoME2v5TdgQConeSGtp6nSmtlVocII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2597
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_131950_685373_D22CE6FC 
X-CRM114-Status: GOOD (  22.38  )
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

Hey Wenting,
I see you've just CC'ed the list but not the maintainers.
If you run get_maintainers in the scripts directory, you'll get
a list spat out of the right people to CC.

On 08/07/2022 21:09, Wenting Zhang wrote:
> When CONFIG_CMDLINE_FORCE is enabled, cmdline provided by
> CONFIG_CMDLINE are always used. This allows CONFIG_CMDLINE to be
> used regardless of the result of device tree scanning.
> 
> This especially fixes the case where a device tree without the

You mention a fix. Do you know what commit this fixes?

> chosen node is supplied to the kernel. In such cases,
> early_init_dt_scan would return true. But inside
> early_init_dt_scan_chosen, the cmdline won't be updated as there
> is no chosen node in the device tree. As a result, CONFIG_CMDLINE
> is not copied into boot_command_line even if CONFIG_CMDLINE_FORCE
> is enabled. This commit allows properly update boot_command_line
> in this situation.
> 
> Signed-off-by: Wenting Zhang <zephray@outlook.com>
> ---
>  arch/riscv/kernel/setup.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f0f36a4a0e9b..6e8aaa1ff7c7 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -251,10 +251,9 @@ static void __init parse_dtb(void)
>  			pr_info("Machine model: %s\n", name);
>  			dump_stack_set_arch_desc("%s (DT)", name);
>  		}
> -		return;
> -	}
> +	} else
> +		pr_err("No DTB passed to the kernel\n");

Running one of the other scripts (checkpatch.pl with the --strict
option) will complain about this:
CHECK: Unbalanced braces around else statement
#41: FILE: arch/riscv/kernel/setup.c:254:
+	} else

Thanks,
Conor.

>  
> -	pr_err("No DTB passed to the kernel\n");
>  #ifdef CONFIG_CMDLINE_FORCE
>  	strscpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>  	pr_info("Forcing kernel command line to: %s\n", boot_command_line);
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
