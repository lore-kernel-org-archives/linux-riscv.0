Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977EAC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lFR6PpJ9B9dxJg4N7AK5Sj/pVmg4guKzIOH4PiF+MG0=; b=XH2lBgts1cQ3g3
	8qGnowcsGjapydEg2Z4k0mg3oJlboSyFMcKklwwErvmLDaLUyvlPtgi4YU+Xv2fzQhsv5mWp84bNe
	JqvrQHOwZdlqvHmYaaJvLGInHvk49G+Y/wKiPSZxIEmy5GJdyV8xt3sI6JOhOO++U1G3I2F471wLE
	11ExFqsZVYmMLBwiOPyg5scSsdP2X2+RwLDm6ebVKE8CWsC3VZbk5rB9jitRghoEjjV1iY8ICDIm/
	s9JoOEm9WHkQZ1dAigXoIfCA+f4+jxsbIDzoqAURledBe5z8N/hfHcjdtjquV8k+Bu3VjpWMdMp4l
	vSa4JQsFyFj59IBZj1Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OVG-00FXAP-Ej; Thu, 07 Jul 2022 10:12:58 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9OVC-00FX9X-Fr
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 10:12:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657188775; x=1688724775;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=48n/DpD/NaEh2exo/2g8b8dypKb7CiloEadbUUZxK6w=;
  b=diVrka/17+fO44d3O5f3fjBSctrC5Fnhr8yJJl6P8/NP6lqQXsrhR3bN
   MQU9Nk4iQbn93fyZHBqTV9/KW7PXzriu5tF4vLAGft6pMJJ3X9YTQkY+i
   AWAH1Nvj0I++8ZNZ8rIdGGEWAPfxj+1AWi0RswgEdmRvaHTPJ1qNAP5sz
   tnoPBv6mf++nd77yja2iMVqH05zhss7Zzyx0BdsAYKquDd2JmQwI9eC9u
   0ciuKFoAqLVNHpek+ZYSB9vjRbSOaguP87210bSsga7nn3gY9RT5R55Kc
   Vt6Ocl6WXerGLvp3GRvwdweQY3xFFGVmBI3vzHsV5FINuyb2ls5chDCEV
   g==;
