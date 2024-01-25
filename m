Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6330FC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 09:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbDukIezJxZ/hvoTf+h4xLQ4a7v3m/Otp3G5RRYZsEM=; b=Ip3fckjBypII94gn7kAe+Dsycy
	le8dIfkeKSs9Je09Gq/AlMU9MES3j9mxWXwGQjKyetkQbw61ptWxGtrrVHzw56cIKaEGGMZUVQJPQ
	7Yzv0Bp3/XEQpJXXki/x+xDSDQqBm98U8a5aXG+58seiqOS+3ggj20hWjhPg++nIAoXqIhb3EcS/E
	FHG0ANvglfdX74FGSaplUi8uzRWtBQ7UfaWw7yHH3NRZX9MWKBq+5LhKITO2gdiqnRIcQ0ZZUIpOW
	UMysycmGdw4gHUSpxSPKsX8bth7ifCdKENbERbqo1vzhrOoC5q67C2Tyw//UasdTIw/Pw9dCUBWXA
	zXp21FzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSw4y-007YnI-04;
	Thu, 25 Jan 2024 09:31:24 +0000
Received: from mail-dm6nam10on20726.outbound.protection.outlook.com ([2a01:111:f400:7e88::726] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSw4p-007YjA-1K;
	Thu, 25 Jan 2024 09:31:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8653EfRsF/a9nJNdUlRrcawJ8T7gZpBar/0YdzSgI3Dhn0xZF+u8TtqLiI9oLDE/QTXA1MiuzlHlTxFte4b39o3klhIDGok7/04FdLmwGGBnGiYYupFlhx0bRyrqEIuu0oSH6ILmvWIr9WZjOZ16UDPUXslp2oBw0hs3uxQZwnIlp5jPFswRlRxzxYVCi0hhhGXwVcW+eA+HuhXOsM5f9FVlkH0o7fqNigL2zD9JmB1ekfpzf7h3LPoGpEBUp3UfRuXklNYotBqbiFlDWubpNYYBt1GmIR+xKpFtCg6DqrzabIQk7gT1sFFNsmj5nnWzdc6e3kKJJEQlVTdTJ/Gdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p29qIyBkJJbBf6cKrviAtpHOBGDvsKpEFWwzsi/1bDA=;
 b=SJwCxlAW4tlzu9ebFvMwHUjtd8ewXCcPfPblHFHwA96kKuwgblHIzdXkjaY4bndV0TGndoeyKRs/HFrWu3Xnpb9WRENePnjYdRUk3gMHYtoqibcNwTF9H6jG8PrEZPlgu8obIHXFo5yH5nKoytdGT2JAGqIlKTCVTGLUZTwUv0aBOImD5pT+EWnGRfTk3CoXbY3I8XCxdXN3+O2TOg4Kw5gfOk1YGVQQpCgNlOa9rkR5YgQaPjgKuLMhC0XF+BsFNvxXIbwXoW21Szvj3BPgX+YW6Oa5GTYIjO9UCYKNO1USPasrKD6PbtmOONyAc2JYYIG+tqzoK8VwGo9x+h2zBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p29qIyBkJJbBf6cKrviAtpHOBGDvsKpEFWwzsi/1bDA=;
 b=CKGWEFIi4KxwIjR3porQOjz3TjtAtBloDOtbRBJ6Cpig3tO00oVEjzaJGk+wB4BZRJE2zLxGStXDMYjzTLI5ELDEQy4h0N5dziIkqCeU/db6DOtCGXwNvGUYq6+CoiOXpCLMYqbIZ4j73Kj7zLQJdFl8S9sNCPVxQ0gHD8JoRyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from PH0PR01MB7975.prod.exchangelabs.com (2603:10b6:510:26d::15) by
 BN0PR01MB7104.prod.exchangelabs.com (2603:10b6:408:153::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.27; Thu, 25 Jan 2024 09:15:45 +0000
Received: from PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a])
 by PH0PR01MB7975.prod.exchangelabs.com ([fe80::91c:92f:45a5:e68a%6]) with
 mapi id 15.20.7202.026; Thu, 25 Jan 2024 09:15:45 +0000
