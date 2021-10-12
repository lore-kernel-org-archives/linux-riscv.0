Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEB4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:33:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A025061056
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 10:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A025061056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Rzr9iOBfjT+Z02NuujV2eEm3DDVM+bgXuNr0UEeTR4=; b=pwptYhQRf6C8sJ
	F8UM6iin7keTgXnZjl8Mkzwg8JCOMn5m/LsYHD1Tl4BhsaFE2+LpqXf+wMwygLTjoyLKKbCNQbBGR
	PNDqcqrvvuNn/UgXcSx0id//LMzg/nvzL7l15I4TLgWajB117gnHlo1mtuGRcBFtU3SHX/HuUTNs6
	b/SGZDvrGadVVii0TARlqsQA+QBAzOnsekPflsRv0hKbGSB7M8oWCYxn1fOW66xLY1gAUsLJWDqgY
	V0SvmiwhYC7zZLsQ18WTWyp9i8RVenXbmUrCcg+OkBmbjmQ0CLqbe8MCnMaQjsrrJ6ue3hK2WC4Jz
	tTKFDyBt4KcJDd5JjT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maF5m-00CRfD-RO; Tue, 12 Oct 2021 10:33:06 +0000
Received: from mail-vi1eur05on2046.outbound.protection.outlook.com
 ([40.107.21.46] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maF5k-00CRe5-Dp
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 10:33:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKo6pidOwtszfnzKQ0NqQ+YD8ceCXWOAt8C0pOxfw51bAx4BEq2ujNN95ttuUmdriJ6Ljfv96OD1rncKC/eFAXK8dZcR6pNKr4PctQAihe4vYjijJ5trXSZyYYLzgi9z3VQ7Y1bycQDA4M31B+/HHFkHDRA1cB3mJfxmGzdXaoRDN/1DCnl7kyJ7fgSNG7YtJyFp0T+KYM+G+ZnfPHUnrCXGZLJyyOM4FaMurAW9s6mMfPrtf7RcirhptETpdqiO2fEEwPFoJXyRSQmIjyZjMt7P8tVxSiVQPcPDDJMueGUEePlj0Syte58Byem1wlJS3elTEJGNYHY7XR9rNuWznw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFwJ+sL4uEqo0wiyM9wW9xekOHGisycBC10Izb5UlAs=;
 b=KdhubP5cVQzQzB6pxnXnbjOuxr2XDO9Q/MbbNTpOiOAfBtauEJX3grkbLUEsMxiyBN4YreEZ8E1u4q7N3Al8vT/Cif12ewBk6ovtlyhu8hgKkuqL7jHv8eNP7wjIfEFQM5QX1GRyA3wOs/pZGd4i7j2l/kUC3hKlxiBLN7J5wsmLiYkcUpsANnjUkLQVLnYLmhPzMSEKNJrsPBGnNRnFHx7FRIXgT3fDXEzFWpvb/B/dl9FbfDSn7hh6TkbjMHnfz0SKOicnZhQcHtFjWTa6FbLNK6JKc97pCntWlmPKwBSWrDqdSPVXfAh3SyQAE8o1QbxuZSEVR+k1+c6wNDijkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFwJ+sL4uEqo0wiyM9wW9xekOHGisycBC10Izb5UlAs=;
 b=ZjIS5cN6KfMzrfUi73kzIrnDSESwFqeLLJmW6k3vZpdoAPNHX3PAmNMoxfjLTQRjCvn34SWchX7LQFhRoWMe1R8YYkJVPR8lPbaLPRU9tite6RQzn+O2CH/P2falz5HAB3QEJxD9JmXkID/8NdFcf8nZJVkE9kmOmswNcKTO9qY=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB6PR1001MB1046.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:5f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 10:32:53 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%6]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 10:32:53 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Alexandre Ghiti
 <alexandre.ghiti@canonical.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
