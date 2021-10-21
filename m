Return-Path: <SRS0=XH8j=PJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FF5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:13:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09289610CB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Oct 2021 13:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09289610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK9rXs1d7nHDVFcsrcmjh6LuyQ7KTGvOQuGXZ2B1FZU=; b=TORM9i8UhVPDcP
	zTf97zc2TPXQB8NcuAu7N2lOp07UnBNFSAeoDi3+kbHhDo8AdFzb6U00Fdo1bae3WpLK1btdNH4hp
	ybhfpdpQ+psoE+kKp/ZYjoTu/xLy9tDqGYEyA7JOJ2pkAzQFbmoNUXCU/wW9PgwEKLOKFt4PhPdXb
	snNsBW4ebuJXx8iKPUcBeFMx8M4LF5d2aGt3QlV9NQMG+d17EN3LrOHvxWk1GHZfv7JXZRfAlvERF
	y4tTnJrMCpDjhol/4uUNBZlaXTg+Z8GxsOQEEnMfC94389qb595cG/Gel5pwAc/KNNFK5qfNizh77
	luo2e2SAthxR0Z6Db9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdXt8-007cOz-FT; Thu, 21 Oct 2021 13:13:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdXt5-007cO6-1y
 for linux-riscv@lists.infradead.org; Thu, 21 Oct 2021 13:13:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1634822018; x=1666358018;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ySGzicAEPLb4gaC6fASsTVXL98XV1tOsdKK9SU4eiz8=;
 b=y64Cekb3BQa9i3Wf20nKNpcL0Be547OQEmzxem0COkaT/6AMblWkMw4w
 9CpvBCjv3tJiiTtHKtDwSpUfYhjaX9vR+ga6Omu11EO8c4aFetd9Jeiem
 zAzbEgQuiTjs54t+U7ib56S1vL39qFbdX2Xh1sQ6+fzKLfBMr7UVD5LaI
 RpIR4Nk8YfKUort/3y++HSCSi3HiJ70P1Kr+M6AQl+XWKZZUh4k8jSSJ4
 NjWu8cC/ZEexbpNVegPeY8szYzQZ7ZlOEQzUvTGVEAHkLP/g7vwHTNXUm
 60ECCvLH8vJskXhtQuJAgkA7off1MrCtVki1tAiJz2jqLWZ5kCacHiZby Q==;
IronPort-SDR: TMzFbzZbc44PcOlDS9Bx3xWsHf7L05PuLKI95gyFd93u/U6m2fwgwAxTfq34YAtYBlflZDOOG2
 q5SctQHeIIhYfFp2UBBEJkmjPL/OtzrkzghfSn8xNFY/qqiLmcbfPkV9x4H1ieletu7qcbze10
 nJCppdqE/pq3xhLvIZazcA8ia8v3sZOn/wNnlKXU+7LuI6nu+4FEttpcWGq+UQSgcLl9NDjqGf
 oJtAW7GN9pNgrVbX/Bf3dcQX8Yrzl7ZRWzUxrs5O1PIMkjpOlvRcGacw2dJWOxBUXD0WCwgxAz
 r5aJXhuCoHI6VziXYS5FMofc
