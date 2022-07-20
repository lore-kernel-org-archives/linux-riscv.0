Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A796C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LuBl8NYIU0Euybcw4X2YrKofwKU0g1KG63olw0XYYHw=; b=niT0Z2Rg6rbA7y
	zcm4RCc7ZSr08y+04XFpW91inaw5DueRIf5CnZoLby+CxW5JpF4bbKXQ7LfdNOGMYjUefwuvNqsKv
	Gvrvs/vJgjZtvNVqk/1LvwJ4/JqCRkHz0x239IFbjsRyPLesjQPF0EKiJ3i1YbHGATfU8QcBvuuCn
	JIYeutjBbi0V0wtrzjXsg0Nm7YPAD8ninOrRV/XU08zSjvbLmg4pmSxPZvvrRCUWrxCFQCtHkMYL1
	HCpKrYInFINP6m5ukgtsN15Fr+8FaXPbvqB6W227g28OYa5iGbBt2pPFAeG21Z2Czr3UBR/ql3ox0
	MX0exks1ukrbdksFxZMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6Pj-003ZKi-Cg; Wed, 20 Jul 2022 09:54:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6Pg-003ZK4-FP
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 09:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658310880; x=1689846880;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version;
  bh=stzB1pFkp7+bYu6e44guIzvInVyOwfI4Q0cE2cWNoOA=;
  b=1Lxq0GXjOaSiFSek7u68j+C+vGFkVpe2lB8UDSO+sM7E75zfhk8Oiu0K
   A7QQkmMZa5W+GbeDzc7MG/JkHmB8LRSRci5mkMBY02HGul6Fh5OnxwRQ4
   dA+ANuB1VQjwR60zE1oz7AhBy8Smg/4SGjncGrUQxppPbZ7ONF4XKMHVs
   lHffXhQXtcA/nbYwAZLL1MosbIx7NHOPpz07E5NmHbiXPWrMIJcuHt1jY
   Sc6u3FhN4Tq6th1B4dp7jF+rJaa9vcDUIG33TIAW6Ujo5LVLjM4Ru9WhY
   qGM7mWQPHSc3beSeIqbf3ddCqntWJf4wHMX4YW5Z3+8iePTJVWab/VPy3
   w==;
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="105310244"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2022 02:54:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Jul 2022 02:54:32 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17 via Frontend
 Transport; Wed, 20 Jul 2022 02:54:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDyQm/MKjIlv5E5yH5m1cmphHJxIoVaKxjbIIPwbvPOaNsDDYtGvxrK7eG+PW35prlAGuXrR1l1wWDtY/4Bc7RoOe0Lq/Kipy4WJhfM3o6hpedLWWLCJaZU+NM3QFjSOQ57AeNFQPGEZyo/P7hg5i6/fyWNmCGUWU9M7lekmKkvBaE0isX10CvoXIvXNSJ7ENobSGcz9ULh9yqo+HCW4TJuFVithscRUZcvYcE3Hsizl+DbQ2qHWa0ZvFP1Fwfv+0NZyrib6jmVV3IH+bW0EKjoNBg9IFZOxYfp2TeJYsSSYhHSk/lqJpdxchMg3RVUpysisK7ZZwANN6fFi0ipQBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stzB1pFkp7+bYu6e44guIzvInVyOwfI4Q0cE2cWNoOA=;
 b=IKQqkETs9/GkEAPJzU+Tgz4No8cuqkbZO/w13D74HU+JBdAYg2sK+U7wjwtpt6ws/WJYJMidlTUwsO5BS7o7KBQCHCyujnN7g6jqanVZM79+4tSRXe/U1sak6VF6sIy46i7I0IC3GWlMvtpzXjYJFhH0+8cuz29a+eG/Pnzu6VdnbOl17SYmXbQk+3p/dC9VMGWTLWKeezFpzv8H/qX+3AkkxfawYnk9hM4BzJ7SA3TvZwT7bPWIkx5LDG7UOVjU0S1ZSqRNxxiWaEbPsLJEcSiuaU19BHiat89XhOF5lerR89dIHXMlYNTuiY1cng2TMZ9O0mN5HBtv6ndtHnDbow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stzB1pFkp7+bYu6e44guIzvInVyOwfI4Q0cE2cWNoOA=;
 b=Kc1RyBiNp/iPdycX5IMqe6rG2pj4kOGDEJZ5HfEEs+Ds+so7/Lg/Hz8V8Iyz2RNixjibn6bDiw9zRmnAucpzF6Xs+Gigqdt2BF0JdQ0vsyRYw3/+1kHayPqgf+bknR8AihjJRQE/4g5RxajRuxBFBP4cZEFpIWm0Q8rtSrUfglA=
