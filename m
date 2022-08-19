Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAEFC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w+P8nyx2lwH4sutBZgMkchrFRxuOJJ/ohK/0BrRWrpY=; b=r3a7aXvzCcQL2V
	TdblRlypYwd+fMkhrlMVl252l12OiTH5JTh9v2icKCGtrV40CoPNdIt4QGGpnRqjqhrWpD2hqJE4G
	5PbPXbpLifgmjTFYHiSsNZP/vLn80WXq9bS+tN3p1Kv81E+tAuUoi8iCMfmiUacxihIhudRpPmEug
	ep79FoI+oKKhA0XsvkAyZzkRcaBZ0wViwn7qRE7KSy3GlAfnCYpyrVGQC9UAt5qh9orlojfT8LYRw
	NglYxqHp948fKzdL5GMssisfS5vbctzZVqPldPoTKZZ1NMwYBg/Z7UQKa+PkFMeRml8yhkvureQMw
	DYNLrcYzrpDM08VytEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2N6-009AsN-6Y; Fri, 19 Aug 2022 13:49:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2N2-009Apx-74
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 13:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660916949; x=1692452949;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eX13IveaO1cJXXg16frAzo7IM82DUsZHJHoDUjrSnls=;
  b=kIYZrs/WEvy6xOv7/IVQZxdQkMDPPF5DFbS1htdO0jmCZV0vV5QixGX2
   f2tDTXfAjGMO15nYE/87EVFtcT6yw5x8wAanBeqOkexbVGNIy6YNbMGS9
   3FafL73/0Rx0CpmUXTz04OroJc0KZ7/UG3PfBHE+xuL765uX/e8AEauCn
   nM1MFjO9YRGDOJObr5j/58vJu34pAqKHRNHgs0i8MBz07/GEDn/HXxF7r
   UuC9o8kLddOQImTnlkmKqFxsozQLBxkM6Qs1jqan5ml2pKC4PCkAXttoS
   D72tq3wZg4ihv1X+tmfzhy+Wx59lU090n/4XaoGKfIFPX+fFVL0DHnbEU
   A==;
