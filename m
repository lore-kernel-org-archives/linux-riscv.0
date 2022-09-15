Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1AFEECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 16:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rkp7Vmw4qpQc7eBJ8mdyT/n85J1wFn2m0EGNDIlWx6g=; b=UsZ0f/D08vDb+I
	I1ITIqyCe0TjbTmz3vT7DEHdX4/hHwjSfJj/6Hv+hGe2aGQS9MCbdPe21m5W4PWSDRHmXY/El7OBV
	WLQDnRbQYzi1+iGrTRz9kYIrS36afekhTAGufoH6PALFKlyhIE/lFgFOrypijo0Ea1xTxl7zn9MY6
	lcZBuqxNOWdymRm75d8ha1D+Q1klzhBU3Mfr7cVG3rYV+Ts2Q09QnYerpFOF/rYYDUumv84AWWlah
	abwhEJ/b0m6NHa8/fYD0KFyiCipMu6vMAZEBiw6U2SXm50WHBLMy3W8+tXC89rAhF8QqCFo5iT+I+
	bvC4QXyNebKzuADhQ80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsAT-00Dhyr-Qn; Thu, 15 Sep 2022 16:56:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYsAO-00Dhsp-OI
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 16:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663261004; x=1694797004;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BThzje0XGv3cfJC3lq/eOosE7rHgQeW7GuI2s30mkaU=;
  b=jpuZNeqxZJRwdGX8gJaP2aNB7DIe3/FWYuJGZWBY9ppj2ji9IZ9EWp7P
   7BWWe+Kif0D1OvUSLQFG33va4vf2YUUbIcJktnJyD7A43eCT8AxvIMU9W
   dTwWjTPPBMGYDRvms3RMgLKolDo94/nhHQUQwOhg6MppCc+R4M2clwxzP
   hP6RXn9/0mhp/a7SG6lvT+D6SFbbebfwPgVsMrsf9NDmcicUq/zyvKw2C
   CfRimGvzkqfYvyEBvZSggyUAcspISpVgshYsm5juYJelRCHXV5NdQ43Pi
   BqlRPgbz3bWieuSk/J9GS6k0Nj9pwanJ19Lve4VXmNgYfPznFWzGuh2LE
   g==;
