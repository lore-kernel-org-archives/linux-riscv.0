Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D5BC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 07:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eo9SXowf+zVhbBSu4eYPGytSORBPo4O+PX7/EJ/D55s=; b=afge1UN/6DGA1G
	3hBZX1xDQVNCGN0DocYagE9Kr0Bio3v/5H5ug22XwRds+jXAgxBXsqws9yQESyKx2uyQU1KuiSn/w
	Vf9fAmeEwY3C4p1xVXB0jLr3gex81t8kOGEB3PJNVtiVfbqOHmbJzvqnm5I1z3VL04HElJewWrDgq
	XK7EniUHrzqPqpEZ6l8xfYFV+mxyn7QGGqpWBT9GBcItd6EJSrBczPZ0miYmsh+cHGG2LGVcNcSvl
	vzW1TM0f+98mSMM1JLU7zOp6zUo+SgnW2HZAlNG7kCJ3NDqsW2T3bF6+JZHFZzQlhkkxrg+PjBVRA
	/BoGJV803pccYgqfXmgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8crs-00FWLM-Jm; Tue, 05 Jul 2022 07:21:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8crp-00FWEW-PS
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 07:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657005666; x=1688541666;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dmpmuGnsLHXxQOn8LRjyDtZcIahdGOuFVLWJJVyNr1k=;
  b=OXYZawERjLHYu3qjSPjADfg2C5jXpacppLd3iQHhjVDc/hCmXTNkJurH
   YPzAQSOW7E4RkXYW/9ooaMfp39mhhdn4vpTzXJtSo1Zw2j+fd9VGiIWg6
   Cm0pgWJRl4YLIr6dgX/AJFvUHJrI021/1V/1pQ+T+BQmYKOJwQ6svDnQ4
   VVDPwUkXzkP68tqbO66GGGtqOD6WxeW5Gg8VVSaKYbRbR1fY78dQfHD+s
   7GvrWLReDjxKxBSUwZgJ+tQt7d1bJf9rAntBPNIacsmnNEw/xmSoQEU0o
   9WWy1va6ZS0dKQovVSnhSIzohEG009g5j7P0FO1zlGehVTpUv4WzU+sbH
   w==;
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="163310900"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 00:21:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 00:21:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 00:21:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsvD+Zazv/yAAj8hbe8kpr4HGddgu0n9+Dh7BlqwjNdE9iAl9WshT+msA5Kb/ADQGRe2myFmdOTucKtd+J/zRbtUSszLFVSaU1XwwgapTMJEtBFmOsbDaiY+mlky2s2vHJxLUxEqBMFmf2ZeGmX5wb8jL02Evi+c/S3tXy3vfiediQebDymj5jzKpaEUIq3cN9My/WnHmVqwWEG3F48m2T4Or1ypiqoyNn1qKeaADgYaTjd07Knyhn+hXSyzhQV6YulVjsJEs9P2/vCJxDX2vmRsyhEr7Sn3XdlJkrUqODAhQxuK+HFJSzYg8B3QI58CHfIlbE2oOOvZvwmrtB/53A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmpmuGnsLHXxQOn8LRjyDtZcIahdGOuFVLWJJVyNr1k=;
 b=SVu1J0Q5HogDyqd3kuOjG3ZMSQGXiIfYtknBrjA0cwkdCwq1/fLXXMKgX5emXYEqElDl6MvEOiGSteP4k07trSmKtsSgZaeJVtX2iWrdlaUBGmGH3jd581aKfxCtXWAiFG0dYb/7VaZrI6v8tyn2nHbwPnMeqy0TL4nRHwtroEkeZh+0opW1IiZNSEN5zo38r1RUpB4Y+/6AHyZUFz8pN8VYtod23HJKoVTyIt+YeV3KTcvmk5OdR9nFoipU8hcU5+8gb6UZHMtHFV8b5V8sSis1iRP7Dq2D9ccm/pfMAhP3erDZyp3RNIzZx5Yg0E8uBu/E7rDJEFJIiF8r2zdTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmpmuGnsLHXxQOn8LRjyDtZcIahdGOuFVLWJJVyNr1k=;
 b=o/oOcP782INZzNx1MZ8tckNaI+ttfhcQjppy2mus0euuEN1cJlA60FbndnWnPnINntnGQooMKPl/eX/hITefL0u1MjgYry6FlGwqeO7wh6J7UWBqbbKc0kAd67ec1hWRXs2fqciUbPM+eQip7yFgdLg2+PG9iqGtEWjjnZ23OsY=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by CH0PR11MB5739.namprd11.prod.outlook.com (2603:10b6:610:100::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 07:20:55 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::5c8c:c31f:454d:824c%8]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 07:20:55 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <davem@davemloft.net>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Nicolas.Ferre@microchip.com>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [net-next PATCH v2 0/5] PolarFire SoC macb reset support
