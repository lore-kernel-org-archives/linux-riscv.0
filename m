Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3763ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7pVwqCKo7u3uE3tHnL32prtycH2sj88jlapl372vXBg=; b=KQ7B+WMyr+yqaQ
	q/1rUIl9GCjlYRgSHb07az8SSeSDm8BP9vEa95l4SfKFZYMuIpXhH04tvUj/2KVxhayhoGskluxP6
	d+Ht8ILny9EhUSXh4fw3o9irKFieCkWvQ3v7wgZGwbnEzi+YA3hg4hJNqISEj5ZbtLcXtUO+AT5o+
	R6ztJywcYjZ384JzJWL3PIncN+gRS+sx9WZe3wgoplPRFJCS8v1Yvs7SdeZRZgbS8mPu8uwqCI5TI
	SH2DDy0Gjc90s4xkh288U82lIAGkgxUF/YEkiCIjn4tnW9UniDUQLWgZbwBMxxBCuaBciY1trAjhR
	SBz8VasgTasjnM58WRaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9sw-007LAP-Li; Fri, 02 Sep 2022 16:51:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU9ss-007Kw6-9m
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 16:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662137470; x=1693673470;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=AvLHsp0u6E3rGZB9nF3zIrUiteseXmOOTsk8hEqgPdw=;
  b=lLHVU6hQ+yGcLF2l+eEy2vsxaYYEjbijffcBfHUQxPxrP66cmrEc7WwO
   W0Mr5fTLrBP4Jr0GhtohtO63CoPbUzK+lZJ3r/OfpDBLPwLWMXbRFNbr+
   ICtGMnc+3IE1y2owzb5wM/x9ShfckAilRCQ+RdkANU5su/RvnznO+4V3H
   mqVhr6UYeoDbCtAgLFV0s4op/2O+NI7gn/46ri0psaxZOQJHUKNfIhzS2
   tfplZYa+5G8Xui8/P+K7LZ24Nl+u4A7KqkjayIEDVwvYz4Kw/9h8jlZXu
   GCAnrOZwuViyD28aq7VYw/aeN7mmeCXqITr1nFMZdF1AyBjDg7qkLn0z5
   A==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178961183"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 09:51:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 09:51:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 09:51:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzkDR38Cg59oZGYfbrzzeuj/EkUZ3PELRlrL+bhaNouEbE0uUhxUTe9505SAZk+CREQtqb8UuegaUJ7ROr5xnZ0ooXUGH29W63jUomrRvO07n6AytQslavH7AunomGJwFE+tpxCzAqJa4TZm8rGkU+YzCpSmrCe3KZFAvYd6cQZVC+EX+G+Rv+gvjC3W8qX2JTwsLjxYkVbAA+cGjvd86cBrAyRwGjiCQg2DOsilq2RAek5cpbSFX4T7bgMwiRQ9e5ypKPIop70Fo3Zc2db+NCP7I2SzpbDuhbWEK0QI1z86iNEuLbP8YN49nuqclaJWZQ3oXePQiZlLik4jSSYJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvLHsp0u6E3rGZB9nF3zIrUiteseXmOOTsk8hEqgPdw=;
 b=QApw/oOyrNUruIHh2+p7CEJ4L50KQc7xWXICEqFDY7m3ftUSKh4ox3/YFXl96FV6YzkJddHMfDFO/Y1BG3fFFFOjQmcEtlIRaPR/5a3FUT0Bl0YNsqlHZRhOccTHDbeEC8idyWceBYOhpA05uFBDVVUvyWDlFRjxxNkRvBHfTLt3G4XkrNzmtY8Fv3tFTiPa8fb+2w1o+VtCVDvfjmAKRgFTtZKM5ZDQh2+XP++7zA6luVtiP/6UET3u+/2Foq4Y9kD1OtSk7Hc2PFQZ9+Re3Kr+hqfElVSPOH6rV9gnLX3J57lsxFMusQDV6t0P9JQYcg2bXtyEpc0knq2/8zLn6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvLHsp0u6E3rGZB9nF3zIrUiteseXmOOTsk8hEqgPdw=;
 b=c8SqlZe8J/ZD5N81YFQDrjd3/xi+IaW8ACg5T76YHCiNW5gsl9P7FlfEUJU0FMbOXwCMcXQyf3DqGm7NC/IeS4fP/hv2ozGfCggCgotGXrLySLd1mgOP13vFM8D0rKjDe2icFnE/GPvM/PGEQ8KMZDiISV53AsJ4McNONNa44ns=
