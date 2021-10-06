Return-Path: <SRS0=kkwt=O2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BE4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 09:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 712A861181
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Oct 2021 09:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 712A861181
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJrxA/+/YoAwuZ35tDgt4f5vlJSyUftGj6faig6WWRA=; b=mNZogy/CZDr0u3
	zDohIfbqb4D6/J5Dng4vMZzBx3y0t7ZJ3leT9NzCQIDtXE10kX3fKB+DRbVflwThh5S1mW4Mrx6xO
	MOV9l7Fd8Vo+A3q8yUM+EhBxlDZKbj4kuxn2DCpO2yF6HRyYG9R3tW1dZNTmazygDQa6aEJ1fLAAg
	E/tD0k30mUMaPglB3CzkvldjTiyFxjGONM8sKXu/crFjgbDnheFqZBg4n6N07Ss9MCoW84dT7Z0qC
	OGZ/PLHrD0oAl3sW62tMkJlFsjFDBoo0IR9ttZbHVrKYqP4MJl5Vnx1QNnKJE6PfDPkRGGYahxjc4
	7jPBxHZpvPNnnTVcwbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mY3Fu-00Dcta-Bf; Wed, 06 Oct 2021 09:30:30 +0000
Received: from mail-am6eur05on2054.outbound.protection.outlook.com
 ([40.107.22.54] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mY3Fr-00Dcri-IW
 for linux-riscv@lists.infradead.org; Wed, 06 Oct 2021 09:30:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Us5UnvnWro+zEmsVVBD4ejc8IOdTJ7KVqkFSIyzav3fDix6ygEUayzf+siJA2FzVIdUjozuqW0lXuEaofRQjjWKIEIjxqLCsUehHeLNcp1gAoeRsa5lV0SAw5A62Ly4nOzAIRKNslyOxAtOYwhpbUAZZwr8mj5oHO3H92ZOY2U+hE/83XtOxkpGvLE4b5qnRosswqkk8T31zKP0xxwn65/OiIjhi1Ub7OFl4kyk7h8QR/YXlp9dziQRFzmKfRhmeWyJPOLXU120gLl6IJDAkgfcRDBzHaH3CoZb89YHjHWJgl9yFefwGM1+LE9LBsJ3meVGb0e1HtOBJgLtZGGtgMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Y0Z0FIvUXkB0fBNjt3ScjAkR+6+ytEGCI3ZY7ZIkik=;
 b=idbv8bJNfc32kxPxATkbY3K1EeiCtFOPZOxVlDSV8tTdbtLTq+U/uSd1j63LpKVNJbgGdDfreTzhaW/YxtFWmfCyVwX9/o4ucL1vJbYWJq9eQxMbcH/tITv/yzC70u32qjkiR/uBUIRs2vSQ26JFduYVTpELvyXl5Fn/HE81rWkh4k9oMjlrSXT60D9ynnk12tijDuEWiDpdAS4nX9uOUZXi0oLzSx7coXEnCPHMXvXpSye6hh+YXugLctQOCyW3XXF/j1R3M9Eq48zO6JVl63IKSdjcJvoaVJh5Omdv85qwdF5Ua01s4TbiX6pX1nGta37Y/xh0b505Pc3kSld2yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Y0Z0FIvUXkB0fBNjt3ScjAkR+6+ytEGCI3ZY7ZIkik=;
 b=wOJ1g4WTKjjLCsUicRdGTquYm/FgBb/MEsNj7j2Xg7wJkKa07S2n85EUL3NcNfbZwROmhjIqD9xNwz6rLPF4Pgvkmhha55yGbmDPIfkcQOYK9BNmqmVHBSy0oycb8+X4OVxuAwFVXNgZJKwuGlkQSfomx9x2WTnfkZRc34nVMWQ=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB7PR10MB2171.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Wed, 6 Oct
 2021 09:30:15 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%5]) with mapi id 15.20.4566.022; Wed, 6 Oct 2021
 09:30:15 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
