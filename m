Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D949C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 08:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOpBs60ZUi0Vw9nv8wkclRbBfXbomd4sp572TnELzE0=; b=zQdW9pFADGxP2D
	QlK4cC6AoqWHK9fXeMx5HKdC0iv+wN7zbF4eMAa3O8tDXNk4J4bKUbG+Ys4+vitNpNq3fQ73OXA6u
	UeFFmaRorsC1JfGxwhdMwTsd2IhaTjUXUDo/aSdHpnud9rKE6tMVIeRWZxBgKbTLYnlFBP2AsdvH0
	fJxbYU94fM1WlM0e5eoBgGBZdLMul7kWA3jppinec1mHAlOqWjCpbQR8xt2Rev/2Ti39W0FtG8xTF
	3snlm82YDI2EQwOC0/Q6zFwo3zITfbZevi/PI4itwNdPkOQRbb91XIHdwjW4IE1RjDUzJqV/Qzfa1
	BH2YBJh1Nr4xwS5uTy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCdA-008sok-0f;
	Wed, 17 May 2023 08:35:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzCd4-008sm5-2T
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 08:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684312526; x=1715848526;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=eN4Uo9DQ6L1GpOEZPxkrmyBzTSSjSvdvTgxHZ2TZwwc=;
  b=Z+SR0HWwK1b++oGcnUbLRyQKDd41s/A0Mrn05Cge98rAUYXuUYPKAGWA
   4TaNseMuAeJHXZcCVTFVclC7g4MMkiZs4Y05gXNwOPrZo5zsBqFCO1q4s
   qNT5aql5BktUMUnMuRm5ldvl4GtY28HqzVZYgjCTK6yvRXwTlMc2jW2IL
   KqL/HoQ/qZ07iOH2uPBTl2hUvcqBwH7+Wu6UeovIaUQsKW/hYp3IfvTXn
   dPA/w4mgRUpTV0N5MgBLAJFRB1FzTWC/nTT+Ed0VIP6nus8vh+XGQlRrb
   KLBN4UZp57GMqpB1Noz7WB4CukT1JUyvLcdKDa6ybNcFynN4daSSanSq+
   g==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600"; 
   d="scan'208";a="213689038"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 01:35:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 01:35:21 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 17 May 2023 01:35:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJY+jAEXOJuHXuCva7JUThi4vSsO0RvzRZCE0AjungIocq9RHCVFSt4NSocGtayd82V76n9bMzcwzeQFmJpx85VD6VRk+pTnWqWuZq9UVoZag+dlqnKsD5qTUYInwSUSuRCvim3fdCzc3cR1HKtYoerR6f7dF7kLbu/06V68Uy6M24FDtcuk9fYpArSi/T4xa2t/VxRODgZUq6/XflRdJCy8V4XfT8a84SPwtsMSz6cEvY4u1Isg36Vhjns358FbizdKrdJbgnK1h+AzDtjLSSqlribTSkXuDB9Ph1OqsBQ25pYLvWKUMenMWJ7DUvLo0sIWFzG9TPUMQSZnSggBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eN4Uo9DQ6L1GpOEZPxkrmyBzTSSjSvdvTgxHZ2TZwwc=;
 b=CmWtflVyt/wjcXsIzVJFXz2Ut0yTs3OlOAM/Ke5Bt7CQzYLc9xwKGgIHgTOLcR4ktsd5mDmjHnif50zfIqLSSbrJ9MQ+7iDbzXwkTyZu09jhD0mV5kEm8/fVt1e/o7QAaBS5F3EzLkTTqYi6IMiizaZOuDRdyhdM9aT3j897T9MMDa+Om+m3k/jDdrCEVc5OGGMxcw/sFl4xUxOMPVsTm0/pfZY5PJjUPlykbsZEBBw5lEzDpcO14Zczc8OHpzXH7wazi2AxdgNvXqDzg5xw/evBHC9X2XOroqQNeBBAK8NrF1jLNpQR1mW80JDxGLMRx2fBqh8Apq4zBfRsEOun/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eN4Uo9DQ6L1GpOEZPxkrmyBzTSSjSvdvTgxHZ2TZwwc=;
 b=tUHnwnATTKitZLx8C/LSuSeadtWeNGE6z0LKZEDxyI9DCvcFKoOcFEd6koWBeGWlEGXi/FATKP4I0qOwcoWbOlj0WyML8R3tWa0Yst5KHZ3N9LHnp9elsOMLbAsN845FdN5XpEM0S1s5ftZjmaael2yLRnDjnlDC/A9ZvG9RDfI=
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com (2603:10b6:a03:4c3::17)
 by SJ0PR11MB6790.namprd11.prod.outlook.com (2603:10b6:a03:483::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Wed, 17 May
 2023 08:35:18 +0000
Received: from SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be]) by SJ2PR11MB7648.namprd11.prod.outlook.com
 ([fe80::27bf:a69f:806f:67be%5]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 08:35:18 +0000
From: <Claudiu.Beznea@microchip.com>
To: <walker.chen@starfivetech.com>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <perex@perex.cz>, <tiwai@suse.com>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<Conor.Dooley@microchip.com>, <emil.renner.berthing@canonical.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 2/3] ASoC: starfive: Add JH7110 TDM driver
Thread-Topic: [PATCH v4 2/3] ASoC: starfive: Add JH7110 TDM driver
Thread-Index: AQHZiJqBCRukZROcCUG2szcwmCOxRg==
Date: Wed, 17 May 2023 08:35:18 +0000
Message-ID: <89c0eb5e-81c7-ea0e-8dd9-9e08ee0c7d1d@microchip.com>
References: <20230511091549.28003-1-walker.chen@starfivetech.com>
 <20230511091549.28003-3-walker.chen@starfivetech.com>
