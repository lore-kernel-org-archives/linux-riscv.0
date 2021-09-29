Return-Path: <SRS0=hgxb=OT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06C8C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 13:34:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E2BD61216
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Sep 2021 13:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E2BD61216
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eB05yVhlO6snletUqiRSkllVnag+h3AAX8z9C4rCjw=; b=3iBChKH3TINOq7
	i3fYxPx1UFq4Hc7eJZE14uZ9N4DA6pGzjwMKzABrWA3gp96+1cXBxvd2fmXGSbXdfmRPMqGybflDn
	7nbuPZZhKVMwrzeBD6hEt4aG9UqiU7VtB70tVf4zSDREzYn5xVPgKU44YTW4yLwpJCGyLmzTOuDGs
	qcZcy5tXDTTEkbs+gpMTFyH/Bvm9zN2c6G9LU0AjiaUfAUbgSL5OXLtIkH2zmW8YEr6g2Ahyhqj9K
	lQeYPsc1GG1NW0N53+L03XEqOd6Z87br2MhhGh2q1V8gt59t6HcGYVUGMiLOGTvi+3tZh9CgRUwyg
	PR6iMZKrR+/ikBwdxxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVZik-00B9Vd-PV; Wed, 29 Sep 2021 13:34:02 +0000
Received: from mail-eopbgr20079.outbound.protection.outlook.com ([40.107.2.79]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVZig-00B9Rl-1L
 for linux-riscv@lists.infradead.org; Wed, 29 Sep 2021 13:34:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQOCwPYfVAh+j1Hswkwgprcq+S99lMroMcOWTPQm1qd7ebkPlaVfEe2xZf0atFpfeVL6YCkTTQMUTo/IGvcfpC0SwK2d7PMTZpwdWxZdKKBh88TivI/pzlfEfWr75AaMEizaRnY/VX8I41UjCcVaCqrWM3tkPdxUvU65nX4vJPkoCaGoG6szF9v7sr+vHk4Tn2onTJ2Fq+WhzsKrOGlbcHaPvZijCun4L+kEKJcz7RwCNA4sKAe+t/vufbmIN69ZRPcBanuzauMZrpi+19kMr3YJxAaxMShAUqztCVjw319rFzfh/eVTm/P/W3GemVR+xIkPYNnVww9KmTslOVKtyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=f4QNJz5o4AItzyVO6GcpS1y5117GXjoOLJgNa2i25R8=;
 b=JlgUgpRBriRnFD7qtvI5luuxnqASd8nfnAgvvZ4qmRPvqGyXCT/09rq6q6eVX/KhBUJZQDZecEvzqWLDysyQkqxzpaZtfMTPqTMGmbVsUmwKo7UViOzxuWJEYYGAZyoXQa7EfV3/tIZn6aJezLRk7/YHL2m+vDMSvrII7YK7Og5cNRgaI0jFSFNtoIdwLcsYYcO/3oRm3EdcG9ii27i45fCuSqGkx50HC54SNd0q6p5mo4Hju4YjLyttpSv3w0AxhszK/mt/yJlRQpX0+h2+IEszTwSKbHcqwskgd8ZDEs757YeoBGXAiYyYGIwf7XqG2i0STplsWtvUIw7RwUJLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f4QNJz5o4AItzyVO6GcpS1y5117GXjoOLJgNa2i25R8=;
 b=YM4NHRfE3x7efcAPhmxSwSlr04SBynCySa1X7XL2ihii0R6iTwtf0FPG0m7DUenlA8SO1Ad8Mku64+lT6juxZn7rrgRtWANfCX8jvjtaaCH3UWS1vmngA7nv7HkGFwCBf9o7iVRQfhDpTIqhG2vB4KC68FRnNKVfbspJvMYp2CU=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB6PR10MB1845.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:6:39::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.16; Wed, 29 Sep
 2021 13:33:37 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%7]) with mapi id 15.20.4544.022; Wed, 29 Sep 2021
 13:33:37 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
CC: Support Opensource <Support.Opensource@diasemi.com>, Lee Jones
 <lee.jones@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wA==