Received: from DM6PR11MB3258.namprd11.prod.outlook.com (2603:10b6:5:e::27) by
 SJ0PR11MB4832.namprd11.prod.outlook.com (2603:10b6:a03:2dd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 16:51:01 +0000
Received: from DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::c8cf:c82e:e86e:2db6]) by DM6PR11MB3258.namprd11.prod.outlook.com
 ([fe80::c8cf:c82e:e86e:2db6%6]) with mapi id 15.20.5588.010; Fri, 2 Sep 2022
 16:51:01 +0000
From: <Daire.McNamara@microchip.com>
To: <robh+dt@kernel.org>
CC: <Cyril.Jean@microchip.com>, <linux-riscv@lists.infradead.org>,
	<kw@linux.com>, <Conor.Dooley@microchip.com>,
	<david.abdurachmanov@gmail.com>, <devicetree@vger.kernel.org>,
	<lpieralisi@kernel.org>, <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <linux-pci@vger.kernel.org>,
	<Padmarao.Begari@microchip.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<bhelgaas@google.com>, <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH v1 1/4] dt-bindings: PCI: microchip: add fabric address
 translation properties
Thread-Topic: [PATCH v1 1/4] dt-bindings: PCI: microchip: add fabric address
 translation properties
Thread-Index: AQHYvtd/Zgatyqml9kOZM0lssTSnuq3MVEqAgAAGYAA=
Date: Fri, 2 Sep 2022 16:51:00 +0000
Message-ID: <d78655c2bda14215268ee9fe3dd181a6f73d2a48.camel@microchip.com>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
	 <20220902142202.2437658-2-daire.mcnamara@microchip.com>
	 <CAL_Jsq+5pKyOL8eu5YhQy9pLATd_gG_D71sR8bUp1GA6kif=nA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+5pKyOL8eu5YhQy9pLATd_gG_D71sR8bUp1GA6kif=nA@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 590f91fc-95ee-4ddd-988f-08da8d035107
