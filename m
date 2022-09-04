Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB0ECAAD3
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eIAXuhwEqE/cBnGxifWkL8kCwJBQEmWZbU2xDZ5pPVM=; b=THktr6N4jmxz1Y
	fnAkKYjf/qQRLw+l6V6/DaAHfhPzyKwFO/iOt3Isz+CNhs9ls9h9JGb8thwRWSBZaRvPQbg1aRM0K
	nHOoraOvkLpYdRb3F5BCKyKd8PNHC7qNtVko1jnxny6dQ3bogwmuS0kWO1CsnWrcximdyhDgtMOfs
	XQ54bPRclbFSdtF6XC1/5Q67OVdwC5Geo5L2OiplvfwJoLrsgyhLH8Ex2LDf6BwElro8X/ucjAe75
	7f9nzQePFRJMU9m17qKFHUFIVyRUxRdKkAWLu1bbQ+7rFqJnvevr447HCvUn97dvLeaSWRi7tp5Qq
	80OpZ3kuLV3JssdRFWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmgj-003Ix1-I5; Sun, 04 Sep 2022 10:17:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUmgg-003Ioz-Q6
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 10:17:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662286630; x=1693822630;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=HhVxaystlj2MkiM0WdGhn+513FhYimsEyo3qtE7yNUM=;
  b=02/+KXZAmw2f1PJf4eQ8C0a8SUocxZy4chz+siu2DnT+Xw5dDcxMgzVp
   YAx2inRiRuKTjsiIqvSnhL7ZQQg3+sa5jSEfMsGyIn+/rkgjNGyRs5Udq
   qMiYKM5VyGMMyazqUFcc8HNkhMOqJyGfDz00E4KJ5rFb/zyzLmMTptDqM
   6J7dxAsYKnXhNncjWrFmt7YdAFwiaB8ZwkFLubVMJjQGgIt8I/FiBEg9y
   ley4rNRQTHXDAbQ5O/v8XrmN5IR7lg7L6vEGcoZDfpdeCQzG4vPy5b5R6
   t/gHpsfSeHZmtKZ+rHmbozMN5+t+9RneddJ/q5BtvI2E20Y9ZXpfQs5jm
   w==;
