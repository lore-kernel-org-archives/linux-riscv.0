Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D88606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g7WEhhj4;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=SbaH2bQ9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=ntidaX+1WyGKesRspaVnP7vcDx5LHinmFkemkPDbe24=; b=g7WEhhj4KFuJCj1ieQAdI6FJ2R
	aB9rGEd7u7PnLDQK1uWWr8rukEsmAe3WmJ5RhYIAOI6phh5CAhUaKg4V5UaEKJRiHfdd2Dyh+PryO
	R3lYWx+jiqZUONFGbWzEBKWOQ2CPGsZbSvMKwgA0sckO+uGFJlOEYTJOlc2kyEOmHETJZqjlM/Zz/
	Kb5KY8m8d32KkqdWd6qz44x5MXKlI94wphIWBfS7dFzEXXsSR+OHLZMLLuaHqFAq3SFJ2/wglJrp9
	KnANBzWSbsGKMuZ9ae8iy4cjLXg949xiRg5sj11Vkkl5qhtWUqWXrbxe526KfpscdYc3MMA+b7fQk
	e17evGVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThoe-00000009Lva-1joJ;
	Wed, 18 Nov 2026 15:43:20 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xThob-00000009LtG-06WI
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 15:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dElLXkI7siaxFRIE+NEbnDF31kTVGnnoTqtb4yb2/NKAinM7bShocCt/UUtPYtoOoxCC1HehEpmlPt4olnDioK7/xPaCqPBzHlbTucduimmNpYvojgMs9P/MHtrL9bSaNgaM+AObCpMjKZAxyzMLWJNZ2xLKwJczOMMhZ+duI5y94U9t9jSUm80OhrcutsgfenlDjHX6sgP9XBAGwwg27sNj8DA5/3tlkDvN9I0w5s4ISLDzJoWOG6VKyf8etH4uI4l446Rb+P2RbpRWvE6+kYD6Vu+Whg+o9W5CGvNnTxl+u/x+KuqugQhxKsdRTh4QHEAeNATkUy3kOVmkVnbapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aZbYHbROIFsEqLCP/MMSfaUrFzmOttHrb5DojZAcMU=;
 b=XoQLcVAn5c4r/cw/Gr3PFDI5NHWOmVLU6nDoLg0JFx5eTBpKSk0a4LD0AbUOUQs6ZqvBFLWXXuQk+61jihDVMJbJipjSteNi0OyzcrTcylxs5UIkF8i+8MPnlu06carpPVPrIukRKGf37DrOOFinr9zBofHAD9XPQLlUr/jolZTGOrXDK/SPtOYI9m25JPup4tB6eULNuP75oNmtle/Rz2kB5NaCHCknEaeFuU06Lmk+H3nWyDOr7GGQ7v+x7re0eBiHJIibLsAD16hWe+sjqeIPrJtWFtKX6Cjp4iDeCjxVheFsyzDjFxXKPrxihW1qCrQuGQfQpSxpUy9c1Lcm5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aZbYHbROIFsEqLCP/MMSfaUrFzmOttHrb5DojZAcMU=;
 b=SbaH2bQ9B8fRvAUxV2rWV2Ms/j3YjPcMj+q1Wuf4R7pEBIE8m4WxM3fFlfkcLNz45GAjT/GfUz93mg4jwrXLFU1bExD4OVtkT1eHP5Su32Xf4X8w80ekzW75IrK6qgskaamGDq6ojvPY/UH2J4GMP+wBJTqgK6DbE9qDjTX7FzI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by BESPR09MB825927.eurprd09.prod.outlook.com
 (2603:10a6:b10:129::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:43:10 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:43:10 +0000
Message-ID: <400aae15-aa35-4e49-afa9-427c0fe60309@mobileye.com>
Date: Wed, 18 Nov 2026 17:43:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] riscv: probes: reject probes inside an LR/SC
 sequence
