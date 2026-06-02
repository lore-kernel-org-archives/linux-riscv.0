Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629F7CD6E60
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 13:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+peWR9mlSXLpmWrOqjopU07pCJ2vbKrekeeg8JIji3k=; b=katy/TjseYnNHK
	ABkx6/Cj/5vKzjxyp95LQZqcmgAK6tT0WdTinXRRDhn+3I4ODi60wiY5KVs9VsYwuNXuSu0o4/KHq
	jswRCKGe/fw6n6VHC4Y3ZZKvTYafIMgg5wExzPIsXALyJYL0c+WW+/VS2bBOt1cmBJxubWhphhj3H
	AeDwQ3I9/PzSvaNdJHCdJ6U6S81fzxA2e+zY1GXiEi3dmdL27yKeEacVK2wUuXzhaSBF1abZt3WRC
	hCT59dqREdUvegeYzdjkIBCzo2u8CLbQ5bR/UUeAkTWahWOTN6NRMmIe+csarbFGMazfiwFT1fBbk
	h2/O3vBOEVWJ16kSnNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOwd-0000000D3Zk-11Nl;
	Tue, 02 Jun 2026 13:14:11 +0000
Received: from mail-westus3azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c107::3] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOwa-0000000D3ZL-17bg
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 13:14:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXOVbDt4rZTdH7Et9xN8RAoP1HAXIa43LVIJZGns0YCfGR46EZh5V8p1d/+539uAubqhBh58Gj8PsJ3KM3hYtHfg+IgIwmLowcX4Ygl276/v95VWwJGGgmYm/VScUgWmRN3LGw64y66B1Ak114JWqYIiNBOA8K/EYgvUWkcSmoBeCAYiM5bNyy9Byy1eovFBYE+jCXeEnKTwI5qp5pgcjXqnkuelKMK1ZnEwN/VHTVgN0O5P2BjwiTDLSXvLL8G8zaU5jWBK1VCqBaiUaj5807QP/O4vDN9h/ZiucbWByanho6CKJtndVZoaUQqj2ZK6rd9phfwqSsh42afd9yTCJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EA76C5KYieIJ6SkXAZzpiVgOKIM5nr79cwPlHjpGcM=;
 b=dqpEXXZoUXELt+EXDovoTNyTduJrwOZ+y4VufV+n9BvsLaCoH7vbFwgsgmr04FdwKJGs4H6y17agXLBQqwLt03xLc6BwMl3sMmokjafMZawxEEW/BklUhDcFEhqm41RP2twvA37AePMHOOZiiNLyKUjsaf3X78Mdf8PG8/sIo3FuwD0tt8lPJzMUnYU2pPVe2rtCMnCGJYrkiQwXV7fuaqHm3hOMbNjgNBUEMS2vUMke3mV12/Ff4FEs/4IUv+xO2GrD0uFavMZQIi2/9V0jehJ5lJxY6BTzcNGojX2SSxKtOG/k7trrurGHvkM0/tp4mDyls3eEq35WlGDBJtBytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6EA76C5KYieIJ6SkXAZzpiVgOKIM5nr79cwPlHjpGcM=;
 b=AxQJ/7dNCdM+ocSucK637ypSPgCGqNAQLs5Kh8YJ2GNLEJHIS2lS+Sjg7FL18ZLypyHAPgO9xbUqC36qYNjvNiPbtXG5avF6eiUDcq9dYsiED64ZucoU5xeNUCEHYuoNA7uU9y1jfOgjgnu0J9Ovp1yWGWW3AEKKd7TJkfAcMbC9BDazIPd6QJl5VR+8j0OQPMG68jBkDU6zk9hrU0W8okE0ekpnvsxhgkIxGm7+MaHWYDsQdkIyU3TGKBwuX9/LXw0OKkS0gZ9cM2N4luwc8WGvz0J4vRR1RqthYa88lLkkvgRbgxE3xTFo968deOeFHw+oNNgdeHAS42RncC4KNA==