Received: from PH0PR11MB5160.namprd11.prod.outlook.com (2603:10b6:510:3e::8)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 09:54:31 +0000
Received: from PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69]) by PH0PR11MB5160.namprd11.prod.outlook.com
 ([fe80::6090:db2c:283b:fe69%9]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 09:54:31 +0000
From: <Conor.Dooley@microchip.com>
To: <zouyipeng@huawei.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<guoren@kernel.org>, <penberg@kernel.org>
Subject: Re: [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in
 arch_uprobe_pre/post/abort_xol
Thread-Topic: [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in
 arch_uprobe_pre/post/abort_xol
Thread-Index: AQHYnByLin+S/oZHK0es7c+ME97uZa2HBFqAgAAA7QA=
Date: Wed, 20 Jul 2022 09:54:31 +0000
Message-ID: <5fa8d66b-9b97-0f7b-d22c-514cf599a6b1@microchip.com>
References: <20220720093447.245585-1-zouyipeng@huawei.com>
 <7867387b-3ffe-f51d-b15f-5f0ac45c8e48@microchip.com>
In-Reply-To: <7867387b-3ffe-f51d-b15f-5f0ac45c8e48@microchip.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6aa2a89a-0f2a-4c13-4e12-08da6a35d7ec
x-ms-traffictypediagnostic: PH0PR11MB4984:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VK6BhLXcf0qSQ9lmIGn/bGTxU2IWr2OpcNGL/V+vobyhWTxrF3eXQIwr3nG0J66wT/vF1DY+o5pgCpH1JJ+UWejTF6931ciXFF9vbxDgl05nxkGLrhbWh2yrVXCSee9zjCIQwL+FkoeSwArdQsziaR8aOP0JKLpetCXd7tsB+wYelRyD7LIeTs/W4ZtcKHnYIVTPTWRWuV+dcflD5a1JjzQauEJ1u4ixX/iclkTrPRZIF1aWytiFRA08MQUf7LN1ciLG3QvVrTz9uyMso1rk62vYzpqBeerSMGGkkVQ2BHfIYm3M0I1VibtWhyL1lRdNqr6uPDLCKuk+IIi4zi6KfpJomKsRARScKKboFGRwt1sqBNI8NcT/TJRPLC7H1o9HvAXa+IpEIo5TB2UNLvus3pvvrm+ZWl+AqkCSGSwT8H4MnT5G6e/wIc1cUJkwxVoJr+yHl5zbStUIyDXeXPXa9y96Av9HsW6yP/woAGAEURTb+B/r1ySsTe9hvV40wvUD0d6e5PrtSJJbxfJXMzqEt2eoS+/6/QPkoykDbd1pYBydtfs0ylTJ4Ju519sUoTrqynRCyHdkPi25o/T+55eqdurRTsGsa+9YU1FoaiWv7gMFbhectpiMZFZzDaO/WQ5K6SoSJacWCIIpo21kugtNODWGByWSvGagQW5hsa4ZVQa9LvZglA9p7lr/XW+fSmCg7rlZ+awr9nRtHqUebnF3nBYOxkr6zZbN0f9p3QA+mTevH6WkIm58lrUyhjgq8iJbj5phdSGaP/MloMGiLZ9sZf5nLJtpbZkFUMh4cj3TxykGs+7KWB5YgKi3DHyteUEu9lV+9nLARq+4vwz9iqnRPYxPanO4d0mND+ESfta+dp041vn0JR95zqg4YrPfDpQE
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5160.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(376002)(366004)(396003)(136003)(31696002)(478600001)(4744005)(83380400001)(2906002)(41300700001)(6512007)(86362001)(26005)(6506007)(53546011)(5660300002)(2616005)(8936002)(6486002)(186003)(36756003)(122000001)(316002)(71200400001)(38100700002)(38070700005)(110136005)(31686004)(64756008)(66446008)(8676002)(66946007)(66476007)(76116006)(66556008)(91956017)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW11M1ZOL3QwOVJWSlpDM3lYWG1INmkvQmcxSXpraHBPcytkNGlhQmNmMldv?=
 =?utf-8?B?dVpJUXhKOFR3SmZGR1ZnU0p4R0dBb3FzVXU1SHBES3c2eTZFY1Z2cXVJbEdO?=
 =?utf-8?B?VWRDM2h0TUVtYXFweEsxTXNZeFRibFFjaFZnQ2dIaS9OeUVGbzk1U0FDbkJq?=
 =?utf-8?B?ZGtCYkluWWtKMU1pbWgwSnoyNTFJWVNpZlZvNnZqTS9uOW4xSkVhNUJMZjF2?=
 =?utf-8?B?VWVqYTk1c1grOXd1R3FzOWt4OHlBRjlLSHVybm5rREYyUmg0cDd4cEZrbGFk?=
 =?utf-8?B?bThlbkpqdXFTUlp6aUNHb3pCaEwzSjdmS25OVnluN3d6NXdKeCtGalVKcWl5?=
 =?utf-8?B?Ny9kUWNxQ1hhU2xuY3ViMzVQZ3R5TVdNUTlQV0pTR1Y5cXZNaWNFcXVLayt0?=
 =?utf-8?B?MFZxOStlTEhYS0RkdHRrbm5IRmxIZkpHQVM4bjA0YTRCVFRmTmtIZm5ZeUly?=
 =?utf-8?B?SXBJN1IvZENUeStia3hsamRyK0lNUWxwN0Ywd0l6eURPZ1d3ZHQxVm1Ka0FI?=
 =?utf-8?B?UmZKZTRiSGlUMHhCd3c3bkRMTnJzQUVHVmhrOE91MWs3ZjhHR1pMbEpaVG1w?=
 =?utf-8?B?eTVUb1hPV0MwNEIzNldES0g2NUFlMnVNQk9RclhOcG5TVStSUzdCaENjeGFG?=
 =?utf-8?B?eGZqNlphdEVtMnZnTmoxQ2ZIZVRFUFk5TkF6bWY3eE1mcUhzZE1FendqazY0?=
 =?utf-8?B?OG04N2s0RXlVV25TSytKU0tCUTdETFZkNVN0Y2Y5QnZid3E2K0NwQUZ3WElv?=
 =?utf-8?B?QzhnYlNoTURDbUw2TThyR1l6dFE5UThhZ3VodWk5WEdVbzBWa056c0R0VXZw?=
 =?utf-8?B?WDJKellNeVc4emdIYWVSUk9iU3F3cjRqUDViTHVpZjZFSjBWSzVLL0RJZDV0?=
 =?utf-8?B?NXhpcmNCZVVwNUZ1OWU1TDRQYzJLa0ZpMXdiSk1nS1BqcjhGTlJLS2QrMG4r?=
 =?utf-8?B?NlhQTHQweFljUXp5eG05R2RUQklwQlBkb3I0YUJkVWI1TzRSbWFXWXA3MHJV?=
 =?utf-8?B?cXRxdjZWMzdwWjNQYzF1dFhDQTNIL2FEaERXTFphUmp4WDhEd0tlRDFxWEJD?=
 =?utf-8?B?VXk5bFpYbFArY3h3cHhnMlhRRWRoTGRiOW1rQ2xCRXNmeEVCaElDSzg3TFlY?=
 =?utf-8?B?K09ESVpoSXZDYUg2OHRnUTFMTXhscGlxamg2M3cvcTlIRDE2c2hQeStMUEFR?=
 =?utf-8?B?UUhKakNiRmRhZUR0ZVd5OUhtNldQTXRVekUyNWhURGhsM2lFNWNhMG1ncmNQ?=
 =?utf-8?B?cG8yL3IwN1FuUnBIK3VVdkdmK2h3cnNpcjh6cENRQVMwM0h5OTQ2c2swTndI?=
 =?utf-8?B?RU1HMDJjZndZdDVHZ0NjWWVUdlZHdm1BN2kvUHFvek5GR00xc0tId1RxeDUv?=
 =?utf-8?B?czhSTmJNOEdGcDVORndGUGJyTTZBR0FtbDhWSkRxVU1Ub3A0MDJHTVN3Y0hn?=
 =?utf-8?B?SWd4amo3R2pKTjAxRXlCQUNXVFBPTDdPcUNhSFdaeTRqT0dqN2haZjlldzI5?=
 =?utf-8?B?aVJMSFkzRTRMcGVRZUhwdDIvN3Y3ZHBNTmVacW91cVBkanpWR2VHMEVyQ2JD?=
 =?utf-8?B?SDZvV2VReFJvQkVQLzVUUEgvb1Ywdys4NTNmV1ZjVWlUNlF4ZlJ5SDFCN2RS?=
 =?utf-8?B?Rk5mcXRoNzRaWVA1Z1lUZyt5QkY1WGt4bkZINmd6UXUwaENaTWl0R1J6cVFP?=
 =?utf-8?B?bXpnN0x4d3MyRTZkMVY1MDFmbzljaUZ3Tkd0RkovWHMwZUtwQjBkdVpVdVFh?=
 =?utf-8?B?akVSVzZVZmpxUEZhK0o2NEJEZXZmbkljVGtZRkJpRi9xT1EyYXFVRHYvNU9r?=
 =?utf-8?B?WnAreHo0NXFKYkZHNGVrYURVMFVTdkRGSURndlpFZTZmYkJmUGxkWSt5VTZS?=
 =?utf-8?B?Vm4zWlk2T3gyMFh3RFJySFFJUDlsMHJ4Y25pUzlCS1h3ZEtmNVVEaTN4d1li?=
 =?utf-8?B?UHgwUkIzMUJhVnpjdHAyNWNNWUJJMkQrT1pHN0xabVc1dm54K0w4TFF2Mndh?=
 =?utf-8?B?ZExrU1J2OHVSaFFxa00wMkF1N1QzaTBYdnFDRnQ2cTluQUdnK3hNSSthbW1h?=
 =?utf-8?B?NVR0SFhNbWhsczhmcjJzK2VORCtVRDBiZDk5S01jRkYwb29zZ3I0dnhQR3ph?=
 =?utf-8?Q?wmReZ8Cl2r/u938iW+dGOf3PJ?=
Content-ID: <707A1FF4FBC0984D9410F79EA769F425@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5160.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa2a89a-0f2a-4c13-4e12-08da6a35d7ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 09:54:31.4276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K0uDLmuEEJqAj5nDvNzrw/tK5aBcVvX3C5NoVlRckO5SKdEP9+QnznLTsxEchPivS4TRa5VivpFLRxb0MK91gmCzvnr2SRAIsxLScg/PlMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_025440_600347_E8D7C95D 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

On 20/07/2022 10:51, Conor.Dooley@microchip.com wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On 20/07/2022 10:34, Yipeng Zou wrote:
>> [PATCH -next v2] riscv:uprobe remove set/clear SR_SPIE in arch_uprobe_pre/post/abort_xol
> 
> Hey Yipeng,
> Just a suggestion on the commit message, how about just:
> "riscv: uprobe: fix SR_SPIE set/clear handling"

Hmm also, you specified "-next" but this seems to be fixing a bug
that is in current code? Should this not be applied to v5.19 too?
Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
