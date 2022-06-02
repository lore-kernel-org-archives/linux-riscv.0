Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB937C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jun 2022 04:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0zRTaD670EPpy4uHT2Ay1xpRAO7FZFCTx5nOeHy1KA=; b=1QXafuCrTJLSrR
	IAkL8WeeEhGvuxH4IMWvyt/r7mrvt4wEk3o+6XygjpTPU28du0AdEpT7Tx6fOtu94OhL2FE40QXy4
	HKgddzpKfCBOAa46Lw5XBoRV5PpDMuw4bgxXgY0iNbK+yvCedED7If0GR56WvR6QUAflGhkuiHu0d
	sUeWQVA+7XmUNDRN/EdCFkZtn+q7YKQwLzvYfbT1huR0CyWWmAebqZmim0busMsZuWbwo16ATS+HL
	z8o/6gTSaOzR5AsLgG3ynOnZeKHVxvxwLiIvgBX4GqiNWe6OtebcFK+ypUCl+2ZRpN55UXraEynnV
	0J+cOPjxMZ0Vy+q0PzdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwccB-001NOE-KQ; Thu, 02 Jun 2022 04:39:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwcc8-001NNa-Q8
	for linux-riscv@lists.infradead.org; Thu, 02 Jun 2022 04:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654144756; x=1685680756;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pWiLzVPeTDv+PLIYOaLANAFXJbeyOmaPNWUryJKKXB8=;
  b=ig2W0oTZb5yY9FFZ3UFw0K1S9HB55crPQuWhI9kf8O5Qm7Y8LOGzfzsU
   yD6jBuyd5aIEESJ8gUluu4QiVA94A15gIaJYxU89R+terp7fqFehuEire
   MxJh4wnasxolLsQVGasNQ7PJtj6vQadRmiXjREc+KfaIUanwj7uuRJCNP
   CCRpS+0nWNTagHeYwVEkcxWN8A65+H7j1BPRS6f4trxku3RQjCjCTxC+g
   lWSw2zNkqYLXVgfDoVkS9AtHI7hhGJufZ2cOEQlnkqpgysbb1wVxENcYH
   67HDYrTYh5Sur8HBLqjFRN6am49BmAXxd9go7sYc/Cjrw6n0In3W3NLo7
   g==;
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="176181168"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jun 2022 21:39:10 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 1 Jun 2022 21:39:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Wed, 1 Jun 2022 21:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ah1nFL8l2Gv29SaIZVuOxr5ipAqQ4gpKIZsg7jD2rm1/PNnaHM5gw7lKWITsHitUDMPgYBvzUYZmGHfVSOijCWt0P4k0ZbArJ+xQTPTPRwnBCKZHWCq+zvC/2fGTcNSpnOGDVtPixJaOqvDMnQxZg1IFJ/DRz0oSXFng4iG/oEYaT+QNN52AMWLm8djPBotiwQ3Lsn7aisy+wgu8vsn4CEi8oYaLwV0e5A0R3CuZaGY5oNsLXkoGi9+PsFbuvTfil6oXhqpIvC1jqK0HTyp1iA6Z4aM/n2NwjqZjsHATHdexIC9p97y1f0aVWFnsvAr0qskVuooXfXMj9/+lpbe+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWiLzVPeTDv+PLIYOaLANAFXJbeyOmaPNWUryJKKXB8=;
 b=K0Nnnk0gGWfk+8xDoij6Do+48IDlvcftwQioHvMzSaM2JgcBEsWx2Pc0pMbcjecCGHLmo6N8o3bWnwBw1NCX7FTt0y8SAABArKOXVaNuG80pFBhRkNmgekHJDubfQSIc459RpjKGbdmVD+uQEFGVXWsES6Z7Dhe7hiMYuBQcTWta9W2EURrrSM9MbmwFY5xIKSEwxR0vKfj/tR65wd2nLJk+Vml0jBFVSBjFPR7aZcE/YzIBdJ6jI0l92B08wg/ygrQY39KzavnaqtmvmpujLGIi9GC6+hhTkF+HNeRzwSl/Q0Sj+uFTaX0UlNmZ3ayLbF0ytV5ApvOBi1GAdIgHkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWiLzVPeTDv+PLIYOaLANAFXJbeyOmaPNWUryJKKXB8=;
 b=TKjdNiHUZ1svmzfWL9OBe1WmGWxNP1rIY7P57h1JKbwx4MNGnnqx6qpEr8amUo6cXSPWU3oyhHhc5iQPaO763eOPPEyV0WE5VgdFlcudGUn0nb6Ja5iHV/+ZSK4EngyHRa1qxAeNAvOtOdw3NZWEu7oE9hWTQK8VT6iR2u7PeoE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5357.namprd11.prod.outlook.com (2603:10b6:5:394::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 04:39:09 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::699b:5c23:de4f:2bfa%4]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 04:39:08 +0000
