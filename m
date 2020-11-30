Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4577DC63777
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 21:50:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C35D20857
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 21:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LzDEYmcs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="cJwP8cEe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="NtR7sTek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C35D20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	 bh=2M70RaRmnuo87zJQuAFD2zQudicWLsyM1cpw16Kb/kI=; b=LzDEYmcsCvBFaDF7cXWyDSfop
	Dz0JyN4gOAlRyAliPAxsqzB0tqa8GdmklYJHPF8OQBAaBHVtPketdV0GEtqdHT46Pf8x9fUbne0SJ
	AwJMyCQsfycxfARk4yFwIEgSsLTsnECd8FHWi7uZ4m6zxWfU76f73ixLEc17YFJ0PW3JFJGbFdOO+
	0QCJRfgew8DitSuik4kq7whRX34REq1+JBomWdID4Eg9WScZct/3g8g8XUG8WbglO74BArZ2kPqcS
	oTA0qhiurax6jl/Rjbth99wyIDcUF3aWdsssV84pwvMMhtskn//83zYMZaNmPymHRlBzA5xigki4E
	LYagL71Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjr3r-0000pM-H9; Mon, 30 Nov 2020 21:50:19 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjr3o-0000oe-9l
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 21:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606773016; x=1638309016;
 h=from:to:cc:subject:date:message-id:references:
 content-transfer-encoding:mime-version;
 bh=C1BT7GlDlpvpcXUxuKHfn0dn7pXWAR0e9Zgb8JxCH3s=;
 b=cJwP8cEeBX7y4uCOCXFNdvTQ18nMXyD9teoqykICawkXrrqi5BK2PdAm
 oAsYJdyUMlptI5Wr9ZSFllwhIos88vbd9BR8itLUIqdwcs6JQzj/IC5MO
 BuiJhphjhGRPkWDSZLyVukairyKRsLlIZeHc7j3GPjwieWTVepAxwI2pq
 Pye08x5WunbmO5GT4i51Y+ancY4xMSdfbbyxbq43LHseyENrucdxrUsM7
 WH8MijQb+cdV5VmbhCdNCT9VO6zmrCSWo9uaR02oJ6NlesfgPMtZmaFvP
 RSdH0UeetYgGsHvzQmh1X1BQXNXkvQlXKol8gd0t0UZe2PPC9UDzj3Hq9 w==;
IronPort-SDR: I4pGi2dDC8BGC4kj3QsD8qc//8ZHTjzkFKhl48FFoiebXLUwxu7Fzo0eoq3ieS4eUQi/iNchMH
 ckX2HLFBt4a1aqmFL31hJPjBgKsEp6rwK43kaKe/mC46f3IRZJ6AXALTBtYzo+CTKZkAzuZfkR
 sE6LWF39+IoDlE7V9Hjqr89Wu7SumRk1Ao5rP4KY+QwPS/FPab82bejJoNwKgxZEdWJk/qFgB/
 SqT7ZUJLJv6sl2flotbpmPq8EMBDk+e23ziissw5G9W3Qd935pWwDYl7R7fX+Pl/RqSXDsf9dE
 Cug=
