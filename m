Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7126FECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+TI4Z6cVKMG8cvq/0/Bg0EpKYpJjpvsbkRqIsLkWLE=; b=JAPzMAk7ijuHPo
	Kd7mLsOVvQws35b3F5tKHMVftUvOzhaj59yClpNfP+bNXALaY2XLQ6xCjqh2GOkw7Gv/TobvNcNmk
	h53Q1X+rs2cTuaoMSIblQ06GuXyNWn3zdNtPrCfi2LdOQVn1VWzGxW+YiGCylTswbraT3yH2asP6I
	lQ7j6bAZUSUBGDAf+dcXTgNMF0qKRQXq/GwfO/vrmeUe46UpfMqmlZoaMFgKfBVf/3/t5wKSo1nmA
	8E3rEqvVPjFT1pkcGx5tGskqcuJgXMD3nWABdtbV19SE8x+Xr3e3wIZn+ao+xx5OMmSarSLYacrZa
	Pv5XU0fOHiKMgxwrI+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJz-00HXUD-62; Thu, 08 Sep 2022 06:47:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJt-00HXQs-SE
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:47:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619645; x=1694155645;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3gtdWlKVtU+pBjXCqs/RB53FB0EU+8jCwGkjP9t0PU8=;
  b=B1WIcUWcbMTqxiUnBigF+ixMoOr50ueCQcu78Xh6doTSF74vunDpdMgT
   YsyLjNeU61ZDmS0YveeyCDtcEIDf7W5E0l/bne/xa8BkaDdbT6WbAmKYN
   FBUswRCxVDUJub2b5w0XpxFM7qluPAeEe3tEuKaMQJsMy5FJcjPK/XiKX
   PclD36t7i9D+lDZ7X3DSwETYrk4+um0dK3nhA89iDzH/UtlYddDFFDx8W
   s9Uq7wZ8joQH10MUzqzBb/2ILhKppGFFLQevMkuGYMw21dw5APibMqolU
   ZYLW1hxJOk382jhOLT/ReNQhBVsfPzPykKH/VtdkrY6rTRCMtMjyuymSX
   A==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="112686629"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:47:22 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:47:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 23:47:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHaNwCvl71caK+e6jBRKlAhYqgHuBvu95ibHec+KHPKhz+XDRQqiUPl4dlyi/ftUM/jlRAPU5nFtY3d1pQIS6bfNypMROLcnRlVlV552847KiKZyPf0axrNWTVZETJiJYIe8KaTmTrN4rXsp5zgxqt7n/pejE8eMbHu3lZeTIrv4n2IEImHKzaYTohb6tjqlyNeCZ45dGiOH8XLSfJNbRzBlZ6scdeuKR77KIz0YdBnBhLEAhEL+L+EyXkVC+R6B7xehguhmmRU7rOSBlFTKqKIXlGGhTm2Ux6QFLi1391DSDD8GwyLkrPEkAJ2UP8A8VtGjD3ltquaOjM6rIK5YzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gtdWlKVtU+pBjXCqs/RB53FB0EU+8jCwGkjP9t0PU8=;
 b=RucY2+aTq0Qs8ZdD9j6rR6nCcmUtE6jB4O8//51VZsY0xxGsjzYtgk+6B/eY++d5SFMG6bpXVL3oNQIx2+Pnk2AntKZwgVVe+2eIeHchCOhQbaTXb/hzD9IRRP6IUia/vkj5F5uKoE4sb7V9XT2mVt1USCRUG7WSuPxvzqEKCjW4pC6x17jVtfhJPp0UkwpCRDnzo/L/SiETvhH0cQ96mpMgyIXOtJ0fPmMM2Pwb5uMNfH4KDyKXZjA5QFXIKNcAkEwCm/CRxJf7qk+m3Chg3tyIG7bsqY8R+0DcMtnGQZ5pBA01AWJedXWt/apku0DQk4qj0joW5GxPzt1TI9RJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3gtdWlKVtU+pBjXCqs/RB53FB0EU+8jCwGkjP9t0PU8=;
 b=TuKj9t1jHkjcGRPRhCwR8+NiHqMknazxGdVt7EufxafW5d+FJRSRX/TqojX3J0e9zyq3a8Ot6oL4xBsbAZdMdc9FPUOqppdYrUTMIjZm8x4qh3/jONt6w89SiCafNL1T8FXtnOjP1baS9dp+PYbF0K+HRUPOXEapgNpbX9Mn5LQ=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:47:14 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:47:14 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 11/13] clk: microchip: mpfs: convert cfg_clk to
 clk_divider
Thread-Topic: [PATCH v4 11/13] clk: microchip: mpfs: convert cfg_clk to
 clk_divider
