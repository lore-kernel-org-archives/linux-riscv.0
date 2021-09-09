Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C1FC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 07:31:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D9C9610C8
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 07:31:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D9C9610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7gxHeRj0SByp8yNQdzF5HPBHXheVhaWYnl40J6GDac=; b=qhyVw3NVyyagJM1ZG4sQy2m1rU
	6Ae8pq39dMaY4f0eFNaxCg27VVuzD3O0lqq5Z+0ejAS1cpE+ysFjW7SFzkS3yI4G+oXJTN3Nragx9
	Ll30hgTmEo1HAndMUL+IbZQU/FpEvXrFPNQ94Ev6f4sybYvik5+5rtf/v7peUv0ZBgoE6yiNZy4Nw
	Fi1GfJepqgct1xsR8YVj9TC0MyP2N1eAhSFAn7C4LZvW3chkvB6Pw6WNZn5XTIrvK6mCricKjlcob
	WGUWe2PznqcqPZrb6rFsCGqsoes43AsxnczS4/ZFyVjTi+d+wjUN9KHpvTr045rdMLGPeiPmZ29Si
	VUbFTehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOEWD-008RXk-CN; Thu, 09 Sep 2021 07:30:45 +0000
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com
 ([40.107.243.56] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOEWA-008RWG-9y
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 07:30:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mczIAHDYEtHWiHrGVNKl7AzeJTUsEcKG5TNno0xVtkC5jVTbtVn8NS1egVSUgKv6soDmok9QUXHu51gkhhd2rLnYHnOLn+264XhTxaD1rtzV6PpN6/jKo1f/GID1rqZjIGnLUDQxTGgqdFmv4nWSXmMiLYVes6XiwMY/Ka/t1wFJwdA3KGvAG8WkJ/s8JLS+lDr8Svr6ZGqeOT+N/aLOZEknQJLsa+wHG+epnCFNshSVZM6zh/rAYNcl6DMWv8vSZRmv0CC4hTLIUwXrQFmw654+dEbx5Lnndo4+AOID9JLCr3NPiye5bYITbXvWCbxqrgixT6TG4fquCPVYk9c+Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MMhJQGpQHy5NhG+UI3L9OljPFIUxRjeQOPCIjbxwJBU=;
 b=iL2LWYk/Gcf08j5NYS661YT0UrTLFJUOLMKe6sTaFXbqJm5RsMzi9NvmfEZlPsADRnZKJCPhFslT4fbR0nx2yRZRTVuvrNQLoi0PiaNnAVhZKlE2qiuDGL21S1t4//gs7uJHnsWb0WM/TZETY3Ddq1pbkOLE4fLLcktDnCq7lzlLii4HH4MJ88K+d2tp9wHrlDN6AJEx17aUbbzm+56wP8MrakAoUkklv3rMdaPdXyFh5A/nj7/xBFoLhXZ72yFZwYGgfd1WgvV1REgZTEcaNTVuMov+lXayiNrNERBKjgVu6lGAE0wYdKAjHBV44T7fm8sjDfqsrlbaVM3EaNxRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMhJQGpQHy5NhG+UI3L9OljPFIUxRjeQOPCIjbxwJBU=;
 b=qyD2w5NW5PDd9GfHO0jfbFINHvANy0hoVmq6uA0WWdhlUsLiChzQXqqRa8AhOedBPjNp3OWpjQc9MpFRFn9j+uIoNVYMupt6dSdsBoS5f+WR6TH0PddNI0GAHivdXQoBTG4eAr+g/u5KFQoMiMOGTzaR1M47gQBx44QzfRUEeN4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 9 Sep
 2021 07:30:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.015; Thu, 9 Sep 2021
 07:30:35 +0000
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Guenter Roeck <linux@roeck-us.net>, Christoph Hellwig
 <hch@infradead.org>, Marco Elver <elver@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
 <a04c4c37-7151-ef7e-09ce-a61ac7b12106@roeck-us.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <78aeab09-de88-966f-9f03-a2d56a0a6064@amd.com>
Date: Thu, 9 Sep 2021 09:30:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a04c4c37-7151-ef7e-09ce-a61ac7b12106@roeck-us.net>
Content-Language: en-US
X-ClientProxiedBy: PR3P189CA0070.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:7140:364b:3af8:f004]
 (2a02:908:1252:fb60:7140:364b:3af8:f004) by
 PR3P189CA0070.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.15 via Frontend Transport; Thu, 9 Sep 2021 07:30:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab3756c1-5750-473d-7ae5-08d97363b649
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB439048600C1EC8BF0860A4EA83D59@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C6hXIYx3ypYuXQ/306rkI5/G639bDPeW4AaOlhMXCIw/tveWvoNIDOLLLW0ONptA1MA/HRWPh50fJ2dSFM1gAAOZIySm7qDSYtgGe0Wyu+TjDZS3mnPIqfXKa0iTT3v30IHKfbK8rqwvsHsV/Lojd0Jj5DfTeatUUEwGQhxQBL727c3BVhzvKXGA7uNx0irkeWQ/jrbRfkXQYlZ2nQ/XV5+RkP7VZFq74HUW1foqfVTwxoVPpeiFx4EV8zcwWBrC8DUlHT4d7gYU443lv8HQTm8duT5mQbDHOIvRMu9GDDOO6uQP4M1CNNPlwkb9IzvahKfyNKP0OgMBAcoFINWG4wYuZOE/CJ6ORsnekFB+rg0f34ekbwOQxr13crwBIBK98sreQxIB3fiyvm2YWb2Tc3csRg30QvMvyYXxe3PlyLLfex04bh0MKONdFnAefo3OMflXQBYsCAH6eB7OHbm/sddEPkv4RjP83I1Z1RL7TPwWSZPiAvjTXDvnLsOpawlrQtN4P58bmLS1TBFw5bhGkgeN1p8xamSDGTk7M+X/qnJqcD/Nj/tkOcX4VX0WpztXzqPAmCz/NCwtKrVD4koZ1usZNe/uU2NzdA7lekw0saSfx9oJqFrcmq9RUKl5NXhQR4VVlygFe+dDrXX5t1vgZeAYIvDGXnwd2fSJQ/1uzw1/ueHNJSvfAoc+hR7lbi87WkVS1mOJzonivFwx33bzRBdoGN8HzWyo7LB40jVYNvNnI8mL7bqa3BRV/jpD5hvQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(66946007)(6666004)(2906002)(38100700002)(36756003)(53546011)(4326008)(31696002)(186003)(316002)(110136005)(66556008)(66476007)(8936002)(8676002)(54906003)(2616005)(83380400001)(478600001)(86362001)(6486002)(31686004)(5660300002)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0tKbFg4Z3NJZWM3N1VKSDBtWXlkM0tYSlVhZS9ZQUZBbWlxV0ZFb1BMMWE3?=
 =?utf-8?B?eW5rTWpJS1AzbHBTaTJSUXpBTVc1elg5MjF6cUo1Z1Z0QTZTV25zeXBkeXRk?=
 =?utf-8?B?MUx1RHJCMWVhc1ZOMDRjWll6UVFWMGFFSVZTb3VOKzZHemlIMGl1MTd6blhY?=
 =?utf-8?B?QXU1TXVZMWZjUGcvSDhwMmZaUUMrY2FXbVpiOUFqb2lERGJaT3dyZWhRSDdI?=
 =?utf-8?B?V0tNYlgvQnltTnZ3Q1RQZWxlNXRCbHhKbWNyY1JxRDVDMFY3RVE5T2lJU20x?=
 =?utf-8?B?RlBjcnNvamJoZVhYbzdMRHRlK0VmNFFyNWNSL29ORDVWaitYbVd6dFMwREpk?=
 =?utf-8?B?Y1pqQ0FOaWVWTGErQnVOZWE3a3U5R1FER29GNWdUYXJvUm9uR3FFNlU4T3B0?=
 =?utf-8?B?RjlRVng5TUV0QlRWK092S2tqaC81Q0phVWZhTE04ckYxSzFDRGRhZklLYkN0?=
 =?utf-8?B?NkQ4N1hUNXZzN0ZTQmpXaXR4K0xXeUs5dXRvZTAwWFJ4R1dSV0dCbXlsSzhH?=
 =?utf-8?B?dzNyZ21UYU9KcitKK2tTczRDZEZ3QWNqRVlOSW9wYVFJT1h1Vm52Rnl0ZEYv?=
 =?utf-8?B?bDY5c3NiNWkrYmRQVEZPcUpaSmwrRGhuc3ovbzR0cGt6NDJRNHpmRWk3U0hn?=
 =?utf-8?B?aUlEODJnWDJ3UXdUWWdOLzFpUlZIcXJvdHpwUjJxcVBMMVUrUkc0aTVLTnJW?=
 =?utf-8?B?VVRIek5aQnUyU1NMNWVMbDBRK1MwQzU4NjNoUkpPQW9PaHAyODA1LzNqTHF6?=
 =?utf-8?B?VGtSNU1wZ1lEb3JHY1pMR2FFUzFkdnpZNm5Na1lZY3lTMTQ2RlI1SXp1OWlV?=
 =?utf-8?B?UWxGMWtjYXM2cXpyK1E4OGpDeElycEJRYnRwaktWWGppZ3B6dFk4aGF4VEVs?=
 =?utf-8?B?RFkyLytjNG04bVllWnhXMm0vVERPT1JlVUtVQjgrcVRQRVoyT2RMSEkzVjJH?=
 =?utf-8?B?QVZTeGI1VTlIVVJqcmV2T01uTDEzdEVnS0VQRzJGcisrZUZ0cWo1VFZrQmxw?=
 =?utf-8?B?THQ0cTBmcm0vb2hjVWxxajFGSkNhdlFKaVhzTDNlOC9INmZIRVhkMzU5djk3?=
 =?utf-8?B?L0VieWdpQ04xZXlmSFk3OFUvbmNRNnNPZE9jYURYbUlmNWZtV2pNNk9jN2VN?=
 =?utf-8?B?bGQ3Z05wSXBzTWxYdUsxV1NMeHBZY3M5V3BXbGJPUjNaejg0UjBTQnlLNmpp?=
 =?utf-8?B?UlU1dUtLaVk2R1dMMzhXSmc4Ym1jVzZYQi9tZk85cnZtSVByQndNcDd2Ky9V?=
 =?utf-8?B?VCtTK1F3dk5kOUtyWmcwejJyb1Rkb1l0NWJCdk13cHNlcW4rLzF3TXhzZFND?=
 =?utf-8?B?dW13NE5IR2E3VVVvWlN1c3FQNGViQ25sT2RBRW12aUtxU1lwMDFsV0VTTXM3?=
 =?utf-8?B?WUVkQU9raEpydlVWNjBPaWFRV1VTam84eXhSeFQyVXNmK1dKQkZGQnhKbEIz?=
 =?utf-8?B?Yi8zVHROU0FkL3R5enk3bTgwcFowRzR2ZEY3ejlIaklMaTdQQWM3a1phMHpi?=
 =?utf-8?B?U2dXSEN0alZkaTZ0aU1qNW4vM1hOM1lZY3FvakFDTmpOY1JVdVBsZStxRjdW?=
 =?utf-8?B?Q1ZNNVFIdzJiQmtJL0tKQ1Y2K1ROeFY4cWJlaUxiZ09UOFR5UGtZYXNIY3R5?=
 =?utf-8?B?QUYvWmcyQ0JXNGRFR0kzUDBISW1DeGdFZSt2UUhKM1BXWStYOWpMK09mYTRW?=
 =?utf-8?B?T3lZbEhSejFUamcvU0N4TG84KzFZZTlEcDNMVlU1WmZGZVRvVGw2K3pmS2R1?=
 =?utf-8?B?SUk2dTM1Sk5LRkNMd1N5bVBKV1VIaDB2NmV5elBaNWNwZklQNlBQTUc2TDg5?=
 =?utf-8?B?d2FIekRzSXB2Y1BPVTkySmlDQ3p2dVoreDRSQXhqMEU0M2JFbW9VMTNqU1Z1?=
 =?utf-8?Q?ZIpbxes4pKBMl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab3756c1-5750-473d-7ae5-08d97363b649
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 07:30:34.8950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48jUA9n8Yf9bIegEvZtcDP0iGfwyGcADrWZCTQ6IYGYXHf8xqbxfZnUDbUhAVdez
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_003042_391879_834827C9 
X-CRM114-Status: GOOD (  20.50  )
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

