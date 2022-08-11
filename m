Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0608FC25B0C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Aug 2022 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PCW66y39UG9gLZ5Dm5p4pPGnK8EmaZ7Jy6DbMcr26pQ=; b=D1RFXBb1ikZt0u
	M9HQg7fD59e0IR808O7Na/JeIkPWwfEtNz6/YRCxnv1c6C0J1j6kRQ+ZSey9MLiwtXQ50qG5UgCU+
	plZaayVLksaP2GirDRRykK/RxwbzU200WIk/2iFpw9zk2k07He9X/GTWuKowVTeQtkKxI0H6jDBcI
	QhL/I4DgC051mbpAfRVk68ExFddH3C0zjQTL7F0xsivGR22pBD4h2a0U+y/tS5WhoHPrS3ESSujcP
	7H7GBvH+KwPUWFJ9oub24wx2a28q3gYqieB01JhPaCWbd8IjC4rR9kiQ47ILULdL2lMKtkIj465p0
	5ZST9YOjpcAQpGeiKrhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3nI-00APj4-VG; Thu, 11 Aug 2022 08:43:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM3nF-00APgr-Qr
	for linux-riscv@lists.infradead.org; Thu, 11 Aug 2022 08:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660207433; x=1691743433;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=xHV9mSgZl8N1grjEgtlnqmVxfz3vIeNLvztxoiHjTKg=;
  b=bqsU0na4SPRPtczleF1fgLOOz5uTvEjfgBFFf08kLr0TQlKH9nEAwwbL
   mAjDIQD5Ciya/6Zwb7gBlIbS1wfq31tqL+W504yBgNWjwkaY/Ed9cNQm4
   ascsfTaV4TZ90ErTv9oGUoEHW3S7FRnUriIcvnB6KZ0kB5RA1JkZtM+s0
   WtQD/i0gV0XC+o7kpwLcdMsMamk/eqVUhot7NJhSWfeyronHVRuHBW3yQ
   eXOecbQSwq1rEHdM6+9BVWRArdAQuwHbpU5+HJBIdHr0VRp/s6TsuBPt6
   gC3DJ5Xk/56Ym8EDC4P+e64eyY9e/F+9ZbhiO5JJ96o2Wz+KkBR/kVZdw
   w==;
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="171969934"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Aug 2022 01:43:47 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 11 Aug 2022 01:43:47 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 11 Aug 2022 01:43:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKXtDbV6OHXhZ5agytgvRK0TOJUybm8iBvU/vXYAxHGFcEPOOo/KjvAoq4IVekkpM52TsMDiWFV6OavipUWSFVU5Go4FwxcHqIP3xZVbSIjd0Obh22gl0RpntdRoTTV8k4kAM7o8L/zuQxjvSlFW7dfqR3UKlyroc0KF0dIbzyMaO0IHL7Ndi5+f4lTYVFzLvDnYGlG93qcm437WZVX62tX5lAjlT2l2LHClC1QGpuyn1ttVKlw8StPqki4X8oQlaNm9XswduTE5LQuCkWtdFFmpGBd7MEYvYlHAKqar6SQuQDZYxYQgqMZAuD3idk5ZSW9PO3PWiRq7tphkrnneIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xHV9mSgZl8N1grjEgtlnqmVxfz3vIeNLvztxoiHjTKg=;
 b=IzcJB+nBHKL41MG2chqruM2NCiD4hzVel8JgYCEemVhPnJ7TWMUOZbQXMnlWWM6Nt6oZyGMQqjrgdFo3Acxy0cT52kiUpmjmusOzKe7QK67dyB5aTSBQr4mcnz5B1mLKOqTHCk8GzQtpZicljVts2Sd2mm2tJ1M4LMJTYtPsJgra/MPGb52hvM6jUTrqKnPNE0j6jnkJvQ3pOeydGysyAtM8sRVjwZM0rHKwRlS3GiLEgrEHEWmo3dSPis6WyboeoUkPx1TET0xSua5vZXuD7rN/THQLYeKfY7sBAf7OP2wVsyUDBiRU+HLhX88gtf57RaoVW+QBx76GaLFYibcn8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xHV9mSgZl8N1grjEgtlnqmVxfz3vIeNLvztxoiHjTKg=;
 b=NUyjXPCQ0gsICeUkmdQBRVFT0sNOCOVMgMfGh5/xaqhWbsoXye1SXMd0jkPkCNjgqnSI3BsaaYbcns5G5BIGuHKnjTpD/sVESyaUzv7TqW8LNW89tCeZAW5OsTsIB295Nu7bKH9GW4cLwABjM3l9RoU57Qx0v8hPZOO5lcMPApM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 08:43:42 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Thu, 11 Aug 2022
 08:43:42 +0000
