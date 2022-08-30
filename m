Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C71BECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 14:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxB8HeUO/oYX2nYhnDN1cG22mdaDsQnlWa2rlzm94Yk=; b=lON54zgVC0gNPt
	35Es2jD0dwp49uxb/1FmeRQkrQO8Slcuz0mYkkbKV80y7A+H3yPcANC26tOl89M3RtjaEbPEpPbyV
	RUNMwGJO56WX41Ajy3C/W1g0ZpvT3A8QLMkJsdsayf4qhJKRXy68Mwo/rBoqpkYXdUXTgFXv2BXfq
	4NhUO2Pd3ld+96qQ+gTFqIT32IeGVKnmhw/j0VOMyvOSmJbQtTaCQLyEGQzAtjelZchrTjp8nuWPz
	P0BJkSGdVrr36A90K0OqoIFQpNO8ku78E6f+e2cqfOLnFRhC2ujpgEM2Tl0vg9Ok1ovur3/fqKqqX
	jZrS1mLsyGsR8tbXXjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT22F-00HXXD-HO; Tue, 30 Aug 2022 14:16:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT22D-00HXWE-8p
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 14:16:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661868969; x=1693404969;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cAwxd/d3/xgZZrVSknWhmPKMxJT5YjAbg3HZcErs7aY=;
  b=e10rGd1Lxq1hVjo53NUBsTzjx64bJGicnf6VRMC3ETc+NPUTe8j5iFZQ
   tDFP4OzpizVGKTJXhGFXNyPjqYEtRjBigGsUN08JBFSh+9PuoYQmLuR5d
   QfI1IzyXdWDnQDpt4z86L87Boo2FFOzun2GBicDhojHThO5L+bruBBbCq
   8Wxmk7NPQ1Zj/gASGmUOlb8ScKIQlZsVUOB05wXHq6T67uPSgNNS81yr6
   SxUAiZ7QH/wxvkORCcHH3vmsXvN5R6aC67Ly1hPYnB2QbjUEm/KD0QYm2
   Tw4hhIqsfyx2jqLD53vawRTDYkNFE3YFe3Hxzdn9Xxwr8E5wfCQgR+cLb
   w==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="174820125"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 07:16:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 07:15:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Tue, 30 Aug 2022 07:15:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odzAZjn0AtE2g21sb2DAzaQuld+DRZBRd3WHZRjIiF2ATIi63wUtwVhe3uv2mvtoxZIJwITsJd25x5qRudLf3hLUexg/h/jBnRIpYXPrZY4AUG8JrZHkbDSGdAhjLTIMyphGl8FiMhqiRN1sERKPFD4SnICu12+VrDW11lcpBlK9Ri+nb5YQPvvf4JwMdust8Rsu1j8SKpiCe/Z1XNlGMKK1+Je8jmh9x4K1+nUqEAa++P96FXcpXGNrjEFeaWHFB4+3HyFwzBp/K87ZRmeXkVD9E4xgExkwxh6IeW613wg178yOA7sqqlnbICM6xpS7vcnysEvh8SpSWwFc/aAwyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cAwxd/d3/xgZZrVSknWhmPKMxJT5YjAbg3HZcErs7aY=;
 b=ZP0962R9zHjonx/RFXdQiV2SsFykd+awRfeTphZh3Nt+/U6ncGYuPTtveP/C1zS1bLM+gwnBkbjIlcucWUycUJbyvo85a87csDhTCgeqB5EQmCM9yqL4Gfz4neLnJpZsuo45eK/a6hKpbXWRadKwVfhto1QW6RZ7WLqpSvGZMZHFYS9XUSRHS8gfmR/8h5jBdyMMcXZbOZGJs2+9OFQlV0Vx4/HWAkX4PUH2HXTLwgs78xpzDCdl8GgOIicqofkIDLUJCjIWCBP2bZ6YISVDB0Zs204Yow8Y0Ag2gnpBQMfYSTCS8silK/1qpd3S4U2so5PHiykeOdOFQbEqKiNJ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cAwxd/d3/xgZZrVSknWhmPKMxJT5YjAbg3HZcErs7aY=;
 b=JEGTkNXFYEdwgy/fG2ui/P+DGHgD+PXnVwRS6eDBJn8rmdEf3IwPS185/+e02sSxJtJzC53cTrENPZ9HJLd+oVxV+EihvsOVhIMiLnvgx7m9TregOcbFJhtdNOeHy0Z3auqTizfuQCQu3HnUk39BAm9+EXDhm/piv8OYx/6A9gk=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 14:15:46 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 14:15:45 +0000
