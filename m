Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7468C19F2D
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Aug 2022 17:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YmUkYfgdJggQv7hFi2dJcMDfWOVv9mZ13xc/0lY4qdI=; b=ihKbrTjlvlZC+7
	n7Z6W2TLzKH3Dl5qpgYWjViDfKxWwbjEzvCmgO3fJ15ST6rOi4DXWzGx1n1GalW7gOMrXbXa7OuXk
	PZZAplXRcPgQx5ok1908x+JHG/YJ022hKYVL7pzEicQLevLBzIou6y/B1bKvCacVogpKizijFuJ6e
	SPFHkRBp5gkdmdAZvtnAz32yyDlaz6vpDi1SaTLcl28LUKABgCMbCPcSLzQqBM3eQS9WrlwW56hwL
	Ef0ALMVlnewjwNPGRMh69LQgQDKKyaCXLmhJtwbvJgpMMzMdiCguBy20Op6luUoBIY1+qBIWRG+kS
	h0HdSzFxKVxzx3iiGX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLT3q-005HzM-Vi; Tue, 09 Aug 2022 17:30:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLT3n-005Hxd-5M
	for linux-riscv@lists.infradead.org; Tue, 09 Aug 2022 17:30:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660066231; x=1691602231;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=IW9iAsJ10mJ3/tDxLNeEDD6taNj2dQOZTDtnbMSTUxw=;
  b=qoq+Hd89clhTGy1b85eCpZ4KyGuekVjbCyLwGkYXbS/fkWc4v6nf0sfD
   Z80Xj2iQ0Gah5MqGO5LAf+d/oWJ5Pqm5j+N4lS+rBs07X20AtBzmQU0tg
   t0YayJ5eJzKXs5A/vrxE45C9DNtlU+2XyLyz7C1Z4Zdd3XCschXM7Kbcp
   Pf0AXJ4f0H3OIXkqvaomBw69OW8A/aEikjfLg0gekFxuzeEhEQsCrARDP
   wvO4q2CBChIyXKmykTEqRsEr1/61ixoz8xO6E6JRycgHyAdNejFzinCn6
   6Kb0M6h+TjakPqfMV9G4FuvHoLwAw/8aDcypVw/XrGk+A99Ky+FW6EM3D
   A==;
