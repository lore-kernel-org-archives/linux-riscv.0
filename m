Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E24DE95A61
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Oct 2023 13:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojDutbgx4mSA86UUIpZEVdeLMN41Yd3tAWMTYkBev8s=; b=kc2dURz1y+BxPPGIzLqpRoNuK9
	tVj+wWEcjy2pGwyo2d1kPP9Sz5w2rPqYZBegCoqo2BHgwwNv6/AeLwJ3GqTqzeAFQKhqa+37fz5g1
	OHBEPxWg4hIeE3EuN2BtqegNl/+izyWuJ8kyuDGAlVzfFyZTz6FuFPj+1P9Np1LEhWHxU5P2yLhwH
	RU66yOdM4XIfMnajanIlVe8wobIX/6bExxcAam7GlOdJgkaQmWwLTCrkI8ijxGPUemcwe3kNRhJ22
	yEmG78PmogVIwZP9AgLhGV1Nb+8sOmtnc/rMN+pghktOWqmT8M6va1A8zmBVjqzer2SJDBU2cNV5h
	QZSc/+CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6xw-007aGX-0G;
	Sat, 07 Oct 2023 13:03:32 +0000
Received: from mail-maxind01olkn2081b.outbound.protection.outlook.com ([2a01:111:f403:700f::81b] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qp6xs-007aG7-1n
	for linux-riscv@lists.infradead.org;
	Sat, 07 Oct 2023 13:03:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGjzipeX8eUMiH0mCcU/bMwn2583OBAG1ld1tVnwKHRyoywrvvz6M10jHFA9NfUIHnktphXdHCOiGk0n9oVIq8qp3HFvtJDyjHFSEPDx7TabygYYi6mxU4uzoeypLJuLQsyNY328TdqugUS3WRGb6C71i6YdWFiQ409pwVUAO8GQ9FfX6HDUHvSJ+oYZjM/iA3cqZXY/v/TKQTEblTrx3AUdXHZi40vWGVm1pDLU3CIAybCn2CpEWweC78Vcw15TK/O9jyDkkPgCBxrheMP9CXOZj6Z6j+IX/VJJLPJwfj44ckvN6qMri004HUmkthyP2GEJTAHAScftZmY9V7b5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H88O51VXP1JqbIVWpsR7vc3jpeCIH6jm4NRkUNS0z2A=;
 b=JisOgryPgUcS2Mq0dZt4iKEiLTPw7nUIO9AOKp+Q/YtB5UkfcMc/vHbppFOXX8MJqOx76OHQoyCCoqMVOEc2ynOnmtiPruUA9tOX7cAXggsAenWkSu3xYWdYf4hJjgN0K/8LCCCoRXfae1oYpspsrC6U07ax7vH/g8B/uE1B27G3znHqzvaR/UsFS+rUC12+2ut3w54H2/I5q8wOmyNhiH3j9+2Jaa9wtwUenQ22SDyE5DJYhnSD0AvUQbZ/bGsQmgXvITbDiERlQDImZS5jcoQT6L5mwEeoZ+ebgtP2QL24lAXB7jZKoTHSBOH12aLytRWVWr4WWr6ifM1w3cCJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H88O51VXP1JqbIVWpsR7vc3jpeCIH6jm4NRkUNS0z2A=;
 b=ZtlIKtCqc7BmfczEW3fdFSPP7X7PNgFDBpLOHZpZcpbXmR10EeQT8DCsVaYx/LJ8BeGMpeoxZOXuBSTKYQFr+V0arQFsHOMqXhKx0OQAa+aJqVMIzvr/c+gtONJu7rbeyqpMjR14nlydxOHmFtr7ntr17+Sk/a4gUAoINR624C0O8uxZfiIcOPzYbrPtJYO+AY8QZ57jRwLmu/zbQSMDd2nSEkqFV4ohXJn2k5u2//YYwmSGAE3yiNPT84YJJGrfsKkO9gGwDMIHc/fhBbFehSGK5PHdkqs2MLEcSlpGb1XQMnz8m/x/ejmyJAXETvEt3t/sX+Z79R7hEsTnpln/Zg==
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:ab::5) by
 PN3P287MB0942.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:174::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.41; Sat, 7 Oct 2023 12:48:40 +0000
Received: from MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7]) by MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 ([fe80::efe9:8d54:281b:23f7%3]) with mapi id 15.20.6838.040; Sat, 7 Oct 2023
 12:48:40 +0000
Message-ID: <MA0P287MB0332B11A8481F491E4F0536DFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 7 Oct 2023 20:48:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Add Milk-V Pioneer RISC-V board support
To: Conor Dooley <conor@kernel.org>
Cc: Chen Wang <unicornxw@gmail.com>, aou@eecs.berkeley.edu,
 chao.wei@sophgo.com, devicetree@vger.kernel.org, guoren@kernel.org,
 jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 xiaoguang.xing@sophgo.com, apatel@ventanamicro.com
