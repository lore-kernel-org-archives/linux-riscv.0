Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF3EC38145
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8uHP2oVAfA4sI0ZXUc4RIRg3QP9l+a6qecCPu6CfF8=; b=E6ER2nXU21H5ZZ
	hMM45kVsqM5wauo1JInaCMB6M7J8XeQFh94//H8uG8jxoG8NnJsQghI8COMoGWPDckeNqPccRdS+d
	NMWhSSwvjVk8IUkhRLX1Mw9DtQ5sxeEJHhcoLZYs++eA+ldm+2qTMnkBv9ztJ08J+XAHNYO7rPvTJ
	VaK+h1P3c1shDRqwcU3GYDPqESqqBqH9EiD0OYV7kh4vcE4JMJsxH5JOvdTjb5CULpLCX6TFRU6rL
	vg3u0Yv0qcrscBq/E8AuoRVfQqZ42twlGJpVur0+ZkwnBFcYKW2Vxd0+AXNGy5vYw/kHsNWUxIGNQ
	pb5u0Ux/MxkGEA0IVPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7fm-005ZRs-L3; Fri, 02 Sep 2022 14:29:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7fk-005ZR3-4A
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 14:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662128968; x=1693664968;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rofv0LaST8OOKezxdgWCQYC1yOH82FpL6YI2POxrFX0=;
  b=QgthceOdFQf/LUKOIFKh+3qWMZTYs+FyH/o8Xwd4cNiaSlFUgZurLJWY
   BPfFjwEqnDNg20W3hjcbN61FTstm8Y4hCKWysO73SQEBVH/9+cJgQJjfA
   HYbzJxlA22OZoU7DNe6AxeqkA4obx5QETBGSZE6PX7O6AvB03wsGPCEcL
   RWbnA8juIUE2gY8lWhvTVF/T3qfPTNOZJfO09lVzR51+LCyxlDt6kzt2c
   tY+qoZmUdJtIz+EZKuOYkawy+9RVDLThGcmeJ9mjLgJMkJt5mx6HvkmNI
   /DqzKVrthvqw5QAGAySGVZjsEg8YD95KM/kwLeEwmiZmC/TkTIoPnnSwK
   A==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178943331"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 07:29:26 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 07:29:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 07:29:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SetbUhtWMI3q0HcnNezatXZnAs67DA5N2oN0Hgp1stD3fa2r6dHrfFZfVl7u0wFCbjKjo75wej8bOhIxATPjcWwAvwQydqVVlw6W+n4zK43IBLxbTvXwG1X68vQez+0wZ8HopccBEkgNReusJ0y301bfCFgN0olohNMXrL7r9S8Ovdpmokw+TC/kIbOWt9nV1MxzpQ3uUGFQrcC8TGQ1KMKku0sYFDbdPao6P6xqIdVxg0rBTNEl9Wj5LKJWLEimr8QF3wc53e1HnAjAfq9hLHr7nEyUzYnnwLc3+O3+TDfKFCfmesahTN9AnziJ5Th6y3uCEGjJoftEbJflGRpElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rofv0LaST8OOKezxdgWCQYC1yOH82FpL6YI2POxrFX0=;
 b=hJMbx5YtBtNevy/fLsDI/aJf5kNugk3wYa8PAhfqdqOXUTn1FumRUYVkUPuVzNOXeuYoSXYkPscmeVPM99ahsHB97MJHcE0skhEzI08/4U2AkeQbPOemxC+fJ7E6w6/DCPu0jlKjKTCLXj87DS1VNvE29fbHm6YNx5OtyAW1cRNx7xw4bLAx1bY2UQxdaefLIHfemoH8O3avIMt+2J0a05UyJt4xd2tBFoTIi5wuJOb76SzZiqcPld/ytvRwvbZhgoTGtBdUJwlBYNpAbGmSkSSAboOeGP1zWssGGGTp5S1kwqMPDS+lcFfCipgkdTDST3pd/NT8fyFQtAFVXrvxNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rofv0LaST8OOKezxdgWCQYC1yOH82FpL6YI2POxrFX0=;
 b=OrNxuVVdk2/1Sk5GR56jl5QAmb6hioRziMIjKmpmurTMZo1/SntsNJJ+3wXGAeYBSD2yo4bhRKqeuuqUgu0jMLns5gtU5MoIOObp09r6fBTUkP4NeoX09KzB/I8J0qlj6IA897INXfJ5bXsFweq5UirvmP4EY0ym8RVXBjhD27o=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BL3PR11MB5681.namprd11.prod.outlook.com (2603:10b6:208:33c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 14:29:20 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 14:29:20 +0000
From: <Conor.Dooley@microchip.com>
To: <Daire.McNamara@microchip.com>, <aou@eecs.berkeley.edu>,
	<bhelgaas@google.com>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <kw@linux.com>,
	<linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<lpieralisi@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <robh@kernel.org>
CC: <Cyril.Jean@microchip.com>, <Padmarao.Begari@microchip.com>,
	<heinrich.schuchardt@canonical.com>, <david.abdurachmanov@gmail.com>
Subject: Re: [PATCH v1 2/4] riscv: dts: microchip: add fabric address
 translation properties
Thread-Topic: [PATCH v1 2/4] riscv: dts: microchip: add fabric address
 translation properties
Thread-Index: AQHYvteEdsTpG+fnqUSHltZhu7SeFK3MMwIA
Date: Fri, 2 Sep 2022 14:29:20 +0000
Message-ID: <26e3a8af-7eca-e571-de13-915fdfd77b2a@microchip.com>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
 <20220902142202.2437658-3-daire.mcnamara@microchip.com>
In-Reply-To: <20220902142202.2437658-3-daire.mcnamara@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f5628489-ee3a-408c-79bc-08da8cef8624
x-ms-traffictypediagnostic: BL3PR11MB5681:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 268nct21ofVV2jDVQOLdrIfq/UHX/9bUmAG5CojgNkWDxhcoeWztHPP+SE7iMYjZjXBSFHHa1wkmyaixPze7ntSmx+EGK14dnpOMKDRQGByHzZJ8aKMhY5UIqJuJH7Kg8rmV7IuPdgv9W4xXKpEuJdAX/YhCEfKX32gpJIJmjIIyagqt268lcn0Ic1WdcTvSSQ8hR7RyZSYe4JLVxHZgcpT+VKq9KNppNOfSYYOO3jkWQQSciyE/yxoKyTr9jdx2+6ozsYTIxU+aCUN32zUyikYnEkj/1Tz7jdfptYt0gQahw7UfVprGkUAhCu7TA0zUexVnWySVCxLAS1+Z6VcgQVUD/LP2h88xKSnxnhV6FwMExsTXBvqV9aL9syy2A8dJWiWETQePYx//+ha9yZnq/APFhMCPWDc1Q6WfUyuxKVA7exQWMv7ZVggZb5dNfAZk0CDyKfKoTyDcgk4fj2jrkRszdC30hBT/lIAqrsLuTxV9YKpG9RJqGJ3u3pABhO1jW5+yXCcRD/YAhT146SerVUPMrL73zO9+/Ac1XWMuNWbHqMFj+e52T67p7qyL+lpedptJYR6yzOdyzwbeD/++vnzwbK+U0vXckK5QoQHHDzNqoxiU4fg/WJPsjKYtSRIRV04XUEhao/f/NOWdWIBcIQzmo9HU2LkParXzCTVczM7E29aKgZ93DRBAG7lAj2ePYJsTmh2RrXGveHjM1eh/C1yaevG4RlD/nCmU6kGumS9fK5SPCTDuxt2xHZI1uCwDvXjK1xTIsioUVk/2twS1WlYHlbOLwxAjSbv5WZATjgnRDmZHWUKrQJRFG5pHVl8NdCv7PaLh2hmMtO1VdU+21IxX906qeXiKo/ilygK9WaJCeAuvdVBKAEPW7bror/1p
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(396003)(39860400002)(346002)(376002)(26005)(53546011)(6506007)(6512007)(186003)(2616005)(7416002)(5660300002)(8936002)(31686004)(36756003)(31696002)(86362001)(966005)(6486002)(71200400001)(478600001)(41300700001)(38070700005)(83380400001)(921005)(8676002)(64756008)(66446008)(66476007)(110136005)(76116006)(66556008)(4326008)(66946007)(38100700002)(2906002)(316002)(54906003)(91956017)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHlkcjR6VFBhRFEyZ0U0TjNCSUFobHB3L2F3RG1KTFh0c0E1eEJnQUxLeGdG?=
 =?utf-8?B?dEVQemwvYms3a0dwNjFQQXdyU2xpN3g5Z2ZhaFVEUithdnpxZVkwclpXc1Za?=
 =?utf-8?B?L0hMUWtYbUdRaWVoWlJrNDBORzZWcHRpU0UvZ1lDbmQ1MHh1bFhkeC96UDNI?=
 =?utf-8?B?ckJmUkJIMm9hOXhkL05mQldNUi9YSUlUdC90bWhPeUZoeEZESlpWYjhsM3pa?=
 =?utf-8?B?TlNoTmY1MGVIYWZWSEtoaC83OG1uSDFaSWJZMW1kSzhJU0drTUU1dlpHTmR2?=
 =?utf-8?B?RWRoTzdxakxTbnpPMFJtaURjYkloUi9pcGowMC9ZVGdlWUM3WkxoMFpIYXVR?=
 =?utf-8?B?enFKSnpEZ0FLOWFqMG5NZkRFOGxybEZaVjZPbDlIWE1IV0tEWjNMbWJGWm1D?=
 =?utf-8?B?RU9sTDNiVlpPejZjSTEzbjJGZjQzOXREcC9JMHEwSG5iRG1mVXVPMzJDMzNF?=
 =?utf-8?B?VG5KYnZpaVFweXJ2ZzF5dkdCM3BkR2hKenlNN1B1b2d1S2VHZ0kva243M0dO?=
 =?utf-8?B?MkhXcE1vQ2ZIZENYV1hlSENXYktTNEoxTDRrODV3eWxJZEVzU2szaWI5ZG9K?=
 =?utf-8?B?cjRPWW5uQUNaUndJUWpmVU4wS3haZkdmUHgrL0FaMUVvUXYyMmhpS0k3NEZm?=
 =?utf-8?B?VGJFc1A4N2NLaDNjdEQ4YTNLOFNzOW03NjZtV2RrN3ZrR0cwMVdmRlN2TFZC?=
 =?utf-8?B?VldHL1V0WVV5RG84dXEyRjBNQjhSbDNUN0RRbVZTazB4RWluUjBDVFo3TUpI?=
 =?utf-8?B?dzVSODlmMElJZEJBZEQrTmtoZTJLOVI1cTVIak0rZ2c4OGh5Z2NYU3owTE03?=
 =?utf-8?B?dVNMcUZ6TXhvemw3TXFydzhkcmJuTXNQSHg3L0c5cmZVblJCdzI5dnFDTU1I?=
 =?utf-8?B?OHJwdCtLWGUzdFg0YjRDSEQvemdCZHc4MXA0SXdZRldhZTRwZ1ZWL3lNSmFT?=
 =?utf-8?B?TTRIbk1uRUxRRkdvL2lOOTdmZlB2emNXS0xmcVQrZmsrK25YS0g0ZC9BTCth?=
 =?utf-8?B?RFd6OE9MdHJQRUtsWjR5YSt4em9NM1FleW1ldHdDUDE0WE45bXFtVTlsTSt6?=
 =?utf-8?B?cGs2U1JRcWFHd2duTFNuZVA5TmF6SVhLSzlZcWdVUDFlcWZVOE1RUS8yZkFD?=
 =?utf-8?B?V0tVd25UYkZTSDRuSUJ5K0xUN1JFWW5wbTI3NWx3UWptTCtHSnpFZjNHSGdX?=
 =?utf-8?B?VC85ZWJEc3RHZmhSamNldU81L0F2S2xKcWNOcmxuOFIwbVlPaTczbDVCRzFy?=
 =?utf-8?B?V2tSekl2SnVHQjhuR1d1T0ROZ0h1ZHhPU29jK2pkU1ZKQlNyMkYwTmpyZUhH?=
 =?utf-8?B?MGI2Q1NVUURJeGUxTWxQcng4MmJwRE9tOTE5c1NyUVhvZ1RVRG44bEpCWDUv?=
 =?utf-8?B?NzJZUXFLREFnbEZCSWpjbTR3WUZuTjVkam8xaXNHQmoxcDMzYzFQUGZycFlk?=
 =?utf-8?B?WHpMTnhRUjlRZTZxVFRGLzNrWDg4Y0NUdlYyU2RTV05MeGV3eUs4V3FHZGRJ?=
 =?utf-8?B?THoyamFPQjdhQmN1cDk5eThDWHozK3FDQm9JdGl2SzFuN3FiZkdpSmZlc2lM?=
 =?utf-8?B?bEhKSUhTanBMN1ExcW83LzhQM0VsRlBiUDZFRDVsK0xKTzFFMzdQV09mM0xy?=
 =?utf-8?B?WkRhU2RRSDI2U2trelZYRGhvRUFXaE83VTR3Rkh5M0x0OWVvTktJRE9ldFht?=
 =?utf-8?B?VURQdWlvM0pTbUJjZ3BQOEtBTmJtQlQ0MlZ5Rmh4ZjdwQmt3Z25QREdMcmxH?=
 =?utf-8?B?a1ZRWENUYkppTTAxUUNPcXJKS1FTaFhqbXRRS0NyRHkvU3R1cjVFQWgxWEcx?=
 =?utf-8?B?MTV1UFczNS8va3ZDY2Y5bUZZaVc1VUs2QlBRa0FYczFDcWh2R0lxTTdtM1Mx?=
 =?utf-8?B?UlNKZ2RQMFhjaGUyQTNaNWNZWkd0NTBXbTZTWU5NVWtBa0xzQ1RUOHZoMVE5?=
 =?utf-8?B?bCs3Q2pkaVhsclA3RHQzamtOc2pFQUV6dzJhRFhzLzZUOWdtbUoyaUhvaERY?=
 =?utf-8?B?dkhLUWk1dlU1STgvUTdyNmtla0J0eWIxSU1uTlduTXJ0Vi9DdkpEVWtaQVRt?=
 =?utf-8?B?YnY0ZWFBd1lDVzUzbjhZUVBwaGEvTWdNV216TmphSG9Cc09lRFJES1p3dHRU?=
 =?utf-8?Q?chHKc1NMXz/JxL5/mBEV/C6KB?=
Content-ID: <FFAC42CAA4A314459F825055477BA115@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5628489-ee3a-408c-79bc-08da8cef8624
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 14:29:20.1643
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EmptSjpPe9UiigqlYB500n0DYpHMRL9q2LR6kSlxgoLf9AZ20JIqD969OP4N/752Epth1xDd3A1ykXyxq+c2+07ZXfjhqRUEGnvfjy0kxco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB5681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_072928_202127_69FA0988 
X-CRM114-Status: GOOD (  20.21  )
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

On 02/09/2022 15:22, daire.mcnamara@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> On PolarFire SoC both in- & out-bound address translations occur in two
> stages. The specific translations are tightly coupled to the FPGA
> designs and supplement the {dma-,}ranges properties. The first stage of
> the translation is done by the FPGA fabric & the second by the root
> port.
> Add outbound address translation information so that the translation
> tables in the root port's bridge layer can be configured to account for
> the translation done by the FPGA fabric on Icicle Kit reference design.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>

As an FYI to the PCI maintainers, I'll take this patch through the
RISC-V tree once everything else is approved as it conflicts with
some other changes that are pending there.

Thanks,
Conor.

> ---
>   arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> index 98f04be0dc6b..6839650e7d1b 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> @@ -57,7 +57,11 @@ pcie: pcie@3000000000 {
>                  interrupt-map-mask = <0 0 0 7>;
>                  clocks = <&fabric_clk1>, <&fabric_clk3>;
>                  clock-names = "fic1", "fic3";
> -               ranges = <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
> +               ranges = <0x0000000 0x0 0x0000000 0x30 0x0000000 0x0 0x8000000>,
> +                        <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
> +               microchip,outbound-fabric-translation-ranges =
> +                        <0x0000000 0x0 0x0000000 0x30 0x0000000 0x0 0x8000000>,
> +                        <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
>                  dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
>                  msi-parent = <&pcie>;
>                  msi-controller;
> --
> 2.25.1
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
