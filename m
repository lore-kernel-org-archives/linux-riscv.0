Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E18C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 09:29:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E31613A7
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 09:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37E31613A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kyAeBiSf4h0axPD+uLpeyZXSyS/DYPxNlgE+SXDyJSs=; b=cAavpO2vLcxweV
	jfC0Ah7qPZ4AbHWqj9C8jccolSUUQj3zHBFYmVFxLHlFTPq1hDWYnDJP8wwvMTUHhaSyU0pWDhP7W
	Iln4k3ThqKuZ5iPKN82zVe2LUYDdlmxEI/JB5KOR1BZCGfIdgR7LQmvalo60A0KZ/UTJx7t84xKeo
	ADZxXe5/XSFRjG11y3UYlSJtJ9t+S5GSlISLZ0mAHGDLi+a8npeG3ckAqk4WXuyYUE7YT6rt0KhhY
	7YxkblmPhEznFCzQWrR9MzEpNXLUv5OcRS1OBnqGSwZ7zKaF13UmNSJV7siegShPzC+fednW1+BRc
	NzlJCP4/CD9sdKlMcVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVsN3-00DZB9-N3; Thu, 30 Sep 2021 09:28:53 +0000
Received: from mail-vi1eur05on2058.outbound.protection.outlook.com
 ([40.107.21.58] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVsN1-00DZ9z-37
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 09:28:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQgKNwI71nLGqIGMdDLFwcjYTvpsYyg72FNu3n+E/WkT8SpLRzQOpLHyKytX8E5wji4g/Bqryc7o99ZdbA1d9qM8duuEHRwg8mvxHDpX9gr5r/KsyTVjfeclwmkUO8VJh4vq4u6FgGUAUHYCUQsSe9T/P3iIGj9szRnoJ4S3EKZD7mVwRyC63FHZLjjTyItXVC1JZYZHVo10o1GH4KPa8Li5+A8dDgmSvfhY+MEkO3TVFhu3eLpVsLoKm5okASNFRZQMJZsX1qRoPeXZbLMF0B53wZwLSb8Zv2Ym2yw7ZX20JqBeehNPYcdDZadSpOlIaUJLn2JeqeRot4ELTOJmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=1+ZpohUEUovF11WZqnw3Q+2NRAGp1aWSHNhUI3aEyrs=;
 b=SHNUAkMzDAvxHAgg+s/eOUpot7gZhjaIbLjeAZ1qTY4tIOdIe/n10GOQbnrEP/wYEvIzptzixZdX+aukfZcjNcBNtkz6xn07yUpZRCW4+NR5oM3pWSL8m471Lo1lSjpUnO+Bixljx85KRB+Sz+KU6BKttVmVUdZgPGAiGQpV8l6P+tODNgHLGXi65Qs63R0w14ldeNYAEiUYF6HLZMStYH8b6XTw08FDG0RlrqmspGKsF6Zhujy+HkeTCbA1Cf+W1eJMgmVmw1cVg5gwoN7k44d6LE2tqtn2zzzxzrrqTaAmOcEiTJVn3WP3MuehJKCrgPmTveypeJ9ymyhVNqlHsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+ZpohUEUovF11WZqnw3Q+2NRAGp1aWSHNhUI3aEyrs=;
 b=g6z6wmQXZHQt2iWBZJBZmIkbm+ozQnFajQFBFG0wGFUgzSqSlzrvFVcjOaMN/I7TAAwZrbw/isBCGbj+iP2MIOZ87CsrUMGvndOPDb7B/6KCj4je2c/b92Nc4Jgn+Vvubxcvg5SB9G8V8AJ/MGthHikr3xPtupXU+hKgzyBCOz4=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB9PR10MB4682.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:261::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Thu, 30 Sep
 2021 09:28:38 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%7]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 09:28:38 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: David Abdurachmanov <david.abdurachmanov@gmail.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
