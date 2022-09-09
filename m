Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECF1ECAAD3
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Sep 2022 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHutrGc7AXqxOZ1rvUAt8ZUJnLzaGuLDDb4MLq8kLoY=; b=rxLLotnAJRbQKX
	joAxem1oJQusTc4YrsguTRFMMTJm5niVZcRGoZm1JszOpZZrip6TWLfYRJHqD2X6SKY2o68T0sz5l
	8IqG/F7X0lyGVL3Nl9uJFn5e5okbPw53odCQ+CBrpSgIaufrbXqOD3n1K8ipdFo4wcH3JLk2MA+/U
	H7aeQQuLVvTOsqBlVbw4ODdV82f0tQD1rrnMwuvjZPmn46clnsq3tTai4L4A32w5O5mgD+A8K+0ky
	lfnjmIszK59Z+69kOHZM7LB7Tb+oOHBZ3auUue//M05t0VYg+S/ZRILiPb1KobfHTsUh5NjNB1oiq
	RYl/hoVGCg2/ZDO65x8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYHs-00DoTz-9u; Fri, 09 Sep 2022 07:18:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYHn-00DoIO-1b
	for linux-riscv@lists.infradead.org; Fri, 09 Sep 2022 07:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662707927; x=1694243927;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=diDQP24IiNFtKn+DEEzh+hhfY/omImMcRIrHc2XD5zw=;
  b=CBZkJXxY6W3JtquWg9iLgXemJDCV/wgj/E4uRSK1NCtwJhdfMe9X9ugt
   kFGwpUPziQ/F2nuzEnmCF+18wtg6naaA/eCLEZqXvkMZwx11lQQC3RnXN
   c9/T2CHiAhHbnayyeHynqqYnHHxsXGIoniL4Jz38xu+TU35/msOEmXUsY
   fwQbEogRKtb/3neloGsZAGTQT0MQEQG19RBf72c0djedH7u2ALyqJbhtY
   SSl4ALpzpJ5wAskkI+jDOmA4/3FH08aqT5EZYdtPw95hEO18sdu1BqJiw
   3QrOFTv2XcS4keYRI2qpODiOICdAZjzIBUONRGLhLaJ/FzpLZjlFdmgkP
   A==;
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="190111382"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Sep 2022 00:18:45 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 9 Sep 2022 00:18:43 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Fri, 9 Sep 2022 00:18:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0yTgtC+h3sfsR6CEOx4/rDGyepj3qjrCphsIJhjz18ndx/tyLdxin8YXdzuPnKS0ZXlUTuAYYGFCj8Q5OQciY4hajcb+UD8W1zPRnmR1xIFgHCz6o5yi3nMn8sZg0Cz341Y2isy55oVLboRrXl+5Fyi7XvSszm4hbPlT1qxEljQjBknmVmkmUxN61DfR/8EMBNu/J0yjcWrXgBkWwgueWizKW2PpBmZ82a2uUEnNPUCH52w4JWi27EbVFIRQU1pd6OanjWqMdAkaQ5soKbB8KLvczn+TL2UIB8cGFW5Xc5zb9hu4JCoVhAJd9IQVF2gGKvQ2Vpu699wXt/jSpC/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diDQP24IiNFtKn+DEEzh+hhfY/omImMcRIrHc2XD5zw=;
 b=Q2Ms4s5+96h++Cva3CttB4Zgd9zrmxcde63JOn9FfiZWqMcJLUTMdYnskwEopdRImnce2yYmV574HYllhZoU9efIza58lI3qrAPLTYAC4IundzWdEtQyXWJAENkjDDVvMN0gE9vigpw1NUhFvZ9zwLdwiRaQlxCZhHb9BQc80KmdRJ2FSqyHW42Q6DqX1D+t3iUomoy9bKHWQUAqzGL28PSAHH6cd3wnFWQqgHQOL+u0CFEOGiZaWg9YSRkBk8oUmqDhHQaO7T7RradK2FVWYnD1WTM74FBlglZTUn3aJKvnWom7+OrnS2C4I2WYOD9pvYhSE2b6dsGC/WH3TaAHyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diDQP24IiNFtKn+DEEzh+hhfY/omImMcRIrHc2XD5zw=;
 b=D5Run0UbEdCtXSudKr1BONKWtfrDjNbjzcTP6uLiFPmQGSvlsU/L6wI2wSB2xsbxhjbzwkM6qUSXuVnWpoH2KeQS8Xvkiv9UkVn0ipqfGS2LgF3NystTuOVNre7gYR9PqEm5+qs3N+b+FZ+atnVYAHRQGNBaHc+6VeOTb07p57w=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by MN2PR11MB4661.namprd11.prod.outlook.com (2603:10b6:208:26b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Fri, 9 Sep
 2022 07:18:41 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::545a:72f5:1940:e009%3]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 07:18:40 +0000
