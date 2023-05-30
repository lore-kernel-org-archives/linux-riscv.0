Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC6FC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFQzulMMkfxlp9dauWLjBgjhwAm9V16cEryBLgN6cUo=; b=H6k4BzdRTCNVr9
	/5iPTUEZAeTHW6zn631ZyPoifYr+CfGXXl/00cqAEe8XKTTQ7pbzCWkRKqpNWM4LPkzP4m0QKlvp7
	1iOyX+qjDzZ+wGWRuClQt2pxA7dMkpQx8NqmwNhqGVa1ZvWPE7uejWqIts7lasO5i4zenSK78irUM
	e+kohjR2Br4ZBToc/MLlRyc8LUcbjn0OJnG40eL60BVkQN0rY7CivjHUkHILQLUVS546H0Zebxsei
	Yjt4YLtRSbsO902eypLLQghKLNJKPMAWwfTs4+THCKMq0S1CK/kJ+a8n3OoQzLikcgoOUvcM58qeE
	pIuJU6keUjPs6peyya/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3t8w-00CcAX-29;
	Tue, 30 May 2023 06:47:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3t8q-00Cc9U-0v
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 06:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685429256; x=1716965256;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/X1Vh1ZlQ8jI1GSp3gHDC3PS5prfOEVgwHZML1UdtXE=;
  b=aMMWS4f9RTn0C3k+6HCoR6zfln7dlA7JesZE+uLNZcTW/ugxzmF4gmzJ
   hmWxUk8iiCN18Nvz3FwYNmnwI5oCln1cl0o6/M5cuDXZbpXdpdalPxCVA
   9sVV4MnXrqeQPVhLZRm7J/8/VAaL/i6vUHCrQ+dBdUpUeDQVw0gE6lME/
   7PLkUHE/QM74uGB2vCUWmzqJHD1JTSLjxjd+ODgoLFzFTjtpSCf/FR4bQ
   ASQjhnARMz/5e8DVVKioGvU6xUXUrSltv4JpTct7i/w7yKJi8i4E2RPxu
   6X1utNbX31RAhobEAzxnh0Sju5afksHDx4+k2ITDYas0R/uuzrVcX1N8Z
   g==;
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="213659944"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 May 2023 23:47:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 29 May 2023 23:47:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 29 May 2023 23:47:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOJi0aLKux+Z3vATqjbGcGZLzH4ODhr4SpmxcGbnbt7x1SWhtZIcr1pHPF6fjPufql3OfAcR4ei8toR27ftF2Jr6xchbzs4MC4lLZBmhGcFMpYAMAhTw5KLp2M/JTpxPgNWXYAHCJ7y1n3R4A4nzKaYMRSXBIXJoRsheQb2ySD5bHoxeJjmu3Nr8eAlaFuwpEwQBVGqIdCZykfiW3wvCws/y026MO+qz2SW+sJPQ0nxRMKeLur6Kz9uY4zyCWHjflF9XFxUibeKcNgjOThhss2jc8mxlExKnzdWhorhIbNm60zt0UNqL/07SE2i9sSfONxPRdJ7AMrDRNmhPxS4+qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/X1Vh1ZlQ8jI1GSp3gHDC3PS5prfOEVgwHZML1UdtXE=;
 b=NJJtBQyxQ9vC6zhfCNIXL76/ODGwFit1WE5nMazuXief7WUYBPCm7eTgNW+anIbqhhD/VLETTiZNauq/j8MQbjPIv3UAyfyoKvRa+drNU1lbsJTf54QDWckfxUI5Jfh68uuLzBGUVZJ9ss0u5FQhQdp9xIOHst7byZ7/ePPrtG/mRHgTENv25u0cAWzQJ/P6GqJNYtM4h/g96w/PB5Q/JvPyHLx7w8XKv+mhQlzoJ819c5l+ZUAfEktbTkCdm+HgnInGgfH+4HQyToV+f0qlShoQkk9vpZH+PSFCV96kUwnwSzHTdgaUL2eN9qal1p+QtvoOPKeBF2tYeGlDC0HhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/X1Vh1ZlQ8jI1GSp3gHDC3PS5prfOEVgwHZML1UdtXE=;
 b=PfGrklPIHjLlkrxOL/eZvopB1ziw2mapR5RFo5DZ8lRlBogFjeWpdp8IkYAaGxM9YtjcWXMRtOD9Dy9OKGSaXgsT8nM0Mc3bD1bbssQ5yOVKPy3nx5ar0y6eHn0XF8TSmuxLDNdMbgeMvVRk0ddw5BrGRCBfZ9C8KGO2VtitC/w=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 06:47:25 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6433.020; Tue, 30 May 2023
 06:47:25 +0000
From: <Claudiu.Beznea@microchip.com>
To: <walker.chen@starfivetech.com>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Conor.Dooley@microchip.com>, <emil.renner.berthing@canonical.com>,
	<hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v5 2/3] ASoC: starfive: Add JH7110 TDM driver
Thread-Topic: [PATCH v5 2/3] ASoC: starfive: Add JH7110 TDM driver
Thread-Index: AQHZksKWbOi9N2ZAKkCgvv+8WuoIuQ==
Date: Tue, 30 May 2023 06:47:24 +0000
Message-ID: <143e2fa2-e85d-8036-4f74-ca250c026c1b@microchip.com>
References: <20230526145402.450-1-walker.chen@starfivetech.com>
 <20230526145402.450-3-walker.chen@starfivetech.com>