X-IronPort-AV: E=Sophos;i="5.87,169,1631602800"; d="scan'208";a="133915508"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Oct 2021 06:13:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 21 Oct 2021 06:13:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Thu, 21 Oct 2021 06:13:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/Alla1+I+nPgU4LoxzfWsx+voOQvRwPOZmTR+KuhsIjJMjTOI+WNccxdZBpA7alqNnt0zz31vaMt5MveeJYF4P1EDzGE0hzbsXKJuPHX8RkbDSYnRlGVmE48l6o2ubhgyEtXGtUuPIPBKpDgTtiQJnLl3OpYb5jgRZM2wAi9woO0U309SdLVtMvq3TdNWhx2aAOO9YJd69BQqWHku92DIJJDxxSc8Mgrvlxgf6e/JzQiLgE0HjnyrZYRvd+gVfKJaVfin+oqppEbSa+o6B8lgUltWyMPgZLa3olMNFm4ladOrgKPzykauk7J49J8z64bH1aoK0W4O4zfcEKefsXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ySGzicAEPLb4gaC6fASsTVXL98XV1tOsdKK9SU4eiz8=;
 b=g2X55qePcXg9DZKDKzf1EQQfHMNsuphwZONfJxmGLeHxtJ93upQYCay+elFd8xq1tiZe/AI5MBcuEkbogS2EPTUdOM10BJYh+SA8i3x+lNlRAklps+MIbiJcE80e9J1D5d+wf7uhV4flm7I/Rqzi7CpZI/D0GvV1Z+jezzuKfPjbGBW8ujqHJVda8u/z0Wxb6dZcqkKPh0F1YtlbfDzyj8d2Bn9+R+46FdWsV6HsW6BN5cU/6/9GER9xbtW2Q+fnTUwx8YZSqwu13bFsWbTlkK0JvVtUMHz8Gkh1Fk0OLs7uF4dISoVGAu00hIwyFMPW2N7n49Lx7INv2mYAb4yyRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ySGzicAEPLb4gaC6fASsTVXL98XV1tOsdKK9SU4eiz8=;
 b=rARbqlqJZ6pfEclg1siSwKdPLkgnG1xh/xdI2biHhccNS7HDO7iRznM/vzSz220VpFrUVFiGheQMECJDh8BfGUQKyhpM7auEA4BanZJRhZCAJ63/RSojtPY2IoJWeUPNp0GjitBlY9n5m5+Q40JxgabMW3yHpwJkD95oF1sNrUQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB5155.namprd11.prod.outlook.com (2603:10b6:303:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15; Thu, 21 Oct
 2021 13:13:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ccb6:6f5a:9841:266d%8]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 13:13:36 +0000
From: <Conor.Dooley@microchip.com>
To: <robh+dt@kernel.org>, <damien.lemoal@wdc.com>, <jassisinghbrar@gmail.com>, 
 <aou@eecs.berkeley.edu>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, 
 <linux-riscv@lists.infradead.org>, <j.neuschaefer@gmx.net>,
 <sfr@canb.auug.org.au>
CC: <Cyril.Jean@microchip.com>, <Daire.McNamara@microchip.com>,
 <atish.patra@wdc.com>
