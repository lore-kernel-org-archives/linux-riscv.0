Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C04C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 20:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03qXOtPO6YgNi17+nk37rylBVphVAlBARqVPkyfku/c=; b=1gnplHYPKeetEK
	yKsFdacbHQB0WinXwNis8uiiQ/MLdnx8Sve1W4jas7OpCKbICaRErnx+kA7DqAzUDEXT+TrOX+RPx
	+/ke+iHAb1ZZuFakP1xlgDH1TqpUaMp9e2Yx3TBlcZExA5wkVMtK/RLXIp3BfkoxG9Npmv/wZ5rWg
	m0EZRzQr6HJ1++534Lyzp68awq9EJUqz+6iRFGrrtt9ADC5IdYQYbPk0ePG6AjCMIvBXMVhbtBzos
	gdGTuvyi02Ljue8JtVXNGLX3XWzf4UZ31dM+UbIOr3q90KfW2Ff/oKsYVSsDwvSLD5N8wQKLXwZ99
	2oEF9IGR1dbx81Kc+oSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBMs2-00EivZ-Sl; Tue, 12 Jul 2022 20:52:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBMrz-00Eiqr-RC
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 20:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657659155; x=1689195155;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BEppSE8HQta09KX2Ec9CKuDnm5/jVLNrIHR0bzDndcg=;
  b=JgvFr6V7mSFyjLhJGjQBBmMPOoJ8PnUum3qNrfY+amPzJ1m44GYU3FAY
   KepNIoumEjN78EzLUYgvOT28pOrPiYrDyXUAvsnkO6zgkIp1qYcRxJv7i
   hlBZkZnfrI5lccqgGW/kC0no8U2XFXraXmSnXCA7HzerM1DqStJHgc86x
   esslNIcQBK7ETVbv694FOB556jSlIdiyuSaJENAzz+9CXL5EyKBRm6AZy
   q+k01ZK1u1Fl8uJELh+pGKdiGV8wPtYc0xC9siHMi4uYm2T738YkK31m4
   l5kmsuVSYJaqDnat8HGwRSI4vOpW16UWe/whe+39frUjQXOpddWbWQdZ3
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,266,1650956400"; 
   d="scan'208";a="172111518"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2022 13:52:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Jul 2022 13:52:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Tue, 12 Jul 2022 13:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTAGv4R0iDm/abPHWMWsIV9oJYmjHdbjIULps9kOiBIo3p1cLvvfoCc2E+Akr7DmmwyFHIxi5JmGgR+DnGXWWaA+usF3qgvu9ucgJ1h8sbVrbIPQJC7lN2dmeIbA2X6X3d2N+V+TrUXE+zcfMizSidyz7oeGRiJPL42TBdMa1nw5ib20GA9wHylAVY6yY7+rIHa4Yv4uLpLLiQe2fg7UaqR2E8Q+Gl5VqIzxuxWBqWaET9WXhzMD8ofh3udkeJTV0S5DJBAOSq/ZIdkz2njyR6ZSsn09hlBxjetb27G5N7xRoTKX3OCPzHNVu6SK1HUGYn805dNTlaRV9rcoiRdYdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEppSE8HQta09KX2Ec9CKuDnm5/jVLNrIHR0bzDndcg=;
 b=n7ZBi7nU4xFWa+SqpeQadxQNkTYndjxSJZqd9T1B7PLx/eN9bsy/m1aLI8TyomY8sjCB1kkGmVMVD1hYxEFDuezmm0KMrxU1wu9XzgCoGy+uTZChwPpTsWasyIPEiZ6qULc9mz26Iz+xQOIFgeC5QGe4R9tpYp/Bhf3G0bDuqwXe3mH7EVveNgUvcYRzc8NxDuo74xs8aDe8pmXJCqSCgrjwFiiIA8nnCP01kGKDmor4CEzbYRFE52U/MXKTD/9QPzrdbSoBhUWF4l6NYLQ1uVp7J6Dg9vMXHLGuSQVUcMOCe4mT+Og7pqKcgXEGnFFvCHoC05Y8EKL3B28N1N7Rlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEppSE8HQta09KX2Ec9CKuDnm5/jVLNrIHR0bzDndcg=;
 b=aPaX/9CO2qdisIxhDAZHdVZR+Xbd7vMlUGr2oNtFRdOjy6Bwbr0s+ILm/hCek/FceipdBdX9DNucy9BGXMlv9NGNVb1/MjGHNyiZa8gdwCWSrZz22/Nv2KupCZJPF8t8F7KK6hwMQhT/Q8zUe9LoD1Bg0Y6C4Y7aSBFMuPUwXcA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB3384.namprd11.prod.outlook.com (2603:10b6:a03:75::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 20:52:26 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::8d4a:1681:398d:9714%5]) with mapi id 15.20.5417.026; Tue, 12 Jul 2022
 20:52:26 +0000
