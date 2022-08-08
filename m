Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC66C25B0C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0prJYKl1tK9CNvtNYkIj1s7+BvCei+0aI6zWntLERA=; b=b24mNvAletc/sc
	zCKQwKNfrbB+dBe6a+LTpqnTaSzzfbW9qYpYaS4Jb32EEs6X550r/7StU7p++kVg1K4m26HXBDjRd
	Q2oCiXD2JoNhb/jTQnQD5bbY17VonOyd9j4Xq2JULI4Zbkeao2qous280e3dVU4DJlC0hiRwvMSfZ
	fJTdon/oEnC1WAvIX0pcMoWMg99RSK88g46R1hYpJ4RwY4HoJoc6bXSuKoW0etPLuIJxl7iF5rYmK
	4U+OoFmu5DzS8dTOkTGAp4uH3ldKDulHOKaqz5pdE3gqycDnS81Zi6uRaV1XrSJuk1fTg60AdywLL
	JN+GaFdgBHtbbEVlXZZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwCp-00BkpW-Rt; Mon, 08 Aug 2022 06:25:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwCm-00Bkks-6u
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 06:25:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659939936; x=1691475936;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=e3nFVW66q2mO6+eFPbez+R8Afc9hoSNwsDJbbMM8N0c=;
  b=0VpK9lXNCpkMV4kI3EZXqj9Ey/xOLRlUMcWUA7csNndzLSskKmORGGPL
   yErHY65S6bIGlq76KMEDozitL8k0ug2Wv5JbhAS7GZ/96hxSAS2FrzVRp
   dHsJGtfYI13p5tDQjKm62fjrXCyZotxJZ1aAyiuS74tRl4s13+pQezjC+
   JM20B+rF998cQjekf7d4kTSFF1nL+xdX3AxzJO/bUPwDDPGASMoPqa3KV
   h4Yf6hEW8x5vCpfwastRG8pgyP4t5/pErRiutSUyXbemhwkRfPVWt/KjA
   XV7vhaDvBGLxj8wOw1iGvAlgr4NCNAInVhEAPC/QzDXeG755v1PZkRcG+
   g==;
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="185509424"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Aug 2022 23:25:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sun, 7 Aug 2022 23:25:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Sun, 7 Aug 2022 23:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aaOdZPSGDuC8SzBpX8vngCDn2CJ0WKvNRR3dH3ITnShieFl5sj+QWCMed1phzqKV0ocrxUNG037os5I9PyQ12UJkE91XhSCfRJZjbbDwmRavw9NpANO/NqHRg9ods5htID9mHWqpV0UgGaZmJzx+4YRaxH1tRZv2zEo81n419deh4z6DY94dui1at0YzzlqttN1Ef4BFjX2xs0nt5Mzq0vL+6QIyslKQ+C9LuQtZZiObjVqeqCtVbbE3LbySJcxlv4u4KXQjHr2R+EVZ+KffsbJ1KXapdBQ0Q130SPDLioeOyAeQyo/s/8ydyiwqypv3Je1qrEk0QW2l2B8WsSde2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3nFVW66q2mO6+eFPbez+R8Afc9hoSNwsDJbbMM8N0c=;
 b=EOScS+/Dln5qM1q03oSya9D4r03WoV38PJmu1bPGyTXSwAWs2zh0lw30pY2K0XgxoixLxNUG3m2VInZTgqcuCnqIZbEH1yB+B9Jz01XvjchUOJnMxtvxV3eGQCF1frWWLosrp1sw9GXS0Vrn7E6h9t7KCVL6Dd2QvQSUNiDHDGb1Mgy4+C6qg1oPfyMeTD65wLK3y+RRSrkjyV3RN6abzX6ZcbXLkhFLrjaOE4+n8e39dU+QXjw60mLUn+XgiaNC8Qy9TPKzkVgzGJznGZA0Og3/D7ZmFllqy+vfPIf1jvruzF217DEotuwEx6FC2T5JZnGpmL+rShYh+yxpVaOzCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3nFVW66q2mO6+eFPbez+R8Afc9hoSNwsDJbbMM8N0c=;
 b=ZZpa2AZVQWtyWtniYzwEnqDu39FiOKX84oXwsZXb8aDsXXllyO8IeqMrKnFxJDUH2Xw5ZY7N2tHwcp82G8/Kl5BGx1Y7iVe9I59uqAsTkqTQ3zr2wdaWeC12SNaGxMn96UDLWGcqm8pRYb+X78Dx2DBoGJfB1PVh9XDPGjLilBo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SJ0PR11MB5102.namprd11.prod.outlook.com (2603:10b6:a03:2ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 06:25:25 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 06:25:25 +0000
From: <Conor.Dooley@microchip.com>
To: <alistair23@gmail.com>, <mail@conchuod.ie>
CC: <palmer@dabbelt.com>, <alistair.francis@wdc.com>,
	<bin.meng@windriver.com>, <robh@kernel.org>, <qemu-riscv@nongnu.org>,
	<qemu-devel@nongnu.org>, <linux-riscv@lists.infradead.org>,
	<palmer@sifive.com>
Subject: Re: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Topic: [PATCH 1/5] target/riscv: Ignore the S and U letters when
 formatting ISA strings
Thread-Index: AQHYqOO1TG25AQQCRk+oHxWTs2yK5a2kD2AAgAB+UoA=
Date: Mon, 8 Aug 2022 06:25:25 +0000
Message-ID: <dd5f0ddf-5fc6-00f8-d425-5b3161f6e977@microchip.com>
References: <20220805155405.1504081-1-mail@conchuod.ie>
 <20220805155405.1504081-2-mail@conchuod.ie>
 <CAKmqyKOORP+ciE0ZybCbtqFV5N4g6B8J2JwSrn0fen0zd9RfUg@mail.gmail.com>
In-Reply-To: <CAKmqyKOORP+ciE0ZybCbtqFV5N4g6B8J2JwSrn0fen0zd9RfUg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 724e952b-d51e-48ac-b1f0-08da7906c7b6
x-ms-traffictypediagnostic: SJ0PR11MB5102:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7RvR0ALYkVIYhgNg30U6KeN0sqkG/LlXwA8zahYCvuQxA4TCOFsLDj90Dgk1UJ5oljs6pnsQd+mneRERBPaHWBKvGO9giFNb6SnrTWnzcaBuw0qHKunYh+A5F4U/qHi8B0kTGBBR1TRR8e3ieUfc2ajjkbZ/hn4eVDwrtDE+AM48ELfS7FQSUWF3oha3ejTk+3w2Ikf/R7037YeWof4UrtWEYXyyoRS6u4zcVkAYa8YH3EHLtb6Ig+VNrBhsXM1leOsfz29myKzuX4MPSHikbZHqiEeuYIHdWAs8NwX3QkFUlmS3WpckfINpbZ/178uQDalawMsbi3XybgLIWcGz82SGJd20JzQfg37905s69unek8RYav8B46XQ97o/ymnzLrPdi4vG/XeGzOzwd08mowLISIrjpEkFAGJf9sGMHSt2WyuBxX8DH/SbYlLrxYoxysE2H43UBoFMzdI9+2HqSHerffVeXyMgXhnLtnXPalzNSgFm1kQYc+N9V4bC6+o47du5fI2aUWNavdAP7PHA3izm/Px7qsKbOTy+0w+puC8pTRfZyBHvG5CuML7gknBGjd80As9pXo2hf7gmybHS7DSp3G6vFKZScHG2XOeRLrQwOBvMQkFL/+x8MjkJErb3zaEJVPe/+T9OLgARetTGQdHu3s4Ciz9Y91Uf9wyvzixYRnTz3o3/4AemEoDWW7iBrrFUWRYj4gFGLljh9rDm9P80qQmmMa0UIBikUJ2KqnSGoOCzkMWihbwl9fJx8UzpBzbu1cmEkC3oShSjDqHjDoIz6YSZGdL7ggcpXPq7TfmauEm3gXXHV91Fb/kQwCe7oh4umvH0WVKUaHmk99HpqVDdNZtAibenImKYS5Hu6295han5BMGemhgDnMN0q2EO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(346002)(39860400002)(136003)(8936002)(5660300002)(7416002)(6486002)(6512007)(478600001)(86362001)(26005)(53546011)(6506007)(41300700001)(2906002)(31696002)(122000001)(38100700002)(2616005)(186003)(38070700005)(83380400001)(76116006)(8676002)(66556008)(66946007)(66476007)(66446008)(64756008)(4326008)(71200400001)(316002)(36756003)(31686004)(54906003)(110136005)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE1mRzZ2V2JLWmV3SXd4SGhVWFF2djBQRzFXWTVhbS90aGNEdk5FWDA5OXVU?=
 =?utf-8?B?QXJYc2hsMTY4a1JRaUY2dU01bUFyRW93RC91czZYVXZRRHJtN1FvTFBDNDJC?=
 =?utf-8?B?c3h4VmY4VjlTUWZPRVpvR0tYRGJ0eGUrVS9nYVJrTzdYcjlEaENSQ0ZHUUEz?=
 =?utf-8?B?dDZNRXY3QWNaeUJlaDJwb2dhWVd1SkU4SjVRU24rczlDYUtWd0U3akhROEo3?=
 =?utf-8?B?R0NrNzA5TVo2bHV3bGpaWVFMMit3ZGUvTHpZNW9KV2Z5UzlFT0xZcXhPWm9T?=
 =?utf-8?B?RW01bWxsY3FWRTFpYmx2QkJ0Q2crbWVHN09ha0lQU3JlOWI3MnArOWgvSmRm?=
 =?utf-8?B?TllqMEpnK0hrNW9SY0lqbW5naXVaN3dLRVN2WHU4SVBoVnFJRURjY1JLQS9L?=
 =?utf-8?B?NW1SODFIY1hQL0Z2SXU4ZVozdTVWRWpGbkNiS044dk9Ua3o0dzJpbmpMSU94?=
 =?utf-8?B?eGpXK1dobVV3Q2tSV3QzaXJMc3lzaWl1Zkg2TE5JODc4N1RWVkhWT0djazFC?=
 =?utf-8?B?Umw5N0NzWmJRTUVuRzQvdTVoVUNReW1TV3JaWnhPT3JGNWlFeFJXYW5jR2pU?=
 =?utf-8?B?aW82Nm43Y1RUMTFMMC9LYld4UCsvZ05SbWtQOUxmRlRVekJsTUk3Zk9Yc3Mr?=
 =?utf-8?B?NTNRMWhYNThBWi9RYXlDM3gxN3BSVGtheDcwUmJCVzN4aklSK0FYem9nWDQ1?=
 =?utf-8?B?elI5Y0M2SXBZamtGQUd6T09UMnI1WHQ4VXIyOGJZMWVGNzBtcnJkbDNyQ2VY?=
 =?utf-8?B?dDR3RHlkaTZ5TUxMUWNaYkN3QkNtckRKdnRrN3J5YlFSUzRLOGpBd2VGcG0y?=
 =?utf-8?B?THhDWkZlczNUUjdIN3BwQzZLMC9FVG85US8rZ2JscTNtQ0pyUmJLajdXSWZJ?=
 =?utf-8?B?TEdKdlJXZVp1WFBlQkl4OGNOTktaY3dMekM2WEpvSkUrN3dud25kRXZYRjR6?=
 =?utf-8?B?a2gxWnZ1NHBCMTZ6clZObmdQa2NzVG1CaFNaeWpmcHd0MnNjM3B5RCtzNnov?=
 =?utf-8?B?a1BEaVpxbE9JYlZNRk1XanJKUzRhVUhxdG4zMUx4TXd4WkNEdktUVEljWE5h?=
 =?utf-8?B?eWl0OFhab09KanpEbDVkMWJpVDVUTG9qenRGQStTWXc0VzdSQ2FRekhhOHEv?=
 =?utf-8?B?aHdpRkpOY1dpTlcvOHlIak13MmNqTGt0T0x3OEVMYWtKeXFrNkVKUUYydkRh?=
 =?utf-8?B?Tk1aT1ZMTHhuVTlKSklJNXlyOUpqWTZxT0N0ak94ZVdWQ2lUdmp4aHA2aW9S?=
 =?utf-8?B?dm9yengzcXVkaU13TExaOEorU1cxeG83anJOV3hHaGZMa3k2NGh3UlJPcFlj?=
 =?utf-8?B?V216ZWUrSkNDU2l6ZTFvd2RIYmNzNnRqKzA4WUNvRWRYT3ZPMnpWWkw5N095?=
 =?utf-8?B?QVVmWCtPSk1VeXAyS0FFS2t0dnRLektZTjdlRDBzZzZ5bUVjN21YVEx1aldT?=
 =?utf-8?B?WkRMcm9IYUVoekpVRDB6VFQ2ZnBOVVM0bURBcnZVWXFwbTdPVXRqUTUxbDNI?=
 =?utf-8?B?dVNrL1R3QTZFYmNBSUU3M1hKa0ZYYkZOOU9MT3U1d0hGTnRuQSt3V21WTnJY?=
 =?utf-8?B?ZWtieEQvOHRuZ2wvb1dGbGlMTVlHait6Ni84Nk9EMjRuZFp3UFNKUDNjQnlK?=
 =?utf-8?B?Mmd4Q21VM2VLT3pDVGxFM1RLck5TQm9BcHdiTlYyMFFWZVprWCtYc1l3MW1i?=
 =?utf-8?B?ODNHUHUyNC83N3lmWDRZMEhic3NyYVlrdVlabTh4Y2pFSExVd2ljeXRLVEth?=
 =?utf-8?B?cVQycEJEWVBMQi9TSzFaYThqYU14UWJGS3hGcEFuMGR5L2hqTVJ2R1dqSGw1?=
 =?utf-8?B?TFhPdVZua1RVS3h2L2tKUDlmUGY0SjkvYVBtWFhmd1lHL3ZDaGQzMHU0MkhR?=
 =?utf-8?B?bmV3UFhZeHRIMzBiOUtPczE3dWJvREJYVkRpTDRoM2haZi9OcmdjelJuMGJw?=
 =?utf-8?B?Qk5UdFFZN24rbEdxTUxoRUtBNkkxY3EzV2p3aUV2eWJsamZEUU5DdW1LTGpZ?=
 =?utf-8?B?SktzSXdOb2kxQVF6QUZWNmtSNDlGRDRYMVpmWXZoM01uYWNNSVV1M3UzSjgr?=
 =?utf-8?B?Ky9oUkE5MkgzdDdTeFN6NDJFN25UNlFVNkNRWENKTy9ZNmQxVFhSY1AzL1pO?=
 =?utf-8?Q?taIqX45wL+1Qmr5Cv1zWIVEwl?=
Content-ID: <1B10453797FFEB4FBE9EA134EAFD6B99@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724e952b-d51e-48ac-b1f0-08da7906c7b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2022 06:25:25.3280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jXvBkQ4VcmW5zIdqNnRlgazc0arb7MfQOsXofTGX4VlOgpCO0xSWkTqJkK9ELkMb0eX0og3TVdrgfQpBWcEMmehkao8G+KeCJwHMm1Yhe8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220807_232536_282261_8E227963 
X-CRM114-Status: GOOD (  20.96  )
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

On 07/08/2022 23:53, Alistair Francis wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Sat, Aug 6, 2022 at 2:08 AM Conor Dooley <mail@conchuod.ie> wrote:
>>
>> From: Palmer Dabbelt <palmer@sifive.com>
>>
>> The ISA strings we're providing from QEMU aren't actually legal RISC-V
>> ISA strings, as both S and U cannot exist as single-letter extensions
>> and must instead be multi-letter strings.  We're still using the ISA
>> strings inside QEMU to track the availiable extensions, so just strip
>> out the S and U extensions when formatting ISA strings.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> [Conor: rebased on 7.1.0-rc1 & slightly tweaked the commit message]
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   target/riscv/cpu.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
>> index ac6f82ebd0..95fdc03b3d 100644
>> --- a/target/riscv/cpu.c
>> +++ b/target/riscv/cpu.c
>> @@ -1122,7 +1122,23 @@ char *riscv_isa_string(RISCVCPU *cpu)
>>       char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>>       for (i = 0; i < sizeof(riscv_single_letter_exts) - 1; i++) {
>>           if (cpu->env.misa_ext & RV(riscv_single_letter_exts[i])) {
>> -            *p++ = qemu_tolower(riscv_single_letter_exts[i]);
> 
> riscv_single_letter_exts doesn't contain S or U, is this patch still required?

Seemingly, yes. This is what ends up in the dtb:
/home/rob/riscv-virt.dtb: cpu@0: riscv,isa:0: 'rv64imafdcsuh' is not one of ['rv64imac', 'rv64imafdc']
         From schema: /home/rob/proj/git/linux-dt/Documentation/devicetree/bindings/riscv/cpus.yaml

With Palmer's patch applied, the dtb's isa string becomes
rv64imafdch_zicsr_zifencei_zba_zbb_zbc_zbs
while in n /proc/cpuinfo it is rv64imafdch

The short_isa_string flag (I think that's it's name) is not
set for the dtb creation.  meant to note this under the ---
for this patch but obviously I forgot.

Thanks,
Conor.

> 
> Alistair
> 
>> +            char lower = qemu_tolower(riscv_single_letter_exts[i]);
>> +            switch (lower) {
>> +                case 's':
>> +                case 'u':
>> +                    /*
>> +                    * The 's' and 'u' letters shouldn't show up in ISA strings as
>> +                    * they're not extensions, but they should show up in MISA.
>> +                    * Since we use these letters interally as a pseudo ISA string
>> +                    * to set MISA it's easier to just strip them out when
>> +                    * formatting the ISA string.
>> +                    */
>> +                    break;
>> +
>> +                default:
>> +                    *p++ = lower;
>> +                    break;
>> +            }
>>           }
>>       }
>>       *p = '\0';
>> --
>> 2.37.1
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
