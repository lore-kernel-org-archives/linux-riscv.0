Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6251C25B78
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 02:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5cN4HWHgtNivq71Yab+aP0bcwBcihc7I+4EL5pPxOg4=; b=e9MtXSVBx1CwgM
	KzZrIB2uG6S6Z/M81swO0NaT66Oh9ne68aRBO9kgwmIWiCsZPDLTbXSIuKU7ZS6yBpbUaf7eqsmPH
	NRuEHQieE4MrnLaUQMfMBV+mYBiXWnsM6SR4Yx99cPz5p0HfAOdREHkUAca/F0w0KMOQjHeNIMM0W
	JeeuGgOda8SO8r4TeiOFbcaRaKs6sqMR2OVNW1F4ATS5T0F6B+hYe/nk3nCJFQ3vVt68PpbU3k9xH
	HLcSbeHmh6CK88DYClOLDA6yl1OyG75z8XDurFe0Ag/GnkmNl7Egar8EPNfqwKILifPrwDlF5BSgu
	upPZfycF8vri47z8o3qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yCi-00000004mC7-0bTL;
	Thu, 23 May 2024 02:29:16 +0000
Received: from mail-dm6nam12on20601.outbound.protection.outlook.com ([2a01:111:f403:2417::601] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9yCe-00000004mAu-3dlJ
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 02:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N9seY1n6WqpV0LecKtPypWVfDUTEJUOfoxJYDZp7xOhl6+YbqAGg8BJTNqFKRV+JrubRNl2F9OJ3eiCCWzucRlCbE5vplfbbEJzvNH+MXoo9iRy/qIC5YpcNvs7f7a8AIp/YxiZTQvChbZTiene+ak13jZd5wjbP7ArhxPZW+7DgskuoKiZs4r4rpEAT/kQk1Us2RJkyvn+jsxSxCp+ZkbxLfBkBz9haJNPn8/nhDn2AP+5V2GKY5P7hWOceN8u/7Nlk1x5H3iPrGXqLhmUOv5aHzdl/+Xe/2D61Zwo6CWZLFSAHUsUBbDEIAoujvIzfphYyLm+QXrmojOAN0nyZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5PZteq1ir9VyDK7/kE82+oQab2J/vlu29EWaM/TSUY=;
 b=Irl2zzGTlHIzoh4QAi/b2gVd7SJkyx41UgGZwnhy3wXjlQU3RLNIjRwBWM9Z3BRULEESKFatxg+RNxVy+p9Bgdj+L+EjlR/llKog7Oe2RK+N15KaOewwPlMEO/rp9vZXHzM541KZhEHOEJ5BYiErmp5A17XoUHOkhHCU5CMUTBN4Zp4xq6oSLmvPI0wOUmq/5oYfEU/62bImftlDP0/F2nK2GKNgyKUP7H0osq2pTYFiLjYr9NjHXG8tV8xMOZ3ubnwhmQPzXdABWuEB8E91HcK+jZ/aqL8hClCgTTAO76dF9E9byqxUtLr10/w1tA/sLHHuloEu8GvBXyZPQNVekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=google.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5PZteq1ir9VyDK7/kE82+oQab2J/vlu29EWaM/TSUY=;
 b=f0ba2GBa7wbqnN4qHNDgGwKZsAVfxkX3h2sVkf58OJfudEcXqcGjtA7sQoEBICkNjW9p74IPqcsKTY6GFxXJGk2mpla66JpBKgxOEKmplfl3euHDkZCD9X2OR6TkePqQ+WWVHFySARzb8cOu1l4f3fhxD+3FN4aPRoKt1X0YBh/5hhpfHMOIw5/TcT8fRf1f/9rKPwqxhwAGFM9Z097tPtTTqaonmuUKgtmPVbPYFIYLDbF6JeB7DEYirgcaIcfnAZj5af5iTeErOYKhSgc3ImblDWvjj6211VWtuulOWNe5tFlAf7iTPJHbLsaJAnZo/TgE4sLVt+yDcL7u/7LqBA==
Received: from DM6PR06CA0020.namprd06.prod.outlook.com (2603:10b6:5:120::33)
 by SJ1PR12MB6220.namprd12.prod.outlook.com (2603:10b6:a03:455::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Thu, 23 May
 2024 02:29:04 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:120:cafe::e2) by DM6PR06CA0020.outlook.office365.com
 (2603:10b6:5:120::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19 via Frontend
 Transport; Thu, 23 May 2024 02:29:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 02:29:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 22 May
 2024 19:28:50 -0700
Received: from [10.110.48.28] (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 22 May
 2024 19:28:49 -0700
Message-ID: <9e2677ec-1d54-4969-907b-112b71ef8dd3@nvidia.com>
Date: Wed, 22 May 2024 19:28:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/68] kselftest: Desecalate reporting of missing
 _GNU_SOURCE
To: Edward Liaw <edliaw@google.com>, Mark Brown <broonie@kernel.org>
CC: <shuah@kernel.org>, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
	<mic@digikod.net>, =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
	Christian Brauner <brauner@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David
 S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, "Jesper
 Dangaard Brouer" <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Kees Cook <keescook@chromium.org>, Andy
 Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
	<kernel-team@android.com>, <linux-security-module@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<bpf@vger.kernel.org>
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-3-edliaw@google.com>
 <94b73291-5b8a-480d-942d-cfc72971c2f5@sirena.org.uk>
 <CAG4es9WAASaSG+Xgp31-kLT3G8wpeT5vAqbCA4r=Z8G_zAF73w@mail.gmail.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <CAG4es9WAASaSG+Xgp31-kLT3G8wpeT5vAqbCA4r=Z8G_zAF73w@mail.gmail.com>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SJ1PR12MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aceb185-6cf6-42d0-9f33-08dc7ad01d6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|7416005|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?czJPOHNDanBmT0FVVFNaVzlTdnpIVmVGcUpqcHYyY2I1SDh3MVU0U2piRnZM?=
 =?utf-8?B?SGNyWDNLRW9BUHc5UUdpZVExaTZVcmE3emlxS0c4N1gvWWozNmlMUEZmWWhl?=
 =?utf-8?B?S25MaHVFcDVnRGpXODhqT3YvdWFkL2V1Wktaaml3T3RZcUhpWitaTjAzdTJB?=
 =?utf-8?B?QVhMN211L0lneTUzSk92RnRIYkFOczRra3l5SWJaRkVtdDVBbUU2TDIwVDIr?=
 =?utf-8?B?ZFlwcXBEVWxtUDY5NWthRHVnT2ErN3ZYb01UY0wvS0JHS084ZlBwcWw2SU9u?=
 =?utf-8?B?MEhZRkZvTmpRcm93ZU9DOHk4NmJGOHJlekJ6T0k5cEh5TUpMZTdxQkhHV3I3?=
 =?utf-8?B?aG9HYVpzOGd0YnhDQzBTSWVPaG10Rkl2clR4QVRoU05CSVR5ZmljV1FRY1NF?=
 =?utf-8?B?TFZwckRyUGpHYXcrakJibVlZbjkvSElhdkJtMy9JSmdSdFRhWjNab0VyWUVz?=
 =?utf-8?B?Vnd1QUkxL2RJR0dwWVJxT0dCbXFGZHhDS2M5UDZYdXp3U0FOTjN3alk5bWJ0?=
 =?utf-8?B?c2xNZVEvRUp5N1dYVDlDcXpHMGthTWhobWsvTTh5MU5QN2dYOW1ZS0lMcFY2?=
 =?utf-8?B?TGFNMk9Pd2tjRzJGZ3plMDFlcDV2eUNiZXg0b3NERjltYkM0TDBuMG9OQXZq?=
 =?utf-8?B?Y1RKU0JhanorVmRvVHlJNUVVeU4xNXVmcE9yT0ZPMlE5UlJKOUYrK3h4ODVv?=
 =?utf-8?B?RDllVG9uMCtUNDBGU1I3SWI3RTkyMmdBWkRZQmVDbFFSZXRNczZwcmViQUtQ?=
 =?utf-8?B?VUl1T3dVK2ZuajhEVERqblVaTDVqTUhxMmNjOHFQcVVaZ1o5S0hyUVVlNVFZ?=
 =?utf-8?B?enlzbUF3V09ZNXJGVTFXMi9aeTgvOU8zam8xMm01SFd2by8zcmpwQWJlQU11?=
 =?utf-8?B?NUhFT0QwdUFHOFRrb1hxWjVTeTVUc1BUUDVmWlFLMHdXY2ZlVFBPaVZhalVs?=
 =?utf-8?B?S2hIUlJUYzdGVVpMSnN1VVZIbXN0RjdMbXkydGQ4TGZhRXFxTWE5U05JZ2wy?=
 =?utf-8?B?T3UwNzArWWJjblF6b1BNUW8wV0tjTE41aW9pdFM0NlU5OXZmejE3OENWVVli?=
 =?utf-8?B?MElxdVFsblUrdGl2NDFIQ25TUEdjV2VNRlFRNGZySUhxMGdTc0Q0cm1Lblhn?=
 =?utf-8?B?T2dxSHlhcTRCZzRaNG0weGtmYm9QSTlOajJkL0xHZE5sbzJsU2pxbkhtQjFL?=
 =?utf-8?B?eW5qd25HTkVOODVuYzRtaitybTFqNndYWnYyK1crOGRQb1VuR3NqbjJIM09H?=
 =?utf-8?B?ZStEUlFkdnJFRTNwMVAvYVAzTGhwanhpTGJyd095Mk5VR2FCMUVEWWZ1bDl0?=
 =?utf-8?B?NThIL2dUeTNWS1FvVGZKVVVsV0xTb3RrNVI3VllVSDhSb3lkN2hzK3JjdmdM?=
 =?utf-8?B?NlRkb1E0T29MYkYwOURocGF5S3VjNDVBT3dKRXFaSjliTVZGQ0ducUZlUDdR?=
 =?utf-8?B?Q0Q2eDkyOVlwTVo4eU1UQVJjekUxRDE0OGpzM2RVK1Z6ejhpTkcyUGNLaVhR?=
 =?utf-8?B?L1VsdWxocE5ienhTRVcyQm5TZTRMaHh4M203aFQyWlJSTXBidjViWHhkS2NS?=
 =?utf-8?B?S3IwRWVDZ284ajlCbUZVRHcxblpnOXU5U21JelRDS1hzN21sYThBRmVFdVpr?=
 =?utf-8?B?b2N3M0lFWm9uYnpoZTFWTkozUFZqdUtqNkxSaU5icHptc1Z0b1RnUXFqbkFE?=
 =?utf-8?B?NG1WM04xUmRUeWdUNVg2R2thWGtQOWp2eEpvNkxNZHY0WTV3T3ZmYmZxSjQ4?=
 =?utf-8?B?MDBxc29NTElTcWozU1BFd3RJbjFwTTZEZG5Qd09NeFAxS3ZHVDVhMkJKeUcz?=
 =?utf-8?B?RzZOc3lkSlI2cTFndG9nYkpJM1VLWnk4TWJJbmV2Zm9PNFUvK2t0N2tXU1l0?=
 =?utf-8?Q?C2SygUAB9yeUr?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:29:04.3714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aceb185-6cf6-42d0-9f33-08dc7ad01d6d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_192912_945927_92EDCDAF 
X-CRM114-Status: UNSURE (   7.91  )
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

T24gNS8yMi8yNCAxMDo0NiBBTSwgRWR3YXJkIExpYXcgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMjIs
IDIwMjQgYXQgNDoyMeKAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+IE9uIFdlZCwgTWF5IDIyLCAyMDI0IGF0IDEyOjU2OjQ4QU0gKzAwMDAsIEVkd2FyZCBMaWF3
IHdyb3RlOgouLi4KPj4gWW91J3ZlIG5vdCBwcm92aWRlZCBhIFNpZ25lZC1vZmYtYnkgZm9yIHRo
aXMgc28gcGVvcGxlIGNhbid0IGRvIGFueXRoaW5nCj4+IHdpdGggaXQsIHBsZWFzZSBzZWUgRG9j
dW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QgZm9yCj4+IGRldGFpbHMg
b24gd2hhdCB0aGlzIGlzIGFuZCB3aHkgaXQncyBpbXBvcnRhbnQuCj4gCj4gU29ycnksIG15IG1p
c3Rha2UsIEkgZm9yZ290IHRvIGFkZCBpdCBhZnRlciBjaGVycnktcGlja2luZy4gIElmIGFkZGVk
CgpBZGRpbmcgdGhpcyB0byB5b3VyIC5naXRjb25maWcgd291bGQgY292ZXIgeW91IGZvciBjYXNl
cyBsaWtlIHRoaXMsIEkgdGhpbmsKaXQncyBwcmV0dHkgY29tbW9uIHRvIGRvIHRoaXM6CgpbZm9y
bWF0XQogICAgIHNpZ25vZmYgPSB0cnVlCgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklE
SUEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