In-Reply-To: <20230526145402.450-3-walker.chen@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|CY8PR11MB7171:EE_
x-ms-office365-filtering-correlation-id: 56c8ca7d-0774-4339-c246-08db60d9b9ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0hdhhrPjXbmWKT64qYNdEJaOCW2oFnbRa2axadlhxD/ziFbg2k5vEdrKON9OYYVccBs3YIfe5Pm0wFzsS5JndryeqTI5v2xl7rq/JDZGE48y/WAMbWQgEbAkd3/cB0tHbQEyszKB4KI4bEzOwpqjpIsreVaTaV43aEDOEkN41axkpGvwhfXKZbRJ9dAftJ87nRMuSJ45f0wIhKrZaIZCKyPH4NgdZB2jvhvHWvgQL4niNU18+E9UqZRXVcUBzmXNhGLrQg/WCPmp6Thf+c9Ug0Jh/XU/RfeyPKyxkQnEwho5E+VwzaXNZ+nbqP0HTs3WdQ5z54nPEC572k5H+ulbCMlogNtNqcgrCqMlhcWHt7YR9iZAUO3FUcAWK2F1Ck5NoKWDcNzou33DcnYUFEhRR2ojNsytgpaldv3njfImN0cS8G+MRSY25Yqw3JnoXWHwW0mPV/hX6Dt67h7AKs13lIxOKh7u8mxWFumLmrNxpGIFBdm086cSM51Ofbu4JyIvpZmqe9t39hD1lOJ1AMk2YuAVxd/FjtwiFPjw8InoJg3KWUq1Na5d+rvKIjRlhHhBsJXi6oqRN1B9AZtOq0zvB3GDx9F9J2R1FJOkvN0aQ0O9rGZrtq44N6rlLp+boBoL+r034ezn153Nw7wAuM4LkJLf7rwaF9dke8AndJPZk3cDcD5OQI7/IAQ1K91uFMZI0qsCJj92Or+Ex+oXo5/JUw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(36756003)(86362001)(31696002)(38070700005)(110136005)(54906003)(4326008)(316002)(91956017)(64756008)(76116006)(66946007)(66556008)(66476007)(66446008)(478600001)(6486002)(71200400001)(8936002)(8676002)(5660300002)(41300700001)(30864003)(2906002)(7416002)(38100700002)(921005)(122000001)(2616005)(53546011)(6512007)(6506007)(26005)(186003)(83380400001)(31686004)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEFabkRVSDVqQWdjREEwT3A2d2JBdXQvN2YxN3MrV1VpOExoeEdwcjFYcDQ3?=
 =?utf-8?B?cGJaUU1ZQ0FsODFLUFhORStpR1hNVDFNTHdoaGRtQWY3YkVqOUhRT3djcGRQ?=
 =?utf-8?B?djk0TjBJRSt2YnRYOFhIVkRiNWw1VXRQZnpQUk9CVzdzc01MVThQWUxBT2Qr?=
 =?utf-8?B?SXMrVkxKaTYzaEJ4a3phMzRKdmN3eUkrWjArRGxaeUFMWUZ4WGxWWXprYm5u?=
 =?utf-8?B?eldKbFFacGJxOUExZk9wQnZjNzZnNHlkV3ZYM3FYTUlkQXdCdnVURU5EK0xt?=
 =?utf-8?B?dVBweG5QNXZtbW9zaEFKY2FwbkcwYUFaaGJWbXdtWDFOSnBtdC9tamZYSkpp?=
 =?utf-8?B?RTVHUkthZXRZV1NRME5SKzJUR0xLQ1J6MHd3bTB4Y05sa3FPb016ejk1TWFS?=
 =?utf-8?B?TVpKMU1mcUY5RjM5QTdCZ2oxcWV2T2NwVjV2SkF6VkVvQkd2VmZ4cmNVa2Yx?=
 =?utf-8?B?ME94d05kcG14VHFqMDh0ejVCbDNHUnIwT0VxZ1RHOE41VVV2eDdlTkJUYjV4?=
 =?utf-8?B?SEl6MlRySVYreVNqZE55cDdIL3czUWlYZEJiOUl5NmVlUllMdXg1dDlSNjdU?=
 =?utf-8?B?cmN6WTFLOGNYWEo0ODFwVHhjQ0hGWWRLT3RyZm5aSHN0RXNDblhPZXM3MUhz?=
 =?utf-8?B?ZncwVXdQa3FsTnA0OEptcEpVbDNXQzMxMlc0ZXFMZEROY25YUWpVdXBpUnZB?=
 =?utf-8?B?elFXV3AvK3hnM1Bia2RkSFVBSjBQYldoUmRONXhKYU1xVkI4T1MrRGh3dG1H?=
 =?utf-8?B?MFJDZEg0eW5uOURxTUtjaWlCNG02SzVlWXJlLzFTUE9mSHROVm1OVXVYRjd5?=
 =?utf-8?B?YjEyWjJwT2NZSGgxTFR3aFVGN0MrZWwzb0pjYzhtcW8rN0I3bmhpcUJkZTNY?=
 =?utf-8?B?RGcyNTVEQlZLT0JWSlRNYkwwenhhR2VIRnBvQk9tQ1VMc0ZpL0JCSWR4N0ds?=
 =?utf-8?B?ZElzUTVqZ1lwSEd0ZjcrZmNLM3FuaWxwY0sxTldpMzFOZC8xeU16bTJ5UjBB?=
 =?utf-8?B?d1E4Rjl6Ym1RdU5PUk9haWdwS3dTQkpqaERPNkdXbWlvQnBlT2lqRURUekRJ?=
 =?utf-8?B?dDYwa1pFRWRKL3ViQ3ZUQ3BWWFNGZ2tDaS9ub0d2TDh5Q0prNmNxaWxhbWhS?=
 =?utf-8?B?L0lGSjJuSUxNVVN1M0xLZWNaN0tkaGpmL1YvejkxNlFuZmxWZVpISDdXVVE4?=
 =?utf-8?B?OXMxeVphU2JmNDR0VHY2Y0hScGN4aGNkZnF2Um1VcWQ3Y0NSSWIrVWgyM01H?=
 =?utf-8?B?MFRoZ25MbnE5QTVHR20yYnBRa1A0V0FLS2k1dHd3SjhZMkhUMVJhK0VhendF?=
 =?utf-8?B?empHcVNza0JxZkhsQklTSWl0blNDRy8yQ3JZN0lGbndXcXNER1o4ck9YelVF?=
 =?utf-8?B?TWVibjdxUTFXZndrRnYrZjduL2MyV3krcWRSR1hHdHo5NXV0YWswU1cyK0pG?=
 =?utf-8?B?SkpIU1BadnluU0oyVFI2UEtDeU83T0hLdG9MTUl6Q0hDTlRIdHpCbCtCaVRw?=
 =?utf-8?B?cFFnMVFsM1NYMHlQcVpwNmU2Rmw1THRYWFo3Q0UrVmg4bUE0aFhMdnE1UU1Q?=
 =?utf-8?B?bkpXRk45c2F5cGhMZmpmQjRaQkFzY3J0Z3U1UzV1ZmpHeHU2NHB4SGl3b3dM?=
 =?utf-8?B?QzVSaDFIV0xrY2h5MzJaOWtsWTlKM0cwZnpGdlVCdXIwd2VlOHNwMWg1TWpV?=
 =?utf-8?B?TEpMSmRaU2RLWlZFQkpaeFF4TnpaZC9Wc0ZkMWo4cy9JT3VZVG9sRGtlTmJM?=
 =?utf-8?B?T0FvK0wzZHNwZTVVcjdVMm54eTV1Z3ZUSDQ3anVJZWZIRW8xUHp0R2hhOTFl?=
 =?utf-8?B?ZTRlMlFSR3h0aDZUdXVSM2QreGFQcjZWMldwb2pHN2QyWE9tSE82Z2ZHbW9q?=
 =?utf-8?B?NzZNL1VvNHAzMGRNMnpWVmlBdS9FOXJ2UVAvTnZFSWlMWG9yVitvVllOUlZT?=
 =?utf-8?B?SWFVeHVxYlRWemJ0WHJZYndmRnFCUHJPVFRMSllqOGR4aEhnUkJNend6djcw?=
 =?utf-8?B?ejdDSmNNcGlsZDB1V3NpT0dlODNIdGN1UzRhV3lteSt0c2U5RUVyVWFPM1ZF?=
 =?utf-8?B?REFYZ01rQVpWUWQzK0YxdHVNR3pSbUZCMjlURFhhdCs5NW81UUdPSXZGSkRr?=
 =?utf-8?B?SHpZOVVUUjF1Qzl5YmtKc1E0TVJxenNmczAvby9tMnd4OVFacWkwWXZ6R3hI?=
 =?utf-8?B?WVE9PQ==?=