X-IronPort-AV: E=Sophos;i="5.93,248,1654585200"; 
   d="scan'208";a="170041312"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 06:48:58 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 06:48:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 19 Aug 2022 06:48:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d2heJbS+fc14eNZ48pfNLhMHHtVyOB6j9+E6EHInBBHS5LhoPv8g5Ql4CRJpSWxpDs/3BMUKHfqeDyDfbtN2RnonbefcC6CJng9sFEZSmM6iC3D0AqpoKDTOShu1Syw3iYPfaM3qzSToaZzLg3Wo/HJvnT4xqL46xzSw/gIMvKeERPpI9GOijmkPKK88LgyuH9cEPpGnWlnHPKi026ovhftyxDTUOCNAl0Jbe0iUyeIbmcJDql8mRh3mZ8yQ8o6+DDncfTZYrcNlFajeGI68oDrjhF6WJE/OJDF/5shzbcVLbG+5IdXPG5zuFV71RtnkruQbOfksGWlKrQLhUaCdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eX13IveaO1cJXXg16frAzo7IM82DUsZHJHoDUjrSnls=;
 b=jz9f1ApclYnPMqrZSHR1S0X7PZEj6Lx78KamA14yHLbtInmpp/0KA4fmLGz53pSbQrGq+FHUL7MN1YAA3lT3Yw7rfOXB+4KOCgzqsouKHrgXsV2bBfZKvBF6LSIokeQFYd0jFCH6l5YwShsHajcGhV11/slSXugZphK+8Ef5rh0652uKseGwSrjsANAfQnArAWISdWpM8eBsaFdJE9F5RKYoK5Bju6y2Tn8YQpS1fgkng90khm+nKMCGVpC5qGQi7j4I++zAAJaGzDHpKqbAk4x6uXwXOpYR+9dWpr6OpDt+17PZMD7U/0D+YYaYP2uVVB0vjCcztd7CTv17fEYI0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eX13IveaO1cJXXg16frAzo7IM82DUsZHJHoDUjrSnls=;
 b=gQHv4mHUT7tKvi7AJ1DchfA/sKggabJi9pu4rkcd8tZTlZT33BPVF1DMfRx0boDiWud+VRuEcAV0m6Pf9ygPh5Z/L1JYzu8o1idc8zXeYEYYkv7Pqc0YoxXPDV3vRNfEUEBBX8+ClarrZ/VGTfV1luwGqINfHm7IMwFFr+qdkzI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1593.namprd11.prod.outlook.com (2603:10b6:4:6::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Fri, 19 Aug 2022 13:48:48 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.018; Fri, 19 Aug 2022
 13:48:47 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Thread-Topic: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Thread-Index: AQHYs8dCZDCkQVxYIEq9YtBMJX9yKK22LDYAgAAHm4CAAAPOAIAABY6A
Date: Fri, 19 Aug 2022 13:48:47 +0000
Message-ID: <19ca2ca1-c678-c669-4214-e92416e37191@microchip.com>
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
 <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
 <3ffba600-bda9-8ffa-a435-9a6f94e072b8@microchip.com>
 <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
In-Reply-To: <f3d8be5c-737b-8c71-9926-a4036c797769@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 02a50869-38bd-40f1-9f1b-08da81e98a90
x-ms-traffictypediagnostic: DM5PR11MB1593:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B0iWaZHM1fUJH8Wijb0shh5O6hbLh6U6G4bcFVKxQsNLgG7LmNZWVqey9A10YnHMpGW/sxq/fr9qoSJT4GT9FT3CN7FVO6YXDPo44cxt4Y/cmH0r5DGyOt+SiYZ9type2AlAHKfasu0UDV2WtsOACT3Edf1FzB3TmvNVpKogEkxyu+Pwu1KR5hEel7YPfpr4d4q7qkRK3+sSzNLgUe7GHks2obhYEO74K/qpZ0/aEwuFt6IBX+eZBuguV1K0cGEpfUoWzIpU9/MDRBusfgQP3evddhEaH7cugSE6lSZ05lxYf9PBAxeD/dK2YQ7rzZtQFu1pfPwasp6eTJFi5N11dGjiilGkHRZnD0YGgSP/Nfx9YddEgbfYVZ0kHSw2isnn4OiG2b/rzcbBknUoRr75mdX77kQ2a5/xvAj3ANO5RL5sgK8YOLsE3RvfSYEvrLMqlVgdmpiWa//c8vcyFU1Ak/qClYf7xer9PGdNN2M1CUVRZZ6r97mtoyuJzTzGHFGTFDgEZXJfY/D/4RYX5ueAJxU6bthdWCqdXp3BkCTBhj/hcdAtBtVyv5f5j2JskcqUQHpPzfzqRGqoZRmO/7Y4uBQY0wIJ5RaKaE+ci1rXRQ2lOEhVlz3TXVBtsMDGPpEujXEZZcYKbe0OiDVHQ5JHtWkOHWLPy/OwPhsSAmiEeZvPjZjnjr3vbIbuKcQmhJozyW3xPCS0Mvf3RhCfGLvDo+eiHp9XXlaVHpEHvukoXgPvnfnz8V6qPif7C85RRPirJYn6Eco/i0uXAsswzN5f1rELb3roMJyL+nEQt5I3M0JQ4AnIK0gVSg9FYQzgBHcfWYUvQxs99FDhbvR0Y0PHiw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(346002)(136003)(39860400002)(8676002)(6506007)(7416002)(66946007)(36756003)(31686004)(83380400001)(38070700005)(53546011)(6636002)(110136005)(54906003)(26005)(478600001)(6512007)(41300700001)(186003)(316002)(2616005)(64756008)(6486002)(122000001)(2906002)(86362001)(31696002)(38100700002)(76116006)(4326008)(66556008)(66476007)(91956017)(5660300002)(66446008)(71200400001)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enQ1R3N4czZ4MTRQRXJ5ZFRyMENpL2ptbThZMlNjdDlxb28xc1h5NERjTTFR?=
 =?utf-8?B?aWJ3YThtTFV3aW92a2xuZVk1VkZtR3E3OEtLZG95OEJSdzFHWGVkdEpKcEI4?=
 =?utf-8?B?N1dZUzJUbVBZYU5ZNGMvZ1c5TnBHSnoxYmRxbnFieTRCYzJ0U3B4TGlqdWNR?=
 =?utf-8?B?c2hIN1A4N1pSSDY4eVNRR0Z3MGdGekNaL1dIbDFwd2tOMUVPY2Zka2ExUTEz?=
 =?utf-8?B?WVRDZllSY2hXc0JDYmc0RXhvaWg0cHZrOFk4WUlrWXlmci9heTBKUmE2Njlm?=
 =?utf-8?B?Z25yU2JsWkkzMzRIR2VzMHIzdHdicm9zclNzNGZqcDBJZ0w5emRCZklDMkI3?=
 =?utf-8?B?L2RhY1ZqbTJjblNmeHdZK2UwYWxHc2xlbFNpbVc3WUNVQmlKYUdCbUNCRmhh?=
 =?utf-8?B?OHBmVWQ3WE5Pa1RDTlQrVzQ5R2pwaVFsd0ZUYVBPMFpKK1dER0kzaVM4M3Ry?=
 =?utf-8?B?YzdtQ0x5VENMSHROOWxmZ2ZJSkJST3VSNitKMzNVZXhOeXltWmlYS2FmbC80?=
 =?utf-8?B?V0gxNFNaS0hNekt3RW5leEVmMDNKV0JJR3d2aGJEME9tamVnQnp3V2dpdzZL?=
 =?utf-8?B?c2Vlc2Zpems1Y3BKMlF4dTZ3ZFgraWUxWUNwektJT1J1VkVRWi8zazZKUzh1?=
 =?utf-8?B?b1I0T1libTBGanN2NEM5NUl6eFhjSjUxZnlsUENHQUtrZlFLc3B5cDZhYUdP?=
 =?utf-8?B?UWpKNHdCMlNBQTlVUDAxS3MydTV1WlFQMzdYRXRKa1c4NlZoRmVrVy9Hcm9k?=
 =?utf-8?B?WGZUNW03WnFuMWpWaHl5cGZnRHlubDJaVDQ5ODRINnlTaHZ5Yy9VY2docXY5?=
 =?utf-8?B?L0xETGR6MXFaMlRLUXhvV2xLTUFPU2drTVRsT08zOHF5bVZMNzNOemhScytv?=
 =?utf-8?B?V2EzQktnSTdrMVBkTDl3VnhyanNYOGpCRjloelYxdWJGc2xGKzNkMXF2c1Uy?=
 =?utf-8?B?eTYweEZHLzBDRzQxekh3SmVlNGJ3cjl1eU0vbmora3VCZmwxNEx0YTM1SXlo?=
 =?utf-8?B?SjI1enl0TmVsWDVuL3l5dTdHaXZFcThiV2hBTThQOGdpKzYvSWJPWGxCalhl?=
 =?utf-8?B?WjFMMzlxSGpMaVpJVjVYU1dFYnFyeUpzb3Q4eDNjMC9BaHFwMGUrUGt6enQ3?=
 =?utf-8?B?QzVMTTZlVXdsQjd0ZnplMWdKeEcvVDh2MWE4MVVEL3NjMzhnMEEra0JLWjNs?=
 =?utf-8?B?YnFWanpTNUEyYUFDSVBxdTk0M2dLVHZxYk9yNzF5MndJcldibmlzT2tZUUZj?=
 =?utf-8?B?SlAySnVVSVVncGRSWEI5djZjdHNHdXczMCtwK2kwYUFoTFhBeGV3MS9IdTI4?=
 =?utf-8?B?SHFYVjhEYlZMVHBqYkNsUksxMWM1MU82dTlmc09WVDk1Tkx1UE5YazJWVVh2?=
 =?utf-8?B?czBxZ2tmNWJVU2pMeGcveWJYR3JNZ1FNOUhSOU9EbUpqU2N3djhnbEdzRzFs?=
 =?utf-8?B?R1BJWElWQmpDZVMzVWpIVXNvY2dJenRxbzhwSFhDVENOSDk5NFVrTmlJZ1VH?=
 =?utf-8?B?ekJjLzlUNHVObkRpOVdUd3dhVE1HamVsamhUMHdHTkhPTFpyck1RcWx0NWxt?=
 =?utf-8?B?NWhWQTg1bHhwZDA0eWRxOElic3hpUlNNWmRkVFBtZmd1NlNqL0t0Zllkc01m?=
 =?utf-8?B?OHpnTkFvRTlPeGZTWHBGQU41a2xabHFnUGpuRWtiOFkxRUZIek40SnBXdzBi?=
 =?utf-8?B?NVl0UkJMdUYzV0hxNlIrZDRrcnM1UkpmTk5yZlFZU1JCTEwrYTBaRDlDL01K?=
 =?utf-8?B?b0lMZGFUK3ZWYWtmeW1aK0NOeFp5TDlkWHRiUlVSWHl5bDhRY0JndXBpOFgw?=
 =?utf-8?B?VCtYT3BzZy8wZXVnRFBGbDZPWkJwQ0JJNWlLS2hVVHFCM25FYzc2Z3A5OEdZ?=
 =?utf-8?B?NjBrSGJ2ZmtFWmNZenAyNlEyMnNUdjFTMUN3OCszTXl3NWtjRUkxUE1LS0xD?=
 =?utf-8?B?RDRXa2ZDMG5La0YveCtjZmFlc05kNG52UmwxL3pjbk05TjNPcTlxRVg1SnpB?=
 =?utf-8?B?QWVSVWVsaWl6d29TVXorRFBqK2V6VHBtUkoyTWdlZEtPNDIxZEFkOHMzWERZ?=
 =?utf-8?B?NUEwVzU5cVJmSytDVSt0aUk1M2dvZmxHYXBuRk81T2czdFFsZUxEcmhycHo4?=
 =?utf-8?Q?rNdxHXrtgVuU1cWOk/Mw8ulx6?=
Content-ID: <B2A9684803885345AEA81C6C7292E86E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a50869-38bd-40f1-9f1b-08da81e98a90
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2022 13:48:47.8287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gybpEwJ5w0a8tFtFW22kRKjbGrInDaQv4kIg1sq76tssgX74SoQvpjS8OWT97odWch/OHImZOxdQPyYiQ072G58ApX8WZ+s1KaeowwCnF1M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1593
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_064908_369916_4FDD08AB 
X-CRM114-Status: GOOD (  15.36  )
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

On 19/08/2022 14:28, Krzysztof Kozlowski wrote:
>> Maybe that is me exploiting the "should", but I was not sure how to
>> include the location in the devicetree.
> 
> Neither node names nor clock names are considered an ABI, but some
> pieces like to rely on them. Now you created such dependency so imagine
> someone prepares a DTSI/DTS with "clock-controller" names for all four
> blocks. How you driver would behave?

-EEXIST, registration fails in the core.

> The DTS would be perfectly valid but driver would not accept it
> (conflicting names) or behave incorrect.
> 
> I think what you need is the clock-output-names property. The core
> schema dtschema/schemas/clock/clock.yaml recommends unified
> interpretation of it - list of names for all the clocks - but accepts
> other uses, e.g. as a prefix.

So could I do `clock-output-names = "ccc_nw";`. That would work for me,
with one question:
How would I enforce the unique-ness of this property, since it would be
a per CCC/clock-controller property? Maybe I missed something, but I
gave it a shot with two different CCC nodes having "ccc_nw" & dtbs_check
did not complain. Up to me to explain the restriction in the dt-bindings
description?

FWIW I would then have:
ccc_sw: clock-controller@38400000 {
	compatible = "microchip,mpfs-ccc";
	reg = <0x0 0x38400000 0x0 0x1000>, <0x0 0x38800000 0x0 0x1000>,
	      <0x0 0x39400000 0x0 0x1000>, <0x0 0x39800000 0x0 0x1000>;
	#clock-cells = <1>;
	clock-output-names = "ccc_sw";
	status = "disabled";
};

& in the binding:
   clock-output-names:
     pattern: ^ccc_[ns][ew]$

As always, thanks for your help. I did look at output names earlier in
the process, but didn't realise I could use it as a prefix.
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
