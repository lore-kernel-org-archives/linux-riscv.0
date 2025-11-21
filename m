Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB51CFA748
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 08:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd6+Ioywtg88Xkb58UT27W0MSmkh5PSY+cfJcsJnqb8=; b=r5A+HK+6HKq4tsb/aFPTXswuMv
	Bv3FhAYPyRZGGqHNK6EvbHB1NY3JRe3incGJ6V17E+o6njjUqL05Gq3ipEiU9XqUOcPuZqKfqWVSR
	YJH/wPEeK9Rms9dDV3E/DS6Qom67sfr3QfXspqW4mGgt9jkpVmvOWqiDq6B/KDjTcAJZrXmvqsfhZ
	eqvj2y6qmTQv+y5n1qllvfmcFLKmg+8Co0hMOx26NySSGjKnEBxUS9YE3hWj/JIDQ0slOuBQ/ptHi
	vjKLzG5lTAMLXLx2B6FMzlitI7iKkvvySsOZEHZAdYWBfKURB2/cc2uMTPwxn4tJ3JaoW3VdYSgT6
	rDi8oqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMCy-000000081Pk-1FHW;
	Fri, 21 Nov 2025 08:09:32 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMCw-000000081PP-2JV9
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 08:09:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHPXwN1aNjVQGD4ZohmWtpuXda40OFqBZgUR4JhcbLEHjZi9tq2j8y3OBLW/hZjUnUOufVm1T/zR45xMSdDgRAjPDfJWEjZyDofQYW3EtEVN13317FfF9iVKT7e+gTvIW3/SIKLCZNVMXI+lJtTX7Hqksg/8hSlU4ZZVlIZJtCH/twi4D6zI2nXQpK6oUEH+OZ783wrb/aGDAKVXwNdsg++yHwljW8DUM6/o0pKwVgK5ve5/YcBDHcNa2+ZCMoRM7pr6wsR1+awyKlOtt2/kCreYgZ/0fNK6sBsq0w8ltqL4aAa9sSIA0h8sj4gQzrQL0+YyC1Mc2ghzHOAM2H1aEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5N11BXh8w4TH8IPsBXQIIq+Omsa7wfobd95PbjWOYg=;
 b=HpfdTL1wVnV9ci4Ab6kmWn+fgpc9MQFRuIrepQmJ7ZYmP/dSbKzpkNT6ASllK8wkKguURjyOSA0jmIseCpIDEjRWLheJGsY6zYaLsqMjYnjkydBwU9a2u+ieLQ5r9IQipSodigAJIyn1c5K6D9yC8QuAll6UTAvlZHojzMIQ5aZwZp6fI11An/NtcpIa2jaul17aC4WWnX/RuM28tznvkCc9jQyXVavFFYeshnNy9fA0x3BsQhVEnnfDNFcyPHaMiogiklR3e9Na8QgYOykSHDcyh1g0yW8HJHWnwHUQDQYjoS6GxiARasad/NClTU20a7rx76VdLIA3v6hqf12ZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5N11BXh8w4TH8IPsBXQIIq+Omsa7wfobd95PbjWOYg=;
 b=ZfFB/OTiSf96r4F/rhk9QA6Maj8krhf6cVey8mJWALzehekKSQlseMxKnW+tl7o+aBwRtr8pYWKJLohN+qtfTwUKh/TDu5F/fgxoCHeMJdi22/pIH3DjCExbjFfd1umhZmPjFllAwIdLeLF+NPkDlQ+04d3GDhmkBmKJOP9S4uReSoeXkht8lKBPefgi3umINafjI2Qu/jZ4XoPA9Pu0UbSr+r962m8RZN6w3Me2b+9/EW3wWO0ysgeyFrCwfoSer/EqjarMB3Z2nguGRBg4MilntdpNagok/wZJ2YpuMHN7S/qklzTdHMjGfHazr7F+r7oyzyMaAMz03q7BYCnmZw==
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com (2603:1096:d10:5a::6)
 by SEYPR04MB7800.apcprd04.prod.outlook.com (2603:1096:101:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 08:09:19 +0000
Received: from KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa]) by KUZPR04MB9265.apcprd04.prod.outlook.com
 ([fe80::3c38:c065:daf4:cbfa%6]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 08:09:19 +0000
Message-ID: <KUZPR04MB9265EE0AF2054E4A8AB6852EF3D5A@KUZPR04MB9265.apcprd04.prod.outlook.com>
Date: Fri, 21 Nov 2025 16:09:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] perf tools: Add RISC-V trace PMU record
 capabilities
