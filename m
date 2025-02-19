Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4E3C021AA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 16:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OT8Uw4GgpL1HeXDVJmZi/abxN/F1iIVyJoC9xyl6KYE=; b=CabuUBBeZblmoA
	G5/kbkgARevh/dYrlQRH1XjD1dvedEgupu79ID9vcKGA8f27UHWy0PPjWeunyOegDLlWB+t9z3y11
	HoopJJrX4eiSVQOQ992R9l0uaSj8Dzjchi3EXDfSGgH7V4e607347MJkn3ZAXs9OaCOHSWAi/4ySx
	X/3gcB/K9OEdrLjx8bjFZQeTfKWuEVvMTcXZG1tQjyHcuW3OipA4d46ZYb6RurxCOnGHwTvyn4Ntk
	B0DCMOpYwlUVOEpU0CvUc/dcjU1p6omjkWBAlKd6oCYtphjQhF5YclPGTgZIp3b2dcCVrGBhp3jOT
	p4s4miZ2YiGi1CIWinug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkmfI-0000000DjiF-1X0b;
	Wed, 19 Feb 2025 16:11:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkleV-0000000DRxD-0teS;
	Wed, 19 Feb 2025 15:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:References:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-ID:Content-Description;
	bh=A1iOID2bcXBamzPTPoVujjbZLDwoclMiI2auzlDjDSo=; b=TFVDwHYh+nFHj/4kfrHp4EBNax
	BF2Ge429T2umicWr0pMifpa7tFi+eTAtz4BGnqSR/j3RmkElkcN3ArgEPYo6ALwCbARNJqfdiHASc
	n2/u3MZGfoN/hKn265TkGk58ahqfasyKMUi2Vn1gruLIn6D4HNFidbcNY+m965W+VMQSI9/hbdPK9
	tw4bbcOEP7uBblPxXO+EzlFytTbYFlkoGiDEkcexXVRL9/1YzexTrh0JCa3jarZFse3vIdgbIF0/K
	Ozq8mDypv4Ela2shfkrGR7xD6wl8TaVLe/bx/XYy0vScE7C7XIrT65kX+t5QPcFZVYgeNqwgam3dr
	4+oaH90A==;
Received: from mail-dm6nam04on20630.outbound.protection.outlook.com ([2a01:111:f403:2409::630] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkleQ-00000002EG1-3skO;
	Wed, 19 Feb 2025 15:06:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKAsFn867LSBUrRDJRgLFFcPuio7g1kVjax6/5B3BxnD0mNuzin6h5zIkyj+1kkBfP20/PYEZl78XAAuVXtV/8JhTTv8Ye2FTDBOcX1At7bF/CKblzCwCvqUdClYox/JR/+k9mfHJTS9zIwl5GGUkPkRIfW8dQODkLBuMPM2JL/BkhGOcyy5ZWRkr2+bH2sAKpYZi2qXMLICJhcYOFmtzJQ6JrPLhB8kXWtWoJViYO/+2fm1xH9xaSt37BuzaPrOXw+6uDkpQmTeaRhbjSW+Xr7KiVGPhF4a9NkeMh79IS4/u8HisN5cyzQFHYZUHvaAKmBPHw+Sm8NL7oglePKu8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1iOID2bcXBamzPTPoVujjbZLDwoclMiI2auzlDjDSo=;
 b=I85RKatiZQHPpuolBakFVS11n8M3WGNuWjC+VksaKcPWHqrkYJM8oeL4MqgHhIyrYgvTmAjGfFcV8lSgBNvC70BFUwH5lD///njvN8vD4fqauGvGJl2zSNQH++yWxug118rdBLMHz2v0DbKyvPqu574bdY6d4oA4TfsAR6bCWfWL+QXrccxYu/1PSDASPA8Zj/lC19a7vTnImjdxHU5WmmjtwWSIEzrOuKzrDYS7Dz79SaIJ7joZBJI0XNc+5/6FzY63RRzsWPLNGWSiEkKaQxK6ohMTm3oRjCw+zqJ5wNct5jWFZMWP1tS1YxkHFNpsfU8P3A+QoRBpPx03gvbUDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1iOID2bcXBamzPTPoVujjbZLDwoclMiI2auzlDjDSo=;
 b=Fj9DPHjtaPs3OTzO7PDyEwIr0fW8Gz9vCl1el9BDTe4MuD2iQ/7s2ibQICNGHSs09onYv1adA2uEnZ9LwXDupyWfUm7FAqLlZ8L/DVr8nBNyrzfX/9apfbw3PBgxKhAIvecBFLDQc4o4vm0dr9nDpgVpjSlaPZUw2OvPjFwvzlP6F6DD6No/P64jZTWnYkvNCoGWGwHvPDIdn13+8OFpb9WfS+ZfxneL+1k8L9L+S/5yGitdkFCRhfxa/7kfhRcUZ+ZYBFK6rOvOxI8u+N7KtMVNe9Ym20kF9X5iC2DlKWQsFNZljEd+vHtQR0P9Bj0IhMVbZQeCOJjgTRDx7hvzIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB9029.namprd12.prod.outlook.com (2603:10b6:208:3f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 15:05:50 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%5]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 15:05:50 +0000
Date: Wed, 19 Feb 2025 10:05:47 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 29/30] x86/mm, mm/vmalloc: Defer
 flush_tlb_kernel_range() targeting NOHZ_FULL CPUs
