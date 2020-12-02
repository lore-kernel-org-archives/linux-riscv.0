Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF02C64E7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 09:13:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC702086A
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 09:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AC702086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XqNkXl27v28hhCJeKVFmWcUX0M8m8gzKFn3ZRd9Bj54=; b=hntQSfKWOcBYN7kPOG79NUsaU
	lTjI3jgZOozZTJuNC9lbPQ/u5Y3lrBuePl2v/OYWRNMCE5Oe6iqay/UqMgpo7olVnRouuipgwEUs1
	MiWxiPtDRiKn017h3MwEmlG/g18TI98NEX6t9GfVOw/D85CWEWtWs3h8Hnrx38d9iRWCBFP7OFW/0
	tTZBFBEZJ1RbGVJxdg+VRYmGY8aTKBwQ1PUPsif2m/P76AEaRe8ZZx3+dHF/jxOVOjN4gP23up00H
	5jnSABoC/g8FC+dJ3Fp3sG2jvFtNzxhv04VmYdQnyUg2pdeirLd75tRw1+otalkcmW4VMkwAS3SyK
	4jxPtRDuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkOCg-0000ms-5h; Wed, 02 Dec 2020 09:13:38 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkOCc-0000lk-1r
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 09:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606900413; x=1638436413;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PBMwD8WzpGJEscxKLGOH3iGtopS9AuPdUGCGE/BgPxw=;
 b=n1qFfaBta94bTp4jqnT0olUp1bQrKs62YNI1hC7KwqTerVaejGZeIcOS
 WfhZIP6T2XNA04eg7k83SrPevGSsGTEwgLgwKe23fcWRfoT+E/THRasot
 XRF/jDFdGDp1kiBlzXY7AiPbPgIGrLqQ0lwmtMhnZR6BluLSz+BFG8fMg
 yz2FR5Fdp+t9kn8xqrImNbPoOdXtKi79zTZxP3jyt1zON7U8Kbo2L5wag
 a6dOlFEMOUkBhxMg1VEdYboAhmTVXg9drng0ij9Ugp62stTW519mNIjVa
 2IxyU3n2+2mRgEIFOtZir0Si5RYFgiIonHTtpcvxYiUa/oRHS/EPQKPUu Q==;
IronPort-SDR: 3k6sWBM4Dm6prQXh+Xvjqrwv7jGMz+/gxTPfbf8yhJY8+YVpNv+rioZ0kVmBsi4LiH7a79p9ac
 nvN/mse7Ywm6h+Z2dYO9h2D1yGzfjZvXeuoPir/ObcEtpw9FRXhzdByrivSU/UCH5Y5bRZSNia
 K1qJx7YLy5ZmIR0fEgXlpqDVma+wet5JJAgh+laoDzWs5VFKwag3YxLVE0GnnktwnoElXmQhP4
 NVvaNXfQVvtTr5SX3ufydhfMKwuVuNJiJc5nqsCpWpwktb2JAEwVO2bu8yWU36NANA5AFwvI4Z
 whk=
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; d="scan'208";a="101092937"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Dec 2020 02:13:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 2 Dec 2020 02:13:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 2 Dec 2020 02:13:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=euySvAvvcJw3YzRttg6Kgki+HaahPJpNGkm8tbVgwtdIvOpmAKN/ek8F/6WWR9463OrpmX7XyyJsNbtN0fWInk0nw21SbcikGyXA6WuMlf19UQ6cJRGh8Cl9o+ZF6qAM/qZw8XV+7cYmMjE/RRAAW0Nps95O+dp97l3eXYQRCAeWBioZcqDY66YKyopjwEev3SmUN+D3zR1HaWPzLIhiIZI3JVfT6r6NUlEzKuo7HHyk+RLVb1AVV2o/S6PnrY0uraQTi++hSe1Tly2eoWd/V0/dyyYe6Ecna70Ibc+jaF1ahxNtjo9eLRzkyx7VR7sGDP0hDw0JlDljPBBzsUtqWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBMwD8WzpGJEscxKLGOH3iGtopS9AuPdUGCGE/BgPxw=;
 b=dxyJz5EM+3GEQpReqr3WtvdEjfYF/gHznWOpxH1YGu69/Xx+nzNDQjI5dPibXb5wCVm9xI5s+opEutLBjxQRWlQ6Qfz+r0UudNJpD/w5Ge027QpjUmAyDiqWiBxOUZi9nGzNbNDmkO6fRvtKHoJir4PuinH8JQSBSQ5fswXNKPjgIYyqJjcoNlb46vWEX0gJMAyhTsY44CcJuPa/SG/k5sMKEBzBFalfAEixuRHa4Cnn0vFgh2kZHtqe4hmNOcITJ79N0+I0TYTmNPE0Tp8QI2pFVTwfSZ+luAUXpp1khDnIETPfkkitevsNIBIngjv04SWgQXhrb/w68qffUU8NFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBMwD8WzpGJEscxKLGOH3iGtopS9AuPdUGCGE/BgPxw=;
 b=kusz3u0/lwzD1b2s4qto4xMvwdfuBUxsfSycnPTcAlSOJlTBxXC9T0qBSR8AeL1kNT1PRBznD7j+Z7DhN3g1mZRbnCK0WcVFQVl7dMBvcjhW1Bvr8ueqNli3aMoWoRvrrmlXATkP45wA4Ey6FvEcaB6dj1RSeaqgSLWw13pycow=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by MWHPR11MB1520.namprd11.prod.outlook.com (2603:10b6:301:b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 09:13:30 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a007:19e8:3f74:b14d]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::a007:19e8:3f74:b14d%5]) with mapi id 15.20.3589.037; Wed, 2 Dec 2020
 09:13:30 +0000
