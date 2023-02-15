Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F0BC636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:To:
	From:Subject:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+W4b/LrzFy+LIOhAPNLyZrfW8ill6s/4PIS0BPtMXg=; b=1wyf1c8kfBR5En
	vMzbpVSy6PqIXYSSYIDgF151OXNrrzyLIw99fAgIE0ceACuBQhHKetrK/3FTsPJ6M/iZLIRbRT/Fl
	Uvbv6di2dghGFDCmoHUInzUSWO3kXxp077u5H4jYB3/llCvBP1bvJkltvtEzttr1tPNOS/fAoiNdc
	uMMYlmv/skFC1adFzG/X7sShoanUwyPdk0PWGaZHaOxgENUSbfRxnOUhwzR+syoeJDrqSSoGrIOuz
	cYd6CFpocVklpse2NKu1C2JFPBS9FutunuH4Kdfiyp52RFrEizVKSGe1wyOkvOqnmg8//kYa3QBf2
	/EEOjHvok8g12bppkscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGt2-005l0t-N0; Wed, 15 Feb 2023 12:27:48 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGsz-005kzP-Ce
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 12:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676464065; x=1708000065;
  h=message-id:date:subject:from:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yTML99LW91LpxJb5rxKQqvR2226GEi/wpj2weDxD2r0=;
  b=RIuQUSdMINx39jviGeozqZneGNcJn8z4Bq+HTKnphkhczukEOgZ/gFhe
   KL8vkHaWfRrYSWj0jbM6Rg8wl5YpDMgok3LsisjItx6PdQFl2VVElt8Jm
   giYWrX+uBkns+onRIf9G1w0AJJ5rsIm8SFHdGcp+wkHgaALM/Na8SnR4G
   xRQT9VLt0H2W8sbeS1SwFnC9/6lW3855PM28V32AagszpH77jCICnVHdz
   rCr6RHSOou9g/H79k69npu1EdAs7cbQshEgGPAVnSJbLJTehjSjCx+0LW
   vF5RFs5cz0bjKW03jAYSA77nMd8NyjWntkNhgXev0yJuUgsNny+x/KqyN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311044638"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="311044638"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 04:27:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="647150852"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="647150852"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga006.jf.intel.com with ESMTP; 15 Feb 2023 04:27:41 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 04:27:41 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 15 Feb 2023 04:27:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 15 Feb 2023 04:27:40 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 15 Feb 2023 04:27:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE2fh+cyC0RMSatjPfuIaTh45Q6SqPPQla9pp90YV22z97EbDfLiZZDRW/2QW10LmaNvzWQ/BShWJbKdFAxv7Q4zPbRWf+zDFrj2LnnTnG5PBR6LKz21lnTMPP0H4TWekY6memZKNNcvv6Hlb/DazDVsOavneLYc2tb48MseB2M+9qSCiVHGz5gWePqvd/I+ZXem/0F1zyUTvq4cG7ZMLmUW3WH2v0eNTJ+L92cYS9tJ+zvA2D8uOLSBUn9bOY1mjBzVdWWhJ18eawxt3xsUTXdbKMkDpVGvXlw5heRQkskavjRUgTy79PRrBl3915CGVhEI0qs2HvV96CicCL2NBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl/YDM237XQdlrpBQdSrK+iyEAQ9BxUQfAxRg72O4YE=;
 b=mZa88SM6qPvO497cuKg+JaTXyUdBxwn3+z8xNB0Q5ZjX36bs2BiAqxHkxQyG35QgzjBRNKq3JloArw8JT030KGZDW3tOmcppmaV2x2cnuLQuF7yBr5dHkoT50KKQafMASs4ezwzUDLDJpZaAF2kvGR0KUdKEDhlrlQXRcBZRWEyjOb6YPVbhwrcgbN0gGQZg0ugFGhwK45OYe56z+zqiL/K7jMjq36ySJ7Z0MAhB1y8+oAC1dIuV7m9DyBefWeJfJtDLuEvKpk/T3qYustCgUdytWxqTvU2r+OqYX9xDFZbBkSQL5fveoVVTdp/P3ncjqljhEepDhu6fVwGvDTWY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 12:27:38 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4%7]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 12:27:38 +0000