Date: Wed, 29 Sep 2021 13:33:37 +0000
Message-ID: <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
In-Reply-To: <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e5e29b6-e591-4140-848a-08d9834dbe2b
x-ms-traffictypediagnostic: DB6PR10MB1845:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR10MB18454965308C3A553C362786A7A99@DB6PR10MB1845.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5HRygqZ/oSt9GFbp8wtX73/33OIZfYQUdDct88QScSL1AcXS0Y8HkoeEmaOLT+fdSIHfiJOQ8zuf+ltVb7joNeoM/DsUuOU6TfOA6I8CX/iuFO620vJ6Zp5emi13ZlkWG5+mC2xyauksYLJbVeomHCwOMrjGAyn2znF9aTiz9dBKhXZQcG3R8ldOF4m29p5t5NhAL/9PrlynDAflIjaw+xsl5LKczReVDCS6VMTDgmsWunlx0XyxjSPIVC7GumKH8rKjPnmGCkcJd12ug6kli2tciVjG8ev65OXDVGprDc9Sm6WXD25nP7j81vdSqQUiovUIL6+nCCUydnGB1LUwKgDkJWWvUeCA6hG2u8OkGAVtm/vUb763YUk+iNwwChVFPjeL+DoJDhGXLQLjomdLM5ZxcEtUoI2JA+nGN8mLiGV9fwkeW3do+/1yuqANlBiSpOaI25jIn9pzrYYJP/LWDfz2/kjYZB91T1/zl7HOqSTFU43AK7FwzrqKTGzAYdrT01/FbWRgMbnHT4NrcarnYm+S3VcumszZb7/a6QPK3uINOaVrl7QyfdDZQYoOLTm3yMA7cxwh+sZwxpT1m947sAbYZqV3rtmyc7JQnV6BSwBGQksjiX/koZd4VSqSA6ZTC58I9xE74GKFZANg/+vLGP5oVAmO8rKYdRWEIogjeFtab5WkdQV+zluNktLsSSiAAruG3yL6J6NYkhDS/s8LD0OL1KmpsyCVyyV3Hptu7YtIyCuGp+2nMQK7j976wFWTpAS4voWozNXTTTJWrEwkvRaupsiNFxvjPaVntMxnhSU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(9686003)(71200400001)(4326008)(186003)(83380400001)(2906002)(122000001)(33656002)(55016002)(5660300002)(86362001)(316002)(76116006)(8936002)(7696005)(52536014)(38070700005)(54906003)(66946007)(66446008)(66556008)(110136005)(64756008)(66476007)(8676002)(26005)(6506007)(53546011)(508600001)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXlOSG9BckR3Uk9mNjllaHJ6TW5MOGc0eFlpMkMwSy9XS2RRZ0h2NGN0TlNw?=
 =?utf-8?B?SVdyNFRIVzBQdDVlSEp5cmxKTGQ2elRSSE8xa1c3SDNPZzZzY3k5enJwV3oz?=
 =?utf-8?B?RVhJSGR5ZkhtQlZPTjNwM004cTVxMy92QzdlM3JCb2lXWXpxbHY3dW1wa1h2?=
 =?utf-8?B?bnJHYkc2OFFXRU9LWnB4SW5POU9MVDRhNXhFdVFBM2FkdWNuS1pTUG9vSmpM?=
 =?utf-8?B?Slg5T3FNc1psYWJnT1p4SzZPdHA1d0dKQWhlUWJpcVg0NlpQUmdTNkcvdDI2?=
 =?utf-8?B?blBDbzFFZGtkYW42V1FuUXhzQmY3S2d4QmY4ZkpqV1ZWVEJkejd1eVJlbEw1?=
 =?utf-8?B?eHpGUCt1RXFIWUJodldXcWdLZnNRbmVRUVA0c1BRTy9aakhudnVCVUhaZndO?=
 =?utf-8?B?N0R4dzZ2bWNqZGhiNC9aRGpoSDJkQ1I1VmhNTFQraU03N2NXTmJWV0hUcUxY?=
 =?utf-8?B?MStydk44Wi83OWwwUUp3WlZOckh0TitHbnpQRHNTazlBYWVUZXR6TzVPUmw3?=
 =?utf-8?B?NzhCeGQvQ05vTUE2VHFhYXFCSXpXSyt2TGRveC9oVnBRYW5zbi85RzFRZFVY?=
 =?utf-8?B?aUwvekZ2VTBLSWRyUTVMczNyZEhpcnlZNGhBVHdhM3dpdjAyMXdKYkhOVHRW?=
 =?utf-8?B?L2tuM204S2ZkWTV5cDF0aXdEMGUraGVYTDhBMHJyRU5taXAzMjRIb011YldO?=
 =?utf-8?B?N2NObWI0elZJeC8ySGFLdFhPTkMxcEVZOWljOG5EWnZtMS9wVHh0Tk9XTGF3?=
 =?utf-8?B?bFlyaXNreXd1Z2ZFelRxN3JUbENadzd1Z3g1T2xQREZ6SzlTZEZIQUpqWTkw?=
 =?utf-8?B?K2JxRmVzMC91QUhRSldRck1iRXZkRHVoRGV3cCthdHl4U3ZYM1VzVm9yR1NR?=
 =?utf-8?B?aEg1QktwbGZSRkM5OE1TOVpnNUNOYlQvOWZRRHhvZWpYZ3gvY0Z5M085VWdL?=
 =?utf-8?B?SWFEMmt3RW9jVHVka1dxMmloRTJvaWQ4a0l6bXZVRVBwRk95RzZNRWJnck5R?=
 =?utf-8?B?U056ZHZaVUhIbSt5MDF3L3dtZUF6eDltYUo3dVM3TUtEMldXYzZMcmp5SVoy?=
 =?utf-8?B?SGM2STlFL3RwOFNHcjFFejF1Zy9RQ0k4dFY1WFZqUXJJT20zQkVsMWl3YjlN?=
 =?utf-8?B?eE42TE5GQlZ0Z0kxRjlURG43dnZoWUVidUtiajI0cjJ4NjJDRTBhNk9VVVRF?=
 =?utf-8?B?emlzVDZHUFBpY0FFY0dnT3E5UWZOVytUTndDR3o1Z2QyeUlXVGZGMzhZaGVm?=
 =?utf-8?B?QXVEQ2ViVWFWbXFWVDRjNzV5RFF5bzc2NlJkUEFEUStWVEZpbVEzY2ZiK29G?=
 =?utf-8?B?S1ljZUlFWmtXdEU1WU9qWW1ZcGxOcVQrbnZJTThDMFcxN2dzNUg3WktJVVE0?=
 =?utf-8?B?c05ILzRKUGRpemdhSzlrd0pQQ1VFOEJXSUdISHl1TE95WnlyYkFDdmxzeCtS?=
 =?utf-8?B?K0lXN0xNdlJFUDc5M0N1eTRQMlIvbVRiVjR2M0VCSDhZc2ZOZzd1TmhNZHpR?=
 =?utf-8?B?VE1jaE1IR1NHWlZ5UngvbGFrWU10YlZxSTRnZWxtTDBCRWc5dGp3RXhISEZO?=
 =?utf-8?B?QkFZejVkbExCRFNXQUthUWcrY3kvRU5Ibm5JNXVGUEpLdE1MTHRLRW4xVlhZ?=
 =?utf-8?B?NHA3WDlPMVRKSktrNHQwN3JzNTNrRFNFL1FFalhpNURRQkdBUXU3OVkvd3lZ?=
 =?utf-8?B?dzBBZzdxd2NDSm1FT2dOVCs2Zm1HSWZDNnB0cjNsT3FyNElFTXB1VlhsN0Fz?=
 =?utf-8?Q?/8ZEPuJD2qQ/t0LmKAnJjyTA/yRBYJXnxcEqC9Q?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e5e29b6-e591-4140-848a-08d9834dbe2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2021 13:33:37.4515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: si+0rVaZQKmY9IAHLytb89UQv3uldX7H/iexI5lLzO38zHtGzH1iRD3SdjNjUTA2oagWau6M0bFVCBRiZoH+ZfvbHoiFqu0/IpcTPbxb5oE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR10MB1845
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_063358_126853_29653D1B 
X-CRM114-Status: GOOD (  27.25  )
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

