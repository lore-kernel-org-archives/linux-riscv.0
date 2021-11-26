Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C46C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1mfygYjhctFvHEJu9KV8Ixju6d3y6pp5beIa1SZzwgA=; b=S0vTnhYXknu8Zt
	+u/+Qhxc6c4TXgZylp2xU+ZQG90vh2kVT9PIaw6N3J1CXRQHaqoNOZLLzP1zcRNhb6VR83/fiGgDi
	F1J0awdlw55ICBLgMf0b54fHDa8iQLcJ01VphA2AEqD53N1OdmJxB7CBbJpHzKpL+9DFjDL38wAcv
	r91u+4juvKarMHhvWPA7vzaoGvaaMF656e7NjrHPL9sYz/aPhzctklRzp0DIstcBL5NyulL0QWUhg
	3rTY75xC2mzksU2yV1ugsBzCaYV/lUPsCbP4qHJZkqCDpYKbGvX/7GaNodLtfzvcvEyox/x91E2ny
	V/mVxSyUvouEConOg27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqa3o-00AIOw-BV; Fri, 26 Nov 2021 12:10:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZfq-00ACuq-Er
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 11:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1637927150; x=1669463150;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z7XXlcFc8E95zhWzoosw8CN4nmdlsvGOZrfbiJBCdVc=;
 b=B7mevbShD5kk8xVDP8L/EoGItyabeOoSnd/ZN7dY18qpxVsPOFuwyCR9
 DYFciSwPj6tnsZ8UjYQv7Oa+Tyd0RNsFdQpvk51C1nkJPLRMy2KT8CTtP
 WBv2zx0a1v2p5k0MfhiblnlTfyD4Qfk1RbaYd8cVv+zLPRi3dKd1lzr3m
 FJNWHxLXa0h6qq+s32epkMywIniy7G7PJrabQMu+g9T5v1Ph34M1aEZMX
 /yVLjx+uO93Ahla/Q1zSce9J4zn1aFjCFjh9DdpTD4dzaYUFpUHAolq+/
 jEBwWdyRigKj6zem2fkMHX7IULmjOih6dhNqXbW2DesDlsyhoR6P1/e88 w==;
IronPort-SDR: 5RWvZGuWspQMAwEmA9q4XlxyNCKBoeQQscJBs2+9NtD3PMBrPD2P91Ci9iuR3T7j8Sqih7+7G3
 qGOHT50kVXm6Krq/s1BTmVjPgXEdUmc4krHFIKiRJfTjoOEx7fupfRG/sMuxh8Azi4ClF374Lo
 GPi+UvMh1YOz4/o1tPk/Jmwu5snWRTphc2dTIzUWFSooKdHGBqBvp5uvrL/KVz/aaqDG3PovlB
 IWAnhtHyS2LTOZkwOTYJaxBUrWPvRnlnWolZpELME3KqKHNABUiqT2lX14+ZKFGlVm6XyfH2+2
 +xwt2uxEbVVOASdYsNaJmhju