X-IronPort-AV: E=Sophos;i="5.93,289,1654585200"; 
   d="scan'208";a="178966044"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 04 Sep 2022 03:17:09 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 4 Sep 2022 03:17:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Sun, 4 Sep 2022 03:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPiy9KgJI5RAIUtpAzrwHcScfrBXhoGWnWw8ZIyxXajchA/hnVm0LhRxWb9QRFJIl6daDtovKHo98fJGwdTGqYNylNDGyZ0OaaM0oec6+MFSeqDCe6rSPfVJ0Q15jqQ7dGLNDnMQeWjDOEVemfstWJW8AW84wFyIMlKgmh5G1I2+Z2qQz5OdMut8IaoslIxrCaoyv7CesC0MaIAbLdFt9+m2dFUdxACn7ZOoI9fYw++q5QT+nqIGcSH+1MBp7bo2KDo4bE/AGwbWSwS7PHoMHekeup7UGET/j+m9Jj1XYfSj4Aceqa7XKmXI+2/o7AMzKX6a11gf61ZwWcgqM59Ggw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhVxaystlj2MkiM0WdGhn+513FhYimsEyo3qtE7yNUM=;
 b=WfxfoTkIwq7AyAqk99Mro8kfgE5EsfMCxDaM3c+GDBFjI9S6cYVb7AZqKhC4bumx+gVg+dySOL6/ECwYbGkWeVKkIW/67lOWt6pi5sS1p+jxyU1P4mLdBUepqRqfA6PSddAKMIPdrdQ+aOVH72+hqSZ012EETzDSbbRw4yEkNV+cO/sT+Yluk4Qsgk+JBTVzjU2VyS5kreAJCw21ahz9PwzBeT8idBlBdJBQjZgwlOy504K6LOoVFZGBcFvl6L6RUNzUk5bjDzrt2mVSJjaRjYZYgMwwDO9meBx2QsWAfPAi3wQNGk0DoSNUfMIeVoyzJZ64bhYsCUv9OKEhg/FlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhVxaystlj2MkiM0WdGhn+513FhYimsEyo3qtE7yNUM=;
 b=fIeYA/2vFR60QRreOU0TJoJiG7ka9dqqoLVmRpC/x7wO/4CwyQN3z5I1hcl+yVfdsnCnpPy2G8t2qKZZed8vlHDfnaelSiH9+kiVZM6TLtQjosRgWYAmwpXSQVcqzgT8IX8UxqoPm3YfCAHQOUpIodQtDm8cu8N609lXLuq6i/4=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by SN6PR11MB3456.namprd11.prod.outlook.com (2603:10b6:805:c8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Sun, 4 Sep
 2022 10:17:04 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Sun, 4 Sep 2022
 10:17:03 +0000
From: <Conor.Dooley@microchip.com>
To: <guoren@kernel.org>, <arnd@arndb.de>, <palmer@rivosinc.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<heiko@sntech.de>, <jszhang@kernel.org>, <lazyparser@gmail.com>,
	<falcon@tinylab.org>, <chenhuacai@kernel.org>, <apatel@ventanamicro.com>,
	<atishp@atishpatra.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>
CC: <linux-arch@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <guoren@linux.alibaba.com>
Subject: Re: [PATCH V2 0/6] riscv: Add GENERIC_ENTRY, IRQ_STACKS support
Thread-Topic: [PATCH V2 0/6] riscv: Add GENERIC_ENTRY, IRQ_STACKS support
Thread-Index: AQHYwC/SY4OQsWISoE6/WWzA0DhoBa3PDpSA
Date: Sun, 4 Sep 2022 10:17:03 +0000
Message-ID: <bdac65bd-175f-3f09-ae46-97d4fcc77d6f@microchip.com>
References: <20220904072637.8619-1-guoren@kernel.org>
In-Reply-To: <20220904072637.8619-1-guoren@kernel.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88570c51-aabb-41a4-7e72-08da8e5e9d0d
x-ms-traffictypediagnostic: SN6PR11MB3456:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ldRu1/LLAEoqOOccq1/dBz4jWbgC2iUIFKGOwBpPXW8LMTzP/Cw/s6HV63048wRNKleMMS3yAoIZQaaUfRdajvgBjuwX9jBzZDmBVkvKd5QD2u6KQSFNILgqLsBNykpKp85UmHLVCZ91rnwXj1Itg5lGAE5R56BAagSt4G63vAdgiAWQZkIUQIZQU2xhxs/odNr1L4TJ/rK3wMLpIaLeTz8L8ZcdIamMwm9YAxdZOWQNcVCX+XisWTf6yZxGG6zweyhBb+EbaL+QXtJXLKUlGgKcHmYvNkOzyS/YFZvvza+aAjJXuXbSIhEk8gitstvzWuoA5tszstB1423SdfW3sA0+Qx9U9OjW+xnfyG0afj+/+SWmulArEXlruGCP60Ku/UdKuuiZ/XcXTayPl0JLxsE1xknQVgJEUJeciomZsrqczZLk3XGE69BczbYDQovJwyKxNZW6mCT5GAca/wvsT0kZpYUM3iMVdR20Mv7FeDEWqv7HVAcrwzi7ai8FHtymEiKUnT0l/QVtq8BnDqCiUJleXnTJv5tikYUrcnMzBXSw8E1loeGQ/KXhVYoFB1ywzTxYswh5p2x7qZhC0xCjV+YOIJmXsQIGihv08X8WMFw28cTUPOJHVgM6k05lgzb9UOBn+ESOupiEOqACG0bWqzXLPe8cVsnx4FBZ4RKpAmyTDY8KMtESri0a1cK9rbUlxif4kIuQ7D12sQuy62SmvpqfM6gVfZd87EGS8UnPeJd3N5BPdnlLtSqJIpnE+0CCMOZz0GfhBL7i4PIgxqX9el1j+YGuXUgEua9Wen9CzslQXi9Q5PvhRplI1PjqV6qRHBDq80h2iNO4U140+Crmr4rGdwfN/QPmiWhy3WsBfA8E/0UdhApDL7ZGGJsvAv2468SGOyb3nSVHD7WGO1K1IiZWneZJzVv1GvX47z50kubShVX+5BxXz5QUDKhv4Cve
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39850400004)(366004)(346002)(376002)(136003)(396003)(91956017)(66556008)(36756003)(66476007)(76116006)(8676002)(66446008)(7416002)(4326008)(5660300002)(64756008)(8936002)(478600001)(66946007)(6486002)(110136005)(41300700001)(316002)(966005)(2906002)(71200400001)(54906003)(2616005)(186003)(6512007)(26005)(53546011)(83380400001)(38100700002)(6506007)(31696002)(31686004)(38070700005)(86362001)(122000001)(921005)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFNPakw4ekpOaHJWQUlUZEMzeUtvcHJ3K0lsdUNITGVnTFFQRjUwcko3QlZJ?=
 =?utf-8?B?NTNNRkFSSUlxcmpsU2I1TkFzbDhLQStMQ3czQzh1SGF6WHlvYVlOcTlwcnhV?=
 =?utf-8?B?ZVlpeWUraVBRVmp0TXJvRGxPcE4rVnVTbmJwdUlvWEZCeTZrT3BNdDVmODlU?=
 =?utf-8?B?U0xvaE10TzVMbzgwQWlWenRQTXdQVW93eVhVcS85eVFSbnprRk4vZE9GanMv?=
 =?utf-8?B?S0ZTaUNxSlkyUDZ5dmNILzJHRUFDWkVKbXNMTWFaOWxZZkQwTEdqUmQ5dHo0?=
 =?utf-8?B?a0FJa0QxdWpVYjg4Smtrb1l1ay95WjI4OWU2eGR2Vm0vZ1VNUTFTMVZzNUw1?=
 =?utf-8?B?Q0pGQ2dYU3V2QlhybUEyYStoLzFmbFhtMU5xSzdmOTZFMllBV21wUnBxTEZV?=
 =?utf-8?B?ZlIrQ3UrYkNuNE9adlJpYmhEQ1lOeXgyYjVNVGNoOElvU015NWUwdndRcUpH?=
 =?utf-8?B?aDczMnJlRDR1dS8yTis3YzBZOXp2QWN0SXdtTXc2Rjhad0x2cm1MUjFqbk40?=
 =?utf-8?B?Wm1vTUVkUDhMSndOL0oxODVnUWJkTUN3RmF6SGNWb0x2c1NSdlJNQWgrMFhp?=
 =?utf-8?B?RFRzaUZ6RUdsL3haWHZwczFuM3JSY3puRWUyclc1OW5CYkQ3TldjY0U4RzJH?=
 =?utf-8?B?SW9QalRBRndVaU5YUjZsaU13dE9hZjFRKzlNcHhIZkY4Q29lUFBlUUpOMnU2?=
 =?utf-8?B?UTYxYTB6Mnl5M215WUkyUi9SMUxpdjN4dVBtVjlOU09HSmZoMUpsWWFsc3pq?=
 =?utf-8?B?OHIyb3dMcVVCQmhmcUtWbjd2SFNXZVZKcE9FTlBBck1XRFBpVDFLcjB6ekYw?=
 =?utf-8?B?VGZzSDExVlJxQVlvdmxOVFJtZ1BLTHFQL2IyaUlNcVRTNnVtbis5c1NuWFNy?=
 =?utf-8?B?T2wzVzNzaTVtTzd4b0hoNC9jR0IxVy9GNEpYZE1Tald4b3JlT05aam5wK3E3?=
 =?utf-8?B?VERtZHh5cThPUGNOYWEyVlEzQzQ3K2trekJvYVIyRFdCRDdOQnNMTlhOOWgz?=
 =?utf-8?B?SU9LUTd3d25yaFJqSGczRHdiQWc0TCtxcWo3MHRnckc0QXhyRHJIR254VDRE?=
 =?utf-8?B?c3VYMUwveUs2ekZJWDZQaXdIck41dmgyVWZsRnltVkdqSkZaZEtLNFAyWXJv?=
 =?utf-8?B?WVFOeG1ZcXVIYXpkSzc5bFJmcGV3NklDSXNyaE44Yng1RmxHbm5EUFNPb0Ra?=
 =?utf-8?B?Q3pvQVE0bWRieUhOeHVXNEJ6bWxnL3NtV0ZSV3NBZ2o1Rm1PSlVFT3p4VWk4?=
 =?utf-8?B?V0ZUbVc1YXNUMjl5ajNFbHVBSnpwTXZVZEcrbmcyWnZ2U2tlYmdOYllKZndR?=
 =?utf-8?B?UlNER094V0dvaTlOS1lVMFFhTFJSSUJoQVM3V1ZNNXRRN3o3dEtScG4wd2Ix?=
 =?utf-8?B?S3NrTWxBY3pvdEFvZ2RTNWl3anltQlFWWW80WTFNbk1YdGhZZW1JMUVrdUtR?=
 =?utf-8?B?QWROV0p4anhhV2EzcHhuSEphUW8zT24zbittVWU5ZGpOVU9LUWp0TXVWQnFj?=
 =?utf-8?B?Y2xWVTRSQTBOcjBHbVloZE54N1N0Z1hZbU9JZDJNMHZ4YkM3eDBoU054OGpr?=
 =?utf-8?B?MkFCRllWUHErZG1qR2NpU0p1NzBoeklGN3lkWFliUnZmdG1obmVnUlJxaFUr?=
 =?utf-8?B?SEJ6cmtENjc4MUtIbWt0TTFSbERKRHJENm9NRm0rOWRDcHVFSStwYk5sK1hl?=
 =?utf-8?B?VTdod3pYblBPTjk2Sk0vbUNnSVFiWlc3VVNveFA3eDZ0dGIrb0NSMFVncUho?=
 =?utf-8?B?c1hzcEdsTDhlY2dMb0lTQlIwOE11d1dsWitsRHA1OW9yeWtMSFcwR0poWUdN?=
 =?utf-8?B?OFJ3NmY1NlVjdUs5ZkxMRGtNYkFVNUFiTlJSRStVdTZZZy84bC9TUGg4cUFG?=
 =?utf-8?B?UVlMUnVMOFJCakkwaHZKQ1psdGxDZWk5Q0QzdUd6RGRLOHJCZnMzZDNhQ0ZT?=
 =?utf-8?B?eis5RUZLZGZwTWhldVNMOGZkdG1jNEc2SGFJTjMwVGRhUm12ekQwUkZ4VlJh?=
 =?utf-8?B?OGNZYXBSSUxlSHE2RmF6azJoNzg1NDhxOGg4K2pMMDdSaEluV1grOXVldkNr?=
 =?utf-8?B?N25pZUN3Wk4yd2ZnR0d2VzRkTjlGamdLWEQ0L3FrVy9LbVlvcS8vdU1wUERC?=
 =?utf-8?Q?g6zq7dBZKq2Rjm5Nq5WlJdbVy?=