CC: David Abdurachmanov <david.abdurachmanov@gmail.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wIABMx0AgAArEQCABmU8AIAAMeyAgAF704CAAUpnYIAAJDmAgAMFyyCABlaakA==
Date: Tue, 12 Oct 2021 10:32:53 +0000
Message-ID: <DB9PR10MB46525FC6EAF1610178A20B7580B69@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
 <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
 <CA+zEjCtVxDkg8K0iK32j4KO+Wgt+hTjXD15HdRhNeCV2Sjpckw@mail.gmail.com>
 <DB9PR10MB4652294AB444536BF57E320A80AE9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCsf6m8cctHNPBxJczg-J9XC-piAcdtNDO71qmtCtDj9gw@mail.gmail.com>
 <DB9PR10MB465270EA5D6F25C44E68D1E580B09@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvFO6Tz+D42wgnstx_TLNEt=HM0eeT5g0-zwaEscGj2vQ@mail.gmail.com>
 <DB9PR10MB46521072770D6A1C75DEE08380B29@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB46521072770D6A1C75DEE08380B29@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: diasemi.com; dkim=none (message not signed)
 header.d=none;diasemi.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff39e06d-23f8-4d58-7b84-08d98d6ba5ed
x-ms-traffictypediagnostic: DB6PR1001MB1046:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR1001MB104610E9B3746038B521E3A4A7B69@DB6PR1001MB1046.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +qrc7NtQnfgxsYcqXFdtIhw6ohIbC1OGQN2fpJmvL1gvg1VukU5uBAjFkpmdE5+U8Y6yftif/kMMqANsC9itrAkDljOXWdMLlgNnFek+06PQjnlblZubKXPPfIMIonbFaz4BfKp3LEeZV2QjyZtsEIP/3fedIQRSXhGPwpwNq2DAGCN22nF2V0VNPOKG8QpQRCaxv6SfcU1ASZQ+qt8AwLUO6XbRa3Hm2NisvgQWqluZZp/c8XENrvDuzxmdaLqPN7KIOeTYcehlpGsXY3WR3lKUTBYhsZOQJMjgpV0uK15DuUCK2NSsJA2x/zZhidGKynSkyTFxFO14B9ESFS41N7rcMoY5G2ubmEkO30aMr3Po4rA0opgUP0gpFnVmuPyI1l0LisH5xP2mpkAsDhNpPTB6b3+giXxl42p1Q+rzmh+619SiLUa2Fi6Q3wx8zG/DrNSe1FysPI8itN7dWoWpl38h9mNItoan71mriVfRG9uE/ukO4u3/1jxx+YEXvxMiBtguGEJTrzkXsdDQicBKorrJUFuJz2HzTDcHa5kwzZYNP/btIR9qUfnZS5I61BObYnVHAnl4Lrc1ntrtci8s2EvWWMeI5ilAdkmnJRnQ7eU8rGcH4f80VN3xhlvU6/0viYoWtmG+ekvoQoXWyhYaroPxYrogz52U+xJwcnqQkm2DzPejMitpM4TAAPlxto7zJRK9kjqMOmMr+krkML7wvw+vyMfeoAKrcVa/BDQDryHUAQxW062pZNOTKFN0lVOhXiyO0/mZ7PyuxJIjAMknyKnSH+rBb15R62/TK1o4SfI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(122000001)(508600001)(7696005)(66446008)(66556008)(64756008)(53546011)(66946007)(66476007)(6506007)(4326008)(71200400001)(26005)(186003)(966005)(38100700002)(83380400001)(54906003)(316002)(9686003)(55016002)(76116006)(8936002)(33656002)(8676002)(110136005)(86362001)(2906002)(38070700005)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTk1eHFPclhCSjhWZkRRcS9uZ2xoZXFhd3g0NXd1VTgwanpRaVhGZVUvUTh2?=
 =?utf-8?B?K1p5eWdxVDkxNk8ydnNWUGgzNkRvVVVlVlFMeGRlbitZZDZFc1EySUw4bzlN?=
 =?utf-8?B?WE5UUmpJUkhqdkRxMVdnYkhlM09GeGgzYnlNU0o4RmNNekYxMDdDM0J1S25V?=
 =?utf-8?B?WnVwUnRuTW1wK2w4eDdKdHhpY2t4bmE3clJqMTdOZWhqdFVGMUhhOWdXWVcz?=
 =?utf-8?B?ZUtxM2lFdzhWR0c3V3U1dFh3S2dZVWhiV2dsWUZsS2xmWXZUcXprWUVoZmRI?=
 =?utf-8?B?K2FBSE1MKzF2bmQ2WnVYVU9YODlYWWpTZ01uaUZkckFKS2cvK2oxZ0pLa1Vz?=
 =?utf-8?B?bUthOGFQTmc1N3B6R1hxY2d2MHg0KzVCelNRb0tuSkl3bmlCb1RodERhRW84?=
 =?utf-8?B?YVFaaS9YMU9LK1Y3S282YXRjVTNpNkFvait6blBIMEk2dlJkOFlTWGI3ck4y?=
 =?utf-8?B?dHg5UnMvbFRJdk4vWG93bVJQUm0xejROeEgyTWhhOWk1MEFYeldnemdYeDNV?=
 =?utf-8?B?UmlpNGR1SjNGUVNoKzV3Ukl6cnFqdGQ4Y1FDNGRHZ09CMUtnK0M4R0tJZ2FB?=
 =?utf-8?B?blV4VittaGFRZnlFOS9HZGp5R2p3bFJ1ZzhnMDBZYmlLSU10NnlPL3RjQnk2?=
 =?utf-8?B?UFVESXNkSDZQMURvZmxsZXJYZVBycnRVTURDQ293dTg3WWpjL2t4cFlFUnFn?=
 =?utf-8?B?N1dlbG1jeGtONFJ2ZUdUSjZUMHJaaUlKQVREdkNaTENSTlJWOW9XMlord0JC?=
 =?utf-8?B?VkVzWDFkdHo3c2t4Ylg2cGxKYVhyTjQ2OTh4U3JCdS9rcUtwa3lJcnVhT3NE?=
 =?utf-8?B?bldNSmxQTklYTTZabUJuTklqNk1jTXl4UXpWZDl5UDVvc1g5a1lUZ2c1RGZW?=
 =?utf-8?B?cFFPSUdzYXJxcHY3WjljVmpzUXlWc1ZFMXJqMVQzWGZyZzczUlNTNU1kZ0ts?=
 =?utf-8?B?RVZSVlJNbk9SNDNzc1Y4UU5lTmVYdlVpc3FJaDlNKytVbFIwc0JXNlVvc3gr?=
 =?utf-8?B?OGVFeTZ1b0szZjJ6OC9hWkhRNlNHemlYeXp4ZVNucFhjMHFDMWMyVlJqUElI?=
 =?utf-8?B?Y2cwOUoxbnVBeTJQQm01dE01TXlCYUpEMmNMNFIxUkJDU0pwZ2M1QzFVR0Ux?=
 =?utf-8?B?WWJ1aDJmUnl4ZzcwOTRjYjBabGNsaUFDS2Z3cWZFOEVOdzR5L0pJNEpVQ1lq?=
 =?utf-8?B?SUdrZEZYdWRMU0VsU1VlL2tQQkJDU1Q0MWRVclQ0cDFYT0d5SDQxam5qMmVn?=
 =?utf-8?B?LzBTYzQ0elJVZm9QQ1B1KzRaZ1I5ZGNZd0QybjZrcklUeG94MFFMYUxQZjF1?=
 =?utf-8?B?ekRLRkFYYUg4NEFBbDRKMGxwRHJUWlNxNytMZkQxVGpGT1hZQ1RsTGRCcEtX?=
 =?utf-8?B?OXZtL3VycVU2VHV4TW5Da3R2cGFVVWZ0M1V6VHpSN21KTVRlM2svMHE1S1hD?=
 =?utf-8?B?cGJWVEpjU25RY0RNZTVhd3RMMTNiV3pHMEdyeEllQmg1blZZOFdkcTZELzl3?=
 =?utf-8?B?d0hGcVY1TWtlT1VHL2Z2a2R0Q29sVTErWHdRREpMUERRMjF3RGtOQ1k1SnRi?=
 =?utf-8?B?dlp4OTM0ZUxRMkxzTlVadThQQ2piaTJ5c0NhUzJRQXlHRnA1MTdrQ2dqQzB1?=
 =?utf-8?B?QkcyWDNVUGd1eDZ2bE1Eckk2SklWczhUUzBiVzdzRFpnNUF4cXU4TGdPMHdZ?=
 =?utf-8?B?Q0hCaWhuRUZYNlpGNmpWTHZkcXdzQS93Rk5nMXorR0JiNFp2dVRTYkJNejFS?=
 =?utf-8?Q?09tpz+VeGRSo93XBn3FQIo5szi1RXwxzX7g/k5W?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ff39e06d-23f8-4d58-7b84-08d98d6ba5ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2021 10:32:53.3531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a9SRCTiTmflXCAasS6E6jD96OKZdCd71v83UokSp0h5NbrbPxFecVoXeKNogh691EJWRdWLzPPT79jOFR7f+E2j0VvtRLgEk1JpXxGdhaTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_033304_578660_8B90D68C 
