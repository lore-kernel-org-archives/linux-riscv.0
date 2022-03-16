Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5B5C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 02:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BisD1SJBpRJGWXEztUUmkrMZF+icHlFwU9DdsrwzZCw=; b=QCrfPin767q18N
	nDQyvpbGdy86Jctngdt6SG7ZWbypKkJVv5vhIE/mIWi+ElK5F/MSJYRk0G6wm6v2O5KVtPitlvrQe
	Qh9CCxrVuNteJDJaxtfDC7Ji3cQwqv9bmGNBBQh9E/mi3KJdiCJ2W9U3RhqqeJ/08hfR4Jn8MZSSQ
	8cJecF11jcayXzl3ZrXsL7WwrbBcNFNkfOYd3vorPPMQZzolDl3KsOEuWy4nV0w/OsHC8QyJ9tSRF
	OV53u7bzC7mgFvUZj5G/TKzKyEwoGLMItLGRER3yMQnWYo8Du1GBgLZuzqvRXbg4v5F0PSIQpbK6m
	xcKN1hFX0LqsPDDMg6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUJgC-00BF2h-FH; Wed, 16 Mar 2022 02:46:28 +0000
Received: from mail-hk2apc01on0716.outbound.protection.outlook.com
 ([2a01:111:f400:febc::716]
 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUJfz-00BF03-6d; Wed, 16 Mar 2022 02:46:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5yw7aNRSylCiA6DpPZRfF37PnQb2DAN9NGKnKG1mqc98CkqolGvRXySGZTMA5bclAKZ7+7PxkdwRmaOkzC6GwChsDkhDN4oeZds+CUBSw/n2NLUBK+iz73AaL4rqNlJBtJUX68ZJOMSQndIqBeg5jmzHJMfDJYz29OnwLqWIVagBzAVCrVyusA+wSNRKQrU7eMNsF2BUslxQgO51arAGSs0i6Y5+dfTCgcXx4aM9wK8fIt9u0MeJEPfNBlm8WVV6G+FnG8as3gdnQ0vPymfe0RfJutHEcEWx1zzd8ZaUcASSEAXp7K33cz+uPsGXy7IEUpIjTQScOaA3fP2dXRWxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKkNbfnOyg3FhfqFf/NQB8AWtL77a+lwmLQWJWJzUZ4=;
 b=i+Ir7xODEN2FNs+QEWgfNGLcU3i9FUjKZ+Zl1UEyepWbVAQ4iU39ZTmbwfJOt8FSkV+4KhgY7FQuKDHZx6WOV7vrS95+2DxX1yPqACOOAzXKQG6PGnkSLYKk9AdgccvTdrxSY5N2Oe6Rq7InGz0i2iLERIky7bYgdCRjpjdWQL8KyfsvGSMUGN5Pg8bfx0xmyT6jvd/6X3lb49CregyQbAic1aX+HTzoIqdlOAq9Rl//9IDJDRxFzQuP2aM9Jta9kl5pJo1z2WGz0gcLwiKWQLZGbZVdhZbUagXJZ/ziG6pS7gUdW0zwpX2ag3hq1delENzbt7+MyPaLT46hW4wAmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKkNbfnOyg3FhfqFf/NQB8AWtL77a+lwmLQWJWJzUZ4=;
 b=Mmy8EB2y6qBK5SW68hhZ2i6FRM5Z9DhrenRFKY18j+w/cHp7TJ1qu0RmW2ug9B+GniNv9aEEUTsrjHQw/1ZE72wu79B8WzHl89XQDUvlJqCh0csZ/tT3tbZ7YnDQKizdCNDpFshCncB4U5pPlM4paFKh5WPkZYRkC/sdJF6+x6w=
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by PU1PR06MB2405.apcprd06.prod.outlook.com (2603:1096:803:3a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.25; Wed, 16 Mar
 2022 02:46:08 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::49ef:baa:8c3b:cb3d%5]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 02:46:07 +0000
From: =?gb2312?B?zfXH5g==?= <wangqing@vivo.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Sudeep Holla
 <sudeep.holla@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH] sched: dynamic config sd_flags if described in DT
