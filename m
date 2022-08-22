Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD52C28D13
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Aug 2022 20:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DDPQ7XUYXX5DyMe9o/IhpimQrteGJsGwtqWUDYPNdzY=; b=owezzBjZXziFDa
	yDot0I1647ZJckMrz5c2kyKHHgRq3NQFv0Kwo+rhwz+SNaKYz145GTjg8Kz4WFN5f3fTsPAZTNP5l
	fAo74373GPZQ65Fu9nnLwtpmtDgfpCLOrwz2PcXUpfDmOA53wGEsnoAGYh3GIJ/L0aubh5XBtAXW7
	MANoXIuuRsvUTSB+IocR4jlpk00htM4jw3SToFb0PkCkQ2LhXoQguI6V08SXamy9qpMer2JliHhQ6
	H12GmHgr3b1N7nPMon8pn5G94BZow8c/3b1DTSobUPps9Hi456zE/Qgl+hvediiY0gCi1kV2Rva1G
	knlSeT+fEQyQ3XKjFtUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQET8-00En31-FI; Mon, 22 Aug 2022 20:56:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQET6-00En1L-6Y
	for linux-riscv@lists.infradead.org; Mon, 22 Aug 2022 20:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661201779; x=1692737779;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9QzUY8zCU8ByW3Vt2TaaKzigUAPHkFxEdcmJQc7VhZI=;
  b=PzMpUnbjyfoGAwF1xGArVDrZeolj0xzYcTO7TmGRh2QpNIolSQomc3Qd
   R7KS6F+9EBCViDch7HhfSeBSdRdYFZOjRLkGHCx2mMSdncbc5FLZO5l71
   OiYx3HX9Anomrk9Hg1hbadbt728wxRKXixfV5c4VYoVFpbXzNQ4KXD7/A
   udEGlP/3yTHu6GePrKEvbZ1gHMlRgWSd+3Vor+pQJBjttYmFT2ronFipk
   eytPaDvKeD06IX3drXIW9ieBYHfhFkHJQI+Bf/QfGT1OMdXbSgkdV4Lm2
   mC3R22e6cMdIM+2d/6xwv3GqqZS/OqExXFTr/H+bdAfxUu55oDpp5S2gW
   w==;
X-IronPort-AV: E=Sophos;i="5.93,255,1654585200"; 
   d="scan'208";a="173601475"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Aug 2022 13:56:18 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 22 Aug 2022 13:56:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Mon, 22 Aug 2022 13:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aH2DMlDpxaaY87CGaBHpXs/Cqd5vSb/3GrlTXKZX9BG6D7CP0vThhYPMf3UClDbY0+m/tOLtKd7B9FvZJjTB0WjkVokIXU45I2xxz4tJj9o2dDQOtgy0FQpWuumM3SIT/3gy7jM13X88F8TJfHCRYjNpdTQ8dpX1I0KqHtExF8zCMR+KMEASBeb7bBc/RN+3vHKgnsqoHhopQ1SGzhc79xn/Kuc8iFHj8cgoRIPK/HSK+5fS/vieVY3lDsgJyIDQIVi9LwulrDeGD/pkHc/C9WfFTKqe5GMY4fN5HH4/Z/l5eA7sMfJSBfTpIMuYSqi2tXbPfSQN72u9h0Ssmgdr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QzUY8zCU8ByW3Vt2TaaKzigUAPHkFxEdcmJQc7VhZI=;
 b=JO1XMpoCKtw/j0c9g+mJpH2hr0pya4EIgq6x8pTrcwGF3C70rnAVrh9tK7pFh6ezfILjwwf80aa2CXyWE9ED6pMF50lP4JZMuEb2RqyWWpU/ciasbeXGJdoIC/EyV3n7DM9GPH2X3wFSpXZ/Nqt0PSkLAQLXS6K5iF9xd0SiBFkiJLObgh+ueTQlWSILQoraqyDNEO0EBzJZj55OneVnlpSyXiKzOk4CqkBgo1yNbiLd6gdBJyAkfhLmroy1LAV8WvM26QX8TFi1g4tfFw4dP7UcrW4oo0ogZMEGFHZsg4XyKF/52FoJwMWdvCgN29SiKVILxAKzPtNy2juIJaJPlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9QzUY8zCU8ByW3Vt2TaaKzigUAPHkFxEdcmJQc7VhZI=;
 b=j1Av+Fs0tY26UTprwDOfOS3Crr/hV19nbw532CN2fgVwL3HR6L3WO4tYQzXSHWpkSTdMUsFRWqtpAnaNcgpEMRZ3eyd9ZWQyRDrcDbkckpUYUaJz158NdLhUgUosBjvVXtpXc7oxrx45NHRnNHFHPKET36Y9js5uMZyTlsjecTw=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 by BN6PR11MB3857.namprd11.prod.outlook.com (2603:10b6:405:79::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Mon, 22 Aug
 2022 20:56:12 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::ac89:75cd:26e0:51c3%9]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 20:56:11 +0000