X-IronPort-AV: E=Sophos;i="5.92,252,1650956400"; 
   d="scan'208";a="163727568"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jul 2022 03:12:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Jul 2022 03:12:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 7 Jul 2022 03:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuEPFYTlqFybJgk23jRfWDlzIlyfPF7188AtklZkUWKL2YAZLz7q4mgQaViJdnMh56mH4lEpXMVboyHK3zffW/WcsM6ERwpMLbQDVHHPOERuvoxXOnSOcagx2h2KoGaOkK5Th2tg9ChHSzybQPUM7lQ7+FmIp4hWHefMWUaSingtNR9A27GKUy5K6UwrfPOWQOxOj2sUG/gskEXe8ErNOdnNZtTDF1dJI2kFvK2/lgfaepbSIfiTlmjArG0vMvEe2uNCw1uoP/geItxO5dy4flaSdlkoebyYJaaSNOEZAwTNwwfm1g3ROQ4ObWTM0kSNVwAhOfUCGIGsD2cIFDHggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48n/DpD/NaEh2exo/2g8b8dypKb7CiloEadbUUZxK6w=;
 b=oSRJuscKZrCWz+GJ9wWBLeGLZPE+eVJQRmZuayJITjXk4xrWY+iusiOZ/CLxm5ChexISVW0YDvsULZRPoP6YEzbyuEUOFz0SCToZM4bL9FxXJKmuk0llVrxtrkFVo06+W3Y8fTkdPRj0ytEdDNe3V12lGDK2VrLVy80cjEqn+Z8w0TQ7DeFPaNuJLGxHLmKKTTydADC0jxCrfqHnBn3gapWdS/IFqVIN84pGSS7jwIju/yaf3sh4/WaMlwEK+lQujgkpFMCUhmxx8/q9srF4Hzhw9l2WRcKkIletisuHqOpEe/cTWey+dC+kiyydDkBTncjFcxwxZvg4nlqSxz5BXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48n/DpD/NaEh2exo/2g8b8dypKb7CiloEadbUUZxK6w=;
 b=rW7rulKzicdLoSGkzVngbak/Tt07lSw5I8KWxN3opxzA4Xa/OysEPn8/ZekfUPL2CLfXK2kx0n8PcRe7zwidgjW05P3Ntst8S3IGIUygXQF7XQYf1GASo/180GYEd6yuZMFXtzMJhKwrWn3VcmlfR+6lSBPzzu0p6dfyhAvdnqU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BY5PR11MB4152.namprd11.prod.outlook.com (2603:10b6:a03:191::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 10:12:48 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 10:12:48 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>, <atishp@atishpatra.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<aou@eecs.berkeley.edu>, <Daire.McNamara@microchip.com>,
	<Conor.Dooley@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<zong.li@sifive.com>, <kernel@esmil.dk>, <hahnjo@hahnjo.de>,
	<guoren@kernel.org>, <anup@brainfault.org>, <changbin.du@intel.com>,
	<heiko@sntech.de>, <philipp.tomsich@vrull.eu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Brice.Goglin@inria.fr>
Subject: Re: [PATCH] riscv: arch-topology: fix default topology reporting
Thread-Topic: [PATCH] riscv: arch-topology: fix default topology reporting
Thread-Index: AQHYkWi/AAEA7OGPIkSptAwercRHiK1x3oOAgADL8ACAAAb3AA==
Date: Thu, 7 Jul 2022 10:12:48 +0000
Message-ID: <ff76019d-5f4f-4548-6605-34487d30c7cb@microchip.com>
References: <20220706184558.2557301-1-mail@conchuod.ie>
 <CAOnJCUL-RCkXi=1GSEipYmf1qMxkOASr_H65kGU+5c=AqJBZKA@mail.gmail.com>
 <20220707094756.rftfann3rcixdfp4@bogus>
In-Reply-To: <20220707094756.rftfann3rcixdfp4@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c2932318-5039-4bce-dfb4-08da60013e44
x-ms-traffictypediagnostic: BY5PR11MB4152:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JvO+VbafO04Ic9mqsPoENXeTS1yo+4W17eHcidYBpRTG4VHhp/7pmWnSHz/4Y1UbOcf0n5TqRVKRAK182wcejXM7a58hTl2KJ9P544Vof3jC718h3VoF1dcHWhTPvGR38TF/P79US3B0s2vjJItHgRRr50Pe25J+HiBSmInKigiqPtcr8t1sIxvDaAFRXR1k3zVxBWWIS2Kn2btZZD+dbp1+21nwN9RBEQAwCyZ/BMyvbUxVDfTJmVkHqcD1SUUIx0XH06YoIi4xvQ/9AtJocHGX06vbnYCPU0stNOHlXN0Xzj/RHm6798RebmCDWZpn+8C8S0BOAVxHKxgAKqp8nGAxUubPWRbpRP9DfC2WrYy5s7RWEeLcLxwWxBDF6HL33nHY2vYgElLqv6Oel/RdB7bCiMARPLZvwsvX22CHaScZJH3aMp1PtafOXfx6jxIMvl+Rd9VRa82FF5M+a+FfCInaoiGv59wPDzf9+Bj7JZOt/cukQJ24nUPmHHEgQ4z2prn+m7JjQIMg8HJcKezmQGaOWCZNmQbHvLq6UD/24/G09+3Krxv7KAdWYHQdpm24zIKREpxlk5COCdEJRenAxhceidJpNrT6UANBARtitwrJwc2xkAF+muVybCpCvBEDfHWNA8uW8GSVh8Nf+nxgMhEHBGDH6+JY2RJGGSbXuzO6bNUHOuLCXebzqdTAoP3CLHRGFTmxHZgLu66bSrdekzHIGtK77ePni0axi0+CCvhp52tvgBUgsSB3SwdicWXpAPxtacyU5b49aU3OtqEbYhPK4xArDdX77yK8u+XRdit9DNQMotqm9yUnxwpYdfTQnJVoN4kEQPgbL4rx138HlhHTTH3Eish6cJJxRMdUkiDjd61gT0mZpBPwfRfxwoKO0ox0DdGm1njNV5XXJBZ5zw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(136003)(39860400002)(376002)(396003)(66946007)(66556008)(4326008)(122000001)(66446008)(76116006)(2906002)(31696002)(86362001)(91956017)(8676002)(8936002)(36756003)(31686004)(38100700002)(66476007)(64756008)(53546011)(5660300002)(83380400001)(41300700001)(7416002)(6512007)(316002)(6506007)(2616005)(186003)(6486002)(38070700005)(110136005)(54906003)(71200400001)(966005)(478600001)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVEzMStSeVFzYVNlVnk1RmNmZ0ltUm9qcXZzeFVBS3liSmpON2E2SWxmRmFP?=
 =?utf-8?B?ejN5MFA0bi9TYVgzcFVwZWM3R2FYR1RZMmVDczZweS9manRvTnlEYUZEcDds?=
 =?utf-8?B?TjF4V05kOWJITHRDVXhIMXlid05OSHZLbjNrUmppaWxXZUFCS09aSjVRZS95?=
 =?utf-8?B?VmZjOHVxaXFyMmdoUDdCOUVUTzhza0lGdXhPNFNBTkFaRGpOa293L0orRFhF?=
 =?utf-8?B?RmZXeDFGanp2OFlzeW9rUEZGRjN2TDlvQ0duV21zWkJscFR1eWc5end6MWl1?=
 =?utf-8?B?SkNMKzRWbDhReE1pTzQ2cnJoeXFJc0g0TzU5TlNTWmlqc0kxaVd1ZjU1aG5t?=
 =?utf-8?B?dmRuRW1mQlBTbVlkWFJ3QUQ3MWlTQTdYMWtiMEtiK3JqdXh6SzlSdU9MNUJP?=
 =?utf-8?B?K2hWNGdTdjQ5QWZiWUlHZURhaGwzZTlwQllBa0RhNWZBa1ZZcEtCdmFiTGN0?=
 =?utf-8?B?Y2t1eCtjZWkrOENHT0t5SkUrVSs3azd1M2ovZUZUaDZaQkZXbWhJR0p5RGdX?=
 =?utf-8?B?dWVYd0tTME1qVldOSjQyS1ZJOS9aQ2Y0RHk0WXNBY1FCVkFqU3RIalcxbm5y?=
 =?utf-8?B?VHFqYWVXZklNV1pPM3lRSVlqTXNKNUVJaE9pZU93RCtUZ0FhRXZxV3dzR0Jw?=
 =?utf-8?B?SU9VdEo0VEdHeHRubEVrZVFGVzdGU3JjRktHaVd6NVIyekVwalduOWUzelJp?=
 =?utf-8?B?cjlXMDRXSnlISmZLMURwMkxGN1doendMZW96bXhNWSt5MndFK3Nnc0I1TytK?=
 =?utf-8?B?ZWV4cm5vdStUejVwdTJtUEpJT214SHRxYjNUbWJQcVNoWGdQalYxbmZpLzZM?=
 =?utf-8?B?LzJrYzVLY09rMG1FQkM2L0xuN0d2U2k4bEU2SlRTVlVEWjl5Q1V2SEN5M0pD?=
 =?utf-8?B?S2VVN3Y3SGgzUmxaWms4bFBvTDNxVlhKck0xK0RJNkdZMUFJeklMVzloakZM?=
 =?utf-8?B?dis0SVdBb3JNemRVanlZUUZMM2ZJVG1ZQ21MSVZjanJLUVdSR2hIdWVxYy96?=
 =?utf-8?B?TFZJTjVHeXNxTU12TUtHVVRyR3Jjc01jQ3pJOUFoU01USFdlYnNrQ2ZmWnJM?=
 =?utf-8?B?Z1VJMlVoTjQyOThKRjlwZzBMbWtLZkM4UEp4QUFVS283YUdYcGhmdlN4OHpj?=
 =?utf-8?B?eHRmblp5OWtSQk9xdjNvOXFlUzJiMmlXblFLOWFkbmUrYjQwRlVQemRkOWhw?=
 =?utf-8?B?NXdSejUrcm5uZFFWTnFiSmp6Z2FJSFVVZlVWcDV1OENyMVpGQXNQYVhManFD?=
 =?utf-8?B?QTUyN2VKOXlEdEhLSTQ1TTdaTGNRMWUzYm9QdVFESGU2NEEwL2x0TzJTdzBB?=
 =?utf-8?B?aVdkckVVRmhJaTU1VCs2S2Z6UStWeHpwaTFIeityenJiTnRNOE5lTk8zRjhz?=
 =?utf-8?B?MkVob0VzSWprM3FjL0lDSGxFWVNPQUJsNndVeENUT2ErS0w5L0d1RmRWYmNl?=
 =?utf-8?B?bnZkcG5NK3hzNmVDQnpYNW1HdFBFMU96Y2NERWxta3VlMGRsWHUzeHZnODl2?=
 =?utf-8?B?OVBTc3hnRGpZZFFmSVpvRWNWTmFLbVE2Tkx6aFlYOUpGMzJ5RUUyNXdSNUNO?=
 =?utf-8?B?QmIxRlZwbUMrQm5RNTlOMVN1SHlkSnlpZWI5VXJqeFFDZENRVHgxV2tqVnZ4?=
 =?utf-8?B?cVJORjFMQ3pORTVnTVYwTDFGSGVIMlNERnQ4NXc3ZG13ZGJlQlFBTEk0VUlT?=
 =?utf-8?B?akhLYkd5UVNYZXdQcjNHU0Q3blVCL0Z1RnhaUkdRRnJ5U3h6OUNhQ2FaY1Rm?=
 =?utf-8?B?OUExQlYxL1pSUTRENlJUNDBEZGE0T2FNbDFtZEtjQ1NWbXNRYjUreWtHWXlG?=
 =?utf-8?B?U1N5elN1SlU3eHVGbEU2NWhXaDljTFF0bUhJbi9NOXJxOWU5dHdOZkVYTzUw?=
 =?utf-8?B?UmtPRlhKWjlpTEsxRFJZQi9LU1Y4cHZ2eE54MldYWFVaY0RiRVM3aUI0ME03?=
 =?utf-8?B?WGEvbHRtd3NaRWc5RlZ6TndFaFkwNGJyTmRnUGtkZitFODFpbjhDUXhyMXUz?=
 =?utf-8?B?cHhRS2d6Q2xxMFNBYmt1NHg1c0dGZ01NaEpqajdIU2JEU1FTZzZIYmt2ZFlI?=
 =?utf-8?B?N3QrcS90d2hnZG5VRXZ5Mks4dnpSZVFKd3BFVnVTdUQ5b095ekx1UDdrUTFM?=
 =?utf-8?Q?9aCjJRc1hLMQN97UH1jX4d4IX?=
Content-ID: <E7584089B33BB049AA476E27FD48325E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2932318-5039-4bce-dfb4-08da60013e44
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 10:12:48.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JadcPiCDXkicbUDRqyhp7Iy6Mziemd+lnYBgRH+JECGPleLBoMfcJFtoxNY3iq6/AUOYcEt4dpy8Bvv92tAjO9xIH/sc9s4QKwYAagbkH0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_031254_666864_47FF2A0D 
X-CRM114-Status: GOOD (  15.37  )
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

On 07/07/2022 10:47, Sudeep Holla wrote:
> On Wed, Jul 06, 2022 at 02:38:01PM -0700, Atish Patra wrote:
>> On Wed, Jul 6, 2022 at 11:46 AM Conor Dooley <mail@conchuod.ie> wrote:
>>>
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> RISC-V has no sane defaults to fall back on where there is no cpu-map
>>> in the devicetree.
>>> Without sane defaults, the package, core and thread IDs are all set to
>>> -1. This causes user-visible inaccuracies for tools like hwloc/lstopo
>>> which rely on the sysfs cpu topology files to detect a system's
>>> topology.
>>>
>>> Add sane defaults in ~the exact same way as ARM64.
>>>
>>> CC: stable@vger.kernel.org
>>> Fixes: 03f11f03dbfe ("RISC-V: Parse cpu topology during boot.")
>>> Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
>>> Link: https://github.com/open-mpi/hwloc/issues/536
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>
>>> Sudeep suggested that this be backported rather than the changes to
>>> the devicetrees adding cpu-map since that property is optional.
>>> That patchset is still valid in it's own right.
>>>
>>>   arch/riscv/include/asm/topology.h | 13 +++++++++++++
>>>   arch/riscv/kernel/Makefile        |  1 +
>>>   arch/riscv/kernel/smpboot.c       |  4 ++++
>>>   arch/riscv/kernel/topology.c      | 32 +++++++++++++++++++++++++++++++
>>>   4 files changed, 50 insertions(+)
>>>   create mode 100644 arch/riscv/include/asm/topology.h
>>>   create mode 100644 arch/riscv/kernel/topology.c
>>>
>>> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
>>> new file mode 100644
>>> index 000000000000..36bc6ecda898
>>> --- /dev/null
>>> +++ b/arch/riscv/include/asm/topology.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
>>> + */
>>> +
>>> +#ifndef _ASM_RISCV_TOPOLOGY_H
>>> +#define _ASM_RISCV_TOPOLOGY_H
>>> +
>>> +#include <asm-generic/topology.h>
>>> +
>>> +void store_cpu_topology(unsigned int cpuid);
>>> +
>>> +#endif /* _ASM_RISCV_TOPOLOGY_H */
>>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>>> index c71d6591d539..9518882ba6f9 100644
>>> --- a/arch/riscv/kernel/Makefile
>>> +++ b/arch/riscv/kernel/Makefile
>>> @@ -50,6 +50,7 @@ obj-y += riscv_ksyms.o
>>>   obj-y  += stacktrace.o
>>>   obj-y  += cacheinfo.o
>>>   obj-y  += patch.o
>>> +obj-y  += topology.o
>>>   obj-y  += probes/
>>>   obj-$(CONFIG_MMU) += vdso.o vdso/
>>>
>>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>>> index f1e4948a4b52..d551c7f452d4 100644
>>> --- a/arch/riscv/kernel/smpboot.c
>>> +++ b/arch/riscv/kernel/smpboot.c
>>> @@ -32,6 +32,7 @@
>>>   #include <asm/sections.h>
>>>   #include <asm/sbi.h>
>>>   #include <asm/smp.h>
>>> +#include <asm/topology.h>
>>>
>>>   #include "head.h"
>>>
>>> @@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
>>>   void __init smp_prepare_boot_cpu(void)
>>>   {
>>>          init_cpu_topology();
>>> +
>>> +       store_cpu_topology(smp_processor_id());
>>>   }
>>>
>>>   void __init smp_prepare_cpus(unsigned int max_cpus)
>>> @@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
>>>          mmgrab(mm);
>>>          current->active_mm = mm;
>>>
>>> +       store_cpu_topology(curr_cpuid);
>>>          notify_cpu_starting(curr_cpuid);
>>>          numa_add_cpu(curr_cpuid);
>>>          update_siblings_masks(curr_cpuid);
>>> diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
>>> new file mode 100644
>>> index 000000000000..db72862bd5b5
>>> --- /dev/null
>>> +++ b/arch/riscv/kernel/topology.c
>>> @@ -0,0 +1,32 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
>>> + *
>>> + * Based on the arm64 version, which was in turn based on arm32, which was
>>> + * ultimately based on sh's.
>>> + * The arm64 version was listed as:
>>> + * Copyright (C) 2011,2013,2014 Linaro Limited.
>>> + */
>>> +
>>> +#include <linux/arch_topology.h>
>>> +#include <linux/topology.h>
>>> +#include <asm/topology.h>
>>> +
>>> +void store_cpu_topology(unsigned int cpuid)
>>> +{
>>> +       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
>>> +
>>> +       if (cpuid_topo->package_id != -1)
>>> +               goto topology_populated;
>>> +
>>> +       cpuid_topo->thread_id = -1;
>>> +       cpuid_topo->core_id = cpuid;
>>> +       cpuid_topo->package_id = cpu_to_node(cpuid);
>>> +
>>> +       pr_debug("CPU%u: package %d core %d thread %d\n",
>>> +                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
>>> +                cpuid_topo->thread_id);
>>> +
>>> +topology_populated:
>>> +       update_siblings_masks(cpuid);
>>> +}
>>>
>>
>> This function is pretty much the same as the arm64 one except the
>> UP/mpidr check.
>> Can we move this to the common code as well ?
>>
> 
> While I completely agree with the idea, not sure if that makes backports
> (if required) any difficult. If so, I would rather keep this way for a
> release and then move both to the common place in arch_topology.

Yeah, that seems like a good idea. I'll let this patch just touch
RISC-V for the sake of backporting & create a second patch to move
to a common implementation.

Since I've not modified any real arch code before, I'd rather make
that a separate patch/series too for the sake of getting this
patch applied as a v5.19-rc(late) fix.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