Thread-Topic: [net-next PATCH v2 0/5] PolarFire SoC macb reset support
Thread-Index: AQHYkD/DNT+YudLJkkuqU9aXIvYJXA==
Date: Tue, 5 Jul 2022 07:20:55 +0000
Message-ID: <69cdb133-c02a-e36b-b0a1-cf5ce81ad04f@microchip.com>
References: <20220704114511.1892332-1-conor.dooley@microchip.com>
In-Reply-To: <20220704114511.1892332-1-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 29b36e93-3c2c-4643-ec2c-08da5e56e66b
x-ms-traffictypediagnostic: CH0PR11MB5739:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LA8goPhd3TGJd4rc4SLSOtz6YWVFam19nZJf7MJzM5jte1XSzeaaLVrHG/1C9AMhf/mdwJTyzB/09C5EANRyosfO3Er0eSjproJtVWAboOahEzeDqexfM5RHp0YjVl/Ifz0mfpkDzgXlXnsMpuouumiDohgNOkAcPi68Pyd3jDRwMbP4poUyTRMNEMeUmkV+BSB6zJZe3L0/3eJpKU8iKq8wMrnVToxUmE8hqGk2SXp9cs3bWE+TvqREe958gCyFXRSYDw+qeHhvNIMPCD3oO5wFp7j/O0UMwtIWXgqCMU/+8Z28gQhfD35m5x6JOKa39vnYC5RsAQfdFO49yBWDb9zK3vpDdLiI/BzhHZ1PO6MJF7qFGOOUPwxWFQCLqRQMnSlnjn4RNppMaFKxuzvtBuKKOGOBmeE8Bi6nM5lmkorR8L4Uog1k6lHehDLqk/RTpw94GlojJIP5n56z8T1N0rlNACimHfL1stC5mF8gECKOrx69boDQmDhfBQfnVb8ynrfFvgdvTLKsz35Pm4bx97iOmwIlXke2JEUazcuejOdqPgjty/wMNaiZgGg+lPyHq0DtJwLLCFGl3BVvH8gDzL++KQ5bgwIvu8ckj7ca2NwpZBgBfacTb4nTzHgXd7Xji9v+dErmudloRSy6vqjRWCUvd90XIxdPkQZ/jXSnASC0Wny9X5LOTftUsyw9Bo6btIc4AuU6gaAL11ywaxtgPVquM8WCyShbdWoKejIxcthE5py5AaHW/uTxn5mdyqeEZOyquCxc0vgsHVoFbFapZompLjOMEG4ujhZqnzBoynwJbW0PpTM1nQ1yQZ+ngZmiVpX78eQ+Hcy6csPgvQNLn94h9DT6BNSyyKBpBQJ3OZY2Vk5G+HTsQq/7B2+flvN9
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(376002)(39860400002)(136003)(366004)(38100700002)(6506007)(31696002)(8676002)(76116006)(186003)(2616005)(86362001)(41300700001)(83380400001)(91956017)(6636002)(2906002)(53546011)(66476007)(66946007)(36756003)(66556008)(31686004)(110136005)(4326008)(316002)(122000001)(66446008)(64756008)(54906003)(71200400001)(26005)(8936002)(38070700005)(6512007)(478600001)(7416002)(5660300002)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anpuZ2kzMHNNSUdvd0NyNWlzM3Z3aVNIM1BKT3ZFWjdYaGpkc3o0SStZUTN4?=
 =?utf-8?B?eDJzVnpnTzYrQWpUSGVsSkYydFZhcXlTZlk1WlY3cjBNdWtpS2ZVbis2aU9K?=
 =?utf-8?B?clB6Q0F0MHcrN1BKbk80M1lhMGZHdm0ydnpDTlROVGNENnZqU2U5dDZjbXlW?=
 =?utf-8?B?WVRSU0pzZTljV3FpS2xYQVg2SEFQN2U2dGc3S2ZCd2t3Z0NveXpxSTJWTFhn?=
 =?utf-8?B?OTNJaDArSHhRU004cWZTczRVNWxYTUllUEtUK1c2dmV4Njk3b3hvUHQzbmxH?=
 =?utf-8?B?Y0VSNzNsQzVlN3dEcEtGaE9ibmduS3VFd0NkT2k4ZDVIVGgwVGVPU1FTM2cr?=
 =?utf-8?B?L2pBZEJOelNJK0JGUFJraGZEejlaejJFVGllZ3NwMitZV1AxaCtmZHV6OTdG?=
 =?utf-8?B?SnVQajRJYW8vcDk4dXpxS2theGJxR1U3Tm1jUDQ1Q1Z5aDJJR01vTiszeWJw?=
 =?utf-8?B?dzFDVXlOeklndDh3Q2NHbkdEcXZLQytLTjNVVHhSakM0MkR2QmRsMWtQWURF?=
 =?utf-8?B?N3NNZkZWaTFzTTk5NkpLNnA1UlM2aVp0aUJ1UElVa0IvUjcxeFcvOUpVbVQz?=
 =?utf-8?B?c1dQWHYvd3lMZHBaTGFyWjcvZTEwWTZpaXkzTCtNVXFjQUd1RkhYckN0ZVlm?=
 =?utf-8?B?K2JHb3dSelMrQld2anluNGFYcGQxK1puVzVNUDliV2JpTlBEaTFMOWQrS0c1?=
 =?utf-8?B?SThVcXgxQkRCd0xXT0YwUCt3cHRUOXRVWk44VjByTGgvOUtGWkhRRUtnaTJ4?=
 =?utf-8?B?NGM5VXB5eUtpczhaOVJRUTlpd2VXVGlFVnNCaE90bWdxbXI4UzdsWU9hbU1q?=
 =?utf-8?B?elQwMnVkZzRWaWl4QUJlTUN0dEUzT08yelZWNHpob1QwVDE4aVV1bVlhazdw?=
 =?utf-8?B?a2xjb2d1ZHdDd3Z4amJidHE3NTJ5cnNaTUNESTUwUkNTWnQ3YTVqay9qUlc1?=
 =?utf-8?B?WEpWNWRBTWs3OHhGUzdhMzFwWm5qVWNoYUJSY29iVnN3eXRoUWh5YTFOMWd5?=
 =?utf-8?B?YTQ5K01NR1BCWDI2dEp3L0hBaG9pTWt2dE4vdVdZRDFlMDI1Qk5vZ1VQam9y?=
 =?utf-8?B?SkJzY1poR3h3d2grZVNWMW5IbEU4cFZMZWFPZ3U5NnJJMytVbWZPOEVsVkRD?=
 =?utf-8?B?cjFPclpxenArUWJTTnljM3A4SGExYVdOZlFUdm1aUFhZM1NEWHN3dzR3NkQr?=
 =?utf-8?B?b1ozbGJOeHAwZFNHZjhSdDlsVlFhdi90U1VDeEdWUlptdURKZ2N6cnIzZDJT?=
 =?utf-8?B?RUNqVkRTeUU4VVJEYlc4SEdnT3lxaURMUlpaZjh6bVhkcnk4bzVoRzZrbTFM?=
 =?utf-8?B?OTFRZXA2Sk1SQkR1YWU2VXRiNnQzdzNVR05vZ1FRelFKbVNtbmRGeDRiNk5a?=
 =?utf-8?B?R3QweGZhZGpFNy9YMy9VWVkxZmp1NDVuSmdvZzJvandRSDIxLyttR01qTjBo?=
 =?utf-8?B?RUtsRlBDTGRZMk5NUWZmMVgwSy9qRndPU0ExMlhNZmlmWmY4eVZJOEFMaUJp?=
 =?utf-8?B?cmd5QUFUOFp1bWZ6cmNCUS9zcm1kNFdidGQ0aDJQcWpMMDdCTWptMkhENzZz?=
 =?utf-8?B?QkpqMEw4U0FNQWlBSnUrSWlvc1IwZkJXZHN1Y3RzV1V3bTVEbkx1d09FM0JN?=
 =?utf-8?B?VGVRRVc0L1ZCVFBneEJGaENoY3VnSlNPbVYyRVVkQVp5Vmgwc1FSM0F2bXp0?=
 =?utf-8?B?VlY1dmRPNWkrVGQ0ZEYzRzlNZ3hDc1lxM3NvVk0xSVFnZTVMalVyOE1tYlY1?=
 =?utf-8?B?TzFIMWRJdVpsQjFHSHNTRGcwWFJOdHFLbFI0d3Fqa25rTmt3VEFPcms3eHF3?=
 =?utf-8?B?bCt0enJQdUswWm5OdUk2bFNnQXJ3Nk5IcEVmcXFRRGJhLy9CbXJQbk53QTRI?=
 =?utf-8?B?dlp3Wjg0SXdIbDlpOWtRaUdzY25JS1R1QXJIVjVYL0pKVWtTTEFqRERqYmRO?=
 =?utf-8?B?NE9zVkxlRzJoN0ZwbklXbXQ1MHptTWlGQmkvR3pDb1dhakdaN1NSVW9CeGlW?=
 =?utf-8?B?Ujd0YlFOS1g2NWp2UFhFejdwbndQREptMU9sUHVZN1pidStnZE93d2FQdHVX?=
 =?utf-8?B?QXF6YittOVpmZ0N2UmdXVG5SUnZjK01FRGFmQ013MFhNUERkVE9IcnVyV3ll?=
 =?utf-8?B?cW1OSUl3ZkdGVDdWcXJaZWtTRThJRnJlOWl4M1FST2xwdmdKSnhNRWJodGVm?=
 =?utf-8?B?RGc9PQ==?=