x-ms-traffictypediagnostic: SJ0PR11MB4832:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: m58hGbT+4G7xS6M89pGdycTcBAKzB0L/l6XEWCQ/k9zh5SKrH7D13FcQf6aCKA7hFaehoXdys2HUEdRG3ET6BqqM84MfBCZKN8648O9VI3k2R5SCEDboUUsQs1QaG88R7K0jGhSs/TmwKqQvZK+hPxI+MCZ9xPh/N71rsrzZinJ2e1qQU3+Dol//S7oyxuM0ZOE0r+/c/ygAvDIkTepElvKC04kDrABV2aM6kq6/3es431otNIHh8UZQV5+uoi2jen6v7FN6P9wO9qpzvW4ghul6oNv/BkFidBNaYdwpgckmQ8qWEcYmvXq0HQfHB/plFvT/d9/hB33fk5dce+ZKdQimZoAforRF8vThH2ycgDjpUDcGwhs3l7uycQ8ZMwPd4bhFPxJqmQgjN8f1iSNqjUsziAwSjoC8sq3gUfYN8O7TZ7eaTxMDMt03lepvU0dCYeiUsKfXSV93jwHPJMXiZ3Q2dYdnbiLeZ9H5QTLUDaimbwIa40qsn10us3BAmAUWc1kX/hdBXYhOndJmS4PNheh9WdQBJr/wAn/SKtWqCFVJFkyzR5cFFuhRppcNRdlZ9lhIIR9YcNTW2K1oT5dmIqrNhQMcGHNpc7Jq/p1BD1fVr3Aj7lddmXAogUql82ZJ24DOe1WmWzDDeyamuLKIOKhJMnkg6G7vVkJTLT8FK+tmikWn816CjNO7P7cTm1OV/zYwvjS1trQqRPA1hNxEi/lc2UHT0yn3EZlb8DejGmitiPTrEFaQM9tiNPnqp588KWyzn3aJpNhmJfG8W1rv510SXWmIbKk4BPMR3m7P/ig=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3258.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(316002)(6506007)(38100700002)(53546011)(26005)(6512007)(83380400001)(71200400001)(36756003)(54906003)(122000001)(8676002)(4326008)(478600001)(38070700005)(64756008)(66446008)(6486002)(966005)(41300700001)(8936002)(5660300002)(7416002)(186003)(2906002)(86362001)(66476007)(66556008)(66946007)(76116006)(91956017)(2616005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUNHaEc2Y2VOZUVlTnloSFFSYXhpbzVDWGdkWDIzZEk3U1cyQVZkNzY2Tmxk?=
 =?utf-8?B?NlkwVWY3aEpCbG9hOXI4UWZsNVoyQVRma3pYTnBjMHRVcmlCMnlKcjZDMVRC?=
 =?utf-8?B?TnhPTDB0QjV5cDhWZXVmOVg3SnNLVVFDNnE4aXlnc3FZTGZkV3I0SzNzVGl2?=
 =?utf-8?B?a3JMR0ZIeG52N0ZiNmFtRWk0MkVraVFXelp0NVN5OTlrUG0yRWVVK3dXbW9n?=
 =?utf-8?B?K0xpeDI0U213ZWhLUE9xMmxrajg1aDFHUE9nMVQ4ZitMSUtxUGFUOUh2TUN3?=
 =?utf-8?B?M2JTZ1VqRkcvZHZYSkowN2U3UDlyaEMwK29WNi9SQldmbUI1WU4wRXV0ZU5o?=
 =?utf-8?B?RzRzSHJONVFOOGVmUkowdEpOS3FNYzJMMHVhTFYwQU5odTVDME14V3R3K1lr?=
 =?utf-8?B?QzlxSjlYbnlzWmhXRlU2NUM0ODFTRlFxMm9pc2dySThtOWhnUjNxRUxWU2RR?=
 =?utf-8?B?TzFmRGM1NDlBUVdUczZXVDErMCtlRi9lRkg2Nlp6bUhRM0lta1IrMXg3cVM0?=
 =?utf-8?B?TUtIMWNxMnIvenlqSmM1REFJckRkY3BPNkZOSTY1dEY0RDZvSzFJczRGbFNx?=
 =?utf-8?B?V1cvRXo3ZFVQTXlHSTBCY1ZxMGpreWt6SFFGWDFyYkhQQmx1YWlFbnFuM1VH?=
 =?utf-8?B?VmQyQ3RYcEsxaktRdzVZUFRyNHpwSlFERU9xZUVRV1c5cXVoNU9qQnlnYmpE?=
 =?utf-8?B?RG5BejYrcGl5dU4rYTMvYVcxQllSZlFhd2oxRGNNNzRHMGRQNXI1eHFTejJr?=
 =?utf-8?B?enJrVFR2Tkl5VkZvNHRuT252L2hwcU5KUThjQU1ZL2hmeUkxcUc4ZWREbHRU?=
 =?utf-8?B?RmY4ZW1JMi9pVXdJbXRVTTd0ZjVET0ZiV3VGbzkxaVRtNkdsbmh3dlBXejd6?=
 =?utf-8?B?YXc0UUxlWTVPczJuNjYwSjhvbVhhTXkxRlVrT0Nsa0RvVG5ET0NiRUN6SVRD?=
 =?utf-8?B?YUxZSytLNUU3UERhMFFRYy9tZDByWHNJTmVVeWMwMzhHOTRFWEw4QXpTRnd3?=
 =?utf-8?B?eFNBOVhNOUpHVUFLaVBIVnVWNituTkRoNVhXZ0N5b0VmUXp0Skp6R0MxMnBu?=
 =?utf-8?B?OWNGNCsvMVgvemNjOGNyazdYV24rZE5idmFxb2ppUG1SY1g4RzRXUk5YK2dy?=
 =?utf-8?B?NHcrdmgxSmZUNnJyMXZ5c2VxODIxNDRXTGhaYmJENkcybjNtRlpjVmt4Nk5W?=
 =?utf-8?B?TVZYSXdkMUZhN3l2VXdkSzZxWkFvUmtjNkRQN0hMNnZtVWt4eFZBMXQrUGZr?=
 =?utf-8?B?K0ppTzJPRGtCSjU2SjJEZWgvYktFTHliekJuejJvRkZTeGY1bkVXSWdtL3M4?=
 =?utf-8?B?RnRuSVBWSmtYNVZSS3ZLOW9zSmFRUERLT2oxdzdFR2hTZnZFVE01QWE5SERD?=
 =?utf-8?B?TUNkakZwY2k3Q21XdmIwZGV1YlVnaVh2cTdGNHhZUWN5OElNNzVkUFpraUgy?=
 =?utf-8?B?VWJFbE5IMUxPZWF5TGxEc0Z6MW1CUDdqdVBsTXRFL0pwSlBHa1g4Nk05aUFz?=
 =?utf-8?B?d2Q2UE5QYXBuR2RVOWUyR3R6Q2xnTWxxdWlsV0FyemMwdGtOU3djMzlERkM1?=
 =?utf-8?B?OGN0UzY4L0dpeldnM1loUGlHMksvVE9XaE9uZCtWUjBBU1dZWlhsU3daT3o5?=
 =?utf-8?B?c0VjYjNGcXJJYzNtemlxenBJUncvL1lyVzM4YWQvRGM5R0hrRElYMklJQTF3?=
 =?utf-8?B?RGYzcm9NeUVQTElGdmk5ZElETDhIOENESkJZVTdoRFdVYUZmS2pPTzFQeWNH?=
 =?utf-8?B?bTdENVRNREwrQTNzOXl5dmVMK21TTGVFd2JEN1ZpYmpwNmFOQktBWjN4d1Fo?=
 =?utf-8?B?VWRlcFVFN2RNOWM2TVlvQjI1U3N0S3Y0amVXMWJsMms4MEtIUEFPL1RFUVF6?=
 =?utf-8?B?eGtuUXpmclBVcWZXb2lqQStTNVhHWEI3clNFaEFjaVdvVm5LTU5CcHQzblB1?=
 =?utf-8?B?c2lTM0h3MTlYYUZKTkMyazFLMHV4TkZVUFRrN0k5ZUNQRHVjeE1hcjQ2VENP?=
 =?utf-8?B?L1VQZ2lnVEkrdlV4eFpiTTNkNlZ2SjFTRTFZN0FUVUNRR2hRWjJjNEZMblRy?=
 =?utf-8?B?bkFzQ05UeElHdjBQZDVKbWxuY3cvb2dSTmIrMDd2WndibUtuUEc0SGxPVklO?=
 =?utf-8?B?bmMxU1hyV1JyVmUyKzJqSUhZMXV1eGMvYi8wbzZJT0ZSaENLMUVFUCtQbkYx?=
 =?utf-8?B?U1E9PQ==?=
