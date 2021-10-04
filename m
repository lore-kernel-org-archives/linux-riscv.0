Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D06C5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 15:12:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95526613A2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 15:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95526613A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osyuev0Ma0nRxHthkhMwzjcpmlQa8zKHA15vDn4noc8=; b=I/QsqoDxQyMk+z
	0VO05hcaMh3yWTSFyy6lZZWezLY0LtNhibtmUccF2UH+cdjxy7x50Hh3XgiuiKGgFTPqjE8ueagJ/
	MO5RnmUhgNd5SVaHIviJtsDc/RiC0UzEOufZnRptaG7yPIp/BQx430c+5Ka590WHqwno8quCrYW78
	+waRpNMiTpWqoWIJj5zcJNsxI1TYtDCBpGgpRqzEtbzP7QXoMmuIQrb+zfiRFZvrx7oBQTOfFEU9d
	KE0JeRZN4nC6EAHg/r6035Qeaki+kFyFR5WdBoBw5jwfVU7gqifiKk9wM65/J+xl2GmfsaQJRR+ec
	yd/KA6gKnLqMGGT79WCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXPdQ-006sCM-1b; Mon, 04 Oct 2021 15:12:08 +0000
Received: from mail-db8eur05on2072.outbound.protection.outlook.com
 ([40.107.20.72] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXPdN-006sAF-01
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 15:12:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHtPuBmntWhgWnXX5oHu8BbRUny8hX25yDbJPEeyx3s+dD7yRC2P05pRoWKgtJ8I9X0N70ySRLmeZFQmJqNbjV0o84nLSh3z7QodYrz+XqlHJiBlEb3cziKbqI4vEykrfkwoKALthaLbOkRBHjgiGfZFW3vFxDA55zV3vwOI08WNC0Ehih88mWfZP4P95H6ZMzlcwhQ/4BnElhz8zmAo6I5HzAHFXndDgreeLjrhL+JtLitLBH/yslxWKS5awUFwbTs3CtaYfosb85ijO7orFedwCuAtvoq3BWjsTdbwu+1t8jsexy/LsnFBdbrRD3UOqqoTlMPDP4p1cyxqou+H+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PXxyCxWD0aou69AX5flYWvFEo7Yku0k75gdZ4Ty0+BU=;
 b=Z9+kMZWrIiAhp0LU8AwPupnQl5rgJ4v6Mzv3bHY0kcgGM8ek++TshB2vBp1bhKmL8zU/WFE6RToZn0uf0sKaKVGxujG9G0ZJaO1ya2iEgzL+l56p+SQ6WprjlRz4COyFllC09G/px0urX7Tt7kzM+3MK4VpE77ilvSxXU/mZGajc8wIdukC577S4IxaY9VVcpv0HQW4jZAWI0AXeyxPbSuukMxFILqOD+olgn9nzWUd7NOZHG0fVInPxO88tS9mxOsM6vwrsEAJPLIekcW+zTNxurKPD5L8y6cyAh4vLDgWyw/kcb8UcJfoEaSuYV3zwkhz3SbE4349zDqKoUAuHYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXxyCxWD0aou69AX5flYWvFEo7Yku0k75gdZ4Ty0+BU=;
 b=a9e2nZgpoQMsi0yD1t4LJQLNg0YlGZcfSEvhgXk38Pguz/UxLslAVcYW3lyPO40iVfdMAHjq0VCgbDJymLmPuEL5nJdJhd5cq8a7TSgHd5cdHQ8jzWr5Ao5L/h25QznGSRFcvOyjNcwAuF/CqQpYrYVg+DyVcGqtLnI5F7HCdOM=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB8PR10MB3129.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:111::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 4 Oct
 2021 15:11:51 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 15:11:51 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, David Abdurachmanov
 <david.abdurachmanov@gmail.com>
CC: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wIABMx0AgAArEQCABmU8AIAAMeyA
Date: Mon, 4 Oct 2021 15:11:51 +0000
Message-ID: <DB9PR10MB4652294AB444536BF57E320A80AE9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
 <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
 <CA+zEjCtVxDkg8K0iK32j4KO+Wgt+hTjXD15HdRhNeCV2Sjpckw@mail.gmail.com>
In-Reply-To: <CA+zEjCtVxDkg8K0iK32j4KO+Wgt+hTjXD15HdRhNeCV2Sjpckw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f354a61d-b02e-4b5b-8bd7-08d987494b0b
x-ms-traffictypediagnostic: DB8PR10MB3129:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR10MB312908B10E2A8559CE49149EA7AE9@DB8PR10MB3129.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jlNLj0SfrqnN3ycSd8s5zqWr+2ZNTdIb7oguwilaVqP1MxPnSO1LFZjX5bMRXNbQatR6YU9B+BjpDNlpEi8GK4D93fxsuAuZ+KsPFvQd5tkBrok68olwk3TuKclv31ShecYnaMxbvSNALwBr0C7Vdlsem1cMfZf32rhK7nmvHyIyEIBj8JlYb/mDnNyfEjp3p7roxBJ2vBFzqQ/GvK59RPSSN2u1m9n4gt6kAV05RLVyLr7+qnWI6ZNXmo3XyCghaYBPuXPuZXhny8V8qZCjgBLC2P779e0qDH1s3jeZnC3kiglTKs8STHmwo+vBS1FaLEv0CWWBR1lZ1vkJ0kkgpQVGStvlfwauOpdpF3FGX/L32KBZqNV8B3hVTyVsDg0IZ9/h7f34AtAQBz1O4tMWK+spkHOb+cdXx3/XFfcbxNg2qckZTFo4k3/U6mYDgiGxUtYK2c743Rh12jgD6eptsRgfXu80drG3R4L5ZVCXO8OkaWgdnvZL2p1mx69Je+GeB+79V2Cso0Dob7kgoeAXoyrAYOpTaKGAowqlUlB5reOHcv+CYi8/5QyUO8s/ce7mizf7hX56Nw+PpUVbFBNEmkWCSIyx/DmpfjZEzs1l/NbM5VMvoQz9VKowsMaH+UIvA7C/c/06doejeV0g1D1kYu/HDuwR9B5ThFCHda623hGf1wHWyI4UnTWaVqQnB18oFQg5k/Ng6cJtCYJZbHaP2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(7696005)(86362001)(316002)(110136005)(38070700005)(55016002)(4326008)(71200400001)(54906003)(26005)(53546011)(6506007)(508600001)(66556008)(66476007)(5660300002)(186003)(33656002)(83380400001)(76116006)(122000001)(66946007)(38100700002)(8676002)(2906002)(52536014)(8936002)(64756008)(55236004)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDVNemJvcCtnN3BjYm5UajlWVHBlaVdqNTBheW1mdXVNOW94aTJhVjVteCs0?=
 =?utf-8?B?ajUrYmJUOTM2bU1lRmY2MDJYaVd5Ujg1a2pMTXlzS3FZZ2M4ZTdLZE5YdGEy?=
 =?utf-8?B?RmxLNzRCM3pDRHZUL1oxVDNKQnk5dnFSK2habU00WWU1M1lWQU9zSjhOOERk?=
 =?utf-8?B?dUpRbXo2UXFKbktvWjhER08rK0h3QVhBazVjT251NTcxanVFcis0MG9kMFFs?=
 =?utf-8?B?WHZpSyswMnJtR25peHMxMDRJYzB1TnNOdVRxeGVkNDRVVW1XTFhZczZCUjdB?=
 =?utf-8?B?UGxscFltQUFEcHlNVlMvS1phMy9rRXFQUjlpWDkyd2c1NUNMYkhZdUlOenA5?=
 =?utf-8?B?QU0vTit1a0ViTWJOTDBLK25WQVhBYWF3VHI4aTA5WDVueVpqeEtZYVg2YlBN?=
 =?utf-8?B?NUUwdU9NUUFQZkkxS29qZkY4aEFURGpjcXRtT1Fieno0M0VvZGxQRUJsMkQx?=
 =?utf-8?B?RHBUT1hoNEQ1M1VTUlpjclZBM0srZ1VEVWl1eVBYaTViOVNxbmJnUFM5OXM0?=
 =?utf-8?B?cGRqUXViaUF6L0dUb1ZsSFpZai9OWlRxaW1XY0Z0VmNPVW9ENEs5S3dNNExt?=
 =?utf-8?B?RmJuV3k1c29HTnBiMG83d3hydWhlOFZlcXAzU3R5dEhoZ3JDNlVtbjEvUy9y?=
 =?utf-8?B?ck8zaXptVWZ3WldveVdKQmQwVnBhSTdrMld1NmdoRFRoNEFsNmFha1ZMWi9a?=
 =?utf-8?B?TjRZQUVCSG1UVVM2aFZVTzBBajFTQno4SUxxUmlyV0xZWmpjTXJxS3JEUUIx?=
 =?utf-8?B?eTNlRk84aHlWaHJnN0xYQUpadjJ4b1ZFVWpVMTZRQkJteDlUL1UvSkFUdHlh?=
 =?utf-8?B?d04rREI2bE1QeVZrcXhvQ1NnWFR0ZXZud1dXRCt1am1GZmZUK3hCaUxJWTJT?=
 =?utf-8?B?UjBSbzR3NE5ZcytWRUE1SVlYbUFpaFRaNndYMUlJS2ZPVjVHNFNkN204dlRi?=
 =?utf-8?B?WU0wdWc3Z3AwSzhEcTY2RDl3K1orMytCOUxQTVp6cjRNd2hkRk5MV24xZ0pn?=
 =?utf-8?B?Q2plSWVVODlZd256Rm9vUkZnTk4yTEpXWDgzVHhMN2xGS3Z0OXpqWkF1WTQ4?=
 =?utf-8?B?U3lNdVc3NmhOeEhmYmt0dUhaVnJzZFYrTzkvSjZuRWd1VEIrK1hWVnhnWFRp?=
 =?utf-8?B?K1FmcXhYa09aZTNFaU5RMkN2QkhFbklhOEJZU0s2UzVEQ0FISG9rQ0dWTGs0?=
 =?utf-8?B?TkZ3Q050bHV0MzFxNUxQYnZOYVpWT0dHK05ydS9RVnhrTTd5VzhKeXZwSC9s?=
 =?utf-8?B?VSthbXUwUEtiR2ZqUGk2MTRDeWZRSjgvb2p3d0FGTk1YU0VhQ0FwcFV6ME9H?=
 =?utf-8?B?UjBBZzN2Z1pZVHlpOEM4Q3k3M3JYb3Rjd21iSGc4MnFOT0ZseDNpRXRJWkxp?=
 =?utf-8?B?MFFxbjBRamdDZktXZng0Wk04Tk9EQlVJZXRqQXFkRlNmRWdZSXFxeFhmLzN1?=
 =?utf-8?B?aFdlS0RtdEVneHdKbUtCRFRHV2MvczlyOWNRQ1VVakVXRVA0YlZac0IwbkNK?=
 =?utf-8?B?dllaMG8wSTVYVkJsZUlRVzhEdm44VUhkLzlkaVVxd3Y2ZXhVbExvampFZG8z?=
 =?utf-8?B?d2wzMURCWXBpRVpDU3lXZ1IrNXhzNW9Fci9NRUlCWE1veFU5TlZTc0dnNWFH?=
 =?utf-8?B?T1pQRHVyVEZ4aVVmL2pxS2NYR1pPVW0rZ0lhNVlxL05FOWVUQm5UYUxPN0Vj?=
 =?utf-8?B?b3d3b1Zvd0Q5TXhLc3d2TzU1TGtwejBwN3FoOFV0RkJWQVJCYVREUlEvc1BW?=
 =?utf-8?Q?sGuDli7sp2MGFgI1DCqIhC2KuZhuSVkLVlDB6J0?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f354a61d-b02e-4b5b-8bd7-08d987494b0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2021 15:11:51.0269 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eHruUaUoNrLF7fOEZMrgzRXDvYets75IO0fFbIyTZiwof3km9mOSdGhWVsn6tqIfkvxFxOlo2P/jcpguFgpMwawDcycO7aKSqNXI667Ntyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_081205_148762_E3CD9BBA 
X-CRM114-Status: GOOD (  23.74  )
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

On 04 October 2021 13:05, Alexandre Ghiti wrote:

> > > Today I was looking into OpenBSD DA9063 drivers and they might be
> > > doing what you described for the reset.
> > >
> > > dev/fdt/dapmic.c
> > >
> > > [..]
> > > 241 void
> > > 242 dapmic_reset(void)
> > > 243 {
> > > 244     struct dapmic_softc *sc = dapmic_cd.cd_devs[0];
> > > 245     uint8_t reg;
> > > 246
> > > 247     /* Enable tick alarm wakeup with a one second interval. */
> > > 248     reg = dapmic_reg_read(sc, ALARM_MO);
> > > 249     reg &= ~ALARM_MO_TICK_TYPE;
> > > 250     reg |= ALARM_MO_TICK_WAKE;
> > > 251     dapmic_reg_write(sc, ALARM_MO, reg);
> > > 252
> > > 253     /* Enable tick function. */
> > > 254     reg = dapmic_reg_read(sc, ALARM_Y);
> > > 255     reg |= ALARM_Y_TICK_ON;
> > > 256     dapmic_reg_write(sc, ALARM_Y, reg);
> > > 257
> > > 258     /* Clear events such that we wake up again. */
> > > 259     dapmic_reg_write(sc, EVENT_A, dapmic_reg_read(sc, EVENT_A));
> > > 260     dapmic_reg_write(sc, CONTROL_F, CONTROL_F_SHUTDOWN);
> > > 261 }
> > > [..]
> > >
> >
> > Thanks for the pointer! I have just tested this sequence from the
> > u-boot shell, it resets the board correctly. But then if we try to
> > power down the board by a long press to the corresponding button on
> > the board within 16 seconds, it resets the board: so we cannot
> > shutdown the board in the next 16 seconds that follow this sequence.
> >
> > Maybe that can be resolved by using the one-shot alarm as described by
> > Adam, I'll try to find that in the datasheet.
> 
> After configuring the one-shot alarm, I still have those intempestive
> reboots if I try to power down the board by a long press within 16
> seconds. The only thing I found in the datasheet regarding this timing
> is in case of power undervoltage, not sure how this is linked to what
> I see.
> 
> @Adam Thomson Any ideas?

Nothing immediately springs to mind. Can you confirm this is the nONKEY long
press that you're attempting here, which is resetting the board rather than
shutting down?

Also, would you able to again provide events and fault log when this unwanted
reset occurs, just in case there's anything there to give a clue. Can then
discuss internally to see if we can ascertain what might be happening here.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