Content-ID: <BC8AC459C5585D4B89B64BD918DB7AB0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56c8ca7d-0774-4339-c246-08db60d9b9ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 06:47:24.6062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gmd5tG2uuZi9emJVp6py2fJafKZlFgwCcTNk7om6qtalxZJegrQriM5tIf3iH4+pspYqXoK9SacISzJ8QO/GGixEYd4TuQGisqbkz3leQUI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_234736_740573_33B6CB65 
X-CRM114-Status: GOOD (  21.46  )
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

On 26.05.2023 17:54, Walker Chen wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Add tdm driver support for the StarFive JH7110 SoC.
> 
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> ---
>  MAINTAINERS                     |   6 +
>  sound/soc/Kconfig               |   1 +
>  sound/soc/Makefile              |   1 +
>  sound/soc/starfive/Kconfig      |  15 +
>  sound/soc/starfive/Makefile     |   2 +
>  sound/soc/starfive/jh7110_tdm.c | 679 ++++++++++++++++++++++++++++++++
>  6 files changed, 704 insertions(+)
>  create mode 100644 sound/soc/starfive/Kconfig
>  create mode 100644 sound/soc/starfive/Makefile
>  create mode 100644 sound/soc/starfive/jh7110_tdm.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2a0496448b7f..00478d07a9f4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20132,6 +20132,12 @@ F:     Documentation/devicetree/bindings/power/starfive*
>  F:     drivers/soc/starfive/jh71xx_pmu.c
>  F:     include/dt-bindings/power/starfive,jh7110-pmu.h
> 
> +STARFIVE JH7110 TDM DRIVER
> +M:     Walker Chen <walker.chen@starfivetech.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> +F:     sound/soc/starfive/jh7110_tdm.c
> +
>  STARFIVE SOC DRIVERS
>  M:     Conor Dooley <conor@kernel.org>
>  S:     Maintained
> diff --git a/sound/soc/Kconfig b/sound/soc/Kconfig
> index 848fbae26c3b..8d1d9401ecf2 100644
> --- a/sound/soc/Kconfig
> +++ b/sound/soc/Kconfig
> @@ -91,6 +91,7 @@ source "sound/soc/sh/Kconfig"
>  source "sound/soc/sof/Kconfig"
>  source "sound/soc/spear/Kconfig"
>  source "sound/soc/sprd/Kconfig"
> +source "sound/soc/starfive/Kconfig"
>  source "sound/soc/sti/Kconfig"
>  source "sound/soc/stm/Kconfig"
>  source "sound/soc/sunxi/Kconfig"
> diff --git a/sound/soc/Makefile b/sound/soc/Makefile
> index 507eaed1d6a1..65aeb4ef4068 100644
> --- a/sound/soc/Makefile
> +++ b/sound/soc/Makefile
> @@ -59,6 +59,7 @@ obj-$(CONFIG_SND_SOC) += sh/
>  obj-$(CONFIG_SND_SOC)  += sof/
>  obj-$(CONFIG_SND_SOC)  += spear/
>  obj-$(CONFIG_SND_SOC)  += sprd/
> +obj-$(CONFIG_SND_SOC)  += starfive/
>  obj-$(CONFIG_SND_SOC)  += sti/
>  obj-$(CONFIG_SND_SOC)  += stm/
>  obj-$(CONFIG_SND_SOC)  += sunxi/
> diff --git a/sound/soc/starfive/Kconfig b/sound/soc/starfive/Kconfig
> new file mode 100644
> index 000000000000..fafb681f8c0a
> --- /dev/null
> +++ b/sound/soc/starfive/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config SND_SOC_STARFIVE
> +       tristate "Audio support for StarFive SoC"
> +       depends on COMPILE_TEST || ARCH_STARFIVE
> +       help
> +         Say Y or M if you want to add support for codecs attached to
> +         the Starfive SoCs' Audio interfaces. You will also need to
> +         select the audio interfaces to support below.
> +
> +config SND_SOC_JH7110_TDM
> +       tristate "JH7110 TDM device driver"
> +       depends on HAVE_CLK && SND_SOC_STARFIVE
> +       select SND_SOC_GENERIC_DMAENGINE_PCM
> +       help
> +         Say Y or M if you want to add support for StarFive TDM driver.
> diff --git a/sound/soc/starfive/Makefile b/sound/soc/starfive/Makefile
> new file mode 100644
> index 000000000000..f7d960211d72
> --- /dev/null
> +++ b/sound/soc/starfive/Makefile
> @@ -0,0 +1,2 @@
> +# StarFive Platform Support
> +obj-$(CONFIG_SND_SOC_JH7110_TDM) += jh7110_tdm.o
> diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
> new file mode 100644
> index 000000000000..973b910d2d3e
> --- /dev/null
> +++ b/sound/soc/starfive/jh7110_tdm.c
> @@ -0,0 +1,679 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * jh7110_tdm.c -- StarFive JH7110 TDM driver
> + *
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + *
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/dmaengine.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/types.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/initval.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +
> +#define TDM_PCMGBCR                    0x00
> +       #define PCMGBCR_MASK            0x1e