From: <Conor.Dooley@microchip.com>
To: <jszhang@kernel.org>, <Conor.Dooley@microchip.com>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<ajones@ventanamicro.com>
Subject: Re: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Topic: [PATCH v2] riscv: enable THP_SWAP for RV64
Thread-Index: AQHYufzf4JJbBuNch02tBI9sTRPCrK3DP5sAgAKut4CAADcFAIABWCIAgAAEioA=
Date: Tue, 30 Aug 2022 14:15:45 +0000
Message-ID: <d9331af0-58bc-ed3b-10f5-8509795e3198@microchip.com>
References: <20220827095815.698-1-jszhang@kernel.org>
 <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
 <YwzI7VmfFnOvYWgf@xhacker>
 <4037b310-47c4-ca30-d4b6-a284e87da437@microchip.com>
 <Yw4XwsVQBB1HRw04@xhacker>
In-Reply-To: <Yw4XwsVQBB1HRw04@xhacker>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4470b8d7-a144-4c8c-f841-08da8a922185
x-ms-traffictypediagnostic: PH0PR11MB5190:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q4bPcvJ3oQtVnZz61dtzVoyuXse6qebO3CWqULoeRFjYirBzpzjzUuHXIp3EpTHFYTdA00ce0wWpjuPhmPNqeNp4ruN2IQzzVhmTpBzINTuHk0TpTDL9rQaxpPzw9okiAxGl6hkkKKsmNQIcrZDpGTzRurCZE/TPaOi8/2sK9noFSUJTKKDC45BpgacCzPcC/dVQF3jLWzFJzsAlF+20uzpW8nxUsT73GYt8GqRLJZVd9EYD97op13KnXI/ny2ANpee0NNL2q0aTrlzDh9WTnhIGeJ3K/Y0pZIh8NHmwAKFuNmewDrhV75Xrud5tu7H0zpG646dUlwhWZ9Kd7nqZR8dm3G586d0/gE36SHzzW4mBgTZWT3Bw6879OJ1Kvtm17rma0QM8Jt732b3VpUCsWq/zxy4UcM65AN1VtCYDZk48GejH1IuIJ2xxVH8vYkv4A7qRfArSZZzB5Ml9Sr/b+wWEA2O0W5d4D94WPD0n6hXYqBo9FH7npnQEbeatEodt0YNaU4jNL/Yxs17hvkh00NjJMgZwA03qDslg7XVgK9K3dzY3dOdisUM0z5mBv9inob3LcgtxE6MzCsBQob1fYG/P3DW//77NGmv7zeIL/HHSp4hsWpoRKzfFtQ7993GTKb+woLIi2JOlSxFj3jAIv3s1AAUZlcLMV7caiCaIbhfwgee+rN3eWLkq/luZ6EOrBYQKEN70fMntXaEhVElsVHtsckiKqttbFBRZ+OoKsN+UPwTPyc3XjVjtxY/biCpXbTVsuNGXKjcAvuAhe3iafh5qlIDKAVgRjsCkxRWAgotiRbr6rsZFkJOzFpEixUdTdVcsICzDC8n5tJdfZK0HVQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(376002)(136003)(39860400002)(396003)(366004)(38100700002)(6512007)(26005)(86362001)(122000001)(478600001)(5660300002)(8936002)(41300700001)(31696002)(38070700005)(8676002)(4326008)(31686004)(71200400001)(2906002)(64756008)(66946007)(76116006)(66446008)(6486002)(6506007)(54906003)(66556008)(53546011)(66476007)(316002)(2616005)(91956017)(83380400001)(110136005)(186003)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmVwVzdsdWlZWUhIQ050ZFB6TFNrdWpuWGFmV2w5NDRIanBzb0pxVWVLamV5?=
 =?utf-8?B?RWRxN3Riamg1V1lROGo2V01jV25Fb3ZZVWY5N2FEem9IYTk0cUFrTkZRUVZD?=
 =?utf-8?B?SDRXMEUwMlY3dGFzR1Z2Y1VWVXRPK2h1T042VXhpUUx4SHVmSWRDdEJWcVdl?=
 =?utf-8?B?SEpuejVJWWVDcHVCMHJYd1RqTEtSUGZ3V3NYR0hteE0xdndSNWs4dmpDTHpW?=
 =?utf-8?B?cVRvRlo1UXBLNmZIbk9vTXMzRHoyN0xvcTdZV0xmY3JQSDJ4dWpOZ3FCbmZY?=
 =?utf-8?B?c1dVTmM0UmY1MGZ2Y2p4QjZ0amdpeHFSNlAxV25WT1ZnbkIwNktmZVVlakxS?=
 =?utf-8?B?VEFOTFllVGJNeGpCUlZvUzlzOUVwcDAwNk93bnc4d09mUE5JRGVKQ0NNRUY0?=
 =?utf-8?B?UW0zckV5WUVaaDhSS3ZPNG9FSmRteC9UWmtSaXJsc3lwbnFFMWtIeERyYWQv?=
 =?utf-8?B?UnV3TC93bGdQTTVPaEtQSTZGUGxvMEdWdE43dnlOcjhGbW53ZFZHUzZUL1hK?=
 =?utf-8?B?ZTNlS2R2YUhLTkVueUlxdFU2SHprWmpjamVNRURleXFXd3o1SXo5Q2tuZFJj?=
 =?utf-8?B?NlRtWUFEdXVyZ1c0a285bndQbUZUWmU0YVpFRHZRekJ1TXQwMmRQN3Z0V3pW?=
 =?utf-8?B?SkVyU3RGUE5uTEJsU3hYb2dWYWZKaHMvOGlLSlN2UWZhQWlqeG0rZWpKeFdI?=
 =?utf-8?B?TXFMWGJpZFFUeWpHeE5FNHRxOGpuNnAwamtvaCtmNE56dnpaVERDL3F5TG1a?=
 =?utf-8?B?Wm41Ly9keUZyN2VybGVOdDZiS0lrMEs5c2tUUnhiQ2J6ek5GNW5iU0JxdlR0?=
 =?utf-8?B?Z01uVzhHdytJMy92UVNRTnh0WnBsZmhtTlRwUmFCTXNreTJ4cHIzY0lhTzZI?=
 =?utf-8?B?Nm95Z1kwM0FMQTFyMFZVa3ROUHVIalhFdTg5RkJFdjJhK0tLKzRpSnZpdVBZ?=
 =?utf-8?B?Nm44M1hzYXFibnQ3ZkVoMThOVnJha2hDYmhMVFRUSGRjUTI2Mlg2YzBhU3pV?=
 =?utf-8?B?MlFMcUlQOVphK1p0dUVld25nU2Z0cmdhQll1QjFUQWlIODJIR1FLTzFmWkw0?=
 =?utf-8?B?ODVTdkFwZkN3ZHlwMU55em9PbDdsb256d3ZtMnIzVDZ1R3lPakUwUlM1bG80?=
 =?utf-8?B?SUthKy8vR1crZ0NIYk9PRWRGQzZCWWxacU1SbXd4eUU4NmIwWldGc1p3TmpC?=
 =?utf-8?B?Y0htUlluLzliQTVxWmRwZGFFVFh5M0R0OUp3TEVrNy9yV0llLzZZZ2N1ZTNV?=
 =?utf-8?B?QStzS3drbEVyY3lRbGpMZk9FWUlsWmdGQzVYVTRMZWF6NnVNaVA2amlHNFVs?=
 =?utf-8?B?T1U5S0VlWG80LzVmUFpobWFnc2kxMlNndHptbDF3TDlVdWlwdGNPL0JhNmc2?=
 =?utf-8?B?cStNZXpGSmRNSDdRQnFaZ2dvZ3VVTGxLZHMyTHpud0I1bU4yOGtsbE93aGlq?=
 =?utf-8?B?b1pYUHpVK0p2SWE5cGdFSDJncVVLZFVXb2FMaGxibkZ6MDd0RHdpcldiTDJh?=
 =?utf-8?B?dTJUT24yaG1sN2FxQmxRdm8wbUU2VXgrU3pEKzBwQVZnVDI5aGxYTmY0bmwy?=
 =?utf-8?B?NGlpYTc0T045bkhjYzBwYzJyNVlMd1BNcVE0OFdqUWR3ZTMyYkNEOG1rdURH?=
 =?utf-8?B?bDg1aXhYeHQ4MnRZZ0hCRXFUcnE2WmRpTkg1bFJ0aVlKcC94WHFxMFFVcjVa?=
 =?utf-8?B?Z2pLNDdSemQ3WlpueDl5dUJHUWNhNTF2ZkY1bkRqbVVQa3BLd3VJMjlJN2Z1?=
 =?utf-8?B?VlhTeWxYZGI4QnNncFQya21MOTNUYjJEa0tEbkFCSTVOYXNCVTk3UWpkMUZ2?=
 =?utf-8?B?QWdSY1UrSzlXSm16UzBBNHI0cjQ1RGJtRFZVUGxxTC80dWgxekUzbHRiNW5Q?=
 =?utf-8?B?NVdNMnBSdUhQWE1MSkk4U1pwSmZ5bTlaTXhOTVVOT0lJWkhqc0dvMDdxcEFt?=
 =?utf-8?B?eFJWMEZWaWpMZFhQS2lYQUF4RjRkTllFaWFuUmE1eDRLY3Y0bCsrRUJsSHRO?=
 =?utf-8?B?NDBuZ1dJZFJWVVpod00yUEcvUkg1K1l2QUo2MTAvaWNjaW9GWERtUnkzRnU0?=
 =?utf-8?B?b3RTdk5ndGNhZnVmZlVhbnkvVmw0Ny8wQ1NwbkZaTzNqTmJ0TnVnd0N2ZWNS?=
 =?utf-8?B?NVZ0bjlQRFBzTkh6c1BObWhSajhUdXpjRi9sNnlldmxNSzA3dHNZRkJFcXBB?=
 =?utf-8?B?TGc9PQ==?=