From: <Conor.Dooley@microchip.com>
To: <yangyingliang@huawei.com>, <broonie@kernel.org>
CC: <Conor.Dooley@microchip.com>, <Daire.McNamara@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-spi@vger.kernel.org>
Subject: Re: [PATCH -next 1/2] spi: microchip-core: fix UAF in
 mchp_corespi_remove()
Thread-Topic: [PATCH -next 1/2] spi: microchip-core: fix UAF in
 mchp_corespi_remove()
Thread-Index: AQHYlfWYV6SS9xgv6k+Ymq3GejRdI617NqmA
Date: Tue, 12 Jul 2022 20:52:25 +0000
Message-ID: <0f43a8a1-3df3-9704-c7f8-414496df40e4@microchip.com>
References: <20220712135357.918997-1-yangyingliang@huawei.com>
In-Reply-To: <20220712135357.918997-1-yangyingliang@huawei.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1858de8-c379-4f98-c5cc-08da64486d4a
x-ms-traffictypediagnostic: BYAPR11MB3384:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QeByTNaqt8gGWXXLLpiE5LqllhMTlKtGC9p/P331WPUXZauYGDE6k+f0150Oz5Nvp26qIghdOKmurUC132QZz6TTV7mle89UAmmKHJ4dYCWSrDdtqUVJA1raNlWICGkWgC2MkE9MSHh3XCGbIa2oRsb9TTAG7Zw3qaLjzhaef5WXZ5oyPTt0kqcgn+h3neIeMB7yvEkwhadOYM+2CexbpKunXhi39QxQWxktXGMsrvt5Fi6kRu9QVRZIax6s1tz12rTv8VLaU8CRZl9x2m1Tg78Gpus+DeTh92jwKZYyEV6xciaaR9uYERwJ/Kpja1zXXt/cm8bjG2KuGxD9nl9iy7eVVqZpfYFdt0jGhPNEOYwobeHgRBBV2St/VmKsURUf98vhXxGfmDVjWcpKGqJRRr1zCLHfV2ac8XIlo1QtRXypsSiclgp1ING2GhfeFNE7UAmgklCHdDELWeSFUGNHoRJSFyQZXZ7tZ8uw5W8LGPX59sK7jzGYgSK15yfpXGgYuJEbgeVSgv/Ij/UkTsSBoIJx+8yJB2lSGu+qKeJ131dynh6fTbfa7aNSqiay9wVcW/jeb11aUNitCrZUAHqPUuGqecp4DXUDmFeLAqnpOJjjfYHhp1N2WWNlYa8gr8d0fOAZTi2jq6ZPpqtAGUKkigTj0x+CToYrVp1J6Nu5FKh72HuO2bF+K902HxObh/dBEOa+nxivRdzHgac1b3sj7tGtOBThhMluk1FZWY+L7odd/dQ73GQED7kEgiy7obTIWEfkp72GLN5A0kGCsIrgKbdIeFNASQoVcKdoohA+EX47zfKTrrSN8Iezx27Jr6LmlCcTwTJIPGuY9IibKeq4l4PQjrtW2bHFkV5YOCxz2eZ5KmouiKz4pjhaBrDgYJWB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(39860400002)(376002)(136003)(8676002)(8936002)(71200400001)(110136005)(36756003)(316002)(54906003)(38100700002)(6486002)(5660300002)(31686004)(83380400001)(478600001)(122000001)(53546011)(6506007)(66556008)(26005)(66946007)(66446008)(66476007)(38070700005)(2616005)(31696002)(86362001)(4326008)(41300700001)(2906002)(76116006)(186003)(64756008)(91956017)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UFdRdkoyeTBFanlDZEpmRlFGSTAwazlaVFYzSWN0bXFpcEhOVEs1eEpPdFB4?=
 =?utf-8?B?MUxOaUdWd3p6Wk1PWkJyRzdLcWs0OUtSSWN2NzF0Q1VQUVFpWU1kNHZyc3dP?=
 =?utf-8?B?MDVuaTFpQXRPOWx4VzhNNUJERDJ3bjkzVFhaM1NYWlh0ckNKNWJZTHdTWVZK?=
 =?utf-8?B?WUIvZHJucG1LdHpZOTdkN1hVRHJWZDZiNEEwRnU5NlNWSmR2VEZGSHNheThl?=
 =?utf-8?B?Y3hjTWlYNHJ3c1YwYlRUbDFqbDhkdm80bi9rU0t4UVV6SVJqUEJ5LzREVjdZ?=
 =?utf-8?B?TFRRcS9UdlJ3VEo1eUg2aytLbHR5NkJxdWJzQjZ3S3Z3dlpQOW1pSXZFbHZC?=
 =?utf-8?B?M09uWXBLTmJzSk1UMTNRZ1V4RHhPU01ZWEcxa2ZrQ2xWSDFiRytPS3RtcWRH?=
 =?utf-8?B?NHIxVDZQUlhyWndkMkZlTWx3UTdaTFRyQzk5TFBWblN3cEpIRU9Oc29jbmhJ?=
 =?utf-8?B?MmM4elNxUDVncTM2Nm93bGF5Z2pHaUNkMWlTWjQyZEFuNmlYYTRpeUJZQjlm?=
 =?utf-8?B?R0wwdGZZU1VIUWpJVjQ3UXFyMy9hNE96YnVvZUFvSGYxa3ZyWGR3NkhobnNP?=
 =?utf-8?B?ME90RWE3ZDFocStZSVdmVG5zRWFrWFVrYnF1NDI5eDg4STNxRUtOTnI3Vi9l?=
 =?utf-8?B?WXJrWDhkOHlhNTBSbi9LNmVrMFRNdlk0VGExRlZXYnRmUE41aGw1Q2dyV2Zw?=
 =?utf-8?B?N0VOR1JSeGg2SzA2Ym9jYnNUR3hNdUlTaUpzalQ0ZXd6RC9iYlBER3JSRVBw?=
 =?utf-8?B?ME9WVmJPMDRGbkxmNWY5YVBSa2dHSWw0NGxYTHgrejRCUm1uQTRCQ1lyeDk0?=
 =?utf-8?B?UG80YTJlNDlWTlZaN1RPdmFiQWx4ZzJvUTdnRVdxTWEyM0N5STcxWkZlNDhm?=
 =?utf-8?B?QTI4MVIzb29MdzNWZ0ZnTkJhaEFHaysrR0hHc3BWblpTMER0bHU5aE5aL2Nn?=
 =?utf-8?B?cDFOdFZvdkphcDdCWEt1ckJMUTBEVzRiTmliUWFRMHcySEN0MmVjaHUvVTBG?=
 =?utf-8?B?MlhyQ0FQYnc4TFNaYzYrazJTRDdJdlFmc1h2K2xjRGtXWmpxYmx0QW1xYnRs?=
 =?utf-8?B?YTVTWTlzUDJVVUZkd1VJdHhYNTBNSGRXQnVmSHBvaEk1Q0dMUy9UdkxTWlFz?=
 =?utf-8?B?RFdHQWVIRGFjOVljalpxTnNsRldtakdqbUdLR3J3eE9BMGJFYURZcm5Fcnox?=
 =?utf-8?B?cGZtQXVwWHJpUDJpS0Q3ZVAvWFBwN0MwbjJPNUhSd25qa2pYTGtnVHE3R3Jo?=
 =?utf-8?B?Qlo0STNSM3NpOE1aZkRuZ3hUMmswQi8zbHZlYWRIdWVvQzE4MUxRUlBOeUlk?=
 =?utf-8?B?b0grc3RVcmZreEpLcDhPV21UU0xOd3JIVmxtRVhiMjdsbDl0LzVBN1pnV1JQ?=
 =?utf-8?B?T2xKNG9xa0ZOQUV4WkJTR1BrSjhvOFh0WWpkYThGM0JxajBPSWkwdTJWbUJN?=
 =?utf-8?B?REVkVmVkbW9kRFFJSmlUS0RCeGQ1NzlTZVN6V29DWkcyZUVEOHBLK3VBY3Rz?=
 =?utf-8?B?cTVRK1ZyREZMbGpjUTBYNEwyVmVETXRLMDRJU0tZbFQvQWZQV3VJNlJqcCtw?=
 =?utf-8?B?ckJ6WC92UUNrc01wZEI3QTdzS3BOSWVJeUVNT0hsV0FEZjZHelEzcVJwV0xo?=
 =?utf-8?B?TkFWU0lKaERueUJ4UHYxYzJGY2lhTy8yQnk0ZEZNdjdZZ216YWRYRy9vWGNO?=
 =?utf-8?B?bjZITXJRZEp6cXhvbkJtN0p5VEdrYVNCZzB4RjZXUEhCV04vOElGblVCNDJ4?=
 =?utf-8?B?aWpJVDJ0d0VRMVhlMzNjb2RGR1YyZkJmVFhmZEFWSTVPaVFvRGJxY2pZWTlU?=
 =?utf-8?B?OXZUc2hsN2F0TURHeXBXbUo0aVVLVFYreW9CdHRTaklIeVM1UFJjcXU0RVJF?=
 =?utf-8?B?MWlsRTZMR3RrV01vZGVrY0xub0paTnplQUpWb3ZSNjdmTGFsVkJXMEJaeHha?=
 =?utf-8?B?U3JmQ3lCLzdTQ0VHWjF6Ykg5OU85amd5ZWg4Q2xnMjBOd1FJeEQ0WldlOXV5?=
 =?utf-8?B?NEFodk1oblJlcnJhcVFodnVVK1drbW90bmpkcWpNTk1sSE1PMm1XSTNtNjdT?=
 =?utf-8?B?QWpMNFU5TjhRMmFrK3c2MDNjN1NTOVVYNlIyZ3FVZlg3bTJ4QTMzZFRSQlZn?=
 =?utf-8?B?TFpnT1MwcTRXbHkraWRoYkFUMFNHYUhQcDVJUW1oYnAwa2xsTHZwVjlnWEtE?=
 =?utf-8?B?a1E9PQ==?=