From: <Conor.Dooley@microchip.com>
To: <samuel@sholland.org>
Subject: Re: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Topic: [PATCH 07/12] riscv: dts: allwinner: Add Allwinner D1 Nezha
 devicetree
Thread-Index: AQHYsGUr+3EH8+Kn3EeAQmOckfNsnK220EMAgB/avgCAACzkAA==
Date: Fri, 9 Sep 2022 07:18:40 +0000
Message-ID: <52217b50-c22f-5a21-e509-05d178e4a173@microchip.com>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-8-samuel@sholland.org>
 <adc4a8e2-7347-7616-99b9-59762023b2ff@microchip.com>
 <8a2194bf-93bd-de4d-8d39-0cd72aabb0a9@sholland.org>
In-Reply-To: <8a2194bf-93bd-de4d-8d39-0cd72aabb0a9@sholland.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB5154:EE_|MN2PR11MB4661:EE_
x-ms-office365-filtering-correlation-id: 1f4b58f0-c0c3-4d3f-687a-08da92338592
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o8wzWTVyRuJG6kD5D9/cJszZYi6cp7NJhN8DAsVATeiqCJOZ188hjx8yzjMErHUBAl+ofnAxbiD6AV+i2UgwkueuAiUqpxg3V8rQRUGOenDE/d2oJfic+KdXzUMc4b5/1gspS0jGPyPQUcXYdm6XPaJpaCpZ/gzHe/HtnX1HW+WzeSU8y6H1wAJe8gMCzvi+n1uNwJUoudwRMFjOV3E4d6SvLhi1WPpcx/G9f4kgzzIRz+fEMTWq3rKmnTZCwNuZmV4nyR2toZ0u7OkeN5xIA3Yu9+u/M0sbVYz3fataKq9brqgANLoyEbrsnyow8RcEYdWTF2uefdX4qLWMxFE+bMBx9fpDn+cSYalSbxnaewuWk3zYSl1fEfeLplDbRfYbGUUy/aNwQx42BGpsxQqMyW3wxwNLveYRtSkwyuZwf/ZXO47DoZLLYvA59SSNQuSnCXS2ijwrqoG0BbalVBAlUfv3v3TotS3kg7lP1/rvn7ddYvrsc8rsfYk4UnzVPdaeGQSX8Iwcd3sfxJiOSXBeTwQhQ+Q9rSr5TP9LS6T9n6BRb2RFIVfLoJiEGMxSewMpweolUFY1pQK4FKDbMx6UpowsaQWgkTVfdHuJSdE15pdeXok102OxD4HoU1x5gLWEctudceazlB/YBp5ffN8x1GaMgNHPbLavJYZ53TCpuFjX/pzD/NvehQRFu1CS3ZuzMUw8aO6BKiPy3Qb4JMUcCUrcPHMAdSj4OIYYHeaJG2BBoIDWYQgoCXxHxtYmVeqCbVw6PMDwtp9PqNW3Tn91sy/6P9GupB/nI/I+D80xaJVhyd49cq7GBVfZFkDg96rs/rlQ2jVBFTumizTfev/oGdsM8NGQ7Pvv1cmgd7FwOF8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(346002)(39860400002)(396003)(366004)(136003)(71200400001)(6486002)(316002)(6916009)(54906003)(31696002)(86362001)(186003)(122000001)(83380400001)(966005)(478600001)(2616005)(66556008)(41300700001)(53546011)(38100700002)(26005)(38070700005)(6506007)(2906002)(7416002)(8936002)(5660300002)(31686004)(6512007)(76116006)(36756003)(91956017)(4326008)(64756008)(8676002)(66946007)(66476007)(66446008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmpnYVIxZjJ4MzZQQ3RNNTRsREpYa1gwTURldHJ2c2NDWGF4WUp5MkZRb2Fj?=
 =?utf-8?B?dnNXWVZUL3ViRkRkQStOZmtaNDFBNGh5QkNtRWZVNjBKWkxlQnZYNUFYTnAr?=
 =?utf-8?B?TjlSUXFMMWRPb3U5NmROR3YybWZLek9hMXJBZlA3MVVUQU4xQkdTUlpSdHJL?=
 =?utf-8?B?NkhFdGVvczZOWEN0eFg0cy9YZFlSQXFPdzVoVy9nU2ljVWlzWUZtcEZQS2JG?=
 =?utf-8?B?dW4yeE01UDVkbTRDTHhwbEdhZEo3NkpmRDduL1ptclFaTzlTRVo1SE9EaUNt?=
 =?utf-8?B?SWpjeHh6OXJSK0hEaU5NU2dUMUhEdTN1Q0pNSzBPclRQZWhHenMrR253bDZm?=
 =?utf-8?B?T2pWTFZtOUg5dWZlQ1hLL0xCNXluT3JHU3FDWW5Hb0hPakV3SXZaZllVR0I1?=
 =?utf-8?B?dGhxQnN2VGpOSkUyNGlkMWtSSlZFUEpmVVRTZUhJN2ZtS1NsM2FkZGo3NERt?=
 =?utf-8?B?aDlXWmo5VUtTa0V3Vm9RVVhPeFR4RUFGUDZqWmY0R1M0Wm1waEZUYW5UQlpo?=
 =?utf-8?B?a1FHV0NWTlk2ejJ1N2huUzNZSDB1YmFXSE1kYlNveWdNZ2tJMXI3SXZuczFk?=
 =?utf-8?B?cWlNa2JUVm5ldFA3R3JHR0UrbHNCZ2tFNENJZndxRkRoeTA0Wmd0YWxUaFd5?=
 =?utf-8?B?ZHhnRjNQS0dFd0dwTWp2UXFFUVV1eXFqdi9raU1TY2swV3k0K3Rrblh4TWNz?=
 =?utf-8?B?RWFURzkxbm1URGVNc3drekNVQ3RrL2ovMTA4dEc1b1hRRUJ5NVVUN2EwVFlK?=
 =?utf-8?B?bUJZVTZsZmVNWTQybVhUNnp5akFaKzBlWjBDK1FIYlFNOUIrRCtiNmswa2tJ?=
 =?utf-8?B?RnNWVWNidC9SR3VqSUxUbXhPcmtpOWNMVGNNRGNXSEFHODZoQjR5MEhxbENW?=
 =?utf-8?B?Ry9JUmtzY29IYXFKSWdaR2srMnQyV3FUZWdmUGlJbmJlUEZvZCtSbzZQeUFL?=
 =?utf-8?B?NDc5eU13cnpDREdrRnhhUVl6MXJXWmVPcCtrTGZ5bGJlMStRZFVydVNlYk9m?=
 =?utf-8?B?VFluUnRiUVdQYlFzZXBSQmQ4eXJNNEROMnpaQlNodCtWV2p6N25ZUkxxbEtV?=
 =?utf-8?B?TzBsVUh1VmFjSUNMdU9rWlQ2Wm9IemdEYTFRQThTa3RyRWtTQ0JqdTVlTkZF?=
 =?utf-8?B?aG44Y25MT1NRYVE2Ky9LM0NWNVliR29QcEErREhKQWl6UUNyTngyQjNXcVNL?=
 =?utf-8?B?SjZlL2lIVkZIblV3bHo4VHBJODNCRzlDd0RyYlhzbkNXeEhGTHRtS0pJZko4?=
 =?utf-8?B?dDB4NTFvb0o1ZGJPOHdsaTRFb3ROdldXQzdOZlVEblI3NHJjQksxc2EwRWpp?=
 =?utf-8?B?WGN0cmExV1R3cEZIUS9nUkpxbWZsVDgvOUxXdXZJRUlZN09TWFVEckphWXR3?=
 =?utf-8?B?VHdSWjlqdWFMRzA1bThWait2ZlRsTnZZV2RoV3RPa3NhVmkwQ2YvMXJMaWdz?=
 =?utf-8?B?MGlRS2VnZzN3RWNUZlRnK1E0cFg5TUdCZ29oWUwvKzhOS1Zzem41WFFqNW1y?=
 =?utf-8?B?NlluRUl5aGpDWjBWay9SNGZOSllCMHpBMVFaOEJOUVlJOXBqN05wSFJkT1Zu?=
 =?utf-8?B?OFViNXpQSXpSdFVtcFVybkRhc29CWmFMK0dGdHU4T3ZMMmtpeExiR1lwVjVw?=
 =?utf-8?B?U0ZoS3VhQ1NEOHJWY2tkb3B0aFZ3dlZGR1poTFRmTWNJVkkweFZmRnVTVXlq?=
 =?utf-8?B?UGozODZJQVUwVkhaRW9hQWJYMzF5bFRGUHhyWkNaSGlPRTlLTURqc29jaW8v?=
 =?utf-8?B?WjYzNzJ6STArRXlKWm5FWVZUNjBmcDlGOHkrUzJ5OUZDUFBwY2VFVGJ4ejVQ?=
 =?utf-8?B?dmFWSU4wL25aMUxXaVBZNlJGZWp2RFlENzRhWjQ0SitKZEo0Q0FibGl6cXB3?=
 =?utf-8?B?NkxvSElPZWpNaTIrWTFBcm5hV3hDakUwUFVxRUdUNnVjRmJhd1V1ZGRTR0lS?=
 =?utf-8?B?clZQY1EvMmJvZW9YVSs2TVl5cGdtbmMxdnJFQzlvSHFWeG85MWk2aWI3YVgr?=
 =?utf-8?B?K1FETnpsWmdldkRGakNxRE5KenFyM2UzL0F0dHlCSlJzckxYRThhOU1wdllB?=
 =?utf-8?B?UlNacTVVWmNEUVltSEEyYnhzWlNZdFJFVzY5ZFZWc2tCanhLSWE5aHpPV1hq?=
 =?utf-8?Q?6pX/qYOcitN02cOMkkQrrC3da?=
Content-ID: <99EA7BB1B9232C4F977909B171D7355A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4b58f0-c0c3-4d3f-687a-08da92338592
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 07:18:40.7049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Su60opjn0vpBfMEeZl8RnvEsNNN7YI21FmuEfKpOGtu8IhXcJjILhq8UKIX0zYtx5jOrgt/rX+4uMGK99UF7/71PyHGIiDriVTN5vIR8y0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4661
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_001847_367523_0FBFF88E 
X-CRM114-Status: GOOD (  36.14  )
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
Cc: devicetree@vger.kernel.org, peter@korsgaard.com, aou@eecs.berkeley.edu, heiko@sntech.de, linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, wens@csie.org, robh+dt@kernel.org, palmer@dabbelt.com, krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 09/09/2022 05:37, Samuel Holland wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you
> know the content is safe
> 
> Hi Conor,
> 
> On 8/19/22 5:10 PM, Conor.Dooley@microchip.com wrote:
>> Finally got around to giving this a go with the fix for loading 
>> modules which is mostly what was blocking me before..
>> 
>> On 15/08/2022 06:08, Samuel Holland wrote:
>>> "D1 Nezha" is Allwinner's first-party development board for the
>>> D1 SoC. It was shipped with 512M, 1G, or 2G of DDR3. It supports
>>> onboard audio,
>> 
>> I am really not keen on the way you have things, with the memory 
>> nodes removed from the device tree. I know your preferred flow for
>> booting these things might be to pass the dtb up from U-Boot, but I
>> think the devicetree in the kernel should be usable in a standalone
>> manner, even if that is the barest-minimum memory config.
> 
> That is simply not possible to guarantee. As an obvious example,
> consider the MangoPi MQ-Pro board with socketed DRAM:

Yeah, I knew in my heart-of-hearts that this probably was a non
runner.

> 
> https://twitter.com/mangopi_sbc/status/1516225559214583808
> 
> But focusing on the /memory node misses the bigger picture. The DTB
> is passed through _all_ of the firmware stages, and gets patched by
> every one of them:
> 
> - SPL/boot0 adds the /memory node with the detected DRAM size. If the
> in-tree DTS has a "minimum memory config" (which for a board with
> socketed DRAM means the smallest possible die), I guarantee people
> will use it and complain about missing DRAM.

True, but they are also complaining about missing DRAM as is ;)
No possibility of winning here unfortunately.

