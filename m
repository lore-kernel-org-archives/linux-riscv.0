Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DAECC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BH2YG5WczTF4XbjxiiyjiHO1GeE0Rg2TnC53QN9J6LE=; b=YhpeO4VuQ/3Owv
	uAePOgzr3TGQzSmTFlacIwPRulRp3W1KC+u9ox6kOU01DBj60+uvJvid1og89bDyQs315WRYLrEYC
	AJSIC96jUwCAlcOUhpIPjQA1BgNF6JYLr01OTcS8m0VwzwKGhoAb75v/2wuH5hDQCH/qPP7c0gjrI
	6BjW/cb5S2vLAdtqmaQGVucvUwHHCfnAnDRBU1TTtM+ydVM8fHSgtSR694cfR2G9J6HnADfGdmX8z
	+AW54NnqjeIwj8qbVaehbJGfrU4zyCblaXTgHoONW2bpeFbWWhWuEfh7+T36eV0HJfmvgz2LDgdxL
	jHULv+gE/iZ0QtMzeTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3D40-00GyUY-WE; Mon, 20 Jun 2022 08:47:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3D3x-00GySb-EP
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 08:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655714833; x=1687250833;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=PRKe2mFf2/0jpsQlQp0YkYzaobK0MvgwwQ0WU1ehzfI=;
  b=eLNpYpyMLSKN5C1Y8vD55qKneELN5WCw9SftqxqBzAvA4UqY/0FYWkhd
   S9VL08r9RQGJVxRGMGT3haQlBVO5Lk9Lznvk27tdwgrVQSYDhcdctkTz2
   3Y4ISKFn6wyaSV6eR88fRlGjgnc1+0huBMJC4uoiCOLnkN25Jg9pDkmhI
   1H5UldG3nrSlUBOZ/5ccbjEAsj3mv4WZh3eLOEUoBBT0MNAl8l+homONA
   bBjLFx5PQ8b0or8V47XIHHOyAxzZp5cWi5WBZ8CLQwXQ05l69Kfa4FZQh
   wwn8Dyl9jXjn4GPpVRdIlFmFXPAJiDGsxMVKXFT4ySv51fOymNy8RcSFo
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="169079558"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jun 2022 01:47:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 20 Jun 2022 01:47:06 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Mon, 20 Jun 2022 01:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbEqW3zVBNSnbUNGBCH00dtjqcyJ2e/XojU6RJzV2M/YaPX9JD1MnQWFnM3jA07AN2bBNpS7YG5MYYZiswfREB9TWXsFa349GRww0b1GPVp+vChHkoVvnNPLVhnasd3dU+BJi/okCUENgx5fkRLn1MU7RLuKLnPhjSjTdJsBcF7GjDdPnaamkYvWJrwaOXr+OsZkso13QdiLSZKJsgY+ohoE8H2KBngo1/ka8U8lYwJ3I1VAdzq1ZIelL+KtPwVTnsFP15/kmfTdsMy2YAOg2nZqlSsgf+dwAo2z3mSNcoxEFGOu/sdTseI5SUYA4Sn5GzDAhYEjwFZEY++4oQoaSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PRKe2mFf2/0jpsQlQp0YkYzaobK0MvgwwQ0WU1ehzfI=;
 b=gzFQ8n9n7Zlra3SvBXoNTQc1Qq6A7g/G/sctZGdz7vkCqLxjcw5m4VvsEbhY9BC4lWHAzbIHNpcXgsAH6qN+o8VTXl9wv/8FTiLWjSzQLzeKkLvdb6/MFlE2g44YYQdFdL5iN4fMjkTmtEw3uHvnLaaECLpMM4jsjDxU/kTSacx9mIX5EONBee5fS/PihgXkNnw8ejXl94IYtBBy5Bp79nZla1/q8ROSWq6D5OXm/tIgB9kuceSlR986lEl1N/d+1JlA1fU6iQy3sVhLIvSWX8xQRrFDHRnciU7MMN6aa6thcCjDGCjl3ZE6LhMvgeq07siRaHIHYkthfEjiMVLlog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PRKe2mFf2/0jpsQlQp0YkYzaobK0MvgwwQ0WU1ehzfI=;
 b=ftv0910CsZyxjJcXWEkVxoYlTsuokIBL4jcRUQphLbkq/VOqcj3DakZUcT0QBpZwc3Pxv3KeYkBlbFw9D2J42qvdlYpeotfxH2WxJO+LA0eUDEWlVr2ujwA760xXg3LjsjdEAO1/64k9kMDlk4uElVq1Ud2FAh9Y9xfxRi0OfXU=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN7PR11MB2545.namprd11.prod.outlook.com (2603:10b6:406:b0::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Mon, 20 Jun
 2022 08:47:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5353.020; Mon, 20 Jun 2022
 08:47:03 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>
CC: <airlied@linux.ie>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <thierry.reding@gmail.com>,
	<sam@ravnborg.org>, <Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>,
	<lgirdwood@gmail.com>, <broonie@kernel.org>, <fancer.lancer@gmail.com>,
	<daniel.lezcano@linaro.org>, <palmer@dabbelt.com>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<Conor.Dooley@microchip.com>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <niklas.cassel@wdc.com>,
	<dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Topic: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
Thread-Index: AQHYgw+Pu1Tn+/2s8EmHi9NhXNIv361X8fCAgAAMIQA=
Date: Mon, 20 Jun 2022 08:47:03 +0000
Message-ID: <effbd3b1-2d59-c0b2-fb88-215d2fc6e244@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-7-mail@conchuod.ie>
 <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
In-Reply-To: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f63925be-d3b0-4fad-47f9-08da529972f8
x-ms-traffictypediagnostic: BN7PR11MB2545:EE_
x-microsoft-antispam-prvs: <BN7PR11MB25452F837E2ED725BBD6C5BA98B09@BN7PR11MB2545.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W6VNlMX1qCK6LJLHLte7HZvbUoIyyi+oVMUEPZoGisuHOnRN98/wrLhU+IpD0JhO/2A6tqY4X2h35Hcp+Dszq9CTuKfPol1rKxeDwAmdNUSEdh9ByTEuRGU1UwijApd44ecPRklTuHlo+en9wMWQmf0AvUGHiUVOh8FGIjngzCzIRN3Nh4CjW59O3DqhBX9yGAlClAzUFvkZnZhqhCPiXGGNi61ZzH/IufvdcYuk/GiTB1JlE9NI3EZ1UuwyEAwDe4HySnBn3aSM0pVxkYq7SwB1njaDye56qfdZSBqfzFqaawLZm+ZbIRKP6t+XNEJXs24ohSgT1xn9a7y1+hL+IMpJvG0LwanxAvWHJLAiaIy4+mrGbsQ0SH76vkLGP+Hu061jG1+d/TBHrLK3UKVsOUv9sKqJDsZIJv3TQzV5xtrF9MnNBB/GX3CVz4R7Gm6rPAd2U8BaIhTDLjJOX+0uup9IhM4QRQ/FLb7Gql1PsruRggca8+JCmjR9+08bvE5/3+bMTXq9QKkySVKVSNFAq8JDBQwRh5qOg62Pflsxs7xvbBr1TctR1WucgtHBZSwfhZsrihaRYVK9FUeDH5IPyYbGLR+7Lw2VwuUFygOJ2scZwu/JA30e7DLOnaS8a6UR5nH6kultr+hhEkP47qSRS97tCx+UIdHEsel1uhqSI3ABeGiFScryomP+c3KvyPFs+XJdhwOonpTnzCkeeWcoOUUrLjgAYBkjgtiAjx68PoAd37N6xzNHbW0OAp1rVc4DwF9YAmTnUSaBCb3d7yiq8A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(2616005)(64756008)(71200400001)(186003)(36756003)(498600001)(6506007)(6486002)(66476007)(76116006)(31686004)(66446008)(66556008)(7416002)(7406005)(53546011)(316002)(66946007)(5660300002)(8676002)(83380400001)(26005)(122000001)(8936002)(15650500001)(4326008)(38100700002)(86362001)(31696002)(2906002)(6512007)(6916009)(54906003)(91956017)(38070700005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGFOSThYQTQxZTAvYWg3MnpwbUhrTVM5MnVLZGNPYmI4M2JLaVFXYldnQXB6?=
 =?utf-8?B?WkQzZm11eFdxUVlYTHowakpUWC9CWi80Z1Z6RXlXOC9XU005M3lTSFFGbGtl?=
 =?utf-8?B?ak04SHZnWlJnaURza3BOZmVFTFZ4a1RkV04rNzVrUExYVHAyaSthVzUxNmpR?=
 =?utf-8?B?bDRFeXUxSjRBcEcweUswanJ3Vm9lRlZyeC9UQzdYbjc1TWhjQm9SNnNFb1JZ?=
 =?utf-8?B?dlEzSDVPOFM2SE9QRDZmaU9sWkFFQnRnMURIK0Ivd2V1ZG9Rd1lac0ZEaUZC?=
 =?utf-8?B?U3lhRjZIU043d3VtTVFIbkVKTld0ZFpkZTNGNU83V2FpV0g0dFFyeFlhNHFT?=
 =?utf-8?B?TUUwbHdiQzJaaHdVUERyRDREUmVFTUZHZEpVaERmaG5RVC9UQU9JTHFoSnRy?=
 =?utf-8?B?OStISitZSDlTeGk0R2ZGS2JOeHFMazNOQlZLU21meitXRWZDdk5pSHY2dld4?=
 =?utf-8?B?MVJtOEZoSWRVenVKdEpHdTNkRitrQlZNTjdmaVhtQnM1ZDhMSnN0M1VLZkEv?=
 =?utf-8?B?Qmk2dGczcGoxM2lJTUpZcnZOdXFTNTVZVnAybVZiNk1rZVlycFhPQjJjK3Zh?=
 =?utf-8?B?b08rNjBBVHBKTUpSOTZoc2NDZFErdU1IYi9Xc2ZLckN5bnJjNkozakFVZ3BB?=
 =?utf-8?B?R294RzF5M25YN094czdhbm43R0lXSURNd1RITDFrQnE1VkxXS0lGeFl2czdm?=
 =?utf-8?B?VEx6a3FhM05vN1NIZm1FcENEbXRxNGxNZEFDSGRDc2NzcW0ybEdvcThZd1VC?=
 =?utf-8?B?dU04SWxhYmV4V3pHWmlUSit6L2dyTUVhNWluaE5ic3M4L0pmeVJ5QjBvbTJn?=
 =?utf-8?B?TWFOZVJtQXBDNzczN3l2R01ibUd1cGRwbXpSRXJPcmx3OUlnVmxiZXZHcEkx?=
 =?utf-8?B?ZW9tWHpGQlMvMFdrak5LRThQQi9XQWYwSEhvdDFhM2lRemZXZkt5cDdnRDIx?=
 =?utf-8?B?T01KRXdwRzJnSjROWGdsK2RybFR3Z1BkclBudG9zYk9JN0JzZmV6VC9oeHo2?=
 =?utf-8?B?ZTRCQ3lNZHAvTWdiMlJqbG9YU3ljeW03MG10SzlXZGllZm83V1kra0hCWThR?=
 =?utf-8?B?MmRFNGFqOTNjSkJlc1p5czZKdDIzdWtXMXl5YWlxbkRxOTZiS0s5eHZVSFQ1?=
 =?utf-8?B?YXZod3Vid3JMYWlwb1h1UkF2MkNpbUVpVVhMNnBzSG1teS9rRklPOEZQbVF3?=
 =?utf-8?B?MDR3K0VHS2FPNWpoWHhwdXVuWDlhOG5GTVg3QW9qbkxIWTNYM0FXLyt5L0Qx?=
 =?utf-8?B?ZzAxRWVpdHBqK0ZkUHk4ZUtWZit1YW5JZldhTFpyc0NHQm13ZlYrYUcvQVlJ?=
 =?utf-8?B?WmFXMDNSaGxSQytHSW1CMEJPNTlmMDAxN1ZtMFpLRWdDaVdFR3J2ZU5Md3kx?=
 =?utf-8?B?dm1IU1FyNXJDMXVFQ01aVGxaSFVGUC9sQ1ZNekFhQXhtb1Fiamx0eVpaUWhI?=
 =?utf-8?B?UWF3UDdiYngrY2ptSHJXdHI3MTRsL2FvUWpNS2VMdkp6QlhBSnFIL1ZkcmN0?=
 =?utf-8?B?SXc5bG91QU82SGF2NWZ6RUw5M2hNWXhsSFYzTTdJbjk3eEI4dnlkU09VUHAx?=
 =?utf-8?B?TlpmZXBONFVqVG5xZC9ubFZRRWw0TjJmQWJkaTd1ZVI1VUYveC90Z1VkV3Rt?=
 =?utf-8?B?Q3J5c0NLTWVJNjFteWMzT0IyQ3JzZnhweXJTMHFNS2VTRzNzek95a0UrZHpw?=
 =?utf-8?B?Vnd3bGd5bWxqbXYxU3RSODlTRWxGLzlyTWo5dUVTZitLajZiaXNSbVpxQnE1?=
 =?utf-8?B?N0F3S0pPZGgxUmZvN242bXRNUDRvWGs4dkM3N21wYXpTMW9ySkV6Qk9zeTNj?=
 =?utf-8?B?UFdvbXBESlh5anBYeHovNkZ5ZHEvQ2NvZWl5YWtTNDc0Wm5oS0w1cUZVUlhF?=
 =?utf-8?B?Z1V4UGF1ZFgzTnJ4bVcyZDBGREFOcFBJc1RHa2U4RGZ6NWZud1BpTVkvYkR4?=
 =?utf-8?B?ZFBLWitYdStPQ3lvR01uUElUbG8vNGRWYjg4b1prUVhMTWkweEc5WDRHWDJX?=
 =?utf-8?B?VXdrd2oxOVUyczRQd09iQlJBdkRXdjBRM1F0OExNdVZOY0JiUlEwcWZmaml2?=
 =?utf-8?B?WHZBMFNKb3owNzNycDdlOXZFTGgxTjd2UTh4QmQxbThkb3phTnpYanBycjEr?=
 =?utf-8?B?RzZBSmgwNVJZY2p0d3FhNzJjRVdiQ2N6eTV5dnhLZ0FGdWNwWEw4Y1dmOThx?=
 =?utf-8?B?SkJuVmFDZDkzSU16MW8xWGpqNmtmZDZJQXVUYUU2L28zdmdvY1BpbHZhcHdR?=
 =?utf-8?B?SC9RU1M5MkFmVFUwMitsWlJNSkhxa2ZmNnJSQUtUbzFQWVVzWXc2T1ZJU0R3?=
 =?utf-8?B?VDlsMytUMkl5elgzb0ovdmVJOTZKQXBDanJKMUlaNUNHNitWWnNFQT09?=
Content-ID: <6236C2F76274C04CB2B6512308A40D40@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63925be-d3b0-4fad-47f9-08da529972f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 08:47:03.8068
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TUtVbxMIawDWzwr1C3ah4EVmJNTeXrAaYvh35RcxAVdo+zqbvSGUYJH22VlCaLMDI8fiKsXfXd72q+Y35zHLUpzuCiPZb2wRhoJZU8SPTZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2545
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_014713_524673_B9F62B45 
X-CRM114-Status: GOOD (  22.46  )
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

On 20/06/2022 09:02, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Sat, Jun 18, 2022 at 2:32 PM Conor Dooley <mail@conchuod.ie> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
>> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
>> this.
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for your patch!
> 
>> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
>> @@ -135,19 +135,41 @@ properties:
>>         of the designware controller, and the upper limit is also subject to
>>         controller configuration.
>>
>> -patternProperties:
>> -  "^.*@[0-9a-f]+$":
>> -    type: object
>> -    properties:
>> -      reg:
>> -        minimum: 0
>> -        maximum: 3
>> -
>> -      spi-rx-bus-width:
>> -        const: 1
>> -
>> -      spi-tx-bus-width:
>> -        const: 1
>> +if:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: snps,dwc-ssi-1.01a
>> +
>> +then:
>> +  patternProperties:
>> +    "^.*@[0-9a-f]+$":
>> +      type: object
>> +      properties:
>> +        reg:
>> +          minimum: 0
>> +          maximum: 3
>> +
>> +        spi-rx-bus-width:
>> +          const: 4
>> +
>> +        spi-tx-bus-width:
>> +          const: 4
> 
> These two also depend on the board (SPI device + wiring).
> So all of [1, 2, 4] are valid values.

Yeah, I wasn't sure about this one as I was writing it.
enum: [1, 2, 4] I guess.
As always, thanks Geert!

Conor.

> 
>> +
>> +else:
>> +  patternProperties:
>> +    "^.*@[0-9a-f]+$":
>> +      type: object
>> +      properties:
>> +        reg:
>> +          minimum: 0
>> +          maximum: 3
>> +
>> +        spi-rx-bus-width:
>> +          const: 1
>> +
>> +        spi-tx-bus-width:
>> +          const: 1
>>
>>   unevaluatedProperties: false
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