This is not used.

> +       #define PCMGBCR_ENABLE          BIT(0)

Same

> +       #define PCMGBCR_TRITXEN         BIT(4)

This is not used

> +       #define CLKPOL_BIT              5
> +       #define TRITXEN_BIT             4
> +       #define ELM_BIT                 3
> +       #define SYNCM_BIT               2
> +       #define MS_BIT                  1

Instead of these *_BIT defines as plain numbers you can defined them using
BIT() macro and use macros in place instead of
       enum TDM_CLKPOL clkpolity;
       enum TDM_ELM    elm;
       enum TDM_SYNCM  syncm;
       enum TDM_MASTER_SLAVE_MODE ms_mode;

These 1 tab indentation in defines seems a bit odd.

> +#define TDM_PCMTXCR                    0x04
> +       #define PCMTXCR_TXEN            BIT(0)
> +       #define IFL_BIT                 11
> +       #define WL_BIT                  8
> +       #define SSCALE_BIT              4
> +       #define SL_BIT                  2
> +       #define LRJ_BIT                 1
> +#define TDM_PCMRXCR                    0x08
> +       #define PCMRXCR_RXEN            BIT(0)
> +       #define PCMRXCR_RXSL_MASK       0xc

These:

> +       #define PCMRXCR_RXSL_16BIT      0x4
> +       #define PCMRXCR_RXSL_32BIT      0x8
> +       #define PCMRXCR_SCALE_MASK      0xf0
> +       #define PCMRXCR_SCALE_1CH       0x10

are not used

