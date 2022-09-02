Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46525C6FA82
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 22:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MxQEhtPf7IEgx78AFSs5293+QNhJBGMGjecSiFUAmY=; b=s2n46aT9CruTj0
	Po+LTiFhpyuUyjg2QwingMng41QZivY66kG0pXLiBSDEDccAuq58/NnmH3tN9Kq4lsQX6BNXJ70+u
	yUtMbPxQFcSUx+PUqkIT6BW2TGjgTQd3vW/i5LOZviI+cwTxf0sCXb0nR+jPceWT2pvTxQfj0mjEX
	EA09LE3QRPthJhRaanGMpHZbwKCkn94qvFIcVhxRtFZINgBjABRTYmSd4+D0iwFikVXgcaW/ezRB7
	8o0UfQp9udtYvIPIEfHXObysz4mcU0pij6+yCmX8mLGTVV3JprrVPOb8R8KDe7HyGfhneSzTwxZAI
	JnrXt4toxezVRSu7gfNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUFEC-00CCl9-9k; Fri, 02 Sep 2022 22:33:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUFE8-00CCbu-RN
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 22:33:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662158009; x=1693694009;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=UbVPJ5o6JMgWLfJZvqXZoJcUvu3I2ChD02187KLDLnE=;
  b=1S/d7WKJI+GVcWDLUnAd+pOPPJG3fbDVSV/k4ZPmffBiuEyPznbEtgCZ
   HcgX4ek7aZ+VtVrokrruvpujoBktv/icE3fFhu0VkAu3wpnJbfgoKAtU8
   Q9ANE+R7ahIFDJF9L7hCKo/cj6twP1cQQa6D4HKQr3MrbypPm1YHoJgBy
   h47lIyFynDuQewqDR/t0b7pe+CPMCiwqs+ZQvKlao8Y331mp0/3AKGMH+
   P2jOiSrVBc88LX7oW1/dDMuHyF2bWWGuEXg6fya4XrYZi6pVorHdo8jK5
   koBdz4fqdRUWlPIsZNmQNa1t9X86J9vgBFw2cP4Qw1JvHtkj4Di5gD2sV
   w==;
X-IronPort-AV: E=Sophos;i="5.93,285,1654585200"; 
   d="scan'208";a="172216817"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 15:33:24 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 15:33:21 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 2 Sep 2022 15:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYUDkp2XHWzEV8Bm/9xyfevmu0fGJUdoamEPDEoaGj0/AOYZWEL7vfM/fZeVLhPgR/RAi4zaHi0vMJESPtuyQHYeh+OveTygDFABBqTtIr5sX3RL1QlhPydwiZjv5ZYKTHmw87BTt4/AjAqcESVwGM0mIhT8IqpZX/aweldxCP0buAOAgsezipidPqZwBcnAdbNDNySxtKbJm4AMb+tl3zCwB72MA0dj4lowh3rdcZx1OZo3B7QvF9Fo0fBAiYVTeYjaobv3Rih1CuIPiWDf3LRBt/z69ewcHdFb9gBQAX5+3/EOqAUxxHxt2I1xIF1f3WenZsEOMQR7gI0W0k0Fng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbVPJ5o6JMgWLfJZvqXZoJcUvu3I2ChD02187KLDLnE=;
 b=cISy0TccUPvFgH/9BTFu7Del0Fh82amlHUpIv7NwC0wOOpjg44XDyg8wNB2NSB//u7Jd2064r05QiTPlXxOdYSP23wjHWqvbgHfXoY3QAakXhk/h27KpbvNYz/f7fJpmNFRrsvMXaqf/Z4xpKSIlzjT8E1j4D6kEBdgM1mpMmdk3aU9y/LLe5Hbtl8NQmZjnN4a/zkpKi4Ti3MNdwOf6on6nLtKcstiukKuWfHrFfkqXG8BaBkHhqHLtHhNJTMeOYATcrjC8FugwQYC9xa6Es/0LevvVRqBQIGZ1AemrO7RldZ/i4OGd7i8O1jYp9kkaGe4S4S9oFKaDdV/AEhwR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbVPJ5o6JMgWLfJZvqXZoJcUvu3I2ChD02187KLDLnE=;
 b=K/2inFxZHlxTUWCov1iw5pppwULGGFonmLdZ1ZKBVFnPj96mKqx/MUsgEiNLyl6YlcLX8uSBf8ByIjgyNaWDGe09McbLRPeqtFA0oLynanAz7XLlOJHo3Pa8nr22Jgz4ZG0wgGZgyqznvsknNi8/lgQkOhcHUELhr3jlswENlh0=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 22:33:10 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 22:33:10 +0000