Message-ID: <27809f5a-17fc-abf6-7703-62a3c1b41ef3@intel.com>
Date: Wed, 15 Feb 2023 20:27:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.2
Subject: Re: [PATCH 10/7] riscv: Implement the new page table range API
From: "Yin, Fengwei" <fengwei.yin@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, <linux-arch@vger.kernel.org>
References: <20230211033948.891959-1-willy@infradead.org>
 <20230215000446.1655635-1-willy@infradead.org>
 <20230215000446.1655635-2-willy@infradead.org>
 <c02faf6e4af4babd24b3107d5fc2c6bff1d63100.camel@intel.com>
Content-Language: en-US
In-Reply-To: <c02faf6e4af4babd24b3107d5fc2c6bff1d63100.camel@intel.com>
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|SJ0PR11MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: 25731f4e-2e17-4667-6a38-08db0f500659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dz3Helnsvf5rWor0iuCRW8w/WTVgcVxi8YCfQpdEvBpXDW9rKpLmehKqSwjwwdKobo/+oXdP+XVEnakBOdNLCkqSMFOEhWvZTf8z78KvfYLyNbhFmSWx4tncCjEElu90JSwxVwqIe7V92n9JzpxREQD4arCunM7EjRnclbwhkFaWGV0HCIvocVpyMh49K91dvdfiX7qwAQEO1PgdnJDUKk+WACV49rTKwT5nPWIGDs40KVD+i1vDCJSS6hkR27CATLe0vqw2alU8Nn+VT4D/ipQ2Qq7/3tU7PwdFVLeTWTKmS70U9/mEpvVjliJTmmH0t/iyx/I0r34C1rcvrqPr8ahlqOeHtqxn6SBj+6dqSq/sxkdg9n06Cq51lhoIauuRmkbYRpCeJz3iMTsYA3Hwy3D+eHN6LxjtNkC0OIoOGBLkQ9vH7Xd10/haVuB+UGwa3DBfGP9VDUkxyFV0FWKYaQxRuj5+5NfI5UBwgUD12PR5MtpBv7M/2IpEYVoeAavSGPpUzX4GNJ+VDOk1ZBR748EOEYKcjfo5BquATTUW5xLaQiQXs/fJH18xHr+dbPUk07ynNa8lXRFM+RuC6Rh/9rK30vJrnMxZRDqn9NuhAsVa8ZWIon2LDm38UesvvsvHM9KVQjsWn4gjfpzG5mltNTaMDflC5jxTUD45/bGpEccQBB0EsTZLlvDABsZ9sU3BmgkTgc+RrRvfURSIoiShuHFVHaH2YMZ2w0UEZbMWCHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(136003)(366004)(39860400002)(451199018)(36756003)(2906002)(5660300002)(6512007)(31696002)(83380400001)(6506007)(26005)(186003)(66476007)(2616005)(8676002)(66556008)(82960400001)(38100700002)(316002)(8936002)(6666004)(478600001)(86362001)(53546011)(6486002)(66946007)(41300700001)(31686004)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGFXK1FaUDJsWHJyUEQ0VXM3QWZZNEY5cHVwdTVRMEc4WjgzYUNCYWxsTnFD?=
 =?utf-8?B?SjRMREo3YXpGLzkwYXR0MXN1OExoTnlnKzFYdUp5bUVudnBZQUVEem5NNkwx?=
 =?utf-8?B?bVk4LzJmeXRQZ2JNbjFLQXBVdWdrVXJ4d2M1RmI3RnFJcmxHVG5zV2NLQUNk?=
 =?utf-8?B?U1o0aW4rVElwbWtpUnB6UklKTllIcUREa2JJM0pFcWlRWDVhV0VoVmZIc3RK?=
 =?utf-8?B?dml6K1NmLzlCOGtHa3k4U3RoT3U2TU5NZnFkYVZuMjJXVE1TTlJvb1dLRHJz?=
 =?utf-8?B?R0tTRklRUjByUDUvWGMraXhMOUo0eU5keXp0VGVmT0xlZTJwaDQrK2YxWUFM?=
 =?utf-8?B?d2NJREtURFE1c1lXSXZ0NElWUlNjSGZ1aDZuZUVCampYczg0L3FjSGxwb3pQ?=
 =?utf-8?B?cFFoWmN4OVUwbUtOeVV1MWFIellkM3R1a3VSWDM2eUpXOTM3VTFDSU5VdVAv?=
 =?utf-8?B?d0lPd0Exa3J1Rlg1eGZMS2lYSEhtT1VNR2tRcCt1MHcwRHViY1RIYWtqZStW?=
 =?utf-8?B?U1Y5NTVIeWhCRi9CS2NHU2grUitFVmNoWlZQMXJKbGNsYTJ4a2dzR0I2UUIw?=
 =?utf-8?B?R3lGVUFOTGY1cDBTVFlrS0taakFwY2JHUjYyNktDZlFzcVNET0xYNk1ycDVq?=
 =?utf-8?B?YnVMVmRoMHdPUi9CeTYxejNmVnhvWHQvejdBMTBWTER4Z3JrN3lBUkNUMlNC?=
 =?utf-8?B?bXpCR1lzQysvSnBtMjZZVDFuWDdKVThrMmlyTEc2dURMYlZmeVB1SkIzK29I?=
 =?utf-8?B?V1E0cUFWVUdpd2xsdlEzWTFjMnREQTRsYjNRNVZVd3RVa2RvbnQ0MTFmUEoz?=
 =?utf-8?B?ZlFPZUowY2VXaklWckpnZXNvb0NWTms5TDBrUG5VSmZNOS8vQkdVcTlLQW02?=
 =?utf-8?B?TnZSRlE5Nk9KVzFjYnZsb3JFb2hpVkpWK1ZhNWUvRjU5YXY3K0szOUMzZzEw?=
 =?utf-8?B?OFd6emZrR1F2ZGlOUDlzTDBwVHRvV1Aydy9TalFEd1BkSG1EQkJNMGpWcXhY?=
 =?utf-8?B?WjYyd1VZb3dSbXJSWFNtc3N0ODl0UDZKSEVCdGliNVJtVGZ0UEd5UHFUTWxD?=
 =?utf-8?B?QW5XUXJoRlFXMXBoSW90dXVxMXBWTEcxZDB4bmpkaFN3SUI1UlRNdGk2RlU5?=
 =?utf-8?B?OXpJZnQ2MVR6blVqN05Tb3JUZWx6aTNoc2xwTE9xeGRlamF4OWUwZTFZN2lj?=
 =?utf-8?B?REFtQkE1V0F1amUvYnVhekFKbnJNY28xRlc3Qy9iSDNuSytkODJGU1B2WmNJ?=
 =?utf-8?B?OVUzcjVUak8wMy9BZXdBNWlaNVlkb0orU0JrQVZTdG55ckRNS3h3Q1kwd2h4?=
 =?utf-8?B?QTZLNFcrT1VLTlBHRWhXVnF6WUxQeG4xVFJ0aW4xU0pDZGpqZ2tUVC9iaTB1?=
 =?utf-8?B?M2ZiYmVlTnZFeDFtbkZDdWxaNTg5aTJCNVJDbUdJQWphYjhlZnRBWFB3bHRW?=
 =?utf-8?B?UmhCWkJVbWhSMTlvZFUwYlluT0tGTFNsZVV6NDVBaFRRVk1SaTJMTFd2Vlc1?=
 =?utf-8?B?OTd4UlRSZFZYU1FXaVlVZmVyTTBub0xUbEtYT21LQjFWelFmWlNaTXpSYUx3?=
 =?utf-8?B?dmx6ZUdaNUh5SGNibEliSTlNV1gvbnNIMnBiYTI5ZGoyb2JCSS9icnZBSk1z?=
 =?utf-8?B?NEVtckhNanFqMFBIamk3b1ZQWHVyY2MzZDNnYkRQa1RQMmtiUEhvQ2RNNHhY?=
 =?utf-8?B?VXRZQkVPNmx0dFA1dTU4WkNTMDFZY0drNE9iMFIyQkhkRDJjRy9wMDVZMkFu?=
 =?utf-8?B?YlR2MWJoK2FzQzV5WVlkL1o2d0tta3NDRktCeTFoMnNMbEZDWlYzYnE1bUJx?=
 =?utf-8?B?S2E4RzNsWFhkSWpSL2lsdlZnbGpYVURaVW0yWmJRSEh6b1dvbThhTmc0UkF0?=
 =?utf-8?B?b2Z3U00vMWo3alh6bzEzY1F3alJqSllmSUY5NDNLbUQyVGk0MWRFK2tRdUNr?=
 =?utf-8?B?ejI1enNva0J3ZWNQM0lyL296YWpwTngxamVhNGt3bU9SSkJMRVlaQVZYK25w?=
 =?utf-8?B?bTFRRHpKRWlsbjhiOFkwY3EvVkNORkkxS1dCR1ZxUHYvNHRHdnBZRWJXWE1F?=
 =?utf-8?B?ckV0NjRMaENhejE4TmFVUnB6SVJtMkhqRUM4S1l4TWdoTXFUV2ZudE9zRUR1?=
 =?utf-8?Q?5D857fPJneVnF8jdP+TbqrR3A?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25731f4e-2e17-4667-6a38-08db0f500659
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 12:27:38.2942
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4mCsLohE/SLYPW2l6vEbwDU9foTGe97FWxBbfzQ3GUf71hXIT1UFJ34Y2o/AOthqxrea43xP0VeozwlM4N6FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_042745_508879_C2EEE3BB 
X-CRM114-Status: GOOD (  22.31  )
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

