Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436F3C001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8l8+AArgDSyrr2ey/JSbWNR6gVmTdtLPo1Kt97Yq8k=; b=ugAbzzwP9kg8gjkdwm5t46qqk8
	0sC221BKuzi0Owbl580XohqI2uJkK/dzm0WZmdF+DWUHTvHKQnDU1+HZ9EfHsQoiSiiMLkfimlP5l
	v2OMSYmW0Xl09MA0AFQhrXv0c2Dzb+HZxoi4CdItBf+bcfgcKTiAw1FDiNrHMGUsAoXOGbtzCx82D
	rvk8sjhlGUbtpL7mu2+uXakVEYxKHKpGAa+mZYwoatz2WuFkeRiwYTJjI8ZhR+JGcYrjyh/aVyt8m
	LZ8Hyc9ibnQys6ip6J8XnYCbi7McRvrit/DS8SPkFC0jht26/Cjm7jMmypxyoXs7sehk8Jn2hOXBB
	B049tLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMq2V-00E7n3-03;
	Fri, 21 Jul 2023 13:19:23 +0000
Received: from mail-mw2nam10on20623.outbound.protection.outlook.com ([2a01:111:f400:7e89::623] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMq2R-00E7lm-2f
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 13:19:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkgqfPsSG/kMzWyyQyCcdW1jvt5gZ0S4iN7S1a8n4KlmAexf8PZ/qp1Mxk0ntOy4atSOBsxOhO+dsAX1jZYkiyHvGMICOheYpzLVqJEovC6GhRKaRLFLrXOZsZjSBx6nCHz9EYYdy1dwqoDwL5z0gzFqoaDzy9ab93Cj7EIb6EGIF8QFKA+Qjk3psAdc/IiTNO0ml+lAqohQZc6D4JCiWfOEPlABFkEQC4WNFn6klqujwVV9G7Xd4gFBAZDccxgwjZmSZerTLCL68XFVuQkG6nhIwhcvbSMWh+tsp0ocCeJCp224ai4bPsfGoa1w3vi+cR+XJobXcEvj68T/LmrgjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QysEKlw668b5p85Fumbw63VMwEgP691djzaMPIHITPU=;
 b=arm7t7bP23QYvkEK9Ch1zp3nFl6s0f+WG8eF9mJm/YruPbRBkyl4K2yL4JoU6aNCqPfj3N6cj791fl0QkoTtr99oqQR1HsX9Aft+KLwFpPZKtPcCxDn0WWZZd9vQH/F3WAcwkdRqnxtSACBO9CS4HbuEKkevwNghXmvpnHJkU6/QAjbXjg1WMCVCe2jaJpmp7NvRBn1Ds5WpQVYF76BzooM0dPctBsT/q1dcLnV9OpqrCCWrWW3aF3dI/YhYgmKOSrM8r/xQw1ZRgfUFfpPfNbhk7XjFbmBfsnHKggcoxBTBPCVIhNK8gbegCJR9nUz6VWLIEHFrNN0iIffxwKby8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QysEKlw668b5p85Fumbw63VMwEgP691djzaMPIHITPU=;
 b=GAXLyxvFaKI+RgffDIELISF1jsAQoB583nZcTTGeMGwR+oI6jsBMKzQgceI3gaznPRk5G8NDHDKDH+ngqnzQZPUZ72Q5gU3E8boEqe6dFqtipp0UUA9tJfQpcH/Soxv0cJh/XBj+w2AF9Z74WRjvYHj9u8n4PG7W3P3M1LKsFSvum/XnujdFLNmpo0OI8Qz9DtvOkYts0TdDUAaNM0ZoO0yrGacJEkNGUdGHnU1xPGX5M9O+DZYFSvT3UV++m5veWpUHlXbGR/iSwaQ6dXa0IEdSgVCVYubK3eLC6Ew/XWfaORTEDipJ/JJMynZLVDZKpxKANdVdhCQCGv+qzCYqxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CO6PR12MB5444.namprd12.prod.outlook.com (2603:10b6:5:35e::8) by
 DS0PR12MB7801.namprd12.prod.outlook.com (2603:10b6:8:140::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.28; Fri, 21 Jul 2023 13:19:07 +0000
Received: from CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ab4c:b09f:b445:be6e]) by CO6PR12MB5444.namprd12.prod.outlook.com
 ([fe80::ab4c:b09f:b445:be6e%6]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 13:19:07 +0000
Message-ID: <fdcf25f6-c84a-a46f-dc4d-2d822abfab63@nvidia.com>
Date: Fri, 21 Jul 2023 14:19:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] module: Ignore RISC-V mapping symbols too
Content-Language: en-US
To: Palmer Dabbelt <palmer@rivosinc.com>, mcgrof@kernel.org,
 rdunlap@infradead.org, thomas@t-8ch.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20230707160051.2305-2-palmer@rivosinc.com>