From: <Conor.Dooley@microchip.com>
To: <panqinglin2020@iscas.ac.cn>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>
CC: <jeff@riscv.org>, <xuyinan@ict.ac.cn>
Subject: Re: [PATCH v4 1/4] mm: modify pte format for Svnapot
Thread-Topic: [PATCH v4 1/4] mm: modify pte format for Svnapot
Thread-Index: AQHYtjy/dezAEDXP00GY+f86YFwxca27Zr6A
Date: Mon, 22 Aug 2022 20:56:11 +0000
Message-ID: <d4b374b8-f80f-ba19-076b-3b26d7f990e4@microchip.com>
References: <20220822153413.4038052-1-panqinglin2020@iscas.ac.cn>
 <20220822153413.4038052-2-panqinglin2020@iscas.ac.cn>
In-Reply-To: <20220822153413.4038052-2-panqinglin2020@iscas.ac.cn>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d73ad4a-e9a8-4e77-9540-08da8480beda
x-ms-traffictypediagnostic: BN6PR11MB3857:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iBPSQARHaCYEf6u7yylB2Um4PZomTPbn87OUmPkoIWegOK+a1FQOJuM2ThZmN7AzlHgCge90DM0hUyLqdjiM6JN7Rrfpfsfn4dtvx2ZALmdarPuxQPUEMcd+4+LJKxrq3SFa4ySwrn7CAs1EMIunex2BzGQ4CxbA8otxGlPfAs9k6rpY+DfbhnpTsV9criIRPzH6VU63MGZ0Nwq8pLvY+2iaJFfXJfjz5EH6PKpuI+7PaY6PGTilpVnx7OhKc+oUQrmHaAVXesfy1x7yjYUmOGQhbIwWxX1GvETUPzU0rBoPsVsv0hfx8bzWBEJqpDHtYsNRqaeKQEtGlO1YzRLOXL3RCyUWOkR55CJC2iseNqx5kW76ZJnm4UtLVzrlGhLErgiQdYaASxKqV0MoZp16ox11+uY+PDLarytuyKGcatRXjjINcddJBeBzW7ga0EIrEL/mekOOWevQABGyF+M20gHLisSho9mKAF0LGitm2w3RIliHKs3TLSWXV0stuNDDTTdBqDMM1cbYjluPWnt9rfujLgJZOpfZlp8EMaBtEAt8P53icBPGduIG4kkdcfDReSK1y0uYmsgW091KGoHDisKDS0Q/4FqR7hJqM0OaerTR8gRFcK/e26Yoo5Di79QM3ZKTSNRxlpjTmDs1JsijcjnHPSAAIjHJr/QSg+ywhVX5X1ipZjNln8MALiRhGziZXgoKC+kfxq7RB2j608muRvx0BSINLYhlT1AauMkhqHBAU0HFLbbcOw1eh84ENH2ZrTMgwEREzi4QalLtEjCI0o+9t00+I52JojxwvaLIrlujFLPShklIhNwTBfq4PrqXYSGI5rJLepiodIvs0yp6cA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(396003)(366004)(136003)(346002)(39860400002)(53546011)(6512007)(38070700005)(6506007)(122000001)(54906003)(110136005)(36756003)(2906002)(38100700002)(31686004)(316002)(71200400001)(91956017)(41300700001)(8936002)(5660300002)(26005)(8676002)(4326008)(66556008)(2616005)(66946007)(66476007)(64756008)(478600001)(31696002)(6486002)(76116006)(66446008)(186003)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bU01eVVKWlUxaVJHNUZKNUxMek5XOFhFcTNVV1ZtU0JPeElaK2kxY05HZis5?=
 =?utf-8?B?NlJHUWNtWURpVHNhY2h4Q0g5Y1E1dDZncHVuSlM2cytHY0g5SjB1aEJVY1Fw?=
 =?utf-8?B?bUlITGdqMTMrd0R1YUtEdU9xd0JLMGtTU0tBczIvazRLejd2cmNQQWltaTZi?=
 =?utf-8?B?ZDdhMFUreHpMZ3ZHWjgwVnR5TGRRUVVYU0Z0UFREUzZTbndwckJoN0hqTDN0?=
 =?utf-8?B?VGJiV3k0ZGx2VjM5bTc4MVRUOTBDd2toOWVQNUE3R0VqTEhHVURBdWFhNlE3?=
 =?utf-8?B?MGtucmpyUG9RMUhhL0lrYndiSVpYKzkwWWIvQVlzRjd3SXVQRVFVU2h3eG44?=
 =?utf-8?B?SVVCcHVuZG5DQUhpRndRSFJrT1diNjNSWlZScmxrcFVvMDlPTW9YVzFmTEZ3?=
 =?utf-8?B?VXd2TytxTjZDc3JnVktyZHdFZjZ4aWZxdmI2TDVNVldrcTk5Q29odGQyZWdU?=
 =?utf-8?B?TGVROW5KaW1lV3RjOU8xa3pXTmx1c2dod1dZdjFMOUdhbXQ4QVVEcUxJUTY4?=
 =?utf-8?B?UEdDOFd0Z3JGSTVzN0pRdVRPSmRvOURSSkZtUkYyQmY4djllQXpHRmpaOG1K?=
 =?utf-8?B?REUvTmU1andHb1lpVWN0TFA5VXFmR3VxTjRha0xIVXpXTGp2WnZ6c1hFWGFI?=
 =?utf-8?B?YSttNEpHcmgvRkFhZjZGOTlWMUgxYWV4clhjWTJnckViOXRnSkVZa0plaUg2?=
 =?utf-8?B?ZTB5YUdXVDRacWZhVlE5L01hSm1kRDI1Y002N2Jaa3Nab3NqbXFLZTlEeUhy?=
 =?utf-8?B?U041cjRSOG52ZnEvclBCb1pxeGRqcUdvdlA5TFpha0J4aHVCcXkwUHM5Mk9X?=
 =?utf-8?B?WUJqbVZDbFAvTy8zL1hnbDRzM2hxd0xEOGpHcjV3M3dpMFNHNjhCZ3VOMzBK?=
 =?utf-8?B?QTh0L1pRWDJVRTR4V05tWEsxMTZSQmlNS2xlaHF5b0VROEZKZ09Tb2NrVFdv?=
 =?utf-8?B?RFU4QmFjVlI1L2lLQmIyOFA1VFk4L0htaVIzTnkzdzVORjZQYVRnSUdhblFi?=
 =?utf-8?B?YjlscC90c3hsUFB5cTlYOVdlRjdGemlGdGw2ajFlMjZ3cDhRbC95VEZuTkN3?=
 =?utf-8?B?QzBUbE83dXhkVithMmxYMGl5aXJnRkM4UHBPMGw1YTVoOTBXVS9XaEc4U1VM?=
 =?utf-8?B?VGx2SmdCUmdsWFFIaDczM0VTYU5JTEpxQ1d6ZHJyQTd5RXhuQWc0WW1Eb0RJ?=
 =?utf-8?B?SzJjMXVNNE15TXBTSEJlSVlrbHNzcVE1R2o1MC9yK01xdmVhTVowQzNzSGpK?=
 =?utf-8?B?Q2ttQnBKd091dWVBdHBrYlRTT1NjeGMwTXlTY1R2YlRLY3FNK0pYRmQrS2Nu?=
 =?utf-8?B?MTZBWmdBbFFkclNkeTVhNHVLRE9IUFNHSi85YnZXdXpONlZQMHY3cUhpSElu?=
 =?utf-8?B?SnQ3elJpUzd6L3NSRGE2NTA0cVY2Skl3cnhVR0UrRGYrSy91V25lTWEySjBK?=
 =?utf-8?B?Uk0rU2dURHdUZ2E5bG1pa0lvMElNNkFQODRUV2dCeHlpUThHaEpPNDdmMDdR?=
 =?utf-8?B?R1ZtUzB6OUppWGdHS3VXYkliVGc3aE5uZW05Z0lvVjlXUDF1VnBaUnp3dDVx?=
 =?utf-8?B?TGlULzlMM1hBWVl1VUFRanZFMy9xWmVUekpwUFBkS3hIRnhXSXcyVEdtWmNY?=
 =?utf-8?B?bFpNSVFrcGM1Sk5wbFp0cmhFa1VPekpjbWtzTHJUdzExbW5BellFd2VUWjkw?=
 =?utf-8?B?WktBYmk5MVZibEpHcVR4di8veEZuMVhQQWZtZmtndC8yWmxRamc2VzBTVEJw?=
 =?utf-8?B?b3A2NHRGbmJ1QVVVRzFKaCtJSzIwNC9WM3NFQWlwRDRVazhKY0NHaU55d3hK?=
 =?utf-8?B?c1RZTzZodmNQRkZHT3NGU2RGZDJQcnl1MmFIWUkveFk4SGM3RlExSm9GUDdK?=
 =?utf-8?B?TW1wak5BY2p0TDJOcnptOTUxbzgveCtrWjgyU09iN2dxREJ1cUUxcFp5T0w2?=
 =?utf-8?B?LzBSVWJPY2NxYlVORkdwNWsrS1RxZ21iV25rVk9XemdiQ2xydmhTRHQ3YVN5?=
 =?utf-8?B?UmEzemZrbm9CVm1hRFVDQnhwL09rNmc1bU82T2ZySFJ0SW1PYk1vZndKaXpG?=
 =?utf-8?B?L05KbjFUaXh1NFZORkNaVkJQTHlGSng0THlPK1AvSjVZNjVPYjVaQTJwd1hy?=
 =?utf-8?B?b3hnaDR2VTNscTdPWStEZUFlNS9nU09JUjJkQXJxVnU5VCsxT1VVc1NIK0t3?=
 =?utf-8?B?WXc9PQ==?=
