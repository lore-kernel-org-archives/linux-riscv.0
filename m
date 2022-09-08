Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDD0C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JTJzfO2yPCXC/Lf09cviFEMBVWBtj1DDmtZeEgF43i0=; b=c6wX/JPRRTTYvT
	WJMIpoGQAyjUujZltNjZ9ev1VR/UGF8jQ2hTCnrX3ewjiua1CQQ8KuPgJrg2cwd+OYLdW7ZF4L0qY
	D/YbKstWec4P4Xkx5mnc3YSYxaQeUwYJQNiOQHwGk2B0fFFLMaeywtcbhZB51lxNxD2zYlup5eet8
	Zp/91f0FItMDX3IYBjJmz4iVEvlCn/EQ7PJJwhhn7AENx7sz/8G3sYkci4ziET03Wot1wOpfedNgL
	NRSJSxXUIDp1qqhgwgtAEQez6dDkx1Pvp7syiFU2Yy5feuaI9kQxbXSHfakItiJOfE+IfdUOO/Nuy
	ta6cMvCMsEcuJLiICynw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGCU-002zz6-Um; Thu, 08 Sep 2022 12:00:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWGCQ-002ztM-W6
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 12:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662638402; x=1694174402;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hIySzQLTH2h5e8qu229VEQrAhOaRxBOf+ZmR1c+bqCI=;
  b=E/foRtKSNxmJLATQzVxXKq5nv38fba9BEx0ZJS7GN+IwbHIUdPxU5LTp
   1HeU/6l2wiMT3MOkLb8WGfH/NwkRLuJhPFk6F3G8wCwOyDfWgzCsreRKW
   dCqsmryeEeQ8A6WwWcKxYfBygZ0KloM5FfFATN2AGTehegLRLgy/fWM2g
   bUwxioqFxTOB0IuLvQ5DuVzCcehXgxGQ7XMU4gLuNqS5J06+uWD0VkQAf
   /bko6Jxe+ehCppMFKxg0T17gxUu0xzFn9XGexx1LuEjoh8SfEmvZVyAkV
   U2Poj0Ej+in+CUnj8osMO2VSh9nyteFjThq0q9be6Cd470/kOM1fhvh+Z
   w==;
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="112728922"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 08 Sep 2022 05:00:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 8 Sep 2022 05:00:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 8 Sep 2022 05:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cG5JkBtB3RkTy3uhwrNU+wzH9PyLHWv9OX0VcbyBhB4nQahLAWErUJOTMFkgXAx4ExHqYPlqxSh143mCu1ay6PDs5WgdNA97S7UTvlS/0ICRcnKm5K//TsmwVudQIskEI2nSIJikpjvG+SnZpSj1CxuaWGeTcwfU9UOq+QyRvCVi3YaHb5Xux3sqCNzBcU/bv2JdUPoCT8J/7CfPtP8jkIqLp4HzkUNddWtE8JV0N/M3VZSH8bXTZgEGSqnLIg6BzHr83ycEic+Osr4z+s5eCYBJ/tEQexhQxvTnjY3bzuPp2To11q2S2aqozM4ZwxBSsZsoYLspHiSHxLZbpwozvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIySzQLTH2h5e8qu229VEQrAhOaRxBOf+ZmR1c+bqCI=;
 b=Td1V5/TEi266hJ9+7kaa7JSG89re5tRBPqpLeR0N+AnW6TJHVoqCBcoTdy/aXPqPWwP4VPpyxcxsb7tCQc85IY1991Ng5C6ogeCvelb6yaw/mwMD13zd4ddCSxsalLD31J0IZ6LriV8HKQPHodWmXxeKVrlpf5eLyarGkcTVp8C9e+gZejleT3fnTGcJfwsPrVdqAXbXatYdD5Z7VaXhAT1QpFZaBG38QI5Mm1RM+hblPYCZ44uiW11DZqRxTy7fPgjXOcvz3/ryDFTw5lVpsconaS0gO3yN43dbg+o9lJOwtuiM5hKyK+pLkHmYdP/4noLnowLEMtWBrtQV8R6Dng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hIySzQLTH2h5e8qu229VEQrAhOaRxBOf+ZmR1c+bqCI=;
 b=FA0n9LwPiz7MFFJ6walQ/Pp3l10VOwXICoTzvCZn39P+B2P/2I4ELB7ZFZ2fFuDdG7d1/T4aCDSBtzldTU/4/fc/pZc7ZNb7KUJCPcfPXHhszRPT9molLHD68VLfkN141AgjXmlRpMVZzFi3b2N1xMjuwkClICNI359cMdOkBp0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Thu, 8 Sep
 2022 11:59:54 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 11:59:53 +0000
