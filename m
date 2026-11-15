Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8063D606A31F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Nov 2026 07:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ugyNvH8F;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=ADwOqrq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=O/8crjQa0NwgcE9bGf1NA1GYvgI2jnnL5D63Txmyvjk=; b=ugyNvH8FyEeY4ABT/JTTU7OIBw
	oTXzCZuCCXVB5Q3ycuCFIXWsqf5/AXVzY7KUvDNZYABd8M1dxoFxLfKhSMmTEBjgKRGwAvuDYNcs9
	eVLLBmCHvUXeuCEBjxWZ6AUt/9/UOPMGJbYxkgBwOIXhUg5ZaRBZUt/MaO+ynYnnK9JGUmyjk+kEs
	wD3BOo/WsxORqskufABN7yx2Asbm+cg7KGVPw6bknSMySB26dn7FwXgRJTZfF0CgAnfU/3dDDjtJF
	rtRbktQNNc4roe0yjPkdZPtaFgvmFcLFY7rDl4j/Xl9PvRfrhANVAMWpiIS9xorBVnYhZTq03Ad2p
	LLJx055Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUUh-0000000H9vo-11qS;
	Sun, 15 Nov 2026 07:17:43 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUUd-0000000H9vV-2fUA
	for linux-riscv@lists.infradead.org;
	Sun, 15 Nov 2026 07:17:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8xw4P2xoQkON1R58b8dSNsufu9QF1/1Zr4WbUWLv4mL1JShtl6wPcmo4UyhMs7tPm2VsqgL5PvFs49hqn4LOAhDX1lUN4H7xqmwyXhaZOPsz6QI/zuElAnBX8bF0c1U5pLvaD/l7Ho2vwLiI+qaNsRXVTMJbPrW/j44fguzlaXwXaZGd4Jsm8xLdgmuwVLeF8U948lYembqRz9WIsRn7om9Beofs/f2l6Bk4CCFhKChWK+BpOtroJWpiOgi6a293cceBfh2tq3PEk4z4gf3lbgqPbPOqTaVcz74Y+5yIhxV1veUK46fh5LAlYIxCPNWdGJUzO+/Jq6IVPuZoHTXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jA3XxsFTm55bdn9xJgLUVE5bkeI9KRrqnLjY44lJZbY=;
 b=BAcYdj/UF3Yp+nRVU43gkrdcOai271TZ9ur5z/E6HeReKOffr/tXEFc0vJS7EZb1VsDJSEuvj6uklsjcJCWo+y95qMZFRBeY2TbqYoEPbqldUduezZsJWrWQvgb61xK0uVDVSPJL18I+N0ART/ffdjiZNdSaA70M0fuUx8JlUCJgvicOhpbZ/XeUd61RVF9W/k4M0qGn4c0TMR/FcYmsuvFEvVmEkurhdlJyGrf9AAEgDq30hjeo1DRk/rSn3vN00IsBN7i4Ua3E+XWVd7LSa7XUy7vyZu8cZ2Hll/5qLyiw6GADy6Fb6yFTtWy1mUq+7IuC/bPXohu8Toc72suLFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA3XxsFTm55bdn9xJgLUVE5bkeI9KRrqnLjY44lJZbY=;
 b=ADwOqrq0Tmk0ZoG4C0eXv/hB9C17zdg30G5PCQWeHpF2+s5vlBQgzUXaSXmOpJqWenCym3KIZWV8RR7NrJjqa0rfeiAkpVDJ1UIPiKEMZ4k+JpC30+/urVL1csc4N5DeuXXXnugSjEJ8OenR5dPJ9Da0VuhH5HFeLyggZTaUu+A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by AM0PR09MB3940.eurprd09.prod.outlook.com
 (2603:10a6:208:196::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 15 Nov
 2026 07:17:32 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0615.012; Sun, 15 Nov 2026
 07:17:31 +0000
Message-ID: <cd92fe07-9a9b-4a21-b596-1b2d007b4c9f@mobileye.com>
Date: Sun, 15 Nov 2026 09:17:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] riscv: probes: reject probes inside an LR/SC
 sequence
To: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Pekka Enberg <penberg@kernel.org>,
 =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>
