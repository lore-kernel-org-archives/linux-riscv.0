Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6284AC47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 07:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sYJAK4MiyBe5utOoSjA5/iJAn7rEXXtwZnFtJjx2Fk=; b=ZzwNKolwqZCkOy
	Ra676/kZ9zhIqQVyPtGLDi//pNyIHhJ8A1MAbXrZ7usC1JlVK4dRd6NIaJ54mmKfOIqHu/U0+eOGw
	8mav2hk4H1exPGr1ZecW97fp0N1kiaQ8Kf75k6LkyrcmxfjP9C4ar+6HJOCKiOvOofgH+4+Hu/ti3
	LBoSiCch3ehkUQHLYilrKNp+j/aOngwStXcIv1sdq7sG6H6dWxZZ+mGukIHH3dXfpjndZgXHrtk20
	5Ll5jrZnVQ4w328Y949jnyvr0IVcdRJmlTmSoet60+ggRfAsBKGiM7QlLKgxYKGuAs6GDtIRElu0B
	nvTGlHCmLjnjUMqVcA9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpNy1-00000007ry0-2AF3;
	Wed, 27 Mar 2024 07:45:01 +0000
Received: from mail-dm6nam10acsn20801.outbound.protection.outlook.com ([2a01:111:f400:7e88::801] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpNxy-00000007rwb-1aXF
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 07:45:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f1IfJvglFeTdBYaQQFgTO5X4lAdBFueLEljDKLJyFQdZoEVpwxLJhSApsdesLQm35CVeCJXPu/Xo1G0AtcdPjuArLxN/15TIRkTwcQpTYnkWOp+wDTBtMh+3kxvRSG+CIyhE1OcslSFw0PxrSjQCO7eOaj+duTOrwtOITZN0UobDLEdZ9qJGS8T8aPc6LlotFnUe2hg3amTl4ucGTtCHAAbxAYBZGW+jSfSpCnEt8RGbFHi5X7o1kRpGp5eI/IRUpt64VVLJHps3Rw2WDshepb8vlpPyiT/xxL4LUDYjjVDKi+unfw8EOtAKAYXxSNjWXDnPUXoFd+UdHKn1E/8HOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUCn0x4ILGUNIkbBmqKlextH6ZrTLFd+PaEcZ+WLomE=;
 b=SM/Q56go08skQ3KvZ3S1cmXweBaonRsN4yn7AIYuE8vlFwmOUT//sTvf7GhkJmNpShHdjHG67n/io7Ev8JSTRbCOzcsJnf2kUuTmXUME5Mw2Icw8Oa8u63De63PPsKeyE/5742HUA20LtIpZmN/crOUsmG5utylwtkUG+4v5Ex3YJWRj+wwcaXRw1gQZzhbB3muYdfms+h6yEM9pq6rCyjGzO67VmoIVw/ZKa9MXOH/N0JqW5amJkxAdCACRLS0sinCrNvXbytsESQmLXYqzJKjzTLzKpTSnpFQUgqaIOTsF+SHT4VBdBy9CPMGock7ehU22hFdNpjAgUlI8ujNuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUCn0x4ILGUNIkbBmqKlextH6ZrTLFd+PaEcZ+WLomE=;
 b=hQKIS1qehzEDf/q6G6owtFaDYuJib9eoWwAp7BhxKD1iFzyjXPRD+DqFre4ifVaP3iwE6Fe7BpBI9GWiDBdaUGY3thZdXLm++rMi6XXFQnjymXJc7dbtOGjUJCy2AZSQ0kMpqXXvxHRFX9qPaRd7zHa2j6oSnt4H6ELQhkXUYPsIpF5giBp0/Tla66v8SBmDWcGHtl4a7VhAl6Qcw2YjPL8YvUyhFMZC6XA53zyHdHBcdAlMmK4K9RrHA7s41m3klMfAwsYKyuDPQCkDLCjMyGaVYYF9OSNmcuzs0oMttjnWCad5LCo5MUsyylxtVTb3HetA/3A0CprwQ8rS9Uvb4A==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by IA1PR20MB4875.namprd20.prod.outlook.com (2603:10b6:208:3e5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.26; Wed, 27 Mar
 2024 07:44:48 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::182f:841b:6e76:b819%2]) with mapi id 15.20.7409.026; Wed, 27 Mar 2024
 07:44:48 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH RFC] riscv: dts: sophgo: add sdcard support for milkv duo
