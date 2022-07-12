Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7BAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 14:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMlKVFmdiN3dLYVe4kpml37jFLUkS3ZJaCgGkiLbMb4=; b=H8ZcEWrrjbF2np
	olk2fPu/ZKcuUa6AlymYkeSnsByAnopnRpA759aB2+oa9ov1yUdQYilLv/VXtOg55UVjcxk0dZKxj
	dt0ymFzWONEuhHFr6VOUjHHhzrl+yfY2/bTp0ypJJi9viE8mm38Qy8KZyE3CwYuno6pNOY8+KMEk1
	z/PlOJrVBypmozN5zJ3z92dKMT28sOYcTbKdANgh9XdvHvlv8zysli9aHn54qIEc3Nsf6B52oVZ1O
	F7w3GAb+APT4OtScltbFPekG6EakiYDYn66G+IMI0WsZaGemB9bz+eW9kW7CzSQCvN5qRMc2BYbxC
	yrs8BFPpdfwvUWq7DP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGUM-00BbB3-Rw; Tue, 12 Jul 2022 14:03:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBGUJ-00Bb8W-7F
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 14:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657634623; x=1689170623;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=2B6a7B27j6G+mG48B/lmx6CJCZOTJ2qKLHvnCQwLwiA=;
  b=fnBK3815s+CSUSdX13csU8RFiHh0Ba6hKqAL1V0EDxE/sKj3OMwpWVM4
   lBiC9huTS4dJLSw7O1jIQfPg1h4rYMNSR6afTz4hTEKXHuXdO082czs0x
   Jb384Uv31IL4PwaKiIxCKjU97qbDGu4aX8lEwAPzSFkkNemNMqbCPBUCI
   HuJRjeQ7dRUiL8kM2XPQv3KcarC46eW23bngWwJqoR6NhVFbNfhOnfKzE
   eTJpq7qs8flZIQ1LuRBOo1q8/dEdag/IJbbQG2GwelVQHfzHWWhl9mqE7
   TRhyHcKHNVBxtwXhX+kT9SL3MuMY9I1LhyJP8CP7pkYYwzSPYyTFEpR0n
   w==;
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; 
   d="scan'208";a="171767958"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 07:03:41 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 07:03:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 07:03:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6ZQI7JKheXm3/el5IrTOtvYXztM6dN9RrgGTe9uGOkcdro1mEHbvGsO8EDGI0lEOrV9j7z0CSeQEw86NsDE2UE5mya2K9XLpc3gqPkYkraMZQ/ZE+So1QMlh3ZkLnQEiMPd/RElQjvyeuA3y7MvfeHGn+gMmwa8bgCeqpnleq9SJ6mdAOVQZFQWU1bC8rU7p5GzxPwL0ztu9EvhNWklApgxC2nS3rDaaFyeELeHKYJygtyYcVrUCzGNmbZGVJLTPlMmAvjml1jopv6cm1SWkq6+eI7H4gMmXOi5cE+8bU8vNNOkRJJHrmKGX0bb+tAz1DKcD/oXR1ZCw5Zd6zxFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B6a7B27j6G+mG48B/lmx6CJCZOTJ2qKLHvnCQwLwiA=;
 b=ksPsV06Kq4HaYUrBiO84yp+jEnwcwOfCVb5bh2xOsAdQULw0RAw9gpUUd19Vdf6Tfm9V+P2nOnj23TPbwmRLPxAeMOM4+LMbymFVY8ytA++ZbnnB/t3CQqF37gYiR0tvb1T+RBWn9mT27UfTZWR/mhYaQ35n3veFsOEebz3QXYRJOogkQqdLqEm4+OPWescm3N1Tw9rdvC88Bz5B30/vLdVPNuI/hn3sxTJotIwyGXRottKWQ4HRSuK0OBSNA8OWuRsjc/k/DZ1aL+zkPwgetKHNOzh4wRgEhL+ra4s7ECt+RAO+aTQgzwMrk+uT6OMI860qq9TRbbXVr/598UEeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2B6a7B27j6G+mG48B/lmx6CJCZOTJ2qKLHvnCQwLwiA=;
 b=AgUc0T8AoGkctcwXhTyF9ABSEdaa5bMN0kVEF94MSYk0wrCRdcWe74u4//93poMeHiKNCWmdSEp5W7eDzIuEK0mWljxjl9TqbAlXwK9c/ES71V7JWc2hXiCGH1lLIar8JXheOfqyl5zVFkhHUxpCUISfXLOUaxnEjGAQog/CyEY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1492.namprd11.prod.outlook.com (2603:10b6:405:b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Tue, 12 Jul
 2022 14:03:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 14:03:33 +0000
