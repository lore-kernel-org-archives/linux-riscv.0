Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77443C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 12:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjE9k7moM0pLLIeOywqw5GnCH4U3SWy1MByJK+J4LcQ=; b=SXh7zkh8mETP42
	3pFYCdTV6IS2IU7oeKrottUD7A9V/EKM5P7djRQ0clwVbRhnCZ9ufr8ppCo0ptWVzq0ThdoqXBqly
	2iV8RRkk37dtHCiulS2zWce07k4kUrDSRtRkTRKMjzwv5SbQKHNs0ABGTtgmsI8jogganONZ6OhQQ
	fIqMmVW9EbSVBo7BGq66iy1qCsjLDQELsOKwR5hJn0Oc/hOyA7e1zwGlzK6/zna1wW3KuIbXpXlq9
	q/B2NOkrvyum96m7B1T9Gc53mG1R+LoJD9vWpTn8sXRNzApJZlPUt0mH7OynTPDM16t15p7jdMcKK
	q3/h8uUS/gbSfiLkx0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Riq-00ELo7-2A; Wed, 15 Jun 2022 12:02:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1ReX-00EK5C-Ey
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 11:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655294260; x=1686830260;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=EE+kpvIOpfMoKkfDccWIEyjvMG+xL0WToFuZoQ1xSAw=;
  b=TcvnuO1WIeQb8WoumMCQwfeKTE7ROIgA4G8Mh99cPEapdUXR8d5eFeFt
   X09KGAaTYL3+O+I6qfKTvtmJDHPe0lkJnBteyvX2bxyyR8og2i9P8b6TJ
   XF1RAMlZIVSzSwL/n+dHVmObs+kgo+ir1HvtsTwbnukIfP4BqbEOgaBtZ
   ZzsA/0mmivVFDUoVw+W+73Fywqn1k2Te9xtc+XK+I2pm7FgU8NmDZwxdV
   c8EznUju0Z2bYfGxuKd61q/7bgxh2SI3LPoA5vxiDdyv2rTiEuI31AplS
   e+WJ6b6FIPfUzoQWtcExJHqgZN4BHI6szvovH6ydAc7ez7E5joLyUaTFK
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="178050111"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 04:57:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 04:57:40 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Jun 2022 04:57:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QN0OCuM/7uGye9fF7VDVdlIVvkuAQDn606rERt84GsSH5tSrW7m9RmXJSjnOkQrELsL3d9uGnw9ASbid6qeWfoF1cA97djLFSmEB7QTtBj9U4X3F6tk8jk0aB+eeJY0SeUhGswdh2GMgRN1phmnx1kLDQ7pY+CGt+f0/RlbqDAEmzaH5Xq3KQZBjhLLDQgmlaX6BiZpvvuSEhTtjvtMtPEU7DsudvJXHVmcx34kavK7kHApKHX1S7hbd63WZfszP/nSD8gpDF+kS68qY2yg9L/ZfUuNd0zwMKwTU16vnfbbr2rgZk3BJyW7hMScI+W8alC+uhThej1MCqi2REVizWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE+kpvIOpfMoKkfDccWIEyjvMG+xL0WToFuZoQ1xSAw=;
 b=dAr3hrcZRgTuFm3BiIkzEUvBan6vDI+lztZYVRIik7rXHf4UhvxQD9erIFlhu8lHMD+Rv4X16zMhvo+0zKwY7xEZp82Vr3DvXxOSgIn4v1+5FaEBOeX995JaF6r8QD08wrSgsKI7+gGAtf++vXCxMazWdffwRbwz0UIUX2RK5/ppF4bt3J/MIKzJtbDpObVpRlBHa/2EE1V3m6WMrrSkuJT0KqxLxLuhrr/YLxKcmkp93gs4NdZPqXUbYpCpyDioyUB2ywIK18/i4hE/d1b8SNggzeomBVB+okTNLrhjDzhkYQ8SSGAAc9Bs4cY/0M7/zTlPRaoRS8WjPma0UMxIxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE+kpvIOpfMoKkfDccWIEyjvMG+xL0WToFuZoQ1xSAw=;
 b=eyRn00vqnAwvAHnMVVNnkwYmSsJulvApLxfuhVz/vXS5rBxbOAvBxeS7SfP0L3rnhSPe61B6CsReOf2TTfKQAx5P6a9fLfDmxLguQiLSxhmi4E1NEjdFILxo3hsJkutTh8F02qTCkZethS0U0nQI+dOwdQRSDLUgTvE9Zt5KkeA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5723.namprd11.prod.outlook.com (2603:10b6:610:100::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Wed, 15 Jun
 2022 11:57:38 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 11:57:37 +0000
From: <Conor.Dooley@microchip.com>
To: <broonie@kernel.org>
CC: <Daire.McNamara@microchip.com>, <Lewis.Hanly@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dan.carpenter@oracle.com>
Subject: Re: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Thread-Topic: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Thread-Index: AQHYgKu0NnUyv6HMX02qK3OEv15VZq1QWBQAgAAEXYA=
Date: Wed, 15 Jun 2022 11:57:37 +0000
Message-ID: <7eda95bd-c7f5-767a-fe88-9f7109467cd8@microchip.com>
References: <20220615113021.2493586-1-conor.dooley@microchip.com>
 <YqnFLCbvrTxNbG1+@sirena.org.uk>
In-Reply-To: <YqnFLCbvrTxNbG1+@sirena.org.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eebc063f-4eec-4330-f765-08da4ec63e22
x-ms-traffictypediagnostic: CH0PR11MB5723:EE_
x-microsoft-antispam-prvs: <CH0PR11MB5723B16B43EAB1343736F4AE98AD9@CH0PR11MB5723.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pUGd9izrpit3zOznFgA0O+l5Sgk/NTEM4tdZBikJizLyTIop3pZrFddmEiqgWPNrqYUn/wZXvDPnXmW0CVlfzrQPolS4dfUHt6panxESUp1dVDqTIgvcTV/uYO27D3YNru4np0U1qGT59EqIIWsdY/TcJ4qCOv1yK/cex2xm3QQDERYrYM3NVfiMNAnKpPJs32w0z32hbauB8voh6lf4oUH92aquOVpWO97TeEUewWrjYwPivta0/UPP1UqHwGMywakdRB16vDEYsHCoEr4p4egWiw9fXf8TWCTPJAVRn0W0a0DT41OxIWtam4i6CeHAegfwPBZtnMGQ3LSqIRPmnKjNuyh7fWpPu3diNq9chusWJe/T+9QG0xEdAwGa5zuyhhR93lO0E+Ea+f5VLLDFR9phXX8zaWX5+grBm3VxQ7ZbTSfznIyHb1vWjUSIClM/AMXA7j4gaED4bGfwaXcUUacZ4SgQTQP55WodQYoPvwML8nHegjv0NvYquuKfelvH2zajY9IB5A626Z/WwcVz+e4dNkZXfR1t9rPSOFvE7LCprCcZ8srfaD9HgiI22rajRjNCiS0su6sz5NhEDmspAqUewMYewhJigcaK8/D6aIbzs56LiLOvQfchcqVt58NqXDOP7bcQCoyeQY5n/GqGouCZf+A8zKfjm0T0FF7PTvj55gDBl+5H1qfoCfMlKCA1mgtuEi5WK7S3pxursor/TalN31XDOukKs9TEcu7cGTtYpTJH4duHYs8jA4vSJjpTgWo4uI4HpXmCgXVQC+b5aSNd/VzZ2FwbZm9vAJXfOiVYflNeCzFCmGBHxj3o+JESa/yycJm/FOmEPTJiJ2YrlQGE9Rndh8Tq1RKbL+dcGlU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(186003)(6506007)(2906002)(4326008)(76116006)(8676002)(4744005)(8936002)(54906003)(53546011)(66476007)(2616005)(64756008)(31696002)(66946007)(66556008)(91956017)(26005)(31686004)(122000001)(316002)(66446008)(6512007)(966005)(508600001)(5660300002)(71200400001)(38070700005)(6486002)(86362001)(6916009)(38100700002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WXo0UElCamkvZWlzVXp1TGR3K2kvb21xbTM1TUZHUGFINFk1aENjTkxjOXQw?=
 =?utf-8?B?aDdURStyYkFLTHRoYmtkWnB4aHBpV0lqdGs3MGlxdnhYRk9sc0Q1Z2J5dmwx?=
 =?utf-8?B?YWMwQ3BpMmlDSDIyTFhNWUxDaVBoUW12Zm5uSlNaUlg0MitDM3J3R2wzaUFw?=
 =?utf-8?B?UHpEN3BKZXJwWHdUWDIrWmJMQmcyVWJkYWpvUVVMN2lhM1Q3SGh2L05TdHhk?=
 =?utf-8?B?OFlJb1ZBUUV6K2lrMVhDWkN2UzZvOUpPdDZhTExEaXVIOVFveUJiNllyZ2xq?=
 =?utf-8?B?QS85TWRRZlVJdXBkSXRZcFIyNThxbUJKalo0alNrRTh5bUdFWERBTGxscFFB?=
 =?utf-8?B?WWRLMGxQMFJnaVIyaU82UHQ1YzJueDVnZE4rMExaWXFJZWxjNTF2Z0pIb0xr?=
 =?utf-8?B?am1FZGRRalRTOVQ5eDVjb1I4ZFBLOHVLbDYzS0JDdDMzWm4zdWpyRFdJcnlZ?=
 =?utf-8?B?MU5ONmg5bVlCRGtDTmVkT0xUbmlVdVUrU1paZUlMdVdYQzRxbW1XU052Z3lK?=
 =?utf-8?B?bWF0TjFhUGl4dnQwcUUzZUxDWklvZWRGbnNDc2tIa3d1akNERitNYzFGVTNp?=
 =?utf-8?B?ZEQvKzBaK244ZGhqWWFvbkY2QklzSmhaWEI1cHFsQks5T1djZnY2UlBDRis0?=
 =?utf-8?B?SEtXbFhoM0ZVc1ZMWXVzWGYwSzJvVTJveWpHSjJlMWZoQ0IvVm9Pd0NrcGlV?=
 =?utf-8?B?RysrTmk3YzFrVU40N0d2K05nNFdDdmRHKzhlWGVjRkVDaitxOFJMcExQRjI5?=
 =?utf-8?B?TWZaMTdyWTJxWWhhOCtqMGZWbGF3ZXVlQi9FNWFkWGx2SjFoVjFybktnMGZI?=
 =?utf-8?B?a0VBeTg1bFV3OU9mM2tSMkE2dUFoM3VVOGRDNjNtWnpqZitZVmVzWlZaSkU3?=
 =?utf-8?B?SzhkQ3FGa1hYejJYcU9aVzNOL2VqSXE3aTdueU44K1ZaNHRyaVY3c2EyWVZn?=
 =?utf-8?B?bHFSa1M4UkZyRlFPNm1lZXRVWE5tWElXcU1UVjM5YkVnaFNrVFZLakN3ajA4?=
 =?utf-8?B?enBlOHF1YlNsREhZTWZYY1g2ZnVHYnFCQndzaXhqbmJ1RlBjaGVDZXFVQzNY?=
 =?utf-8?B?Wk5DVlFOK1VkNXdYVTZ2ZkVGaHl0Q1ppM25HZmxEbDEvSmxwZk5VbW50UmZv?=
 =?utf-8?B?emNJNHRRMGx6Ry9Ud2U3L295K1EzNmh5R0hyQzhNeFZ2UVJpTm9hRTNDdFY5?=
 =?utf-8?B?WnlVcWhUM3l3bEVlaUdya29sZ0F0amRFekFPVHRVM2d1enR2OXhnZkllaWtj?=
 =?utf-8?B?L0s0NjFGVXdOMk5XT052R1RlNjFuMDZLUjVLNHpHN0wrK3NQVVBZUElrM0lq?=
 =?utf-8?B?ekhhMDA4Qjd4OWJSM2UvOGhrUG41WitDVnM4MVNDcFhmZjBCZTQ0MkdyS0tO?=
 =?utf-8?B?akRtNVEzTVhzdFhtRUtySkljWFMrTzVEM2dXdU5BcTNhYXZMbmw4TS9aRkMx?=
 =?utf-8?B?dk5QQzRVeVB0blhQdDliYWZRdmw0dmRrUFR1WU9PSFBVdWFSZHppaTFiWEYy?=
 =?utf-8?B?SG1zUlRrYVNheENXNjdXcXpIUHBVS0RibjJHdmhBZFhtcjQwdm5FZDJiaE42?=
 =?utf-8?B?R1VmeE5scGFIWnFpZGFxanRIbksvZ1pnNlNXdW9NRUxvYi96a0FTOTRnMXhI?=
 =?utf-8?B?Q0VHQWZnK3pZRWRTQmd5cGcvV0xuTllNWTRFc0FmMjJCRWxycE5aaGpxUk1w?=
 =?utf-8?B?RXlma2lBRzV2TC8vUGZYQ000TkxldUtUV25zbjVYTEFyZWtrV1BsZk55Nloz?=
 =?utf-8?B?blJTN01XUEtOalk5TjAwek9od3Y4ZDJzZlNFbXI1NStnNDJwcnZnL2dNS0V4?=
 =?utf-8?B?eGs5aFZnWVBYSHdzTlNTWmFpd0tCT1BCcC9rSGVnaHlUZFYwTWh3RXh6ditK?=
 =?utf-8?B?ZUkwMVh0dkczY2h3RlpYYTZkMS9mM2dCc2JneW1ldGxxeGlmak5OVlFycHRw?=
 =?utf-8?B?T0d0ZXV1SDluSWZKWWNYSUFkSW1ZN0tCQkNoYjJUS0llSmEwMGN1ajRqVTJt?=
 =?utf-8?B?Y2hKeC9raEMzdk94OXVvTlhwdit1NWxuUlVweXNMWTJHM3pTeEVQWGM0VWxZ?=
 =?utf-8?B?ZzBHT3N6MnFhWkEzb1I5NXdJMmlHWjRpUFl2dGpZalR0cXFyRThBZnVRWjM2?=
 =?utf-8?B?V0FNblYwaCtSdEhQbXp0YVpMdFFULzJTVzJpS1VnRFpKZ1FZNUh0aWg1MlBQ?=
 =?utf-8?B?eHNBSGFMTEN4QXlBamRFMlM5Ykk1d1ZpZlQyYU14dy82N0haT3dLVWFrRUFK?=
 =?utf-8?B?NnIyMEROTlc5OXJDN1Fkam1nYm84RURseDdNK2x5cWRHU0hQZjFLbDlSMVZF?=
 =?utf-8?B?SjJrbmk2WGM4NlJwOS9OcERlYnZKRERWSVpkSHdoc3lHOFRWa3c3dz09?=
Content-ID: <8955B76780E21B4AA14AFAE9618AF07C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eebc063f-4eec-4330-f765-08da4ec63e22
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 11:57:37.8847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SYpyFiqKGa+RCQz28+b3Spw+k6/fV7Spf3MHWhG3HWHW+jlQmZKtzfpLoc6ImP4KTuI6i8B6MXOeqdRkWPkxmiqzvHHAMyL4H2muSBvEu4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_045741_555429_026C674F 
X-CRM114-Status: GOOD (  13.96  )
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

On 15/06/2022 12:40, Mark Brown wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Wed, Jun 15, 2022 at 12:30:22PM +0100, Conor Dooley wrote:
> 
>> -             ret = PTR_ERR(spi->clk);
>> +             ret = !spi->clk ? -ENXIO : PTR_ERR(spi->clk);
> 
> I think you're looking for PTR_ERR_OR_ZERO() here?

Maybe I don't understand, so let me explain what I think you're
suggesting & maybe you can correct me:
> -             ret = PTR_ERR(spi->clk);
> +             ret = PTR_ERR_OR_ZERO(spi->clk);

But if spi->clk is NULL, this will return 0 from the probe
rather than returning an error?
If that's not what you meant, lmk
Thanks,
Conor.

> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