X-IronPort-AV: E=Sophos;i="5.93,318,1654585200"; 
   d="scan'208";a="177351035"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Sep 2022 09:56:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 15 Sep 2022 09:56:39 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12 via Frontend Transport; Thu, 15 Sep 2022 09:56:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3N+NUkBwghVdbb3EDZZ2L0sj6PKEOtQIqMRIAxPKvL+Nj6P8W8Q1uLNNClDpp9pKGGdWV4oErVhFy8ggxwkLy7ymtZcuYk4F+uWlOQ7NNeTVm6SXgJjOodVQUD3EpWBJGEiM0CYLIq+A0l2L/K0/QXYPUyj0h2e0Eyb5+f8HgnP7FzfnVDMfkyWD5Y9ei06CdHiF0g/vj1H1+YcFKUWV5sCrylA5LTSn6mMhuw0X0eRvIY9+BgS0q8mcdXsYeaEWbOoehvYGTIVLE+KMRUluuE6zrmpFXA43+3pdijQj/sZyVP2HkQrlUKzrd8HYFRHAngfqKTzRvLHkjZombh9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BThzje0XGv3cfJC3lq/eOosE7rHgQeW7GuI2s30mkaU=;
 b=lS0ZRbWimmRPMK4kG9gdO1BfMtu8/2P9H8B34EkAsAxIzMXyBWZx8qwkAXuJUjKRFiE8O5SZAIoBAfiiCZjBk8EImbIRDvJcHozQ7kAoJt9NIFehMNeVWeq1baciOkkUBXSwFMeWHNKlLp15lDT8Qoi5Chjcb7GJp+DnR7B8+C1OxhiMEx3EUeFpFOEFZnm662uCri/q749SXA1CVrato78u4PKLJhMr3IdOymZvxWZuhdk2i0U87JoQWU2sDdcFw2dDBvQS8c1HFX4qR7gNz7QiQe2j5O14TTKUU07BBoOOrDwxGDzu4l32N/eTll+jza4hBmJi+iIgf35kxZHfOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BThzje0XGv3cfJC3lq/eOosE7rHgQeW7GuI2s30mkaU=;
 b=cFRTp8SBQDDaZX7uNntoPTrK7L1Kp6TuJLMEw+FtNpg/FlP7wZ7ujywfTIM9GgvgdRUA1MZ3ZgbP8ZXcf50vnSeTJdpbh/YGKpgDahvBFWwOpcvOUlXwyrArqbqpZ3QlIGjM0kod2axcvaZ8BgJ1Hw4oOyKIJiw3AmYFMkw8q2E=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by DM4PR11MB5280.namprd11.prod.outlook.com (2603:10b6:5:38b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 16:56:36 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 16:56:36 +0000
From: <Conor.Dooley@microchip.com>
To: <abrestic@rivosinc.com>, <palmer@dabbelt.com>
CC: <paul.walmsley@sifive.com>, <coelacanthus@outlook.com>,
	<dramforever@live.com>, <c141028@gmail.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<atishp@rivosinc.com>
Subject: Re: [PATCH v3 2/2] riscv: Allow PROT_WRITE-only mmap()
Thread-Topic: [PATCH v3 2/2] riscv: Allow PROT_WRITE-only mmap()
Thread-Index: AQHYxJMWnJEOeg8890KCWf/MA/STJq3gvxUA
Date: Thu, 15 Sep 2022 16:56:36 +0000
Message-ID: <d46d6340-b985-49b2-babb-0082f1759c7b@microchip.com>
References: <20220909212731.1373355-1-abrestic@rivosinc.com>
 <20220909212731.1373355-2-abrestic@rivosinc.com>
In-Reply-To: <20220909212731.1373355-2-abrestic@rivosinc.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|DM4PR11MB5280:EE_
x-ms-office365-filtering-correlation-id: 2f53d54c-1b11-45fe-57a6-08da973b4067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ELf2VC9KyjnFjDFPZ5NHhDgScLVIjs92qK+ub28e20o1KSUB91dg10i44o00HR8j/BLtWwE+K0QLXQCLKb57qu2QisFvjqF+Ck7StiaEb+vZ7t1rDiROZFlGvMV1oQF8iivNDm+7MKatRjcsBn/tDS0zhgdqd694vhkfQ0wNFiYevAH9mnd0ObFbkpz1e+2noy4S25jZaoPQUR6Eab08OMRm1JO3gtNz277n36r81RPhy1Fkgekkj34t0Vofn043jgRP1THvoQ/ImqTEGxZyOtc/2qKPgx5f2akVCbZtzwtDsf70WtA0lbVlohcZZiCUWWc6L0e0e5ziyVgSLVZFHdPhCneFURYn1RPpleEdzDd8fWOxlDA0NDhjFUbpJbYwyPqP6nwAy7UfLYgLZtpnioTk2C05tq1r2Fk2B2B6V80qErNlDG0IE2upcEPwb0L16+IBE+PtP1iKHCddhb++y+dTMMpeuw+bPVY5eXSbwCe0RXiCs1C3JuG2tq3fCEMAJBAQ01OGRo4Y6ugeRsAU7ALzVodyAAaw3BWyvfTI6bE+NdFwXY0Lu39jtDDbns2xytU/lETOolLqPKgfmwVMlbFGLJmQ8jYC6zVExFeIqTQbjYztGwxmkLEXaHk0mDgwWuXla4GqS3nsXq9878/xCjgNJEg9mTFGqkqSHHU4xmWxfrtUH92Q1+zHIMiV6q51mwbBp1FhXa+f9CFewuLhg0coBsjV2iQbGSWsjKMctkMzsmk4Q2MkNrXgLbnbC2NwYaeftpKCdVIL/LoMdrIAcOyHjctuucZ8ISn+8STdEvhWjHmT6rzNYhJ6E2HwcUgr0Ys4K9o1ugAUlZjO3MZefWMfLppu4X7jy3+gUvXOUi0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(86362001)(41300700001)(8676002)(2616005)(5660300002)(6512007)(76116006)(91956017)(4326008)(8936002)(66446008)(66556008)(66946007)(66476007)(26005)(54906003)(316002)(110136005)(64756008)(31696002)(83380400001)(53546011)(36756003)(186003)(2906002)(6506007)(38070700005)(6486002)(122000001)(966005)(38100700002)(478600001)(31686004)(71200400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OCtUclhKUzltQlNZRWdYbFhoN0ZQZzZvWlVvMEVwcjc3akR0VERoRDcyaURD?=
 =?utf-8?B?ZWZnZ20wKzJZM2szS25ZeHpEZFRyckVITEdqZDRHRDJBZ1hDM1ZZZ0hMLy9v?=
 =?utf-8?B?bWhuUTIvd2JzSlVhOFAxcm1RZmlFUHdjZWYyOEdYcWdpZlVVQzB6ZlhCaE5z?=
 =?utf-8?B?OWRpd0RKak1ybXF3RmhRSnVZdHR0azRUREdRS2FBbVhSSElJRzI0TlBlRnhB?=
 =?utf-8?B?c1ZBbzNjdUJidktDT281WUNscG1rNWtqVjQrd0o0ekM3RnZncmR1VTRyTmJJ?=
 =?utf-8?B?WWJrU1luMitRZVlIbE0xVEtXMzI4bjhIRVQzdWltT3QyaXo5RE83emMzZ2Js?=
 =?utf-8?B?TzFqLzZKL1NEanVQenJwSEhqV0RWbHpSWlRBaERjOWltcW9jZ2dtUVgwY1VR?=
 =?utf-8?B?NW83RkhmRmtUaFRiTGd5ZDFBSFNmczB0SlZHQWJ1VlNjQnFHOXo1dGJGWjNm?=
 =?utf-8?B?SDJGZTdwd3ZyaXNpR3E1cmZvTGVtU1duTzByb2RCYjlqSWVtVVhnbzJPdW1n?=
 =?utf-8?B?S0RWRXJKOUpyZDBtNzZyVlg5Y0RkM3FLbm9rT0FIdWIya3hxZjlQVkRmSnpX?=
 =?utf-8?B?OWtaS1o2ZWZqdVRDa0N1aVF6UlJmY0JKQlZQNXVMZWluNHBQbmUvNmhTRDRi?=
 =?utf-8?B?aUZOYVVLWWFObElqK0NhVktPL0ZOaFVzUnpJQmV1bmsySzRLTmxQcFZWSFNO?=
 =?utf-8?B?Nmhmdk1ic2hENm91ajB1VmZRenNuTG5kY0MvQkVmaEY5STRlbzl6VHlaekkx?=
 =?utf-8?B?Z1B4VGs1K0NoYnRiKzhQSmlBVVNBNmtGNW0rN1pSaGJlSjZCV3hLOVIxT0d4?=
 =?utf-8?B?UEprTXkya081L3lrRm1EeTVVQVVVV2xHYjdLeGhITnAwNkxNb3NrbEU2aGhX?=
 =?utf-8?B?dFZWQVRYQytqRW1lWEVqQWZsY2N3QkMzVFlVM2pMOFBWT29nbktoMWtQTis1?=
 =?utf-8?B?MkQ0UDZydE1KY1lCZXZiaDlrL1Y5ODBGSjNqODdPNTNMaHJ0STc0MGRvYXdT?=
 =?utf-8?B?cFNTaE55TklmSFlTYmNHMTNhWG1nM1Q2MXdpOFMzS2labTV1U3NnZktpcVIr?=
 =?utf-8?B?OUl3aEo0K3huaytlTy92a0tJNlp2TEkyRzJwV1NlWjAwK1YwZ3pGQVBCZ2pH?=
 =?utf-8?B?cnR1aXloeHB5NVdJZjVBalRkVndFMmR5NkU5amxZVXRiSXMrKytIZXBVVkxD?=
 =?utf-8?B?RXpza0dkaVZCRFRCNGN2YlV6WWt1TTM3UVdQRGRXS0l0QjQzdkY0RG5oSGNu?=
 =?utf-8?B?QXZkOHR0RzA0bjNCSXg4KyszcFdPbERzbzdBbFdTUkx3eFlSU2ovTFNFVVBZ?=
 =?utf-8?B?VG96WTdPcS80MkRsTXZwNklpTytvM3FZMHk3azZ0ekI0OHRCS3R4b2tEbFdz?=
 =?utf-8?B?U0wrTHExUlRCdWVjeXY3UU9sVjhDUlNNRHVWRzdGSFNpeVFnRE9xdG5HbXZh?=
 =?utf-8?B?Vk45RkxHcVRCcm9kMXBkMFN1QmhxWU82WEJDZ1BBekRuQ01CdkxTbkh6OFpu?=
 =?utf-8?B?cmdiSG03U3RoSVRmQk95eWc0OXNiNWZYREM5WG9ScVUzUEFYM2hFSWNRVGpz?=
 =?utf-8?B?YTg5bng5UmVjdnQ0ZExVK1BGRDBvd3hOMTdrVTh2dTZGWmxITTRrMjRXM0J1?=
 =?utf-8?B?RVY0RnVHeHZGSUZFdXVxdTZobnJZdFNJMlkwcWVXVHdvVmhwclJqS0VzQUpr?=
 =?utf-8?B?THQ1VmJDK1ZvSWF6TUFaRmRLaURnQi9lamlsMGpCZzlyYjdBMFhoYUdJM2p2?=
 =?utf-8?B?T05IQ24vWUc1dUpLdExvK0pkc3JRbmYrQkZSYUluZTlwUjl2MVB0YmVCekZw?=
 =?utf-8?B?ZzNsMFhzNHZ6RWdqaTNsUVJUMWZRRS9iV09BdnN5NW03MnF3ZFhwSnpjY1BI?=
 =?utf-8?B?RzRlVG9rc2FzTTQ0cVFiSkQ2Vi9vUGtrZk1zMXBQcEhodWozTVU4RjdmSi9y?=
 =?utf-8?B?NmdYTVIxalVHanFOSGpucUZibFNkMGdKRG5VdUVVNXlXOU1SRWxpbC9WU25m?=
 =?utf-8?B?MStxQ3BuUy9VRnhycnppRFlFVjF2eGN1QUV4ak05eGhZLzdiVXdFT2hJSnFX?=
 =?utf-8?B?YithR0FvQno1aDlSRGg5NDhEQ0RsN1pDZ2d3d01WZ1RnRXNHN0pWeDJ2YjNZ?=
 =?utf-8?B?NElYWnBvbzh4ZVlndDNNcG4vZnlEcm9JVWZ0TEMyd0QvZ0tZTXpteXN0MFlK?=
 =?utf-8?B?Z3c9PQ==?=
Content-ID: <361874E3E0DFFE48A10D7132A1C40ED5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f53d54c-1b11-45fe-57a6-08da973b4067
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2022 16:56:36.5100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6X9qgLrxKc1FMJm8+9NBINzhXf5J3W+C0zWDEn0KTfGQRpkdASCxsEPxUXNfbno6CyEqvpgUmE5beTAZ1tWUgigc3kQcfDyQx0qw8bazHL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5280
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_095645_142023_EEDDF1ED 
X-CRM114-Status: GOOD (  23.30  )
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

On 09/09/2022 22:27, Andrew Bresticker wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Commit 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is
> invalid") made mmap() return EINVAL if PROT_WRITE was set wihtout
> PROT_READ with the justification that a write-only PTE is considered a
> reserved PTE permission bit pattern in the privileged spec. This check
> is unnecessary since we let VM_WRITE imply VM_READ on RISC-V, and it is
> inconsistent with other architectures that don't support write-only PTEs,
> creating a potential software portability issue. Just remove the check
> altogether and let PROT_WRITE imply PROT_READ as is the case on other
> architectures.
> 
> Note that this also allows PROT_WRITE|PROT_EXEC mappings which were
> disallowed prior to the aforementioned commit; PROT_READ is implied in
> such mappings as well.
> 
> Fixes: 2139619bcad7 ("riscv: mmap with PROT_WRITE but no PROT_READ is invalid")

For the naive members of the audience such as myself, this patch
came after a non-fixes patch in the series. What is the dependence
of this patch on the other one (if any)?
Thanks,
Conor.

> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> ---
> v1 -> v2: Update access_error() to account for write-implies-read
> v2 -> v3: Separate into two commits
> ---
>  arch/riscv/kernel/sys_riscv.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> index 571556bb9261..5d3f2fbeb33c 100644
> --- a/arch/riscv/kernel/sys_riscv.c
> +++ b/arch/riscv/kernel/sys_riscv.c
> @@ -18,9 +18,6 @@ static long riscv_sys_mmap(unsigned long addr, unsigned long len,
>         if (unlikely(offset & (~PAGE_MASK >> page_shift_offset)))
>                 return -EINVAL;
> 
> -       if (unlikely((prot & PROT_WRITE) && !(prot & PROT_READ)))
> -               return -EINVAL;
> -
>         return ksys_mmap_pgoff(addr, len, prot, flags, fd,
>                                offset >> (PAGE_SHIFT - page_shift_offset));
>  }
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
