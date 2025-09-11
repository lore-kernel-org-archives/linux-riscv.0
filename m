Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB26CA101F
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 00:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QG4tHzyBolqTpjUHoREer+g1unZC0W4lL8vNsW9KK2Y=; b=O7HpRQ6dkVG4ze7WRj+6AOkkAO
	PHM7UhzdxCJ8YNwtBMgOP9DvWPSC3i8MVRZw4BWJ1VizaavXd0q9h8hwuTd8zSFYD9eF17XoBTu44
	VWEI49JDK0DBjOc2a0zxnb07Qj3ziPJ0eqyH7v2R6dVn+EMzanpUQ7pdN7pzFllpElUKbBJ4TQDf+
	YrrW1nXHRXazpQ/FkL7O6fD1pMJESl7S9GnQMRMdtMrOM0aZaQmJPkeg98wvAlBrUO61UsXQrLXxK
	vDCMdgw6yk7xqaxquVZsmaWs+RmjzCqXC2cxq7W+7ECmiQh65YF/b35FYPy6O0w3s4ozDpDAHTIVT
	YRHBoEvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUsy-0000000HRXz-0cHX;
	Thu, 11 Sep 2025 00:10:00 +0000
Received: from mail-southindiaazolkn190110001.outbound.protection.outlook.com ([2a01:111:f403:d408::1] helo=MA0PR01CU012.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwUsv-0000000HRVn-2Mmf
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 00:09:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYXNXngs00a7hyLVQv0ypSH15UgrLo0F5wUjKwp8QloV5OhSaStOzXRVxw2nPcZdGeDsksAOmd1MTM5ohf4g5Rf/TMjDnLyQ+U/TS/LcVLdynyYm+pa2qYlk5pdYnD5j19Gr/IxAJvxA3mmG/iQkUgFJPXeqPmCBxKyi5JNSSE6z/1Nl66xtSCBzCswtwK2y3L/rWuL2eeXrSYhdscD01kSZYP1qEre9IJhslbhPdYNmmg+x8MmJCyi7IIdMWUdx4i3VberHGOh+LgZC/Gvt/d/6cRI2v6SJAFeSdHp9jYmasCpDjKfX7sqExeNRflJZmsNyhavcnm5SD3uvRcMvdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSJ/s0CYZpb+dbdzCs/LoHo73rxEM7snIfSigq7gH/c=;
 b=YWNn/10baYQe4Hxt4+y8E7fT9Afs1+PULzGY3Y5WsrJk4jves50HDjv1uJm1Q7Wue3ttfqNNZz8MWtpllvIqbI4qVb9PMsgvWDQ4otiZbEVPZc8y/l2HEbbo9qnoJZXxHWCLDZw8Zq1FICYPppnimrp1lXEX6rFBcLSrhSr+XDtX/XvYI9s06JKwpo1p3i1GST9M73zEIW8ak571t5+8H4JSVINe7NCeE4UxLpvalXOGI5KLlvHGmcAjgfbnasiiS8Gjva4oREIK60gC4dT8otD4mGwIXNnWp37n2bszu+fpf8C49Xhv2mhros7sCiC9DI55OsYGel6si8s8qVLq8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSJ/s0CYZpb+dbdzCs/LoHo73rxEM7snIfSigq7gH/c=;
 b=K+XVHThOqvDyFkLQNt10MbB6k29sn50Iv8gd4T0kwOlAC8skC8GXYVByQTIv6VIfyMbGS96VZtK65U9KEC93MmQ6OrIthpR7gcO8tuVMIHuRs0oEkr5r7nldLcrWsIzdMG7G2+ccKLFnEhp3Eraq7Tsbx+SeSe3h3N3CYiLO70ZVyXf82WB7YYc6/0MDUikz5mMDJFgLoqZg9/dagmr2U0bh7CRgA1t8ChFvrXCQP25x71gZPN5ItxrcH8UvaFyGRZRBiH8DP/gx9nd6qTF04F97ojUII4fN2ShVWz6ZJYpUx6YaF+Nao8zAAz6VvbSXrRe1Io9I81a0PKXm2Oioiw==
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16) by PNZPR01MB4125.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 00:09:32 +0000
Received: from MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b]) by MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5dff:3ee7:86ee:6e4b%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 00:09:31 +0000
Message-ID: <MAUPR01MB1107224119A8D402FEBE5E2D0FE09A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
Date: Thu, 11 Sep 2025 08:09:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] PCI: sg2042: Add Sophgo SG2042 PCIe driver
To: Bjorn Helgaas <helgaas@kernel.org>, Chen Wang <unicornxw@gmail.com>
Cc: kwilczynski@kernel.org, u.kleine-koenig@baylibre.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, arnd@arndb.de, bwawrzyn@cisco.com,
 bhelgaas@google.com, conor+dt@kernel.org, 18255117159@163.com,
 inochiama@gmail.com, kishon@kernel.org, krzk+dt@kernel.org,
 lpieralisi@kernel.org, mani@kernel.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, s-vadapalli@ti.com,
 tglx@linutronix.de, thomas.richard@bootlin.com, sycamoremoon376@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, rabenda.cn@gmail.com, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
