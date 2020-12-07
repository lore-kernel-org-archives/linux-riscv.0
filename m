Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44545C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:26:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F4F23371
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 09:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F4F23371
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m/glspmK1YvFUKFelQdOm+iTRCWBzutrgyfYibOlOok=; b=nXEPhQg6Fv2YwZiUiV7X9vyRF
	ubTs1pjN5pDmj0cw83F5vzZ5LRZ1ZRPdeyqcgRtVTTxYyPX/Lhq/ouxjcgufLCMvS95PPKtbr9xRM
	OSTjVLdvSFi6Bg1ZMtg6jkj+NRwh2i5wJvGkPADcF1jntEqd3Jmyq2VatytgnAy5SNIjBx944ty+U
	n0fXZdvqHW229s+gGqBccFmMhlew/IS1rG8rvrm504q8uc7Q8jukJyIhntP+wFFhtuGpsAGd87Vji
	zeOo058w8Q1cAn3ffG4ruXybkI45c0hahCskLCV8iW1bdIDCm2R+8W714a/dMBGpUkaW3WB6dRbom
	S8SMN2LaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmCmd-0003qI-L0; Mon, 07 Dec 2020 09:26:15 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmCmV-0003os-SX
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 09:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1607333167; x=1638869167;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=v2B/qt/DiajJ6h/C0MyjOdrgB8eM6BWn2725R7VvsYo=;
 b=IwOr3OyXIDNoGInImB8LI/wRFEYKmHe+Zt6IIOsy++9CRsk0lPYk40RW
 Q87lbbZz7P0cppYnJb6TvGH/GvFFCgmac8w8FKlpqte3DnpFBLEdS9+1F
 paGHnGTPFamR8SWRd5iNPHLowsW7x93SXHCwT0SuvCqhopXhPkF+BtU05
 XoVIpUs6jddcKPT+RtvUJbrwWIf2UkCERKf3ZuvwSPAS9LaXJgFALgA47
 Vk4ThnZzh3D9Ea3X7hzvMvd9bX9sXXHKjzCWp1xBcOe8DdcJr03y8pGr7
 dtA02mqJlbRjYuKLNYIIG1btoGmMefeJ2VPmlYuy3PDrqpvGYRVpLHXV3 A==;
IronPort-SDR: jnm9oKkFDdy5ZduAkSB8ndCY74Lys3ZdUAehd8QIxMTyfRi8O4CVxcyAnQCh63CTcGrMiq8TND
 M+Mq+/+8n9cOsTGhjI2Mc+SugW9VdayTvcdDn/4e10o+2sHM1jn98TEMKJrKGzeG+CyLKd7N4o
 HtubM2lnOnkZiiuUy+lOwWutS4aqmml1l2xg1BmfQgbfNv1bi4ULb1blAuAfPOErDuM7q/6CYK
 bNsxb+4MJh6TI6106VUt45C4X9m/ZFhsc5mjOWgBZjukQLswsLp3zPYVqxGwTQMPsiVIa2F7Vd
 jD0=
X-IronPort-AV: E=Sophos;i="5.78,399,1599548400"; d="scan'208";a="36393121"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 07 Dec 2020 02:26:05 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Mon, 7 Dec 2020 02:26:05 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Mon, 7 Dec 2020 02:26:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7fUFIEMQMRx3AkTOxKlV8dMlNxbox1NPcQauec4sS0KxiJy8x/FIvRbUSgxl490QdPJuwp3k0kGx/Gmk1D2d4xHTxl/YG79hZmsEHC2NTUlh1CPVPL7py/FFcj9ZURLU46Tpm3xqIrJRndqvDPxlpRxKI/Os5dSii/cRM6f5DZ0iKNuCor1gq5DsF/pBKLeHtXjJZp3LBhAmRTDITfLHikkGW6jBhWwCOglq7L/UTcI0z7RHixEJqt/Zp1H2ee1iTK7QRkrTfpelMvvbbalRn3rFTk34v3Ix5kB05+TQp+aO+KR8KF7VxtoMLFSIMg5HhvwGETum6M7tjr29yxP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2B/qt/DiajJ6h/C0MyjOdrgB8eM6BWn2725R7VvsYo=;
 b=eiMHescd/kppz33O94sduDppAhq26iwS4odz3OTxQ+lR8tpd9nc2wVlXd/9HkyuAR/Bj3KxAfQHjfITah4T8ZNZJets93nlUphyES6I0I5pB2p+NQZ5guTZ0MugBzuarFEfup4/o6mLuALAWTBuOWiNSwKJbWry06rm8fV6onx4mDX6AZfcLjG+6I1we549lR9PHB/t3jDKj3YAOBp5kD/xIaNuqAJl0icVyJvJ/tHSeneEI3q9H3byItvtMnlI/7LqRm3OCBLTvPgVJ//d1HKvoX6RvPEnjUmN2h8fRj0oqR0LLbtsNsT4uEjtOV6a/1yYweuDlMEwO505iHG8YWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2B/qt/DiajJ6h/C0MyjOdrgB8eM6BWn2725R7VvsYo=;
 b=PCh+VYWd//5Ab7WXX/aoU4fssu0RRHofp17mhwaAPDcp9Mk1PMjcFww49m0z+jittn0+Y4bx2oogEV9gRwQ7tbYmOZB5dGwEYH8NuZdUvff3fzG7Nnnx0hN0wYn6kqWZevzHmjmI4sEttfn0BhxqQNk3RE/xns1TuJszaSgHdDI=