In-Reply-To: <20230511091549.28003-3-walker.chen@starfivetech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB7648:EE_|SJ0PR11MB6790:EE_
x-ms-office365-filtering-correlation-id: 5988b67e-345e-40d9-2633-08db56b1a53b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Jk7+TYOyEDTNFVO0Hx1eMxYrnlH2dYM7SGGtPKPPAs01NJDei8W6tWrkq3mYXbYDi5B/XOrYPRPkgDAPNWMEaJv8JGPatXZfQe81p2yqi9R9fcJU0QApQeO9Xt49Wr1gUYHY1/tWWLh/1mICWrQqYDb8iM5O+xulCWP20Gvuqo3J9I+rV62v0k3Cl+HMZTKPxRWWYINGVIFl7ZU5nNuH3iLYs5JfJfZJ/s4IJAsZ9uDa/bXsiHUaaXxLO4LpJv+RrW/3qPkvj1yF1dXyncgltp7xv7XzaroduzUOQ7v78466UgDYaRE5iD5QKd+cWQ0Y4W3l5Fw10ispu9S1XAKuFHbUZX6JiOw+G+v3Grz+XPmRxOpphwA5Z0/jXQUmDOYlOgHVf4D+ooVB905x46thQDxXY62H+7urHMah2xtFJ8kt5HA3+sVPhSx8ySH/bkccHGRscUdZmKIghyv4I91zrlisRj2Yp8BwWMgYF4llfu3D6cuZjBWdllE4XhFOJn01p1lm5UGK+g6PKwWHbXHSYFp/qsVMx4PBGXLSdKINdE7ZgHA0vRwZN+lLZVlr0nIBFnPun2hPd2nS57rC7bOoh4ZYLubGrGxt1/2Cd/WyL1LnccXPhDt0xFV9ZRA2ZFRTKGmXR8RLcQ37q8ylIDmwrWVIiDyyYNZMyPCNWtrHepYP7K5Nmw1sdfCnN5OrWpjj
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(39860400002)(136003)(366004)(346002)(451199021)(36756003)(31696002)(6486002)(38070700005)(86362001)(76116006)(91956017)(54906003)(110136005)(4326008)(66446008)(66476007)(64756008)(66946007)(66556008)(316002)(478600001)(8936002)(5660300002)(71200400001)(41300700001)(8676002)(2906002)(30864003)(7416002)(38100700002)(122000001)(186003)(6506007)(6512007)(2616005)(26005)(53546011)(83380400001)(31686004)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWl1c25PdzhwUHNqTE0wMy9waGhiMzlRc044Z0ZVWnQ3Q1ZKMFpsR0hzQUcx?=
 =?utf-8?B?TlorNSt0ZWNkVlRseUlHZCtEMzd1UTI2TDVtYUp2aTZSNTRMc0JOVGlEd2hl?=
 =?utf-8?B?VU9RMytWVnhNbUFVby9LQnpnQk9RUjUwMW42REloOWJLRFhXc3Zkb09oY1RP?=
 =?utf-8?B?eHB0OWFWWGZPbnpKaEpvNHBrMmJFYXl5UmVxd0Q1cjcyMlRpWkpSV2MzcldE?=
 =?utf-8?B?cDVndGtIK1pHNzV0QU1jYVBtdWpuTW9uNmRVcG1FQVlQV0hlT1RwWmhyaWxQ?=
 =?utf-8?B?VDVpK3JPbmcyVWQ2UldyM1NsbG1MNkQrRVk2eC9seEVlQklQYWs0VUN3NUFQ?=
 =?utf-8?B?cW5OQjdjZGtzalRlcU1hbnhuWkh1Y05NeVFRZytzc2IvMVRwNjFKU3dVZmlI?=
 =?utf-8?B?cEY0dmZOWHNFMXpxQVFmZ2p3c2RndFdPNy9yWU9FTFJKcENWSzB1ejNiVVJB?=
 =?utf-8?B?UmlLQU9lSEZHcFVNWXRHUjY2NXh4UWp6M0FSRDdmT3BmdE9qaHptbzY3a2d3?=
 =?utf-8?B?enhLazFUZDFQWU9HSzlGcGJxMXU0YWFIaDhSUHltZ1g0YU1kaHltWHVpZ3BB?=
 =?utf-8?B?aVBpeE9pckxCK0VoOGNXTkZQQ1hNWlY1eXl3UEJUcldoSVhFY0dyaCtJejUz?=
 =?utf-8?B?MVdrdzhUWHdmODJZMGRwVmVMdTVwSzJGejVwUml4N1pFWWVlcGxsd3NCdW5U?=
 =?utf-8?B?YklZZm5vZm5oNDJ3cGdoU0JmTnJWYW9BM1h1K0pJck16MTIyek1yclBpeEpi?=
 =?utf-8?B?L2RFRzEvLy8xYW9sdG0zT0s5SnNjRktjT1F1NGZ2aGQrV29oODQ0UnhGQldS?=
 =?utf-8?B?YWJaVFdXTjNPbVRjYmQwbHUrTXFZM1pBODZZM1oxWHJwV3NDT2JLc3UyOEFm?=
 =?utf-8?B?WkdnRlI3VW04TlNJUzlsYk0xcWxvay9vbmxxblRIZy9aRVhrUGFzaTZESWFH?=
 =?utf-8?B?QzJXaE5NWk45c29LQ1IwUGU4OXhZUkYzZGh3andGQXZsclBaYXZNbE1QejZE?=
 =?utf-8?B?T1ZrUzgrelFibWZXNTRjRHk5K2VSYTFkUCtrUml5QVZwQkdnN1VMb2JWVytt?=
 =?utf-8?B?em1YNFcvMHN2M3Jpc0VsSmZWRUNhRWl4Qk5IY3gxOWJpWWIzd3Q1RnhVYkN1?=
 =?utf-8?B?QytaRUNtendpNEppYmFZTlQwazNYaHEram1JUnBIRzZhNEVISVIrcnNNU2Qw?=
 =?utf-8?B?T1VlbGtMSjQrbEJLMGdIMVVkVzBqNW9Na3lsVWM0QTdrVndQRDM5NHZWbG9C?=
 =?utf-8?B?TWtRMW9XdDV3TnhIdkpvWFg0L21oQTEvckdnN2xLSGliOVdzb2F0N3NDTzZR?=
 =?utf-8?B?OEhrZjd1OGFHeDloVnY1dmExcGlWQ2g1RW1xaVJMY0Q5RnI4VzNFem01TzFv?=
 =?utf-8?B?Tys2c3lBaW95SXIvMFhjSll4OS8yN3QxcWJjWGRNOUl6U2NaTmJMVnZ2MkVH?=
 =?utf-8?B?bFNxb0UzWGJXRkNIdVdTUTBKMFQ1RGI0aU8wVzg2ZklCZjFnbFNaZ3YyWWVD?=
 =?utf-8?B?azZ0aHNrNDlSMU1FMGU5bXhZaUMvSVExWnRYRnVla2tJb1k5cFFveWlFMFBD?=
 =?utf-8?B?MXY2ZWlyRHlvbEhtaHNlbndEQS9KWU5GMWQ0Qk41RDJ6YXpzU2d0SEsxZnpW?=
 =?utf-8?B?TjdvU3pyM2hpUUV1VWtlN2QzdnM2anRyQ2hoR21NYjlEYmtKMU82elovNTV3?=
 =?utf-8?B?VkVQbS9ZKzBnVVhQWFJJQ2xYRFdpZlVnVUFqTG1Idk1ZZmFoclQ2UFQzYVBP?=
 =?utf-8?B?bFlzblMwZmVKZjJVNi9PYzJ0bDBxamNUM0ZOZ3p1V0JtWWJNdnBNZUxsZnRI?=
 =?utf-8?B?elAyejc3NUdEZnJtdHVjYzh3ZzVBYUF6VHJJbjRLR3JRRkEyQ3BFcUhnUU5Y?=
 =?utf-8?B?WDh3L3ZNRHYxS1J0bXRMUXR2TFNjM0wzbHBmZExMM1Z3ajVFNzVKTkdMM2Q0?=
 =?utf-8?B?azliTDVjSW94djJXYXpwbVNWUENPcUYzOHNnYml3VjkzWWVkS01haU1iRDdP?=
 =?utf-8?B?UGpsdXJFcFJ1MHVnMEZWMzJwNG5nL2pSTHcrNkV1dVVEQXBxenZ2d3NKSFVI?=
 =?utf-8?B?c3AyTnVxNHJoZ2F2blVvb3JXbG5WUndQRC9VZUsvdmxlWjJSSUlLd2Q0T3pI?=
 =?utf-8?Q?gzWRsiQ43dktfH3V5MZ5rxmHw?=
