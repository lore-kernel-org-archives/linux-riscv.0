Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5E7E706FD
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 09:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XYGO54Gvyz90G2NSd39Qnft3yDwp4PR8Z7LY/BHCqRM=; b=q0jEahUDvQtxcQ
	4LweKLshtY6HmeW/rrqUaxIHxe6PMIbB17FJkTQYUgAuu1CIuhToA5+iFrB2P+ohx9E1Aj3Sx7bzt
	GhLS1VwIQMK4on0qSm95zhCUz+5prFTJ/WM10bJs9yj/KHwG2kMeEev0jgz/1Ncc4q7obbvPddXvE
	tGEXzuBBuADhZCwOyOVfvW7V99ZylM7dN/Xr8jbvEoBKsOt3ed5wLf1dUl+NK4wz7nsF6d6M4sJ6G
	/Luynnc7r3Ye/m0si/c/wgj+2PQjmmIXmktixYxfW6Uo3oqs3S0IU4Vj63/uyzM509DHmNT5+wobq
	b1gqUBJKbwgOU3dZNPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGEn-005ctU-1v;
	Thu, 21 Sep 2023 09:44:45 +0000
Received: from mail-bn8nam12olkn2081c.outbound.protection.outlook.com ([2a01:111:f400:fe5b::81c] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGEl-005crh-2G
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 09:44:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPyTuReoe9xC2viRXM5uL7VaI2xzuuEx0zCHgberTckpfqu/Gc/gKRFG5Pgd4Nu8wyGNKgeu1zV6cvtO7ASwDrktUQHZ/HWdxNR67UH02SIpQepEqiI2tgpNjOVsOJZOjONM/Xgmeq6RAlnh8wGxb+uwd/DWfK33wOUFCnfjqbHT6UH+8yBepN3UDHOgZ9GAyEK3R++B5+uaWsNLHAt6CTrc20JFWRdAUkjUL3mNkKxEyGl7jTGFRmuL11m9lK9TpwG8gvr34c/QmOGXpJUmMQ4Mw753Zm3S9ypXYRU2aBK9c7WRBQMZejBo3zOmZP1dMtLUDJHth9cSXAQUzM805A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYutl9vK1DRDRt15L/te9PG5kD2S4eot4HyRakzupWg=;
 b=Cl8ByfPyrqUBLc6MQMa+/x9lWwiak/4Me7XcNIJ7Q1eslJaBq5K6ff50kDkNCBNwhGjkDQ19H4LVi0cj/oEbpcqBR+ZO18E30Bp77IFNWk3oIsgP7Op5+BklX7VFS/3GI8Ifg9X8v80XkTTkt8SvM7NTaudMREIIEvIQPZmeM9kA+lVEEZ3GBYWFjfvM+2etk2C5J6zXebRoeZhWzHvVOt+qP+TzZxF5MvmP4lP5M7kSuaUrcmVW4Gbb4I0b4k1mRAa5PhtUBNX7AMf9U36ypIliYtda2RYiq4I9TlP6izcqEpPMHHZwhh8gZ4rjZrYzxT6chVU1SVldwKYsNPhuqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYutl9vK1DRDRt15L/te9PG5kD2S4eot4HyRakzupWg=;
 b=Bal9nqpA3iCW/BAzdwakjyyW0FYi0uzv713mIwbE+J7yJbPxQbeLsn54pw10YU9TzJKakEk1+1yPIp16FCBqs9FuXWj0V/U/65RhQKKuxOQhs3C5QinBXJ2OvlfOZefKEMpk02Yy6nTUurQ3ce0vgapIGXWWVpUsJY2Ok8GCPX8MvATONaq6IKVNLJ3/uQbawXq5zcGjC9L93db+ByzTRS7Nn/ezLXBhDbG4jmtFEeESnk2hYMsevPEwlbjZ+MX4qpOunOEM0F8NVdOSCTByiYvkGw4lu6ji9LCuDT+W2faEGLn1CMLtr8upvi9R4l5OMPt1H3bdsX8lXEbRsIZ1Zw==
Received: from IA1PR20MB4953.namprd20.prod.outlook.com (2603:10b6:208:3af::19)
 by MW6PR20MB6696.namprd20.prod.outlook.com (2603:10b6:303:23f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 09:44:38 +0000
Received: from IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263]) by IA1PR20MB4953.namprd20.prod.outlook.com
 ([fe80::d050:882f:a8a7:8263%5]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 09:44:38 +0000
From: Inochi Amaoto <inochiama@outlook.com>
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	evicetree@vger.kernel.org,
	emil.renner.berthing@canonical.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com,
	Chen Wang <wangchen20@iscas.ac.cn>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 06/11] dt-bindings: timer: Add Sophgo sg2042 clint