CC: David Abdurachmanov <david.abdurachmanov@gmail.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wIABMx0AgAArEQCABmU8AIAAMeyAgAF704CAAUpnYA==
Date: Wed, 6 Oct 2021 09:30:14 +0000
Message-ID: <DB9PR10MB465270EA5D6F25C44E68D1E580B09@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <DB9PR10MB465252461469340F60A8714780A49@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCvKaS0sE7paCecMDvqpkw-yLM_QFHdF5pgWTAqeH0JAfA@mail.gmail.com>
 <DB9PR10MB46523AE6EF51D6C801B4A9BF80A99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CAEn-LTqVd8z=kpCtWjiPbKuw24NuHLTQxWzw7g34fEJgDYrp8w@mail.gmail.com>
 <CA+zEjCtQN6c8bikg620PQwoPzJ6T4wGLvzQ413iPs1tCeHif0Q@mail.gmail.com>
 <CA+zEjCtVxDkg8K0iK32j4KO+Wgt+hTjXD15HdRhNeCV2Sjpckw@mail.gmail.com>
 <DB9PR10MB4652294AB444536BF57E320A80AE9@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCsf6m8cctHNPBxJczg-J9XC-piAcdtNDO71qmtCtDj9gw@mail.gmail.com>
In-Reply-To: <CA+zEjCsf6m8cctHNPBxJczg-J9XC-piAcdtNDO71qmtCtDj9gw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1a20de5-8dfb-48e2-1700-08d988abe751
x-ms-traffictypediagnostic: DB7PR10MB2171:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR10MB2171411C0B9F88EE0E19BB69A7B09@DB7PR10MB2171.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ae9Jh928JGWhrv1PzX2E/2GmPK3bgKWD32pqJ3l+tX2bdUfy0PJhzlMa0Li5hpsTM0zeLUVPled/Vw62A5jBgfo1cPyDBCHOULHmOiOVANV+Vhr/3eWsv3VS3cy3ZqoQl5oOEX+rrKH8e+xrmOSpvk680/DHeumCSRPNVd/CmsF7xqI1mJtoejkQIEOsi4fDQkw7as4Ncqm8O8a51PkiCsk37Z4Qwm+SQpyvP2cHAD7C3ubX9s4dzLbyTZZ6enSf27qqoZrywpbnxqKIWcY77i2Jf+7/6KHMKBIs/7Sm0HNqsRg2FzdA+mysxuIbjeq6Rgedx5gNdH4vF7Ns2iqEUp8633IEHv1NnUobRvXjYWg9xN6g9mjrwQCS5/bA/OAmP4uXu7FVDSvJ9BbbPooTC0tgj0IE+yFF7R28Z4YK3bLwTrW6nQb+q/pE28bpSz/7XDcN8m2jWJj/ydr9hwutc6+bhUxWmbWGfTzOWH5L1fk3xVEssVa8pG4wYBxhYmHFLsPWdikjs6MO7gTldt/a6lD73OUoPfhARsrckaNxGy9rd0jEBxsntJFCsjXuOAHsznj4qfyuwSXM7LCaaP4XyO5iEb6beTf2QK41muV4rAS8C2fRQ0tDCXXDVQEShQVOKUYq7orjEEB4a9u0oumY4qP1kR0Mwq+cxN6UoRVTcxkY8xIfjz9EEk4BSKMNCID7vBFGxMYvJXlaTev5sMhZgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2906002)(71200400001)(52536014)(55016002)(86362001)(508600001)(316002)(38070700005)(122000001)(38100700002)(6506007)(33656002)(26005)(186003)(110136005)(83380400001)(54906003)(53546011)(9686003)(8936002)(66556008)(7696005)(4326008)(66946007)(64756008)(66446008)(66476007)(76116006)(8676002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk43cXh2aDZIT005eG02TmxvRklUQzRZNGFNd1hLWmtkZEYxRWQ3NUdrQVJj?=
 =?utf-8?B?bWc0czlKbitlSWZaV3A4aC9IbXNXSmVwS0NjcUM0NHlCR092Y0JWd3hhV2VU?=
 =?utf-8?B?N2lDMGxVTkN3aHdTU3ZXbVI0cnh0T1dkaTVuaUd6QlUyVGZCVWVTSk9qU2pm?=
 =?utf-8?B?Q29kT0IwdXRYRzYwRHNOUXBaM1VGTW80ck95NUgrNmh4YWxRQnpqbVRwN3VR?=
 =?utf-8?B?RHJhN2FKZHBUOVJYTEhFUXhlWm10enp0MCtnQTRBajQ4cmlBKzAvQjJ3b2sw?=
 =?utf-8?B?aXRUUTVIU3V5QjB5UkE3elJXWG9Gd0haaERxanhDSzFXenlhMmJiY200ZVVD?=
 =?utf-8?B?djRRT2J6TVVYS0hQVUR1R0hGY01sZmNiNm9FWmE5UTNDVFRZWFAzZGpqNUt5?=
 =?utf-8?B?cS8xamtvWDROcUk4bTFwL2xPNG8vRTRDTlE5YittRmVkMkZhYXlIRXJEU21G?=
 =?utf-8?B?ZERFQUR0RDJaTkc5bmZsOWJQN0FuTnRPbmN1RjNOZURYWEFlQWY0SWNrajRr?=
 =?utf-8?B?QWR5TmRFR0pPQ2VNU3FnSVFjZElkZGlXVUE4OTZBL1hzT2ZyUTRzeStQcEs4?=
 =?utf-8?B?a1c1bkhEZzhER2tLVFFoSFJUUC9VZnJlZjBHVzhRN1p3T2gvYmRJbXh3N2Z2?=
 =?utf-8?B?cHdKUHo1RWxaTGNPMFpRMENYVXFUT0NTZWZWSTdkTTJmbWVueVFHbEpmMzBN?=
 =?utf-8?B?SVoreE5BcFdKMVduNWdXaTBGeTNxK29sazJITm5CUUR1NmxtY1lSRTVkRGor?=
 =?utf-8?B?ZEpTYS9RNGYxSEZER3NaRE1rV1VUR284dHZTWnZhbE9DLzc1V1BsdE0zTUlH?=
 =?utf-8?B?dGUrMGlJQTEyQzRIUXNpYnRYcXpqQVBuTjEzbFhXTEVUSXZ3L3Bna1MzSWVa?=
 =?utf-8?B?MFd2RWRJa0tzOC9acS8wUDYzL2JEbmxMRm5Lc2lvMHkyZWZXdG81dDdpY1FD?=
 =?utf-8?B?MFA4djRKTjB5N1ExeXpsY3lOLytxcFZvdUhxY3FpTkljL0NVY0RNTS9QSmo0?=
 =?utf-8?B?R0Q0Ni9ja3RHalp6MnRPWGtJNkZGSUFYbGpZbDdkbUd0cG0xVEpvdVNuc0pW?=
 =?utf-8?B?NS8wa2dTUStrUUdiYi9Sd1habVdFbWlvOXNyR1dRd2FvNUlKU2xwU1RqL1VT?=
 =?utf-8?B?T0VmQ0VkR25ockpQLzBHUmlyc1ZFRXc1K0tYby9Qd3JCY25QTTBvRE9YdSsr?=
 =?utf-8?B?bURXdjluYXpaMlRjbzZtK1pXN04vbFFWN2tWdURkMGorUWwrTFY5WHNvVUwv?=
 =?utf-8?B?M042L29RMjhaVnZKb1puUlpwcVZlUUMvNTJaZklTN28rTE1ZTVpxOUgwZnRT?=
 =?utf-8?B?OUExNm5uWUZFK3h0N0prNnRDVmJQdDNrdTZDWmg4cndpdkYrSDJUeWZMaVpB?=
 =?utf-8?B?Z0w4Nkx1Y3QvZTJ6eDZXUUhXekpKVlYzTGJiTEJsekZ1WHNDUUc2Ukx4TXAz?=
 =?utf-8?B?WXFlblBPRGRUMnhLenFVTVpmNjhjUHNlVWUwQmRlVk9nVkp1MkVkRncybkpm?=
 =?utf-8?B?VVRiQXZnbTVFT2tyMmdEaTF0dUNkM3NNUjFwWjJaMWZiSVhFbkMvRy8xaE9L?=
 =?utf-8?B?QmVWcFhGTGlPdzlES1FlREtBRUNmRjVYb2FxUTByV1VvYkM3TzZDbTZQNGZi?=
 =?utf-8?B?aGplRlFVSXlnRXNvU2hvVks3d241cHU1VWhnd29HMEJQRy9tVGhhZTVqTm9i?=
 =?utf-8?B?YzFuaHc1TDhXVzhRSHhMcDlxTW13SXZpUG5RU2FyZlg4SXVZOVZyME5BYkdz?=
 =?utf-8?Q?2e+4Xl7wr8wmx8ooP3TPLgiOyhZM7FQ0VqbFFwc?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a20de5-8dfb-48e2-1700-08d988abe751
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2021 09:30:15.0256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RMB8rgGBn0pQESZMFFTCaqKbPI3+M3sB8xQ0gedwjNdoo5kJJ04NFZ/kGFFT3+yzHtf+bkexuR9LlZepXFPGAmqMOCVkgarfzpSUGCQx8sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_023027_664124_E0C7F446 
X-CRM114-Status: GOOD (  29.77  )
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

On 05 October 2021 14:43, Alexandre Ghiti wrote:

> > > > Thanks for the pointer! I have just tested this sequence from the
> > > > u-boot shell, it resets the board correctly. But then if we try to
> > > > power down the board by a long press to the corresponding button on
> > > > the board within 16 seconds, it resets the board: so we cannot
> > > > shutdown the board in the next 16 seconds that follow this sequence.
> > > >
> > > > Maybe that can be resolved by using the one-shot alarm as described by
> > > > Adam, I'll try to find that in the datasheet.
> > >
> > > After configuring the one-shot alarm, I still have those intempestive
> > > reboots if I try to power down the board by a long press within 16
> > > seconds. The only thing I found in the datasheet regarding this timing
> > > is in case of power undervoltage, not sure how this is linked to what
> > > I see.
> > >
> > > @Adam Thomson Any ideas?
> >
> > Nothing immediately springs to mind. Can you confirm this is the nONKEY long
> > press that you're attempting here, which is resetting the board rather than
> > shutting down?
>
> Yes, this is the nONKEY long press that, if done within ~16sec after
> the board is reset using the alarm, resets the board instead of
> shutting it down.
>
> >
> > Also, would you able to again provide events and fault log when this unwanted
> > reset occurs, just in case there's anything there to give a clue. Can then
> > discuss internally to see if we can ascertain what might be happening here.
>
> FAULT_LOG = 0x60
> EVENT_A = 0x12
> EVENT_B to EVENT_D = 0
>
> But I'm unsure of those values since they are the same after the reset
> triggered by the one-shot alarm *and* if I clear EVENT_A, the
> intempestive reboot does not appear!

Thanks for the info. So we believe, based on the event registers values
provided, it is the RTC event as that's not cleared by a power-cycle (it's in
the always-on domain). The other test would be to mask this event immediately
after an RTC based reboot and see if the long key-press then shuts down the
device. I suspect it would in that case, as per you clearing the event.

I'm still curious as to the 16 seconds though. Would that be when the kernel
finally starts and masks/clears events (seems quite a long time)?
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
