Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC2E6C19F29
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Z+w1UVvjkTr34FTkKU3fpOP9z6z3izM1y2QmUBAfZ8=; b=wyuPkHLnUAiCS4
	EE9Vfb8Fr2dhVM1DgsrS9W/m5T4pH2jwA0nP0fowcz4qUTETzWAsjSnFbqEZa/4WXBSgXHt7t0xoX
	sYqUDoRquiORJDI/5dubocGEXjZwWjGC9mbl8Lu9R1tMzafJFI7utF7F2ja64it0g8c21VOUmYjLM
	S9eZ6Iya8W0CnRhX3dtHhdskB2fgp3xNAUdF3duTy1wxQDDA1aNrNx3ABuLS+qK/T4/NRsWP8g/Qm
	FWqfL7ok0pesWYQvz9WBdPilEa+l27DZODHlIvI34Kxv3ujRiH8vrJEKXWVr0tcaSkA/1CbENKsqM
	xRDkliql6VWqGsAupI5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcS8-00BBPI-ML; Wed, 27 Jul 2022 08:31:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGcS4-00BBMw-Eu
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658910692; x=1690446692;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=lmZxCsSW2vD+xxLQgVLHkL9QKlbYckLEJxzMbEcJsY8=;
  b=fEk16Do+0oSbgIplZrL9FHjAYn1qOSfAupI8HFZLJM+UCOETLuuBYuA0
   706qhh06FGztLgUaPs5vPelv/o6+B8EGoJl/Cw20tlv9O6SI9M333IQ+r
   Z+pKflhK7h6yFgjD0PlcHEbnOVFky4CMIYACHAYJur+XQPQ0Fk3AZgpDb
   oFi6Tsp9xu9yOt455uGzP2BgoD7fZ8TGwpd4rDEcvlSgJXXzClaN+UdiE
   TdPwG2VIs318jZfgW0sYyTHKtig+IA0YdcU+Oj42T9LQ2V6G9yFenXB9n
   m0SBeBSdp/nwhVZeP4FOetEWKvbCoIZv8FaUa1PxEDHul2/8VoEtJkAA6
   g==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="173961929"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 01:31:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 27 Jul 2022 01:31:17 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 01:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NINrAbBpWPr78sHa9qhgGPdqHsWW9p6tFQLXkRrGC2MrK1bQRMiPjmAePl4rg7ilLkbC+d8Zal5kzFynEsVvINHs220MgG/t3PgF9eclaKtbDuow57ax6MZOKNJ5QiSnvHfmpVwVwmqZqDuowyXHX95/XhbrgeZn1eBUQ4fq9GZ6WN1P/UiKuXlqw158eBGhEwkdWUOMwUPzie+beBJ02hGyE04xNnRGpzXkg0SsG1MRc66pncBLDUb4x6hZ1Eh9MDSdqqMX1gyKMs39doQQdkQ/LcfxaHAWICOSx1DMQUU+vxhCx+GCoZT4Ht9V1PVyNmzAShNee8IBdhr4TPjDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmZxCsSW2vD+xxLQgVLHkL9QKlbYckLEJxzMbEcJsY8=;
 b=CkUsdQfom4KPJnDPdprTTL5gqDZ/2hkGq9MoaM6rS53etutfViUNDjt14sSrLxB0b0FiNv6w8Iq+P5Pd3aUZHpmEMZIqcFN9+t/K+tK/56b5L6hVT4ogujwUF2675/0Hbwj0O7DfbfRTfhHSL4XBap1a0A61yuscaO6STqUqsD+OpwkCWw6FXaapQNtkgtch84SVwEMM7EqItlp0OQkCo7xQCE9LZLyOM85RcKzk/Fc+9gXHFg9F+AMLdG1/ueX0FDIahNkgPTyuAHZ/ltCpUnIrqhCCtmbD45Ctd/6RekN2PkMSkoPwk7Q991+U/GhFyxXPde6aQgW13m812smE5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmZxCsSW2vD+xxLQgVLHkL9QKlbYckLEJxzMbEcJsY8=;
 b=WiwyFhsTY77lc8cd3dJv3Y8NPTAPob6jHChdblE3rLJ6y0tn/Z2cIUh618z+aKSIDvQHiPNepIe8uhNIO/S3LQggTT1sUWypte/2Nl7D7kUIaIuT+tetCi62o7E1rAAfx+fG1anti5x6WBgjr4HRAE8mmILhHM+l37p/4XRFAEM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM6PR11MB2684.namprd11.prod.outlook.com (2603:10b6:5:c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.23; Wed, 27 Jul
 2022 08:31:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 08:31:11 +0000
From: <Conor.Dooley@microchip.com>
To: <apatel@ventanamicro.com>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>
CC: <arnd@arndb.de>, <anup@brainfault.org>, <linux-kernel@vger.kernel.org>,
	<heinrich.schuchardt@canonical.com>, <atishp@atishpatra.org>,
	<linux-riscv@lists.infradead.org>, <n.shubin@yadro.com>
Subject: Re: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
Thread-Topic: [PATCH v2] RISC-V: Add mvendorid, marchid, and mimpid to
 /proc/cpuinfo output
Thread-Index: AQHYoXL9tntjQdHtAUeuEXJmeRpsEK2R460A
Date: Wed, 27 Jul 2022 08:31:11 +0000
Message-ID: <46752e20-b7c3-f22c-791b-1865bc109adb@microchip.com>
References: <20220727043829.151794-1-apatel@ventanamicro.com>
In-Reply-To: <20220727043829.151794-1-apatel@ventanamicro.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 523c2ace-86df-4bf9-70b7-08da6faa5c71
x-ms-traffictypediagnostic: DM6PR11MB2684:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IVya+mwAX4stpNEyJyb1PQILD3RWvvhzEFB0n4q4LOEOQjL8A0d7T1xKq3TIkvFBg8/a2zC/UeC/I1MDONm1RzSwhk6t2oj2GyrlP3ODndhGiyGUxHFtGGdmCgnlTkXhWjTHMvTvOHuw5p0qjti/g5B3dZqprO2dQxjx2fqJAS0SY/FlFe2XfIH3RIoY2mdOgzrL4vwHC6cUBojMrFBD1X1a4dOk6qbEVSNhiIBqc0uWxoNVCDrFR5sxxMTIrNlb1jPlflK2YmTriXkJi+Sk+5nEV2CDt4TgptRwohzQJ6TEx1vJOlpVEekqMeEIkXH4JUFT/bo8vIU6eYhPPjKVlWfA4QVfJ7mDxcgD/wVgNZmGH6BKx7fXev66kHCOneMvQ+zIqKQzHIII9UYrEh+ZI3xI3zDylkA1+WqIYYoRGPmLbuWzhZFGa1hg2XeAHxRk4VJmOLB9u7KmOsNmPFLgbiF4MTpUs1skLJUmV73SY5FmAUGUH5hD/w2WIaKMwlFQL3BURnfxsL2zKhH8QDQjmoSpl6JoGhL7JESIwl2f3WJY+wn20MQPeJbyAR069RtmzXYG3Mtl4+mkJ+5RwVa3yoHO2OypPbCfXpDl+5vNJqeOTYfI8bWGDAmtXaTIEdE1ZdDvu5YEopuawDan55qBQjIHq1m17/r+lalcraNHWn9tHYqn2LfynJu8YOQzmMBFxiyps8+oCPAlJaUFNIIOcAt4iYWR6lqL586bLWW51OjdS8RdAQaiZTUIHgTudDJb+trvV6acntQXRnShye9zOYLbPCRnn0ER0KGsuctVpoDfBZsQ+1Cp/1el/YWsIO/H3/RlsE9NB7waOIF0RBnp3Mdrlb//oPtqM3lSFgP4sXG5qWMgihdfyr6ODXR+38gZxrq23JGu3Niz2wi/mMV/gw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(396003)(366004)(346002)(376002)(39860400002)(53546011)(122000001)(38070700005)(38100700002)(83380400001)(86362001)(186003)(966005)(2616005)(6506007)(41300700001)(6486002)(71200400001)(26005)(6512007)(478600001)(110136005)(54906003)(66476007)(66946007)(36756003)(5660300002)(91956017)(66446008)(64756008)(8676002)(8936002)(66556008)(76116006)(4326008)(31686004)(2906002)(316002)(31696002)(7416002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXpvT093TXEyREtTNVU4WFFVaVRSWmw3R1krNXpKQXo0Uk5KSnBvcDlkZHp1?=
 =?utf-8?B?d2lhWkxRNlliSENvUHV6MWl2Vno1ZUdpcGtvUGo4ejJaSVpjRlRBbUhOaWtD?=
 =?utf-8?B?K1Y1eUFxakt5bDdwVEh4WVJIOVJoS2taZHlJSEF1RHkrQmNQMVBUREhBZlJm?=
 =?utf-8?B?cXcyQkxWMWVOdUMwWUlPbTVSaWNLR3NSNTNETllzOC9CWVZvNTRWYVJIeVFM?=
 =?utf-8?B?QUF4WWxPeVZiTnIxaXVxaGYxN1EzcGVkb05Dd3lNVFlzcjEwOVo2OW1lY0Iy?=
 =?utf-8?B?R0NOc09ldnRHOUExcU5uZGZ5clFLMldKUUhzQldwZHpsczl4VVFtdWloOERp?=
 =?utf-8?B?bjRkeTJNdGQ2U29jSStacGpsNDlwVmVCamhheU9RSTE4dEgyQ0hONmx6d0Jx?=
 =?utf-8?B?dWlkbzRXOFZISm1CdE13Z3ZwY0FabGxkMXI1d3d3T3dtZWZHZVpOV1RrMjNl?=
 =?utf-8?B?dlcwc2p0bythQlR5cCtzUmV5eUdaWkluVDhrdnhkRGJ5dHI1MkVTSytHaWRB?=
 =?utf-8?B?VDhoRmY1K2hxSWVDRTIrdVJaUjVlUmVLdk1oVy9IUlQyMTJKcEpRUmxwV0lM?=
 =?utf-8?B?UUlSUlZGM3ZnV0JEeGJQZER6TE9NZ3FQSEJzN3UzRC9XaUhXdzhOUGV5Y0xS?=
 =?utf-8?B?QnZLblM2eUZadWtEaWdJVkd1WUhDT1g1VEx0clVORUVJNGJseTUrRDBRK2ox?=
 =?utf-8?B?cHBxVzhjT0xMcG1GcWdUa1pwSFZaVzdyMHozNHRBQWFId3RaL1pkYjZOZmlx?=
 =?utf-8?B?bjFjdkd4QWc2SW81OFA0WWhPWGNGU0M1ZEJzMkRQbGpxSXFEOGM3c2lEQW5z?=
 =?utf-8?B?N2toVHk2elZUUVE0SUU1MVNNSmpTODRib0FXUitlWktNeWZMd0hXSy9XZlZF?=
 =?utf-8?B?K1ViU2NST1dQOFAzaEhaQU8yWXNrSWx6QnFKY1I1SmhVbFpZUGg5eWtqbytz?=
 =?utf-8?B?SXA3R1lpRXUzN1JHWERaOUJoWkJMZ1A3RXNZWm5RNXRkUDJ3MHZBSFlVTXRT?=
 =?utf-8?B?OUtTRW5vS01CRWZFM05yQWw4dWo1RGp5UEx2RlpsOVhrS2Y3bTYvNHZ2K0Rn?=
 =?utf-8?B?emVrc0UrY2pqSzM2T3NWRnpBK3VpV1cyNlFYc1FOTWdvdGIrRU11UDNKWTRO?=
 =?utf-8?B?OTdWVFRETVBUbFNDMFk5R2swN1NvQ3RzbGVvTjJrQ2V0TWdCNEQyTWRMVnpP?=
 =?utf-8?B?VnhjNFlJamVLelhDbDMvQTZBeXY5dVcvU3hkZEVlNlF0Ty8yZ3BNS2JCMGNz?=
 =?utf-8?B?Vm5CYllOS0g3UWYybXNqcUVMU2J1cDdYTllxbmVPTEJCb1h2RFpld0NEMmVC?=
 =?utf-8?B?Q1lPZFpTTDl6dm9Yb3FPUzZzNDZ2SmVNd1JIQkJkQXNLVmN6TWZMRkthbXpL?=
 =?utf-8?B?ZWtSTEZ2TS9PMDU3cWxwWFFmMG83a0hwdDJWN1hxMjVjak51TG5Ec3JRcXJ3?=
 =?utf-8?B?OW0xWHA5M295d3g1M0duZ3pnVzhzZDk1QTJtMTk2VmlYOEZKTWozZzY1MXEv?=
 =?utf-8?B?UWl0ZEF0aGl0Q1ExMHNob0Y0UFBwdlF4WmtubDkzSEc3bmNOOVRCbzJGcHln?=
 =?utf-8?B?VjAzN1RwZ2xHWmJLZjBBOVhyTStEUksyR1hLL1RDRlAzTkc4dTE2NDk4RnZq?=
 =?utf-8?B?cGJtZGpnbTZjcFFIZ3Y5MzhEM3BFQnR3QlhHQkxnUjNITGJPWVFqeGZxK1hK?=
 =?utf-8?B?Q1hldlI3VzQvQityS2hQaFJtek14RmlFUTVOS3Q1ejFWODhWeVhRZ2FnZEJD?=
 =?utf-8?B?U0RCd0FRdmZkQ1NhODN4ajlrYVM5ejkraVl4ZGlGVnB3UHlOT1k2NVNYWThI?=
 =?utf-8?B?Zml1a25qMUtKRzZYc2pscy9UU0YwdVArV1M4dE9MZGo0Z3djdVZ1Nmh5eWdZ?=
 =?utf-8?B?WnBOb2ROTUIwYklwNW1vWVBmb0RiTGc2VzE4U3hqdzhsNmJDdlhRVWcvSHdp?=
 =?utf-8?B?L1QwWGR4MGFpVjVKU2IvcEUyN0N5TnZDV3hxcXRwVFdlbWdUa1MyMk5SL0tV?=
 =?utf-8?B?ekhvV3lHM0tGeGwrTk9iS1JIMFlwaDZzVFp5bk1Ea1dCV3dhMVA3QVJ1SGdK?=
 =?utf-8?B?Rk9VS3pwRnVsUWlCYkw0S3VodnVteHhxa21weVlSOHM1ajEvV1ZCQ0tGV0Vx?=
 =?utf-8?Q?5AYWLVOi3DY8VlKj6mNfKR5/K?=
Content-ID: <0B7F4B8FE83C014CB96591096C0E230B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523c2ace-86df-4bf9-70b7-08da6faa5c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 08:31:11.1939
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tZ6B0itfZmnJJDuF+S22ZgK31I3g1mJVjWkmGfvRIcrLPcwUsLThrcCv74ISg+BGVEi/IPJlFoDPVQQlPQwxYNZwDkbz0OslrflBkp/UQy4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2684
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_013132_554622_5360F496 
X-CRM114-Status: GOOD (  25.87  )
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

On 27/07/2022 05:38, Anup Patel wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Identifying the underlying RISC-V implementation can be important
> for some of the user space applications. For example, the perf tool
> uses arch specific CPU implementation id (i.e. CPUID) to select a
> JSON file describing custom perf events on a CPU.
> 
> Currently, there is no way to identify RISC-V implementation so we
> add mvendorid, marchid, and mimpid to /proc/cpuinfo output.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Tested-by: Nikita Shubin <n.shubin@yadro.com>

Read back the boring zeros on polarfire, if only I could write a
patch for the core complex..

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> Changes since v1:
>   - Use IS_ENABLED() to check CONFIG defines
>   - Added RB and TB tags in commit description
> ---
>   arch/riscv/kernel/cpu.c | 51 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 51 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index fba9e9f46a8c..04bcc91c91ea 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -3,10 +3,13 @@
>    * Copyright (C) 2012 Regents of the University of California
>    */
> 
> +#include <linux/cpu.h>
>   #include <linux/init.h>
>   #include <linux/seq_file.h>
>   #include <linux/of.h>
> +#include <asm/csr.h>
>   #include <asm/hwcap.h>
> +#include <asm/sbi.h>
>   #include <asm/smp.h>
>   #include <asm/pgtable.h>
> 
> @@ -64,6 +67,50 @@ int riscv_of_parent_hartid(struct device_node *node)
>   }
> 
>   #ifdef CONFIG_PROC_FS
> +
> +struct riscv_cpuinfo {
> +       unsigned long mvendorid;
> +       unsigned long marchid;
> +       unsigned long mimpid;
> +};
> +static DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
> +
> +static int riscv_cpuinfo_starting(unsigned int cpu)
> +{
> +       struct riscv_cpuinfo *ci = this_cpu_ptr(&riscv_cpuinfo);
> +
> +#if IS_ENABLED(CONFIG_RISCV_SBI)
> +       ci->mvendorid = sbi_spec_is_0_1() ? 0 : sbi_get_mvendorid();
> +       ci->marchid = sbi_spec_is_0_1() ? 0 : sbi_get_marchid();
> +       ci->mimpid = sbi_spec_is_0_1() ? 0 : sbi_get_mimpid();
> +#elif IS_ENABLED(CONFIG_RISCV_M_MODE)
> +       ci->mvendorid = csr_read(CSR_MVENDORID);
> +       ci->marchid = csr_read(CSR_MARCHID);
> +       ci->mimpid = csr_read(CSR_MIMPID);
> +#else
> +       ci->mvendorid = 0;
> +       ci->marchid = 0;
> +       ci->mimpid = 0;
> +#endif
> +
> +       return 0;
> +}
> +
> +static int __init riscv_cpuinfo_init(void)
> +{
> +       int ret;
> +
> +       ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/cpuinfo:starting",
> +                               riscv_cpuinfo_starting, NULL);
> +       if (ret < 0) {
> +               pr_err("cpuinfo: failed to register hotplug callbacks.\n");
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +device_initcall(riscv_cpuinfo_init);
> +
>   #define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
>          {                                                       \
>                  .uprop = #UPROP,                                \
> @@ -178,6 +225,7 @@ static int c_show(struct seq_file *m, void *v)
>   {
>          unsigned long cpu_id = (unsigned long)v - 1;
>          struct device_node *node = of_get_cpu_node(cpu_id, NULL);
> +       struct riscv_cpuinfo *ci = per_cpu_ptr(&riscv_cpuinfo, cpu_id);
>          const char *compat, *isa;
> 
>          seq_printf(m, "processor\t: %lu\n", cpu_id);
> @@ -188,6 +236,9 @@ static int c_show(struct seq_file *m, void *v)
>          if (!of_property_read_string(node, "compatible", &compat)
>              && strcmp(compat, "riscv"))
>                  seq_printf(m, "uarch\t\t: %s\n", compat);
> +       seq_printf(m, "mvendorid\t: 0x%lx\n", ci->mvendorid);
> +       seq_printf(m, "marchid\t\t: 0x%lx\n", ci->marchid);
> +       seq_printf(m, "mimpid\t\t: 0x%lx\n", ci->mimpid);
>          seq_puts(m, "\n");
>          of_node_put(node);
> 
> --
> 2.34.1
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