Content-ID: <8C8148548A28674ABDB0FEA5BA3CF315@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3258.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 590f91fc-95ee-4ddd-988f-08da8d035107
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 16:51:00.9592
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUdgfVPxJJw9x4KMAtgX+ZYH5NtD9VAMw3envc0dvwwOy0VSEQ+hdMzeMR0GiipTXCMSIqF7HDe6PUj4+vtLPuXoEDtPYiilf2NYR5BQhNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_095110_388518_1863CDD2 
X-CRM114-Status: GOOD (  33.71  )
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

Thanks Rob for taking the time to get back to me.  Yes, I thought 2
levels of translation might be the way to go. If you could point me to
a gadget that has 2-level translation working, that'd be great

On Fri, 2022-09-02 at 11:28 -0500, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> On Fri, Sep 2, 2022 at 9:22 AM <daire.mcnamara@microchip.com> wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> > 
> > On PolarFire SoC both in- & out-bound address translations occur in
> > two
> > stages. The specific translations are tightly coupled to the FPGA
> > designs and supplement the {dma-,}ranges properties. The first
> > stage of
> > the translation is done by the FPGA fabric & the second by the root
> > port.
> > Add two properties so that the translation tables in the root
> > port's
> > bridge layer can be configured to account for the translation done
> > by
> > the FPGA fabric.
> 
> I'm skeptical that ranges/dma-ranges can't handle what you need.
> Anything in this area is going to need justification 'ranges doesn't
> work because x, y, z...'.
Cool.
> 
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> > ---
> >  .../bindings/pci/microchip,pcie-host.yaml     | 107
> > ++++++++++++++++++
> >  1 file changed, 107 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-
> > host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-
> > host.yaml
> > index 23d95c65acff..29bb1fe99a2e 100644
> > --- a/Documentation/devicetree/bindings/pci/microchip,pcie-
> > host.yaml
> > +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-
> > host.yaml
> > @@ -71,6 +71,113 @@ properties:
> >      minItems: 1
> >      maxItems: 6
> > 
> > +  microchip,outbound-fabric-translation-ranges:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    minItems: 1
> > +    maxItems: 32
> > +    description: |
> > +      The CPU-to-PCIe (outbound) address translation takes place
> > in two stages.
> > +      Depending on the FPGA bitstream, the outbound address
> > translation tables
> > +      in the PCIe root port's bridge layer will need to be
> > configured to account
> > +      for only its part of the overall outbound address
> > translation.
> > +
> > +      The first stage of outbound address translation occurs
> > between the CPU address
> > +      and an intermediate "FPGA address". The second stage of
> > outbound address
> > +      translation occurs between this FPGA address and the PCIe
> > address. Use this
> > +      property, in conjunction with the ranges property, to divide
> > the overall
> > +      address translation into these two stages so that the PCIe
> > address
> > +      translation tables can be correctly configured.
> 
> Sounds like you need 2 levels of ranges/dma-ranges.
> 
> / {
>     fpga-bus {
>         ranges = ...
>         dma-ranges = ...
>         pcie@... {
>             ranges = ...
>             dma-ranges = ...
>         };
>     };
> };
> 
Very possibly! I'd prefer that approach, tbh, if I can get it working. 
I'll go back and try 2 levels again.