On 24 September 2021 17:17, Alexandre Ghiti wrote:

> > > +static int da9063_restart_notify(struct notifier_block *this,
> > > +                              unsigned long mode, void *cmd)
> > > +{
> > > +     struct da9063 *da9063 = container_of(this, struct da9063,
> > > restart_handler);
> > > +
> > > +     regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > > +     regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > > +
> > > +     return NOTIFY_DONE;
> > > +}
> >
> > I will talk with our HW team to clarify, but this sequence looks to be very
> > specific to the needs of the platform in question which doesn't feel right to
> > me. As was mentioned on another thread as well, the watchdog driver already
> has
> > a restart function to reset the device (and thus the system), so I don't believe
> > we should have multiple of these.
> 
> From the discussion that happened here
> https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-
> support_tab_content,
> it does not seem possible to use the watchdog on a chip whose OTP does
> not set AUTOBOOT. But anyway, I'm looking forward to hearing from the
> HW team :)

So I've discussed this internally and so far it's not completely clear how the
sequence you provided actually performs the reset as you suggest. It certainly
doesn't look like it should, so maybe this relates to an external pin somehow
triggering the restart in this particular scenario? I'd be interested to
understand which event bits are set when the board does restart to understand
what did actually trigger the boot-up.

Regardless of this though, the consensus right now would be to use the RTC as a
wake event to restart the platform. An alarm can be set for a couple of seconds
into the future (or longer if required) and that would provide the event
required to come up from powerdown/shutdown, in the absence of AUTOBOOT being
set in OTP. I believe this would be the safest route to take in this case. You
can then just use the SHUTDOWN bit on CONTROL_F to take down the board.

To reiterate, I believe this should be made a board specific quirk, rather than
as part of the generic MFD core of DA9063, as the timings may vary for other
platforms.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