Date: Thu, 21 Sep 2023 17:44:36 +0800
Message-ID: <IA1PR20MB495308CB0FB87B445B9C6AF3BBF8A@IA1PR20MB4953.namprd20.prod.outlook.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230921-dbfb0a62538cc54852ad45b4@fedora>
References: <20230921-dbfb0a62538cc54852ad45b4@fedora>
X-TMN: [mF2wGrZS0ABxuChNgA+tFG65IKmj3DnCRmyWKbeTyug=]
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To IA1PR20MB4953.namprd20.prod.outlook.com
 (2603:10b6:208:3af::19)
X-Microsoft-Original-Message-ID: <20230921094436.130290-1-inochiama@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR20MB4953:EE_|MW6PR20MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: d78aa50f-8d6b-4cfe-4db9-08dbba875f12
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XMczxQUuKJq496cFVWyS9fgcVx3y49G3jDYawJM1t4a9cb41iegI7Ch26KhVu5dRKDrgn0ZiZ7PySUUwHZhgaEKLQL5gw7zuwuLq+FxJL46NpLmIF3pjBylrVp9QzpP4G2ERCEMTUta0rfsxS9sWZ4o82dGRYvLDh7AMGRhLj2fnitAvTBdMv0r5BjwQUQtreTtiwZ7i3UwsPAHZwBALM+mTjv4HnGulYhxLbd5GqCZmxJewHVl3PwivkoJy1DMiQ25p3O2Sl/hHJfMndz6q4FppuH0hRPuOirpAhqSnPz6e2cMveXj/3m+ptOqGAYJ14mNmcBEkFyBh/YIP/Zs6VkPtfJUlhlrc383MVdOkyS42GkmTfPIaYSxwI4PVsUzEIrEVF5lYtQJHq/328bIl0Bcq+IBRQ0ZWBWZwX4GULViLamwtwIEXJdUJLAAtshCK2DWcp+iJmo4+DcykgQcQ0QQEGd5wUrLsK/M/xIxclCDKuXEmrG0gjATGpWXdQdQvpPL7k867o1qwSp30DUNlEsvs9bOgUBX5CjJw1OawhCUQvAT9Sjm3+XUCCj3oHN8XW265Ln+FDxw6odZlRpgabAF2CQndRtN84ETsiUdcYDv29UMhY4A6kDvmumL3mEII
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QtvYGISuYwNAO8rGNHv89ezc1cil7ERpbN2ZPyPV7ptz7gpAfuje/kFSIsDF?=
 =?us-ascii?Q?aRO7tf12WjgvUBKaJ/8n339rojiv1m1Yt5dQIeW03hPafsAvA6HAtPOu1V21?=
 =?us-ascii?Q?VjhyUUrVo8Ru83EIEk/w3pr4kOt0rckehiK7LMAIp2LHrfAZTB7qiaamSYSE?=
 =?us-ascii?Q?hYhQgwqIZSym8sJlufql8JgAIeGMPOK0lae0do+j+WwZeuI8XITKBXJ4su+a?=
 =?us-ascii?Q?TKyHqGgT5R6UwbJPCdx/S7VF4ueW2z0GUcMPmlMGbKYbpHC1N2bnLZKpW1WI?=
 =?us-ascii?Q?PHSwYQSCCAFfWUCFhbe11S7Hh3hLfSAfpCjpXY//Oj8Hq7UmCfXGJQlpheWo?=
 =?us-ascii?Q?NqebO5+DSln8/hQRaB7FSE3V4h3T44StshF5ZM83hdpC9ycmbSoVfqZ6sE9H?=
 =?us-ascii?Q?MpcFSC+xCpyeQV96WlaOnzRNRkL41mJZE5kI+bHRvccuQ5e2GsC76f2W4a3f?=
 =?us-ascii?Q?fYOMwhBZq4wzA+SFXpRYg/Vndt9BnrZlXCd3QqPzcEJhe42BKvep/KdwAiyB?=
 =?us-ascii?Q?2r2q90y57FEBwMZe/76oQadxQNP8FVK7HZmlPHga1oat9zX3z3+aq7NXoTv7?=
 =?us-ascii?Q?VNVWY7J4gncHADilOVn8t2rNQ4cdg0ZJYx2LQ2oBLzxh4AIhv+mxz6BP8iRN?=
 =?us-ascii?Q?YV59xMwxKaRkSUwaCTPttNUIVVp+p2+AL49FSdjKK4wwqNYW9JBIVnsEwbhO?=
 =?us-ascii?Q?B6VgWKMYUawrQnnRm+6J49y8kIIQUNCqzgM26P3AqnIjm7RKcp6vfzChyHgo?=
 =?us-ascii?Q?7vXBTrEUw65rQ3ObIgz6JJqSeZrGHwUNu2KO81qwZfPLB+9wpQJ2jPhUaH2s?=
 =?us-ascii?Q?k/qI5Eoik5OL7hzrwzlYCdZCU6l85tNmgOXzryzd+USQzKhPAJ90aJDq0xXy?=
 =?us-ascii?Q?pO6SX4KGJHSpTZkCJGLJwkiyq//cnWiv8TwppSjPWfjK2SduYnjZyPG94CgQ?=
 =?us-ascii?Q?4ta0CHJVg/tNp4z6fu2mOTEaC3COvjnwv7zzMTQcJzJgCKSy3EVbPHEwpaOD?=
 =?us-ascii?Q?RR7SCD8Yk9Z421CCkFNeKEz6c/ssBPPDilFSYA82Y31DzxiSl+dfVd+ypGdA?=
 =?us-ascii?Q?MCh70oa6wWlHiQSv0cPL5tTj3CDV+40idr9e4lRcrrHtqQwynFHcaYQZKToC?=
 =?us-ascii?Q?PYN3nVJuV0ULKWC9Xcj/QzqNTAggrl4ynCEfOYgYDturvvGwAk0ndVB/oYYR?=
 =?us-ascii?Q?kemjHViMXpVb1OKS6iKLSi0x6E7lqXrGVv9O1JA2hX9Aan1ObnuGq96meGc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78aa50f-8d6b-4cfe-4db9-08dbba875f12