Content-ID: <D6BBF2F18D308945AF447EADED6CA2C3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d73ad4a-e9a8-4e77-9540-08da8480beda
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2022 20:56:11.8553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9I+UIOAAXqq35kz6MaIe0/1bXdqZDE3Cpw/Zfp+tSJSf9282BtYPC7kAKggvLxIf+jH5flbtLH4jXHUJvVk+1TymHVpe3tF109zWyYzU5EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3857
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_135620_336173_F9F93410 
X-CRM114-Status: GOOD (  18.99  )
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

On 22/08/2022 16:34, panqinglin2020@iscas.ac.cn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> This commit adds two erratas to enable/disable svnapot support, patches code
> dynamicly when "svnapot" is in the "riscv,isa" field of fdt and SVNAPOT
> compile option is set. It will influence the behavior of has_svnapot
> function and pte_pfn function. All code dependent on svnapot should make
> sure that has_svnapot return true firstly.
> 
> Also, this commit modifies PTE definition for Svnapot, and creates some
> functions in pgtable.h to mark a PTE as napot and check if it is a Svnapot
> PTE. Until now, only 64KB napot size is supported in draft spec, so some
> macros has only 64KB version.
> 
> Signed-off-by: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..c43708ae7f38 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -432,6 +432,13 @@ config FPU
> 
>           If you don't know what to do here, say Y.
> 
> +config SVNAPOT

One more, CONFIG_RISCV_ISA_SVNAPOT to match the others?

> +       bool "Svnapot support"
> +       default n
> +       help
> +         Select if your CPU supports Svnapot and you want to enable it when
> +         kernel is booting.
> +
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