From: <Conor.Dooley@microchip.com>
To: <lukas.bulwahn@gmail.com>
CC: <Daire.McNamara@microchip.com>, <linux-riscv@lists.infradead.org>,
	<wsa@kernel.org>, <arnd@arndb.de>, <kernel-janitors@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP POLARFIRE
 SOC SUPPORT
Thread-Topic: [PATCH] MAINTAINERS: rectify entry for RISC-V/MICROCHIP
 POLARFIRE SOC SUPPORT
Thread-Index: AQHYrVDAFjo5LcJuaEKmHCoveAZVwa2pSTkAgAAFHQCAAAgfAIAAC8EA
Date: Thu, 11 Aug 2022 08:43:42 +0000
Message-ID: <e0382547-eac1-3783-163a-600d5159feb6@microchip.com>
References: <20220811070506.12252-1-lukas.bulwahn@gmail.com>
 <47742925-2d0d-7313-f811-aa17e35ce81a@microchip.com>
 <CAKXUXMzaR_503UMXmoRe4CvUuek50VJb+33R6xYf3Op4tw78ZQ@mail.gmail.com>
 <962d7dce-e80e-0cf6-d346-4ae7bef892df@microchip.com>
In-Reply-To: <962d7dce-e80e-0cf6-d346-4ae7bef892df@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1cb0734-fb6a-40ab-c1d2-08da7b75982f
x-ms-traffictypediagnostic: CO1PR11MB4851:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X28fiY8NG6U2W7VFyHmD2C3Ham0KOKmj44EpBo9jEmKBDWcUJEMZ0jfSSx1xL3+OzkXOM515L1h7AO1Kg4nqr+WY3myvlP2sN3pWgssEVOawgfLwPEsr8anLd0FixXvlWyj0IRnMn5qEnHEEl1PKPyUi4qJ+TGtssJk40l5ESlo+vMVxL1F3Ppe9JdCxQTaNuMtJlpK7T+f9LVUMNZp5pWVjNKSJ2YxczAVMPbKnR0YTOt4eWJMTfki+yjdOianTjhPmqCLb8pZBgnny0qW1vI6+R48voa9GfBBQKoTYcnaTHN7WKlH5TDg9x2OLc3MYtBpKquwVsTxQHqR9J5frV7LBajkLjJAqU+TBaLQqMDM/KsaTaRbH754rozBdCXVziz4X+Z22wHdgu6R7a9qg6bVJLGg/Jmp+I9MaeKHKprIneTW1XVVUiQQph3MGpwWu0mK7G9+tGfBC28wlfRhZeKGNuMX66U9k5kQJAi0ZwbJPQs42P6Xm2mUhqyQFOI+3V7kfuftXBp+PUEvKdGHnbSBFBxnTckYgTNmao/E1OW0Fq9wn/YHsy5/kWZBCtpKP/sJetLvnuFaYR0M9jflC+Vbg645Y8QITJ/VE0HKt+FWQ1BP9vcq42jbCtedunXASdfhXmB0CZ2gUZMcsgR3uRj7qc+VmE5Lz0EF8g6aOJjCz7N4Lbn4WNxwn+cOZG+X/CWdNWc25aVUKeZdfoRVcWH2KemJZnimEX5n0jydrLcX+CPnhp1ZlBt6yIYulf3ymOPK5iJziXJelM96jY8em8Hz31KVTQYvSxyHcvYX7Y/yvuJhpQK5kcv7Z7deIXiMp1i1Jbjb3QiaGwx+g9DlyrJ6AAbpPITE5UDWP7L0Dn5iwlalJU5PBhQAS9gxJLchG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(376002)(39860400002)(396003)(346002)(186003)(41300700001)(71200400001)(86362001)(53546011)(6506007)(6512007)(2616005)(26005)(36756003)(31696002)(316002)(6916009)(54906003)(91956017)(76116006)(4326008)(8676002)(66946007)(66476007)(64756008)(66446008)(66556008)(2906002)(5660300002)(6486002)(478600001)(8936002)(38070700005)(38100700002)(122000001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXMzaHQ3SVRpS3VWUFZHVDNnU3lYWW92NUxlS2p1WmFCcERTS042d2xlVFBD?=
 =?utf-8?B?UTdLeXlxTnIvUUtHTGFwWkk3Mi84RVZPb1FDMEFLM0ptNk1oTGlzTElySU9W?=
 =?utf-8?B?RWRrcUpTVVJKTG1jaHNnd0Yyc2R0d3k2VERINGdUQ1Z0RkxGdmdvR054blBm?=
 =?utf-8?B?VXV3RWN3VjBNdUU1OG5rc0NkUGZCSlBiTnJqV2R1bkQ2ZGdoYkl0VG40ZmNP?=
 =?utf-8?B?dUN2VDF0aUhKS2VvYVQ1dHZ4Ni9DcXNJK0MybzBscmtnbnV6dzNTbmgxR3lV?=
 =?utf-8?B?aEh5QmxPMDN4N3QrZElQNzF5alZrTHg3cmdhWWh6MCt5MFVhamRaVDBDdnJY?=
 =?utf-8?B?L2JyZlB0ZUtCU1RURCtIWUMrNmVDM3JyOUUwV1pna0VGM3VyWmhsUW91eFc0?=
 =?utf-8?B?TE9TN25QNkdSaGR3YmdpaWd1TE5VVFozUGRSaUxOWDAyZ00xQmRKYU5lQ1Qv?=
 =?utf-8?B?Z1E2SVAxYVAyUm1QRVBqVldrRWlXUU42WlV4MG9oM3o4SDA5STZDOEtOdmV5?=
 =?utf-8?B?UHlBcVU1QXhSYnFZdFo2bXBYOGJkeGVhRnpGdDlvakV5bitWVjRDaEthOWhH?=
 =?utf-8?B?YndLQ0t3QTB0d1hFMnFPdWRRR0hpWm5LandqQWFBLzYvNEdxR1BjVjh5TWVL?=
 =?utf-8?B?bE56U0tkemg1ekxsNCthOFN4VEkwSUlCY3FkRE1Dci9nUGFDOGd6RnNhV2pE?=
 =?utf-8?B?ckc5WEZENXJiTnl1ZzBPMTNzMXd0aVhibVZXZmg2Tnd3SmtJdmQvc2pVV2tK?=
 =?utf-8?B?SHlxbW1RTVRIcmttNUxlUEd2OWttUVVYY0hJbVdvMnRLNi83cXFhN2UvSUR3?=
 =?utf-8?B?aHIwUVd0b2ZHRGNaM0tIM1FPQUxvRURoK0xYZGVYS0p5a0NlQnJoVW5sL0xT?=
 =?utf-8?B?Tm5HK2ZRRTFVUW9rOHk3YnBEK0t3QWZFczNlWmpLbDN1WDhPZkEyQU5KbEJW?=
 =?utf-8?B?UWRCeHAxVEt5d1hoaUMrSmdCcVNxRzI2cTRGY093eXRsa2lWWUFlS2RObTdX?=
 =?utf-8?B?QWhtaWxWT3czQWVQS0Zsem8vMUpMQmRQYm53clpIUDFoUWNpYlppWWM1TjRI?=
 =?utf-8?B?QU0zeUhKS2xTQnVlRmVPZjJOMDd0UGwrNUNiSjRIQkFsbUszRCtlODBZWmp2?=
 =?utf-8?B?Rnl1c1g0bjFRMDFZRTMrNU1BUGJwUitlUGh4NU5sWjBXb2FmNk91RHFCN1JJ?=
 =?utf-8?B?Vk5uTG1sYjRMZFlUR1NOdXBjT1d6UjQ5U2c5WDY2NEtGdXhRejFoek41TCtR?=
 =?utf-8?B?SDNkQTFLclEwVEtQTWJxY09YZzh6d0YyUlZXUjdUd1FmaUYrSXhkYm9zR2I0?=
 =?utf-8?B?bzdYUHE1a3VteU9yUVlIVzVWNDU5Z1pub3VucXhUNjRNSm9oMHNXNURrNjFG?=
 =?utf-8?B?U2s0czNTNE1HVkNCck5lOEFSZzM5aG14RHlMYWFjTExCRElzZCs4RVpnZitT?=
 =?utf-8?B?UGpBRmtHZkJuYUtyZVpZb01EbGtJa1BDZkxnVjl2OG5Ea3pYb2Y3cXMvYkM0?=
 =?utf-8?B?MmZ5MW4yVEdwdHdhMHFSZG9vbmV0aU8wMVd2YWlxUUlkZVZtNVBjYkZNWUFo?=
 =?utf-8?B?dGZGV2tCV21RYnBZWkFoN1dUVlVPZ2U4SjBhZnhySHYyR1J6QytOYVErYTAx?=
 =?utf-8?B?ODBYeEZDZldHQ05UMkt3eEladFZqS09WKzg3bHlxSTAxaWtFWEcrc2o3aXRE?=
 =?utf-8?B?YVY4Z2w5NmFWUzFDV0N2SGg4bi9WWkRqQzFncFpQU1hrbitLaEZ5UE54THBO?=
 =?utf-8?B?RVlkZ1Rwck9JS0czRzM1YnpoSHpxaHhmTlEzVDFZcTRzQnJ0a3VpS1pkR2JM?=
 =?utf-8?B?ZmFzR01EOCtrelBPZ1B2bEhJQXJYeFJTRFNDcFByU3dtMzNMWGpLcXpkQlJq?=
 =?utf-8?B?a2p4c2Rib1d1bDV1VURzbmxHUlJaMUVPVnZsNm9QekpZaEdCb0dvWGRObVNX?=
 =?utf-8?B?OTU3cXlYT0h5cjBQQmpiZzBNQVE5ZmFOYWZpRjlGS0lLYStxRnZ3Y2RQWVo1?=
 =?utf-8?B?NFlCVll5WjVYOHpzOElMamh3a096bVVSUTBNeU1pMGZ2UUhQRjdqczdjSGJU?=
 =?utf-8?B?dUlUR2x5bW1uN0lTUnV2WDFYUm11MDRFdFpTYjNySjRNTUpPK0QzZkt5RXM4?=
 =?utf-8?Q?XKbeIgaSXEJfGVxExTsIgSOkP?=
Content-ID: <9DE70BBBFD905C4081D35A832B51057C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cb0734-fb6a-40ab-c1d2-08da7b75982f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 08:43:42.0689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uLLQzSXakDD1g/u5jmpHdg3LkMmiTEzC0+EzNUlbpOoblczxwnjTVa76l95C9E2c1fCsJDoOt3K68DGQmS/ESpi+AuVdtGvfgNAait7BmEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_014354_202401_7F12272E 
X-CRM114-Status: GOOD (  17.45  )
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

On 11/08/2022 09:01, Conor.Dooley@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 11/08/2022 08:32, Lukas Bulwahn wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On Thu, Aug 11, 2022 at 9:14 AM <Conor.Dooley@microchip.com> wrote:
>>>
>>> On 11/08/2022 08:05, Lukas Bulwahn wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Commit 3cbd67384677 ("MAINTAINERS: add the Polarfire SoC's i2c driver")
>>>> adds the file entry for drivers/i2c/busses/i2c-microchip-core.c, but the
>>>> file is actually named drivers/i2c/busses/i2c-microchip-corei2c.c.
>>>>
>>>> Repair this file reference in RISC-V/MICROCHIP POLARFIRE SOC SUPPORT.
>>>>
>>>> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>>> ---
>>>> Conor, please ack.
>>>
>>> FFS... Silly mistake from me there, keep getting caught out by
>>> the maintainers entries when I do an inter-version rename.
>>> Is there something I can add to my build scripts, other than the
>>> get_maintainer selftest to catch these?
>>> Thanks Lukas.
>>>
>>
>> I am not aware of another script. Why do you see the need for another one?
>>
>> I acknowledge that ./scripts/get_maintainer.pl --self-test=patterns
>> does take a few seconds (roughly 30 or so) and it checks the whole
>> MAINTAINERS file. Is that just not performant enough?
> 
> 
> Yeah, it takes longer than my kernel build does! If there was something
> faster I'd have added it to run every time I do a build so it'd be
> impossible to miss.
> 
> It's fine, I'll just add it as a arg ;)

Ah I missed the "patterns" bit when I read this, was wondering why it was
taking so long. I'll add it in some form, so hopefully that's the end of
fixing my stuff..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