Content-ID: <331BD86575FF6842BF2F93CC84DFDBF9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88570c51-aabb-41a4-7e72-08da8e5e9d0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2022 10:17:03.9011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLTg2jirw6QyJSQHgXGI4wXvykDRBgI3XfqGx4Qfp+xOFE3qNBbcjeNrCE+8ggESd72VipSQZpqhg7FGuNtD+CYKduciQBnkv4X0pBfM3Tk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3456
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220904_031710_883722_67D3DB6C 
X-CRM114-Status: GOOD (  17.98  )
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

Hey Guo Ren,
(off topic: is Guo or Ren your given name?)

This series seems to introduce a build warning:

arch/riscv/kernel/irq.c:17:1: warning: symbol 'irq_stack_ptr' was not declared. Should it be static?

One more comment below:

On 04/09/2022 08:26, guoren@kernel.org wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The patches convert riscv to use the generic entry infrastructure from
> kernel/entry/*. Add independent irq stacks (IRQ_STACKS) for percpu to
> prevent kernel stack overflows. Add the HAVE_SOFTIRQ_ON_OWN_STACK
> feature for the IRQ_STACKS config. You can try it directly with [1].
> 
> [1] https://github.com/guoren83/linux/tree/generic_entry_v2
> 
> Changes in V2:
>  - Fixup compile error by include "riscv: ptrace: Remove duplicate
>    operation"
>    https://lore.kernel.org/linux-riscv/20220903162328.1952477-2-guoren@kernel.org/T/#u

I find this really confusing. The same patch is in two different series?
Is the above series no longer required & this is a different approach?
Thanks,
Conor.

>  - Fixup compile warning
>    Reported-by: kernel test robot <lkp@intel.com>
>  - Add test repo link in cover letter
> 
> Guo Ren (6):
>   riscv: ptrace: Remove duplicate operation
>   riscv: convert to generic entry
>   riscv: Support HAVE_IRQ_EXIT_ON_IRQ_STACK
>   riscv: Support HAVE_SOFTIRQ_ON_OWN_STACK
>   riscv: elf_kexec: Fixup compile warning
>   riscv: compat_syscall_table: Fixup compile warning
> 
>  arch/riscv/Kconfig                    |  10 +
>  arch/riscv/include/asm/csr.h          |   1 -
>  arch/riscv/include/asm/entry-common.h |   8 +
>  arch/riscv/include/asm/irq.h          |   3 +
>  arch/riscv/include/asm/ptrace.h       |  10 +-
>  arch/riscv/include/asm/stacktrace.h   |   5 +
>  arch/riscv/include/asm/syscall.h      |   6 +
>  arch/riscv/include/asm/thread_info.h  |  15 +-
>  arch/riscv/include/asm/vmap_stack.h   |  28 +++
>  arch/riscv/kernel/Makefile            |   1 +
>  arch/riscv/kernel/elf_kexec.c         |   4 +
>  arch/riscv/kernel/entry.S             | 255 +++++---------------------
>  arch/riscv/kernel/irq.c               |  75 ++++++++
>  arch/riscv/kernel/ptrace.c            |  41 -----
>  arch/riscv/kernel/signal.c            |  21 +--
>  arch/riscv/kernel/sys_riscv.c         |  26 +++
>  arch/riscv/kernel/traps.c             |  11 ++
>  arch/riscv/mm/fault.c                 |  12 +-
>  18 files changed, 250 insertions(+), 282 deletions(-)
>  create mode 100644 arch/riscv/include/asm/entry-common.h
>  create mode 100644 arch/riscv/include/asm/vmap_stack.h
> 
> --
> 2.36.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