Content-ID: <1FF62982E9E3364D83D42E0616BE92AD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b36e93-3c2c-4643-ec2c-08da5e56e66b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 07:20:55.1908
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BM/WahfNseV+H1oLod4qYXYd1/CUS7mZEdWYVpkDdqydRA4OtHeteGbWoXpCdRuXiV1kN8BWwU6wmWPU/j70PMBDKL4tY3DnYwK+6DbjogU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5739
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_002105_958598_D227CF76 
X-CRM114-Status: GOOD (  16.55  )
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

On 04.07.2022 14:45, Conor Dooley wrote:
> Hey all,
> Jakub requested that these patches be split off from the series
> adding the reset controller itself that I sent ~yesterday~ last
> week [0].
> 
> The Cadence MACBs on PolarFire SoC (MPFS) have reset capability and are
> compatible with the zynqmp's init function. I have removed the zynqmp
> specific comments from that function & renamed it to reflect what it
> does, since it is no longer zynqmp only.
> 
> MPFS's MACB had previously used the generic binding, so I also added
> the required specific binding.
> 
> For v2, I noticed some low hanging cleanup fruit so there are extra
> patches added for that:
> moving the init function out of the config structs, aligning the
> alignment of the zynqmp & default config structs with the other dozen
> or so structs & simplifing the error paths to use dev_err_probe().
> 
> Feel free to apply as many or as few of those as you like.

Other than minor comment on patch 3/5:

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> 
> Thanks,
> Conor.
> 
> Changes since v1:
> - added the 3 aforementioned cleanup patches
> - fixed two stylistic complaints from Claudiu
> 
> Conor Dooley (5):
>   dt-bindings: net: cdns,macb: document polarfire soc's macb
>   net: macb: add polarfire soc reset support
>   net: macb: unify macb_config alignment style
>   net: macb: simplify error paths in init_reset_optional()
>   net: macb: sort init_reset_optional() with other init()s
> 
>  .../devicetree/bindings/net/cdns,macb.yaml    |   1 +
>  drivers/net/ethernet/cadence/macb_main.c      | 106 +++++++++---------
>  2 files changed, 56 insertions(+), 51 deletions(-)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