Received: from DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19)
 by PHXPR11MB9664.namprd11.prod.outlook.com (2603:10b6:510:3cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 13:14:02 +0000
Received: from DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::16c9:73db:2df7:cb9d]) by DS0PR11MB8739.namprd11.prod.outlook.com
 ([fe80::16c9:73db:2df7:cb9d%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 13:14:02 +0000
From: <Valentina.FernandezAlanis@microchip.com>
To: <conor@kernel.org>, <linux-riscv@lists.infradead.org>
CC: <Conor.Dooley@microchip.com>, <stable@vger.kernel.org>,
	<Daire.McNamara@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<Valentina.FernandezAlanis@microchip.com>
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Thread-Topic: [PATCH v1] rtc: mpfs: fix counter upload completion condition
Thread-Index: AQHc4wHZsdW2vX0SwUuStMWJgxUlwLYrYgAA
Date: Tue, 2 Jun 2026 13:14:02 +0000
Message-ID: <fa8c35eb-7572-4413-867d-db42df92790f@microchip.com>
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
In-Reply-To: <20260513-panhandle-ashy-70c6abf84d59@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8739:EE_|PHXPR11MB9664:EE_
x-ms-office365-filtering-correlation-id: 020bf556-a0ac-4039-c79d-08dec0a8d0f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099006|11063799006;
x-microsoft-antispam-message-info: P3bCjDGuBIcujfyE41Oz4pQDW4Q2pz4m4AdKUG6NLJ+gujAfvCGwlExEeMezZPuw/vfhxZwHYqlOYhCeNDbqdn2uezHYU1rm3xO61goWZSHwLoYBR91x+jIUoDrJKobLihBwG2ZAtV9j/jIUH9xMjOeuge54upsAY7pt0SI6lWYYb67MM7gM+KEynYT4rTMA62vOekQLQPcsoA3hXqseGAL7uetlE1zeP7X5KUrg3mtajSe7vAQDDflv8I/8C7jZWMdvjjVQputLFkAw0oEA+JvNyAPu+OmwyDEbxWpoJypJp7LF8M4EObBKUdycm+XuBzJLXPdpPFRoOy4h+Rrk6vG7t3FNON3IjdbArqHoLb8u9fnD1502dOwVxAMpLlgRvskP3evCAVZt8gcdsV9W+O8CiDCcyhLHS4KmAkigYKIlx5+Pjig4KvFI91lHH8O40NlkCYf9e2VPqX94T+JDWy3Oxcco4V0yr8u89rjDAzczhUct+IgCj4fZMEFmLaZvr5GALXaEEwiXmMO1ovGBNNGGTEG0PDDzYxY/Db1+qw2YWFU4WQB7eszMibHOYJFsP4YbKCk16vwGiLR1Yiu2+ai7x6WRa25joKuRAO7fb8MiF1YzRGthe6/rG0P37rtjJRXNbonrYoyjICUKr5LeVmPG0EIoTZb5V+J+8Z2iFfQny3ZOvgRq21URCG5IIdTWRXFEIWnjpN9w49SNtR8UPAvOc0CmeADS42tzXFLCbVPHk5UfPLRN1wr4WQbT7FjU
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB8739.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NDlmOURoQnB0WDdNUnJUNThrNTV2V3hkSU04bWQwMG56dEx0NlRqMUpLMWUw?=
 =?utf-8?B?bTBkZkN3NDdBNnlHV2pXSHRZc2lmYTNQVkRLSzRzeDFGN3pyWXhCdDV3RGJB?=
 =?utf-8?B?UGs4bERxeDhSZUdHVmVpZ2YrQU1FTGJjZXZVaExGV0pvcjM1bFJNQitqaUpY?=
 =?utf-8?B?eXIrNzRjb1RlVit5WFd5WFJCeUtsNWhZY1RNLzhDS1llbXR3ekR5c25rY0NN?=
 =?utf-8?B?UzNqeCtlNTBha0FCZUhGN1c0Y2NFUllqSGppbTAybCtvcDVRODNpVmkybFI3?=
 =?utf-8?B?YWZyOGs0MXZZem1UM3k3MnNybW0xaWIyNzZBSENFdEJXSld0RmtSd0Fsc3No?=
 =?utf-8?B?dmpiQmtWZFczbWFJR3dTcnF2UDNTQjJuZ01pczg5QUVXaEVSTHhqUWVPeUFw?=
 =?utf-8?B?U3VtVUtXR3Jqek5tbEdXUEJKdlJobmUwWEdRSmpSbWpVa0Q3akppbXdVbFg4?=
 =?utf-8?B?ck9zekVYMnlidmpkNy9Ed2crbE9KTjJvRjY2VEJvWWorU0dlMEhvanpnV05H?=
 =?utf-8?B?dHM2L3dlWFRGVGo5bWRPOS9MODlJOVo4UVRZakMrVmlpeThQRm9Dc2Z2elpu?=
 =?utf-8?B?c0Z3NFIwRkRNSTNSSmRiYTY1RmlOMmFtRWY5Um1mRjlZQVl6cXFoZkk0eXFW?=
 =?utf-8?B?TGRWSkdxbmduS2ZuQXhzYm54cjNLdUtqOERZSnZ4MEVvTGtaMlFxT3VQc2JE?=
 =?utf-8?B?V0RvTEV5bExRSXlkbk0rUDZxQjBuWFMwb2pvRmEzb2tFTHk0ZUdZdk13bnFK?=
 =?utf-8?B?bU53YWJBOUZBVU9FNlpCdlphazhXc3EwbE1oODFQWS9vT3lnMXN2MkJVaFps?=
 =?utf-8?B?ZFlONmhwdDdXWHI3cVpjc1YxS3JYRGhCK3pTNVd0ZTBjQlJvQm9aRkJUQnk5?=
 =?utf-8?B?bk9GQU8xYXlQTnorcTB4ZFRORHpxTlZnRE0yOFBlZHg4RmdDMlRqZFJZMHV4?=
 =?utf-8?B?MTNuTWc4UlVDc2dZbk9kdXk1K2JIZlg0cVQrMXFmWUlkbncyRzBFYmF0a21T?=
 =?utf-8?B?SGtlWi8ycVMwSlArZnUvQVpST25kODNXS29RV1pXa0VxQ1Y2SnF2WFlDUThj?=
 =?utf-8?B?eEJ5VDQ2eUZBc2N5bGxYL3FsTVFSUHV0cndCcDQvZC9pbTFjSFB4dHRFWmxo?=
 =?utf-8?B?ZitTWHhoUEpubSsyaUJtT21QdEhoekk2RFBFdHV5bWdwY29MOCtZVG5IaGRV?=
 =?utf-8?B?S3JVNEEvM0pkV3FMVllCOUlpQXBkQS9Hb01BUjR6ZmNaeFBBdEpZbGVLejQx?=
 =?utf-8?B?S0wzS0dURjgxMmk0dHVqRkNtNU1JQ1ZBdlpYaUVFN2JnZTBFSzVUbCtsQkV1?=
 =?utf-8?B?MGZXOEZhR3phRjhPOElzMkVWaGEvQmRBZGo0cEdCOVlub1lpRTgzTy8weXVU?=
 =?utf-8?B?N2hEdDZWSEVPNlFrV1FiUElpaTBHS3JJQWZsbEs0ekFRelY4RE9IN0JkdXp5?=
 =?utf-8?B?NmkrVmJUQ0xjSkxxUWd0YmIyODhVaU1QWXRyQ1NNTk15TW9QaXJHUkh2MG5B?=
 =?utf-8?B?V0t5MEtuQUdpTDVBaG80OXZSK3huWHdRNnZvaG5mTXpKdExnRUJ0aGdZT25I?=
 =?utf-8?B?VXA3UU1ZZ1R0R0M2S3p6Um5nYzZJVDN6U2xDUzhEZUhwUWNyZ3dtQUhqMUJn?=
 =?utf-8?B?amVGMHhXS29tZFVpTWkrdmU3TWV6MnAxTUdSZXdlYjk4bEhBbW9JVFFSRG1r?=
 =?utf-8?B?TWRqQ1Y4TWQ2ZThqM21LSXJXcm5XemdCME1ibGw1WjdUTXFnY2Z3Q3NnRVRh?=
 =?utf-8?B?UEdzaStIRDZLOTFKRjExR0xTRERKbCtpdHB0WStoUFJZR0VMNS90ZXQ2clZP?=
 =?utf-8?B?d2EyVlZDRDgxQVZYWDBQVzNuRVpPWE9wdHJ3Lzd1Mk1IcXZadnIvTzAvNGdi?=
 =?utf-8?B?ejI5SkF6dmFNanl5Nk5jZ1h0MTZKSFFKUnh4cGQzZmc0eVpPZUtIUFAyK2FL?=
 =?utf-8?B?a2x3MnMrVG9PQnhzRnVoTFB1NWRvZFhVRWxRV1g0OFFubVgwbVRwR213QjdF?=
 =?utf-8?B?MzA1d3MyNEk4UWJNWGVhS0tkSFdvWWVCdE52Y0NoU1M4RjBIUjlzZkVoc244?=
 =?utf-8?B?SDlEc2pTanZYTmV5cGlHSnZPZnFhcGFCQ2VXL1B1ZytQek9VZm1KTUExUnRy?=
 =?utf-8?B?RHR2R01CUFdqRGVzVFdpMUQ5ZGZxdlBWMkFENTk5cUp6NkZtMHcvY2NobzZl?=
 =?utf-8?B?WU04QWVxcHBGa2J4MCtaWE1uYkRsRlg2Q1p6cXlidSs2RGhVcCt3SzJDVWdh?=
 =?utf-8?B?QjRYeDd4UmowOXNYMDFZdkt2SEVneHgzbnB2eXZhZEFJTzNKRVhqT0ZvMWw5?=
 =?utf-8?B?Y1JxOWlXRDFKMGxVd2pYaHNwSzhtem94M3Q1cE5uZWo4bjArSEFmKzBudGJt?=
 =?utf-8?Q?OlN72akSqFxg63V3wiDfFyaf3CYvbAQnBa11Q?=
Content-ID: <9601449ABA6B554F8EED6A916DA7B3EC@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8739.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 020bf556-a0ac-4039-c79d-08dec0a8d0f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 13:14:02.5334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8zcbx74NI80djYa6F7n3pknoeKKW9VtIsm2NDw6HVetjZJKRnaMBDmP3AxtoZPMr2gVWVENegMblTjHxJEp/zGIfflGwGXVCfOgCslRyEnksxh47uRGixFYxLnCYW2sA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PHXPR11MB9664
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_061408_410571_776A3D86 
X-CRM114-Status: GOOD (  23.15  )
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

On 13/05/2026 18:55, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The condition that needs to be checked for upload completion is the
> UPLOAD bit in the completion register going low. The original iterations
> of this driver used a do-while and this was converted to a
> read_poll_timeout() during upstreaming without the condition being
> inverted as it should have been.
>
> I suspect that this went unnoticed until now because a) the first read
> was done when the bit was still set, immediately completing the
> read_poll_timeout() and b) because the RTC doesn't hold time when power
> is removed from the SoC reducing its utility (I for one keep it
> disabled). If my first suspicion was true when the driver was
> upstreamed, it's not true any longer though, hence the detection of the
> problem.
>
> Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Tested-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
> ---
> CC: Valentina.FernandezAlanis@microchip.com
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
> CC: linux-riscv@lists.infradead.org
> CC: linux-rtc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   drivers/rtc/rtc-mpfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index 6aa3eae575d2a..ece6de4a6adbd 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -112,7 +112,7 @@ static int mpfs_rtc_settime(struct device *dev, struct rtc_time *tm)
>   	ctrl |= CONTROL_UPLOAD_BIT;
>   	writel(ctrl, rtcdev->base + CONTROL_REG);
>   
> -	ret = read_poll_timeout(readl, prog, prog & CONTROL_UPLOAD_BIT, 0, UPLOAD_TIMEOUT_US,
> +	ret = read_poll_timeout(readl, prog, !(prog & CONTROL_UPLOAD_BIT), 0, UPLOAD_TIMEOUT_US,
>   				false, rtcdev->base + CONTROL_REG);
>   	if (ret) {
>   		dev_err(dev, "timed out uploading time to rtc");


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