> +#define TDM_PCMDIV                     0x0c
> +
> +#define JH7110_TDM_FIFO                        0x170c0000
> +#define JH7110_TDM_FIFO_DEPTH          32
> +
> +enum TDM_MASTER_SLAVE_MODE {
> +       TDM_AS_MASTER = 0,
> +       TDM_AS_SLAVE,
> +};
> +
> +enum TDM_CLKPOL {
> +       /* tx raising and rx falling */
> +       TDM_TX_RASING_RX_FALLING = 0,
> +       /* tx falling and rx raising */
> +       TDM_TX_FALLING_RX_RASING,
> +};
> +
> +enum TDM_ELM {
> +       /* only work while SYNCM=0 */
> +       TDM_ELM_LATE = 0,
> +       TDM_ELM_EARLY,
> +};
> +
> +enum TDM_SYNCM {
> +       /* short frame sync */
> +       TDM_SYNCM_SHORT = 0,
> +       /* long frame sync */
> +       TDM_SYNCM_LONG,
> +};
> +
> +enum TDM_IFL {
> +       /* FIFO to send or received : half-1/2, Quarter-1/4 */
> +       TDM_FIFO_HALF = 0,
> +       TDM_FIFO_QUARTER,
> +};
> +
> +enum TDM_WL {
> +       /* send or received word length */
> +       TDM_8BIT_WORD_LEN = 0,
> +       TDM_16BIT_WORD_LEN,
> +       TDM_20BIT_WORD_LEN,
> +       TDM_24BIT_WORD_LEN,
> +       TDM_32BIT_WORD_LEN,
> +};
> +
> +enum TDM_SL {
> +       /* send or received slot length */
> +       TDM_8BIT_SLOT_LEN = 0,
> +       TDM_16BIT_SLOT_LEN,
> +       TDM_32BIT_SLOT_LEN,
> +};
> +
> +enum TDM_LRJ {
> +       /* left-justify or right-justify */
> +       TDM_RIGHT_JUSTIFY = 0,
> +       TDM_LEFT_JUSTIFT,
> +};
> +
> +struct tdm_chan_cfg {
> +       enum TDM_IFL ifl;
> +       enum TDM_WL  wl;
> +       unsigned char sscale;
> +       enum TDM_SL  sl;
> +       enum TDM_LRJ lrj;
> +       unsigned char enable;
> +};
> +
> +struct jh7110_tdm_dev {
> +       void __iomem *tdm_base;
> +       struct device *dev;
> +       struct clk_bulk_data clks[6];
> +       struct reset_control *resets;
> +
> +       enum TDM_CLKPOL clkpolity;
> +       enum TDM_ELM    elm;
> +       enum TDM_SYNCM  syncm;
> +       enum TDM_MASTER_SLAVE_MODE ms_mode;
> +
> +       struct tdm_chan_cfg tx;
> +       struct tdm_chan_cfg rx;
> +
> +       u16 syncdiv;
> +       u32 samplerate;
> +       u32 pcmclk;
> +
> +       /* data related to DMA transfers b/w tdm and DMAC */
> +       struct snd_dmaengine_dai_dma_data play_dma_data;
> +       struct snd_dmaengine_dai_dma_data capture_dma_data;
> +       u32 saved_pcmgbcr;
> +       u32 saved_pcmtxcr;
> +       u32 saved_pcmrxcr;
> +       u32 saved_pcmdiv;
> +};
> +
> +static inline u32 jh7110_tdm_readl(struct jh7110_tdm_dev *tdm, u16 reg)
> +{
> +       return readl_relaxed(tdm->tdm_base + reg);
> +}
> +
> +static inline void jh7110_tdm_writel(struct jh7110_tdm_dev *tdm, u16 reg, u32 val)
> +{
> +       writel_relaxed(val, tdm->tdm_base + reg);
> +}
> +
> +static void jh7110_tdm_save_context(struct jh7110_tdm_dev *tdm,
> +                                   struct snd_pcm_substream *substream)
> +{
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               tdm->saved_pcmtxcr = jh7110_tdm_readl(tdm, TDM_PCMTXCR);
> +       else
> +               tdm->saved_pcmrxcr = jh7110_tdm_readl(tdm, TDM_PCMRXCR);
> +}
> +
> +static void jh7110_tdm_start(struct jh7110_tdm_dev *tdm,
> +                            struct snd_pcm_substream *substream)
> +{
> +       u32 data;
> +
> +       data = jh7110_tdm_readl(tdm, TDM_PCMGBCR);
> +       jh7110_tdm_writel(tdm, TDM_PCMGBCR, data | PCMGBCR_ENABLE);
> +
> +       /* restore context */
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               jh7110_tdm_writel(tdm, TDM_PCMTXCR, tdm->saved_pcmtxcr | PCMTXCR_TXEN);
> +       else
> +               jh7110_tdm_writel(tdm, TDM_PCMRXCR, tdm->saved_pcmrxcr | PCMRXCR_RXEN);
> +}
> +
> +static void jh7110_tdm_stop(struct jh7110_tdm_dev *tdm,
> +                           struct snd_pcm_substream *substream)
> +{
> +       unsigned int val;
> +
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +               val = jh7110_tdm_readl(tdm, TDM_PCMTXCR);
> +               val &= ~PCMTXCR_TXEN;
> +               jh7110_tdm_writel(tdm, TDM_PCMTXCR, val);
> +       } else {
> +               val = jh7110_tdm_readl(tdm, TDM_PCMRXCR);
> +               val &= ~PCMRXCR_RXEN;
> +               jh7110_tdm_writel(tdm, TDM_PCMRXCR, val);
> +       }
> +}
> +
> +static int jh7110_tdm_syncdiv(struct jh7110_tdm_dev *tdm)
> +{
> +       u32 sl, sscale, syncdiv;
> +
> +       if (tdm->rx.sl >= tdm->tx.sl)
> +               sl = tdm->rx.sl;
> +       else
> +               sl = tdm->tx.sl;
> +
> +       if (tdm->rx.sscale >= tdm->tx.sscale)
> +               sscale = tdm->rx.sscale;
> +       else
> +               sscale = tdm->tx.sscale;
> +
> +       syncdiv = tdm->pcmclk / tdm->samplerate - 1;
> +
> +       if ((syncdiv + 1) < (sl * sscale)) {
> +               dev_err(tdm->dev, "Failed to set syncdiv!\n");
> +               return -EINVAL;
> +       }
> +
> +       if (tdm->syncm == TDM_SYNCM_LONG &&
> +           (tdm->rx.sscale <= 1 || tdm->tx.sscale <= 1) &&
> +           ((syncdiv + 1) <= sl)) {
> +               dev_err(tdm->dev, "Wrong syncdiv! It must be (syncdiv+1) > max[tx.sl, rx.sl]\n");
> +               return -EINVAL;
> +       }
> +
> +       jh7110_tdm_writel(tdm, TDM_PCMDIV, syncdiv);
> +       return 0;
> +}
> +
> +static int jh7110_tdm_config(struct jh7110_tdm_dev *tdm,
> +                            struct snd_pcm_substream *substream)
> +{
> +       u32 datarx, datatx;
> +       int ret;
> +
> +       ret = jh7110_tdm_syncdiv(tdm);
> +       if (ret)
> +               return ret;
> +
> +       datarx = (tdm->rx.ifl << IFL_BIT) |
> +                 (tdm->rx.wl << WL_BIT) |
> +                 (tdm->rx.sscale << SSCALE_BIT) |
> +                 (tdm->rx.sl << SL_BIT) |
> +                 (tdm->rx.lrj << LRJ_BIT);
> +
> +       datatx = (tdm->tx.ifl << IFL_BIT) |
> +                 (tdm->tx.wl << WL_BIT) |
> +                 (tdm->tx.sscale << SSCALE_BIT) |
> +                 (tdm->tx.sl << SL_BIT) |
> +                 (tdm->tx.lrj << LRJ_BIT);
> +
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +               jh7110_tdm_writel(tdm, TDM_PCMTXCR, datatx);
> +       else
> +               jh7110_tdm_writel(tdm, TDM_PCMRXCR, datarx);
> +
> +       return 0;
> +}
> +
> +static void jh7110_tdm_clk_disable(struct jh7110_tdm_dev *tdm)
> +{
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(tdm->clks), tdm->clks);
> +}
> +
> +static int jh7110_tdm_clk_enable(struct jh7110_tdm_dev *tdm)
> +{
> +       int ret;
> +
> +       ret = clk_bulk_prepare_enable(ARRAY_SIZE(tdm->clks), tdm->clks);
> +       if (ret) {
> +               dev_err(tdm->dev, "Failed to enable tdm clocks\n");
> +               return ret;
> +       }
> +
> +       ret = reset_control_deassert(tdm->resets);
> +       if (ret) {
> +               dev_err(tdm->dev, "Failed to deassert tdm resets\n");
> +               goto dis_tdm_clk;
> +       }
> +
> +       /* select tdm_ext clock as the clock source for tdm */
> +       ret = clk_set_parent(tdm->clks[5].clk, tdm->clks[4].clk);
> +       if (ret) {
> +               dev_err(tdm->dev, "Can't set extern clock source for clk_tdm\n");
> +               goto dis_tdm_clk;
> +       }
> +
> +       return 0;
> +
> +dis_tdm_clk:
> +       clk_bulk_disable_unprepare(ARRAY_SIZE(tdm->clks), tdm->clks);
> +
> +       return ret;
> +}
> +
> +static int jh7110_tdm_runtime_suspend(struct device *dev)
> +{
> +       struct jh7110_tdm_dev *tdm = dev_get_drvdata(dev);
> +
> +       jh7110_tdm_clk_disable(tdm);
> +       return 0;
> +}
> +
> +static int jh7110_tdm_runtime_resume(struct device *dev)
> +{
> +       struct jh7110_tdm_dev *tdm = dev_get_drvdata(dev);
> +
> +       return jh7110_tdm_clk_enable(tdm);
> +}
> +
> +static int jh7110_tdm_system_suspend(struct device *dev)
> +{
> +       struct jh7110_tdm_dev *tdm = dev_get_drvdata(dev);
> +
> +       /* save context */
> +       tdm->saved_pcmgbcr = jh7110_tdm_readl(tdm, TDM_PCMGBCR);
> +       tdm->saved_pcmdiv = jh7110_tdm_readl(tdm, TDM_PCMDIV);
> +
> +       return pm_runtime_force_suspend(dev);
> +}
> +
> +static int jh7110_tdm_system_resume(struct device *dev)
> +{
> +       struct jh7110_tdm_dev *tdm = dev_get_drvdata(dev);
> +
> +       /* restore context */
> +       jh7110_tdm_writel(tdm, TDM_PCMGBCR, tdm->saved_pcmgbcr);
> +       jh7110_tdm_writel(tdm, TDM_PCMDIV, tdm->saved_pcmdiv);
> +
> +       return pm_runtime_force_resume(dev);
> +}
> +
> +static const struct snd_soc_component_driver jh7110_tdm_component = {
> +       .name = "jh7110-tdm",
> +};
> +
> +static int jh7110_tdm_startup(struct snd_pcm_substream *substream,
> +                             struct snd_soc_dai *cpu_dai)
> +{
> +       struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
> +       struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +
> +       dai_link->stop_dma_first = 1;
> +
> +       return 0;
> +}
> +
> +static int jh7110_tdm_hw_params(struct snd_pcm_substream *substream,
> +                               struct snd_pcm_hw_params *params,
> +                               struct snd_soc_dai *dai)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
> +       int chan_wl, chan_sl, chan_nr;
> +       unsigned int data_width;
> +       unsigned int dma_bus_width;
> +       struct snd_dmaengine_dai_dma_data *dma_data = NULL;
> +       int ret;
> +
> +       data_width = params_width(params);
> +
> +       tdm->samplerate = params_rate(params);
> +       tdm->pcmclk = params_channels(params) * tdm->samplerate * data_width;
> +
> +       switch (params_format(params)) {
> +       case SNDRV_PCM_FORMAT_S16_LE:
> +               chan_wl = TDM_16BIT_WORD_LEN;
> +               chan_sl = TDM_16BIT_SLOT_LEN;
> +               dma_bus_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +               break;
> +
> +       case SNDRV_PCM_FORMAT_S32_LE:
> +               chan_wl = TDM_32BIT_WORD_LEN;
> +               chan_sl = TDM_32BIT_SLOT_LEN;
> +               dma_bus_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +               break;
> +
> +       default:
> +               dev_err(tdm->dev, "tdm: unsupported PCM fmt");
> +               return -EINVAL;
> +       }
> +
> +       chan_nr = params_channels(params);
> +       switch (chan_nr) {
> +       case 1:
> +       case 2:
> +       case 4:
> +       case 6:
> +       case 8:
> +               break;
> +       default:
> +               dev_err(tdm->dev, "channel not supported\n");
> +               return -EINVAL;
> +       }
> +
> +       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +               tdm->tx.wl = chan_wl;
> +               tdm->tx.sl = chan_sl;
> +               tdm->tx.sscale = chan_nr;
> +               tdm->play_dma_data.addr_width = dma_bus_width;
> +               dma_data = &tdm->play_dma_data;
> +       } else {
> +               tdm->rx.wl = chan_wl;
> +               tdm->rx.sl = chan_sl;
> +               tdm->rx.sscale = chan_nr;
> +               tdm->capture_dma_data.addr_width = dma_bus_width;
> +               dma_data = &tdm->capture_dma_data;
> +       }
> +
> +       snd_soc_dai_set_dma_data(dai, substream, dma_data);
> +
> +       ret = jh7110_tdm_config(tdm, substream);
> +       if (ret)
> +               return ret;
> +
> +       jh7110_tdm_save_context(tdm, substream);
> +       return 0;
> +}
> +
> +static int jh7110_tdm_trigger(struct snd_pcm_substream *substream,
> +                             int cmd, struct snd_soc_dai *dai)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
> +       int ret = 0;
> +
> +       switch (cmd) {
> +       case SNDRV_PCM_TRIGGER_START:
> +       case SNDRV_PCM_TRIGGER_RESUME:
> +       case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               jh7110_tdm_start(tdm, substream);
> +               break;
> +
> +       case SNDRV_PCM_TRIGGER_STOP:
> +       case SNDRV_PCM_TRIGGER_SUSPEND:
> +       case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +               jh7110_tdm_stop(tdm, substream);
> +               break;
> +       default:
> +               ret = -EINVAL;
> +               break;
> +       }
> +
> +       return ret;
> +}
> +
> +static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
> +                                 unsigned int fmt)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(cpu_dai);
> +       unsigned int gbcr;
> +
> +       /* set master/slave audio interface */
> +       switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +       case SND_SOC_DAIFMT_BP_FP:
> +               /* cpu is master */
> +               tdm->ms_mode = TDM_AS_MASTER;
> +               break;
> +       case SND_SOC_DAIFMT_BC_FC:
> +               /* codec is master */
> +               tdm->ms_mode = TDM_AS_SLAVE;
> +               break;
> +       case SND_SOC_DAIFMT_BC_FP:
> +       case SND_SOC_DAIFMT_BP_FC:
> +               return -EINVAL;
> +       default:
> +               dev_dbg(tdm->dev, "dwc : Invalid clock provider format\n");
> +               return -EINVAL;
> +       }
> +
> +       gbcr = (tdm->clkpolity << CLKPOL_BIT) |
> +               (tdm->elm << ELM_BIT) |
> +               (tdm->syncm << SYNCM_BIT) |
> +               (tdm->ms_mode << MS_BIT);
> +       jh7110_tdm_writel(tdm, TDM_PCMGBCR, gbcr);
> +
> +       return 0;
> +}
> +
> +static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
> +       .startup        = jh7110_tdm_startup,
> +       .hw_params      = jh7110_tdm_hw_params,
> +       .trigger        = jh7110_tdm_trigger,
> +       .set_fmt        = jh7110_tdm_set_dai_fmt,
> +};
> +
> +static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
> +
> +       snd_soc_dai_init_dma_data(dai, &tdm->play_dma_data, &tdm->capture_dma_data);
> +       snd_soc_dai_set_drvdata(dai, tdm);
> +       return 0;
> +}
> +
> +#define JH7110_TDM_RATES       SNDRV_PCM_RATE_8000_48000
> +
> +#define JH7110_TDM_FORMATS     (SNDRV_PCM_FMTBIT_S16_LE | \
> +                                SNDRV_PCM_FMTBIT_S32_LE)
> +
> +static struct snd_soc_dai_driver jh7110_tdm_dai = {
> +       .name = "sf_tdm",
> +       .id = 0,
> +       .playback = {
> +               .stream_name    = "Playback",
> +               .channels_min   = 1,
> +               .channels_max   = 8,
> +               .rates          = JH7110_TDM_RATES,
> +               .formats        = JH7110_TDM_FORMATS,
> +       },
> +       .capture = {
> +               .stream_name    = "Capture",
> +               .channels_min   = 1,
> +               .channels_max   = 8,
> +               .rates          = JH7110_TDM_RATES,
> +               .formats        = JH7110_TDM_FORMATS,
> +       },
> +       .ops = &jh7110_tdm_dai_ops,
> +       .probe = jh7110_tdm_dai_probe,
> +       .symmetric_rate = 1,
> +};
> +
> +static const struct snd_pcm_hardware jh7110_pcm_hardware = {
> +       .info                   = (SNDRV_PCM_INFO_MMAP          |
> +                                  SNDRV_PCM_INFO_MMAP_VALID    |
> +                                  SNDRV_PCM_INFO_PAUSE         |
> +                                  SNDRV_PCM_INFO_RESUME        |
> +                                  SNDRV_PCM_INFO_INTERLEAVED   |
> +                                  SNDRV_PCM_INFO_BLOCK_TRANSFER),
> +       .buffer_bytes_max       = 192512,
> +       .period_bytes_min       = 4096,
> +       .period_bytes_max       = 32768,
> +       .periods_min            = 1,
> +       .periods_max            = 48,
> +       .fifo_size              = 16,
> +};
> +
> +static const struct snd_dmaengine_pcm_config jh7110_dmaengine_pcm_config = {
> +       .pcm_hardware = &jh7110_pcm_hardware,
> +       .prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
> +       .prealloc_buffer_size = 192512,
> +};
> +
> +static void jh7110_tdm_init_params(struct jh7110_tdm_dev *tdm)
> +{
> +       tdm->clkpolity = TDM_TX_RASING_RX_FALLING;
> +       tdm->elm = TDM_ELM_LATE;
> +       tdm->syncm = TDM_SYNCM_SHORT;
> +
> +       tdm->rx.ifl = TDM_FIFO_HALF;
> +       tdm->tx.ifl = TDM_FIFO_HALF;
> +       tdm->rx.wl = TDM_16BIT_WORD_LEN;
> +       tdm->tx.wl = TDM_16BIT_WORD_LEN;
> +       tdm->rx.sscale = 2;
> +       tdm->tx.sscale = 2;
> +       tdm->rx.lrj = TDM_LEFT_JUSTIFT;
> +       tdm->tx.lrj = TDM_LEFT_JUSTIFT;
> +
> +       tdm->play_dma_data.addr = JH7110_TDM_FIFO;
> +       tdm->play_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +       tdm->play_dma_data.fifo_size = JH7110_TDM_FIFO_DEPTH / 2;
> +       tdm->play_dma_data.maxburst = 16;
> +
> +       tdm->capture_dma_data.addr = JH7110_TDM_FIFO;
> +       tdm->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +       tdm->capture_dma_data.fifo_size = JH7110_TDM_FIFO_DEPTH / 2;
> +       tdm->capture_dma_data.maxburst = 8;
> +}
> +
> +static int jh7110_tdm_clk_reset_get(struct platform_device *pdev,
> +                                   struct jh7110_tdm_dev *tdm)
> +{
> +       int ret;
> +
> +       tdm->clks[0].id = "mclk_inner";
> +       tdm->clks[1].id = "tdm_ahb";
> +       tdm->clks[2].id = "tdm_apb";
> +       tdm->clks[3].id = "tdm_internal";
> +       tdm->clks[4].id = "tdm_ext";
> +       tdm->clks[5].id = "tdm";
> +
> +       ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(tdm->clks), tdm->clks);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to get tdm clocks\n");
> +               return ret;
> +       }
> +
> +       tdm->resets = devm_reset_control_array_get_exclusive(&pdev->dev);
> +       if (IS_ERR_OR_NULL(tdm->resets)) {

Looking in depth on devm_reset_control_array_get_exclusive() it seems the
NULL cannot be returned by devm_reset_control_array_get_exclusive() as
optinal argument is false, thus the IS_ERR() that was here on previous
version was good. Could you return back to that? Sorry for the confusion.

> +               ret = PTR_ERR(tdm->resets);
> +               dev_err(&pdev->dev, "Failed to get tdm resets");
> +               return ret;

Also, you could avoid this return
> +       }
> +
> +       return 0;

