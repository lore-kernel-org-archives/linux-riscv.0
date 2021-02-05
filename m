Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D261EC433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 22:54:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506A364FD6
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 22:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 506A364FD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mlmYT/b281bFdElRBKKMSPWERbobsDIj4Yc3iETH26Y=; b=svr8yJWjhKzAMMzUo5HF3NleQ
	gA2SmebHswAZZVEn2vDYHC5akxj0/42MrSyiuGBD8kdl01B0LzrIfXKFIURZ132wrVbjSSue8D2lZ
	8KoFiyPOV5cvvu52emxzWPafeni82mv9OqmIKBXKvnOyv9D4SFdmkwPSE4kOUNjIvff7BEBe9pcfI
	Stxe6aGl6IF9y8pvm5PiRle/k8Y5xdzTlb2N31OjD5Zw/ebqoj4k7gK/OrsesdBOO4C4pp+Is5OED
	WXuZjTxBZuF8V56Nc78505+godW30k328qXRncMUpq2EoNYURdxcOwzcqJQJi9oh7T/d0h93aUljc
	9UMmcjs0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l89zG-00068W-1Z; Fri, 05 Feb 2021 22:54:02 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l89zC-00067y-Km
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 22:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612565638; x=1644101638;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=t4hIcbJBPhyTFycr4dx+8zmQdj1iX4NqUrYSaDPgPc8=;
 b=Ayaoq7HPJPweBtb6xhwVVKPjD7g70UBpx1PB/cq6a1LOfdNSdWn5zVe1
 7ZJfAT/z3asZtckApGMuxfbLAhPtLSzR8wHn29vzv7WKVKGcJzwxcK/3E
 X1P7m8xeW4ErhmQL68ikPoo0Oss7ZG0OQGraN0PC3oP9+vyQOl6Cmijhs
 33sezdOuHi5E3Dzh/2hqTZ/XfN59Ssd+CLniC9rm+He5HY3oAoZXE3irJ
 zww4EClXxP03Kr/2VpdiPWDOzaSxS/4D3eEIrNHJt9+zzdCB1B1D20jre
 PfE7O6L8ZA0YIa3I3qQn69ZLJRL1Cn9lTmYJ5BL8hsdWzGpm8tBgvc05i w==;
IronPort-SDR: 2uqzvdZDIA5w0IOA3+hhItCCupNlhEMpcmJAl/2TT3Dbp9VH4YerUWmT3VXx5wpzFdpVgB9+g1
 sfkDimOohKfdj4QuWv1gICQL71JomFxe+uFqqPhCVlNYYorBz/U1+gQHA4impybLElDQFTz0gs
 qtam5W1KzUNyapDuZBwkrZzshrR2HiiTXIa60EHv/o+TfKytboVx28orEXzldEK7sPBXMqiEe9
 ymQWSEQE1O/XR5UOxhu8oh/Ar0B33sn9xBYGKQIH5G18zfRLkXeRvyqYwQMVJ82FLK/0xa28LF
 FRk=