Thread-Topic: [PATCH] sched: dynamic config sd_flags if described in DT
Thread-Index: AQHYOEKbopUZOeviIUquO7ORmgh/j6zAsP6AgACNF0w=
Date: Wed, 16 Mar 2022 02:46:06 +0000
Message-ID: <SL2PR06MB3082DBB58303601F73FB77D3BD119@SL2PR06MB3082.apcprd06.prod.outlook.com>
References: <1647331137-69890-1-git-send-email-wangqing@vivo.com>
 <68df2f49-9b74-7ea2-0178-be55824b3c89@arm.com>
In-Reply-To: <68df2f49-9b74-7ea2-0178-be55824b3c89@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 430b6062-2583-2789-d5fd-84283918e278
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1796665a-4a20-4161-2ede-08da06f71f5d
x-ms-traffictypediagnostic: PU1PR06MB2405:EE_
x-microsoft-antispam-prvs: <PU1PR06MB2405997404BF49944932CE8FBD119@PU1PR06MB2405.apcprd06.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dvkLHkySdtWvb7lZKjyeOYzh3+LtUmsGX/RZL9WoskOw8GUfYHqibDph6HBMHgA6L1XHnSykeuK5B9wpboFpHMrR3EdafH8rqZrPfWSfAnDBZqqIR2WKrdvDvUfLVBg8K2Fge7f93drZQv76AnrAfAIhWtUYUEiGs6Qf4WKrmQgELEvQEbzrUxoKr8NYzuqPV4DmnaXTeM/tvZSMlu8sY+aPnar+BkwEJp9KNGiqWtVDS5VkkQNZwugPg5fqNwMQPZLYtQkTV3GLgg/qVktxLSG1fR9TipNOIzwxo+UpkIvTtXpkPV0gXKaQG3nvQeN/yiGaLfzQoAf8483BSWaTqjEAHbKzKcCoWdJoyq6w3iZ8SuyHzlCkBcMn11RNXPvdLVGpArTr/2bFdwaOJq2crvjKe95hGYt101Q/xoGhyL9uEzNTflXnBTNywLcOUfi5WocTP6lErJWDZg4IWTiy9KRbVW2v0lvU8kAnHcNHStuxMMn7i32ziejdKeKR0QjRyjI5+6cXUhaSqwslWFCMhSvK7RfLAmSyUlOaN0FNS0qfCEppSRrRpe0FguhCMCJSrqZB0CPpbB4/4mpNvZGmvchZC9SN2jYvM/LGrWpe82QnzGd37b5H8frrm3R4qMHiJe8xQxZccLkpZassnZzDcMEKG+R5NA+U+w4Z+llN6fEN3cNhdJ9xm3Bd7a9/jePoG+8V63Zkn4HBQsPXgWy9V/w4qPtxW0MN6XsauLQOnWDV8H0n4HfaxsvNk9fyt/rCA6BCST0Bk2tYjXdFWAeDstsvBvmwe731KLWA3LoXks6Iv+hx+hFgwDlGVAqbeVvZ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(66946007)(64756008)(45080400002)(38070700005)(66556008)(91956017)(76116006)(6506007)(66446008)(7696005)(66476007)(9686003)(86362001)(110136005)(508600001)(316002)(26005)(186003)(38100700002)(83380400001)(921005)(7416002)(122000001)(33656002)(8936002)(5660300002)(52536014)(55016003)(85182001)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?LzN6aFljaWZnYzc3WVRMZDYya1ZicEJVN0YvRjZCYlRSTkV2d3JCNjRyYk1R?=
 =?gb2312?B?U05OZXdFZVZSRUd6YWFtSGVnWkJqQnlzMWM2ek5tUjRHZUVyMUQ2YmcrekF2?=
 =?gb2312?B?WUNDTEVoZ2ZkMzg5bVJSWHJLczhpa3VUcURXYW8vU0Yvb1pPTlc0WVVDcGNn?=
 =?gb2312?B?UzR0TUoyYUVlSlgvOVhHK0hzM0N2MWRIQ2sxalpkeTlXSTRFNHN5WDNZbjZq?=
 =?gb2312?B?clBLUmR2S20rWEVScmtmS1h1K21ZK3dTd2p2TzZreWZwelp1SUFxVW94ZEs3?=
 =?gb2312?B?dW9JczJWK2ZUbnFlMjJLL3JyZDdEOThqZE5hRldLS0pqQ0xEUDdPMzR3Znkz?=
 =?gb2312?B?MW1UQkMzV1NPeFlnL3Y2UWo4azArenNrWDhXM3Nvck92K05QU09jQXlQMnhL?=
 =?gb2312?B?aG1xNW5iUnJnbjNtWFRPRzN5aUhpTlRzNk85T1Z4Q2hzMkRrbmR5RGp3b3BU?=
 =?gb2312?B?UUYxRlJ5Rm1qZDJ4Q25BYzF3UXJXVXZrdzFnVVQ0Tlp6RDV6Y1h2azFiSW9I?=
 =?gb2312?B?NzF3WUZIVnJFd0RLRkhkUVlVWFZyOFRKaTlpeHlIUkNETXRKK0NSOGdSbldq?=
 =?gb2312?B?VFJ6bnpIQkp0V3pkejdqSnpBMmtsWXRlc2Z5Q3FtVTdrM2h4UkM1UWtGUnpj?=
 =?gb2312?B?Q1lXTVhndU9Kdm8vdWFMelg4TFhqYzhhTCtVRTdiYS9SUVl1cXl2d1Y5SmtG?=
 =?gb2312?B?LzN0Z1NVQmJST1lDaFBBWDFyMjlJWm56NnMrS1FVNHIxK3J0OW1vRmYzMThx?=
 =?gb2312?B?TzloTktZVVF4cG1xa01EM3oxZVhpMjFDMnBrcG5WK0hWOHVvTk9Xd1RGUEtp?=
 =?gb2312?B?UUgrU2dLMWNkYU5yb29tYmltOHJuZEg2WUN5VllxclVXWWpmTEY0c3A1ajAr?=
 =?gb2312?B?dVB6eEZySWJiL1V0bG9KY0xYZFBuRWFkSjdZd3Noa1JoZFE4Tm1yVGJWVXpG?=
 =?gb2312?B?cjczcVE1NjU0SDY2a25uZUJ6NENtZjJPdW5iN1IvQnp0dUpPWDZ1MHFicVRm?=
 =?gb2312?B?QW8rUjNGeVBnYmVTUkkvZ1ptWUlFY0Ywc0hsb2xPeTZkTlBoQ3FiUjQ3NWdi?=
 =?gb2312?B?YlVmZnVzNVVEQnAwZTk2ajRRejFUNExKbW1DRVJVSWFOblRwS3RNNDlUOUpj?=
 =?gb2312?B?aVF4NHJSWm1abXBYb2g2bWlGVlRTWFlrS3VlTTJwZXhBR3pJOU5RSFAzOG9m?=
 =?gb2312?B?Si8vRFh1bzlVR21JV25IOTF0V2NLNU5BWHN3bWUxU29FUXg4cWJvSGNBQmpx?=
 =?gb2312?B?ZmZBOFNqaUN5NGxRRXpsYkxnZ1ZaOHY3MXhJTGkvV2JzN1Z6MTNpbzFSdnFo?=
 =?gb2312?B?YVRWVWVqNSt0citpOEtHMHVMTFJVcC96WW9ORm5rY05aMXcvR1gzSm9BcjB1?=
 =?gb2312?B?bzI1MVBqM09QRHdEb1YxSU9oaEs5WWl6OFVDeUVIc0kzM2ozQXlZdUw0N0ZF?=
 =?gb2312?B?TXVvcDZaWUNOdXR6QUNsc200Z0d3OEhJRmNXUk4rNlhEenF1L3JWcDJIZVph?=
 =?gb2312?B?S3VIMjdsSzlqQVZ3VndwTUovaDBYa2JWSDZqbnZNeHkvOFBtK2JVaHdrS2Vl?=
 =?gb2312?B?bnNnTkZBSlFsOHJoR1pqNU5QdmN1dnR1STBmSTQ3VDBsNHRxVnNid0V4Vzdp?=
 =?gb2312?B?c1lSb21XcXNScUNxWDJlVUZoWTJUaHBOcDluQnNiTmVidXh3VXNvT0x6RW1t?=
 =?gb2312?B?NjlqckFrQ2tXdHBkMG9Ic0s0dzYvLzc5YjN5eXk5Ti9XaUptaHVUaUpySk9o?=
 =?gb2312?B?em9zOGlPR0FoaWl4eDdMMzF6SnBBSXc0cGtqMStZOHB6UkZhWFc0aysvdTJP?=
 =?gb2312?B?UXJRUnk3MUd5TUkwb0VDclgydjlSdjhGanBEQWtTUGd1L0lPNUZXT3VrSjVO?=
 =?gb2312?B?NGZVdEZKZzBtVm5KU0FSTkhsMTFjQkxERVlnU2t1SDArZDNSa2VNZEZSeHB6?=
 =?gb2312?Q?/u6TQW/VhLs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1796665a-4a20-4161-2ede-08da06f71f5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2022 02:46:06.5955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D9gp6zu1fAYylmHXONFmAWH1t27g9bstDMwNpGkHh5tv1iS8YWNiys7WtNnM0vqD/1GaX6KMw5Fd8W1MZoFQnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2405
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_194615_353101_AFDDC044 
X-CRM114-Status: GOOD (  15.46  )
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


