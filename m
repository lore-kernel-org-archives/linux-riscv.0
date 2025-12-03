Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62535D12691
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMcwuQl7DCpNMgPS1kuy0CkMBWtsluQX7TgC8JeVXm0=; b=tvVhzM0vHA1/ex
	Kee/Sk/9VZKLJDpEKvj017AByIFM4JDN5oiU6IVMhYDiQbdlSmWHL3isY/it+kQ7NaTRgNVjyJinL
	jok3MQtpyvGplUZoWVhm+h0qv7dwjC3RCYgoIIReZf9gCKEFkfK9JXZ9nXjNk+FLngFs2GqCEXfEs
	cSzYkwYhxC2pW3K1D1O5lTD+vmc/mAlCIrMZtz/FL1RvPoycaqZfppRYe3IptBFT6BC5kKv2OonD4
	1hk2BfUcGM/w8VhcokrLRxE05CY59lWExruvxvREbISWZZxc5jKRoJ9JXaBnR0OnoCTkTr0KIvYkr
	ma49FAM8vIgzAd8OiqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjTJ-00000006PCy-1J2E;
	Wed, 03 Dec 2025 09:48:29 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjTF-00000006PBb-3Szf
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:48:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrHm6Ss7agoY8fS/wQl83yfoIwPso/mTa7fghXB0f/fh7YCw9iu3+PUi6Txa4tEkVs3lht/+Y8lqrywbo6HAK4fRBnP5jRXQr2ZfN5R90Q5BfX04+9/XUw89m1BxZdtrxmiV3l5RrHYRjSF9DKpYLDNbhLyLLq9w7t0sIUER8vOcIVhgOl7ZFzZIOqGg+irP1ghIUmLuhl1gS1PurpqrNZ4DMWvZGpiPVEd7dt0/D1wN8JbOvzic/w9CVfMY2b04e+dYO9J4VuOanMJQgWjpTBWHoTsMt29HgP9PiVLaCgsGILQgf19svRVyUQEbwq09StPb9wsEFXsuognL00M6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZOqbPi4Ayf9/UVAeP5TNgjuWVKpFh7XyyLhJX6aJMI=;
 b=GiNRbRMuNchwccJASuyKoqier405bdDxwuEh0cVzmEBzKBoNAOdPRy96LisGtW2/1vj1nOJTkQbiW4bpa8nTjsLzQqUn8U0mGLSmK8o8tlweZ8DFZ+zebFJ/j71NeXNTs67QCdpUGU/G4PHGJ9VnZdFkc8LYsipYVDek6pWXUL+4sJmV+XK+JsWOEqsQkpIT+wj3OWcAR8HS4XJ5JRfGAH11tgpAGEnPws3ytHpvDaXj7wOLsXbixgqDuleoPKZkdygwAaPbiTzstiqHEB9uhjF+qgbfVHAKfIM9eBCO58XHvD3UFyOOl1Nx4kEJtI6wOATihs16Bvmthgx6Ddj7dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZOqbPi4Ayf9/UVAeP5TNgjuWVKpFh7XyyLhJX6aJMI=;
 b=NdZOaGLN8o0RF5j9rnvANy3NWCPQ7C/L+7J280eyCuiOo5sCqfxTvrdqJdMJub499qTStMrrQN1dqPI7jdU/YCd+0imo0yB8BsjgpAgZnxU/n3sIKam6gfWbTy4bt9STvGK+uQJ/5lWcqzhNhwdtyV+GHXDnTHoGXki8KHKDm7WCEXQkUwOZ3m4MNxeYGwX22fNMA3i6y0HjmUaZI+TJ/0tgRf6CX7XZfgoMkgze+qFNfwNmln3P6cGEGxZvS1ebDm2qyPEJugdwhm6gLCpEIr0Qi1wNr5D375l0+1RzMU9RUFMry0RTL4q885Ly7ejTMTYGatXt3n3grYt93xyDkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com (2603:10a6:102:1bf::7)
 by GVXPR04MB10384.eurprd04.prod.outlook.com (2603:10a6:150:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 09:48:20 +0000
Received: from PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7]) by PAXPR04MB8253.eurprd04.prod.outlook.com
 ([fe80::b853:e05b:c1e5:41b7%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 09:48:20 +0000
Date: Wed, 3 Dec 2025 11:48:15 +0200
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Rob Herring <robh@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without
 interrupts
Message-ID: <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x>
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
 <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
 <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com>
X-ClientProxiedBy: AS4P190CA0006.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5de::9) To PAXPR04MB8253.eurprd04.prod.outlook.com
 (2603:10a6:102:1bf::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8253:EE_|GVXPR04MB10384:EE_
X-MS-Office365-Filtering-Correlation-Id: d593f264-53d1-4706-c4e9-08de32511757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MEhwdnlvYUh2NGcvM3hOWDg3SkVpN3hPSGUwaFNVb2hURHZ4L1FUdEFvbzBz?=
 =?utf-8?B?YkphYnF6cHBrY3ZoWlZ6UjN3R2ZtVjlFMExFWkVqY1Y5c3hITlFlcGZLemd2?=
 =?utf-8?B?THpscXVPUVMzcXBEWG93VHFPQ0laUUFmY0xOMDU1NUdFVU80UC9rbzlwNUs0?=
 =?utf-8?B?MVo4OEwxZnU1dXVVNXNHRVROLzRqSUxCc1NLRXRMQWd3MHh0ZWFnZ0hVNHUy?=
 =?utf-8?B?N2doQVBNS3p3REw5ekowQklpVmpuMitwWHdUQVd0bktXMmN4MXdsTDYvQzdG?=
 =?utf-8?B?a29sWVJUVDNleGdNWlo4SW1lNno1am9ORzdkWWN1Y3ZDb2ozVFhYT2ZlaDlV?=
 =?utf-8?B?V09UOENQSmlUMWFpdmEvWThnOXVKS2V4eVlYOVMzMGVkaUNZeEdFK2pIUDFs?=
 =?utf-8?B?eW1MQm5VNEQvMlNpNENhdUROMTVLaGZIRDBSM20rdHQwMEtOeURvRDdWWDlH?=
 =?utf-8?B?ck9YbW5KTnpnSk1aWldiQ3Ztc0NMY29zenpHMGlteDdiOXRaZldaT2doL3pG?=
 =?utf-8?B?eVdhM25CZVMyWFk3T0UvOElvMDN1QWVrR3kwTC91bkgwZVR4ZEJneHcyZFZI?=
 =?utf-8?B?WFM2Rkg0Y3hBZlk0TG51MUFXYjRnNWxWTDAzRDhaQ1hqYnUva0xZL2d2VWxH?=
 =?utf-8?B?eDlacUxhVmkyeW1OQnh6b1ozODdEbUFrSU5reDZyelhyMVRxZjlSK3lEUnFZ?=
 =?utf-8?B?MGlhU1hNcEREUzgxTCt6ZE5GOUZvbVprUzZ0bURLNXFDODY4MUplbjExeW5J?=
 =?utf-8?B?NWNYMlVXdmp0WFFVODd4d244V1R1SjYyUzhocXlid2NBeWNCb0N0SVhvenVR?=
 =?utf-8?B?NERiNDRtcXpaZ2JIYmF3U2prZEZUZlcwd1orSC9YS0JMN0hHbGg3VzRRbXdC?=
 =?utf-8?B?R0xkQ2pLVSs5N2FnUkREb0oxMzNmV1FmVitzaXRtNkdBdE0vN1NwdHNrVVYr?=
 =?utf-8?B?dXE3NHhHWXlTL3VYcW56QzBKZDloZHA2aE1OZG9EYkovWHpEejBXYm81Qytl?=
 =?utf-8?B?dkI1RnhZaU5nTlF5UldlMGhhamNBZlY0N0R3T2lRTURKWUEzMzA4WmJBZXZL?=
 =?utf-8?B?dWJhTlUyRzRLTGVuejRhTG00SXNoVDdzWno0ekpZUnNhQUc5VWFLY3o3VnI5?=
 =?utf-8?B?U1I0K0pJNFRORkgvdGpvS1QwdStwd242bmJ6T0diNGxMeDlEbURnYVpUN3J3?=
 =?utf-8?B?V3ZvNzcvUWhKbW93N0NkSHYrMXFqRGpKeS9uNTkvK1pBajdTNXJuVmVHVXZX?=
 =?utf-8?B?R1FoejNoU28zanE4UXk4NU8wZDRJbGVvVnpMdEVSRGJyMEEwQklTZW9kcXF2?=
 =?utf-8?B?TFdDYlVMUms1b3VRTVd5d3o3S3ZhZzlIeDBWRFdMei92OWFtR05WdWVIVEFT?=
 =?utf-8?B?bThaRWc3bkhuVnYrUGxVVjE4Y3V1VVVEWkI5dy9od3h1N3d1UnBxdjBGcm1m?=
 =?utf-8?B?c3JtdEVYZWdSd2NpQzk4cC9aLzdiV1d4VlBhMU1sanhIa0VXQStGUWF0Vk0v?=
 =?utf-8?B?UkRRV3FTclVRTW9EMlduM1ViN1YyRDFKbldvWHptNWExNnlFWWZ3Yjdra2tN?=
 =?utf-8?B?dXdrUFZxMnZrOFdYWE1ZUlBJSTZFNmJjd3RVUGxkMjVlSEhGWTQwS0UyY1hM?=
 =?utf-8?B?TFJ6dVZ2YnVFM0RHRHR1dWFmSHhPcDRRbmlGb2pweG4ycVlFK1lTRU5xNFlU?=
 =?utf-8?B?cXEwby9LQnpueWlhWHd3ZzZ1c0xoaDVvTzgzbTJqdG54R1ArNGhSTDU0Z3Fz?=
 =?utf-8?B?RjJuLzh4NEZyWFE3VFptajBVQXMwQ1lHaG1XT2NJRjgvbElNRU9TNjBGeFZM?=
 =?utf-8?B?NVVDdjgvRDRvUThtUGQ2WGxCZzEyMkhWa29RZXkra0N1SllUamVSU1kzOUJW?=
 =?utf-8?B?aU1lUkU5VmEyS0duWU9JYjVuL3VXUWR3b0htRFlQelZ2UzNoWEcxM0h0eHlS?=
 =?utf-8?B?RUg0cllUQldtQ3FzUzZFVWhlVDNUU1UyRDUycS9ad1ZnUi9xNHp5VjNJUHNT?=
 =?utf-8?B?OUZ1K1VqcHF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8253.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU9OOHgzRmxQb0JoVzdQREo5SGRtbHFid3VoQ0VoeWI5WkxjNEtXTDJQRzFR?=
 =?utf-8?B?OHZwYmFNd3dYaFhKVUZBc1NpTHgxMGRUOEo5QWF6eGhVbTR5WHp6R2tWemU5?=
 =?utf-8?B?dmhoelJoNlVRRGgvVmJGVXFGQjBQbWJ0M0RMenFxZEJWNkNqeHZMS2dRSWJw?=
 =?utf-8?B?aDBDZzRWOVozVmw2SnFQTkw1akFwaHM5ZjJZWlRCRmJRY1dsNkZOTlFPcFlE?=
 =?utf-8?B?VHVsd2orRk0xdjZGdEZ4bGErTm1NZEpLdGVzdG9DM0tqRjd3MStEdGVqQ1Nr?=
 =?utf-8?B?SmtoVThhYUhEN01GYVJSQTMwQndnMUtGa1UzaVdzQWJvbGZtWkhuditnbm5j?=
 =?utf-8?B?bnVTOStPazN6cTNVVTIwOWw3UklvTUcwL0JKMG16aW45MXI0TzVUN3pKMDFz?=
 =?utf-8?B?amc2L0JBM0NrUVNocTNlVzRPL3hqQTdISkc5VGhpcGl1bnhZODRxR0pDU21S?=
 =?utf-8?B?bXRINkFaL3V1VWc2SnBDb1FvY0JFdDN2WTltMDdtQlFTRVhRQ00rNkRhaHNu?=
 =?utf-8?B?U01ENEhwWHFmRlBlcEorTnE5QVhyWFo0Y0FVWlVnZFI0OEdFVW5SRTQyWFUy?=
 =?utf-8?B?MmhzRWkyZjNmR3l6YkZHaDlrNVdzaUllQ2czK05iMDlaNmVhQ2lmS0hLazBU?=
 =?utf-8?B?V3FiVE1rcUxjVWV4TW84S0dMNWZ0eTBCV0RuZEJKdWRnMFdCSnR4Sm1LRjgx?=
 =?utf-8?B?OTJvc2crN1Q2a1VnWGJmOWwrN29BSjZkRmgyYXR3QmdNQlphNGV5L2docDFL?=
 =?utf-8?B?MjR0dVJ0NFBkUlllem51bWZUc0tJbW9Kb2xqaTJCejh1eVA0bUkvTVJhSmM3?=
 =?utf-8?B?d1lHVzVkWjliRjBvaXl0WENGNlVOSEFWbXB5eHprVjQ4d2ZaeEdyNFdjeEla?=
 =?utf-8?B?TUM1WHZDZHRVUUdDbDRyUDZ3UjhCWHlSWjZtSm5pVUptVmR3SzFlb092WEdY?=
 =?utf-8?B?M0JsbzJwMGVOeTRUaGh5OEFEL2MvMEtKR01yRG1SMzh1bmhRR1BIN1h1Q09h?=
 =?utf-8?B?NXRYT1lTU0o2T0FtdjliTE1DV2VqNVcydlNjQ3dXOHhWQ3o2TDViaXhQcVFn?=
 =?utf-8?B?V0xXaEZNMndueGJPUm1Dc0tRQVJsbWMyZnV5emNJYzNRbUxkdWl5bDlsWDhM?=
 =?utf-8?B?ZkVGNE53NGV3aVcwYjgzZ1lLMXFoZGx5c093c2hPc0hVVm1ZZmdEOXZ1UlJ3?=
 =?utf-8?B?TlRabkdYMEV4Zi9lRU1CdHEzWnh0T0c1c2MvUkVWQllmTytid1ZpdVFGRkJ1?=
 =?utf-8?B?L1JteUFpM3M3b0dvMVArSWFPT3ljT2ZxRTUyVXN5SFJpRWFpZEEzQlgrbWho?=
 =?utf-8?B?Um9JNGczQUxELzhVd0JMNWVvV0VNQldnK3BadmJlNndWU05xT1g5a1ZlM2ho?=
 =?utf-8?B?UVowR3YrV1VUbzlxQ1lPQU4yajM3SVVVbmJqamZ4TW5UOGoveHc4UDU1MjVs?=
 =?utf-8?B?Y2JWa1pzdHV1ODFUQzNMV1dwcFRubVQxNEs2dWNZYXZlQ3JaRUpJeE9yQVVo?=
 =?utf-8?B?SkJSTXF6Mi96ajRaT3ZZY2puc0V3STJHalFpTUpXZjdQZXVMTkhNQk9kendu?=
 =?utf-8?B?Tm9xUmF6cE5xMXh5dUJ3MGpuM3NIdFcvMCtjQWt0SWpxalZHeWFveHlyRWtQ?=
 =?utf-8?B?cEVTMnpOSmFrYmVQN0dtS3NObjRUMmJDVnQvaS95ZFYvWjc2R21Va0tSZndj?=
 =?utf-8?B?dTk2dUcrSHc2WXRJdW1mNmhvK3FUKzdvNDBlNmtnNitwUmF0ODliYU9lRk1r?=
 =?utf-8?B?WlhKWGFOSURrQnAzc0pQV09WOEFFK0FleFBqcFRxckc3NGQwbWNORkRPN3Zr?=
 =?utf-8?B?ZUdNdGlNcnJySXQyYzBrdzJPK1pwRm5aZmk5WGNwQkdoTFM0cUFtOUxXMTdF?=
 =?utf-8?B?TzJ0d3FFdWZnbUh1c2tYSFlHV0RWRDdObG83SFI2NHd6eW9IWGRJM2tWZ1hJ?=
 =?utf-8?B?ZFFab0xMTlEyU0R1c1NMR1hpbHhNVEpGckdPeWNtaS9vWk5ONlJCL0NLTkI5?=
 =?utf-8?B?L1liOGNXcXVGNGxmUEJCeTB2Qy9RbGJYNGVCRDVvSmE1RGNkT0hTblNCME9I?=
 =?utf-8?B?YkQ4dnV5Q0ZaYzhFUCtQS3hPUnlhNW1kbzNNNS9YWVBiLy9nSWhtYXU2Q1JB?=
 =?utf-8?Q?zNfD6ozbtM6sROiF0KluBkEZ9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d593f264-53d1-4706-c4e9-08de32511757
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8253.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:48:20.0292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QZoMy9W6smFvWcGB5MSpFllyY6EfLtmQcp3OkH7w02L+xZM/T0zNT/qKaUpqw1Xf6WD+rL3ov+7Z/AegI0eZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10384
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_014826_276297_3FFC6D16 
X-CRM114-Status: GOOD (  42.91  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBEZWMgMDIsIDIwMjUgYXQgMDM6MTk6MTdQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVHVlLCBEZWMgMiwgMjAyNSBhdCAxMDozNuKAr0FNIElvYW5hIENpb3JuZWkgPGlv
YW5hLmNpb3JuZWlAbnhwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBEZWMgMDEsIDIwMjUg
YXQgMDY6MDk6MTlBTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gPiA+IE9uIEZyaSwgTm92
IDI4LCAyMDI1IGF0IDEwOjQz4oCvQU0gSW9hbmEgQ2lvcm5laSA8aW9hbmEuY2lvcm5laUBueHAu
Y29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIEZyaSwgTm92IDE0LCAyMDI1IGF0IDExOjQ3
OjU0QU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gPiA+IFRoZSBEZXZp
Y2V0cmVlIFNwZWNpZmljYXRpb24gc3RhdGVzOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICBUaGUg
cm9vdCBvZiB0aGUgaW50ZXJydXB0IHRyZWUgaXMgZGV0ZXJtaW5lZCB3aGVuIHRyYXZlcnNhbCBv
ZiB0aGUKPiA+ID4gPiA+ICAgICBpbnRlcnJ1cHQgdHJlZSByZWFjaGVzIGFuIGludGVycnVwdCBj
b250cm9sbGVyIG5vZGUgd2l0aG91dCBhbgo+ID4gPiA+ID4gICAgIGludGVycnVwdHMgcHJvcGVy
dHkgYW5kIHRodXMgbm8gZXhwbGljaXQgaW50ZXJydXB0IHBhcmVudC4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBIb3dldmVyLCBvZl9pcnFfaW5pdCgpIGdyYXR1aXRvdXNseSBhc3N1bWVzIHRoYXQgYSBu
b2RlIHdpdGhvdXQKPiA+ID4gPiA+IGludGVycnVwdHMgaGFzIGFuIGFjdHVhbCBpbnRlcnJ1cHQg
cGFyZW50IGlmIGl0IGZpbmRzIGFuCj4gPiA+ID4gPiBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5
IGhpZ2hlciB1cCBpbiB0aGUgZGV2aWNlIHRyZWUuICBIZW5jZSB3aGVuIHN1Y2gKPiA+ID4gPiA+
IGEgcHJvcGVydHkgaXMgcHJlc2VudCAoZS5nLiBpbiB0aGUgcm9vdCBub2RlKSwgdGhlIHJvb3Qg
aW50ZXJydXB0Cj4gPiA+ID4gPiBjb250cm9sbGVyIG1heSBub3QgYmUgZGV0ZWN0ZWQgYXMgc3Vj
aCwgY2F1c2luZyBhIHBhbmljOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICBPRjogb2ZfaXJxX2lu
aXQ6IGNoaWxkcmVuIHJlbWFpbiwgYnV0IG5vIHBhcmVudHMKPiA+ID4gPiA+ICAgICBLZXJuZWwg
cGFuaWMgLSBub3Qgc3luY2luZzogTm8gaW50ZXJydXB0IGNvbnRyb2xsZXIgZm91bmQuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gQ29tbWl0IGU5MTAzMzYyMWQ1NmUwNTUgKCJvZi9pcnE6IFVzZSBpbnRl
cnJ1cHRzLWV4dGVuZGVkIHRvIGZpbmQKPiA+ID4gPiA+IHBhcmVudCIpIGFscmVhZHkgZml4ZWQg
YSBmaXJzdCBwYXJ0LCBieSBjaGVja2luZyBmb3IgdGhlIHByZXNlbmNlIG9mIGFuCj4gPiA+ID4g
PiBpbnRlcnJ1cHRzLWV4dGVuZGVkIHByb3BlcnR5LiAgRml4IHRoZSBzZWNvbmQgcGFydCBieSBv
bmx5IGNhbGxpbmcKPiA+ID4gPiA+IG9mX2lycV9maW5kX3BhcmVudCgpIHdoZW4gYW4gaW50ZXJy
dXB0cyBwcm9wZXJ0eSBpcyBwcmVzZW50Lgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gPiA+ID4g
PiB2MjoKPiA+ID4gPiA+ICAgLSBTcGxpdCBvZmYgZnJvbSBzZXJpZXMgIltQQVRDSC9SRkMgMC8y
XSBvZi9pcnE6IEZpeCByb290IGludGVycnVwdAo+ID4gPiA+ID4gICAgIGNvbnRyb2xsZXIgaGFu
ZGxpbmciWzFdIHRvIHJlbGF4IGRlcGVuZGVuY2llcywKPiA+ID4gPiA+ICAgLSBEcm9wIFJGQy4K
PiA+ID4gPiA+Cj4gPiA+ID4gPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL2NvdmVy
LjE3NTk0ODU2NjguZ2l0LmdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlCj4gPiA+ID4gPiAtLS0KPiA+
ID4gPiA+ICBkcml2ZXJzL29mL2lycS5jIHwgMiArLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4KPiA+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL29mL2lycS5jIGIvZHJpdmVycy9vZi9pcnEuYwo+ID4gPiA+ID4gaW5k
ZXggYjE3NGVjMjk2NDg5NTVjNi4uNWNiMWNhODljMWQ4NzI1ZCAxMDA2NDQKPiA+ID4gPiA+IC0t
LSBhL2RyaXZlcnMvb2YvaXJxLmMKPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvb2YvaXJxLmMKPiA+
ID4gPiA+IEBAIC02MTMsNyArNjEzLDcgQEAgdm9pZCBfX2luaXQgb2ZfaXJxX2luaXQoY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCAqbWF0Y2hlcykKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICog
YXJlIHRoZSBzYW1lIGRpc3RhbmNlIGF3YXkgZnJvbSB0aGUgcm9vdCBpcnEgY29udHJvbGxlci4K
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICovCj4gPiA+ID4gPiAgICAgICAgICAgICAgIGRlc2Mt
PmludGVycnVwdF9wYXJlbnQgPSBvZl9wYXJzZV9waGFuZGxlKG5wLCAiaW50ZXJydXB0cy1leHRl
bmRlZCIsIDApOwo+ID4gPiA+ID4gLSAgICAgICAgICAgICBpZiAoIWRlc2MtPmludGVycnVwdF9w
YXJlbnQpCj4gPiA+ID4gPiArICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0X3BhcmVu
dCAmJiBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiaW50ZXJydXB0cyIpKQo+ID4gPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9pcnFfZmluZF9w
YXJlbnQobnApOwo+ID4gPiA+ID4gICAgICAgICAgICAgICBpZiAoZGVzYy0+aW50ZXJydXB0X3Bh
cmVudCA9PSBucCkgewo+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0
KGRlc2MtPmludGVycnVwdF9wYXJlbnQpOwo+ID4gPiA+ID4gLS0KPiA+ID4gPiA+IDIuNDMuMAo+
ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiBUaGlzIGNoYW5nZSBpcnEtbHMtZXh0
aXJxIGFuZCBjb21taXQgNmJhNTFiN2IzNGNhICgib2YvaXJxOiBIYW5kbGUKPiA+ID4gPiBleHBs
aWNpdCBpbnRlcnJ1cHQgcGFyZW50IikgZG9lcyBub3QgaGVscCB3aXRoIHRoZSBpc3N1ZS4KPiA+
ID4gPgo+ID4gPiA+IFRoaXMgaXMgaG93IHRoZSBEVCBub2RlIGluIGx4MjE2MGEuZHRzaSBsb29r
cyBsaWtlOgo+ID4gPgo+ID4gPiBscy1leHRpcnEgc3RyaWtlcyBhZ2FpbiEKPiA+ID4KPiA+ID4g
SSB0aGluayBzb21ldGhpbmcgbGlrZSB0aGlzIHNob3VsZCBmaXggaXQ6Cj4gPiA+Cj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL29mL2lycS5jIGIvZHJpdmVycy9vZi9pcnEuYwo+ID4gPiBpbmRl
eCAyMjcxMTEwYjVmN2MuLmMwNmM3NGFlZjgwMSAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9v
Zi9pcnEuYwo+ID4gPiArKysgYi9kcml2ZXJzL29mL2lycS5jCj4gPiA+IEBAIC01OTMsNyArNTkz
LDggQEAgdm9pZCBfX2luaXQgb2ZfaXJxX2luaXQoY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAq
bWF0Y2hlcykKPiA+ID4gICAgICAgICAgICAgICAgICAqIGFyZSB0aGUgc2FtZSBkaXN0YW5jZSBh
d2F5IGZyb20gdGhlIHJvb3QgaXJxIGNvbnRyb2xsZXIuCj4gPiA+ICAgICAgICAgICAgICAgICAg
Ki8KPiA+ID4gICAgICAgICAgICAgICAgIGRlc2MtPmludGVycnVwdF9wYXJlbnQgPSBvZl9wYXJz
ZV9waGFuZGxlKG5wLAo+ID4gPiAiaW50ZXJydXB0cy1leHRlbmRlZCIsIDApOwo+ID4gPiAtICAg
ICAgICAgICAgICAgaWYgKCFkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ICYmIG9mX3Byb3BlcnR5X3By
ZXNlbnQobnAsCj4gPiA+ICJpbnRlcnJ1cHRzIikpCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAo
IWRlc2MtPmludGVycnVwdF9wYXJlbnQgJiYKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAob2Zf
cHJvcGVydHlfcHJlc2VudChucCwgImludGVycnVwdHMiKSB8fAo+ID4gPiBvZl9wcm9wZXJ0eV9w
cmVzZW50KG5wLCAiaW50ZXJydXB0LW1hcCIpKQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ID0gb2ZfaXJxX2ZpbmRfcGFyZW50KG5wKTsKPiA+ID4g
ICAgICAgICAgICAgICAgIGVsc2UgaWYgKCFkZXNjLT5pbnRlcnJ1cHRfcGFyZW50KQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ID0gb2ZfcGFyc2Vf
cGhhbmRsZShucCwKPiA+ID4gImludGVycnVwdC1wYXJlbnQiLCAwKTsKPiA+ID4KPiA+ID4KPiA+
ID4gQnV0IHJlYWxseSwgYXQgc29tZSBwb2ludCBpdCBzaG91bGQgYmUgY29udmVydGVkIHRvIGEg
cHJvcGVyIGRyaXZlciBhcwo+ID4gPiB0aGVyZSdzIG5vIHJlYXNvbiBleHRpcnEgbmVlZHMgdG8g
YmUgaW5pdGlhbGl6ZWQgZWFybHkuCj4gPiA+Cj4gPgo+ID4gSSBqdXN0IHRyaWVkIGNvbnZlcnRp
bmcgbHMtZXh0aXJxIHRvIGEgcHJvcGVyIHBsYXRmb3JtIGRyaXZlciBhbmQgaXQncwo+ID4gcHJl
dHR5IHN0cmFpZ2h0Zm9yd2FyZC4gVGhlIHByb2JsZW0gaXMgZ2V0dGluZyB0aGF0IGRyaXZlciB0
byBwcm9iZSBvbgo+ID4gdGhlIGxzLWV4dGlycSBkdCBub2RlIHNpbmNlIG9mX3BsYXRmb3JtX3Bv
cHVsYXRlKCkgaXMgbm90IGNhbGxlZCBvbiBpdHMKPiA+IHBhcmVudCBub2RlLgo+ID4KPiA+IEkg
d291bGQgYXZvaWQgY2hhbmdpbmcgdGhlIERUIGFuZCBhZGRpbmcgYSAic2ltcGxlLWJ1cyIgY29t
cGF0aWJsZSB0bwo+ID4gdGhlIHBhcmVudCBub2Rlcy4gVGhlIG90aGVyIG9wdGlvbiBpcyB0byBh
ZGQgYW5vdGhlciBzaW1wbGUgZHJpdmVyIHdoaWNoCj4gPiBqdXN0IGNhbGxzIG9mX3BsYXRmb3Jt
X3BvcHVsYXRlKCkgZm9yIGFsbCBjb21wYXRpYmxlIHN0cmluZ3MgZGVmaW5lZCBpbgo+ID4gZnNs
LGxheWVyc2NhcGUtc2NmZy55YW1sLgo+IAo+IFRoZSBzaW1wbGVzdCBzb2x1dGlvbiBtaWdodCBi
ZSBhZGRpbmcgJ3N5c2NvbicgdG8gdGhlIGRlZmF1bHQgbWF0Y2gKPiBsaXN0IGZvciBvZl9wbGF0
Zm9ybV9wb3B1bGF0ZSgpLiBUaGF0J3Mga2luZCBvZiBhIGJpZyBoYW1tZXIgdGhvdWdoCj4gYW5k
IGNvdWxkIGJyZWFrIHNvbWV0aGluZy4gTm90IHN1cmUsIGJ1dCBJJ20gd2lsbGluZyB0byBzdGlj
ayB0aGF0IGluCj4gbGludXgtbmV4dCBhbmQgc2VlLgo+IAo+IEFub3RoZXIgb3B0aW9uIGlzIGhp
amFjayB0aGUgc2ltcGxlLXBtLWJ1cyBkcml2ZXIgd2hpY2ggYWxyZWFkeSBkb2VzCj4ganVzdCB3
aGF0IHlvdSBzYWlkLgo+CgpJIHdvdWxkIHByZWZlciB0aGUgc2Vjb25kIG9wdGlvbiBzaW5jZSB0
aGF0IGRvZXNuJ3QgaW1wYWN0IG90aGVyCnBsYXRmb3Jtcy4KCkdlZXJ0LCBzaW5jZSB5b3UgYXJl
IHRoZSBtb2R1bGUgYXV0aG9yLCBhcmUgeW91IG9rIHdpdGggdGhlIGZvbGxvd2luZwpkaWZmPwoK
LS0tIGEvZHJpdmVycy9idXMvc2ltcGxlLXBtLWJ1cy5jCisrKyBiL2RyaXZlcnMvYnVzL3NpbXBs
ZS1wbS1idXMuYwpAQCAtMTQyLDYgKzE0MiwxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzaW1wbGVfcG1fYnVzX29mX21hdGNoW10gPSB7CiAgICAgICAgeyAuY29tcGF0aWJs
ZSA9ICJzaW1wbGUtbWZkIiwgICAuZGF0YSA9IE9OTFlfQlVTIH0sCiAgICAgICAgeyAuY29tcGF0
aWJsZSA9ICJpc2EiLCAgICAgICAgICAuZGF0YSA9IE9OTFlfQlVTIH0sCiAgICAgICAgeyAuY29t
cGF0aWJsZSA9ICJhcm0sYW1iYS1idXMiLCAuZGF0YSA9IE9OTFlfQlVTIH0sCisgICAgICAgeyAu
Y29tcGF0aWJsZSA9ICJmc2wsbHMxMDIxYS1zY2ZnIiwgfSwKKyAgICAgICB7IC5jb21wYXRpYmxl
ID0gImZzbCxsczEwNDNhLXNjZmciLCB9LAorICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGxz
MTA0NmEtc2NmZyIsIH0sCisgICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1pc2Mi
LCB9LAorICAgICAgIHsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMjA4MGEtaXNjIiwgfSwKKyAgICAg
ICB7IC5jb21wYXRpYmxlID0gImZzbCxseDIxNjBhLWlzYyIsIH0sCiAgICAgICAgeyAvKiBzZW50
aW5lbCAqLyB9CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgc2ltcGxlX3BtX2J1c19vZl9t
YXRjaCk7CgoKUmVnYXJkcywKSW9hbmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
