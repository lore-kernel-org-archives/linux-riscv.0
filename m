Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B64CFA44E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+qKqtSv5D7T5NFucC5ycYJtX+Xmxk1KA3LwthTq/oY4=; b=JCz7Je2HVrkCbE
	7jBsUeWGKg7m1uOuPPbUIJHJyV0K9pB7OnucprVrlzOaZw8FdEF6XrOadW/YxVziPbSK+VRiisiZf
	P8Ep3faqOGkf4VyHjdn7vD79Pm2wSbZGgP9SeIVKi2J8CViY9YUNqDqnAKXexzXckoWX8gvE8lFUW
	Oc21TPUtG82hji1gPnOBbQGtt1hCnDDX+pPB4/W3g2ALsqyvWmg3P5jdGoqe8ztfnjPBhSGEnTvAK
	E0LD/gCscYs80lEqQn0Hvr51pYXMq1ouRR/C1m/C2V4Z1r5nmgru3s9Uig4QEqxCa4+9LGE/KN9G6
	w/Q9gQG1Q3HmP36Ci9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3e7i-0000000F7vV-3ft6;
	Wed, 23 Oct 2024 16:22:14 +0000
Received: from mail-sh0chn02on20727.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::727] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szB7R-0000000FhGb-2Eu8
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 08:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvqtkIQFE4UStLBsBe9wWRbFw59536oc2NinFPTrHMY6r1quzKk/gjRidPabh7dYQ3OYG77PXsFbksNMTwTau4aV72kEU1tA6ydM3d0m0yFe/PVOgeKAF9k0mUJuquW6MVygyhOBAyg0bxn/wbQ9RTG4erg8x2t0LU9KXHjGPJKUFNLVeXMly+Sxu6KE08tZF7Ge0KzZVAHknCNOYnWOgxkLC1e5qastKuB9E0zFuAbCvm91NopXNy7bTFkbSHKG/nxTRDdq/DY679JoIIwihWIzzsgkDVcjCT0UiylG7rv4Sb6Reyge7N9MHjxDuj+FGisKuWtLagtMMqualhARlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bBDz0M+4RtTNxAMLjwKiPp4DBqGFuREPG4Q41VVVCk=;
 b=aRasW6lJG11x47wvSorDKXRu8YEeYuOvTVoS9ykijf6VoFGT64HWM5tO7aiiQlLhUzsRlDvXU2Wa40N3J+JBsWIFYzw6RSbmo81QsBuRjdlIucQ/UxMIOmd6AGGiscCQYQmw15DD8JBnSY4VPrB3qqMzk2uMku+ZtvWwcfs7OEkC6bzze0+s6zYYAbN4XF6U6NCdkj7pdKVQsVUhxJt0OF6orYqZu5KbgFFDpqDNsyK/VGUf1H/CTaYCPe9170rJe3VKdzbtVo5nJFfrTw10pveCj0e2uJll1wn52CqUy6RA4MpKaL/Mg2am7TproTObLn/Sm2UIT32mJIJp7yIwnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:10::10) by NT0PR01MB1325.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 08:19:17 +0000
Received: from NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
 ([fe80::f92e:ed2b:961a:ffca]) by
 NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn ([fe80::f92e:ed2b:961a:ffca%5])
 with mapi id 15.20.8048.017; Fri, 11 Oct 2024 08:19:17 +0000
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Alexandre Ghiti <alex@ghiti.fr>, Aurelien Jarno <aurelien@aurel32.net>,
	William Qiu <william.qiu@starfivetech.com>
CC: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, E
 Shattow <lucent@gmail.com>
Subject: RE: crypto: starfive: kernel oops when unloading jh7110_crypto module
 and loading it again