References: <20261112-probes-in-lrsc-v3-0-a95089852a17@mobileye.com>
 <20261112-probes-in-lrsc-v3-2-a95089852a17@mobileye.com>
 <CAJF2gTTY5ODDH6XV2h1v+T7Sn5BK3L9x-Q_Qb_EXNmdCor5rPA@mail.gmail.com>
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
In-Reply-To: <CAJF2gTTY5ODDH6XV2h1v+T7Sn5BK3L9x-Q_Qb_EXNmdCor5rPA@mail.gmail.com>
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|AM0PR09MB3940:EE_
X-MS-Office365-Filtering-Correlation-Id: 897cbec1-9b2f-439b-6b9a-08df42e88372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10067099003|4143699003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: zw+6Tt1/fhaT5azyQk+8MR+psTDshm5GoRwuBjf1c2i7lkYtbQBCtkX/3rxjtHW1inxXlzqbibcMBS71zNOFHxqAMtS6Nr5ITgcLUgWu5WW3oIaoKcfu50WKdJnaIGQogR4WXHSbSx/BnMjmlgjroqCmCPRUTJvACzxMnGhUS8E464K1m+kLnj7qxmpj0zB5TjtZXuHb6Jyr1flYYSqnLD80vSvwIyJmopR3Qg/FmHVwQNallT/crWVzx4BaO/jvwj8gPH8jG3NXB4I9VXd+T5b1bQvEdrD2TE1riW394dKVVdZzH6hrKgrJQtnWauXqG0IoRdVQAIbTe3GWDcApvYgxFEwJooyaB+Q4spxMJqELWX+FTKjqzRY6a+j7s4AGYzBoxWycw1AzDGkJXCXmLUMu6/+hoam9nn9ckxbOuaH1xf9vqgKFbV07jb25UDlJWb9fhrhb2e6ZRhXjqOuAeqzb+T4G1URB6HCkIWFaZBcu5qrT6TAzQgO1++AMTsa2LCixgNjnvAL49SQyGvvYmTDwiOKpWLNM/cTrH1sTj4j8qv+lro08XAc3CywzpRNUufhgpFI8Yud4S4ZSMrj/lzs/U2ejTTN3wsMs5Q5ySgY7zowIdX1WI0catSEKr4tqAzJ/X5GAE2V/I0B7AnmJgFQziHYjyIPGdreLWKeUU48=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K09JdVZPMnJWVjBZNkwrcmlQb0FOaTNvTnd3S1MzYkloUXRyR2pmdWMrbkt0?=
 =?utf-8?B?ZTFyYW9KTE95b0RPQkZ1RUZCOWRhZkJETFgwcS9QUmpuSURPVVZQVzJWYjN4?=
 =?utf-8?B?K05uZDVtaDBsb0xqSzZ5YkRaL0JRbEZvWHlrclFQc2h3WEwreXVOMDBhOEdC?=
 =?utf-8?B?ZCtyRGhBelNCZ3pHUGdUZGxkQjJ3TjFCMjRURUJrdjFBWVhzRGx4SGc0NFFU?=
 =?utf-8?B?eGgrcXI2Y1FFbGdGZ2VUWkFDRzhGTnBCVUpCUFNqZ1lYcU56QTVtUWF2bmZu?=
 =?utf-8?B?WFNzVlhRQVcrdm5pKzRqb3MrYVJmMVYzT2FhRGppSXRZOU5oRzZka0N1VDdj?=
 =?utf-8?B?bVVUbVUzNVZaamxJdUZQTEhHbVM1MjhQbzlRdHVwbGFQdVFNK3Q4OE82TzdL?=
 =?utf-8?B?bVB1U1dZd0Q3WG1sNzZOV3h2RE5vNGdScEkycHFGc01LYW9DVmRiOXE3Mk9H?=
 =?utf-8?B?SVlyNDd6TWc4eWtoNWE1ODBZK2Nta3doeFZaZ0VTTjczRUY0MUlyMTRjNncz?=
 =?utf-8?B?eUJzV2tKZitITWNld0t3UG05VWErdFBrdTF3SmJ5VzZmRDdHY0NJRWRaR3J4?=
 =?utf-8?B?MVF4ckpLY2Z6MXQzQ09GYittaHpmOWROMnBnUXF1NHpCb3Zwek96b3hiTWtt?=
 =?utf-8?B?UG5OYWhnL1lFcGdPWElyRFcxcWRwK21jUFErZzY1RlpKcVZZQlNqTW9kZ3pq?=
 =?utf-8?B?T0hjWnRqSnFsRk8wL2hpNWF2VWlCbFYwOXNnS2pzaXV5ZUVwTWN1ckRzVTM2?=
 =?utf-8?B?cVoxdld5ZFdrdGhOVTkrMW5zOW9QWm9QRWNWVS8wSnFvVDdlWTYxU2psNE1a?=
 =?utf-8?B?UHJDZGlTOFZ5cnE4bzhQTE5aWGlBaUV3NzR3QVJhVzkzSzYyVGFWeCtlRzNm?=
 =?utf-8?B?dDRGd0Uxb0gzSjdGdSs0MSt6aUFPY0l4VGdtN3RXRmZ6aWNHWHk0MUM2c0FO?=
 =?utf-8?B?U1krVjI2bnVrcG9PVTNkdW03R1MrMFhBSVAxK28rd3ZkWGVTeXhNdlJoeVNs?=
 =?utf-8?B?MXFqcmZMb2QxTFUrN0R1S2g2cXU1Q0xmSVhYZmowVXZkRzloSzBIZy82Y1M5?=
 =?utf-8?B?TGxLTkVuZHZXcWxBOU9mRzgxOWNSN1FYRVEvNDRtY3lCRlAzdHVnU0lVTHV1?=
 =?utf-8?B?eENlNWpqazJ3NVVweVdTZHh3QjRXb3U3WVo2dlFLdWF4Skw4VktaaldtRFh1?=
 =?utf-8?B?YjNVS2NBSmx6V1JFRE1NZjIyRE9UZ3dESGFSalVMS3pWN2dkZGxUWlBTaUc5?=
 =?utf-8?B?K1hUNTZGTHVnb1FPdVp3L2VzMzdHK1lIK29JcTlwQ1JhWXpaN2NoSWgvek56?=
 =?utf-8?B?VmNNOE1JYjIyQzU5bFk1cy9xMlNUV3BucTlXSnJ5QVIzVWpHaW50eFRsL0Yv?=
 =?utf-8?B?MUJWQXlIbU8yVU9sWGxXTWd0TW42aCs4MUZJZ3Z2RUhXMFdIYStVZHFmZTg4?=
 =?utf-8?B?anp5RXNsS1pMRy9Zem1QLzM4VGNaTFNEK2RoQk5OelE3NVNHUVFkb1F3czA5?=
 =?utf-8?B?eFE4MWsyUUx2LzBrbldKRXhESVlha0tFcmhiNjRUSFZjeVg5QVdKWTNab0lN?=
 =?utf-8?B?N2N2dzRxKzIzdWsySmcrMC9CZ2ZNKzl6MlRiMWNuZVc0YWpMWXIxRzgxVkJQ?=
 =?utf-8?B?enZQd1BNWTZ6KzdYUWQ2VTl4WGh2U0QveXZUbFltc2REclBvUjRTRUVjODN0?=
 =?utf-8?B?d3JUYTM1b1Q2aHMzVmJnNzdnZUl2TG02MUZJQnE4Qi9oYnBDUm4zNXl6YVlu?=
 =?utf-8?B?b3dkTUM4QVRJWWhOUmJNellVcEpVcnVqcGtCbS9BYmhEYlBkWjJ4bzJnNG81?=
 =?utf-8?B?eXQzTWdESlN1WXk0V1I0QjNlNFJXYmlybk0xblpqbWZsUHlzbWtYdmJoaE9M?=
 =?utf-8?B?ejUwN1R6RmZyN0dZY0pzdi82YVcyRU00ZUJZNXVLay9vZXRPN1V4Tm5ldFJq?=
 =?utf-8?B?aE41RVd2eDRPSFlSbFNiSFRPbkVDR0NPTXpRRUdvVHQyNFZuOGRZY3owUHBo?=
 =?utf-8?B?RWRyQkllSHArSElERCtPZHNiNFYyMTg5STZSRDdvUjFFWmtCTlFGSnFxdGNv?=
 =?utf-8?B?RitDSEE0TE1IOFdZcGpUVk1vTU12SmJCbWZWMjVZSTdNVkc3SXg2NnNsNmIz?=
 =?utf-8?B?cHFhSXBTRkk5UlNIRWRyNmlDTVBxbXloKzlOdFBzM1grRE45RnF3NTgrZ3Zt?=
 =?utf-8?B?cTJscTJZT3NlVWVTbjdZKzc5YytmWkhncDFYY0FTdlRKSVpyNlU3R2tYaE8z?=
 =?utf-8?B?TThDaTV2UlMwZjFjcUNwSlZJb1JsM09XWGZoUDk4VjJldkVXcDhpU0FZcWFz?=
 =?utf-8?B?RHdLZ3pSTVBIN2R1Y0kxeWlJbDZXVERMaS9Kb1pLRVhYaU1XMFlNUT09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897cbec1-9b2f-439b-6b9a-08df42e88372
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 07:17:31.6365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R6MGx9KdbwMhUv7tuTTYMkedaEJpezzNokDBEb7KGNMahpmMp1S33L/cLt8SigslXHOdEZad43QgEDbgQSGLkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3940
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_231739_845119_2E6D1AD9 
X-CRM114-Status: UNSURE (   5.14  )
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

On 11/13/26 10:01, Guo Ren wrote:
>> Fixes: c22b0bcb1dd0 ("riscv: Add kprobes supported")
>> Fixes: 74784081aac8 ("riscv: Add uprobes supported")
> One patch for one Fixes tag, is that okay?
One for kprobes, 2-nd for uprobes. This is what sashiko-bot suggested, I
thought it knows the policy better than me. If it should be different,
just let me know.

Thanks, Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
