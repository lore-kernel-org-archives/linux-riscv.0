Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5048ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 17:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1n5D8UXuE8slKOy+rQnaoXc0IFIR8j5X2AzCcKTF5kk=; b=F9YJ4asUhuHg1I
	x2MN09VpDRoDqtWPh7oYy2f0+kpqFIVf1vLJwJbnfj1kmefKgbHsDCP6bGL/8dQ9jFeBBhqR3lFRg
	q8oHE8FfM/bmhM1+8dQt1K8l/OQWllnbw4krESP/fdvxfudDVcfnfMPkQOorittstAi/WhQloiggB
	NH132hN6J6STnlVhP+4BS87EXmW/O4MZRTB254qOmd+fLcR29phthGrLCfoLqfpcXSs2kwsMI3r7m
	U3tmTu10C2aQDl7AdUFfNal2pYloFhj0JDk6Asyhh2lsLS0Z/XesTBBieHCf17nyam3niJNtGIVnh
	ebpHJHIBYRwWcdaJJx8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVGGC-007t2q-4R; Mon, 05 Sep 2022 17:51:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVAks-001frc-3d
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:59:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662379145; x=1693915145;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Gfc7y/gU41JJZuKbRGXw1ynjyCoCNKxV/iXWctdJgSo=;
  b=He3+Kq2bnpeB13OOR5uPccARJc2zeLwfFGDmLo6YZOrSaSASQhZvdmu3
   YsEg8m13ZWSUOX3l6N40hUYopQ9BufZ3aW7bGeOgLeqVscVOxTUaLWitd
   fracZq+6syyBvDa3ClopaO6ZQoo8uJwopa28V2WffGfDBiKmcC1KBW4km
   LGWiY38vO6SXo1JJ81rYEQNnXZG+FJn9P8fGlqbyeNNuzAJoL8BdemJKr
   mSIi3bxow4NpaATKcTVoGIRFgQcaFG17tln/6o9uyDMULuzdipptfg31u
   zSx4fxuzPTgg5ThTpogZiZwIKTAt03dVRRl0YmHhwA+ieUBBIqSSsoeMz
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,291,1654585200"; 
   d="scan'208";a="112204712"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Sep 2022 04:59:01 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 5 Sep 2022 04:59:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 5 Sep 2022 04:59:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxILR0QDEL/NT1bXcw6qCaeUfdqCFY12qz8lqjJbrJ0fvD9PoYOtKYqK7+4mqTWicTTCv75a3I4SLA+clRaGcgCmck/4qos42vR8e9rdDuTE8DS7u7dHr5PU2i+mPSu5oPNB/k1JYwZCyaVx5wl4NtxVjFogK38GBcQmFzreHMD34vX2IeZtTaepJ0VnYoRVVIrsUISEQJomzDMgeAMaHJ4I8DNZTty4olpNUrtic0RVNBxrk/c/q2uXGWeHjNiasSICxklbbOUd0YDWu9jqYoxJ8HRUokuYcwkTbbRfPjy1vJRg3inbzEf+hqwRkKCN1OfyRoKaDafZK6sKeHOP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gfc7y/gU41JJZuKbRGXw1ynjyCoCNKxV/iXWctdJgSo=;
 b=PMcen0sXNpfZ9MoFKE0VE/NkTHukB2H1/9jPsGR0AYHHqtVzHKcSaMiimSnB2c/3NckhUO3LazoK5eS54aBnykGlm6Jlh2IqNIg7gvXXDWMd/DpNKqtG/NXvWEhEIlGcvtqpyQhe2w4kYC3vXqJfjQ1W4kWyWuiutuGYYq4D8PX4ECHHlQ/18zRaknLiAEG4XY5EIHRV3PYZbjoadaFn9I8lRyj5Q+Ojp8CbSTLb9a2v2Z7ilOm1r4Kpqp5BkGAFHTd2+mSG4BwsCgT7r4uzofibt6Qe4CYwuYjklaQKc3DDhIb3BZ+xlklhd6dd/1LHbrd7s7pWIaDMIGBV674PCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gfc7y/gU41JJZuKbRGXw1ynjyCoCNKxV/iXWctdJgSo=;
 b=BuG+YpMGbq2+AW0zbQyDQSvQMmqJT/49FbAniPM69xUniivr56bN6kupKNhOFGdArlZADa3GAKDgLg0MehxxozWOvwaFMKSodC7ugW6FO+HkMtcSwhTmNrmkcwYid3j4r04GCgYaZQs4tHDWQc4Pr/Ydqo2ebVW1pG+C/MjyKSE=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MWHPR11MB1389.namprd11.prod.outlook.com (2603:10b6:300:26::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 11:58:57 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 11:58:57 +0000
From: <Conor.Dooley@microchip.com>
To: <ajones@ventanamicro.com>, <zouyipeng@huawei.com>
CC: <linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <liaochang1@huawei.com>,
	<chris.zjh@huawei.com>
Subject: Re: [PATCH v2] riscv: lib: optimize memcmp with ld insn
Thread-Topic: [PATCH v2] riscv: lib: optimize memcmp with ld insn
Thread-Index: AQHYvrvQ8Afd/QlC60ei/iYx+xAEma3QvaMAgAACkYA=
Date: Mon, 5 Sep 2022 11:58:57 +0000
Message-ID: <ffaa7ed6-18e9-2344-4bb4-bbaaa42fe3bd@microchip.com>
References: <20220902110039.226016-1-zouyipeng@huawei.com>
 <20220905114928.4h5fjnydk2jvsxmu@kamzik>
In-Reply-To: <20220905114928.4h5fjnydk2jvsxmu@kamzik>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df7cf63c-543c-4bf3-b22a-08da8f36032f
x-ms-traffictypediagnostic: MWHPR11MB1389:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xQfv9mVPuYHXLgrVVVaTnZAXFTLEcUaD2ExrOSeMzkjDokHzQKTInjPchi3gBgt5ZecaJ+oZ5Y5hTB8p5myQFU93c96FAv4wtj47fkLBy84G5EXu1Mefhc7Ny7drAvBpwa+yjkSiPmj193oa0YAUQp2aAD38U6sI3/h0HmTkFNy8nB1XNyq2cVPtjYHBx9a0bMr855C5BC6VBKvlr5Cl7PhX/wd4R7EqMtJ2ZqVZRSCoaJa0tAQZ9DU4UCBNWrnUPM0U+TnAMbXdHW9GsSzmr5B0LBOaupvK46lhlldxnGCD5tkTwP90AUCbXHy2qMROO5ENt9GVkfu7bZxA39oU81wxQeNXvKzR1T/CnOShZl40wKynZsilqoc+d5acIia3M8cDq0V7YzNBI27bHrILMhmyxl9MRKC4WHVD5J6Pyloeiy3+mU4NBfR9EXKbMEdTAzWnMt+CsnJufIAG7UH+jkuwfHiWNy0vtdWrjSRTJLtwZzfbBtM9ScFebID55iekASLQbHL/5wC5Gcn7X1h9DmKuY/XopkiUySTE1jV4tutp37A+fzaCQ4XvHG4AwR2eZpPj5veA3xPT4lDidn2dEu4yHJfM9SJtgIHj/UjbyBdZio4jbD8kWz4YQ2FusngUI4yYp56j2yPsE+XYIwIhQ4gKoeBQavRcaR7V+5eYpmZccfR+n25dSm99XV7ia6pDyHth0HAn3vkP4ae3xm7BwLEJEyQw5ubOYzq2nbPntyq21vYsLSjYa15jte2iPyBi7Ee46eMIbT/BngsZ5KTfOwA+6lxvy0fl1FvyT4xTaJJtxl7qtxviIZMK2EDBN2yP8nx8avstwScQaJUaQPxKZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(39860400002)(136003)(366004)(396003)(346002)(53546011)(2616005)(6512007)(26005)(4744005)(71200400001)(8936002)(6506007)(186003)(5660300002)(38070700005)(36756003)(31686004)(86362001)(478600001)(41300700001)(6486002)(31696002)(2906002)(316002)(110136005)(54906003)(38100700002)(122000001)(66556008)(8676002)(66446008)(66946007)(76116006)(64756008)(66476007)(91956017)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEt1ZnVPN0lxb0VaQVhva1V6UlZVOXlOY0p6WGY4dGdPblRrR0phc3NKUDdM?=
 =?utf-8?B?SllwblBQNmhSYVdkVmFuKzh5RkowWWhGNkcxbTBYcTMwbVZmaDdOL2dtbDhh?=
 =?utf-8?B?cmFDS25DMzE4ZDY1em5NNDN1ZnZyTm1tM1hpYXdiTDQyRTJvYlRZRlhmMk5z?=
 =?utf-8?B?MEprazM4Y2ZFczlQeFRha2FYcnU5UHdSR2xZb1NBYmd5MkFuTVY5Y200allZ?=
 =?utf-8?B?SEJkVVhkQUh1UklrL2pSOUVnd3lkZFk5T3piMEtTMjJSTlBRMUY2YlBnYzBj?=
 =?utf-8?B?dFhIUk9wTE1iZzAyYmpMUHUyTUhvTjVNTTI2ZXpTamU2Syt3ZGFiSld1S1My?=
 =?utf-8?B?anhGWjRQYzJiaW5nY1d1ajJFcC9GOUhXa2tvVU9DMUJxUXp4TkdoNDRqUVNu?=
 =?utf-8?B?RFVBb3dLc0d2c2VOaTBveFFxMVU0MFczSmtBWUR1b0piUzFVelNEcUQzMlRS?=
 =?utf-8?B?T2lod0RPS2tzRVNDZXlFM3cvdGVnSG5pOHQ1OXVqYlA5VHhNOWxjc0RKOWtI?=
 =?utf-8?B?WmY0ZnVSaVlPUWVScGRZMFlhSGRubjNYU09MVVJNQ1RoUnpYTFlyR1FWUlZX?=
 =?utf-8?B?TlluVDVGVkczOVg3RmZ6SjAxajR3c0xOZ1B3SWNVVG5DYmR2dDhQeS9UQkEr?=
 =?utf-8?B?M3d0dHhROVZ5M0ZrRG5yU2ZkbW02elYyOWRYRDR4L3ZBRU40TzgyeUt1Mlgy?=
 =?utf-8?B?bFgxTC9Vcmk4bXlOSTlSQ0VoK20zSVgrMm9Bcm5SeEgrU1gvVzdRNUNzSHVQ?=
 =?utf-8?B?Tzd3WDJ0K1l6a1BYcU1wVTZYQ1FiMCs5dFFOTzU3VW5vZjlZV3RIRG1sTUtr?=
 =?utf-8?B?RGx5Zy9ZY0tuTXRSZlpUMVN2VEQzRWNNVVpRdU15SUxYLzNvYkl0YmFnc0FV?=
 =?utf-8?B?U1dpS0RVNGtjSmJKcDllRmZYWUM3NGQ3dlhzRzlzNnV0ZUFvRFR4RVNLdGhO?=
 =?utf-8?B?Wm9TY09NUGJZWGpFaFFLUUhaZE1WMWt1UkRHVTA3cmRpdEg2SUs1Znduc0NW?=
 =?utf-8?B?R1hiSFVWd2hCUGlBQXZsd2Fjb1hCRzh3RzJTekxrV2J6T3N1RU5wLzJIRGUz?=
 =?utf-8?B?Q0xTUlNhbVlnTVNnbHhFK0ttYncvTTF6VlJVVG53TkRHUy9tY1dERjFVMFM5?=
 =?utf-8?B?UEFNM2xMa0xoUWZQSllkbVAyOUd3RGFlOW9McUNRVXZIQmpZZ0QzSkMvbWoy?=
 =?utf-8?B?anZjZ0Y5clRwd3A4cnk1enovZWRVeE52NjJDL2oxM2puTmE0NHFZa3RPaW1N?=
 =?utf-8?B?aGN5eEpyR3kvM1JZWXVUT3BpNTJQMEdVN1YzbHJQenI2bGZsSzhKZjUvbDBQ?=
 =?utf-8?B?QW9WSlFvenQ3b1pFZmRQMTlRS1BUV3J6aE5GNWlXT0ZwZEVBOEwyUDdpVmdU?=
 =?utf-8?B?SjhkK3FWakJ6Y091L3FhV1RzRUZ6aGtDazk0dnI2SmhDMGowbFUweENldXM1?=
 =?utf-8?B?ekxBZnRyOVFhZjVXdnJ5RVhzaFBudThNR3ZMSEZ6aHBKeTJNRE9hS0JCeFN3?=
 =?utf-8?B?eFhtZmROVzB2bXpBRlRzQis1cks0VmRIMXVvUHNaaW5JbHgxcXJxcTYyZFZG?=
 =?utf-8?B?VXh5YjFIbW5vVHdmV3g1WUlLOWFoVWZtU2JnL2lmUjFyU29tMXQ1Q2s0Nnky?=
 =?utf-8?B?TWZhMHhaWHNucVJDUEQ5VENCZmF4SjFraThya2YrYjJmU2lSajdadUszNlhu?=
 =?utf-8?B?SmwvdnRhcDdrREtkNlFyalk2RUVza052V0RIK1lCeDFHTUhzK3JtQ2t0RjYz?=
 =?utf-8?B?RGthVzlCQnZ1bjB1NmhCK1lCMmFnaEhDa1Y1Z2lNOTdxUEloTVpqY1J4RDhm?=
 =?utf-8?B?T1QrdDh2alU2ZkVTbytPc1U3SHJBQ1B3TlVSRkV4YWFtMENFbzd1dGM3RCtF?=
 =?utf-8?B?dDVZSEswYndHZmNnZVl0MUROUkZMTDBkemtFRkplSFJ6aFNta3VUQjRPNUdy?=
 =?utf-8?B?RnVHOCtxTFA0ZWZGYnNJRWFNTHROWlQ4M1A4aFgwVkl3aDZwalllUmVlcU5t?=
 =?utf-8?B?cDNGRTBxZjV5a0huWlFPNU1OcmlMUUJGRE9zTytPZlcrd0s0UGlRQlcvWGtP?=
 =?utf-8?B?NFluTEttK0RDbmFrUTJrZk50U1VlUDVUVFJ0bWpkWW1mLzBsV20zWnVJc3dH?=
 =?utf-8?Q?EKyibNzcw8yXWbION2kU4EzwX?=
Content-ID: <DD71E2EE5B6CDF49A05542AA25BC28AC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7cf63c-543c-4bf3-b22a-08da8f36032f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 11:58:57.0341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nWFEwDcojta4ZI2uYLBma9iFtPkakrWR3ogDCqzCyViGeSDHtGP3M9uPyaTLkDvijEMxmia2SrjfmoA+C1Fw/v/KArum1eLQFpyI+oMekKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1389
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_045911_422779_CC24F77F 
X-CRM114-Status: UNSURE (   8.37  )
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

On 05/09/2022 12:49, Andrew Jones wrote:
> 
> I'd prefer an assembly format were the operands are lined up
> 
>    op    r1, r2
>    op    r1, r2
> 
> Unfortunately I don't see much consistency in how to do this among other
> riscv .S files, though, so I'm not sure what to recommend if anything.

Gotta start somewhere for consistency & we can drift to something that
is actually consistent over time /shrug

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