Thread-Index: AQHa9mUCPj6ctnsii0mHD65iohBobLI4y46QgDkk6QCAD4zAkA==
Date: Fri, 11 Oct 2024 08:19:17 +0000
Message-ID: <NT0PR01MB1182D96E1C65D6AFAA88D0758A792@NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: NT0PR01MB1182:EE_|NT0PR01MB1325:EE_
x-ms-office365-filtering-correlation-id: a5819504-5d67-4b60-7878-08dce9cd663e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|366016|41320700013|1800799024|38070700018;
x-microsoft-antispam-message-info: HXJ1GkTim/disqJjkrhCLML3fyS9UrS55jCRQ7NyjRxG+whT3QeXhMZpnAL6bOrxdtVc7pQXSTfC9zkC0yF7hixQvm0JUX+art4h9ubxh+kYD0Z3MCgjDwLBrI1lrnyWmbL1BN9mpXEm5hGl7dnhATDq+dZMDMpOOaEUE6o46hhtIaJEcva/pMqUvJ9HFrAdRNUlS1j3wQK/kIIB2LS2CLm0WLSnO+t8kOwDF46bBUd14zDGrUR4kWObyBLdqj3GE+MOoVBGl5u/4/YzQdGUZ7LVgVOQYqC8iTqRS6/YI7EApAKH8J+7u/eK6iOKALFZ/OLGACXvso+fst9p/eGH9+EOAhNr3Hq+KfzEuenBHrnto74xT4Nc7xpLoy0PlkAx6c54teEc0ohTYK1iO8176yKhPov9Fw+8OyojGGrWGzPLsHx4bfy5RztE6720bSxoO3aqUQkcBPV89UXSae5kwYksoMIvsIPYuzGKMSHGev8nxGbQgFHl0IBBm46zonBoRoCh/VvobugliHy5q8WjD6C8kiIEuXZWsJ2bKoRfca39ZHRyyhjTRx6zbMiyHJQOizNEj/oV5GftS61h6j1WNwkKd3/VDJ7SPLpiGJMqosl5PFdCIe6rDuAzEa97FX2o
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3UxdXk4Smp4Sm15enp3YUpYajIvTTErOEtETndDbTkzSWNIUlk4NkhWVy9E?=
 =?utf-8?B?djJ2VmkzeEp5SGcrd3FmSEEvVHB1TGJaMHhXSFBYSlZYZitEeTBRR0JnWVR2?=
 =?utf-8?B?aDdBUkxEWGN6RzFEbWI5alV5b3JyM1FyMUNuNk1tazB6dU9HbVpVYXNOZ3Fk?=
 =?utf-8?B?NUliMXFUK1l4dWd6T3pQSE1Ya3E4SXAvOTNuNkhxS090N3F1ZFhKbkh3SU52?=
 =?utf-8?B?Rk43K0VqZ3NncXdZTXFKR0lVRzFncmhaazgvK2VBdzgxaURrdFlqUGJtMUVn?=
 =?utf-8?B?blhIU21UOFdDQXk4ekU0aTdYV2JadE5yYUZScFBEZ3FyS0hBZkxwZlpaRnA1?=
 =?utf-8?B?WUR3dU1IYmxDWVNFdHhyL3djSHlTK0xRdUpuZzltRHpIODJncTZvSTArRWls?=
 =?utf-8?B?eXc4T0hLbHA3c0ZtQ3pOYWdaWTBlWmkydVlSSzZVK29EMm1ZZnhEazdYM0xB?=
 =?utf-8?B?eCt4QzhLdTVFN1BlRHJyaGIyMjlKSUtnVFlDamd3bGlTcjlKLy92U3VKNzhT?=
 =?utf-8?B?cGlyUjlWV2NQTzdlQzYzQTBNZVBRNmpBVG5nODI2THgzT09ISEpSeFBsYUh1?=
 =?utf-8?B?dDMvYnk4SGkxUHQwYmFlODdkekV1OUcvV0FTS2xVbStkSjYxK2FubUs0TlVI?=
 =?utf-8?B?N2hNUHl5U2hybS9ySWdDQ1FENEthODBBM010SVI5UStvR0ttbFJlZ1RRNE15?=
 =?utf-8?B?cHdFS3lTSDVsbWZCSllqOGpocGhSTmFQMDByMDUvbkp1Vnd1N0NvMTRSdHNO?=
 =?utf-8?B?cEt1cm5BL2J0YS9sdWFDaFdzSmorbXdYaDhLdXcybUc1N1pyTzdKUGhTcUFR?=
 =?utf-8?B?OWRXSjUzZHRONmVLa0srTkplYThhdjdhWSs3Vm5RaXVGRnV5SXRpZ1hEQkFD?=
 =?utf-8?B?TDQyQndidmE3Q1o4MlBUc0s3eFh1c3A4ZFN6Z3hjN3dnTU1FdFVLOE1BMkhn?=
 =?utf-8?B?V2lCaFUyWTNHZTBEczVDYzhPd2UzMmhwbkthSklnMUs5bURJcFVOSEhyQ1Nt?=
 =?utf-8?B?OXVOVjVPME9Pa1BGR3RndlRNbFJmSXNWN0g5R05DRnBEOUNscEtMSGZwQkJn?=
 =?utf-8?B?ZTdva3pvd1kwMjMwYXk1MG1WZjdkRWxWUGxoYjVWK21ZS2EvWm9iVnZScDJU?=
 =?utf-8?B?anNzRUNxTWxtREJuTHV0VHNKWXBGZW1sdTJYcVI5SW5nV3dzcFlaVGVMSWlw?=
 =?utf-8?B?YWNFQXdicHVWR1RVWTFMZElmVGtxTW1GMWxGQWdVR1RQbUJ3eHM4ZENxZ1dr?=
 =?utf-8?B?ZExwdGpmWUdLTXN0enlIRnM1MVZ0cDNFelUwNDg1a09YaWR1Q2FyRys4ZE54?=
 =?utf-8?B?WXJCY2Rhd0xCcHBic2JnQW1MeUpCUjVWcnRvaVdjSHNRWTFuUlNYbW1nVFc0?=
 =?utf-8?B?Qi9haHNtUkZWZW9sWmlhMEU2bjgrNGJ0NUI3eEgzWGJtM2JvRGRHWEFGb1g0?=
 =?utf-8?B?cU5WZHRPa0h6QUFVUkF0TjBIWVA3cTBTa0pCbWVxVDZ0cHc0M1czcmlDQ09F?=
 =?utf-8?B?c2pKWkk3Uk5TcHZJU1J3UW9NL2Y3QlhsUEhiZCtmQ1ZvRzdGWC9DNUhyK0c0?=
 =?utf-8?B?RFNvc3l1aEcwd1VSNjZiRkdnUXJLQm9nNmVTOWZCWWwrM0NKZjROMTJQZzlD?=
 =?utf-8?B?cHNHb2xYZlhOZmNsV0RFTk5sTmRLWEQ4RUdOWWZDaGdqODRrZENXNWNPWW9o?=
 =?utf-8?B?dWVCTFVQbkpkclZFSng2MFMvZGkyMnZJMFFONkltZDRHaEVpdGV3aFZDeXI5?=
 =?utf-8?B?OXd2ZE1JTWJYSmJXRVg5UVd3MFRtZlJ2TTUzS3BZeGNyYlgrd0xSWVRrdmNX?=
 =?utf-8?B?Y2FoODBCUk9MMXJKVWlDaEN2RXlaR2pncjVzMWVSZXBkL1RmZXJXSm94MHY3?=
 =?utf-8?B?MmpXanJRTytjdVpKc1NpZkhCeitvbVE5a1lIZFBsaGkzajRteFpob3Y5UTNP?=
 =?utf-8?B?Yi83bElSUi90VzVEcVhJakJCTGZmMzRCVHZDMTNra2lWa2RjKzJsMzlhMHR2?=
 =?utf-8?B?QnN5SGJuRzg3N2RrNUVRSmJlQXVGckkwblYwVFVBOFhmdzNhTVVTa1JrNVFV?=
 =?utf-8?B?VzFLVmRQZHZPdEpwSHQrbVRiZVoybmg0Uk01c1UwbUVpNmFpYmVXSEwxNm5T?=
 =?utf-8?Q?ySpeREzN1ltAER9uutrMxGd5A?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1182.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: a5819504-5d67-4b60-7878-08dce9cd663e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2024 08:19:17.2078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0x0RQGQnXDjD/CFe5ctkfiq9djrm8mrYeovzjH56HOtLnLrJMjaes6aZFUHltA/Z0jOufwhaV9wN9l9S3EEuGHYrzlRvzRmIDbFSPfDfO7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1325
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_013529_584236_C7434EE3 
X-CRM114-Status: GOOD (  11.53  )
X-Mailman-Approved-At: Wed, 23 Oct 2024 09:00:48 -0700
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

Hi Alex/Aurelian
> On 26/08/2024 04:04, JiaJie Ho wrote:
> >> I have been testing the jh7110_crypto module on a VisionFive 1.2a
> >> board, running a 6.11-rc4 kernel. To benchmark the crypto with and
> >> without acceleration, I have unloaded the module, and later on I loaded it
> again.
> >> Unloading it works fine, but when loading it again, I get the
> >> following kernel
> >> oops:
> >>
> > Hi, I'll investigate it. Thanks for reporting this.
> 
> 
> Did you have time to look into this?
> 

The AES ccm mode will intermittently produce a wrong tag for non-blocksize
aligned plaintext after few thousand ops. 
I'll verify this with the hardware team and submit a patch to disable ccm.
Please do not use ccm for now.

Thanks again for discovering this and sorry for the late response.

Best regards,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