From: <Conor.Dooley@microchip.com>
To: <palmer@rivosinc.com>, <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
	<akpm@linux-foundation.org>
CC: <sboyd@kernel.org>, <linux-pci@vger.kernel.org>,
	<mturquette@baylibre.com>, <paul.walmsley@sifive.com>, <kw@linux.com>,
	<linux-clk@vger.kernel.org>, <aou@eecs.berkeley.edu>,
	<lorenzo.pieralisi@arm.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <Daire.McNamara@microchip.com>,
	<Lewis.Hanly@microchip.com>, <Cyril.Jean@microchip.com>, <robh@kernel.org>
Subject: Re: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Thread-Topic: [PATCH v4 1/1] MAINTAINERS: add polarfire rng, pci and clock
 drivers
Thread-Index: AQHYYG7KcHM3Zb8ggE+yYwRhcaPSb60sczEAgACJPICAAAITAIAOiFsAgAAtrAA=
Date: Thu, 2 Jun 2022 04:39:08 +0000
Message-ID: <fffa1761-9636-f6bc-fff3-54b6a60f5c8d@microchip.com>
References: <mhng-5c57560e-a00b-4fd8-95ee-5e2fc0dcd34c@palmer-ri-x1c9>
In-Reply-To: <mhng-5c57560e-a00b-4fd8-95ee-5e2fc0dcd34c@palmer-ri-x1c9>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81163f82-e25d-4589-c2d1-08da4451d554
x-ms-traffictypediagnostic: DM4PR11MB5357:EE_
x-microsoft-antispam-prvs: <DM4PR11MB5357FA9B50F89CAC8419D4E698DE9@DM4PR11MB5357.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B8BD4tJ+jVsSdS1K38cW6aGJbfaszE3+GwIv3Z88ekpJK5Om4UoBsZJdVstAyG9bPErE3BIFM182VX6/8ncbJct68cWJ7hAsHESmYSwM8SJl0mXAN9V4KbfGqpiVNdWgGN1ttPnQXqSN/WAvwN4zEqecTjithr4vVvvzjKPurbWfWyv336MmOFEInlcKDIp2T1uA5+MspQUTsjMS7qzJfUNXgODw9xm3Xukd6Q+N/0qpfg3kyCfDHNpFu35I2KnsRhLL6uo0KqCS2pw1tcyeGAKSAQ6yhyvkCiOpQEobwIq3S3ucqYcweXrjWxHy0rFdJEMDuJ1SSuH+t2BvGrjLq1O7nUzimT+/sHXLoyODv7znc0dyZ6izKRmv7ZrizwEsMXaXFKm9p4zbQdWx6dnUuyEfquLUALCB6i9cK5a8twYVkV34nYUiL15pdzfLhtH58adflOrG/dvQvocnETUrXK94TlGS9jXAJzaECBSlOxLsZr2pG0OhVqk6fxNiMSYb77W0h0OVBubCBkqLGt38lDi4zKOr68eQbWEZnOi6R5CI01MTdDQ37riR4PybO1J05JS30Rio/8VTl+vEjb8LKzZqyD4uz9TQ/bPUD2djZxKMHf4HslstID3zRsrWam6NP18oaocxe32kmLtTJMGHgE3UbEvJe2QALZKzjhhOg0Sa00HlgyPXnZlc0iDzxgEV4BOcY4MGRo5zHE1lEQ7yOrr2Aiz67FtdAWnCNekyg48dw6kYh3FGZxoP+oRVT7WAz4F/8TTMfDYdFEd24GHlzHeqSjk57MDrPw9hdrv048Ly46MZpqUt2/AsYr/jwDCOd3uxXf+ugkS1/i85DErB/0r3IJLPTaE8t0iYjJAFgwA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(38100700002)(36756003)(38070700005)(8676002)(31686004)(5660300002)(7416002)(110136005)(122000001)(186003)(83380400001)(64756008)(966005)(66476007)(66556008)(66446008)(26005)(316002)(54906003)(6512007)(86362001)(8936002)(91956017)(4326008)(71200400001)(53546011)(6506007)(6486002)(2616005)(31696002)(66946007)(76116006)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0hBVy9ZYjZNd01xMEIvUjQrUG03SG80T1ZQT1h3djNrTDgzVHN4dEl3Vnd0?=
 =?utf-8?B?ZGZUVmVUMzNuQWliVUs2MXc5S2laM3dCYXVkT3RTQ2NSTTlLcmpyd0c1OE44?=
 =?utf-8?B?SXJKZncxVjQwK1JmclpGVGVVZ0tNWnhlZFFOYjBkV3A2K0p4VHRYcm9Pd1A0?=
 =?utf-8?B?eHFwQjRpZUkzL2dhS1FiNnFXaDI5WlNWenFGWit0K2JVVUNDTzYweGNPaGlr?=
 =?utf-8?B?NE5acUM0RENWOVpvQVoyMmtFRUNaN2hSejVzRDB1dWdIaTk0MGJVQ2Q2YVFq?=
 =?utf-8?B?Um83Z2JJZHJLK2NlMk1FaWJVMk9RRVZ0KzBDSXc3TWNQTldSZjRQZU5LWHVi?=
 =?utf-8?B?NHBZTEowR1RvNnNoak8zYm14My9HMEw5eG4zYmVNa3dqL2szWlcvY3hGTnRJ?=
 =?utf-8?B?UGlDa2VnQUVLWWZETDRBSUNVS3c0N3preE9wcGpxajE2b0hqaElJaFR6K3hM?=
 =?utf-8?B?cHBsZ29xZ3ZmLzFzVDJ1T3pHdnBCWS9OT1U3VEFLM1RPdGJuKzJkUExlYWRh?=
 =?utf-8?B?Nksya3VFV3RONnNsS0pVZERvUlEvUlJqb3RjVW4zV1N2dGdHSTJ0U0ZwVnBU?=
 =?utf-8?B?b1ZWWld6OFBDYzZWQVlsdWNvb2VFVTVhdWF2QWZjYkJvWC9xUXJVNzIrWGR2?=
 =?utf-8?B?K0JaV2RWbDc3NHlCb2szN2ZGaUpDWjk4Wjh5YnFOWTRJTmpjVWtsRExBdytv?=
 =?utf-8?B?YzkwQjJYazk1MTQ4emJPejBqYUNNcVRpRkh5SlJRUWpYOFQvbDNwNURUamlj?=
 =?utf-8?B?eXdvcDNEQU12N0Nrd29OYXJpRnVoNDEycHB1aVdaTzlYQjNudUFERU4vWDMz?=
 =?utf-8?B?MldhNWFXRitEVzlCYis4bEUrZmxPOTFldWVvaHY2QmJWb0lTZG9EWlZscFdM?=
 =?utf-8?B?TGk1d2xnMHcrSjFaQ0dac2VtRis2T3FQeHU5YTc5SWlhbGZJZEJUd2g4Ui9S?=
 =?utf-8?B?cWgvOUwyVjFTRFljcFBBTUdXMXJVSDl0amZaRkhPa3dhMmRyTU5oSFh5c2Uw?=
 =?utf-8?B?ZjlSNlhrcVBJSUdpckJ0a3Y2dHlFWTlBbjFST2ZrMWN4amdJdVorSXdVcjFx?=
 =?utf-8?B?cGNJNWdvOWNVUGpQOEt4UURVcVJRTk1BRnBrOGU5dzNncDcvZFVWK2ZMYjhz?=
 =?utf-8?B?U0pqWlAwZ2VMS3YvTzd2dGRoSzllUENuTHd2WE1YOHBaenF4aElIdmRUdWRh?=
 =?utf-8?B?QWlvOTZGaUl1UWdvdGlEZzJ6TmpzRE1GU0srTEtDbWlPZ0xuN20zR0xUNURk?=
 =?utf-8?B?OHRBSUJXL3VncHdmdXdrSDZtS2hxOTd0UzdiZmdUMXJoRTRUeS9DOEdoMnox?=
 =?utf-8?B?ZWtNSzFvNUR5c2hSRUJuRkY5SjBJOE50RGFtNXVZTHVEcU5SZ3dXbkF0YkNI?=
 =?utf-8?B?YjNsOXoyZHNONGt2aXM5cXJJUllSbWR1Zk9EeFlDRUZrb3pTdGx4NlRNSzhN?=
 =?utf-8?B?clMrVmRveDNkRy84REEvRTRZWmd4aCtVMStvcUpIYUJRdEx6bk5WWEY0TXVt?=
 =?utf-8?B?b3BVWFIzSlNVWFQ4R3J4NUZUU3hmS2l6VjVqSS95emljbXJFSGdXWHV4RHJa?=
 =?utf-8?B?Rlo2K1U1UHFkK3dLbVdVSTluOTJNeVNiT1Jaa2NZams3S0hCemdncUIzUGpE?=
 =?utf-8?B?Szh2UFpuZEVPZmFINTdrYVVONXNNeC9KWVJUdmtYOEVuVDVnRFVUSVRRUTdE?=
 =?utf-8?B?OTFMWkx0cUZ3byt4cVRxcmdPS29Cd1JlbkVOWjgrTGpLaWpzMWhTZFU0TkV0?=
 =?utf-8?B?b1lybTlkNjFNYXplcS9Qd2M1QmxSMWtiSGpObEp3L0F4akpnSmVWMTF3MFUv?=
 =?utf-8?B?NWJPQkFoOGM1Z2lNOTRWUnRjcU84MGd5SU9vS2lnUTNIbndwUnRKeldJeGNq?=
 =?utf-8?B?NFJuWUJncUVIUlk5Z2dLSEhqbTdEWks4a1YyOVVsc0k0OXQyeFBjWStPcVpV?=
 =?utf-8?B?dVkwa1RzQWk5ZkNmWm9paFNSTXdMQWNUa2U0a0FTNW1XY2QwYVYvMG1MckxR?=
 =?utf-8?B?eHFMZC9OOXVlSjZnWjQvejE0bjBmejRsY1ZSTEVWcFMrQUUzMHEyUVl2Vkpm?=
 =?utf-8?B?eitpZUtlYXp2Y2FCQU45eVd2Ly9UR2haZjczbkxXSUY4a1JsTW50NmY4NXh0?=
 =?utf-8?B?aXVJZGY0OU15aVdwVkllK0JIdHUxMmh1WUNURXBmSXVLa1ZWdGI0enN5dVlZ?=
 =?utf-8?B?TEVaeUJhQnI4cDFLZHJTTkVzWnRFdWJCWW5uUDk5OUtTa3UybXpOSVJDVTYw?=
 =?utf-8?B?dnFWMFl5eEh4N0hGR0VQUGxsQzB0WDhFTFBkNjNSNXZ6L2IvSkJDdVZLUlE1?=
 =?utf-8?B?NXY3RlRsd2lEU2dPOUhaTUxDSzFOUDFzZ2Jna0NMbGM2cjJWZUl6V0kxSk1V?=
 =?utf-8?Q?t5NfhktLi3bmROWg=3D?=
