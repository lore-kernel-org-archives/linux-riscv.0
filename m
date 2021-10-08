Return-Path: <SRS0=Gszz=O4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC68C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 09:46:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17DC5600D4
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Oct 2021 09:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 17DC5600D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lfqs2e1a2RFt51f1pLAI0lefyoYcUyj9cEQC7+XjnUM=; b=CgNcRLtTYbSuFJ
	FCtonYuifQtbJxQmMdDBtFLsTDQNwPSjyEcuDmf1fzhhmNIgiU43yZ4/TfJDJNpFzROyNKqnk7T+5
	7/pVfmvKzLevqqGHTb2lvdfy+B7UwZ2y/birLUIdz2hTiwUoLWHqQPEbLFHuEaZJJuD/mHWIIGm55
	OgkMtEo9dqgtdOFR0uK6jEEmDE+ABULkB2pR3UQBRxeBvOCdFyeGKy+CsFzT3eLaM421JvAcvNEs1
	1wAfDZmNFymYaPML4iIDMSLIbRlEVj//RfPLQcrWaiX4j5R+MOwgoX25TZg9IUZ2oHFGkJzhWlWuZ
	3X/0gxJZw7fVclVOFWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYmSH-002Gcf-Ia; Fri, 08 Oct 2021 09:46:17 +0000
Received: from mail-vi1eur05on2040.outbound.protection.outlook.com
 ([40.107.21.40] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYmSE-002Gc0-A3
 for linux-riscv@lists.infradead.org; Fri, 08 Oct 2021 09:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFbAcdcF+Z8faCT+pI6Ved43TpqRh43C4Ii6fHVTMC5GeH9ijKMunBKjmbsWF6IgQCLHKGrxyYPFvVvB05ZnBphkPkMAHVfcl2leqSf9Qv4BxtjWdFjQiTaRU5bj1AEfGWhxQ7cZWHt3TqwxjRW4evpa1duIe5tXltgnOKf+eZwXIhkl6MgIekKh4CwdR5IiwzhgLR9yFCPAtce88INZqlfFFYt4UiaEpkteh+PuqzQZsjHRwxCH0cN0Ttnu6uLd4c5YFQ0GHIbjGIp833Safy1FAFMlcwt4ChF3jfaFQ3swSmeqq8E2eAi1/f7l8PDxw+dFno8nmqV7UEeQTlJJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCJMPTX+YiYy0F8+BR8NJS8hh6K0Um9HndCeyWkwl+M=;
 b=JOpYJH6m+vttY1zR13ORszBGh5pHWeK2rH7yUHL8yKQH4VtXScxYDTxxEEOXgeSt/XbouABJSf+zPinKVTQBQGqADfOMCkE+a/cQLGsWMiVO8RhCZPcUmsGA22pOYvr9qxZ9mDzHsTks3ZD0vcxdd9E3tna++717gtXezgebMSSJacBHjP+owd+bBNk3TW04pEnsgOUZHD5fuMWXI/tEmScKMKysGEU8WHI8SKd61qaePQLLClCXqeIex7Z2mnFnm5OYi1xLRa0CGKuhTtlWqa06oo2GxjpGPykom2wpo8gXZkggHUfR4r5Wv5n6hzYZ80utpAejzIePLAnTbIEC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCJMPTX+YiYy0F8+BR8NJS8hh6K0Um9HndCeyWkwl+M=;
 b=y/v44NtjAJLsSp88Go7X6pL2k2EhxGDhYbkk2X6fdNWWS8txphv+eb/Y10dc2h6gbi9ybHPSr8bfyh/FMB2ZJQdzMGD5mYKO/3UqxNzT2yT0BASsnVbdVW3zcb5ReFzYezAofCzNsp+/rC0GKhQbOfumm2r906STnn1peNLcclk=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB8PR10MB3531.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Fri, 8 Oct
 2021 09:46:05 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%6]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 09:46:04 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
