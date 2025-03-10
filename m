Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25326C282DE
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:Cc:From:To:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AW15d655ce372ZPYcN+5hWGoOdSW+2rBTrnhuydT2UY=; b=AZOnueScwCWoK2DnSi10XFet+v
	46b9cLFBSyTOlVehA5gTih+nwEDdaF6U75kPF6cxfU/wTcTk1Hw0BG+b4TB6eSEhoZN02QM+6q4/5
	RdyDgI5/Qx30P9Kqvimv+TRILUNElHo9ToXHXyM14xSBNb57pymWoH+IAdEqQASsThmP6mGRryeBc
	CanlQt4PVoXE0aZD4QGDMS02fuF4y8EZRvK7RtXNPWjt6D+qVjuQ6CLJ+sF23DEJwpmHuD8WO0FiM
	AnCB+nVeF61jHiaBzn6SnvEcKeK8kxamrjrOJ4eIQXsIo88DbaUmORZhIjYYp+PNpZdUqA4wd+m2f
	C9uZQrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trXfs-00000001ljy-0ltt;
	Mon, 10 Mar 2025 07:35:44 +0000
Received: from mail-centralindiaazolkn190100000.outbound.protection.outlook.com ([2a01:111:f403:d409::] helo=PNYPR01CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trXf0-00000001leY-3xOS
	for linux-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 07:34:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmpwRvB+X3RrGeb7/gMlZmF50FyS4IhvCprpl3nkQF9GfxKuNvIMjphOsbR9MRU4WIy++MuvdyPsuFpTfzSmQSBerYBMzLQa5FkxwRIxT2APJmsbVu7/cUlLjE6YwXiNsBCzfnGgTmuHjvgHaiHunEKcvNJmEVYcEAvP0aiIMlt8snedOvqck8Q5EmhnfrI33owjycpa5UjeFf/sZKJhtZAEmu7j6ea/cXhLufJftx3OOn0Ci9aVGL67gFlZ/n0UM77o8or0n7Nbzg7rCvGqx1bpr32+XP8kMRh7r/aYFwnaq4hEIrn6dwaLG9bCApC2ZdMdcTNDqI8nZcsiYjXfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32QUlU9cwEfyTc8QqnqDypAmEypRuNJ0jRxJXP1BPNs=;
 b=OHTIvVmurF1xC6qhIKMzVFmJGDfh17gcBQnVWayCWUr5atf8xRnEIPC77tIVsckfXdiXj2XhlAX05baKqAcK2yi2mGmfkByiMAljUDHSRgTFzrhbZ/qAQkmzJQEhdfdOdolEeKzYYgleXFHex1Rzv7ScxbBUsN+0M5nm07chuDAF326fTz3GzTkcfPTBhjAVDnsu+jlLKiaqwcygvPXQivzEL1RMJlAgRGL9+P3IlaAhQ607zkyiMFdnmYgWs05PpGpw19XYFk/rj5aoc+vRwB05me7+kifdrPb0eUqHzZiB7SIGJ31Q19lC8o3eaHFqSL2PTvKx7YWxyM0Z5c/VVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32QUlU9cwEfyTc8QqnqDypAmEypRuNJ0jRxJXP1BPNs=;
 b=gMm4rqa81OkRQOOy5MXg/SRMV673qE1iaEzKVllSUMTe+1BnIFcBnZmUs/BwGPUKJhE6WzfKTXPRJDRE1oGmigPVNYR+DurIMlTf1QgJSjnZyl2hL1kQvgU1GjJYt9XHeh2kua6uj/hwpc9TfnlBeMfOxxdToyFW85rGHhUFCwBmjIipejB8DXQJfHPU/JRkfb8fRreyI6EUI2eu7VcEyZDNzXu/e5OHRY2UYeplnkDCFRFAmX9i+2escNiesAh6U468L6T0GHfG8rlRjp+/m3Wy8Y8hfmW5QWUNqs1TX4o4QmCw6fhHS196+va+YiwFR0r9kZKiMTdlAfjB5/RSxA==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by PN3PR01MB10065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1e5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:34:11 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:34:11 +0000
Message-ID: <PN0PR01MB10393DBCE92A34489031BE9BEFED62@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Mar 2025 15:34:08 +0800
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
From: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 unicorn_wang@outlook.com
Subject: [GIT PULL] RISC-V Sophgo SG2044 clock drivers for v6.15
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID: <ab031592-9100-45db-a3bd-7844e185f6cc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|PN3PR01MB10065:EE_
X-MS-Office365-Filtering-Correlation-Id: 337a98e8-6ca9-4561-31e8-08dd5fa5f2e3
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|5062599005|7092599003|15080799006|8060799006|6090799003|19110799003|5072599009|10035399004|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NnBzQ1RjZlp5a0U4ellzMWpha2wxakQrdWtHRjJLS0JpMm9JZlhjdjY5cGdD?=
 =?utf-8?B?bithc0xuVVQyRHNibXVuQ2dXVHFQeDR6N0t5SzM5TXBoTHpHZ0ZTNW9FQklF?=
 =?utf-8?B?K3FxTGgvQURlOGxVUkQ1dUlRUC9CdjFrVUhVOUx6ZWtCclhxT0taWkVGNDBa?=
 =?utf-8?B?SGVocmpwN3pyR3BreGpZWXRJZWtXR3c1Sjl0WlNOdUVmTFd3RDNvdXhQR3lF?=
 =?utf-8?B?ZUdUaWtLZUZVZkkzU0t5V0V5S3BCYXZlUytxTHN1VjMweDRjdmhYUW9Fd2ZB?=
 =?utf-8?B?ckVHN1VrU3hLeW5QMWp6SjNKWTUwWSs2Z3pjb0k3RWNrY0JGWDBmNFdoWlhn?=
 =?utf-8?B?UndwRGtObk8vcjFWV0IzNE9Ickt2emNyczlUMExmOUpwNjFYUW01ajRTRnIv?=
 =?utf-8?B?M3EyaERNQVZNNDFPK1BjWFR0WXMrSEZGMTc5cWdiWnRIZlVUemdBRlVpWlZs?=
 =?utf-8?B?NlRFZGxJTkkzRTVEYXFuSWNCV2dzQkVaTkptYVAwbkRUVG50YlB1bklPdk1R?=
 =?utf-8?B?MDdlOG9nSWd6NUtBc3lwVEgxZkFQaEdKbjhKM045OXJjZHJQS0NlbGhhZlYw?=
 =?utf-8?B?cm1rdUY5cmNHRE4rVnNYMkdPSFdWTnNZZ1I3MllYRlA5dUpIdVcrbzM0YlJZ?=
 =?utf-8?B?VkJFR2VUQzNITDRFZE43NEV4alVDWW1LUmtNbDNndkkxc0Y1bzVLUVlWbytB?=
 =?utf-8?B?Qk91dWJ2LzBqejNqenlIazMzSGg2U1M0ZjBWMGd5K1RvQkxxMEoyQ0FVNjV3?=
 =?utf-8?B?UVUxRDdvcTBScFdqS3FuRFhWc0xqN3RWc3JOZHFQeW5zVXpHSkVWcDJFdDBw?=
 =?utf-8?B?ZHBKUlQ0NFk2azFRSU9LcEYySVpWRTdUOERqT01JWVVsd25NemFCNXF6VXBG?=
 =?utf-8?B?Tk9oSWpWNlZNUUdMUnA4SkMwb1orZStUKzlFM0tJQitoeCtVQUQ0bE9uSTNC?=
 =?utf-8?B?c3g2MUVPT0RpUzUzYTVlZVVPeFVxWDFDR3pocnFjN3Q3K2o0VFl5YktiZ01t?=
 =?utf-8?B?eHJ4NWRCS3RBdk5jY3FiTEtMckdzSmMybmsrL004MER4dTBCRTR3TTJBdWZq?=
 =?utf-8?B?YS9vTnRQL3E5c0xYWmZXRGRqRG42b3JSaUhBMThCMkpkU09XTUtqMm1tYTZt?=
 =?utf-8?B?Qk1BNTdBRHZFTWhYSE9lenFCUHVsSXRyT1hyWE0xSEEwbU9Ed3N3bnBpZnh5?=
 =?utf-8?B?NVVnWEtidkgwQVFHNDNQZTF2dkw2MXNTZ0dYK2s2ejVJMFk2ZXlRUGdqU1Vj?=
 =?utf-8?B?Y3Rrb296K3RNOUw1SnBObVlKU3pCRDhsNDJZRzdadE1pV2tHTGlMR1k5engz?=
 =?utf-8?B?Vy9SWE9mSU8wajdrZ04wYTBYMjdyRXo0VFVNbFZIOWM3bTk0ejZ2NERWRTRm?=
 =?utf-8?B?OE0xL2dQRHNwME5WYmc5QUlEWitMaU5xUlpFdXlvK1dNOHFuSTVUMitOVVJB?=
 =?utf-8?B?YlkyNFhHc0ZPbGdER01UTGtvMktmYklLTGZJdHk2bWl4MjJVOTdPZWRmbUNr?=
 =?utf-8?B?SnJ4RityWVNpc1NQalRaOHM4bloxOW53bVZMTDZRM1BHbGgvZG1uUVJyU2tJ?=
 =?utf-8?B?elRpeTlDYThrRmN6c1JzQTVzRVF6TU8xTVViR0pNNEsvRktUeWl1cmwzL1Za?=
 =?utf-8?B?b0ZYODd6bWhiSllwSWZDYitXa3VSaDh3Z1dGaVZPSjFob0VoUW5YYnM2by9F?=
 =?utf-8?B?MEo0K3Fjbi9iMjdJMWRXQzBUWGpTaVlIRGxnQ3dRamYvekJOSm5HdWxwQ3o5?=
 =?utf-8?B?d1hrSk9ZcEtISkJXWGxkbnFvQUpESlorUVdtQVFYbVpxYTVXaDBlbzRFajNR?=
 =?utf-8?B?bmIzZHgxK3NDUEV3Zjhudz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THdsN3R6MFp2MGluUll1STJjcVV4emdsZXYwTUVxRURhbjcwK0N2a3JBVVBv?=
 =?utf-8?B?cEdadzdOdUVyTnVDbW55cUxCWTBvQngvVWRHMWx2Z0pDcGRpNlJRVnZqQXRm?=
 =?utf-8?B?OE1xY2ZCdVFkbDc3ajBBOUgydGhWczBuNzVydTlQeUR4bG9aZlNkTURlRTBw?=
 =?utf-8?B?MWQ2bDg5blQ2UVkwRjdYMTBYa1BuTVNlTlhzRVNmZjdIMjgrZVZHUWdzdTEx?=
 =?utf-8?B?Yi9FYUNsL3pyd0hhQ2J1MWZubktrNWN3ckIxZVBnLzcvN04zdXRYSTRBdVYv?=
 =?utf-8?B?NWNvMmIzZFlYV3UrbFR1V1IrcldwcFYrdWpSZHlQNEJ0QVFnb3dHR0syZDVu?=
 =?utf-8?B?cVpXdHJKeGQxM29zc2xDc253TnJocGlMa0dzVTN4MXkva2NwVkh6a1gxSThH?=
 =?utf-8?B?bDJjQUdaSGZ0N1ZrWkdDU3dKVUpJOW5NdFZKRFhGMHJNMTdGdEcvOGQ0bDE3?=
 =?utf-8?B?Ty9LWlV3UjdaamNDa2NEUVRObDE0WXdQM3VqeVE3VVE3bmo3WDZFbEN3V0ZW?=
 =?utf-8?B?b2JWK0ljQlczRGVQZldacTdxc285MmlDVTBzKzdFdUVCNWcyeGNlc2pLZ2xp?=
 =?utf-8?B?NDhrd0kwY2dDeG12NGtpbUs3VDcwcEh6eWt3b1QzamdxVkhGdzFjWnhkcGlS?=
 =?utf-8?B?WWNrNXJBVENxRHlhYnV4cnlwbnNTeWw0TFhkaEMxaUgrT1BlanVMbHloUDBp?=
 =?utf-8?B?OEtqNU9PU1JrYkNVWlBsVkQ5amx1MGxkNVAxbGVUbXQvSUcwbmYxYTdIbGoy?=
 =?utf-8?B?djl6U1F5cGFkK3dEUTVuc0N2bFowNWZlekM2eFhvUXpLSmVtcWZUMExjQ2Nv?=
 =?utf-8?B?VElUcU5kR3ZTcms5RnZ3cXZ3b2dHN01WOUFBanI0dlVVV3FWcWh5bXVGT3Rk?=
 =?utf-8?B?MG1IbTE1Q1ZPUFBobTZTY3N1bE1WbjRJRjRBY09IcU4wZ003eWNjcGNnSVZN?=
 =?utf-8?B?U0FTNmdQMFBxOVBYZFlqdHlwVkNGaHFDRDg2VlNKd0t6WVVxZElhTVovbWZx?=
 =?utf-8?B?d2RYWHFuWWZiWEhpT1dvT2RSalZHd2g0a05pL1hVU0dpUEFNYnpOb3JCbGs4?=
 =?utf-8?B?OVZpUHYwL3FWd2ZIVWVOZFFOZit3WXFZL1pkaDdZNk9wNS9PRC9ENkhoenBD?=
 =?utf-8?B?SU1ySWlMUGVYN1V6WkhTbTZMS0FNZzFlZXMvRUc4ejR1OEEvYjZCR2VkRlN1?=
 =?utf-8?B?cW9TL2ZUaFNCQU8xcjEza2lna0QyeDVuVC81cW9RbytUMU9BNS9tVnZqT3g4?=
 =?utf-8?B?SzNDb0oyRlYxNlhraWZlZk9uUkR5YXFPcFZkMkZPMjZ0MnFYMERWWElNeVlY?=
 =?utf-8?B?b2R3SmRndDZXTHdWWWowM0xsM2VVeGQxS1hBTjBIQ3RZQ213T1Z5cmo4d0Nq?=
 =?utf-8?B?Ym9admdqUEw1RWlwT014MXdvdEpYOCtIT1JKR2dCRGxjM2tEdlBsUERaNnJm?=
 =?utf-8?B?QkFwN0RKdlZXSzdKcUR3akNKUW5UZUxWSE9oaUlleWhyNVVYTmlKaXg1OVN1?=
 =?utf-8?B?clIxMkRUdGl2UGZLR0MxNEZMN0dJeXdPTGxsSlEyZmRXc1BLclN3cDVMZ09n?=
 =?utf-8?B?YUo3QmwxQW90ZTdOd2hHallrMUJnRFVLRDU4ajAyTXlsaHhZaUwrcXdDWXU2?=
 =?utf-8?B?MUFhVml2M0UvdnNDeDZkM0JFTjRXSExjU2dlYkxWL0dpMnZ5Nyt5Z1VSS0tC?=
 =?utf-8?B?VHlrY3ZpODRsRExsNS93a1AvR2NmcG5wNGs3bCthb05vQ3pDSmtsTnVkTFlT?=
 =?utf-8?Q?DSTYzQI1kEAHE9auPPJ2XoUuZ8A+emtrBecITMO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337a98e8-6ca9-4561-31e8-08dd5fa5f2e3
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:34:11.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_003450_997888_D476EC01 
X-CRM114-Status: UNSURE (   6.93  )
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

SGV5LCBTdGVwaGVuLAoKUGxlYXNlIHB1bGwgY2xvY2sgY2hhbmdlcyBmb3IgUklTQy1WL1NvcGhn
by9TRzIwNDQuCgpJIHNlbmQgdGhpcyBQUiBqdXN0IHdhbnQgdG8gZXhwZWRpdGUgcGF0Y2hlcyBm
b3IgdGhpcyBjbG9jayBkcml2ZXIuIFRoZSAKcGF0Y2hlcyBoYXZlIGdvbmUgdGhyb3VnaCBzZXZl
cmFsIHJvdW5kcyBvZiByZXZpZXcgW3YxXSwgW3YyXSwgW3YzXS4KCkxpbms6IApodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1jbGsvMjAyNDEyMDkwODIxMzIuNzUyNzc1LTEtaW5vY2hpYW1h
QGdtYWlsLmNvbS8gClt2MV0KCkxpbms6IApodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1j
bGsvMjAyNTAyMDQwODQ0MzkuMTYwMjQ0MC0xLWlub2NoaWFtYUBnbWFpbC5jb20vIApbdjJdCgpM
aW5rOiAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjUwMjI2MjMyMzIwLjkz
NzkxLTEtaW5vY2hpYW1hQGdtYWlsLmNvbS8gClt2M10KClRoYW5rcywKQ2hlbi4KClRoZSBmb2xs
b3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMjAxNGM5NWFmZWNlZTNlNzZjYTRhNTY5NTZhOTM2
ZTIzMjgzZjA1YjoKCiDCoCBMaW51eCA2LjE0LXJjMSAoMjAyNS0wMi0wMiAxNTozOToyNiAtMDgw
MCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKIMKgIGh0dHBzOi8v
Z2l0aHViLmNvbS9zb3BoZ28vbGludXguZ2l0IHRhZ3MvcmlzY3Ytc2cyMDQ0LWNsay1mb3ItdjYu
MTUKCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAxMzU0MThhZGQzODc4ZGNkNDQ0ODNk
MGYyODUxZjZmNDcwYTg1Mzk1OgoKIMKgIGNsazogc29waGdvOiBBZGQgY2xvY2sgY29udHJvbGxl
ciBzdXBwb3J0IGZvciBTRzIwNDQgU29DICgyMDI1LTAzLTEwIAoxMjoyMjowMSArMDgwMCkKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUklTQy1WIFNHMjA0NCBjbG9jayBkcml2ZXIgY2hhbmdlcyBmb3IgdjYuMTUKClNvcGhn
bzoKQWRkZWQgY2xvY2sgc3VwcG9ydCBmb3Igc2cyMDQ0LgoKU2lnbmVkLW9mZi1ieTogQ2hlbiBX
YW5nIDx1bmljb3JuX3dhbmdAb3V0bG9vay5jb20+ClNpZ25lZC1vZmYtYnk6IElub2NoaSBBbWFv
dG8gPGlub2NoaWFtYUBnbWFpbC5jb20+CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCklub2NoaSBBbWFvdG8gKDIpOgogwqDC
oMKgwqDCoCBkdC1iaW5kaW5nczogY2xvY2s6IHNvcGhnbzogYWRkIGNsb2NrIGNvbnRyb2xsZXIg
Zm9yIFNHMjA0NAogwqDCoMKgwqDCoCBjbGs6IHNvcGhnbzogQWRkIGNsb2NrIGNvbnRyb2xsZXIg
c3VwcG9ydCBmb3IgU0cyMDQ0IFNvQwoKIMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDQtY2xrLnlhbWwgfMKgwqAgNDAgKysKIMKgZHJpdmVycy9j
bGsvc29waGdvL0tjb25maWcgfMKgwqAgMTEgKwogwqBkcml2ZXJzL2Nsay9zb3BoZ28vTWFrZWZp
bGUgfMKgwqDCoCAxICsKIMKgZHJpdmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDQuY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MjI3MSAKKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIMKgZHJpdmVycy9jbGsvc29waGdvL2Nsay1zZzIwNDQuaCB8wqDCoCA2
MiArKwogwqBpbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDQtY2xrLmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTcwICsrKysrCiDCoDYgZmlsZXMgY2hh
bmdlZCwgMjU1NSBpbnNlcnRpb25zKCspCiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCAKRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL3NvcGhnbyxzZzIwNDQtY2xrLnlhbWwKIMKg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQ0LmMKIMKgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2xrL3NvcGhnby9jbGstc2cyMDQ0LmgKIMKgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svc29waGdvLHNnMjA0NC1jbGsu
aAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
