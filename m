Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6269C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 21:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RM3gjG/JjsyF02v3K0mF0LCb2I9NsnwFFOg70UkRMkQ=; b=nJg7NHj/D51Qt6
	AvOgYDnO/XVmSHgRCzC8bdbinGteftirXGyXFiznn1+WulK2gYRdlhhMA7fgo20cQD9+JabDrLx1B
	/dcZWWIwZG2oami+2ViOo8CUDTZyMNxEaToiyI82baGRttod0HCuwclcAuBlMnNbXIM3bf6Vsf9zJ
	Xy+uiSgdWR7MsYopztFKG8CujPmu7Fq/V2g0St49lsJOWl59XiiF389PSMszGJunybMKC9A6xyVp5
	3aijcwue3TK2p4wDpCzrTDKTib4qBRqHDqcBizCWNKa05XIesZ2Y0Uv1Y5MBxzKewFQjxaoiBpeZ3
	NFTNGo1UvL2B/8uV3kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEfa-00Es77-3H; Mon, 22 Aug 2022 21:09:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQEfW-00Es4m-QD
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 21:09:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661202550; x=1692738550;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wHZB8vOMVa0iJspiFo7y6D7i1EPgcA1kxWDxte3yzpc=;
  b=K0MYG9+o6EwASQL/1cWyxYGR3GflAp3TgVxXOhioXfySKWg21IzVN9xS
   Ufk2bF8kJLWYSSr3Nbpx/A5xBo5y5bwO7G5IMwoZg+NDSvIPg6o/0h/Ce
   rz1kTdC5FZvBtW7Y9Qz5neuyW+226L8bHvk0AKxLkzFN9aB714ixuEFSA
   PZEaymh3Az1RZCSvDcKgXOkXiIznvIKEmzCp43qJPH5LG+b6DEVd3besq
   5+A21C7makh5OEsoF7oT7wdvzBChP097qamgLeK34dl2UyFDkHK7JgSzs
   yU6eDOj8/oyEDbqYhYzTczPLdLv5ExY3IUx3cpOfi2YA5ug2XK8IqLYZ3
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="110187546"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 14:09:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 14:09:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Mon, 22 Aug 2022 14:09:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZNTg4fL5GrP3NtP0MsmKlpj3CGcqjk9Fq0vGEqeuDXsjLCTcqmynzDFo7gO7Rp5rfyIQpkqglVlBet6avqEIoWjLJSuo3c3rY2/M6AMDLhDxowDEsqh21aS9VV7MIxLrF219PesznXCF3iHTfobsbyfG9dc/bQROpTx5DfAJHGYTW3gyXeyyJNQIb11zcpZrel8IjNOItv1Uc+uN6EJqcFXmmDSeSQIHd3SGiKWRZb/iOpouBCJpp+HUQlKPySzt1+SyU51KB3RtvePI8ojyUes83z152FCXtj5cT0XXc3YI/mH9ukrpNA4v3C0PBbQyPzs8bmT4tUf81iAE7GXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHZB8vOMVa0iJspiFo7y6D7i1EPgcA1kxWDxte3yzpc=;
 b=R99mpmVwFveCwncL1Z/hkynFIYtnXrX4j6534K4//zYaFEHeevvpxgjK8nRc2HNe1kSUqi4Z5sBbviPI2Iq+Vj149kYlKTgQtSKzp46JNxUoUFsFWLO0lR2P3sZg4qP/GSo9Bg1e4ZvHYKiCQjnjY5CEh4sMyY8sqfkl542yzEur7gFlGRqkGYhrKhkWpzxNrQfOxEdm8jNdgwkFrjxYV2eXAVzNQEsc1SPfD9NbZ/+1wWppzy36txzY4jqnh6AGv+o9R9PPG61TGKxpDbgxkkTUo+XvXH1Sm72HXEOKZ4Zo4EI1q1aI+/+GkURov4BMw9tVbh3Tdn9Pb0SIPomRaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHZB8vOMVa0iJspiFo7y6D7i1EPgcA1kxWDxte3yzpc=;
 b=ZaEby7IYINx++XGHZWVwxtjw3FfbCx2+5XZRALz2VQeH4M0N1PbRSBS37oiG9pp/JphK73HWKwHOiQ0WoGPJeUL/1fH7YhNuqOG/R27WLAf8F47bCXXm8WALMT3wm2JwzGXydb4f0E+qgqqc16wSM/KG64Nl2lR2n3a/ZYNCmRc=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 21:08:57 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 21:08:57 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