CC: David Abdurachmanov <david.abdurachmanov@gmail.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wIABMx0AgAArEQCABmU8AIAAMeyAgAF704CAAUpnYIAAJDmAgAMFyyA=
Date: Fri, 8 Oct 2021 09:46:04 +0000
Message-ID: <DB9PR10MB46521072770D6A1C75DEE08380B29@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
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
In-Reply-To: <CA+zEjCvFO6Tz+D42wgnstx_TLNEt=HM0eeT5g0-zwaEscGj2vQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 05925235-1f6a-4ee5-6f87-08d98a407240
x-ms-traffictypediagnostic: DB8PR10MB3531:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR10MB3531F6EE3F0398FBE924A551A7B29@DB8PR10MB3531.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2fNqtc3BGCV8tGYn2kqo9EneUGWh3Pd4XFtUxBtt5QfDz5eqO3aE4A8GLYRxZhwu0w+qQoxjAKaPb7C7RtbrqggML5iq8r/DTo2B1MVrYbVlA921EFtp/TPCXuSCz45prjUm42Bc1jvhtZoWjBokSDH+oRpOjUEChkE4EnRnr6I8sEj90mfRoRkSDDh2D+yCws5hH5vdlfDUNtehc+LafLp7DwhcRP4g9dIXhPwslm2JtYnHyQcU+/2c7mHzoNSu/290y1NCh/c4ZlHnfWpUc6fgtlGsgcqdHrQrkFinz+/Xi+BZmBLDF9O3um9y8tLWmJBtNKOa0YjhCXNGfFy4EYkDcoz0LmrK9RT6HYMZVq2DrS3QlgItedhzmyXMrbsdqz+ySz66wAEg9hg14UCq9HGB7tng245YIkIOCTPH0O0+PfmvImYnOrH0C2GGEkcn15jYSfVSOYMaAfCj/RIhMh5Tpw4+7bLQqqF3FxcdhFp3zA20zUA8tTvkI7zQDUsXnIeE2Qr5B5yBYeekzRtco7vuQHbb0zNzl5yDeqRCc+khuh+oegMU0TKkLplM6K/TFqp0L9aXdKFKIJiVebejBylerVDTKrYOaky7bCWo5FOiRx/ZNyvmU2eVoZYjz8611j8wOMsk0iaPLUg/6rmkoy88z6Yi9c4YMYOYAVPm7MXUlLQoFHrPZUzT7fj77irz+UVqhJkLDPlsLwCv36IuBaRCj8G9IKBjxf8bI/ErBxZcIXTEfrNPDYZaS4HffuflY6qbeUkIhjo9jcJ5w/zztihbrv9uf8dTpdyl+8c0T7s=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(52536014)(66446008)(55016002)(4326008)(186003)(38070700005)(54906003)(66946007)(66476007)(64756008)(66556008)(76116006)(2906002)(9686003)(38100700002)(8936002)(8676002)(122000001)(83380400001)(110136005)(33656002)(26005)(508600001)(71200400001)(316002)(966005)(7696005)(5660300002)(53546011)(6506007)(55236004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUVJU0FPdHdJSXB2MEpTZWYrbnI1YXZKSkd3RDhmTFhUcHBrU0hmb1Q4RFVt?=
 =?utf-8?B?RkhkV1JuTVFCUFh3OTh6Q01YOEtqcWVKdkJKSG5PVUI1dVk5NGxrcDUxd3pT?=
 =?utf-8?B?dnVTY2dxNVBPOU1HSEtsRWcvNHBTUVY4ZGxrWERpRkZTWGdHV281dWo2dko5?=
 =?utf-8?B?cWVjUlc3cXZDN3lJS3hqbm9kVVdNcGZHNEYxT01mNGhwVUl6ejlnMm1oQWZJ?=
 =?utf-8?B?TWdsQXNZc3U1RGJpVnhPbU9rVnhYRVhhTTYwYnAxd1hSc2FaNTJuOHZEdklw?=
 =?utf-8?B?OE1vVGxCZEw5SHFDa3FGRGJ2Zms2eTJ3Q0lvVUFhRm1Wdmw5QW5RaUJBUnRr?=
 =?utf-8?B?RGVSc0M4cnExeStYd092TTNRYi92THRNYWxQQXp1Rm1QS0V6WjFnOGNEZ2xI?=
 =?utf-8?B?YWV1aWdRY2Z2UDNVTmpnVlkydWNzSzlsY2dGR3FSVEIrc0QybGRLUlNjQmxa?=
 =?utf-8?B?TWRyVmZwdTMxTGZxR01ZSDIyV0NwNGRsT2s5MUg2M0lRV1pRUm11bUQzSXlE?=
 =?utf-8?B?OVl3RE9xUWx4dlRTb0dKNDduMlY5Ni9ic3o2NmtlaEhiYjRvTGpnSEdmZ3FR?=
 =?utf-8?B?RkhLOHRjMTI3N2tBb2tVelVJSVVJRllINHZCUm5oa2NwYWdpcTNFSk9jeXdR?=
 =?utf-8?B?TU1rY0JrMDZzaWZUd1k5Szh6dDVqNmc2WG5uVnZBc2pRZzlrYUxmK3lXL2FF?=
 =?utf-8?B?b1JoMTMvd0lLcGFYeWFTazl5ckt1VTFwNEZONW1xdTRUNjRZU29RZ3hmUXh1?=
 =?utf-8?B?dzFEUHUxSFk5WStweWwzejZHYlRDN2NsTjVuc1REam1rYkczMXRicCs3bGdi?=
 =?utf-8?B?SjZjT1FCSlQvNUFHSjlDUGVtYnZTU0crK3p6azRZNUNuR3JJVVFkNFROTWhT?=
 =?utf-8?B?RHNoOEtuRXRRbDVGWXRrQlgvYTB5ek4zYnNBSDg2b3p3V1JvNTc3b05TZXZm?=
 =?utf-8?B?dEtPcVZnRnJlclhLWXpGczZjWXZHeGlnOC9MTFh1SWhweXkyWkt3WnV5WnNZ?=
 =?utf-8?B?ZWp6OWV1NUVzRitqb3EramdSemFOTlZIb3VhTkZWZkJHcUJwN0R2alZ5Zk43?=
 =?utf-8?B?NGliNWVERmZGRU5RYUFiUEhhNlN1TUJsOHBLMy9DemdlU1lJb3V4RXBnVS9Z?=
 =?utf-8?B?YlFNUHB2V1FKaU5ncU5Nd1R6WnovMjE1Rkg4a1JpUmxXZUgzZHNYRUJWRllS?=
 =?utf-8?B?amJGTE5Cai9XbUIxeFZ3SWsxY0tna2NZcDlha2VNUHVkQ0VIdXg2aWg0QnBi?=
 =?utf-8?B?UDlJM0Ywa2xhelVpdTBpV2t3RGRyVlgyenNpTXUwL3d4VURWKyt3empXTUd5?=
 =?utf-8?B?VTRCZTV2OHJLa1pNNC9kdUxlN09lbyswMHN4ZGh6M0hSY2x0bnFRbHZmR1hR?=
 =?utf-8?B?TTYxS0hQa0hKcUVCRVl2T0REN3J3UWJQSE9QMHB2UkV2bGV5dHdaV3N0WXBV?=
 =?utf-8?B?Yk1rQWJ4Q2lBczFSb250NmhCVTFaZG16VjZObjFNbVMwMFA4TzZvOXA1Rm4y?=
 =?utf-8?B?MFFqVEhPR1h3OHhHUDNhWUhLM2VKTGR4Vi9icVU0Y0RoalZ5WlAybnJtbEM5?=
 =?utf-8?B?c2xFYkovcUF0RnduUVFCZFRpK2x4aERyN3ozZ2M1SWZzdnNLOFl0NTBqQlUv?=
 =?utf-8?B?OHNOd2ZhQVl5NnNtUG5zeUNudS8wUmtLTjErRkhwSnlpRnV4eHF1YS9wK1VC?=
 =?utf-8?B?d0t3RkVoSlVOcFNYeUFhSXNPREFpaEJrSjVtRVhNeVl0NXdNclZvSjU1bEsy?=
 =?utf-8?Q?ONVTWtwD52NT/omel6SffCr8Qt25wSbfvlMdP2F?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 05925235-1f6a-4ee5-6f87-08d98a407240
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2021 09:46:04.7876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V3/JalEAp5qlnP7cAdQP4Xo6jVXe90yPRebG6o9B5QZNHQ+OwZpXs6Z25LMYC8nZGK+pHFBSJdWtFi6b34M4dZK4HcnOSElCWfbhMZt4qwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3531
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_024614_467896_8E3F417F 
X-CRM114-Status: GOOD (  22.95  )
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

On 06 October 2021 12:36, Alexandre Ghiti wrote:

> > Thanks for the info. So we believe, based on the event registers values
> > provided, it is the RTC event as that's not cleared by a power-cycle (it's in
> > the always-on domain). The other test would be to mask this event
> immediately
> > after an RTC based reboot and see if the long key-press then shuts down the
> > device. I suspect it would in that case, as per you clearing the event.
> 
> Indeed if I mask the RTC alarm in IRQ_MASK_A, the intempestive reboot
> disappears. But that's not something we can do: the reset driver will
> actually be implemented in openSBI at some point where the devices are
> probed on-demand (the same applies to u-boot I think), so we cannot
> clear or mask anything at boot.
> 
> >
> > I'm still curious as to the 16 seconds though. Would that be when the kernel
> > finally starts and masks/clears events (seems quite a long time)?
> 
> No, the kernel is not up yet. Maybe 16sec is not the right value, I
> may have been influenced by the discussion here
> https://www.dialog-semiconductor.com/products/pmics?post_id=10052#tab-
> support_tab_content.
> 
> It seems there is some consensus about having this reset driver be a
> SiFive Unmatched board specific thing: quid of the sequence I propose
> in this patch then? It does not mess with the RTC registers, it
> reboots reliably and there's no intempestive reboot: is it dangerous
> to use? Or do you have another alternative?

Yes, a board specific implementation would be the way to go. We're just checking
through the sequence again to be absolutely sure of any pitfalls that may 
present themselves, and will get back to you when we have something more.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