>(1) Can you share more information about your CPU topology?
>
>I guess it is a single DSU (DynamIQ Shared Unit) ARMv9 system with 8
>CPUs? So L3 spans over [CPU0..CPU7].
>
>You also mentioned complexes. Am I right in assuming that [CPU0..CPU3]
>are Cortex-A510 cores where each 2 CPUs share a complex?
>
>What kind of uarch are the CPUs in [CPU4..CPU7]? Are they Cortex-A510's
>as well? I'm not sure after reading your email:

Yes, Android systems are currently used default_domain with wrong sd_flags, 
take Qualcomm SM8450 as an example, the CPU and cache topology(1+3+4):
|                           DSU                            |
|           cluster0         |       cluster1     |cluster2|
| core0  core1  core2  core3 |  core4 core5 core6 | core7  |
|   complex0  |   complex1   |  ------------------------   |
|   L2 cache  |   L2 cache   |   L2  |  L2 |  L2  |   L2   |
|                         L3 cache                         |

The sched domain now:
DIE[0-7]  (no SD_SHARE_PKG_RESOURCES)
MC[0-3][4-6][7] (SD_SHARE_PKG_RESOURCES)

The sched domain should be:
DIE[0-7]  (SD_SHARE_PKG_RESOURCES)
MC[0-3][4-6][7] (no SD_SHARE_PKG_RESOURCES)
*CLS[0-1][2-3](SD_SHARE_PKG_RESOURCES)

