Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE83C00140
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Jul 2022 18:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxlOip/+efVTKzXzpYWahyOxwYzAWXi6dm+mTUpl9uc=; b=AJDdg89+1w/h8l
	H8rIuimFs9+O9uID/0kD4ktvnplgtN+47KenRVicudvZQh+SHuFEtPfezU351NDMV/6P888DEmBV4
	hTJ24dC44MDuv4U/nxcWcaEjeDcoHvdh+BpHO0OON/hJDEQe/GfSTMLB3a/x//faxYEuWnsEq0yel
	WGNRybZj62MifjHbXbjxUstOgA5Jtgik0ao0/BXWSoROw5kfSHDzZXTjp3VElsHpq+u4nyxUDkLUn
	c4dBmRO7ifkZrJJqN8R/4oyzIZROMynCkRcU7bQlCcPCATDAOdxmD+1V4zeWTdhPaixSrrVSuXrlr
	iEqMYTY/SAQNAkVGV+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPcW-002IDP-I8; Tue, 26 Jul 2022 18:49:28 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGPcT-002I8Z-QP
	for linux-riscv@lists.infradead.org; Tue, 26 Jul 2022 18:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658861365; x=1690397365;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SgNxpSqYn6bVbz0j1g3oBNcEchIVa0ctw5xnmXyIQjk=;
  b=qEQeVN/tGr4TbL7NNWMdFocG2W6MdX5yfaXW4g0lNnsqN4H4MnLJfSQu
   IsqTccdo3IVrSgENPfBkgFzgrnWQaQfFeRaq1rZc7lGycCiqe1kmmKrMh
   qqqPHCVqf7V+zBs0DpEUMUPQHkQNg8ylEHnhfk0rrKI/OB8uW3bvJ1XJT
   piYu528ves8vpJcIiWDEkBwV7f6ruoB+1SnbqihEBF3LZrDFoHfG+xre6
   eG6kBM2+tXo4hry8qnIc0310TdolHWM3cJTqLKH3Kdns7lRYdeKSkkTR3
   1fRs0XIf4aB6yMg6axc29nY0lyRtOnrjGjkBIxH2qhPanQOZdPkZRFzVg
   w==;
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="183845416"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2022 11:49:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 26 Jul 2022 11:49:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 26 Jul 2022 11:49:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+JqcXZytM9SGUsab23qPlwJYJeeQt+zgvgLR+5bDt+NsSolZxo28rJqBXOWZaX96n7cl/I5/spX2CJvCJD0s2d7q5rbCj/PPMpDYPf7K/xc18Arb1Qk2QYYoUsVuZiVOIakLdnCggyQAHUUc9eqf2/oEj7q5gG2IRB46DSW/NyF9bqYbRpQE5P54h/5fJXLOXU44+6GLv/Oqvrdbz8tNQ1TOQJuyEB3PNEBXXrBMS0tNQw9jgcuVcqmIUbYozqO+UfRGA/cO5uOd5gzk/PQGbVMBC3JpM8wOPZUenhoc2p9qzgOb1pSZSmnVi8mMbnUg3FAXsEHucywokGXLcuv4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgNxpSqYn6bVbz0j1g3oBNcEchIVa0ctw5xnmXyIQjk=;
 b=C1YsWtyQ6Xp4zTw1N5JVZcU+OByaPbid6ygR4VAgCJ3h229v+p8SU3k5fmegCfQ0D/QK8BJXQ4+MwxsqengG3b0WRw+6bmLQR6HoKuilF9VaY6FSI+El5e1+dPfsiBuLFdQw5P0BYQhS7ll6RWSsxon+Ahyz87BHEGz/VdsJubabqADQKaQWmFzwiLGg3oLxyQyDlbDAN5GMLQInN9hpNOM6Um3WL6lfIgsbqDNe/j0Kg/OAwOUeWKQ+38fNXjllh3rj9iMeGU2I0FSMZQmbqXg/4RvZDMOsHc+hg0zx0wudNhCh5DAsZzwcZJbT/Iq4EDpgBdQjEn3wWzdjWlX5UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgNxpSqYn6bVbz0j1g3oBNcEchIVa0ctw5xnmXyIQjk=;
 b=QsvpE7qMfGYs7D8ICEkIwYqj610esnmKqMffArLrhCQLRGf6Bi7DGdmAEeM46Zi+mk1ID+EQ8zlKVdgQmUWLS4EXItwwvpxUFaohgor2dQXAWlOs2JIM2NbbRNQcIZMPTY7Kf73EP98Wumyp4w5Cw6o7fgsnwR0KfHhYIfjAczY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2533.namprd11.prod.outlook.com (2603:10b6:a02:c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.22; Tue, 26 Jul
 2022 18:49:11 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%7]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 18:49:10 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.mahadev-lad.rj@bp.renesas.com>, <geert+renesas@glider.be>,
	<magnus.damm@gmail.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <anup@brainfault.org>, <linux-renesas-soc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <prabhakar.csengg@gmail.com>,
	<biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 5/6] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC kconfig
 option
