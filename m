Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4226C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 07:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tc7N9aGCDJbxX9u53eyr+7t9tEjVrCSWeIkMb9Vm5cU=; b=mr9d6ZKbnbGbAl
	csb5H3+tzbb5rQtV8A5Fpd3XUoTnUYjrBRX5YPjFR4HpnqeNdaTi/A0DVMZASKUkAzzvCahy9RF2H
	4T8Pwa38+nG7hpXZzs0TvcmIfnFrMyLJ6BuHYg39mAkSqwqmNiH79OOtxcI8d07hhA4mxCZ6P+Qu0
	MWXylzpL7uuzNNI7EZ0hpJjLLA+RrmAWIZP4uGiOoVIDJ/N7IcFQaqCM3JPkxm03JvTLnXKDDeQ+C
	Jc+sL5gBQoJe4cSNqUtceakRmZIo/j5IAwLb18CUoGNHrHCxgJgE9Tpt2jkyg7bnwgYBarKVUaiio
	AiMEr6AnoYX5xtMVelIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM3J8-0043Kf-TJ; Mon, 21 Feb 2022 07:40:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM3J5-0043IJ-GQ
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 07:40:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1645429227; x=1676965227;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=9FvXFAhTihOTg4NvPe6BCa8Mz4dcPTBKDcSjyhBT87k=;
 b=GWEx6jjHNwnDtXcdlxq38+AgoOf8YEHdZul0rGacYwoC7g1nSXo6yi9u
 H3ut5QGPW2SNljMokYcrKmYF/PDpQzVaEK8AWdw7rcebmqoSePdMasmxb
 Jrgb3ifmMQgPAwH2NAcFFtlIOw8vXAViU6a/51N78M0Xlu9ezf8m9iZw/
 FQjB9MRwzz/gWIH4PLP7wuy72yQsS4Wp6uDFJkhapRwS26mvy0zWlsUv2
 VAGjC6yDaUElQNUJ5wejyYF3U+0SliUXuM64mmADTgYP8qozSz5RAC2Sh
 NXBgyMZMFEXxuAxGYDDJ9zm/MSs74SLCgAZBTr+Zpyh68WjVI9mUO2Mci A==;
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="162964495"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Feb 2022 00:40:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 21 Feb 2022 00:40:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Mon, 21 Feb 2022 00:40:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIiAdgWyc1OEArxw+H/h2VKJLZE9FQSxdsEKkiHBzOBJpDkpxETMT2qN2JmjWeTcTZxLJjquY/UN9cZQSGhTNIAwY61mwN+Qv496qIPWESjQCxwxTptYj2A19Hxy1jt1kpoXsJfHmTlkDL3wfgAArh83WWYRS2YvZobrc+1ZDh92nm+YGbavbCKciw9iA06cuDbRUS7ZG9PcXMybwgs9qPG4JSb4wcNPKlTDx47blmJoqkl8GKyo/w3qcdSUI5wyQtUHBBwHFYF0GpPsmv43ce0IXCiaklWlXQ2OdTmu1J6EihpB2pr1xCvwCKkIn52KUVaffnK09VXKZzKSfPBZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FvXFAhTihOTg4NvPe6BCa8Mz4dcPTBKDcSjyhBT87k=;
 b=lQDskBzRBtthLxr7vaD+2YcCU6DOSQ4Rkr8oCesvwmlwCNQ7GW2XCiRsr+TuRTF5Z59jUqtiB2jOm2t9wdPQjTsPeqqNCR5qxKALNyEtVoBB9UD3ufSIe1ZwN0zI1RR1GE8Tr/ecHVXeraNM6CmagtMKx4RCPa0hvsKTD7AE76WJQWi5v7E9L74QzdJBRAnyVN91vx6Kznpw4XSO9U1mJu3McIOcam15vwJyq8zMOSTTj8MHNi02dnGEWIVtsrJhw32QG64+0BWnMIz40xcSxzdZ3Z3+X978Fr6rKoW3kHAoJQf96LC76cM4IjUSWWmEpQ61Vppj6bbQgKXg3qleDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FvXFAhTihOTg4NvPe6BCa8Mz4dcPTBKDcSjyhBT87k=;
 b=eNJfdr4YcOrJ+eRxTCJLs7nyVqphl0K3tQT+fOTeQ5cKqMUsQ30uveED0sAawMeEdc3ExSsW0jayrSZY4r7aW99PzmqqWEbftropQJN/3OKhr7hwtq3ybenTQmBJG2tX6TiKiy5JjTP+bIW8qLJLNxNw8v+Kcp/8dUDIxtEHV+Q=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by MWHPR11MB1759.namprd11.prod.outlook.com (2603:10b6:300:111::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Mon, 21 Feb
 2022 07:40:17 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::d46c:fea3:ae31:aec%4]) with mapi id 15.20.4995.016; Mon, 21 Feb 2022
 07:40:17 +0000
