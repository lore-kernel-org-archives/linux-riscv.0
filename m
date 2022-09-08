Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D492ECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 06:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45AtJ8N3jhrfPuegkhChSqwhFSgtz29z47bdohkrpkw=; b=AxPRRtvEj8Tq7w
	6cAh+NHDIKrZ6y00j+l6WIbZqrfTTtA7aPnYEEUrmMnwNCw/7CSKZNZM523Y69Zb0wh3APTB9lcic
	U+7mSEFKvUmEDI8JLoSyF1qk5QEZ98Wt2kY4MVCzaESwnkzLmfloq0u9MnGppaI4STrmLKqnJCSuE
	etH48LeKI5rbEgV1tlYDsjM64qa2/lOondQoHCnqdEC9qdih/4BXF5UbdAzi4E5q5oBByJ09IfRnl
	Wn+sfSZhEiGri9Ho7dsfuNvAPCMxxGczmfW8l7ABuuACq0uxVo/61n6E+W/7Q+VEkU1Zr9ub9Kf5W
	liOryybb3t7Nks8DW+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJb-00HXGT-L1; Thu, 08 Sep 2022 06:47:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWBJY-00HXEv-67
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 06:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662619624; x=1694155624;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=XdML9w+cgVBrLO8YYSnf1+X+LwzjVFtq/KrMdFRgbyI=;
  b=goK+kP+VAcdEW6HFZf5pzawJMQL0nn/Y6d18WRQRtpr9ohdfAc7jTfHX
   PhCaMW4V2SaFxsSIxjJdfq/yJ15u26mUx6JrIhqq8gr8QVbyaU4gGLEtq
   idfOpfXkh3Kg2vpssnARV7cFMT6ujvrEcuyAbQLBo5rhPYqaEozAnp1kE
   vxIeptJzT7Exnh+Jvac2mw06LWYRj6kxSMiCec6DLpekbkd06/aqHYkvn
   8flRA/RiN0Wur82piISyxRKLqBgcepU/xiTWeFrYteBoCtpKF1zIw1WrS
   Nr1FWvct0/a+wgUE37t8ThmRv0XHHyrcQCPJTPRSlmue2LBvq82b/jj60
   g==;
X-IronPort-AV: E=Sophos;i="5.93,299,1654585200"; 
   d="scan'208";a="176154942"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 23:47:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 23:47:00 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 7 Sep 2022 23:46:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nm1TXk5bl39eP57jLFMjz3uL8bEBkG3jyezHpmpO71hH1zZ3WZXBNdlQ1nmbYHKtmN0e0goJX+uJZTciV1txLxWxOYwsnpDLPnzlwDjtjnr4hOXf/qmEFXwnPMapuubWjeyFxiAfjEbdZEi6rCuiuyYx9RyQ4ou61n6jD3nBX6ZbEZXNvt/khyC7l9SImnufZ5jGmOAo8C6fv79EkL1Kjwoeadw73Vn39UtVpoHE7xKkqAIF5v/0xJnyO0BtEemwB70gUwA8Xg2LZz4r9+cl2InEOrTADSUJUlzpot+yaSum0Lbu5AeJedI/ykt+g4sCmINdboY0mYnl4kmZK93J0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdML9w+cgVBrLO8YYSnf1+X+LwzjVFtq/KrMdFRgbyI=;
 b=VZW1wCnwr1uliAlbEA276NMyfBZzpG6UmEzHVFfvQERE98EkhgETWe1+lq2wpVj3U++/vtIKyXziMMMpD36twE8sxoW91rt/JxmPNuprjE2vfCPtzXEhfYgWb2lcAoUS6PWqJxppE4FBG8A2A/uZ5hxxCq6r6AN+Co4ki+mX9mjnRIdim56i/+bdFTf1TqR2VjCukU1P84AEPcQe9tCujegaog8xAiiGLFbsf1uiizd8MViGQlrgez9/y7E5MVkrcNVW82VGZA7OoZ3cXSlvV1REguB1L/v09y5vwpFUkHSRxzhy6D4qmFblCaUr+r3qBVPEE6dB4qajn6YASuNe6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdML9w+cgVBrLO8YYSnf1+X+LwzjVFtq/KrMdFRgbyI=;
 b=BucB7/KIl/VbAXw5moRiAFbq8foFxz8Yk/wzslje2nwDruDgF6ZdjyBC+WewNud7gyFeWI9qr9dlFuVx1QlufMEr96MMz9knWQxFe2CXD9kv0S2ggtWGL4IkRKg6bMMX1zv+dhLUoAph+SmGNxZD1ak939Zu4bs6kgwDLkK3W/A=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Thu, 8 Sep
 2022 06:46:47 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::a159:97ec:24bc:6610%11]) with mapi id 15.20.5588.014; Thu, 8 Sep 2022
 06:46:46 +0000
