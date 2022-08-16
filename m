Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08280C25B0E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 18:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bSunvW1V/6d3S4oKAjUEN8qya9zsZlc//SVw88cGag=; b=rHE94tO/KXGeD0
	2jN63YflkYZLVuiYWHUmVDDPGGhji3BQp7Scl41Ypr7Czzssxe8HrVRbiGWBthgCxypxwWipNBg9+
	aOO0aronrZzZBsmxeJHvpj5Pl4Mwso/Tqy/7s0q8u10k4Toj4EA9Z6qSmr2TAX+1wxfl/TDEszFvt
	aVg+Yz+6q/8U+fgtOAqxCbUNg3XWhNjx8A7jftAO0L9LJlEU7BdASF8zyc7G/RUcG23c8z0KsXnsc
	4e5qiJ5YYVGG98tfoxeMIDGZbMMoCVbKyNwDQGXG4DEQWgrS0KxGxb9yMrFyn60a9AgaRoS7n1G5b
	nTVi7JLZi4jDkyfTFIDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0rP-005XNR-0g; Tue, 16 Aug 2022 18:00:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0rF-005XEd-Qb
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 18:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660672805; x=1692208805;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=/WL928uJjhD25n34lMX3961s5SSwUEPH1zJP05xGCAk=;
  b=oSbQRZ8H10GTehA6E201+pc3RifYb6Ran/h89KljUE+QUOjAbL7Amuho
   HoEysBRZ/uDVFSfggxvaReJvwm5fO0cGQbdqjXFWKIVLqwELPj7PH2JAZ
   3I0yZSMWuV4lr+mIHZHscQyLlC9tNIBVxYHRVuQc2/bYCP3LonbdJcNt5
   OVyznT7/cq/Nf7o47B6i1ifqbZZGBNelkQvZmYx1nd6/sAxPZaBrpda8k
   z21U9+f0Bpu5XYBN1ZPA3Z1rFOoNm3e1XaWzFxHxOpKnIg+pWoJ1T+Oi4
   sIgZhqAX6YehOpG4WTRVdqbESdvz7GkZo9QxjQtZvbkNOopP0WwIAsGi+
   g==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; 
   d="scan'208";a="169558300"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Aug 2022 10:59:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 16 Aug 2022 10:59:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Tue, 16 Aug 2022 10:59:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0Dz0ryl18IMzhLy7auAyTOrK/K0HqxF40z+qUw+R05eRbNXCUqyTJm5Q6hXutQKCef2sm4y2JiVlij9eLc4UToshPW5h3sRlR7ipypyUIpNmErY0VkObDrJVD159sVweQz2Ee9FeSVEMD9aYlnW//ji9lHkprh3nT/zV8SVvMI3psWfNL+BlAmrs1inkQT3xFmxjK+Yr6Eb5SSjq/1mGM9ey+Reuy4S6DLEmX/A2SlV9TNMfSGorCdbFvi/V20y2Bhjp65t6mhAd3gAtGbsWS0L068vhWPpVHKhRyUSbceIQDH6U9oXCNeEPLlUKw7TmBwX73ss/2+/nJmXWSyIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WL928uJjhD25n34lMX3961s5SSwUEPH1zJP05xGCAk=;
 b=n7p+cH5SmaitgETtfGJk1EBe3yp9eR7y5Y9/Sk/QlytwCeyu9in57oUfUxRBlMBvY6o+/rXuYBHEEtcu4Y9skT9P0botfhshxnJtnqm84QaxzNgFhCPgHftKgFogKO88zFpmIRqC7Lp/z+iaQDLDE3SQoUkjCsrYsUFOrFn82hrl9L2Yg6KXZ+qJ26agI658hG/iwt8exI+cbCAM3O3HDSOTevhRkZEr5/8ZEMUV39iOZDksdtwToDAB8jtn4tbRfkCiW4FrO8VqJ/rNV6x4ey0bXMSNmtRuyDfnl5v/dGXYv5C6vW1IMieCA8aZNySKo8uwl3Cn1IBkX5Uzt2UScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/WL928uJjhD25n34lMX3961s5SSwUEPH1zJP05xGCAk=;
 b=A1MZ2e38T7jpgqdIUoFkrjsfrwov42BsJp4L4fH5kNWtlaydSya1MuRDvIucxxcFxf7DQcU7oWWKrfElq9YZy8ec+kGYxjXbovD8ZOo+8CMiltQCSdYcuZNwlPsxCu9xGi9KaIzyvt5a34YimZadgb4fr+Up8XP7u4u705glUqA=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4303.namprd11.prod.outlook.com (2603:10b6:208:18b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 16 Aug
 2022 17:59:48 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%8]) with mapi id 15.20.5525.011; Tue, 16 Aug 2022
 17:59:48 +0000