X-CRM114-Status: GOOD (  33.55  )
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

On 08 October 2021 10:46, Adam Thomson wrote:

> > > Thanks for the info. So we believe, based on the event registers values
> > > provided, it is the RTC event as that's not cleared by a power-cycle (it's in
> > > the always-on domain). The other test would be to mask this event
> > immediately
> > > after an RTC based reboot and see if the long key-press then shuts down the
> > > device. I suspect it would in that case, as per you clearing the event.
> >
> > Indeed if I mask the RTC alarm in IRQ_MASK_A, the intempestive reboot
> > disappears. But that's not something we can do: the reset driver will
> > actually be implemented in openSBI at some point where the devices are
> > probed on-demand (the same applies to u-boot I think), so we cannot
> > clear or mask anything at boot.
> >
> > >
> > > I'm still curious as to the 16 seconds though. Would that be when the kernel
> > > finally starts and masks/clears events (seems quite a long time)?
> >
> > No, the kernel is not up yet. Maybe 16sec is not the right value, I
> > may have been influenced by the discussion here
> > https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-
> > support_tab_content.
> >
> > It seems there is some consensus about having this reset driver be a
> > SiFive Unmatched board specific thing: quid of the sequence I propose
> > in this patch then? It does not mess with the RTC registers, it
> > reboots reliably and there's no intempestive reboot: is it dangerous
> > to use? Or do you have another alternative?
>
> Yes, a board specific implementation would be the way to go. We're just checking
> through the sequence again to be absolutely sure of any pitfalls that may
> present themselves, and will get back to you when we have something more.

So having examined your sequence again it's now clearer as to what is happening.
With the sequence you provided this is only a partial reset whereby all of the
output rails are sequenced down then up again and restored to OTP voltages.
However the remainder of the chip settings aren't reset as this isn't a true
reset of the device going through full reload from OTP, so for example settings
of regulator mode GPIO states, or IRQ mask bits would persist on the restart,
which could have implications on system operation.

In addition the only bits of interest for you should be:

 - CONTROL_F (0x13)
	WAKE_UP (BIT 2) = 1
 - CONTROL_A (0x0E)
	SYSTEM_EN (BIT 0) = 0

Setting those two bits should be enough to trigger the partial reset sequence.
The other bits you had in your sequence don't seem to be necessary or relevant.

One final caveat to this approach is that there is a 16s internal timer (as you
noted before, VDD_START) which is started when the device moves to ACTIVE mode.
When that 16s timer expires the device will clear the WAKE_UP bit automatically.
This means there's the outside chance that you could try the reset command
sequence above around the same time, and that could mean you set the WAKE_UP
bit, but it's immediately cleared again by this timer expiry before the
SYSTEM_EN bit is set low. In that case there would be a need for an external
event (e.g. ONKEY) to kick the system to start again.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