Content-ID: <F4EE685394E7DE42A75EDF1B89B4425C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1858de8-c379-4f98-c5cc-08da64486d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2022 20:52:25.9761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 859Kcp0EtaG+rsUXPDhSATtd126f+gVU+a/l7aEMl+KrkjF3q20u1opd1fAvLoOsL4zjdGMvDBg2JLj9HgctD09wN4hcuhqZoPyoT6/6+V0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_135235_909871_A274FCAD 
X-CRM114-Status: GOOD (  15.53  )
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

On 12/07/2022 14:53, Yang Yingliang wrote:
> When using devm_spi_register_master(), the unregister function will
> be called in devres_release_all() which is called after ->remove(),
> so remove spi_unregister_master() andspi_master_put().
> 
> Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

With 59ebbe40fb51 ("spi: simplify devm_spi register_controller") reverted,
this looks good to me.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks!

> ---
>  drivers/spi/spi-microchip-core.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
> index b3083075cd36..c26767343176 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -595,8 +595,6 @@ static int mchp_corespi_remove(struct platform_device *pdev)
>  	struct mchp_corespi *spi = spi_master_get_devdata(master);
>  
>  	mchp_corespi_disable_ints(spi);
> -	spi_unregister_master(master);
> -	spi_master_put(master);
>  	clk_disable_unprepare(spi->clk);
>  	mchp_corespi_disable(spi);
>  
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
