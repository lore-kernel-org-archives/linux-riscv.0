Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7BCC2BA18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 00:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:To:Subject:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkE1qeX3NNC8GpBzU6KWDr1nAIry0KQO8li3fSvbj2M=; b=HufILSCfD/fR22y7yJvIe/Clfe
	6GQr0Mm4WYb08EypABBUDuXAJnZOSWrvnWMzdICyIN+V94ZDl1VmobWNEejvcdoFVWkML5LHPVpfX
	8MUnOCBGwa0pzkqONxey6wxdGcN96rExYD0CBBAT2ryQxqjDAtHcDU+rWbgWKBXdTmb9TYHui7B6p
	/jKAArrqJs8NVClJhzjRzzUzTi+aeKd9TzsXGoHNfkvppCyHFz398bgErGibfMXTDxAV4OX/ikuZY
	HFEMleBwlzb1uwFk3b8TfVj8D3OcU1kwGcvTVIGvUz07D/m97KVreZdpbuur6lvNMzoo7i/0QFlfn
	6g4y+Y8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJMTY-0000000D1fE-2dRf;
	Tue, 18 Jun 2024 00:13:28 +0000
Received: from mail-maxind01olkn20801.outbound.protection.outlook.com ([2a01:111:f403:281b::801] helo=IND01-MAX-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJMTU-0000000D1ck-2vqx
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 00:13:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIpaJlyZrLq/zJ3yRDQbByLm4TMyZ0/smlxtBuEK8Ly7LGem6JdEnxM8yvYZzHJPgI06rmTNB9asaFTXJhi3ggfu6klQlWoF6WovTtA4QcrvWbLxvAhkjMo7yzfvOsCTYHGggHcCObLOiqc53M4EmjD9i6vncsVxOJNP4FLZGzHWvNB6f72gYIallB45nbwlT0BFHvef9s4Rwfubn95GVc6DK7bCaaR6zMtlAvZioC16mpsZRLEHYNbu82tHR5c55sVhWJfaG0TSUExxRj26jHPXCa3WV6FdfkJPUJi9sHpsDysqX021PPY3GWEqOFmeF0ynnorohbrPXTfhoUVhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FkHLLGHfovyYPWmn7eD1NpIodXCD69EPIXZQH2qrxU4=;
 b=IK8+DIv/PihYiwOLewo8ge87lQckZdC/mxityjK+3eg+Z23r5wnLLp9zyZFuWCwwZPQc0peMQaMaJ9F5UzVh5Ts5ilUiiU8F57yntkVs5i2aWzyb1In9+g4Abdd7ejCLqF1O85lpoIDkgUvmdQo9un4WTuB9zx4E6ApjmtRt5E2wkHd2KeITj1JZ77VypaXaB/3DJPGUXc5CD5s9/TYu/7qGrDOGydlOeTI48hwhNlpvNuYJazc9bDSEmPs4nviZOu0BTIb3TGWZh6/XUNkKNDTIL5PebdgkMQszTHlAY6CcejwkNJI+Qo6x5Bzr/1aX0o4FBeo4CiJg1qDyClzxHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FkHLLGHfovyYPWmn7eD1NpIodXCD69EPIXZQH2qrxU4=;
 b=WBgEgdTKN6LPVDQkeKzWQKNOfRO7CgJ1Vdrpw7+u6sY6Oxm9z6sql4n4cIY3eoM5A7DA+AAKdWqoIhnavXcIkz5SmqjmHX0u80LoWEIGJ512nlgdNXu0H2euZdmQTKbUhVpAVS71H639+8iSYpxec0nLawp10wwnSkthkVQ8sjbxNwPMOQoHVOxmXzlRwUcB09g8nDmKWVSB6+fHf0+CUH5a1Q4y0L6MHLExcXZFwQr11zJQCZU8NVb/NR6aAhUGPLiN1GlrLkNjcgtWmka0D3Y/AUtRfEx9ZAGWN/a7tmpXuh2mtZMm6WLfATA2z6NaUIuD+f07UnXUkbnjpjz2mg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB1497.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 00:13:14 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 00:13:14 +0000
Message-ID: <MA0P287MB2822987797BDC01D4FFBF8C6FECE2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 18 Jun 2024 08:13:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] mmc: sdhci-of-dwcmshc: unify the naming of soc
 helper functions