X-IronPort-AV: E=Sophos;i="5.81,156,1610380800"; d="scan'208";a="269697156"
Received: from mail-bn7nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.109])
 by ob1.hgst.iphmx.com with ESMTP; 06 Feb 2021 06:53:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QnUTu3SqQUUKKA5/J4Qn0barOJLuKR64tdlN6wVbEhWuMiKerrbXv6Rm5E3OQTjMTtQ4IS/3cbRMFndc64dDvJEVmb7QSebiIYHvAuA6plDjlPWKzBGCmB+98Q2NkHA9u/ysZ6BM8dlGGLXJtFYIN/LxwuRRrpYCQNW6JXlUpRk9GWhg7IKG0WFq/peV6VLAtt80Ss3I2OOUl+UwYiv1eFa5o7If/jiIYHFJvmHj1KemxHaRscnLh5T/UCnt/4cFOcOXj0f/BGlkF8XcsDQtJcJgzjq2FR1myQs1SJyNPhzrsqIYFUdYJdoxyQJam1apl8JbiG6dHo62ksRGWw/B2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4hIcbJBPhyTFycr4dx+8zmQdj1iX4NqUrYSaDPgPc8=;
 b=etP9p+OIYEwxkgw95j+YoWIjNpkejJvP60DVS7D71hnFPUQCsTdJ9iKftn/OUmT7SJAQnVpveuHGjgJ0NX+R5PICF4XhOtUpXwCjCWhaNpRbzA/8JGwPTIFDvgupeHK3lAG7AgpJVTt/DcS4lqufAObTQvWY0fnwJI54tsZEHTDedUHvt1d9u7ixgPr87wUbxpCEjW900qg/rNzcuR9YkJvICl5Ru4zJ/kkQvKzvFuJKDtwvh8FHV1UzGp/Hyj/oggysHUntzb7QX+ojiJmyVrUQ3ilCPkjq50FEOFcvGN/0GqxH7jBhZ7i1TU67Rlf8j0vCZ7ShTOiRBoMdQFGojw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4hIcbJBPhyTFycr4dx+8zmQdj1iX4NqUrYSaDPgPc8=;
 b=f8pV7HA72wpeq90Su4orrnDfO39rVv6ZC85VI3sJVL14eHRYgH1q6PMecSeJeRr44GrzPw2NZMrx2zF4pPcTiyy2EHVX5NjmB/IGvBz326KO7oDBR2xeNH0pRq6288d1ceQ5tuav+N6SEgQBMC/cPmHvMQV/fa4Wo2a4kdwv0Yg=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6672.namprd04.prod.outlook.com (2603:10b6:208:1e5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Fri, 5 Feb
 2021 22:53:54 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::b880:19d5:c7fe:329d%7]) with mapi id 15.20.3825.025; Fri, 5 Feb 2021
 22:53:54 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Topic: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Thread-Index: AQHW+U9T59FA/s8Z20mcfAvTuPFEfqpFOSgAgAErBICAAIL6AIAAROyAgALVGoCAAC/CgA==
Date: Fri, 5 Feb 2021 22:53:54 +0000
Message-ID: <6351faa35c175d38e033ce433780c03c141c0ddf.camel@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <89cccbae5add85c7bd811f3819ea3db7061e928d.camel@wdc.com>
 <CAL_JsqJeF364bPSNQLGujNHDkA7x8H_H7YXQFNZQ7vDzdAevcA@mail.gmail.com>
 <c9d273c87815a89be314e4e824a365313be0d677.camel@wdc.com>
 <CAL_JsqKnAQ+ngNkaKkDAO5Bqd=ZwNm5A4VhxvuVZxgLdxxxpSg@mail.gmail.com>