Subject: Re: [PATCH] soc: add polarfire soc system controller
Thread-Topic: [PATCH] soc: add polarfire soc system controller
Thread-Index: AQHXuecsmqsF21x/+Uu/rugU1FwxCqvdh0SA
Date: Thu, 21 Oct 2021 13:13:35 +0000
Message-ID: <79ae46c3-c028-2c99-2428-b601e4fb03d4@microchip.com>
References: <20211005124743.7841-1-conor.dooley@microchip.com>
In-Reply-To: <20211005124743.7841-1-conor.dooley@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15e6f342-e6e3-48e4-b294-08d994949717
x-ms-traffictypediagnostic: CO1PR11MB5155:
x-microsoft-antispam-prvs: <CO1PR11MB51557EDB28598416AD2E977298BF9@CO1PR11MB5155.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bGMIfZOSmlLCcW+jOHFEHBdsw3a8UPa1RIo7ejzsKvZ7FBNUlCJdY4g2mXa2Z1rfplUWlxQaRM0UyumpMdYfU3iB6PIRQs18wXjQPwNMtlZ+oARZ4MJmaYMNrX9ZqhbOE8uNfWnEGVbLTODqPhbdr5bKyULGTm4O836OkaS4OkPbR/dV+ne20UDVuIKReAgNHFR+Re88jJcHdHjrFC2MWjUOTlxwey7gy41owG8r+Nj3iLlX6349bQT8W/+doggV9UlQn6QhXco+aSu32t3PhC7sVIP5vQ6KM254cI3pNI6MdaunGLyQw8rBHr+v65EwOaba2KXA1ND5O8fN9K9K2WDVXWSZ7CLJe3t0L9CltmQ+xWVVCIXccVMhuoXzYEjD8ua5WAYhbSaequb3Bewt9/9wB9eeJgJL9maQZDtgEPH7HhStJ592hiqBKQ2v6cSIo4bM4WOgJQ/BfR3TWAOPfCj+MH7eUR7kKpoxdu4HiWlS+vheme1yYgSUKXvM4IhUl/Gy3N0PlN6O22SUB+T7P4V4kjcGY4jZ7jyUm5TDoL6ZmwZhhsDASP6DEfsFUeoREcv3O+OKgGc5udo9xck4u6H4x/iJehGyM6z+nb2A4XLW0vheRBPZqsyuAd9Limvy8eYj3jnNtLZ+2yj7+v16NO7uFighzFDDOXJwTZe5YB+AS69zXejVkEBas1ZAAw+2hTSc7rs9dJ0ntxQJjQbAwGj60D6WgyixTexD/qobP20bKMapVysoGPRdkoxtd82wueM8OaeT6v/7X5Yx4ys3Rg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6506007)(53546011)(316002)(7416002)(83380400001)(8676002)(6486002)(71200400001)(508600001)(5660300002)(38100700002)(2616005)(31696002)(122000001)(31686004)(36756003)(8936002)(6512007)(4326008)(66556008)(66476007)(66946007)(110136005)(54906003)(186003)(2906002)(76116006)(26005)(66446008)(91956017)(64756008)(38070700005)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1ZQUlRmUlU1OHFFNUhJZ2YrQW54RXp4VlRUZDZoNkQ2VFo0M0IyVEhRUlFl?=
 =?utf-8?B?T0JDMFRQdVBYajlHTDMxMEVNWDFkSFlrdGhSZ05hQzh1YlUwcFZRbm5wamlS?=
 =?utf-8?B?cHBWMUw4a0tXaStCajI4dFV4ZUNyWVdLWUZLSTYxWi9uS2VWUnlSU2g3Y1p0?=
 =?utf-8?B?WjhtZU5CTHNxdW9WY1BveXVvVHRpZHJsS3U0cXRnbXd1L0RNU05saVZxaDBN?=
 =?utf-8?B?UmFlRjNXN2RDVEpsVkt6Y0p0MlRoUlBiajIyYTdFSm5HbUxUU0MxdG0xOElX?=
 =?utf-8?B?aE54SDJQMG8rVE1hUE5rbUpkRlJ4SWxSZ1VydzFIZkwwU1V6NXJjczA0RUhQ?=
 =?utf-8?B?aUtueXE4Mm15SFUrQmUxTHUrUUFuQXl0c1o5UTg4SUpTbE1jejF4dVgzamRt?=
 =?utf-8?B?UGJXVXZqRGZ4RjJvWVhlRUNKV2xmZjhVb3U2aGpLT0VNa0NkWTlueHlXSkpx?=
 =?utf-8?B?RjhHWTA4Y0w4OWRJZEpubk5YZ1BwSU10SVlPWXNWVGNLVVNSdldtcTljZzRU?=
 =?utf-8?B?NHFaUXJHWldybWVwM1VFMVNad2hneTArWFI0YUs5aTdDUnNtNCtRNFU5R3Bi?=
 =?utf-8?B?SG85NFFNZXBIZ1Z2YmxLeUZQNTczUlBlNWlva1cxaGpaOXQ3U2htT2x6Y2ZJ?=
 =?utf-8?B?NjRlQTg1bThFbEJaOEhXVWJJaWdrNGdTblNxZHlicCtMWUJleXBvSmpqVG4y?=
 =?utf-8?B?U3lHMkkvOS8zOHdicHBCODc3UUp6cjViYzJKTmREZ2w4ZVVzZmJEK1l0VG9j?=
 =?utf-8?B?alJBbzVNK2lmelBlR0xlVTlaMSs5MWpURndKdkRIdGM5aU13WDkvdllmZWFy?=
 =?utf-8?B?NTJsRk9tdENWYlNXZU5LNjY4M2gwUkg2YTBhWFRHTDdnb2w0UHdNZzdkUm1U?=
 =?utf-8?B?bnlsdzZjMTl2ZTZBT3FZanZRSGhRVmMrVUhEZysyeGdqMmM2Q09WdEtBdytX?=
 =?utf-8?B?aWdjZlkydWFmZWQ4L093RHdGdjFiSVE3blUxbDZFR3pJTWdBZTlXWmszbmJ1?=
 =?utf-8?B?VzIweUhnT09JTkRMWFY5eHl2RG56NUtrcUdLRWRpTmEwd3VZMURtV2NaQ1Zj?=
 =?utf-8?B?bzNxZnBvbmMxRXVqMk11U1AvZ0w4aThoQnFxQ0JqT3RPaGpiQU9JamhiRTFw?=
 =?utf-8?B?MmR4RjdTcHhkQ3RSUlp2aldHYjlFcjY0bWQ0c0lCclNkUi9xWTljb0dxUnJG?=
 =?utf-8?B?bWd3dVNwNVNWMk1TdGhpdXdia0xybjNRcWVjK2I2RHdhajFQODZJVXJqQXFL?=
 =?utf-8?B?Y2ZES2d1dmFqVEc1WWhHZDF0SVBVSy9ZRU1xd0JHdk9pWVFTcy9QVE8xeGhw?=
 =?utf-8?B?MktwZ1gxeXZRRWpNNFBxcGJwWHN6TVN3c0xmMDNsL2hxaVJrcENYQzdWZm8y?=
 =?utf-8?B?Y2lUU3VyT2xGRmRrcXgxMWU2dnZidW5FVFdESmcwOGVwMGpRb3RuOXRlVElB?=
 =?utf-8?B?Z0c4ZjNrVzl4ZUZoVno2SkJxMlo0N1Y0VFViME8wcXc4UkZlZm5FaHcxU0N4?=
 =?utf-8?B?Q0VtSG1oYWF3WkVOcFdZMllXTXNBOW8rVWMwcUN5OUc1WDg0bjlhc3FvU0pj?=
 =?utf-8?B?OEswNGZxVjVDODBlUGwzUExOcUlHc1ZaaWNxUndFbFpIWEFYb1JGV0UxWGFz?=
 =?utf-8?B?UlBVYXI0bnZrYkd0enFvbERoLys4Vkx4bTlhRG5xbnVkQ1BnVzZGZDAra2pk?=
 =?utf-8?B?dmJpc0JhQkd5VWNKbHFPSGx3Y3FhRTIzSEZXTUpZeFBoamVMUS9IR0ZTSUJN?=
 =?utf-8?B?a0Vib3NDU0p6U3pqRWxOODJPWGEvU01Wa3Y2N0ZTRldCa1VmSVd4U2k3L3pK?=
 =?utf-8?B?S0h3WlFVTVZHNG41RENBUEZacDBXQnlYWHViOE91RDkzUy9JU0pLcSs0NHdJ?=
 =?utf-8?B?UWdUZFJBOEdZOE9FRFA4akNiQ05SRVRvSWtnenB5aXJWVjhXaEEwcWRPMjgw?=
 =?utf-8?Q?0h0btG+sdFg=3D?=
