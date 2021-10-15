Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EC9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 09:12:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB0AB60551
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 09:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB0AB60551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=diasemi.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VqzgpZHFP4Uv5lovhZLNk7NL4KV++NZglHEK7k6jfU=; b=2Z27YM39u0xFtI
	X3pe+UhbeSosX8+tGh1yKLY2QaQH/+dx28VnMlC1QkYR7ex8qx5IrmqKzjLQlEOrwNd7jLCbd2mfs
	O5+W2J96F3kPvsRxHmhkqc3WW0KNQe4N6dUy1jHtsYTjd13iegalbpK93rNzrtHDAiLHwd3X5jU7N
	tMmf3h3HVa4t8blxv0KDX6M4ANS/WpMIbmuyPXyhpKBA5WMPfnhuYd0NYfmPK4NUz1zN95zOkFNm9
	gOUW5Aqm/cIZaimWI5KHkVKBsufjY0EhG8pwydI5gzCk/BopBi2xS3nA0E9BN/ijICZoWlvO6jWap
	TGLZj3HL13sRvzDDJK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbJFs-006Bdb-Gc; Fri, 15 Oct 2021 09:11:56 +0000
Received: from mail-eopbgr20069.outbound.protection.outlook.com ([40.107.2.69]
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbIsK-0064x2-Ec
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 08:47:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb9KxA/6sAcTnZ44XeyU6JhZe3Sw4Ho6FblqFprs1zEy0usdTWxEyojTk5gV0U0ixvJgDYNMZGyqtT4Yw5gr9jTz5xj+cmX5v/NO/oabMM1+Zyi3A+p8Azs/AZhUrsuo5ternietD5xvZBJIhye/jsQqrM0661EWHWPRNOUY2ZTSzYexO1g4DTGq4tF1ku2s3NciGqvW3+Ibnw+fBGXTD1Pf+CeO0L3OU1feUL/E2xmBPFR5745gXQGiv8f2bPGakMQiK9nvoEDbMSvcfRQxclif587lFhtHIOoY6J5HF4wEiYx7fAm51yMtLE7uBlVfXb9jNUr1H9JGD19Yl1h0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luH7z2MDHaNDlWGGQ6boU13wXTmrqrglc6v51zLUuH0=;
 b=H5seEgpKhav+MKtElMqwC0Tx/FIHDm6msyN5q1V5UMkZRzWiVJwNV1hdZ/uwQ45tSPasOB+rKyUaW730po4yPIf/RBBNsu14Iil2WKpa1iS/ih9JLi4vB04NgCo41HIFfZv9YA4owZPx46C9waV/GZOXTA7u/gUxBcqwu4MhULfhfyBHJRvhpImcgFsEUcDqLmQpWyuIXlpvdc3wUKe9pvSdfDjyNE3Zh6ZPuUjVLp9mvJawXVYETx+GcoqLPMFbbjOw8CJgDrNFSWn34vO/l/UL1JmhpgldXsShEqDCqWPz4r3g305FZDyArcIJ21WG9Gbdq5tObf2wP/9NPgBvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luH7z2MDHaNDlWGGQ6boU13wXTmrqrglc6v51zLUuH0=;
 b=LApS8X0veGQZx01hMa+eEX5GPc4x+7sGPHZRA6yt4gAo5l+TCK3zuAqaCqw1XL3YWIJQP5vW0HmLhPV4sQUOmnIAIvSliSQuO2zgeMeu7uIVpK7JfRtg4PMAlyb401BiXZ/FLLDrjTPHOfnw6xn1wrxFAi7rpFl8tR3WnmZasco=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:46::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 08:47:28 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dc0f:9e52:6dbb:1144%6]) with mapi id 15.20.4587.026; Fri, 15 Oct 2021
 08:47:28 +0000
From: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>, Adam Thomson
 <Adam.Thomson.Opensource@diasemi.com>