From: <Conor.Dooley@microchip.com>
To: <yangyingliang@huawei.com>
CC: <Daire.McNamara@microchip.com>, <broonie@kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH -next 2/2] spi: microchip-core: switch to use
 devm_spi_alloc_master()
Thread-Topic: [PATCH -next 2/2] spi: microchip-core: switch to use
 devm_spi_alloc_master()
Thread-Index: AQHYlfWKEaKO0rADDkGuzfTu66tTVK16xHiA
Date: Tue, 12 Jul 2022 14:03:33 +0000
Message-ID: <87581e76-ceb7-9efa-d6dd-5ad4fe66111a@microchip.com>
References: <20220712135357.918997-1-yangyingliang@huawei.com>
 <20220712135357.918997-2-yangyingliang@huawei.com>
In-Reply-To: <20220712135357.918997-2-yangyingliang@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1a28cc6-c6e5-4b61-fe23-08da640f4ef3
x-ms-traffictypediagnostic: BN6PR11MB1492:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zcxViPA+mq8DtMjvq7nL1QaopzshXMLf917KlQZp4W0kyiU3TSqKBbRL+pd/mhM697x5JCpxieE+eYQlUoBFq63b3TfO9y+XCm9bMQBUK0yyWgmXyP5+DMNJPMpqqH7cWfpRYca+5WPxJr9pkQmHzrK8eYc16zJzgjJ1iBkiEaAoiEPqBSfmrH3N6aFmAnzsh6PPFifACTFL6TRQnS0acByasagxNvmNZajNUztZWZezH5Fjkxqsv3/Rb7VjdyJ/N7Nb2CDqKY2+OSi7t9CEMp2ncJg1MqdJ1iuSiUOsWIrmMoSJcHed8pSDTC7bj2vNqJSwDbvXNtS+dQEZv0eiCXHvbNMygZY5eUJAV7/PKEyUeq1xnyvzN/6x3ibvQVFlfBY/Ucgef0SZ+5kXkOX+RCcswfyh17rCfer7QaVkgmn2LrWbFDNvZJKPgSoGWQEh7lj5Qz9QOVUKasLuFAeVel6vGpbtaboV3A6O6wLkBH84Iq7ZOSYl+sTAbQav4MBVbnk3CkQ5p+olHrXl/DVuK6gLQjxmzoikob0vfQvcALdtAI6RaTl7iDKlob0RbHeWT4eYD2Ks/H7YdJAz5vydl/P33SAqPiFCKErD9gsWp84yCsGv4latPcS9M8e6yDE+M05cg6ZFJIIH+NpJ5RyMJ0SLMux1qV1ruxw7KnFon3Wye5OHBGVIBASnoE1hzzzARLdA4mAx+cw/8czZAkqualeln/Vm7foSBxW8QJz5Q16G5LfM1dkFrNvbeB6ctwsmm9occooeDhl8c9GSCSkj2e8YD9sRYVosF+kmZycUWQle037hK9dywqqYatyZCd3N+1UBgm9FZn0yj32kzs2VTqXN/ohL239hlTBLLxWGxl7k6+9OonkyXkRxjZ2rgtUb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(346002)(39860400002)(41300700001)(2906002)(86362001)(316002)(38100700002)(478600001)(31696002)(6506007)(6512007)(53546011)(26005)(966005)(71200400001)(38070700005)(6486002)(122000001)(5660300002)(54906003)(6916009)(66446008)(66476007)(8676002)(31686004)(64756008)(36756003)(83380400001)(66556008)(91956017)(8936002)(186003)(2616005)(66946007)(4326008)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THlxcTQ4akM1Yk1OcnpkNkd3SHljYUxYVXpZMzRqbU5ZVklHSzA2b3FKVFRF?=
 =?utf-8?B?SDZCYkpQTmxtTVJzYWhKMzFLNDZ6Tk5Hb0h3QVhGOHM4aGllWXVSNjdYc05u?=
 =?utf-8?B?NjA4ZWN2eW95cnRoeWZZTXBQQndGVENsYzNpZkh3aEI1SWRVUVR0WXQ2V3Z0?=
 =?utf-8?B?UzVuUkVnalVaVmRrSzNWSDhRb1NrMzhNMHNyYVo2NERKdzMrTzh5S1p4NEZw?=
 =?utf-8?B?VGV2OW53dFpaenNaRFQxeWZlK2NCYzlpNVJTYXRndEhnTlA4SUtnbU9UT3Qx?=
 =?utf-8?B?Y0Nhem13TzRlSUxUZUFOOWszdlBEUlNPOHJHblFHWStsSjJTTmlaeTMrUG1R?=
 =?utf-8?B?c1hVZjdaRi96YkJ4WDVUODh3RUFQTVUrdXh5MVJ4NlM1Y0VZQTRsK2d6VVRk?=
 =?utf-8?B?TFdmTEsrYXowMy9ZZE16VWIzNGZMaXZEZTNEUUpha2dMbWJYNVF1N0J1MUxy?=
 =?utf-8?B?aUJHUHFXTUR4K0owUjhOMXRKMkJCQ0VsUlUxdm1xNWZXbEp4cDZDZmlIK0Mx?=
 =?utf-8?B?cGVmS2daOHcyY2FrYm82VitvOGg3L0ZOZEZHWks2R1hOWDFzRCtDL1l1ank5?=
 =?utf-8?B?MHlqbmZOTFYzbGNmckg4WUk4c3NCaEZHcDJGcnZGTWs5Um0zSnVkL1BQTlNt?=
 =?utf-8?B?SWJlUUFSZWhCZzVYUXhPMlZsWS9GLzczRDRiT1dDZEdSTEs2QWxLVTA0SURy?=
 =?utf-8?B?aWRCUUY2bHpxN0plNHhoWlRkYUxtWEk2ekRLdXlPcnNQMFR4SGZJY2krTWU5?=
 =?utf-8?B?U2JFT3hqRXUwV3BPdEtSYnFhMTg0Q1luR3oweFJQc0JzTER2UEZjcnBzeTFS?=
 =?utf-8?B?Sk1FZG9FVWVQQmhrejNqaWE3TFJYZWtuS2dHR3JkbmxQS0RHSXAxamhNbHNO?=
 =?utf-8?B?QjZRZmRkMmk1Tk9MSGdORTlCaTlMbkloUUlDTFM3UkVxSzJ4WmIvWTBWa09a?=
 =?utf-8?B?VTR0d0htWGNRSFlPTnprVXZYOTRRcVA2aUNvRFpQbWhxSHowOG12aDQ3N3p1?=
 =?utf-8?B?SXJONC9IaDZFWFMxUjVhdmY2M1NNVnptSlFLbERHTm1FUHR5cWo3cEErTHdX?=
 =?utf-8?B?NnZiNWNTbkh4MXFkY2ZhOU1KT1h4Vk5VN01idkdGcTNRb0tTb2pzcUFuajBs?=
 =?utf-8?B?WU9qTkU0OFlGVjVVNkZjV0Q1N1YrSHhCUHg5dHI4eG52NnYzVGJQS01FWFRQ?=
 =?utf-8?B?UXZ4akVYcVVYSVVZd2dMaXI2UFNEcmxLMlUzMThveG5LZVFUR2N5RGFSOUpm?=
 =?utf-8?B?NDBFK2VoZFVpUk5kUzNGM2dqaEF6ODFxMHNnUk41dkEzQ0JaandmWDdaa2w4?=
 =?utf-8?B?dHZRMXNQY3JVZGJnWENJNWFNTFhVQ3RHVUZYWFovYTQvRCtyNTVaMERTakZD?=
 =?utf-8?B?d1hTSTMxMGoycFhSKzhEY2pnN0hkL09pS1psN0NnSmprTHVyazJOTHRGUnZa?=
 =?utf-8?B?WmFMVHRSRFJLSDFTSFE3SDZ0N0Ztd3hxM2tTOWxkZ0hESHNxUk9ZMHFsQTdE?=
 =?utf-8?B?V1JabWpwbTM4ajdKTzRtY3p5TC9yYjNwN3lWdm10cHJCRWtPTVltb0NjcUNH?=
 =?utf-8?B?dVRWUnEwRWU4dk1CWXdxeENqOVJ0OTNubVRvSkJzTUJtTEdNNkdkQ2tONEZy?=
 =?utf-8?B?Myt1V3VMOHozWnZVTlpnNzB3eXB0YlBBWGdNZ2RRQ1YwZU1waHgwdnljaGg0?=
 =?utf-8?B?V2lOQm5vSHBicHJ1QW80SnM2dkg5cXlVMHlZcWxvOWZCTVpuSlJyNEYzc3My?=
 =?utf-8?B?eVpVdXlYK2FYVW9iR2VNcnZTeTlyQnlJTHVPUEEyRTZORmk1OVl3M0hwa2pL?=
 =?utf-8?B?MHRjWVR4dm9KN2R4OVZGUHFqODVWKzFJZDAra0VKMTlCYWJNL3dCWkh3Q0Nl?=
 =?utf-8?B?L2pWNjFPWEp1WUxPQjh4MVMveUFWeFZ3SVV2SEg3c1FYYlFHdkxQWitBSUda?=
 =?utf-8?B?YWI0eU1WUDVwdGJrdUhkeVUwR2R2MUhuQUk0cTZFOWxMN2hreU90ZEFwUUVr?=
 =?utf-8?B?eHJFdEd3RWpCcGQ2R3JtS3FVQW1lQmxmeGJnb3BWN0xWOHZzUFJhbWp3UjQ3?=
 =?utf-8?B?Qi9rWFh3aWNodGVEa2FLeFpZVE15WHRUL25tRHM5MWVKZjNtYmxRRzZDN2d1?=
 =?utf-8?Q?UkcgchvmOYNGJAcs9FyFAHFyE?=