X-IronPort-AV: E=Sophos;i="5.87,265,1631602800"; d="scan'208";a="140397258"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 26 Nov 2021 04:45:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 26 Nov 2021 04:45:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14 via Frontend Transport; Fri, 26 Nov 2021 04:45:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbVHwporWjfZDA967UhPm7KXomyhGnXhrrri1AtwxXs2aBfhZsqYr+CvT4hKujMg5us1HAW/RE8PFKLCWbv+7ZtSYontwRCSWn7SFRxt4dgZu5xXmFIBJxTB+L/gJ+0ueEoLTb5ADCQY9lPxLARVc8rbfBdGHLAQlVbNn/ozCZV73r4W/EVeJMqgII3gBbBRN8igkqr1R3+prC+HXRrEvgt9jDRHsM5adKBXkAmprVloG2ZQsxrVbYSCP66CcDEkdgqbumtHEFCQiKelqtRXR74HWVkCggYYejDtk0H8+nOs6rA1lgqWyEGXn2O3Gq/d5uNV4iaGDoj1NQ8Jc/Kh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7XXlcFc8E95zhWzoosw8CN4nmdlsvGOZrfbiJBCdVc=;
 b=DWRGp+oVU7/jd3T56ba1L9OUt0buGNQrAtwg/C3G+SJb5fG0a5DAPqTEus169z8ACLpXPQXep7P98AZnEuigIm+347udsCKmXsJkWyugXphcE0QIESCGZ6or8fHTwFG+Jc35gOqzvJQxc23SBxh68GzS1a7tpVFstzS0iX5ju6UFAKLgE8fCK0//K70ZuANTHMkccuLMQvMuWi4Er3+zCJhoeufuZlQ+js5CoJ9ceH0KE0TQewJeIB/eMF0ftoZYXRzakc/h30/1WN5gFhxU/tN0B84MdQEWGCaj4GDjxWQORCWpq0kFjWPilgFMLwUMamvX9JkxcWQYH9gJWBJERw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7XXlcFc8E95zhWzoosw8CN4nmdlsvGOZrfbiJBCdVc=;
 b=FNUZEArNo2GILwQSltq891woTbGszEaeA68AKo1F64slwcTRLw/A2IeEFcoFB9U7vjAFnvuOjLx2k3vUDv10Ou+IIFon1CtCNIygCr4LsRL2C8spwdOicdFx/iNXZFEY4BwQiUsaYZe52hT0AKiY6KrIJ1yjBashoAMMqbHXbh8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1776.namprd11.prod.outlook.com (2603:10b6:300:110::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 26 Nov
 2021 11:45:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::f579:5f0c:dfab:2d27%6]) with mapi id 15.20.4734.023; Fri, 26 Nov 2021
 11:45:41 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>, <robh+dt@kernel.org>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <damien.lemoal@wdc.com>,
 <Lewis.Hanly@microchip.com>, <krzysztof.kozlowski@canonical.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 3/9] riscv: dts: microchip: mpfs: Drop empty chosen node