X-IronPort-AV: E=Sophos;i="5.78,382,1599494400"; d="scan'208";a="153919650"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hgst.iphmx.com with ESMTP; 01 Dec 2020 05:50:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elLWZUr4PKoa0YJ13ascTo8Nzjy6hn+Ndb0C7QppcLFjOTeSUxXG//5nDvpIOGBxvrJXEmlEMBAgjm8XVpRaD0KFSoLTweN3P/2nUbGneaA7mRmDrwV9yuJn/Q+gbqWHDakP719xZKGp+aqXkldpReG+1o2hIMNWqEKrlJXVfuWOmVxNlD6LYRJdUv/kWPvIKF47e+AH2QJ7dT5shI3ii917u3is4ewN+lz1qskajKt7PVpiYrQ/Z1eB8fdisXV9KGNSHSV/m6A9goxzuRWwAgzlvNg3PE8omDvNpo3NyM5zA4kphUZ3KuKt6q2g4IigFl7FPgqufeGdPI4dT2nNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUqLF1rwbh32V+4LmJ6lPpWz/QfkGLUCEM26ptg+6iQ=;
 b=LdEovBe4mQfyzbFyXczckwgUV+FkVmU/Y2hSVGWL2okJd/lxXOLzvUo5+4+ztHcU9v6h10yJ53rVAcab87EhE7qL1RZfXFQZmexZw64ArOsmxXlwHPW5NxlzswJXKd5BPqrN1yxEdrbwBTDYFZh5Oxp+XT39D1KkmDPW5ANzg7cYqxht6+3+vNzJH4qkO3vZXJoAv64iXPwXhqpefv/IRDsN2U1z0E1x6nyVT1X5Wj83LbMCMix6m8SwGRa5MD5pFSs+wI4Rlfj0dlyyDMbjPz4OF1GKxCPfRhlsbvce+WuiDdBQJ7Vg4cPPf5GYtojf33HhxxrKnVLq7U26OdadAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUqLF1rwbh32V+4LmJ6lPpWz/QfkGLUCEM26ptg+6iQ=;
 b=NtR7sTekykOqOyFHS2VrFdotwYYYGqCJrR9/1HmMmofyGzpPZKPQBPOwkZ2kRwVC0C6sx/zMlNKxgGrpdMNA4J+xBl9TkFGPp4sl0rzbekFiWtmhJTU3Ula0hh0cP1jc7Wog4lwTWv6D83teiIi0sSbnu9nnfAfl7+N+5VjXHtM=
Received: from CH2PR04MB6522.namprd04.prod.outlook.com (2603:10b6:610:34::19)
 by CH2PR04MB6538.namprd04.prod.outlook.com (2603:10b6:610:35::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Mon, 30 Nov
 2020 21:50:12 +0000
Received: from CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a]) by CH2PR04MB6522.namprd04.prod.outlook.com
 ([fe80::897c:a04b:4eb0:640a%7]) with mapi id 15.20.3589.022; Mon, 30 Nov 2020
 21:50:12 +0000
From: Damien Le Moal <Damien.LeMoal@wdc.com>
To: "Conor.Dooley@microchip.com" <Conor.Dooley@microchip.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "jassisinghbrar@gmail.com"
 <jassisinghbrar@gmail.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 1/6] mbox: add polarfire soc system controller mailbox