To: Adrian Hunter <adrian.hunter@intel.com>, Chen Wang <unicornxw@gmail.com>,
 aou@eecs.berkeley.edu, conor+dt@kernel.org, guoren@kernel.org,
 inochiama@outlook.com, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, robh@kernel.org, ulf.hansson@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-riscv@lists.infradead.org,
 chao.wei@sophgo.com, haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
 tingzhu.wang@sophgo.com
References: <cover.1718241495.git.unicorn_wang@outlook.com>
 <91adce8d020faa22a97719e8774dda01a58333e7.1718241495.git.unicorn_wang@outlook.com>
 <aff10a8c-bac8-49ba-af0b-3681961eff80@intel.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <aff10a8c-bac8-49ba-af0b-3681961eff80@intel.com>
X-TMN: [uIaCLE2P745TRVTWqKT5u9+T3hyrBVd7]
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID: <937f52f6-0b52-40f3-a350-af9e03e49323@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB1497:EE_
X-MS-Office365-Filtering-Correlation-Id: 8269813d-a585-489a-b5d6-08dc8f2b7269
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199025|3412199022|440099025;
X-Microsoft-Antispam-Message-Info: PSJeaka95z3dEuj/vZWo6YoYnsNjWc6vFurA2N6y4qFg8lJrvo+0dsy8r2a8nFACuiv9CnI98OhjkWh8G45a9+3bDJCwzzIIyiCIwJ4lwzMv3LkOIrjANYQpFLn3r8M/Du5t944Z50q27aOsB1dN0lf1W8l2AabjgIowI0WA+i7ty9cLBrB/kttiwCEogdmEDowekn338fGkzMzYsNoX8niwgPXzG1qsenkBNNTEtsoD8qQXFAKUMTA9A9qvOosj4AQhCJvvqxDS26d70efHvmf0XXgnFD7bGWdPTa5mElZl2AtYwyljJdxJ0QIW6Z5DQxLL0iY6YY0lD9VJ1aD7eFPaMJaJWRGuySLJw2QQjWUhhsgvJ9SjQlZeJ6Vkf5rgckgTfJVQMh1dIYiV9n9Bo2ziYryjN+oNu4X/AJ2lwBIXM0rpF8EX3zE2gf7PAXl4GiJfrrL/NPhViKnJYKQUYUDuBoFVTBfYz2+l2CKJd7cPp57k7plzusEVSyEf8vSRAAdK5GXbsEnMvr+iKlK6rjwplLy9v2ytl2JsdtLR2K86IGBjibpWMRhWGPU/82nO
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KysvUkpvYlI2UnZxTDhaN2l2RHJFMjQxbVFwTnZkVXJLbVZSOVMxbFIreE9H?=
 =?utf-8?B?N2dWMit1VCtsdmJrRUhITmtWdlhGR1ExbzdaU1htQWlLZmp1L2xCc254WmtZ?=
 =?utf-8?B?dTlCKy9XZnY1ZGliRTNPNm52UzVKRDZCb1RQVktIdk4yRW8yVUh5QTlldVkw?=
 =?utf-8?B?M0JUU3JJeEU3OFo0TUw3U2tvTDFGdnpUV0xoMkFZMmpjcmpsTHI0OHNWeUpU?=
 =?utf-8?B?bkpabUVzeVJtdUNYZUxiVDRJTEZRcFEyZ2FnUkRDbjNoUHNwWWhVUkpMZHJK?=
 =?utf-8?B?L0VtZFgybzE4UDZ6MFVLdWFnMVZSM21iaTdCRi9DQjVTbWIrQUlsVnN4QXU2?=
 =?utf-8?B?amlSYmtmZTk2UldsZ0c1dTVNSVk3OWVKMjNtUkJmY0VGUUhDdzVyT2sveXMy?=
 =?utf-8?B?akxueXlDYVNwRTc3ZFU2Qy9oUWU5R0FWSU04QWRjV2w3YlBqczNzdWcxUEc2?=
 =?utf-8?B?S09KSWxjUGIyZXpmUlhyR0ZLaGlMSFhKc3AwNDlsZjhtVDM0aWZUdHZXY0Vh?=
 =?utf-8?B?VHNMWlNzQnNoWURmZW15QU40WmUzNHZacndrejlVVHFZNlZFNmhVT29BZmVF?=
 =?utf-8?B?QVVLUFQ1bml0Q001VHBjOTVlRHVHYUVjN1BVblRaRktxN3JQRDBUSkEvVEhP?=
 =?utf-8?B?QzJndytaSmg2RGRybUllOS90WlNsMC80WHVhdjA0QzZjMlZxSHFkUUxxV1Ns?=
 =?utf-8?B?Ukw5Q2w2WnRqZFBHQk1pYmEvOTBETDE3ZjlMc0pkaCt6VTJNMGcvREtBVnJ2?=
 =?utf-8?B?c0Y1WUdPWWwxS3lKOW5aZ2R0QmFNOXVlVzZoc01PQnpqazVQVWlUUXBHS1l6?=
 =?utf-8?B?VXIzVG5SSzFyOHB4SC94cFdwRlVPcjRWVHBsWC9vK2pBWWZ5TThQTGx0YW04?=
 =?utf-8?B?c3BNbTBnbVFGeGFRQnVHQmVzbmgvR3pmdURMdmp6RlhzOGlYNS9yTWZyYUIx?=
 =?utf-8?B?UXhONXBXcTQ0ZWxqd3RDNmJVaVd5QTVidmpFWllMQmM3R3BCYW5lU2UxYjlJ?=
 =?utf-8?B?TUY4NTNvNW9HbHRuRE00STlsN3dkSG1WcmtYams5NW50UHlCM2JtdmdUVW05?=
 =?utf-8?B?VWlxaU1KSFFQbjVYSC80RG9wdTgrR0loRElGc2lMb1VVVVNMaW51NEhuRFhS?=
 =?utf-8?B?T2dmT0tSRzVBbG1HUWNCK3N4NVJCWGUvSUNkZTZLQkJsWmxVdDBBWGRSNkx6?=
 =?utf-8?B?WGFsMnpQRkZvdmtTT0VnaTFjSVNrYTBYL1dGY04wNFJMblNrMGFtd3NXZzdV?=
 =?utf-8?B?bWJHV3UwMGVNNXEvQzhPRzZjTUxrZFl0UjZsdCswZ2JrcE9Vd0pUVDhjRGlB?=
 =?utf-8?B?TTRLb0RMbkRyY1MyOUVFZDdGT3o2cTZIL1FGV2hlVWxsMjAwRHp6TERUQUFD?=
 =?utf-8?B?Z0d4aFBYMXNiUVNqcUVZeVAwR1BvUGw0eDUwSEUzTXVwa2NBa09YUlg2aUtH?=
 =?utf-8?B?U1daQmhyMXcrcmNEcitFbzluR3B1eEdZS0JOZnE0MlBKQk16c0oxMk83STc3?=
 =?utf-8?B?Z3dqdWFHeE4wRkV5ZVYvZlg0Z1kvTllkMzVvSDdNWXFKNVJKL1hncmRVM21o?=
 =?utf-8?B?cEgyb1h4TnN1RFF4R2FDSjFHNE5VTCtCaE4yaFJJQjgwZEVBRm02WXVzdVI5?=
 =?utf-8?B?SmE4ZTdqUnB3VTYyU21wSnBPWHVpb1EvQUprOFZmc01hV3JiRHVkY1lCdmdP?=
 =?utf-8?Q?R27Wm+GlmtnkSbyFyapW?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8269813d-a585-489a-b5d6-08dc8f2b7269
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 00:13:14.7307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1497
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_171324_819937_A9FE1CD7 
X-CRM114-Status: UNSURE (   9.00  )
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


On 2024/6/14 18:18, Adrian Hunter wrote:
> On 13/06/24 04:42, Chen Wang wrote:
>> From: Chen Wang <unicorn_wang@outlook.com>
>>
>> Continue another patch: "mmc: sdhci-of-dwcmshc: adjust positions
>> of helper routines".
>>
>> The helper functions at the dwcmshc level are all prefixed with
>> "dwcmshc_", which is easier to identify, while the functions at
>> the soc level are more confusing. Now they are uniformly prefixed
>> with the soc type string, such as "rk35xx_", "th1520_", etc.
> This does not seem to be necessary.
>
> Unnecessarily churning the code makes backports more difficult and
> complicates the code history, so it should be avoided in general.

Accepted.

[......]


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