Content-ID: <74C37B0D2C88934B94E479B5B5779C6F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5988b67e-345e-40d9-2633-08db56b1a53b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2023 08:35:18.4146
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5hrq9iaG95SLWEukzKENvEp3h515s9IkEi2uhJn9aGrpfJS0D8gmkeMMOfecnufQ/WMGDR95VhEcZ5jC/NTMqYzn2qx8HtFALNn3DZvtzao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6790
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_013527_039048_C96CE2C6 
X-CRM114-Status: GOOD (  21.15  )
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

On 11.05.2023 12:15, Walker Chen wrote:
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
>  sound/soc/starfive/jh7110_tdm.c | 554 ++++++++++++++++++++++++++++++++
>  sound/soc/starfive/jh7110_tdm.h | 138 ++++++++
>  7 files changed, 717 insertions(+)
>  create mode 100644 sound/soc/starfive/Kconfig
>  create mode 100644 sound/soc/starfive/Makefile
>  create mode 100644 sound/soc/starfive/jh7110_tdm.c
>  create mode 100644 sound/soc/starfive/jh7110_tdm.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5f9c544bc189..add89615d327 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19945,6 +19945,12 @@ F:     Documentation/devicetree/bindings/power/starfive*
>  F:     drivers/soc/starfive/jh71xx_pmu.c
>  F:     include/dt-bindings/power/starfive,jh7110-pmu.h
> 
> +STARFIVE JH7110 TDM DRIVERS
> +M:     Walker Chen <walker.chen@starfivetech.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/sound/starfive,jh7110-tdm.yaml
> +F:     sound/soc/starfive/jh7110-tdm.*
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
> index 000000000000..1f94cc210140
> --- /dev/null
> +++ b/sound/soc/starfive/jh7110_tdm.c
> @@ -0,0 +1,554 @@
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
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/initval.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include "jh7110_tdm.h"
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
> +           (tdm->rx.sscale <= 1 || tdm->tx.sscale <= 1)) {

You can add the below condition to the above if to avoid extra indentation.

> +               if ((syncdiv + 1) <= sl) {
> +                       dev_err(tdm->dev, "Wrong syncdiv! It must be (syncdiv+1) > max[tx.sl, rx.sl]\n");
> +                       return -EINVAL;
> +               }
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

Maybe not valid for your clocks but, if clocks are not HW implemented for
this, changing parent at runtime could lead to glitches and thus to
unexpected behavior. You to check if this could be valid on your hardware.

> +       if (ret) {
> +               dev_err(tdm->dev, "Can't set clock source for clk_tdm: %d\n", ret);
> +               goto dis_tdm_clk;
> +       }
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
> +static int __maybe_unused jh7110_tdm_system_suspend(struct device *dev)

__maybe_unused could be removed if SYSTEM_SLEEP_PM_OPS() is used in the
definition of jh7110_tdm_pm_ops.


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
> +static int __maybe_unused jh7110_tdm_system_resume(struct device *dev)

same

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
> +       int ret = 0;

No need for initialization.

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
> +       return ret;
> +}
> +
> +static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
> +                                 unsigned int fmt)
> +{
> +       struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(cpu_dai);
> +       unsigned int gbcr;
> +       int ret = 0;
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
> +               ret = -EINVAL;

Probably you should return here to avoid updating register with invalid values.

> +               break;
> +       default:
> +               dev_dbg(tdm->dev, "dwc : Invalid clock provider format\n");
> +               ret = -EINVAL;

ditto

> +               break;
> +       }
> +
> +       gbcr = (tdm->clkpolity << CLKPOL_BIT) |
> +               (tdm->elm << ELM_BIT) |
> +               (tdm->syncm << SYNCM_BIT) |
> +               (tdm->ms_mode << MS_BIT);
> +       jh7110_tdm_writel(tdm, TDM_PCMGBCR, gbcr);
> +
> +       return ret;
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
> +static int jh7110_tdm_clk_reset_init(struct platform_device *pdev,
> +                                    struct jh7110_tdm_dev *tdm)
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
> +       if (IS_ERR(tdm->resets)) {

of_reset_control_array_get() called by devm_reset_control_array_get()
called by devm_reset_control_array_get_exclusive() could return
IS_ERR_OR_NULL() and propagates the NULL also here. Thus you should check
the return value with IS_ERR_OR_NULL()

> +               ret = PTR_ERR(tdm->resets);
> +               dev_err(&pdev->dev, "Failed to get tdm resets");
> +               return ret;
> +       }
> +
> +       return jh7110_tdm_clk_enable(tdm);

