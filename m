Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B75F9C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jun 2022 07:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdpAZMh5yzuy/JEdpNTwT3LClCzzVT8mzQLH7QZf1Ls=; b=vAE3VRyguwGtm9
	FYPu/CLZIihbwpMotBwo83MpoSonuckeiyDKZPRMYYqCSF3wfMKI9q74uhmj7xIeUdL3ON/9fZYAL
	3JdJyuM0TKA/Phe0uhe37o4Sc6I7MhBTQ95GeSzjB/L9ugIolYgyWB50vHXMLzxpnwak82DT1vvk2
	W2UkKOPTcSecYJSacAWCtG4elvpoJF0A9dzedLUh6SgccFqV8FZGElqxF49TxrRdYuH7f+zUsQ95n
	ilw7xYpS1w/kLrRJB0qIg7sDYXI6KxA6QyyWKJIFq0TVKdlqGgSWd769ScSzHR0Y4PRxLxl1y+bZv
	tqEWnq7FmChJjlt28TWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65QE-004uYb-Ir; Tue, 28 Jun 2022 07:14:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o65QC-004uXX-9j
	for linux-riscv@lists.infradead.org; Tue, 28 Jun 2022 07:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656400444; x=1687936444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=wNKTA5hH7f4OaxxJZYVO+xweOYGITLosZ1WkX/gxAOg=;
  b=zyk0pbWmQbJt0DkNrTR+JH3PZ6rbpFEhNifDJn987LkyR0ThaHoqlyUV
   kmNlmzAOxa72dgjYmkvm5RauivYRPY0ONYCEVc88HyRixBHpoIdlOy12M
   ftM7kKcx3BTUbME0La5tX/3b4wlVLSfdPKUUpYNfkJ3Mg6kc87td4SUJq
   kq7poEv9NT2AIjiqgjWmLSIY03hRhcXLbLY5qzqy54AYWZnkp3/V7Dbq+
   oj5UxH1emkDKaueNdcEiX0seGL8Zo7b9GY4DUuUI+0nljzGtgrCAN8+Se
   2pL/gXasG/4Ab2d5NMnI0XN7rxyTMIKafeVmySh8bNY9oeXT62OX9/KZU
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650956400"; 
   d="scan'208";a="179795308"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Jun 2022 00:14:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 28 Jun 2022 00:13:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 28 Jun 2022 00:13:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRz2sJX+dDalvx3dImz8hMB8UJ3vRpCYYnP6JOfecKQhnpAe4rR6xnGLPlWnqmcJfwxR8eL8qu6isnwKTGQaDK0pmevx/sWPsDAqvMU2yO24XUA74yi2X5Qhegvdq2Bhx/sXHANnB/ZscYaQ4Z5KUstdbw4ZXJLWHqTrergCkVqFNe52HoRpb5bUjunrRA2YxxbSQ2/TBYM0HQlEfDw7943v8Zv0ioUsiEsC/xTk6i2YOEHsaHiwGPCOMHot5DP68brjMMbvaE/MWHcOPEZMV09XYnGnHLy3j7zapCBud+BlLcwH3XL4cYY831gAG8+A1TKG4P2rOL661uYgnvmQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNKTA5hH7f4OaxxJZYVO+xweOYGITLosZ1WkX/gxAOg=;
 b=F7zg7r5v8ynqxQE9quR9PQ5RHEJ+hZ2C1nRNGe6reZHeu0C6shWsCIriW+4yLbftD9+mul5scePGFihz998B8Xie9a8An5pBgL1sK4wJakX/csPK9TJN/Y/UfMAg3A7oblFZ2Ku6+qBvl52ytNTHHCXeL+NBABrJzYcw7QGoD3QPedCU7r5/S+8nAAMFU4C956/vAW/FQyUANQABak1PVRahyyk0SXzK29jhtwcZKfv9FbNZcoaVt7RXKifKwUStrpFELjO5LphA71U4IS2gBlihLhjrf45nGszs8n5N0MmNQL2nBNHWU6Jahhxynh+UTNFAPXkm6J9UUNF5+uay7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNKTA5hH7f4OaxxJZYVO+xweOYGITLosZ1WkX/gxAOg=;
 b=KDxrMQWh5OJ32w5zmyX1vIJJKSVW2xn8TaDgYIOwaM4D3aiu9vZ6m1eh92QMragFQrfs8PA4C8fQRLz9tGV+Dy+zlW0o9Db6Jgh2CdC1mO4BObkddz67k70Q9WzD7H1tpj6pcHkW46Zd+ZCIiuOrDp1krj0bhNj0DcYWnuNRFHQ=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR1101MB2113.namprd11.prod.outlook.com (2603:10b6:405:51::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 07:13:44 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 07:13:43 +0000
From: <Conor.Dooley@microchip.com>
To: <geert@linux-m68k.org>
CC: <robh@kernel.org>, <mail@conchuod.ie>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <krzysztof.kozlowski+dt@linaro.org>,
	<thierry.reding@gmail.com>, <sam@ravnborg.org>,
	<Eugeniy.Paltsev@synopsys.com>, <vkoul@kernel.org>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <fancer.lancer@gmail.com>, <daniel.lezcano@linaro.org>,
	<palmer@dabbelt.com>, <palmer@rivosinc.com>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>, <masahiroy@kernel.org>,
	<damien.lemoal@opensource.wdc.com>, <niklas.cassel@wdc.com>,
	<dillon.minfei@gmail.com>, <jee.heng.sia@intel.com>, <joabreu@synopsys.com>,
	<dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dmaengine@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Topic: [PATCH 04/14] dt-bindings: dma: add Canaan k210 to Synopsys
 DesignWare DMA
Thread-Index: AQHYgw9+LDzD+WbZ2Eu77tOt94oRs61j9VOAgAB1sYCAAAqdAIAAAWuA
Date: Tue, 28 Jun 2022 07:13:43 +0000
Message-ID: <1c8da6c5-bf42-0112-3828-0f86d9b8665b@microchip.com>
References: <20220618123035.563070-1-mail@conchuod.ie>
 <20220618123035.563070-5-mail@conchuod.ie>
 <20220627232919.GA3158390-robh@kernel.org>
 <40d76866-34e3-baef-c3fe-8836cd2430f6@microchip.com>
 <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
In-Reply-To: <CAMuHMdXjXGBi8S+bTG105q63zZw2ScQb9nXBSp2baiLNWKQAkg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d64017b9-6551-4044-f4d6-08da58d5bc6c
x-ms-traffictypediagnostic: BN6PR1101MB2113:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lb5q4e1umrKV8yYzGNnKjiBErjlK9WvyAWOVkeoJuXHQxDa2jsWXXCP0+fmARXg8emPDeU+Se4hypX9PkGqgKLjuUY8d9UIq2EqVagByQbyY2N9tebhD37vxoT3QC79NotQudna7XK2FtyjHRoGcGbcFN2ug3m0O+5+0B9D4acszZPsXGSDctw87YVqyNPegWlrjph9PE6Ye10VR7M/m7r+sx9GMvOAtF6SWDalaZ2IDDUpuHfAHFGmuv4aSIoZmwK9sgKhZGEF885uvVxaoSOXDLoKO1qVsg5K3tUdveIsbk9eASvijU0zgaiEW5vWQTff8q+T6iWuMACHlP5Ou4Tyr/4DfgS9RhcPs36RBw/KyBthV9/4ePbXCjPfH2t8oy0e5sij0zXg8aLTdBYoe2+zWlWSMKbN0EzX2vYx8VJbF6y+VXP2b4ku9jxPnL2SaNV87vicfe6hhHdPwdvj1IZ2jnvEUyQ3am3e2EmUOvHBbqNtmzhu5JRrPmmiIFAK2arpWRuZBrehZvgpMkpnSbZUYjxCzEWJNprPQuXDhPQ4Z739XsAVFYALykITKjsBkr0eHD2QP8sQqCyfg/7Pja/b7YSzDDQ4gwI5bhN5kh3/Wi9PJ+nmNC1wA69qgWHxy8Xw7CG5mIEV77oaKjOY5qYmo1ac373g+DLYhJOuvCjS0nwwf+gKvSLY/c48n5UV6dYFKIHBNuM9thh8KsxgS5eF9g1MeOJjfS/0b2YZAlj1oWMBhWG+uihRH3xjnh15BVxILhGMId8nd5GQ84FPBx0AoHYQ8J1sdcVCBgxewL0hHqD7hcE72TyepWbGv9MVwhMK7q8yIRKMyLqU67HhMmHmEdYZHOOib6H1MhMQoXpQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(39860400002)(396003)(376002)(366004)(54906003)(2906002)(6512007)(4326008)(38100700002)(64756008)(8676002)(7406005)(6916009)(316002)(66556008)(66476007)(38070700005)(8936002)(5660300002)(86362001)(7416002)(122000001)(66946007)(66446008)(91956017)(6506007)(26005)(53546011)(478600001)(71200400001)(4744005)(76116006)(31686004)(6486002)(36756003)(186003)(2616005)(41300700001)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0lXdVBFVE9NN21QKzg5cnROc2xieUNncTJEdUVneVlIejdHc0NsMGVORlpG?=
 =?utf-8?B?ZWlCVXNFUzBCa2p4OU90T0NCajlZR2UveE9mNWNOTEJsZjA0WWNJSmxtRmlI?=
 =?utf-8?B?WXFkS2xVeWIxQ3pZSEJPV2FvakZDckN3L1l1dVJnWGJtdGtRNE5hRXFoWTdP?=
 =?utf-8?B?NGFvbnBaT2RGUkljdzFXekNPS3FvZ0JMSnM4am5UUmdpeGhSREF6YlNIcGpS?=
 =?utf-8?B?SiswcTRlRzFPYWZZTmQrYUtoNjJ0eFpkOWltejBwN3JTQ3lyK1lNM2Y2RGhN?=
 =?utf-8?B?cm1EYXpiVE5McFI0WlZRQ1poZENxaUtQR3FUb2lRUG84eVpZRUM4aXlOSFBm?=
 =?utf-8?B?cFZSNFdkanZYZFd0ZFhodUMzd2JUaktqeVlIU0tyVlRTeTlkSlhHYzJHaVUx?=
 =?utf-8?B?bDlyL1NIbDBkTnp2R1J4cGdENUMvd2krVXpWaEl3WTZWa2oyeEtvNEYyU1Fh?=
 =?utf-8?B?S3FjLzdYQysrZVRhL3FHcmtQOE1GTFJ5Rm9UUVFYQlJtSy9HazRlb2xBMTJY?=
 =?utf-8?B?VU5yZG9Nczlib1NzWHZ2MnR3VEdKU0pnNmdFdVlTdGhCK1JGTmJjRmx4VElD?=
 =?utf-8?B?dkJaeC9LZFJxSVA4Q1ZXeWNjd09EREg1M01GN3djK0dac0pQOU05VURIbUxw?=
 =?utf-8?B?Q3B0RTJTVlQxL3V1WldUZmVwbFppaUU2THBEZVV5VG1pYVIvQXF0ampwR21K?=
 =?utf-8?B?QmF1WWZEVHBUS3I1Yk50SVJvVTVuOU5pOXo5MDlEckVKb1Jya1FzY2lxalRw?=
 =?utf-8?B?UmhDNEhzc0JnSjVQZmc3UU81ZkEzdE1WSDR0NXdyK3VwOXN2WjZWUzRyUlJm?=
 =?utf-8?B?L1RlUnN3SjVRaTQ2VFBUbGpGdHRNK0FHNEJIa2ozbVFYQmNFU2doV2gwOCtM?=
 =?utf-8?B?bmZCa3VEY3RDMk1GcDc4cUh4ak9meUExOWt4ZFZ5ZlRGcFJuTVdzSnZMM005?=
 =?utf-8?B?Z1JCTFJ1MlVLVkR1K2s0QmlVRml5NHhQZkg3Wm5ybTZubHphMkx5V2hEbmc3?=
 =?utf-8?B?emdoRWZUTHIvSlhnYUxIOE1RaEZ4eG14SWJFNzRuc2drVDlDek1PVUppcEFY?=
 =?utf-8?B?cVJSR2xmZ2F6TEFuV2lza3FNMWdMZXE0dXA4S3dOdW9pVEpWOG1MblI4VDNn?=
 =?utf-8?B?N2pTUnNVeUgrQk1HU1FNQitGUjBDQjRQcEZGUnJSMkttQ3JRMVJUeWhCQXZC?=
 =?utf-8?B?Z005OEtEdVFrc3dyM3crOStUMmYyc3VyZ1FBSkpDOTc3TElJTFFhR2xWd0sz?=
 =?utf-8?B?bEg5L0dZMWh3dUVEOE1WcGlLRFhia3Q1elFqd2xsdmRBR3FvYTllZGhCZ3pX?=
 =?utf-8?B?ZWlveU9kYW15M0RlVGVzZlN6VmgvQjVidzZpdWloYUlEQjlVV1lXK3FVUzZn?=
 =?utf-8?B?aXFDQzYvN3c1YVNQYWw4K2UxeU10Sk14cnJOMFY5TmZBMkZGL2pObW5SWUEv?=
 =?utf-8?B?MXBrMEFhMnpQZWp4b08rNlZqQ25XNGNoNVI0L2hvTkNkNzJEaGx3TVpPV3oz?=
 =?utf-8?B?WTNqdFo0Y0ZMcHNnNUtMZklzZnBvQVNxeHNDZUVvYjRxZzNUTXVuQm85ZFNo?=
 =?utf-8?B?Tm0zazFYbnQvakN5VFdtNmlnaUhZT3A4SEZpdEZjVTZIN3Z2VVQxQmJZVXFp?=
 =?utf-8?B?aFNhdEtDZ2EwYjg5Y3k2c1NiRUhHU1k0NVJaK2tYRUR6YVZENEovalFtRzhT?=
 =?utf-8?B?WDhYdXFHQmxjU28yMFA1YXg1RTNqR2U2K28vKzRIOURNczY5MFJ0aE5xTGxD?=
 =?utf-8?B?aGpRY20zS0lVOFMvM29sYnc0Y0pVdmpKVkFKZUxEaEhUbG54SEJQRS83eFJv?=
 =?utf-8?B?bzNMNGdEdk5HNFZjcGxaMW4xQnhYVEQ3cm5heG1pMkxTeTQyblRoTjVYeVRJ?=
 =?utf-8?B?WnpXN2FYa0FKVUN0ZXM1NEVTVDNoVHEwcXFkdmU4L2lYNHZaa2pTelIxT2pX?=
 =?utf-8?B?cENWN2NNYVJLWXFhcVNCRDBjWW9DdGd0WkRpR0dvdjFqb3Q3V0JFM2VYWjZE?=
 =?utf-8?B?NmRQT0Exb3gwQW5jQVl0RmsrUzh1VHV0d1BiRStHcjY1TW9obFBKV1F1UkNX?=
 =?utf-8?B?N0dQREpnell5ZGxqcnFxS2RqK2RscUFTM1o5U0kwbkF0d0hXanE4cXhKOVN6?=
 =?utf-8?Q?GBdPX52rF+WoDkVroHfj2wHBn?=
Content-ID: <6DF0F8F9F1744748ADF32B9C8282441B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d64017b9-6551-4044-f4d6-08da58d5bc6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2022 07:13:43.8257
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qfK9CrPIFHGom7uaxWc3DjvTb2D60eNWZ7NLpB/QBJx/8N5i5j1NQtoQY6wjy9vX7Ufj8Cbsygw+IszFqmFjYfXFcTub8MY2yh5LXm2nm0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1101MB2113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_001404_391399_3265CE34 
X-CRM114-Status: GOOD (  14.59  )
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

On 28/06/2022 08:08, Geert Uytterhoeven wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Hi Conor,
> 
> On Tue, Jun 28, 2022 at 8:30 AM <Conor.Dooley@microchip.com> wrote:
>> On 28/06/2022 00:29, Rob Herring wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Sat, Jun 18, 2022 at 01:30:26PM +0100, Conor Dooley wrote:
>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> The Canaan k210 apparently has a Sysnopsys Designware AXI DMA
>>>> controller, but according to the documentation & devicetree it has 6
>>>> interrupts rather than the standard one. Add a custom compatible that
>>>> supports the 6 interrupt configuration which falls back to the standard
>>>> binding which is currently the one in use in the devicetree entry.
>>>
>>> But it works with only 1 interrupt?
>>
>> Seemingly...
> 
> The Linux driver uses the only first interrupt.

Aye, that was my basis for the seemingly ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