From: <Conor.Dooley@microchip.com>
To: <atishp@atishpatra.org>
Subject: Re: [PATCH v2 5/5] MAINTAINERS: add microchip polarfire soc support
Thread-Topic: [PATCH v2 5/5] MAINTAINERS: add microchip polarfire soc support
Thread-Index: AQHWx9GX08ZpWwt4JUCkSm0fYfafqqniieEAgAD9R4A=
Date: Wed, 2 Dec 2020 09:13:29 +0000
Message-ID: <1cb10c03-d5fd-c6bc-62fa-7eb854a31cba@microchip.com>
References: <20201201110316.28656-1-conor.dooley@microchip.com>
 <CAOnJCUL3qELbuDAAgyGB8jMP3x6WB1qhubd3UZNKqE5zs1B2wg@mail.gmail.com>
In-Reply-To: <CAOnJCUL3qELbuDAAgyGB8jMP3x6WB1qhubd3UZNKqE5zs1B2wg@mail.gmail.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: atishpatra.org; dkim=none (message not signed)
 header.d=none;atishpatra.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96c26ca4-42f1-4867-9fd2-08d896a288fe
x-ms-traffictypediagnostic: MWHPR11MB1520:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB15204A6AA0CFB731EBFF7BF598F30@MWHPR11MB1520.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9qloEvTQSTFJvktFI9g/ykR/xmGJQo5JfsYWj8lW7qejNl6oony8kUBKN3fdbytha5BfmhfIQqYJD0toCykJQX5nwsRqi10f5NJ7x1f3lQLjdBw4+2F9Ot4rZXBGmn3kdUijJx+j9BCJF2OsAnae09ZI98J98sV8eqbgd0pFjrwmmhjzgcSgLqwSWuWB6rATV2Wb0L3JnRkKAUJ2iN0lK3j5fHLQRn+SZpmq9Fhr1g5xfTpPff+WW4lZDXWVpWEl8y4ts86eN0vXmBKlu04SbydBKnoHp8RRJCPa/qOMnS7s3udcnqb4TVC5rnuYrt/rc49cIZV8REiWCWoEN/XpNchWHVTXxbixvq3a10H+MCr1MJHQAeuhc1ob2MkzyJBU1yLSPJmyq8eqHXN3fcthuSZmh6YZI8+tiuSq7ZDZ2KOYxwO6jx9C9RHHB+8IcIh7o9LxDf4AJPffH8LfxwDy3LJIcuTTKXTpMjeS+ddBQUG49r/5OK8zLIobok6cWsJ6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5154.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(376002)(346002)(396003)(136003)(7416002)(26005)(6506007)(53546011)(83380400001)(71200400001)(2906002)(8936002)(86362001)(91956017)(6512007)(76116006)(6486002)(5660300002)(31696002)(2616005)(8676002)(36756003)(478600001)(186003)(31686004)(66476007)(64756008)(66556008)(66446008)(54906003)(6916009)(316002)(4326008)(66946007)(966005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?OGxvRnBPbkthZ2d2WHdXVVIzd0dKZ09TZlFPZkRSaE5oc0JqcXV4OHRna1l5?=
 =?utf-8?B?VFozeCtvbmx4cVFZWlFmZ1FRakZLRDdVbHZzei9CeTQzL1ZQR0tNcHlXMTlW?=
 =?utf-8?B?Vnd5QnhzV0NtaWo0Ny9Rb25qa3FZeWRFcVpwbTBTN2NCbk1qWlhuVzdpMzdE?=
 =?utf-8?B?clJEc04rSkhuTUw0c0ZZbms2Z1hmY3ZjWlYvUE1yb3R3U1ZMNytWT29yTUtB?=
 =?utf-8?B?YmxUL2Noc2tpYnhXTUh2RVBPZDM0aCtXUHl0Mi9tejdBZnpiR2ZHeGltM0sx?=
 =?utf-8?B?RXB6djJYUGk4WUE3cHN0NkNLQzhwZUNDWU9BNG1BMFRwRlpBd0VUNmc4OW8y?=
 =?utf-8?B?dWxkUTJ0d3k1UytqaDdZUTVSWmV5VGlnTElGNlh3UDlIWGcrTktuKzFYeEg4?=
 =?utf-8?B?U2Uya0FUYlJNWlo3aytQSTVjSGU1THZsbmRTRWx1WFVYUVZxdXJVSG52b0NR?=
 =?utf-8?B?SXBRamhwNVoyN3BaTzhhZGtRMUlvQUdYakUwSkNlZWs5V1RmYWxwamlSYVFl?=
 =?utf-8?B?US9QYWlsSFlqY1JLb203Z0hzWXYvQ21hdlVaNjNsYXZZbjlTUWpQam1lK3p6?=
 =?utf-8?B?VmhQS3FPVFlXUC9LMW1JTkdXTUFqYjRXMk14WWZaa2JqQkE3U3RFd0NTRVlB?=
 =?utf-8?B?Sis5SlFaVU1UaUNwTlFZOEdaQ1VteVZEeW1nckYva1J6MUxBVnRDSml1bjFE?=
 =?utf-8?B?eGRHWFBvdW9jYWxxMGt3NU82N0tnbGxRTUV6aG5CcHpwSlIzNm9jcmRsNlFU?=
 =?utf-8?B?NG9IR1RJMVlRTXM5dkJRNENBcTFTVkkwMmR2TnBxdUNUaHNKQllkcGIrMkFk?=
 =?utf-8?B?M1Zva25DU1RLWlN2MFVqVDI2T0piMmdoWjErRUtEcjZ0MEV4bk16SzhrRE80?=
 =?utf-8?B?THNKdFhQUDZ0dFozOUdtMEkyWnZRMTZhM1BFd3RpVjFqVlFLOE5YZDN2K1Q3?=
 =?utf-8?B?ZEZXWkhSUml4WWptb0Izd1FaWVVza3RhMUxtOVRERnBUbHlxUGdLRHFlakRI?=
 =?utf-8?B?eXZMS0NhZzVjSDlQdkhnQXNaUGtZTjJ6cDBhYUNkWjRaUCtEM3pUenBsSk5J?=
 =?utf-8?B?cDNMRG9lK3ZoUFNJVDdnTEM2Nmx5MHd6cXZ2U2RKQ2puL3RreGMwV1p5MFpY?=
 =?utf-8?B?emlWVHk1dzJuSlpsSlNrTGtRTTVreHNGMTdBTkVjVG5yL0thOWQ3bEswV0tJ?=
 =?utf-8?B?Z2svZXpnSVpvU0FWamxmQnNFUHBMMUZrTXNVaUFRWUxzcmZ3NllUUzF5dzlG?=
 =?utf-8?B?b1p1R1l2bDlUQ3VtM2dYcGZteTBKQWg5eFpiVWZsWU95YkZyb1FXWVdNcElH?=
 =?utf-8?Q?tgJnyREzWAgV8=3D?=
Content-ID: <652A3F58F739C34190C6E75E478379B0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c26ca4-42f1-4867-9fd2-08d896a288fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 09:13:29.9345 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2vEPD8o0VqKMg1zInOg8pFfmzQH1TsafB+SIVZXcb/aTNPjmewdfGyA94293OQh9jGcUpzOv+3DQWpXCh0+0+WehDNPTRucWh+X9rcYChno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1520
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_041334_349492_7E08C109 
X-CRM114-Status: GOOD (  18.52  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, damien.lemoal@wdc.com, aou@eecs.berkeley.edu,
 Cyril.Jean@microchip.com, david.abdurachmanov@gmail.com,
 Daire.McNamara@microchip.com, jassisinghbrar@gmail.com, atish.patra@wdc.com,
 anup.patel@wdc.com, robh+dt@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, Lewis.Hanly@microchip.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 01/12/2020 18:06, Atish Patra wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>
> On Tue, Dec 1, 2020 at 3:03 AM <conor.dooley@microchip.com> wrote:
>> From: Conor Dooley <conor.dooley@microchip.com>
>>
>> Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
>> directory
>>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> I think this patch will make more sense in my basic SoC support patch.
> Can I include this patch in my series as is?

Eh sure, I don't mind.

Should it be split and I add the mailbox entry in my series & you do the rest?

>
>> ---
>>  MAINTAINERS | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2daa6ee673f7..2241bdac4816 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14989,6 +14989,15 @@ F:     arch/riscv/
>>  N:     riscv
>>  K:     riscv
>>
>> +RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
>> +M:     Lewis Hanly <lewis.hanly@microchip.com>
>> +M:     Cyril Jean <cyril.jean@microchip.com>
>> +L:     linux-riscv@lists.infradead.org
>> +S:     Supported
>> +F:     drivers/mailbox/mailbox-mpfs.c
>> +F:     drivers/soc/microchip/
>> +F:     include/soc/microchip/mpfs.h
>> +
>>  RNBD BLOCK DRIVERS
>>  M:     Danil Kipnis <danil.kipnis@cloud.ionos.com>
>>  M:     Jack Wang <jinpu.wang@cloud.ionos.com>
>> --
>> 2.17.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
>
> --
> Regards,
> Atish
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