CC: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wIABMx0AgAAYygA=
Date: Thu, 30 Sep 2021 09:28:37 +0000
Message-ID: <DB9PR10MB4652444644C8ECF3C729A8C680AA9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
In-Reply-To: <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45a24128-961d-41a6-ed0a-08d983f4af01
x-ms-traffictypediagnostic: DB9PR10MB4682:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB9PR10MB46825060170E29A9B42BE6DFA7AA9@DB9PR10MB4682.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ebZsIpg28+aFJQQ3ZgTNMtftjzi82U7NP7VGXnDyKhfDvQ9QsEEjprL4Yj/frYTUSY0uiHEkL04CNddCH4C9J2gukD/y9rbN+lgmkJw+oJa5TqCVvqVaN/KeltDNrgGa59DAj+3Fil+LqTGRthCs3HTzmqMI2bFXNSb16gGzNCJF92GiDbkZjSotuc8oAKRtugQnTDuLC4Pij0L5nVOSdjimvupQ7/s9MELl4w4zNmwezTKMxyUyRLPq0wjhKxBHGaxEkT1Ne6Ep0/80cUjOnAKUPq0/af8m0VlIoUtUJbXovwv5AgSGrS0GhI+5hwdfWb2yVg7FNYqPrt2X9qKxYP+eyP+4AOsIx303NV+PYAMSQDeV4cfZ31mUhInY36/iNbC1xJrwDlMp4r1djLrYE5KXb/rit4VLg2UChwGi1HcYvqYhMGIz7Kat7lb9bDSOXmnj3/po3ek1+HoQBsPWLko0qNvdJnIVcxypC4/mJdpy04u2lGZYmLrEC60O927JJasqpPS02hPCL0xn+GyAYZBH/wEgMiyKJW/nTfMf0ZTO7lRG+9wUG5beZr7rU8XLL2+Y04hqM1hs+7njugojdTRs3o4f3LiJKJTDFU8zvOd7PB3zzRFwwji1E0tArlO9CzutyF4pd2aPWi2N79DMStPYvbSvSVJA+2fKwRZa7+DyGBVL2oD2Kce4+U1q3tpIii9n8MURtskyiDQh8I8aVg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(5660300002)(66476007)(316002)(64756008)(86362001)(38070700005)(66446008)(76116006)(66556008)(66946007)(6506007)(2906002)(53546011)(54906003)(8676002)(52536014)(71200400001)(7696005)(26005)(110136005)(38100700002)(4326008)(508600001)(8936002)(55016002)(122000001)(33656002)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXowYkQ1MDEwMkF3MnZRSmtLc3FFYXJSTUdiK2JoQ1g5WjZRbDhsWkJmU1No?=
 =?utf-8?B?dDNPVnF6VmVFUnc3VWJ5VGFIVTFFYy92ck0wS3oxOHgvMTdud2plNlFxT0VP?=
 =?utf-8?B?N3VyZTZSakdENklkRGZBU3FwWWs0TnRCSUdRenRMQUlEWFNzODhhbVErUC9x?=
 =?utf-8?B?OUEwK3NDVnk2cTFBVzcvV05ZTkY2WWF5anZ6R01adDdNSytEY1FqaW1ndkxG?=
 =?utf-8?B?VGQ5azkxZG40b2JGd2tySE14bTBGZWJURTdsZldiQTdXZWxJN1craEFVdGhN?=
 =?utf-8?B?bmcxKzF3RnUrVktEZXRwTVF0Z2RITTYyR09QcCtKUUNGckZKOTl0VTFNajly?=
 =?utf-8?B?SitEL1gyK0tjQjdUbG5sWFI0ZndTRHdZUURHM1RKcHFzeVRoem5mRUdHK1ZR?=
 =?utf-8?B?N2JyYmJ5SFRrNGV2aEQxdlhSc2k1eW8yNG03alBnVHJHRUM2d2J2NDhteTVo?=
 =?utf-8?B?UHIyQzdwbzd5bngwQUlTRU5QYlNrMFJIVmxLcmk1KzA5L0xDMG9HdFJUeG43?=
 =?utf-8?B?MHlxWXRmMU9HMHVyVklKZGx3aWF1MUkySEdSNEhITXBIY2FMTjZ4M2k3TkJL?=
 =?utf-8?B?SFlmWnAvSmE0dUNSOUdxcDg5andjQWEzT1hKYTRHc0ltNCtubWpNQTNZNFlt?=
 =?utf-8?B?V091d0E3YUJCa1EySWNuU1JGNHFZQXEyWW10dkpqZEdNcmI3T1EyeTJtUkE0?=
 =?utf-8?B?OUdEc2REYjh5TG9IelhNT09VS1loN2lhb1FQSlRWNCtDSW9hSkVCZUVjOEtW?=
 =?utf-8?B?U1pTckV1OGN6b3Uwak1ieCtOUmszVEhRaEE2ZFdTWDBGYkNKSEV4aS9HbUhU?=
 =?utf-8?B?eE9DVUJ5MnNuSHJRQ3hkMjVmcnVvc1JseWViZWRCZHZVREpXQVRhQjRjRlhF?=
 =?utf-8?B?bmM3bXJyZEdsa1lCaFY0dmpYTFNZSk9FejN6ZDl5QUJaWHZVRUkzTGdmNVV4?=
 =?utf-8?B?MTBJZXRYVlFSQnNscnMvenZtOUdSVHJkdXhOaWdBL3VHcW9SMTVxNkp0MmR3?=
 =?utf-8?B?NGduMXZrQVhxMm5jemE3VzlOQlp0RHZhTTNNbW04bHRwT2VFelZUSjlTRFFY?=
 =?utf-8?B?RE9mWUhPM21MUFgxcUZ5bGlZdklBUHhyRE9hM2FNQ09kOTJzMmdib08rcDZn?=
 =?utf-8?B?TWpaeXNlSlRhaFFISzdTanU0VjNjUGJXWGZNdWp6OU1tOEp4OHlJSlF6M1Ji?=
 =?utf-8?B?b3NHVjUxd1UvbDdHYWExZ2dsb0xrbStzQTNLdzREVTJxaTNsbi9TeHk5QS9E?=
 =?utf-8?B?bXZHT01kMmc3enRSK2FoYzQ0MmFYOGlDZDJSb0VyVDFqRGpTUnBIL2h6K2JX?=
 =?utf-8?B?ck5TSXQyemFpb0VRY1B6SWNTOHFBU0V6ditCYkRSS3M1c2JtcVYwb2dIMThj?=
 =?utf-8?B?aHplS2hxTUdWTE1WTjJWaUlBbUd4czhMMlFRQWJydHk5QjFWZjZFc3pIV0xw?=
 =?utf-8?B?WVVEUTAwSXJJN1liN29XUS95NW0rREtxakxHYm1DYlZiNHVoWjhEcG5lNlZx?=
 =?utf-8?B?b2s5L3NXZ2JWQzBubFREMUtTVzNBT01MMk1sTFZyUjNtNXg0dU1yb0xTNTVh?=
 =?utf-8?B?cDkwNTNWblVUb3pqNUlHZnZBNUhkUGZ2V09BWEtqM0RvM0tGcHNpQVRKT012?=
 =?utf-8?B?eExuSjhrSzF4anRDa0hrQ0RXUERvdUFzUXhkcTNkdTl4UXF4bHFCb25uTy9Z?=
 =?utf-8?B?TzBFOHhKNE5FamZOQzNPQmFFaDBXdDBvczZscmNpcDBhZmlyZDBuZWpXeEtJ?=
 =?utf-8?Q?iOM46Ajvm7VBIARQT0ThLT6EfRcgWsJ5rdRgQrI?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a24128-961d-41a6-ed0a-08d983f4af01
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 09:28:37.9878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kckx6DGqgW8qX66QP7xxSZC1FrYI7ExzLtLp2cyWmJ8uR/pGQMmkKdjq1OK8cKAl9og2WoZqBSXpDIZf2aQCy0WHg8fvoGhyi+o7RDmV1OI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4682
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_022851_188660_45CF3871 
X-CRM114-Status: GOOD (  18.62  )
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