From: <Conor.Dooley@microchip.com>
To: <ben.dooks@sifive.com>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <greentime.hu@sifive.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<zong.li@sifive.com>
Subject: Re: [PATCH] soc: sifive: ccache: use pr_fmt() to remove CCACHE:
 prefixes
Thread-Topic: [PATCH] soc: sifive: ccache: use pr_fmt() to remove CCACHE:
 prefixes
Thread-Index: AQHYvu8NLkT3QQwUk0iPzNsS6HUW0q3MuhcA
Date: Fri, 2 Sep 2022 22:33:10 +0000
Message-ID: <fdcca7c2-2921-3c65-1b2b-bc97247c4423@microchip.com>
References: <20220902171105.257436-1-ben.dooks@sifive.com>
In-Reply-To: <20220902171105.257436-1-ben.dooks@sifive.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a822aca-2673-4b4d-d036-08da8d331d83
x-ms-traffictypediagnostic: IA1PR11MB6217:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LvLcYDvLTNU+qHO4JeasqYlGCQSM/2xynhZ5cigS6Of71ogpe6Q1e6nq/3hyri7UGn9CTS3mKWzq7ljkJpj24CNIWmP3PcyUh7zYyYLBn7Al99eIxgelTqzNLGxTrKa0I9QyboDidVqxQn4TcPQYvVEQcr2gkmlesQTVbAnXkfwUnapDUyYvFyVzyc+eSxDRZxz6uHeFh1YexeCFFh2mkm1Cgp3l4D/d26F+oknOI1FtRqFGvEDJeFBnMDevXWnncSd341JMtGJPfbztcr2pqDe2FnS5fI/HgLOpAFRK42sO6tCGNAqbZN5N9ieypUjaQgRP5hA6wsLAV8+QfC6meW4vCj29A8PiVha0g+WzR5NA+WyvB/LcHRhOjYp9nGOFYyMJIYi8v5caxr/Q8+PsrWIOrJYdmyNSFhyyO0LtINmDgE7EtK5mLd1WvMKXQXTy0WrPwxvlgwbNgQrdTLLpmpKZrSEObdAavRfyhIYK96yKDrFUxl83nXhSjiRN/GHABq0fFZsNC3SRvn/Qo1Fg6GTdm4JIDQDaZnSN6hYyy8GI1T+IhWEwzA0XeasbPfsrJ9UobyEjHwbdzWH1POtrYbHOfKDuvOeOtgVn8eRt9cfwoHL0H3IwTii6gl+OS8PORQcp6x2B0CjHqMdOVDBoDYerY7C2vnuYWjXljv9q199bSDB8o9Fsdp6S2Hky1M2anVz6B4xeTEJ2GHi58MhVg3Nom/UxSTt4JA4TMkLTfVa9aSOnct7w83yRBkQRWfab9HLJDM/0JFIMAFuxX+ppi0i0KSC03y106tEV7MciGh6jlhYx7Aj55SjMOVPxFjx7Dby6053b5Xr9jl3Vkl+glVi1ZdVp/u9CTo/WEc9nkeM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(366004)(396003)(376002)(39860400002)(186003)(6486002)(2616005)(478600001)(86362001)(41300700001)(6512007)(26005)(38100700002)(83380400001)(71200400001)(53546011)(31696002)(122000001)(921005)(38070700005)(2906002)(8936002)(66476007)(5660300002)(91956017)(36756003)(6506007)(110136005)(316002)(76116006)(66556008)(66446008)(7416002)(8676002)(66946007)(64756008)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZDdGUlFVM0JEQ29udTZYVGNyZnhVdnhkZGRiR24zSDhiV0hMSE1mMVBCWC9Z?=
 =?utf-8?B?dUt6Q1E0V2d6SEYzOFBtYWRUd0JQWWdxZHdhMlZJMWVRdStxeFVmV05Fa2pZ?=
 =?utf-8?B?RzNrQ1g5aFFJUnRNT2tPc2NFQTl2bzFIS0pqbno4eElTcG1ISVo4d0h4U0xC?=
 =?utf-8?B?RW9wc0EzMWNnQlpUOUpudUZBc2VsT3JhNXppZmFYSldjbEJkc1U4bndaQ2ln?=
 =?utf-8?B?T0JSL1hpNGo2a3J2RFlSeVBySmhaTGJiTWdrbTA0VCs4bG4vRlUwakdNY2tp?=
 =?utf-8?B?UTFGKzJMOUEzTGduVkJBL3RRUVMwbEpkY0VxQzd6WDk2WXBqdllmc1hnZWtN?=
 =?utf-8?B?WFV5ckxOSFQ2aGhMdlRNS0NxUHJJTHRhbkVGSytMaGN1VFZzRzR5alNwOWpi?=
 =?utf-8?B?OGV1VURVemZCcHBYUzNMQnFGMXkyLzgwT0JNTWtXTzZNaHBKL2dvME9wRkgz?=
 =?utf-8?B?SmdnaGRwQ2pZQk56UVR1UEFjZGZlWGVWZ3FITS9TZnlsZVYycVhYZS91RVNK?=
 =?utf-8?B?akd4cjArazJQWlJyVTBNSmFPb2NIQ1FQU0hZcmtHcCtYWTNIOFpxenhwM2Zy?=
 =?utf-8?B?b2k2Vnk0WVplZ3ZtZ0ZZaGYreVZIbHloTWgrejlBTFBOcXB3ajU0dkI5Wnlk?=
 =?utf-8?B?bC80WFJReGdaV0dxVzdWdFVTZW5vUnhuTE13UkR6RVN5c1BjdGJlQ1JqeGx6?=
 =?utf-8?B?YS9nVTZDa0IxdzU5MkFTN0g5RVh2Rmw2SWcxOFRFejVQZHVkKzNLK0pXbWJj?=
 =?utf-8?B?b2Q5ZjdoaDhmazVacFFTUm1GWG51UVR6WFlvYjExRmZHei9FVXNNSGdPSHkz?=
 =?utf-8?B?OE5UTW9lc3BpOVY5YkNCUDJFejN1V1VQNjRyeU5zK3hFNDI2azFqNVZoZzRI?=
 =?utf-8?B?dVgyMnpjNmNTeXBucUIrZGE3OUkwOWdqR1d3NWZlc3N4QlVpcHpHUW5GUGo5?=
 =?utf-8?B?ajdzMGFvZEhwa2VyY3N1aTRjMDl5L2VnaWJhMlRJb0lJdVh6Tkg2Ym1FWjBt?=
 =?utf-8?B?TFg0OTJVMzdpdUNFNEVYZDloOThpV3NJdmVOdnd4NWcyYmxpL0NCK1R1eXFT?=
 =?utf-8?B?MlA0Z3dmRlhqYlJPbnpVVTJKanFPTnBzR016cWRNVi9vWk9zczFuZldQWVY1?=
 =?utf-8?B?MTZVTmJBV0UzeEFpQW1xOFY5V0IwS2hRbEZMZnkzUFdWMkNGQTVtam5kbXNT?=
 =?utf-8?B?RnIwN0JDa2lVNG8vZkd5b1pUeXJxQUVoK3puTEFkOHFoMHlEQVhJWGZYaVZC?=
 =?utf-8?B?dlV3NEhlTUhHYkxEUjRBajMwNHBEd3BSMU1aZUttM2lVK2ZVRHQvbHhaVDZH?=
 =?utf-8?B?OFl4Rmx5aXk5MEZxVHA5WU1kRjVBZWk1eWtwR09nYURudE1lSUNHSG1WR2lM?=
 =?utf-8?B?K203SWFXeWliWWhNMFNaR2FpQ21scUJsLzgrcktFT3lUdlIvd29zdVNKa2JU?=
 =?utf-8?B?L3AxdnJVQWcxQ2gxVHVVbitIVHZUS0h3ZVd1WklUTVE5YkR5V1FsYVBnUUlY?=
 =?utf-8?B?MlhwbTZPZHBEd1BpZm5WTHBsRnZ2Z2xBTmRaNWUwYy8xdWZKa0pGMWREa1lV?=
 =?utf-8?B?UUcvU0ZBL3VtanljcmpQekhqS0FzWkhSckpJOER4b3drNHhHTWdob0tjZ2dT?=
 =?utf-8?B?UFVKMHNiWWJBVzAxTVlTakpIcFVMK21rTmlIQ2FVMGluM1VsSjJxZkgzMXJS?=
 =?utf-8?B?UlhhUnZpblg1UmV2ZEt3QXpKZ0xlSEtJdXhhTHZnRnVyVStCckoyMnJNRjZ5?=
 =?utf-8?B?YWNiYTdva3p6ak9Ec2UrSXAzUVY5K2wzMEFvVnNHQ21QZkJrS1BseU9mcWpp?=
 =?utf-8?B?Qkc3K2hNc0FpWTBpdjF5eURaamZ5K2dGU2JrQmo3MElST2pEcWZHbi92ZGtv?=
 =?utf-8?B?WWtkWVpkNzJFdU1Qdzc1YktSb2NYV3dlTW9BVnZCeXVORDNWRExyZi94TWE1?=
 =?utf-8?B?VlVFK1VreGRSazgyY2NWMkZPdGJtOW9zaW01MjhLTGNoWDZFUmcwcVhSSXIz?=
 =?utf-8?B?R2RPb2IxeFVyVWtaZUJLRmlRZEI0RFV6S0JDaGMvQjRpU3VzcEpRL0ZaWkYr?=
 =?utf-8?B?bWVIbXZjTmZtOTZ1cEp1TmpZaFVmUE1jbnF4UTR6SDVZK1lmSno3eEFKb2tJ?=
 =?utf-8?Q?ynzOc31ZxZ4Qxo9OfERYruqMu?=