From: <Claudiu.Beznea@microchip.com>
To: <Conor.Dooley@microchip.com>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <palmer@dabbelt.com>,
	<Daire.McNamara@microchip.com>
CC: <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v4 09/13] clk: microchip: mpfs: simplify control reg
 access
Thread-Topic: [PATCH v4 09/13] clk: microchip: mpfs: simplify control reg
 access
Thread-Index: AQHYw07DPY7eVTRU6kSF4CNiITunOw==
Date: Thu, 8 Sep 2022 06:46:46 +0000
Message-ID: <e2a8edee-3bf3-2ab9-48c3-9f6f3c04f3b9@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
 <20220830125249.2373416-9-conor.dooley@microchip.com>
In-Reply-To: <20220830125249.2373416-9-conor.dooley@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f54d0f98-4b3f-4ed2-cf5a-08da9165e663
x-ms-traffictypediagnostic: PH7PR11MB5766:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 43/ufOSPtlGhWYtzMa7niKhQM/q1EvZIbE8rpgzBwEUx72Pc+q/Aqu+xk0e0sgDDNaHw//t3Sj2aiuQVQJtC3stwETMSdlOkVBfRqk6bd/fD5yvSOYfFgKiVzBmKxCwQSy9/rVOFp9XX+FwmJSvlAE1+HoFtnjrUn8C8tMMg4e6fJ+/8ccYYhOntuKyN9QdX4u6dPh9u4JFTQtND5Ciip0mMccRkgFWBPHscKBYUzfV+u+VNMF7TJO475HhW9g8EwaGUUXO6ZB+vEH2N017AVORDZb3+5U2gRQBtodpA9msN3GMWXWo6IpdS4j7VBmMD1sb0a9TR4XDXwZquQTXW+zRBk4phqWyVUqktNSOCDDnEZz9ALwOBJQkNR6hBVrwtNgZ8vqzgqOu450eE0KPWCheWjIZP7KKI91xD6pAt+I9ofl+tI6WrC9ZtA1UfVQxRKLVesgmRZECr7v7pD060DnwaAe7mBhsx+H/IlLRfhrvD9R71SNWW87E2+s7J8VTkZIWxQoy4BxYaS5T14q4EuehIEhMAUvxTcVZ/GoWAMWOWLNTtrokH3UB0IfKFEH4XFx4vZmQ7yM/fhnysuI7Rj7GSyLCl+ELJrdEr9Wyws+1WhryaJvhA41PpQcjCiDLJlg1BVBGDpjlxabENejxcOvgN/LTVZtua+NWitiliKOQGJ3p58/I4JiechX006v5q7bYFPkpFP9juMMwFWShARRZGAqeJxBWwOwhrOwt7w93EquWO+OiExYstCj8NomSnNtulkCwhS34km3UpvIXWPVPOj4knsDAnEeUFdjSEnGzBAq7ScMi64YoT1rvizk5PC4Sam6/lp2n83G96EOgAHA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39860400002)(396003)(376002)(346002)(66556008)(110136005)(316002)(2906002)(6636002)(83380400001)(6512007)(53546011)(6506007)(478600001)(54906003)(26005)(7416002)(5660300002)(38070700005)(31696002)(36756003)(86362001)(8936002)(66476007)(91956017)(66446008)(66946007)(64756008)(8676002)(31686004)(122000001)(4326008)(186003)(71200400001)(41300700001)(38100700002)(76116006)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3ZQcWt5MWFKUUdvSm1oMDByUVoxVkNkQkcvd0hrakpXSGlNSXV1RWhxckp6?=
 =?utf-8?B?TmJYN3dxcmJMZzZUNkpkL3lPSStEMi9xUWtXcStla0lLYkl5T2VpZTBmQnQ1?=
 =?utf-8?B?ZGMyVVZuYVUrc2loYWpPOTBIWGV4dzNJOENhNi9hRUgxTkVacWxPRUk4R0FM?=
 =?utf-8?B?UGxMWkl5TG9UeVRaUlFFd2NDM2tOc2ErMWd3a1lrYUpqRElXSEw3bW1ReWpB?=
 =?utf-8?B?SDJGdTg0WUxBQWdWNGVvNTlOUnZNS0NrdDdwSmFycnpoUnZtSG9jYkVmbXdY?=
 =?utf-8?B?YUVHQzF2VDJWMnhyWmJmWWc5VmZjRGhsY1lLNFBlaVU0M00yc0NpMi9RZ0x1?=
 =?utf-8?B?YXVMci95L0xWbFZDZVJjMktVNDJKM3BoeUUxVU5weC9XUzBET3pGYUNpSEhh?=
 =?utf-8?B?NWJ2L3NFYXBPSHNId0daU0x2MHY1RlZTc2gwYU5EMjVuVFZaSnk2RGhwczdt?=
 =?utf-8?B?dHM1L2FUZXZyaFZRSnJMTFp0MFF0NjZmOUFNd2hmWkYrbWlIQ05rQXpqR1Bw?=
 =?utf-8?B?M2MremhaSWtpeFdYSTVuajBvcnd5UmVXdzRrSmdqVDhHSHlRMWFkZWR3QlJn?=
 =?utf-8?B?aGJtbFRQRTZpSTVoKzVXVUI1bFNjUHBBTzNYa1JKN3ZtZGI1QnF3WnlYMDZo?=
 =?utf-8?B?bGovT1p1ZkdLV1JvM2hpaWE3VjZVdzl6bXBZZUVFSGsrUncvSzlWblV2Sm51?=
 =?utf-8?B?OFZ1d0x4TEtURlk4UXZZU0dtc2pwbTdvclBibEVJeU1pWmJKQjVNMDRBSjNJ?=
 =?utf-8?B?eFluRk9XTDV5K01lcFVLdy9LdzhmdG1QUHg1aktNWTVOL1lDQTFQMjd3V3E3?=
 =?utf-8?B?L1VhWng0TVNMY09aZnIxMFRrZEo5ZlVNbnlEbXJHaWVUbXNLWmV2bFZ4RzFN?=
 =?utf-8?B?VjB1enZDY1MyOFlINER4V1BoK0h2QlR5S29iR3RBalAwTWdXYUJTaTc1SjIx?=
 =?utf-8?B?ekZjUWFHOGo0QWpsTG1FVUZZQXhlSk5hUndQRE5ZWkF3R2dkNXZ2KzIrbFJZ?=
 =?utf-8?B?bjQ5c2JHQkRzRXRYZm1ETW5TWFlZeTl2Qm0rYldBVFdhN2Joc0dIRW1COExX?=
 =?utf-8?B?TUJXQnhxL2lEc3dlNDgrQ09kbHFMaXlaYUpOM0FYc3dhUkNlY0pYOHhJc0tL?=
 =?utf-8?B?R3M3OGFaU3J2ZGo0SER6cUlzSk9McllJUEJvRTRCQ2c4ZGtNMWNXRGNFTlVN?=
 =?utf-8?B?M2ZHYzlCclBFRzBCamM2N25hZzFDZkNybkNZa3lRNDk1NkYzWVNTZWNERksv?=
 =?utf-8?B?SmNDZHAxS1lGckZIOHExMlpUVDlnWlFvNWJiM0oxR3VidFJVRUlyOGlxc1VY?=
 =?utf-8?B?MGJmOVJBRGJNcXdjdXEwMjBXRHE2MERSaHZkZlRzdUdXS2RDRkRRN2F1QWxV?=
 =?utf-8?B?NWpxWkk0ZTl5S05IV0dtTlhvNkRxS1VCUi9hNnJUM1RjSXFUbUJLaUUrTk5U?=
 =?utf-8?B?dXZHQWZ6SXlqc0I5UVBUYWNwcXlLdVJudEpQMDI2SE9lZXRJZGZ1ZUo3ZEZE?=
 =?utf-8?B?UWlQNUM2ZzZKamNDM2lwWmd2UG5FTjdpUjFKZzFvK2FFQmJtWjkwL0ZHU2FV?=
 =?utf-8?B?TlF3T3ZiU0xXVTVMSmExZlRKcFlNQ2V4RWlZZFBoL3czcDBVU25FUnM3QkM5?=
 =?utf-8?B?WGx5T2RsaW14Q0k3YnJRanM1TUV1MHRFSElLazBCR0JtR2lldkpPdWhlWjVi?=
 =?utf-8?B?Lyt0dzFnZSsrZ3puYVdZYWxCMFkzRmg4eCtXYzhJYVBxUWozWTBudEFYUmlv?=
 =?utf-8?B?bjFUV2NIT1pyN0VIamlyYnJTVTBMcjFTTGE5ekJMNnRnakpZTU1rcWkzcXdQ?=
 =?utf-8?B?aFFTb3N6UXpGWUVrRDlLekRTTE92TEZCMFBISW9MS1J0UzRtZGNEY2J3Zldn?=
 =?utf-8?B?U2Q2ZUF5T0N2R2xWelNaRnpySFhyRS9RbjVpYkIyVTJUM2p1YStmR0R3aW1i?=
 =?utf-8?B?MDcvSVR2WWF4cVM3QmxFc3VHOG5sU0d0MitXN2Y1N0lIc3FZbEJDL1VSbXR3?=
 =?utf-8?B?YjhtS1l3Mm5sL3RTZ3JkSU5Tb0x6SmRyOFF3QnN4QmtkTTN5U0p5b2kvVGR0?=
 =?utf-8?B?Uk1Mc0UzK2poYjZzclBHL3ltNlFOZ2d6YmlKc1dtalFmWExxNWR0aU5HbzF1?=
 =?utf-8?B?dnlMWlVxajBTQUVnV0JSTVIvZmFJOWcxRGtlZjIwRzVaLzVLc3Vtd25yOWph?=
 =?utf-8?B?NlE9PQ==?=