>https://lkml.kernel.org/r/SL2PR06MB30828CF9FF2879AFC9DC53D2BD0C9@SL2PR06MB3082.apcprd06.prod.outlook.com
>
>You might run into the issue that individual CPUs of your system see a
>different SD hierarchy in case that [CPU4..CPU7] aren't Cortex-A510's,
>i.e. CPUs not sharing complexes.
>
>(2) Related to your MC Sched Domain (SD) layer:
>
>If you have a single DSU ARMv9 system, then in Linux kernel mainline you
>shouldn't have sub-clustering of [CPU0..CPU3] and [CPU4...CPU7].
>
>I.e. the cpu-map entry in your dts file should only list cores, not
>clusters.

But in fact we will, as mentioned above.
>
>I know that in Android the cluster entries are used to sub-group
>different uarch CPUs in an asymmetric CPU capacity system (a.k.a. Arm
>DynamIQ and Phantom domains) but this is eclipsing the true L3 (LLC)
>information and is not "supported" (in the sense of "used") in mainline.
>
>But I have a hard time to see what [CPU0..CPU3] or [CPU4..CPU7] are
>shareing in your system.

They share L3 cache, but no share L2 which only shared within complex.
>
>(3) Why do you want this different SD hierarchy?
>
>I assume in mainline your system will have a single SD which is MC (w/o
>the Phantom domain approach from Android).
>
>You mentioned cpus_share_cache(). Or is it the extra SD level which
>changes the behaviour of CFS load-balancing? I'm just wondering since
>EAS wouldn't be affected here. I'm sure I can understand this better
>once we know more about your CPU topology.

What I want to do is :
1.Config the right sd_llc to sd, better to get it dynamically from DT
2.Benefit from the shared cache(L2) of the complex
i.e. when we look for sibling idle CPU, prior select the L2 shared CPU(inner complex) if L3 is all shared.

Thanks,
Wang
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
