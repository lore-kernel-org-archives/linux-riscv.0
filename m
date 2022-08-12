Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAB8C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 08:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPWhGCTHHuzwm7BHnjaRKK4RDDl+ADSt5JUGIaW7bR8=; b=FYmNWqLJnWJnTD
	Sb6j5Li74XA6J+dL8NDiD9hgADvMd3/McQCU3APpZElxDxW/W9k3FHYgwVEoFBTbshbGn5xWUxkAE
	07ziCrsAqwQApdy3tqB1nLt5/N0DAyYNBNotwB9Kffb4AGyePLroGDTUVoAoqn2ZeKwNcCNGtAWUb
	l9GRBB7L8eRwbuyJle86xkrQ+bTn3QlWF3WgUNLh5HOXPfRsmxnycfvnBvnM7tEl7y33tLLTHke+J
	/LBKYtUHC71uqO7DJkBElD/kvspI9TLCznCchFCbMP3uz5Ggga++KyKVvZQqBWhL04I/YGR28jN4n
	RJFTe0hZfkaDDf976dUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPuW-00307H-T6; Fri, 12 Aug 2022 08:20:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPuT-00306Z-Hz
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 08:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660292449; x=1691828449;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=obDLb1YJi8+TJ7Bj2d9kJ1ybJrwSVEHmUr+90Cuj+2I=;
  b=RVyNqmSbVgK/KHYq17fXO/HdwdSC8y8l0EGPrIlF+62B7Dby75sL0gpe
   RZ2LISDs52XzxMUM95wFZ/uD7EpR46gl/PW7wO6rl6O1eWlymg8/kTGbm
   9GsGojucj2gx2tmZ4WuE+yafonxWXZ18yp4EQi/SAuevvRN7tsCHMLTSI
   D61g24kHc5orp4CK7rjFLJTWor9tRjGwcIndVNlnZorc7XyKr1ivhb0Nu
   XHFxTXkyh8uYlrJh/SRfiTEe/qiR4kMOAQUnYk+TyR6KXaH8fjp9DgZWS
   rAvnhGf2QTd6PnmhF6/ex7fn6pcSqmfLhYAZI0RHJhzSk4zNn9jxgvCx1
   w==;