Thread-Topic: [PATCH 3/9] riscv: dts: microchip: mpfs: Drop empty chosen node
Thread-Index: AQHX4hGNfjV/r9Bpv0aEqCLuJ5BLYawVsoYA
Date: Fri, 26 Nov 2021 11:45:41 +0000
Message-ID: <a5703e2e-bd53-e2f3-3f6f-a212f8a91ce4@microchip.com>
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-4-geert@linux-m68k.org>
In-Reply-To: <20211125153131.163533-4-geert@linux-m68k.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 856902b2-5634-4435-f1d2-08d9b0d245e9
x-ms-traffictypediagnostic: MWHPR11MB1776:
x-microsoft-antispam-prvs: <MWHPR11MB1776A990050DE00BFA90F5D498639@MWHPR11MB1776.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Iuet+z4AnneAwpC+LNgiSr+Bn+oPHWPLNGLB+8ByDpAXCzAy7+KbIra7dhInQr+FNfshb+uDgoiewd1O4bJTaeLX8vFzKDdoewzK91lEtdFHD7nJuJpJHPBEbrOaB2A333SfFCCsUDviWnDu6tJ+xnfNq5UvH5E4IlhgF44XBEMM5K0X1ss9I82Tpsn/XKRStaR9se5qtCi75ogKAlJHBSXS3HTuW18D0pAieEbOWhwuzseiLPlndbjFYYFVVOgBFxz+9nrZyyXThTYJEtqSuM7tiYvB5Pb+knWD+M02vgCVp3IDXbXaG1zgg7w67lbTNMsLG2IlTwCHURXXEwZQfnjm6emv5T9OhH1CAP+MAEj/3tsNUhylaPHRIJrqiGILWj7uRkTrrQy4Qv6NhqXyp1wRqpunenrLkLU33hv3ddvxQs71Xdj52rRfrXvigOqC2J5n/sIKE/Eo5dj9zZyBQM2ujkuMQVD7fhWnqs9CieP7YO5lY/9b57R5XAfPRREK/CFPaz5A7++XUkcg45t3EPZbqSd6MR0YSsu5/vU8ftiSEpmITNiYslv/5rYb4L8Mu0pRVNxPdt/FEPsrVL93yIHuNUN4FMvdiesh6kQkX8PqLKQHVWHtydPd4heRWy6gWVlGPjZtJG3LrqDIkW4DzAw7wx3xhXyzd2CFhL6YuN39gcZIJS1H+Gp7BUHJOtpi3wikOVk4YEo13ZrKY/jPcuVMUbcaYNT+2fN081kyj0ZN/w7QCEEjWgdeNi0xJQO56h0j/a8v8ENffojhZ0iVsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(66476007)(66556008)(64756008)(66446008)(76116006)(91956017)(66946007)(186003)(122000001)(6506007)(4744005)(31686004)(26005)(6486002)(31696002)(5660300002)(53546011)(83380400001)(86362001)(36756003)(508600001)(2906002)(38100700002)(8936002)(54906003)(110136005)(316002)(4326008)(6512007)(2616005)(8676002)(71200400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVVtaUJ3dWlNekVXYjFMQnZXYzRsS1BKRkZXZlFxZmpNWGZyZGw5UU01OUFD?=
 =?utf-8?B?V0NIa2tNaUZjcm51dzlpYWlQNkN1OTE5MXE0b1R2bUJxbWVtSVV3SldyMWhB?=
 =?utf-8?B?VTF4RlVSa2RNelE0UE4wODQyY1U1RWVSVzhFYmd3MndFUDh1QW9CU0d6N2pl?=
 =?utf-8?B?MXNaOWdtS2lYNmlFaXpuakIwb3dNZWFOSTRaTERtUDdSdEpoeHNvQnZTUVZX?=
 =?utf-8?B?Y1EvMEhwVkZwdStNaUNScGUvbXRCcG9FdHRRSG5IUFl1SW5CU0xUd1hybWFU?=
 =?utf-8?B?YzNuMDBPbkJ5cG54ZHdHNXUwSjNjL1BnNE1GaGVoTnhOOUdyM2Z2d1BPeDlR?=
 =?utf-8?B?bDJrMDgza0ZacktuZVhuVzZOTmk3TEc1bjFJSVk2YzF6azBzam9ic2RMbTM3?=
 =?utf-8?B?YmczaUhZalVQbzFwYUxyaEkxMzdYWjNXOW9oZzh1c1R1UVd0ZEhLL0ZvS2xu?=
 =?utf-8?B?TjNVZFEwQkE5NTBjOGVnMVNOYnZVSVRQQmp0N1FsRG04S2FkeEFXOGlZSFV3?=
 =?utf-8?B?eWpzdkFrbDNrZmZWaDRnV2swQWVUS3V1RDkzRGJ1WnlBZ1lNMTZXZFlpeGNI?=
 =?utf-8?B?UEZEM1BnQWYrTWZDU25HV2hzTmk2MS9WS2swMXhzVmtVYXdUeWNKYkZvbFBY?=
 =?utf-8?B?ZEZDMUpzZXFqZWpiYTVWaUVTK1VTVUVMUllKQktpaWx0TDVpa0JUUk9IUjA3?=
 =?utf-8?B?T2FxTHZKQWE2YUovS0ttRDJIT0tMQ2srbE1HOUx3Q0FMaWV6dk0vQVUwYXEy?=
 =?utf-8?B?MWNDclBxRHpTTXJCVDJMYms0SHhRWnRqSHFKVnhXQzhaSGpFV0d6RFpWaTZB?=
 =?utf-8?B?MXNNWkhQbmhpY3NCdlBiZWhFcUFKZXcwbWFRVXRMelowdmFhZTIyNGNjWXgv?=
 =?utf-8?B?UVgwTGRqZ1pvVEtkZEp1MlN5eitVL1U5LzdSeENuemxER01NdU44a2dQTno5?=
 =?utf-8?B?VEV5U0ozekxUbWxjOGRzTnBRQ1dXUEI4RUpCbS8xdVFDT0VOWDl3b25wSWZi?=
 =?utf-8?B?aXl4Ull2aWJxcW11bm5pMEM2SHRnZWs2cVRMMW5UOHdocE1oSmRKN1F4Qk40?=
 =?utf-8?B?aUtMOSthdkpxdmFEdmpkU3ZYbnp6aS8rVkt2TTBhM296U083MjRPU0U3V2ts?=
 =?utf-8?B?TmdnYkI5d0dJQktNRGV4ZWMwb0p5Z2hJbHF4NzU5TjE4TFROR0NZYU5lM1Vi?=
 =?utf-8?B?ZC9MSXQwZUcrbUFUSXhqUVppVGJNaTAyUXl6WXVjVU9UTkx1WHYwQVZUejZZ?=
 =?utf-8?B?bkNSVkkxLzNRVXJXNVBkdnJza1p3OS9pb0JnTUJ4U2VqNTUvK1hOL2JvUjVM?=
 =?utf-8?B?NGtLalBYbTFyQ3IwelRVMG9ndS9CNkVqb0YyNnZJbVpYWjhobk5EL3VVRzRM?=
 =?utf-8?B?S2JHRTBwMklpS1BVcDJwaGZlTi8vNkNyMTZBanBnTU5uays5Ym1YSmdyNmxt?=
 =?utf-8?B?QVQzNE8zVFVZT0V2VFhQUlhzQWE1VXphdmlLUGVZSXNlWFNqTDhOdTREaklq?=
 =?utf-8?B?YUlGeVdDZXBaQlBjY3dHWU9UbmFVVG5iMXltRHZBN3pnc3FKbGR0K3hHT2dl?=
 =?utf-8?B?bXhJS1hiMGlhcCtMdnJ5WTlnbS80Z0dNbEEvZkpIVTBCMDJKWWwzb2J4NUxC?=
 =?utf-8?B?VmZQYk5WWVNrc2lnc3A5d1gvWW8rc3htZFdDSDQwY1YvSFhoR282Z3BuNjB6?=
 =?utf-8?B?TWdZR0lWVDVnWHdDZEFsYkdKaHZjT1hBWEtUYVFQb3BmeWFFME9yZmpYYU1h?=
 =?utf-8?B?VE5vNFhQQ2tmVE8vazY5ano5bzVHRTRyKzg1NnhRNlB5bTFNalBibGtLaUdT?=
 =?utf-8?B?M0dyYm5pNkQzZDJFa2xIWGt4Q1Z0SWc4Q1lnckwwU3BzSkU2N2c1bU83clkr?=
 =?utf-8?B?K0tyem1ubUxoVGhud05HSDYzbGhRY0I4SExwYk5qUmRUVlJMT1VxYitkMHJB?=
 =?utf-8?B?WllyUmRiWFpkQjZWZ25zV3dWZ1ZuSjIra3JicE8rQ1ZuR0JRWnoxZm01a3FO?=
 =?utf-8?B?ZDNKZkRBVFI5OFBCWU1RcDZqSkdRRXNJYTFaM3l1YmNZL05EUlpjVFQ4NWZm?=
 =?utf-8?B?SE9nbG83TExQTXdkbkNlSkhBWVE2WDA3Ri9mdlcxOHpEZXRINHNvS1N0USs3?=
 =?utf-8?B?UUtYNzdJOW5NRW0vWEp5TEJJOU9rNG5qdWJoVFZadEdmZWVOc0xVbGhnRklu?=
 =?utf-8?B?UC9ibEQ3SWJscE14akh3bnNTaXRtald0dVowdGJyV2pPR1VHTzJNV0tDZmNI?=
 =?utf-8?B?M2pMY1NNZGRjNzVybGFWSHE4NlJnPT0=?=
Content-ID: <2B8CC0247E8B2841AFA527FCD7BFDCF4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 856902b2-5634-4435-f1d2-08d9b0d245e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2021 11:45:41.0563 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wnxt6KxYOKElKuoJ5OhDo5to9m4jg5JFW+5NOwVlmJMpk2wQveJtqsSVrZSGc8rzAaYtbbwEENzAubpMKDNJmjytNp6BaaTKpZkCmuOOLMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_034550_680841_198D42C3 
X-CRM114-Status: GOOD (  11.31  )
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

On 25/11/2021 15:31, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> It does not make sense to have an (empty) chosen node in an SoC-specific
> .dtsi, as chosen is meant for system-specific configuration.
> It is already provided in microchip-mpfs-icicle-kit.dts anyway.
> 
> Fixes: 0fa6107eca4186ad ("RISC-V: Initial DTS for Microchip ICICLE board")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>   arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 3 ---
>   1 file changed, 3 deletions(-)
> 

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