Content-ID: <995BD8C15AFB924C9930BBCC7BF1FD8C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a28cc6-c6e5-4b61-fe23-08da640f4ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 14:03:33.7778
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Kp+3uDrv4tRCnuAT2c/3QRadxvL/EMKVpXqa2f2EwD2xtNX18w+8qONJISKS/0yhyi1j/6IYsI4Q9QiJW2S07ZUtovv6TYj94JSPLN+jcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_070343_540103_CFB33C4C 
X-CRM114-Status: GOOD (  22.83  )
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

On 12/07/2022 14:53, Yang Yingliang wrote:
> [Some people who received this message don't often get email from yangyingliang@huawei.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Switch to use devm_spi_alloc_master() to simpify error path.

Hey Yang,
Thanks for trying to fix my mistakes!

Forgive my innocence here, but why is it okay to remove the
spi_master_put() in remove() but not the one in the error path of
the probe function?

If the devm_add_action_or_reset() in devm_spi_register_controller()
fails won't the same thing apply to the probe error path?

IOW, I think this patch needs a fixes tag too b/c it also fixes a
refcount underflow. Please correct me if I am misunderstanding.

One other comment below.

> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/spi/spi-microchip-core.c | 20 +++++++-------------
>   1 file changed, 7 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
> index c26767343176..1a24e47f8305 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -513,7 +513,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>          u32 num_cs;
>          int ret = 0;
> 
> -       master = spi_alloc_master(&pdev->dev, sizeof(*spi));
> +       master = devm_spi_alloc_master(&pdev->dev, sizeof(*spi));
>          if (!master)
>                  return dev_err_probe(&pdev->dev, -ENOMEM,
>                                       "unable to allocate master for SPI controller\n");
> @@ -535,36 +535,32 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>          spi = spi_master_get_devdata(master);
> 
>          spi->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> -       if (IS_ERR(spi->regs)) {
> -               ret = PTR_ERR(spi->regs);
> -               goto error_release_master;
> -       }
> +       if (IS_ERR(spi->regs))
> +               return PTR_ERR(spi->regs);
> 
>          spi->irq = platform_get_irq(pdev, 0);
>          if (spi->irq <= 0) {
>                  dev_err(&pdev->dev, "invalid IRQ %d for SPI controller\n", spi->irq);
> -               ret = -ENXIO;
> -               goto error_release_master;
> +               return -ENXIO;

Also these can now become dev_err_probe for further simplification?
Thanks,
Conor.

>          }
> 
>          ret = devm_request_irq(&pdev->dev, spi->irq, mchp_corespi_interrupt,
>                                 IRQF_SHARED, dev_name(&pdev->dev), master);
>          if (ret) {
>                  dev_err(&pdev->dev, "could not request irq: %d\n", ret);
> -               goto error_release_master;
> +               return ret;
>          }
> 
>          spi->clk = devm_clk_get(&pdev->dev, NULL);
>          if (IS_ERR(spi->clk)) {
> -               ret = PTR_ERR(spi->clk);
>                  dev_err(&pdev->dev, "could not get clk: %d\n", ret);
> -               goto error_release_master;
> +               return PTR_ERR(spi->clk);
>          }
> 
>          ret = clk_prepare_enable(spi->clk);
>          if (ret) {
>                  dev_err(&pdev->dev, "failed to enable clock\n");
> -               goto error_release_master;
> +               return ret;
>          }
> 
>          mchp_corespi_init(master, spi);
> @@ -583,8 +579,6 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>   error_release_hardware:
>          mchp_corespi_disable(spi);
>          clk_disable_unprepare(spi->clk);
> -error_release_master:
> -       spi_master_put(master);
> 
>          return ret;
>   }
> --
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
