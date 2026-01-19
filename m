Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C15AD29C30
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:
	To:From:Subject:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDxLnuSiy/J3Ho05nzjOOW2Ui3+9EsGHR8mK1PjsCOk=; b=UkMUNjpzWPJWZK
	m15KDqJ2P+cQrfq8KtNWrW2SZfZNFgwiJ5On6dvdxoocUxzaSAeIleyNMLu3SKH61AcbiyyaBC3dN
	ml7BdroKkxIkkJlZwMrnPC7nwL4c5phhtfLdGMG6dlp9328aKy2A/hKtXloJ51RBSNyZ6ggNcEjZr
	IfCllI/GwuNKKYsMELJGvBcfMy+ST3WYx0uYxdguG802LeoWGmh4eINngb63Onu/Yj+Nm45TuOOvQ
	0u1BsCAhe626SLZENLcAvU+/T5M+rS3J93UoZJWdWML9SQEA6kR1ZlmZJQo6kASTf4CSFFf4tIzo0
	VYAw//YRMF8rM9PRlN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqK8-00000002H1c-3LTE;
	Mon, 19 Jan 2026 14:33:44 +0000
Received: from mail-ukwestazon11021097.outbound.protection.outlook.com ([52.101.100.97] helo=CWXP265CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqK6-00000002H0n-1Mce
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 14:33:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAJQYUfO+yo1UZnID3gF0zmQo2xhzVc255MEBb66aXUx5KtDRRhUP/fSzPiBs0eqCQyO/Iq+50Cli9otL6sm+x4wvM/EflFWsaHrxcy9dGlWQ5y8W7DsFOAnOttLRDOV/Xp2UkJNXildt9hgqnonUT8ZhR7pDTmjaMpvg1ZGK3VdT1Cd3UngrDN9StO8tR1dQjzU7sHvu6ucmcAMQn0bfFgblHY8PPCeJbMdDK1dAMfoDovAV46zxdE6szNyx2ybl/6c9ZhUQY9hIfT6HUGOdgu/t0l1BlgyRQBJP8i4PbxmmEWUN1/FTOrdfDGwvjabplcav75A24WCm+GD1Q2svg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WTnE/OMQCcf5TZmK2xsispFblgHqg4Meo+lA6ue4gxk=;
 b=PnDckmNjYvZLhdNBNa2bBpxUI45Lrl5vv2/tc1VLv1znNaTc2kZ6Ku2PmplHqTvKyLdD9S4REWBVzFM4ieacwYiHWQD2cS9Y/l8L7RwPC86qKTj9R2JDOVSDsBRFLSOGcttpyS6iBoxB9LDnH1OoyEEPfyRFdiTY9W4b6GyQMc5brfAc83jY+O8EestJ+Qo0O/cItyQcRm+KJIoQEr9niEawcbz24ttC3Mlx2p9heZyTu1aSGJfokt3i4PmzFzCKrGa4X3Dm/IQ29twTKGdKgVtNnlgTAnyBZHjmhV73io11KbqY3NriFhFULtdOcR7pcCMI4M1We40D8xRKndHZ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WTnE/OMQCcf5TZmK2xsispFblgHqg4Meo+lA6ue4gxk=;
 b=W36J7M6/be+6I2bUHeiUqruK2jh32zneNSkSZZwUGbRRCmtP39taIKi7DJw6N43sfVQfYML1bSUgw/IbX/731oomX1NvmxVopMy+zWBLwrmhIDyf3Gq/CzoErsfHvAyeS4jV34CfPfK5VFUBtvBB7QX+WyzXOKsR0qiv3hHaZKQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB8702.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 14:33:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 14:33:38 +0000
Date: Mon, 19 Jan 2026 14:33:37 +0000
Message-Id: <DFSN1M7NPLHX.20PQDYA5DU7RM@garyguo.net>
Subject: Re: [PATCH v3 2/3] rust: clk: add devres-managed clks
From: "Gary Guo" <gary@garyguo.net>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Drew
 Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-2-77d3e3ee59c2@collabora.com>
In-Reply-To: <20260107-clk-type-state-v3-2-77d3e3ee59c2@collabora.com>
X-ClientProxiedBy: LO4P302CA0024.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1920ab-cbef-4fc0-88c4-08de5767bc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmtSUnkzcS9zYkt4TUtERFBkYmVtaUNuM1FWemRZK1B3SFkzcjJYdVpjVndS?=
 =?utf-8?B?blFXMjZQMzRTb3ZPb3NKd1lNM0Z6ZElQTC9tT01TaEN0S3BZeXVHSmJZSndo?=
 =?utf-8?B?eWNRV1JlWDlkUUtPVWRWMFVNTGVjVjRLZUtURWk3eElrWWtvNVRhTmQwN0t3?=
 =?utf-8?B?TTJ6UXBIVllhay9rOS9RY2kxSWVBMUdCZkRGVzFhZEpWWUg2VGZOSVNJWEVl?=
 =?utf-8?B?ZDVVZFRBUnVmMXRZNUhFbTJXL2Ewc0o4dTlvV0JxNVZSZ1p1TFRPZ043YnFQ?=
 =?utf-8?B?NEJIM1ZVZVE4MkR1WWNFUmRCMlNZNzlhR2g2cVdDcDM1UWZmQ1RudVZwZW95?=
 =?utf-8?B?M0UrUDBZcnBGbkROV2pablAxbEVVckRyaktsVDFkQmhaQ2V2VnN4aWRBZWRC?=
 =?utf-8?B?K01nUENLbjd0TGNLVDZmUW45NnlHaFpLVjFHdExxTWFST290cjB6Yk9JMGov?=
 =?utf-8?B?czh3ekpKZXoyQzMvbVZEZlpQNUUxTnBzZC9HMmxQbjdvSkNVMyttUjkxK3BB?=
 =?utf-8?B?bjA4SmJDMGRGQWJrYzZpUEMzTTIvSmJYN1FsbDA2NVBaaWtrQzRDWHRxK0tu?=
 =?utf-8?B?eXhIOGlBLzdXa3RaQzBSTFdRNFNQZmxPTXZVeWdmakxoaC8xbEl5cDZZL2Nj?=
 =?utf-8?B?Mndyb2lWV0N1SWJoWnRjODRybFBZanRnNFBFRkNMZ1VVdEtxMEZPSmY5bUZh?=
 =?utf-8?B?V3YrdzRYbkNpdU9KK21aemZZVDdQZFlCeFphaHBzNXJDN0lZOUV6UGNxMlk2?=
 =?utf-8?B?d0NPaCtPaE4vQkxsdndyYnJQUHBsMUg4UjhKYU9nZXNDcktoS29NYTU0dGRT?=
 =?utf-8?B?NDAvQWRlRkp2dGVnKzBvVE9pd3BOM1B1Q3JnNTg3YlEvcGZPV1E3N3dFZWM3?=
 =?utf-8?B?NVM2M2t6eWE5OVBONUtVYk1ybktkOGRzY2Mxem1GNGdINFp1bmZTQkc3c2RU?=
 =?utf-8?B?ZlRCUFQxZlRTTGlrWm5NRlJCUEZoTVBiQ0RkNy80ZkhZTkdoMnJVWTRTWENN?=
 =?utf-8?B?eUhlZURkU0tHdndlbkFBY0M0bWhVQzZ3OS8vaElPcnhMdC90NlE1a3dMaXRT?=
 =?utf-8?B?bjgvdncraWhKQU1jOHBsS1BtanFWRlRGbHcvZGtjSTQ3WUtJL1RveFNGejJY?=
 =?utf-8?B?QU9oMnBsYTBxTVF3ZzJKUkpTWEhiSSthdlNTczNlVHFabUZpelY1VE5nV3ZF?=
 =?utf-8?B?ZERLQjBFRXVEMDhnc3pwL2Q0MUtvenphbU45dTdGaXBydTRQeFMvaG1FUGhF?=
 =?utf-8?B?cS9FbGgxaFFlNXU4eng0dFBSd09GV0hyUk13NmNUcE5LbWJ4QjVhRWVTS0R5?=
 =?utf-8?B?cDl2MjhVVUJqV0RZMjk0aU9oU042Z3grTEc4MXBZdVV4Z01OQkRxKzN5eGNG?=
 =?utf-8?B?VXNDRWJDeGVFM1JaYkRadzk2aWNjRVEwVG5FclpUZExGV3dkYWtCczBwRlNP?=
 =?utf-8?B?eGFoOXh4MHJoMk1aZWtnd2kyMUtJYXMvNTErMUlsMEZENkplbzdxMmdkV2RQ?=
 =?utf-8?B?dkdMU21oWmtrZFZ6UkF5ekpxSW5Ya2VEVHFpRS9pbUdMbFRMREZ5REpHUFB5?=
 =?utf-8?B?dW5oQ1U3c2xCNmxSWUVXVWNoS1NqemR3MDJIRUYxYmszUEVIZ2JuMWRPOHk0?=
 =?utf-8?B?UkdjZTFRQW1ncEhyTExjQ092TTBjY3d6NU9CcEhZeUNUNFE3bEZjN2t3R1RW?=
 =?utf-8?B?ejAvZ04yV1l2OUxFc3pSVUlmUytlalhhRTdPamc4S1hiSkxLeThlc1ByN2ky?=
 =?utf-8?B?R3N4bTF5ME5KWXRjSDVHQWRzRmxvVGljL05JOURobUtxc1BDMFN4NUdWaXVu?=
 =?utf-8?B?aWtFdTZEek5nY2hNZUlvZjRSUENiK0dsdmxReVAzSlFpME9iS09BLzM5a25M?=
 =?utf-8?B?dFY4UWlrRUloT0NvTHg1eWY1SXIwR0Z6MEJpdlJTZjJ1ZWl2K3BGNG1YbDNi?=
 =?utf-8?B?T1BadVhqeFFheDdzRUVQT3FObDR5L2QzUmlwKzJ3USs1L016OVBTYVZsWlJN?=
 =?utf-8?B?cERrZUlCajRIc1lXTnIrbWJQMmtmKzFEYVlQSGs4cnQ4emw4TTNVYUgwaFFJ?=
 =?utf-8?B?eFRrR2gwUUxUVGNPWE5leHdUbkNFTUZIdmhBTGQ4U1I1Y2hweDQ5b21ETkxm?=
 =?utf-8?B?aU1WRWhFc3FxSUQ5cHFUamUzU1pUNElRa0ZnUU1aV0pXRE0wN0syclEvcmhV?=
 =?utf-8?B?UXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEVNUUJNelVnNnlJbnR1OWJyUjJBMnZ6YTc2ckVNZVkwK09vYnZMZUJFNldj?=
 =?utf-8?B?K29ZWUxaM2tKejlCV05VcEk0L0FsRHhsTTFpcDVQTUdPUUY2Tm8raHhEcU54?=
 =?utf-8?B?bDlGUWZUTjk3c1pTYmoyS1ZpS0JWbEFmTmlES2pTNCtRU1dEVmtWbWR2b3dn?=
 =?utf-8?B?SkVDbFdhQlZ6eW9xTG9VelhkMHcvUDJlUitqdnJraEUxSWpoUkRXUXpYSWxC?=
 =?utf-8?B?eWM5RDl6NDkvNHRDbmhPajFXWDVieDFaajhHUEIxZ2RoemtHOTcxWktzVzJm?=
 =?utf-8?B?ZmJhTWxQalMrSVlvajBYQzRNbzJFcUVnYi9nWVZkWGtKYzNUT2UvbmJHTVZC?=
 =?utf-8?B?bVFUS0RjOGJ1RUNGa1I4N1ZSTWNzazByNk1qQTVrY1I4UVFCWDNYb1JIblVL?=
 =?utf-8?B?TEN4eUtWTXF4YW5kVmVGTWl0QzlNbE51SFViOWV5MFhDNko3UFZ4MTJZU29u?=
 =?utf-8?B?bHhZUHZEQ3I1N2lGYUNzMHNLRk1rdjFJMFBaTFZZdTNvYnRhWWtWYlBPdWtq?=
 =?utf-8?B?a0l1YmtISEczMjlLaGhjbFJmVStTMUNnN1l3c2hsdWVtNVhYWlVkMTRPU3Nz?=
 =?utf-8?B?RkdYVjFmSExqRUpnVWxxNXVobFRmNUJyajFmVmZFSnRDeUN4SEkxZ3FHbUNv?=
 =?utf-8?B?aTNTMFlBY2ZlQ0dRUXcramF4bDEwZll2MDFzSGJnR2oxb05RL0xYYzFzWno1?=
 =?utf-8?B?Uk9tT2NkU2pBRDRRNVNTVXU5bVgvYVZWN3AzaWE2L3J4eERHbGF5dlFaWnds?=
 =?utf-8?B?djNMbFI3WHhMSGNTb21GRVMzc2UvcTU4OWdOLzdhNkt4Qk9ObkVvN0FJOFpo?=
 =?utf-8?B?WjhWUU9TQjFrWjdicEVmZVZhd1ZFVDd1ZGJLMm95T0IvR2ZsY1JYMDN2dTM0?=
 =?utf-8?B?WFR4d1BMcDh5SElmL3BZU3dOUmQvU2oyZlhkd2JUOVd4OHpMcE9maFN5SVNr?=
 =?utf-8?B?MjM3UjNNNElvTndjU1FMN0FpUUx0aGxxSnRxNENRYThZRHgzREpaMitIa2R2?=
 =?utf-8?B?NUtYWmRKRStXN0owakhKZnhpSkJDRHlsSHRycFp2dHBBQzEyUHd6WEoyTWo5?=
 =?utf-8?B?VWpkRnE4QkpEdEpuTkkwZGpCQkt2U3NNU3R3cWE3b2F1dXVVNkV6NkNZVEIy?=
 =?utf-8?B?Q2ZHbVFmdU9MTjI2a2prbEtxc0FxNWZ6azVTL0RhNkNnY1U5TzRWME1RZ1lk?=
 =?utf-8?B?U1NwaXd4VEhFYzdDaEUranpCS3NMWmhnb2FsTENiMXpkWTRtb0JzSEtEamdG?=
 =?utf-8?B?RE5jUE94UWVHckFXTFIxWlUyWGlCYzQ4Qi9sR0h6d2dUZkRKV1ZKV2Rmb1pG?=
 =?utf-8?B?VWJnQUJDZUFmeWZwTFNtcCtFdFVtR3NxSFhOdFhkTVFBRGRDU2lvdWYrWTNv?=
 =?utf-8?B?Zm9GaUhPbVROWUhkY0Zaa3Z4L0FiQkpRSG9xUjdkUkY0TTZXOFo2TmpkaDQx?=
 =?utf-8?B?UnFndmFJU3JtMU5HYnNOSnBiTTFJTE5vWnBaVlBBSE9nS3liNUJ4TlVXMDBS?=
 =?utf-8?B?VVdLSlllUTVyeTJqMHRTZVRnVkFpMnNRR3RVLyt4b1FXTmNHZWtIL2pmLyta?=
 =?utf-8?B?dk5IVVREZ2YwbU1XWXQwQTFnK01hczZaYUsveVBNRW9jRnk5SFZvZmh5bEhQ?=
 =?utf-8?B?cFdCcWo1b2pMZWNDSlFHYjJyOGRDdlNBQWVYTHk0dlVmN0cybEVyWFB0SEVz?=
 =?utf-8?B?aitLY3prWFBsMHQvM0JQY1c1OVNSZGdQMm5QYTN3SzdBQnYxR3gzcWlnUnNp?=
 =?utf-8?B?bHhqaXJaZnBlcm5hekVDQ1V0cW1tV1daUEhlL2pzQ3dRVGF2RU5MOWRMMTBT?=
 =?utf-8?B?VXd3SWtFcmh5MVFNaGRMMGhvM0wveFBDL1FuTGhzbjJ5ZnErY0N6QlBBVVVw?=
 =?utf-8?B?c3NHOVFub0JQZFNCUEtURVg2TnFGUFpLNU43WkFQaHArT2lwcC9hcHd3R0N3?=
 =?utf-8?B?RmRsbXFlQVBxa25USU92bkI5TWd6WlUxdk5jVVkrL0I5Rk5EM21yR2JvU05X?=
 =?utf-8?B?TUErVDFBbVVvbUx6MTZKSTNvMy9HY3ZGdHQvZEtDSWRLZHJ6Ukg1aVlwWWtH?=
 =?utf-8?B?eXFERUU2UjNNcVQ4TVUxcXFZS29aQTNZTEJQZUhnQUIrbmN6TUhZTlI3UTB1?=
 =?utf-8?B?NGhSemZkSHBwWGtRc2dMblZEc1JlRURUQUpuUEhXZlEzRE84WDZXN2pFeUl4?=
 =?utf-8?B?R3dFY2hZOU9WWjBvaWJlMHhYNHFsUkNHV3MxR1dPN0o3RW9EdXhVOHhlTUFM?=
 =?utf-8?B?OVJ5WnpFS2d1VFV5ak9iMitDNXhqcFBad3g1cUs3aUJNditXK3c1bE42eDhi?=
 =?utf-8?B?L1VjeGpwS2xWV2huOHU0bXg5QmE4eWxkbHpzQXRGdUFpN0ZTeDdpUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1920ab-cbef-4fc0-88c4-08de5767bc24
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 14:33:38.3692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRuxPCtRLzmYArR322SSSvd8GS8gdTi481jXHeE4w/umyUT3R4UYxBJzvbToIwOxDT5Z7ObqOmMJ117adBWLgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB8702
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_063342_382230_5AA5349C 
X-CRM114-Status: GOOD (  20.25  )
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

On Wed Jan 7, 2026 at 3:09 PM GMT, Daniel Almeida wrote:
> The clk API allows fine-grained control, but some drivers might be
> more interested in a "set and forget" API.
>
> Expand the current API to support this. The clock will automatically be
> disabled, unprepared and freed when the device is unbound from the bus
> without further intervention by the driver.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  rust/kernel/clk.rs | 43 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index 6323b40dc7ba..e840e7c20af7 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -95,6 +95,49 @@ impl Sealed for super::Prepared {}
>          impl Sealed for super::Enabled {}
>      }
>  
> +    /// Obtains and enables a [`devres`]-managed [`Clk`] for a bound device.
> +    ///
> +    /// [`devres`]: crate::devres::Devres
> +    pub fn devm_enable(dev: &Device<Bound>, name: Option<&CStr>) -> Result {
> +        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +        // SAFETY: It is safe to call [`devm_clk_get_enabled`] with a valid
> +        // device pointer.
> +        from_err_ptr(unsafe { bindings::devm_clk_get_enabled(dev.as_raw(), name) })?;
> +        Ok(())
> +    }