Thread-Index: AQHYw07UZ0PbuV0vJUa1xA2NaCuUtw==
Date: Thu, 8 Sep 2022 06:47:14 +0000
Message-ID: <5719c8a9-1c15-fc66-7747-6e029a15b4c6@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-11-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-11-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2618d600-a456-47cd-1ed3-08da9165f6e9
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Co233hQQrwv/YGB0736Ml3178KxlEkGJnbon3Ke3tAih+PY9Jy6St0y1CMnjmNxDrHNcOExr6uJRXeAFgLu/XYJVeci0jStuGbW9ZpOht1cEuE5nv5CWmdtccmHj8rJn5JnopzmRLsoHRCiMexGvHnUJEYF14bxHVLwZ4MVriv7cnNLy1YmZd+03dq45DwInPzr+2JE7DrElZKd7Cv5VaxTjZcYoJlPm5LLvK79U00Zuvva/16kLtwMQkEnaFjPwUIySts89QYvoDi137k71JtIlpRiDSPwsrXwn98Qd+N6MfqqyaQrOCf6tBZRsCcfa1Hc85bjFaClk/c4LH/hudPpNYCNz0RHVHzZZvL8MglugAG3J+EuTEMD0i0UmRIb/atdDrWSLaP7V35NXX+CdYXPm5c2wYkYmIiH8/hvzkx3XtF4MpQyTwXJbq+DIFgClRSiNYz9dEQ35APE8vPAiTheEy9V+DxXZJDumVmNtJCYfbrkPBKFywneJLwgK3SQwDiimx5A15dfLnZq3ySSW2+o4dZyziK6OfGwT9/370do0BjBOSmCjtaA38HX14GJjgV59l8gogxVDSAMl6Am7oZXcqg1mU9XqlB76dBcGDUw6nqsVqDQKC/GFVyHzM2oQ78sfdC7bguGJ7u6PlG5xKHTO3DY+IJqq/WdFeYN3UqmF0+0SELC0Vo5mO7tdxVt1cOHpLixojekMiuXS1/XtW6dFHUILxllrtV0iYB5U8K64tj9t3V+M1mrpem7j2cai1PA7gIwgXc0b2DT8NmWgjssqyyNiBpa+gXrAa7MibGvKL87JtQxTO7sNtufSx46WSHwgpyb1fanCZD6nnHX4Sg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q1lERjNIZXY4MFR0aWxiNWQrdWZ1Y09ibi9leWRPMW8vQyt2WkJTT1VPdWJN?=
 =?utf-8?B?bkZpRXJqRW5RL0UrUE01NlNTNnRobFo0djlMbE1saktDL3k1ejdjZHBpRzVj?=
 =?utf-8?B?Zk5JSmdMRGU2UTVxSDFBa1htR0pmNlpaeGFrY1hZMjRjS1JmS1prM3dYcm9L?=
 =?utf-8?B?Tnh6L1FUVndxZVkzRFpvSGpOZ1NzV1BucUlBbU5WWVo4RThNWW1uTlVjY3RT?=
 =?utf-8?B?S3NJbjhEUysxZkE0VzJDSDNyZUxkK2EyOHN3WEFQSGNZTDNwTTQzYkxKTWxr?=
 =?utf-8?B?RFQvUW5HeTRUUTlDcjdIbkptd0s5ZkJ2NHEwekx4WXJpK3diazNQbXZwWXJ4?=
 =?utf-8?B?OVZ4Z3VFV256R0FPTUJsdUhiUHpxcXBRUTExWGg0akpjdytKWTd2TVFHazVu?=
 =?utf-8?B?Z0hvNzlBcTc4amtXMVpKOFVUcDIwdGZWeTl0bVFWd2dPLy9aTXJ6OHNvQUcv?=
 =?utf-8?B?OFowdkFUMWlPUVBLY3NMRDNmWUdkWWppMzIzSm9JaXBPZThGMzNkNTVIZUxX?=
 =?utf-8?B?Zi9mOEhaWm5mZkFNL2FSKzdMeXlHbUxURjZ4NjdXbU53d2ZqMEJMcXl2UGls?=
 =?utf-8?B?VVN6bkZvWmZVVWs2ekpTK0JDZHlPb01yWnFFeUwzd2gvOWhwME1HNFRvc25B?=
 =?utf-8?B?Z1dIcHdCQzFSZzEramlUZW55a3RxQ2MzYU5EencxbXlMZFZ0ZVlOUFUxcklm?=
 =?utf-8?B?R3VmU0dNU0FhcUcyaUg5OC84cEgzYTFVUmtOdDVFc0cvbWF4SFgxdkk1WndV?=
 =?utf-8?B?SCtwWWhJaGd1SDlnSy93dHFCOGEzWFBhYzdqSHlvakZ3ekxDcVIvdEl5OWUz?=
 =?utf-8?B?Mk5FTVE0T3VtcFFGK3JsVkErNkUzUDFBQlkrZUQ1SjEzS0hHbzlUQldoWmFE?=
 =?utf-8?B?YVVJZ0ZTMHhQWXhLWXZWMytxOFBMcW4wUHdTRjZMeEtjSHhHQUY2TUJybTJJ?=
 =?utf-8?B?NUU2b3MvZjJKRUdVTDhDOXMxeVJSR3dIREhicFRLTUZvY2RobnRLT0JxVmVs?=
 =?utf-8?B?Z1NDUVJPS05INHVraU83OXNsYVl0amdPS1hsQUV6ZzBSQnRlTjU0TUhVNGJX?=
 =?utf-8?B?ZE9GL0U1VnJLRzBhZ2xrZnVSZ0RNbTdNM3dOY3NYQTI5WVFTOTV4ODRvUDNE?=
 =?utf-8?B?ZHlHLzZQTGkvUlcxZk5KVE9JZEthQnY0RDF6UXBGdDNIR0R3eE42VGR5dWhq?=
 =?utf-8?B?b00wUURKWUpFaVRsb3RGZEdUdGVla2IzMEgzRjEzNXk5VnE1bHlXcHR0cUZl?=
 =?utf-8?B?MkZnUzJBOVpLNFdNSitWVEJ2b3ZVNmI3VWNpNWsyVkVlRHpacEhJcVBFdk1B?=
 =?utf-8?B?dkMrYzlQMVhLeFQrTG1mdWpWREY3TVY3R3JyR2o5d1hFeHZTN2ltaXdORmUx?=
 =?utf-8?B?Zk9hQlVZLzk3UlpGMkFMcG5TQlAvVkFPWGZ0b0tmZVROMlBFVEhvQXV2bHlR?=
 =?utf-8?B?SkJPY0NIMG8xOXpXS09lVlB0Z1ZaUlMrbjNiNUZneGFaZFc0VEVrcnJCa1dn?=
 =?utf-8?B?d0VnOFNEUS9Yajd3TGJpUCszNDlyNWNKbVVYTHRoS1hCc25CUnVDd0VEOXln?=
 =?utf-8?B?cWhUbWtVKzVMalg3Yi9FYWVCdFFNSzZvSFZGNjlYREIvdkR0Q2tsMGd0eXlO?=
 =?utf-8?B?MDZKOGpFQnBzYWJwVktZRHBXajJNMlpLaEpkVy81dmN2WWE4MlhVV3J0bnhK?=
 =?utf-8?B?Q0FURktNKzNndWFFT3UreXF1azdxc0ltMTk3Qm9QbXVLOVpIcGU1aVRoTDNI?=
 =?utf-8?B?QUJveW9maHVmTGh3UkVCYjlEUWlMZnpSa2grODRmUC8xUkRHd0R3TzdudHlO?=
 =?utf-8?B?STlwL1NmRmNtZG5WRnpvd2pzT2tYdDNzVmdTenc5c0FscnNZSG94SDFYM1ZZ?=
 =?utf-8?B?UGd1K25kbXJjSXRYdzhEcnduUE9CNktCcnN5TEZlY1BXR010MS8rdkg2SUpx?=
 =?utf-8?B?YWt1MXJ5U0ZlS2pKWm5XNVgzay9yQ3NhU0YreUF0czZIeTRQWjBLZmVhc3JB?=
 =?utf-8?B?YUFyTUVQMitWZFJIMU9JcDVTbnpVakl2RnBFZTFEZ2pjUkg2RTUyYVIxTHdJ?=
 =?utf-8?B?QU81SW5TS0xML1JmNUNzVGFTRUs4bmJrcmRhNU9QVmlzcEVyMlJpd0FlR0FI?=
 =?utf-8?B?UUY0dmJ0NUt3SEVObWVCUTduRzFWUzUxcDBHRVhKSXFibEo3Z3U4dno4ckhs?=
 =?utf-8?B?Unc9PQ==?=