Message-ID: <20250219145302.GA480110@joelnvbox>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-30-vschneid@redhat.com>
 <CAG48ez1Mh+DOy0ysOo7Qioxh1W7xWQyK9CLGNU9TGOsLXbg=gQ@mail.gmail.com>
 <xhsmh34hhh37q.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <CAG48ez3H8OVP1GxBLdmFgusvT1gQhwu2SiXbgi8T9uuCYVK52w@mail.gmail.com>
 <xhsmhzfjpfkky.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Content-Disposition: inline
In-Reply-To: <xhsmhzfjpfkky.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-ClientProxiedBy: MN2PR18CA0005.namprd18.prod.outlook.com
 (2603:10b6:208:23c::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB9029:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c25bda2-da56-4557-f687-08dd50f6e56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkhIL1FkR2JpVzRHUFVNR1R2VzhJRGMwTW1xdlRCU0JVMk4rZ091MnNnQjZ4?=
 =?utf-8?B?NXdkclVldTdJY1NjTnBjYUNDOG1MUjF3em8vR0lOcFJsWTFGL0xhS1BqbDVY?=
 =?utf-8?B?S0xTdERaaFFGekFheFN5YjRrU2Z5ZURTSXBmRXcyK0tpTUxvaTBDNmk1Sjh1?=
 =?utf-8?B?WjdIalJ1cURXYlBwMzM2V2k4SG5JRG9uT0M4bjdBMlJna0J3S2JCWVFmYW9V?=
 =?utf-8?B?V1Joa1JHUEJ0eFJvdjRJenlPbVRDNFRDajF4SFMxRWNOVEljeFA1RVgvVHpR?=
 =?utf-8?B?K0xFMVExdHZXKzk3bFFBTkk1OVo2TzRQUm42S3BiU3ZJK0pBNDRaRlEzbVBm?=
 =?utf-8?B?Z3B3NmtTbk5LaHpkMDNuRnMxRjIzRFl6OFVkT1lsSG1aQnRVcHJUVWdXSXlU?=
 =?utf-8?B?TDFmZTczTmlVTndTQ2I5WnhMdklDbU5FcFZscmNVMXhqcUUvcU5RRm9ENmxL?=
 =?utf-8?B?ck0zeHZLcUIyMERLUFNaQWd4UTVmWHorc3FzNFl3dGl1ZjEwWjRBclozcGlB?=
 =?utf-8?B?NDVtTTcxeGhWUDNtTnZrTE5JVjJpSXpxVko2c2IwcVR1eUV3MG1zb3Byb3hV?=
 =?utf-8?B?Ynk3a3gzZWcwS2oyVitMVWdRVS8xMU1mcUtkUlVTbXk2QktyVm9GV01DU0VS?=
 =?utf-8?B?K1MyUkhHR0FQaE5sV1RsUEhkeEpISnJ1T0xGRndxc3dkaTZDZFZRWGZkNmdO?=
 =?utf-8?B?NXNxenNjLy9YdjJTa05ITThxVkdReGUrdHhOdkZOTjZLWXJHNmE2Z3N1VXJ1?=
 =?utf-8?B?bmhUUGpzR3dsaVB3a3NQMWp6MCtnTFdjM3c0OUN3ZllHekpFMkl6RHh6STE4?=
 =?utf-8?B?ZjdOTGE0Mjk1RHdHLzNZM245VDlScFd4WkZKYW5VQ2x3dlg5WGNwNTExTDd3?=
 =?utf-8?B?ZUU0VmlZYXo5dUNOMjMzUDlRR25EbVEyMnhJQlhLR201emphN0hab0xGSStN?=
 =?utf-8?B?ZHEwOVVzQVB1UjQwTTE3QkRqUDg4RU9LOEgwZkZ0VUR2LzRMNHB6anhDNldB?=
 =?utf-8?B?QTFkWUVudFhHcE9lZlFGS0JXdHZnUGtuNC8rRHFkSExJdHpXbzZIMUNxcDVq?=
 =?utf-8?B?ZGl3bVh0cDVKRzl0QnZyZENZM2xuNmJxSVFXT0lDdzRScW8vWjlEblp3RERI?=
 =?utf-8?B?ZU9hZ0EwZDFlNFk5K0xvalVQMFo3OWtGcmNyVG04dFE2MEltbU5qNUtsMDBy?=
 =?utf-8?B?OTY2NUZKWkFxZXBvT3YxTWw3a2o2R3ExL2l3VFlYZjdHT1BQeThJdElicHcx?=
 =?utf-8?B?dlphMDNCVGtnQ1FKbjFkRHJEdFlEQWtQV2lzbVZMbVpGWmsyaDVzVlVteVYv?=
 =?utf-8?B?RnhXc3JQdjc5MWJGWDlUSzRMQXcyYklEQnh2YkxkNGtVVFdhTnkzVU44OGNk?=
 =?utf-8?B?dXMvNHZBdjI5bFBjb1RYemJCMmFvT1NrWFl3YThnU2VwZG10TFM1ZFdTZ0lj?=
 =?utf-8?B?VXlLK1dNUXh4YzE1TTZnbi9jQ1JxUEhHbzViblBtblJxRWpHcEMyMzNacmFl?=
 =?utf-8?B?TmVOdVlpMlpjbndPY0hqNkJaV20xaU9wazRqM21hZWlUUXM0TE9XU2twQm4v?=
 =?utf-8?B?aWFzWnhkZS9ITTNETkVtQUQ3ZlJFdm43RU9OYlRGaTJJTWorVHZTR3Q0YUlK?=
 =?utf-8?B?dUlyOVFyN2ZOSTZKeHdWUnUyU2w3alI0ZkdKdTJkcG5FTjJpTkJwVTlVWE1L?=
 =?utf-8?B?VDlyTU5JSXdIZFJDa1JMWTYvRkFGZkUwb1ZXQWs2bkRTaWpScVB6RjltdnFD?=
 =?utf-8?B?TDJBMktqM2tnRjRJekxNL2FIUW5SUDVEZkQvQ29qSnR3amppbzNZVG9FanFi?=
 =?utf-8?B?OEI5Z24rSTN1dll0ZTJZWFc4Wk03eUd4by9KR2VEci9Nci9NRWdzTk1xZmpW?=
 =?utf-8?Q?DKrgDoGj60ipC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG5QQjRJRTdQMXJBS3BQOUNjU21LdWw5SzdyRFlQakRERlFib3JuclBOOERN?=
 =?utf-8?B?UWc3U0VTUFlLVVFGMFFGUEpyWWlRZTlUc0xieDAwbHYrblkvTys1dnVCZ0l1?=
 =?utf-8?B?Y1pnWUI3Q0pSY1ZaL1htNThQekg2UCtTMEhTZ0MvWjliYlRtVXVPejRybnd3?=
 =?utf-8?B?Q1RRdi9aV0ZxVjMwdUdVWEZ1ajFYak9ZdFlINU12WDFqN043SXhtSFFnVVpo?=
 =?utf-8?B?NWNXeXJwSWd4RkxsYlUxa3FtSVNZRkpjT0RjMmlyck9QVDI2ZnZaQ2hoMHEz?=
 =?utf-8?B?OUVQNVBsTnk3VjFoUVp2bmszNjRSTWVxdVIxdlZNbE5QL1U3S09PaU5BaDRE?=
 =?utf-8?B?RERBTjNJS25INVFYSGRhVzYvUHRBMlVVRHgwRU85QitiUjI0cTJ0RzN3eU9s?=
 =?utf-8?B?Q2FkTDY1ZEtzRHIxRk9Bd2R1SUJzaW1uek10Tm1BcXlyamFYVW4zV05WMnVw?=
 =?utf-8?B?YzZtTThnelZDTmwxSGgwOWt3dy8zcVl3NEhTQi9iV1NpK1hUdndObEsrT0lq?=
 =?utf-8?B?Y0VjNXBuYU5tRU5LRnBhRkpVV25EQzlBL0FxdU5MeHVPRndQa05ZaUliTmN4?=
 =?utf-8?B?QVkwdGswQkxZb0lxUHV5RGwxdXNUNTlGNjcyRTdER0x1TEN2TXF0aGNPTWJ6?=
 =?utf-8?B?aWUzTjFjWGNBMEszeUVLQmdhZ3FVdm85amgxSGloZWVZRDd1WFZwNXhKMTdt?=
 =?utf-8?B?SEp0S0wvcS9kb2cvdWVnKzVyUjk3N1dIaWUycVZjWU84Q3E0S00zYUZxWkNZ?=
 =?utf-8?B?VC84UGlEdE1qTTZMQnUzWlJzbE5KTjlLL3cwWi8zUFAvNWFzb09HWjR0Yzln?=
 =?utf-8?B?ZXM1Q2RwUmhmR2puUHpuTWI1WUV4NFh0VG1VSTBYZUg0ckcxeGljZll6d2tQ?=
 =?utf-8?B?c0lEUkZRSFpSdWg3WEJZbm9XQndiZ0hIallnODFjVGxnQ3RHTTN5WGFmdmxX?=
 =?utf-8?B?M1JhL28vV3NBYmk0TmhjMkZZQklYRW4vWWd4aC9YaktXUWxUQW83ME9MRkxn?=
 =?utf-8?B?dDZ5a1JIVmUrOWZRNmd2VnFHY1h4KzRKKyszcmh3MElmbHpTYlpzQmZmZlRr?=
 =?utf-8?B?QUgrS0NMN1Z6Q2RDV3NRWUwwWnQ0elZMQlVBWSt2VDE4RHBSM293TmtEdlNQ?=
 =?utf-8?B?MVFnZldMVWJTMTNLY3FBZWRvM0NnQ3phSzlWM3U4dVlKZkNlU1o2Z0Fnc0JO?=
 =?utf-8?B?ZjR3T3VNZ2ZTNHJUUkVaamNnRHhvU3VyRVM2ZitrRlIxV1hIbEpBUFptRUtU?=
 =?utf-8?B?OWF5R0tPUEdZRWFuWGtOUEVmSUpUclVSV3lVMXpVdlpHVWhSeGdxRkd1RFMx?=
 =?utf-8?B?VUgzUVZ5d3gwQlhPK2FTZmU5SUVCSi9EMXNkZGNaditxRzc0SER2SkEwRDEw?=
 =?utf-8?B?RDVhWHlJUEtaNmp1eHlUVVNSZWllTmh5TGJYcm8wNU5ua3kya1dTL2V2Q3Nj?=
 =?utf-8?B?YnorRUw5UmM4K3MrbEVJRTdhZGFoNkdtVmRwRlpDUmxrYnNTSVlXbStuOGVZ?=
 =?utf-8?B?c0luRGpqYXdDRHozcW5wYlI0bkNYUXhUZnJrR0NHMzFWY3hjM3FidEtYQUJQ?=
 =?utf-8?B?Ri9GV3pMQ3RsVUVZSmF4SGhGOHExMjY0ajRyaGs2MTBkQ0h0Nzc3QlNlVVhw?=
 =?utf-8?B?UmdoYkd0U0RwNVBWeHZ3S3VaeWUwNDZxSkhmcUI4U2RDdVVGZHlKcXU0VGRy?=
 =?utf-8?B?QzhlcVlCclJZU3RmU0lMV04wOVhUWVhvMDZtYXE5TGdoRUJlV245dERQNnFQ?=
 =?utf-8?B?OE1XUk1CaWRhNHhzSllPNkxBRytSTE9hcmNCeXVTSGhvQjRhenJ2OGdFMU9C?=
 =?utf-8?B?KytoQlpNUkg4RnhHZm4zOXh6MWNtTWw0T1ZlMUdFdnEwVXZ5WGtkUDFRS3pH?=
 =?utf-8?B?clM4Z1hweG5lSGdhTnlhUUlzZEQzWWEvejlvOTliS0xtR2ppK3p6QWZsTE1O?=
 =?utf-8?B?MFBCVEExTWRhbXRPNWFmM3JaazcxSFVSODFIc2N4Znl0UVZEbGkwQXBhdnZ3?=
 =?utf-8?B?Zk9RMU8wdTZrbSsvOTlvajc0VmpTOGxwb1U3NzBTczV0QjlpYU1ia0hoaHNU?=
 =?utf-8?B?QWJYT1M0MjZrMUpNYjFRR0ZBMWthYlhmcUNES1lwdEUvZkZSUUpjMjJhUUxC?=
 =?utf-8?Q?f37H3uFx36Kce1SweEEnpii7O?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c25bda2-da56-4557-f687-08dd50f6e56c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:05:49.9907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vENyi1BqIDH2Vmt4z2lQDPuELFOWe5ymrHLk0eJ/9UyBz/j89j0TliQZuvZyk7Hk6bMN/M4gsP9X/jwzE3I/VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_150615_202617_49E45350 
X-CRM114-Status: GOOD (  29.08  )
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

T24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgMDU6NTM6MzNQTSArMDEwMCwgVmFsZW50aW4gU2NobmVp
ZGVyIHdyb3RlOgo+IE9uIDE3LzAxLzI1IDE2OjUyLCBKYW5uIEhvcm4gd3JvdGU6Cj4gPiBPbiBG
cmksIEphbiAxNywgMjAyNSBhdCA0OjI14oCvUE0gVmFsZW50aW4gU2NobmVpZGVyIDx2c2NobmVp
ZEByZWRoYXQuY29tPiB3cm90ZToKPiA+PiBPbiAxNC8wMS8yNSAxOToxNiwgSmFubiBIb3JuIHdy
b3RlOgo+ID4+ID4gT24gVHVlLCBKYW4gMTQsIDIwMjUgYXQgNjo1MeKAr1BNIFZhbGVudGluIFNj
aG5laWRlciA8dnNjaG5laWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPj4gPj4gdnVubWFwKCkncyBp
c3N1ZWQgZnJvbSBob3VzZWtlZXBpbmcgQ1BVcyBhcmUgYSByZWxhdGl2ZWx5IGNvbW1vbiBzb3Vy
Y2Ugb2YKPiA+PiA+PiBpbnRlcmZlcmVuY2UgZm9yIGlzb2xhdGVkIE5PSFpfRlVMTCBDUFVzLCBh
cyB0aGV5IGFyZSBoaXQgYnkgdGhlCj4gPj4gPj4gZmx1c2hfdGxiX2tlcm5lbF9yYW5nZSgpIElQ
SXMuCj4gPj4gPj4KPiA+PiA+PiBHaXZlbiB0aGF0IENQVXMgZXhlY3V0aW5nIGluIHVzZXJzcGFj
ZSBkbyBub3QgYWNjZXNzIGRhdGEgaW4gdGhlIHZtYWxsb2MKPiA+PiA+PiByYW5nZSwgdGhlc2Ug
SVBJcyBjb3VsZCBiZSBkZWZlcnJlZCB1bnRpbCB0aGVpciBuZXh0IGtlcm5lbCBlbnRyeS4KPiA+
PiA+Pgo+ID4+ID4+IERlZmVycmFsIHZzIGVhcmx5IGVudHJ5IGRhbmdlciB6b25lCj4gPj4gPj4g
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+PiA+Pgo+ID4+ID4+IFRoaXMg
cmVxdWlyZXMgYSBndWFyYW50ZWUgdGhhdCBub3RoaW5nIGluIHRoZSB2bWFsbG9jIHJhbmdlIGNh
biBiZSB2dW5tYXAnZAo+ID4+ID4+IGFuZCB0aGVuIGFjY2Vzc2VkIGluIGVhcmx5IGVudHJ5IGNv
ZGUuCj4gPj4gPgo+ID4+ID4gSW4gb3RoZXIgd29yZHMsIGl0IG5lZWRzIGEgZ3VhcmFudGVlIHRo
YXQgbm8gdm1hbGxvYyBhbGxvY2F0aW9ucyB0aGF0Cj4gPj4gPiBoYXZlIGJlZW4gY3JlYXRlZCBp
biB0aGUgdm1hbGxvYyByZWdpb24gd2hpbGUgdGhlIENQVSB3YXMgaWRsZSBjYW4KPiA+PiA+IHRo
ZW4gYmUgYWNjZXNzZWQgZHVyaW5nIGVhcmx5IGVudHJ5LCByaWdodD8KPiA+Pgo+ID4+IEknbSBu
b3Qgc3VyZSBpZiB0aGF0IHdvdWxkIGJlIGEgcHJvYmxlbSAobm90IGFuIG1tIGV4cGVydCwgcGxl
YXNlIGRvCj4gPj4gY29ycmVjdCBtZSkgLSBsb29raW5nIGF0IHZtYXBfcGFnZXNfcmFuZ2UoKSwg
Zmx1c2hfY2FjaGVfdm1hcCgpIGlzbid0Cj4gPj4gZGVmZXJyZWQgYW55d2F5Lgo+ID4KPiA+IGZs
dXNoX2NhY2hlX3ZtYXAoKSBpcyBhYm91dCBzdHVmZiBsaWtlIGZsdXNoaW5nIGRhdGEgY2FjaGVz
IG9uCj4gPiBhcmNoaXRlY3R1cmVzIHdpdGggdmlydHVhbGx5IGluZGV4ZWQgY2FjaGVzOyB0aGF0
IGRvZXNuJ3QgZG8gVExCCj4gPiBtYWludGVuYW5jZS4gV2hlbiB5b3UgbG9vayBmb3IgaXRzIGRl
ZmluaXRpb24gb24geDg2IG9yIGFybTY0LCB5b3UnbGwKPiA+IHNlZSB0aGF0IHRoZXkgdXNlIHRo
ZSBnZW5lcmljIGltcGxlbWVudGF0aW9uIHdoaWNoIGlzIHNpbXBseSBhbiBlbXB0eQo+ID4gaW5s
aW5lIGZ1bmN0aW9uLgo+ID4KPiA+PiBTbyBhZnRlciB2bWFwcGluZyBzb21ldGhpbmcsIEkgd291
bGRuJ3QgZXhwZWN0IGlzb2xhdGVkIENQVXMgdG8gaGF2ZQo+ID4+IGludmFsaWQgVExCIGVudHJp
ZXMgZm9yIHRoZSBuZXdseSB2bWFwcGVkIHBhZ2UuCj4gPj4KPiA+PiBIb3dldmVyLCB1cG9uIHZ1
bm1hcCdpbmcgc29tZXRoaW5nLCB0aGUgVExCIGZsdXNoIGlzIGRlZmVycmVkLCBhbmQgdGh1cwo+
ID4+IHN0YWxlIFRMQiBlbnRyaWVzIGNhbiBhbmQgd2lsbCByZW1haW4gb24gaXNvbGF0ZWQgQ1BV
cywgdXAgdW50aWwgdGhleQo+ID4+IGV4ZWN1dGUgdGhlIGRlZmVycmVkIGZsdXNoIHRoZW1zZWx2
ZXMgKElPVyBmb3IgdGhlIGVudGlyZSBkdXJhdGlvbiBvZiB0aGUKPiA+PiAiZGFuZ2VyIHpvbmUi
KS4KPiA+Pgo+ID4+IERvZXMgdGhhdCBtYWtlIHNlbnNlPwo+ID4KPiA+IFRoZSBkZXNpZ24gaWRl
YSB3cnQgVExCIGZsdXNoZXMgaW4gdGhlIHZtYXAgY29kZSBpcyB0aGF0IHlvdSBkb24ndCBkbwo+
ID4gVExCIGZsdXNoZXMgd2hlbiB5b3UgdW5tYXAgc3R1ZmYgb3Igd2hlbiB5b3UgbWFwIHN0dWZm
LCBiZWNhdXNlIGRvaW5nCj4gPiBUTEIgZmx1c2hlcyBhY3Jvc3MgdGhlIGVudGlyZSBzeXN0ZW0g
b24gZXZlcnkgdm1hcC92dW5tYXAgd291bGQgYmUgYQo+ID4gYml0IGNvc3RseTsgaW5zdGVhZCB5
b3UganVzdCBkbyBiYXRjaGVkIFRMQiBmbHVzaGVzIGluIGJldHdlZW4sIGluCj4gPiBfX3B1cmdl
X3ZtYXBfYXJlYV9sYXp5KCkuCj4gPgo+ID4gSW4gb3RoZXIgd29yZHMsIHRoZSBiYXNpYyBpZGVh
IGlzIHRoYXQgeW91IGNhbiBrZWVwIGNhbGxpbmcgdm1hcCgpIGFuZAo+ID4gdnVubWFwKCkgYSBi
dW5jaCBvZiB0aW1lcyB3aXRob3V0IGV2ZXIgZG9pbmcgVExCIGZsdXNoZXMgdW50aWwgeW91IHJ1
bgo+ID4gb3V0IG9mIHZpcnR1YWwgbWVtb3J5IGluIHRoZSB2bWFwIHJlZ2lvbjsgdGhlbiB5b3Ug
ZG8gb25lIGJpZyBUTEIKPiA+IGZsdXNoLCBhbmQgYWZ0ZXJ3YXJkcyB5b3UgY2FuIHJldXNlIHRo
ZSBmcmVlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZSBmb3IKPiA+IG5ldyBhbGxvY2F0aW9ucyBhZ2Fp
bi4KPiA+Cj4gPiBTbyBpZiB5b3UgImRlZmVyIiB0aGF0IGJhdGNoZWQgVExCIGZsdXNoIGZvciBD
UFVzIHRoYXQgYXJlIG5vdAo+ID4gY3VycmVudGx5IHJ1bm5pbmcgaW4gdGhlIGtlcm5lbCwgSSB0
aGluayB0aGUgY29uc2VxdWVuY2UgaXMgdGhhdCB0aG9zZQo+ID4gQ1BVcyBtYXkgZW5kIHVwIHdp
dGggaW5jb2hlcmVudCBUTEIgc3RhdGUgYWZ0ZXIgYSByZWFsbG9jYXRpb24gb2YgdGhlCj4gPiB2
aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuCj4gPgo+IAo+IEFoLCBnb3RjaGEsIHRoYW5rIHlvdSBmb3Ig
bGF5aW5nIHRoaXMgb3V0ISBJbiB3aGljaCBjYXNlIHllcywgYW55IHZtYWxsb2MKPiB0aGF0IG9j
Y3VycmVkIHdoaWxlIGFuIGlzb2xhdGVkIENQVSB3YXMgTk9IWi1GVUxMIGNhbiBiZSBhbiBpc3N1
ZSBpZiBzYWlkCj4gQ1BVIGFjY2Vzc2VzIGl0IGR1cmluZyBlYXJseSBlbnRyeTsKClNvIHRoZSBp
c3N1ZSBpczoKCkNQVTE6IHVubWFwcGVzIHZtYWxsb2MgcGFnZSBYIHdoaWNoIHdhcyBwcmV2aW91
c2x5IG1hcHBlZCB0byBwaHlzaWNhbCBwYWdlClAxLgoKQ1BVMjogZG9lcyBhIHdob2xlIGJ1bmNo
IG9mIHZtYWxsb2MgYW5kIHZmcmVlIGV2ZW50dWFsbHkgY3Jvc3Npbmcgc29tZSBsYXp5CnRocmVz
aG9sZCBhbmQgc2VuZGluZyBvdXQgSVBJcy4gSXQgdGhlbiBnb2VzIGFoZWFkIGFuZCBkb2VzIGFu
IGFsbG9jYXRpb24KdGhhdCBtYXBzIHRoZSBzYW1lIHZpcnR1YWwgcGFnZSBYIHRvIHBoeXNpY2Fs
IHBhZ2UgUDIuCgpDUFUzIGlzIGlzb2xhdGVkIGFuZCBleGVjdXRlcyBzb21lIGVhcmx5IGVudHJ5
IGNvZGUgYmVmb3JlIHJlY2V2aW5nIHNhaWQgSVBJcwp3aGljaCBhcmUgc3VwcG9zZWRseSBkZWZl
cnJlZCBieSBWYWxlbnRpbidzIHBhdGNoZXMuCgpJdCBkb2VzIG5vdCByZWNlaXZlIHRoZSBJUEkg
YmVjdWFzZSBpdCBpcyBkZWZlcnJlZCwgdGh1cyBhY2Nlc3MgYnkgZWFybHkKZW50cnkgY29kZSB0
byBwYWdlIFggb24gdGhpcyBDUFUgcmVzdWx0cyBpbiBhIFVBRiBhY2Nlc3MgdG8gUDEuCgpJcyB0
aGF0IHRoZSBpc3N1ZT8KCnRoYW5rcywKCiAtIEpvZWwKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