From: Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20230707160051.2305-2-palmer@rivosinc.com>
X-ClientProxiedBy: LO2P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::21) To CO6PR12MB5444.namprd12.prod.outlook.com
 (2603:10b6:5:35e::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5444:EE_|DS0PR12MB7801:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ef1397-d4d3-4597-eef2-08db89ed0fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uavEASFXMr4zylN4/XNLBcVg3oh5QB2uH7z2IKTEqgdKQRmfsKKic5VcCP6rUyca4zZJIjpUsGit/ZHJYv21vO+Me/Rds3G6Fui4gyUO74WXvuc1oQi5QhEASohUOPjjmNMY3pjtFMOLiCbatcreBWrlcrkTcZq0kVVuStBdwx1nBI0j0H5j8Y9GUVaTmIt/x4fEpAMWpXccj/tkgLuAnurVOP75J201k0XYuLupQScj/GlyINh7mXc8fqkSGP95f0xgCyxQz+78b+mAvn+PPEHwk18RYzCl8vej+VC8VbjwGb5O685jQmZKhYAmFFvSyFMrc4M80ekqFFoaguTcs6VV5vlY890U3ujqXYovRqammPMYe9ix6UWtA/4WVSLZ+W2JeZvYDwk2yNgpW1T9Y+V1BOmZk1dhTuYyudxCCQL+D8bl3DE4uTzTMAeZxKXVkevQ5d3sqvcZsYSkdMvla4RB2RkFaIs466xFitC5OE1bfUmiBqNPigFZnMzbSnzrtj9Yu3uYQYzuBqlu8F96C1Tp/H1J0t+ocg/QsVQ96RMNQFaMSuvsXjz/5FJGM2BNk8PFQk/ZE+itYo0Hj0a64pRzLsXJg8OHXuOfeK4ujP3TcUT9rr48mDF0s9APYUisFtH8XTj09uUyv3oOZiJ+FG1ylRyxoqkXc34nA428THcONq0chmFr4qxPCfaTq9/L
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR12MB5444.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199021)(5660300002)(31686004)(2616005)(41300700001)(83380400001)(53546011)(8936002)(8676002)(6506007)(186003)(4326008)(316002)(66476007)(66556008)(66946007)(86362001)(31696002)(6486002)(6512007)(6666004)(966005)(38100700002)(36756003)(2906002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1pIVzh4cFgzOTZZdCs3Nm9rYlVQdk1UbmR0dEhFT0lhNU5zbjFGc1AyTURh?=
 =?utf-8?B?a0ZQRGQyNnVIZG1TV3pYQ1R1ajVEVEZoNk5BMElsZEZpWTMxRG5jQkdFcDMy?=
 =?utf-8?B?R2JqalRBRVM1SEFWRWlrd01Ha1RjRzVKdmhOR1RTSU5rdW8wTjZHR1pyZGFI?=
 =?utf-8?B?STNUUFlsb3I0aEJ1N05CemkzSGJHcDB5bHA3MjVsajg0VUNqN2VlQitMV3JH?=
 =?utf-8?B?L2Rha2dRZGprTWZoRGI0UU1leCtjaUExWFBaVVJjdVM2YktaT2JLMGpVaVNx?=
 =?utf-8?B?U1pzTnFab2lJQ2o4dUNTS3hFZy9wUU9YeHVqK1JnYWkwbDhSanp6bjg4N0dN?=
 =?utf-8?B?bWNqRkdOdmtZU2dBU0RJTXJFZHhKQjVmVUVuUkRhbFdlTUl1cmI4ajIvR3ZJ?=
 =?utf-8?B?bFBJMnd1WTVNTzhYcUdZK1dFa2NzMXdjRHlUT0dwQ3ZvNW1rREFseGdkbmpo?=
 =?utf-8?B?V054TCs1a25DMmszS1NWWnFBcUdaSmpQNHkrZDRrQUJ0bDVab1BkbDhvcEtt?=
 =?utf-8?B?YVRaUVQyeFJQYmtZUmIyekxqMktJQmZVYWs3SVFoZkJCelp6MGxvT281RmRT?=
 =?utf-8?B?eXRNczdkM3BEUkZ2enFIUWZNZFhWU0lhYlkyS2YzN1ptR20rcVphM1VNUjZG?=
 =?utf-8?B?c3EvcWc4b0ZOYnpkSTlJME9DcURJWkdQTjVhckxMc2JDUzdwY0tUSmNCOWx1?=
 =?utf-8?B?Zklud04xMmkxdlRqMlBBVUJXd0gzV0s1QlpKbERJSUVnaTdMNk1zWkEwaUpN?=
 =?utf-8?B?d0lzNFhPaU1PWnd0RlFEdVl6SVkwTmVPUjFOdFlZR2tEQ1ViTjlBYzQ3MUYy?=
 =?utf-8?B?TzFSbHNuOFdnT1VpSTFtdnBGeVNEc3YxNWtoV3VLem5ucmUxM29yZ3RtbE1V?=
 =?utf-8?B?SEU4dXBNaWd2c0p4SGVIQlgxVkdrbUVMK2JmRk1Bc2ZWNHo2YkNIaElFOWUr?=
 =?utf-8?B?UXFhdHg2S0VrTmEzM0xGaXdReTBzSWVnRzNPREl0ZERmMTkwMElsWkdsRmY2?=
 =?utf-8?B?SlZBZkhJUmdiYU5ab0tGZ3o5NGJQL1lTYW9DbXJ6ZUtON1R3bnRteVpZZS8x?=
 =?utf-8?B?VUh5WWxNbk1PbytwMFZXUjA1OWlvVnhBR2kwM2ttd2x5RVhybGhRU3NzckVq?=
 =?utf-8?B?c1l4MUJkK0NFQVdJMmRjcUVuWG5xeitVZzNwRjBUNWhQSUk3STBhUjJ6TEpY?=
 =?utf-8?B?ZlZkTFB6WFNUVk1OSXM0Zkg4MGgvVUhRL3ppVThvWms2emErZXRVWnVPZFN4?=
 =?utf-8?B?R283MzNHTUdMSHdMLy85Y3ViUjlUNldpNVdPUWpRSlNhd1g5NDRNRWphL09j?=
 =?utf-8?B?blNvaGxtbkIwM1hsVzhBUFhwQWJKNVBtU3NtNVhsMXZPQUcrZ09RUVFMd3Mw?=
 =?utf-8?B?Nitnb0Fzc1JZckxiZGZ3ZmdKL2kra0RVb2lQdFhzMTVKdlVFcWRTZXVLT0NB?=
 =?utf-8?B?cUtieEhtdDF5enRpZXZkS1pRaE1Jd1pzZmFwbXBYcjVVS3ExTEFxMU5YMjM2?=
 =?utf-8?B?MjVuVDc4d0N1S0JrTzNwNjQ1SG5zSlNoYVlFckNHMHZCQWxxSkVSK09ZakRG?=
 =?utf-8?B?RCtWdXp5VDI2a2ZoMjVPV01zZmU2dUtuQ3Joc0ZHRXZtZWRDL052L25sZlA4?=
 =?utf-8?B?ZXRHcVVWUi9yOXR5c2JxeVNRM01TMWtGQVpTcVNGbmVGTGVac3dLRWNqdkRl?=
 =?utf-8?B?TGJhbTdqUlBIQTM1LzNBYldSbloyUmZUc0VGWHJsWmFCZit0QXN5ODk3Wmk0?=
 =?utf-8?B?SkdybWdSTk94SzhNZkF5UzF3OG9PMkpPbTFGbXl3ZW1MZ3hCRnAyQ3pxaUZS?=
 =?utf-8?B?TGVGcDV1dndCYk52cEVJZEZyOTlFakc2MU1uQ214WjVVUGNkNUY3V0NkMGNQ?=
 =?utf-8?B?UWRXdTFZdnhXS0JMZUJEeSszT1RZQ2xzeENrU2RVTmJ5SExJRnJoYzEzc1VF?=
 =?utf-8?B?RGJwaGpYZkluQVd0ckxXTTRHWEl6NHhQMm9FQnY3YVNheWJiNDlKQ1dBajZ1?=
 =?utf-8?B?bEMvcHQ3QVNpaFhtK2pjeEM4ckV2ZjJ1cWpjQTVMQVZ2WWZYN1VnSzNveEJL?=
 =?utf-8?B?djZOcWF3RFdIQTM0V29DRk9NN1k0UDhFK0ljdDQzeHJMMU1uTmRzNlBBRXI4?=
 =?utf-8?B?K0RNSFVtY2FlWU1EQjhwM2hDbjc2OG5UaC9TNUkrY29rOGFwZk5kWHFHT1g0?=
 =?utf-8?B?d1I2aHNuczVqbW5reHIvOXhkRFJNOElUZTg0TGdRN0lkVEliQW5VTjE5VVFx?=
 =?utf-8?B?WlVCek1UOTE0cDloQlZiVEN0cXRBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef1397-d4d3-4597-eef2-08db89ed0fd4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5444.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:19:07.0347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smysserbrLDPfeka/NskuUkQYE4WWgyrqm7eHOgc+KupvcISrW9KBieMFsXkzpTQYtxPT1Nb+jYVSU8CpOIB8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7801
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_061919_864676_9F02017C 
X-CRM114-Status: GOOD (  24.32  )
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

SGVsbG8hCgpPbiAwNy8wNy8yMDIzIDE3OjAwLCBQYWxtZXIgRGFiYmVsdCB3cm90ZToKPiBSSVND
LVYgaGFzIGFuIGV4dGVuZGVkIGZvcm0gb2YgbWFwcGluZyBzeW1ib2xzIHRoYXQgd2UgdXNlIHRv
IGVuY29kZQo+IHRoZSBJU0Egd2hlbiBpdCBjaGFuZ2VzIGluIHRoZSBtaWRkbGUgb2YgYW4gRUxG
LiAgVGhpcyB0cmlwcyB1cCBtb2Rwb3N0Cj4gYXMgYSBidWlsZCBmYWlsdXJlLCBJIGhhdmVuJ3Qg
eWV0IHZlcmlmaWVkIGl0IHlldCBidXQgSSBiZWxpZXZlIHRoZQo+IGthbGxzeW1zIGRpZmZlcmVu
Y2Ugc2hvdWxkIHJlc3VsdCBpbiBzdGFja3MgbG9va2luZyBzYW5lIGFnYWluLgo+IAo+IFJlcG9y
dGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4KPiBDbG9zZXM6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC85ZDllMjkwMi01NDg5LTRiZjAtZDljYi01NTZjOGU1
ZDcxYzJAaW5mcmFkZWFkLm9yZy8KPiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFs
bWVyQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIHYxIDwyMDIzMDcwNzA1NDAw
Ny4zMjU5MS0xLXBhbG1lckByaXZvc2luYy5jb20vPjoKPiAKPiAqIERyb3AgdGhlIHVubmVjZXNz
YXJ5IElTX1JJU0NWIGRlZmluZSBhbmQganVzdCBpbmxpbmUgaXQuCj4gLS0tCj4gICBpbmNsdWRl
L2xpbnV4L21vZHVsZV9zeW1ib2wuaCB8IDEyICsrKysrKysrKysrLQo+ICAga2VybmVsL21vZHVs
ZS9rYWxsc3ltcy5jICAgICAgfCAgMiArLQo+ICAgc2NyaXB0cy9tb2QvbW9kcG9zdC5jICAgICAg
ICAgfCAgMiArLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21vZHVsZV9zeW1ib2wuaCBi
L2luY2x1ZGUvbGludXgvbW9kdWxlX3N5bWJvbC5oCj4gaW5kZXggN2FjZTdiYTMwMjAzLi41Yjc5
OTk0MmIyNDMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tb2R1bGVfc3ltYm9sLmgKPiAr
KysgYi9pbmNsdWRlL2xpbnV4L21vZHVsZV9zeW1ib2wuaAo+IEBAIC0zLDEyICszLDIyIEBACj4g
ICAjZGVmaW5lIF9MSU5VWF9NT0RVTEVfU1lNQk9MX0gKPiAgIAo+ICAgLyogVGhpcyBpZ25vcmVz
IHRoZSBpbnRlbnNlbHkgYW5ub3lpbmcgIm1hcHBpbmcgc3ltYm9scyIgZm91bmQgaW4gRUxGIGZp
bGVzLiAqLwo+IC1zdGF0aWMgaW5saW5lIGludCBpc19tYXBwaW5nX3N5bWJvbChjb25zdCBjaGFy
ICpzdHIpCj4gK3N0YXRpYyBpbmxpbmUgaW50IGlzX21hcHBpbmdfc3ltYm9sKGNvbnN0IGNoYXIg
KnN0ciwgaW50IGlzX3Jpc2N2KQo+ICAgewo+ICAgCWlmIChzdHJbMF0gPT0gJy4nICYmIHN0clsx
XSA9PSAnTCcpCj4gICAJCXJldHVybiB0cnVlOwo+ICAgCWlmIChzdHJbMF0gPT0gJ0wnICYmIHN0
clsxXSA9PSAnMCcpCj4gICAJCXJldHVybiB0cnVlOwo+ICsJLyoKPiArCSAqIFJJU0MtViBkZWZp
bmVzIHZhcmlvdXMgc3BlY2lhbCBzeW1ib2xzIHRoYXQgc3RhcnQgd2l0aCAiJCIuwqAgVGhlCj4g
KwkgKiBtYXBwaW5nIHN5bWJvbHMsIHdoaWNoIGV4aXN0IHRvIGRpZmZlcmVudGlhdGUgYmV0d2Vl
biBpbmNvbXBhdGlibGUKPiArCSAqIGluc3RydWN0aW9uIGVuY29kaW5ncyB3aGVuIGRpc2Fzc2Vt
YmxpbmcsIHNob3cgdXAgYWxsIG92ZXIgdGhlIHBsYWNlCj4gKwkgKiBhbmQgYXJlIGdlbmVyYWxs
eSBub3QgbWVhbnQgdG8gYmUgdHJlYXRlZCBsaWtlIG90aGVyIHN5bWJvbHMuwqAgU28KPiArCSAq
IGp1c3QgaWdub3JlIGFueSBvZiB0aGUgc3BlY2lhbCBzeW1ib2xzLgo+ICsJICovCj4gKwlpZiAo
aXNfcmlzY3YpCj4gKwkJcmV0dXJuIHN0clswXSA9PSAnJCc7Cj4gKwo+ICAgCXJldHVybiBzdHJb
MF0gPT0gJyQnICYmCj4gICAJICAgICAgIChzdHJbMV0gPT0gJ2EnIHx8IHN0clsxXSA9PSAnZCcg
fHwgc3RyWzFdID09ICd0JyB8fCBzdHJbMV0gPT0gJ3gnKQo+ICAgCSAgICAgICAmJiAoc3RyWzJd
ID09ICdcMCcgfHwgc3RyWzJdID09ICcuJyk7Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9tb2R1bGUv
a2FsbHN5bXMuYyBiL2tlcm5lbC9tb2R1bGUva2FsbHN5bXMuYwo+IGluZGV4IGVmNzNhZTdjODkw
OS4uNzhhMWZmYzM5OWQ5IDEwMDY0NAo+IC0tLSBhL2tlcm5lbC9tb2R1bGUva2FsbHN5bXMuYwo+
ICsrKyBiL2tlcm5lbC9tb2R1bGUva2FsbHN5bXMuYwo+IEBAIC0yODksNyArMjg5LDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgKmZpbmRfa2FsbHN5bXNfc3ltYm9sKHN0cnVjdCBtb2R1bGUgKm1vZCwK
PiAgIAkJICogYW5kIGluc2VydGVkIGF0IGEgd2hpbS4KPiAgIAkJICovCj4gICAJCWlmICgqa2Fs
bHN5bXNfc3ltYm9sX25hbWUoa2FsbHN5bXMsIGkpID09ICdcMCcgfHwKPiAtCQkgICAgaXNfbWFw
cGluZ19zeW1ib2woa2FsbHN5bXNfc3ltYm9sX25hbWUoa2FsbHN5bXMsIGkpKSkKPiArCQkgICAg
aXNfbWFwcGluZ19zeW1ib2woa2FsbHN5bXNfc3ltYm9sX25hbWUoa2FsbHN5bXMsIGkpLCBJU19F
TkFCTEVEKENPTkZJR19SSVNDVikpKQo+ICAgCQkJY29udGludWU7Cj4gICAKPiAgIAkJaWYgKHRo
aXN2YWwgPD0gYWRkciAmJiB0aGlzdmFsID4gYmVzdHZhbCkgewo+IGRpZmYgLS1naXQgYS9zY3Jp
cHRzL21vZC9tb2Rwb3N0LmMgYi9zY3JpcHRzL21vZC9tb2Rwb3N0LmMKPiBpbmRleCBiMjliMjk3
MDdmMTAuLjdjNzE0MjlkNjUwMiAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL21vZC9tb2Rwb3N0LmMK
PiArKysgYi9zY3JpcHRzL21vZC9tb2Rwb3N0LmMKPiBAQCAtMTA1Miw3ICsxMDUyLDcgQEAgc3Rh
dGljIGlubGluZSBpbnQgaXNfdmFsaWRfbmFtZShzdHJ1Y3QgZWxmX2luZm8gKmVsZiwgRWxmX1N5
bSAqc3ltKQo+ICAgCj4gICAJaWYgKCFuYW1lIHx8ICFzdHJsZW4obmFtZSkpCj4gICAJCXJldHVy
biAwOwo+IC0JcmV0dXJuICFpc19tYXBwaW5nX3N5bWJvbChuYW1lKTsKPiArCXJldHVybiAhaXNf
bWFwcGluZ19zeW1ib2wobmFtZSwgZWxmLT5oZHItPmVfbWFjaGluZSA9PSBFTV9SSVNDVik7Cj4g
ICB9Cj4gICAKPiAgIC8qIExvb2sgdXAgdGhlIG5lYXJlc3Qgc3ltYm9sIGJhc2VkIG9uIHRoZSBz
ZWN0aW9uIGFuZCB0aGUgYWRkcmVzcyAqLwoKClNpbmNlIHRoaXMgY29tbWl0IHdhcyBhZGRlZCwg
b3VyIGJ1aWxkZXJzIGFyZSBmYWlsaW5nIHdpdGggdGhlIGZvbGxvd2luZyAKZXJyb3IgLi4uCgpr
ZXJuZWwvc2NyaXB0cy9tb2QvbW9kcG9zdC5jOiBJbiBmdW5jdGlvbiDigJhpc192YWxpZF9uYW1l
4oCZOgprZXJuZWwvc2NyaXB0cy9tb2QvbW9kcG9zdC5jOjEwNTU6NTc6IGVycm9yOiDigJhFTV9S
SVNDVuKAmSB1bmRlY2xhcmVkIAooZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pCiAgIHJldHVy
biAhaXNfbWFwcGluZ19zeW1ib2wobmFtZSwgZWxmLT5oZHItPmVfbWFjaGluZSA9PSBFTV9SSVND
Vik7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeCgpXZSBoYXZlIGhhZCBzb21lIGNhc2VzIG9mIHRoaXMgYmVmb3JlIFswXSBhbmQgd2Fz
IGZpeGVkIGJ5IGVuc3VyaW5nIHRoaXMgCmlzIGRlZmluZWQgaWYgaXQgaXMgbm90LgoKVGhhbmtz
CkpvbgoKWzBdIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbW0v
cGF0Y2gvMjAyMTA5MjQyMjQzMzguOHZ1T2xRUFdyJTI1YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9y
Zy8KCi0tIApudnB1YmxpYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