References: <20250910143453.GA1533730@bhelgaas>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250910143453.GA1533730@bhelgaas>
X-ClientProxiedBy: SG2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:3:17::13) To MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:16f::16)
X-Microsoft-Original-Message-ID: <9885035a-6737-4126-b40b-4470b8f2d380@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUPR01MB11072:EE_|PNZPR01MB4125:EE_
X-MS-Office365-Filtering-Correlation-Id: e497483c-f6e8-4d87-4881-08ddf0c77b53
X-Microsoft-Antispam: BCL:0;ARA:14566002|8060799015|461199028|5072599009|19110799012|6090799003|23021999003|15080799012|52005399003|3412199025|40105399003|41105399003|440099028;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SS9KcGVHQm8wb1NVSUVXaElDTEVWY3ZGWUFMa2NsNGFyaW1Ka0tRbC9iTTBk?=
 =?utf-8?B?SExxSEFva2ZDOE1ycVBRMFR1N2dPMWRZZERMSVRXTzBXaitwc0dXeEtmUnha?=
 =?utf-8?B?aUd2bWh6Y0pzVytMb0tyVHdxNEo1TWxUM1Y3ZWVramJnNFVCc3FyTHpuUk1C?=
 =?utf-8?B?NUJEN3NUVGFGbjA4T0tQeHFxTW1Pb0p0M015QlQwdndpTGlza2pBc1cwZndM?=
 =?utf-8?B?OHRjSmVhZDlvdElrNytMOG04dmd3cDcxUGpOc3dJYytFWHFRQTRIV2xyK2JI?=
 =?utf-8?B?WXhBZTFUUFc3RWVBeWE0VmhWR3lDWWE5VVFWdGJtSzBEQ096SVFBVkNaRDZL?=
 =?utf-8?B?S3lsZEMyTXV6bW1ueEs5U2srN1NhRjhhZ2FEaUg4ZUx3Y3l5TG5kcmNSaGlH?=
 =?utf-8?B?VWJSQWo0WXpQeWZxWWlsQXE1QlYxdEkraVJtbmdDOEJnL0NLTnFhV1FocGUr?=
 =?utf-8?B?ZzFFSFUrNU15MklKeEY4VEhoUFVLZzRoNDA0N2U1dVNLd1p4dHFmYm13Wmdi?=
 =?utf-8?B?bmxialZwVGRob29vZGpWYjl6bGZ0MXZWT1Z1dUxHTXppR2RNNkNxS2xsVzZ3?=
 =?utf-8?B?UEhSVkNxTFEraUZyZjhkNlFOTzdkbDhWZlJkSkZxb05MR3Z5c3lWa3hnbEtU?=
 =?utf-8?B?ZFJKNmVyTnB3d0VrZW14MG0xWnhIdDJvU0lrQkxKNWh1Zk9HUStaUjZGQ0pU?=
 =?utf-8?B?QlRJTm5oV3paMDZOd09NcHN2U2hFTzZwYmgvQVpkRG9ZWi9XdndsRElpWkg3?=
 =?utf-8?B?YnhVN3pINDltNGhjbzlIbG9sKzRRY2oyM0w1OEh6UnFzVDdneGwvNVBYZmNR?=
 =?utf-8?B?ZU9Bc2VtVUQwdXBKNmpVdXZEWjc3TDRZdHdWOGl1YmxhNTl1TDd1emFUWTNz?=
 =?utf-8?B?UVJUdDg5cUNuNm03dnhJN3A5Um4rMEw1QWNwVjBmWXNBMHdJUUl1TmpmL2VU?=
 =?utf-8?B?NGtiT0t5WnU2TWlqd2NXWmIzR1NuWHNjMURCaWRiR0NMMHlHVVFiZERLbC8z?=
 =?utf-8?B?bk4vYVp3bTR1QTlkRUxtbC9jNTJxZE1nTjd6RGNOM2JocHpyaE9OMG1IeWVW?=
 =?utf-8?B?NFhQYWtNdDVnc0RSdWgxa08veGJ2TnYvRkREYjNkVFhjT2Y2YkdpSE1BSVo0?=
 =?utf-8?B?bUlicWtmc290dk1Odnp5MWsrSUJZbXVqdnlGVVhha01JUEVpYjdZSTJqaWUr?=
 =?utf-8?B?SjhxaHliNVlpYVdHQitmdE8vNmJmbWlWWDZzTHNzN3dFaVUrdmRyajFqMkdX?=
 =?utf-8?B?VlZjdzh2cFlMMWpRZFhhL0plbE5Tb29NTFlzRXN2QzNGLzZJTTM0enJ1R1p4?=
 =?utf-8?B?ZDRTeTVzM3FYenlOVTVRUTgrZC9XQnJkM0Fnc3J6cFRPNE1nR1M0Y3ozY1hU?=
 =?utf-8?B?VVN6bm54d0FBdUdXSVRmVUkzellDcENROERlaHNkaXVZVmx2UEhEclFmRGNN?=
 =?utf-8?B?UHloVVBSL0k3WDRvZXpyaUwzZFF2UytHaVFqN0M4Z3FpbzlZSWVrTUNyVUxZ?=
 =?utf-8?B?Sk9lV1djc2RyVXIyMTVHNFBoTVhXWFJ4UXpWWndvNVVQai9PdnNUQkpuelZM?=
 =?utf-8?B?WWx2YXJTNWd2aTVHS3puNldjRy9lWVlQWU4wZXg1djRFUVlOcDA2amxIbCs3?=
 =?utf-8?Q?LWLf3QPMx8Nq5vkpcZNHpUVJ0+RC3PdtrHjkri8LfMLs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNQMmMvNXBFcGhKUUF1Nk9sWEVlZkVld1d3VnpBdGZmeFRTZkI2cTdUcEVR?=
 =?utf-8?B?N3RjUks5UklqYWplaUQwSlBJWENaYU5vRm5CU1lqTDVQbi83c0U3QTVLeVBY?=
 =?utf-8?B?T3RIRXI4Qk9BN1Q0SWlWOEVBMTZ0WnZhZ0w1WlRIdzFQRkFpeVIwYXVjZVcv?=
 =?utf-8?B?bytlUWVONzU2RjNKd1JDS2t3V2hWN2kydTI4Zkk4RVNHTHdEMCtEMFpsYzhp?=
 =?utf-8?B?QjJBY2lkTW8yTUo2RlArUjJPMzhtK3FtQXRVRXErajNSOEZtU09yT2ZOQW96?=
 =?utf-8?B?NGszMWMwa0VSUGVud25qWW5SUko5V0U1V0VBMjBkS1FkNUVTVFQ3WWRZUVNX?=
 =?utf-8?B?dVU3cEROZWNGZ29SODJ2OGNJb1k2bkQ5ZGV0SXpKbTlMY3dtRlV5Q09ETHhU?=
 =?utf-8?B?ZG9LQWhkeldjS0RxSDkyTjVVN3JjSUpvTEw5aVRtSlV0OHpoNWJDT3d1ajh1?=
 =?utf-8?B?N2dLQzBraEJzdHZmbTJ3dGxIWjIyVWdzSmt1N09SbEQrQ25ZSXJBa0lJLzR3?=
 =?utf-8?B?YlVrRUoyeGFpazFPQmhQRlVaRytFZUlpbStkSXhCRlRpYVpKOGVCczA2NGdQ?=
 =?utf-8?B?WnlpOHVQME5iMmt0MjNjamdJMVpZNkpuQ09obnFVenpwR0RmWjF5d3R4MFRs?=
 =?utf-8?B?QnZaUENJNTR0TDdCaGhQMEpzT04weGdDeDBkaXdFeTF1OWM0N1ZhaEVKaHZL?=
 =?utf-8?B?WUh2VDhaTlJCK1NHTTFrVTB6dXBaSnUzSlhpVjR1OU0wYTY3S1RVcjA1OUpM?=
 =?utf-8?B?VDFVR2FJbnR6L2xUenhHczdESVVqdjR4aGlaZW5MODQ2N01JLzJtbnNKUklS?=
 =?utf-8?B?UGYxL3FnR0tIMVFXZmZEOG5ia1hhb3UvSjJuU3A3MHJ2bWFSeDYvMXFYSGlj?=
 =?utf-8?B?aFJiUTBsUkxpUGorSGt4YWJjVm1CTzZ3MkN0d1NZVGNSMXVhSzhldHdmb0tT?=
 =?utf-8?B?R25YMG5DcW1oeTFNamFhMk9FL0F2QzM0R3N4TFZtV29LdlVrejdNcGRFdFl3?=
 =?utf-8?B?RkN6RUJWWlNhK1FMYzdrVzJrSytGRFVMSDNnZDVFcmgzRTBJdVZNelowZ2R3?=
 =?utf-8?B?NGt2TWpPdTRJUEdsZTQyWXJLck5HYXI4cHR6ZlB3TUhnTFdjWE1qblhTa0Ir?=
 =?utf-8?B?N1dIT3pjYTZ0eVRxTFIydS9hMFVaMHErOGN1QU1wVFY4Y21rRFZuV2pQT2R1?=
 =?utf-8?B?TmcxZFdERGNLMkNhNUNvS0tTWFAvdzdOQ3h2MFk2cm1rT3U2UUkxRFFxWTVD?=
 =?utf-8?B?QTAwOVM3aG1JN0oreHpvYmtJdEpBVEtBNlpEY0ZwYzhXdFZlejRWM1h2anU2?=
 =?utf-8?B?cFR3Zk9sb0hKYzRucC9YU09SRmZlMFYvZlo3aFdpVHBzSGdrL0c4QVhGVnln?=
 =?utf-8?B?SGNFU0UxdFM2WjJKcFFjNTY1dGN3WEhuaGZLZCtBclJIeG8wV2V1QVdxakhH?=
 =?utf-8?B?ZEQ1WnIxT0NHbWdvaTZsb0diZDA1TkFEb2Y1Tms4TmRiNmEyazNncU5UM3Mw?=
 =?utf-8?B?OGluYWN0RnpwL0NOeGRza0xFVlZocXQ5VG5IdTk2clZSRC9VMlZkczYzRkNK?=
 =?utf-8?B?Q1MzdUJmRTk2d0M3SHZHdStLUVpnSzAyMUhOVCthK3hEbjdYQ3JHeDdRYVl5?=
 =?utf-8?B?aFppNG5YNzlPbUtuZVpMTHEvL0xIUXdzZjBwRDRCSjJORFRRR3JTL1FjbDlH?=
 =?utf-8?B?aDBtakxPbTVCeGc3SU9HU1hFbGY1NUY4cGhUNGlnVlFhVThaSlc4cTdpNWFH?=
 =?utf-8?Q?ynFRqVQbMMIc4ouUxFOBewblGKOEof+5WCkneHe?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e497483c-f6e8-4d87-4881-08ddf0c77b53
X-MS-Exchange-CrossTenant-AuthSource: MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 00:09:31.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_170957_597387_98AA3A99 
X-CRM114-Status: UNSURE (   8.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On 9/10/2025 10:34 PM, Bjorn Helgaas wrote:
> On Wed, Sep 10, 2025 at 10:08:39AM +0800, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> Add support for PCIe controller in SG2042 SoC. The controller
>> uses the Cadence PCIe core programmed by pcie-cadence*.c. The
>> PCIe controller will work in host mode only, supporting data
>> rate(gen4) and lanes(x16 or x8).
> Strictly speaking, "gen4" is a spec revision, not a data rate.
> Include the GT/s rate instead or in addition.  We can fix this when
> merging if there's no other reason to repost (I assume you mean 16
> GT/s).  Will also add spaces before the open "(".

Yes, I meant 16 GT/s.

Please help fix this when merging together with dropping period at end 
of subject for the [2/7], if no repost.

Thanks,

Chen



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