Date: Wed, 27 Mar 2024 15:44:29 +0800
Message-ID: <IA1PR20MB4953436EB1E28CB565BD3F36BB342@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240217144826.3944-1-jszhang@kernel.org>
References: <20240217144826.3944-1-jszhang@kernel.org>
X-TMN: [h47+O4QdPLnBmwit97l1meqlj3SspzrH7IPqtSEKeps=]
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <171152545132.1459004.12521619420853775227.b4-ty@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|IA1PR20MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a28d98-bb20-4eac-14fd-08dc4e31c740
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLbpndB91SV6jhdom/SPB1VT+3tbp/oQ61sLHcLuR8+TsXsbPlnF3xvANQloCPLA/fYK3BYf++yxjWCLSsjl7MK4xZyKMBthO+kgCE4AjnlkAoYK6YLislEK9YSSqvtEraLFjYua+vAl5xnfivq+YiijC+eNO9GgXoGqU1VymN/MpxVnMZLSJpwlxnpcUBICViOvjpjNx8YdMvuzmLhX3ECSI8RnNwN5+Rma2/idqE8zBU7kB0hONr4sf3jd64w5JOSVbvCieOQfiFDt67PEWbpDUwlCsBSiPEnRHznrF5sXBtPfbotNOR6ttOtDFX3tH7lWfZRfKBWXTuLZ9FsEHWmyqSqX51LrwtovlAYh2Zb6p1/7nKf4NDK7Ni51n0BvCTwcFbN+urnKGV/L0oHORM7x2uYLUapCtrjIKO2tNCkFfZ/AwTgKfvWoUc+Zp5XzH7khgwBa06YqZ+YjwFN0loPgqpCFDfwaLOwaD7gJGk5o0nGRv9JetCSmMcfK1JUDxKQby7aNwqgIpFxrM5BBTggPuTlPBd2bzDHssgSShTjW3C5Xq/mRxEWMubbytTZ5vL1lWP7o/ycJqwVRRdE+fiAqingtmuMkfRg36JEMdYo3AD7E+FroqJ2jlzOueYAuc6rH+oNrE/FNtn10n13Tjdgs2H962OlVEpNHwtacqS+PO3jwNsH9sRhHSFESDz52
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVVOYyt0OVYxcms5ZEtXOXV5N3QrRTF2dmx2QjBkdUgrczhlUHNVdGV4NDIr?=
 =?utf-8?B?cU4wUXZwQWF5RnordXdYZEJrOTJmVmVvL0YvSi9PZWZHSmpDT3BUZWFEdVV0?=
 =?utf-8?B?SVRBWEtiSHQ5aDZ1RFhoT1oyNm1UNm9VM0thNHlnTWtXOGpjYzJUd0EwWDUv?=
 =?utf-8?B?Q2F4bGpNNWI5OVU3OWhpQkxaVnMrRnNzTlpRMDlWYTF1aVRpZk9nenpXSHRq?=
 =?utf-8?B?ZDNiYnJlblZReHlUSUovRGtUZXJvZ3hZRnNxWGFZRGVNYTRmL25vN1d3d2c1?=
 =?utf-8?B?ZFdyTGdaUDU2QldpL0xsTmV5d3QxMXVQSVRiWXVHcURCY0dZdHJLR0kxQ1ZF?=
 =?utf-8?B?QmU5MjlFeEhkV0QrTEplVGk4bDNkZ0Q5bFdtQ1Q2M3VZZ3NrdXdnOTV3dm1N?=
 =?utf-8?B?K2Y0NjFpVmtWVjE4RmRaWmhKU1VDeCtCM0R4cHJXb1ovVzFXdU0yUVZGSjIy?=
 =?utf-8?B?NEwzWm1pYkZiNnZxUndyTGFoSU5QNG9hWkZmaiswNURqMTQ5VDFqdG41RnFs?=
 =?utf-8?B?S2g4ZXNFcnFJTlF6cjltNWZwZ3R2SjlOSnZTNmFwTFJVUXFYbldKVnIxQm5O?=
 =?utf-8?B?cjlKTmxLU1hhVm5HMmpZOHFrNStBSnlUVnhCZVd4M0hORHVkZzVCdllWSFls?=
 =?utf-8?B?Qnk1MWkzaEhuRVltczVKbXhobmZtL0NGbWl6dGphcCsvenpLK3J4U0pydk5Y?=
 =?utf-8?B?V0ZWZ0wxdzR0d0pybUxFdTBVb1poN0F5T0I3cmhRMlFLMi83TmZwcjJMSERj?=
 =?utf-8?B?TlRQNmtqMFlRcWlGT0Z5ZzZDdGgrYU13c3BvTUZJNEFqK3lnTW9jMHZISWhL?=
 =?utf-8?B?RkNWOU9aM2hsYWVYYncyd1RETmE5dGRtRWJkL1duMHYzak9Ya0d5eWpJdmVk?=
 =?utf-8?B?MVZLeTUzVDhkdXhRYmVwTGNiSWtBR3pYamlVWDFnaUJjOTBKSGtUbCtIak1z?=
 =?utf-8?B?NXRRam9PcmZYNFZPU0xNWk5uS1FYZXJZNXg0WCtUWDNLZEo3WGFQb0pJRkVH?=
 =?utf-8?B?YW1ZR25EaHNURlhTcnBVMEN2WFIzYXpYdFpwRUhzT2szY2ZkeHBOamNteGVT?=
 =?utf-8?B?TGNBMHg1WkQ3U0p5T2xsNHQ4VXRhdHpDQmc0SkQ3RVpkYzF6OHRNZ0M0cGpY?=
 =?utf-8?B?YTJ4YzFsbm5UMGx0d3paeUVaOFoxRzN0U3Vlc3lWZmxUbmNIZnRGSHdud1Qx?=
 =?utf-8?B?b2xyQXRjVlZsUVB1K05Ga2xxRDNXN1FrbkFFTUZSdG4vc3A5TnFTWjMyT3k0?=
 =?utf-8?B?VFNpYngyeGFpZEZtUG41ZVJrbW5FS2pxc05SaHlZZmlqSDZsYkJCTmxBNUtQ?=
 =?utf-8?B?RlhveThXeU5xcXQ2bGZIdFJRTXhqV0tCRU9NZGRGUXlqQVVtNWx0Qm1YdHE1?=
 =?utf-8?B?V0w2Y0N1Ynhqa3RrN2ZtdXRCdGpZUkZBcmxFVVB1YjBNdlJTZnRKV3JBT1Jv?=
 =?utf-8?B?ZFZjNG9NOGlHRmF0d0xBRzJDMjBqRUY1bUtYYVpLL1NpdFRSRjZ3TXNZbGcw?=
 =?utf-8?B?QXZWWEpqd1ZDUzBlSU1sbldrVnZkMDBaNUJVTnNsNGJLdS9IRWtaZzB0c21C?=
 =?utf-8?B?cTNBVVZSUTZTczRhZ0VNNGtWVWZLc0RpdXdNQXh1cDFoVHdFaC9mczRDOC9S?=
 =?utf-8?B?QmdmeEpMNlRtVmdrdzNzcy9uUFh1ODRVUGhWcHpJVm5KRk1rVjQzYkZzbWVl?=
 =?utf-8?Q?gxb7uYzH/4GepsFwq8HH?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a28d98-bb20-4eac-14fd-08dc4e31c740
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 07:44:48.4918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR20MB4875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_004458_447469_035209FC 
X-CRM114-Status: UNSURE (   5.00  )
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

On Sat, 17 Feb 2024 22:48:26 +0800, Jisheng Zhang wrote:
> Add sdhci dt node in SoC dtsi and enable it in milkv duo dts.
> 
> 

Applied to sophgo/for-next, thanks!

[1/1] riscv: dts: sophgo: add sdcard support for milkv duo
      https://github.com/sophgo/linux/commit/89a7056ed4f771e689729f7992ef5351e64e26c6

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
