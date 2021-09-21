Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AD2C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 14:15:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B556115A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 14:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79B556115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amDs5AmYao4r+9ojs169NSA4asbvZLYKkugEGMih5iY=; b=i7PndMJKH46c+t
	8OtbPO54phiv8UzEDRWpxbYsUHfPIWa5Xye/OL3gTVWZQx6uW/FqbAv15JhZ5ztTSUpScRg1q3NsH
	R85gBlGdC35VeKh9vpjOrA454GANiFr90zs3qmLhG0erW9oXQog0NMkjRSvXQr8a7MA+8/FJyJYki
	XccIjJ51u2q0fl8lmzxQBZOitQGmaKavOGcZAG2EbKsEwMK9iQRlKFTLZRtBekISBVDmppbJMQd+u
	I0Hs3oGElOlldCNtkdEIDF9QqgVErQDsSj/IiEcNYYlMuPzVl6yg7uiQM/BilL3E+SvMopSulqw5B
	qj/aPP4GhpRd+VcsgC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSgYa-004l49-TN; Tue, 21 Sep 2021 14:15:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSgYY-004l2q-51
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 14:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1632233733; x=1663769733;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=Be8LRiUWGW2CKHthT6n1MLOydtf6vls27/xGJKNOSFU=;
 b=K3e8nDzTvNe1ZWbuUsAEDaLs147m0PboeFoFlNa8F/wEuBO/g+Zd0tkM
 6xhlxCyCZwPa+JT3K0pW5iOtKMGzkbaULxmnLCeZRLZvRDDKv/xR7G/hx
 e+4I9/G4wK1td4UA1mTWKYn6ENu2by4Q3OF+YkyYy7MFhE255p9L2bpQb
 dQSPpj8GViXLsZs66ZPgYmmQko+spVH7OIE0cwtNrhJhmKJAq+HumcVco
 O/UY+DIpaRz2MSgGdQy3HfMslF5RO2soNF0qUAAceBAEY7MDsx+Weh7fh
 yVgFEF8KMTdFxPTSBIYxT6Luka25tk0UGVOmFLYHST7Od/7mFP9IgJYJ5 Q==;
IronPort-SDR: aGB5V9gVtQqrDZm4nlwx9hjPNubcQS15viz3u+/hBufQAPxSW1YfqO8X7jD5vF1o0UfLZlXoTT
 8/Q6jg4EIaqlQahFTDidy53lF6zU+7jybUcrr3AwodPIkxZoihYw6HTak2GLk6mwxu/Eq6YuYI
 j5G+v6E3hd6m5nDOGcpfLXBkckBKB61cZrY+RbdW9uMKSrnOA0PtZ8j52GBahehnOxuuhZ/fP/
 dHDXfkpZT6Dm2m7DYM+hEeHo/FJQ4mmEwfMnk7idIi0nVMhBL2oj7qz7bzTqZKDabp9lw+TG7D
 38jJtoOzlrm6wQTKXy6NjcF4