AFAICT there is no need to enable clocks in probe. Thus you can remove this
here and rely on runtime PM when CONFIG_PM is enabled (and for !CONFIG_PM
see below comment in probe).

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
> +       ret = jh7110_tdm_clk_reset_init(pdev, tdm);
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
> +#ifdef CONFIG_PM
> +       jh7110_tdm_clk_disable(tdm);
> +#endif

Something like this:
	if (!pm_runtime_enabled())
		jh7110_tdm_runtime_resume();


> +
> +       return 0;
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
> +       SET_RUNTIME_PM_OPS(jh7110_tdm_runtime_suspend,
> +                          jh7110_tdm_runtime_resume, NULL)

RUNTIME_PM_OPS() otherwise you need __maybe_unsed on functions.

> +       SET_SYSTEM_SLEEP_PM_OPS(jh7110_tdm_system_suspend,
> +                               jh7110_tdm_system_resume)

SYSTEM_SLEEP_PM_OPS() otherwise you need __maybe_unsed on functions.


> +};
> +
> +static struct platform_driver jh7110_tdm_driver = {
> +       .driver = {
> +               .name = "jh7110-tdm",
> +               .of_match_table = jh7110_tdm_of_match,
> +               .pm = &jh7110_tdm_pm_ops,

pm_ptr(&jh7110_tdm_pm_ops)

> +       },
> +       .probe = jh7110_tdm_probe,
> +       .remove = jh7110_tdm_dev_remove,
> +};
> +module_platform_driver(jh7110_tdm_driver);
> +
> +MODULE_DESCRIPTION("StarFive JH7110 TDM ASoC Driver");
> +MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/soc/starfive/jh7110_tdm.h b/sound/soc/starfive/jh7110_tdm.h
> new file mode 100644
> index 000000000000..0b7e6d6543c5
> --- /dev/null
> +++ b/sound/soc/starfive/jh7110_tdm.h