References: <cover.1696663037.git.unicorn_wang@outlook.com>
 <20231007-grasp-retake-0463858c13df@spud>
 <MA0P287MB0332F80102F534CBD7412ED3FEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <20231007-kennel-lustily-59b0a9867aaa@spud>
 <MA0P287MB03329460B9F3B79B1148A6FDFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM>
 <20231007-green-correct-11d08f650ddd@spud>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20231007-green-correct-11d08f650ddd@spud>
X-TMN: [82rjz9MFA51EZS27qsp+H9zC/5TUKB3H]
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:ab::5)
X-Microsoft-Original-Message-ID: <63d75ecf-2019-411e-8a48-86d64642eb17@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB0332:EE_|PN3P287MB0942:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c0a5f7-6f48-4a35-619b-08dbc733ba93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6koPnRU81fEFNM74IJFC4VFtCNfPlDsnPTMgGbR/0vMC3mYnRxvOoFxDOQkx42DdYgL6VOkDG/r5SsNQVDVIlxBXS8C+GFzQjQ0CmYoEy3m5evg/hrprp6ZpkAconfqh9tiyge2sXGdGbXFNTomJk39IUWdogCZxlPWPmE491SUFfe9EsFAlEDmmYHrXPmDb+mOM+4dLwk5J4vxIb5ZEtw67di8p0tyCJzJ09LdQ2Zg+t8UptlMMD27QL3rAMUH4++eYWaXmv3eeGrAOJHgec/YOwtxu8C979kaM1bLlaOnM1RK5NJ6Zx1hnjpmiOwZDFW8suF1ZTDp2VIq96rq5ohw4qkX3+ZR9evl5Ayu98jDhdyMGUH4dX+3/+YhiRafDs6/mm01gllHuerU8H4PGGyUNS9TJ1X60Nk6ss83lQTv+LQ9R/0nTR0rLfOo3mkxtejs8tfubxTIYGzqccLrOpXe5DdLQzaFetMuIBrjn3K2RXyDG0LkFtfDrHfuh4msm5rlTJzPxsSVyNVw65YPPqTr1OmhvwP2+FkqEp93+c8PdK9Elx1b/dhgSLxHPoTdj1AMlRjYFIujF4IsnKVTEv1E98WGwWD8x264b42WrDyY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmVpUUpGVkU2dFVZUGViMW02ZnRHbyt3eWhRbDE2NnR4MktBc3U4UUx6TVds?=
 =?utf-8?B?RGpZL3hPSTdJNkZHU24wYnpqTlQxcDZYQWVEVnNUNXlyY1ZOb3M2UlVPdVNv?=
 =?utf-8?B?UmtyUjhvWjdiUXZMWWZsMnpaRjVhMXpqazQ1SFI0SzBNMzVDU21ubmhTMVRj?=
 =?utf-8?B?eFVWUlExeUY0WG1kVjBpS3VGZnF0dnZCMlVicGQ1RXkyUjZCQUEzVmkxMkRj?=
 =?utf-8?B?VndPRW4vakd1WUxHYS9icStCNkRTaUR5RllxTEoxRjkwb1pQa3kxZFJIMnRj?=
 =?utf-8?B?MjFUeTZuRU9tMUh2NUMrK3psWjJialRBaWdCMEpLSTI4K0VkbXYwaHVyZVJN?=
 =?utf-8?B?TTZuZ3FkckJDcEh6N0VhRC9tRlorTGI0ajVVMi81S3FzUTA5RG0zT2RZOW4y?=
 =?utf-8?B?MVkyMGZrWG9sOE1ETjkxUnE0QlJCY1ozWk1lTytoTkpESFNQNklrNG5xc1E5?=
 =?utf-8?B?NVNpTWVTeXVrWlgyY3JyVGJoM1pXcjFjaUsybWFFQVBCNlRNTzQ0TUV0a2J3?=
 =?utf-8?B?YWJxSElBME9ZSGx2UzhYWXk0TkRHZ1NiUVZhTndxclpTQWpuUmdqUDZNTW5L?=
 =?utf-8?B?MnZqS1k0dEVzTGZpSUtUMFZ0ZXFlbkk0VHljdXpCVXptVXRtQ0VBMXVRVXlR?=
 =?utf-8?B?amhDbFgvNHhRM21nK1kwWEh1enR0cG10eG1KR294WDU0TnVoWWN5eHFBV0dC?=
 =?utf-8?B?SDN5eHgvYXd6WXNMR0ozcWNGQzJsQlNSUnNXSXFiQUZuWUZvYzZrUHIwMVdF?=
 =?utf-8?B?RmV0U2VpbEpReU0yT0Zmd1l4OW54YmtZMmhmNk1sRWlRSUNGUzdxY2RPWG5M?=
 =?utf-8?B?ZGtoeHZBZi9pT0k3MzVnNG9ROXdsaTh3VzdGYVA2eTFWekJ6NGJxVm92L0dP?=
 =?utf-8?B?NUYxZCsxdllFQjh5Wlg0cUpLNHo5aHU0NVBYNUVDV2ozczFlWXFyVDFyZVhW?=
 =?utf-8?B?Lyt4d0VRVFB0aWF5c2VTbEhCWHBRSVRoY2NxQjUxYkxaSC9jRHpKMEdwcm1C?=
 =?utf-8?B?YVRFS25iTHQxaXZkZGRESU5kNU85ZzRxSVMyb3JwN05XK0ROSlgrWGVBaVIz?=
 =?utf-8?B?Qm9wbHRTdVFya1FtSlRndjNmQ3VuNTRXcVZIUitMcDRlZW56bEdCVENIU3RT?=
 =?utf-8?B?YkttdVZiNVFYL0NpbnVzZ0YwY1NjNy9mZHlCKzRFWGVSclpCMnE1QlRhS3hU?=
 =?utf-8?B?RTJPU3lHdzV6dHNqeXlJWjRKQXI5QWV6WVpubUxBcmpwTndTWG45OEVyZTlH?=
 =?utf-8?B?YXg3cTBRTFgrTjM1b3UxL0pHRzlzc1o2MVdrSWpTV1lhZGNQb0NMMng4REty?=
 =?utf-8?B?SGo2YnBxM0ltQ2dBUmVTK3dBVWRJekI0d1dKUlhDcUhwa2JPNUNhWTZIR1cx?=
 =?utf-8?B?ekFKV256SnBSUDF6YTZqSzhhNGxaeHh1Mi8vMWVlWjJqS3ZEZjhaNVJKeFFL?=
 =?utf-8?B?eUZGd3NiUzhTSnQvQTk0d0JWL2JjSHZUdFROTExueHh5NDc4cVM0d2tmTmdx?=
 =?utf-8?B?MUd2L1B3UDJ4Mk5zSzVMNTNVR29qSG1vZnIzcTdwaUk0UlhWWjhMeENVYnk3?=
 =?utf-8?B?YUkxWlNVQmlYR3JHR3Zab25ZUHBScm4vMStZS2IzTTl3NEF0aWg3eVJNR1pT?=
 =?utf-8?Q?Jcdd+VcPE/XJ42PWpAPfggtFkpOmsqB7Um1yu0+yPktY=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c0a5f7-6f48-4a35-619b-08dbc733ba93
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0332.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2023 12:48:40.1776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0942
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_060328_624696_FCFA0256 
X-CRM114-Status: GOOD (  13.85  )
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