In-Reply-To: <CAL_JsqKnAQ+ngNkaKkDAO5Bqd=ZwNm5A4VhxvuVZxgLdxxxpSg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.3 (3.38.3-1.fc33) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2400:2411:43c0:6000:8d3e:27aa:85c2:44b5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 72ed08c8-3d7e-4389-e47a-08d8ca28ea17
x-ms-traffictypediagnostic: MN2PR04MB6672:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR04MB6672559437CDFF3D0C32B7E5E7B29@MN2PR04MB6672.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BcXeRHLpczYPXD8tqv98mohoh7hHXRTtqDAZHyJoVkOAltMKAXstmFZAcgEYXf1iBAisXwjkkIWZn/CQuH8NfgHDF0PxjNOUmuXQPof17w/cwpFoWLIFlzm4rUjBWfoUfHk/eQULeYgUCd1UM4lNpluJIrV/vg5uaTjnWtWh04Z6glKYQ4kovjAN9+gdxJPYspBbEMCtjXH+LTVEJksm3rnDDH31L054UOtj9VS57jSNQVOi1k6kmYMqwrNhbOX51ktJbzGYGeRUyLIvcFWo4TmSjZHoNzlxmGH/s9/Y/v1TE7lR5FMemmyvkrgZ+O5/GvdtjxyhPlMTb8G4h2gmYGlsQ+Em+e2EJrsxER6qiwWVfRtd2PoUsIL73F48a73BZNT54sT3OHcF0uBgbMSQWJGpvNW3qFZyCV/o4YhvNGQw4CzgvrAeQr8KqVZwE9ahZWkgg1832ncVIkRVQ5AxXb4K9gt5Gdl5aX5KynOp94R57eq/dl6GpoY80EmVLMGyrq5fKlvdgBIuv4IaFbZ1zg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR04MB6514.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(66476007)(66446008)(66556008)(6512007)(64756008)(66946007)(76116006)(91956017)(71200400001)(4326008)(54906003)(8936002)(6486002)(5660300002)(86362001)(8676002)(83380400001)(6506007)(186003)(53546011)(316002)(2906002)(6916009)(36756003)(478600001)(2616005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cFY5UlIzYk9HcUs3YkVJaVBNak96dFhGOGpNTno2bitmTGt6VCtWbzJtUUZo?=
 =?utf-8?B?ZXdzaTFwWEdBTlg1UDlwR1E2YXAyTzdJaVU4b0NWS3ZoWjNpNXVHUEhqWCt1?=
 =?utf-8?B?elNrMkl2bVNsQjN6Tk5vT2tvTG1zSjRydUptdmdaUmpZME5vR2ozdFhTaVpF?=
 =?utf-8?B?QWNFNTdxY0daSVcrdXNkNjJxQzE1MEtxTE05SEVPTktxeG5Oa2IrRHJBQjJ0?=
 =?utf-8?B?R2MwdllYT3phRXNHU3NsZThMUDZPWC9NOGFMejV4ZzllbzJOL0p5SEdXb2U1?=
 =?utf-8?B?R2N0L1FrK1h5M2xUSE1yd0tBMU1TajZLNjNYU1Fyb2JXMG5RZ25KT2NqVHpa?=
 =?utf-8?B?NnZrdjBkOUl3bkdIYWpsVkZnaDNOWFYvSVJyaHdpNmpUOEZYaUg4bFoxNkUy?=
 =?utf-8?B?QUlaRkM0QnZZaXFpalQ3cGRSeTkyb0R2QjFOT0JmNEdQZnZZK2JidTZNUk5Z?=
 =?utf-8?B?amx1TEh2S1B0TlFtSTRocG1hdi9XTnM2NmdOS0t1czNOZUp0UFVjMFVFd1VK?=
 =?utf-8?B?VXhYYkEwcXV4SmFlNWhBREtqWWpvb3pmWmVqZVJxMEl5dDlsTll6K0s3OEk0?=
 =?utf-8?B?bHAvQk55Z1NSTlNGS1FYb2xDQ1dwMWg2WUo1SStiQzc0VEVLYUlLWEcxK2Ew?=
 =?utf-8?B?YWg1ZGJ3T1U3bC9QREJKTEgycDFWc3JFeUdzYzY5RnZKWjhaQVVZcWZ4YWx1?=
 =?utf-8?B?cGFHSm44Q0FwRkxueStYeVBma0QyNzhuYWxVeklHd3pnZnZYWDBPZkN3QTRo?=
 =?utf-8?B?Vy80WUdpQzdFemFuTnRoOXN4THpqMkt5K21CWjJ5cTdoWk1ZMFNRSnhWRUhD?=
 =?utf-8?B?dXkrdmJhcFZXMldydURzSWM2NXdUK3diQTc3Vm5ydGYvOU1ld2ZXbHRLTnQ0?=
 =?utf-8?B?dDluYUdjc2NPWnFsNWQ3Z1N3RXQyR1NaME5BU3p1UTliSUJHZGduMENjSThm?=
 =?utf-8?B?cXIwcU93eEFoUnByaHpWZW42TXpHWm11L05QOGJleGZabWVkMkJQVmxRZ1Jl?=
 =?utf-8?B?ZnUwVzBTR0ZUTnJuMU1TZ0cvemluUTluN29yNk9nNERMYzNXUmJGUTZqVmZY?=
 =?utf-8?B?S1BjaU1qcFVjcnJFU3VpVnVzeGZYYUhxL0Y3SlFmdHNWMkRuVk1QMENwa1B6?=
 =?utf-8?B?NUhlL0YxZHVhVVNaVW51M2NPdUxCVEEyOW05QjdpeXAvTnJTcGdxV2lkQzdR?=
 =?utf-8?B?Mm54azhNYmlTUUpLTVNHZGNxQ25kS21nU29Yd2loUXlKMVptcm5YSFFRa05v?=
 =?utf-8?B?MTZFaWFCSTZvcHUwNWcvZDVuUitBNEFHQ3cwNDZHeVlSR0tkU214U1Y2RS92?=
 =?utf-8?B?THU0V29IOHZoYUx2Mmc2MWxwY3gvWjI3TVNGUzJ2Qm9zbEp6bElGSC9DbkVx?=
 =?utf-8?B?SW5ZRUgvTW5QeWNMZGIrbE5EeFEwb09Kak1iMmtxNWtuRVZ5VjBFdzNhZHlD?=
 =?utf-8?B?U0RxS25Kdkd3emxYZEtYeGFsVE9pV0RGbmpYVmlEdW1mOS9qUytzN3UvNGt6?=
 =?utf-8?B?KzJqcTQyaHB3clRSY05QSHN0Y1ZHVkIzM1o1a0ZYYlh3anp4M0kyNm91b3pr?=
 =?utf-8?B?Sy9oT2t2bjYyeHAvQjY1UGpvSzZZVHF4WVZLWm94Lyt3WWNtZzRnVXhIaFVI?=
 =?utf-8?B?TEpKcFNaUzIvL05aVDhRNzhBcklxQU4rM2VTY3J3M2FIWWR2ODJXYmxWSXhw?=
 =?utf-8?B?QjVRbm96TXNIZG0yZDZENU9KRjRQaEJ0bkZQc3ZYeitpQmwxdlp6ZWZhOGNG?=
 =?utf-8?B?dkhneVg5di9WUnJkUUcrbjBnQ3AvWk90RWFaOS9Zayt4aEhMS3BBaE1KWm1z?=
 =?utf-8?B?dDM5MUNjTzBrQXRub3dINVk1LytqRlcvSDBtWFFDT3dndlU4eCsvSW0zMVJ0?=
 =?utf-8?B?S0h4UnVicXEyYXBqUlZqREZReHhWalJ0Z2RqUk81ZjQ3c1E9PQ==?=
Content-ID: <4A6A1C1CD3965E49AF773C86AD57798D@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ed08c8-3d7e-4389-e47a-08d8ca28ea17
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 22:53:54.6766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pQcdm1YXCzyldYVJ+Ru/TXZjxwOI+wuRTeDxTTwuTeQN3yYVOv1WiWQ3GqyJbZsiHg/kPEw1ch5KFXL/FamFNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6672
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_175359_098985_6AC0E818 
X-CRM114-Status: GOOD (  36.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Anup Patel <Anup.Patel@wdc.com>, "seanga2@gmail.com" <seanga2@gmail.com>,
 Atish Patra <Atish.Patra@wdc.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAyMDIxLTAyLTA1IGF0IDE0OjAyIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4g
T24gV2VkLCBGZWIgMywgMjAyMSBhdCA2OjQ3IFBNIERhbWllbiBMZSBNb2FsIDxEYW1pZW4uTGVN
b2FsQHdkYy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IE9uIFdlZCwgMjAyMS0wMi0wMyBhdCAxNDo0
MSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6DQo+ID4gPiBPbiBXZWQsIEZlYiAzLCAyMDIxIGF0
IDY6NTIgQU0gRGFtaWVuIExlIE1vYWwgPERhbWllbi5MZU1vYWxAd2RjLmNvbT4gd3JvdGU6DQo+
ID4gPiA+IA0KPiA+ID4gPiBPbiBUdWUsIDIwMjEtMDItMDIgYXQgMTM6MDIgLTA2MDAsIFJvYiBI
ZXJyaW5nIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFR1ZSwgRmViIDIsIDIwMjEgYXQgNDozNiBBTSBE
YW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gVGhlIHNpZml2ZSBncGlvIElQIGJsb2NrIHN1cHBvcnRzIHVwIHRvIDMy
IEdQSU9zLiBSZWZsZWN0IHRoYXQgaW4gdGhlDQo+ID4gPiA+ID4gPiBpbnRlcnJ1cHRzIHByb3Bl
cnR5IGRlc2NyaXB0aW9uIGFuZCBtYXhJdGVtcy4gQWxzbyBhZGQgdGhlIHN0YW5kYXJkDQo+ID4g
PiA+ID4gPiBuZ3Bpb3MgcHJvcGVydHkgdG8gZGVzY3JpYmUgdGhlIG51bWJlciBvZiBHUElPcyBh
dmFpbGFibGUgb24gdGhlDQo+ID4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbi4NCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gQWxzbyBhZGQgdGhlICJjYW5hYW4sazIxMC1ncGlvaHMiIGNvbXBhdGli
bGUgc3RyaW5nIHRvIGluZGljYXRlIHRoZSB1c2UNCj4gPiA+ID4gPiA+IG9mIHRoaXMgZ3BpbyBj
b250cm9sbGVyIGluIHRoZSBDYW5hYW4gS2VuZHJ5dGUgSzIxMCBTb0MuIElmIHRoaXMNCj4gPiA+
ID4gPiA+IGNvbXBhdGlibGUgc3RyaW5nIGlzIHVzZWQsIGRvIG5vdCBkZWZpbmUgdGhlIGNsb2Nr
cyBwcm9wZXJ0eSBhcw0KPiA+ID4gPiA+ID4gcmVxdWlyZWQgYXMgdGhlIEsyMTAgU29DIGRvZXMg
bm90IGhhdmUgYSBzb2Z0d2FyZSBjb250cm9sbGFibGUgY2xvY2sNCj4gPiA+ID4gPiA+IGZvciB0
aGUgU2lmaXZlIGdwaW8gSVAgYmxvY2suDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IENjOiBQ
YXVsIFdhbG1zbGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+DQo+ID4gPiA+ID4gPiBDYzog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiA+ID4gPiA+IENjOiBkZXZpY2V0cmVl
QHZnZXIua2VybmVsLm9yZw0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFtaWVuIExlIE1v
YWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4g
wqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlvLnlhbWwgfCAyMSArKysr
KysrKysrKysrKysrLS0tDQo+ID4gPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlLGdwaW8u
eWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2ZSxncGlv
LnlhbWwNCj4gPiA+ID4gPiA+IGluZGV4IGFiMjIwNTZmOGI0NC4uMmNlZjE4Y2E3MzdjIDEwMDY0
NA0KPiA+ID4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dw
aW8vc2lmaXZlLGdwaW8ueWFtbA0KPiA+ID4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlLGdwaW8ueWFtbA0KPiA+ID4gPiA+ID4gQEAgLTE2
LDYgKzE2LDcgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gPiA+IMKgwqDCoMKgwqDCoMKgLSBlbnVt
Og0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC0gc2lmaXZlLGZ1NTQwLWMwMDAt
Z3Bpbw0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC0gc2lmaXZlLGZ1NzQwLWMw
MDAtZ3Bpbw0KPiA+ID4gPiA+ID4gKyAgICAgICAgICAtIGNhbmFhbixrMjEwLWdwaW9ocw0KPiA+
ID4gPiA+ID4gwqDCoMKgwqDCoMKgwqAtIGNvbnN0OiBzaWZpdmUsZ3BpbzANCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gwqDCoMKgcmVnOg0KPiA+ID4gPiA+ID4gQEAgLTIzLDkgKzI0LDkgQEAg
cHJvcGVydGllczoNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gwqDCoMKgaW50ZXJydXB0czoN
Cj4gPiA+ID4gPiA+IMKgwqDCoMKgwqBkZXNjcmlwdGlvbjoNCj4gPiA+ID4gPiA+IC0gICAgICBp
bnRlcnJ1cHQgbWFwcGluZyBvbmUgcGVyIEdQSU8uIE1heGltdW0gMTYgR1BJT3MuDQo+ID4gPiA+
ID4gPiArICAgICAgaW50ZXJydXB0IG1hcHBpbmcgb25lIHBlciBHUElPLiBNYXhpbXVtIDMyIEdQ
SU9zLg0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoG1pbkl0ZW1zOiAxDQo+ID4gPiA+ID4gPiAtICAg
IG1heEl0ZW1zOiAxNg0KPiA+ID4gPiA+ID4gKyAgICBtYXhJdGVtczogMzINCj4gPiA+ID4gPiA+
IA0KPiA+ID4gPiA+ID4gwqDCoMKgaW50ZXJydXB0LWNvbnRyb2xsZXI6IHRydWUNCj4gPiA+ID4g
PiA+IA0KPiA+ID4gPiA+ID4gQEAgLTM4LDYgKzM5LDEwIEBAIHByb3BlcnRpZXM6DQo+ID4gPiA+
ID4gPiDCoMKgwqAiI2dwaW8tY2VsbHMiOg0KPiA+ID4gPiA+ID4gwqDCoMKgwqDCoGNvbnN0OiAy
DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICsgIG5ncGlvczoNCj4gPiA+ID4gPiA+ICsgICAg
bWluaW11bTogMQ0KPiA+ID4gPiA+ID4gKyAgICBtYXhpbXVtOiAzMg0KPiA+ID4gPiA+IA0KPiA+
ID4gPiA+IFdoYXQncyB0aGUgZGVmYXVsdCBhcyBvYnZpb3VzbHkgZHJpdmVycyBhbHJlYWR5IGFz
c3VtZSBzb21ldGhpbmcuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gRG9lcyBhIGRyaXZlciBhY3R1
YWxseSBuZWVkIHRvIGtub3cgdGhpcz8gRm9yIGV4YW1wbGUsIGRvZXMgdGhlDQo+ID4gPiA+ID4g
cmVnaXN0ZXIgc3RyaWRlIGNoYW5nZSBvciBzb21ldGhpbmc/DQo+ID4gPiA+ID4gDQo+ID4gPiA+
ID4gUGxlYXNlIGRvbid0IGFkZCBpdCBpZiB0aGUgb25seSBwdXJwb3NlIGlzIGVycm9yIGNoZWNr
IHlvdXIgRFQgKElPVywNCj4gPiA+ID4gPiBpZiBpdCBqdXN0IGNoZWNrcyB0aGUgbWF4IGNlbGwg
dmFsdWUgaW4gZ3Bpb3MgcGhhbmRsZXMpLg0KPiA+ID4gPiANCj4gPiA+ID4gSWYgSSByZW1vdmUg
dGhhdCwgbWFrZSBkdGJzX2NoZWNrIGNvbXBsYWlucy4gTG9va2luZyBhdCBvdGhlIGdwaW8gY29u
dHJvbGxlcg0KPiA+ID4gPiBiaW5kaW5ncywgdGhleSBhbGwgaGF2ZSBpdC4gU28gaXNuJ3QgaXQg
YmV0dGVyIHRvIGJlIGNvbnNpc3RlbnQsIGFuZCBhdm9pZCBtYWtlDQo+ID4gPiA+IGR0YnNfY2hl
Y2sgZXJyb3JzID8NCj4gPiA+IA0KPiA+ID4gVGhhdCB3b3VsZCBtZWFuIHlvdSBhcmUgYWxyZWFk
eSB1c2luZyAnbmdwaW9zJyBhbmQgaXQgaXMgdW5kb2N1bWVudGVkDQo+ID4gPiAoZm9yIHRoaXMg
YmluZGluZykuIElmIGFscmVhZHkgaW4gdXNlIGFuZCBwb3NzaWJseSBoYXZpbmcgdXNlcnMgdGhl
bg0KPiA+ID4gdGhhdCBjaGFuZ2VzIHRoaW5ncywgYnV0IHRoYXQncyBub3Qgd2hhdCB0aGUgY29t
bWl0IG1zZyBzYXlzLg0KPiA+ID4gDQo+ID4gPiBOb3QgKmFsbCogZ3BpbyBjb250cm9sbGVycyBo
YXZlIG5ncGlvcy4gSXQncyBhIGdvb2QgbnVtYmVyLCBidXQNCj4gPiA+IHByb2JhYmx5IG1vcmUg
dGhhbiBuZWVkIGl0IHRob3VnaC4gSWYgd2Ugd2FudGVkIGl0IGV2ZXJ5d2hlcmUsIHRoZXJlDQo+
ID4gPiB3b3VsZCBiZSBhIHNjaGVtYSBlbmZvcmNpbmcgdGhhdC4NCj4gPiANCj4gPiBJZiBJIHJl
bW92ZSB0aGUgbWluaW11bSBhbmQgbWF4aW11bSBsaW5lcywgSSBnZXQgdGhpcyBlcnJvcjoNCj4g
DQo+IEkgbmV2ZXIgc2FpZCByZW1vdmUgbWluaW11bS9tYXhpbXVtLiBUaGUgc3VnZ2VzdGlvbiBp
cyBlaXRoZXIgYWRkDQo+ICdkZWZhdWx0OiAxNicgb3IgcmVtb3ZlICduZ3Bpb3MnIGVudGlyZWx5
Lg0KPiANCj4gPiAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2
ZSxncGlvLnlhbWw6NDI6MTA6IFtlcnJvcl0gZW1wdHkNCj4gPiB2YWx1ZSBpbiBibG9jayBtYXBw
aW5nIChlbXB0eS12YWx1ZXMpDQo+ID4gwqDCoENIS0RUICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Byb2Nlc3NlZC1zY2hlbWEtZXhhbXBsZXMuanNvbg0KPiA+IC9ob21lL2Rh
bWllbi9Qcm9qZWN0cy9SSVNDVi9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZ3Bpby9zaWZpdmUNCj4gPiAsZ3Bpby55YW1sOiBwcm9wZXJ0aWVzOm5ncGlvczogTm9uZSBp
cyBub3Qgb2YgdHlwZSAnb2JqZWN0JywgJ2Jvb2xlYW4nDQo+ID4gwqDCoFNDSEVNQSAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Byb2Nlc3NlZC1zY2hlbWEtZXhhbXBsZXMuanNv
bg0KPiA+IC9ob21lL2RhbWllbi9Qcm9qZWN0cy9SSVNDVi9saW51eC9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZ3Bpby9zaWZpdmUNCj4gPiAsZ3Bpby55YW1sOiBpZ25vcmluZywg
ZXJyb3IgaW4gc2NoZW1hOiBwcm9wZXJ0aWVzOiBuZ3Bpb3MNCj4gPiB3YXJuaW5nOiBubyBzY2hl
bWEgZm91bmQgaW4gZmlsZToNCj4gPiAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncGlvL3NpZml2ZSxncGlvLnlhbWwNCj4gDQo+IG5ncGlvczogdHJ1ZQ0KPiANCj4gb3INCj4g
DQo+IG5ncGlvczoge30NCj4gDQo+IEFyZSB0aGUgbWluaW11bSB2YWxpZCB2YWx1ZXMgZm9yIGEg
a2V5LiAoVGhvdWdoIG5vdCB3aGF0IHNob3VsZCBiZSBkb25lIGhlcmUuKQ0KPiANCj4gPiANCj4g
PiBJZiBJIHJlbW92ZSB0aGUgbmdwaW9zIHByb3BlcnR5IGVudGlyZWx5LCB0aGVuIEkgZ2V0IGEg
aGl0IG9uIHRoZSBkZXZpY2UgdHJlZToNCj4gPiANCj4gPiDCoMKgQ0hFQ0sgICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL2NhbmFhbi9zaXBlZWRfbWFpeF9iaXQuZHQueWFtbA0KPiA+IC9saW51eC9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL2NhbmFhbi9zaXBlZWRfbWFpeF9iaXQuZHQueWFtbDoNCj4gPiBncGlv
LWNvbnRyb2xsZXJAMzgwMDEwMDA6ICduZ3Bpb3MnIGRvZXMgbm90IG1hdGNoIGFueSBvZiB0aGUg
cmVnZXhlczogJ3BpbmN0cmwtDQo+ID4gWzAtOV0rJw0KPiA+IMKgwqDCoMKgwqDCoMKgwqBGcm9t
IHNjaGVtYToNCj4gPiAvaG9tZS9kYW1pZW4vUHJvamVjdHMvUklTQ1YvbGludXgvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlDQo+ID4gLGdwaW8ueWFtbA0KPiAN
Cj4gVGhhdCdzIG5vdCB1cHN0cmVhbSwgcmlnaHQ/IFRoZW4gZml4IGl0Lg0KPiANCj4gPiBOb3cs
IElmIEkgY2hhbmdlIHRoZSBwcm9wZXJ0eSBkZWZpbml0aW9uIHRvIHRoaXM6DQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3NpZml2
ZSxncGlvLnlhbWwNCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlv
L3NpZml2ZSxncGlvLnlhbWwNCj4gPiBpbmRleCAyY2VmMThjYTczN2MuLjVjNzg2NTE4MDM4MyAx
MDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9z
aWZpdmUsZ3Bpby55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2dwaW8vc2lmaXZlLGdwaW8ueWFtbA0KPiA+IEBAIC00MCw4ICs0MCwxMSBAQCBwcm9wZXJ0
aWVzOg0KPiA+IMKgwqDCoMKgwqBjb25zdDogMg0KPiA+IA0KPiA+IMKgwqDCoG5ncGlvczoNCj4g
PiAtICAgIG1pbmltdW06IDENCj4gPiAtICAgIG1heGltdW06IDMyDQo+ID4gKyAgICAkcmVmOiAv
c2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgIGRlc2NyaXB0
aW9uOg0KPiA+ICsgICAgICBUaGUgbnVtYmVyIG9mIEdQSU8gcGlucyBpbXBsZW1lbnRlZCBieSB0
aGUgY29udHJvbGxlci4NCj4gPiArICAgICAgSXQgaXMgMTYgZm9yIHRoZSBTaUZpdmUgU29DcyBh
bmQgMzIgZm9yIHRoZSBDYW5hYW4gSzIxMCBTb0MuDQo+ID4gKw0KPiA+IA0KPiA+IMKgwqDCoGdw
aW8tY29udHJvbGxlcjogdHJ1ZQ0KPiA+IA0KPiA+IFRoZW4gYWxsIGlzIE9LLg0KPiA+IA0KPiA+
IFdoaWNoIG9wdGlvbiBzaG91bGQgSSBnbyBmb3IgaGVyZSA/IElmIHdlIHdhbnQgdG8gYXZvaWQg
YSBkdGJzX2NoZWNrIGVycm9yLCBhcw0KPiA+IGZhciBhcyBJIGNhbiBzZWUsIHdlIGNhbjoNCj4g
PiAxKSBSZW1vdmUgdGhlIG5ncGlvcyBwcm9wZXJ0eSBhbmQgcmVtb3ZlIGl0cyB1c2UgZnJvbSB0
aGUgRFRTLCB3aGljaCBpcyBub3QNCj4gPiBuaWNlIGluIG15IG9waW5pb24NCj4gDQo+IEFnYWlu
LCBpdCBkZXBlbmRzIGlmIHRoZXJlIGFyZSB1c2VycyBkZXBlbmRpbmcgb24gaXQuIEEgdXNlciBi
ZWluZyBhDQo+IEdQSU8gZHJpdmVyIHNvbWV3aGVyZSwgbm90IGEgRFRTIGZpbGUuIFRoZSBHUElP
IGRyaXZlciBpbiB0aGUga2VybmVsDQo+IGRvZXNuJ3QgbmVlZCBpdC4gU28gdS1ib290PyBCU0Q/
DQoNClRoZSBMaW51eCBkcml2ZXIgdXNlcyB0aGUgbnVtYmVyIG9mIGludGVycnVwdHMgZm9yIHRo
ZSBudW1iZXIgb2YgZ3Bpb3MgYnV0DQp1cHN0cmVhbSBVLUJvb3QgdXNlcyB0aGUgbmdwaW9zIHBy
b3BlcnR5LiBTbyBJIHdpbGwgY2hhbmdlIHRoaXMgdG8gdXNlDQoiZGVmYXVsdDogMTYiIGFzIHlv
dSBzdWdnZXN0ZWQuDQoNClRoYW5rcyAhDQoNCj4gDQo+ID4gMikgVXNlIHRoZSBtb2RpZmljYXRp
b24gcHJvcG9zZWQgYWJvdmUNCg0KLS0gDQpEYW1pZW4gTGUgTW9hbA0KV2VzdGVybiBEaWdpdGFs
IFJlc2VhcmNoDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
