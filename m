Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CF6C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jun 2022 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x4yWNbTOiua77TbtPg1rWfI3p53mYk3Owc+BrenBo90=; b=e22d9DZ5jRI5M2
	XnB26BQy6MxCh9Cb7EJRNKuuJCDp3Q2LLz/XcG49VYh2hBkvtfIjw6Ix4wRL7W2aCX6sT+kiBv2dX
	JIyvLu2PKbrkBQKTN3yvVE0ChHi/qtaoInBJqC9EKXQBZBWSueFUh1Ec3rFyqCLpgZco3I2DiPGJT
	smxxSvsdIfQWKVqum8oybCDGB9uD2iqIeVcQ9uqd9g3b/STA23/Y3wR27MkoRJU8kHFH+PhVXEcUH
	W2dTHOsuQuzwnVMyuzZ3Dj94mnW2H5GaGDkt98xwTJM9BwLqfTL5yXzV3V+hMZh8bPwhrNxzSS3Cp
	WGZVSDKUj3KyWFhzjPLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJsv-002gOq-TI; Thu, 09 Jun 2022 15:15:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzJss-002gN6-JO
	for linux-riscv@lists.infradead.org; Thu, 09 Jun 2022 15:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654787743; x=1686323743;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=OEl95UXO9lXM4gC/b9yko2/hlifgnSDUzB4JeH2R9B8=;
  b=V3HhTL+KjNZ8Tv+UsGsmWNQRQPS9E1RS4NBOR2US3A3/xi+5dOOfHTRw
   7ddLZfmqkfiWq/LGCGlR89yEQfHl0ceyZHp6ucPa3hoFzl6k0C7S1Woaj
   VXNAUrQIjJcsBRTGzjpx3yyyNuOEo9bGP1bqfGRxEr29xHfZwfJDMnrTI
   v/Pus/ju0HIr8l7qzJD+KRdR6SxOc7XJgzwtueEv2ldY6675nvdi1Yj/N
   HTgswaxlvayuFbHmh9jf84lS0Ep6JAxwhO3Tgj9a0Mrpm5MzMIEmqkwg8
   CypxqTt+TDUMWOSbsPN6Y4038P123C+B24og8UOudCs/bm7Yz4fqHw07T
   g==;
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="167456599"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Jun 2022 08:15:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 9 Jun 2022 08:15:38 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Thu, 9 Jun 2022 08:15:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X0xUZ46Zzwe9YKgJeUvIpaJ1O41+lCzl3abh9ashLh+fbl8C3sUvRSmjNIxJmLpgYYEN8b+KaDrSySUrZpzNe76glaLpYypGdZJ99c9ro/iQL3XjPxt0Cgh95mWR9uLRjmOM24PdnkrCYQaiVMJiTBVFkcXWCTS3muuWGaaq49f/JwKr7024yg9hyjuiUkRXb/Z4uR3CW+hxIFG+xDDssTrs4r8sIn6gHn2UK5Ru7sdLWy9NvNiD89OEORZJ6CqQuKCa7ehAwCQAm6g8C7BxJwuWEFHLLtRA1ZgItkQ4kqdi0zGXcgQxHNq2RVJsUp4n6SIVHvz6ZZuOaVPaTG7TaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEl95UXO9lXM4gC/b9yko2/hlifgnSDUzB4JeH2R9B8=;
 b=WgQKZttYya4bB3v1klUHSU9ftvQu53V7aY+vlF6/PJDvA8x437id8pAOShjzh4P+PR4Q5lrdaXU7J2JgiJQPr6pdyG6lrMpsmjbhvvK2Dgy74aQ/n+MGxhDZFivpvE4BU+3petnUNc/yQ8hf4xlmo0gl2Y6saCaUrovL1hgsepbKHdiinurRTEz0s2PL/bR6bvSHiCoKAtL8UGt2bBHWCg70KdrSIfvme+sh4G+JBUA+mm2/gmK0ak1GFoLbgIa5NPpRZtCxjnd1JUbLjsUvdy2sQ6ptRGge43x9gDGL1YZ8AsE0nZNeQQf6sbGvT9oBv76DxvT68WCXYxXXZ3Du6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEl95UXO9lXM4gC/b9yko2/hlifgnSDUzB4JeH2R9B8=;
 b=t7D/bKgnor27Kb7DKHwj+yQ5yQVYONl+ZrJiW1HxhkBl/iTvx/4F9KDHOMCXa0jxe+Xkwprot/NNYnpu+WjaHOOAtadS3uWQMLISgjNjypRz5j2Of3DaUwspNvVVGYtXlaN1Hqb5q7TGAj8E9l+4k+ChVmWW2WwWLAoSS6UPRBM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1639.namprd11.prod.outlook.com (2603:10b6:910:f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.16; Thu, 9 Jun
 2022 15:15:34 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.019; Thu, 9 Jun 2022
 15:15:34 +0000
From: <Conor.Dooley@microchip.com>
To: <broonie@kernel.org>, <yang.lee@linux.alibaba.com>
CC: <Conor.Dooley@microchip.com>, <Lewis.Hanly@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <abaci@linux.alibaba.com>
Subject: Re: [PATCH -next 1/2] spi: Remove unnecessary print function
 dev_err()
Thread-Topic: [PATCH -next 1/2] spi: Remove unnecessary print function
 dev_err()
Thread-Index: AQHYe8WVNiWPpIexUEGr0iJrG8jUkq1G50OAgABIuIA=
Date: Thu, 9 Jun 2022 15:15:34 +0000
Message-ID: <c5575cbe-e0a4-fae6-65e1-6bb4b3b6f5d4@microchip.com>
References: <20220609055533.95866-1-yang.lee@linux.alibaba.com>
 <20220609055533.95866-2-yang.lee@linux.alibaba.com>
 <YqHRlaqy/UD0vDKU@sirena.org.uk>
In-Reply-To: <YqHRlaqy/UD0vDKU@sirena.org.uk>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd0edc50-48fe-4724-c4ac-08da4a2ae66e
x-ms-traffictypediagnostic: CY4PR11MB1639:EE_
x-microsoft-antispam-prvs: <CY4PR11MB163979D5BF5B43B7C6172CFF98A79@CY4PR11MB1639.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t6YnU47nZDQuOgjygJrraHd/BUkbmlBAzBEpYGqevBfYLE28Uazhg1HjjKW76nEQNHij4OGO7nd2tVB1hXBHIsRyQC7Hp9AudHb33lySK8oEZ8dXGXi1hhrbU+I8z0WC489ux1SJnQcZFQcnphx+ZXPXI7yvaB4lirAVlcdWVtx0ch16h2IaRwvsE7URXosO6xodMBHQ6gku7e46v8SfQ60DOWBMGiUhnV/ProeOidmucE+5FpSHeKFz/XK32ZeZm77AMnJ7Bm0GD1F52URlz3fr5LsqG1ellON85Mj8skr7z7LpooWslIXX/5ImJ0rFICw5XIl6V+GXLdU8eIWVnERNN14jdboUNtVuB5Xd6/MUEQ0E2eB4M4hpPPLUSIRSM15l0Y1Z/2gosOct3Oo1yBsKSSGL8O5hfchq3rn9y/BdhOYNHh6z5fS6xMbKfGa2Bxdq3GBeWGXz7MaZVgHLkw3I0ox40iy65vSyvEAFGEhY/ZcFgip14HwI+xb9FNlZu3ptTwmaVUQsTVQBROwsLbW9oRIGS/R9EKd0am0wE/82UzV1Kt1KsphWn14bYcR1I9t4G5ejhez2Meoqxs3yLjEZX6HRsggILL8QvJIjc2LqKHhvWcxCW/ZrzqCHc0ahnlsYkaBHVzdKynMhhz+/Qmxk4OBYLRvg9e+3mjPOvvwUQNIKqavkR0VRLHgIWoOeAxr4sLAyYVcOZwEpfdJXncTPB3dT0CNP1isEKzVLEbVvxskwrAfWEum5rMqxFaZmCH6mktkYa3git6D8Hv+q/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(110136005)(91956017)(54906003)(64756008)(76116006)(66556008)(66446008)(26005)(38100700002)(86362001)(122000001)(38070700005)(2906002)(8936002)(508600001)(31686004)(5660300002)(6486002)(316002)(4744005)(66476007)(186003)(71200400001)(36756003)(66946007)(4326008)(31696002)(53546011)(6506007)(2616005)(6512007)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1lLVVd2WUlMZldPejkwZW82SlVVRWptUVByMW9zSldBRTRiUGd3NlVOVDNz?=
 =?utf-8?B?SEFOU2lnRFM3R3huYTRTSGtsSDlJWXJ3VlFWdktDaTFKdE45WVFZYmRnb0dr?=
 =?utf-8?B?SEpseDc0YUZYaDMvQ3dVeTJKVktIVmVWTTNGWC9NREJ6dnVESlpPSGRWUi9I?=
 =?utf-8?B?Z2xmT2hka2dZclFwZVR3eXlqNGZBT3JFNTBjSzNsMzJCS3cxbW1aUERZOVlW?=
 =?utf-8?B?eWlCMW9ieDhZZzBXYWJIVXF5Q0c5cTRFWlVxd1hCeWxRTXkrRlpHam5id2Uy?=
 =?utf-8?B?U1dYV2ZkVVFvT2NvMHVJMFBNV2dqRExUTmFUQTQyWVJJS00zVlRuTnI5QllO?=
 =?utf-8?B?N055OGxJaFF1UEpUSjBEb0JRd05oQlpzbUJLbCt1R3RERCt5VnlZM1N2Y1VP?=
 =?utf-8?B?KzB2QkhiTUhIMElCUEhFNmgvcmswU09tZmNYRExONVJmZGtBeGJ4QmtUVElw?=
 =?utf-8?B?Uk81YThiMmNkNzFBU202N3I3aXZXSXppdm9teWFvUmNDWTA0a2I1Z0dYSVlG?=
 =?utf-8?B?NlFlTzNveG82Ynp4U3dMdTNHLzZQTHhOU2UrQnJEQmFVaXRMNVdjZmcvMEd3?=
 =?utf-8?B?aHVCVGFRbnhlVmIzbGFoVGpBNVJYR1dmNnFqU1hQcnRieldaSUxkdUp2RURy?=
 =?utf-8?B?TjFkem91R0NHMGpoa0prbGt4RGM4elhGNmZIVXVJZG9RTGxkdERTVkpXQ2NC?=
 =?utf-8?B?Z2JZckd4YUhhQUZ1WWpjb0Z2K1VuMy9DQWRYV2prcUx1dndEaHZSenZCci81?=
 =?utf-8?B?dUNySm4xbDdISzJnMUk3eGxjTkdRM01URUlyRVRqWjZQcXVpMkM2Y042dXZr?=
 =?utf-8?B?MTgvaDhhcm9PMGJBaVgwY1VLUGxtWUFSaXNySVA2Y3c0Q2xPTHJyOHJZcFd1?=
 =?utf-8?B?eDhFQVRkUE5ERjF6dFBEUDNieVJQM3FlNGJvWDRqK29LWThSS2RoalhMRjU3?=
 =?utf-8?B?U0VXbDg3NDJWRjJFN1FCeHp4aEdINEhqUUFqZUlPVnRjYS9MTzZxaFM0S3JG?=
 =?utf-8?B?YnhicnVRMmZjZ09aaW83YWxzL0hnZ1JCK21NTjMxNG0yNVM5Wk5jYnA3aHo2?=
 =?utf-8?B?RUZJZUoxelZQdnJOYzhSK2w0UTVuMFNQNGtOYzhsaVJuU0N4OExITzdlUUFM?=
 =?utf-8?B?aXlzNG5sa3daTXJOSGZGRzU4cUZVd3lpQXl1SEt1RlU4ZjExVGF5UWt6R0lD?=
 =?utf-8?B?Mk5yQThRK3JzNFBqZXljR1VPMnBBajI4QlZJamIxL3p4c1YrVXhWQmRvTjNS?=
 =?utf-8?B?VTY4SW1zcTI5elMvU3ptWCtuUVFGbzdKWDMxbnl5YTJ4YzVtVlBlSk9vTzdZ?=
 =?utf-8?B?ZXo1YWR0R01WUVpiQUc2WU1OamJyVlgzUUVaTFFidVBDcDAxWmd5L0luVjhr?=
 =?utf-8?B?aThIQ25BTGZ1YkhwMk5rRGRBcXdMcFBGeFFjeEtwUC9MLzJDUjZmUnVnbmdv?=
 =?utf-8?B?Yy8zaW1hYUtRLzUzUndjV2xVMDhIRmQ3aDhZb1Nwd0lVWVZXeUpQTU0rMlhS?=
 =?utf-8?B?VzZzUlVJY3BKaGFuemp6Um1iMUY3WmFINDIvcVpVU2xUR05LYzB5dlBGZWgx?=
 =?utf-8?B?Sk9RRHdTbXVjaGc3VnhnemwrZ0EwYUQzbTUybC9XWlBtN3RxMU9GMjNzOVRs?=
 =?utf-8?B?L1FSWElFN1NoVXdCcXhOQm9kQWdHTnpIM2RsaG9xSlM3WC9OTGFSWGVqeE9a?=
 =?utf-8?B?WUVQdUx1bmh4Z1JhWFZCZXNLVllNWHJnTnhQVXJvLzFBT2R5RXI4Q2g1MjZS?=
 =?utf-8?B?b2JVTEFDckJFNmcrcCtDQVA5eHkwb1R6MlZsRktobW1XNEhyVmxkaUttNWRX?=
 =?utf-8?B?eSsvSlhEcUtBS1JvZ3FzWEJob0d4bGdWNUN0MkJvWlJrNUtKaS8vTU93YUVD?=
 =?utf-8?B?a3g1TFVid255VXlRUVJLVXpYRmp3MU84QnhDK29SSVBxaExMUkZsNHdXYk5V?=
 =?utf-8?B?OXg1YkhpTE44am5lRkFSb1VQakpBWk5IUVlsLzcxcUdRL2paZVNqTlVqZEdW?=
 =?utf-8?B?YU1Ga0kvTi9GOTVzNGRHOFR2VTFJeHUyS1YzYlUxL2p5a1F4QlpQam80Ynow?=
 =?utf-8?B?UDlHbWFNQy9mOVZWMHZYbitHaGJHTEk3WG1GdnhBYUNuSUtFYTBrbHh2TEUw?=
 =?utf-8?B?ZnVVQ1dTZEFnKzQ1ZVM4VEVBODFmTWlVcXVPWHRpc01sNkZ4NEVneTRUWUpj?=
 =?utf-8?B?ZC9rTEcvK2xLWXlxaGpMYklBMitaY0g4dnpJajJpQkRmUit5TEszUU1QZXhw?=
 =?utf-8?B?cXVpWkdRajVTeWhGcmJYVUxjeVozcWpGNEdLNkRhWkpUeWRSNHI0aUZ0L0NF?=
 =?utf-8?B?bjM3Tm1Ed1U0ZzlqNytxWTlZWC8zazhNYXRnY1pCODhuRGtvWnNnc1V3Ky8v?=
 =?utf-8?Q?ZrgkqgslDpELRGK8=3D?=
Content-ID: <0DF98BAA4207FF4E809FDC2C7D826A8F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0edc50-48fe-4724-c4ac-08da4a2ae66e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2022 15:15:34.1134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFbLfWYRa6QJuiLjCzklbFARuiBNvqnEtd/82ycTQB+/oJqrXykzMdt43vjvJ0pVcdkPuKIlAIFZuAFSis3KwvyFBrvgPUFZGu5cW4/WKe4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1639
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_081542_950564_239C707D 
X-CRM114-Status: GOOD (  11.04  )
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

On 09/06/2022 11:55, Mark Brown wrote:
> On Thu, Jun 09, 2022 at 01:55:33PM +0800, Yang Li wrote:
>> The function platform_get_irq() never returns 0, and the print function
>> dev_err() is redundant because platform_get_irq() already prints an error.
> 
> Are you sure it never returns 0?  Note that 0 is a valid IRQ number on
> some architectures.

If anything, I think I need to go in the other direction and make sure
that in my i2c and pwm drivers I also check for zero - it's an FPGA
after all.

Thanks,
Conor.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
