Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74D4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 17:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LG5QWrSXOd56tW/azDBRtmH9vNGJHr6mOHWzcIkeEBQ=; b=1VPJap05JFLJDJoN39qh4EbwdW
	xYhIGb7x7Kx3FgGrTI16Y0MievPNIEako03k4/kb7KcbnQf+sWRFoOyiEWmWaQrLozr25xJXcsw8J
	CGTQGs79Ft3aiTJsogBKrJ+Qk7QRcVKUIl1jZtpGwY4QJscQwxUAsGxEfphTXRCIwwt/AJwl/KjEy
	j3xBA6bZzdK533zbgfX3lt4gRMTvoTlZCmLwMmrR9jZrePLx156F4aEK21bR7JzEv9Rxb2g2KFUxR
	ds6CdksDUvjiFfNBCdW29aZ2uRfQC55aIpC3SB2cfG9x6B1C92fvovntHRDgrJTCYmKbTbN1J7Qwe
	WGRuGAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngrql-005OvH-Dx; Tue, 19 Apr 2022 17:41:15 +0000
Received: from mail-mw2nam10on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::601]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngrfa-005JmT-T1
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 17:29:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJEvH4x5dne1CNrYWys7+o6RrlwkvaeoGRxaNHQuilMuGEZNkr9eGlwcAfihsMPHddEAHXA4h8qFj4X+rwPZOtYk9A5olbNNET/LfUPlfmSB2Xw5pmf0KRucRkI32Gp7+lZpkRswYya+S3v94TCqYRXnwOmr+BTOqmybVp20L3TffFpuvbMCf/b3jyKNf8KC6dWpjfsdDa6had861Cr7PzfVz2y5CbPpfeYZKP6C8BrFpqW7SZEz0T9LLf/ofw6MFJj+//lQ5JIbiDgSFoj5oEHyk6eP8RNtWumrBoJ0GoVteiTOJi19M8tBbQ2dUsiIG7Wiy7+/+KpBNgh97T/q8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i6MqCf3WEp+GFEKB/YyJl0kqC3qVPOiNo57Pdyv1zQ8=;
 b=kNa3AS4A2XdhtZoQCco1W+kcqwCyvBAHCuc1+IdAjUwOFuQ+KC2ys8m1Ff6FxmgkNtAcU23zwe3tv66XN2fBiMPfhmPXxb/FlJ2BTm7kDqjRWRwxz28I1bfaeNhC9Wml3FI0S64FXS0TyPB5OM5tEnRxVEt19bbvIbDB3pMMNhV/5Lc8VJZcuPyIHKtWgAMynCrB4Rjcmd5Cm8OwPlVzPU2cbtBY9el3d2BUi6Az+/8K/SL7f+Th0LFNGfJXF46zuJfsn5kNML9EmQ52yRXkbko5T2mSf5mRMeF/5MH7Es7VkmhAW3c80rXKXnXO0krEXpa6pumShGUKK88cDIfUGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i6MqCf3WEp+GFEKB/YyJl0kqC3qVPOiNo57Pdyv1zQ8=;
 b=oNIvopeG1j5SrEvkMnIdFnzdoL5oMZbVY5K4nItGX9hc9T8WEUaE1VPgZV83A2Ppkq2RdDXCOsRSeeYLJjXhrRCSJgvdFSbRfeDZ03zgmWT2rnGU4OeR+SlKEwPotXnuSiaH+0Gy6ryWRWdxONt7W1MqBgtTaLGoSTBB9juv8Fqah617zRbNrGaAyABkwfF8Ts+xucf9Bg85bTObbsNIZ2obVCSoZdh5TnjuSw9g0sSz30dbjRwXYJZxr+URloJRz2yNY7xaW9Y+37T1Fx/4acwFv/VrjlbYTdPYiw8uGrqQAMZMED2gpKFljjOuKhCveOR/H+GJ8SiuA56046ihAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3437.namprd12.prod.outlook.com (2603:10b6:208:c3::20)
 by MW2PR12MB2410.namprd12.prod.outlook.com (2603:10b6:907:f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 17:13:50 +0000
Received: from MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::18b1:f463:cb9b:82f0]) by MN2PR12MB3437.namprd12.prod.outlook.com
 ([fe80::18b1:f463:cb9b:82f0%6]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 17:13:50 +0000
Message-ID: <3e6713ef-5109-25b7-1359-7229fce368dd@nvidia.com>
Date: Tue, 19 Apr 2022 13:13:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 0/3] riscv: atomic: Optimize AMO instructions usage
Content-Language: en-US
To: Andrea Parri <parri.andrea@gmail.com>, Guo Ren <guoren@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
 "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