> - The SBI implementation reserves memory for itself and any possible
> secure partitions. Right now, booting happens to work without the
> reserved-memory node because the SBI implementation is loaded at the
> beginning of RAM, and Linux ignores RAM below the kernel load
> address.

Surely this sort of thing is a common problem though, it's not like
any of us are doing something unique here are we? At least if there
was a arch wide policy about the validity of the upstream DTS in the
face of the SBI etc inflicting changes there'd be something to point
to. I am just looking at this from a "everyone else has a usable dts
in the kernel, but the D1 boards wont have" point of view.

> However, memory-constrained devices (e.g. D1s) will need to get those
> 2 MiB back by loading the kernel at the start of DRAM and SBI at the
> end of DRAM. Then the reserved-memory node becomes quite important.
> 
> It also adds nodes for CPU idle states, since the available states
> and their latencies depend on the SBI implementation.
> 
> It also reserves devices used by it or by a secure partition. And it
> is responsible for extracting data (e.g. MAC addresses) from "secure"
> eFuses which the OS may not have access to.
> 
> - U-Boot adds other information, like boot arguments, the address of
> the initramfs and framebuffer, etc. These are less of a concern
> because of course U-Boot can patch these in to a DTB loaded from
> disk, but they are relevant if you want to load a DTB from a later
> bootloader like GRUB.
> 
> If you load a DTB from disk, you lose all of the changes made by the
> earlier firmware stages. On ARM, U-Boot tries to work around this by
> copying a few specific bits of information from the firmware DTB to
> the DTB loaded from disk. But this misses the point that the SBI
> implementation can modify *any* part of the DTB. (So in practice
> U-Boot on ARM already loses CPU idle states and reserved memory nodes
> that were added by the PSCI implementation.)