Content-ID: <2B0BCFABC293914D8BE7727C996227A9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15e6f342-e6e3-48e4-b294-08d994949717
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 13:13:35.9384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: conor.dooley@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_061339_268150_330427B0 
X-CRM114-Status: GOOD (  24.81  )
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

On 05/10/2021 13:47, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> This driver provides an interface for other drivers to access the
> functions of the system controller on the Microchip PolarFire SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Is there some extra CCs that I am missing on this patch that weren't 
picked up by getmaintainers,
and/or am I mistaken in thinking that the soc tree is arm only?
> ---
>   drivers/soc/Kconfig                         |   1 +
>   drivers/soc/Makefile                        |   1 +
>   drivers/soc/microchip/Kconfig               |  10 ++
>   drivers/soc/microchip/Makefile              |   1 +
>   drivers/soc/microchip/mpfs-sys-controller.c | 119 ++++++++++++++++++++
>   5 files changed, 132 insertions(+)
>   create mode 100644 drivers/soc/microchip/Kconfig
>   create mode 100644 drivers/soc/microchip/Makefile
>   create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
>
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index e8a30c4c5aec..b33142e020e0 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -12,6 +12,7 @@ source "drivers/soc/imx/Kconfig"
>   source "drivers/soc/ixp4xx/Kconfig"
>   source "drivers/soc/litex/Kconfig"
>   source "drivers/soc/mediatek/Kconfig"
> +source "drivers/soc/microchip/Kconfig"
>   source "drivers/soc/qcom/Kconfig"
>   source "drivers/soc/renesas/Kconfig"
>   source "drivers/soc/rockchip/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index a05e9fbcd3e0..e3be151e391e 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -17,6 +17,7 @@ obj-y				+= ixp4xx/
>   obj-$(CONFIG_SOC_XWAY)		+= lantiq/
>   obj-$(CONFIG_LITEX_SOC_CONTROLLER) += litex/
>   obj-y				+= mediatek/
> +obj-y				+= microchip/
>   obj-y				+= amlogic/
>   obj-y				+= qcom/
>   obj-y				+= renesas/
> diff --git a/drivers/soc/microchip/Kconfig b/drivers/soc/microchip/Kconfig
> new file mode 100644
> index 000000000000..eb656b33156b
> --- /dev/null
> +++ b/drivers/soc/microchip/Kconfig
> @@ -0,0 +1,10 @@
> +config POLARFIRE_SOC_SYS_CTRL
> +	tristate "POLARFIRE_SOC_SYS_CTRL"
> +	depends on POLARFIRE_SOC_MAILBOX
> +	help
> +	  This driver adds support for the PolarFire SoC (MPFS) system controller.
> +
> +	  To compile this driver as a module, choose M here. the
> +	  module will be called mpfs_system_controller.
> +
> +	  If unsure, say N.
> diff --git a/drivers/soc/microchip/Makefile b/drivers/soc/microchip/Makefile
> new file mode 100644
> index 000000000000..14489919fe4b
> --- /dev/null
> +++ b/drivers/soc/microchip/Makefile
> @@ -0,0 +1 @@
> +obj-$(CONFIG_POLARFIRE_SOC_SYS_CTRL)	+= mpfs-sys-controller.o
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/microchip/mpfs-sys-controller.c
> new file mode 100644
> index 000000000000..3cfee997fa59
> --- /dev/null
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Microchip PolarFire SoC (MPFS) system controller driver
> + *
> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
> + *
> + * Author: Conor Dooley <conor.dooley@microchip.com>
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/of_platform.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/platform_device.h>
> +#include <soc/microchip/mpfs.h>
> +
> +static DEFINE_MUTEX(transaction_lock);
> +
> +struct mpfs_sys_controller {
> +	struct mbox_client client;
> +	struct mbox_chan *chan;
> +	struct completion c;
> +	u32 enabled;
> +};
> +
> +int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, void *msg)
> +{
> +	int ret;
> +
> +	mutex_lock_interruptible(&transaction_lock);
> +
> +	reinit_completion(&mpfs_client->c);
> +
> +	ret = mbox_send_message(mpfs_client->chan, msg);
> +	if (ret >= 0) {
> +		if (wait_for_completion_timeout(&mpfs_client->c, HZ)) {
> +			ret = 0;
> +		} else {
> +			ret = -ETIMEDOUT;
> +			dev_warn(mpfs_client->client.dev, "MPFS sys controller transaction timeout\n");
> +		}
> +	} else {
> +		dev_err(mpfs_client->client.dev,
> +			"mpfs sys controller transaction returned %d\n", ret);
> +	}
> +
> +	mutex_unlock(&transaction_lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL(mpfs_blocking_transaction);
> +
> +static void rx_callback(struct mbox_client *client, void *msg)
> +{
> +	struct mpfs_sys_controller *mpfs_client =
> +		container_of(client, struct mpfs_sys_controller, client);
> +
> +	complete(&mpfs_client->c);
> +}
> +
> +static int mpfs_sys_controller_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mpfs_sys_controller *mpfs_client;
> +
> +	mpfs_client = devm_kzalloc(dev, sizeof(*mpfs_client), GFP_KERNEL);
> +	if (!mpfs_client)
> +		return -ENOMEM;
> +
> +	mpfs_client->client.dev = dev;
> +	mpfs_client->client.rx_callback = rx_callback;
> +	mpfs_client->client.tx_block = 1U;
> +
> +	mpfs_client->chan = mbox_request_channel(&mpfs_client->client, 0);
> +	if (IS_ERR(mpfs_client->chan))
> +		return dev_err_probe(dev, PTR_ERR(mpfs_client->chan),
> +				     "Failed to get mbox channel\n");
> +
> +	init_completion(&mpfs_client->c);
> +
> +	platform_set_drvdata(pdev, mpfs_client);
> +
> +	dev_info(&pdev->dev, "Registered MPFS system controller driver\n");
> +
> +	return 0;
> +}
> +
> +struct mpfs_sys_controller *
> +mpfs_sys_controller_get(struct device_node *mss_node)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(mss_node);
> +
> +	if (!pdev)
> +		return NULL;
> +
> +	return platform_get_drvdata(pdev);
> +}
> +EXPORT_SYMBOL(mpfs_sys_controller_get);
> +
> +static const struct of_device_id mpfs_sys_controller_of_match[] = {
> +	{.compatible = "microchip,polarfire-soc-sys-controller", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpfs_sys_controller_of_match);
> +
> +static struct platform_driver mpfs_sys_controller_driver = {
> +	.driver = {
> +		.name = "mpfs-sys-controller",
> +		.of_match_table = mpfs_sys_controller_of_match,
> +	},
> +	.probe = mpfs_sys_controller_probe,
> +};
> +module_platform_driver(mpfs_sys_controller_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_DESCRIPTION("MPFS system controller driver");


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