To: =?UTF-8?B?6KKB5pmT5bOw?= <yuanxiaofeng@eswincomputing.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Guo Ren <guoren@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, =?UTF-8?Q?Patrick_St=C3=A4hlin?=
 <me@packi.ch>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sashiko <sashiko-bot@kernel.org>,
 Nam Cao <namcao@linutronix.de>
References: <20261115-probes-in-lrsc-v4-0-48b9b036bd1d@mobileye.com>
 <178ccbf1.a40.1a1ee49cebb.Coremail.yuanxiaofeng@eswincomputing.com>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <178ccbf1.a40.1a1ee49cebb.Coremail.yuanxiaofeng@eswincomputing.com>
X-ClientProxiedBy: TLZP290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::11) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|BESPR09MB825927:EE_
X-MS-Office365-Filtering-Correlation-Id: c9f5da32-9635-4512-42e7-08df458aa5b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|261021123027099003|261022075727099003|10067099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261026121527099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: nqEJA9Y9KL736bgEvZkb6NkJN/Ok6itG94XV5gMV+pi2QdiHB6Z9p8dGb7PuyjFt+dlDTmXW9iOrfa8Z6AzQiwBQhCX7VJBjYrYUSHc3FrP4TqkIVR3fjtWE56TII+KyhfFEtv19AbkI+E63mmH2ll4zv9EObEZy39YxFF0ENNE+s8Ea82dMwZFTF6HdsbZAJ2gN/uMFOvLZ0XWt8g6FbNN15EO3ERhwgjfNAw6mFOu9K/Ygu2p7vYf8hig5Je7+Do064X9gyzkY9MfoXYx3gBhxDIxetUWCqw7jaz9YSOrozu+kScdxiswr+u9dhQbm33Dhx6fLHhZogJvQrxxivV7Uft526j4VlvwxXMtPtvy6D7qD0YjqrrdGxzDXZC/brTMCau5IWLVcRPW9A+ULaqAu3jol05+GKoaUZ/XeTp3YEDTQYN5P3Gq9gvv4MxgiLKEl5ksp+A1lNFHff1qEavwoH99HnZQdvgMK3aIKfyDTMDxDS5Qb3KPvCIa42FEOLWRA/R+nPIpizGJU9ivkDxfSJ8bykF5r5lT+fFR2goHEKMKxm6WLc3xFoR/OqpRAdE9Kr4kz1Ndfg589wTPUzBm5noy3UUdQLPSQxe+h9VPG50xQvfYXYza4WOMBwFW1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(261021123027099003)(261022075727099003)(10067099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261026121527099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qjh1dzdRRVNGNHJTMXRKZ2FJM2lNY2locGlsS0ZubjN0aFhFOGZWdWN3eDJN?=
 =?utf-8?B?Snd4WlBwdnBHRC9HdExDdENSemhQOXk0TGRTd2g0cTZ4dWpWODdXODhmUkx4?=
 =?utf-8?B?bFU3SjRuazhjdDVtUGcxME4rcmw5d0RlMGlEL1FsOGJkQ25SUTF4aDRNYjg0?=
 =?utf-8?B?MEF2Q3lRRmpzNDFwRFdHVzY0cEVsdGRxMVdPNFQ0WnUrdXU5SnlKNS9uWjND?=
 =?utf-8?B?WStHUVg1TjVPTUlyV3lMRElqYTVFeXdGbmsrRUV1Y1ZmOG93UnBpSklGeks3?=
 =?utf-8?B?K3lOZXpMMEpIUDRkTXI4REp4ZGtQSExDK1BuUVRtanN1Q2l6UUJPanJiNTVy?=
 =?utf-8?B?TXZYY3hzMnFTOGMyYnJZU29NZm1vdTVlYktKNlhMVnBtK0dMRlROVXlWN0Jm?=
 =?utf-8?B?VHJTeFJ4TnVhalN0aDdDWVhCMzIwYXMveEUxWHZVa3JVdkR5M1Q4bWt6WHY0?=
 =?utf-8?B?WDFWS0Zsd0E1Ky9SRldKUlFnZDNCRWlEYWFUNTlxbmFmWEZueWY5WStPRnFS?=
 =?utf-8?B?UmxHR0VhZWdZSkZES2tUdWswWElSMWpPMGR3b3ArTWxxNmhsVHExWUhkcTlW?=
 =?utf-8?B?ekpKNDlnWXV2YjBaNEZwemVCeFZwZXBPWkNaeEZmUFAxZWdka21OZFhRZ1Vp?=
 =?utf-8?B?M0R3SDV0TG1zY1dBeWx0dE1TOUFONzVVQy9XblJ2cngycTB4QkRIWTg3OWc5?=
 =?utf-8?B?TEhaMjE4a3h2Q1MzdHNlTU02Yi9RWVJSTDlIangxbFYrSVI1SXpNVURIWldL?=
 =?utf-8?B?ZHdzd2F3aWN6TklPZ3VudUt1VXhRU0trU2ZHbTU3TDFrRzFXenBjQnhicHhI?=
 =?utf-8?B?Q3ErVkNnSWJ3YnlBK1R3Y3VZMW8wdmhNRnh0ZHRXMEp1d29ic2pPbG1xTjFl?=
 =?utf-8?B?SmNkNkVIenJEdnBjWVk3azZoWWNFYzBSNkVPTi9WVUUwT2RNOFV4eHVqN2dm?=
 =?utf-8?B?NWdQU2k5bEIvazVVWnhqWGdCZm1vSkZKZnJoa1JFZm5zak4wUG95dVNQUG8r?=
 =?utf-8?B?aFh2eFJUbEowcEVGZ0c3N1E2SjB6em1iV2JYbko1cFBjRVpWWm9Rd0hDOUl2?=
 =?utf-8?B?QUFyQThUZURVdjJJNHZiZWR3Y3A1N3lGb2M3Q1NmRnZEdXJ6cG9lamhBZ3cy?=
 =?utf-8?B?TmZqczYzelMrVlRwdTVYVUltS3k0SE9ZZmRyY2g0UGJxVEZlYUlySVB4OTYy?=
 =?utf-8?B?UlJZYVV5Wit0cmxXTEU5bVdabXB4eWJCb0t6K1p2ajZLMUU5LytObzBxVUF4?=
 =?utf-8?B?d1huZ1BUaHhMUTREWDRuWXNPcjVUS3ptRk9UNExYcFdyZTN2SGpsdW8vZlIx?=
 =?utf-8?B?b0dPWTBnY0VQUzNVdmZpbWtod21JQTJ5MXUxVXJTZzU1WEVaeU84Wm02V25D?=
 =?utf-8?B?UGVNeHZ4dW0zZEVvUFRQd3dPdFBwNWJHZ05COFNuZXVaUGZ0Z3FyVTBZNEJW?=
 =?utf-8?B?WGZYblNzWmttcTNPeC9UMTlTVS83UnQ2aU51R1ZYSk9VS2NYbzBobWdPbis1?=
 =?utf-8?B?dURMVVFLL1ZVR2FENkR4aENSa1VuS3FkY2FBVlZMN0tIMlFDYmw3V21talVy?=
 =?utf-8?B?REViYkRvczBOS0FHYThGeGJ5a0VkOWlxQmZsL3BQVVBCdkY0ak9rb1NmMWlF?=
 =?utf-8?B?Z1o2TXZIQTNHQ2J1UVA5K2hueXVwd1JvN1B2cnN3NmN6NE9Dd0prSUZyR01s?=
 =?utf-8?B?d2wrSUZRaXhhTWFHU3h3dGxVWDZMRjNtOEFhL2lRYWlXYWJoUkhacXlHZjdK?=
 =?utf-8?B?Skl2V0R2K0o5RW84bVJ1elNwcDgwM1J1RGhhdG9kUmFmNUdkalVKd1lMWU9w?=
 =?utf-8?B?Q1J6ZWFFSUd2MkltL2VXSzd4THgrK2w5bVNnK1FtbDZSOFRETVQ3TzF3dExq?=
 =?utf-8?B?N1ZYUzQ3ZFV3WnBWdUVxdkR0SGxSQnlqVTZMdWJFUUVMVEVYZUFpWXpXaTZU?=
 =?utf-8?B?SEZ6b0tyT2hHTVIxOGI3WEk2dWFtOVJmUVN4aUU3VEM1VDUvTitvK2NtRkM3?=
 =?utf-8?B?b1Ywbkdtc0dTaG8xYUxOZEh0Q01FQ1VNTmJyeDBBSUw3ditkS0Jac3JMdGZ2?=
 =?utf-8?B?bk8ydjVWOGdKNnJwa0hYaCs0YnlUR2FYMm5ReW4vVXliNWsybkZ5ZlpCWjRD?=
 =?utf-8?B?UDdnZWZjN1hlNzA1MkhPZGpCQ3pzZG91NksyTWdUZW01VnRKbGRRajkrVndn?=
 =?utf-8?B?VVlYVFlKU1NyN3lGRldRS0xCckR0Y0dBMzB3cUxNdHR0VGN2emV3bGEwTVAx?=
 =?utf-8?B?QzJLRC9TY0ZXMHA4R1hCM1l0R1JrRXoxLzZ1SjBGNkNmSi9wZ0lOYkl5TnJn?=
 =?utf-8?B?R0pnTkkrWW5GVzFsSWRCa2xqVnJPVFErUWlDT2xjTFVWS0U5algzZz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9f5da32-9635-4512-42e7-08df458aa5b4
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:43:09.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k14zity1DKuJK6qWdLQ8MJY+4UU8cZ4Ekk007Iis5/QQjnxH0yzu9AXxv90LwM9J+DRsEJ7AAozo58N+8D4yYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR09MB825927
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_074317_251351_486C7847 
X-CRM114-Status: GOOD (  19.60  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvMTgvMjYgMTI6NTIsIOiigeaZk+WzsCB3cm90ZToKPiBIaSBWbGFkaW1pciwgTmFtLCBN
YXNhbWksCgo+IFZsYWRpbWlyLCB5b3VyIGZvcndhcmQgc2NhbiBhbHNvIGNvdmVycyB1cHJvYmVz
IAo+IGFuZCBkb2VzIG5vdCBzdWZmZXIgZnJvbSB0aGUgbG9uZS1sciBmYWxzZSByZWplY3Rpb24g
dGhhdCBvdXIgd2luZG93LWJhc2VkIGNoZWNrIGhhZCwgCj4gc28geW91ciBhcHByb2FjaCBpcyB0
aGUgYmV0dGVyIGJhc2U7IEkgd291bGQgcmF0aGVyIGNvbnRpbnVlIHRoZSBmaXggb24gdG9wIG9m
Cj4geW91ciBzZXJpZXMgdGhhbiBwdXNoIG91cnMuCgoKSSBkaXNjb3ZlcmVkIGZ1bmRhbWVudGFs
IGZsYXcgaW4gdGhpcyBzaW1wbGUgZm9yd2FyZCBzY2FuIGFwcHJvYWNoLiBGb3IKZXhhbXBsZSBp
dCBjYW4ndCBkZXRlY3QgYSBsaXRlcmFsIGluc2lkZSB0aGUgY29kZS4gSW4gdGhlIG5leHQgdmVy
c2lvbiBJCmltcGxlbWVudGVkIGEgQ29udHJvbCBGbG93IEdyYXBoIGFuYWx5c2lzLgoKCj4gMSkg
V2luZG93IHNpemUKPiAKPiDCoCDCoFNwZWMgMTMuMyBkZWZpbmVzIHRoZSBjb25zdHJhaW5lZCBM
Ui9TQyBsb29wIGFzIHRoZSBMUi9TQyBzZXF1ZW5jZSBwbHVzCj4gwqAgwqB0aGUgY29kZSB0byBy
ZXRyeSBpdCwgYXQgbW9zdCAxNiBpbnN0cnVjdGlvbnMgaW4gdG90YWwuIFRoYXQgbGVhdmVzIGF0
Cj4gwqAgwqBtb3N0IDE0IGluc3RydWN0aW9ucyBiZXR3ZWVuIHRoZSBsciBhbmQgdGhlIHNjIChm
ZXdlciBvbmNlIHRoZSByZXRyeQo+IMKgIMKgYnJhbmNoIGlzIGNvdW50ZWQpLiBSSVNDVl9MUlND
X01BWF9CT0RZPTE2IGlzIGxhcmdlciB0aGFuIHRoYXQ7IGNvdWxkIHdlCj4gwqAgwqBhbGlnbiB0
aGUgYm91bmQgd2l0aCB0aGUgc3BlYz8gV2UgaGFkIGFuIG9mZi1ieS1vbmUgcm91bmQgb24gdGhp
cyB3aXRoIE5hbQo+IMKgIMKgaW4gb3VyIHNlcmllcy4KClRoYW5rcyBmb3IgdGhpcy4gSSBtaXNy
ZWFkIHRoZSBzcGVjIGluIGEgd2F5IHRoZXJlJ3MgYXQgbWF4IDE2Cmluc3RydWN0aW9ucyBiZXR3
ZWVuIExSIGFuZCBTQywgdGhpcyBpcyB3cm9uZy4gU3BlYyBzYXlzLCByZWR1Y2VkIHF1b3RlOgoK
LS0tY3V0LS0tClRoZSBsb29wIGNvbXByaXNlcyBvbmx5IGFuIExSL1NDIHNlcXVlbmNlIGFuZCBj
b2RlIHRvIHJldHJ5IHRoZSBzZXF1ZW5jZQppbiB0aGUgY2FzZSBvZiBmYWlsdXJlLCBhbmQgbXVz
dCBjb21wcmlzZSBhdCBtb3N0IDE2IGluc3RydWN0aW9ucyBwbGFjZWQKc2VxdWVudGlhbGx5IGlu
IG1lbW9yeS4KCgoKQW4gTFIvU0Mgc2VxdWVuY2UgYmVnaW5zIHdpdGggYW4gTFIgaW5zdHJ1Y3Rp
b24gYW5kIGVuZHMgd2l0aCBhbiBTQwppbnN0cnVjdGlvbi4gWy4uLl0KCgoKVGhlIGNvZGUgdG8g
cmV0cnkgYSBmYWlsaW5nIExSL1NDIHNlcXVlbmNlIGNhbiBjb250YWluIGJhY2t3YXJkcyBqdW1w
cwphbmQvb3IgYnJhbmNoZXMgdG8gcmVwZWF0IHRoZSBMUi9TQyBzZXF1ZW5jZSBbLi4uXQotLS1j
dXQtLS0KClRoZXJlJ3MgMTYgaW5zdHJ1Y3Rpb25zIGxpbWl0IGZvciB0aGUKCi0gTFIKLSBkeW5h
bWljIGNvZGUgYmV0d2VlbiBMUi9TQwotIFNDCi0gY29kZSB0byByZXRyeQoKSSB3aWxsIHVwZGF0
ZSBteSBkZWZpbmVzLiBJIGNhbid0IGFuYWx5emUgImNvZGUgdG8gcmV0cnkiIGFuZCBkb24ndCBr
bm93CndoZXJlIGlzIHRoZSBMUiBpbnN0cnVjdGlvbiwgZWZmZWN0aXZlbHkgbWFpbnRhaW5pbmcg
NjQtYnl0ZSB3aW5kb3cgdG8Kc2NhbiBmb3IgdGhlIFNDLiBBc3N1bXB0aW9uIGlzIG9ubHkgdmFs
aWQgY29uc3RyYWluZWQgTFIvU0MgbG9vcHMgYXJlCnVzZWQsIHVuY29uc3RyYWluZWQgTFIvU0Mg
bG9vcHMgbm90IHN1cHBvcnRlZC4KCj4gwqAgwqBUaHJlZSBzbWFsbGVyIHRoaW5nczoKPiAKPiDC
oCDCoC0gS1VOSVRfRVhQRUNUX0xUKHJldCwgMCkgYWxzbyBhY2NlcHRzIC1FSUxTRVEgKG9yIGFu
eSBvdGhlciBuZWdhdGl2ZQo+IMKgIMKgIMKgZXJyb3IpLCBzbyBpdCBjYW4gcGFzcyBldmVuIHdo
ZW4gdGhlIExSL1NDIHJlamVjdGlvbiBkaWQgbm90IGhhcHBlbi4KPiDCoCDCoCDCoC1FSU5WQUwg
d291bGQgcGluIHRoZSBzcGVjaWZpYyByZWFzb24uCgpHb29kIHBvaW50LgoKPiDCoCDCoC0gVGhl
cmUgaXMgbm8gYWxsb3ctZGlyZWN0aW9uIGJvdW5kYXJ5LCBzbyBhIHdpbmRvdyB0aGF0IGlzIHRv
byB3aWRlCj4gwqAgwqAgwqB3b3VsZCBzdGlsbCBwYXNzLiBBIGNhc2UganVzdCBvdXRzaWRlIHRo
ZSAoc3BlYy1jb3JyZWN0KSB3aW5kb3csCj4gwqAgwqAgwqBleHBlY3RlZCB0byBiZSBhY2NlcHRl
ZCwgd291bGQgcGluIHRoZSBib3VuZCBmcm9tIGJvdGggc2lkZXMuCgpUaGlzIGlzIGJlY2F1c2Ug
SSBjYW4ndCBmaW5kIExSOyB0aGlzIGlzIGNvcnJlY3QgZm9yIGJvdGgga3Byb2JlcyBhbmQKdXBy
b2Jlcy4gRm9yIHVwcm9iZXMgLSBiZWNhdXNlIEkgaGF2ZSBubyBzeW1ib2xpYyBpbmZvcm1hdGlv
bjsgZm9yCmtwcm9iZXMgLSBpZiBvbmUgcHV0IGdsb2JhbCBsYWJlbCBpbnNpZGUgdGhlIGZ1bmN0
aW9uLCBzY2FuIGZyb20gdGhlCm5lYXJlc3Qgc3ltYm9sIHdvbid0IHdvcmsgYW55bW9yZS4gQnV0
IGFzc3VtaW5nIGV2ZXJ5IFNDIGJlbG9uZ3MgdG8KdmFsaWQgY29uc3RyYWluZWQgTFIvU0MgbG9v
cCwgSSBkb24ndCBuZWVkIGl0LiBUaGlzIGNvZGUgd2lsbCBub3QgZGV0ZWN0CmJhZGx5IGZvcm1l
ZCBMUi9TQyBsb29wLgoKPiDCoCDCoC0gVGhlIG1heC1sZW5ndGggY2FzZSBpcyBsciArIDE2IG5v
cHMgKyBzYywgd2hpY2ggaXMgbmVpdGhlciBhIGxvb3Agbm9yCj4gwqAgwqAgwqB3aXRoaW4gdGhl
IDE2LWluc3RydWN0aW9uIHNwZWMgYm91bmQuIEEgcmVhbCBsb29wIChsciArIDEzIGluc3RydWN0
aW9ucwo+IMKgIMKgIMKgKyBzYyArIHJldHJ5IGJyYW5jaCkgd291bGQgdGVzdCB3aGF0IHRoZSBz
cGVjIGFjdHVhbGx5IGNvbnN0cmFpbnMuCgpZZXMsIHdpbGwgZml4CgpPbmUgbW9yZSBub3RlLCBJ
IGhhdmUgdW5hbnN3ZXJlZCBxdWVzdGlvbiwgaXQgY2FuIGFsdGVyIHBhcnQgb2YgdGhlCnJpc2N2
X2luc25faXNfbHJzY19ib2R5IHRoYXQgZGVhbHMgd2l0aCBicmFuY2hlczoKCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC9hOTcxZDM1NS1hN2JkLTQxYTgtODNiYS1hMjUwZTc3Zjc4ZjFAbW9i
aWxleWUuY29tLwoKVGhhbmtzLCBWbGFkaW1pcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