On 30 September 2021 08:51, David Abdurachmanov wrote:

> > Regardless of this though, the consensus right now would be to use the RTC as
> a
> > wake event to restart the platform. An alarm can be set for a couple of seconds
> > into the future (or longer if required) and that would provide the event
> > required to come up from powerdown/shutdown, in the absence of
> AUTOBOOT being
> > set in OTP. I believe this would be the safest route to take in this case. You
> > can then just use the SHUTDOWN bit on CONTROL_F to take down the board.
> 
> Today I was looking into OpenBSD DA9063 drivers and they might be
> doing what you described for the reset.
> 
> dev/fdt/dapmic.c
> 
> [..]
> 241 void
> 242 dapmic_reset(void)
> 243 {
> 244     struct dapmic_softc *sc = dapmic_cd.cd_devs[0];
> 245     uint8_t reg;
> 246
> 247     /* Enable tick alarm wakeup with a one second interval. */
> 248     reg = dapmic_reg_read(sc, ALARM_MO);
> 249     reg &= ~ALARM_MO_TICK_TYPE;
> 250     reg |= ALARM_MO_TICK_WAKE;
> 251     dapmic_reg_write(sc, ALARM_MO, reg);
> 252
> 253     /* Enable tick function. */
> 254     reg = dapmic_reg_read(sc, ALARM_Y);
> 255     reg |= ALARM_Y_TICK_ON;
> 256     dapmic_reg_write(sc, ALARM_Y, reg);
> 257
> 258     /* Clear events such that we wake up again. */
> 259     dapmic_reg_write(sc, EVENT_A, dapmic_reg_read(sc, EVENT_A));
> 260     dapmic_reg_write(sc, CONTROL_F, CONTROL_F_SHUTDOWN);
> 261 }
> [..]

This is using the tick alarm which is repeating. That is one option or
alternatively there's a one-shot alarm option which can be used which might be
preferable as you won't see continues events from the RTC when the system boots
up again.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
