Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C68C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 19:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yRnMMXGb4D47ngwCeOlkykiMg9XX0H6MkMEyHrKiAQo=; b=EFBj/U9dtbmUtH
	p7/mpbmcxSWFZxJrgH73Umo4hPGDA/B6LPTogEKV5hVB55nb1nsJocUfQpeHBF25UctXYowbMF73O
	qBOLzJEpbcH6wGHdoOeqC6KTXIWjygh0XYjyu1SNjgvnwyHWVqlt2WSbujJ3gDRwyg64KcJP2N2hX
	Ehm76c857T3h2XaDiCuCHCLrYbjuLFDlldjBbLJ+CD0rgJ6wx66AMFbI+fdEkcbgZJBj7/iB8/uAX
	uSx262rmd+flzqwEK/Tqukepznfp9R32ByEbFSMeTSv0wWVKosX7EkpGYgdOozBNiEUed25Nr56Vq
	l4feO8TcBk63/B8WS6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8oDa-002Msh-Ke; Tue, 05 Jul 2022 19:28:18 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8oDX-002MqE-1o
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 19:28:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657049294; x=1688585294;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eUTS73gge0teSJcOvcvBRalNCEsZt4ZRmdTswbOzRWQ=;
  b=iwMumnrnR3XVzouvkTBQ4B/WWHJ/IxN4GNEsJeDWDik3UwouKVWeeOot
   ZUrSRRDoNXZVUKmhYiLJldZflZz6I295e9aFjA8UEnEAE08JxCg4U5JWh
   H0+G5xtRrs3eNCL6uL48STDjm/vJSXQpfsbO29Qq6/9cEWjNRK1tRq4oT
   1OcKwnRbDDh62Nr4DlglA61Eb5d6rPNTue7lnNmK/BSLkrJxu2IK2YHgw
   Q6fMegfUfbxmtXrihFVWYcfLjRrOu1PcrC5TSAE0SZFcH5dDo+lRaYDNF
   q0qdWc/A0E6u1PQ5ki5uOSUv+27wDlWqrShcWFvf2VMdSqge3OKhXrH0I
   w==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="171137359"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 12:28:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 12:28:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 12:28:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC4NqM2kwr9PV62WwIXRkyn2GlOn6uJhmI6pVhrtHkGxguw5zwxSykFB7/nT0Q7kFHK6qRwmQtsL2h+b2SlnOkw2d1Y8bjmtDCBZKmpt9jOuinzelTo4uugVhAQM73NypPj/KGfL7kvQ28Cnn1I+UtNCclxYrGZ2Pia/o7o/+HuZwVyepEqYIoVGXKetr4vpSRWyqfcUFn/pZB7RDJYH6F7zh/gxHIK5OojIhCo3KpllMY/YXJ4uZ2pIvWZbkgBVjac14WOuUKHE2Avc4mY+bPTwgquxmDktrrYlHsppWifS/8PqM5IN3go1v0yROfvIIt0N6rBH2yrU8xBkROCGeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUTS73gge0teSJcOvcvBRalNCEsZt4ZRmdTswbOzRWQ=;
 b=fHdI5mStJdt8XrW1QBVmQeAlSB7k2UNJzhLlbx8QeB/QZVcjd7GG7DBOosvSNywN41wG1chPzvNZ46QwpdRGTxpH/hxuTZJbJTSY5qRcrU5UpAYtuCf7osTinAdsr3DPyrFB3ksc6SFGWYjez4OhZm9pXBlHEeIK22JsDzGb68RrMukfDWtuCU9VVfcysNovTTsal68W3b0AqppAS4nPDcNuMc3NOxbasRNKi4gfu+W/TFNzwmq+lPm2fDXK+ix0h1SRr4+mhCHQEf98HIV1ssFrGqjxlBwYjZP4x3YeG2qzlCf8vks9KaPKrJOScODc/wtQC77ExDsZGtcnM/xmTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUTS73gge0teSJcOvcvBRalNCEsZt4ZRmdTswbOzRWQ=;
 b=JYQ6BuX2oM35IwzyOyvRxuFUL4w/jrH0lAfCECkUJ+8Eu+Cs+kA9NIqZC1mT6rK2GUB22PV/liOSWcLm0DDSqCqvSijnjjav7EMTLGWwmofVEbVwXPy+0YN1EANuTNKOmrto+9R+zU3R6sj8D5j4kGcqqIZj8guCtuoHzl8F5ws=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3472.namprd11.prod.outlook.com (2603:10b6:805:bd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 19:28:05 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 19:28:05 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Conor.Dooley@microchip.com>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<niklas.cassel@wdc.com>, <dillon.minfei@gmail.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan k210
 sram controller
Thread-Topic: [PATCH v4 05/14] dt-bindings: memory-controllers: add canaan
 k210 sram controller
Thread-Index: AQHYjYAvHczrGH5faUaoq3axDB0JHK1wLk+AgAABY4A=
Date: Tue, 5 Jul 2022 19:28:05 +0000
Message-ID: <d2369d3c-adfb-3158-2fa6-81c336502db9@microchip.com>
References: <20220701192300.2293643-1-conor@kernel.org>
 <20220701192300.2293643-6-conor@kernel.org>
 <20220705192307.GA2471961-robh@kernel.org>
In-Reply-To: <20220705192307.GA2471961-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e076e0f-8623-4af3-8c1f-08da5ebc7c35
x-ms-traffictypediagnostic: SN6PR11MB3472:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?c3RPYWVMeS9NbVB1azlSQzRxRUJiL3dMVitWVmJINGlid05UMXJNWE1TTWdk?=
 =?utf-8?B?WDN6Z2ZMN213Z21sNVlzeFFRZksrSEhqZm9ZWkVPbDJ6OTl6eS9CeGpMWTZs?=
 =?utf-8?B?cmhqS09vekpGeDJPRXlPYlZIOG5RQ0Y1UFdCek53eWNkYUNHbkxUSk82cEtl?=
 =?utf-8?B?RERtUnV5b1FabzNyMVRMUTBNKzNKdjUxSTNFUFNsemJDL1Q0Tm5aaVN0WStK?=
 =?utf-8?B?Q1l1MGR0eHE5Ui96emZNY1QyL1VaMkJOSUpMa05EZFFTN1ZnejZKQjE0M3hr?=
 =?utf-8?B?ZjUraFM0OW9XemE4alU1UHVPYTZrdDdzMk1rQjFhaFNMOVAvZ3NHMTVWVEhk?=
 =?utf-8?B?N3ZLV2pReFhrSDUyK2thUEkzUnJsVXhnakZ5K0dlcmduOFJJaFpnY2Z1YTZH?=
 =?utf-8?B?VU9jWE5iQnBBeGR3UW1JK2hGVyszdzUydG85c3BmR0haUnNLSmZSVmxZamFU?=
 =?utf-8?B?WUJFL1d4Q1VkSUpZZnFPSis3aEd5dEVmR2lzM1JFQlJxeWVMTmZOUm1NY0xO?=
 =?utf-8?B?ZXNqc2luSE91bVJmRXZKQ0hTZVg3WlY1Wkk5MWx1TG5RaGhNNUpQV3k1dDRU?=
 =?utf-8?B?cUlBRS83UVB4N080Y0xtRkVScEh2NkxlS1Q0bjNkSFp3Rm1uL1NEMlRNT1RW?=
 =?utf-8?B?d25vZ0UwNXRrSGNtUmtsbloxSm9SdkkxaGVIQng3WDc2THpPN0xZTzJsZ1Yy?=
 =?utf-8?B?Z3lHamhwT1J6MnpDQkNsNi84M3k5d3FrZDgwVkhFa0ZxSDJEZFdBaEtTRFlW?=
 =?utf-8?B?UVhlZmZNc0hkdFUyeHFoc1dUVVJqdk9XbGpLVWxLSFpFSkErWFk0VUlUVnlk?=
 =?utf-8?B?TGFaOHNLcUhqZE1qbFB2c2VQMUVTSUo2MXpVVnBzTjVvWU02TXpzRWFnQ252?=
 =?utf-8?B?SURvdjd0OElsMkpSS3YyRUlCa3hmeFYvNzcwbjEzTVZUWXJ5OTRIT1ltTlpw?=
 =?utf-8?B?RFdYRmFZK3hJS0VXazZSbEFBR1llbDFIQlJwRVRGeUVqVjYrMjlwendYL01D?=
 =?utf-8?B?UEpGdy8zdit5Q0twZEl4L3ZONmpMQXpua0V5UFRsL29VZjEvYVl4SG9lSjhp?=
 =?utf-8?B?VjNVc3JCMkNUU2ZRdDBUTmhFVHoyMWsyenR5bDluSmhNRXc5ajlQTkEvUjJi?=
 =?utf-8?B?MUdQaGdLVXNGQ2srV1NJeWRXT0RzTDNDcnR6MUo2QjhsMHpxbmZpdC9pWVY4?=
 =?utf-8?B?UDg4cVBDVlV6MjhhNVRPckZLaUJFMi96M2pGckZDSzhWTTZZaWpMcWJWak85?=
 =?utf-8?B?a2czbm0vNURCbGx0UHU5SFl2UUo2N2NiVUpOUVRoQlNsczhRQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(396003)(136003)(39860400002)(366004)(7416002)(478600001)(966005)(5660300002)(8936002)(6486002)(53546011)(6506007)(31696002)(86362001)(26005)(6512007)(41300700001)(2906002)(38100700002)(122000001)(2616005)(186003)(38070700005)(83380400001)(71200400001)(66946007)(76116006)(66556008)(66476007)(64756008)(66446008)(54906003)(6916009)(91956017)(31686004)(36756003)(316002)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZjJyNEZKUlp3OU1NdTJSWTZIWUd0QmJ6aVErOXVmVjd4S0cwNitjL2ZJbmsv?=
 =?utf-8?B?ZzRtNDZDaWthMXdJRmZIT25JSmVrdjE3aHVQbHNTeWxSS1BFa3dqZ0lzRDBL?=
 =?utf-8?B?RlIxTElWN3Z5SkxQazdSamNzMWhDWjkwTWd2RDQyN2VpTER6MDl4czBidjJK?=
 =?utf-8?B?Y3RMcDQ3MUN3WU9PZ3VwWjBJSjNoNHR2QWRtVGJ0Tmd2TE5jYzBaQS94NlFm?=
 =?utf-8?B?NTY3b2d1THdxVWZLVjhnYXhsSlcxcVYvZkhxTnFRZTRua3IzNXk3Z0ZtRFRU?=
 =?utf-8?B?TjlTOUM0UFB0YW1Bb0trRG9LNTNjVHAxemZQWXlSUEI5SG5CK0UzMW1EZU1H?=
 =?utf-8?B?eFh5bXZQMDRkeEd1RUExNXdUemF1Rmk5K1c4UHNWcVA0ZkQ2eGdXMTY3cGxZ?=
 =?utf-8?B?VHFhRnJmREdHTUU1eFN2SDErYTROVXh6Q1FWM3JVSS8yYXNXNmdSRVhSUXBH?=
 =?utf-8?B?ZzdxSkQyRDcwd1pzZnlVeGRlRXZhQllXVHBIMTZ5TXhJemROWnJaTHF4RXNl?=
 =?utf-8?B?SDladnhkcmxzdVVSOHh6MWViTkRvdW5BQ3VFdFZqemRoMDFzY21qdG04WWZR?=
 =?utf-8?B?S2E0c1d4UlJtTVlFbjhENUdRbDhQaGEzMktmSDhPbnBvN0tBRWhIdmRLWmpW?=
 =?utf-8?B?NnBpWC9FUjdkYkRYSUtFZVFCQ01UdU95WTYrQWxrNGRwbHIyK2xsYWo5b1Ny?=
 =?utf-8?B?N3l0ei9rQUwzOUJsYkd5aTdUYmU2bkxpTmMyN0RpSjRDOUU0bVYwUFZDdldL?=
 =?utf-8?B?bTBOS3VDanFVNEpxTS9aVEEwcDdMQVdSeFYvRkE5TElIQ0pWUXlQN1ZzcEhP?=
 =?utf-8?B?UEhKdUNhZEI1WStpUFJUaW9EQzM2R0dsVk1uOGNnV09RL3ArdmtGVzg1dmps?=
 =?utf-8?B?Q05pTlpsRHRNMVNQL1hla0s2b3VKWFBaZDFoWHlQOEtDMjNXVFA2UllxRzdq?=
 =?utf-8?B?bi9kNG5Qbk5lZWN6bEVXU3R0c2hoR2FZMlpPRlRYNzc3RTcwc3M1M0RBRk1E?=
 =?utf-8?B?MDNvemkwK2lFSWlHSHhtclpSd25uMW5WR2hBZHYzc3RPZGpUaVBTOUNQdG5P?=
 =?utf-8?B?T3E0dEJOR3l4RjBnbWZUTDJHdmtRbVpSMk1DbjViNjBsN1hvUDg0V0V0YzNS?=
 =?utf-8?B?d0g5L0VZT2tJTWxmTWlGTWhORkdBcHpJbmNnM1I0OE83NWZ5T3kzQ211enZL?=
 =?utf-8?B?Y2hOSkVVYXRWV0RjTjZJSkh0d3dyaWEvcHBzcmxTYkRZUDk1L1J5dVdWL0o5?=
 =?utf-8?B?QWg4S01KdmdPcS8rZGJqZDdzbVJ5SVFCTTlQQWk5ZEhkQ2pHQkIxU0U2bEdM?=
 =?utf-8?B?MHRzVE5xc0F6TzRPcHZwclB6OWRTZ1h1VWZ6T2RYK0RScFl3NElXZExJWFUy?=
 =?utf-8?B?dE03ZVpHWlV5V0FieDNERENQaW14bU5wWnc2dnpTQkptRVl2Z3pTRnpVeVQw?=
 =?utf-8?B?dytyYnpnWHhVeTZvMHpuam8vTTdaQ05WbE9XcXpoRlFkZ201WEVSQm1kY3Nz?=
 =?utf-8?B?VjczWldoZzl6QWZERlJyNXE1RFhVdUEwczRvcTZsQU1FQzRWTVBET25ydnda?=
 =?utf-8?B?RnJUTHY4V3VMZUZ0SjdwdXRTN2RoK2luUE9YMWxBY2RQQjg2aE1XZGN4SUZB?=
 =?utf-8?B?VmhWaTBmWkNZWHlrakpQcjIveFlUNHhtRnBrZVZrdS90bjlWOXl6Y2xYTTRE?=
 =?utf-8?B?YWtoRDlLMEhicThCdFpXK2hxeUVINC9LYUtRWE50NzhDV1prSyswQVppL0RL?=
 =?utf-8?B?ZzBRek9sbmhramxGbUcyUWFRcFdKU1p3ZktHbTRyWDkzNTJUZ09RbEthZHh0?=
 =?utf-8?B?L3h6RnBITlJ0ekNHVGtwZ1J2NlRYQ05BMi9UemxuMVJLWU82VGpMS2VhS0RQ?=
 =?utf-8?B?cmdDSW93Y05kc3FIaC9hbW5Ea3JoWWlqV25MaXRwWGY5azN6SDhRaVlkbDZ2?=
 =?utf-8?B?UjB1TEZjTkdNM2szeC9rV0s4ODZQZHZXZ0tTM2NDZlpxRUo1S09JTWIwNjk1?=
 =?utf-8?B?eG5oYWZYRnEyWHJYcnhGZGdjRlVoVTBDUjQxSHhibXBvQVFmY3lUQkVHZHZC?=
 =?utf-8?B?VkVkTEJDU21iRENORnZNWHBUemhmWjcxd0ZHeWduWUlMZDlaL2t6dG9MTUk1?=
 =?utf-8?Q?juE8nIfDILiEhEqg8eiUX8Nd5?=
Content-ID: <A32B686B55314D488B3B6C946DC5779E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e076e0f-8623-4af3-8c1f-08da5ebc7c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 19:28:05.6468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HHWcDpMmuNknfJ5KYlGdG+yycygpbWtaxB8EYACVOv2+I2SotKO3Es84CXiz0ORnuAH9/RRCWI615R4GUSZYkqLc2KcQtA7YAlIbQiOjEXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3472
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_122815_209197_87A2B312 
X-CRM114-Status: GOOD (  20.14  )
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



On 05/07/2022 20:23, Rob Herring wrote:
> On Fri, Jul 01, 2022 at 08:22:51PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> The k210 U-Boot port has been using the clocks defined in the
>> devicetree to bring up the board's SRAM, but this violates the
>> dt-schema. As such, move the clocks to a dedicated node with
>> the same compatible string & document it.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../memory-controllers/canaan,k210-sram.yaml  | 52 +++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>> new file mode 100644
>> index 000000000000..82be32757713
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/canaan,k210-sram.yaml
>> @@ -0,0 +1,52 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/memory-controllers/canaan,k210-sram.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Canaan K210 SRAM memory controller
>> +
>> +description: |
> 
> Don't need '|'.
> 
>> +  The Canaan K210 SRAM memory controller is initialised and programmed by
>> +  firmware, but an OS might want to read its registers for error reporting
>> +  purposes and to learn about the DRAM topology.
> 
> How the OS going to do that? You don't have any way defined to access 
> the registers.

Eugh, copy paste. I'll rephrase in the respin. It should be "initialised by
firmware." There are no registers, only clocks.

> 
> Also, where is the SRAM address itself defined?

The actual sram is in the memory node.

> 
>> +
>> +maintainers:
>> +  - Conor Dooley <conor@kernel.org>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - canaan,k210-sram
>> +
>> +  clocks:
>> +    minItems: 1
>> +    items:
>> +      - description: sram0 clock
>> +      - description: sram1 clock
>> +      - description: aisram clock
>> +
>> +  clock-names:
>> +    minItems: 1
>> +    items:
>> +      - const: sram0
>> +      - const: sram1
>> +      - const: aisram
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - clock-names
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/k210-clk.h>
>> +    memory-controller {
>> +        compatible = "canaan,k210-sram";
>> +        clocks = <&sysclk K210_CLK_SRAM0>,
>> +                 <&sysclk K210_CLK_SRAM1>,
>> +                 <&sysclk K210_CLK_AI>;
>> +        clock-names = "sram0", "sram1", "aisram";
>> +    };
>> -- 
>> 2.37.0
>>
>>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