Message-ID: <1dd52bb0-f905-4eff-8044-9e99e689ab06@amperemail.onmicrosoft.com>
Date: Thu, 25 Jan 2024 17:15:29 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
To: Mike Rapoport <rppt@kernel.org>,
 "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc: Huang Shijie <shijie@os.amperecomputing.com>, gregkh@linuxfoundation.org,
 patches@amperecomputing.com, rafael@kernel.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, yury.norov@gmail.com,
 kuba@kernel.org, vschneid@redhat.com, mingo@kernel.org,
 akpm@linux-foundation.org, vbabka@suse.cz, tglx@linutronix.de,
 jpoimboe@kernel.org, ndesaulniers@google.com, mikelley@microsoft.com,
 mhiramat@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
 jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org
References: <20240123045843.75969-1-shijie@os.amperecomputing.com>
 <4a13353c-cf4b-a388-5776-389c61c63ec0@os.amperecomputing.com>
 <ZbIObaA6t9WbRw9y@kernel.org>
From: Shijie Huang <shijie@amperemail.onmicrosoft.com>
In-Reply-To: <ZbIObaA6t9WbRw9y@kernel.org>
X-ClientProxiedBy: CH5P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::26) To PH0PR01MB7975.prod.exchangelabs.com
 (2603:10b6:510:26d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR01MB7975:EE_|BN0PR01MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: d1089ec1-2367-45ce-2569-08dc1d8635fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1uXeGa+RhL0vCeaH+oDHOD445E7FQBjuJYZzHn0RZf6119CHRWPl5pYlyGNGds7fo8qxAgY0aWATxoAW/fhGA9tVF1oP71A1BtS7z5bvSKTmkO4XbWjX1uE0LQ4n16KNMe2CHHR3X4a9qFj6Yp9K1M1EHu6+BLU4cIYeQSXC9CQwZhREeeIpTi962vug120ddxjPeTYHIBCTi7e0ZTXtfI4V5HRCHDBqpn4sz6UE4GHXTqHHyfkukyfcTv5TaIrTeS634p/eN8GHDssqyL4cWa3oA54BPO0Y9vCItIyOeIefBJPP9gP9kJI+we0dVFGmUQ5ILPLX2nZDN07CphQgijcdYag7IgK2B0GctPE5PwZJ7Cv/ptuzlSgF9YDRfu2wH3gK0XgPpAvnPzTaLf9/4luboHzU/8io1xAi3f9WNEklO9E3wnYxLu7WkkiJYIR9kpzyQVzCLRW7xohlkHkvq31PabbEdeyOowH63bXxH4qE9ZzrTkflXROt1UgONnNOnRrmHCLLj8+gqNsxAM6XrO23R8/8KN2Q4j1KxMwhCGzE7dUk7lj6IMJKtXcqUtLf6udGAHabR0xWd8UQwebb95dRJiW8AARB2ArGCqEHKyGJbXH5VVaC4GU/+qyF5QUqpUwehL9Hr7f/papmHA/wUWOnIyivbm+I2S6Rve6xlHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR01MB7975.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(346002)(376002)(136003)(39850400004)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(41300700001)(6486002)(478600001)(6666004)(26005)(2616005)(42882007)(6506007)(6512007)(316002)(8676002)(8936002)(66476007)(66556008)(66946007)(110136005)(83380400001)(31696002)(31686004)(83170400001)(38100700002)(2906002)(5660300002)(7416002)(4326008)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2J1a0hVQThyWEVMdHpzNEQxbHNRNjZaUzdTSXZveGFnblMveDd2bzlXdGQx?=
 =?utf-8?B?VTVvTC9HU0JUVzE2TE9yYVFCdW1sZVpkTXNBcHNkeFRQT2xlOE5ZVENCMElz?=
 =?utf-8?B?dllBOW5sY0xTcWREU3VkZHVxVUo5YjRiRkFKKzZSL212KzFDYUcwQzhWSm1s?=
 =?utf-8?B?d0pyZHFkMGZjQ3A3VXpIMllheGNQWTh6Z0xhYndjb2RZSGJLcW45ak1WVCtX?=
 =?utf-8?B?U3RURHZocjVscXIzZlJGbkkxK3RlU1dYUW5pVGtQVHVEaDJ5OHhOWEpzWWxa?=
 =?utf-8?B?UGdvaXBjU1RqbnFHdG5JS0FqYzNEUkk0TDZiaVRIZHJpMDRTNk9nMjBKLzBI?=
 =?utf-8?B?czZZZkpsVm8rUjk4UjNzL0UrOElZczlKalJ3V1BxVXdHZlFnZXJTbngxVzQ5?=
 =?utf-8?B?Z3A0dldZc0pjR2F3S0VDbUFUVld2dnhxSmtvMFBhd3Jhc0xVUkIrcVppampa?=
 =?utf-8?B?UldzMzFKcHlUdUEzbDZIQkJUME5hNHpVN0dQTVZadVdkdWduRXI4VlY1aHBG?=
 =?utf-8?B?NS9oN1FmTHY2c2pWNUY1bGYya0liV1NobitLcHpRV3NPclBXeU1IRk1nd1Bo?=
 =?utf-8?B?SFAxSUlnY0k2Z1psY3h2ZFpaY3J1ZHExMTZiSCtmLzFJMGVrNkx0NFdCNmZl?=
 =?utf-8?B?NGtyQmdrTHBTMHg1ZWdwVHNxQ3lCMThxK0gyZmY0UzZzL1p1WWh4Y1VVends?=
 =?utf-8?B?SlZIRTZ1NFBWQjZvblBMUVR3Um1XcGZaeld6NytPaWFSNU5pbUxjNTVsQWpT?=
 =?utf-8?B?TExjY0t6dGF6QUc4MmQrMGl5b2VoaHp1OFM4RzBoRWQyUmR4SzlWNjYxS3BQ?=
 =?utf-8?B?aWZkQmNyNVkxSlVheUorS3hUZXMyVUhsbU9raFQwcUJBUm5iTVpISHZxUFE1?=
 =?utf-8?B?VWRtdHVJYWdIWUFiaFFHU2UrNUUyQVpVU0IvMjZ5eDM5YUtwWDhUdjJoSDFD?=
 =?utf-8?B?aEhsdm5SSmd5TjlUM0xIRDdVc0k3L29nRXAzYVlNOVNXRFZnVFU1bjg2Qk1Z?=
 =?utf-8?B?VHllb3piTGEwQUx1enFNcG5uMGJOQU1oQWZBSHhpUnRZWnVGWEM3VnkwR1RC?=
 =?utf-8?B?Znc4QThPVUJRY2F4UkNrSnVuTlhBbTh0c3pET0swSFJEaGhSdEp6bXhFeXM2?=
 =?utf-8?B?QWVzR2FQK1QzMGttTVk5d2FyeFhoVm8rNDRIbEhzZFNoS1NSSVE0aHVjTFQ3?=
 =?utf-8?B?ZFFGd2NSWjlmYkdyZmVRWmRKa0FJck92a2VTd1VQMlN6WFBPOFZVSlMvcHNY?=
 =?utf-8?B?U0dFNmtqbHhZNStVRmpUWG5xM2hoNHlaTDBxejBKZURUVGRFbGtUV1ZyU2hT?=
 =?utf-8?B?ZmVQWUlPYUwxVFlQaTJDOWVYYmVtZ05FcUM3ak82NURyOWxBUnYyQUhpSTBF?=
 =?utf-8?B?RDZ4QTRFdDhGb2ZVZm9SVTVzbWdoRmgwdENYUTYvdHN2c2dHci9JS1JaSGJZ?=
 =?utf-8?B?TDgrMUExSWY2RXl2WWtFOW44eG4wcVBRcDJXeVlXbXF1RTQ4b2hMSm1RT0Iz?=
 =?utf-8?B?K3hFMGE0c1FQbEo2a2tIT2U1N0dGa01RMS9lNm9TWUhHR0JoYVRwMVJzZ0h1?=
 =?utf-8?B?MkUyZWdKeElCK2hWL09vTDF5bkNCQ0dveTdpd2ZQSzNPU1dTSExSWlJudWJQ?=
 =?utf-8?B?cWd3a2Zsd1RydkgrQ1lCNkY3aTQ2c3dFeDVJM0I3MXZBRjNMZHFFNllGV2dG?=
 =?utf-8?B?TVpkakpBcWhEVHVUVm5KTEN4aUxWa2tCS3FTU3hyZ2lQZElPRDRCd0NGbng1?=
 =?utf-8?B?ZWNJRHlFRm05UC9Nc2RKS0JnU3UyczBEdnQ5TGpDU2hoS0UrS0dVMnlVdStz?=
 =?utf-8?B?cEF1N21EMWJYK3RJNjJTTnN1UTl2ckFPUzJQcDJVVUdVTUt6cGEyTTBmTHdH?=
 =?utf-8?B?NFRSbEFTOC95NnRHVUdVNFY5SnBqVGdXenlQeU0rYUtBM1JYYlhhalZiYnRh?=
 =?utf-8?B?TEh5eWVaTHdHYUpaZUtmZUdOTjJ4RlZBUmN5R3pTOTlyOUVyMDV4MWplMEU1?=
 =?utf-8?B?QmxoT3dLa1labVh0cUxFb21WeXpSUEk0bzdzNmxVZ21RV0RWaldwZmhrOC9q?=
 =?utf-8?B?YWlQOGJ2amlwVm9pU255K1ZhbEZML1RxWk9PWWp6WkVVTnBzOGUxVTk3a1dK?=
 =?utf-8?B?ZVQzOU8xK0xGM0ViRi9weTh5V0s2UVpjS09BdDVUWFFMZHRlVXNNZDZTS2E3?=
 =?utf-8?Q?t+s/3935DxPupirjSPZcz9o=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1089ec1-2367-45ce-2569-08dc1d8635fa
X-MS-Exchange-CrossTenant-AuthSource: PH0PR01MB7975.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 09:15:45.3108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ZmkyzdM708JAR0H6K6gGE5A5GfmI21MKylBnPCp/DDwobUWRA4cby4oJultOIYHrhN3Ai/6Ck047c7+uae7Fa08VQo7n4AYqY1zEIamwh0Afk1v0O4a5RhEY+CI7QV1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR01MB7104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_013115_505040_48DC0D28 
X-CRM114-Status: GOOD (  16.17  )
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

CuWcqCAyMDI0LzEvMjUgMTU6MzEsIE1pa2UgUmFwb3BvcnQg5YaZ6YGTOgo+IE9uIFdlZCwgSmFu
IDI0LCAyMDI0IGF0IDA5OjE5OjAwQU0gLTA4MDAsIExhbWV0ZXIsIENocmlzdG9waGVyIHdyb3Rl
Ogo+PiBPbiBUdWUsIDIzIEphbiAyMDI0LCBIdWFuZyBTaGlqaWUgd3JvdGU6Cj4+Cj4+PiBEdXJp
bmcgdGhlIGtlcm5lbCBib290aW5nLCB0aGUgZ2VuZXJpYyBjcHVfdG9fbm9kZSgpIGlzIGNhbGxl
ZCB0b28gZWFybHkgaW4KPj4+IGFybTY0LCBwb3dlcnBjIGFuZCByaXNjdiB3aGVuIENPTkZJR19O
VU1BIGlzIGVuYWJsZWQuCj4+Pgo+Pj4gRm9yIGFybTY0L3Bvd2VycGMvcmlzY3YsIHRoZXJlIGFy
ZSBhdCBsZWFzdCBmb3VyIHBsYWNlcyBpbiB0aGUgY29tbW9uIGNvZGUKPj4+IHdoZXJlIHRoZSBn
ZW5lcmljIGNwdV90b19ub2RlKCkgaXMgY2FsbGVkIGJlZm9yZSBpdCBpcyBpbml0aWFsaXplZDoK
Pj4+IAkgICAxLikgZWFybHlfdHJhY2VfaW5pdCgpICAgICAgICAgaW4ga2VybmVsL3RyYWNlL3Ry
YWNlLmMKPj4+IAkgICAyLikgc2NoZWRfaW5pdCgpICAgICAgICAgICAgICAgaW4ga2VybmVsL3Nj
aGVkL2NvcmUuYwo+Pj4gCSAgIDMuKSBpbml0X3NjaGVkX2ZhaXJfY2xhc3MoKSAgICBpbiBrZXJu
ZWwvc2NoZWQvZmFpci5jCj4+PiAJICAgNC4pIHdvcmtxdWV1ZV9pbml0X2Vhcmx5KCkgICAgIGlu
IGtlcm5lbC93b3JrcXVldWUuYwo+Pj4KPj4+IEluIG9yZGVyIHRvIGZpeCB0aGUgYnVnLCB0aGUg
cGF0Y2ggY2hhbmdlcyBnZW5lcmljIGNwdV90b19ub2RlIHRvCj4+PiBmdW5jdGlvbiBwb2ludGVy
LCBhbmQgZXhwb3J0IGl0IGZvciBrZXJuZWwgbW9kdWxlcy4KPj4+IEludHJvZHVjZSBzbXBfcHJl
cGFyZV9ib290X2NwdV9zdGFydCgpIHRvIHdyYXAgdGhlIG9yaWdpbmFsCj4+PiBzbXBfcHJlcGFy
ZV9ib290X2NwdSgpLCBhbmQgc2V0IGNwdV90b19ub2RlIHdpdGggZWFybHlfY3B1X3RvX25vZGUu
Cj4+PiBJbnRyb2R1Y2Ugc21wX3ByZXBhcmVfY3B1c19kb25lKCkgdG8gd3JhcCB0aGUgb3JpZ2lu
YWwgc21wX3ByZXBhcmVfY3B1cygpLAo+Pj4gYW5kIHNldCB0aGUgY3B1X3RvX25vZGUgdG8gZm9y
bWFsIF9jcHVfdG9fbm9kZSgpLgo+PiBXb3VsZCAgeW91IHBsZWFzZSBmaXggdGhpcyBjbGVhbmx5
IHdpdGhvdXQgYSBmdW5jdGlvbiBwb2ludGVyPwo+Pgo+PiBXaGF0IEkgdGhpbmsgbmVlZHMgdG8g
YmUgZG9uZSBpcyBhIHBhdGNoIHNlcmllcy4KPj4KPj4gMS4gSW5zdHJ1bWVudCBjcHVfdG9fbm9k
ZSBzbyB0aGF0IHNvbWUgd2FybmluZyBpcyBpc3N1ZWQgaWYgaXQgaXMgdXNlZCB0b28KPj4gZWFy
bHkuIFByZWxvYWRpbmcgdGhlIGFycmF5IHdpdGggTlVNQV9OT19OT0RFIHdvdWxkIGFsbG93IHVz
IHRvIGRvIHRoYXQuCj4+Cj4+IDIuIEltcGxlbWVudCBlYXJseV9jcHVfdG9fbm9kZSBvbiBwbGF0
Zm9ybXMgdGhhdCBjdXJyZW50bHkgZG8gbm90IGhhdmUgaXQuCj4+Cj4+IDMuIEEgc2VyaWVzIG9m
IHBhdGNoZXMgdGhhdCBmaXggZWFjaCBwbGFjZSB3aGVyZSBjcHVfdG9fbm9kZSBpcyB1c2VkIHRv
bwo+PiBlYXJseS4KCkZvciBzdGVwIDMsIEkgZmluZCBpdCBpdCBoYXJkIHRvIGNoYW5nZSB0aGUg
Y3B1X3RvX25vZGUoKSB0byAKZWFybHlfY3B1X3RvX25vZGUoKSBmb3IgZWFybHlfdHJhY2VfaW5p
dCgpLgoKSW4gZWFybHlfdHJhY2VfaW5pdCgpLCB0aGUgX19yaW5nX2J1ZmZlcl9hbGxvYygpIGNh
bGxzIHRoZSBjcHVfdG9fbm9kZSgpLgoKSW4gb3JkZXIgdG8gZml4IHRoZSBidWcsIHdlIHNob3Vs
ZCB1c2UgZWFybHlfY3B1X3RvX25vZGUoKSBmb3IgCl9fcmluZ19idWZmZXJfYWxsb2MoKS4KCkJ1
dCBfX3JpbmdfYnVmZmVyX2FsbG9jKCkgaXMgYWxzbyB1c2VkIGJ5IHRoZSBrZXJuZWwgYWZ0ZXIg
dGhlIGJvb3RpbmcgCmZpbmlzaGVkLgoKQWZ0ZXIgdGhlIGJvb3RpbmcgZmluaXNoZXMsIHdlIHNo
b3VsZCB1c2UgdGhlIGNwdV90b19ub2RlKCksIG5vdCB0aGUgCmVhcmx5X2NwdV90b19ub2RlKCku
Cgo+IEkgdGhpbmsgc3RlcCAzIGNhbiBiZSBzaW1wbGlmaWVkIHdpdGggYSBnZW5lcmljIGZ1bmN0
aW9uIHRoYXQgc2V0cwo+IHBlcl9jcHUobnVtYV9ub2RlKSB1c2luZyBlYXJseV9jcHVfdG9fbm9k
ZSgpLiBJdCBjYW4gYmUgY2FsbGVkIHJpZ2h0IGFmdGVyCj4gc2V0dXBfcGVyX2NwdV9hcmVhcygp
LgoKSSB0aGluayB0aGlzIG1ldGhvZCBtYXliZSBiZXR0ZXIuLgoKSSB3aWxsIHRyeSB0aGlzIHRv
by4KCgpUaGFua3MKCkh1YW5nIFNoaWppZQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