From: <Conor.Dooley@microchip.com>
To: <robh@kernel.org>
CC: <krzysztof.kozlowski@linaro.org>, <mail@conchuod.ie>,
	<Daire.McNamara@microchip.com>, <bhelgaas@google.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<greentime.hu@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<lpieralisi@kernel.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 4/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 address translation property
Thread-Topic: [PATCH 4/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 address translation property
Thread-Index: AQHYrcGjcBNK+hyPA02pML5P0onaLa2q5U0AgAAH84CABt8wAIAAC/6A
Date: Tue, 16 Aug 2022 17:59:48 +0000
Message-ID: <f4d07239-945d-8fd9-ecc6-93b671931318@microchip.com>
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-5-mail@conchuod.ie>
 <edf3da1b-79dc-4e09-8d3e-73aca09e847f@linaro.org>
 <0dd12c70-70f9-1dc1-c5c8-a3ff15be81f6@microchip.com>
 <20220816171652.GA2390778-robh@kernel.org>
In-Reply-To: <20220816171652.GA2390778-robh@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0368e9d4-6763-4f1e-8897-08da7fb11c08
x-ms-traffictypediagnostic: MN2PR11MB4303:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pUNY0c2DxRdfX9KEP/6mPijD7Aa0YU9kUNjZD7GBh0Xa3VJW2HDW1iWLBlwTKsbTJDuJlchAXWUghID/XDXux5t8Bmt54rNfGnw+KW/ISZjH2QYmIahczxXMS7efBffw60SmcBRWKFfrw0N+MiUSOzTODaaDQ5LvqCVdy7gj+wgpG/ZE7J7cDXYJ2IQ/6u/FL46dhmaLZAh9LSheALDIBkOGfNfQK2KtEVTcaPGcAmGtQ2fNV2d2b2BOfsvt7mOGRpjGAzyVebNF7SmOt7thJtd225f3fprwrkpKOIQrN5GBS0KnNW06fK6MWKUrQjKYGUrw8xEquw9DPvoBTRao5uNANz8vKM7m9LYX4B/Yh0fOjKqzMnRFIbzhgN3dBJNgf+PU2K249McX7HJ0dTwZQ/V9C5bIEP7dffVRD/t9PP0M2SWOe5ULnJOA2Ntkdd9qVwdt6hMG6ui2dyQ1AMyM6qzeSZjdVAqL5SUo1nEToOjSS19j9zg0uQijYuYmCx2EMdwgKeMMRDw+s5I3uQiqxhmzwrLHVDMumRSP0xesHDEiGKaHCbYeh3LCgML2Xsi67ybqCOj/jfGNz4qXFlKnIgIWmS9yovupMWDdG37nFFgy425Us2t/c7f1j3bkSewahl5CE4vKaDlbs743dd0oN1QdO5G6JRNgnM2XV5bnuPf5VBaGULDeN6LPihNMxqV/EVX1IPr21L20GMp+MNExmHz0dW4ESlTyQpjdsNa+2uSavN9GhZp6bDbx19vpvYGWVAMv4JU0tVttVfISSupGukgJ3FvAyxZ9r+jOMUJFd3aKtfQMOQdueeKvOgxcvNmLboCn66O59Zdm3nTxblMLb0L4nGN236K0OF49VKEwLTeQmoOLeXo8GW0/5nAjHCFG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(136003)(376002)(396003)(346002)(366004)(6916009)(76116006)(7416002)(54906003)(38070700005)(5660300002)(316002)(91956017)(66556008)(41300700001)(31686004)(31696002)(64756008)(86362001)(6506007)(4326008)(66476007)(8676002)(6512007)(53546011)(36756003)(8936002)(122000001)(2906002)(26005)(66946007)(66446008)(2616005)(186003)(83380400001)(38100700002)(478600001)(6486002)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dmNJcURCalpaWEU3djB0cVBPMUxucFdMc2dRUC9FM0RGUUJNL1JXdEFuQXhU?=
 =?utf-8?B?citxN2tQdnFrUVdabk5IQzJ5bVhadCsxRGJvaWtQT2xYSi9Ha1cxTFVndGs2?=
 =?utf-8?B?YndSbjRtdmdzN3gwdWhCNm84T0xhYTZ4TCtpVHFnZ1dVOG9xT0U4aGUrMnND?=
 =?utf-8?B?TmNibHZBeGR1R1BKbWxqSkIwcXdpa2dxN3c0M28zejI2bC8wTWdqVTU3RGNi?=
 =?utf-8?B?cmNsM3RGeExMeDMwVUlnaTlZM3hTdExXV2xhaWw4ZUgxR0xhN0ZhNFl6aFMx?=
 =?utf-8?B?aVplQi9vTXY0ZmV6UnFwRHA1NUUxNzhZTWlCdnlIa1k3R1RDN0liVCs0Zmgv?=
 =?utf-8?B?TmlVTmtHWDJ6RWZsbDhSUGhwNGI2Z3B3MFA0dlg1bzNaMG9TUWovZFZRZzBK?=
 =?utf-8?B?TFg2cE51NDhBcjE1aU1QUzdjcFdlME9US0pRa0Qzb0dySm80WUFtQ09hb3RY?=
 =?utf-8?B?NWVhcXE5V2dqQjRMa29IdjZNRUk2NXdHcjFPMXlXcnprNGFJdFBDU0h4L2ZY?=
 =?utf-8?B?ckFCYXU3Y1VnRVhEVkFxQ0tBWmN5YjlvbmNoR3dlRmtlQXVUT09vUXZIN2Zz?=
 =?utf-8?B?Wm15ck56T1pjTWUvL21oVnNJcXJ0UmVteXNGQTJVNm8vaGpTR0xnd0dxVHZa?=
 =?utf-8?B?Q1N1RHQ5MFlkQUJ2MFA0Vy92bVNYSHdBN3B0YSs4RGZUL3h5cHFHVUxqWUVK?=
 =?utf-8?B?TEVBR3c0QVFVMTFacmx3Z2g0MVZLNFlndzV3RER5YTc2Q2JzblJjVi82aytE?=
 =?utf-8?B?eHczMTBmZU9jaGV2SmJhNEpuS2VRZ1hYM3F4Ulc3Rm5XZnYrcVlvamFQUlg5?=
 =?utf-8?B?YVBFZmdJVXRNZXR0MldyVCt2cUhIUXRUOGxjbzNRZDY2SUkvejVrZ0R2RUkr?=
 =?utf-8?B?WlJYUUR5TlJYbjlQUjBmMnUxWWVyRTYzbElGbGtlZjAwOEtSRWVGNjQvSHds?=
 =?utf-8?B?YmlZbjZCUnk0aW9Qc2xSNFp6SnpGeGtIcjZQQkhPMi9qQkxOZW1vdzBGdFJj?=
 =?utf-8?B?ZXMwZWVpWnNEOVVqUStRa3R3Qm9kUzFFYThSbG9DYkdiZzRzUkY4VWNHUjB3?=
 =?utf-8?B?NC9JcHgrbkFPbVNpaStpbmpBWmFtTEZreHZ0MlQxOEp6OXhHNE42bU9ialZz?=
 =?utf-8?B?bkxrbHY5SjZsNk1UdEJRVUFGWlZGWDBYUWNKZHVuR0NHbGR5anJ4blBTL0lZ?=
 =?utf-8?B?USttK3BBWW9zQ3EzbTRPdk5hazE1a0c3Y255dzEzMWppQVBWdFF2bWNmZzBm?=
 =?utf-8?B?Qkh3Z1NISVEwRTI4YWpMRnBjMTZHeitJMENocDlpN3BKVVFhbFBSZzQwMnZk?=
 =?utf-8?B?SVhCQkFOdkNkN1hUZnJQMkJFQUZRREM0aXRFLzdQenlBZWQ0bWVMVzFOdGRM?=
 =?utf-8?B?TXRrbEtVUTNwbUpiYjBtcThRaHhkMUppTjVSdng5V0dMT09PbEpzWDNhanZV?=
 =?utf-8?B?enowdHd1MEpYUFlHZnlwR1AvOFgrWW9KWVZaK0RzNCs1cFZ5TjNrVzl6a3lj?=
 =?utf-8?B?OUlmS1JwZ1NwWGVmOG44YUhGUi9jeGtXUnVxRlV0SVZFWjZyZVNlNVUvSHov?=
 =?utf-8?B?RCs0dDVMWERVbHR4WGF4OW9YdGlVWkhZQVdsbFpnd1RRREtPbXdGTHhsa3VR?=
 =?utf-8?B?VE1HU0ZmQ0lpQkNSS0ZHWXU0NGtmQzBROFE0Y0VvbkxsTFNCTzFiL0RGb1or?=
 =?utf-8?B?WW9CWnJtZ1JVTVFTSi9JdURkd3RpbGdmejRhdWNoNDZPbjlhUFhSMTh2SHlh?=
 =?utf-8?B?ZUhkdVZoTlZqYktldnIyZmg2cHR2Q2prTVY2NVZBcG96RTFrRUdyMWdQZkJh?=
 =?utf-8?B?ZzVqdXNGK25PY0M1M3ovbnlwV3R3d1EwMXg1bzc2amVzNVdNUVhjWjkwU0c3?=
 =?utf-8?B?QkhpVmF5S3ZJLzZrNjlvSTNjOWZXZG05UmR1M3JZS1RqZERaU2NZMldZTXFl?=
 =?utf-8?B?MXJBclRWUVcwbVJMQTI1aWVxcUxGVUR6dTZ4OUpXNURDUHZRWmJmalZEVkIx?=
 =?utf-8?B?cGJlOVJLZFoxMlNub29VN2o0dnp0TXV1bnZ0dnRTbmJlZEcxRUQ1QkpYbTZZ?=
 =?utf-8?B?ZFlHZ0dUNDdZWTdoWit5VVVOeVhPUjlxaWd1SjJPenI4TG5oZU5tM3d2OHFE?=
 =?utf-8?Q?SCVjKJ33RQ6heFOIeup+ClYmf?=
Content-ID: <D0A8519A99950B428B78F3ACDEB9BCA5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0368e9d4-6763-4f1e-8897-08da7fb11c08
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2022 17:59:48.1982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rXBibqQ11rAOqKPQMugp21Vlsgx9UXhwq1u8E5B6UzXaRX0UM8GAwSmS+9SYVGXb+5LDXAAgePCkrxOybHkvCpvY/YE2RMqT7Zu3JogdtK0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_110006_072990_9C0ECB7B 
X-CRM114-Status: GOOD (  13.48  )
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

On 16/08/2022 18:16, Rob Herring wrote:
>>>>   .../devicetree/bindings/pci/microchip,pcie-host.yaml  | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>>> index 9b123bcd034c..9ac34b33c4b2 100644
>>>> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>>> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
>>>> @@ -71,6 +71,17 @@ properties:
>>>>     msi-parent:
>>>>       description: MSI controller the device is capable of using.
>>>>
>>>> +  microchip,axi-m-atr0:
>>>
>>> Name is not helping. If it is offset, add such suffix (see
>>> brcm,iproc-pcie.yaml).
>>>
>>> Unfortunately I don't know PCIe good enough to judge whether the
>>> property makes any sense or some other ranges-style should be used.
>>
>> Yup, I think it is similar to that. Except we have 4 tables rather
>> than one.
> 
> Looks to me like dma-ranges is the answer.

Hey Rob,
Thanks for chiming in. I think what I'll do is:
- delete the property from the dts, as it should never have been
  there in the first place.
- resubmit the series without this patch to clear the dtbs_check
  warnings
- add dma-ranges separately

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