> > +      If this property is present, one entry is required per
> > range. This is so
> > +      FPGA designers can choose to route different address ranges
> > through different
> > +      Fabric Interface Controllers and other logic as they see
> > fit.
> > +
> > +      If this property is not present, the entire address
> > translation
> > +      in any ranges property is attempted by the root port driver
> > via its outbound
> > +      address translation tables.
> > +
> > +      Each element in this property has three components. The
> > first is a
> > +      PCIe address, the second is an FPGA address, and the third
> > is a size.
> > +      These properties may be 32 or 64 bit values.
> > +
> > +      In operation, the driver will expect a one-to-one
> > correspondance between
> > +      range properties and this property.  For each pair of range
> > and
> > +      outbound-fabric-translation-range properties, the root port
> > driver will
> > +      subtract the FPGA address in this property from the CPU
> > address in the
> > +      corresponding range property and use the remainder to
> > program its
> > +      outbound address translation tables.
> > +
> > +      For each range, take its PCIe address and size - these are
> > the PCIe
> > +      address & size for the element. The FPGA address is derived
> > from a given
> > +      FPGA fabric design and is the address delivered by that FPGA
> > fabric
> > +      design to the Core Complex. For a trivial configuration, it
> > is likely to be the
> > +      lower 32 bits of the PCIe address in the range property and
> > the upper
> > +      bits of the base address of the Fabric Interface Controller
> > the design uses.
> > +      Otherwise, it is tightly coupled with the data path
> > configured in the
> > +      FPGA fabric between the root port and the Core Complex.
> > +
> > +      For more information on the tables, see Section 1.3.3,
> > +      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe
> > User Guide:
> > +      
> > https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
> > +
> > +    items:
> > +      minItems: 3
> > +      maxItems: 6
> > +
> > +  microchip,inbound-fabric-translation-ranges:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> > +    minItems: 1
> > +    maxItems: 32
> > +    description: |
> > +      The PCIe-to-CPU (inbound) address translation takes place in
> > two stages.
> > +      Depending on the FPGA bitstream, the inbound address
> > translation tables
> > +      in the PCIe root port's bridge layer will need to be
> > configured to account
> > +      for only its part of the overall inbound address
> > translation.
> > +
> > +      The first stage of address translation occurs between the
> > PCIe address and
> > +      an intermediate FPGA address. The second stage of address
> > translation
> > +      occurs between the FPGA address and the CPU address. Use
> > this property
> > +      in conjunction with the dma-ranges property to divide the
> > address
> > +      translation into these two stages.
> > +
> > +      If this property is present, one entry is required per dma-
> > range. This is so
> > +      FPGA designers can choose to route different address ranges
> > through different
> > +      Fabric Interface Controllers and other logic as they see
> > fit.
> > +
> > +      If this property is not present, the entire address
> > translation
> > +      in any dma-ranges property is attempted by the root port
> > driver via its
> > +      inbound address translation tables.
> > +
> > +      Each element in this property has three components. The
> > first is a
> > +      PCIe address, the second is an FPGA address, and the third
> > is a size.
> > +      These properties may be 32 or 64 bit values.
> > +
> > +      In operation, the driver will expect a one-to-one
> > correspondance between
> > +      dma-range properties and this property.  For each pair of
> > dma-range and
> > +      inbound-fabric-translation-range properties, the root port
> > driver will
> > +      subtract the FPGA address in this property from the CPU
> > address in the
> > +      corresponding dma-range property and use the remainder to
> > program its
> > +      inbound address translation tables.
> > +
> > +      From each dma-range, take its PCIe address and size - these
> > are the PCIe
> > +      address & size for the element. The FPGA address is derived
> > from a given
> > +      FPGA fabric design and is the address delivered by that FPGA
> > fabric
> > +      design to the Core Complex. For a trivial configuration,
> > this property
> > +      is unlikely to be required (i.e. no fabric translation on
> > the inbound
> > +      interface).  Otherwise, it is tightly coupled with the
> > inbound data path
> > +      configured in the FPGA fabric between the root port and the
> > Core Complex.
> > +      It is expected that more than one translation range may be
> > added to
> > +      an FPGA fabric design, e.g. to deliver data to cached or
> > non-cached
> > +      DDR.
> > +
> > +      For more information on the tables, see Section 1.3.3,
> > +      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe
> > User Guide:
> > +      
> > https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
> > +
> > +    items:
> > +      minItems: 4
> > +      maxItems: 7
> > +
> >    msi-controller:
> >      description: Identifies the node as an MSI controller.
> > 
> > --
> > 2.25.1
> > 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