CgpPbiAyLzE1LzIwMjMgNDozNSBQTSwgWWluIEZlbmd3ZWkgd3JvdGU6Cj4gT24gV2VkLCAyMDIz
LTAyLTE1IGF0IDAwOjA0ICswMDAwLCBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSB3cm90ZToKPj4g
QWRkIHNldF9wdGVzKCksIHVwZGF0ZV9tbXVfY2FjaGVfcmFuZ2UoKSBhbmQgZmx1c2hfZGNhY2hl
X2ZvbGlvKCkuCj4+Cj4+IFRoZSBQR19kY2FjaGVfY2xlYXIgZmxhZyBjaGFuZ2VzIGZyb20gYmVp
bmcgYSBwZXItcGFnZSBiaXQgdG8gYmVpbmcgYQo+PiBwZXItZm9saW8gYml0Lgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSA8d2lsbHlAaW5mcmFkZWFkLm9yZz4K
Pj4gLS0tCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggfCAxOSArKysr
KysrKystLS0tLS0tLS0tCj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKg
wqAgfCAyNSArKysrKysrKysrKysrKysrKystLS0tLS0tCj4+IMKgYXJjaC9yaXNjdi9tbS9jYWNo
ZWZsdXNoLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSArKy0tLS0tLS0tLQo+PiDCoDMgZmlsZXMg
Y2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+PiBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY2FjaGVmbHVzaC5oCj4+IGluZGV4IDAzZTNiOTVhZTZkYS4uMTBlNWU5NmYw
OWI1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+PiBAQCAtMTUsMjAg
KzE1LDE5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKHZvaWQp
Cj4+IMKgCj4+IMKgI2RlZmluZSBQR19kY2FjaGVfY2xlYW4gUEdfYXJjaF8xCj4+IMKgCj4+IC1z
dGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCj4+
ICtzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX2ZvbGlvKHN0cnVjdCBmb2xpbyAqZm9s
aW8pCj4+IMKgewo+PiAtwqDCoMKgwqDCoMKgwqAvKgo+PiAtwqDCoMKgwqDCoMKgwqAgKiBIdWdl
VExCIHBhZ2VzIGFyZSBhbHdheXMgZnVsbHkgbWFwcGVkIGFuZCBvbmx5IGhlYWQgcGFnZQo+PiB3
aWxsIGJlCj4+IC3CoMKgwqDCoMKgwqDCoCAqIHNldCBQR19kY2FjaGVfY2xlYW4gKHNlZSBjb21t
ZW50cyBpbiBmbHVzaF9pY2FjaGVfcHRlKCkpLgo+PiAtwqDCoMKgwqDCoMKgwqAgKi8KPj4gLcKg
wqDCoMKgwqDCoMKgaWYgKFBhZ2VIdWdlKHBhZ2UpKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgcGFnZSA9IGNvbXBvdW5kX2hlYWQocGFnZSk7Cj4+IC0KPj4gLcKgwqDCoMKgwqDC
oMKgaWYgKHRlc3RfYml0KFBHX2RjYWNoZV9jbGVhbiwgJnBhZ2UtPmZsYWdzKSkKPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNsZWFyX2JpdChQR19kY2FjaGVfY2xlYW4sICZwYWdl
LT5mbGFncyk7Cj4+ICvCoMKgwqDCoMKgwqDCoGlmICh0ZXN0X2JpdChQR19kY2FjaGVfY2xlYW4s
ICZmb2xpby0+ZmxhZ3MpKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2xlYXJf
Yml0KFBHX2RjYWNoZV9jbGVhbiwgJmZvbGlvLT5mbGFncyk7Cj4+IMKgfQo+PiArI2RlZmluZSBm
bHVzaF9kY2FjaGVfZm9saW8gZmx1c2hfZGNhY2hlX2ZvbGlvCj4+IMKgI2RlZmluZSBBUkNIX0lN
UExFTUVOVFNfRkxVU0hfRENBQ0hFX1BBR0UgMQo+PiDCoAo+PiArc3RhdGljIGlubGluZSB2b2lk
IGZsdXNoX2RjYWNoZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+PiArewo+PiArwqDCoMKgwqDC
oMKgwqBmbHVzaF9kY2FjaGVfZm9saW8ocGFnZV9mb2xpbyhwYWdlKSk7Cj4+ICt9Cj4+ICsKPj4g
wqAvKgo+PiDCoCAqIFJJU0MtViBkb2Vzbid0IGhhdmUgYW4gaW5zdHJ1Y3Rpb24gdG8gZmx1c2gg
cGFydHMgb2YgdGhlCj4+IGluc3RydWN0aW9uIGNhY2hlLAo+PiDCoCAqIHNvIGluc3RlYWQgd2Ug
anVzdCBmbHVzaCB0aGUgd2hvbGUgdGhpbmcuCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3BndGFibGUuaAo+PiBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5o
Cj4+IGluZGV4IDEzMjIyZmQ1YzRiNC4uMDM3MDZjODMzZTcwIDEwMDY0NAo+PiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUv
YXNtL3BndGFibGUuaAo+PiBAQCAtNDA1LDggKzQwNSw4IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3Qg
cHRlX21vZGlmeShwdGVfdCBwdGUsCj4+IHBncHJvdF90IG5ld3Byb3QpCj4+IMKgCj4+IMKgCj4+
IMKgLyogQ29tbWl0IG5ldyBjb25maWd1cmF0aW9uIHRvIE1NVSBoYXJkd2FyZSAqLwo+PiAtc3Rh
dGljIGlubGluZSB2b2lkIHVwZGF0ZV9tbXVfY2FjaGUoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEsCj4+IC3CoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXAp
Cj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZV9yYW5nZShzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QKPj4gKnZtYSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVu
c2lnbmVkIGxvbmcgYWRkcmVzcywgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGludCBucikKPj4gwqB7
Cj4+IMKgwqDCoMKgwqDCoMKgwqAvKgo+PiDCoMKgwqDCoMKgwqDCoMKgICogVGhlIGtlcm5lbCBh
c3N1bWVzIHRoYXQgVExCcyBkb24ndCBjYWNoZSBpbnZhbGlkIGVudHJpZXMsCj4+IGJ1dAo+PiBA
QCAtNDE1LDggKzQxNSwxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdXBkYXRlX21tdV9jYWNoZShz
dHJ1Y3QKPj4gdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPj4gwqDCoMKgwqDCoMKgwqDCoCAqIFJlbHlp
bmcgb24gZmx1c2hfdGxiX2ZpeF9zcHVyaW91c19mYXVsdCB3b3VsZCBzdWZmaWNlLCBidXQKPj4g
wqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBleHRyYSB0cmFwcyByZWR1Y2UgcGVyZm9ybWFuY2UuwqAg
U28sIGVhZ2VybHkKPj4gU0ZFTkNFLlZNQS4KPj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiAtwqDC
oMKgwqDCoMKgwqBmbHVzaF90bGJfcGFnZSh2bWEsIGFkZHJlc3MpOwo+PiArwqDCoMKgwqDCoMKg
wqBmbHVzaF90bGJfcmFuZ2Uodm1hLCBhZGRyZXNzLCBhZGRyZXNzICsgbnIgKiBQQUdFX1NJWkUp
Owo+IAo+IFRoZSBmbHVzaF90bGJfcmFuZ2UoKSBvZiByaXNjdiBpcyBhIGxpdHRsZSBiaXQgc3Ry
YW5nZSB0byBtZS4gSXQgZ2l2ZXMKPiBfX3NiaV90bGJfZmx1c2hfcmFuZ2UoKSBzdHJpZGUgUEFH
RV9TSVpFLiBUaGF0IG1lYW5zIGlmIChlbmQgLSBzdGFydCkKPiBpcyBsYXJnZXIgdGhhbiBzdHJp
ZGUsIGl0IHdpbGwgdHJpZ2dlciBmbHVzaF90bGJfYWxsKCkuCj4gCj4gU28gdGhpcyBjaGFuZ2Ug
Y291bGQgdHJpZ2dlciBmbHVzaF90bGJfYWxsKCkgd2hpbGUgb3JpZ2luYWwKPiBmbHVzaF90bGJf
cGFnZSgpIGp1c3QgdHJpZ2dlciBmbHVzaF90bGJfcGFnZSgpLgo+IAo+IE15IHVuZGVyc3RhbmRp
bmcgaXMgZmx1c2hfdGxiX3BhZ2UoKSBzaG91bGQgYmUgYmV0dGVyIGJlY2F1c2UgCj4gZmx1c2hf
cG1kX3RsYl9yYW5nZSgpIGhhcyBQTURfU0laRSBhcyBzdHJpZGUgdG8gYXZvaWQgZmx1c2hfdGxi
X2FsbCgpLgo+IEkgbXVzdCBtaXNzIHNvbWV0aGluZyBoZXJlLgpTbyB0aGUgaHVnZSBwYWdlIGNh
biBoYXZlIG9uZSBUTEIgZm9yIGh1Z2UgcGFnZS4gU28gUE1EX1NJWkUgaGVyZQptYWtlcyBzZW5z
ZS4KClJlZ2FyZHMKWWluLCBGZW5nd2VpIAoKPiAKPiBSZWdhcmRzCj4gWWluLCBGZW5nd2VpCj4g
Cj4+IMKgfQo+PiArI2RlZmluZSB1cGRhdGVfbW11X2NhY2hlKHZtYSwgYWRkciwgcHRlcCkgXAo+
PiArwqDCoMKgwqDCoMKgwqB1cGRhdGVfbW11X2NhY2hlX3JhbmdlKHZtYSwgYWRkciwgcHRlcCwg
MSkKPj4gwqAKPj4gwqAjZGVmaW5lIF9fSEFWRV9BUkNIX1VQREFURV9NTVVfVExCCj4+IMKgI2Rl
ZmluZSB1cGRhdGVfbW11X3RsYiB1cGRhdGVfbW11X2NhY2hlCj4+IEBAIC00NTYsMTIgKzQ1OCwy
MSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19zZXRfcHRlX2F0KHN0cnVjdAo+PiBtbV9zdHJ1Y3Qg
Km1tLAo+PiDCoMKgwqDCoMKgwqDCoMKgc2V0X3B0ZShwdGVwLCBwdGV2YWwpOwo+PiDCoH0KPj4g
wqAKPj4gLXN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfcHRlX2F0KHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LAo+PiAtwqDCoMKgwqDCoMKgwqB1bnNpZ25lZCBsb25nIGFkZHIsIHB0ZV90ICpwdGVwLCBwdGVf
dCBwdGV2YWwpCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3B0ZXMoc3RydWN0IG1tX3N0cnVj
dCAqbW0sIHVuc2lnbmVkIGxvbmcKPj4gYWRkciwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHB0ZV90ICpwdGVwLCBwdGVfdCBwdGV2YWwsIHVuc2lnbmVkIGludCBucikKPj4gwqB7
Cj4+IC3CoMKgwqDCoMKgwqDCoHBhZ2VfdGFibGVfY2hlY2tfcHRlc19zZXQobW0sIGFkZHIsIHB0
ZXAsIHB0ZXZhbCwgMSk7Cj4+IC3CoMKgwqDCoMKgwqDCoF9fc2V0X3B0ZV9hdChtbSwgYWRkciwg
cHRlcCwgcHRldmFsKTsKPj4gK8KgwqDCoMKgwqDCoMKgcGFnZV90YWJsZV9jaGVja19wdGVzX3Nl
dChtbSwgYWRkciwgcHRlcCwgcHRldmFsLCBucik7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgZm9y
ICg7Oykgewo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX19zZXRfcHRlX2F0KG1t
LCBhZGRyLCBwdGVwLCBwdGV2YWwpOwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
aWYgKC0tbnIgPT0gMCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBicmVhazsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB0ZXArKzsK
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGFkZHIgKz0gUEFHRV9TSVpFOwo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHRlX3ZhbChwdGV2YWwpICs9IDEgPDwgX1BB
R0VfUEZOX1NISUZUOwo+PiArwqDCoMKgwqDCoMKgwqB9Cj4+IMKgfQo+PiArI2RlZmluZSBzZXRf
cHRlX2F0KG1tLCBhZGRyLCBwdGVwLCBwdGUpIHNldF9wdGVzKG1tLCBhZGRyLCBwdGVwLAo+PiBw
dGUsIDEpCj4+IMKgCj4+IMKgc3RhdGljIGlubGluZSB2b2lkIHB0ZV9jbGVhcihzdHJ1Y3QgbW1f
c3RydWN0ICptbSwKPj4gwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgYWRkciwgcHRlX3Qg
KnB0ZXApCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYyBiL2FyY2gv
cmlzY3YvbW0vY2FjaGVmbHVzaC5jCj4+IGluZGV4IDNjYzA3ZWQ0NWFlYi4uYjcyNWMzZjZmNTdm
IDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+PiArKysgYi9hcmNo
L3Jpc2N2L21tL2NhY2hlZmx1c2guYwo+PiBAQCAtODEsMTYgKzgxLDkgQEAgdm9pZCBmbHVzaF9p
Y2FjaGVfbW0oc3RydWN0IG1tX3N0cnVjdCAqbW0sIGJvb2wKPj4gbG9jYWwpCj4+IMKgI2lmZGVm
IENPTkZJR19NTVUKPj4gwqB2b2lkIGZsdXNoX2ljYWNoZV9wdGUocHRlX3QgcHRlKQo+PiDCoHsK
Pj4gLcKgwqDCoMKgwqDCoMKgc3RydWN0IHBhZ2UgKnBhZ2UgPSBwdGVfcGFnZShwdGUpOwo+PiAr
wqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZm9saW8gKmZvbGlvID0gcGFnZV9mb2xpbyhwdGVfcGFnZShw
dGUpKTsKPj4gwqAKPj4gLcKgwqDCoMKgwqDCoMKgLyoKPj4gLcKgwqDCoMKgwqDCoMKgICogSHVn
ZVRMQiBwYWdlcyBhcmUgYWx3YXlzIGZ1bGx5IG1hcHBlZCwgc28gb25seSBzZXR0aW5nCj4+IGhl
YWQgcGFnZSdzCj4+IC3CoMKgwqDCoMKgwqDCoCAqIFBHX2RjYWNoZV9jbGVhbiBmbGFnIGlzIGVu
b3VnaC4KPj4gLcKgwqDCoMKgwqDCoMKgICovCj4+IC3CoMKgwqDCoMKgwqDCoGlmIChQYWdlSHVn
ZShwYWdlKSkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBhZ2UgPSBjb21wb3Vu
ZF9oZWFkKHBhZ2UpOwo+PiAtCj4+IC3CoMKgwqDCoMKgwqDCoGlmICghdGVzdF9hbmRfc2V0X2Jp
dChQR19kY2FjaGVfY2xlYW4sICZwYWdlLT5mbGFncykpCj4+ICvCoMKgwqDCoMKgwqDCoGlmICgh
dGVzdF9hbmRfc2V0X2JpdChQR19kY2FjaGVfY2xlYW4sICZmb2xpby0+ZmxhZ3MpKQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZsdXNoX2ljYWNoZV9hbGwoKTsKPj4gwqB9Cj4+
IMKgI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
