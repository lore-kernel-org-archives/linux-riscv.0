Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C108C606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 06:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NeeQT9Xo;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=c5MRKVlg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=/UeUxWaHhJ42rWYJVpct1ga6YTVAYD+Qzmczv3bfaCw=; b=NeeQT9XoHIvkpVx8U7vthwe5H5
	s4Xfv5G62b6H31bf1MhVRdmWpErSGiDI8Iwe+FcGavQkrUNX4UPRKOFlIj1jFWjk6daneCWC3UbYq
	P6o8OYWEfBNITnhDXtEs8DwCRzv+hMkqX/ac24faSU3s2iukO60C/khYTrrl+YHpohWMXuSFgrgN5
	NpPKrzkATr773SWXjeUvUH9UYI7o92bEbGoq+edFqgsas1zoWuT41EKwoGsVupdrDeHIgdwYr6DiD
	ie0Ag7shy5T5MMAuvFHUwuBQIqHevscJUlgaTUorpFeaOL10b34XPZt/56c6nH3HPwOWr+rrRZOYD
	pSsEzBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1xm-00000005non-20iV;
	Wed, 11 Nov 2026 06:37:42 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR1xj-00000005no6-3iq4
	for linux-riscv@lists.infradead.org;
	Wed, 11 Nov 2026 06:37:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhD057JtMsng5ZS+eFtCNG1NtV68ABx6evxqH5qnZmqDr+SMBaKwAWGAFJqL6xEJVRuU7NdlWm2CFjFCeRjJOoguQ9MfUxbD/Wz25kBz+YYXP3oseds6aqBgdojFUp3E7NJDVB/2LT4RfJnALqoFjEqofkQ8KwElGodg6lKf/XZHYoqgS+2DuZ5lfOyK/5wiYlypFrp92XlyNyuV8y0QvUT0NZ0yGe3iJJd8HJNUxdVa0bYcaxs+YWK/yKKpa7olyp8VTrjHO5crz/ltq+VpCbv+qgmZHcz7u/dvf33fLbK1KbzzJhmtiesm+qFoYUyzrkvvSQvbGsM+MMZjJQHnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRVSTSW/pXP3lvC5DMwXYrLI7vYhQgncjlMhf/BHqX8=;
 b=jOiY8iKN14NNYmKBC3bTvg8UsaDhFq73x+QMyDxlnl2K9EQIVMfkYCZv9kZlIgGPJlyv1+9VQCK003KZTBO+GPuH3nELwbG47WL+ZrZZD/qC7xXVGxp5T0ray1ftZjY/3yIoEsHnq/CBh6EB+uStzsEb1zs7jva4/EeWDSmYrNWQvGWc+NNR8eJ9YVyGUrVEJtxag711FGxY12IuJ2avJNpBoU7k9Mri4wjbkyeogSUewrDnePur0L+5WCq53Kd4Ra6dx/tFGe2Lbto6/PdnDwNcedKMi4aFe4lE9KPmv3cHa6yPiae6yrnuYtVouEWvGF00qXkSM4/3Kk3QcEdV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yRVSTSW/pXP3lvC5DMwXYrLI7vYhQgncjlMhf/BHqX8=;
 b=c5MRKVlgfayAklQfiq4IEOPOnfhkwZV5CqBv4DIsm6RMv41iZlg0BMWl7HmddpK6sNlSZxOZNcN7TNbEuN7EezGzuCqF5/Nw7VXWxeYWdbm9Y16Ted8v1IGq6P5z5pYl63VJtaSLqkovaRg33NztMCzYem3ARhb2mJ22R/Ae16U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by VI0PR09MB8916.eurprd09.prod.outlook.com
 (2603:10a6:800:345::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:37:29 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 06:37:29 +0000
Message-ID: <3308062b-9d0f-436f-a22a-217cc1c59aed@mobileye.com>
Date: Wed, 11 Nov 2026 08:37:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
 Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Chao-ying Fu <chao-ying.fu@globalfoundries.com>,
 Conor Dooley <conor.dooley@microchip.com>, torvalds@linux-foundation.org,
 olof@lixom.net, aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
 Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, Nam Cao
 <namcao@linutronix.de>, rust-for-linux@vger.kernel.org
References: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
 <20261110-lrsc-only-v6-2-bafc3cc0fcae@mobileye.com>
 <20261110-revivable-saint-9bcfaa2fd0e7@spud>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <20261110-revivable-saint-9bcfaa2fd0e7@spud>
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|VI0PR09MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 4158b3c2-9c5c-409f-4c12-08df3fbe41a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|1800799024|366016|376014|18002099003|22082099003|56012099006|4143699003|261026121527099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: IJnuXnAPI4B+VrzrC+/zJavqcrbzj9NGDxV0zOPFubbB+9fLRvcV9k1miFZd+2v/JrTPEXrztGX7RADpXX17f4fQjz5EGftC/LHgKX67ia8Cka5ARrx8mW88kJ17bMcGGsjCbOxSWxtfAMNXKWfqZow3S91Kh2ND6QHsA8DYYKe1o5alKGVXyccy5ZvFqaUxVxhDCB3SNNbOEqUC+gICjDZJTHXzNonxexAqnzh6ZzomnDO2UQ1Y+lGoxI0zexJjV73zkV2/9+91zhOwUAMKVTGuadqpGZZGZVg7P3JLDBUnxPa75Jg4jalDc1b7BLgEHNCnQ0ffOWvQvL8/agQmEQfuXoRGEjXlKWM/TMCeaaSOLvpUCs6MQg+2GbxhvpMX7bPgihwB+rzZfTEAnoTyNwWYJF1bh5d/LUwLhw2LQ2zC5er+g8jb4ytdMg/9woMzau4dnDGD9RIgCEXwnEr8xjIW/LPQTdQ4/JmvQA7OjdTo+Il8UubNt7isbgku3i1wCjiQbPq9wzSsmuu2fxdfL5/sfN/m3AcS/SuXaa6HRf7XTsYWLyTbTSG133JpCrfLUK4gwI2CHfz2AVXj9c+SEUR7OO6nHoTBvxwID0wmDpNLv9rwVBjsoQrDPxS2bnxNgSp8yFWsSleEC8djtf3tPftsN/LYq/zqtpFIbCrbMuM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(261026121527099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzBIYldJOVhFTE9aTWY3eTA2a3gzdERKY0hVaFVmREtrMXlUVTB1eWxEYWw0?=
 =?utf-8?B?UytHbHJBczVCc2t0YTBSMTVrcDNvalA4UzdGU1BxTjdlUHVLbTI5ZHl3VERu?=
 =?utf-8?B?N1RVaHhXUkxwTmw2Z2lxMzFPNzNzUTk3UE1SN0luTDcwckpFbUQzenF2dHhp?=
 =?utf-8?B?aHFKaWN3aVp5NVNxSjhsRnUxN1BVNEFSeng0Vkxvc0Z1YWFjVERoNzZtd2Rm?=
 =?utf-8?B?aWNMQWFxazBhVVg4ZExnbFZxalYvSXcyTzRZQUg5NERBMXNuOFRvTjMyakhu?=
 =?utf-8?B?T04yc0VwQlRUd0sybG51UDM1QWRGZFN3bDNpQk8yWFE5ZVZlRkpKNThuWGtJ?=
 =?utf-8?B?QktDL21HN1ExZUU0NGswYXhUUFJTYWFKSER2cnpjTjJxV2o1MXNmM013cUJE?=
 =?utf-8?B?NkJlVzZKc1pReGpHZXBTR0JLU1F5TGk0QVJYTzhyZUJrNTB0T1dHN3RXVnY3?=
 =?utf-8?B?YkFmSGVwYUxRNTl3RW93Ly9PamFQbWtHek1LUFdCQ1d1RFkzRzJGZTlFNjdP?=
 =?utf-8?B?WXdJclR6N05wZ3lORlJTbnpneUlkRFpWaXVZOVFTUUFRaXhWL0hMVHZBZDNU?=
 =?utf-8?B?R000KzB6aUdSRFZLaVhxY0x6bXlUdGM0TkpaZEtOZTNORkx2QUJvMmRmOFl2?=
 =?utf-8?B?Zy8rNEZkRzRmOFZnOU4wbzVhbWNQaGkvamJyVDBMYW4xNXJpL0F3empVakdS?=
 =?utf-8?B?VWRWMUxCOFlhSjhLVHBTWXNvT28xWmdKZlJVN1lPSCtORzVsRWY2Y01tczNs?=
 =?utf-8?B?V1hCbm9vWVpvR1RhRk4zRTAxT1EyTFA3WEtuL0hmZUE0Ni9VRWhjRU5pODU3?=
 =?utf-8?B?TWZUL3MraXpaNjk3WFprT0RaQzJ0eXRXOEttUS9aSkJRM3ZDQmVoNWtsUUc4?=
 =?utf-8?B?U0JuRkxOQWFLdEdJUDlPM2p6ZUdudUZXWFYvMnJvTE1YZFRHZFhMYWQzUTQv?=
 =?utf-8?B?ZXQvcDU4ZktzRUhaMldMdVZaRUhTTHNDckIrM0R2TEU5UGhON1l4QXlTRno0?=
 =?utf-8?B?TWs2eThXK1RsQ1kralBETWVpRmdXcW1IUklTQ3czSGFFc0c3TDQvTitOanJ6?=
 =?utf-8?B?bE5wRERONk16VnNKNXBMNTRhZjhueHNqMVJEOE5EanJkNmZNS0R0c0c4aUxM?=
 =?utf-8?B?VWV5di9vK243Y0QrRmQxaFpMcTh1WkJ5WUtIbk9kS2M5MWhYdzZtSFd5L0NC?=
 =?utf-8?B?YlFrcE5QTVZEMWZnTXJ3YmJXb0ZQcDMzKzl4dGsyNDF4b1pzMnVRRndFSDJU?=
 =?utf-8?B?T2Q5dXl4VUxBRU03a3dTaDBXSHd5aXFYU3F1MzcxYzh6N0VKWWVDaVUwR1kw?=
 =?utf-8?B?ZEQ2bm1zajZ1SmF5TGNXWDFCcVhSLzhxZmNranVObUM1UmNwYXpyRk1ZOEhs?=
 =?utf-8?B?djA1ZFdwcUFpdG52NllRSjdkbm5lc2NvMWRYUkFrVTdNTVk5V0lwNmhJSUlM?=
 =?utf-8?B?N1cvdExrcmU2QzVhcE9lMVozUGhwQ2h6TVQ3cFptZkJ0VWZnNHhRQjRqajdO?=
 =?utf-8?B?ZjJXZFlXN1cwY1NTSm85aXRFYmN4S1g5ZS9GNFZDVkYyUm93aUFaanpFUFU0?=
 =?utf-8?B?dDlJVk5nbVFSYnBGOW84Vzd1TVZ4MHU1U3UxdFpXZ2NFUW5Rd2VaNzJpWlBj?=
 =?utf-8?B?UUIwbFJpRE0zZUM1OUZIN1NaRDFYeWxHM1hsSkFXRWM0YU5ja0ZTQXF5QlBw?=
 =?utf-8?B?M2tKQ3RvN3d4OUpLYmxzMTluaTVpWS9kRXFBOEZMcDJSQlk0WlpTN3JsMmhJ?=
 =?utf-8?B?TjhrUURkQ3JmLzVjQXRNaTRra0lJZm5md1VQMEFVcll2YkVYMFZYZVFwUzZP?=
 =?utf-8?B?RU8vTnZrSjVwc2JDZFpJUkhYWGVidzhzSVY5SnNkaUZwZE01UWVjaHp4b2RL?=
 =?utf-8?B?c0JlcE5WcXlnMHZHREZtRE9tNFpoTUEzOW9hUWp3MEt4UEVXV05sWGpRQ0ZI?=
 =?utf-8?B?UHNRYzFLalhnNzYvd2l0Z3ltT21EVDJ1ZTF1aFhUbDZ1Vm5nR0J5c0RLVm5r?=
 =?utf-8?B?RStyU3RBTW9RdHNBdDQrSm9BeGhFUFkyYnhXcGtjQ1EzSkZHMXF1cHl2Vmhs?=
 =?utf-8?B?eW9Tb1Q5TGRqQXkwbFYxaVp2dm5vTkRiZXpUM3J4ZVJCQ2h0UTVzNjVsbVp1?=
 =?utf-8?B?WTIvcGhiK01xQ1VGVHc1MzZ1TndxRnA5d25za0dubGpPaXVLcjVlNzB2MUky?=
 =?utf-8?B?N2U3NXpkSjNIWmVrZ3ZCbVhZVUZmN2g5eFRQU21RWDMwaThoSy9WS3BRSDBp?=
 =?utf-8?B?by93T0VlNVR5eTlUVmY1RkNvTzd5ZjVHNzI5WTQ2RlpQWkFYNldaT0l0Sklo?=
 =?utf-8?B?RDYzSm5JeFUzZWR3SSs0QUxNOFhjTFhGZFFId0NpVjk1cTJ1T1Jsdz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4158b3c2-9c5c-409f-4c12-08df3fbe41a8
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:37:28.8748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JhxcDIu7/KzmPCw90yCr7jgfbQgWav0cbQjrgG3G91SD8zk36FhuPong/3q0EjogQV+PmWy9hERFC0CAEBF0Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR09MB8916
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_223740_109467_2643BF3F 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/10/26 21:02, Conor Dooley wrote:
> I had a quick glance at this revision, and I think you've at least tried
> to resolve the things I was pointing out. Did I miss something, or why
> have you kept the NAK after having resolved the things that I was
> objecting to?

I'll be happy to remove it. Was not feeling right to do this without
your permission.

Thanks, Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