References: <20220412034957.1481088-1-guoren@kernel.org>
 <YlbwOG46mCR8Q5tJ@tardis>
 <CAJF2gTRws6RqKmJHBdKsycWSkFgYna_MocJ+qp3Z9r1v7mQzsg@mail.gmail.com>
 <20220418234137.GA444607@anparri>
From: Dan Lustig <dlustig@nvidia.com>
In-Reply-To: <20220418234137.GA444607@anparri>
X-ClientProxiedBy: MN2PR01CA0039.prod.exchangelabs.com (2603:10b6:208:23f::8)
 To MN2PR12MB3437.namprd12.prod.outlook.com
 (2603:10b6:208:c3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10affc09-1dc0-4cbb-48a2-08da2227f914
X-MS-TrafficTypeDiagnostic: MW2PR12MB2410:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB2410B1541232936D5C2E9FA7DCF29@MW2PR12MB2410.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ti3jrnykKiwK/BJ1BEFgTUdaMP7mPV5+95UDi/gGQ2TIGAdgtkqfBmqPyA4Ob7DHvW7pkjtNIuzLf/Q4xS+KcND6E3CkIxKpehOXBJ+NaZ/JPellrJIhOJfGG9CscK5IUOBewn/s3zkRFRMR7zXmkLK9NwfLvUgt+BNgBGKIbcD1TDU7xqcW6Fv+jjLGMmKs7MeHb/buqLDlF7Lk1nLe2VzgKzFMbUZauVlbYdZqmAvPtsAXMeWfkU+/iHD3+04fhxT9+GRT8s/pTedI2Bo6809gMDOGc1mW1lOE6JiwFOPT++UKMVOnK8iuIZTvpmYsfR1vmZHuNKRR1uU7BPbYPgUIC+jeb94j1/YnA08+chaww4ZnjBPFMToW48vY6/+BdOf+sFtYkp31qRZiqMdp2RM8C1GZbs5LRDmLfAG40gZssonblCSVvtNpXYgn3z1kEhaF6Hm5Avxz+w50k9lbNRR2xQHqmKZw70jmWo/IbOW2Qvn2l9ZPSrhazGfG3Rns87BAPW3Y5Z2Q8iWB4V6hW6w8AiRTF5JhqJQrgr93Y1ATH/JRiB1yhts78cbVX3sMWbhjzStoqBgCojgCmC37piyHHwS9UJWH2ttNgiCLSXmcqr+yiH8KPL81E06GrVZ7ogjizwxoFughQd28f+g1v7n/oXU0AFTIEO2MUAC+OGE4DJd9aVrB62AhGzFnHeKiDxeCQJli8II5hHYGM6GStrEDtJYljOak5fLZKRVFBpZYcbhfcvmkabLgaN13683zuNTcx5Qy5uTct3mPIQ14QdyylSUqVPZuiKCx6D7cqcUcdI6qYBRyGLZiB2rLkKeHE7NfCU2NHKnHYy8Jbr/AdHnzVN5PD3zJny/tLoFalSY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3437.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(66476007)(110136005)(26005)(6512007)(186003)(5660300002)(6486002)(8676002)(66946007)(966005)(4326008)(508600001)(31696002)(86362001)(316002)(7416002)(4744005)(66556008)(38100700002)(6666004)(6506007)(54906003)(31686004)(36756003)(83380400001)(2906002)(8936002)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0pGM0h4U1ZtYjZGWC9SeTZlUnh5MG5zZ1hyRnVKM0l5ZnRRWlpaQWR5VTFk?=
 =?utf-8?B?bnhwWWdUbW80YWNrUlV6MG55bkFZaTN2c3JZYVVLV2NaeEdwQzQwczRGNkZT?=
 =?utf-8?B?bGpJbkVDcmRMemlrZ0dBcHgzeHM3by9KdTFGcWRaNEdtTGRpQTFNaXFONmI5?=
 =?utf-8?B?bnE4Z2VKRm1WNmlVK01naU85eXU1cnE4dUUzam9mcHBCRHNGdGdIcFRaK2dF?=
 =?utf-8?B?RHI0MlQyRXRiNy90UEU5WFh6RHovNVU1ai8xTjc0NEZoSHBMazRwc29BdVMr?=
 =?utf-8?B?ZWZJVzdpdEJhQW9mY1VBNW9HcVQzMWxvNlM2S0RTNFJWdW9hVlRVeXhvSUdC?=
 =?utf-8?B?emVJdHFxdHd0ams0aSt4MWJTL2F3MVREQllaWnBCMEErbklkL1c0UHhjQ3Bk?=
 =?utf-8?B?UVBoRHBKSTQyNDE5RE5FOGc1VXhqd3BSSkN6TTFzR25IYlEzclVCU2NCbkE4?=
 =?utf-8?B?bVNvWFp1dWlNWGdWVUlqOFZwdXFCa0VDNWNzR0FoZzJuOUJETytGM3l2Z0tG?=
 =?utf-8?B?VXBnSTdjYnQ4ZE1nN3pRTHkwd3FJZTd6RTQ3Rng2U2ZzaENGWE52U3BVaXVK?=
 =?utf-8?B?YkVCTEFVYlJkVXN3R2dMV2U3dFJlelBkaHpFRHYrYjdzZ0FobjJrbVpCcnk1?=
 =?utf-8?B?U0JqVXRzVThmVml5amx3b2pQalBqTlMrN3ZsbWJubm5TT2RydHBrRU14N0xp?=
 =?utf-8?B?aHQ1cElJaktLZ0pRZnJtbXhkWGJhTnNvUXJQdG5rSUN6V0QvRTMvU3F6REQ1?=
 =?utf-8?B?SEVsZjJEeVRBMFlhN2ZrSS82dndKTnBUaEkxWDd3NnRIdzVYNklsaVY3SFNp?=
 =?utf-8?B?R0lCSDFLMWZvc1FzR2gxUCtGNnFnS3R3ckJBK2h3N1Q4Y05NWnhpeXgxakVz?=
 =?utf-8?B?SnIxTW9MMXpaRklDY0k3L1V0RFhhR0I5MnpzNHhhUjFSZW5qWmJQV3RzQ3RJ?=
 =?utf-8?B?T2ozSDhhMG5wbTlXZXUzdHBLUXlKd2NHcDVCWDV6SzhtR0JvUDlGSmFzUnV6?=
 =?utf-8?B?VzJlWVdqUkl4Rm9OMmVVSXh6djJLZ0ZpNmtJdE5vbjRGY3NxY1NCTXFXdjkv?=
 =?utf-8?B?ZHdZaDJ2ekU3ZFRRRUJIb1JzU2ZPZ1dScy9ITFNrNEZkc0tDNWc3SEhCVlRE?=
 =?utf-8?B?ZzBtdHo3N0IxVGpESTY3VG4wL3VYSndZcGprRU85OVptQkw1SzFwY1F0R2x6?=
 =?utf-8?B?bk1idWUwSitQWWw3ZnBuakpnekhUckJWT0xDMm5tMUNQRTROVXdMT0ZFczRo?=
 =?utf-8?B?MlZ0cUNuVXc4akhQd3V1TWFyVGhHY0VYd2U3V05tQkNYSkFsVzYySi84ODgy?=
 =?utf-8?B?cjdlWjhkR1RiWEpSdVlCMDNFT0FYRTFsd0MwbGJjMWpZM3dFWTVpWFR1cjY1?=
 =?utf-8?B?WUpyU2s4VGdEcFJyZVJHQ2Zwcm1pbWRhSm5YSFU0NGFxSGovS0tseWV3L0tS?=
 =?utf-8?B?azJTSlVEbkVRYXpVcTdvTjhOaFlkWGFVV0YxcHRTRW9IRE5QRDZ5ckdrN3BY?=
 =?utf-8?B?REdnQWcwQ1ZDWGt6K2QzdGxQMWExWlNacDU3d1kvU1czRHVObU1WNllKOUEv?=
 =?utf-8?B?OUdOUFpGZGF3RDJ2TUpBSlZkN0hla3VLNHQ3V2FvdWx3eDR5eUdVQ1FjcEdm?=
 =?utf-8?B?RXpSblB4TkFCaE1JSFdXQnBrelZqZmRqTXFkOWJkbHh4OGkvUEVqUXUvNm5i?=
 =?utf-8?B?aER6aGVkcFJKWGgvOVJpSndCMzkxaVkySXBtK2hHOHdWMzl3aXZSSm1YaWp2?=
 =?utf-8?B?U1NrekRyRjVKR2JWVC96RWV2dWpyS0F6ZUpLeURUSUs2M3o5TUNXYTZMYnlW?=
 =?utf-8?B?ZXhZc3p5VERlN2JnRlBveDdETnFxU2FMckQ5TlpjU00vS1UvZkNubFhFMUE3?=
 =?utf-8?B?aHBCUVlsZTl5OEJUbkRxSU8vS0lYbkwvemtpcENYZmIwNVlHRW1Ba2c4WmdG?=
 =?utf-8?B?MXhKVDF6NzZYRk56UlREdmorWHFGOFltL05IY2JjUjlkS2FKYnY3NEw3Y08z?=
 =?utf-8?B?UGcrL0ZrMDgrWGlvaVBmNnJPL3FRZmhVa09aRGkvbzRXNFRWYmpYcWdYc2hP?=
 =?utf-8?B?QjdzTWdvaC9sUVVzV015ZlY5TTM2MlZ1dUZibGlURW1heWFnV1hjVDBxQThY?=
 =?utf-8?B?ZHZkOFh0L00vSjhPUFM2Nld4ZjhWa0hDRTIvZmcwMTZjTnpuaGc5Q3Y0eitV?=
 =?utf-8?B?aE5RWUlNZlJyT2RQc3RDWVJsK0pMQ1ByVzVoYU4xd3p2Q1NmakR4MzU0c1hG?=
 =?utf-8?B?WW1tTHZIYUpPbXhNZDRveCtyeWd4YS9XY0RaampKSEtaQlljcEtiaGFYTEdJ?=
 =?utf-8?B?Y0VFVnRKQm80a2F2OVVHMnlTSDFxK1J3eHFIN2M0L0s0MlVCeFJtdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10affc09-1dc0-4cbb-48a2-08da2227f914
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3437.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 17:13:50.5521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68Y6mG91z1hidQ+dcESEFmi7gh9g0CyCNTOFCckQyCov9QJpwMWzdlwdKqASPpx2sxWcVsVKlj1LFkoZ7dWMwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2410
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_102943_007266_B70E6CCC 
X-CRM114-Status: UNSURE (   8.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNC8xOC8yMDIyIDc6NDEgUE0sIEFuZHJlYSBQYXJyaSB3cm90ZToKPj4+IFNlZW1zIHRvIG1l
IHRoYXQgeW91IGFyZSBiYXNpY2FsbHkgcmV2ZXJ0aW5nIDVjZTZjMWYzNTM1Zgo+Pj4gKCJyaXNj
di9hdG9taWM6IFN0cmVuZ3RoZW4gaW1wbGVtZW50YXRpb25zIHdpdGggZmVuY2VzIikuIFRoYXQg
Y29tbWl0Cj4+PiBmaXhlZCBhbiBtZW1vcnkgb3JkZXJpbmcgaXNzdWUsIGNvdWxkIHlvdSBleHBs
YWluIHdoeSB0aGUgaXNzdWUgbm8KPj4+IGxvbmdlciBuZWVkcyBhIGZpeD8KPj4KPj4gSSdtIG5v
dCByZXZlcnRpbmcgdGhlIHByaW9yIHBhdGNoLCBqdXN0IG9wdGltaXppbmcgaXQuCj4+Cj4+IElu
IFJJU0MtViDigJxB4oCdIFN0YW5kYXJkIEV4dGVuc2lvbiBmb3IgQXRvbWljIEluc3RydWN0aW9u
cyBzcGVjLCBpdCBzYWlkOgo+IAo+IFdpdGggcmVmZXJlbmNlIHRvIHRoZSBSSVNDLVYgaGVyZCBz
cGVjaWZpY2F0aW9uIGF0Ogo+IAo+ICAgaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlz
YS1tYW51YWwuZ2l0Cj4gCj4gdGhlIGlzc3VlLCBiZXR0ZXIsIGxyLXNjLWFxcmwtcGFpci12cy1m
dWxsLWJhcnJpZXIgc2VlbXMgdG8gX25vIGxvbmdlcl8KPiBuZWVkIGEgZml4IHNpbmNlIGNvbW1p
dDoKPiAKPiAgIDAzYTVlNzIyZmMwZiAoIlVwZGF0ZXMgdG8gdGhlIG1lbW9yeSBjb25zaXN0ZW5j
eSBtb2RlbCBzcGVjIikKPiAKPiAoaGVyZSBhIHRlbXBsYXRlLCB0byBkb3VibGUgY2hlY2s6Cj4g
Cj4gICBodHRwczovL2dpdGh1Yi5jb20vbGl0bXVzLXRlc3RzL2xpdG11cy10ZXN0cy1yaXNjdi9i
bG9iL21hc3Rlci90ZXN0cy9ub24tbWl4ZWQtc2l6ZS9IQU5EL0xSLVNDLU5PVC1GRU5DRS5saXRt
dXMgKQo+IAo+IEkgZGVmZXIgdG8gRGFuaWVsL290aGVycyBmb3IgYSAiYmktc2VjdGlvbiIgb2Yg
dGhlIHByb3NlIHNwZWNpZmljYXRpb24uCj4gOy0pCgpXaGF0IGlzIHRoZSBxdWVzdGlvbiBleGFj
dGx5PwoKRGFuCgo+IAo+ICAgQW5kcmVhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