On 2023/10/7 20:36, Conor Dooley wrote:
> On Sat, Oct 07, 2023 at 08:25:55PM +0800, Chen Wang wrote:
>> On 2023/10/7 19:04, Conor Dooley wrote:
>>> On Sat, Oct 07, 2023 at 06:58:51PM +0800, Chen Wang wrote:
>>>> On 2023/10/7 18:17, Conor Dooley wrote:
>>>>> On Sat, Oct 07, 2023 at 03:52:04PM +0800, Chen Wang wrote:
>>>>>> From: Chen Wang <unicorn_wang@outlook.com>
>>>>>> Changes in v5:
>>>>>>      The patch series is based on v6.6-rc1. You can simply review or test
>>>>>>      the patches at the link [7].
>>>>>>      - dts: changed plic to support external interrupt
>>>>>>      - pickup improvements from Conor, details refer to [8].
>>>>> Did you? I only see them partially picked up. I'll just replace patch 8
>>>>> with the patch 8 from this series I think.
>>>> Yes, only the patch 8 of this series(v5) is updated for plic node. For other
>>>> patches, I just cherry-picked them from previous "sophon" branch.
>>> But added my signoff? I ended up seeing my signoff on the patch where I
>>> disagreed with the commit message, which was confusing to me.
>> Oh, I used to think I can keep the exising signoff and I didn't mean to add
>> it.
> I added mine when I applied the patches. It no longer makes sense when
> you resent another version.
>
>> Anyway, I agree your suggestion to create a new patch with only one
>> change should be better, I will follow this in later work.
> :)
>
>> Regarding your changes on sg2042 series, I have acked in another email : https://lore.kernel.org/linux-riscv/MA0P287MB0332BA73D0135CC73CAEA16DFEC8A@MA0P287MB0332.INDP287.PROD.OUTLOOK.COM/.
>> If anything else required, please feel free let me know.
> An ack on Jisheng's series for the cv1800b would be nice.

Done, I have reviewed and acked all the files related to sophgo.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