From: <Conor.Dooley@microchip.com>
To: <robh+dt@kernel.org>
CC: <linus.walleij@linaro.org>, <Lewis.Hanly@microchip.com>,
 <Daire.McNamara@microchip.com>, <Ivan.Griffin@microchip.com>,
 <atishp@rivosinc.com>, <brgl@bgdev.pl>, <jassisinghbrar@gmail.com>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <geert@linux-m68k.org>,
 <krzysztof.kozlowski@canonical.com>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v7 02/11] dt-bindings: soc/microchip: add info about
 services to mpfs sysctrl
Thread-Topic: [PATCH v7 02/11] dt-bindings: soc/microchip: add info about
 services to mpfs sysctrl
Thread-Index: AQHYIaqkHPhj/CJJS0mllLGUxxwpeKydqiqA
Date: Mon, 21 Feb 2022 07:40:17 +0000
Message-ID: <24cf0030-069f-4b6e-41f9-452dd96ca0b3@microchip.com>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-3-conor.dooley@microchip.com>
In-Reply-To: <20220214135840.168236-3-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f614a89-03d4-45e6-8f8f-08d9f50d67cf
x-ms-traffictypediagnostic: MWHPR11MB1759:EE_
x-microsoft-antispam-prvs: <MWHPR11MB1759CAC306051A4917D25936983A9@MWHPR11MB1759.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jJgSWxwGpiJbpZ1HrrXJiD2v/nl/BbyOGOmfZaxQBH9rHWahZmB7/TdL23QOT7+4yZRKMvjUZkrF2k36XbdEi7lidsEPGXpmrbONO2eOLOeOSTWUDXRnK6Tn4zNj8pZQL403cdenbcp5vBCrypPfY2XrwfGtaVkEl5nhe/VVDvKE5ljaQ919Kvo+Mypmkiq2Jh5RVxy7xjRtOeJqOrmMU2gAyyZBMN2uMqMc2phlVp2y8fOk9tYZs1Q7z4jCTwMwJG5IjsaV4w9owk7D9rGY6eyjmNZTL2LVh+occWEmf0ioYTHLKZSWuGSWcYr0CfdQK0X3J8cyCnGnyp/s0AH8tx6eCfxpzjgYMydPAzosPoGBmr2v0KY5cRjdY3kQNq9YouYA9g9z9GLOX9p5ac9AsMh9mo30uVOJYKNvIfPYwSd1p4bY0l/orFwBMCOMXQwipgyGlfyQptVEKCH8q7YEQWh5987Ne8L/qZbLyAuoj2Ms3FB7R0xG+AWHWdqUKG/EGWOThTIZzsk9W5YrPKlSnmBXuR5sa9TsWin3sP0luc+HHytelVbYgIufY/VDacMx90Xhiaoj7B87kxvgGpyYEm4ec35azgipxEjLPdh/Gc37UBS26LhazYszUTJ0Yv+YDNuYbmGtGwzUZvC/8gFUUneUmKse3n14QYDOotzBM1XNCbrJejO4EnuTDmnwbGj41dSD88XPhoADOOSSDdoR/zeVLSuqzGlsEkuuMabORfy3Qo4v3Gu+0+u5yjc8R2H2l074Co1XJNCexi2GwiIj0YLzNykpxLKyMwyY1Qus6tFkdKbT3j83VHwhe33OfkKSO+2TJ91E4cLlzLQvDaf8fbFBUXdeCkbW2icrGbSNUmw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5160.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(71200400001)(86362001)(186003)(26005)(6506007)(2906002)(53546011)(122000001)(38070700005)(31686004)(36756003)(38100700002)(316002)(508600001)(54906003)(66476007)(8676002)(66556008)(91956017)(66446008)(4326008)(64756008)(966005)(66946007)(76116006)(6486002)(6512007)(8936002)(31696002)(7416002)(2616005)(5660300002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cEpxMGd5cDIwa1RmMkVDNzFkc1hXcmJteW1WSUtWemlmYThwWHY2MXJVaTEz?=
 =?utf-8?B?SWlsVHA5aTJaTDIxVTJPWUN3WXRWM1BxWFFJakVjTnBXUGFxaFUzL2JVcnVx?=
 =?utf-8?B?WUlwMWFGTnJLNy9wT2dlZmJDVFllN2NEanZTTzhZQ2pHU3hCNklJSXlKaVVn?=
 =?utf-8?B?T3U3dk9ETFRwL1YxMCtUSi8vYVk2T21JOWtIYk8xWDdpUklPdnltdGN0TkFM?=
 =?utf-8?B?ZmRGQjJzQ3JGVExmVEpENWJ3azVMQ3NVUXp6eFRHaldvcXhBWW43QXQ1VTk5?=
 =?utf-8?B?UWlqakw3UjFCaVkzVGlxQ0VNUVNNMm5YY0NncHVodldKekpwVy90LzQ5NVpn?=
 =?utf-8?B?ZHpMNjRUN0FxR0h1VDM1L3ZWbWpqZXpXencyRFlqMVRCMVh6bWZsQVZBWTc4?=
 =?utf-8?B?bVdMNEhibXE3TXd4RUFUYlFaSkU3R0IwTDNveTZrUmo0Snl0TkdWdDFIc1U0?=
 =?utf-8?B?VEE1a0FsajRMNnFrV1VQc3o0R1VSaTNEUk93cGNRMlcvbi9pS1RhYlo2WjhT?=
 =?utf-8?B?MFhZcUR1R3FaVTloWHZjbkczRERmUHUySnRPdjFNZFRzSEZ5bjRIU3FwR0pV?=
 =?utf-8?B?RnNMdEYyVlRueERQZ21QTFhPb0NTc2YxZDFjS2w1T0wxRktTQWJOUXdoVDE4?=
 =?utf-8?B?WTc2QkJ1V1o5NGJFY3I0Rlh4QkxyY0hrVnUwTC84cjEyNW8vajhnaDhIVHZ2?=
 =?utf-8?B?OVJoZUs0eTBoZnpaT0ZqTjVFRVdRK0FvNUNYbFhjSG1jQUxpRFBHSUp2VWZV?=
 =?utf-8?B?a3dEV0xoTDN6eDRCTkppRWtWR2Z0Zjh6TzFqdUo5bEdwNnFLaVlKbWQzMWlF?=
 =?utf-8?B?L3JHWGF6R3B3WSt3aDlpNmZuUjZpWjQ5aU1lMVA1T21JMGtFbVc1Q0JkSk5y?=
 =?utf-8?B?QXc4OWh1WFpBam5VVjU1ZGluRXFvZVB0dUI2ZUI0ZUVqUkRsdHpGQmR6QnhZ?=
 =?utf-8?B?bmhJRHFoUm9leEZSbjBBRDZ1b3dmd2lyVEFyak9sMUhYNXgzQTlDVVNnNFJF?=
 =?utf-8?B?UjQvbjNZaFVudzJmSjVyOE1rR1luYzNWZDRMQ29yd2MzK0hkRi9IeXdVQTBY?=
 =?utf-8?B?alZOYWJIbjhUTkQzTTJiUTVvMGNhdzhNOVliRFJLQUdPbm5WcFRmTk9GVTFm?=
 =?utf-8?B?TTgrTFZtTHgvSDZYUWQvaTBQN0xkSFk2QTJJT0pITG45ek9ndDdxMmEzSVRi?=
 =?utf-8?B?Y3BWTkIyUnBCUjdaK3g3R1FTTENiR0RnMGovYmtpcURSNkc1NW1CWjk0b3NF?=
 =?utf-8?B?MHNNN2pjaTdidkxCNVgvUTJGY2Q3QmluUThJK3FlVEpQR0xyRGN4ZVBsSjFN?=
 =?utf-8?B?QmZEcm1JV2FFWkpFWXZmNWs3cFRKRlNGMVRzYWRPbWhaaU1KS3d0Ujd5d2VV?=
 =?utf-8?B?eEJBNE91MU5DTjEvb0FsWllFKzdPWTZObHBvRUJJTG9ZQ2JJZ2pNRXJ6em9P?=
 =?utf-8?B?d3UxNzcvT3Z1ODA4TDlyZVdlNVhrMy8zbXI5c3pRaDFCMTkzeEdJb1VGcmIr?=
 =?utf-8?B?ZzNIVm9IYVVSc1pRTk5ocWJQdHdRWkxlTlBLZjBUNEVhNnNuazFyT3JKK0xI?=
 =?utf-8?B?V25YOGRLcS9MKzBZTU9YNm1OVjR5VXVHd3FCTG1ocityelY1SE1CcXRWa2wz?=
 =?utf-8?B?eEhaWFZJSGZkKzY3bEIxVkpCcFZ0Zzc3U29BWWtwTHBkSUl1WDYzSW9SSTVE?=
 =?utf-8?B?c3BMaGx0NUxXUDdmOG1kMWVacGx2bW5JSHFjcXpjZzNMK0pPWWJLNW82VWUx?=
 =?utf-8?B?cSs3ZXpwL0hvdHdYREtORk1tR1BWTXFRRzNaSjBRYlFNZEplc3N0aytiWVpJ?=
 =?utf-8?B?VG1Zb3pEdlg2WGhEU3cwR0VCSjdGWGYvVG4yWmIwWXhDMk95b0tFV0ZEbUpN?=
 =?utf-8?B?Tkd3YVlGUSttU1I3WnJrSC91QUg4V1c4dkRpckw3WFd1SWllelYzMHFJdTR2?=
 =?utf-8?B?bEhodzd1cDYrbUh6anlyK2xHVUdWNkFucWVVTG0zc2JabS9DaGc5Qlpra05I?=
 =?utf-8?B?U2dhaUdnb2NwQ2xtQ1VzbU1BNmtDcjEwRy84YktuS1NCTHRhR0VkZjRTa3p2?=
 =?utf-8?B?eVVSTEhzdlU3cTNaQnY2RGVvZmI0WXZKSFo2dWNMOHV3YmF1V0R4SkxpUEo2?=
 =?utf-8?B?azRGb096eldpdGU0N21ySC9IbFhad0pqdmxETE5BRC9PWEE1bTNNWHlNOURo?=
 =?utf-8?B?ZDJmbWtoc3ZsdGV2WERwT2Y3S0lIaUNxdGtVbm80VmovNmZDY3A4NVNKT08x?=
 =?utf-8?B?L3FxL3dNZVk5bVcxWU05S29vQWt3PT0=?=
Content-ID: <54D7DDBF0E8616448751790D8B057A44@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f614a89-03d4-45e6-8f8f-08d9f50d67cf
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2022 07:40:17.3265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9MKXQmQNAA0Ia9y1N0gaVzqeFdTonOC8zCp9OxolQQiFQ8tkAXgxkju1OoBAXK25brxwuDSz7rcnAGNssPMR6Pvlmhr4LhOgz/y+oW1ZGDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1759
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_234027_596081_4F65408C 
X-CRM114-Status: GOOD (  21.81  )
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

Hey Rob,
I removed the children and added a link to the documentation for the 
services. Could you take a look and see if this version meets your approval?
Thanks.
Conor

On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The services actually provided by the system controller are not
> documented so add some words about what the system controller can
> actually do. Add a link to the oneline documentation with the specific
> details of each individual service.
> Also, drop the unneeded label from the example.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   .../soc/microchip/microchip,mpfs-sys-controller.yaml  | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> index f699772fedf3..b0dae51e1d42 100644
> --- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
> @@ -10,9 +10,14 @@ maintainers:
>     - Conor Dooley <conor.dooley@microchip.com>
>   
>   description: |
> -  The PolarFire SoC system controller is communicated with via a mailbox.
> -  This document describes the bindings for the client portion of that mailbox.
> +  PolarFire SoC devices include a microcontroller acting as the system controller,
> +  which provides "services" to the main processor and to the FPGA fabric. These
> +  services include hardware rng, reprogramming of the FPGA and verfification of the
> +  eNVM contents etc. More information on these services can be found online, at
> +  https://onlinedocs.microchip.com/pr/GUID-1409CF11-8EF9-4C24-A94E-70979A688632-en-US-1/index.html
>   
> +  Communication with the system controller is done via a mailbox, of which the client
> +  portion is documented here.
>   
>   properties:
>     mboxes:
> @@ -29,7 +34,7 @@ additionalProperties: false
>   
>   examples:
>     - |
> -    syscontroller: syscontroller {
> +    syscontroller {
>         compatible = "microchip,mpfs-sys-controller";
>         mboxes = <&mbox 0>;
>       };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
