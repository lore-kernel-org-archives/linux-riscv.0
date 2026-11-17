Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A8606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 09:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MjitaUsp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=selector1 header.b=FswGXPBt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Subject:From:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=U9Vdr9VGanb+8qpIB31QBFzj1JYiKvymK+gO/aXp99M=; b=MjitaUspPAYRbDJBtmmG8eouzG
	iHx2t4ZmBNM539BPCGlLbgVUy3GaobCzs2JRTJOpTXH4Ssr33eLP8PzUN2PcWYmQXQc5R1X9OspZ+
	AWI+T3yBxebh9b+SYCOTGM7+ILHEHwc4n0QvtSK4ABy1tUXrB2EWVA54CGRakWSQQR+uhTVZjMuJ3
	fYOsebNw013UR8zJlLJ9tkUiI3wfL/21sZJ0fOMOCVwCIIFXkW8ujis0q4hhMWspuATZKmxXa98lf
	juh/hnhxmCBaQq/Y0atudFNbYOMGgx65rH5zUQpxdSRPOJ5D3ocJHMI0cg3Gc+y6YCx3rTnL0Hhe6
	3ZFcOvig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFrN-00000005CAc-32pL;
	Tue, 17 Nov 2026 09:52:17 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFrJ-00000005C96-3kSO
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 09:52:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OyCbgc3vP03EGCmIThD7cpOOnlkCls2lmI98j+mHD5l7kt8At1Mx5L919GJy8UDcWBmIEUQDxUNoZmAQWzlCEYJMY84zkJlImFKd1wmMPBEjGcJP4GPnjKd8ttCdtusPEaPitrr/Bk5jR3QuyzKqlUQbTjcVqKTk2EdC0pejWFau2FbFKPJ7Y0U2opnIC4QX7RCuXYr2/nlXJUlRkPGIFFpWL4j49g75/sCnSeEoQi0id/bSIswqHm6lP/4+KBmZLDwcguqP19I3ehnRGxgBs/PQBcm3FPdIEnAGeYN4oNZlp3SvdYU2/XCtRJgtTXNDfG8WCcE+xHOD+YEVkm9StA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxxOjAA0upR+bOEy7IQO6QkyZEUA4pTAVCj4OfteLbo=;
 b=KhBeuTLxPLeNIrZAueVzoP1M5R6cwmXpQrdRL8UiFPNZQ5Mt2oG7EXE+/GIhOayAUXwKRIlBQqxIeqgrJaBLjRPJI6fY81kAytAsz6T/GUiA53x5wAf9ixbhPYWg3DteRIfldBXo01v8jipVmjC253Qg+Miwjvk77dFb2tYu6I4t3BKSDExDJM8SiZFGi3qJ0KsNUN612IM7C28SBrY6lkMEyPpnngrMCzrRd6IjYfpKOQ20YlhtrpbnYvdeZ5iQ3qp8BYf1vN5ga0i8xM06v836HtLXs+lAEdYZQUjpLBocVbOYfcUmr/CjXaNLdqfXdysmNTnJ/I5EMUUqHsUJaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxxOjAA0upR+bOEy7IQO6QkyZEUA4pTAVCj4OfteLbo=;
 b=FswGXPBtOc/qTAC8yBx5k0p4xdmC33u258vrRG3oGsv/ZhTvOlOvtzdU5o0OyD31DueFK+evKVC8+iO8UCtIOQ5dReTrnpVX9DbYqbGZ03h/7v00UYg6DW0Vg1utCpV6uO8Ib83oix/K+PyK9n9irObiZIwj1t1sq4rZwl5AXlE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 (2603:10a6:910:e0::22) by GV1PR09MB5979.eurprd09.prod.outlook.com
 (2603:10a6:150:a4::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 09:52:08 +0000
Received: from ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2]) by ZR6PR09MB889505.eurprd09.prod.outlook.com
 ([fe80::9006:1164:b51f:23a2%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 09:52:08 +0000
Message-ID: <a971d355-a7bd-41a8-83ba-a250e77f78f1@mobileye.com>
Date: Tue, 17 Nov 2026 11:52:05 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Subject: [RFC] riscv: Can a valid LR/SC sequence have a backward branch on a
 failure path?
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
X-ClientProxiedBy: TLZP290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::6)
 To ZR6PR09MB889505.eurprd09.prod.outlook.com (2603:10a6:910:e0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR6PR09MB889505:EE_|GV1PR09MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b65c94-b48c-4b8e-fc7d-08df44907164
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|56012099006|261026140227099003|261026121527099003|261022105027099003|261028144727099003|261009223027099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: AQqNKRx83+sHu1OyEN7v4x/V+loREz9S+g2kWm90y9XvEqXbclrfyoE7VaF5FsA9zGc40JlVe55NbEfHCFk2bsnNBMGkGT9AKOAGyi5c22NXApDN8HFxA1C6jdyHZq6BXVgFTk6adFEa8tuWT6fTl6kbOMGz7JuvjcLrY+eEcotwdGzdXlh6Iw7izzuYNcPRR9O+iGcOS1q4LzmyxnTlLGbTySbPhlLanBkrhf4WNEuqN7T5rfDqo+WteVvp0ul9ege49wR4ukOO/yJ5ZEk36gi/LqAzTFEWw3F4ROq3UjjVrLv6MtVIPXw00pc9hXLpCrrJ2d1VM0+C3GSS51h2ZtKtfirn/eyQFV1YCmdXZz7QM2XxDWTfIK7LYt9etjrVBev2mEgCACMRiIhKYlVjSiH8n2p/C9rDDrO/D7r3We8duCuqAvz+1LRW6/0A/dw53S5XUcwBsKsrMoV4M+9qBfCiyVqblmQp+ig34oKAj9WcBvMHOd1pwBvsW8TtmwH3/7FdKJpTLHYx3Kv2EhiDCxaMabu2yhytmn8kk4+YHUZuvlkQ7aRIzutNUras96HhH9TE/qGWglaSaWbhJuGGZVmRKZMljXC5bFQz2NMxVzHwAhva/cVxx9yesPQXVDaI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR6PR09MB889505.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(261028144727099003)(261009223027099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3FWYUFlZjdWTTNyOWloLzdyMFoxR0ovR1Q5YXZUaW5xbVNQSy96OEZxbTlh?=
 =?utf-8?B?TmZiS2l4UE8rT0dBTFpGVnhNZnB6bmp1clNrT0x1VlNkcXU5ajV1cXRWR0VP?=
 =?utf-8?B?QjFWMVF2Q1hrL1BTNGZMeStKcVhBS2c2MnZCMHp3dlRaanRBK2xySjJJTmMw?=
 =?utf-8?B?WFVJVDdHTklYckV6TTB1bktGVzFWQ0JNdzFFYkJzbVQ4QzdmSTg3NWhweEFz?=
 =?utf-8?B?M0MyWDdzSmhtbVJEczFaK3FWWko1N1loelhsUE1HUnppQm9OOVNqcXRSNmlR?=
 =?utf-8?B?Y1lTMzlDNWplOGw5MS8zRjZRVVpVYVllUGNTeThFVkxNL0VCYTNibHNCbU0z?=
 =?utf-8?B?RDd0RkV0K3VaU1lZL3E2TUhaQk9RMUFqNzJPVmVhcTJ5RHMxT3l2TEptamk4?=
 =?utf-8?B?Sk5KYlg3MFVxaWZ6UXMwbVRWNzdaUkpPYS9tN0Fiek9pcHdvcEhPRHh4OW9l?=
 =?utf-8?B?YXBLUTVuc2trVWVZS0ppYzZ6VHUwYU1mWHpNMkJPZ3EzZ2dHVklHZE5VMXZ6?=
 =?utf-8?B?NzUyTkYxR0tIRWZscFVOYTl4WnRWUVFZYzNTS2FKSy9GTTUxbEhWOXJ4SjVC?=
 =?utf-8?B?WUNlVHRSU1VtTWdQSEY4UmFpUU14RmIyZjhhUjlId1RReGhWUHY0VTBHOUVr?=
 =?utf-8?B?ZzR1NHhYbGg2V0dpMzlHUVkvdUFKbE1qODIzZFRNcU90QklOQVl4RHBVL1ha?=
 =?utf-8?B?a3hINklNeVRLbEUxTWdkMlNYSzIvalpyeWM1eE5PMUtrdFFKTVdHcTZRK3o4?=
 =?utf-8?B?RU94OVdRM1JjZ1VuZ2c3TGtWUUE3Z2laQWxZOTFmTGRjUXpKL3ZKNDI5eGh2?=
 =?utf-8?B?SHBjUi91UjhjdnVib1pRekNMazhMTWVDMUZ0L1dMK2Q4UlhCVS9UTHlEOWZS?=
 =?utf-8?B?U1lkaEZLNmpReEN5TEZIbitlY3U0NjQxS2VjTVcvWC9tc2NTdFNGRVhyemdM?=
 =?utf-8?B?Y0c2aDFEbWIrbEhENlNWYS8vOVdveXYvRC9NMFoybno5Zlo4WmdQRkNKRnpC?=
 =?utf-8?B?UloxNmVHcEFxanhGMXBIT0wvL2EwemtCZ0hYZlRvTzJhT3REMGF4YWVnL25H?=
 =?utf-8?B?dHZIMHRXZ0Z2M09WbjdncnVPRzlIMkRlZkg3bG9zcmFlMmlFd0c0Q3kxU0py?=
 =?utf-8?B?UlVUMmsvWGJjajdzNVlmZXhubkpBa2NuckI1VEwrOG5aYU1zckNWOGZkVnF1?=
 =?utf-8?B?YlNOSitZY2laR0MranRxd1BiS2FmVlE1Y3NhS0gxQVQ4UGwvUmJEV1hpSmFx?=
 =?utf-8?B?d3BPVC9LdWJEYmFSZUx2dlMweEs0eC8wT0ZwZHVQUVlwQW9IdG5CZHJCWVBE?=
 =?utf-8?B?eEZqTlkzejNidVFuM3Y1SDA1aXlQeWczTWNHTUw4aHJkS1V0SDc3dndCVDMr?=
 =?utf-8?B?TENOeHVQR1Riekh0OGhYd1ByNFg0dFdoeHdyKzRKbHJHVG5OV0FaQStTc0hU?=
 =?utf-8?B?dHFuQ0FrU241OTlKSXU2MjNlS2JhZFZIaUEyUnNQRVE2LzlOWGFuTlJsMGho?=
 =?utf-8?B?cVBOQS92RU9LRHByT1IyRHlGOXprbHBrWS80MDRGS0tPU01ZTlhhcTk3K2th?=
 =?utf-8?B?bnROaU83ZkNpaWovSnIyTW9ET2FoeWJ5d1FRSHZUZzdtVHMxR1N1K2U3bE5O?=
 =?utf-8?B?NHBROThaTkFwWi81a21zTTk3NzcyQU9zeHJoT3lOZGtNWE9vRVI1WW8rVlRo?=
 =?utf-8?B?YkJic2drYUFWWlQ5WjZrOFVYOTYvRU9VVnd3SzNFQThTSzA5V3dQbkZ5TW5l?=
 =?utf-8?B?YUhuOW5vTGlDaUFheDZGY2VadXl5bUdCMkQrZDBxdVNVZDY2VFF2R3dKeC9O?=
 =?utf-8?B?UlR4NTR4Vzl4b0xyTktWWVZ0WmRWbmhoN0VoNm9kQnFBbWNDQThiWFAvS3hi?=
 =?utf-8?B?dFdJWkNyNzg3cHhMeEFINU5rZWFpQzc0b1V3YXpBSkNhSkM0Wm1tZUhScWVa?=
 =?utf-8?B?YlBLV3B2dWZDdFJlbU1YTmhlcW82R1lnVmhneGhncUM3dXBub1U3MHFYVlBi?=
 =?utf-8?B?K0E1YlR3ZDVTS3ZTeGdXTkdtNWtDVEVCSC9Udkd4cHUxSTB2clhZL3dXVWNU?=
 =?utf-8?B?WFBXMnBZWHBZZlpTM0FGM0NzcmtXWGpTQ2tVYWNqbmZ3NlgwMGdBQitGME00?=
 =?utf-8?B?NXczWUtZM1ZIdUZ3cW9uVEJ3bTdCSDgvUzlLUUtReHhpUzBxdHpiODgxVHJR?=
 =?utf-8?B?ZWdyS0tVZG1PRlB6Y21CR0xqYlUza3dObmhCUXUySVBFVVNXVE5VWFMrdkRx?=
 =?utf-8?B?L0phTnBBbG82ZXU2Nkh6WG9WMGJmcllDSTYwek9CZmcxaEQ5YkZLSlpXVTBX?=
 =?utf-8?B?T0xFdU9YeUxNTEpVTS9LMUR1dm1sMTlObklyQ1dKbFgzNk5haEFQZz09?=
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b65c94-b48c-4b8e-fc7d-08df44907164
X-MS-Exchange-CrossTenant-AuthSource: ZR6PR09MB889505.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:52:07.9994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfodd8SIe0LrKa5gNgTsEh24O11ckizkdEL5r071N/rcth52QDaf9tcGzR3iaFk0cM8Qx8+2pxQJZoyXLMRFDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR09MB5979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_015214_123114_B5AC25CD 
X-CRM114-Status: UNSURE (   5.24  )
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

Hi all,



I have run into a question regarding LR/SC sequence constraints: can a
valid constrained LR/SC sequence contain a backward branch on a failure
path?



Consider this CAS example, where I placed the failure path before the
LR/SC sequence:



cas:

	j 1f

2:

	li a0, -1

	ret

1:

	lr.w   t0, (a0)

	bne    t0, a1, 2b

	sc.w   t0, a2, (a0)

	bnez   t0, 1b

	li     a0, 0

	ret



The rules in [1] prohibit taken backward branches within the sequence.
In this example, the backward branch (`2b`) is not taken when LR/SC
successfully completes; it is only taken on the failure path.



My context is control flow graph (CFG) analysis when detecting whether a
particular address belongs to a valid constrained LR/SC loop (where
probes must be rejected).



When scanning `bne t0, a1, 2b` in this scenario, should the scanner
treat this as an invalid sequence and stop, or should it ignore this
branch target and continue scanning forward?



[1]
https://docs.riscv.org/reference/isa/v20260120/unpriv/a-st-ext.html#sec:lrscseq



Thanks,

Vladimir

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
