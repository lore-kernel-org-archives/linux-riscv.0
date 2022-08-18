Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C0D3C00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 07:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M3yBZvRGpWPXaUPIExS0P6S+uBpFZ87gpxLWtEYhQDg=; b=V0lqPYlZGuWa7K
	ykm5J5/a4rlC8y3Oh0bm9sDLNMue9wlFFoxIkOhtoT1tzvBuyY1YMABsiWAf0z5XwFogPKSS/nV4I
	fyuAL6IxoXPD+aosRqkIsUrubxMmkcNY5bRmxzTS93BbZZnWj2mxRFHsv2pedmzIGRt7T6Rejq4WE
	9/hUuUmFUL1Goa5dKCFKXG5eW78J13eDd9HOgjlQiNecrVbeqyDj9bsGE2IGNC7bYuUMuT+ZgQflP
	xM0K1McS36yPuVj0kyGDmBUx3VUHBP9ppuBdrWWv/vJY1Kmu4cHRs3gRrOtaXeYne3Ra1GDvCs/Ye
	sxbMNbmjZKk+VpiK+dXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZZN-00HRhq-Ho; Thu, 18 Aug 2022 07:03:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOZZK-00HRdv-PE
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 07:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660806234; x=1692342234;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ZF8CkaWDTnT2Va8Wtohp/H4hP/Z/T0+egn385It/42o=;
  b=QdJ5us9vNtIAMWvTaoWuR/JxOKjJS4JKssvO7z6YxhT+le0kbYtl90OF
   N9b6fMe10Wbp/ey++czvqRMCBnebPxtS24cZaaHnhbCSnvwkE2EvPDUz6
   ieqhlfbB/LjWVn6RCJd5hPvLfInzgGmQAx697Skbrrchm4GXlVFes3bnd
   tMtNeVbQoD9cSc1u5k8qatj+tCrmCnzPrOf3m6K+EyK78czzt41+8aaoZ
   48SFQh6V2gL5So8SRCDInD19asEmLVG/ZyuP0kR8tj8KLSOaVpYlGLpqQ
   ah6TwTEtgKM3LqzrmGzDq/s4lv0WKPVTnR05rqeyxiyODED2hDkHqCmPe
   g==;
X-IronPort-AV: E=Sophos;i="5.93,245,1654585200"; 
   d="scan'208";a="172981188"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Aug 2022 00:03:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 18 Aug 2022 00:03:50 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 18 Aug 2022 00:03:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS1GhvpvsbVU2eClgX3zielcA2+/qtHZzopbC5u+OnDk7VSXYFea4UQ9waz8H3/PWSt2DBBk/o74NitPQU8+0aY4JWhewrOzr0fib2mwr5gawp1K7vkSwM93iHnAs3xu1iBZ98OfCOGbng4uHcKc+otH/fvpwYAH79MPGvSiWqlx202Rcrp4XnworcxdhgddCnZmWOaAGE/pBmb9g536ArQwoWEnwu36TFeUrQFkwResz/SS2bfCfX0G/gpciFAYD0ZuFO9rX7sHis1651QnniTr52WRHIzxCeCpeAcP7F+WY0x6iLB0kjLANKlW0p8KZ0o8GCi6u0eD0GlZy97eRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZF8CkaWDTnT2Va8Wtohp/H4hP/Z/T0+egn385It/42o=;
 b=EtZ0koOEk7GBUq9pEcLSjfQfpPj/rKn/eoA9ZIVnpEZ4eADOKzgrqGZXeF0t0KnomTkM03bXY4LyIC6N39x3Z53knx9ariNdLOh2AzO+Zckad5Tndrg+SrUNw+bkEMc46waA6W54Y+2TwtoXJ74o5WTroFJwVo9/bNIF3ejokHmnkgLot34s9mWER4N2UzxEsnTr6g6viiDuwc45oGmQtOKwcCNMs22Jsldr4piQI7xTCGsJfvIuL4yD7+Z6ZSvX+G8Nx8BUn4OUWMe6ajVtPdOJw8J7MtCxPRhdH1gPpcIlX8l1PUaCo6pOgSUFXO939I02f7SCwq6jpzEdQVjxCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZF8CkaWDTnT2Va8Wtohp/H4hP/Z/T0+egn385It/42o=;
 b=P3oDzWVcbdedK7q19XHw3RwazhahdFwGFKrv/cGplsXH2BpSJQQnHPHJnFUAVYz9VWtmI7Mn46xmG+FMPqODL4y5ASQbVnJ1HKc3FJ9H78y/JUJw8YZoUe65mGxquUvtj7eoAaQ0uDo8CNZ5ArQhd1seAm+7NXKeRyVzrC740mA=
