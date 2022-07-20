Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6D5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 09:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iwDzlCaC62utowy3i5ytshcUAywZxutL3WTSTjXF3Nc=; b=IUbCrTYFROC0lx
	CvkWXgj431giIcnGnSqtBgfPwIYC1C2YCBJvlt7Y3BKAXhIs8vDp2uPEZdbZ3BWeHsGkJDUVx4+W4
	/4X+IbZXq/BwTQHumhytwi06p1dV5fc7eQimk95xetSbLE4HxdV8Fm4BX2LImdEVtM8hY8cW/2NWZ
	luYrb4UuHp9eL53vX/jw1PtoahHdHpGrjmBZ10siaWqi6mKEqDyfMCQyKmx8uAZrkejDiSRM1mypA
	QbbtcUzZ4WZosMncSSFlIJ+O6HAZ2mJWOV72P62/YJfSxz0Y4av6g8spf52srwtW3xmkKbwZ6X8iG
	xSa4uOumPd6mSKgNERtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6MV-003XpW-Kp; Wed, 20 Jul 2022 09:51:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6MQ-003XnL-UN
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 09:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658310678; x=1689846678;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=aHAtg2aSp8ln8jOircpERn+ch/+KvihS3E2y/vOL9FQ=;
  b=K3hAakk4U51/FzfJknPGgkUBqzTH0rQr6cdN3FvHKB8MJNe7kNUfjeyp
   mplm1GSMLCDrdhr1YWriiAc0fZk0MEGqjkB5x/MKvzXfHes4BKFdbnYGs
   OVcb4q9YDk+436alVkSvZ9rWLG9fYg9KNyWCpO7iR9XuJea1wwk3tREfZ
   5xtxDZqx1fSdTb9ZU8mfFKoE5Ewg7s4ygX/qVu2Q/xMygi132j2QBO4RQ
   p47a2MqMCqkAhwzAWNBSFntD0YdII+gWWUGDVoVAAcePE4fIPxnQaemGX
   JB2X68p7N6ia9R6eOV99nt++5pFtjpJHUIMDLNAit2PPm7BWZ+0/T1V5Q
   w==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="182967961"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2022 02:51:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Jul 2022 02:51:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 20 Jul 2022 02:51:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZBXMTpYreLcM7kwGlukwIesPaVR5MgLGDWqPAK9ZICAiK/n1IMgEQ7yndVjYMHjqVJBhrVkJwnr27X3aljsV1u8zDvvyWvWcfgmvOw9pzhY8bFml/47cZ7AtwVV+xgpVKaoKMbLpqZwu0Hg9VBA8M4lUp7HqMwIl2kQ495atrD58of7LbOshVNqcjYl1pjUqmIvTg+8nGZPe3XiicVlAJksjwLr2nliWOA7sXt3asga5b2Hnrvo17TiTmo5/QpC1p96tqz54LUA0eQoMqYm1rplLHye3v/c9mbEIUYtRGFX2UeMXTKosTk8S05P7ETJ32yLz7MufsufapU2Uzv87g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHAtg2aSp8ln8jOircpERn+ch/+KvihS3E2y/vOL9FQ=;
 b=hnSHQTICtKrtNPGoN2JXfzg3Z2MXVKoivx1HvLRCDNBpn4Pl9/qElVIWZSOwg89+iMJoA98gfKhx0uNQIiPcQAcy59XXk+k4GW1rgAmQ7goWK51qWQNmYWgdcjTO3GxXm7z+mlmxMPyxnhwVykVQ4mq3X7QMR/GEkLkoGE5VjrncvIajtdGoIV4WqOXEhltvFwHaUbQVFR5V3oRfpFAaxq3wYcNO8Q2bcxKVGhzp4NW3SojgOkGhMZExOtCB1unk4slpcpT8dmZWN8nvVRxWah1EXN19Bc9sUye91ngpiFeDfFoU/JhO4ca2yXfJ76I6swS4yPaAnSy88vrJ34GmKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHAtg2aSp8ln8jOircpERn+ch/+KvihS3E2y/vOL9FQ=;
 b=iWfHS7QDYI7QezE0bfELRSsFOBycDa6KMfyLVS8G6gWGHvjRQogFX6kXfPa0nAa1IPFE7tUClxp8Lvq/QZQrjWwFCJdmrekStD9SpK2duc5lTETa4fAY96f7FsUxo/PYqXuL4xpdPxpcdzkBGzFIUzQ0ALoxiaETycRG9DQUu+Q=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by MN2PR11MB4495.namprd11.prod.outlook.com (2603:10b6:208:189::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 09:51:12 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 09:51:12 +0000
From: <Conor.Dooley@microchip.com>
To: <zouyipeng@huawei.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<guoren@kernel.org>, <penberg@kernel.org>
Subject: Re: [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in
 arch_uprobe_pre/post/abort_xol
Thread-Topic: [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in
 arch_uprobe_pre/post/abort_xol
Thread-Index: AQHYnByLin+S/oZHK0es7c+ME97uZa2HBFqA
Date: Wed, 20 Jul 2022 09:51:12 +0000
Message-ID: <7867387b-3ffe-f51d-b15f-5f0ac45c8e48@microchip.com>
References: <20220720093447.245585-1-zouyipeng@huawei.com>
In-Reply-To: <20220720093447.245585-1-zouyipeng@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40c8e8e0-0d09-4a3c-cd2c-08da6a356128
x-ms-traffictypediagnostic: MN2PR11MB4495:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a3I6K3Ixr1Aiah8QQ3Xah3g8fHrtRuC4VV7Oi9F9kCBRggUynSphyT0isMPn3h5YX5jzfGALBvCaNtFUhZCJ0gVsD4P14iWWmbCN51sl+01lcM2JCT/Zrxr+slko4mP1uV5AoVJlSDfgu5hF/CaGgtrLDJ7yIY1opP7/CfnS1OsmIOJtmppM1DVg/rBSSLET2LZkhX2q9GaNbMB0zYSDQpGCQxabnqdMdNDUa2RucEuvY3eVQY4ADRMXI2Wk0GDFUBSj3Ojoetytnoz8693qfCV6+D2DmSreHrxc9CAskdTyXaxfkxBM3dOenAAjzixsXF2Vmg+ys8mQfmBGACN1qGXkTLikjwzih1LJXGIFRyIkQ70QW/9rX0+Y3/F719ib22B38dSUulCb2yF5B4Bkc7cTx4YYtdvPR4w0rb+8GXsM6h5mgipZREAnB+GOtdN7X4A3OJYSV2MGM3mpHbZn2uFwkovHOTuah7jyajFcWh/R7R2gdgp3wJup4pBejbQGFdqjJzX2bUdKH975Wg0+ALcuSHKhl7NS6Akex/XHjm9KFJKQxDD6GYOq+pU4k35Povq5xTkhXXOcbTvTkkUyzY+DCNrdXKij2HTCZPuQdLU0IMtoOd+TpIPhkdqGKVlNlgKAVsBRK6lePMjlQyma/Zawfnb9jmQ0vgHXqEwnFptp94p4eLMrrFEaYbrchsfgoIRuLim03G00NsE/eKW8i2lNc32dFzcbJaUPS7gTvNTl5LALBwdJgSSJdYKwsTj0QMdj/M4r/og8iAdTG1rrs5mlMNvM8BWcGUZiUbvjtOE8LaNvZ1vaEGb88EAS5sUSCChf++mdv4qR+r/f/CFc+1aFCCfXsEjHU4XiO3LdLhjl0pfvp3q9KYUn6l1GSeYXJmg9Pqa+8JDOoNHK1UGVeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(396003)(376002)(366004)(136003)(38100700002)(41300700001)(53546011)(6506007)(122000001)(8936002)(38070700005)(966005)(5660300002)(6486002)(71200400001)(2616005)(478600001)(76116006)(91956017)(66446008)(66476007)(8676002)(64756008)(66946007)(66556008)(83380400001)(6512007)(110136005)(26005)(316002)(2906002)(186003)(31696002)(31686004)(36756003)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTBRcDZKbDk5UnNSYkpHajVIRVM1enFtalg0U1REZWJaU1ZLN3ZBeXdHSTI2?=
 =?utf-8?B?ZUxVUCtPVU13TU1aUmdLZHBqRzhoeXBUR0N4eGZaL2tOdVl4SEIwZWZVSTZa?=
 =?utf-8?B?THdZMllTbExITUZ5b0FlaTdHSVRqMXo2VUxIdUwxaDhsVHJXem0zZ2UvVytX?=
 =?utf-8?B?YWhONjdSVENKWTkyL0RNbUR1a1dMZ1RWelpveHJBamlIbk5FaUdGRzV4dVc5?=
 =?utf-8?B?WmRkcFQwRXJ4a1BOSy9vbWloSlR3OHFMT2owT0hCalBEbHQxc3BnTW9MSEw4?=
 =?utf-8?B?eWFBSnNmZ1F2TU51T1c1YnUrWXJoVUUvM0lkc2lvaXhBMTl0NDlzdXNxZDRM?=
 =?utf-8?B?Z0ZsWThNWTRhVVd1L3BiZVgvS1cwTnJnQXFlMm9sRCtXbGxVM3B1d0VsWWVN?=
 =?utf-8?B?YUVrak5mck5WdC95eHFOQzhZdlFsQ29qWVdvcjhQeGt0VnZRUHNnTzdBbk5Q?=
 =?utf-8?B?Qnp6SlQxSEw5RXRweStPbjJmMlcxNzBLM0paZFdFY2pIMDNsM0NMV0dTRWZN?=
 =?utf-8?B?WCt2MnpTYWR6aVJobXNrdndkNzMwM0p1UlN4Q21MaVpDdVZXQ1BRUHRFYXlI?=
 =?utf-8?B?UGNpRWhESi9BNEQ3TUk3Ykxoa2ZrRE95aTZnOFZOczhiRnBaRVFQeTdpdXBs?=
 =?utf-8?B?ZjJmZDhBVWJnSjc2bHhRYzRjOHlaU3RyVlNvOEc4Ukh1WkYzQlFqaFJRenVz?=
 =?utf-8?B?NEx2NWdpNk5RYzFGSW5EZXhBbURGaDZKVG4ralVlejVuRDVSNUd6MkpYK29z?=
 =?utf-8?B?azZ4MFNCYkk2cXppYXN1dUpOa3VodDdOTSs4MGg5bmxJamJmMTJXTTVvL3Bi?=
 =?utf-8?B?SUJXYzBpWnVodmFsS2dKQzAzazRDTTZsVjd1UFY0TjdpVncrd1RmRjJuYzR2?=
 =?utf-8?B?RVg0YXY0aFBrSmpvMUV5bjQ5ZmN2ZFFCOXZuMkJCb1RER0oyM2QxdlZ6d3N0?=
 =?utf-8?B?ZzYrZkpEZm44bmRXWUNsS0Zxd2tkVzNlR29QUjY5OTdMcUhOL0d2RnV5anJw?=
 =?utf-8?B?TDJmLzBRYjV0VUxnK1RodzF5eHczUjEwYTBTbXI3S3lqT1lGUWQ1VXBscklD?=
 =?utf-8?B?aHVXN3RxaWNPNzYvajFNNFFxQ1hBazBDZ29VZVV1cU5tTXFkbCtoZFp3Rngr?=
 =?utf-8?B?bE82N1dJTHZxUmp5a2NGbG1UTFFHTGE4M21IL2xTVy90VDNlL3lDRnRVbzYy?=
 =?utf-8?B?RDJsVmZ5a0RqZVBIczhzcGQxOXNBa0kzUmYyczQzeE5pdktremFrMmJ2cXFL?=
 =?utf-8?B?cGlhSURWTWFlMVUwempHbVhKN3JGVFhNR3dleS91b05hOEgwQWg0bHpWM3M4?=
 =?utf-8?B?RGZENSs2aDZDYzFMZmVkamc3RUZBUkZsOGtxeEFFYUI4WVpNeWtvU2h6bENH?=
 =?utf-8?B?OUpZTWpuVGtjT29pZWpuQU9Ka05lbGl1RllOTGt4TlkwTDF4dUlGWkl2aUlO?=
 =?utf-8?B?Nk1mUk11RHdvNmh5aTZNZ0Z1MG8yVHVnY2hOSmM1S2VnWmhuUlM5MVBGc29E?=
 =?utf-8?B?YzVseTZNRWQyS2R5RHdwZHNUem5NQWZWSEdVWUIyUGFTK0JiR08xeEVmdWlM?=
 =?utf-8?B?S2ZDeUp6UXdzbHAyR3BPZ3lOUy9SS3lVanZlMTNwYnFrbEloalFxUWQ4WExk?=
 =?utf-8?B?L3Q5TUNnYWlRTGc5UFhXakRIak5GclRQTjFSL0RXZzVvYSsxZW5qRk4xNzl3?=
 =?utf-8?B?c3pkd2hSemZoc0J0dWwvQmxoeGgrN25yaGJYbm9zSGFCZFdIaURlNEp0ZDhF?=
 =?utf-8?B?bTJZZWk1ZE1sL0c4TVdseitUamRRK1dhVEo4K2NVTzVOYUVLMWhxY3VNak80?=
 =?utf-8?B?Rjd1MHd3ZmM4NHNZZXVXU3hzd1RScXNKZC9obkc4UUE5Z1ZGTDJaOW1IcGlS?=
 =?utf-8?B?bTZjdEVXdlhzSWhXWGh6amFwd2lxYVdFKzh1N0phbnh2bTZCbXFMcEJGZW9T?=
 =?utf-8?B?M0FWbVlBL211UmZVNHhMWlNOV1lkdTNJNXlycjJDYzY5V01BelBocGVlRWNh?=
 =?utf-8?B?SUdHclQwQlBQZWRmQ3d1dTh4STc3ZythSjd1VkNkZUY1ZWVTNDc0STFoK2pl?=
 =?utf-8?B?M21CQkpKTHdjeVRmOGJWbW52Y3dTV3dTNVhMZysvY0tkN041YW0xRk1ZQWRs?=
 =?utf-8?Q?/lpqU4iR3x2l4Csmg15hGUOzH?=
Content-ID: <70485E8196A43E49B216A7C2EA5C14F3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c8e8e0-0d09-4a3c-cd2c-08da6a356128
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 09:51:12.2065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4UEBIqi9Yo/TaKYGc29H7HXYm8FUXIvi7PSL+qlyRoec2A7/mn9nEz9KixlXUEjMfq69mDmPr2xFATmgGuREY6GPhBqZwqZzHV6LKEywXHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4495
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_025119_265736_D159A2FD 
X-CRM114-Status: GOOD (  20.31  )
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

On 20/07/2022 10:34, Yipeng Zou wrote:
> [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in arch_uprobe_pre/post/abort_xol

Hey Yipeng,
Just a suggestion on the commit message, how about just:
"riscv: uprobe: fix SR_SPIE set/clear handling"

Thanks,
Conor.

> [You don't often get email from zouyipeng@huawei.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> In riscv the process of uprobe going to clear spie before exec
> the origin insn,and set spie after that.But When access the page
> which origin insn has been placed a page fault may happen and
> irq was disabled in arch_uprobe_pre_xol function,It cause a WARN
> as follows.
> There is no need to clear/set spie in arch_uprobe_pre/post/abort_xol.
> We can just remove it.
> 
> [   31.684157] BUG: sleeping function called from invalid context at kernel/locking/rwsem.c:1488
> [   31.684677] in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 76, name: work
> [   31.684929] preempt_count: 0, expected: 0
> [   31.685969] CPU: 2 PID: 76 Comm: work Tainted: G
> [   31.686542] Hardware name: riscv-virtio,qemu (DT)
> [   31.686797] Call Trace:
> [   31.687053] [<ffffffff80006442>] dump_backtrace+0x30/0x38
> [   31.687699] [<ffffffff80812118>] show_stack+0x40/0x4c
> [   31.688141] [<ffffffff8081817a>] dump_stack_lvl+0x44/0x5c
> [   31.688396] [<ffffffff808181aa>] dump_stack+0x18/0x20
> [   31.688653] [<ffffffff8003e454>] __might_resched+0x114/0x122
> [   31.688948] [<ffffffff8003e4b2>] __might_sleep+0x50/0x7a
> [   31.689435] [<ffffffff80822676>] down_read+0x30/0x130
> [   31.689728] [<ffffffff8000b650>] do_page_fault+0x166/x446
> [   31.689997] [<ffffffff80003c0c>] ret_from_exception+0x0/0xc
> 
> Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> ---
> v2: Add Fixes tag
> 
>   arch/riscv/kernel/probes/uprobes.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
> index 7a057b5f0adc..c976a21cd4bd 100644
> --- a/arch/riscv/kernel/probes/uprobes.c
> +++ b/arch/riscv/kernel/probes/uprobes.c
> @@ -59,8 +59,6 @@ int arch_uprobe_pre_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
> 
>          instruction_pointer_set(regs, utask->xol_vaddr);
> 
> -       regs->status &= ~SR_SPIE;
> -
>          return 0;
>   }
> 
> @@ -72,8 +70,6 @@ int arch_uprobe_post_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
> 
>          instruction_pointer_set(regs, utask->vaddr + auprobe->insn_size);
> 
> -       regs->status |= SR_SPIE;
> -
>          return 0;
>   }
> 
> @@ -111,8 +107,6 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
>           * address.
>           */
>          instruction_pointer_set(regs, utask->vaddr);
> -
> -       regs->status &= ~SR_SPIE;
>   }
> 
>   bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx,
> --
> 2.17.1
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
