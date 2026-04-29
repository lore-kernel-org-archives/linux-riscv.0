Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5048CCCFA13
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 15:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owNBLM5csRVcxLMMsPwsfRkUn9bD1tfUPWJCLflzUc0=; b=n7ZSgN0CdJDQoE
	4wy/il9lFeWGJ2jVvBCokBK5gr1874FYBvupQuVScENRLLdERf5Tksne7F6Lvo1LLkMe9yj6OtDR7
	lgbSEpqkgy0R+WtWFJluU49T7q2cAX622WiGVLW08xBJftQYZ/qwuE+GUguayJLerEzeGjGEQawwH
	cq37mKq8Aa9JAH+SVdxqmM34q+zMM1CStqrlydns0rNP9jb0Hl5NFOxDK6wmRQe03UQmTzoWSb2Oa
	GOoiQA9/63+jqhHDkYItnSF1I2NgRSFZ1tULtbHh4UFcYbLs/yDHqMES/IdB9yYgzkquhSvGOplcU
	A1a2zDjGm4SAChI0VtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6bJ-00000003p0D-2bh1;
	Wed, 29 Apr 2026 15:13:21 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI6bH-00000003ozq-1JZV
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 15:13:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpRKKveI7f8BqJc01YInDQWWGqtUQg2I8xyTTQDSOynHjrySpEemBZkHLTPi2INjxk0fDpul1OzipjxRnT7N5FlH47yI3trkEvV0xXjwcjgTapvw7DTYUFKJR2PbVLVC53vkSH7c1gd6BtBsFyCNI9nBDN/alc6jmLAfCS636mHJTWbzMR9IHm1uJvyITXc0ALUbUXet29mQCiMkFBSeBnsJqJV4tqs15omXkUPAQ5G33ZPI0V6uBb15Ucl9YaWm0Lf0s1Awp9/GrtOUECNXws4SDwGgkuTaj+J28KmtPydW1yCARj7nCLFgayPYKZndT/US3n+MfuoEnHpVD9DHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELsEZ5Ux6LSBUrlYJy2S76dl85g5PtkshbFwhjUdUtU=;
 b=yoTHoMtxFx++4SoEUnFMr5qqLl8Qk0vxqlgMDTZWu+Xz1NUcUQyQJNEv88J7imq94AI7EKV24eHLr0+pdL285WkJzryfPy6EtBGzH9oPjPq18tBPQz/oYWmuylcEYddDEBEDGRHj9KZD69YzT+OvYuxiejTfRKs+evTmRKt1EwEovylePJC8eZJEVIEM1qbHjgP/AhEvOqYhoEgav+N1Wno0QIUZBJ10CB8RqcGiiHkrXbqmpFvBi3IjJDrHozB3Qbr6yGlwSPiNMva/8ZyQG3si996rVLbQSrpVuePinLeejAgdXO4rWrBh3APsjiFfBwc7BT4ztaqp1INZYMZztQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=htecgroup.com; dmarc=pass action=none
 header.from=htecgroup.com; dkim=pass header.d=htecgroup.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=htecgroup.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELsEZ5Ux6LSBUrlYJy2S76dl85g5PtkshbFwhjUdUtU=;
 b=gqr6L89jw046ntu5pFwRDfKAbLfN9BscESv1rPjefaKQUTMBeXiIunSq0ejc01YZl0MS3EhEzwwaEsHHeFpbsV4CbptWSd0gM+uCbxqPkr/SBXZjyvztfHMMDSTTmuF/KQ5CBzf+4kLvTd+lfmRH5VpdKw3VcVBw2YjTh6vh1ECRI6K+aFsN/aOLaZdjamQeoarhD+9EtiINUjifq2LudvOLJkDxpV81BcozPh82tq2Arn8rMLcZ6hvM9OaYc0LthHfxxVKm+13XN9ZrOar1QQsO1vHP98AQ69chrccl2o2nDUxQmhk65OVVPA52WuTgDsNMyZYBYeHXWugV5oBDSg==
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com (2603:10a6:20b:4fc::5)
 by GVXPR09MB7066.eurprd09.prod.outlook.com (2603:10a6:150:1b7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 15:13:08 +0000
Received: from AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa]) by AS4PR09MB5681.eurprd09.prod.outlook.com
 ([fe80::8d2b:5798:928f:9faa%6]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 15:13:08 +0000
From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
To: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
CC: Djordje Todorovic <Djordje.Todorovic@htecgroup.com>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"cfu@mips.com" <cfu@mips.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"devnull+aleksa.paunovic.htecgroup.com@kernel.org"
	<devnull+aleksa.paunovic.htecgroup.com@kernel.org>, "jstultz@google.com"
	<jstultz@google.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "pjw@kernel.org" <pjw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "wangruikang@iscas.ac.cn"
	<wangruikang@iscas.ac.cn>
Subject: Re: [PATCH v7 0/3] riscv: Use GCR.U timer device as clocksource
Thread-Topic: [PATCH v7 0/3] riscv: Use GCR.U timer device as clocksource
Thread-Index: AQHcsVrKih43OFmRVkSBFISSf3ZzwbXVOeuAgCE4uoA=
Date: Wed, 29 Apr 2026 15:13:08 +0000
Message-ID: <d9b8ab57-7fdb-4cd0-84fc-b1cd9f04e5d6@htecgroup.com>
References: <ac1c7966-6db1-4e00-aad5-4650d7b8c11a@htecgroup.com>
In-Reply-To: <ac1c7966-6db1-4e00-aad5-4650d7b8c11a@htecgroup.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=htecgroup.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR09MB5681:EE_|GVXPR09MB7066:EE_
x-ms-office365-filtering-correlation-id: 82b29078-2b45-4711-a2e1-08dea601d244
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 6KnBN/JwsMipZ/Z/vLMU1Jh1R2f4qlN0o2qBCMnKU5WhBCl5JMPzK/J+YvsSLfJbpeSaF1IM0HmnWKWy9YOAlm5X0WIL/rJ23EZMRgV5N0+7WVCvIblLNqvTHQ2TqrCpBCDrq0xWod5AsVdXPlexmINpyUYGqNA4RX8O2NyCLVTajzHG10hJW4pPCPMirO5IDKFfLpAFdXN4zWOzcEAeg1XcLqe65kuspmE5W4tbGHnOYjoLi1C9PjYsu2c31jR79Ketw8bWUJ3N78gD6dTY0Z2yH11m1T2kchtfTwbjzuNIc66UI6uucZ3mMV+NurTR3c29ZxheWcfC7rhif/SublxkbrEAUX0MoawZrQZt7ESAVjfbp8uZ7ClYUR43a4TQ6R2EVm3d21jqk9TIJDP6yioUmyVX1oKxuHmvnRQCLSsbOjSSZHGVeZBuP/g9pYG+hI0dk7dvpmfC9FBYvP0Aq/sbxc42xA36fslkOwrbDp1G8L2YqmPZbtcbmyRobcG8IitrGzz1UcvRnkANP0i+GGzAmqL8Oz4YDUqy+9/QCBGTLWs8EbW1urNe0+Vc2c90jo+vETUlQ1EZ7YNd2DYxs15xjt2egrFcAZ1Ud82aIhzEJOFcEbzP5v2GL5y/dvDleU7MI2XrvKfY0mr8kq0nKn7nAzdP+tlL8775r/BBYa5PUm7Ntpm82O+3bzQJefKIjzo5lkbvfWgKHDC5ZDLzUHEmG2LV3RIyUsMe25tmhj6l4Ak0Cfnb+izpvzXAMUDLpUN9zQh/0ChjlGGNKIhGff+Qw8dT52atPbGINae6yVs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR09MB5681.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0lYWW1rMGNGdjBzQUhMMGJldzkzTGczSHRqTHc1SXRmZ0g3ZjArZ3FBWHVB?=
 =?utf-8?B?T3U1amFHMkJlbHJzUnE5RFdwWUdFdzN2N21Eb3J5WnFTbC9QRUoxOURzV0JD?=
 =?utf-8?B?K2NQV3FaOVJBRmFqZW9NL0d6M2hhRmY5YUc0RExNbDFGSEtsR1ZrdFZ3ckJ1?=
 =?utf-8?B?M1dLUjBvRWh1bzFTdmkyb00vQlg0aks3eHltbjBFemx1enRuZTBka3FTVjRq?=
 =?utf-8?B?cTdSUzVabU5EK1hzTDRPS250TWdoYzVkd2JLOVBsRFdUU1ZtU2kveDc5Zjc0?=
 =?utf-8?B?R2VPZkJmY05pOVREVTZmcU1MTVl1Y0RFWDg4YWN1ZTM0dEozem1iZWZLY0pZ?=
 =?utf-8?B?UTdXODh2Mm5uLytBV0F3UzdmNlkxQm4xL3BheTJheTJhK1Q3aXREUzh3K3Fj?=
 =?utf-8?B?MFNNZUlkRjhlOS9VLzQwem1peXY0TnRvZVVveWE1eFRLRFZURDBDeVdBTG8x?=
 =?utf-8?B?OThQTVZQSDcrZHh5aEtoUGh4WlI1TEgxbHJiWG5oSm5RYzMrTFBjSmlIN1VK?=
 =?utf-8?B?OCtjUU5zb04va3JaYUlLY2FzdUczMmgrTVZDamlTaVRXTjhzc01pYkRTWDBu?=
 =?utf-8?B?VjlNRTVNMy9NUkV5MzJpMkRXckxJYzk1citDT21CdGg3dEVOb2U5d1lBbDls?=
 =?utf-8?B?RmVNV05GRm9kdzVRMjIvWGl5aVNjWmo5QUtyWEZsZ3dJOFJxWjVDaDFTU0Yz?=
 =?utf-8?B?ais5cEp5TUZQYjlTRG1BRDlRdXBjWjlvT0VTTUViNlFYOS9sL2NRL3J6VjBr?=
 =?utf-8?B?NmFqS0FKSjJUbm5vbnJ5OGR6aWxvLzI5OU1oa1BkQUdhQmdYcnJHNmJtREFj?=
 =?utf-8?B?RU1lQlR6OTU0WXpNL0orOVpKZFB3U1FEK085YkhOV29MRG5PQUFySXJ3bHJC?=
 =?utf-8?B?Si9oUTVLeWpuWjBnOTJLMmoyK1YxOXBTRmtSUXAzdWp2VVgvR01rdjMyR1dP?=
 =?utf-8?B?WkNMMVJHaFZ2bVpqU1JHSmN0Wk93R3NLclV5WjJXTk1PbkRLSGw2emtzeGlM?=
 =?utf-8?B?MVY2VG11NEt1ZEhZTTM1M1JrYmlVU003K3A1VWlJaUw0alRsenk5UDdxaEZ6?=
 =?utf-8?B?ZWhKb2FFSkRyR1Z1Y0MrMG1ZcjQxY1oyeXZoQW1SNzNQaDRmbHUyV0xWaitI?=
 =?utf-8?B?dkMvRTY5N2NEUlhjQlBuaklDdjR3Y3ZaNEdiVzdHQVNVK1NDaXZ2ZzVKWTFt?=
 =?utf-8?B?WWx2SkxuWUpyZGtQRzVCVS9Qd0JzOU43TVJqTnk3aUFOZ3B1Tm54OXcwSnVV?=
 =?utf-8?B?b1R6YnM2cFUydEpHT2V2NE0zaXFWZlpGa1B3a0taYkM0VHpOYnBySmtKRWN2?=
 =?utf-8?B?aUJIWE9DRDh5MlprZGR4U0o1NWFFV1V1OWFNT3JYc1Z1OHFaallxekE2aXNE?=
 =?utf-8?B?Z0VKeUpLalk5QWp2dGgwZHFjUnkvejh4WkxBUnFySFdCemlidHQ0RmgyVFJn?=
 =?utf-8?B?WVFtY0lKS3hZT1JTd3pBRGRpNTNDZmtsSGJDV3Z2RmlhMUkybGgyQzRWZFlW?=
 =?utf-8?B?aDI2Rkl2c3Awa3FGM2VnSFd0Zk5CWDEwczc1bW5ucUhNeFByQnRscldJcnBJ?=
 =?utf-8?B?d3k3Mk5CY200TmxrTE9IelhHaEZyNnE3VTYxMzUvaU56T1cvUityZUI3byto?=
 =?utf-8?B?d3AxODNzU0pwRFRMZU5GbE9GQklRQlpINGpSSm5lOU0vRVdXb0hxd24rb3ls?=
 =?utf-8?B?elNUbUNtMmsyNElMNzlvRHhwT2NzWHBGeVp0TFhWV05BSHY0aEFNQnBiN0NW?=
 =?utf-8?B?R2p5SnJtc3NVdkUyMnd1VEtsQmJaT3dvWVZzZGpKLytJR2RLR01pMHQyNklw?=
 =?utf-8?B?Tzh2WmVwTVFreXo5OHpmRU5lWXoyRlB2NlNkLzY0NkdCc0NPenBwUkp5VjFU?=
 =?utf-8?B?MzdpazArZEY4M1lMcEZ2Y3VEakd4QTVwQkxjM01xNk56bGFsZS82czc5QjdS?=
 =?utf-8?B?elE4THNiUDBac2RmVDFqNmx4TENsbEhZUnRSMmgzMXNnSGU5ZC9Xd0ptUDl5?=
 =?utf-8?B?bktESExDd0tVY0h3RnpTUDZwb3JHTzVKcjFCRk9ML2ZsTDErWWNHUnlnNFhx?=
 =?utf-8?B?REdkYnlaQzAvQzZ1WHdYRzhHOU9SaXArRENYbjY3eFVENjgzSTJTSFdUbFRl?=
 =?utf-8?B?Wm1YMVdCRXY3dkJDNUFFaC9OSzY0b3FzY3RzWXQ2TjN1TWtMbC9aZXRtTXRT?=
 =?utf-8?B?cFg5dFN5dGRNYURnMG9SdEhrWWFEOWp6MUl1cUU5UUI5Vkw4Uk83S1k3M0gx?=
 =?utf-8?B?ZUtkSC9sdFE5cEZPUWt4cGZBb0ViLzc1d3pWTjFyYXZZOUw3SlkyRngwT0Nn?=
 =?utf-8?B?MFEvd051bVljNkdNY0NGN2YySmxxSFFmSU90eW01dHM4RGN2OWVBbEU5Q1dm?=
 =?utf-8?Q?7byv6rSPa6d6xOHd1cNRyS4oemH2j9qAQkAc7?=
Content-ID: <C9BF10B69A9334489AA37E9284B1D2BE@eurprd09.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: htecgroup.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR09MB5681.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b29078-2b45-4711-a2e1-08dea601d244
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2026 15:13:08.5655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9f85665b-7efd-4776-9dfe-b6bfda2565ee
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LzYO58OrhiVlUrD8GAAbq5+UJw3SfmGfehSWlan1k/8Ab7OEVQPOf2viLNIhKcZlSeZHyLOvheq7kdHQSYV7uuEIWjIBKBQfiDj7Av/2UBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR09MB7066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_081319_390508_3B1EAC16 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On 4/8/26 13:53, Aleksa Paunovic wrote:
> On 3/11/26 14:26, Aleksa Paunovic via B4 Relay wrote:
>> This series adds bindings for the GCR.U timer device and corresponding
>> driver support. Accessing the memory mapped shadow of the mtime register
>> in the GCR.U region should be faster
>> than trapping to M mode each time the timer needs to be read.
>> The timer device does not implement any interrupts, therefore the
>> timer-riscv clockevent implementation should suffice.
>>
>> We tested the patchset both on QEMU and the Boston board with the P8700 bitfile:
>> - Coremark and timer kselftests on QEMU emulating an 8 core CPU
>> - Coremark and timer kselftests on the Boston board with a single core CPU.
> Gentle ping.
Pinging this.
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