Is the header needed? Can't be all in one place? The header is anyway used
only in one driver.

> @@ -0,0 +1,138 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * TDM driver for the StarFive JH7110 SoC
> + *
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + *
> + * Author: Walker Chen <walker.chen@starfivetech.com>
> + */
> +
> +#ifndef __SND_SOC_STARFIVE_TDM_H
> +#define __SND_SOC_STARFIVE_TDM_H
> +
> +#include <linux/clk.h>
> +#include <linux/device.h>
> +#include <linux/types.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm.h>
> +#include <linux/dmaengine.h>
> +#include <linux/types.h>
> +
> +#define TDM_PCMGBCR                    0x00
> +       #define PCMGBCR_MASK            0x1e
> +       #define PCMGBCR_ENABLE          BIT(0)
> +       #define PCMGBCR_TRITXEN         BIT(4)
> +       #define CLKPOL_BIT              5
> +       #define TRITXEN_BIT             4
> +       #define ELM_BIT                 3
> +       #define SYNCM_BIT               2
> +       #define MS_BIT                  1
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
> +       #define PCMRXCR_RXSL_16BIT      0x4
> +       #define PCMRXCR_RXSL_32BIT      0x8
> +       #define PCMRXCR_SCALE_MASK      0xf0
> +       #define PCMRXCR_SCALE_1CH       0x10
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
> +#endif /* __SND_SOC_STARFIVE_TDM_H */
> --
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