and do here:
	return ret;

Other than this:

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> +}
> +
> +static int jh7110_tdm_probe(struct platform_device *pdev)
> +{
> +       struct jh7110_tdm_dev *tdm;
> +       int ret;
> +
> +       tdm = devm_kzalloc(&pdev->dev, sizeof(*tdm), GFP_KERNEL);
> +       if (!tdm)
> +               return -ENOMEM;
> +
> +       tdm->tdm_base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(tdm->tdm_base))
> +               return PTR_ERR(tdm->tdm_base);
> +
> +       tdm->dev = &pdev->dev;
> +
> +       ret = jh7110_tdm_clk_reset_get(pdev, tdm);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to enable audio-tdm clock\n");
> +               return ret;
> +       }
> +
> +       jh7110_tdm_init_params(tdm);
> +
> +       dev_set_drvdata(&pdev->dev, tdm);
> +       ret = devm_snd_soc_register_component(&pdev->dev, &jh7110_tdm_component,
> +                                             &jh7110_tdm_dai, 1);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Failed to register dai\n");
> +               return ret;
> +       }
> +
> +       ret = devm_snd_dmaengine_pcm_register(&pdev->dev,
> +                                             &jh7110_dmaengine_pcm_config,
> +                                             SND_DMAENGINE_PCM_FLAG_COMPAT);
> +       if (ret) {
> +               dev_err(&pdev->dev, "Could not register pcm: %d\n", ret);
> +               return ret;
> +       }
> +
> +       pm_runtime_enable(&pdev->dev);
> +       if (!pm_runtime_enabled(&pdev->dev)) {
> +               ret = jh7110_tdm_runtime_resume(&pdev->dev);
> +               if (ret)
> +                       goto err_pm_disable;
> +       }
> +
> +       return 0;
> +
> +err_pm_disable:
> +       pm_runtime_disable(&pdev->dev);
> +
> +       return ret;
> +}
> +
> +static int jh7110_tdm_dev_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_disable(&pdev->dev);
> +       return 0;
> +}
> +
> +static const struct of_device_id jh7110_tdm_of_match[] = {
> +       { .compatible = "starfive,jh7110-tdm", },
> +       {}
> +};
> +
> +MODULE_DEVICE_TABLE(of, jh7110_tdm_of_match);
> +
> +static const struct dev_pm_ops jh7110_tdm_pm_ops = {
> +       RUNTIME_PM_OPS(jh7110_tdm_runtime_suspend,
> +                      jh7110_tdm_runtime_resume, NULL)
> +       SYSTEM_SLEEP_PM_OPS(jh7110_tdm_system_suspend,
> +                           jh7110_tdm_system_resume)
> +};
> +
> +static struct platform_driver jh7110_tdm_driver = {
> +       .driver = {
> +               .name = "jh7110-tdm",
> +               .of_match_table = jh7110_tdm_of_match,
> +               .pm = pm_ptr(&jh7110_tdm_pm_ops),
> +       },
> +       .probe = jh7110_tdm_probe,
> +       .remove = jh7110_tdm_dev_remove,
> +};
> +module_platform_driver(jh7110_tdm_driver);
> +
> +MODULE_DESCRIPTION("StarFive JH7110 TDM ASoC Driver");
> +MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