All of these things are valid, but they are reasons why your flow in
your bootloaders etc are the way they are more than a reason why the
upstream dts will not work for someone who is not interested in that
flow. At the end of the day, I only care so much about this as it is
not me that has to deal with any confusion from either approach. I'll
continue to modify my dts in U-Boot so I can test things without me
having to re-program the world. /shrug

> As an extreme example, consider paravirtualization, where only a
> small subset of DRAM and peripherals may be made available to any one
> OS partition.

Or AMP - though not likely that that is a problem for the D1..

> Fundamentally, I reserve the right to make arbitrary changes to the
> DTB in the SBI implementation, and thus I cannot condone using the
> DTBs generated from the Linux source tree for any purpose other than
> validation.

Fundamentally, I reserve the right to complain that the upstream dts
cannot be entirely validated as it does not work out-of-the-box ;)

Either way, I am only going to complain so much about something that
triggers my OCD about keeping things the same, you have a
Tested-by: Conor Dooley <conor.dooley@microchip.com>
already and once the other issues are cleaned up an R-b too. Not trying
make an issue out of this, just expressing my dislike for the
inconsistency between the D1 stuff and vendors - partly in the hopes
that the "higher powers" get involved. I can't imagine that this is
the last time something like this comes up.

Thanks,
Conor.





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