X-IronPort-AV: E=Sophos;i="5.93,225,1654585200"; 
   d="scan'208";a="168519781"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Aug 2022 10:30:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 10:30:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 10:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cGfBoMq+HStrV7FV5XjiWnr6jVQaFv3Kw0LypQi4+wyDG6CLruB3+hC+EHSy3pL2QOaVdiZJ5YhrdQ0LIIOeWjF3oZQgJxdMJZtmeTjzEIwVF/fD91AWBZ7jAb7q3oF3JmTzPHW9T5To47Z8hD5xY7RRpiRRrJisVIERZBAtNXUkJFA4FChnysloP2ekWs7WewwQSko9QZy78AUdelx6ANWfqUzx0zs3bdAQNbwa9XR27YRHejQbjfGAOxwQZ0P0asHbubSPAtML1a8wipM67qgBs5FKtVE4h/YrM4UwsA4b2DvdmprPiNVRmNvxdgjHxrICPXXBiR/2hJvca+j+7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW9iAsJ10mJ3/tDxLNeEDD6taNj2dQOZTDtnbMSTUxw=;
 b=McmgIQIeAEqarC8fEniiPxmSwqMBh04ywNYCzaq9fQ6AHf7VNT7dA6upBeLIJjuS9yQ112oXcO+1pIKoOosWhK/5HhfnsIOeafriAGVO2B9W04tUIKsrvfeeY8XOFu4n6wDQryfflEFPmeoh9auf5kZZQGxLEDjfam2b5yk5ljy3nE3WO8m98pvOL6s1Q96ogY4wptQYtWtZn1+QC3sQYtsV1GjvX50pFm51UD8XLksDxhmTee9Jy3iRo3ji2DewdRreg+m8JiboPOTzKR9pvE78OjbvK0wOPmP6h23w/UqEl3TTQgsfjBoOgfe+tZrOZdjrdGAZRudFtOp4jq3s9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW9iAsJ10mJ3/tDxLNeEDD6taNj2dQOZTDtnbMSTUxw=;
 b=lkx0II8dpxyAbfn2DFTQ7AlzYKQJbFAwmBYfJYpXnKWLCbDtV91LDyzyZy1LECtrMOotU7EABJj8VrEROEg3nv7O4KONv4WsAqyn7t/YKu6qSEd8LC9F9wuTpXALUeZ4K8DEdRvR+tFB5salLJCoiONitOQAn22PWg7TkAXHbLM=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4695.namprd11.prod.outlook.com (2603:10b6:208:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 17:30:23 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 17:30:23 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
CC: <tglx@linutronix.de>, <maz@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <mail@conchuod.ie>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<daniel.lezcano@linaro.org>, <anup@brainfault.org>, <guoren@kernel.org>,
	<sagar.kadam@sifive.com>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<qemu-riscv@nongnu.org>
Subject: Re: [PATCH 1/3] dt-bindings: timer: sifive,clint: add legacy riscv
 compatible
Thread-Topic: [PATCH 1/3] dt-bindings: timer: sifive,clint: add legacy riscv
 compatible
Thread-Index: AQHYqOiTfnLvLugGpkCEOv+1M1wBVK2mo24AgAA2KYA=
Date: Tue, 9 Aug 2022 17:30:23 +0000
Message-ID: <13df168d-e414-e167-c3c9-c04eb29c675a@microchip.com>
References: <20220805162844.1554247-1-mail@conchuod.ie>
 <20220805162844.1554247-2-mail@conchuod.ie>
 <20220809141632.GB1706120-robh@kernel.org>
In-Reply-To: <20220809141632.GB1706120-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cdc48bff-75b9-4784-bd1c-08da7a2cd76e
x-ms-traffictypediagnostic: MN2PR11MB4695:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KzOViSdVkFtks1garL+zt0XrWZPbdGbK9CAx6yrytc8AX1PKoitj4jJTEZ6uXGrY55ibLBseXmazMxzh+kejUCmmJNhI46PKxKMA7cA02RVJ0wKuEe8ROb/K2du3Tr3XGPUBI0VXd1yfHR6xQoy2/avKdN8FfK78I9bJ94DMzzEcwq/7BU5UKp04j5c4cEXwesJkESp+Wm327UbIUh5NS5hFaoRNezLfWrubLrCqMEyhu/CEPpeP0sRKjgQB5vSF5Q/EgHm1kMZzKxEHpiM5/6/0xr57sjdb3opAR3A6TkGmQlzU0c9RCrQela2nJIwyZFskek4sIXR8sq8dMxoFkQR3cm7u1OltxV8EuN0JYWplUDNXUA24yP+w9FM45mMYd1FHNZBjtaUc/0MvJiSBfhn+Fh4lkNHMJj8O/l8rK7GwFzvIs+DG4dg0cVLNUEQHFpPd+jwAVcCnjiYEC4oR4ZIEdpHY4OM+hOynGDE86WohpwM67ucvo6dxH/KM1n6zZFughG81EP1snVMokWL4a5WJmMMJb3NWMY2gJImNSmmhHrmZUgEOlrJXdOm3KuMKj22K3AVbeZ9gKphDGmeI1QDsL8nE4i21obbAPeZ5Hjq3qOg5IOz0hROb4bATfBh3k55w9g29AFae+arGezhPsxgQzvt2V5GHApNLKXXAUo/4cZq2oZ2tblvG1RUf17mqPVhlHkR518a+IIBOFqK5F2JOom05b6X2rdT5pzCr0XYObeRfvk1EiktRZTc0q0j+vCziZIb7hhKgq+mEAjwBKGeKYjfAWXilIJ4EDiuyFQIG3cH3LGcVBmRPFYXHtsaev5AMiryJlesv9EMBx7QN9bf/bgznrtXuvLN5UywPpPqRA0byPq6sJ9E6sMnNgrSkbln3uqfSvdXMaigmoI+Cnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(376002)(346002)(136003)(366004)(396003)(6506007)(41300700001)(53546011)(2906002)(6512007)(26005)(86362001)(31696002)(38070700005)(38100700002)(2616005)(83380400001)(66476007)(66446008)(122000001)(186003)(6486002)(66556008)(5660300002)(8676002)(76116006)(64756008)(66946007)(966005)(7416002)(54906003)(4326008)(31686004)(6916009)(71200400001)(91956017)(478600001)(8936002)(36756003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Lzdqa2JWSmtNb3JET2FFMDRlbkxUaGFiVmJMVkx0SklseGxaV3hZNk1DUjZs?=
 =?utf-8?B?T3RKMGxzYU5HVE1FbHFXcGpQU0UxZ0N4R1Y3VlhlOGJldWNGZktCRGlXT1Zp?=
 =?utf-8?B?L3dyMUVJOGNDRWY2U0Y2WkxaS2NWQmhqbG9OMnRkZXpISkpmdU5yMzNvTlha?=
 =?utf-8?B?MUVucXVlam9nc0NJRi9GeHhaRWhIM3FzV2NsNmw1d0xSUEZBdlpuZ1V2aXV2?=
 =?utf-8?B?ekRhcWt0QjErZmpWSjZ5V2FhRHcxT1lzbkRoMXNVMk9jRllCcmtBbVAzSmps?=
 =?utf-8?B?aGFaVE9MODRIc1M1M2FsdVJMSVo2ZEV3NGZlalkvZHpNUEE3SkxxWXUwYnNx?=
 =?utf-8?B?SVQxOVZLbVUxZHMrUU5kSktkVjBURjVOdTVLQmdHajhDSlViQWwvMzFNWXZ3?=
 =?utf-8?B?a3BGR2kzSnhyYnJyNFQzcC9BaHFzbkJ1SXJybjVQYUNrT1gzM0hEa1d1c1JW?=
 =?utf-8?B?NWpNanFKcFYzOEhnalhKaXZ3L2RaMWVPQ29vbkxFeGE1YU1mZ1UwQWo2RHJM?=
 =?utf-8?B?VmgzN0pFVDNHa1hwSHNKTGdxWEN6WmVUUmprcG51a3NkWTZMNnR0aHJObFYr?=
 =?utf-8?B?VG9NeWJXTW9jRjZQTXdsT1F2cS8xNTcwMnN4cDFkOC93NmJyNm1IQ3NzeUFs?=
 =?utf-8?B?U1Rnd3FsT3lmNnFTZW5BRXRFU0VvOEl6NGFoandzMFhWQ0s1cGtRMVRTY3Bs?=
 =?utf-8?B?Zk55anlSZDJ1Nnp0N2FIbStPTDZCS1pJbWtsU09hWk1GbVVmUUFlWUU4S25C?=
 =?utf-8?B?TU5oeTJWa2dkczlNWDdEWEg4Vi96Z0dvVDF5UUNOQXlKTzdJYkpSQ083dkY2?=
 =?utf-8?B?dGpIaEhaa3lSSHM5U2tNMzdCaVRkckN4dmE3cmdJUEw4b3pjQ2k4eHhNK04w?=
 =?utf-8?B?NU0zNUNYZVk1UjFZd2hyR3pCM0F5bmdnQ3crV1JIZ2lCOWY1U29TWUpmK1JK?=
 =?utf-8?B?Ky9EM25iL095K3M1dWNTNVlhQjJZamhoSnVFVmk3R0NQWDdoaHEraDdMYUVJ?=
 =?utf-8?B?OEk1QmdsRmZRazhyd0xuTUVaSVY1R1RFS0JaMm5RdDViMHRMTjA3MW11ZzVU?=
 =?utf-8?B?ZHhCU3RWWGRKaDhKdTltQ2FxUE15UFkrKy92VEhtYkVxM0pWaHhCTTFyRWhW?=
 =?utf-8?B?M0U0RkI3RG14b1Zvb3NSS2RGRGMrQ1JWaVJqTkhVUG9QK0gyZkF3WXhYV0dI?=
 =?utf-8?B?TU9yU1Avb1NPNzFKcHlnR2pxV1kzSVhJK2drMWU5N1JFckVDVE1TUkRJR0tV?=
 =?utf-8?B?UDFxcHA5MjBXeUJaYUJqa1QvcWM0RXBvQ2JjZjhaalI2c0VPbnZ0Y1RqbFpj?=
 =?utf-8?B?WFhFbFBKUFZ5OE1wRVRyZVpCL21zdDM0RmkxTHRpaFVoU0w5eE1OWU9mOElI?=
 =?utf-8?B?Q204d3gvWTNhU3hNdm5yWnBWeFk3dEZleGYrODc5SFBhbjg3Y0NZbmRLYzdj?=
 =?utf-8?B?Ly95bWxrTGlhd1A2WDdWOEFhQmxJUTZ3aXQ0dHBneWxtbGtjclprNHNTakhu?=
 =?utf-8?B?Y2liUkxTZXN5MzFhQzdFSXJBS2x3R1o0TXFVV1VBeWZXNkd6eDF2ZlZIZkQr?=
 =?utf-8?B?YnQ3cFI1L0N4L0tLbi81eW4zVmxGYVRqOXgzNGNIdU91YUJ3R0tvZEx1VGJ1?=
 =?utf-8?B?bzhnNFNoZ0RDTnd3Rnc4M0k5dW84OFAyUzJKcVd2S1Y2Z0ZPV1grYkh5eEFN?=
 =?utf-8?B?Umo1VnVlQWk3eUJJZkNKL3E2UE9pRS9pVVJGcmhCNVc2S1Z2ZUwyWjhyRHBO?=
 =?utf-8?B?TzBvUTdIbUQxWVNIcG9CMWk2R3A1cG16TUNlKzgyblc4NVd6ZmZwYlBnRlBU?=
 =?utf-8?B?RG1yMktmekxhM0RjYWtYenoxajNFUkdqVGxsaDl4Mkw2NjBHTUJlT2JZK3VQ?=
 =?utf-8?B?VEJrTjVQRkVuZWZXNXFmK0xXQ0xIUU9pdEFjV3pIMTcrcks2TlR4R283YTF0?=
 =?utf-8?B?UEEraXZoS0lEazlSdjJmYUs5em1wSmtVMGZiUFUxTm9JUWRUNzZWYUtlc2pS?=
 =?utf-8?B?RXdNS0xPdlIyZHU0TVFBZldoTXBtRXlKN1BoN2hlZFp6MWRJSFQ4djdxcXo5?=
 =?utf-8?B?RThwWkFYN2FjV0dPOEVxcU5KNXdKVnJxQjhhaHJwY3BTTlhZYlBkNS9uRGpa?=
 =?utf-8?Q?SR3uDn+L4VAP8F9M6CK+4hN7p?=
Content-ID: <E4AC4EDA49CC644A9A90EEADB7EEE295@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc48bff-75b9-4784-bd1c-08da7a2cd76e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 17:30:23.7386
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vk3MzSbAPzmeE6QVEipQ17esaZLni/qNNvqcFlTywBAIS3WHTzlZ6NQA+U2tZ+/uq5/++V0rREX1IfQmJ1ylePeJyf5Y6pwWy4P23ycyjF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_103031_307672_17FCA052 
X-CRM114-Status: GOOD (  15.92  )
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

On 09/08/2022 15:16, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Aug 05, 2022 at 05:28:43PM +0100, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> While "real" hardware might not use the compatible string "riscv,clint0"
>> it is present in the driver & QEMU uses it for automatically generated
>> virt machine dtbs. To avoid dt-validate problems with QEMU produced
>> dtbs, such as the following, add it to the binding.
>>
>> riscv-virt.dtb: clint@2000000: compatible:0: 'sifive,clint0' is not one of ['sifive,fu540-c000-clint', 'starfive,jh7100-clint', 'canaan,k210-clint']
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Link: https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>>  1 file changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> index e64f46339079..9fcf20942582 100644
>> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
>> @@ -22,12 +22,18 @@ description:
>>
>>  properties:
>>    compatible:
>> -    items:
>> -      - enum:
>> -          - sifive,fu540-c000-clint
>> -          - starfive,jh7100-clint
>> -          - canaan,k210-clint
>> -      - const: sifive,clint0
>> +    oneOf:
>> +      - items:
>> +          - enum:
>> +              - sifive,fu540-c000-clint
>> +              - starfive,jh7100-clint
>> +              - canaan,k210-clint
>> +          - const: sifive,clint0
>> +      - items:
>> +          - const: sifive,clint0
>> +          - const: riscv,clint0
>> +        deprecated: true
>> +        description: For legacy systems & the qemu virt machine only
> 
> I would drop 'legacy systems'.

I took this from a comment in the driver against "riscv,plic0". Thought
it applied to both plic and clint bindings so put it in here. Happy to
drop them for v2 :)

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