Content-ID: <7A2545F808A87B42AB7B23E61A605FDB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a822aca-2673-4b4d-d036-08da8d331d83
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 22:33:10.4045
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6/mEXfLjmnVjj2QelW1YEZBIJ/9hqwfPXOn33zBBtLPq42L4z4/EyYNXm2D3UXxViTp0hcUzo9hRPCQdmU2B65nPfSJUAY6riuEyOURuIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_153329_258797_6E1C3DB4 
X-CRM114-Status: GOOD (  21.84  )
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

On 02/09/2022 18:11, Ben Dooks wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Use the pr_fmt() macro to prefix all the output with "CCACHE:"
> to avoid having to write it out each time, or make a large diff
> when the next change comes along.
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>

Only replying here, but both these patches LGTM.
I'll leave an R-b on Zong's combined version of the series.

> ---
>  drivers/soc/sifive/sifive_ccache.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 40d2ac7895a2..90d21a1a4aae 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -5,6 +5,9 @@
>   * Copyright (C) 2018-2019 SiFive, Inc.
>   *
>   */
> +
> +#define pr_fmt(fmt) "CCACHE: " fmt
> +
>  #include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/of_irq.h>
> @@ -80,13 +83,13 @@ static void ccache_config_read(void)
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> 
> -       pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> +       pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
>                 (cfg & 0xff), (cfg >> 8) & 0xff,
>                 BIT_ULL((cfg >> 16) & 0xff),
>                 BIT_ULL((cfg >> 24) & 0xff));
> 
>         cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> -       pr_info("CCACHE: Index of the largest way enabled: %d\n", cfg);
> +       pr_info("Index of the largest way enabled: %d\n", cfg);
>  }
> 
>  static const struct of_device_id sifive_ccache_ids[] = {
> @@ -148,7 +151,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DIR_CORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
> -               pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DirError interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
> @@ -157,7 +160,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DATA_CORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
> -               pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataError interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_CE,
> @@ -166,7 +169,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
>         if (irq == g_irq[DATA_UNCORR]) {
>                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
>                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
> -               pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
> +               pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
>                 /* Reading this register clears the DataFail interrupt sig */
>                 readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
>                 atomic_notifier_call_chain(&ccache_err_chain, SIFIVE_CCACHE_ERR_TYPE_UE,
> @@ -200,7 +203,7 @@ static int __init sifive_ccache_init(void)
>                 g_irq[i] = irq_of_parse_and_map(np, i);
>                 rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc", NULL);
>                 if (rc) {
> -                       pr_err("CCACHE: Could not request IRQ %d\n", g_irq[i]);
> +                       pr_err("Could not request IRQ %d\n", g_irq[i]);
>                         return rc;
>                 }
>         }
> --
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