From: <Conor.Dooley@microchip.com>
To: <prabhakar.csengg@gmail.com>, <guoren@linux.alibaba.com>
CC: <atishp@atishpatra.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<paul.walmsley@sifive.com>, <biju.das.jz@bp.renesas.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <atishp@rivosinc.com>,
	<apatel@ventanamicro.com>, <geert+renesas@glider.be>,
	<linux-riscv@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Topic: [RFC PATCH 1/2] riscv: vendors: andes: Add support to configure
 the PMA regions
Thread-Index: AQHYwdqljaYH7D6050aAz/t+qDALqK3SNfiAgAJOpACAAB1VgIAAlz4AgAA1oACAAAJqAA==
Date: Thu, 8 Sep 2022 11:59:53 +0000
Message-ID: <e72263ee-10af-1249-5f0d-7e90e8e88441@microchip.com>
References: <20220906102154.32526-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220906102154.32526-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <8ecb62b7-53c4-1c43-65b3-567d8c12e131@microchip.com>
 <CAOnJCUKLpRz4Fbx1XiMnap-ELw2k1c8E9V8bZiSP+x7z9Z5QrA@mail.gmail.com>
 <f362eaeb-6ccd-4392-a346-55fa5ae25e13@microchip.com>
 <OS0PR01MB5922833FDCA60892191B211A86409@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8uttuVd5_UXvNjXU6yG-GpmxG-BuEAm9pWxx13PjZ-h5w@mail.gmail.com>