Thread-Topic: [PATCH 5/6] RISC-V: Kconfig.socs: Add Renesas RZ/Five SoC
 kconfig option
Thread-Index: AQHYoRqLRmDL1ub3Rky98Bwpdbu+sa2Q/pMA
Date: Tue, 26 Jul 2022 18:49:10 +0000
Message-ID: <08083c49-68a3-6b0d-4a12-d9c9f7994281@microchip.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220726180623.1668-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0de5452b-4b21-4e2e-612d-08da6f378727
x-ms-traffictypediagnostic: BYAPR11MB2533:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0lWJeZoN0vg8z68n8ICJMuY0hUWH3qddYdn+TLD4bILNkUzbbEoMb3zeyVaSCM0WcEJDPKYLLvXCrREz9vuTQS//pwOv9D2w/ZQoPPhrT0E8dLYJ5yGy8k/nNL+9EbUs4e0WmLIKs/B7r2qPWAi6BETIyyczZYSWXfq0z6ZfCzzs7Mi9ONXJ2GU/y6QDJob021MgWzPIHvx0Y3mp19zDj4oIwgWxlZhQyliceE3KcFFI2MXWYX6BZH5pZUkeHeumtkNq/K9foGi1X2kssR/K7jZF27/q43rcqsmYDBf8KRjSafThAt1r9xiiXZ3Ns5UC1HI0p80F1VOCa/aTIZtDjMcL2fqHTODfh51iXji9GuK+bRx4fR41CPy9fSTUI75mSTTquJhZuXKdqFfgCPzM+oMDwHbtbrx3eSjWQtoKHqMFVgPTWAcXa8uiCRee/+vieKI8CvXvNp4WUb9FXDnchLzkhQnoYfeuw4UbGMOpAX+fO87CkZ+HgzriPZYo3lQXGWh98LGuZxXW9wd23PVY6R8uG1yjqy4sm1zevrUocPR2huztwW2eK072u5it7c+0yxZfq5yD4FJnTjSouFg2lqr3xK+VZ1gwAmkbIAMyJVOuIHSEJDzB1yQMwmFJglAsw6yEYVUb6lOY5W9jzEMRSUnwdPR+x92SuCTvjUvmWCQaF6dbGFddW8dKdMHTDkIkPunhjNK9g8zkOFDe4C7dKlkb65SQ5LcS6Xiz/igjJ0HAh7O+vu2e5z2PoK4KZ455ZHqQVsPYU+Wdtfl4kfSsPXb2lIxMAyQnnevzr38O1M6swNCcUTVjWxOrO6vEb/bsk5DREhjlLd/juBVbE11BCcS7RhlVUjNISbhZf0HSGrVuqD7ev2OmG3KnYjClKkt2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(376002)(136003)(39860400002)(396003)(346002)(31696002)(41300700001)(2906002)(53546011)(26005)(6486002)(86362001)(6506007)(71200400001)(8936002)(7416002)(91956017)(2616005)(6512007)(5660300002)(478600001)(186003)(38100700002)(122000001)(4326008)(38070700005)(31686004)(36756003)(54906003)(66946007)(110136005)(76116006)(66476007)(8676002)(66446008)(316002)(64756008)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S2xxbHY1KzY1dklDMUFKVTdzVEFkaWNScjRvMjBmY0pOdDJ0RDE2MS9odGh6?=
 =?utf-8?B?d1dzTWxuRHh5UDRWaGgrUnVRbllmWW05dEJOcXBnOU9uckFBeTRYdkQzZmg1?=
 =?utf-8?B?QnBFVFNMZ3VHdzUzKzQ1UDBpQVo0cElIZTh3QzFxd1pOSDFCZ2dLcjhkQnZW?=
 =?utf-8?B?dlloeUwzRnBJckNyRVEyM2lQclhvdnpTbUc4bm53T3VZVHVYUzdnT1AyazFw?=
 =?utf-8?B?eTM1QnNDK3dtUm5GVWpHOVJVTU5yUFcyMERVQUR6U3RwSVgzYVlibWtXdk1u?=
 =?utf-8?B?cHdpY0U3OU9lN3lQbnFuaTFxdDF4dytVTzkxN1BqRnE4UUZ3TU1iT3c4TzZx?=
 =?utf-8?B?NTl2SDZYdG0wSW9TbUwraHZHbGp6cmJXZlNJRUljSEhnVnlHUk1hNDRmYnlU?=
 =?utf-8?B?a1hMTSt6cnJDdE5nZm5xbnowTTR4d1E0Qnd4RGJtWHdFb05zbjlEU3hwWVVX?=
 =?utf-8?B?MVk0WFBvdis1NEU3bmVINUVRK2lKQXN3WGRLU3ljcno5VzlUYlJ0WVRuTTVa?=
 =?utf-8?B?OWRXZjRkTlplNHR4RTNnaWpwd0pKQ0diSXZKM3h3MytsSTRSOER4b25xV2o0?=
 =?utf-8?B?aEtwTFc1T3dsTnV6VXdpYnFGenQxU2FjN1MrVWxzaU5ZSGtmU2ZGTE8vdkFB?=
 =?utf-8?B?a1BsVlhtUUQ0MlYxeUdjeG43bUhnamloSkc2emN6K2pYUDlNZlNaeTFmUDRv?=
 =?utf-8?B?VDdidTV3U1hmUVd1VG5ZL29sdXI4V1FiMDdqOURNQ2xVSXd1dHhqaG1rbGFQ?=
 =?utf-8?B?UUNGcEhwUUR3Umx6ejNJZHV0eGhMb3ZnM3drWFpCZHA4ODJDSTdSNkc4REtZ?=
 =?utf-8?B?enQxYWxLaDNWZVg5d3B1MS9IRXYrNlZ4aGdNWWE0aFpxeEhDNlZ3eGg0RHk3?=
 =?utf-8?B?emdUQ2h6TGpHd3BhRjFjVnlzTUp5SG1lREVPMllRanFGMFp2Q0lHOGdyVjEy?=
 =?utf-8?B?NC9ETmxyKzZrUUlNaDQvVTBrVTZpdFNWdnJISXNDZ1JKa3RPOFlNT21tRVJO?=
 =?utf-8?B?S3NYblprbnJDMW1xMU9TS3Q0dmpXbURYbzRZNG0wTyszb2dBS3hEZTFxbVFX?=
 =?utf-8?B?N1pwbElldWVleFlNRHV1cWlHRDBqMGZiWmFHRnpucE1udkZob3lieVl4cHps?=
 =?utf-8?B?OGtNbU9sOEZSZHJkTDhEMmdzdjVGMkJJblQyb0NIWmM4WUpnMEE5blVJL01i?=
 =?utf-8?B?YWFvOUhBWjUrNi91NjRTN2tNWEJacnR1cUlVK1hLZjllcHFkcG1mbk9tbmF3?=
 =?utf-8?B?UVFXOUZPVXYremRnM3F5M2VaeUpJWmlHNmtnRk0ySHFpdXhOcU84b0FiNmMr?=
 =?utf-8?B?RFZWbVpjSS9lbEU2ZHU4WHkxaXdpMDVqZkpPRjhVdDJaeWhlUFM2VWNEZWUr?=
 =?utf-8?B?UGRhdzk5c3RVdGt5RFBIL1ljSmd5RHZkNmxTL042Z01CU2xYSTZUbGJyd2hI?=
 =?utf-8?B?c2t5RncyZUVqaW5nekovOEFPQllhRy93TVFBM2E1WXBmcUtHUU4zbXUzNVdm?=
 =?utf-8?B?NllVbXA0ZDM1azQwV3BFSWwvVUhLWFNNK0d2Qmh0UFBtcjJ5OWRBdi84NjJG?=
 =?utf-8?B?T1h4OGpZeXlETFdNTldpZEl4Zm5JMUV5VEFTWjRlVHErOGVCeEUzbDlVdEdP?=
 =?utf-8?B?T2Q4bnEvbjNpTHhJaVp0cm1yakZ6Q1ovZ2Y3SHZnazc0YTFyakx2RGl3aXg4?=
 =?utf-8?B?d2tVT2hYWHhPOWxPMWZ0ZVVHNzRqSXhvS2tmY2ptWHc0ODhjUUtwbWdvSVZI?=
 =?utf-8?B?VFNmWS83Vkh3YmpGU2VHRDF0b2FuekNmUzBCK1JnS2xORm5maWdaQ1BldG5o?=
 =?utf-8?B?L1ZMU3JLbVJkckgwTS90dkptK3JjbkZzMUJWblNkWFZmNUZhTHpEQ1ZYTmxz?=
 =?utf-8?B?K3lRSmcybWlLb1BHblM2QjV1bW0xQm5iMURxM0NhK2MyV0NKZzFjOVdrZ2VN?=
 =?utf-8?B?YndpYXZHU0s5cjl6SlRudWcxR3dWT1ZPR2NCclI5QWVuKzdpTUhRRUQ4S29O?=
 =?utf-8?B?TllyRHN0Q0haamthYjNZTXZhWFhvZkJhTXhtQW8ySHYwb0ZaMGFGR2FvOWtG?=
 =?utf-8?B?MU05MllXVSs5MVgraktHY1BwL0tXUjBncWYzQk5wZGkvUWZScmJqK3pyWEdK?=
 =?utf-8?B?VWpwOWk0dEdteUxLSHowSDV1Vno1Ui8rY1Z0WDBKakN1UzlXTHVSalFoeEx0?=
 =?utf-8?B?OUE9PQ==?=