Content-ID: <CCF30121E4ED9A4BBB81BE1253B4F037@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81163f82-e25d-4589-c2d1-08da4451d554
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2022 04:39:08.7863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C9eTamm1jQdwoq7WNWJVMdQhWL8jGAiW+gNo2LVb3BiFWH02sZcr0xXlWrB81PflrHsecwIxRX7Ib8pIEsXdutrBbhTo0FotsMlIfyggRaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5357
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_213917_108772_B6AE6F3F 
X-CRM114-Status: GOOD (  25.97  )
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

On 02/06/2022 02:55, Palmer Dabbelt wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Mon, 23 May 2022 13:00:01 PDT (-0700), Conor.Dooley@microchip.com wrote:
>> On 23/05/2022 20:52, Palmer Dabbelt wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On Mon, 23 May 2022 04:42:53 PDT (-0700), Conor.Dooley@microchip.com wrote:
>>>> On 05/05/2022 11:55, Conor Dooley wrote:
>>>>> Hardware random, PCI and clock drivers for the PolarFire SoC have been
>>>>> upstreamed but are not covered by the MAINTAINERS entry, so add them.
>>>>> Daire is the author of the clock & PCI drivers, so add him as a
>>>>> maintainer in place of Lewis.
>>>>>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>
>>>> Hey Palmer,
>>>> I know youre busy etc but just a reminder :)
>>>
>>> Sorry, I didn't realize this was aimed at the RISC-V tree.  I'm fine
>>> taking it, but it seems like these should have gone in along with the
>>> drivers.
>>
>> Yeah, sorry. In hindsight it should've but that ship has sailed. I sent
>> the rng bundled this way b/c I didn't want to end up a conflict.
>> Obv. there's not a rush so I can always split it back out if needs be.
> 
> I'm adding a bunch of subsystem maintainers just to check again.  I
> don't have any problem with it, just not really a RISC-V thing and don't
> wan to make a mess.  I've stashed it over at palmer/pcsoc-maintainers
> for now.
> 
> Sorry if I'm being overly pedantic about this one...

