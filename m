Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97668C636D6
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tfijkmZTdlwSfzdE0JodRVlW5XIVmhU13pwRjVg1cPc=; b=dak8IzWIvjn0XoeQM3DRgde5SK
	Iu18jh1ecDtBkxIFGlYCLR0llF8wD7Kxv24+t4VmpUr9o9lQ8JiKUyxlpnXQY19mWx63DL8ss5/lS
	Hu73qXWEfTOzBIeyABqDQKVE/wWgapfexvuubLbPtW06gzqI02l7yI5VBS+zTe6GWf7VMxGE9cK9b
	QWKB2YoDh3JNtF+uVx/TLZmBisCroCfGyIap3sOejh+G/gL7VC6k+eL/2C7hwzzfa+P6aAQc7lPRr
	WLjfuJuxASfsboGLO8Qlk6tlRMvSalnVcvMVP30i4a/KeyuYJ6DMk+VQ24Gvi1ZgOdN/k7i0C2sbI
	QGNcKpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeIz-00AKs9-6L; Thu, 16 Feb 2023 13:28:09 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeIv-00AKqq-OB
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 13:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676554085; x=1708090085;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=TeVKG4DuMDHVWpJdKT3tahz8US0jqKvI1yWwn+nKL/4=;
  b=cfsTFQbrhZv5mSdPrHsYQ428yr63R9sfqUuBGER64ccNersnSOTKNdnK
   v9OBbqy5S2mI4p+ZlnQXE2YbTJ+cifP4cLLQsu4jsdLgIeq20uClPLfD2
   SxBm0G47vZzia17vZ6atCUHdHbaum9Kq1R8+m0XkD1S3Z0crO5d8+2Ku3
   0w4tcg1Thpdprb0Pcrg4aziq4JhkqUn5zSbubUru2fWG3Z6HP71FGjI6d
   h7i/ydSJFzfS8pTfDk3U/R6EGgnkX/dSu34aGNlQzwx+aPlwVsdSyKKKJ
   Ln51ynZTrK9QqYXajyq62+UyWRcIxboczjmTCOoaPFOYGjpdJYb87otUq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333041494"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="333041494"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 05:28:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="700493655"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="700493655"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga008.jf.intel.com with ESMTP; 16 Feb 2023 05:28:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 16 Feb 2023 05:28:00 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 16 Feb 2023 05:28:00 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 16 Feb 2023 05:27:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VqhD743QpMNS+C6DouN8OhVCq0lO2eh9D60AAEPzyTe7Gwh1QwV4mfJNConXTVQpTFgZ8YiTTQxLJtyA9Cb7PY35ckJw4nzGe92racmnAPYUv0rCgGuSwdh2Aiexf8EV5Rq0mMnK/nk5fUg04U9rvI80PEqMLtQ6xlfI1ZfWihEGrogVDp0BaXEZ24inhyD1fTufl1i+/7oB7+GErGMdYXlBCKORCXSlXDstv501PSauCkxgTHcCLgxNF4P+rXNNmxsZ7fYThCKK0nvYrvPXpo/I0W/tTMmYuZjXZqF4VRNDiQnqusY2c7WM81aa4jdKKGEJjyFHP8F/rCdl42uf/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/DEH4nmpofnTl9Gru6yIEKJmb2hxcu0IoTFGnjmztdo=;
 b=BOvNfNmFfgb5qf9X6p1kkVaC/E/QpGVnuECo/HDcYbGe3ATmC2Gf+nXUbxmzk0+t+jK7zPz4GJ8+ZSvRl+5vzd27WUQK3d8GHNwj+VRZRfmHsc1ILAQWftuSX8pr/K7LZg3di69ciWN8aICi7hPd8d/PgfSGcU6xTiZBbyD4s4cCLYEFpg/fUirfA9XckAriurwTTuvL1O1gmn2c4RL587YnHK6jvG/Jz5LeYZ9MOhbQtlH0DOcbhAYO9GNUau7dejIZ4CpIczoCsylRx9SrSs3q3nUD14ABKBAFmEBn8L2bhw0yLVEWAhiAU1DBZb5y5emRajjFllqS3qn39gRs4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by DM4PR11MB6018.namprd11.prod.outlook.com (2603:10b6:8:5e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 13:27:58 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 13:27:58 +0000
Message-ID: <86ab3990-1188-20e2-2055-941f083ca522@intel.com>
Date: Thu, 16 Feb 2023 21:27:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH 10/7] riscv: Implement the new page table range API
To: Alexandre Ghiti <alex@ghiti.fr>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "willy@infradead.org" <willy@infradead.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
References: <20230211033948.891959-1-willy@infradead.org>
 <20230215000446.1655635-1-willy@infradead.org>
 <20230215000446.1655635-2-willy@infradead.org>
 <c02faf6e4af4babd24b3107d5fc2c6bff1d63100.camel@intel.com>
 <2e77208f-78e7-b225-7daa-57f08d703b04@ghiti.fr>