X-IronPort-AV: E=Sophos;i="5.85,311,1624345200"; d="scan'208";a="137363980"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Sep 2021 07:15:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 21 Sep 2021 07:15:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 21 Sep 2021 07:15:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/fIPJktKWS8oLPbVGto2vNTj8lnfXFl4Lu0HYuU9xNGp1krRrrlzuGeT+DGlb+PXO/pUthSUNmhmI36iNl3z5fXmPYr04Ehhw5/g+T/vblH0xyGzOLyTojduhfpUPUUM/fmrHLBiIiAlNuuyBsgnaEh/VjRN9evdKl5GfD0Aky6+xxuULXlcACgvnG02zKQLRidEaMRfldnF2mwa7QjsaDStIngzFCo1TVaW9FhWqOkJ36cRBt9AhV1Sjm3IitpFTQTHh/etYk7mcRjaK47saR40n3tnzqr8JNnyyUmhnpmqLsuAEQ3bglTDrqx/GWBv/DajcLuPql61CVvsYlx0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Be8LRiUWGW2CKHthT6n1MLOydtf6vls27/xGJKNOSFU=;
 b=af5haEXsFNFuooM9bDLvbRwz/rvDKpXEV9Ml3+MWTMk0gueDLG7fTmTf7CuIZqRL+6M5l2OR2mqBH+4GZQ3VMELJBjDpCQTa2jIJ6JfD1lokHbeClJ+6ybF+hG16eEZaa/9jqhAULGvEEO2GL6/sEInAegAQWcifeAUDBXoxOw6IXu41edfR76haF1BMcX8Sbmq3tcWfvlyGI7Z7wkm99maiq70fccygF1BGAKZeVBBDhGQrDTNX7kPafGSUMuHEkTfELkmZh0hgxLbcPNJF4BT8rrKbbCeUjeptT5gI2dLpk0V5IazK99JllZp8c9MJwkmWhDRblHB+dl03ufg7UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Be8LRiUWGW2CKHthT6n1MLOydtf6vls27/xGJKNOSFU=;
 b=gYiGKGX2xYPq8Q8AjupIqHiOYghZf9o6wytZJei8ArPQkkLp229LsUN8jJI97YaAEUs+9rjysjic94qQTjXxtzKVM9BPNlmfTGrYTDKo8EaoqF0RoLFsOzcFC7BQ8PW3VGZICE8W7hXvtnFNSCsQByCA5oSqKCokWq5GCgGDAHs=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR1101MB2078.namprd11.prod.outlook.com (2603:10b6:301:4e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 14:15:23 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::c02e:ee5e:8da8:b99e]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::c02e:ee5e:8da8:b99e%6]) with mapi id 15.20.4544.013; Tue, 21 Sep 2021
 14:15:23 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@canonical.com>, <ulf.hansson@linaro.org>,
 <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
 <yamada.masahiro@socionext.com>, <piotrs@cadence.com>,
 <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 4/6] riscv: dts: microchip: drop duplicated MMC/SDHC
 node
Thread-Topic: [PATCH v3 4/6] riscv: dts: microchip: drop duplicated MMC/SDHC
 node
Thread-Index: AQHXrjGL7H7SjRHDDkuJmN4bIc9/5KuuTdgAgAAVdwCAACaIAA==
Date: Tue, 21 Sep 2021 14:15:22 +0000
Message-ID: <83f737ee-0332-0303-6fa8-d5595097ce88@microchip.com>
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
 <20210920150807.164673-4-krzysztof.kozlowski@canonical.com>
 <b83355ee-cce3-0a7d-a048-147dcb44b012@microchip.com>
 <d79c4aee-2c57-91a8-3bc5-b8d989ed41e1@canonical.com>