To: Anup Patel <apatel@ventanamicro.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>,
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Mayuresh Chitale <mchitale@ventanamicro.com>, Ingo Molnar
 <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>,
 Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>,
 Liang Kan <kan.liang@linux.intel.com>
References: <20251101154245.162492-1-apatel@ventanamicro.com>
 <20251101154245.162492-11-apatel@ventanamicro.com>
Content-Language: en-US
From: "Nutty.Liu" <nutty.liu@hotmail.com>
In-Reply-To: <20251101154245.162492-11-apatel@ventanamicro.com>
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To KUZPR04MB9265.apcprd04.prod.outlook.com
 (2603:1096:d10:5a::6)
X-Microsoft-Original-Message-ID: <147e7d96-5b9c-4877-a9bf-1eefb0cb5e5a@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUZPR04MB9265:EE_|SEYPR04MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fc31322-9585-47b6-e87b-08de28d54548
X-MS-Exchange-SLBlob-MailProps: Z68gl6A5j29nppRiBL+t9IooWqUrCzYH9ZIw2d7x5LdYzFL0m6nMGDKsDut8eQjJTA/aBPWFEKhZKkKgaMKv6ck2stloHQVGgL5qZP3tmZecFB1H1GYVqM/tj/FFBPcCmzgZ5nyqF4dtwyqNQoWqd243RNn0FMG26iz+f0kIB35+XWAZm2RlN2htUX7KF6XMEEJZIkke1k7p0FrePGNSGotNUiy8dDj/Nd9mSCrWUT9CXQfXoTUHMx9CrgJ3PwQ7tYMJXlzlaKQYD2Db4NAWW/Wpw15ON1IKN0SlnbYBtnUibZqVL54I7d9YWkVOIsfJ75uRJ+ren7nAAMqr+MiQjb24xd4/TUc6d1jAW6+/hUdqw+DsSQ2qTuyCtcSH5AG9qz7BaoaD7qfDKh3sCzKJ3cBB367iRntfLf8LGx5Wgyj2/5mKP8OoJ8oKOmzPkiIxsE9aVNqhml2tiSp5oQfvZRBWh7ucSTvXcVGpXX/+BjEfY+l1xcy6BmZ2cUXQlWxSPVAerPdW5Lm9C9RYgK1U4CpYZlCfMYiJFeDGelxZ3pWPP5dOiOke2F8a0t9f9YfvCJKwuOJQqS6cG5Xn4sSkc04+A/JoKRsCbP8tErGLEj9y7nTaj3dvWUfnsAG0MN43Ddln5jqmlYw0VqRJSnnKsXvRViFyZ8umACya2lEzVHJFkQCQMBtH6PXQlbECRZ0gi2EKn9udjqxACrXQFLY+dHQPwCMvi620L10sgLy5wrzpcuCwxrNeWy0/IcPexYbobYMbMUx/NxmerYAovPHcprEhCnfzHTqxCySH6QjU3jQCdXq8qiXK4op2f8y4+3v6
X-Microsoft-Antispam: BCL:0;ARA:14566002|5072599009|23021999003|37102599003|19110799012|41001999006|12121999013|15080799012|8060799015|51005399006|461199028|6090799003|40105399003|3412199025|440099028|12091999003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WFhNM3ZRUW1nM3ZCOUVXM0E2MTE0RXVXV1dFWUNmOFhRbXZUcnVoc3dRZW9a?=
 =?utf-8?B?bTBxTXFiSnZ5aElEWWtFR0tOMnYvS1VXQVE1aE1wdjBNZnNoMk1tSjY3S3Nl?=
 =?utf-8?B?cm5BYWRpdzFQWXVTMDhxWHNUaDNTVjlTUSs4dkI0L0VHNXFCOE1PTThIZDdm?=
 =?utf-8?B?WWhJYjNTQVVWTWpNZTlSSDRiNzREb20zNmN3VE5IaVRoSTVJTXlPdkVOdTUw?=
 =?utf-8?B?VnRtd3VobzFQN05IODBMcW0waHZiSjNFS2RlVUhiU3FUSm1ubU1QeFc1Qzl0?=
 =?utf-8?B?SnpGY3ovUE8wYzRMdTd6Y0pYMXE2NCtSSy9uM05XSmwwaHN6eFRaWTJBenRY?=
 =?utf-8?B?SnRobmd2TVUyWWdKY21QV01uc3MydUVkNWQzSjRiZFRzempiUzhrV2hrcUJ4?=
 =?utf-8?B?ZTRaS1hTSms5VVJqekhzWXNwSFN6RXFWZ2dhTThxUjQyTUczaE5qUkVlWnU5?=
 =?utf-8?B?WUV3dHpHU3F2YStaY3RMRzBlUUpXdWZWaTBaNkNKV1ZYbHdJSlI5STYwem9O?=
 =?utf-8?B?aS9FaEdhSDVUb2FjaEw5UXVEQmlPVFI0S2hEVE9SdXg3RnhzM1RIcG9RU0cw?=
 =?utf-8?B?OWhwSkd2dUh2cUZZS3pBdFdVd1kxaDVPc1I3bVpDcFU2VmZ4WmNOU1piY3hF?=
 =?utf-8?B?a0Z4NTl4a3BxNklwRDdxaUN5aEo0QTd6Z3VXRDI5ZWxsUDZRRUlIODNjaWEw?=
 =?utf-8?B?VkxLTjRVN3llMFd6ZDNpV1E0bGwzVDlLVDVIQVdwcm1rN0FsSmJ1R2lvazFP?=
 =?utf-8?B?bEVid25YdXZqd2NFSUFlb3FBOGt2blVzYnVEaXdheTA5K0VLK3poY3VuZkQy?=
 =?utf-8?B?UHVEdGZYVFYyaHpoRjEzcE05MVBaRkR1aytUVmVBTCtPYUlndG9NL1k2bjRs?=
 =?utf-8?B?cUp1aUdMZXRIN1YxNWo0WnZreEdNay9GSnNLK2JoS3pvQXFaSkkwakxKeTRF?=
 =?utf-8?B?STNEUDVSN2ZsQkoxQlpHenp0V2ZaQzRIaTg0QWNyc1UzaXRGak1ZUzE2V1Mw?=
 =?utf-8?B?NHBqNTloazZIYUtNU3N2aXA0QnJHVnN6eGRNNXZCSWZOdjJUdHR5TDdXaUUr?=
 =?utf-8?B?RnZwZ0RBS1RZMVZnSlluMkVNREJzMnVUTERpek0xSVBnRThLN2szRE92blhX?=
 =?utf-8?B?WTlFWE1razhjY2NNMVVMaWFSWDdkY1hPbS9waU53SStSeG1yQVNrVFF0L1Nl?=
 =?utf-8?B?SVJYZHVwU3Q2Q3lmVUovNkd1VnJYb3VKVlFaSmtkMm52NHRjUXlvOFlyMXVq?=
 =?utf-8?B?cFlSYktEMm9FZzB4UDZ5NkREWjQ0bVQya2RRbmlaazNROUZMQi9mWi9hNzJP?=
 =?utf-8?B?aHZQblY3OFRyWnI4Z1YvTyswTFM3R28xai9aZ2NEV2JVdEpaaThQdHFROHdM?=
 =?utf-8?B?enRjVDIwc0dLVURYU0xxN1lsVmtGVU9uZ1BlQlIxTDNRYjR6ZVFPNHZ4OFZr?=
 =?utf-8?B?WTNnMXdWMzNHTWtPbm51dWZiU0kwVDhRYmhwRW5VazlsTk9jd1U1dEd1QWNX?=
 =?utf-8?B?WmdzUTVRblUwMnBlTko0RFpLL3lDZUFGVGxkM3pMUnNkVDlnak9CYWlhbDlV?=
 =?utf-8?B?VjFoSFdPQUkxSDU4TSsxQnRDSFVpUjY4ZUtEQ0JmakRIL0I3TGU0dG9sSk9w?=
 =?utf-8?B?VVhNckwya1p0dnhIRmpoaE9kcGRLbXlQRGZVd3E2ck1hVnI3dWJoU1FtK3JH?=
 =?utf-8?B?RmtueWxxdGVaSVV0dlkrVzM4NldLOFI0bW5MbmlxTWs4Qi9pYkRTdUt0eUJX?=
 =?utf-8?B?UGxwWlJ6UXZrckdyb3pCVDlZMllsTjFqMnpqaEk3ekR6d21MVFVWNko4NXJu?=
 =?utf-8?B?MmJqZGVDdkNYczZqTkhPQT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjdodlV6dkFMYldJcjZ2WmVCY0E2aDVDRjFzR3NqVzYrK1orZlRLb3c4ZGNq?=
 =?utf-8?B?VFhsUUQ3aDl2L3J6Q1RVdlowRndBVFk5eTFYamJENU51cEVvRVRKSC9tV3E1?=
 =?utf-8?B?R2dDNE5YY2h0ZXhrY0QyWEZ1cXlyZHNwQ1RlandEa0w5WklPWGx2NXlpMGZM?=
 =?utf-8?B?SGJuL2tjQlR1RDAwaGJTM1NQdjBTSnFPcjZ5L3FDK0NtZkJ3R2gveW1zZlVl?=
 =?utf-8?B?SEc1V2xjRk5EaEptZXlnaVQ4eFY5bFovbDlyL0ovWWR3KzFEQi9oSThxMGRP?=
 =?utf-8?B?dU44WU1YOWZReWdhVTRjRjFWNmxHWnVmUjRDcVVzVEU4RGdzMy9HakduSFF3?=
 =?utf-8?B?NGNhdHoxWms0dERGMkRDWmRqWEcvaVdROEU0OXlVZkVwbzNET2lEb052blBZ?=
 =?utf-8?B?REJuSnZVNkpnZy8xWklZZmJDbHNMc0Q4NXZIY2JiclBuMTc3eUpDaTdmYk5L?=
 =?utf-8?B?NEg3Q2Y3ZDFadTZoeG9rR2JyRmtMYTVPRjlkcUtjaXlldDhNbHgxL2hUTGMx?=
 =?utf-8?B?UkwyUkpENmxHNE1pREFwRkdBUC8rZHluellNQlEwRDc2VXVkUy9IeGlKOW1Y?=
 =?utf-8?B?Mk15QlU5MUYvWU9WTGlHVk8ydDd6TzlNdDl0WmpRK0tyUmoxQks3NUZ5bjBk?=
 =?utf-8?B?VnJnOFFBQ2ZwZHhEc0JFYzJDeHpVNXA4dktsRjNXL2ZHdFRGT1VsbTJHTDV5?=
 =?utf-8?B?L1pHOGtSdTlJU0hLZUgyVk1YaW0zSzYzMSszbDNxYk1BaEpQcmRkampHbWxC?=
 =?utf-8?B?dE5rSmdyOVpHeEtlaXk4YzVPL2Y1M1RDbnBPNFB3YkVINWZiSEY5N0tWTVBs?=
 =?utf-8?B?RHNld2tJYVhNbXc0cEV1Mzc5UUk2a2xCTFJ5dEkxSDhuWHVSVmZHU1d3M25l?=
 =?utf-8?B?c0FHLzBxalB6d3NnZmhxK1FYMWJMYlB3OEZXRllaUThadWxkTkJwb1hhUldO?=
 =?utf-8?B?anYyanpPemQ0eW1GUERiZDl4MnBTWmFnbjBieUNPZWF2OC9aRkM3c2pLeUpo?=
 =?utf-8?B?ZmZENXJ5L2IvcXRsMm80SU1rQk5haHpWN0ljM25SdXExMXBkR00wekxxRnZr?=
 =?utf-8?B?b3liNGYwUmw5SXVOTEFSNHpwUGR0YkdlV2M0MFU0TDV3cXhHUkdKeU1Vb2ZB?=
 =?utf-8?B?cEZObjlOOEdMOTZDczloTVFUcTgrMUpCczNPdENGeXlmTk5zbjFrSnJOeWFZ?=
 =?utf-8?B?SmFrVlFscmV5c1loYXFML1pOTW9EallybWFKRHBWQlgvY0dWWWF4cmdOSldX?=
 =?utf-8?B?bStQK3ZyTzZMN0xRUHJaZXRsdm9ycXY1RmlnNHpYdzB3WjNIa0x4OGVLbWJ6?=
 =?utf-8?B?QXBEL3RyOWRmaFU3WHFYL2s5Vlk0QXZEbzJlbDg1V2dkSHh1U3FtdDFsZWJU?=
 =?utf-8?B?S1lIdGpmN0czT3dTRWxVeHJ6WFhuL3FoRXdycnBBWld4ckhFVEdsNDZTVytJ?=
 =?utf-8?B?alZYNEVYSktnSFd2Uk1LdDVhNmNNRmRadWlMMUJGek5DaXJLTVh2Y0s0U3RQ?=
 =?utf-8?B?ZjI5WXZDSGR1YjdiVGdxRE5oS3NvOUNaMTV2N0ZOK0RFUTlIKzNUdFgzSVJD?=
 =?utf-8?B?QVFZQTZ3Ri9ZVDl0UllUc3ZPVmtwRW9weHF2aDdnODNMVHJyYVJUT0NFWnpU?=
 =?utf-8?Q?06mLNdBgV7iTa53+xMIVk0LPI83HkdQ3po3XBxY+rP6c=3D?=
