Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B006BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=znWG2SNjU1MU+T0a5c8ZuRbGzcHpKrMWTyfGDaP275g=; b=x7f5DY6xYFveqn
	qhA+XYcW7XzjZVbIk8z27VV5vaCDr3vrFZwYuYYi9VAMUTO+OoEpK9wKKGzP923NOJ58nIiQYvOb5
	e3fXivALMbhEHbua3BpslQfh8mUJC2XSyKRMHLW0KFydXnQewhWay5c/GnaTAZxTROM0uDijECXVL
	zHr7fE7b4fl3185U20HxMIJWYtH2gVtAS5hAOradcy0hK19LpPX9eUQmp9KsXxEyp/srGZv6NpBfL
	TCclsQ5s0OpAXJX32U7btf07sppUuADzoJY2BBVB6q2IJj6ABPLk8XjYWTAfzA9UmQaCpyTisO5eE
	SzZjrR7+PNVoJoOKKOKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrGK0-001BNH-1n; Wed, 18 May 2022 09:50:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrGJw-001BLm-W1
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 09:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652867420; x=1684403420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=HlsVxJEbi0q8ReT8CTFlXFhy+1Vt95FyPmtorkLTKug=;
 b=FoTcd1U9JN7B0uKc4QyYPduAJ2vV5cG/U/PblHoX27Ru3k7oo07GKF4v
 8IcO5t9uqhsl99umzbh+47Thx4l2LdwGQdheRDYn1xnNmjWXyxnKgxFV8
 3qN2CTrnmyztbTl/A4LmolqZVCX5stbI0NuqFOaBW1F0cYagccV8ZXjCx
 uOuNMylia44qDt3Gj64GTuG9wkQf99Tz+gwSZyIxV6Ol/nz4xVVqw7PIw
 SQ4F9j4GwtGWJlqm0mk+4PF47mvngOgxU7Vl6qS83uzV7Gxzylpqh/f3D
 UmxOjAEz+FCnRZrl0VcHMdL9ALn4nll1Cs4T+8C0sAgcqlpV1OmV+cru2 Q==;
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="173904643"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 May 2022 02:50:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 18 May 2022 02:50:19 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 18 May 2022 02:50:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aRA3qJ5+ENEmJR1MKeC0dduHxXY58VGz5UoZn5DiUJf7re8ogWchRd2u+lqSX6n5jrZUyY/BZtuNzzaSOf0ogu6xqq1J6TY41Ge0c3b/718BdBte7qmGWd5VSvGXr5n+UGZhQpLOc6JjAHSHFBZzW7NGuHlnSEH6VuVXws5nw2caRP4BJLsqAAc6JUnDvlMkibl3S/Yi7axv1AMIT5/EJqwo1OggKVC04u+wtuyzryVkK/3k7hB8XD2X+30LaMaj7ZXOO2m+TihNu05JwssIIcSFsr3/ZGAvpFC6YxCDH667hmuHYls6DGPRZH8QUE+nxAS0BX04zcPrw6mMbXGiLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlsVxJEbi0q8ReT8CTFlXFhy+1Vt95FyPmtorkLTKug=;
 b=JIMiGqEduq9agZPhFJvDVMsdCO4bNF4PYB5NRURdEJjzRoT8YkGe2H5hzRqR4UTFJzL5l+Pwh2VfoFm++34ubPb7UGtlayvZouRGdgTH8n3SjNYsZ5kBDvt73yKoBgeqJVVbO3bu10BIZtQ94qqPQ6QoSi+1cmS+F7N5FIqG3gm+2sZuarMt4gvEe+GGQY9ZjzMcc7WfzPa6CcgHRGnApEX72r0Pb/UFCNX8/aeHUV7WmwQFnLC1+IZwvI1gzOTeoJLFLxcX81/THrnzfZIhYvDvQ0djVyxG3na1RmledefahD4zaFGxqwUkzcA7NvS5QICuVM+4fV9wbVl2STIzqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HlsVxJEbi0q8ReT8CTFlXFhy+1Vt95FyPmtorkLTKug=;
 b=AU84/HhHOtTE14JKL31LA26ou6KZh8mYeNQwB5wzTmUK9gxUpFvvxjAokJnNPYb+3VIiMx7PIfIiSb5Crs1lPXe9D+6WzjHhuCckOWdVa+Vl9vnI39xRfY00sX6D/8bhn6QruO5110Bxy4VmoCnaEO2RCs+GXbdr924Iae5N788=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Wed, 18 May
 2022 09:50:18 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%5]) with mapi id 15.20.5273.014; Wed, 18 May 2022
 09:50:18 +0000