In-Reply-To: <d79c4aee-2c57-91a8-3bc5-b8d989ed41e1@canonical.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0fdeaa6a-9b7b-4bec-b552-08d97d0a403c
x-ms-traffictypediagnostic: MWHPR1101MB2078:
x-microsoft-antispam-prvs: <MWHPR1101MB20785BE2AB05C987AD1B43DA98A19@MWHPR1101MB2078.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5z6ABMn91xl7wXR/+lIa8QIhAkdxel95ZxyvcUGZ1IcSouIMpiP7JrMks7naL1NbYtcv8gci3LEYp3Wpz3vspx8d5So5HpaWkKxH7EyZpQlSc4ykTm7fdgPYK/cmFQCDaDUQypJJ67L6IzoCjtTAAl2LhJNG339qcOizHEEdFHBoZ+COIzb4DLEda5yK4l9l6RxtT9V1rKzCK0+tPZVqnRppqNSz+fTn400P3w0o02NYEZr/ZfPlix4qNB/USHUkWEe6BC+yZuDF9MXzF/Hr3D3Xrt03N+CoHd3o/qdQyoX0KFQLg47svaKuzlvuKHlD/xUGToKnjpx7n+LZYj/Dyu12AuDkiHe3H14Uc+NoC3aYyVtm8KUTxqeF78O7AUgGs884SIzjkk6kDA49BJs0J/qtj5OJwZ1XXqgdc0b8SBUrh53QXHGQItwNj3fBd3uCUWIATWp4EQwyi+XsSpHIl33LsOD4DDCFPJkx0j9LKfrMVBNVaL+Id/G8FiKGwLv3WeobtWZ0/D3oeT77/DSblM8JxCAoPv4ScdSd91TiF9zhQjC4JGHTGzKwAQzbJCYWXk20l1PKIW3+OR6XmWymfLtFiC9RDKmMpqtG0hlopb6IleHXvgK/QNJ32qCAM8ECf6lch/dMwV3z0WYqAsPhkyISTUQwlMTJG8ItJPE0jvlAeXH1vDG25eQC4Psm2XHvCON/sNtS93ypc8ddJg+qLXDSW98rrXesNEcC3TXxQKytRtpC2RNvhKlycWi+cIldDqm6OUE3ywn/zRVhlZnXR/9SpSDAnIqqJPJ4cjJ6/Uk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(7416002)(83380400001)(64756008)(6486002)(2906002)(8676002)(186003)(76116006)(36756003)(91956017)(66946007)(31696002)(66476007)(508600001)(66556008)(6512007)(71200400001)(921005)(66446008)(316002)(86362001)(5660300002)(53546011)(6506007)(26005)(8936002)(38100700002)(122000001)(38070700005)(31686004)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVgvNVo4YXFnZVB6d1l0aWZKR3pYNTRYakoyV1BmN2U0TmhucTBUbHM2N2hv?=
 =?utf-8?B?U2dhT0ZaZDJZeEVpNjVPSzhRWkMxcERuN2htYlFIUmlqTG1sS1dTRDh3RG9F?=
 =?utf-8?B?K1ZRYk5nQ01SL2IyOVlHcUNwOHBicGZ1ZFozeHJmYmxxaFhJcDlIUHBCMmNY?=
 =?utf-8?B?dkQzcGQra2g2dmpZNUFGRHhzaHJQM2h0bU85bkRFdjB6QXNURlhBMGgrNXNP?=
 =?utf-8?B?RnpTL01UTWRoRWZGZnZveGRNQ3BLdWtCZ2Z1VlFnQ29qN25RNTYweTZSbnZJ?=
 =?utf-8?B?czN5ck5zK1ltOHQ3QVJNN3J6cEJXMTJhdUpSZWpvUXk0TjdoekUzRTY3K0M0?=
 =?utf-8?B?Yzd6S1owMDFvckZjOHQvU2tiN0tKbHBQTjlvVy9PVzFxM25xQ0VGT0RQSUpH?=
 =?utf-8?B?bUVUNmluVGhrN2g5cHRHRWpvYkVnWEZ2QlAwVXJkT1JIWEt0cW8raDZLOFZh?=
 =?utf-8?B?N1hlTTNMNUw0cVpJcWxVZnlMSUhJcWlzeFBTSEpycFRrdm41djdTbFc0RGhJ?=
 =?utf-8?B?MHpMSis5Sm5GOEhNMSt2L1NjS0lUUjBCM3hsTHI4Z0VBQmUzeUZiS3V2dmI2?=
 =?utf-8?B?R1VzS3cxbkdBWjRpdzNvQldSMk9LOUlzMTJEbTl1dVFwV292clowbGVUNGxz?=
 =?utf-8?B?OThNOXd4TEVwQzc2Nko5Vzc2aGk5U2c5ZTRIQXlacGFteTNKbU0yQ0h0V3J5?=
 =?utf-8?B?YTg3ajgrZDE2MWFyZ0ZSY2gvVjY3dm9OTzFDNEdTZ0JUWEFhdFFDQmM4MUQ2?=
 =?utf-8?B?SXlLdW9naXBsOHlLR1hwa0lRbVUxU0YvWndrTi9IV3RJQisrWGpEamI4YU9Q?=
 =?utf-8?B?MGRDMG9aSFZOcldoY080MDlua3V4c3YxUmN5QUUyKzdFcFBQWDdVTjBhNGNa?=
 =?utf-8?B?RmRmUjg1bU1yZXF6Ymw3TkV2SkIxQzZlQVBmbll0cDA0RHRSbElJZGxUOS9M?=
 =?utf-8?B?UFZOc1k5N0pNdXl0ME5iZEVpbi9OS1MvVGVyZHdMQ1hWTWRIT2NtWWpKVGJ0?=
 =?utf-8?B?alR3eW5XdjdRTWsxK25nV29VV1hPV09CQ1BPeDhaQmZ6bnVMWXNSS1VZS0Zl?=
 =?utf-8?B?ZTJmMm9OVnFlMGZhTFZKR0ZFTnFjT3hqVGl2WlBuZG1QNEpodzN1QTRjaHZ3?=
 =?utf-8?B?QnlCdlc5Uk1ITC8zM29MdzljWXlpSlV0ZHVobFdTM2lTbWEvZURYMVFTRDJw?=
 =?utf-8?B?SnRES0c5MUhlbmgrZHB5amtIbUo0b0p1MjZMYyt4OGFoWlFwM3N2NWFLc00w?=
 =?utf-8?B?RVFhKzVLSlFaS3c5ZlJhSnBHZDJRUGRFUHVhc0RFV0tRUThPSXdKaG1oYXZB?=
 =?utf-8?B?QkEvdWhMVGx2ZGczbVR1UFk2WU1HVUdQTEE3Ulp3UlE4ZEM2ZEI1REFGcGx1?=
 =?utf-8?B?MHEzTGtiQUZxeDRtdEJKWmlhREdiTDI0elN3QWlNbnQ1eHRISWFuVDVMd0t6?=
 =?utf-8?B?aGQzbVE1b1BIQ2FtTWdaQ3MyakU1WTdhdHFxa283NFFObGRLY0ZOanNlS0hS?=
 =?utf-8?B?cDBCdG5KMytJdkxQSW02Ym1sUXlzM2V5U0FyQTYvV1hrY1ZsdUNOSW9HdE9V?=
 =?utf-8?B?WkJrV2VqZ0t3b1Y0MkUzVERsbWwrdDhnSVRPWEdWT0tjQ3dvV1NPVVhPc09X?=
 =?utf-8?B?Y3hrdG4xMEpXb3QvWVZnMlovVURSb0IwRVNLVSs1TlIyRHJldHNJaHlMSVlN?=
 =?utf-8?B?ME9RVXRmUFJMREthYjE5ZERHdWlRQ2lHS0RoM0JEaWdwU0RUSjBHdFpJa0dE?=
 =?utf-8?Q?rBCGUYi6G1jc9E0n8gBd/AwuAj0yxTm9bH/SKEE?=