X-OriginatorOrg: sct-15-20-9052-0-msonline-outlook-38779.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fc31322-9585-47b6-e87b-08de28d54548
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB9265.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 08:09:19.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_000930_713063_07BB8FB3 
X-CRM114-Status: GOOD (  21.91  )
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

On 11/1/2025 11:42 PM, Anup Patel wrote:
> From: Mayuresh Chitale <mchitale@ventanamicro.com>
>
> Introduce the required auxiliary API functions allowing the perf core
> to interact with RISC-V trace perf driver.
>
> Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>   tools/perf/arch/riscv/util/Build      |   1 +
>   tools/perf/arch/riscv/util/auxtrace.c | 218 ++++++++++++++++++++++++++
>   tools/perf/util/auxtrace.c            |   1 +
>   tools/perf/util/auxtrace.h            |   1 +
>   tools/perf/util/rvtrace.h             |  18 +++
>   5 files changed, 239 insertions(+)
>   create mode 100644 tools/perf/arch/riscv/util/auxtrace.c
>   create mode 100644 tools/perf/util/rvtrace.h
>
> diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
> index 58a672246024..2ba1fb98a0ad 100644
> --- a/tools/perf/arch/riscv/util/Build
> +++ b/tools/perf/arch/riscv/util/Build
> @@ -3,3 +3,4 @@ perf-util-y += header.o
>   
>   perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
>   perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
> +perf-util-$(CONFIG_AUXTRACE) += auxtrace.o
> diff --git a/tools/perf/arch/riscv/util/auxtrace.c b/tools/perf/arch/riscv/util/auxtrace.c
> new file mode 100644
> index 000000000000..adc86bd38998
> --- /dev/null
> +++ b/tools/perf/arch/riscv/util/auxtrace.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Risc-V E-Trace support
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/types.h>
> +#include <linux/bitops.h>
> +#include <linux/log2.h>
> +#include <linux/zalloc.h>
> +#include <time.h>
> +
> +#include <internal/lib.h> // page_size
Seems the above comment 'page_size' is redundant.