From: <Conor.Dooley@microchip.com>
To: <i@zenithal.me>, <palmer@rivosinc.com>, <paul.walmsley@sifive.com>,
 <aou@eecs.berkeley.edu>, <heiko@sntech.de>
CC: <atishp@rivosinc.com>, <anup@brainfault.org>, <ebiederm@xmission.com>,
 <keescook@chromium.org>, <linux-mm@kvack.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-api@vger.kernel.org>, <mtk.manpages@gmail.com>,
 <linux-man@vger.kernel.org>, <jiatai2021@iscas.ac.cn>
Subject: Re: [PATCH -next v2 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing
 from DT
Thread-Topic: [PATCH -next v2 1/3] RISC-V: add Bitmanip/Scalar Crypto parsing
 from DT
Thread-Index: AQHYapt67sFvKRb3tEu5VTcaN9/1G60kY7uA
Date: Wed, 18 May 2022 09:50:18 +0000
Message-ID: <3e3891ad-2d31-99a0-bb65-1e6643ff6b96@microchip.com>
References: <YoS6qRhxGuwHmK7q@Sun> <YoS7bT1B/+JrEn05@Sun>
In-Reply-To: <YoS7bT1B/+JrEn05@Sun>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4c9a646-c7d4-48b2-6898-08da38b3d119
x-ms-traffictypediagnostic: CH0PR11MB5219:EE_
x-microsoft-antispam-prvs: <CH0PR11MB5219C72BF1096D07B0188B9698D19@CH0PR11MB5219.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RFzgBc9o/K/sI1Y9DmwcdcpkSa6gE8AopbuIfDuGuTPo97MQro2rl9wESQ50pxTOGGtWEvuQc6nKbHC5rND9igOm6ddNajHoIXr3uGjQHZ8apxgvqFmhFFlOd2YaNb7QKOD84RZMzK5luBGcPjVRpKZdJxGS6aBMUaVrYgClMZ83+JCOhXW7WZ/Ci88VajEQqggSalxqHvmjZROv+1GOmiern+XwYMeZu/2rXGtKS1j3/8cTQxEqnRSUtVz42//KBlpOXvy3GKfxKpFnziwaxvzipEqMFnAqTsuIGek8vc1CDCjr1pRZB4gy3nJ0lJdY755O5tkfXZttT6YYCceg3LZcxPMLwVmJL42tzOvr4zIZDiiOvaDVpQkVglITHnrazt1aIMddKZx8qRX55aVGeJGhfL4zrPqS3tbh0+ccCSXbJLkaaL6jIawCfQK4+zAD16UPtLSHGrTZLSzCkgLclFevLkS8BKo7U9vkcTwwPKY3e1IP6+l+Q64hhvbDT8RjGeY8IWxtPSkFEluQf5DzHgZIrj+o4fw5UvGH6XMoSsyGLOQlWyMC/W8GW04LyhtiMJX4QDsPe38Q/mvB19bjxMdDu3qke2C4M3rY0Ku6KU1S0pAbOKc+2jZhKz9VHJpZBLHDZUXy1kkzP/zLXpsGyoX1M/LgOUT23MuiEq+XYFWNFhl1gWvOaaVH2r1iFf/jhsoS8JzbGdMts/ZKAMGY0FF/zU/YLMVBVVzAUd9F+O+E+DHHkY/b1AQ9YZOL0Fieb2GSQJOdjlAL24pyztqzrNG76Ne4g2FaaVCd6YTcuvsl/2KZQs74AbHTgaknXuVhawBSyczlbTV9ct6KSCEU/GSLsegCCvuxC7O6z9+I1IGEsCb5Zp2jDB2Q7nR4PPcy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6512007)(31686004)(91956017)(76116006)(26005)(5660300002)(186003)(71200400001)(6506007)(36756003)(83380400001)(53546011)(7416002)(8936002)(66946007)(2616005)(64756008)(66556008)(122000001)(54906003)(110136005)(2906002)(508600001)(966005)(6486002)(86362001)(8676002)(31696002)(4326008)(66476007)(66446008)(38100700002)(38070700005)(316002)(781001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d0dtSzVKSW9lRElXd2x3V0hKUVpZdWN0bmxYVDBGNkVRbVo3TkdOUFMzbUxK?=
 =?utf-8?B?S3dJaTJJUVdNWlpmb0RILys0SEN1bGRwOXBOZFNGRjY1UEJ5S2ZwaDhULzRo?=
 =?utf-8?B?SUYvYXc4NlM3dWdyYW1IclZnMnBrcnBvY1dlREI4RDZGY0daZCtVRS80R2JH?=
 =?utf-8?B?cVloNWtjdFRhMHdiVys4MExBcDJUY1poUXFrVlR6SWFiaCtNVm13OTNhLzY3?=
 =?utf-8?B?OXNQK1pjZjhrdkR2ZjJILzFIdDRCMjMyVm13emx2aWFqaHNiVTErNWozZ2l3?=
 =?utf-8?B?NjloK05oY2xWUlo2emJBRXc2UFNBdVdyUUZ5ajhjR213SWFMdkFCaDRFQXhx?=
 =?utf-8?B?cmdmRVhIZDM1dCtjb0N3SkRnUmlJSXZieW1VRTloaXJETWxwNlBXLzVwOVI5?=
 =?utf-8?B?WVlWcXNONnA1di9WdkMwQmZRdUpyeGRHK3ArUXlWMGtFY2pTb3Y1Wng5M2NJ?=
 =?utf-8?B?VWxoK3JPcUlqYy94U1pSRVhUK0NWVk1tWEkyMGxoWHFuTkloNnpncG1GUnE4?=
 =?utf-8?B?VXdPd2YwWUJMZWU0cUtCZjVBTHp3aDlwZFNLd0lyeDl1bXgxc3QrN0owOTJI?=
 =?utf-8?B?UTVveGVBZkEvUFlMLzJRcTlTM2RLNkt6WGFlWlRJSHNac25ETW93MnU5UUha?=
 =?utf-8?B?RjZvbUhWOXNoUHp4STVXTW9PUDQ3THZHV3JvcjFXVnY2aVVBVWRXdHRVclVz?=
 =?utf-8?B?SmNiR2FINnJkRWN1TWtxaUs4RXh5RURiNW5HNTNxamVKZkZqM05BZ1dIOWJq?=
 =?utf-8?B?STVHWWlBaFhJYWg5RUQzMXBnTmJsNDk4SnhiNjAyOXdpSVNnK2VGMVV6ZmJl?=
 =?utf-8?B?Tlk2S2RNWXNnQllRTFlEZ0VTU2IwaWp0VnFKZEdpL3cyZUk1clNxQnlEbEhU?=
 =?utf-8?B?OWhhSWRldTVUWStSaDFNYkY1N00rYzVuam5OQVY0QW92Y28zK2dwRTd5SzVa?=
 =?utf-8?B?ZU9EbXcyVEw3T2ptUjc3dUk4cXVRdGRlRTZEallxM2NoNW1XZStMRGdRbDc1?=
 =?utf-8?B?cUFqT1RhbUJKMnR4RjhZNjRQZXlCYnFNcDl6d1JMV0pTT1l6eHpBNHNma1J3?=
 =?utf-8?B?KzlCYm9RMC9nNmF5eldXeTk2ak1SUGtQRW5tRHNHNE1nYkRWd0VuSDY2YWF3?=
 =?utf-8?B?ZTBFdUdZTEkzM0pMMnpLVytpMXlwVjBxL2FEY2JpN0IwZ21XUnFURVFzakg0?=
 =?utf-8?B?bnBNNmhRQTJTSDZQQTNiSjByY3d4Q0dRYkdVcDJZYzZoeVhzc0hrT3ZISmVx?=
 =?utf-8?B?a2hpTllpTENDcXRyMmNzWnk3Q3JMUHpXR2xhWStRZGI1UW1rdW9QZU5wUjVZ?=
 =?utf-8?B?ZVJ3Y3d5ZkxneGZ4MU0vYTU5M1VGbVQ3Nlp6OVFUQlg2YWV0b1pGaUx0Z3Zt?=
 =?utf-8?B?UnI5OXNadzQyZGFrMzl6NDROdGcydzFYbzlxZk14VkxSWnVUUVlhMlRGYUxa?=
 =?utf-8?B?djdCRExQR0dVMzNqakE1K3RjM0g4eTVyR0l0LzFXSU1YOU9LV2RDbWY2aUxB?=
 =?utf-8?B?QUwvWDlEcXRCZGRTc2VCem9jSlRNZnhlUlI3eXo0SW5VMGYydDJKZzkydlha?=
 =?utf-8?B?L3BCM241T24raW92NE1lQmRVS3laRCs5MkNDd3ZmQjkraXVDaW1MelcyMVJt?=
 =?utf-8?B?aFVUaGk1UHFqa3lRYnZab0M4aW10bHFORVpRbFVQN0tMTFFVYlBobDV5RWJp?=
 =?utf-8?B?UlJEZFZWYk1ueXRLbzJKUGE4M2VOVmdsODllOUw0TWpJc1F4cTV2eW9aY21F?=
 =?utf-8?B?cFExUTRYZldBVjRibWs5dmFHVVZoTmNZc2daREpDSjRtQmxvbGp5eE1NRjVv?=
 =?utf-8?B?NHd1NjZqVTliV1NNMWJPL0FJS2tLWGdIVFFGRko2UWwybUc4QjNxcHo2RDBz?=
 =?utf-8?B?MlJzQlY1TlJLR0UyeWFSNzVEUkkvWmZNc3JKT0FvUHhHWFlkUENpSlVvV2JM?=
 =?utf-8?B?TVcrcHg5TVdPNWNHZW9KRUNVelNQbW1jQzJzd3g2cmhvT1dBRDMrK0V0K0Nk?=
 =?utf-8?B?NmRaRkwyWDZlTS9TSGNMMWRKUzd2RWo1aXZsVlZodmxoZmtQMEU5TFFlY3kx?=
 =?utf-8?B?M2kzcnVJbW9QdGJ4SU1uR21nUkkrL0hSNW9ETm9QM3doaWhwT2kxOHpiT2Fp?=
 =?utf-8?B?ZWFwNjQyK2tVQTJnQkRoTGgwdURXRDZKYTI1OTZxRGdWQVNXVTMzZjI2WEhS?=
 =?utf-8?B?L1VJWmw1MEkyMk5GMmpZVG9HMnE1VXBSbHQzTm5jRUdKdVFzdFQ5cGExcHZP?=
 =?utf-8?B?bHQwNG11VnJ6WloyYzBQMDVQdndsWW0rSkFlUW9PVWZXNHBMMjRqOEg0MXRt?=
 =?utf-8?B?ZlRxM0lSbTluRTZqamV0V3YzcUt3Y3hycGk4OEZmSkM5RFBYK1dzUUhCdm9G?=
 =?utf-8?Q?23RRxwTt7u7qTjy8=3D?=
Content-ID: <7400FE89111B5942B21F82E462F5798A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c9a646-c7d4-48b2-6898-08da38b3d119
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 09:50:18.4126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QPPLIksjpqchXEfkAnYbUVq0c8cv0d/Szp9oWzSt6ws1EOdTBGt0SAPALERBg7cJGntEjQ9xGJBrLLHL+Q1w822vY3XHmhOFtE6XusDABEk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_025021_109140_2D316041 
X-CRM114-Status: GOOD (  25.85  )
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

On 18/05/2022 10:25, Hongren (Zenithal) Zheng wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This commit parses Zb/Zk related string from DT and
> output them in cpuinfo

Similarly here, the typical "this patch" comment.

> 
> One thing worth noting is that if DT provides zk,
> all zbkb, zbkc, zbkx and zkn, zkr, zkt would be enabled.
> 
> Note that zk is a valid extension name and the current
> DT binding spec allows this.
> 
> This commit also changes the logical id of

"also" makes it sound like this a separate change?
If so, split it into another patch.

> existing multi-letter extensions and adds a statement
> that instead of logical id compatibility, the order
> is needed.
> 
> There currently lacks a mechanism to merge them when
> producing cpuinfo. Namely if you provide a riscv,isa
> "rv64imafdc_zk_zks", the cpuinfo output would be
> "rv64imafdc_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr_zksed
> _zksh_zkt"
> 
> Tested-by: Jiatai He <jiatai2021@iscas.ac.cn>
> Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
> ---
>   arch/riscv/include/asm/hwcap.h | 20 +++++++++++++++++++-
>   arch/riscv/kernel/cpu.c        | 14 ++++++++++++++
>   arch/riscv/kernel/cpufeature.c | 33 +++++++++++++++++++++++++++++++++
>   3 files changed, 66 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 4e2486881840..02c454a12683 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -49,9 +49,27 @@ extern unsigned long elf_hwcap;
>    * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
>    * extensions while all the multi-letter extensions should define the next
>    * available logical extension id.
> + *
> + * The order of them should be maintained according to the riscv-isa-manual.
> + * As this is an internal API, changing the id of one extension does
> + * not affect compatibility.
>    */
>   enum riscv_isa_ext_id {
> -       RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
> +       RISCV_ISA_EXT_ZBA = RISCV_ISA_EXT_BASE,
> +       RISCV_ISA_EXT_ZBB,
> +       RISCV_ISA_EXT_ZBC,
> +       RISCV_ISA_EXT_ZBKB,
> +       RISCV_ISA_EXT_ZBKC,
> +       RISCV_ISA_EXT_ZBKX,
> +       RISCV_ISA_EXT_ZBS,
> +       RISCV_ISA_EXT_ZKND,
> +       RISCV_ISA_EXT_ZKNE,
> +       RISCV_ISA_EXT_ZKNH,
> +       RISCV_ISA_EXT_ZKR,
> +       RISCV_ISA_EXT_ZKSED,
> +       RISCV_ISA_EXT_ZKSH,
> +       RISCV_ISA_EXT_ZKT,
> +       RISCV_ISA_EXT_SSCOFPMF,
>          RISCV_ISA_EXT_SVPBMT,
>          RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>   };
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index 40c8776aec12..9d2bed2c1a37 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -87,6 +87,20 @@ int riscv_of_parent_hartid(struct device_node *node)
>    *    extensions by an underscore.
>    */
>   static struct riscv_isa_ext_data isa_ext_arr[] = {
> +       __RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> +       __RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +       __RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> +       __RISCV_ISA_EXT_DATA(zbkb, RISCV_ISA_EXT_ZBKB),
> +       __RISCV_ISA_EXT_DATA(zbkc, RISCV_ISA_EXT_ZBKC),
> +       __RISCV_ISA_EXT_DATA(zbkx, RISCV_ISA_EXT_ZBKX),
> +       __RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
> +       __RISCV_ISA_EXT_DATA(zknd, RISCV_ISA_EXT_ZKND),
> +       __RISCV_ISA_EXT_DATA(zkne, RISCV_ISA_EXT_ZKNE),
> +       __RISCV_ISA_EXT_DATA(zknh, RISCV_ISA_EXT_ZKNH),
> +       __RISCV_ISA_EXT_DATA(zkr, RISCV_ISA_EXT_ZKR),
> +       __RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
> +       __RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
> +       __RISCV_ISA_EXT_DATA(zkt, RISCV_ISA_EXT_ZKT),
>          __RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>          __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>          __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index dea3ea19deee..800a7aebced3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -199,6 +199,39 @@ void __init riscv_fill_hwcap(void)
>                          } else {
>                                  SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
>                                  SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
> +                               SET_ISA_EXT_MAP("zba", RISCV_ISA_EXT_ZBA);
> +                               SET_ISA_EXT_MAP("zbb", RISCV_ISA_EXT_ZBB);
> +                               SET_ISA_EXT_MAP("zbc", RISCV_ISA_EXT_ZBC);
> +                               SET_ISA_EXT_MAP("zbs", RISCV_ISA_EXT_ZBS);
> +                               SET_ISA_EXT_MAP("zbkb", RISCV_ISA_EXT_ZBKB);
> +                               SET_ISA_EXT_MAP("zbkc", RISCV_ISA_EXT_ZBKC);
> +                               SET_ISA_EXT_MAP("zbks", RISCV_ISA_EXT_ZBKX);
> +                               SET_ISA_EXT_MAP("zknd", RISCV_ISA_EXT_ZKND);
> +                               SET_ISA_EXT_MAP("zkne", RISCV_ISA_EXT_ZKNE);
> +                               SET_ISA_EXT_MAP("zknh", RISCV_ISA_EXT_ZKNH);
> +                               SET_ISA_EXT_MAP("zksed", RISCV_ISA_EXT_ZKSED);
> +                               SET_ISA_EXT_MAP("zksh", RISCV_ISA_EXT_ZKSH);
> +                               SET_ISA_EXT_MAP("zkr", RISCV_ISA_EXT_ZKR);
> +                               SET_ISA_EXT_MAP("zkt", RISCV_ISA_EXT_ZKT);
> +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKB);
> +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKC);
> +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZBKX);
> +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKND);
> +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKNE);
> +                               SET_ISA_EXT_MAP("zkn", RISCV_ISA_EXT_ZKNH);
> +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKB);
> +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKC);
> +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZBKX);
> +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZKSED);
> +                               SET_ISA_EXT_MAP("zks", RISCV_ISA_EXT_ZKSH);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKB);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKC);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZBKX);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKND);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKNE);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKNH);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKR);
> +                               SET_ISA_EXT_MAP("zk", RISCV_ISA_EXT_ZKT);
>                          }
>   #undef SET_ISA_EXT_MAP
>                  }
> --
> 2.35.1
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