QW0gMDkuMDkuMjEgdW0gMDg6MDcgc2NocmllYiBHdWVudGVyIFJvZWNrOgo+IE9uIDkvOC8yMSAx
MDo1OCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4+IE9uIFdlZCwgU2VwIDA4LCAyMDIx
IGF0IDExOjU4OjU2UE0gKzAyMDAsIE1hcmNvIEVsdmVyIHdyb3RlOgo+Pj4gSXQnZCBiZSBnb29k
IHRvIGF2b2lkLiBJdCBoYXMgaGVscGVkIHVuY292ZXIgYnVpbGQgaXNzdWVzIHdpdGggS0FTQU4g
aW4KPj4+IHRoZSBwYXN0LiBPciBhdCBsZWFzdCBtYWtlIGl0IGRlcGVuZGVudCBvbiB0aGUgcHJv
YmxlbWF0aWMgCj4+PiBhcmNoaXRlY3R1cmUuCj4+PiBGb3IgZXhhbXBsZSBpZiBhcm0gaXMgYSBw
cm9ibGVtLCBzb21ldGhpbmcgbGlrZSB0aGlzOgo+Pgo+PiBJJ20gYWxzbyBzZWVpbmcgcXVpdGUg
YSBmZXcgc3RhY2sgc2l6ZSB3YXJuaW5ncyB3aXRoIEtBU0FOIG9uIHg4Nl82NAo+PiB3aXRob3V0
IENPTVBJTFRfVEVTVCB1c2luZyBnY2MgMTAuMi4xIGZyb20gRGViaWFuLsKgIEluIGZhY3QgdGhl
cmUgYXJlIGEKPj4gZmV3IHdhcm5pbmdzIHdpdGhvdXQgS0FTQU4sIGJ1dCB3aXRoIEtBU0FOIHRo
ZXJlIGFyZSBhIGxvdCBtb3JlLgo+PiBJJ2xsIHRyeSB0byBmaW5kIHNvbWUgdGltZSB0byBkaWcg
aW50byB0aGVtLgo+Pgo+PiBXaGlsZSB3ZSdyZSBhdCBpdCwgd2l0aCAtV2Vycm9yIHNvbWV0aGlu
ZyBsaWtlIHRoaXMgaXMgcmVhbGx5IGZ1dGlsZToKPj4KPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5jOiBJbiBmdW5jdGlvbiAKPj4g4oCYYW1kZ3B1X2JvX3N1cHBv
cnRfdXN3Y+KAmToKPj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5j
OjQ5MzoyOiB3YXJuaW5nOiAjd2FybmluZwo+PiBQbGVhc2UgZW5hYmxlIENPTkZJR19NVFJSIGFu
ZCBDT05GSUdfWDg2X1BBVCBmb3IgYmV0dGVyIHBlcmZvcm1hbmNlIAo+PiB0aGFua3MgdG8gd3Jp
dGUtY29tYmluaW5nIFstV2NwcAo+PiDCoMKgIDQ5MyB8ICN3YXJuaW5nIFBsZWFzZSBlbmFibGUg
Q09ORklHX01UUlIgYW5kIENPTkZJR19YODZfUEFUIGZvciAKPj4gYmV0dGVyIHBlcmZvcm1hbmNl
IFwKPj4gwqDCoMKgwqDCoMKgIHzCoCBefn5+fn5+CgpBaCwgeWVzIGdvb2QgcG9pbnQhCgo+Cj4g
SSBoYXZlIGJlZW4gd29uZGVyaW5nIGlmIGFsbCB0aG9zZSAjd2FybmluZyAiZXJyb3JzIiBzaG91
bGQgZWl0aGVyCj4gYmUgcmVtb3ZlZCBvciBiZSByZXBsYWNlZCB3aXRoICIjcHJhZ21hIG1lc3Nh
Z2UiLgoKV2VsbCB3ZSBzdGFydGVkIHRvIGFkZCB0aG9zZSB3YXJuaW5ncyBiZWNhdXNlIHBlb3Bs
ZSBjb21waWxlZCB0aGVpciAKa2VybmVsIHdpdGggQ09ORklHX01UUlIgYW5kIENPTkZJR19YODZf
UEFUIGFuZCB3YXMgdGhlbiB3b25kZXJpbmcgd2h5IAp0aGUgcGVyZm9ybWFuY2Ugb2YgdGhlIGRp
c3BsYXkgZHJpdmVyIHdhcyBzbyBjcmFwcHkuCgpXaGVuIHRob3NlIHdhcm5pbmcgbm93IGdlbmVy
YXRlIGFuIGVycm9yIHdoaWNoIHlvdSBoYXZlIHRvIGRpc2FibGUgCmV4cGxpY2l0bHkgdGhlbiB0
aGF0IG1pZ2h0IG5vdCBiZSBiYWQgYXQgYWxsLgoKSXQgYXQgbGVhc3QgcG9pbnRzIHBlb3BsZSB0
byB0aGlzIHNldHRpbmcgYW5kIG1ha2VzIGl0IHJlYWxseSBjbGVhciB0aGF0IAp0aGV5IGFyZSBk
b2luZyBzb21ldGhpbmcgdmVyeSB1bnVzdWFsIGFuZCBuZWVkIHRvIGtlZXAgaW4gbWluZCB0aGF0
IGl0IAptaWdodCBub3QgaGF2ZSB0aGUgZGVzaXJlZCByZXN1bHQuCgpSZWdhcmRzLApDaHJpc3Rp
YW4uCgo+Cj4gR3VlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