CC: <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v4 3/4] mm: support Svnapot in hugetlb page
Thread-Topic: [PATCH v4 3/4] mm: support Svnapot in hugetlb page
Thread-Index: AQHYtjzb6xI383SdMUC9KCwCPzpFdq27ak+A
Date: Mon, 22 Aug 2022 21:08:57 +0000
Message-ID: <0f46e51c-c433-74bd-ff65-617e8ad2fd77@microchip.com>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
 <20220822153413.4038052-4-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20220822153413.4038052-4-panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6de8b031-8ae1-474c-b7d6-08da84828752
x-ms-traffictypediagnostic: DM5PR11MB1914:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8hXlabyzQPHpG2LfiCb6u9yqOWX3hVlLiK3jxyjM5w8fMjro27z60FelVDTbZpuVpum15pm49TP2uI/SyjpAACDxDrDdG+1E/7GAfz+Xi0xzGcFMQ41R1PzcJuIA1k9xhJfRY2rYbCTxeF0mZPgAas2mA+8dHL4CMwGTpAmqtziENVOx+TzmEbhHpMz5WmDWRa9iIGRIKwA7SezdB00ufiAR+gNYfXKjgip+aoMLfM0lA7qvFYPO/9/0nOMA54hzW6Cu6otdZnjPnL3xvOQ24vVU6CcgMpFsPEbPuBOgKU92ZRm2nb7aSaHdSK3VQRYbfHxOB7JchUHmGf0LqVCbfVC5sBBa2kpERQJd2DNaDcmMJ3LSfvSGc6asm4GjIcqhlG+IYAtZcxiTeozXBcIsinX7ZXgPOWztNWR5Kr7TvV3T0rZpWosRV9NULxlbPBf5Y+2brLHVuJ79ZgStTeNkx8Nf287DeBmxh4IU/Pdc9aivt7Y4BC37Iq9Jl3l/3LUXSrZY07TbOxdUnn5tJ0H891NMuoSqtcu1yNsMxJW8dpRf6wGqs2TVnt7rR03oC0wr6mLxRbygRuSnOqESWnclGHgfPgtU61vrWlIva3tzkMuTobC0sqQTMnue/0BlDK/ZIaqCH9jn+fCd1Obn7OCgDhA8n6Y/VQh8fYR19akkX/h0W9zrUgZeZn856IRClf5F6JJvimdW/RKXTYL8JdTBdKM1xLhVGIo90rJw20iy2HRwUOW6LpOF5/NspNFCLV02Ph3l/+cMcICj1BGkwDs2hrIlxdENQCydvUY0Yyp+mB7vMtJZ3cFgSP+kiUAKkiuF9l/VEOI4m/S4T7tHF3cl7aE2mbF7YLRju+eUkUPy58M=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(376002)(366004)(396003)(346002)(39860400002)(83380400001)(38070700005)(186003)(2616005)(91956017)(54906003)(110136005)(31686004)(76116006)(316002)(64756008)(66446008)(8676002)(66556008)(66476007)(66946007)(71200400001)(4326008)(30864003)(53546011)(2906002)(31696002)(6506007)(26005)(6512007)(8936002)(478600001)(5660300002)(41300700001)(6486002)(966005)(122000001)(36756003)(38100700002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWpOeEhXOFppbU41VjZEMWJ5Qk5USnJBazVDc0N5ZnV2YmNTOTRNMjlYTHIv?=
 =?utf-8?B?eW1qTEs3ZGcwb05SekpndlFwbTI0VzJqRXlPZzlwNXVXRm1KMmgxZjZpaUMx?=
 =?utf-8?B?N2JlYityZE8vSGhxK2pTeVpIMlVoQ1JhbFcwdzNSZys1MmJxMkVvVmt6Z1FM?=
 =?utf-8?B?RnRWVTl6OXhwMlIyckZ0eXJDVmtJR0RPWGRkZDZCaXZQcXlNVHVQVCtHM2ZD?=
 =?utf-8?B?KzlkcHNuTHd5RXA2WFRGSG5sQkNZNmZTeFlucHVzaXlDaWpDN0x6UDlZejBB?=
 =?utf-8?B?SFNTMHVGUm9XWDBSSEg0UlpGNXJ0a0xKaDdFRjlJT1lvWEViVGh2eng5eS9C?=
 =?utf-8?B?MXFPcjAyTzJxUkJ5bTRhdXVaRHc4VFR2a0tMNzd2WENuajhnNWlYUE51WmNu?=
 =?utf-8?B?bFhGeWh6bTVRTlpKc3hHRysvY0ZUS21ieHlXMG9henFReFQwTXVrRVdVV1V1?=
 =?utf-8?B?cE0zdEpaOHRmSm9Vc1JnRVBmelRmelRWM1JOcVNZQURjcit3azg5bGJ2ZzVv?=
 =?utf-8?B?NUE1eno4Q28yM1crTSs0andBcXdCY0UyOFlzajdVSjFabFdPMVA2bG84Q1Ri?=
 =?utf-8?B?bzRQTUpkVGhwbUVXQ0lLWkJZRUNYTWNka2hvZ1FiNWp4OC9Yb2pueHE4TFRm?=
 =?utf-8?B?elRmRjhNWkZlVVp1VDJtRjJZK2pNcVBYRkI2a3l3N3hnNktmQ1RkbmRBZ21H?=
 =?utf-8?B?Q1Z4cjNUaVpabEFCclJ0ODJDYW9mWm1uR1ZJQ1BDWGVFRFdHVXdtUHZIOThF?=
 =?utf-8?B?TEw2aVZaZnZVdFZtMkxOK3NZQkNCcmN4NzBwdFhBVWE3WlJkNGN0YXlRVzF1?=
 =?utf-8?B?VlNmVW0wYjRLY0pmNDhYZ3lWVFlob1F3bkdWOVAwK1BmRy9Cc0t6UXUvWGY4?=
 =?utf-8?B?YU9YVU8xb1hYNCtHdERWdXFOMFoybnMvSkNFYkJUZnVKeDBZUW81ODJKTnJm?=
 =?utf-8?B?d3RIMXZqTGc1MSsvVUJUckpiZXBlMWhlU1AwNHZkamd0cjg3cEJ0OUViUkRP?=
 =?utf-8?B?M3pFY3VjWWxGTUdyb2tQSFFYaVppWkE2eXJkNkV5by9hT09GSGZIT3NEeUJN?=
 =?utf-8?B?d082eGNpWFNlMWUyTW43MnhpVEpySzBkNWhPZ2htclBiS2lBMXJkb1Q0RUVt?=
 =?utf-8?B?TzVFa1dlUVNtbEw0cHcyelM5Y1NwQjJWNjVURlE1Z00rSkl5THNhVXdYVjNB?=
 =?utf-8?B?NCtUL3Vvdk1jYWtsa0xLR3pZYllQK0VWMWVJNE5uUzFBb0RsdFNoMzVpcHlD?=
 =?utf-8?B?aFNIYitQL2crRjMxeVJQK0hJNVIyQ3pETHMxbHlqcFhtZ0ZsWFNVUkxLUWpQ?=
 =?utf-8?B?WVhHOURYeTVtL29mYWZHN3E1ald2RmpYczlVUWNZNGk5elViN25zMnZtM2F1?=
 =?utf-8?B?Qi9rblV4ZWYwTkg1NHk3VjRpV2VIMFphK3RWcEFKT2xleVp6K0J3QVhnelV0?=
 =?utf-8?B?ZFNJRW5JbnRNb0VjT1pib3B5V1grOUFqM1hYMDh0Qjc0RmxFZnVHd1A5QXJQ?=
 =?utf-8?B?aXlPTXhLaG13TXA0Nkt3dzRIWnVOQ2ZPMTgzVlZqOU1MYkxEZ2M4N3RaVnhO?=
 =?utf-8?B?N29vb1dIbGJGWEZIRjNEcUNkSWQ2bFN5STdzN3hXcXh6N1NQcnRSZVRUVjYv?=
 =?utf-8?B?cHU0SmF5aE1ta2xwb0NoVm8xVnBSSmovNSt4NFQrazl1dzliSFVXMGpCUzJF?=
 =?utf-8?B?VmZXRUVVTUgzallKZ2ZITUY1OU56ZHZzY29OMmdTaThoSFJpcEpNbUtNcWdC?=
 =?utf-8?B?T1pjNDZwL1ZCMDV1ellsYWhPT0tOQW16L2xsc1Q2Mkx2bnVPZHFlZzhqanFN?=
 =?utf-8?B?eFN1S21tUTFJbkZQUzZKbjc2Y2xnbDZJTmVkd1BBSTNncHc1b0U0ZkFxYkVo?=
 =?utf-8?B?dnNGQ2RkZzZiZmJyWmNya0lqUzBHRlBsYUZEa3lqZVFPWDAxb0pYZU5HenVO?=
 =?utf-8?B?cVB3RGw1Z2Zub0daY1Ywc3F4MjhpVG10akVxNVp0ekdmeEFkdWxMSFYyTlZC?=
 =?utf-8?B?OEplenVCQzh6ZHZXVzBKL1BGVEt6N0JSUlZpblQ4alVXY1NNcWRxN3N0UUJ2?=
 =?utf-8?B?QVlXVE5IVVpRRnRaUHg1OEVCVVNOb2RRVitHcjBNQ25JRWxXUEFGeTN2MGpX?=
 =?utf-8?B?Q3NlV1RZYW56aFpMeCs4YjlwUXdKZFFlSk1zOCtDWWhyRmliRFJ5OEhPbzlU?=
 =?utf-8?B?eGc9PQ==?=
Content-ID: <37FCDA433513D748AB2EC611CBE7B7E0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de8b031-8ae1-474c-b7d6-08da84828752
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 21:08:57.6837
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 10DMV5xq8+2OmB1Sn86xYqey7GvDLe8zwDMbx9uRu63fuuW/f0Wzzi6Vi9Af9L9O4q8gI0tab1oe48z42WJQDxYYLdw7sD3ZIHHlIbMIn5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1914
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_140911_126529_914A7C31 
X-CRM114-Status: GOOD (  21.55  )
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

Hey,
On 22/08/2022 16:34, panqinglin2020@iscas.ac.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> Svnapot can be used to support 64KB hugetlb page, so it can become a new
> option when using hugetlbfs. This commit adds a basic implementation of
> hugetlb page, and support 64KB as a size in it by using Svnapot.
> 
> For test, boot kernel with command line contains "default_hugepagesz=64K
> hugepagesz=64K hugepages=20" and run a simple test like this:
> 
> int main() {
>         void *addr;
>         addr = mmap(NULL, 64 * 1024, PROT_WRITE | PROT_READ,
>                         MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB | MAP_HUGE_64KB, -1, 0);
>         printf("back from mmap \n");
>         long *ptr = (long *)addr;
>         unsigned int i = 0;
>         for(; i < 8 * 1024;i += 512) {
>                 printf("%lp \n", ptr);
>                 *ptr = 0xdeafabcd12345678;
>                 ptr += 512;
>         }
>         ptr = (long *)addr;
>         i = 0;
>         for(; i < 8 * 1024;i += 512) {
>                 if (*ptr != 0xdeafabcd12345678) {
>                         printf("failed! 0x%lx \n", *ptr);
>                         break;
>                 }
>                 ptr += 512;
>         }
>         if(i == 8 * 1024)
>                 printf("simple test passed!\n");
> }
> 
> And it should be passed.

Actually built tested this version which I didnt get a 
chance to earlier. Got a couple new warnings:

/stuff/linux/arch/riscv/mm/hugetlbpage.c:58:5: warning: no previous prototype for function 'napot_pte_num' [-Wmissing-prototypes]
int napot_pte_num(pte_t pte)
    ^
/stuff/linux/arch/riscv/mm/hugetlbpage.c:58:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
int napot_pte_num(pte_t pte)

> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c43708ae7f38..9aaec147a860 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -43,7 +43,7 @@ config RISCV
>         select ARCH_USE_QUEUED_RWLOCKS
>         select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_FRAME_POINTERS
> -       select ARCH_WANT_GENERAL_HUGETLB
> +       select ARCH_WANT_GENERAL_HUGETLB if !SVNAPOT
>         select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>         select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
>         select BUILDTIME_TABLE_SORT if MMU
> diff --git a/arch/riscv/include/asm/hugetlb.h b/arch/riscv/include/asm/hugetlb.h
> index a5c2ca1d1cd8..d315625542c8 100644
> --- a/arch/riscv/include/asm/hugetlb.h
> +++ b/arch/riscv/include/asm/hugetlb.h
> @@ -2,7 +2,35 @@
>  #ifndef _ASM_RISCV_HUGETLB_H
>  #define _ASM_RISCV_HUGETLB_H
> 
> -#include <asm-generic/hugetlb.h>
>  #include <asm/page.h>
> 
> +#ifdef CONFIG_SVNAPOT
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags);
> +#define arch_make_huge_pte arch_make_huge_pte
> +#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
> +void set_huge_pte_at(struct mm_struct *mm,
> +                    unsigned long addr, pte_t *ptep, pte_t pte);
> +#define __HAVE_ARCH_HUGE_PTEP_GET_AND_CLEAR
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +                             unsigned long addr, pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_PTEP_CLEAR_FLUSH
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +                           unsigned long addr, pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_PTEP_SET_ACCESS_FLAGS
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +                              unsigned long addr, pte_t *ptep,
> +                              pte_t pte, int dirty);
> +#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
> +                            unsigned long addr, pte_t *ptep);
> +#define __HAVE_ARCH_HUGE_PTE_CLEAR
> +void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
> +                   pte_t *ptep, unsigned long sz);
> +#define set_huge_swap_pte_at riscv_set_huge_swap_pte_at
> +void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
> +                               pte_t *ptep, pte_t pte, unsigned long sz);
> +#endif /*CONFIG_SVNAPOT*/
> +
> +#include <asm-generic/hugetlb.h>
> +
>  #endif /* _ASM_RISCV_HUGETLB_H */
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index ac70b0fd9a9a..1ea06476902a 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -17,7 +17,7 @@
>  #define PAGE_MASK      (~(PAGE_SIZE - 1))
> 
>  #ifdef CONFIG_64BIT
> -#define HUGE_MAX_HSTATE                2
> +#define HUGE_MAX_HSTATE                3
>  #else
>  #define HUGE_MAX_HSTATE                1
>  #endif
> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
> index 932dadfdca54..71417f228624 100644
> --- a/arch/riscv/mm/hugetlbpage.c
> +++ b/arch/riscv/mm/hugetlbpage.c
> @@ -2,6 +2,239 @@
>  #include <linux/hugetlb.h>
>  #include <linux/err.h>
> 
> +#ifdef CONFIG_SVNAPOT
> +pte_t *huge_pte_alloc(struct mm_struct *mm,
> +                     struct vm_area_struct *vma,
> +                     unsigned long addr,
> +                     unsigned long sz)
> +{
> +       pgd_t *pgdp = pgd_offset(mm, addr);
> +       p4d_t *p4dp = p4d_alloc(mm, pgdp, addr);
> +       pud_t *pudp = pud_alloc(mm, p4dp, addr);
> +       pmd_t *pmdp = pmd_alloc(mm, pudp, addr);
> +
> +       if (sz == NAPOT_CONT64KB_SIZE) {
> +               if (!pmdp)
> +                       return NULL;
> +               WARN_ON(addr & (sz - 1));
> +               return pte_alloc_map(mm, pmdp, addr);
> +       }
> +
> +       return NULL;
> +}
> +
> +pte_t *huge_pte_offset(struct mm_struct *mm,
> +                      unsigned long addr,
> +                      unsigned long sz)
> +{
> +       pgd_t *pgdp;
> +       p4d_t *p4dp;
> +       pud_t *pudp;
> +       pmd_t *pmdp;
> +       pte_t *ptep = NULL;
> +
> +       pgdp = pgd_offset(mm, addr);
> +       if (!pgd_present(READ_ONCE(*pgdp)))
> +               return NULL;
> +
> +       p4dp = p4d_offset(pgdp, addr);
> +       if (!p4d_present(READ_ONCE(*p4dp)))
> +               return NULL;
> +
> +       pudp = pud_offset(p4dp, addr);
> +       if (!pud_present(READ_ONCE(*pudp)))
> +               return NULL;
> +
> +       pmdp = pmd_offset(pudp, addr);
> +       if (!pmd_present(READ_ONCE(*pmdp)))
> +               return NULL;
> +
> +       if (sz == NAPOT_CONT64KB_SIZE)
> +               ptep = pte_offset_kernel(pmdp, (addr & ~NAPOT_CONT64KB_MASK));
> +
> +       return ptep;
> +}
> +
> +int napot_pte_num(pte_t pte)
> +{
> +       if (!(pte_val(pte) & NAPOT_64KB_MASK))
> +               return NAPOT_64KB_PTE_NUM;
> +
> +       pr_warn("%s: unrecognized napot pte size 0x%lx\n",
> +               __func__, pte_val(pte));
> +       return 1;
> +}
> +
> +static pte_t get_clear_flush(struct mm_struct *mm,
> +                            unsigned long addr,
> +                            pte_t *ptep,
> +                            unsigned long pte_num)
> +{
> +       pte_t orig_pte = huge_ptep_get(ptep);
> +       bool valid = pte_val(orig_pte);
> +       unsigned long i, saddr = addr;
> +
> +       for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++) {
> +               pte_t pte = ptep_get_and_clear(mm, addr, ptep);
> +
> +               if (pte_dirty(pte))
> +                       orig_pte = pte_mkdirty(orig_pte);
> +
> +               if (pte_young(pte))
> +                       orig_pte = pte_mkyoung(orig_pte);
> +       }
> +
> +       if (valid) {
> +               struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
> +
> +               flush_tlb_range(&vma, saddr, addr);
> +       }
> +       return orig_pte;
> +}
> +
> +static void clear_flush(struct mm_struct *mm,
> +                       unsigned long addr,
> +                       pte_t *ptep,
> +                       unsigned long pte_num)
> +{
> +       struct vm_area_struct vma = TLB_FLUSH_VMA(mm, 0);
> +       unsigned long i, saddr = addr;
> +
> +       for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> +               pte_clear(mm, addr, ptep);
> +
> +       flush_tlb_range(&vma, saddr, addr);
> +}
> +
> +pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
> +{
> +       if (shift == NAPOT_CONT64KB_SHIFT)
> +               entry = pte_mknapot(entry, NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
> +
> +       return entry;
> +}
> +
> +void set_huge_pte_at(struct mm_struct *mm,
> +                    unsigned long addr,
> +                    pte_t *ptep,
> +                    pte_t pte)
> +{
> +       int i;
> +       int pte_num;
> +
> +       if (!pte_napot(pte)) {
> +               set_pte_at(mm, addr, ptep, pte);
> +               return;
> +       }
> +
> +       pte_num = napot_pte_num(pte);
> +       for (i = 0; i < pte_num; i++, ptep++, addr += PAGE_SIZE)
> +               set_pte_at(mm, addr, ptep, pte);
> +}
> +
> +int huge_ptep_set_access_flags(struct vm_area_struct *vma,
> +                              unsigned long addr,
> +                              pte_t *ptep,
> +                              pte_t pte,
> +                              int dirty)
> +{
> +       pte_t orig_pte;
> +       int i;
> +       int pte_num;
> +
> +       if (!pte_napot(pte))
> +               return ptep_set_access_flags(vma, addr, ptep, pte, dirty);
> +
> +       pte_num = napot_pte_num(pte);
> +       ptep = huge_pte_offset(vma->vm_mm, addr, NAPOT_CONT64KB_SIZE);
> +       orig_pte = huge_ptep_get(ptep);
> +
> +       if (pte_dirty(orig_pte))
> +               pte = pte_mkdirty(pte);
> +
> +       if (pte_young(orig_pte))
> +               pte = pte_mkyoung(pte);
> +
> +       for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> +               ptep_set_access_flags(vma, addr, ptep, pte, dirty);
> +
> +       return true;
> +}
> +
> +pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
> +                             unsigned long addr,
> +                             pte_t *ptep)
> +{
> +       int pte_num;
> +       pte_t orig_pte = huge_ptep_get(ptep);
> +
> +       if (!pte_napot(orig_pte))
> +               return ptep_get_and_clear(mm, addr, ptep);
> +
> +       pte_num = napot_pte_num(orig_pte);
> +       return get_clear_flush(mm, addr, ptep, pte_num);
> +}
> +
> +void huge_ptep_set_wrprotect(struct mm_struct *mm,
> +                            unsigned long addr,
> +                            pte_t *ptep)
> +{
> +       int i;
> +       int pte_num;
> +       pte_t pte = READ_ONCE(*ptep);
> +
> +       if (!pte_napot(pte))
> +               return ptep_set_wrprotect(mm, addr, ptep);
> +
> +       pte_num = napot_pte_num(pte);
> +       ptep = huge_pte_offset(mm, addr, NAPOT_CONT64KB_SIZE);
> +
> +       for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> +               ptep_set_wrprotect(mm, addr, ptep);
> +}
> +
> +pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
> +                           unsigned long addr,
> +                           pte_t *ptep)
> +{
> +       int pte_num;
> +       pte_t pte = READ_ONCE(*ptep);
> +
> +       if (!pte_napot(pte)) {
> +               ptep_clear_flush(vma, addr, ptep);
> +               return pte;
> +       }
> +
> +       pte_num = napot_pte_num(pte);
> +       clear_flush(vma->vm_mm, addr, ptep, pte_num);
> +
> +       return pte;
> +}
> +
> +void huge_pte_clear(struct mm_struct *mm,
> +                   unsigned long addr,
> +                   pte_t *ptep,
> +                   unsigned long sz)
> +{
> +       int i, pte_num;
> +
> +       pte_num = napot_pte_num(READ_ONCE(*ptep));
> +       for (i = 0; i < pte_num; i++, addr += PAGE_SIZE, ptep++)
> +               pte_clear(mm, addr, ptep);
> +}
> +
> +void riscv_set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr,
> +                               pte_t *ptep, pte_t pte, unsigned long sz)
> +{
> +       int i, pte_num;
> +
> +       pte_num = napot_pte_num(READ_ONCE(*ptep));
> +
> +       for (i = 0; i < pte_num; i++, ptep++)
> +               set_pte(ptep, pte);
> +}
> +#endif /*CONFIG_SVNAPOT*/
> +
>  int pud_huge(pud_t pud)
>  {
>         return pud_leaf(pud);
> @@ -18,17 +251,26 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>                 return true;
>         else if (IS_ENABLED(CONFIG_64BIT) && size == PUD_SIZE)
>                 return true;
> +#ifdef CONFIG_SVNAPOT
> +       else if (has_svnapot() && size == NAPOT_CONT64KB_SIZE)
> +               return true;
> +#endif /*CONFIG_SVNAPOT*/
>         else
>                 return false;
>  }
> 
> -#ifdef CONFIG_CONTIG_ALLOC
> -static __init int gigantic_pages_init(void)
> +static __init int hugetlbpage_init(void)
>  {
> +#ifdef CONFIG_CONTIG_ALLOC
>         /* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
>         if (IS_ENABLED(CONFIG_64BIT))
>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
> +#endif /*CONFIG_CONTIG_ALLOC*/
> +       hugetlb_add_hstate(PMD_SHIFT - PAGE_SHIFT);
> +#ifdef CONFIG_SVNAPOT
> +       if (has_svnapot())
> +               hugetlb_add_hstate(NAPOT_CONT64KB_SHIFT - PAGE_SHIFT);
> +#endif /*CONFIG_SVNAPOT*/
>         return 0;
>  }
> -arch_initcall(gigantic_pages_init);
> -#endif
> +arch_initcall(hugetlbpage_init);
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
