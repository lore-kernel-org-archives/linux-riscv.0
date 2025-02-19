Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58925C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:Cc:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/riDsy88SMzZG0jYTJeIG3xUFipUNdyfWhm0X0PiPLo=; b=cpit8VIau+Ben+XlkHJygrXqSj
	FQ04ihFB2s2qydjffPpInJNfrlYf0ya7lMDDHX2suNsarTCfTEM1UhAVuUawNuAfvc4uJvIv/49jo
	3GRnFOjm79mcVACUgXQw/U1AA7b3/ctAsvhgnV/KbTCz8c2AFxEpEEb8JXPMSaiw1mFsJS5keyil/
	Is1NQ3ru+0LuuuHMAaN0ZtpSrMRYed0zQ4yIlCUJdd90h7XSTMLaDF/bCPj06NaC0v+n/Qz3QI04o
	mtEwdRuTc9AIaAI6cd84Z9HMc/ru1+H5Vx5CD3mGs4gRSLoRqud2k/FrFMhy1dYIPGcZ10adT6yLw
	/mLuvdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoXR-0000000EHMZ-2HZN;
	Wed, 19 Feb 2025 18:11:13 +0000
Received: from mail-co1nam11on2062a.outbound.protection.outlook.com ([2a01:111:f403:2416::62a] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tknZI-0000000E0wy-2ssR;
	Wed, 19 Feb 2025 17:09:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VhEdIPwfVVwAv8rljE8SxK8GW9KWf0SLx+k1Yn8U8cDXV8zeGOUUU5tiNKVjgg1im51ajVrsgK1lw5HDQ7ApHqBRc2gSG8qUMLqoQlqyRffnEoj8mXBqmoGzJLMDQQCa6zaSekZvP3CqkGX2gPWdtVB1hT+bAAwHeDDONArQwRjyPcFlweGRVtPi/+Qqx3IogTAMBg8jwqvJnwyKWF1h8vEKv+txXbtm7R7sNSpHxRM41zO22FUXtvJgBD23CQuImxa2KUG2xq13ddf/IXJg/okpgJQR+ijxU+ReYVS1DQr8XrcuXPwZoCapH8VGBrgafh8ZDp/kcWwHuDoraIGd2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a71Dy6govVGCK2C4BT/D2qhMEQcwf3/MOIxsWp/NsjE=;
 b=ZyNNOM9ElvZfPFNfglEQUOLEegGiaH0XlWpv0OZPZQ1Sc6pvMYswZhpVwv80xJ8mjSIBNb/k45oJK8AOjVtPrah5tH4PF6LHFREP2MgdmYv8sEXM5KGmLK8jsuMq7algEPRCagJ9wMMIoQazxHPd8Jvrpp+8B1rqa1pdBgAGLGG8l8BJ9v7crWkZafi84w6x/B9445QOc9X0raz37WXC+hS5moRF9OFAfZH1aSIoLrZ7TSOsCwXrF4ulnOu8FKeecs2oJ3CLITctkeu20TqnlL68CzS00uQxbT4644000YHBS6NanS15d/lC4xS5N3KkVyfirIXXyd2RG4JIatEOrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a71Dy6govVGCK2C4BT/D2qhMEQcwf3/MOIxsWp/NsjE=;
 b=PcIAafatks0d49krke/tF/+jeCas3jCRsBx7ZdOOv99wpQS3m7JPCMdX6AeZcmSmd6M5OqFtJycPBC3rAKhQ/pBItJ3vIiGxMy8IjORfam7Lr0RvGAWJExJ+b8utfvQ3HW5pJRBSD6KSTBsCqme/JQ3FyiHLru7hOL4w48kttrDYwYbvZNB4qzpxVsuKsLkEwBU1P9Hmkzgi6DlW395Es/7/MJKBGP7zpBBHcFhp7kk1Uf59UkIMbgKJ7z63TRAFu+XTHgJ76TGBE93owMAb7QCq3cvg1MvXH7+to3aOWvZK+cDWnvohzJmegzgq9DAaDxBwAQuhpCn2aQ4SkrbD7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB8791.namprd12.prod.outlook.com (2603:10b6:806:32a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 17:08:58 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 17:08:58 +0000
Message-ID: <adcf012e-57ef-4b54-8b19-2273aca41ec6@nvidia.com>
Date: Wed, 19 Feb 2025 12:08:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Juergen Gross <jgross@suse.com>,
 Ajay Kaher <ajay.kaher@broadcom.com>,
 Alexey Makhalov <alexey.amakhalov@broadcom.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "Liang, Kan" <kan.liang@linux.intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Frederic Weisbecker <frederic@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>,
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang1211@gmail.com>,
 Juri Lelli <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>,
 Yair Podemsky <ypodemsk@redhat.com>, Tomas Glozar <tglozar@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Kees Cook <kees@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@infradead.org>, Shuah Khan <shuah@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Yosry Ahmed <yosryahmed@google.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 Jinghao Jia <jinghao7@illinois.edu>, Luis Chamberlain <mcgrof@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Tiezhu Yang <yangtiezhu@loongson.cn>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmhzfjpfkky.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <20250219145302.GA480110@joelnvbox>
 <xhsmhecztj4c9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <xhsmhecztj4c9.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-ClientProxiedBy: BN9PR03CA0508.namprd03.prod.outlook.com
 (2603:10b6:408:130::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB8791:EE_
X-MS-Office365-Filtering-Correlation-Id: 36a04553-16df-484a-fc0e-08dd51081954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eTNROEVvZVFZU21NZ3RVS2lMaFNFN09ZUjVnZlZkWG1WL2QybGxkNzNqNzRC?=
 =?utf-8?B?UjlwVkFYS29uQU9sM1BzSlVaWk5kdWJZYWNKK2xwL1BhYUV0RThGVVBvOWly?=
 =?utf-8?B?WjgxbEEreit4aDJQSEx5VG5YMEh2aHpVU3FTK3JKZGZ1a1RDWFA5QTIwTzdy?=
 =?utf-8?B?d2w0eklQTnBUQkhwRHN0QWxCZTd1TFRTWlJCbUVKdDJnN1dwbzRyanFaSW9X?=
 =?utf-8?B?cUlxWlIzdUZUdHU1dlQ4MU5YQStLRE9CK3BtdGZzZG9TTXhxVFJLUzg5TGRm?=
 =?utf-8?B?cWFBeGJrLzEyL2FlSDU0TVZGdlpIYitCS2RlWCt5L0I4VXQ2VW5TY243UVZh?=
 =?utf-8?B?dFF5VlpWdTkwN0U4Qzc1MStEMkV2cnUvM29MNldnK25DazNkZ3RXYm5nOVAv?=
 =?utf-8?B?TjBhbHphUWhlR0YxRm5kV0VIMXRaMUNoUHJjWENpMjUvQmo4S2xOelRqaFkv?=
 =?utf-8?B?dnhqWlZ2QW9CYXZtTHVyWmR5a0hkeVAyVE1Bdm4rZlRYSGUyZndndTJheEQ0?=
 =?utf-8?B?MFRGamNjU0hISDcxSW5YZllsdEM1NktUdG9SZnFxT2t2ZG9MUzVyL1J2WlU3?=
 =?utf-8?B?WkZFYkxzY3lSNEdqLzFjaXZZWlk2OHlVZ1dkTm5nZzluSHZHZWc2Mkk2NXpH?=
 =?utf-8?B?TkFCcEZ1TldVaWtrNnZ3TlJrWDhkTkpLeG9tYTBSaVpydSt5c2lTVHAxeUg1?=
 =?utf-8?B?N2hUc2JWZ24rakw1L1RsZlZDVHVzeEs4c1c1MDk2Z0lTSEQybjh4OE1CRytp?=
 =?utf-8?B?S0NPSXJIQjJiaTFrSUJmQ29NaC84WXlwQ1ZTbTVXYXdhRmVTVGpVR0NnRk1q?=
 =?utf-8?B?WFBPb2RWMlZUWDlWTWwydUZkaTZuc2JhZjRuWkpOM0J4RzhyckdUUWNGYm5B?=
 =?utf-8?B?VXZFWkUxK3Z4WDQzNkJidWlDTHdHSWRscHBsR0NsZ25MWi9IZmY5bkxkQzhF?=
 =?utf-8?B?QW9hcGd2SDNxTVFSWlBRZnJZekNwZVVZd3cvdzg1aTlTVHViM0U3RkJiR0xy?=
 =?utf-8?B?SEcyY1VYaW9YN0R1R0VNaHlZb01WTjhxcitQUkFLbk9wL1VhUkF4MUVCc2N3?=
 =?utf-8?B?UjdSdFR4RHMwbjk3RlZveG5HcVMwZGxuMUYybVc0ZTBYU0Z4OVRGN255T0dK?=
 =?utf-8?B?OTB6Mjd5T1pnRk9mWFlHN0lsR0swc3FsL1BsZTZmUkg2MHU0cjZJMVZnTVl0?=
 =?utf-8?B?QXBwSDhkWFNSVklhUzlYZEVtMEN3ZWF0ZHFSNVhUZmY0bVpXV3M2RXVJR2ds?=
 =?utf-8?B?aG15Qk5yK2FCZlFhWUxnaUNuYmVYKzY4R3UyVmMzT1lRL3dSeXJMWU12SmlX?=
 =?utf-8?B?M3ZGSGZLMTdnZTJ0eVNrWUpqa3ppY21WK0Z5UXdsTkFQSk8vVGxVZFNXN0Yy?=
 =?utf-8?B?TW15ZSsraHlFZ2lWSmVFT0JHbVR0Y3lVVmpNMmRFVmFDN2R0emRHYWdNUDJl?=
 =?utf-8?B?NElwcXZWRjJjREQxL05sWFVZejA3cWN0WVhka2Y3bkd0c2lUZkpmZ0JuYnJt?=
 =?utf-8?B?RFYya21sL1hVOHAySFFxWWxDdTJXWllJblRXb3N1SU14MTZNcndXYmgwMFRy?=
 =?utf-8?B?aUNIQ1R6MktvMG9XOUdGTnBGOForSXlrSWRSTmNyaDJUMm9mU3JzelVhYi9u?=
 =?utf-8?B?d3hPaS93Ym1CZXluQ0NRNUkyOURPbDBHTjhKcnNDRjlGOHBqajdtNk5FRGVU?=
 =?utf-8?B?WW5qSkNZVG5md1hGNGEwVHhIKzREUnVWOHh2RXZEQjN0bEpiZVhOV0NPeVV0?=
 =?utf-8?B?NDk0OHJLS3ZHYVZwb1FxUzFtVjJMMGlpbnNhVnRDVmk4YUowMGFIQVk4ODRu?=
 =?utf-8?B?cjliVzlud3JvWVhrZUUwTm01bXh1cFJwR2FKTDJYWk9zb3dxVkFKQmRObDdk?=
 =?utf-8?Q?QK2simDBBEOC0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S09NWnJEbEZxTVZYemVXN1lxNGFGbjMreUhlWW5sdSs4VmQzR25ZemM5MGpk?=
 =?utf-8?B?dnljRjg1azhEKytSZkg4eFRLYVJsbXNxcjRPZXdRRnhEczVyYTNJay8wSFZa?=
 =?utf-8?B?cXV5Q2EyeFVQc0VLMXJkOVlOV3BiWFFYUkgrdHdxbTRZc2V3aDdZbER5a3Jo?=
 =?utf-8?B?RSt3ZVcyM0x5aWNMZm1HaHNNcGU3ZFNEM0xBSzFmUEtQS1hEU0dOYk5GNUto?=
 =?utf-8?B?ZzIwaS9xajBVK0dKQTU5aERiamVGTVFWdUpKWWZEMVJ0VWZJemVzcmZHN25k?=
 =?utf-8?B?TlNNZnAxYUNmcDlFblhjMUpSUnRITHBWZ1cwSXlsTXYwZnViUWhQcjQ1N3pT?=
 =?utf-8?B?S2tkZjl2aGIxMk1PZlFQZngwa2FxWkl5L1kzNjh5Nm42UU5wU2wxQnhYLy9v?=
 =?utf-8?B?ZTdUT2pxWkQwTDg2S3M3WWRFaGUyRlF4aE82d0ZqTWY5Rmhkc1hHZnhHVEJE?=
 =?utf-8?B?WmNJSGRpOXduNnRBeVI2RTYyb2ZPUDVsRE04Rkp4L2xxV0ZVRi93b2h1QURi?=
 =?utf-8?B?ZUFLWEJwR2FzdHAwZEVRa2o2TUJkL1NWZjJZMEFua2VFMkFsQy80bVBVN21Z?=
 =?utf-8?B?K0hQRis4UEJ4M1dNSGRlSFI5M29UM2VqcExFMFFXOENjbkFaN0kzeEFVd0tO?=
 =?utf-8?B?Y1JLMWZSWWppc1BkZmtGdVNxL0VOZmlNdWZlampoM0ZhNURCeU1BOFZ4OGli?=
 =?utf-8?B?eUQvVjRaYkRRbGxGM3NLRytoaTNpWWE2MmExdkFEQkk1RVp1MitxSndPM3Rv?=
 =?utf-8?B?eUIvSWF5S0d2c1VDNTdBbGp1RkgxTnoxUm56ZWJVaEdEVFYxSmZmV3F5aiti?=
 =?utf-8?B?RERVT2xzTnZhVG9RaGh6NjVCVlFPd0hHckhybzR2QmRTMzZOcllzZ09vanlw?=
 =?utf-8?B?T2dGck1jYkZWSzNJQ0lFZzVudnBDY200eGxpTi9uQUlyeXJZWFJIRVBWVVBH?=
 =?utf-8?B?a3JMSlNhTEo3NjdwYWlsMVVvRkZvSkdOMHMyakVGVzU4aXVtZnFCRWVVdzBZ?=
 =?utf-8?B?WHRWNVpaaFRZZDZuR21DUEM5c2tzUzE4Nklwa0FRN0E2ckd6YmhWK09OdHFk?=
 =?utf-8?B?bFh0NnZpSDkzZWFGakRHeURZUkNsVVhiRzhaZWtnTFo5aC8xSGJ1OVdIdW5j?=
 =?utf-8?B?VWdpZ0hhcVcwSFY2YjRaTUJ5TWN6MjBGSzFhRDJiaStjdGdqanZwYWF3eFYx?=
 =?utf-8?B?Y0NQUjNxN2Z3dWZGUTQyYzdGUkFLUXU5VTRoYXRxcHFuTGVOK3hSMVdEcS83?=
 =?utf-8?B?dzUxUS82T1pCWDg1WkZQSG5WN2pxbS91SWpMelZIT0MvMGF1NU9oSjZuMXhR?=
 =?utf-8?B?K2JMWDBSaTJEVlNKQlovK2l1M09sV2pZNzZpM1NubDdSSmNMcFRkWGNtZlRV?=
 =?utf-8?B?OEVreTRtZVNIVTc1OE9nay9aSkYxV0NiUGxKZjNkR0hYN1VLMUtuVzJWZ3E4?=
 =?utf-8?B?Q3NRRFRycXpGOGtYNm9VeXdJQVFKdUdNd1FJVkQ3dGtjaWs4cndNckVPYkNt?=
 =?utf-8?B?dzI5T3RaNzZFc0ZVQk1ZY1VLYThMcWgrVkkrRkFwYjhDTFZqQVZiaWhWdkdo?=
 =?utf-8?B?SDd3a1JPdHM4MWFJcGNjMXdzVzBQVXRuVHVCY29Fa2VBSzlTQW1nUWhSTHZT?=
 =?utf-8?B?Ymh2dHBYR1MxTFY3dmF1YysyOHM1eWt0WkxUaUpoVW9yVUdaei9ZNFdQWXdp?=
 =?utf-8?B?VWZET0YvWmwyOUY1WVV4ekg5alFsQmZGeTVtZ1AwM2lhSjhvcVNFR0N5UThS?=
 =?utf-8?B?VkgrNHBEd0NTaUZnRjk2VHlZRFpiSTEvK3U2ZGZZc1Y5RVo3dFRyREZyV1Uy?=
 =?utf-8?B?dUlhWTZDTm1HRXdXaitkODlBVnpMT2d0dWpUUnVDbmhtTGNGQXE4RXJLTGhX?=
 =?utf-8?B?VWROUTloQytWcERsaXVlb2srLzVqMlppajNyK2F4UUZLWGxQMWJmbXM2NlFG?=
 =?utf-8?B?L2M0K1A1UTRhdlBad1RYNEZBdFZDcGZ1RUhMZGFoT3BXNnBGRU8rSEx0bFJP?=
 =?utf-8?B?K0V2eGRBQlFialVhRTdVenZYNjkwMTl4WmRQUE42cnEzZWI4b245R0tlbnlq?=
 =?utf-8?B?ekRUL25ZRk82aitQb1BrLzB3bm05OHN0UE8yYS9Rdi81bDFrZlhpKzNDV3ps?=
 =?utf-8?Q?bxxoboLhp81jX5XyI3OZ92N8h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36a04553-16df-484a-fc0e-08dd51081954
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 17:08:58.5442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CtOCbLN5mBwxeNT2wo6/ysIHFlRbIu1bJHIYLN+BTf6uBnYzMazev/cV31RgYeIC7NTsOki1riW1f1/ghuRh1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_090904_772109_1BED42AB 
X-CRM114-Status: GOOD (  16.28  )
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

CgpPbiAyLzE5LzIwMjUgMTE6MTggQU0sIFZhbGVudGluIFNjaG5laWRlciB3cm90ZToKPiBPbiAx
OS8wMi8yNSAxMDowNSwgSm9lbCBGZXJuYW5kZXMgd3JvdGU6Cj4+IE9uIEZyaSwgSmFuIDE3LCAy
MDI1IGF0IDA1OjUzOjMzUE0gKzAxMDAsIFZhbGVudGluIFNjaG5laWRlciB3cm90ZToKPj4+IE9u
IDE3LzAxLzI1IDE2OjUyLCBKYW5uIEhvcm4gd3JvdGU6Cj4+Pj4gT24gRnJpLCBKYW4gMTcsIDIw
MjUgYXQgNDoyNeKAr1BNIFZhbGVudGluIFNjaG5laWRlciA8dnNjaG5laWRAcmVkaGF0LmNvbT4g
d3JvdGU6Cj4+Pj4+IE9uIDE0LzAxLzI1IDE5OjE2LCBKYW5uIEhvcm4gd3JvdGU6Cj4+Pj4+PiBP
biBUdWUsIEphbiAxNCwgMjAyNSBhdCA2OjUx4oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2No
bmVpZEByZWRoYXQuY29tPiB3cm90ZToKPj4+Pj4+PiB2dW5tYXAoKSdzIGlzc3VlZCBmcm9tIGhv
dXNla2VlcGluZyBDUFVzIGFyZSBhIHJlbGF0aXZlbHkgY29tbW9uIHNvdXJjZSBvZgo+Pj4+Pj4+
IGludGVyZmVyZW5jZSBmb3IgaXNvbGF0ZWQgTk9IWl9GVUxMIENQVXMsIGFzIHRoZXkgYXJlIGhp
dCBieSB0aGUKPj4+Pj4+PiBmbHVzaF90bGJfa2VybmVsX3JhbmdlKCkgSVBJcy4KPj4+Pj4+Pgo+
Pj4+Pj4+IEdpdmVuIHRoYXQgQ1BVcyBleGVjdXRpbmcgaW4gdXNlcnNwYWNlIGRvIG5vdCBhY2Nl
c3MgZGF0YSBpbiB0aGUgdm1hbGxvYwo+Pj4+Pj4+IHJhbmdlLCB0aGVzZSBJUElzIGNvdWxkIGJl
IGRlZmVycmVkIHVudGlsIHRoZWlyIG5leHQga2VybmVsIGVudHJ5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4g
RGVmZXJyYWwgdnMgZWFybHkgZW50cnkgZGFuZ2VyIHpvbmUKPj4+Pj4+PiA9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+Pj4+Pj4+Cj4+Pj4+Pj4gVGhpcyByZXF1aXJlcyBhIGd1
YXJhbnRlZSB0aGF0IG5vdGhpbmcgaW4gdGhlIHZtYWxsb2MgcmFuZ2UgY2FuIGJlIHZ1bm1hcCdk
Cj4+Pj4+Pj4gYW5kIHRoZW4gYWNjZXNzZWQgaW4gZWFybHkgZW50cnkgY29kZS4KPj4+Pj4+Cj4+
Pj4+PiBJbiBvdGhlciB3b3JkcywgaXQgbmVlZHMgYSBndWFyYW50ZWUgdGhhdCBubyB2bWFsbG9j
IGFsbG9jYXRpb25zIHRoYXQKPj4+Pj4+IGhhdmUgYmVlbiBjcmVhdGVkIGluIHRoZSB2bWFsbG9j
IHJlZ2lvbiB3aGlsZSB0aGUgQ1BVIHdhcyBpZGxlIGNhbgo+Pj4+Pj4gdGhlbiBiZSBhY2Nlc3Nl
ZCBkdXJpbmcgZWFybHkgZW50cnksIHJpZ2h0Pwo+Pj4+Pgo+Pj4+PiBJJ20gbm90IHN1cmUgaWYg
dGhhdCB3b3VsZCBiZSBhIHByb2JsZW0gKG5vdCBhbiBtbSBleHBlcnQsIHBsZWFzZSBkbwo+Pj4+
PiBjb3JyZWN0IG1lKSAtIGxvb2tpbmcgYXQgdm1hcF9wYWdlc19yYW5nZSgpLCBmbHVzaF9jYWNo
ZV92bWFwKCkgaXNuJ3QKPj4+Pj4gZGVmZXJyZWQgYW55d2F5Lgo+Pj4+Cj4+Pj4gZmx1c2hfY2Fj
aGVfdm1hcCgpIGlzIGFib3V0IHN0dWZmIGxpa2UgZmx1c2hpbmcgZGF0YSBjYWNoZXMgb24KPj4+
PiBhcmNoaXRlY3R1cmVzIHdpdGggdmlydHVhbGx5IGluZGV4ZWQgY2FjaGVzOyB0aGF0IGRvZXNu
J3QgZG8gVExCCj4+Pj4gbWFpbnRlbmFuY2UuIFdoZW4geW91IGxvb2sgZm9yIGl0cyBkZWZpbml0
aW9uIG9uIHg4NiBvciBhcm02NCwgeW91J2xsCj4+Pj4gc2VlIHRoYXQgdGhleSB1c2UgdGhlIGdl
bmVyaWMgaW1wbGVtZW50YXRpb24gd2hpY2ggaXMgc2ltcGx5IGFuIGVtcHR5Cj4+Pj4gaW5saW5l
IGZ1bmN0aW9uLgo+Pj4+Cj4+Pj4+IFNvIGFmdGVyIHZtYXBwaW5nIHNvbWV0aGluZywgSSB3b3Vs
ZG4ndCBleHBlY3QgaXNvbGF0ZWQgQ1BVcyB0byBoYXZlCj4+Pj4+IGludmFsaWQgVExCIGVudHJp
ZXMgZm9yIHRoZSBuZXdseSB2bWFwcGVkIHBhZ2UuCj4+Pj4+Cj4+Pj4+IEhvd2V2ZXIsIHVwb24g
dnVubWFwJ2luZyBzb21ldGhpbmcsIHRoZSBUTEIgZmx1c2ggaXMgZGVmZXJyZWQsIGFuZCB0aHVz
Cj4+Pj4+IHN0YWxlIFRMQiBlbnRyaWVzIGNhbiBhbmQgd2lsbCByZW1haW4gb24gaXNvbGF0ZWQg
Q1BVcywgdXAgdW50aWwgdGhleQo+Pj4+PiBleGVjdXRlIHRoZSBkZWZlcnJlZCBmbHVzaCB0aGVt
c2VsdmVzIChJT1cgZm9yIHRoZSBlbnRpcmUgZHVyYXRpb24gb2YgdGhlCj4+Pj4+ICJkYW5nZXIg
em9uZSIpLgo+Pj4+Pgo+Pj4+PiBEb2VzIHRoYXQgbWFrZSBzZW5zZT8KPj4+Pgo+Pj4+IFRoZSBk
ZXNpZ24gaWRlYSB3cnQgVExCIGZsdXNoZXMgaW4gdGhlIHZtYXAgY29kZSBpcyB0aGF0IHlvdSBk
b24ndCBkbwo+Pj4+IFRMQiBmbHVzaGVzIHdoZW4geW91IHVubWFwIHN0dWZmIG9yIHdoZW4geW91
IG1hcCBzdHVmZiwgYmVjYXVzZSBkb2luZwo+Pj4+IFRMQiBmbHVzaGVzIGFjcm9zcyB0aGUgZW50
aXJlIHN5c3RlbSBvbiBldmVyeSB2bWFwL3Z1bm1hcCB3b3VsZCBiZSBhCj4+Pj4gYml0IGNvc3Rs
eTsgaW5zdGVhZCB5b3UganVzdCBkbyBiYXRjaGVkIFRMQiBmbHVzaGVzIGluIGJldHdlZW4sIGlu
Cj4+Pj4gX19wdXJnZV92bWFwX2FyZWFfbGF6eSgpLgo+Pj4+Cj4+Pj4gSW4gb3RoZXIgd29yZHMs
IHRoZSBiYXNpYyBpZGVhIGlzIHRoYXQgeW91IGNhbiBrZWVwIGNhbGxpbmcgdm1hcCgpIGFuZAo+
Pj4+IHZ1bm1hcCgpIGEgYnVuY2ggb2YgdGltZXMgd2l0aG91dCBldmVyIGRvaW5nIFRMQiBmbHVz
aGVzIHVudGlsIHlvdSBydW4KPj4+PiBvdXQgb2YgdmlydHVhbCBtZW1vcnkgaW4gdGhlIHZtYXAg
cmVnaW9uOyB0aGVuIHlvdSBkbyBvbmUgYmlnIFRMQgo+Pj4+IGZsdXNoLCBhbmQgYWZ0ZXJ3YXJk
cyB5b3UgY2FuIHJldXNlIHRoZSBmcmVlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBmb3IKPj4+PiBu
ZXcgYWxsb2NhdGlvbnMgYWdhaW4uCj4+Pj4KPj4+PiBTbyBpZiB5b3UgImRlZmVyIiB0aGF0IGJh
dGNoZWQgVExCIGZsdXNoIGZvciBDUFVzIHRoYXQgYXJlIG5vdAo+Pj4+IGN1cnJlbnRseSBydW5u
aW5nIGluIHRoZSBrZXJuZWwsIEkgdGhpbmsgdGhlIGNvbnNlcXVlbmNlIGlzIHRoYXQgdGhvc2UK
Pj4+PiBDUFVzIG1heSBlbmQgdXAgd2l0aCBpbmNvaGVyZW50IFRMQiBzdGF0ZSBhZnRlciBhIHJl
YWxsb2NhdGlvbiBvZiB0aGUKPj4+PiB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuCj4+Pj4KPj4+Cj4+
PiBBaCwgZ290Y2hhLCB0aGFuayB5b3UgZm9yIGxheWluZyB0aGlzIG91dCEgSW4gd2hpY2ggY2Fz
ZSB5ZXMsIGFueSB2bWFsbG9jCj4+PiB0aGF0IG9jY3VycmVkIHdoaWxlIGFuIGlzb2xhdGVkIENQ
VSB3YXMgTk9IWi1GVUxMIGNhbiBiZSBhbiBpc3N1ZSBpZiBzYWlkCj4+PiBDUFUgYWNjZXNzZXMg
aXQgZHVyaW5nIGVhcmx5IGVudHJ5Owo+Pgo+PiBTbyB0aGUgaXNzdWUgaXM6Cj4+Cj4+IENQVTE6
IHVubWFwcGVzIHZtYWxsb2MgcGFnZSBYIHdoaWNoIHdhcyBwcmV2aW91c2x5IG1hcHBlZCB0byBw
aHlzaWNhbCBwYWdlCj4+IFAxLgo+Pgo+PiBDUFUyOiBkb2VzIGEgd2hvbGUgYnVuY2ggb2Ygdm1h
bGxvYyBhbmQgdmZyZWUgZXZlbnR1YWxseSBjcm9zc2luZyBzb21lIGxhenkKPj4gdGhyZXNob2xk
IGFuZCBzZW5kaW5nIG91dCBJUElzLiBJdCB0aGVuIGdvZXMgYWhlYWQgYW5kIGRvZXMgYW4gYWxs
b2NhdGlvbgo+PiB0aGF0IG1hcHMgdGhlIHNhbWUgdmlydHVhbCBwYWdlIFggdG8gcGh5c2ljYWwg
cGFnZSBQMi4KPj4KPj4gQ1BVMyBpcyBpc29sYXRlZCBhbmQgZXhlY3V0ZXMgc29tZSBlYXJseSBl
bnRyeSBjb2RlIGJlZm9yZSByZWNldmluZyBzYWlkIElQSXMKPj4gd2hpY2ggYXJlIHN1cHBvc2Vk
bHkgZGVmZXJyZWQgYnkgVmFsZW50aW4ncyBwYXRjaGVzLgo+Pgo+PiBJdCBkb2VzIG5vdCByZWNl
aXZlIHRoZSBJUEkgYmVjdWFzZSBpdCBpcyBkZWZlcnJlZCwgdGh1cyBhY2Nlc3MgYnkgZWFybHkK
Pj4gZW50cnkgY29kZSB0byBwYWdlIFggb24gdGhpcyBDUFUgcmVzdWx0cyBpbiBhIFVBRiBhY2Nl
c3MgdG8gUDEuCj4+Cj4+IElzIHRoYXQgdGhlIGlzc3VlPwo+Pgo+IAo+IFByZXR0eSBtdWNoIHNv
IHllYWguIFRoYXQgaXMsICppZiogdGhlcmUgc3VjaCBhIHZtYWxsb2MnZCBhZGRyZXNzIGFjY2Vz
cyBpbgo+IGVhcmx5IGVudHJ5IGNvZGUgLSB0ZXN0aW5nIHNheXMgaXQncyBub3QgdGhlIGNhc2Us
IGJ1dCBJIGhhdmVuJ3QgZm91bmQgYQo+IHdheSB0byBpbnN0cnVtZW50YWxseSB2ZXJpZnkgdGhp
cy4KT2ssIHRoYW5rcyBmb3IgY29uZmlybWluZy4gTWF5YmUgdGhlcmUgaXMgYW4gYWRkcmVzcyBz
YW5pdGl6ZXIgd2F5IG9mIHZlcmlmeWluZywKYnV0IHllYWggaXQgaXMgc3VidGxlIGFuZCB0aGVy
ZSBjb3VsZCBiZSBtb3JlIHRoYW4gb25lIHdheSBvZiBzb2x2aW5nIGl0LiBUb28KbXVjaCAnZnVu
JyA7KQoKIC0gSm9lbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