x-ms-exchange-transport-forked: True
Content-ID: <89BF20B7511A3244B66826CC39B45A8E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdeaa6a-9b7b-4bec-b552-08d97d0a403c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2021 14:15:22.9615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJgYVWSQz4CSfr30370sl0ik9/9C7D8VBB/06FGus8PqsviaJO8dyomvlM8xVyj5BmKV7oM04/2iTyjsfOYDrOaJra3R64JCaRLRaMamWws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_071534_257545_170193B7 
X-CRM114-Status: GOOD (  13.41  )
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

On 21/09/2021 12:57, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On 21/09/2021 12:40, Conor.Dooley@microchip.com wrote:
>> On 20/09/2021 16:08, Krzysztof Kozlowski wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> Devicetree source is a description of hardware and hardware has only one
>>> block @20008000 which can be configured either as eMMC or SDHC.  Having
>>> two node for different modes is an obscure, unusual and confusing way to
>>> configure it.  Instead the board file is supposed to customize the block
>>> to its needs, e.g. to SDHC mode.
>>>
>>> This fixes dtbs_check warning:
>>>     arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: $nodename:0: 'sdhc@20008000' does not match '^mmc(@.*)?$'
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>
>>> ---
>>>
>>> Changes since v1:
>>> 1. Move also bus-width, suggested by Geert.
>>> ---
>>>    .../microchip/microchip-mpfs-icicle-kit.dts   | 11 +++++++-
>>>    .../boot/dts/microchip/microchip-mpfs.dtsi    | 28 +------------------
>>>    2 files changed, 11 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>>> index 07f1f3cab686..fc1e5869df1b 100644
>>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>>> @@ -51,8 +51,17 @@ &serial3 {
>>>           status = "okay";
>>>    };
>>>
>>> -&sdcard {
>>> +&mmc {
>>>           status = "okay";
>>> +
>>> +       bus-width = <4>;
>>> +       disable-wp;
>>> +       cap-sd-highspeed;
>>> +       card-detect-delay = <200>;
>>> +       sd-uhs-sdr12;
>>> +       sd-uhs-sdr25;
>>> +       sd-uhs-sdr50;
>>> +       sd-uhs-sdr104;
>>>    };
>>>
>>>    &emac0 {
>>> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>>> index 5084b93188f0..83bc14860960 100644
>>> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>>> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>>> @@ -262,39 +262,13 @@ serial3: serial@20104000 {
>>>                           status = "disabled";
>>>                   };
>>>
>>> -               emmc: mmc@20008000 {
>>> -                       compatible = "cdns,sd4hc";
>>> -                       reg = <0x0 0x20008000 0x0 0x1000>;
>>> -                       interrupt-parent = <&plic>;
>>> -                       interrupts = <88 89>;
>>> -                       pinctrl-names = "default";
>>> -                       clocks = <&clkcfg 6>;
>>> -                       bus-width = <4>;
>>> -                       cap-mmc-highspeed;
>>> -                       mmc-ddr-3_3v;
>>> -                       max-frequency = <200000000>;
>>> -                       non-removable;
>>> -                       no-sd;
>>> -                       no-sdio;
>>> -                       voltage-ranges = <3300 3300>;
>>> -                       status = "disabled";
>>> -               };
>>> -
>>> -               sdcard: sdhc@20008000 {
>>> +               mmc: mmc@20008000 {
>>>                           compatible = "cdns,sd4hc";
>>>                           reg = <0x0 0x20008000 0x0 0x1000>;
>>>                           interrupt-parent = <&plic>;
>>>                           interrupts = <88>;
>>>                           pinctrl-names = "default";
>>>                           clocks = <&clkcfg 6>;
>>> -                       bus-width = <4>;
>>> -                       disable-wp;
>>> -                       cap-sd-highspeed;
>>> -                       card-detect-delay = <200>;
>>> -                       sd-uhs-sdr12;
>>> -                       sd-uhs-sdr25;
>>> -                       sd-uhs-sdr50;
>>> -                       sd-uhs-sdr104;
>>>                           max-frequency = <200000000>;
>>>                           status = "disabled";
>>>                   };
>>> --
>>> 2.30.2
>>>
>> Hi Krzysztof,
>> Seems I missed most of this series other than the new vendor name in the V1.
> Unfortunately your name does not appear as maintainer for these files
> and get_maintainers.pl brings it only sometimes as a --git fallback.
> Also few addresses from that --git fallback are non working, so I am not
> always Cc-ing them. Sorry for that, I'll try to Cc you on next Microchip
> RISC-V submissions, however you should probably add a proper platform
> maintainer entry (similarly to ARM/ARM64 subarchitectures).
Yeah, I just usually read every message and happened to miss part of the 
series.
Seems like none of my coworkers are listed against the device tree so 
I'll get someone added.
>> We have been redoing the device tree for the mpfs/icicle kit partly dye
>> to some changes we made to the design. Previously SD and eMMC were
>> different FPGA designs but now both are in the same design and managed
>> by the bootloader, depending on where it finds the image to boot from.
>> Since then we've just been using the following single entry in the .dtsi:
>>
>>           mmc: mmc@20008000 { /* Common node entry for emmc/sd */
>>               compatible = "cdns,sd4hc";
>>               reg = <0x0 0x20008000 0x0 0x1000>;
>>               clocks = <&clkcfg CLK_MMC>;
>>               interrupt-parent = <&plic>;
>>               interrupts = <PLIC_INT_MMC_MAIN PLIC_INT_MMC_WAKEUP>;
> I'll switch to 2 interrupts.
>
>>               bus-width = <4>;
>>               cap-mmc-highspeed;
>>               cap-sd-highspeed;
>>               no-1-8-v;
>>               disable-wp;
>>               max-frequency = <200000000>;
>>               status = "disabled";
> I understand you prefer then the mmc node to be active? Before the DT
> had SDHC one enable, so my patch did not introduce changes (except
> mentioned interrupt).
>
> I can change it to mmc above with your explanation.
It's named mmc but it works for both SD card and eMMC, just depends on 
whats selected during boot. I'm not sure what is the appropriate thing 
to actually name the node in this case, maybe you know better than I do?
 > patch did not introduce changes
Yeah, I just figured that if changes are being made then its worth 
switching to the single entry now rather than waiting and doing it in a 
few weeks time.
>
>
> Best regards,
> Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
