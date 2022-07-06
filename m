Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A26C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 13:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YS1Vc/FaS7O4hWS0gzIbzNvMbvZvpN+oEKZgaXZ54aM=; b=dKxm1Z/WlM13qU
	eqt5xbFZH/6z7nXFF+ztseOx0kOX87WywjlTvcY2N7IQX2BQO1I0etrbpN4c5y/Gey1RTmCZk+jmE
	HyBPHbn3gtgy+RwZNsMWrwWkHGKuHOXwjFar603IfI+fgmfy3DWFephurXj0fihXocEzBZKHzlU4+
	JMbZHMWQACnRrOgZk1caKrS5bE/ii3DD/BOHT5eRP5mtA1Hz74owcgBDTxN18p2Yxa4QeERFDDQIh
	MRuz5SeXKoEgSqmLTnOIUvCdnOyivAkG66+YZQaKvojg4aDvYovI64I8HSguXgk1X8iA9Ugf0cP6J
	lhNZCBgQoeO03eRp4i7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94i1-00A9Mp-TB; Wed, 06 Jul 2022 13:04:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o94hv-00A9JK-Ra
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 13:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657112683; x=1688648683;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=UF/aGV++TCQo7dszZsiJWLjQbEbO0c/Xutad3UoW4vY=;
  b=i2xg6HMiOjsSLqvBCWhnF7XRRPhy5H5C6b9aT2oh6rwjXg4Spp5GhFdm
   sZIPoqU88cVeIYnfckEFuR0sFYsqe9+gyeSHr5Z3rrXakuq6LJL4Ux4I6
   9fHEyBvfHhGkXYMMz9/jtr1TDEtBSiDwLFNMFoOaGpykictzIG5j9RFcL
   1/X8lWxwc5mNXvThxXTbScD7UQrTYNp+pvXm41ORgGNdkJFRTrVgvBglJ
   MFzd3qKUlHXWaPrM3V3m2Xoeqmo2dHzqmW/6h46htv8fev+QR/poMG2CQ
   szx4PwPYjqk1CygtiT625y6Gx7FKFBmAtp37ZX2hmhyGLbIa5ssWP3Kdw
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,250,1650956400"; 
   d="scan'208";a="171272253"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Jul 2022 06:04:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 6 Jul 2022 06:04:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 6 Jul 2022 06:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdhIcU4Mm9WCb+cpBkFKsXPz1VZwYBDfHpTjOBljzNhy8iif1QSixWE6MFPiFw5uNpLoKYLY7NDOLs77mNQ+VzPS5kEAwD5WV2OAAvw074NFis5yYJT17fcFSn4LXK7ykh1DtVyBbBmwhMeOJjGyAbgST/BEvjlfmYRVc0YmjLsSNkRa3CEHHRaFNiQwmutiLQoYi+cTRfvLRDLpJxs2zrq6txsmaVAClx8eZXiilhwXEBs44m5MY+/1BBK+kB/byYql0tYhvRhZxdB5moRGxEEa/N8MEWt9/qA95kz1fFLf7eqBABjxdluy3g3gT6xXd1L+sODCz6QtnMkXC/UA1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF/aGV++TCQo7dszZsiJWLjQbEbO0c/Xutad3UoW4vY=;
 b=Q8Z6plUaX4M+80wxCQxS5IYDsODQH0SigngXaKdDR8LpBgTUtDgUz4/yqNGH943eJ9HgxKCrDsDvett+E/TsAy6AN51TXDpkweZQS9GoFWmAHcbZxKjT3UxoDOBvXOCF1mFmnrdN4DhR2tpiWPEcwxxw02xgp4j764X2RzrjpfIO7OwkeqDWSS39e6cRBqvHWScdW097kAcO5plCmk6KdzcThnsTRtuGhRxnzPIO6Y+hy2tnlUxspIYXqP8AMtq5OYVPsHe3bM+5d65tqkZ6y+rDWCO5W7+NQtHmFcWpgbkYSs9qvjxF1AbdPqESDluj65T0+84nddCZ1uM98Hilpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF/aGV++TCQo7dszZsiJWLjQbEbO0c/Xutad3UoW4vY=;
 b=lwuakXBdBuWfeH6zvrV6kqZm+xsT37xtS2uRW6lliZiV5OYIUhQ03OteL0zLJMkc1xJTZvfMUqxrTchlUmKr8LgE7TDvuK9y2ZDkZBmnUCC+nLvcGL5sx6aAk2Q9EADhCi3jh86SVrpQ2gFlYi3Rk1KOgsCZUBJBF1NgUcpYHaM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB1876.namprd11.prod.outlook.com (2603:10b6:404:ff::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Wed, 6 Jul
 2022 13:04:24 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 13:04:24 +0000
From: <Conor.Dooley@microchip.com>
To: <sudeep.holla@arm.com>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<Daire.McNamara@microchip.com>, <niklas.cassel@wdc.com>,
	<damien.lemoal@opensource.wdc.com>, <geert@linux-m68k.org>,
	<zong.li@sifive.com>, <kernel@esmil.dk>, <hahnjo@hahnjo.de>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Brice.Goglin@inria.fr>
Subject: Re: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Topic: [PATCH 0/5] RISC-V: Add cpu-map topology information nodes
Thread-Index: AQHYkKIdHc6oV2H//EKJV+LfcdW+Dq1wN82AgAAD8QCAACn8AIAArIoAgAA+T4A=
Date: Wed, 6 Jul 2022 13:04:24 +0000
Message-ID: <bcc3fc6c-1ff8-3db6-5aa9-beed2d0ea41b@microchip.com>
References: <20220705190435.1790466-1-mail@conchuod.ie>
 <20220705201931.nfwi5rlku7ykmydr@bogus>
 <8f07796a-d9a2-3301-aafb-7fbec4d5b1a2@microchip.com>
 <fb7be22c-cf19-0e06-f231-bb5b9167e179@microchip.com>
 <20220706092126.k6zaknwcwzyg22ak@bogus>
In-Reply-To: <20220706092126.k6zaknwcwzyg22ak@bogus>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d85c8ff9-b5e4-4e76-2408-08da5f500ccc
x-ms-traffictypediagnostic: BN6PR11MB1876:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JFMFj5RFOxfZ9Nwgzmu3hXr6tEiWLCyrw+OCpBgGjZXHPccJhgajLXhaeyR+mHl2p8fyxDWtFvI9QVJDz2qnI9OGUzEtTiiOGNPBOgJ/ujNodKua4fsETBzr+Ee7vxU/fmb2qqksp2VUQIW4nSNu85SVdHDSJyINhy8Rt/JKo/asBVmlx4wKPjRPiTBnBUSUHpzN6IGoOUu36hFMwOEfgXNFJmADP3jbEdsHbhl7CnFeLas1OidWSM4s6/3+33BS7XQClO3yCcQLok64b0oO72HjOdV+0WTpO/adGzyR3VqR4YaFwYMQnqijqi26ASi1P494a/a3G+E081qySK7cfssBN4gDL7xw1owQyuQEmnieA94a0g6sSqrd3cPuOlAh+oF6QLdvtzMn+sXc1cpz/DXtltQ3Utj6bB0OPlE135f1rWnVOzqlG2p6XBJ7k58DdE96ikfw//+UEPJFeAZS34Q/Pi6nfjE2VZ3sBCf5UiVGSRw5zv03Kisl7098HMNKEx9fgWy3Xm7CF4iO8jtHCUMsYp0Q4cd9wqMQN7qb0kSxRGs4iPDKqpSF2x+9/pErim0P2j1Zczwz21/IogLMRyIy8JAZyGD4tzUbv7DVIKdDwiUDpBmTX9JMZPfHIcJHmH9FdBz/RVry2ihLit+FegXYymRnrLFDGktyNYoOHg0xW7IkldL2WuN8Wpja3pL/qEsqocr9vOvC4pLmdZ7Ubh7vSOyFo1aLOCSrX0AuF5ToNtPKK4SEXwGaXmJMC3+vMpEo1R68yGB7k6hc2fKEyFPQlX1fq+HaflJa5+NgCWCD4vN9P1qk7+SnkVKJ1N+tiVTswXUlcsagJs9omAhzF1NpcEtiVhRVsUHsY82B5XjMoKfm8xkGc2VqleDATgDr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(39860400002)(366004)(396003)(136003)(6512007)(2616005)(66946007)(66556008)(66476007)(66446008)(64756008)(76116006)(8936002)(7416002)(4326008)(8676002)(91956017)(5660300002)(31696002)(36756003)(6916009)(41300700001)(86362001)(31686004)(6506007)(2906002)(6486002)(186003)(26005)(53546011)(478600001)(83380400001)(122000001)(38070700005)(316002)(54906003)(71200400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHNBRDlGVDFLYUtRSVlXRVBKMmRBbVREdGVYOEVMTFJucUJwRUQ2Y3Uwb3hr?=
 =?utf-8?B?eGdZcGVwenljaDNVN2hKQVlWSUo1UTJTdW9yTXhXY1puaVdxTjhydlF4QmhF?=
 =?utf-8?B?M2hrQzFVUC9HbC93Z21CVDdQeDZYWmFDRVJCU0hWL1h4dFpQRU9zK2pnME55?=
 =?utf-8?B?Wm5STW5pSld3NzA3MFN3ek04eWxVUUIycy94eWxlNElHYUJxNmliN2FKR0VR?=
 =?utf-8?B?RGRPbWVYZjVVb0dBbWd0b3dobWJYaW9WWHd2ODYyWWMybVFDUVF5NHdzeTh0?=
 =?utf-8?B?cnFNaFN1cUorNmQzcFM2cVBJYkFwOUF0T2kxMXNOckJRZm8yNzh2bkpXNTNR?=
 =?utf-8?B?WmJCZ1ZLdEFOc0hQcHJibkhmSXNEOEhoT0dtTHJMQ1FubzBkVVdkazhQaDFN?=
 =?utf-8?B?dXhBQVJKWit6dFJ1UEo0bmp6YVRpM1RyNFE4L2JUWEVGUS95cmdNWmdNaG13?=
 =?utf-8?B?ZDRvZlVQOEM2K0tSSU1wNFN1bkFYOUpZanc2LzFJcnRwU1ZUWFozUHFRQjNo?=
 =?utf-8?B?QlJ6Vy9ISjdKRE5kei9jV2JiV3J3Z09jTDloc0ZGYnlhdmRrR0hzZGRFSmVC?=
 =?utf-8?B?U1RYb3ZXNnNxdCsyeWRGclo2cWJ2TGp6d29GYmF0SVBZcG53STVaQ0swTE9N?=
 =?utf-8?B?ZlJqc0Y2WlljdHRzK0F6VFEvSVE2MEt0Q0NWaUZqQUdOSDVmT1l4TzhXSEhi?=
 =?utf-8?B?TkZrdjlGQk9ZaWV6OEdZVmdsY241RnNLL09Dc2YyR0tmV2Rad1FaZHhiMmJB?=
 =?utf-8?B?eGw3L0N5dW5FMXFrRllxMy9VYjZGVG0xNUZnY0dOU2dmckt6Q2lobWFoeG5X?=
 =?utf-8?B?U3cwanVZTkE1UHdLTlZTaldxUTNGM1doZnMwSmI2ZytPdmlZOFJDa0JPaFlr?=
 =?utf-8?B?eTh4KzdMd3VCNUs0ZXRoS05UWVgyd1hHVGc4VU5xL2poMy9YcitnSmpmYjA1?=
 =?utf-8?B?d0E3L2NTZWlVT2dkRi84M2lENlRvRXRpMitaQ3dqL2dZQ3VOT3QvaHhaQytP?=
 =?utf-8?B?clVYOHhQemFKWldnaG8xTStXanc1d1VCcU9icm1xWlJSbkcyekpNd0F2ck41?=
 =?utf-8?B?eHorRXZtbmtVTC9JVVdKQWdLbEZuSVRiemZKT1MvRW91cWlQWkI0VVJDSGNn?=
 =?utf-8?B?R204dlJ4Vm9DclFOYmZtSlRpbXdYb2pxUVV1ZGVKaUdWZXNJNTN1QURyL1k4?=
 =?utf-8?B?OGIxWElrYmdkUDRwcHdnVGQ5WERnSGNPQlArRWVDZVpodi9nOWxKQ0UybXdw?=
 =?utf-8?B?QytaZndPY2lYd2JraVBRdHJMS3BaR2RvUllVQ1lSU0NHbjBYeldzSnlzK3dC?=
 =?utf-8?B?UExlbXJMVzZ2YXVxZjdqb3lSa251VGRKR3p2ZEM0ZFdGcWNRQVZibW8wd2F6?=
 =?utf-8?B?LzlEWHV3OGlFQzhlZXF6czNqaGl2ZnU1cVp4dy92WUNvRXlmUXloMHk3cWd1?=
 =?utf-8?B?ZjZoYkpBc0pvYXZoYi9ieUhCZ1htUmVPbmZCb1J1MXpGd0hsaWJCd01ueXJi?=
 =?utf-8?B?a0d2UkpQMUZxczNBeHMrTlhxYTVDenpiUWRzVWFiOVcwM0l4M0swZldGZnhS?=
 =?utf-8?B?dWN6YUsyNWtwVldUUzdpMWUySWhLd1paTmw1bm5ZMUdQRVJrOW9lV3IvZTFH?=
 =?utf-8?B?cWhneS95WXlpdXR1clBpd1paUlJDS0xWLy9FbzNOcVlFUUkxSXA4V3YvZHBB?=
 =?utf-8?B?bTQ1VGNjbmNaaWp1eFYreTBUamRCNnlmVlJXZXl2Zy85MGZvbVdNVFo5bEtQ?=
 =?utf-8?B?OTE1NU1oM3BTazN5ZDgybE92WnltQis1NkphQ1d4OEFWZTRQN1pjZGFGN1RQ?=
 =?utf-8?B?enY3U2dpVzZLd0VRYjQ1L095SGt4ZzZrRURpaGwwUDNPWkhna1FDUnZnbUhp?=
 =?utf-8?B?OEpDSkNHcERtVTFkZjRXUVZUOHNJT3Q4NnE5QndiVThac0xuUCtkOUZsY1Q0?=
 =?utf-8?B?ZEpHZEVQdzJMbVZTbTVWNFZEQW9pekl3Qi9lS2c3UHVaaVFMNlNpZDNES0Jh?=
 =?utf-8?B?Vk1KeXNxQzlkNElDVUtVUDgrSnA2NFpLQTg0NjVySktwUWdYNTZaWHBXRVhV?=
 =?utf-8?B?U3ZycVh3MFk0TGVoYVluUFlRVE85UVoyQ3YzeVhZNWlXaVdUSHlPb2g3MnZC?=
 =?utf-8?Q?5m16GUmxeIioLP/sAcmoQkjV8?=
Content-ID: <C390B3369C34A64DB7D3D76D230A3A50@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85c8ff9-b5e4-4e76-2408-08da5f500ccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 13:04:24.2761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKniBRUqipcOxvQ7HP/Cl7MjP3vY5byUcuC/zr+jksiPJ7FFWvTK9Sp9CT6OWleP6VFJYPINT1C9RgPlEKn/llMxsWyA85oUz4z9rHCzZrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1876
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_060444_133479_26E3ED73 
X-CRM114-Status: GOOD (  23.03  )
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

On 06/07/2022 10:21, Sudeep Holla wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Tue, Jul 05, 2022 at 11:03:54PM +0000, Conor.Dooley@microchip.com wrote:
>>
>>
>> On 05/07/2022 21:33, Conor.Dooley@microchip.com wrote:
>>>
>>>
>>> On 05/07/2022 21:19, Sudeep Holla wrote:
>>>> On Tue, Jul 05, 2022 at 08:04:31PM +0100, Conor Dooley wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> It was reported to me that the Hive Unmatched incorrectly reports
>>>>> its topology to hwloc, but the StarFive VisionFive did in [0] &
>>>>> a subsequent off-list email from Brice (the hwloc maintainer).
>>>>> This turned out not to be entirely true, the /downstream/ version
>>>>> of the VisionFive does work correctly but not upstream, as the
>>>>> downstream devicetree has a cpu-map node that was added recently.
>>>>>
>>>>> This series adds a cpu-map node to all upstream devicetrees, which
>>>>> I have tested on mpfs & fu540. The first patch is lifted directly
>>>>> from the downstream StarFive devicetree.
>>>>>
>>>>
>>>> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
>>>>
>>>> I would recommend to have sane defaults in core risc-v code in case of
>>>> absence of /cpu-map node as it is optional. The reason I mentioned is that
>>>> Conor mentioned how the default values in absence of the node looked quite
>>>> wrong. I don't know if it is possible on RISC-V but on ARM64 we do have
>>>> default values if arch_topology fails to set based on DT/ACPI.
>>>>
>>>
>>> Yeah the defaults are all -1. I'll add some sane defaults for a v2.
>>> Thanks,
>>> Conor.
>>
>> I shamelessly stole from arm64... Seems to work, but have done minimal
>> testing (only PolarFire SoC).
>>
>> Author: Conor Dooley <conor.dooley@microchip.com>
>> Date:   Wed Jul 6 00:00:34 2022 +0100
>>
>>      riscv: arch-topology: add sane defaults
>>
>>      RISC-V has no sane defaults to fall back on where there is no cpu-map
>>      in the devicetree. Add sane defaults in ~the exact same way as ARM64.
>>
>>      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
>> new file mode 100644
>> index 000000000000..71c80710f00e
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/topology.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries
>> + */
>> +
>> +#ifndef _ASM_RISCV_TOPOLOGY_H
>> +#define _ASM_RISCV_TOPOLOGY_H
>> +
>> +#include <asm-generic/topology.h>
>> +
>> +void store_cpu_topology(unsigned int cpuid);
>> +
>> +#endif /* _ASM_RISCV_TOPOLOGY_H */
>> \ No newline at end of file
>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>> index c71d6591d539..9518882ba6f9 100644
>> --- a/arch/riscv/kernel/Makefile
>> +++ b/arch/riscv/kernel/Makefile
>> @@ -50,6 +50,7 @@ obj-y += riscv_ksyms.o
>>   obj-y  += stacktrace.o
>>   obj-y  += cacheinfo.o
>>   obj-y  += patch.o
>> +obj-y  += topology.o
>>   obj-y  += probes/
>>   obj-$(CONFIG_MMU) += vdso.o vdso/
>>
>> diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
>> index f1e4948a4b52..d551c7f452d4 100644
>> --- a/arch/riscv/kernel/smpboot.c
>> +++ b/arch/riscv/kernel/smpboot.c
>> @@ -32,6 +32,7 @@
>>   #include <asm/sections.h>
>>   #include <asm/sbi.h>
>>   #include <asm/smp.h>
>> +#include <asm/topology.h>
>>
>>   #include "head.h"
>>
>> @@ -40,6 +41,8 @@ static DECLARE_COMPLETION(cpu_running);
>>   void __init smp_prepare_boot_cpu(void)
>>   {
>>          init_cpu_topology();
>> +
>> +       store_cpu_topology(smp_processor_id());
>>   }
>>
>>   void __init smp_prepare_cpus(unsigned int max_cpus)
>> @@ -161,6 +164,7 @@ asmlinkage __visible void smp_callin(void)
>>          mmgrab(mm);
>>          current->active_mm = mm;
>>
>> +       store_cpu_topology(curr_cpuid);
>>          notify_cpu_starting(curr_cpuid);
>>          numa_add_cpu(curr_cpuid);
>>          update_siblings_masks(curr_cpuid);
>> diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
>> new file mode 100644
>> index 000000000000..799b3423e0bc
>> --- /dev/null
>> +++ b/arch/riscv/kernel/topology.c
>> @@ -0,0 +1,30 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Based on the arm64 version, which was in turn based on arm32, which was
>> + * ultimately based on sh's.
>> + * The arm64 version was listed as:
>> + * Copyright (C) 2011,2013,2014 Linaro Limited.
>> + *
>> + */
>> +#include <linux/arch_topology.h>
>> +#include <linux/topology.h>
>> +#include <asm/topology.h>
>> +
>> +void store_cpu_topology(unsigned int cpuid)
>> +{
>> +       struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
>> +
>> +       if (cpuid_topo->package_id != -1)
>> +               goto topology_populated;
>> +
>> +       cpuid_topo->thread_id = -1;
>> +       cpuid_topo->core_id = cpuid;
>> +       cpuid_topo->package_id = cpu_to_node(cpuid);
>> +
>> +       pr_info("CPU%u: cluster %d core %d thread %d\n",
>> +                cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
>> +                cpuid_topo->thread_id);
>> +
>> +topology_populated:
>> +       update_siblings_masks(cpuid);
>> +}
>>
> 
> Looks good. Again package id is not cluster. This is what my series is
> addressing. So update the log as Package instead of Cluster above. The
> cluster id will be -1 unless you can get that for DT.
>

FYI I took that directly from arm64:
arch/arm64/kernel/topology.c:L57 (next-20220706)

	pr_debug("CPU%u: cluster %d core %d thread %d mpidr %#016llx\n",
		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
		 cpuid_topo->thread_id, mpidr);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