I don't mind. Maybe this should go via Andrew next cycle or w/e?
There's obviously no hurry etc

> 
>>
>>>
>>> Arnd: maybe this is really an SOC tree sort of thing?  No big deal
>>> either way on my end, just let me know.
>>>
>>>> Thanks,
>>>> Conor.
>>>>
>>>>> ---
>>>>>   MAINTAINERS | 5 ++++-
>>>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index fd768d43e048..d7602658b0a5 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -16939,12 +16939,15 @@ N: riscv
>>>>>   K: riscv
>>>>>
>>>>>   RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>>>>> -M:  Lewis Hanly <lewis.hanly@microchip.com>
>>>>>   M: Conor Dooley <conor.dooley@microchip.com>
>>>>> +M:  Daire McNamara <daire.mcnamara@microchip.com>
>>>>>   L: linux-riscv@lists.infradead.org
>>>>>   S: Supported
>>>>>   F: arch/riscv/boot/dts/microchip/
>>>>> +F:  drivers/char/hw_random/mpfs-rng.c
>>>>> +F:  drivers/clk/microchip/clk-mpfs.c
>>>>>   F: drivers/mailbox/mailbox-mpfs.c
>>>>> +F:  drivers/pci/controller/pcie-microchip-host.c
>>>>>   F: drivers/soc/microchip/
>>>>>   F: include/soc/microchip/mpfs.h
>>>>>
>>>>
>>
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