In-Reply-To: <CA+V-a8uttuVd5_UXvNjXU6yG-GpmxG-BuEAm9pWxx13PjZ-h5w@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|CY4PR11MB1432:EE_
x-ms-office365-filtering-correlation-id: 09955d58-393c-4b8c-ab9e-08da9191a454
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ru3jl8Q9fnmiiThlyc7YU82+PCgBZu0SfA3sudqo27OoVWLgafE2Zvwr9Q4ORFP4dMURGexgp9WL0SH5GiH2TLJv2NbBWyN2VxVHbzC62ECQIGqNZ+0YqFItCnRMFcDNSeoeKPg1teaViZCbcmdBLS/p8VO7tut0UhD0h9qZfCAuKnOs56iiGAE+jRC3O87bAzwH6ymlVj3pfarLeD+aeSKJbcAc0lQmTCwrn/myzUyhXT3ZaWNj5i5uf0l49jgztDpiUcPvU3yLCFHBWEJQzCiOTLrQvVMGNGrxVmX5h7ZaS1gIbtOjBYxg64RrfyUUpdbpVO+5aXmWGzilotkSjfmxmsKbGcDbr4yLmFZVCNxj36akN6PloFuJ3kEdgonGvRuzQBLMhIy8gGps9WjENXAbRhtdW+E/6Txh8RqNPK9eIc/rHe6cFXLHwlr692KnBPbWJH1hPsQ+l60deWDc4RZ+LGd/XWNq8rMi1We1rpP/y6lVtthgMR+QrJIUxr4J/JCiJrwx1ImlCUU915rnX7O487d+oKy+J0ACF2qFUimKIqYM1A1qX4miHizrsCp49ruwtMOpC4M0A4uGna9Z/i21DwYjdl/u9b0T+mXgOMB4BNBO8jg5DfueSpK2xMGeDyrPgfmKl/xPieX8aZQwTooRgMRWwP/990E5T+020J0TgI00QaR6v6fjlOS1niaZ6bVNyx/A8E4SG0BmnHrnGFVayu5aq2xC0uj68qcApbCDTd8+XLnX6AJ+cEbQx+FQbmZNp+nHZmJdoV/TLLp0HlhxKQ8HBloo11CmGEjY9EDLWqKn2q0Hz2Q4gF3Zz2FdwP9BJN8gIfCfX0I7KdIPyErFO0HPCjpepl56p3Vq5WA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(366004)(346002)(396003)(376002)(2616005)(186003)(38100700002)(122000001)(83380400001)(5660300002)(8936002)(7416002)(91956017)(64756008)(8676002)(4326008)(66446008)(66476007)(66556008)(76116006)(66946007)(2906002)(71200400001)(41300700001)(478600001)(6506007)(26005)(6512007)(53546011)(110136005)(54906003)(316002)(6486002)(966005)(36756003)(86362001)(31696002)(31686004)(38070700005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ektCbUszVGRHQ0dzZHc4akptdU9XWkdMT0EwOWNtTzFSTlJORXBQRzhEQ2tR?=
 =?utf-8?B?TXhHN2tvUjExR0Fkc3BxUG8yK3RmVng2ZGtYRkkrK1l0Q0JQRDJnZEV6a25w?=
 =?utf-8?B?V0lMb2paT2FVUUk2N0NNQWg5VXJRU2VGUU9RaHhpMEwzTlZUaGFuZnMxN0Ey?=
 =?utf-8?B?K09Qb3FHWEUzdmxrdHVXeGNWUnRZK3B2czQzVXd4NFJlSVlQNVFCbFVUb0Vi?=
 =?utf-8?B?UjlQNTlob2pUR0xKbnVub0drYUVSSkRnUUk0WVByRVR4V0RGNXl3YjhXOFJ5?=
 =?utf-8?B?REkybVVzcXdWK1dHMkNIMUh3Z2Rhb0srZnFrbDkxTXRZVW1qblA3bXdrUUJi?=
 =?utf-8?B?SEtETXE0YkNnRUdXSE5ySjRRUDFWOGFBRGd0U1pvNmJ1YWxkbGNZdlU2RlpV?=
 =?utf-8?B?aDJOY3BvOFFnZEtsTUp3YTYxMHkzZzF0UmFXM2FOcFpSZllzVGo1ZzVVeDR6?=
 =?utf-8?B?Z1d1bXdiVTNrZGFWSjdpSFRpWXhSZkxiSGM2NEFWUDV1VHNtUTZTak52bFE2?=
 =?utf-8?B?dnlpczVocHFwbktHR1l2N0JaejZmR3hsUkkvY0puWDJXNWtxWW1idTRQOUdO?=
 =?utf-8?B?YXRFRlMveHBFSlRDNTRvYVVzcEpUREJBbGhjQ0ptSHJTVDF1SGlUVzJTek5T?=
 =?utf-8?B?T0RXVEprSlpEUHNNaytTdU05SGY4Sk5oT3dGMW1QTUJVRHZ3ZE5CRHdpR3B5?=
 =?utf-8?B?VUh1NmlzSUVET3lmdGcrMW50aGRpSkdEYWxxR3FaWWdVQU4vTWdrOHNPMy9q?=
 =?utf-8?B?bW9BNk5uL05Odkgyd1JXRW8zWXVVMGNmUnhqVlV0SDJMMFUwd25yVlR1eFBI?=
 =?utf-8?B?WHA1NnNoRGxjelVUck5rWFY0bzR5aE8rbmR6RTVpc1VBVFg3dTcyOGF3Nlkw?=
 =?utf-8?B?dVJTRFI1c3FzbjdzdzlQVFVTdTE4YXBnYTlWNmZEcFpMVDM3dVV1QVZON3N5?=
 =?utf-8?B?eUlFbHFtL2dPamJYckU3RjJseHdjVnpuY1JqeWJ2emxmNDNJWXh0Z1hpQU9O?=
 =?utf-8?B?SjcwOGlyTFFDWHVyS1JBQnRSRzBrMHNRNkJDZjZGYUt2WXNERzd4eXZKQ0o3?=
 =?utf-8?B?a1NrWDdzQkNJZzFnMzNYc3ZycENDT0xOeGV2aHhxY0UwZjdubGJxaTJ2NzBB?=
 =?utf-8?B?QnlGUGdma25Pbm9tVWdJQldVc2FpVEFUaVV5ZGdOdkZ1VGVKbHBmVHgyc3BL?=
 =?utf-8?B?QjJXbCt1RHdlTThyY0NNTUZuT2wvbDFvUVAyYmQrRVN3UHUwQTA2SGg2VmYy?=
 =?utf-8?B?WWpOUTVWVnB3WDZCZGl4MkJJSEJ1MmczOEhIWjAwcHdjZ0xuKy92UDNXRUgw?=
 =?utf-8?B?WWw4TExZYXR2SWJaKzNvWm5yekQzclVpTWI2YzJCNSs0dHUyY1JoSG9rM3B5?=
 =?utf-8?B?MjcydVBZUW5ZYW5IVXJZZ3pya0NESkxJY2NRUzIwb0J3TVAvRjlqVDlKSjdH?=
 =?utf-8?B?WHVjWnNZRHRhNkVUSC9QUVQ1bVl0UDBvK25ucmhaeWtJZlhLaHlpZTJLbWZK?=
 =?utf-8?B?UkpSMjVTbnRDRUpjOTcxMGtDeFkrWXRaMnM1aGtuVXhzWDRiR054b0c4K3Az?=
 =?utf-8?B?UnJmVFp2UDFOZjFRcE9nNThtZklkUTVrUVBWdFFMK2V1UEk5VGYrNksyb1Ry?=
 =?utf-8?B?WWZSNStaNlFNRy9ROGxFbUp3ckdtK0p5Y2VERGtQMEFuMHMvSmliOVNZU0w3?=
 =?utf-8?B?bWIraU84ejNpTDFCRzVlWksyTWV5aTJ4MmRSR1g0YzdheVNDQ0FRWWV0UEZw?=
 =?utf-8?B?UUpSeG1LUkpScnkydXpxakUxbGJ0U2lXWGFsNEdpcTVyOUNIZ2ZObnNoQVM2?=
 =?utf-8?B?RHNHSTVvZklINUFiSWJMdUFsWGRvQ3VUWEpJamw5bWh5VVZSK2hxZzE5NXhD?=
 =?utf-8?B?cFhXYkZJeGJ0OXFZd1lRbzl1OVo2ZWRyd1dJeFhiakpEY0lmT2NJVFRkNkVT?=
 =?utf-8?B?UytLYlhZUXlVbURHN0IyajEwR0VhYm9jYk1YTnhGSmR5dzVqZEc2OXd0N3FM?=
 =?utf-8?B?SVRHLzUvUnNRMUlvZUNmQ2doMGt0N25GdmFVNkYwVGp6cEoyclVRbEpiQlpv?=
 =?utf-8?B?bERXYkJxWE1PQURvQmE1My9zMkNGNWFMUjlyMlBFaGVGVkJQY256cjVBTGU4?=
 =?utf-8?Q?IvWD8zgUCsHXLrm6tDQ9gC7RY?=
Content-ID: <1ACD80E24EAEA24D8C91AD54D0E8B204@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09955d58-393c-4b8c-ab9e-08da9191a454
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 11:59:53.9018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5Jy7crSwgI+aekrDrXe7yjyTt//pl1/QQ0K/l5ca9tAkBpPdzbF3Nd/1Od5grrJoR9r8+F0kLnVuI6/I14F0cP91i/VrEe7cn8ATjMgcN18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1432
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_050003_408478_BCD06C90 
X-CRM114-Status: GOOD (  12.22  )
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

On 08/09/2022 12:50, Lad, Prabhakar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Guo,
> 
>>> -----Original Message-----
>>> From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
>>> Sent: 08 September 2022 00:38
>>> To: atishp@atishpatra.org
>>> Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>;
>>> paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
>>> atishp@rivosinc.com; apatel@ventanamicro.com; geert+renesas@glider.be;
>>> linux-riscv@lists.infradead.org; linux-renesas-soc@vger.kernel.org;
>>> linux-kernel@vger.kernel.org; prabhakar.csengg@gmail.com; Biju Das
>>> <biju.das.jz@bp.renesas.com>
>>> Subject: Re: [RFC PATCH 1/2] riscv: vendors: andes: Add support to
>>> configure the PMA regions
>>>
>>> On 07/09/2022 22:52, Atish Patra wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>>>> the content is safe
>>>>
>>>>
>>>> On Tue, Sep 6, 2022 at 3:40 AM <Conor.Dooley@microchip.com
>>>> <mailto:Conor.Dooley@microchip.com>> wrote:
>>>>
>>>> On 06/09/2022 11:21, Lad Prabhakar wrote:
>>>>
>>>>> diff --git a/arch/riscv/include/asm/sbi.h
>>>>> b/arch/riscv/include/asm/sbi.h index 2a0ef738695e..10a7c855d125
>>>>> 100644 --- a/arch/riscv/include/asm/sbi.h +++
>>>>> b/arch/riscv/include/asm/sbi.h @@ -37,6 +37,7 @@ enum sbi_ext_id {
>>>>>
>>>>> /* Vendor extensions must lie within this range */
>>>>> SBI_EXT_VENDOR_START = 0x09000000, +       SBI_EXT_ANDES =
>>>>> 0x0900031E, SBI_EXT_VENDOR_END = 0x09FFFFFF, };
>>>>
> I am interested to know what is the status of your patch series [0].
> 
> [0] https://lore.kernel.org/lkml/20210606143848.GA5983@lst.de/T/#m7f4c4cdfb92d6c8672bbfabebda729ce4700e177

Heh, take a look at:
git grep "ERRATA_THEAD*"

This is all can-of-worms territory that we are heading to here, as
the Zicbo* extensions is what is meant to be doing these sorts of
things..


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