Content-ID: <5361FCA14500D94AB04BC18F81E7D116@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f54d0f98-4b3f-4ed2-cf5a-08da9165e663
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2022 06:46:46.8903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xZ+yccI3EnG+IYyQRHwum+BP/Wp/1pFGvcfa4oJ3VcBu/NIHW7cvMi4HzNbFnZCwviUpp+uuZX9RXCPPbT1z/NGWfQWiPxVdO3E5zcRrBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_234704_349450_0609BB89 
X-CRM114-Status: GOOD (  20.44  )
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

On 30.08.2022 15:52, Conor Dooley wrote:
> The control reg addresses are known when the clocks are registered, so
> we can, instead of assigning a base pointer to the structs, assign the
> control reg addresses directly. Accordingly, remove the interim
> variables used during reads/writes to those registers.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>


> ---
>  drivers/clk/microchip/clk-mpfs.c | 42 +++++++++++++-------------------
>  1 file changed, 17 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
> index 845658751690..60e1e82912fe 100644
> --- a/drivers/clk/microchip/clk-mpfs.c
> +++ b/drivers/clk/microchip/clk-mpfs.c
> @@ -52,6 +52,7 @@ struct mpfs_msspll_hw_clock {
>  #define to_mpfs_msspll_clk(_hw) container_of(_hw, struct mpfs_msspll_hw_clock, hw)
>  
>  struct mpfs_cfg_clock {
> +	void __iomem *reg;
>  	const struct clk_div_table *table;
>  	u8 shift;
>  	u8 width;
> @@ -60,7 +61,6 @@ struct mpfs_cfg_clock {
>  
>  struct mpfs_cfg_hw_clock {
>  	struct mpfs_cfg_clock cfg;
> -	void __iomem *sys_base;
>  	struct clk_hw hw;
>  	struct clk_init_data init;
>  	unsigned int id;
> @@ -70,12 +70,12 @@ struct mpfs_cfg_hw_clock {
>  #define to_mpfs_cfg_clk(_hw) container_of(_hw, struct mpfs_cfg_hw_clock, hw)
>  
>  struct mpfs_periph_clock {
> +	void __iomem *reg;
>  	u8 shift;
>  };
>  
>  struct mpfs_periph_hw_clock {
>  	struct mpfs_periph_clock periph;
> -	void __iomem *sys_base;
>  	struct clk_hw hw;
>  	unsigned int id;
>  };
> @@ -214,14 +214,13 @@ static int mpfs_clk_register_msspll(struct device *dev, struct mpfs_msspll_hw_cl
>  static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_clock *msspll_hws,
>  				     unsigned int num_clks, struct mpfs_clock_data *data)
>  {
> -	void __iomem *base = data->msspll_base;
>  	unsigned int i;
>  	int ret;
>  
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_msspll_hw_clock *msspll_hw = &msspll_hws[i];
>  
> -		ret = mpfs_clk_register_msspll(dev, msspll_hw, base);
> +		ret = mpfs_clk_register_msspll(dev, msspll_hw, data->msspll_base);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
>  					     CLK_MSSPLL);
> @@ -240,10 +239,9 @@ static unsigned long mpfs_cfg_clk_recalc_rate(struct clk_hw *hw, unsigned long p
>  {
>  	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
>  	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -	void __iomem *base_addr = cfg_hw->sys_base;
>  	u32 val;
>  
> -	val = readl_relaxed(base_addr + cfg_hw->reg_offset) >> cfg->shift;
> +	val = readl_relaxed(cfg->reg) >> cfg->shift;
>  	val &= clk_div_mask(cfg->width);
>  
>  	return divider_recalc_rate(hw, prate, val, cfg->table, cfg->flags, cfg->width);
> @@ -261,7 +259,6 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
>  {
>  	struct mpfs_cfg_hw_clock *cfg_hw = to_mpfs_cfg_clk(hw);
>  	struct mpfs_cfg_clock *cfg = &cfg_hw->cfg;
> -	void __iomem *base_addr = cfg_hw->sys_base;
>  	unsigned long flags;
>  	u32 val;
>  	int divider_setting;
> @@ -272,10 +269,10 @@ static int mpfs_cfg_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned
>  		return divider_setting;
>  
>  	spin_lock_irqsave(&mpfs_clk_lock, flags);
> -	val = readl_relaxed(base_addr + cfg_hw->reg_offset);
> +	val = readl_relaxed(cfg->reg);
>  	val &= ~(clk_div_mask(cfg->width) << cfg_hw->cfg.shift);
>  	val |= divider_setting << cfg->shift;
> -	writel_relaxed(val, base_addr + cfg_hw->reg_offset);
> +	writel_relaxed(val, cfg->reg);
>  
>  	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
>  
> @@ -318,9 +315,9 @@ static struct mpfs_cfg_hw_clock mpfs_cfg_clks[] = {
>  };
>  
>  static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hw,
> -				 void __iomem *sys_base)
> +				 void __iomem *base)
>  {
> -	cfg_hw->sys_base = sys_base;
> +	cfg_hw->cfg.reg = base + cfg_hw->reg_offset;
>  
>  	return devm_clk_hw_register(dev, &cfg_hw->hw);
>  }
> @@ -328,14 +325,13 @@ static int mpfs_clk_register_cfg(struct device *dev, struct mpfs_cfg_hw_clock *c
>  static int mpfs_clk_register_cfgs(struct device *dev, struct mpfs_cfg_hw_clock *cfg_hws,
>  				  unsigned int num_clks, struct mpfs_clock_data *data)
>  {
> -	void __iomem *sys_base = data->base;
>  	unsigned int i, id;
>  	int ret;
>  
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_cfg_hw_clock *cfg_hw = &cfg_hws[i];
>  
> -		ret = mpfs_clk_register_cfg(dev, cfg_hw, sys_base);
> +		ret = mpfs_clk_register_cfg(dev, cfg_hw, data->base);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     cfg_hw->id);
> @@ -355,15 +351,14 @@ static int mpfs_periph_clk_enable(struct clk_hw *hw)
>  {
>  	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
>  	struct mpfs_periph_clock *periph = &periph_hw->periph;
> -	void __iomem *base_addr = periph_hw->sys_base;
>  	u32 reg, val;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&mpfs_clk_lock, flags);
>  
> -	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +	reg = readl_relaxed(periph->reg);
>  	val = reg | (1u << periph->shift);
> -	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +	writel_relaxed(val, periph->reg);
>  
>  	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
>  
> @@ -374,15 +369,14 @@ static void mpfs_periph_clk_disable(struct clk_hw *hw)
>  {
>  	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
>  	struct mpfs_periph_clock *periph = &periph_hw->periph;
> -	void __iomem *base_addr = periph_hw->sys_base;
>  	u32 reg, val;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&mpfs_clk_lock, flags);
>  
> -	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +	reg = readl_relaxed(periph->reg);
>  	val = reg & ~(1u << periph->shift);
> -	writel_relaxed(val, base_addr + REG_SUBBLK_CLOCK_CR);
> +	writel_relaxed(val, periph->reg);
>  
>  	spin_unlock_irqrestore(&mpfs_clk_lock, flags);
>  }
> @@ -391,10 +385,9 @@ static int mpfs_periph_clk_is_enabled(struct clk_hw *hw)
>  {
>  	struct mpfs_periph_hw_clock *periph_hw = to_mpfs_periph_clk(hw);
>  	struct mpfs_periph_clock *periph = &periph_hw->periph;
> -	void __iomem *base_addr = periph_hw->sys_base;
>  	u32 reg;
>  
> -	reg = readl_relaxed(base_addr + REG_SUBBLK_CLOCK_CR);
> +	reg = readl_relaxed(periph->reg);
>  	if (reg & (1u << periph->shift))
>  		return 1;
>  
> @@ -462,9 +455,9 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
>  };
>  
>  static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_clock *periph_hw,
> -				    void __iomem *sys_base)
> +				    void __iomem *base)
>  {
> -	periph_hw->sys_base = sys_base;
> +	periph_hw->periph.reg = base + REG_SUBBLK_CLOCK_CR;
>  
>  	return devm_clk_hw_register(dev, &periph_hw->hw);
>  }
> @@ -472,14 +465,13 @@ static int mpfs_clk_register_periph(struct device *dev, struct mpfs_periph_hw_cl
>  static int mpfs_clk_register_periphs(struct device *dev, struct mpfs_periph_hw_clock *periph_hws,
>  				     int num_clks, struct mpfs_clock_data *data)
>  {
> -	void __iomem *sys_base = data->base;
>  	unsigned int i, id;
>  	int ret;
>  
>  	for (i = 0; i < num_clks; i++) {
>  		struct mpfs_periph_hw_clock *periph_hw = &periph_hws[i];
>  
> -		ret = mpfs_clk_register_periph(dev, periph_hw, sys_base);
> +		ret = mpfs_clk_register_periph(dev, periph_hw, data->base);
>  		if (ret)
>  			return dev_err_probe(dev, ret, "failed to register clock id: %d\n",
>  					     periph_hw->id);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