Received: from DM6PR11MB3420.namprd11.prod.outlook.com (2603:10b6:5:69::31) by
 DM6PR11MB3065.namprd11.prod.outlook.com (2603:10b6:5:72::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.19; Mon, 7 Dec 2020 09:26:02 +0000
Received: from DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::eded:bdb6:c6f1:eb3e]) by DM6PR11MB3420.namprd11.prod.outlook.com
 ([fe80::eded:bdb6:c6f1:eb3e%4]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 09:26:02 +0000
From: <Claudiu.Beznea@microchip.com>
To: <andrew@lunn.ch>
Subject: Re: [PATCH 3/7] net: macb: unprepare clocks in case of failure
Thread-Topic: [PATCH 3/7] net: macb: unprepare clocks in case of failure
Thread-Index: AQHWzHr5UjbMYFxWx0Kj6TG0yPX+aA==
Date: Mon, 7 Dec 2020 09:26:01 +0000
Message-ID: <7d9bb653-5ea6-e2d3-d130-83a9cf2974f5@microchip.com>
References: <1607085261-25255-1-git-send-email-claudiu.beznea@microchip.com>
 <1607085261-25255-4-git-send-email-claudiu.beznea@microchip.com>
 <20201205143001.GC2420376@lunn.ch>
In-Reply-To: <20201205143001.GC2420376@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: lunn.ch; dkim=none (message not signed)
 header.d=none;lunn.ch; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.124.22.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 11e40e99-e291-4534-69ed-08d89a921d4a
x-ms-traffictypediagnostic: DM6PR11MB3065:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB30651FFBF19BB75BCA1D7FE387CE0@DM6PR11MB3065.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6K2XHaqgLQ9OyGfJvsLnNVAo3lIufvzE83LDtYTxgMPM5toj99woXPq7h9LT9uUVCEnKYptbJH4WQwff2emM/0fMbpNkiM7x3idTptd2eAoyF2Ndua5WWrpI1H7Yar5wlLAQSEtss+h9Gl13sNdEm1n+Ef1wJ5DAZJsIR66UX/DqSPK0gd3EoOJIBxWLr+rwGfqNvNqGg229Wzklt7HBCcGM8Ws4857aUyQA9pJzIRarLo1DmY3QMeLbvuZgjzKlR/InLO870kFjBCTPv0jgmCRqCRrxXs8i3K4XYjRGIPDRiW+UFyX05cuF1+sAVy0KwOogXz888MJTAzJUnL/aSR7RT2s4TJQ3zgfUbSuULJsM+8YzSjr55NqNA49g8ou2ywzECZgxCqK0NsTiM6R42px4ekXIHTVrmy9aGzutcEA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3420.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(136003)(346002)(366004)(39860400002)(54906003)(91956017)(64756008)(76116006)(66446008)(31686004)(66556008)(6916009)(66476007)(5660300002)(66946007)(36756003)(7416002)(2906002)(26005)(478600001)(2616005)(8936002)(4326008)(186003)(6506007)(53546011)(6512007)(316002)(83380400001)(86362001)(31696002)(6486002)(8676002)(71200400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?NDhId3BPYno4eUNjZmlMenMvTFRQL0pKd1hyWTBsVFRqMUdYbDBZOU9HZHEw?=
 =?utf-8?B?UjlJTXQwemdjRU9aNFFWbjh1cVFoRC81WHlLWlRENzdOdVZ0ZkdYaEdLYkNB?=
 =?utf-8?B?UGE1MEVJMHJUMTR6cDVUeWRRWGZmRlVZOGFRMHlKelRaTG9oU25sdHZhaWtl?=
 =?utf-8?B?cUdFeE1MRkF6RTU2T0E4NmxqOTVGbmxTait0S1ovdnFaaklnSFZoZFh5b2ow?=
 =?utf-8?B?Q2RJKzgrQlp6SXp1NmFxcmMvMnpGSm1qd3JZVE96YVB4MFhGd2RQUld2TVM3?=
 =?utf-8?B?Y0RES01qeEtYZG9GcHpFeFJOdzl4S3FRZWRaYi85YmFBNlpaMGJvcTZ6OUpY?=
 =?utf-8?B?NU85SnJlREdzL3lybHJhbzJ3dUVWY2RYbFZHRjN2aE1XdGoxVkNsZkdXU2NF?=
 =?utf-8?B?UW5XeDN4ZzZEM2FTaWZXVmx2bnpSZHJOOFFRU0F3cVhhTzNKTmhJZzFYNmhj?=
 =?utf-8?B?eEFBQndySUZIa002WFU2cG14QWhwTjNTSXlSbi9nZGQxbExnNVErdzFVdkEx?=
 =?utf-8?B?VWFYbW1hNlpraWc5V1hXZnBmZUh6VUUreFVPeDFNU1FTRHdmMS93VHRtdXdT?=
 =?utf-8?B?RWxmQWVaWGV6T0xGMTlzWWJ5THJKUDQ5bVBKanFGY2thZDArTFI3eDRYYjdE?=
 =?utf-8?B?bnZNVDVXUUpsdVhLM3pQdGRhWndIQTlvMUFmUElBQnFIWDVPbjhyclVSM2U3?=
 =?utf-8?B?TzZiSXBQVUZCYThnSU1hRlhVYWVSMGtlTURRdEdRaHlFZ2lVMkZ3bEsyUUhG?=
 =?utf-8?B?ek1UYzdyT3N4VTFzVW5idTVISTJPSWt2YWwyQmJPd0JQbHBLT1cxTFJCd0x3?=
 =?utf-8?B?d0lrNmRSeGRkSllSTStQQTFhWTdGNENyMkhiZWJVUmtmbVNJaEFBTk8rUjcr?=
 =?utf-8?B?clpuN2xpM1dLOEtSbTFLZUR4azkvZjM3Q1JjdW5PUDhGdmljK2F2UldOSDZ4?=
 =?utf-8?B?ODBYWWRpSE9pNnZkaTJtM0toTzIvOFBlNG4xQk05THFvZUxNcXpuOGJmTHRG?=
 =?utf-8?B?QWJVdmNwUElDYWxtM0JwMHB3aGNaYjVtcisveVRLVDI2akYwbjFvSG1iZ1cy?=
 =?utf-8?B?eDlDYll0am1kTDJrdEJlUTF1ZUM3b2pzeStzanRzTndmRnFneDZUeGhBZFh3?=
 =?utf-8?B?cHZmVloxd0NKSXlpWkJWR0toQXZmbmZSUi85Z2Q0YzllbkZXU2w0Mlo5WDk4?=
 =?utf-8?B?TG5ZYWlwQVlVUWUzS0dDNnErWFVMZENmRWtTd3gzVmJNT1B3MVJhLzB1OGRS?=
 =?utf-8?B?VVJsSGluL1V2U1dLM094NzFlalZmclRkY2lIRFp3dGtXMnY1MTRhZlhvV3JO?=
 =?utf-8?Q?dZKXGN20sv6FXGukjQnhKuZZLBYeeqgA6Q?=
Content-ID: <108073B88C677944B78B44131EE55B56@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3420.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e40e99-e291-4534-69ed-08d89a921d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 09:26:01.9394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nycrqniFEujetwnjN8Swv0iWpOQEJfYGJZoSPask4glW9VurmRS+6CPXsG2cgbCgExhmbufaPkV76rHR5K1L+3ZqCZI2/YfvrUQQe9u5YaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_042608_158506_EAB4147A 
X-CRM114-Status: GOOD (  15.40  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux@armlinux.org.uk,
 Nicolas.Ferre@microchip.com, yash.shah@sifive.com, robh+dt@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, kuba@kernel.org,
 linux-riscv@lists.infradead.org, davem@davemloft.net,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Andrew,

On 05.12.2020 16:30, Andrew Lunn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> On Fri, Dec 04, 2020 at 02:34:17PM +0200, Claudiu Beznea wrote:
>> Unprepare clocks in case of any failure in fu540_c000_clk_init().
> 
> Hi Claudiu
> 
> Nice patchset. Simple to understand.
>>
> 
>> +err_disable_clocks:
>> +     clk_disable_unprepare(*tx_clk);
> 
>> +     clk_disable_unprepare(*hclk);
>> +     clk_disable_unprepare(*pclk);
>> +     clk_disable_unprepare(*rx_clk);
>> +     clk_disable_unprepare(*tsu_clk);
> 
> This looks correct, but it would be more symmetrical to add a
> 
> macb_clk_uninit()
> 
> function for the four main clocks. I'm surprised it does not already
> exist.

I was in balance b/w added and not added it taking into account that the
disable unprepares are not taking care of all the clocks, in all the
places, in the same way. Anyway, I will add one function for the main
clocks, as you proposed, in the next version.

Thank you for your review,
Claudiu

> 
>         Andrew
> 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
