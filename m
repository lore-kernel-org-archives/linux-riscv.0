Return-Path: <SRS0=9UDN=OU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC42C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 10:48:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B5656120D
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Sep 2021 10:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B5656120D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pvDLFOYjB50C7dE7IK8uZHsArUHB5XaGpbkpt0vESCc=; b=22veygnJq1R4B+
	pGpyN9Erqm4momeGTt+IJGVF4m9/hNLUIEuQlSTkrmYtq/T2IQVgnjNGuH8ZnUoegC/oLiQywsGAG
	l9rHB3UbMO75eGeXyc2w9Ws1IDhRrGDPl4U+jqaqpqFuwQqOGbwbDUg/hbxcDSwIivkjtqKGqykAp
	G8UhJApMdj2gYACHJjcbo2+AbTMT5gOmj3f4TQp91CuctfRSo6kcnn/Ppxd3cFdZk+qJohbeEa9Ub
	gkxNLIgw5KjYti/4hKju3vEB2Kru3hH638F6ehl5xm93Oao4UNzQhFfzESXXkjwFShRzlOHplJgVa
	YVDav3WtH5LImgAcCJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVtbh-00DudP-Of; Thu, 30 Sep 2021 10:48:05 +0000
Received: from mail-db8eur05on2064.outbound.protection.outlook.com
 ([40.107.20.64] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVtbe-00DucS-R2
 for linux-riscv@lists.infradead.org; Thu, 30 Sep 2021 10:48:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bUhE7VqNj1dsh9w9Mgq/gDrfxMqMQfLxyxihut/9/N7rJIpICR1kmblPY76NF/aqhNm6thdiuUiWjs1+vGBYHU809DL60f87MPRqtWVXIIObIfAuMAJJ1aG/JFgmNAejXzkjtkwPsK0w+BjiSIf96tgdqc50k5PJ2XIXynm3gSO6dCWGBoweL+Y7UKHyurFsGKaK/vx1J/VzXyLikG8xd/P05Z3B1aCbVRiZOpQsIwgqJlgxeSaCjNhku4DMcq7XlBih2X9Jgz3+udeAoRmpeUwS6qkuKYIHIc5k2vsrsJhLmrTvVMP/O+CKqV2ZlDBv5DdxtEohClStKhAEMbjofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=j6KpCaDEi25ERXR90m6I7hBqXtH0roCqBTRK2us12gg=;
 b=mFPNMmjJe0o2d5kmgMIL9Z3meKBm8SRrFbN3UTpHwNwnK6H0ccw5LEhFUn6QwFAQxsb8SO4BSACe2UB+Qzzgealbr4Z9GdnHaV2w2X/PIZLF8mUk6q6W33i96/ykkc5ZkYrgF6FKAwLFGiF+zbbke8Z6WluRjMNyUoV41G6YHuUSrT+zKqzleBNh0jJpuhQsC+oPkS4yGVuS1PGOeqq/W7L84Q3HHIFsMf6XAz21QSMVOZnGoYiNVDrMSe/4hwFNtbAGO5GO3Lsuntr/VTQpYvRFgQg04eUIR28b+HtuonZHPFUa1QIiE0y3jc+2zSLcMa0NkiNmv6tWXZv+zRvZmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j6KpCaDEi25ERXR90m6I7hBqXtH0roCqBTRK2us12gg=;
 b=KtFGqE0+IGFyPd6v+sdz66ZievZphEoKZXYEhi55a0TSY693enc79fyNfnq8QRMAEPS/2ol1WiGAfffKA0FRj8CMeORdPWXPJUu4ZtAZuaw8WPP6I4GME3LykTxAzOLaNWdBfxnDYX+qgwpB1oKLBdaX8CQvQCFWVZ0NWN8o+RM=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB6PR1001MB1400.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Thu, 30 Sep
 2021 10:47:57 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%7]) with mapi id 15.20.4544.022; Thu, 30 Sep 2021
 10:47:57 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
CC: Support Opensource <Support.Opensource@diasemi.com>, Lee Jones
 <lee.jones@linaro.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wIABUNMAgAATRNA=