Content-ID: <26EF4EAE7B302947ADF240916F626AB2@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de5452b-4b21-4e2e-612d-08da6f378727
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2022 18:49:10.7579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b0WDdZ7sYKbIvQk6h/TCTrVyskBSQ0UoaQUR0yzOILYbTRl8VpRShBJHfjxyK0h7cyXd/f7iqfZYA+KB+F7FqL1Fp0nzIiYhcW/E8yPwYKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_114925_890976_241CE8E4 
X-CRM114-Status: GOOD (  17.32  )
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

On 26/07/2022 19:06, Lad Prabhakar wrote:
> Introduce SOC_RENESAS_RZFIVE config option to enable Renesas RZ/Five
> (R9A07G043) SoC, along side also add ARCH_RENESAS config option as most
> of the Renesas drivers depend on this config option.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig.socs | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 69774bb362d6..91b7f38b77a8 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -80,4 +80,18 @@ config SOC_CANAAN_K210_DTB_SOURCE
>  
>  endif # SOC_CANAAN
>  
> +config ARCH_RENESAS

Hmm, I guess since it is very late in the day for v5.20 and there
appear to be some issues with the SOC_ symbol breaking the dts build
anyway, this is likely to be v5.21 content anyway...

...but I would be wary of adding ARCH_ symbols from ARM archs prior
to figuring out what we actually want symbols in Kconfig.socs to
actually  at LPC or w/e. Palmer?

> +	bool
> +	select GPIOLIB
> +	select PINCTRL
> +	select SOC_BUS
> +
> +config SOC_RENESAS_RZFIVE

I would like to see this added to the default defconfig so that
it has dtbs_check coverage by default.

Thanks,
Conor.

> +	bool "Renesas RZ/Five SoC"
> +	select ARCH_R9A07G043
> +	select ARCH_RENESAS
> +	select RESET_CONTROLLER
> +	help
> +	  This enables support for Renesas RZ/Five SoC.
> +
>  endmenu # "SoC selection"
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