Thread-Topic: [PATCH 1/6] mbox: add polarfire soc system controller mailbox
Thread-Index: AQHWvpYfVU6mtg0xhkO8MWTEOL0QWg==
Date: Mon, 30 Nov 2020 21:50:11 +0000
Message-ID: <CH2PR04MB6522D8B7E1EC319733D72CA5E7F50@CH2PR04MB6522.namprd04.prod.outlook.com>
References: <20201119170419.18272-1-conor.dooley@microchip.com>
 <BL0PR04MB6514AA9B313828842F7EF0D8E7FF0@BL0PR04MB6514.namprd04.prod.outlook.com>
 <ffa091eb-0963-f2b5-de9a-c76767d6776c@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: microchip.com; dkim=none (message not signed)
 header.d=none;microchip.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [60.117.181.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 689b61fd-168c-4ead-78ea-08d89579e9ea
x-ms-traffictypediagnostic: CH2PR04MB6538:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR04MB65386FB561FB26C7FBA7ADA9E7F50@CH2PR04MB6538.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vvFxFCpgNXGPxwimOZEZfA8xKgJ1i63HDG27wpQbDBt6OCpFwj1vBOP/y0h4SgYVPLh3E+HBvL74RpBmZhwC3YclGJDWKQygZe6t485c3nU8eh0q6922Tzq714ifYSaiM1KunDMCNt0+HXEvzCtgJ3XkcX/TO476QTVmSdiRPYmq/SyB5oNp8iXtnBJeib0svZz+u4Fi+AyDYvOKB8YfNYGs2mvjgZdl6K1YMoQRWJEBZYnIxchunJi9yZNXk2CZi8SWcz3mkicdm3NdOQ+50COf+/fb5y+vS++a8vPQ71miCh2RdJbB7uLiOQ9kzNR3
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6522.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(376002)(366004)(9686003)(76116006)(6506007)(8676002)(66556008)(7416002)(186003)(66446008)(91956017)(66946007)(64756008)(8936002)(478600001)(110136005)(26005)(71200400001)(15650500001)(86362001)(7696005)(5660300002)(2906002)(33656002)(316002)(83380400001)(52536014)(54906003)(4326008)(66476007)(53546011)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?/OmoFwZdY9CXU5E67EXZcU730nkowQ0Mdy9xG4A5jIjJCNxRKXyidIUd0g?=
 =?iso-8859-1?Q?wH7Fp1FWNlve1remKLl69Fwa0AJI7K07XVGGbVGckpOC9OFW6AMcMvCQUM?=
 =?iso-8859-1?Q?dhohMeWktZiy3I75qvLpbHgEjJZg7ahVzww/lhpD0lznS5Q8KjARpFpIcU?=
 =?iso-8859-1?Q?WCu47PwUvlmtwmfDCJ7cSjT3ZZuJfHKN95IZA2prYS1eZ3DIizkc0H066t?=
 =?iso-8859-1?Q?UIoY4N/vIV0sq9etHxLJToOYQoxSd9ZRLSKj/QlfCSzVXKwcyOjwl5Hlir?=
 =?iso-8859-1?Q?InZe9ZTPa6a+b48alBVd3/IKJWrcY3kYFO9ps6pDvxjvs9Pk66DtSKZO8v?=
 =?iso-8859-1?Q?Qtng9Vaeo4e0iiHCScHIQ6L4leL/GgI+8bzvlv7Z6Q5sE6vDPsDGlBGWVQ?=
 =?iso-8859-1?Q?ovzCTrkbTJXMQYmPFnduNj4paZrDkh4FkhXdx4zzkjTluYT74mD+8SME4K?=
 =?iso-8859-1?Q?m7KyrWoXBcacD3q7xt9PdOp/jRDbULm1soXEe/aQ0+7ZVIthbNA9Oc47+2?=
 =?iso-8859-1?Q?zyb0sjBT0iTckSS5Y/6WaEAIGihMH7E9keC5ZdcY+mvfKHelHkeM7BN4l+?=
 =?iso-8859-1?Q?M0QW63soNqOgqDz9BXTdyeaYmB/inIUHHl1WFJaocaIV6J5wP42OyuolNN?=
 =?iso-8859-1?Q?izz1eE7L6qCgrpuURLYYL2bKxyrXQhyB04/nkERRZRCBKle6gzVxGj3JZF?=
 =?iso-8859-1?Q?d5EZX2wzsrSqyqSxSXRgiL/h5xre9UgSMzKIye5+LcCZpBPFQ/fSldar6o?=
 =?iso-8859-1?Q?00xWeV7F6EchBP6cL5IncjFqprPklLObdiK6sMCa7sdca5VIVIGESDw4Aq?=
 =?iso-8859-1?Q?wX32IgGmme2gwR8/Wuc53vWoVyjsAqUW4HUEsqku0qbNUGJQs6WPdehJWN?=
 =?iso-8859-1?Q?V6j1UihPk86HhU5BN0/ObyeS5IrRSWH198SDNoBatg1eVMXD9fWogt/+6L?=
 =?iso-8859-1?Q?HvXG5coPjx5w5/Ool7T0JYEotl+7jzKjP22wOLN7bJ9B45acHhJmiMUU+n?=
 =?iso-8859-1?Q?9MA+grfw94xrGnqciuY0CeGIsAXoQCOtSWh/xw?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6522.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 689b61fd-168c-4ead-78ea-08d89579e9ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 21:50:11.9391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U96q0cOg7ZEpRzwxe402U53WrU3Dc/q2E8z5irTu7nlt6R6THNh2UGmeg7AhRqwBG7QMbMYKu0JoLRYdrv/LNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6538
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_165016_506913_EEF5F689 
X-CRM114-Status: GOOD (  15.49  )
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
Cc: "Cyril.Jean@microchip.com" <Cyril.Jean@microchip.com>,
 "david.abdurachmanov@gmail.com" <david.abdurachmanov@gmail.com>,
 "Daire.McNamara@microchip.com" <Daire.McNamara@microchip.com>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 "Lewis.Hanly@microchip.com" <Lewis.Hanly@microchip.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2020/11/30 22:23, Conor.Dooley@microchip.com wrote:
> On 20/11/2020 00:05, Damien Le Moal wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know t=
he content is safe
>>
>> On 2020/11/20 2:05, conor.dooley@microchip.com wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> This driver adds support for the single mailbox channel of the MSS
>>> system controller on the Microchip PolarFire SoC.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  drivers/mailbox/Kconfig        |  12 ++
>>>  drivers/mailbox/Makefile       |   2 +
>>>  drivers/mailbox/mailbox-mpfs.c | 296 +++++++++++++++++++++++++++++++++
>>>  3 files changed, 310 insertions(+)
>>>  create mode 100644 drivers/mailbox/mailbox-mpfs.c
>>>
>>> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
>>> index 05b1009e2820..4881a519683a 100644
>>> --- a/drivers/mailbox/Kconfig
>>> +++ b/drivers/mailbox/Kconfig
>>> @@ -153,6 +153,18 @@ config MAILBOX_TEST
>>>         Test client to help with testing new Controller driver
>>>         implementations.
>>>
>>> +config MPFS_MBOX
>>> +     tristate "MPFS Mailbox"
>>> +     depends on HAS_IOMEM
>> Shouldn't this dependency be on SOC_MICROCHIP_POLARFIRE ?
> Not entirely sure what you mean by this one. You want the HAS_IOMEM to be=
 selected by SOC_MICROCHIP_POLARFIRE ?

Sorry, I was not clear. I was referring to MPFS_MBOX: shouldn't it be depen=
dent
on SOC_MICROCHIP_POLARFIRE ? E.g.:

config MPFS_MBOX
	tristate "MPFS Mailbox"
	depends on HAS_IOMEM
	depends on SOC_MICROCHIP_POLARFIRE
	...

Since it will probably not make sense to compile the driver when the SoC su=
pport
is not selected. No ?

>>
>>> +     depends on SOC_MICROCHIP_POLARFIRE
>>> +     help
>>> +       This driver adds support for the Polarfire SoC mailbox controll=
er.
>>> +
>>> +       To compile this driver as a module, choose M here. the
>>> +       module will be called mailbox-mpfs.
>>> +
>>> +       If unsure, say Y.
>>> +
>>>  config QCOM_APCS_IPC
>>>       tristate "Qualcomm APCS IPC driver"
>>>       depends on ARCH_QCOM || COMPILE_TEST
>>> diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
>>> index 2e06e02b2e03..63f49b5bcc43 100644
>>> --- a/drivers/mailbox/Makefile
>>> +++ b/drivers/mailbox/Makefile
>>> @@ -39,6 +39,8 @@ obj-$(CONFIG_BCM_PDC_MBOX)  +=3D bcm-pdc-mailbox.o
>>>
>>>  obj-$(CONFIG_BCM_FLEXRM_MBOX)        +=3D bcm-flexrm-mailbox.o
>>>
>>> +obj-$(CONFIG_MPFS_MBOX)      +=3D mailbox-mpfs.o
>>> +
>>>  obj-$(CONFIG_QCOM_APCS_IPC)  +=3D qcom-apcs-ipc-mailbox.o
>>>
>>>  obj-$(CONFIG_TEGRA_HSP_MBOX) +=3D tegra-hsp.o
>>> diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-m=
pfs.c
>>> new file mode 100644
>>> index 000000000000..686ccd3317f9
>>> --- /dev/null
>>> +++ b/drivers/mailbox/mailbox-mpfs.c
>>> @@ -0,0 +1,296 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Microchip MPFS system controller/mailbox controller driver
>>> + *
>>> + * Copyright (c) 2020 Microchip Corporation. All rights reserved.
>>> + *
>>> + * Author: Conor Dooley <conor.dooley@microchip.com>
>>> + *
>>> + */
>>> +
>>> +#include <linux/io.h>
>>> +#include <linux/err.h>
>>> +#include <linux/init.h>
>>> +#include <linux/module.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/interrupt.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/mailbox_controller.h>
>>> +#include <soc/microchip/mpfs.h>
>>> +
>>> +#define SERVICES_CR_OFFSET                   0x50u
>>> +#define SERVICES_SR_OFFSET                   0x54u
>>> +#define MAILBOX_REG_OFFSET                   0x800u
>>> +#define MSS_SYS_SUCCESS                              0u
> trimmed, will address the rest in V2
>> -- =

>> Damien Le Moal
>> Western Digital Research
> =

> =A0
> =

> =



-- =

Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