Content-ID: <3BBD5DF88B7CFF4AAB7F93CB61C6F949@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4470b8d7-a144-4c8c-f841-08da8a922185
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 14:15:45.8007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LRVvR3lk2IUOgzf26ri7gFxuN6BEE0KbrH5i9gm3ReO0/dLMv5EpZnTmP9K0HLi/CnocR4LrEvyLEcQv7WCeAAzF74MTSI8YzVoz4/4vLi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_071609_429567_042E2166 
X-CRM114-Status: GOOD (  19.68  )
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

On 30/08/2022 14:59, Jisheng Zhang wrote:
> On Mon, Aug 29, 2022 at 05:27:48PM +0000, Conor.Dooley@microchip.com wrote:
>> On 29/08/2022 15:10, Jisheng Zhang wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Sat, Aug 27, 2022 at 09:13:03PM +0000, Conor.Dooley@microchip.com wrote:
>>>> Hey Jisheng,
>>>
>>> Hi Conor,
>>>
>>>> On 27/08/2022 10:58, Jisheng Zhang wrote:
>>>>> I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
>>>>> memory optimizations such as swap on zram are helpful. As is seen
>>>>> in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
>>>>> commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
>>>>> swapped out"), THP_SWAP can improve the swap throughput significantly.
>>>>>
>>>>> Enable THP_SWAP for RV64, testing the micro-benchmark which is
>>>>> introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
>>>>> shows below numbers on the Lichee RV dock board:
>>>>>
>>>>> thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
>>>>> thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
>>>>
>>>> I know the original commit message contains this, but it's a little
>>>> odd. If the patch /enables/ THP then how would there be THP swap
>>>> prior to the patch?
>>>
>>> hmm, it's swap I'll send a v3 to correct the description.
>>>
>>>>
>>>>>
>>>>> Improved by 382%!
>>>>
>>>> I could not replicate the after numbers on my nezha, so I suspect
>>>> I am missing something in my config/setup. zswap is enabled and is
>>>
>>> swap on zram rather than zswap ;)
>>
>> I think I tried about 30 different config variations, initially not
>> using zswap and later using it.
>> My zramctl looks like so (although I did try zstd too) after running
>> the demo application from that commit:
>>
>> NAME       ALGORITHM DISKSIZE DATA COMPR TOTAL STREAMS MOUNTPOINT
>> /dev/zram0 lzo-rle       241M  22M  8.4M  9.1M       1 [SWAP]
>>
>> I am using the default riscv defconfig + the following:
>> CONFIG_ZRAM=y
>> CONFIG_CRYPTO_DEFLATE=y
>> CONFIG_CRYPTO_LZO=y
>> CONFIG_CRYPTO_ZSTD=y
>> CONFIG_ZRAM_MEMORY_TRACKING=y
>> CONFIG_TRANSPARENT_HUGEPAGE=y
>> CONFIG_TRANSPARENT_HUGEPAGE_MADVISE=y
>> CONFIG_THP_SWAP=y
>>
>> Am I just missing something obvious here?
> 
> similar config options here. what's your rootfs? Is your board busy
> with something? I used a minimal rootfs built from buildroot.
> can you plz show your numbers w/ and w/o the patch?

I was using fedora for the testing, downloaded directly from
koji. My before/after numbers varied, but were around 80,000
bytes/ms most of the time.

If I increased the size to 500 * 1024 * 1024 I got around 130k.

Before/after the patch, the numbers did not really change, but
things did fluctuate quite wildly - from about 50k to 90k using
the 400 size.

> 
> I also tried the simple benchmark on qemu(just for reference, since
> I have no other riscv boards except the lichee RV dock board):
> swp out w/o patch: 30066 bytes/ms (mean of 10 tests)
> swp out w/ patch: 130055 bytes/ms (mean of 10 tests)
> so improved by 332.7% 

I'll give QEMU a go so :)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