Received: from SN6PR11MB3264.namprd11.prod.outlook.com (2603:10b6:805:bd::16)
 by MN2PR11MB4062.namprd11.prod.outlook.com (2603:10b6:208:150::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Thu, 18 Aug
 2022 07:03:46 +0000
Received: from SN6PR11MB3264.namprd11.prod.outlook.com
 ([fe80::c9b4:8aa2:5c9e:ffc2]) by SN6PR11MB3264.namprd11.prod.outlook.com
 ([fe80::c9b4:8aa2:5c9e:ffc2%7]) with mapi id 15.20.5504.028; Thu, 18 Aug 2022
 07:03:46 +0000
From: <Daire.McNamara@microchip.com>
To: <heinrich.schuchardt@canonical.com>, <Conor.Dooley@microchip.com>,
	<robh+dt@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <emil.renner.berthing@canonical.com>,
	<devicetree@vger.kernel.org>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <palmer@dabbelt.com>, <geert@linux-m68k.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
	<atishp@rivosinc.com>, <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Thread-Topic: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Thread-Index: AQHYsjzjuV6JQqnbNU6bXELDL6GyqK2zYxOAgADZw4A=
Date: Thu, 18 Aug 2022 07:03:45 +0000
Message-ID: <ccb5792bfe467dcc5046b7cb4de3a6af14cd3d5a.camel@microchip.com>
References: <20220817132521.3159388-1-heinrich.schuchardt@canonical.com>
	 <32a72954-c692-6c5d-b07b-266d426c3cb4@microchip.com>
In-Reply-To: <32a72954-c692-6c5d-b07b-266d426c3cb4@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e28524fe-9484-46ba-58d1-08da80e7cb18
x-ms-traffictypediagnostic: MN2PR11MB4062:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uTcSDyeb7QKfvrpzit4N77GzXxdz0NE5huOFYrTcren35AcY9OAs3xOzkV9TrlrPIIUfd3yFX2a1FochIBGoHlbH7OMfOT4RgZJCNgJZVjVytuPe1dvYMQiQ4JF+sxJM6/aJc0M6fyHXTwXRdwi7PMla3EJ/SLb/7v4btNAzfAjt+O5zfGsNIjIN3U3OS5yXQL22oP65MR/lvPHTPjYLhmEuEEM18gDCoXlDn7tRNLR2pjURc95WSRDKaLybDzQTdIxa1sgzVv23qM4kIfEs2F01WD08/RjrhnTS2ObBAPTw6+3YL77EfIXSz/iCPJXhWjJtfz2Dh8Pqq4EVX4wHzSLBPBPj+C6PqJNi3qHnBFvLBVqmynzycslDGcMPCegKE3kihfPegQaeE/HcypGpRqH+Ovn6A0uc6RWsuj0klg27q+O1/JEEWphSoosyBujp0CyhZDqcsxtPZzGtTv0a56KrYW6N+YJQ7plxSWD12EQFAmeHB8w+ggbDGSMvegR2xXKLI8KS6tsZ+SfWJ7RU0ojRAmB5md8OsA4gqfmP58bAlLnagx5lwJXMC162bSismLslyp7dl65SdjipCD7S/z4oXF2YXMXXu6JlT8/ZAegxzS+3TwnNX/1M+gD+81DvXsW6PIeaIXZ2rNPJpELPJMkxuTmK430FLm9462PlRzVdYsohaaR0nv/1FxDQHlxE5oOoWUXxCvBLKDAE+ccsVQ1z/U+xCnsSN83sdRjWFs5Ks9iEOshJrKjLP/NtCiBlmshBbb+W+LHjaWJhJMU1Jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3264.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(366004)(396003)(186003)(478600001)(38070700005)(6486002)(2616005)(83380400001)(26005)(6512007)(41300700001)(6506007)(71200400001)(38100700002)(53546011)(122000001)(8676002)(66476007)(36756003)(66446008)(91956017)(7416002)(8936002)(5660300002)(66556008)(64756008)(76116006)(66946007)(4326008)(2906002)(86362001)(110136005)(316002)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bUdaN2JsVm9zMldldTJEcEppSWJOMnJEK3ZsNStZdFlJd1piL0RZQW9kT1Yy?=
 =?utf-8?B?R3ZZaytlbEJseVR5c3hrbXFvTjZHRFJsVllGVU1JeGdUdkp0cTZxbDE2TVRo?=
 =?utf-8?B?bys2bVg1WWFiT1RiZFRyRXI4bFo0dWFWcERlWTZNbTFPczMvYURta2NGa1Ir?=
 =?utf-8?B?Z0lGdDM4TkwrbnBSZWYzUk9NcHhoeFJ1Y3liQUw5bWVRZ0ZVbFJITHNVaGNC?=
 =?utf-8?B?alZEYzZpbWJ0RDN1UFY4K3hSVFlMUmtRV2wzODFKaUtOUmxtS2drT29HWnVX?=
 =?utf-8?B?V1NhVVp2dFI0T2FScmlXRUZGYi92Ukt2clVjaG5DdFRpV0pDa1JBckNoV0tn?=
 =?utf-8?B?bmJGNytEMkVaekVLTjV6YTJDUXhGQlVXWXZQZXdFbm1EeGRxTSszYVMwbUdm?=
 =?utf-8?B?U0dPRnJ4Y09zR0R3L2VVendjTGg2ZkxXSGVBbUZOeTVFUUZZenBoRVlNemhS?=
 =?utf-8?B?N2duNTJFUWlWQzRmdlA3VVh5bFdUUGpDYnBoWDViNjJkQnBEcUd1bmg1Y3l1?=
 =?utf-8?B?ZjhWRFZsekJROVVxRkEydXp5Vk1NY1lJY1UxQ0R4dVA5cTE5Q21nU0JVNXU4?=
 =?utf-8?B?bmczakpqeUxaYVNZWDhpZVViN1V3SkJRSE91dkt1SHdzVzRtK2tQU2QzUUV1?=
 =?utf-8?B?cmtiOEdZQVdGTTVIckU2WTNMUlhQeXVteFpzc0krY052WlJ6akcvMmZkak1T?=
 =?utf-8?B?cEl1L3BwL3lBSWt0Z2dWdFoxcjRma1hMeXUxY0ZEK09Fd29VOWYrZVNRSEJO?=
 =?utf-8?B?SFRINE9GVHdNdlhvWC9Xb2hDU1oyTEVOWnZocVczVTVadk4veEdlRjBsc3Jv?=
 =?utf-8?B?d2RIM3F4TTE5SExPdVBoWnl3NGgzNGt5a3V3Ynp0ZDNhRmpCSWp0UlRUODhs?=
 =?utf-8?B?aXMvU29tY2s1ZGtxNlczWmhoaTFYZmd4aEl6L2hyb0IxQkhhZXNYNi9rRHIz?=
 =?utf-8?B?VVRMZmljNTZzTDZ3Q3BSRk4vZWExVE5ncm1OUU0vRkRqK3AzOHVQM25qNzJK?=
 =?utf-8?B?SjN0YUpqeWJKOXEzVWdYZGc3RDN5Rzd4TUJVeGVBcGt3M2ZKelg4R3oyOVlS?=
 =?utf-8?B?SlJwYXhPcExYZFZlV0YvSW9EOExQU2owbndSUm5QUStGaTFpMXp6bVhienVp?=
 =?utf-8?B?RkN0Unh5WnByQitSMnFPbzludmZsdkprdFdFRjZ4ZW8rRmhERyt1NFFzZXZa?=
 =?utf-8?B?dG5xOUpsWndlbHd6VXJsT2d6WldSMHRhK01jK2t3dzhQRlpNak5CWCtnTjl1?=
 =?utf-8?B?U1NxZHVLNkpJUTZZQno4OTQxMGg5V0w3OVJLSncrWUlUczFHNDRCb1hEWHpL?=
 =?utf-8?B?RDhtZUVnUWd6VFo5aGtvTDlMdlhTeFJ3WFBFT05tVmVsUjA2cVBEV1g4R214?=
 =?utf-8?B?QTFlbUkrOUFKVExaUkNpRi91NlFhZUEyVllOeUF0SVVhK3BGYzEzdlNlNVlh?=
 =?utf-8?B?VjVFM1hodnYySmxJWTMwN01MWGl2SDgwalZaTmxuM1YwUEFsbWo0bkRNUlRN?=
 =?utf-8?B?cVhnQ1VhUDhIbUorcVplakdpdGFENG5zSXVFNWRRdXhySjFTeGZYQkNhenpZ?=
 =?utf-8?B?NGNncmh1TXpGZW1pRFZtV1Y0c0U1SDlab2ZMY1VUUGxPSGM1bWhHcGhDbkZD?=
 =?utf-8?B?SGJqSTlONWdCd29WbmtTQ2lYMFFJdWRnTlJVWm9HL21neWtadExmYWd2Qm01?=
 =?utf-8?B?VkJCUlN0eGVzOTBZZUxiTmJSbUhpWi9yZ1ZVT21hSnVvZzR1ODEzRU1OUmIw?=
 =?utf-8?B?Y1VzVGxrK2NURHZjSWM2cmZTV1VVNDRkdmVZSS9lWFdkNkJUQ0h0UnRUVDRJ?=
 =?utf-8?B?dXA0WURleGpYTXBENHZTRmV0STM2TDc1dVNTSXg5ZWJJcG5HWk15bmprbUxn?=
 =?utf-8?B?VGJZWTRPTHBLTWtUMVhDVWtqNUdqRmFzbHVBZHlicVh0bjIxUUFibEdDMnRo?=
 =?utf-8?B?L2lDa2hEWGxIZ0xOV05RbU8vVTBUbDAxRWEzNGVwSjhRSVJHOFpVNGI5WEVO?=
 =?utf-8?B?MXFBRlFEeGxlWmRPeitiTVNVdnJmMjBadEdSQU80NkxJQUVwcmtBVDN1ZWN1?=
 =?utf-8?B?d0lkdUtEMDkwekFhYWp5Z2F3MSt5MFRNdHNRVjFLRjlqN1g0dzBpeUZ6K3dL?=
 =?utf-8?B?SDlqdFhpWXZCUlVZTnlMWTY1cjdSQ291L0VlWUtlUS9JdTRFQnVrWjMzSE4y?=
 =?utf-8?B?bHc9PQ==?=
Content-ID: <7409362F9648724693F4BDA0C059F4D3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e28524fe-9484-46ba-58d1-08da80e7cb18
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 07:03:45.9048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TPDTn33k/+LgZE067nGQdtWH0P3qf0jbCMJ4l3vyK9mD2hRwV7e6a1yGDHR+bbxekJ15p8tWnvjT/4s1dVdhwNQtgYbr1exAoxrFNXF9HR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_000354_953946_5780CB73 
X-CRM114-Status: GOOD (  40.14  )
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

On Wed, 2022-08-17 at 18:04 +0000, Conor Dooley - M52691 wrote:
> Hey Heinrich,
> Interesting CC list you got there! Surprised the mailmap didn't sort
> out Atish & Krzysztof's addresses, but I think I've fixed them up.
>  I see Daire isn't there either so +CC him too.
> 
> On 17/08/2022 14:25, Heinrich Schuchardt wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you
> > know the content is safe
> > 
> > The "PolarFire SoC MSS Technical Reference Manual" documents the
> > following PLIC interrupts:
> > 
> > 1 - L2 Cache Controller Signals when a metadata correction event
> > occurs
> > 2 - L2 Cache Controller Signals when an uncorrectable metadata
> > event occurs
> > 3 - L2 Cache Controller Signals when a data correction event occurs
> > 4 - L2 Cache Controller Signals when an uncorrectable data event
> > occurs
> > 
> > This differs from the SiFive FU540 which only has three L2 cache
> > related
> > interrupts.
> > 
> > The sequence in the device tree is defined by an enum:
in drivers/soc/sifive/sifive_l2_cache.c
> > 
> >     enum {
> >             DIR_CORR = 0,
> >             DATA_CORR,
> >             DATA_UNCORR,
> >             DIR_UNCORR,
> >     };
> 
> Nit: more accurately by the dt-binding:
>   interrupts:
>     minItems: 3
>     items:
>       - description: DirError interrupt
>       - description: DataError interrupt
>       - description: DataFail interrupt
>       - description: DirFail interrupt
> 
> I do find the names in the enum to be a bit more understandable
> however,
> and ditto for the descriptions in our TRM... Maybe I should put that
> on
> my todo list of cleanups :)
> 
> 
> > So the correct sequence of the L2 cache interrupts is
> > 
> >     interrupts = <1>, <3>, <4>, <2>;
> 
> This looks correct to me. You mentioned on IRC that what you were
> seeing
> was a wall of
> L2CACHE: DataFail @ 0x00000000.0807FFD8
> From a quick look at the driver, what seems to be happening here is
> that
> at some point (possibly before Linux even comes into the picture)
> there
> is an uncorrectable data error. Because the ordering in the dt is
> wrong,
> we read the wrong register and so the interrupt is never actually
> cleared. With this patch applied, I see a single DataFail right as
> the
> interrupt gets registed & nothing after that.
> 
> I am not really sure what value there is in enabling that driver
> though,
> mostly just seems like a debugging tool & from our pov we would see
> the
> HSS running in the monitor core as being responsible for handling the
> l2-cache errors.
> 
> @Daire, maybe you have an opinion here?
Likewise. The new ordering of the interrupts to what the driver expects
looks correct - as far as it goes. However, I'm not convinced enabling
the SiFive l2 cache driver out of the box makes sense. Using l2 cache
driver doesn't align terribly well with the current MPFS roadmap for
mgt of ECC errors.
> 
> Patch LGTM, so I'll likely apply it in the next day or two, would
> just
> like to see what Daire has to say first.
If l2-cache controller is enabled, then interrupts should be connected
as per TRM.  I think this specific patch lgtm, ideally with a
'disabled' stanza and it's up to individual MPFS customers/boards to
enable l2 cache controller if they want it.
> 
> > Fixes: e35b07a7df9b ("riscv: dts: microchip: mpfs: Group tuples in
> > interrupt properties")
> 
> BTW, it isn't really fixing this patch right? This is a dependency
> for
> backports to 5.15.
> 
> Thanks for your patch,
> Conor.
> 
> > Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE
> > board")
> > Cc: Conor Dooley <conor.dooley@microchip.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Heinrich Schuchardt <
> > heinrich.schuchardt@canonical.com>
> > ---
> >  arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > index 496d3b7642bd..ec1de6344be9 100644
> > --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> > @@ -169,7 +169,7 @@ cctrllr: cache-controller@2010000 {
> >                         cache-size = <2097152>;
> >                         cache-unified;
> >                         interrupt-parent = <&plic>;
> > -                       interrupts = <1>, <2>, <3>;
> > +                       interrupts = <1>, <3>, <4>, <2>;
> >                 };
> > 
> >                 clint: clint@2000000 {
> > --
> > 2.36.1
> > 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