Content-ID: <3B2B9130C7066046B2255BEB81FC0229@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2618d600-a456-47cd-1ed3-08da9165f6e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:47:14.6075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kq8Lj0s7Xr63EBApSo5nVp0mh/Tm3p5wyiumF3N6NtbocglHL+wn008qCSpPuK/sKr3EvumIAwGzwMkgqqP/mGp5HrwtLcrZkeztvSrDy9Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234726_048423_67C8904B 
X-CRM114-Status: GOOD (  20.25  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> The cfg_clk struct is now just a redefinition of the clk_divider struct
> with custom implentations of the ops, that implement an extra level of
> redirection. Remove the custom struct and replace it with clk_divider.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/clk-mpfs.c | 78 ++++----------------------------
>  1 file changed, 9 insertions(+), 69 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 538cb589d232..88a200e88e54 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -51,24 +51,13 @@ struct mpfs_msspll_hw_clock {
>  
>  #define to_mpfs_msspll_clk(_hw) container_of(_hw, struct mpfs_msspll_hw_clock, hw)
>  
> -struct mpfs_cfg_clock {
> -	void __iomem *reg;
> -	const struct clk_div_table *table;
> -	u8 shift;
> -	u8 width;
> -	u8 flags;
> -};
> -
>  struct mpfs_cfg_hw_clock {
> -	struct mpfs_cfg_clock cfg;
> -	struct clk_hw hw;
> +	struct clk_divider cfg;
>  	struct clk_init_data init;
>  	unsigned int id;
>  	u32 reg_offset;
>  };
>  
> -#define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
> -
>  struct mpfs_periph_clock {
>  	void __iomem *reg;
>  	u8 shift;
> @@ -228,56 +217,6 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
>   * "CFG" clocks
>   */
>  
> -static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long prate)
> -{
> -	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> -	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -	u32 val;
> -
> -	val = readl_relaxed(cfg->reg) >> cfg->shift;
> -	val &= clk_div_mask(cfg->width);
> -
> -	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
> -}
> -
> -static long mpfs_cfg_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *prate)
> -{
> -	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> -	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -
> -	return divider_round_rate(hw, rate, prate, cfg->table, cfg->width, 0);
> -}
> -
> -static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long prate)
> -{
> -	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
> -	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -	unsigned long flags;
> -	u32 val;
> -	int divider_setting;
> -
> -	divider_setting = divider_get_val(rate, prate, cfg->table, cfg->width, 0);
> -
> -	if (divider_setting < 0)
> -		return divider_setting;
> -
> -	spin_lock_irqsave(&mpfs_clk_lock, flags);
> -	val = readl_relaxed(cfg->reg);
> -	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
> -	val |= divider_setting << cfg->shift;
> -	writel_relaxed(val, cfg->reg);
> -
> -	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
> -
> -	return 0;
> -}
> -
> -static const struct clk_ops mpfs_clk_cfg_ops = {
> -	.recalc_rate = mpfs_cfg_clk_recalc_rate,
> -	.round_rate = mpfs_cfg_clk_round_rate,
> -	.set_rate = mpfs_cfg_clk_set_rate,
> -};
> -
>  #define CLK_CFG(_id, _name, _parent, _shift, _width, _table, _flags, _offset) {		\
>  	.id = _id,									\
>  	.cfg.shift = _shift,								\
> @@ -285,7 +224,8 @@ static const struct clk_ops mpfs_clk_cfg_ops = {
>  	.cfg.table = _table,								\
>  	.reg_offset = _offset,								\
>  	.cfg.flags = _flags,								\
> -	.hw.init = CLK_HW_INIT(_name, _parent, &mpfs_clk_cfg_ops, 0),			\
> +	.cfg.hw.init = CLK_HW_INIT(_name, _parent, &clk_divider_ops, 0),		\
> +	.cfg.lock = &mpfs_clk_lock,							\
>  }
>  
>  static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
> @@ -302,8 +242,8 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
>  		.cfg.table = mpfs_div_rtcref_table,
>  		.reg_offset = REG_RTC_CLOCK_CR,
>  		.cfg.flags = CLK_DIVIDER_ONE_BASED,
> -		.hw.init =
> -			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &mpfs_clk_cfg_ops, 0),
> +		.cfg.hw.init =
> +			CLK_HW_INIT_PARENTS_DATA("clk_rtcref", mpfs_ext_ref, &clk_divider_ops, 0),
>  	}
>  };
>  
> @@ -317,13 +257,13 @@ static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *
>  		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
>  
>  		cfg_hw->cfg.reg = data->base + cfg_hw->reg_offset;
> -		ret = devm_clk_hw_register(dev, &cfg_hw->hw);
> +		ret = devm_clk_hw_register(dev, &cfg_hw->cfg.hw);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     cfg_hw->id);
>  
>  		id = cfg_hw->id;
> -		data->hw_data.hws[id] = &cfg_hw->hw;
> +		data->hw_data.hws[id] = &cfg_hw->cfg.hw;
>  	}
>  
>  	return 0;
> @@ -393,7 +333,7 @@ static const struct clk_ops mpfs_periph_clk_ops = {
>  				  _flags),					\
>  }
>  
> -#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].hw)
> +#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)
>  
>  /*
>   * Critical clocks:
> @@ -413,7 +353,7 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
>  	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
>  	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
>  	CLK_PERIPH(CLK_TIMER, "clk_periph_timer",
> -		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].hw, 4, 0),
> +		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].cfg.hw, 4, 0),
>  	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
>  	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
>  	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