Would it make sense to have them as assoc functions instead of standalone?

Regardless, the code looks correct to me.

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> +
> +    /// Obtains and enables a [`devres`]-managed [`Clk`] for a bound device.
> +    ///
> +    /// This does not print any error messages if the clock is not found.
> +    ///
> +    /// [`devres`]: crate::devres::Devres
> +    pub fn devm_enable_optional(dev: &Device<Bound>, name: Option<&CStr>) -> Result {
> +        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +        // SAFETY: It is safe to call [`devm_clk_get_optional_enabled`] with a
> +        // valid device pointer.
> +        from_err_ptr(unsafe { bindings::devm_clk_get_optional_enabled(dev.as_raw(), name) })?;
> +        Ok(())
> +    }
> +
> +    /// Same as [`devm_enable_optional`], but also sets the rate.
> +    pub fn devm_enable_optional_with_rate(
> +        dev: &Device,
> +        name: Option<&CStr>,
> +        rate: Hertz,
> +    ) -> Result {
> +        let name = name.map_or(ptr::null(), |n| n.as_char_ptr());
> +
> +        // SAFETY: It is safe to call
> +        // [`devm_clk_get_optional_enabled_with_rate`] with a valid device
> +        // pointer.
> +        from_err_ptr(unsafe {
> +            bindings::devm_clk_get_optional_enabled_with_rate(dev.as_raw(), name, rate.as_hz())
> +        })?;
> +        Ok(())
> +    }
> +
>      /// A trait representing the different states that a [`Clk`] can be in.
>      pub trait ClkState: private::Sealed {
>          /// Whether the clock should be disabled when dropped.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