X-MS-Exchange-CrossTenant-AuthSource: IA1PR20MB4953.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 09:44:38.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR20MB6696
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_024443_780475_69B65BB0 
X-CRM114-Status: GOOD (  20.05  )
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

>Yo,
>
>On Thu, Sep 21, 2023 at 04:18:57PM +0800, Inochi Amaoto wrote:
>>> On Thu, Sep 21, 2023 at 08:43:47AM +0800, Inochi Amaoto wrote:
>
>>>>>>>> but not one. In another word, there is no need to defined mtimer and ipi
>>>>>>>> device on the same base address.
>>>>>>>
>>>>>>> There's also no need to have two compatibles for the same interrupt
>>>>>>> controller, so I do not get this reasoning. What actually _requires_
>>>>>>> them to be split?
>>>>>>>
>>>>>>
>>>>>> Yes, it is one, but can be mapped into different address. So I think we
>>>>>> need two.
>>>>>
>>>>> Not two compatibles though, just two memory addresses that you need to
>>>>> locate (or maybe even 3, for SSWI?)
>>>>>
>>>>
>>>> We may need four (mtime, mtimecmp, mswi, sswi) if use register range.
>>>
>>> Why would you need 4? The first two certainly could be individual
>>> reg entries, no?
>>>
>>
>> After reading the aclint doc again, I found the all of them can be mapped
>> on the different address. (See the section 2.1 in that doc).
>
>Right, that's what I meant by individual reg entries. If there's some
>dynamic gap between them, then one reg entry would cover mtime and one
>would cover the base of the mtimecmp region.
>

Thanks.

>> But for now,
>> the mtime and mtimecmp have the same base address in any platform.
>
>How? The mtimecmp base address would have to be offset from the mtime
>base address. Is what you mean that, for example, mtime is at an offset
>of 0x0 from the base address & mtimecmp0 is at, for example, an offset
>of 0x8 so a single reg entry can cover both?
>

I mean "the same" is just what you said: use the offset to access mtime
and mtimecmp, and left one register range in the DT.
In your example, using a offset of 0x4 to mark the mtimecmp will allow us
to use one register range like DTs already in the riscv arch. But this way
does have problems when the timer is more complex.
In fact, I think two register range could do better, and will give us
more freedom to cover these regs.

>Also, "any platform"? I figure you mean in this one specific platform?
>

I mean the platforms already upstreamed in both of kernel and OpenSBI.
Not for this one.

>> Anyway,
>> the frozen spec in future will decided how many ranges we need.
>
>Isn't the spec abandoned? There may well be no frozen spec.
>

I guess it is. That is not a good thing.

>>>> Anyway, I will use a vendor spec implementation as a temporary solution.
>>>> I hope this will be corrected in a predictable future, and we can use a
>>>> standard way to resolve this at that time. :)
>>>
>>> If the spec doesn't get frozen, there'll not be a standard way merged.
>>> Hopefully not too many others go off an implement non-frozen specs, and
>>> we will not really need to worry all that much about it.
>
>Cheers,
>Conor.
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
