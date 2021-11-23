Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF7CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 05:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDHWjNsSofnzZlFct9awoguP0jDKIqXti4RF/VKq7bM=; b=1DeEJvleGZ4Uz3
	JVeTzHs43PzRp5UZPAjA+l+a9KfOqyKiqsl01xwCXUbIkxFsTMfmhvoq0oBT20rFbcaFNveiokia4
	/HQA1RHk/8g6G9hg4ojTAX2lgeyZsnIIb1Xg3jRxpRel9MWKbWTHmTN86dJdzre/+wjg0A9W9WVeU
	58d0LueDYamKxn8gm6/CFilKkWRvx5FTcTLEwwluEDrInW8hBLxE+9DkgudO/vB4SjZ+IDx9B05v/
	dfmhhCxAlhsHnC8Cc20ewpvo7/FyUeUMs1YpxDhFUKw1oA93yCemYf2N8SxfCNM3sFWXTC9zOj/oL
	GUym9f7PgpS63O790Phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpOQv-000uMj-3R; Tue, 23 Nov 2021 05:33:33 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpOQr-000uLu-SP; Tue, 23 Nov 2021 05:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1637645609; x=1669181609;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=E/+VrmQI2AXXu4mwGjSfYizL1pmVhtc4JXbQibVzPIc=;
 b=ZBOmJe2qc3rY4GQgO4/idyD9iHvqU/G+MlQTKYr62rN/TE4XM3b+eeAE
 8V/Wrshnd4hDLdIc8PvPtjiiMlHaV5TO/QQjMzUf3SfIxf5RLFtykFEq/
 jTGU+d/vOLEL9ctwfLbB/igqwAEsaMVKrAAHkg4Xp6h1X5qv/w5t94gKS
 v9NPSrXPHJQlpe4CryyEA4dBHVuy4b5Dy/FTxJVWvmIPtAuqjslOuq4AF
 AYpFdauLgdMWVYuaDu0VFnVjM7pko4dugrb9hdgEP3Y1moBBF1zX4AIpV
 2gFtjEQFmhMOE/OKuD481kvm4P+72fQ1mQJQc1lthNFETs3p1Hof/Viml g==;
X-IronPort-AV: E=Sophos;i="5.87,256,1631548800"; d="scan'208";a="290321722"
Received: from mail-dm3nam07lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hgst.iphmx.com with ESMTP; 23 Nov 2021 13:33:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oImJuadIkzf5p1Rhj7WVj+SybXYg4z3pP3UGl762AP95VqeObtB/VYAUYi67ofygkAyyOi/JMdFkFsIVYK+jGDiIC54yocz3Q4ek1tM0lFTLY8wv1AGC5qsXkHU3u3/0GEz6qcMog53nuNOFUTsxiXpzZ0v98o6R5gNeqCXBeVROpuotOaQy3r5QHnoNnS1iRLyr6RwxuMz8zpZYSx1RvdWZwvDjSubvqXR9B4LCvCl2B8UKS58qvAhn+XbNIypTFDLjZLRsao8gCcXOzjXKZzEd4ieRtfU4HwpIz96hZgNjZqPIominKHNLLqTiJpH0QVvezvFbvTSEgqmitAdTsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/+VrmQI2AXXu4mwGjSfYizL1pmVhtc4JXbQibVzPIc=;
 b=IH9VBI6eKC8u1m4m8Pi+Ng0NKkNtosZMccf+kpW485+fwEz2pQqnFOnWcVz5RS+fzHhbRFTqMjlbS/NB91sQU7q2JINGFrVN1lCH4yBigD4Fk1MGfDbUBbF5uLIrZ1kx1l909HvtrOroeqfn6DyZyfMJKl109RbEe0QnMEHD2MQhiuqXVF3jvMMZ1us0tmpOrDRzC/DaqITJhG3wysIfBDKwUz3oe4HjKCs+WdOIvWMGSzY7te1OMtd6+KR9LnWvNw0Ew5fYO9Vsj5fPP7bchfKRqq/RDdc5pwssMeZRwXURVHwGIKwZ0ouaieJySrQid6MQXOYYaXe/6GGQjB4p9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E/+VrmQI2AXXu4mwGjSfYizL1pmVhtc4JXbQibVzPIc=;
 b=dLUrxsgcclHOHWHpquz0WtZrmjGcSrYeQOe868kcDAxzeH3f7nNsgDfx/2WFaAjjKTvtOseerfaIeVpsTmgV4TR9z8lbgKXqVn2olwzePOLjikMetmRaCDvuvDZSaJKBojycWXpYSotn2i89igaCCA71BXKQDzzXdsoHeiGo6sk=