Content-Language: en-US
From: "Yin, Fengwei" <fengwei.yin@intel.com>
In-Reply-To: <2e77208f-78e7-b225-7daa-57f08d703b04@ghiti.fr>
X-ClientProxiedBy: SG2PR03CA0097.apcprd03.prod.outlook.com
 (2603:1096:4:7c::25) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|DM4PR11MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: b17f8dfb-5892-4661-ae4f-08db10219dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M4PPGPsxqhrg9HOgcBwstrP9TYgVGsUH1kq1WEwodZS5TjJEBG6lp9CdgxhH1hpOVh0Pft6RFaHsuymWjo3OzJ5+Ola0xxsKhwqXc/032YKJrYXn5moaoy/96ZPv+4gdecvBsFSV1ux3/Z+15rwKciqolzdrP0NIuMI/MSgJETCzsViuduNTR1S/xCzoMBdpYeK7N+TG+oJw61WUjTX+nPC3zXT6lhsie6Mf3Ox5UZ7xWQ/7nPrYLQlvBn22vRN/1V2vgDMsWzryXuz5GhUR9Krlt9YlWCax6AdcC9bk7M/jWrR1/QOoFhhH01Dbk01zdprjbpH8MN9CqTFMnwFahB+pty8rQmS668Wh/KPQDnlaJvH36bZv8r7Qecz0K+oS45WWHIRqcX+Ae5wqSsf3U21QLP2c3H3qVhyHGUlLuKxUUvGuVKw+gK8uymFoYH5vdzdZAFf8OPfsl4jLH1Iomydg4ovx+Ilehg5euINhO/rienkwWl8g6Ca+jNHzxBBM5R8ByCnCI4XmzYQZ7cGqaQ5HpRa59jcHuboDSduTF8BWG/UDPdDYnr/wP9rd8k+RypSiintiZxIYTV/e18hnf0DX/PaJbLtd4ECBcfLtd+MqBxFWyFwH1fEGeQrtZ1TjkvMMseY0EwstgbCnB+67ffJWYjupbOVn5GJFrUpx7yTzpo1Lu0O+Sg+Y34HXlYynrqGsb0VorKIpfIoLklkWSK3Q0kJ+JfHd3jtcmptpkxU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(376002)(136003)(39860400002)(366004)(346002)(451199018)(66476007)(316002)(8936002)(2906002)(6486002)(478600001)(66556008)(41300700001)(66946007)(110136005)(31686004)(8676002)(53546011)(6666004)(26005)(186003)(2616005)(6512007)(83380400001)(6506007)(86362001)(38100700002)(82960400001)(31696002)(5660300002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVh3eUhlWC8vclBNTC9lOHdRZUJ6MSsrSnJJajY5dXlhOHI2YU9VbUF1L3lL?=
 =?utf-8?B?WEI3NitKZmhQS1I2ZlJueTdub3RNVlFrdW9kbG5WbGN3TWRldThtUE5EVk4z?=
 =?utf-8?B?OWJDV0c0WkxlM0dBMWdKeFpieFJqenQ0cnBuTzRWZU5kTStEVkxCSDZGbGE4?=
 =?utf-8?B?MXE4VG9HZ0lyZTJzZkRLZkl6N2M1QUV3bWYxRE1MNUZnUHZrdGJYdHc4TTI2?=
 =?utf-8?B?TFN2bWJDc2hUdEVHemM5N3BLRE1NVHNITUtaUGVNS0JxQ3ViOURkVkVSYytK?=
 =?utf-8?B?VjdEVUo1Q0tNbWYyT3hkYjdWQ3c1S3ljeHk4TEFUVFhONFVKdWNEMElDU1hV?=
 =?utf-8?B?SlRkTzlScSsyTlZTVzRGWjRFVHk4NWJxUmlVR1ExQms4N3dscmozR0FSZ1lk?=
 =?utf-8?B?Z3R6YWRXNkdHb2k4dEozZnZzUVFIUWFEcWl5Mkd6QTdmR3RpbEhSUEFnd1k3?=
 =?utf-8?B?VEl2empqeDhuVUxnNFVrZy93OEc3dThzeGhYSXJTakZGOXU5bHJkaFdqYlZB?=
 =?utf-8?B?L1lMK0tvQlpVYm1uZk5rTWREM3BOZ2FPZHJtYWt6NGFITHNKZDJVZ3JLNFVK?=
 =?utf-8?B?S1Y5S3BrWlBuK04yWkd1NWR1cSs5Q1F4TlFkNHd1aVVYbktSVWZrOTlpN3NZ?=
 =?utf-8?B?aER3Zzh3TXJJQ2VRdXJCbG8ybXNkSjl5TlZEclRodmM3Vi96d1Z5NWRmWUNs?=
 =?utf-8?B?cGlqQ0VQeXduc1d4bStzZVZFMkZZVW92bm1kc1VucUoyMXhBZm1jUURiVlJn?=
 =?utf-8?B?dlhETEJTbkkwbVJCa21YdXlxZHNPMC9wOGxocTBrMjlxY0NLWUdTOEMwR1lj?=
 =?utf-8?B?dHk2RU1MQlRBa1ZaNmxjNzU3REJJeUVkaTNxbHZld3VPRjFVQUMyS1h4b1Jl?=
 =?utf-8?B?OTg2ODc2c2JIL25MY2E1dUMyTnRGVk9pcSt1T1c1UlZCcGp3VDdMWlNqY3VS?=
 =?utf-8?B?TWNVclp4dWZKc0pHb2owYjFjV2pvSVpqYjVkVm50TGtacWJpYmZsOXRVSDVB?=
 =?utf-8?B?akI4dFdOdzB2MU9ORk8xODlKOFpqTnN0aTBiNk5zcXRwM3ppUkZjK1YyWUF1?=
 =?utf-8?B?bm00UkZLaVZWU2hadHYwYVlFK3g3NjNmNkdnczVHV0VYTklMYThZc2hXS2Zo?=
 =?utf-8?B?Z2dPU29SdFo3N2VqTUdmdTIxWjB0a3gyR0dMTkRVdzFIbTNmQmd6dGdKbGt0?=
 =?utf-8?B?SldrZ0sxUVdQN0Q2Q1JNYTQrVnBDbmZWSHNPZ2hFY2QrUUNxQVRoOWVnaXBS?=
 =?utf-8?B?a0JnSEkvL0JZTXNRUFB6bVJkTE1WK3hTcDRkZUx2ODliN0hncEY2Q3NDMXdv?=
 =?utf-8?B?OUpLbkRsVWU1K0djUWwvbkdJT2Uyb2tkYTN1VmsvbHFSdlEwdDUvNVF0eUNu?=
 =?utf-8?B?OS9MczhYQjk5Ty8xV3owQkc2Q1VrMGxaMklQSWh1WktXT0tvMXd4dVptTElW?=
 =?utf-8?B?bXVPNVIvZUs1d0U4a0syUXoxU3V2bEFBeXBwd05QcjFSNnJTRWZFSDNtaVBQ?=
 =?utf-8?B?L2VGTDRNend4ZXVEVWlrRHpQVkNBc2NLTWxoV01FZXBwT0t2dG9wQ1hGcGJO?=
 =?utf-8?B?Nlh3aW5iK3RRREs2SDF0eCtLT1Y4N0VvM2pTV2tIWDNqYk1MUENqMVNZZGlq?=
 =?utf-8?B?Wm1GbmZHZkpURms3ZEQ1T0tUemM4alpmaEpuS09uSHU0S0c1cGR0bUpOK1Ni?=
 =?utf-8?B?VisxQWpEVFNZYjJJTzZJbEcrdVYyblVaS21IMXRlMHdpSGFZQU1TM0lTMGQr?=
 =?utf-8?B?MjNJYUhwdGFNUGxYL21WYXN5MFZTQ05HZVoxVFZ2S2F0Zno2dUFyNnZ5RzAw?=
 =?utf-8?B?QzdkcHVHQ1pCMzNZVDZaNjVNb1hoRkk4bHBuSnZ3QVdUWW1yNWZkaS95MWRB?=
 =?utf-8?B?ZzgyTThOcEhBK2sycXRTNVNUTjNQK1NGZGZnOC91MDgrWXk4TERVekJVMDI2?=
 =?utf-8?B?dHhBU3JVWjZPVTZiaWIwVlR6M29zZVU0WXJKRmQ0WWhHaUlURzZqc2M0WCtG?=
 =?utf-8?B?WENmblBaSHdsMjRzcjZhS3FSN2FxMXJtVW9mUXVSMldjZTRPYnlSVCtLalli?=
 =?utf-8?B?RHV0UHc3dzFjQjh4TWxmV0tSMERtUkh6dGZ5U2F1NVZYeVBUb292MWxZSmJp?=
 =?utf-8?B?LzJObFhBVC9aMDZaNlZYcnBKNmd2RnhWa3hBWm1FeE5QcEFlUEJ2ZUVyVitk?=
 =?utf-8?B?RXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b17f8dfb-5892-4661-ae4f-08db10219dfd
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 13:27:57.7732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIccJibnmCq82nuE/A2o0uBvacBn6KIwCTQPvcOgty3DdoCpPmxzgahq+VDEQjMVuObTBToKQR+bRWMD9m5EzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6018
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_052805_897373_660154CF 
X-CRM114-Status: GOOD (  20.21  )
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

SGkgQWxleCwKCk9uIDIvMTYvMjAyMyA0OjE0IFBNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4g
SGkgWWluLAo+IAo+IE9uIDIvMTUvMjMgMDk6MzgsIFlpbiwgRmVuZ3dlaSB3cm90ZToKPj4gT24g
V2VkLCAyMDIzLTAyLTE1IGF0IDAwOjA0ICswMDAwLCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSB3
cm90ZToKPj4+IEFkZCBzZXRfcHRlcygpLCB1cGRhdGVfbW11X2NhY2hlX3JhbmdlKCkgYW5kIGZs
dXNoX2RjYWNoZV9mb2xpbygpLgo+Pj4KPj4+IFRoZSBQR19kY2FjaGVfY2xlYXIgZmxhZyBjaGFu
Z2VzIGZyb20gYmVpbmcgYSBwZXItcGFnZSBiaXQgdG8gYmVpbmcgYQo+Pj4gcGVyLWZvbGlvIGJp
dC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlA
aW5mcmFkZWFkLm9yZz4KPj4+IC0tLQo+Pj4gwqDCoGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vY2Fj
aGVmbHVzaC5oIHwgMTkgKysrKysrKysrLS0tLS0tLS0tLQo+Pj4gwqDCoGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vcGd0YWJsZS5owqDCoMKgIHwgMjUgKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+
Pj4gwqDCoGFyY2gvcmlzY3YvbW0vY2FjaGVmbHVzaC5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTEg
KystLS0tLS0tLS0KPj4+IMKgwqAzIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI2
IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NhY2hlZmx1c2guaAo+Pj4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+
Pj4gaW5kZXggMDNlM2I5NWFlNmRhLi4xMGU1ZTk2ZjA5YjUgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+Pj4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9jYWNoZWZsdXNoLmgKPj4+IEBAIC0xNSwyMCArMTUsMTkgQEAgc3RhdGljIGlubGlu
ZSB2b2lkIGxvY2FsX2ZsdXNoX2ljYWNoZV9hbGwodm9pZCkKPj4+IMKgIMKgwqAjZGVmaW5lIFBH
X2RjYWNoZV9jbGVhbiBQR19hcmNoXzEKPj4+IMKgIC1zdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hf
ZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4+PiArc3RhdGljIGlubGluZSB2b2lkIGZs
dXNoX2RjYWNoZV9mb2xpbyhzdHJ1Y3QgZm9saW8gKmZvbGlvKQo+Pj4gwqDCoHsKPj4+IC3CoMKg
wqDCoMKgwqDCoC8qCj4+PiAtwqDCoMKgwqDCoMKgwqAgKiBIdWdlVExCIHBhZ2VzIGFyZSBhbHdh
eXMgZnVsbHkgbWFwcGVkIGFuZCBvbmx5IGhlYWQgcGFnZQo+Pj4gd2lsbCBiZQo+Pj4gLcKgwqDC
oMKgwqDCoMKgICogc2V0IFBHX2RjYWNoZV9jbGVhbiAoc2VlIGNvbW1lbnRzIGluIGZsdXNoX2lj
YWNoZV9wdGUoKSkuCj4+PiAtwqDCoMKgwqDCoMKgwqAgKi8KPj4+IC3CoMKgwqDCoMKgwqDCoGlm
IChQYWdlSHVnZShwYWdlKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwYWdl
ID0gY29tcG91bmRfaGVhZChwYWdlKTsKPj4+IC0KPj4+IC3CoMKgwqDCoMKgwqDCoGlmICh0ZXN0
X2JpdChQR19kY2FjaGVfY2xlYW4sICZwYWdlLT5mbGFncykpCj4+PiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgY2xlYXJfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBhZ2UtPmZsYWdzKTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoGlmICh0ZXN0X2JpdChQR19kY2FjaGVfY2xlYW4sICZmb2xpby0+
ZmxhZ3MpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsZWFyX2JpdChQR19k
Y2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpOwo+Pj4gwqDCoH0KPj4+ICsjZGVmaW5lIGZsdXNo
X2RjYWNoZV9mb2xpbyBmbHVzaF9kY2FjaGVfZm9saW8KPj4+IMKgwqAjZGVmaW5lIEFSQ0hfSU1Q
TEVNRU5UU19GTFVTSF9EQ0FDSEVfUEFHRSAxCj4+PiDCoCArc3RhdGljIGlubGluZSB2b2lkIGZs
dXNoX2RjYWNoZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+Pj4gK3sKPj4+ICvCoMKgwqDCoMKg
wqDCoGZsdXNoX2RjYWNoZV9mb2xpbyhwYWdlX2ZvbGlvKHBhZ2UpKTsKPj4+ICt9Cj4+PiArCj4+
PiDCoMKgLyoKPj4+IMKgwqAgKiBSSVNDLVYgZG9lc24ndCBoYXZlIGFuIGluc3RydWN0aW9uIHRv
IGZsdXNoIHBhcnRzIG9mIHRoZQo+Pj4gaW5zdHJ1Y3Rpb24gY2FjaGUsCj4+PiDCoMKgICogc28g
aW5zdGVhZCB3ZSBqdXN0IGZsdXNoIHRoZSB3aG9sZSB0aGluZy4KPj4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4gYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAo+Pj4gaW5kZXggMTMyMjJmZDVjNGI0Li4wMzcwNmM4MzNlNzAgMTAwNjQ0
Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4gKysrIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+IEBAIC00MDUsOCArNDA1LDggQEAgc3Rh
dGljIGlubGluZSBwdGVfdCBwdGVfbW9kaWZ5KHB0ZV90IHB0ZSwKPj4+IHBncHJvdF90IG5ld3By
b3QpCj4+PiDCoCDCoCDCoMKgLyogQ29tbWl0IG5ldyBjb25maWd1cmF0aW9uIHRvIE1NVSBoYXJk
d2FyZSAqLwo+Pj4gLXN0YXRpYyBpbmxpbmUgdm9pZCB1cGRhdGVfbW11X2NhY2hlKHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hLAo+Pj4gLcKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBhZGRy
ZXNzLCBwdGVfdCAqcHRlcCkKPj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNo
ZV9yYW5nZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QKPj4+ICp2bWEsCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdW5zaWduZWQgbG9uZyBhZGRyZXNzLCBwdGVfdCAqcHRlcCwgdW5z
aWduZWQgaW50IG5yKQo+Pj4gwqDCoHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoC8qCj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBUaGUga2VybmVsIGFzc3VtZXMgdGhhdCBUTEJzIGRvbid0IGNhY2hl
IGludmFsaWQgZW50cmllcywKPj4+IGJ1dAo+Pj4gQEAgLTQxNSw4ICs0MTUsMTAgQEAgc3RhdGlj
IGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGUoc3RydWN0Cj4+PiB2bV9hcmVhX3N0cnVjdCAq
dm1hLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICogUmVseWluZyBvbiBmbHVzaF90bGJfZml4X3Nw
dXJpb3VzX2ZhdWx0IHdvdWxkIHN1ZmZpY2UsIGJ1dAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICog
dGhlIGV4dHJhIHRyYXBzIHJlZHVjZSBwZXJmb3JtYW5jZS7CoCBTbywgZWFnZXJseQo+Pj4gU0ZF
TkNFLlZNQS4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gLcKgwqDCoMKgwqDCoMKgZmx1
c2hfdGxiX3BhZ2Uodm1hLCBhZGRyZXNzKTsKPj4+ICvCoMKgwqDCoMKgwqDCoGZsdXNoX3RsYl9y
YW5nZSh2bWEsIGFkZHJlc3MsIGFkZHJlc3MgKyBuciAqIFBBR0VfU0laRSk7Cj4+IFRoZSBmbHVz
aF90bGJfcmFuZ2UoKSBvZiByaXNjdiBpcyBhIGxpdHRsZSBiaXQgc3RyYW5nZSB0byBtZS4gSXQg
Z2l2ZXMKPj4gX19zYmlfdGxiX2ZsdXNoX3JhbmdlKCkgc3RyaWRlIFBBR0VfU0laRS4gVGhhdCBt
ZWFucyBpZiAoZW5kIC0gc3RhcnQpCj4+IGlzIGxhcmdlciB0aGFuIHN0cmlkZSwgaXQgd2lsbCB0
cmlnZ2VyIGZsdXNoX3RsYl9hbGwoKS4KPj4KPj4gU28gdGhpcyBjaGFuZ2UgY291bGQgdHJpZ2dl
ciBmbHVzaF90bGJfYWxsKCkgd2hpbGUgb3JpZ2luYWwKPj4gZmx1c2hfdGxiX3BhZ2UoKSBqdXN0
IHRyaWdnZXIgZmx1c2hfdGxiX3BhZ2UoKS4KPiAKPiAKPiBNYXliZSBJJ20gbWlzc2luZyBzb21l
dGhpbmcgYnV0IHVwZGF0ZV9tbXVfY2FjaGUgYmVoYXZpb3VyIGlzIG5vdCBjaGFuZ2VkIGhlcmUs
IGl0IHdpbGwgYWx3YXlzIGNhbGwgZmx1c2hfdGxiX3BhZ2UgYXMgbnIgPT0gMSwgcmlnaHQ/Clll
cy4gVGhpcyBpcyBteSB1bmRlcnN0YW5kaW5nIHRvby4gVGhhbmtzLgoKClJlZ2FyZHMKWWluLCBG
ZW5nd2VpCgo+IAo+IHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2UgdGhvdWdoIHdpbGwgbGlrZWx5IGNh
bGwgZmx1c2hfdGxiX2FsbDogSSBoYXZlIHRvIGFkbWl0IHRoYXQgSSdtIHdvbmRlcmluZyB3aHkg
d2UgZG9uJ3Qgb25seSBmbHVzaCB0aGUgcmFuZ2Ugb2YgcGFnZXMgaW5zdGVhZCBvZiBmbHVzaGlu
ZyBldmVyeXRoaW5nLCBJJ2xsIGxvb2sgaW50byB0aGF0Lgo+IAo+IEFsZXgKPiAKPiAKPj4KPj4g
TXkgdW5kZXJzdGFuZGluZyBpcyBmbHVzaF90bGJfcGFnZSgpIHNob3VsZCBiZSBiZXR0ZXIgYmVj
YXVzZQo+PiBmbHVzaF9wbWRfdGxiX3JhbmdlKCkgaGFzIFBNRF9TSVpFIGFzIHN0cmlkZSB0byBh
dm9pZCBmbHVzaF90bGJfYWxsKCkuCj4+IEkgbXVzdCBtaXNzIHNvbWV0aGluZyBoZXJlLgo+Pgo+
PiBSZWdhcmRzCj4+IFlpbiwgRmVuZ3dlaQo+Pgo+Pj4gwqDCoH0KPj4+ICsjZGVmaW5lIHVwZGF0
ZV9tbXVfY2FjaGUodm1hLCBhZGRyLCBwdGVwKSBcCj4+PiArwqDCoMKgwqDCoMKgwqB1cGRhdGVf
bW11X2NhY2hlX3JhbmdlKHZtYSwgYWRkciwgcHRlcCwgMSkKPj4+IMKgIMKgwqAjZGVmaW5lIF9f
SEFWRV9BUkNIX1VQREFURV9NTVVfVExCCj4+PiDCoMKgI2RlZmluZSB1cGRhdGVfbW11X3RsYiB1
cGRhdGVfbW11X2NhY2hlCj4+PiBAQCAtNDU2LDEyICs0NTgsMjEgQEAgc3RhdGljIGlubGluZSB2
b2lkIF9fc2V0X3B0ZV9hdChzdHJ1Y3QKPj4+IG1tX3N0cnVjdCAqbW0sCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqBzZXRfcHRlKHB0ZXAsIHB0ZXZhbCk7Cj4+PiDCoMKgfQo+Pj4gwqAgLXN0YXRpYyBp
bmxpbmUgdm9pZCBzZXRfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+Pj4gLcKgwqDCoMKg
wqDCoMKgdW5zaWduZWQgbG9uZyBhZGRyLCBwdGVfdCAqcHRlcCwgcHRlX3QgcHRldmFsKQo+Pj4g
K3N0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcHRlcyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWdu
ZWQgbG9uZwo+Pj4gYWRkciwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdGVf
dCAqcHRlcCwgcHRlX3QgcHRldmFsLCB1bnNpZ25lZCBpbnQgbnIpCj4+PiDCoMKgewo+Pj4gLcKg
wqDCoMKgwqDCoMKgcGFnZV90YWJsZV9jaGVja19wdGVzX3NldChtbSwgYWRkciwgcHRlcCwgcHRl
dmFsLCAxKTsKPj4+IC3CoMKgwqDCoMKgwqDCoF9fc2V0X3B0ZV9hdChtbSwgYWRkciwgcHRlcCwg
cHRldmFsKTsKPj4+ICvCoMKgwqDCoMKgwqDCoHBhZ2VfdGFibGVfY2hlY2tfcHRlc19zZXQobW0s
IGFkZHIsIHB0ZXAsIHB0ZXZhbCwgbnIpOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgZm9yICg7
Oykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoF9fc2V0X3B0ZV9hdChtbSwg
YWRkciwgcHRlcCwgcHRldmFsKTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
ZiAoLS1uciA9PSAwKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBicmVhazsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwdGVwKys7
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRkciArPSBQQUdFX1NJWkU7Cj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHRlX3ZhbChwdGV2YWwpICs9IDEgPDwg
X1BBR0VfUEZOX1NISUZUOwo+Pj4gK8KgwqDCoMKgwqDCoMKgfQo+Pj4gwqDCoH0KPj4+ICsjZGVm
aW5lIHNldF9wdGVfYXQobW0sIGFkZHIsIHB0ZXAsIHB0ZSkgc2V0X3B0ZXMobW0sIGFkZHIsIHB0
ZXAsCj4+PiBwdGUsIDEpCj4+PiDCoCDCoMKgc3RhdGljIGlubGluZSB2b2lkIHB0ZV9jbGVhcihz
dHJ1Y3QgbW1fc3RydWN0ICptbSwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcg
YWRkciwgcHRlX3QgKnB0ZXApCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9jYWNoZWZs
dXNoLmMgYi9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+Pj4gaW5kZXggM2NjMDdlZDQ1YWVi
Li5iNzI1YzNmNmY1N2YgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2gu
Ywo+Pj4gKysrIGIvYXJjaC9yaXNjdi9tbS9jYWNoZWZsdXNoLmMKPj4+IEBAIC04MSwxNiArODEs
OSBAQCB2b2lkIGZsdXNoX2ljYWNoZV9tbShzdHJ1Y3QgbW1fc3RydWN0ICptbSwgYm9vbAo+Pj4g
bG9jYWwpCj4+PiDCoMKgI2lmZGVmIENPTkZJR19NTVUKPj4+IMKgwqB2b2lkIGZsdXNoX2ljYWNo
ZV9wdGUocHRlX3QgcHRlKQo+Pj4gwqDCoHsKPj4+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBwYWdl
ICpwYWdlID0gcHRlX3BhZ2UocHRlKTsKPj4+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBmb2xpbyAq
Zm9saW8gPSBwYWdlX2ZvbGlvKHB0ZV9wYWdlKHB0ZSkpOwo+Pj4gwqAgLcKgwqDCoMKgwqDCoMKg
LyoKPj4+IC3CoMKgwqDCoMKgwqDCoCAqIEh1Z2VUTEIgcGFnZXMgYXJlIGFsd2F5cyBmdWxseSBt
YXBwZWQsIHNvIG9ubHkgc2V0dGluZwo+Pj4gaGVhZCBwYWdlJ3MKPj4+IC3CoMKgwqDCoMKgwqDC
oCAqIFBHX2RjYWNoZV9jbGVhbiBmbGFnIGlzIGVub3VnaC4KPj4+IC3CoMKgwqDCoMKgwqDCoCAq
Lwo+Pj4gLcKgwqDCoMKgwqDCoMKgaWYgKFBhZ2VIdWdlKHBhZ2UpKQo+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHBhZ2UgPSBjb21wb3VuZF9oZWFkKHBhZ2UpOwo+Pj4gLQo+Pj4g
LcKgwqDCoMKgwqDCoMKgaWYgKCF0ZXN0X2FuZF9zZXRfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBh
Z2UtPmZsYWdzKSkKPj4+ICvCoMKgwqDCoMKgwqDCoGlmICghdGVzdF9hbmRfc2V0X2JpdChQR19k
Y2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGZsdXNoX2ljYWNoZV9hbGwoKTsKPj4+IMKgwqB9Cj4+PiDCoMKgI2VuZGlmIC8q
IENPTkZJR19NTVUgKi8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