Date: Thu, 30 Sep 2021 10:47:57 +0000
Message-ID: <DB9PR10MB46524AA5496F513E34A2BF2480AA9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCtViMOXERby6A=wOKswQOFL60kTidc4+LY6_Y5svB_kLQ@mail.gmail.com>
In-Reply-To: <CA+zEjCtViMOXERby6A=wOKswQOFL60kTidc4+LY6_Y5svB_kLQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7402a27f-4f67-4c40-28b5-08d983ffc3cc
x-ms-traffictypediagnostic: DB6PR1001MB1400:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR1001MB14001B96B550EAC0136D838EA7AA9@DB6PR1001MB1400.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Gbr+JjhxBuoWE/GIQJtSaMnfQrpsKMifRBtii9jGAdKZ9WAVOdmmoiUH7xlSx6t2NZ8MO7VsIGQOTvra3oQIl6TuGtqGUKwK42Dzacs8tzSCXA+oY7AUC+hczZzSTxU7XHd+MWxl2WAGrc3iVaeDoMdPJX01aYISzckaCs6s8pAZkPEIuiG1Od09NSOsEVogRAf8MZRAAVwaXTdzf7A4pdDLoA+jZNb88ZOSLFU/9Hhv6lJKWv0Ln1dK+QoehZDwf2DuFvINr2cChTKbXc0MZrghjVBWsXN+WLz7aqWO8d/8eH/3wf3a45vSZQp9q6zW0Q5y0GLzUZX7Pkmhgt+l25S7jdg8SSuthxlMQ5R8t6AG2/4vmNKehFrt8Kko4kX+BDuGQj73gUrlTZcmeeJ21JXnoL6QeYB05n8FPBSsTa+vT/117UeXl2o1HAbSc33oth+XQ10hmfmvSIm1Ube4J8KPrpeUQD1FcqM4qXdrh7PXnxLWceDxcPaqjPx7h2Ijq8h6tHRZNiNfx6eSCmwK2elUWzeBOs+bwr7NP2HcGMQq4JQpiNV+ruVj3EZRdXHe58c9k0iAzWQeWhy8srg4V3o9PXiSerFd/7GeATzPXQAtIFvo1ZBnSTncht1F4flgIw7K+UZLHx41AF5RP/fZaNXHA8i5jkSlsr52/xOV1iNjKpPkCT8Q/lHIc+KyH6Kxt3uR7PqyooUZ/ddSkiyM+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(508600001)(9686003)(8676002)(83380400001)(86362001)(4326008)(38070700005)(7696005)(33656002)(52536014)(6506007)(76116006)(2906002)(26005)(53546011)(71200400001)(66946007)(122000001)(38100700002)(110136005)(55016002)(54906003)(316002)(5660300002)(64756008)(66556008)(66476007)(66446008)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlFlcE8wdzhjSEQzcnZscjgveHJwTk1PaHlDNy96cmtuaUtIMWJodzUreDlp?=
 =?utf-8?B?bUhoUGhqK1hMTkNiUUF5bmoyckZXbjVFSm0vVXpacTZwV0thWkRUWXM4czJm?=
 =?utf-8?B?bHpXNi9HUE51dXUydHg5Kzl6RFFzZGVCWk9BaWNnMDZRSjVVQTFsWGJIejBm?=
 =?utf-8?B?Ri9kMXp5TjNRL3JPRHg3N1ZBZnNiOXNOSE1vRHJiWmd3S0FpdDZpckU3d3pY?=
 =?utf-8?B?eTY2cWljRmp6Wi8xdGNBcyt5VFVHVVJKaG5DWHc4bmF5d0VxM3h6N2VJb29l?=
 =?utf-8?B?ZS9yZlF1eFE4bHhjTXJPVXBwMC9WT2N6K0NnSU5FOWN0MTAyclRtSlNHSzlr?=
 =?utf-8?B?Z2p2UFI4RVg1NHp5MFNJTGJTMjBmeFhod2Ftam5pK1BkOG9oS292Q0RlRHM5?=
 =?utf-8?B?Qyt2dnVGQkVMV2ViN0tIRUU2Z0RHYTdicWlYREJxM1BZSHdKbVBwZWZTbkZP?=
 =?utf-8?B?NUphU01jTSszSlE3bWIrLzVLN0tzY0x5c3AzSEZhR2lCNmpmSGNVTkFEOVpa?=
 =?utf-8?B?dG1rVjJ2aFFBenBqRTEzSms5ai84UVJxUVFYU3dNL09WYm15MW4rWmZZWnUy?=
 =?utf-8?B?eTJqQlpQTTNwYkpXS0ZsczVEcEsxQk5NU1p4dUtkNmlTNy91ZWRrRVJ1T1p2?=
 =?utf-8?B?emZnRGlNK2RCODJzTTVOeXovUVB1bkdLVys0NWpxeFVvZzZqYTlwalU3ZDBx?=
 =?utf-8?B?Wm4weEhQeUUxTjZPNTVxQnlDek9qUzJxMmFRanlKYTBUSjVObS9RYUF2bWJL?=
 =?utf-8?B?Umh3L0IxWjUyM2t3ejlHQUpyV1BKT0QrVlpkT3hSZkhURG9MUXg3aFNNZjIw?=
 =?utf-8?B?N25qdWhjMkZ4ek1MYjcxNkR0aXhibFJTdm1LVG42YzBKd2ZEOFl5S21OTlpS?=
 =?utf-8?B?M01acWR4ZDJPZFM0dkpyT0lJOFBhdzZ1ZlhzajQxNkVGRmVzQ0xwUVNndEhp?=
 =?utf-8?B?aTRxY1BwTjR0WFBJMytXZnNsUlN0WndBaUViS3VLalVsbzh5OXRUUWpsbnZZ?=
 =?utf-8?B?alpVcWo0cFFmSDVsWlU3a1psbko0RDRWRXRZOWFDVUJNRjdPWi9rMVpuNUZu?=
 =?utf-8?B?clEzVkl0V0JQTHcxc2VQY2NBTGE5SDJkSWtZdC9RaGhicTJXWFNqZ0dxUXpq?=
 =?utf-8?B?MDB3SUtubGVZWEhhM0t0RFprVjVFUzFLTm11c3E3R0tuNTcwaUF1WG5MKzJw?=
 =?utf-8?B?SWllOTdGMG5YYjNNVW5RcGxmVjlWbEN1TXVUYm5yaTVVMWlQY2Nkc0czTGZ6?=
 =?utf-8?B?akt5dTA3TndZVFhxSFhaQ2ZLWVJnRGVWckRyRmN2OGxUaXZmckpJdXlrL3BF?=
 =?utf-8?B?d2VzeU8xTGJySE0vTnJEblNVYU1ob0piQ0RDNlZmaGFvTWhWVjJRaytZOEFj?=
 =?utf-8?B?clF2WWJpS1dQZkx6QjB3dDBmSUhlSis0RnJJaHBvRGwyR3YxQzIzeVlTbUNa?=
 =?utf-8?B?QjFHZUt6R2oxQnVFRko5OHpyZ0NLOXNwY0ZDZDVKSjA0bzJGVTI4ODZ6Qmcv?=
 =?utf-8?B?Y3BpSkttRmM4VkJBU0xVL05wa2NveG5zOHJZS1ZmUXBNM3pDdzkyVzZiT2t6?=
 =?utf-8?B?WDJKMENMbFFnNXNlQzFPMGNoeTI1cVRCUUs3Y3lQenlDV0gxa0tMWVZpTmZT?=
 =?utf-8?B?VndwdU54UktRZmlPbXdvemtLZDRwNk4xWG1XVU9FTXZjNDRpMVNWankwYU1C?=
 =?utf-8?B?dThWUnI3Yy95Z0MzUm1QL3BDc0NtWTh0THh2eXVsU01GaEc1amQ2YUJtYXdE?=
 =?utf-8?Q?1ZUBKvvo6GVXdmGb7mTGWsNE7Z2stfAkEOyCdwp?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7402a27f-4f67-4c40-28b5-08d983ffc3cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2021 10:47:57.3237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N63x6j1AZmVV7KI9DLczn3RGMYataW82ujqINun/jorxDKiDQo+s5qwrlLSRmAQvgA5URvUGDZBGJvpyP5nyjxs2hOuCMD5UFgpYUXFJfM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_034802_982001_7617707E 