> +#include "../../../util/auxtrace.h"
> +#include "../../../util/cpumap.h"
> +#include "../../../util/debug.h"
> +#include "../../../util/event.h"
> +#include "../../../util/evlist.h"
> +#include "../../../util/evsel.h"
> +#include "../../../util/rvtrace.h"
> +#include "../../../util/pmu.h"
> +#include "../../../util/record.h"
> +#include "../../../util/session.h"
> +#include "../../../util/tsc.h"
> +
> +#define RVTRACE_PMU_NAME "rvtrace"
> +#define KiB(x) ((x) * 1024)
> +#define MiB(x) ((x) * 1024 * 1024)
> +
> +struct rvtrace_recording {
> +	struct auxtrace_record	itr;
> +	struct perf_pmu *rvtrace_pmu;
> +	struct evlist *evlist;
> +};
> +
> +static size_t rvtrace_info_priv_size(struct auxtrace_record *itr __maybe_unused,
> +				     struct evlist *evlist __maybe_unused)
> +{
> +	return RVTRACE_AUXTRACE_PRIV_SIZE;
> +}
> +
> +static int rvtrace_info_fill(struct auxtrace_record *itr, struct perf_session *session,
> +			     struct perf_record_auxtrace_info *auxtrace_info, size_t priv_size)
> +{
> +	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
> +	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
> +
> +	if (priv_size != RVTRACE_AUXTRACE_PRIV_SIZE)
> +		return -EINVAL;
> +
> +	if (!session->evlist->core.nr_mmaps)
> +		return -EINVAL;
> +
> +	auxtrace_info->type = PERF_AUXTRACE_RISCV_TRACE;
> +	auxtrace_info->priv[0] = rvtrace_pmu->type;
> +
> +	return 0;
> +}
> +
> +static int rvtrace_set_auxtrace_mmap_page(struct record_opts *opts)
> +{
> +	bool privileged = perf_event_paranoid_check(-1);
> +
> +	if (!opts->full_auxtrace)
> +		return 0;
> +
> +	if (opts->full_auxtrace && !opts->auxtrace_mmap_pages) {
> +		if (privileged) {
> +			opts->auxtrace_mmap_pages = MiB(16) / page_size;
> +		} else {
> +			opts->auxtrace_mmap_pages = KiB(128) / page_size;
> +			if (opts->mmap_pages == UINT_MAX)
> +				opts->mmap_pages = KiB(256) / page_size;
> +		}
> +	}
> +
> +	/* Validate auxtrace_mmap_pages */
> +	if (opts->auxtrace_mmap_pages) {
> +		size_t sz = opts->auxtrace_mmap_pages * (size_t)page_size;
> +		size_t min_sz = KiB(8);
> +
> +		if (sz < min_sz || !is_power_of_2(sz)) {
> +			pr_err("Invalid mmap size : must be at least %zuKiB and a power of 2\n",
> +			       min_sz / 1024);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int rvtrace_recording_options(struct auxtrace_record *itr, struct evlist *evlist,
> +				     struct record_opts *opts)
> +{
> +	struct rvtrace_recording *ptr = container_of(itr, struct rvtrace_recording, itr);
> +	struct perf_pmu *rvtrace_pmu = ptr->rvtrace_pmu;
> +	struct evsel *evsel, *rvtrace_evsel = NULL;
> +	struct evsel *tracking_evsel;
> +	int err;
> +
> +	ptr->evlist = evlist;
> +	evlist__for_each_entry(evlist, evsel) {
> +		if (evsel->core.attr.type == rvtrace_pmu->type) {
> +			if (rvtrace_evsel) {
> +				pr_err("There may be only one " RVTRACE_PMU_NAME "x event\n");
> +				return -EINVAL;
> +			}
> +			evsel->core.attr.freq = 0;
> +			evsel->core.attr.sample_period = 1;
> +			evsel->needs_auxtrace_mmap = true;
> +			rvtrace_evsel = evsel;
> +			opts->full_auxtrace = true;
> +		}
> +	}
> +
> +	err = rvtrace_set_auxtrace_mmap_page(opts);
> +	if (err)
> +		return err;
> +	/*
> +	 * To obtain the auxtrace buffer file descriptor, the auxtrace event
> +	 * must come first.
> +	 */
> +	evlist__to_front(evlist, rvtrace_evsel);
> +	evsel__set_sample_bit(rvtrace_evsel, TIME);
> +
> +	/* Add dummy event to keep tracking */
> +	err = parse_event(evlist, "dummy:u");
> +	if (err)
> +		return err;
> +
> +	tracking_evsel = evlist__last(evlist);
> +	evlist__set_tracking_event(evlist, tracking_evsel);
> +
> +	tracking_evsel->core.attr.freq = 0;
> +	tracking_evsel->core.attr.sample_period = 1;
> +	evsel__set_sample_bit(tracking_evsel, TIME);
> +
> +	return 0;
> +}
> +
> +static u64 rvtrace_reference(struct auxtrace_record *itr __maybe_unused)
> +{
> +	return rdtsc();
> +}
> +
> +static void rvtrace_recording_free(struct auxtrace_record *itr)
> +{
> +	struct rvtrace_recording *ptr =
> +			container_of(itr, struct rvtrace_recording, itr);
> +
> +	free(ptr);
> +}
> +
> +static struct auxtrace_record *rvtrace_recording_init(int *err, struct perf_pmu *rvtrace_pmu)
> +{
> +	struct rvtrace_recording *ptr;
> +
> +	if (!rvtrace_pmu) {
> +		*err = -ENODEV;
Nit: How about checking if 'err' is NULL since it's passed from other 
module ?

Otherwise,
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

Thanks,
Nutty

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