CC: David Abdurachmanov <david.abdurachmanov@gmail.com>, Support Opensource
 <Support.Opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Topic: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
Thread-Index: AQHXrqpI0LoFC+MHc0+B+6k9QHIUIauzTVswgAAUm4CAB616wIABMx0AgAArEQCABmU8AIAAMeyAgAF704CAAUpnYIAAJDmAgAMFyyCABlaakIADfbkAgAEXzpA=
Date: Fri, 15 Oct 2021 08:47:27 +0000
Message-ID: <DB9PR10MB46526487C9F2B3C10027039A80B99@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
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
 <DB9PR10MB46525FC6EAF1610178A20B7580B69@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
 <CA+zEjCsFif-pT6aW-XwYiSuLsSbBTWVxme6S2rdSN0oQETnZiA@mail.gmail.com>
In-Reply-To: <CA+zEjCsFif-pT6aW-XwYiSuLsSbBTWVxme6S2rdSN0oQETnZiA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5b1554e2-0c84-48d4-ded7-08d98fb86b00
x-ms-traffictypediagnostic: DB7PR10MB2249:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR10MB2249D58802E76ACDD57BC657A7B99@DB7PR10MB2249.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UMMXqRZzIPalrShyggK+jGaIcJY1pZZO3DwEu7fxa9dNSt1U5t3zryOFNZAAGTMxIxP3Kvx8a9PBlt1KXnlSeXRRVmAXxG/CrOS6wPKRrmH3OU/zno9ORrlcI/IBwzjDFlw3jxqR3Xisb78dN65FNQz2e/pKxRniqQzBRuKJI64ZFs5BsKWPrf9Ew46+z1UOlkWU7SQSJx3e1K2FzkmFRnUvnZPWqY48o5kbstm/139pK2AB0W+urxr96RBlRjSOFZ/T+HM0anjkwkDRAtjbMgeWVOrM1Sz+aLB/YguiKG7CqkEs7NrS5aHCVqzW/QY3HObnVabO42urRhIPYu/BW2BDk7VJrWEHE4JCrNG2rjJNbovrPsFjV4aOiQjHsFwttgq5QL8ocoRrCKNckDL+9SZUbVNBqF05Lguh7VQ3rjelDWm4E1fVTGoITpC37K/dK6jHUO1zrVjtJjBLkYN5gwx3nujNt2G24qyRuLTF0WTP9W+/02NGNw7KLVNaawuXg1L4iK/RFLU+a3LDYRCaxh93cLy4Lc1jQeekRjCuHW06VF8yOu6mWEUC1JcxYESm9au0aaIcxviDYTdTNGhJTgtamNds4/kqd72Mnt9GsB59EeEcGDQ4k0coXJmK4zDjg5eVFiZSS636BjpVDgIepSxY6f97eUB1hETlS2ziUdVVLgcrEH6+ZCymDg1UcDoJlVof6A/SPBtmNK/qXVmRMQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(4326008)(6506007)(53546011)(76116006)(55016002)(71200400001)(8936002)(52536014)(55236004)(5660300002)(508600001)(2906002)(316002)(66476007)(66446008)(8676002)(64756008)(66556008)(66946007)(26005)(86362001)(33656002)(54906003)(110136005)(83380400001)(122000001)(38100700002)(7696005)(186003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGFwR0VtZ1JMSnZUSDhNcEtTRFhpWFlOUFRuY3E1Z0NHT2h6dWZGVFZkYVdD?=
 =?utf-8?B?MEtpN1dKeDVtQVltZE4wRFpOUEMrMzBrbW5JcnlEMlJuMnJtTlVMQ1NVTEVX?=
 =?utf-8?B?MFJQT2tPMGNFOXp1aFJkcmI1VWdyb1V2QklNQVl0N3RTNW9ETmtlU0NyVXU2?=
 =?utf-8?B?VUtwaXBTSkhiT01BYTNkMjlmcXZnOFNOVnpETTA1KzRYei9mSDJ1azFtSlNP?=
 =?utf-8?B?TkwvNmNnSU0rMVJHaWcyVlhmY0Jhbmx4VHUrRjBKQ2pVblY1Szcwc3AwS3hQ?=
 =?utf-8?B?alRYQzZLa2t3bUJvaCtVbHhCRHZnZUh3WHBZNzRpdU5HelVwdUpDazBjaW00?=
 =?utf-8?B?RFhhb2tHTE9OK0FiaUdDT01XTlg5dGZjcDZwVFdGL05wbnlRbmozVjVnbVRY?=
 =?utf-8?B?MitGSzAxeEo0VG1CNEEwZVFyb1VyaVExSmJ0YzJidEtHc1ZNR3A2VmRsU3hW?=
 =?utf-8?B?K1hndUxncW93TGJXUjVNVGtQM1pvTUxnMDBaT0VreGp2L0tsVDlMWEdNbWMy?=
 =?utf-8?B?MnJsWXRRd3MrdityYVIxQW1KOTE1b1NYc0UyNE9ZRk94M3F2VnNBZUtLZEZX?=
 =?utf-8?B?SDFtRjl5Y1doK0tRM0dRcEk1OW9DTmphWVd3dENHRDJjQ3UvVTBNcjJkWm9S?=
 =?utf-8?B?aDF1RWpITDhUWVBOeGZiY2t1YVhHdFNGeHhhb2lHTUFWYVdtRXJrb3F0NVJ1?=
 =?utf-8?B?VjVRZVFVT01yejF3YlgvVlVJTmNZOC9LRFlqSURKNTJiWjYzbTg2R3o2OWU2?=
 =?utf-8?B?ZVJ5SDZOQ0hFU3p1c3ptQ2M1MFBIcTV0eld2NWFwdmV4NFJHRlFDUnJhQlky?=
 =?utf-8?B?ZXUrTFNYSituZVBtQ2J2MFlDbW9yMi9OOURoYlBOalVvZTh0RXFsbEh1WGt0?=
 =?utf-8?B?NStNMnpHdWhzTjBPNEVVMXk0aEJGLzdUU1JvTWV6WGJKekVYekpLdXpZRlBz?=
 =?utf-8?B?VU00QXAzNCtmQkdDT2h0R3ZjQkFyN09JV3JBQnZPWUNGemJMcEpTdWNPZGVu?=
 =?utf-8?B?bkRxOWdMN3pFRzMzQjB1VXJuVVBCVkVaNmhTbFVWK3ZoQU8rQ1JQT2MxYjZ0?=
 =?utf-8?B?WHR2YTIxNVg5aklmTmIzRmF3STFPOUxDNHhpcVRKaTBDVmFHMDVjb1NDeGFt?=
 =?utf-8?B?VDgyaEkyQUVpbGMzMU4wS0txQXNoUTdQdEJQaUVVczFBZHVnRVlPc0h6WDM1?=
 =?utf-8?B?Tklubi91U2VSQUlqZzZ2QTk0SU5VSFNob0tjNmR3SG9Od2VNMWdkNHptRXkv?=
 =?utf-8?B?dDk3NlhwWU9kNU5tVkVOT3JUVm9oanNMbWlRQmhTTnRQdFNrNWhNN2NFUGpw?=
 =?utf-8?B?ODNwaU5tNHVpcmNNSndVYXQ1blV6YzF4TGxUQWRDSDFFL1lhWG1xUmxNdUZX?=
 =?utf-8?B?TFhhNnh4MGk2YW9sc214Y3Z0MGJXaU1QNGhSdm1LTlEvQlJpYlJZTytDdStn?=
 =?utf-8?B?b0R1aHZBYnBlWTdEZkRQQlFPbkZ6NHRYbHJEeUU2ZjhhVkRSRlF3c1NwMHc5?=
 =?utf-8?B?RGJsblNqbkRZVm1DODJZNHVZSllkSElyeG9JdlYxZEgrVDJ0NU5tRXZWYnNh?=
 =?utf-8?B?RnI1RS9mOGZBa3FHRGdUYnhvS0dKQnBlcDZ6OU5DN0hjS2xkZElTaGl6M1Q3?=
 =?utf-8?B?andiMUtGTW45MGxVUlNBSFJXR0JrRXFiRGVUTS81QzVwZFRLbE1CeFhyaDMy?=
 =?utf-8?B?bm9XcVdWdDUrUGJ6UlBNTDM2bXNJM2hJM0RNMHAvU3FxU1MwUzFLVGpBMjFD?=
 =?utf-8?Q?mYWQjWIImnC+9SOrLrRb3DwN8+43YPbDRkBx4/L?=
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1554e2-0c84-48d4-ded7-08d98fb86b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 08:47:27.9956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xiq5gQCn7cUUmhgPue5yEs+9x8Oe1HfuFyj3UsYgID7JKYyGX/FFB8XH2NFxjSxkXL2S82oR3r36j3yq09raxOLIyjNN0LQhGvbHwpORraA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR10MB2249
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_014736_543118_11182B35 
X-CRM114-Status: GOOD (  30.72  )
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

On 14 October 2021 16:51, Alexandre Ghiti wrote:

> > So having examined your sequence again it's now clearer as to what is
> happening.
> > With the sequence you provided this is only a partial reset whereby all of the
> > output rails are sequenced down then up again and restored to OTP voltages.
> > However the remainder of the chip settings aren't reset as this isn't a true
> > reset of the device going through full reload from OTP, so for example settings
> > of regulator mode GPIO states, or IRQ mask bits would persist on the restart,
> > which could have implications on system operation.
> 
> Ok, it's not perfect but I think those are settings that will get
> reinitialized by the corresponding drivers while booting, contrary to
> the RTC registers which are clobbered by the other method.

Well I guess that depends on which DA9063 drivers are being loaded and what is
populated in DT. This is something you'll need to consider now and with future
updates around this board to make sure nothing untoward is happening as a side
effect.

> 
> >
> > In addition the only bits of interest for you should be:
> >
> >  - CONTROL_F (0x13)
> >         WAKE_UP (BIT 2) = 1
> >  - CONTROL_A (0x0E)
> >         SYSTEM_EN (BIT 0) = 0
> >
> > Setting those two bits should be enough to trigger the partial reset sequence.
> > The other bits you had in your sequence don't seem to be necessary or
> relevant.
> >
> > One final caveat to this approach is that there is a 16s internal timer (as you
> > noted before, VDD_START) which is started when the device moves to ACTIVE
> mode.
> > When that 16s timer expires the device will clear the WAKE_UP bit
> automatically.
> > This means there's the outside chance that you could try the reset command
> > sequence above around the same time, and that could mean you set the
> WAKE_UP
> > bit, but it's immediately cleared again by this timer expiry before the
> > SYSTEM_EN bit is set low. In that case there would be a need for an external
> > event (e.g. ONKEY) to kick the system to start again.
> 
> Ok, the risk exists but the window is quite small.
> 
> After all, the solution I first proposed is not perfect, but now we
> know why it works and IMO it has less drawbacks than using the RTC
> registers, so I think we should go for this solution. I'll see if I
> can help Nikita implement this directly in openSBI.

Personally, if it was possible I think the RTC approach would be best as it's a
full reset and to me is far safer with regards to potential side effects, but as
that's not on the table then this seems the only other approach in your case.

> @Adam Thomson I had migrated the DA9063 device tree bindings to yaml,
> I'll push that soon. Thanks for all your help, much appreciated.

No problem and thanks for making that update. I'll take a look when the
changes are available.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