X-CRM114-Status: GOOD (  24.83  )
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

On 30 September 2021 10:38, Alexandre Ghiti wrote:

> > Regardless of this though, the consensus right now would be to use the RTC as
> a
> > wake event to restart the platform. An alarm can be set for a couple of seconds
> > into the future (or longer if required) and that would provide the event
> > required to come up from powerdown/shutdown, in the absence of
> AUTOBOOT being
> > set in OTP. I believe this would be the safest route to take in this case. You
> > can then just use the SHUTDOWN bit on CONTROL_F to take down the board.
> >
> > To reiterate, I believe this should be made a board specific quirk, rather than
> > as part of the generic MFD core of DA9063, as the timings may vary for other
> > platforms.
>
> What timings are you referring to? Is the timing you're talking to the
> time between the shutdown and the tick that wakes the device up?

That was one of the considerations.....

> Because I have another series ready which uses a new device tree
> binding so that platforms that want the reset from the DA9063 can ask
> for it via the device tree. And then I could add a property "duration"
> that is platform dependent.

... but having thought further on this. Say you use this approach within the
kernel then you're limiting that platform to immediate reboots are you not?
What happens if you say wanted to shutdown the platform, then reboot at some
more distant future point using the RTC? In this case that option is then off
the table as the kernel hard codes this and overrides any existing alarm.

I don't believe there's anything to stop us configuring an RTC alarm from
user-space, prior to the reboot/shutdown being triggered, and that can act as an
'immediate' restart or, if the user requires, a delayed wake could also used if
necessary.

Of course none of this resolves the watchdog case if that's used, but am not
sure if that's included/used in your setup.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