Received: from CO6PR04MB7812.namprd04.prod.outlook.com (2603:10b6:303:138::6)
 by CO6PR04MB7794.namprd04.prod.outlook.com (2603:10b6:303:13f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Tue, 23 Nov
 2021 05:33:24 +0000
Received: from CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97]) by CO6PR04MB7812.namprd04.prod.outlook.com
 ([fe80::8100:4308:5b21:8d97%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 05:33:24 +0000
From: Anup Patel <Anup.Patel@wdc.com>
To: Sean Christopherson <seanjc@google.com>, Adam Borowski
 <kilobyte@angband.pl>, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt
 <palmer@dabbelt.com>
CC: "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko]
 undefined!
Thread-Topic: ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko]
 undefined!
Thread-Index: AQHX38Rdi5L3lQSyy06+WJhfqrMn7KwP340AgAEUYgA=
Date: Tue, 23 Nov 2021 05:33:24 +0000
Message-ID: <956FCFEA-AB88-495B-B4CD-F3FB410A4270@wdc.com>
References: <YZvP3AuTdEdje/IY@angband.pl> <YZvipLmkQQZ3va8F@google.com>
In-Reply-To: <YZvipLmkQQZ3va8F@google.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.55.21111400
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89795a59-9129-4f76-8791-08d9ae42c50a
x-ms-traffictypediagnostic: CO6PR04MB7794:
x-microsoft-antispam-prvs: <CO6PR04MB77943C8E361F49DC629B99928D609@CO6PR04MB7794.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EEGdoy8HcBtP1RujIYIcSlmorOLmnCVAUM/Mvkmbb2MJVUeLiGA0+mglZRBBin49ZMUz2/8VBozpbrxlYyfKYR4+D2zSou1Qf5YCSH+4shDYDIzkMcklPY15cTHskyaJPPIxmCEp22WQjVKVaHJFWl3RSsutdPIgPLHlbD2dRp6f1qnU9StOJyvw8573/lOBRaeZlEkJTNKMYuJXgf/rRx9zL/80QnpU2dLX479n4Pjgcn0y4uxVs0FnWoHplJCRl5udbhigULE7YcdkAkelSU7y5EfrJGRGsohzQLHEJBof7Wti/TBewj+IbODzvW19fQrf6vfxxLEyAc1+YYyfx6hMQ/D0Yz+6TWufhQA5loj405QbFMxFOow3hArBiDmhT3eN1Mmn2Qd8aZhAmyXBjXQ4LnC07dSvxgLdA3REC9Q6KoLbutQvbke40uQyVR8Vye0y2K351jfVRFL4iaNPhJBFrxsJFYcQCr/1pxydpy1J9khzgEioqCiCTF9CGBruI6/vexjZVXfyI/wqUc2KujvgILs6xjJ3Np5TLwHZMPiWX7S/USLqPT4Qx5xUsIrVd/CAO+SKMY1xbp+4ug2eri38sgdcTfezbjNZdvDF2mCTieQOFzVLrpeQ1P+55y3L7qz/ruVwWsQMGmBZbuzYZJxmrDYHRumKdG/KbyphrDWr145Ocjpc/L/YseTJdahmoj4D60QsIGPm9GV323fGqJdr0+5l3MaaTcswnWByQ88=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR04MB7812.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(36756003)(54906003)(26005)(6506007)(186003)(8936002)(64756008)(5660300002)(4326008)(6486002)(8676002)(508600001)(38100700002)(2906002)(6512007)(82960400001)(2616005)(86362001)(83380400001)(91956017)(66476007)(110136005)(76116006)(66946007)(71200400001)(316002)(33656002)(38070700005)(66556008)(53546011)(66446008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFhBWXNGMHBpaFBWY1ZsYzJxc3oxdUFNWk91ZFB0bnB0YUNOMnlkMForc2hW?=
 =?utf-8?B?UHEwRkJxTTY3cWRXaUpvUmM1QWVtVEhTWWN2M2RjL2ZzRzRTSlJINEY4M3Ja?=
 =?utf-8?B?KzZRZ3VoY0hpaGRUQjdDaTJGTVg2empHSFp5dWRMaFVZTGs0K1ptMWpLcW1l?=
 =?utf-8?B?KzRYY2VQelJkaE96dURkU1BMZHlYY3p4clA3UFVvcng2Q3BtT2hrZWVxWk1P?=
 =?utf-8?B?RkhpYWlHVHRiN0ljdC9qT3Z2QkEvOUtIZmtnT0dPMkNTUVFyMERDdzZPbjhm?=
 =?utf-8?B?emx4eFR6Ym9nazFzakI5TXd6Slg4dGE4VThFU1lkcTRXZW4rTysxMlVzYkxH?=
 =?utf-8?B?Q2RxZmtNWmI2RHAyd3BIUlJnSmdJUE5PVWJ3TmJIKzdIZUJ5cWFQVzBTbjBC?=
 =?utf-8?B?OFdKNDIralFDWWt4QnZqMzNEcXRETFZSV2MzOFl1TlI5V3UwV1lQU2xKaVE1?=
 =?utf-8?B?cEI3aklXK2FHbDh6VVY3VE5Na2R2MWZ0eUhyOVVLWEVYN1RTaFpSTHZ0TzJh?=
 =?utf-8?B?RTZlWW80N0s2WmsvV0Rkb1hGUS9qb1ZSTEhMTDFiYnFkSWdvS0dmb0FXSldS?=
 =?utf-8?B?VzR0bW16NnNSSzFKK2lmWFhsekpnYnB6TnUyNUtPOFl1NDdqMVlseldWNjBH?=
 =?utf-8?B?cC83WXVoL1lqZGpIMUw3Syt5OG9KekRwaVFZVVdjWEF3QVA5OWQvNWg3eHpN?=
 =?utf-8?B?ampZeWhFcDFiWmliditlVm5FSk9CNzkwTEEzaWZaUWluUXpLUzJNN0gvcnRU?=
 =?utf-8?B?bFd1NWIwOHF1eWpZbGVDbGt3N2JSWEVkWHpMcmhkdlQ0bCtISXAzeVF0ZjFI?=
 =?utf-8?B?am9SSzRrRnRPZmh2RWp0TUVQS0JCY29WcFNuZGZ2d0JJTWw2WTVZU1c1d2h3?=
 =?utf-8?B?bnBqQWdNTDFSdzRsSXJZSlpvKzNFZnNGN1kvT3FFSS9WZ3M0V2o1ZENzU0Nk?=
 =?utf-8?B?UEJwVDgxeEJjY3BtYkw1ZHE3eUVpQ2xnOStIY3RoM3BiaFdLMzBZaDNtQzNH?=
 =?utf-8?B?QVlWY0RtRTFnS3B4cXAwNGpGckZDSmltclhyOStQMFBKQVdhaXM2VWp5Ykla?=
 =?utf-8?B?OXdHRndmMmtJT3dxOFJncXRlUi9mRU5LTW10anJPZ0JRYVJFdUZmb0x2KzRw?=
 =?utf-8?B?c3JUNmVlY255NUxDcE9FNkN4ZGJDRjB3cU12WVowZjFMRmtuT3JCTkFEV3Q5?=
 =?utf-8?B?ZFZIaVpKZURGL0JRd1p1S0gwWEw5MFJybEtwbE85dlE0cy8vMm5lSUN1Qndj?=
 =?utf-8?B?TzJ6SkpiUEM2c1cvb0JleWUvZFptSmMxUzJ5ZDJXR1FKMi9PZWdvUXczV29y?=
 =?utf-8?B?UHorRnVLVWtTQWZhTlZYQTJYRHphemZSS2JzNVh4amUrTzRTSkp1U0owNmlE?=
 =?utf-8?B?eC9zTGFCUStlRHpsZ01RWjliOHR6aHV0RGFHTDUrM0JjMVdvK2swUkFrUlpP?=
 =?utf-8?B?blZkOGtZVzduR0t5NWtMaTVtbGg5U1FxQlhkWm84bC9DNklGK1liaEh5ZEMz?=
 =?utf-8?B?S1VwWkIwOEFBbWwwbFNwTEtoL2F1MGdWVytrL3JHclRoWUdmeFEvaGtyMEFM?=
 =?utf-8?B?K1lhZUpyM1gwYU1ScVdJL1NmSzZaRW5RMGs4MGZtQTM4Q0VoaVdNcGxCaGdt?=
 =?utf-8?B?aTZZMHNhY2RPSTUxcGMwL25pWDJnVnl4UlBqNG9WUktNZmdYcDkwVTJ2MjBT?=
 =?utf-8?B?aGU2VjhBMXhMOW1YZXlxb3FFMnN3Y2o0dTF4SjZkdUlRRmpUM1hqdVRzQ1Rw?=
 =?utf-8?B?ZGVHdE1mSXFSTUVMTFJSREZNQ2NqNmpEWGJsVmtJVG1aTW1zVGNlN0pZRkFD?=
 =?utf-8?B?UXJlQTNrQzdDaVE2VDBKOXRZcm14RWdqZnI1OE1WZWFMc0gzdEpRN3E4R1Zv?=
 =?utf-8?B?WndLQjJQa01zU3ZQNXExYjBRc1Y1Q0NjWWZqa293Y2V6NkJxS2xIOTJ3cTFL?=
 =?utf-8?B?T053VGRqY2ZzaG5RZ3dRSFNlS0dOZVZFd3ExM2h6MloxWlhQWXNZWkZPdW0z?=
 =?utf-8?B?NEJhYzRFN2ZUekU4M0xBbWlQK2NmRzMwR0htSEhodzRQSUxXbzNWT0RwOU85?=
 =?utf-8?B?emZnSEhzanpFeDRNKzN2SlVJWU5CRFFuSWZySkU5MmxDZVlXeEpGa2h2QkM0?=
 =?utf-8?B?anQwLzJncWdYdFBiWXNMc0NOYkZVTTJhdEtLLzBOWWRKTDRJc3RQQ21iQk9K?=
 =?utf-8?Q?aNW4E3jyaI7TQRfBag908hQ=3D?=
Content-ID: <FF6CA2A564949C448F297DC05E518197@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7812.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89795a59-9129-4f76-8791-08d9ae42c50a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 05:33:24.5994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BvCh7tdRlN8Tl2jROya/KmNx9gMDB3evRy+ASIpvqbgCgCnfkI7eJhceo0S3czo7eIViF9Q32piv3y2M/T8oIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR04MB7794
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_213330_084243_5E4E0CF5 
X-CRM114-Status: GOOD (  26.93  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

K0F0aXNoLCArUGFsbWVyDQoNCu+7v09uIDIzLzExLzIxLCAxMjowNCBBTSwgIlNlYW4gQ2hyaXN0
b3BoZXJzb24iIDxzZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6DQoNCiAgICBPbiBNb24sIE5vdiAy
MiwgMjAyMSwgQWRhbSBCb3Jvd3NraSB3cm90ZToNCiAgICA+IEhpIQ0KICAgID4gV2l0aCBDT05G
SUdfS1ZNPW0gYW5kIENPTkZJR19TTVA9biwgdGhlIGJ1aWxkIGZhaWxzIHdpdGg6DQogICAgPiBF
UlJPUjogbW9kcG9zdDogImJvb3RfY3B1X2hhcnRpZCIgW2FyY2gvcmlzY3Yva3ZtL2t2bS5rb10g
dW5kZWZpbmVkIQ0KICAgID4gDQogICAgPiBBbiBvYnZpb3VzIGZpeCB3b3VsZCBiZSB0byBjaGFu
Z2UgcmlzY3ZfY3B1aWRfdG9faGFydGlkX21hc2soKSBmcm9tIGENCiAgICA+IHN0YXRpYyBpbmxp
bmUgZnVuY3Rpb24gdG8gYSByZWFsIGV4cG9ydGVkIHN5bWJvbA0KDQogICAgQW11c2luZ2x5LCB0
aGUgIVNNUCB2ZXJzaW9uIGlzIGJ1Z2d5IGFzIGl0IGFzc3VtZXMgdGhlIGJvb3Qvb25seSBDUFUg
aXMgaW4gdGhlDQogICAgdGFyZ2V0IG1hc2ssIHdoaWNoIHdpbGwgbm90IGFsd2F5cyBiZSB0cnVl
LCBlLmcuIGlmIGEgVk0gaGFzIG1vcmUgdkNQVXMgdGhhbiB0aGVyZQ0KICAgIGFyZSBwQ1BVcyBp
biB0aGUgc3lzdGVtLCBrdm1fcmlzY3ZfdmNwdV9zYmlfZWNhbGwoKSBjYW4gc2VuZCBpbiBhIG1h
c2sgd2l0aG91dCBhbnkNCiAgICBDUFVzIHNldC4gIEV2ZW4gaWYgdGhhdCdzIHNvbWV3aGF0IG9m
IGEgYm9ndXMgdXNlIGNhc2UsIGFyZ3VhYmx5IGEgY29tbW9uIGhlbHBlcg0KICAgIHNob3VsZG4n
dCBoYXZlIGRpZmZlcmVudCBzZW1hbnRpY3MgZm9yIFNNUCB2cyAhU01QLg0KDQogICAgPiBidXQg
SSB3b25kZXI6IGlzIHRoZXJlIGEgcG9pbnQgaW4gYWxsb3dpbmcgc3VjaCBjb21iaW5hdGlvbnMg
dGhhdCBubyBvbmUgd2lsbA0KICAgID4gdGVzdD8NCg0KICAgIEVoLCBldmVuIGlmIHRoZXJlIGlz
IGN1cnJlbnRseSBubyBrbm93biB1c2UgY2FzZSwgdW5sZXNzIHRoZSBmaXggaXMgcmVhbGx5IG5h
c3R5LA0KICAgIHRoZXJlJ3Mgbm8gcmVhc29uIHRvIGFjdGl2ZWx5IHByZXZlbnQgYSBwb3RlbnRp
YWxseSBsZWdpdGltYXRlIHVzZSBjYXNlLiAgQnV0IGl0J3MNCiAgICBzb21ld2hhdCBvZiBhIG1v
b3QgcG9pbnQgYXMgdGhlIGVhc3kgZml4IGlzIHRvIHVzZSB0aGUgU01QIHZlcnNpb24gZm9yIGJv
dGggY2FzZXMuICANCg0KICAgIEkgdGhpbmsgdGhpcyB3b3VsZCBiZSBhbiBhcHByb3ByaWF0ZSBm
aXg/DQoNCg0KICAgIEZyb20gZjY1MTBhY2Q2OGZlYjkwYWEzZWMzOTMwMzFjYmNkZTcyNWM1MjQy
MCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCiAgICBGcm9tOiBTZWFuIENocmlzdG9waGVyc29u
IDxzZWFuamNAZ29vZ2xlLmNvbT4NCiAgICBEYXRlOiBNb24sIDIyIE5vdiAyMDIxIDEwOjAxOjE1
IC0wODAwDQogICAgU3ViamVjdDogW1BBVENIXSBSSVNDLVY6IFVzZSBjb21tb24gcmlzY3ZfY3B1
aWRfdG9faGFydGlkX21hc2soKSBmb3IgYm90aA0KICAgICBTTVA9eSBhbmQgU01QPW4NCg0KICAg
IFVzZSB3aGF0IGlzIGN1cnJlbnRseSB0aGUgU01QPXkgdmVyc2lvbiBvZiByaXNjdl9jcHVpZF90
b19oYXJ0aWRfbWFzaygpDQogICAgZm9yIGJvdGggU01QPXkgYW5kIFNNUD1uIHRvIGZpeCBhIGJ1
aWxkIGZhaWx1cmUgd2l0aCBLVk09bSBhbmQgU01QPW4gZHVlDQogICAgdG8gYm9vdF9jcHVfaGFy
dGlkIG5vdCBiZWluZyBleHBvcnRlZC4gIFRoaXMgYWxzbyBmaXhlcyBhIHNlY29uZCBidWcNCiAg
ICB3aGVyZSB0aGUgU01QPW4gdmVyc2lvbiBhc3N1bWVzIHRoZSBzb2xlIENQVSBpbiB0aGUgc3lz
dGVtIGlzIGluIHRoZQ0KICAgIGluY29taW5nIG1hc2ssIHdoaWNoIG1heSBub3QgaG9sZCB0cnVl
IGluIGt2bV9yaXNjdl92Y3B1X3NiaV9lY2FsbCgpIGlmDQogICAgdGhlIEtWTSBndWVzdCBWTSBo
YXMgbXVsdGlwbGUgdkNQVXMgKG9uIGEgU01QPW4gc3lzdGVtKS4NCg0KICAgIFJlcG9ydGVkLWJ5
OiBBZGFtIEJvcm93c2tpIDxraWxvYnl0ZUBhbmdiYW5kLnBsPg0KICAgIEZpeGVzOiAxZWY0NmMy
MzFkZjQgKCJSSVNDLVY6IEltcGxlbWVudCBuZXcgU0JJIHYwLjIgZXh0ZW5zaW9ucyIpDQogICAg
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCiAgICBTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlz
dG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4NCg0KWWVzLCB0aGlzIGZpeCBsb29rcyBnb29k
IGZvciBub3cuDQoNClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQHdkYy5jb20+
DQoNCkFzIGEgc2VwYXJhdGUgc2VyaWVzLCB3ZSBoYXZlIHRvIHRvdGFsbHkgcmVtb3ZlIHJpc2N2
X2NwdWlkX3RvX2hhcnRpZF9tYXNrKCkNCmJlY2F1c2UgdGhpcyBmdW5jdGlvbiBpcyBnb2luZyB0
byBicmVhayBmb3Igc3BhcnNlIEhBUlQgaWRzLiBJbiBmYWN0LCB3ZQ0Kc2hvdWxkIGF2b2lkIHVz
aW5nICJzdHJ1Y3QgY3B1bWFzayIgKHdoaWNoIGlzIGxpbWl0ZWQgYnkgTlJfQ1BVUykgZm9yDQpy
ZXByZXNlbnRpbmcgc2V0IG9mIEhBUlQgaWRzLg0KDQpAU2VhbiwgY2FuIHlvdSByZS1zZW5kIHRo
aXMgcGF0Y2ggdG8gdGhlIExpbnV4IFJJU0MtViBtYWlsaW5nIGxpc3QgPyBJdA0Kc2VlbXMgdGhp
cyBlbWFpbCBkaWQgbm90IGxhbmQgY29ycmVjdGx5IGZvciBBdGlzaCBhbmQgb3RoZXIgZm9sa3Mu
DQoNClJlZ2FyZHMsDQpBbnVwDQoNCiAgICAtLS0NCiAgICAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zbXAuaCB8IDEwICsrLS0tLS0tLS0NCiAgICAgYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyAg
ICB8IDEwICsrKysrKysrKysNCiAgICAgYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMgICAgICB8IDEw
IC0tLS0tLS0tLS0NCiAgICAgMyBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxOCBk
ZWxldGlvbnMoLSkNCg0KICAgIGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Nt
cC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zbXAuaA0KICAgIGluZGV4IGE3ZDI4MTFmMzUz
Ni4uNjJkMGU2ZTYxZGE4IDEwMDY0NA0KICAgIC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
c21wLmgNCiAgICArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oDQogICAgQEAgLTQz
LDcgKzQzLDYgQEAgdm9pZCBhcmNoX3NlbmRfY2FsbF9mdW5jdGlvbl9pcGlfbWFzayhzdHJ1Y3Qg
Y3B1bWFzayAqbWFzayk7DQogICAgIHZvaWQgYXJjaF9zZW5kX2NhbGxfZnVuY3Rpb25fc2luZ2xl
X2lwaShpbnQgY3B1KTsNCg0KICAgICBpbnQgcmlzY3ZfaGFydGlkX3RvX2NwdWlkKGludCBoYXJ0
aWQpOw0KICAgIC12b2lkIHJpc2N2X2NwdWlkX3RvX2hhcnRpZF9tYXNrKGNvbnN0IHN0cnVjdCBj
cHVtYXNrICppbiwgc3RydWN0IGNwdW1hc2sgKm91dCk7DQoNCiAgICAgLyogU2V0IGN1c3RvbSBJ
UEkgb3BlcmF0aW9ucyAqLw0KICAgICB2b2lkIHJpc2N2X3NldF9pcGlfb3BzKGNvbnN0IHN0cnVj
dCByaXNjdl9pcGlfb3BzICpvcHMpOw0KICAgIEBAIC04NSwxMyArODQsNiBAQCBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgY3B1aWRfdG9faGFydGlkX21hcChpbnQgY3B1KQ0KICAgICAJcmV0
dXJuIGJvb3RfY3B1X2hhcnRpZDsNCiAgICAgfQ0KDQogICAgLXN0YXRpYyBpbmxpbmUgdm9pZCBy
aXNjdl9jcHVpZF90b19oYXJ0aWRfbWFzayhjb25zdCBzdHJ1Y3QgY3B1bWFzayAqaW4sDQogICAg
LQkJCQkJICAgICAgc3RydWN0IGNwdW1hc2sgKm91dCkNCiAgICAtew0KICAgIC0JY3B1bWFza19j
bGVhcihvdXQpOw0KICAgIC0JY3B1bWFza19zZXRfY3B1KGJvb3RfY3B1X2hhcnRpZCwgb3V0KTsN
CiAgICAtfQ0KICAgIC0NCiAgICAgc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3NldF9pcGlfb3Bz
KGNvbnN0IHN0cnVjdCByaXNjdl9pcGlfb3BzICpvcHMpDQogICAgIHsNCiAgICAgfQ0KICAgIEBA
IC0xMDIsNiArOTQsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgcmlzY3ZfY2xlYXJfaXBpKHZvaWQp
DQoNCiAgICAgI2VuZGlmIC8qIENPTkZJR19TTVAgKi8NCg0KICAgICt2b2lkIHJpc2N2X2NwdWlk
X3RvX2hhcnRpZF9tYXNrKGNvbnN0IHN0cnVjdCBjcHVtYXNrICppbiwgc3RydWN0IGNwdW1hc2sg
Km91dCk7DQogICAgKw0KICAgICAjaWYgZGVmaW5lZChDT05GSUdfSE9UUExVR19DUFUpICYmIChD
T05GSUdfU01QKQ0KICAgICBib29sIGNwdV9oYXNfaG90cGx1Zyh1bnNpZ25lZCBpbnQgY3B1KTsN
CiAgICAgI2Vsc2UNCiAgICBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYyBi
L2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMNCiAgICBpbmRleCBiOTYyMGU1ZjAwYmEuLjZjNWNh
ZjVlYjkwNiAxMDA2NDQNCiAgICAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jDQogICAg
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYw0KICAgIEBAIC01OSw2ICs1OSwxNiBAQCBh
dG9taWNfdCBoYXJ0X2xvdHRlcnkgX19zZWN0aW9uKCIuc2RhdGEiKQ0KICAgICB1bnNpZ25lZCBs
b25nIGJvb3RfY3B1X2hhcnRpZDsNCiAgICAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCBj
cHUsIGNwdV9kZXZpY2VzKTsNCg0KICAgICt2b2lkIHJpc2N2X2NwdWlkX3RvX2hhcnRpZF9tYXNr
KGNvbnN0IHN0cnVjdCBjcHVtYXNrICppbiwgc3RydWN0IGNwdW1hc2sgKm91dCkNCiAgICArew0K
ICAgICsJaW50IGNwdTsNCiAgICArDQogICAgKwljcHVtYXNrX2NsZWFyKG91dCk7DQogICAgKwlm
b3JfZWFjaF9jcHUoY3B1LCBpbikNCiAgICArCQljcHVtYXNrX3NldF9jcHUoY3B1aWRfdG9faGFy
dGlkX21hcChjcHUpLCBvdXQpOw0KICAgICt9DQogICAgK0VYUE9SVF9TWU1CT0xfR1BMKHJpc2N2
X2NwdWlkX3RvX2hhcnRpZF9tYXNrKTsNCiAgICArDQogICAgIC8qDQogICAgICAqIFBsYWNlIGtl
cm5lbCBtZW1vcnkgcmVnaW9ucyBvbiB0aGUgcmVzb3VyY2UgdHJlZSBzbyB0aGF0DQogICAgICAq
IGtleGVjLXRvb2xzIGNhbiByZXRyaWV2ZSB0aGVtIGZyb20gL3Byb2MvaW9tZW0uIFdoaWxlIHRo
ZXJlDQogICAgZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NtcC5jIGIvYXJjaC9yaXNj
di9rZXJuZWwvc21wLmMNCiAgICBpbmRleCA5MjFkOWQ3ZGY0MDAuLmQwMTQ3Mjk0NjkxZCAxMDA2
NDQNCiAgICAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYw0KICAgICsrKyBiL2FyY2gvcmlz
Y3Yva2VybmVsL3NtcC5jDQogICAgQEAgLTU5LDE2ICs1OSw2IEBAIGludCByaXNjdl9oYXJ0aWRf
dG9fY3B1aWQoaW50IGhhcnRpZCkNCiAgICAgCXJldHVybiAtRU5PRU5UOw0KICAgICB9DQoNCiAg
ICAtdm9pZCByaXNjdl9jcHVpZF90b19oYXJ0aWRfbWFzayhjb25zdCBzdHJ1Y3QgY3B1bWFzayAq
aW4sIHN0cnVjdCBjcHVtYXNrICpvdXQpDQogICAgLXsNCiAgICAtCWludCBjcHU7DQogICAgLQ0K
ICAgIC0JY3B1bWFza19jbGVhcihvdXQpOw0KICAgIC0JZm9yX2VhY2hfY3B1KGNwdSwgaW4pDQog
ICAgLQkJY3B1bWFza19zZXRfY3B1KGNwdWlkX3RvX2hhcnRpZF9tYXAoY3B1KSwgb3V0KTsNCiAg
ICAtfQ0KICAgIC1FWFBPUlRfU1lNQk9MX0dQTChyaXNjdl9jcHVpZF90b19oYXJ0aWRfbWFzayk7
DQogICAgLQ0KICAgICBib29sIGFyY2hfbWF0Y2hfY3B1X3BoeXNfaWQoaW50IGNwdSwgdTY0IHBo
eXNfaWQpDQogICAgIHsNCiAgICAgCXJldHVybiBwaHlzX2lkID09IGNwdWlkX3RvX2hhcnRpZF9t
YXAoY3B1KTsNCiAgICAtLQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
