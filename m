Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA7FD35E5D
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 01:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:From:Cc:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r+D7gkK+sXVZAfozpBZZR29DQywBW92hcztic7G0M6Q=; b=4laOnheihW1xYkM8SSqfl7dxmm
	ZFaFmRvrsISj19gATyyiwMvtqMiug4oWA8EygE0qzH6TkKoZsh05OgQtxxykjbwm1wZrrqQ727EgI
	VrD4loznhmJp7dKVSmmrL1Qy8cCK9mc4nRl6y3i1jw7Bg7iCxmnydSIeEkSi1KZE/G0JzF/J/c09m
	S5BR89T/0dZvqOir9ccUcI/rltvGbpymRyeEOh3JXET3FrpyyXeg+k+e0A37eGnMNsRxRMqlBvG5v
	VSYD2WgTBwMOuYRRJZIvorPk8VovDbGEqnDP7Iaerh/jNTRaoRe2yNtojCRgHCCyj0oobBA2rX2vc
	f3L+aE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UbM-00000001Hq3-3Sdy;
	Wed, 06 Nov 2024 01:12:52 +0000
Received: from mail-maxind01olkn20802.outbound.protection.outlook.com ([2a01:111:f403:281b::802] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8UbJ-00000001HpG-2HDy
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 01:12:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QdgbItpK8RMK/ZdgfNc/ymY3ydG3bsW6+OLeNdWPSeMKOU0pwjvFUFosldMp5yfN/DqtH3Uzoc+MgOD/0eRO2AkOiAsF3UYQMr1Xn4vLwE0k8k6YMPCxEk6WOq3aRPJ/bB2ugEfxmrT0oSkjTKZUaOIiXqfkvF2ix1gRFVTlCyWO/5Jrdq7UNdyjZFQlaVCwoydkC3IdrUlsnqNhuQaonhtwaORNmkwvxpNxaXhHPN/jV/IeMjBrjJnd5Qpk1mDlXh3fn+eJUJUd+op/ZgnxnwhN0CKweUbGYTyNK5QE3mmovdk5R4n7zqGZIqiQVXkGm7BKiGfOJzYRzdQdaTtFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDf7RZ6NDrMb8Wz1SnI+mymzjV5vwXKhpVzQZYf5chk=;
 b=sdS81GU9i768o6a2xFfQ3sXKanTL0gIl54OVwkAU6rn4ap+I3fpF0LOiCz2hWM1Dul5q4dPphZVbl4QBb021oX33sBLVVb3eYhWv9wABI0YsbB/aRYQHAXVuH3Jvgh5TIqMY3rz/EjSPLCAslCFtvA0Hr82nTRtw4xjbfRbk9EVWqcUJO93eegVBMQPUDleWt4PpGVT0k909lnFoVOCxr8yvMmZbObpYV0XxOz18sGJwl2IhbG4B9gTlb1+y+rbvacDX6LqxhcUZ6pQIzTi0LFqg5m/fb/dylwJdSq1fihjO8v34ZAGyGYOz9vSiCymkGNrsIyE7W2XGTTAwP96Z+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDf7RZ6NDrMb8Wz1SnI+mymzjV5vwXKhpVzQZYf5chk=;
 b=pFvaQF5IbCv9Wru7yYWrkU5me6C36pU88MQiMPviwOvv/eyYMO6RcFz5kpW3mhaHSLeTUxekghVlDDglVyGetLr96F2ItMCH6OzSO+5n/xpRKMRK6Oc4s4QI93KILbmMKZaEvNXFgPXZM6IfFaIa5LXayQhJcZ4vGSLOx1OJmdOxb8odKIyikfkPvc4dNKRXRvtpgZxtMYubtC+ByDNLxsDwe+X76fjVXXj32d2YmUiDMPNh9oVv5hZHYncLtJ2LqidJL1+UTtRFeUUJ6odTR9LsbFQ+D25ObcvcK2XltfGj5GjSzKf8jAqQR1TYIa5JdXWpphV4BTEuPKo0i+4FUQ==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by PN3P287MB1618.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 01:12:35 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 01:12:35 +0000
Message-ID: <MA0P287MB2822DC23E1EE47A5C7D41476FE532@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 6 Nov 2024 09:12:30 +0800
User-Agent: Mozilla Thunderbird
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Inochi Amaoto <inochiama@outlook.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 Liu Gui <kenneth.liu@sophgo.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.13
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <e31db118-da5b-4091-9647-f61143e98359@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|PN3P287MB1618:EE_
X-MS-Office365-Filtering-Correlation-Id: b08c5186-c44d-4411-fffa-08dcfe00184f
X-Microsoft-Antispam: BCL:0;ARA:14566002|15080799006|8060799006|7092599003|19110799003|5072599009|6090799003|5062599005|461199028|1602099012|10035399004|440099028|3412199025|4302099013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGd4ckFZTG0xTVVkOXYvNjExUnI5NXhOcVBIelBqNzR2ZmhiWUhpQm1kVVJW?=
 =?utf-8?B?VU1LQzE1RGFFQ0R4dUx5UzZkSTVScHhwSlFmYVBEWlk3SzEyS2hwcWlwMHRP?=
 =?utf-8?B?QWJiUlZGL1BpcTR5bm53d1Y0eDNPZVRTc3VIZFcvM0szbEs0cHk1TU1wK2Mw?=
 =?utf-8?B?OTVLbjdxaDBpRjUvZk5JblIwckg4eU5oWDU0NnVxSGVsVm01clZnbitjanJn?=
 =?utf-8?B?YzJlVm13NUVhcTVQOXdzSUZsd3JJcGxYeWhhMnZjN3dXMy95UFBacE41UlQ0?=
 =?utf-8?B?STBqTTBlVEU5WGVjTlZDalQwSWdLQU52eGhzS3ZmOGpIYWd0Z2VDb1dZelBu?=
 =?utf-8?B?andrUjExeVFmUTZab0dkbTEwUjlHVnUxeTFzT3FpU0tKZ3FTWk9JRkY0a0Vh?=
 =?utf-8?B?RTlqeWFOdTlMTzJ3U3l4cC91L3NjdW44R3dlZDgxa1ppeFdYdmJ0RVhMQW1O?=
 =?utf-8?B?dDZMRmVnZC9XQVBLNWkzZTU5cVpmZ3dsRHlTODlLeVBCRmRQKzBLK1c1TEhq?=
 =?utf-8?B?VDFncHZkLzhGdG11biswWU10aGlBcFhCT01UR3hLQk1RampqZUxKckprNmxp?=
 =?utf-8?B?VitCK0VKL1NjRW4zZ1BJRTZyR1h3WkJvS21lTGJHOXdUb25hTU5FU2hybHZW?=
 =?utf-8?B?OERoRnJpajNaV2NiRGdIbVRoYnYydE1hMVlma3QwUGdNU3djZkdXL3FqQ2Fs?=
 =?utf-8?B?Ylg5QjNSbDRXVktIQ2hSV0d4ZjdKcHRCVTBpemZ3NkhxQm5FUWhkc3hEbU00?=
 =?utf-8?B?ZHArYjltek5IWlVTRDFGRUxHVkRTdkJHNkFYQmJJMlo5bkpyVGRKOGRTa2tJ?=
 =?utf-8?B?cVp6RmljUFh6ZkNZcHRWU082b2Nyc0dCMkNBYUhpbzZZR0RURHZTQXZlMkxq?=
 =?utf-8?B?MzZXTlZlL1RMVTI3aU8zUStsZDdNMHhyZUdzOFVqV1dYNWNRNEpNN1hyMkdo?=
 =?utf-8?B?TUU4T1ZWaWZrRjVyRkxTVjhDd3RFeDFlV3RCMXB3ZGU2OTdCRzZabVpvdUpF?=
 =?utf-8?B?YW5vcW9JU0N3cWZjZHlnZUtDQWhQbmczWEZQR3lpc0c2MkJSd2FWVzg1MXRR?=
 =?utf-8?B?L1pZMHd2VE5yUHN0WFhhblFtdmZ3LytEb0hRejIyU1MveXVuVkxiM090eTU0?=
 =?utf-8?B?TmNlazBxZVhxWjZnRy8rdjFObWp1MGJadnpTY1lnaGtWMnRWN1cxSVNEVzZ2?=
 =?utf-8?B?c28rNVBzRk1Dd1dCbDVXSWpyeUlmV0RuYTBrVTVDQ0hPVDRwbEpKOW1vTkh1?=
 =?utf-8?B?NGlRYkV4SEdrUEdJeHhqaGdEMTZLczdUaWNqb1pDOWRtWDFpR1VzUHMxQTF3?=
 =?utf-8?B?aVM5aWtzMTJZSkd2MGZrMFFEOGdHbmQxNTIvYklNMlRaSzhLd3BBd0xNUHdP?=
 =?utf-8?B?UGpmM29JZmx4ekVUaXJiUEk5RmhSazlVYTNUUk1kMkdkRzRFcE5jMVdtMmh4?=
 =?utf-8?B?ZGdPN3Z2bzdMbnpVNHZibkVtbEhsVHQxUzE4TTZTUmFWWnBWSlFobXVDL3dh?=
 =?utf-8?B?SUhQTDVBWmRIc1VFdXlaYmowMW9oMFlDUkEyd25lbndoNkhGQmpBUEkzQ1V6?=
 =?utf-8?B?QVBuZFI0MTBCeDRBb2Y5YzN5U05aMmZxeE5EblZEZG5MU2RtZm1pRjhjbmdq?=
 =?utf-8?B?SWpzU1FhWTVoWUZaeUpUYm5tK0RtN0E9PQ==?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3VzRHNIOUNUTTlxYkxrQyswY2Y4TVJpYmIzdjNabHQzeTdNelhaVSs2N2RU?=
 =?utf-8?B?TVI1bEpkZ1YyVTF2YjJhNkIwSndmZDVZT2FTNDhRc09iM0MyR29OWUFyUVNV?=
 =?utf-8?B?Y1NMY24xU3B1RXJ0MU5kQUZEajljem56dkw2Zk42QXJBZzFIRmtjVDlRWU02?=
 =?utf-8?B?UU1xckl5OVJtUndPdUFzS25mYkpJVTN6RFpvRjZ1ZlhYb0NtWS9Ub3gzZ3cv?=
 =?utf-8?B?dms1NTdvekxqdmpyV2tCVEEydlRtTjJlOXNVSXplSDZERUg1R251Njk4MU9z?=
 =?utf-8?B?ZEVadmg3MTc0QVlvdmY1VjZSM1c5UG5UdGowYVBaNkRFUitweXBvUzExNTQ2?=
 =?utf-8?B?cVdBK1c0engrallKNG5Pb3ZFNXpFRFNnOTg5WThsRzJHOXVRQk5mUGJUT3E3?=
 =?utf-8?B?ZFlwVWd2dUNXYkpSOHhwbFloWS9hTXZxTkdMZkNVcldTUGh5VmxuSEZFdFdo?=
 =?utf-8?B?ZnpCekwyVE9WYmQxdGlNaGxIUkk0U1ZsQ29XMjFUREFFNldnaEZ5WE5ZYk9k?=
 =?utf-8?B?dnZzUE1jdW9FTVh2d0VXek14dXVEdDc4MU9ncjVndXcyWTFrZXJ1NWVDbWd1?=
 =?utf-8?B?dTdRdXhCWmp2dVgrRzI5cmxCWGF4ZWo1RHhyeDNrb0xEakZhVi8wblZuY3ZD?=
 =?utf-8?B?RW4wMURiY2hOcHBJMGhWbEp0empoRC83MytDcWdSZnkxamYwZDJmUEo4RUxu?=
 =?utf-8?B?N3FyNUVpTzJnOEVVM2RRbVVrWW1TMSt4amhnWm5nbGJCT3lma2hIRlVnb0lk?=
 =?utf-8?B?eHk2cGVsMTMxa3U4aDh1VHlRUXJEcFJvbllOaSsxdURXMlZjWXFIbjVpc0dY?=
 =?utf-8?B?N1A3K2Y3QllKQzFubUNyUjIyWjNNRTNlaWpCQVlZL05mL2hQTithYkxOekNX?=
 =?utf-8?B?cTFmS2wzNTB2c2Q0dWEvSGozdTlHSVRWcnBWeWVVL3JSNDhmWHRzUStoTkRE?=
 =?utf-8?B?cmFkUTFaZ3BhS3ZpNlU3S3J6YUJqbHdmajliL3JjdXYvMWRSYVJSNUVqRzhk?=
 =?utf-8?B?ZTQxQ2ZEeld1eWNtV0FlMUJJMVBkTXZ6SW5YNjRqZm0vdzRqZVJiajRNbmNF?=
 =?utf-8?B?cEhXYWxHRWk0WExNYkJoYnJ6cE1UaUd6aWVBSi9IMmZWQXBrRUErWWNTZk1C?=
 =?utf-8?B?TTFGcTFVckpTb0hZdTA0dnNoV01FR1VhRDRLWFBpR3MzWmhPWUljZnFYVkpu?=
 =?utf-8?B?VTQ0ckFkcmtqUmMxcERka1NCMXhrcHVIemY0VlR5MThETDhFeCtDeWZwbEUy?=
 =?utf-8?B?WEFVaEdxc3RvQ1hQdE15V3dZVHhhY2c5NE9CT1NEUVBmNmJlcmQ4TFlZb3pj?=
 =?utf-8?B?dlhmVEFoa1BiT2JDdTJUMTRUOEhnM1NuVlg2bGhEa0VCamJlVGw0aDQ5MjR0?=
 =?utf-8?B?TlFaTTc5VHd5dHJ2SytveTF1MnNNOGdXaTRxd0pTRjZvNGZrV1Y1YXJzWkRE?=
 =?utf-8?B?M2ZJSDdGc1N2OXRZS3RlKy8rQzFiNENIT0xDTC9wTGJSejdsdXBubUNVcDhF?=
 =?utf-8?B?S0l6dVVqVEI3SFpLYmltbjNEdzlzVTQ5RmZQWTRoaVlQeDdYc2FidmYrZTNp?=
 =?utf-8?B?OFFPNWNNNkkrQjgvUUV4eG1pNzdVcHBMbnVnbmppQ20vTGdOVXluMEVtSUhi?=
 =?utf-8?B?b1ZXaDJVVURMMkJwMHp6bk11ckRoOU9YZ1pCdXlTK2x6YVJYdmJ4RG0wRVRE?=
 =?utf-8?Q?8F/WcI0w9mHZ/1EBcRAl?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08c5186-c44d-4411-fffa-08dcfe00184f
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 01:12:34.3637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1618
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_171249_682602_D594827F 
X-CRM114-Status: UNSURE (   6.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGV5IEFybmQsCgpQbGVhc2UgcHVsbCBkdCBjaGFuZ2VzIGZvciBSSVNDLVYvU29waGdvLgoKVGhh
bmtzLApDaGVuLgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA5ODUyZDg1ZWM5
ZDQ5MmViZWY1NmRjNWYyMjk0MTZjOTI1NzU4ZWRjOgoKIMKgIExpbnV4IDYuMTItcmMxICgyMDI0
LTA5LTI5IDE1OjA2OjE5IC0wNzAwKQoKYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRv
cnkgYXQ6CgogwqAgaHR0cHM6Ly9naXRodWIuY29tL3NvcGhnby9saW51eC5naXQgdGFncy9yaXNj
di1zb3BoZ28tZHQtZm9yLXY2LjEzCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gYjVj
ZjY1Y2MwZmQwMGFhMzBmZjIxOGVjODE3MGRkNDhlM2NiZTc4ZDoKCiDCoCByaXNjdjogZHRzOiBz
b3BoZ286IEFkZCBlbW1jIHN1cHBvcnQgZm9yIEh1YXNoYW4gUGkgKDIwMjQtMTEtMDIgCjE5OjE5
OjA4ICswODAwKQoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQpSSVNDLVYgRGV2aWNldHJlZXMgZm9yIHY2LjEzCgpTb3BoZ286
CkFkZCBwaW5jdHJsIHN1cHBvcnQgZm9yIENWMTgwMEIgJiBDVjE4MTJILgpBZGQgU0FSQURDIHN1
cHBvcnQgZm9yIENWMTgwMEIuCkFkZCBpbml0aWFsIExpY2hlZVJWLU5hbm8vU0cyMDAyLgpBZGQg
ZW1tYy9zZGlvIHN1cHBvcnQgZm9yIEh1YXNoYW4tUGkvQ1YxODEySC4KQWRkIHBvd2VyLWtleSBz
dXBwb3J0IGZvciBQaW9uZWVyQm94L1NHMjA0Mi4KClNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8
dW5pY29ybl93YW5nQG91dGxvb2suY29tPgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpDaGVuIFdhbmcgKDEpOgogwqDCoMKg
wqDCoCByaXNjdjogc29waGdvOiBkdHM6IGFkZCBwb3dlciBrZXkgZm9yIHBpb25lZXIgYm94CgpJ
bm9jaGkgQW1hb3RvICg0KToKIMKgwqDCoMKgwqAgcmlzY3Y6IGR0czogc29waGdvOiBjdjE4MDBi
OiBhZGQgcGluY3RybCBzdXBwb3J0CiDCoMKgwqDCoMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogY3Yx
ODEyaDogYWRkIHBpbmN0cmwgc3VwcG9ydAogwqDCoMKgwqDCoCByaXNjdjogZHRzOiBzb3BoZ286
IEFkZCBzZGlvIGNvbmZpZ3VyYXRpb24gZm9yIEh1YXNoYW4gUGkKIMKgwqDCoMKgwqAgcmlzY3Y6
IGR0czogc29waGdvOiBBZGQgZW1tYyBzdXBwb3J0IGZvciBIdWFzaGFuIFBpCgpUaG9tYXMgQm9u
bmVmaWxsZSAoNCk6CiDCoMKgwqDCoMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogQWRkIGluaXRpYWwg
U0cyMDAyIFNvQyBkZXZpY2UgdHJlZQogwqDCoMKgwqDCoCByaXNjdjogZHRzOiBzb3BoZ286IEFk
ZCBMaWNoZWVSViBOYW5vIGJvYXJkIGRldmljZSB0cmVlCiDCoMKgwqDCoMKgIHJpc2N2OiBkdHM6
IHNvcGhnbzogQWRkIFNBUkFEQyBkZXNjcmlwdGlvbiBmb3IgU29waGdvIENWMTgwMEIKIMKgwqDC
oMKgwqAgcmlzY3Y6IGR0czogc29waGdvOiBmaXggcGluY3RybCBiYXNlLWFkZHJlc3MKCiDCoGFy
Y2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxICsKIMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODAw
Yi1taWxrdi1kdW8uZHRzwqDCoMKgwqDCoCB8IDQ5IAorKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2
MTgwMGIuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrKysrKysrCiDC
oGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgxMmgtaHVhc2hhbi1waS5kdHPCoMKgwqDC
oCB8IDIzIAorKysrKysrKysrKysrKysrKysrKysrKwogwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9jdjE4MTJoLmR0c2nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTEgKysrKysr
KysrKysKIMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODF4LmR0c2nCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyMSAKKysrKysrKysrKysrKysrKysrKysrCiDCoGFyY2gv
cmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTh4eC5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMzIgCisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiDCoGFyY2gvcmlz
Y3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMi1saWNoZWVydi1uYW5vLWIuZHRzIHwgOTUgCisrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiDCoGFyY2gvcmlzY3YvYm9vdC9kdHMv
c29waGdvL3NnMjAwMi5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDMgCisr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIMKgYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzwqDCoCB8IDE1ICsrKysrKysr
KysrKysrKwogwqAxMCBmaWxlcyBjaGFuZ2VkLCAzMDAgaW5zZXJ0aW9ucygrKQogwqBjcmVhdGUg
bW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODF4LmR0c2kKIMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL3NnMjAwMi1saWNoZWVy
di1uYW5vLWIuZHRzCiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3Nv
cGhnby9zZzIwMDIuZHRzaQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