X-IronPort-AV: E=Sophos;i="5.93,231,1654585200"; 
   d="scan'208";a="176115470"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Aug 2022 01:20:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 12 Aug 2022 01:20:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Fri, 12 Aug 2022 01:20:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2XuDhTPAW05hrwgr3o8cuEsyxuevINeyTxDKTqxo2k3yhKg6rZPFF+IcqnH+yKvurvAictjsDVwtGlxCDfFAt42RRxo0r5Pswa+sXSkCM8YYUbR0fe2C5f+aAv5ULxG/ni/0aut0QRv4yTwzACGrgYhAvfilARzy2D6+tj+fChOErX4+tXcACTuWpe5BxzoBC/Zm2DOqfn+rnoN8MhM1rIAxYSHErTbzv10tpuNt3/LmKJdKPEiR1SwE11/SFNq7dFMHCdxNnhvXN4RczVGulHGW918mkngLRuOV24YMUy+09xBtOuDVeIVDVQptbkyHpS1vWe3fBhhjEzk2spl+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=obDLb1YJi8+TJ7Bj2d9kJ1ybJrwSVEHmUr+90Cuj+2I=;
 b=e0DhCCTpbunE8DAxWnFPf5G7fmHJpLtAwOgdwf3VTxB/Dr3n2OZpugsKNKmC3GcRV3/ZUVma3Tzx4H88jz3jjs0R7Uppa91WRKSYf0pwpIS/palqou4kRyCjBQdQyxF4uqurWTPVJiq9PRpQQ2P8Ix5K3YdlTP3VeKONwNsVzuCqaWr+C4ijxNeA0GOq/DipGtghZKyDV+vWhnP9jP0a8UdHw/dSgzzx5OaUPeBT4jUSV4RLo+AEONDC4Cmux6qOT3zzaLjBqeArGspGFgW4QhYibJUz0RdCEvBN0BvV0gixlycX4jEuMMn8W1CwJ51aH44O9emk462dFE2XsWWgZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=obDLb1YJi8+TJ7Bj2d9kJ1ybJrwSVEHmUr+90Cuj+2I=;
 b=G7iD5aiYb+nm5yTBHxg4TCP8R5CuZwy1XbUigVIWUvLt+dt/wPGvX9lD6H++Og+48OfdbYgAsyDuEG3QwVZp/jsFA62KT/frYz+JAApGySnBOfcg7LzPEOEDOdqFDhWHOKqPYJHHnXeKjJU2ms6Ef6qzpHH6UcttRRWOJr3/nwI=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BYAPR11MB2695.namprd11.prod.outlook.com (2603:10b6:a02:c0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Fri, 12 Aug
 2022 08:20:45 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 08:20:45 +0000
From: <Conor.Dooley@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
	<Daire.McNamara@microchip.com>, <bhelgaas@google.com>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<greentime.hu@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lpieralisi@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 4/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 address translation property
Thread-Topic: [PATCH 4/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 address translation property
Thread-Index: AQHYrcGjcBNK+hyPA02pML5P0onaLa2q5U0AgAAH84A=
Date: Fri, 12 Aug 2022 08:20:45 +0000
Message-ID: <0dd12c70-70f9-1dc1-c5c8-a3ff15be81f6@microchip.com>
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-5-mail@conchuod.ie>
 <edf3da1b-79dc-4e09-8d3e-73aca09e847f@linaro.org>
In-Reply-To: <edf3da1b-79dc-4e09-8d3e-73aca09e847f@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2fc960e-3770-4df2-1902-08da7c3b8df6
x-ms-traffictypediagnostic: BYAPR11MB2695:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 50iJwjvw4x/2WX96AmdREItROOR8STsC/qxW7SFgflqt9YyZyGKcms2Ip+Ec+oIB6yHbve7b3SaoubOZzDSX22TFzTCStoUHEe4ildMQ8lC2P+Fn1EgLVVdrIXll20rWPkJjOdvykx51m1fvU357rcM1qF+bm27duGlSzx0RtTz5IvinXjgcSmkPaYW7INfN3dFCojrbYayVohBvT0yA5fD5WZJT3j/3q3g4XCQ+U+GzbbRDmejtP9Rikadjnn9C8a0CwFyTKU/cwEHU7aLgJyRnaQBbi0Gbqes5DBavOsaYmU4ff6KtFcPziZUvUVR/qpCt+M6Fy7amvw8ROgCSwlFP8aM9AAUu+MJrBcT0GuqzdI7A/CR6L/XHNrQ/sx4qE+VRomUpHLuicd+B8TkBgXLTcMu8CRi10kU5j6g0VkU52l2Q1vsURMFtsDhgZCZ8SvJITV2/iHbMUeaQVuz344Z1nAuhg8E8uZ0e8UIxO8GoI4qeA3tyKfeZJDDakaM8O5Zfkz6QjosaEdOZlhimViaKF/FMgepKAmNQBSgilnoV1aRY3yOKr4Yuww8eZWHT7Byr90W0mhjTDfSMX9Ge6x2EEb/BrN3okHBf5G7oQg2NEvAtldmgJMBnmc3jETf3oaj9QQc37DGBBZqaMd8Ud+9WJQTym4Y61D9q3h2lFxVGByHYaNuBOxc6yaTaV/T+RQiz7EO3QllqY6A4/r8h8MSQVZVeCxUizE6dGVksS5UzAyUz09lEmlxdjzgb3vvJTEVmg9xph8IWB/gFV/q5iloAVLJD9IIQmupeOYTVYEY0/8m7E0LSCkcBIHM56Ok5iCzi13G2wngzGXjTMprfyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(39860400002)(396003)(376002)(366004)(346002)(7416002)(5660300002)(38070700005)(54906003)(91956017)(316002)(66556008)(41300700001)(76116006)(31696002)(66476007)(36756003)(86362001)(6506007)(31686004)(4326008)(110136005)(53546011)(66446008)(8936002)(6512007)(2906002)(66946007)(8676002)(64756008)(26005)(83380400001)(921005)(186003)(2616005)(478600001)(966005)(6486002)(71200400001)(38100700002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akcxSldKYWZ4a1piRzM4eDBvdDFMdnA0cVQyNXZVaWJYTFZBd2dnVGpYNEEy?=
 =?utf-8?B?T0NxSFRqeVJRcWg4cHRpcFc4bXJLUXN3bGpsMFRaeG5lYmFxM2VkRUtSV1dq?=
 =?utf-8?B?dDE0TVVEKytxY2lMdnVkV2lUR1VFTnJWUnVZUTQ5WWlGK1FnSGxBOVZoSnBx?=
 =?utf-8?B?RlYwTE0zdDNzc28yUUNuZ2Vad0FMcllOaitWaER0WkRBbGpIVEUzNEpRbStn?=
 =?utf-8?B?djdpM2hZMW5XVzB4VGpCdW9iUDR3RUlCa0lWSndwQThqVFY1czNXUEY4bXFB?=
 =?utf-8?B?LzFIbVd3Y0FUTHp5ZDlDRExZRlRuL2dwL3pwRVZ3Wi9SenlhdDlmWktoeXlC?=
 =?utf-8?B?SmgxL3dtdGVrWFRpRDlGM2NOS1R5YkxKVHB6NnpqbU1kZStmV0hQU1lkZUNG?=
 =?utf-8?B?V0JvOU1mZjYrSmlIMjJxQUcxVDhZNzZzclNYNXdaSXBobXdoV0xlSTkxTkhZ?=
 =?utf-8?B?VFNCRWtEY1JNS0dXRnR2MitYNkQxNUxIV09lbjFYTjExN3JieFlLd0dHQnc1?=
 =?utf-8?B?VHdhY3YyRHpsQlVjbkZuZmxqRm1FdVlhcEErdG01NCtOOE1kTjdxdU5CNkwx?=
 =?utf-8?B?dGk0MWo5ZjVweS95RDBDYTJ4WDJPT3RmZFZhRzJZcXhmSGxicGNPeG5wc3dn?=
 =?utf-8?B?Q1dTYW1yTDY1c3pocFNrdFRBWmx5MDhFeXZYMldJZW1wUHdLWkVoNTBMQmN4?=
 =?utf-8?B?dFEvVmFiTHYvcU5OZDlLczAyOWRNOTBDTVRxdFFjcmlmS21xc2dzT1pOWGMv?=
 =?utf-8?B?ck1tRFd1eWp5VE5ubHFkZTRQWWN5UTVHTVBYUTg4ZXloVWgwLy9waUxwNTJv?=
 =?utf-8?B?akJEY1Zad3IyUlJvdW1DVUkydmxtWDZGTDZSa3Z0MHlVVnRPR0FVNmszTFBM?=
 =?utf-8?B?RjJrUitoWTc0djVpTDBmMWNzMWpwUnpDSG9SU2NqOFlmWEt5VW1Jd2tQaGJT?=
 =?utf-8?B?Q3ZqSjMybEZOcnVuRnlCRVpjb0tmVVc3cEJRY250cFMwN1daZmtSd0lWRGN5?=
 =?utf-8?B?VlNmM1h1N3g3NTFXdzlmR0NCbXFtZGtjTm1WVjlNTVNZd0JOb204dU5sWk9v?=
 =?utf-8?B?elZkYWpKZHc2eGpydkFtVS9HeERyU2RtZFA0RkZMdmlEK1lNVWR0NElIVWdw?=
 =?utf-8?B?N0RFdFRrdXVwZTEwWlpiWGQ3aTdtalJNeThBSVowUWRTT2NScU1XUFNuWjZh?=
 =?utf-8?B?eWxWUDBFbGQveTM5TlliMUtGMk53TXhlZklUbllNUGYveEpZOElMb2Mxc0pG?=
 =?utf-8?B?cloyblAxanpyTW5rSnlGZHpaMFNybXl3OGlKLytmdWZleFVWZDZOSmtZc2Vq?=
 =?utf-8?B?d2FDRGV0Q1piMnhwK1dyUk05K1J3WCt4YnZDSnNkdHVVczN1YmkrWjZMVnls?=
 =?utf-8?B?bzZTOEZMSDR3Vkk1ZmVGMng2VnhPUVZHb3gwcC9hWXBPbUYrckJVTWxkbjFE?=
 =?utf-8?B?ays4d2t4VzBJUFQ4by81V0l6ZEErWlJEa1VmUFBremU5WngrTFA0OXhZOU5J?=
 =?utf-8?B?VUR4bU9FaHg5Qno5anYyK3VBSUdMTVVZbTFyTTRvZ0JhWFN4aUJqNUFwZnU3?=
 =?utf-8?B?UVVuWEVBSkdLd0E2YUY2UXNrbVQ3QzRqWVhENllMRjVKYUhLbTZLejY5RHMz?=
 =?utf-8?B?dWhDZ2FSSzZONWlqdEMzRzJUclZkOHFvME1IQ3BqNDUxYkhRaHAzUFE5S3c0?=
 =?utf-8?B?SENXMW10Q0lPOTJrTGVwbmtBNmhLNU93cGliNG4rYUo1dFJXc3pZOGtMVFNl?=
 =?utf-8?B?Rm1SblVWVjMyS0h5WEZKTlpka1E4RlBOUGl3RXdUMDVQV2loOEtHRFRHbVdD?=
 =?utf-8?B?WXdESkE2UkxaRklsQk5VclVWNGtieWRnMW5WMFBXV3dnOXlGZzVWc0xaUHB2?=
 =?utf-8?B?Wm50bExKbzVtYUFqN0RqQWQrUW9PK3MyMlRJaWp2SHV1TE1tSVd6TmRIMlpS?=
 =?utf-8?B?c0NxRnJBckJDOTEvL3VVRVU4MjJkeGFRWnJkTG9vR1Q3b0thMjBvTzhiWklQ?=
 =?utf-8?B?ditCck9pdUhyTXRGeWdoTFp0elZaNm1uenJzZERTQkxDZGlZMUtEUUNESlVU?=
 =?utf-8?B?QkRnV1lYR2ZHUlZRakJDNFFuazFGcmJ2YS9wTjF6MnhHWmRPL3V6dm9yaFZV?=
 =?utf-8?Q?PeAQmPnMg9mIxReOva4+Tzu4T?=
Content-ID: <961215D432DF94439EDECF9F5D4B8507@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2fc960e-3770-4df2-1902-08da7c3b8df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2022 08:20:45.2508
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Lz58XhLdcO5ywV2Gx16MO1G7x5utRWuVUgXNCmrKPRiPIzsduotNl8l35wfpw9uHHXbRXpmP9tIGZmH1kQ0L4qm8TDN1om68JabwTDdZJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2695
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_012049_624097_1E11D1A1 
X-CRM114-Status: GOOD (  27.91  )
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

On 12/08/2022 08:52, Krzysztof Kozlowski wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 11/08/2022 23:33, Conor Dooley wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> When the PCI controller node was added to the PolarFire SoC dtsi,
>> dt-schema was not able to detect the presence of some undocumented
>> properties due to how it handled unevaluatedProperties. v2022.08
>> introduces better validation, producing the following error:
>>
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'microchip,axi-m-atr0' were unexpected)
>>          From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>
>> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>> I feel like there's a pretty good chance that this is not the way this
>> should have been done and the property should be marked as deprecated
>> but I don't know enough about PCI to answer that.
> 
> It seems bindings were added incomplete and now based on DTS (which did
> not match bindings), we keep adding "missing" properties. I don't think
> it is good. It creates a precedence where someone might intentionally
> sneak limited bindings (without controversial property) and later claim
> "I forgot to include foo,bar".

Yup, again pretty much the same thoughts as me. I don't think that, even
if the property is valid, should be either named as it is or only work
for translation table 0.

> 
> Therefore the property should pass review just like it is newly added
> property.

SGTM.

> 
>> ---
>>   .../devicetree/bindings/pci/microchip,pcie-host.yaml  | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> index 9b123bcd034c..9ac34b33c4b2 100644
>> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>> @@ -71,6 +71,17 @@ properties:
>>     msi-parent:
>>       description: MSI controller the device is capable of using.
>>
>> +  microchip,axi-m-atr0:
> 
> Name is not helping. If it is offset, add such suffix (see
> brcm,iproc-pcie.yaml).
> 
> Unfortunately I don't know PCIe good enough to judge whether the
> property makes any sense or some other ranges-style should be used.

Yup, I think it is similar to that. Except we have 4 tables rather
than one.

> 
>> +    description: |
>> +      Depending on the FPGA bitstream, the AXIM address translation table in the
>> +      PCIe controllers bridge layer may need to be configured. Use this property
>> +      to set the address offset. For more information, see Section 1.3.3,
>> +      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe User Guide:
>> +      https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    minItems: 2
> 
> minItems should not be needed, but you should instead describe the items
> in the matrix.

SGTM. Thanks Krzysztof.

> 
>> +    maxItems: 2
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
