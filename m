Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF796C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1w5P39Hiu+k5JlIXaBRUWWiFeSMYpdJ25YX4v1PF9p4=; b=k7ELXvIK5D2zigaQba8DQLpuX3
	AEGlI992e7LQXUpwabEytcH/ALm8h8WjRglGdZ6Pivlt9bJgR51mtDG/0dmpYI7pYt1cpG7+UyvTC
	27AkJXQHfk3/SxfECD+cNTTH0hMCdGxpwTvmvlvWuFsnOXzaKQP7s3LQwDvW1/pV45vcLd0dn+DqE
	zOtvUdhliA29yczoL5P/9ZWp8wXb7ae8hrgYQJBNRCPiozc3GcINDHpfzRimIb1eRG30L43TLxwKI
	1Kb8bZvIIu8ylNwi+NsTxVlj2WdEE0uryBkzitSnmIZeKS7IfUKAQAGFjJE78lLVQvIFMK7MUWSiH
	Iux/UAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlcM-00BOAb-0m; Mon, 27 Feb 2023 22:05:10 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWlcG-00BO7q-Ns
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 22:05:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677535504; x=1709071504;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=55LANcZrdBP3N403LyGCoiZlCSUIVc5RtfKtqXiQaUo=;
  b=ke3HaxCDs45owuvw9BJE7/CtVdOlKBdRjrJlrtqKbAJhAihGLKoQU8zy
   IsMnWg6jwhEXf18vxsa3UikHVcoQ669HUoAnYNDciOkLFJAnhidCoFzMX
   ezDa17Sk5mCBGIbQCNIsQ9WurHHOJBcfLB3b2Pum0FsS2NYOk7MVCNizZ
   7+yx7286bgwPq2cZIO8KRzmv+o6Re9/aOCuJQVpY/6aBWbaeEuDm98Iv0
   UPyEO7dk2NsOy/o4rveQzSGa8TfQnnqhd/zvD4jRQ0+RqjxFQOz89H60E
   rwA5nufR2oCfsg24ufWIt4Ye22E8R0ew+5m7fEIVy8BAPx19faTYMonSp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="314404686"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="314404686"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 14:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="848006974"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="848006974"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2023 14:05:00 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 27 Feb 2023 14:04:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 27 Feb 2023 14:04:59 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 27 Feb 2023 14:04:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfuxQ0Z0BIeY4K2yzaFhYdBW+VPkyc6NcpCH/FXvgEHyXKKVcGdYOuZ67TDtaCM3x/daKVqzBFw0QgPnZ8Cn8l+MY8mnbYjT72a/qJAfBsjkZ6uxX6cWvM/e7MLkKv93jkYgN3RFMLfRBStm3fQzDp6z68LcaipOa1pFnRFvr9yQXQ1H43T2/dU4IT0QdhHRMKX8QfW8lSWeXKXv1HP9J5LCTKaU7twENcPax2LR4ND/2Tqe7raCdGLw3YHh4shEK+GzrHIs/pjLr6AiMA2PHebmWpVo2iYZNPHRCo1SJnsPk4sMXp2mZmCSom2+GiZYD6HHKs11RPPjoj5qaLWXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55LANcZrdBP3N403LyGCoiZlCSUIVc5RtfKtqXiQaUo=;
 b=ZD07d8TNVuhZ1H9j3uS5AQjFZoK5k93iTLKv9ke8nHV49BgefCEv6rB8skkBQfsHBgpjpmIGJfCrY/+hpkpNpJEBlSuEL6InVKDNRu7Ro00xmG8A20AOEs/Bu96A3vPc4Fdfr6XiVt8KvHLMi81clG64Qj+OVvNmQ4IpqYe+0E5xXDmm+ymwiu4NttAFKwsIgcIhUi3RiGHZgzBxu/WfgCUR8QUnuf/CmjukV0sgEP8ruSJkjgG7rBAYVUz1hDe+7ifEFWBWuAkLj0gK+tg+pKGTm0b5ZnhQTYeoA6K5r6VKKvfi+oifCr8LEhqp/DWwgZXZRU5m2CxLgpICpWb8HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14)
 by BN9PR11MB5419.namprd11.prod.outlook.com (2603:10b6:408:100::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 22:04:54 +0000
Received: from DM5PR11MB1899.namprd11.prod.outlook.com
 ([fe80::dcb3:5ba7:4576:d776]) by DM5PR11MB1899.namprd11.prod.outlook.com
 ([fe80::dcb3:5ba7:4576:d776%6]) with mapi id 15.20.6134.021; Mon, 27 Feb 2023
 22:04:54 +0000
Message-ID: <21bebf9d-eb27-5607-b0a9-274c46ef8aa3@intel.com>
Date: Mon, 27 Feb 2023 14:04:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v1 0/6] PolarFire SoC Auto Update Support
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>, Xu Yilun <yilun.xu@intel.com>
CC: Conor Dooley <conor@kernel.org>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Tom Rix <trix@redhat.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-fpga@vger.kernel.org>
References: <20230217164023.14255-1-conor@kernel.org>
 <Y/ht1eHgtRrLxIhC@yilunxu-OptiPlex-7050> <Y/h1KFGSw13OabYw@wendy>
From: Russ Weight <russell.h.weight@intel.com>
In-Reply-To: <Y/h1KFGSw13OabYw@wendy>
X-ClientProxiedBy: MW4PR03CA0334.namprd03.prod.outlook.com
 (2603:10b6:303:dc::9) To DM5PR11MB1899.namprd11.prod.outlook.com
 (2603:10b6:3:10b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:EE_|BN9PR11MB5419:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b32686d-a052-459f-a36e-08db190ea7ac
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9K3PLDWF00C73iUGAgwF532sHWVtDPVyrewKagNXjTYllqxfU3XfWzKxThGZvfVn1JtjxJ6JNRuMq861nN7oqjKRLo6HhRJ45rqLK2S/1R1W7d7snwJZL8u7Wt3yWd/ErhWnxqk8LpZlVBW3JTwWIWgecnPe50OGOaAB/Gj8PLhvXP9KDRzvuUFO2WLwZxtWRVsun4fWNz4/54uO//Re7KX4k5sLZBJhRjRJYJwEuizb/tiHB7fYZWpe5z+RhMl6935CdhoV8xQ5H6ITWwRaREid+py/ZhbWc2bpdtBZJmvdCWlTfxjdJ2VOXhKDiMWgIddt+nqNBMIsQrU5p/fgeQQJo+/0akq07MtwR9JR3mBrRRyq/SfQb1X7nsjVWBFusWHztUzJX3xyHvlEuzo1n+y3U8E85DW9ZuQnoMl6I/lHchStbqiymSvFQo+UQaOIiMajiKbd9fIQXBeAjoLF7wimz83Y5AOXNsLXuJhfXkmiSF+YOsUy7rqJNqse/iP0iNg1xKbxtGDEc2WiocWlaw5lQu6uH75bwqVgF0ja1baIfwfL00Z0GpBkkPqOZx7m/t7Tn/NucgL0YHd6o9Rs0dE+940QciJJPwdXvvIiqWr6/6mXfi4aLRMz/lgMf6A47p4Ieg2Bo/k89Zh5R8AHP3qpfe8GypNXIRIjrfyj2NSLcMdizZsLWYdirPOtmAo8lF7jpDWbG9hvJoiew0Ev0gjlaFyJId/hBg52gxa4JGktCPckgT87eLuZDjfV263JMVt3ajjBrkk4Pnk/t5Gwjg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB1899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(376002)(136003)(396003)(39860400002)(451199018)(36756003)(110136005)(6636002)(54906003)(316002)(83380400001)(6666004)(66476007)(6486002)(966005)(6512007)(2616005)(6506007)(26005)(478600001)(186003)(8936002)(53546011)(41300700001)(2906002)(86362001)(31696002)(66946007)(5660300002)(7416002)(15650500001)(66556008)(8676002)(38100700002)(4326008)(82960400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWk2U0IrTVpsTUppeTU1TXdNU1ZPTzBQNTZmVDNQd01HeGU4enpVQzN2ZG81?=
 =?utf-8?B?aWQxMk5lTGRwQzIrdGY4ZWFCc1NuVjBXbng1dEhZdXRQKy82U1ZESHIwMlFH?=
 =?utf-8?B?TWoySnQzOWJiOVA4TGljWEVkaHRXYjJiNWJQTHNRS2lKWlk5MGtYeHZvVU5y?=
 =?utf-8?B?dk40d2RiamUxdXlPakYzazdCT05OKzQ5NHJ5dTFzQ1g0TlErN250eGd0bXY5?=
 =?utf-8?B?cVBGOGEvS3hseEpOU1lEZVVkVGtVVExxSzNRWXhUc1JvdE1xVUJDWllVQVpa?=
 =?utf-8?B?WVpOd3VnV3psbWo1bVY5SC9PYk1oNnkxN1UxdllwaXlORzBIQlJLNytqZ1VK?=
 =?utf-8?B?bnVZcW5UL29tMk52YUJQTkhvMDRpbjJvWlhlN28xYmx4aU1rN2VTYm9Xektp?=
 =?utf-8?B?S2VlakJRMDZjNVNuTzh2TkRkOFNiM3lkVXdibnZvbElTbThsbDgrV3Qvck5C?=
 =?utf-8?B?WGRoOW5MQjZkZnJUTGhsOHZaYW5YVkFaWDdMbVVObFgxWGJyOWpVS2NXUWpH?=
 =?utf-8?B?QXhzeXo1dWNOMUtvQUk3Ryszc1QvSEtSNFpoc3dnT1d4QkFBY2dML2pyTGd0?=
 =?utf-8?B?Y1pBYXR3NkZydER6MlNTMHdVQWt3VjVtS3AyTjBKbXVUQUNNeXB0NmJVOWlR?=
 =?utf-8?B?VEFXWkh2b1FITndXM0FJbVZydUEzaTlJMmRDUFRKNE9FZDRmblNVRk1iOURp?=
 =?utf-8?B?UFJUOXdKUUlkaE80cHZDaFRzTmpOK0YxUDJFMlh2RnJHSlhpcTJBSW5mU2E1?=
 =?utf-8?B?NDh1Nnh0NWxhdHhjNFFwODYxSzQ5Zkl5cUM5cDdrTDlDR1prN1R4SDJPcHph?=
 =?utf-8?B?SHFwNWgwcmpqMnZMdzI3MXBwTXV0aE5tQkdPb1F0UDBQREhVNmhTaTZwQjhZ?=
 =?utf-8?B?cVFEOHBkdjRmczA2dFcrVG42SEN4VkhlOTUyMmYvQ2ZRNXNFaHJJTldUVktV?=
 =?utf-8?B?b0xVc3lyWnBFWUwvR0FhKzU3bDJHbFNYUVJYbUo0WVdCQXM4YnFBYzB5eHNC?=
 =?utf-8?B?ODJrblE3QUNRWFVRbGMrL3I3REhoK1VwRHhMOEhsYlpUTGhPMXp0OGtNcnlJ?=
 =?utf-8?B?S3RHazBPN3JSS0p2R2FCSEFSTlRtQTN6c2ptUGhNdm0ydy9FcDVENGFndDVt?=
 =?utf-8?B?R1RZQzk2Tm9VWWZKL1h6NTA2OFZnWEVXQ1hnaGNua0tmK1l0ZTdicmtTMTJs?=
 =?utf-8?B?dmlkQnJmRDhxblZvanlocWhxcXBwZ1d1YXVIeFhLWlQ1MFU3UjlJOUN6RTl2?=
 =?utf-8?B?Y1ozMSt1c09BVnpINS9IMWVtb213V2FzVDVmWG4zR25JOERTbXkvYTFsaTVW?=
 =?utf-8?B?eHBKUjlLeFRmeHR5N29LbXYrK0xWbDc0WXk2SndBMk5IV2NqMmF0cFlJQ1g0?=
 =?utf-8?B?QVMrTGN5R29wRHBlaHRPaXlhL01Ka3l6UWRqU2YyMnBBaEdLTHpJMFFnQ2NS?=
 =?utf-8?B?bVdqK3NQU1JuOFpPZUhlNUM5UkJtU2x0bUorcVVMMkx0Q3F6aHZxMlZOWkpz?=
 =?utf-8?B?R2R6cWJ2a2RxM2JkMEhrT2JMTE9hbmpySnZPT2h6aVRMMk1yN0YwY1hwUjhp?=
 =?utf-8?B?VHJHVmF6NG5ISFhJSnBkQ3BHR0c5NTU2MjVUVVNpUHhickxNc3NzdGpYUFFm?=
 =?utf-8?B?VDA2YitXbktNc0M4ejQ5aU5MMHlNbEhHM3ZnSUpudERhRWQzQS9vWjZKdy9x?=
 =?utf-8?B?Rm1hekF6Qy8ybXhUbkIwakhwZCswc3VPUHhaR05jR0Y3aXJOd3M3cjNNQ1dX?=
 =?utf-8?B?bE9qelJ1S3h2QXhtV0QxUGFFK3ZERDNTR2VXR1dxYmdKOXlpMFFtbEF0NEZS?=
 =?utf-8?B?K1VpRHZselJHZWRmVVhPV1psMVdpZWNVaWovMndHeFVGODlORnJab1NmR2Yx?=
 =?utf-8?B?RExmMHo4UXg2aGxMMmpLMEwrY0RVMzVVT2VqNFU5dUMzc3NCR0VtZGovaFpN?=
 =?utf-8?B?QlR1cnJaWXRHN2QrUUtoMnY0WStacVVzTDFTK001VXI5WFk4NlAxQ2Uxdmx4?=
 =?utf-8?B?cnJCeUdwbElHbGN3dnBERDlYeUZYOTVMUGZKa0taLzR3SjhySkRVWFcrcGVo?=
 =?utf-8?B?V0hOSTZBbXA4cW9Rb2ZIaE5VcUpzYi9FUjB2bjB1ajRnS2FVWWlMR1VwNmNW?=
 =?utf-8?B?NWVUb3RvejZCQTF0a0oweElyK2FqV2pESko3cFpBTlQxekNhMVAyNTloRStl?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b32686d-a052-459f-a36e-08db190ea7ac
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 22:04:53.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UQ6VJKOE/2SBQxlf03I2hyuBmvdrPsXEAM4QdvCbBRO97T41J+iy7/LCZEEOH/id3vz/OwQQmhMduInGwtis1bRDoWJxmUxFYIJsWGd5CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5419
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_140504_833221_0F9E851B 
X-CRM114-Status: GOOD (  23.03  )
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

Hi Conor,

On 2/24/23 00:28, Conor Dooley wrote:
> On Fri, Feb 24, 2023 at 03:57:09PM +0800, Xu Yilun wrote:
>> On 2023-02-17 at 16:40:17 +0000, Conor Dooley wrote:
>>> This patchset adds support for the "Auto Update" feature on PolarFire
>>> SoC that allows for writing an FPGA bistream to the SPI flash connected
>>> to the system controller.
>> I haven't fully checked the patches yet, just some quick comments:
>>
>> Since this feature is just to R/W the flash, and would not affect the
>> runtime FPGA region, I don't think an FPGA manager is actually needed.
>> Why not just use the MTD uAPI? There is a set of exsiting MTD uAPI &
>> MTD tool if I remember correctly.
> A lack of interest in opening up the system controller to userspace!
> You're right in that the writing of the image can be done that way, and
> while I was testing I used the userspace bits of mtd along the way - but
> for validating that the image we are writing we rely on the system
> controller.
> I'm really not interested in exposing the system controller's
> functionality, especially the bitstream manipulation parts, to userspace
> due to the risk of input validation bugs, so at least that side of
> things should remain in the kernel.
> I suppose I could implement something custom in drivers/soc that does
> the validation only, and push the rest out to userspace. Just seemed
> fitting to do the whole lot in drivers/fpga.
Conor,

In case you haven't already looked at the new firmware-upload
support in the firmware-loader, I'll give you some references
here to see if it fit you needs. This would only support the
write (not the read) but it would allow the controller to do
validation on the write.

The is the cover letter which shows a usage example:
https://lore.kernel.org/lkml/20220421212204.36052-1-russell.h.weight@intel.com/

And this is a pointer to the latest documentation for it:
https://docs.kernel.org/driver-api/firmware/fw_upload.html

The only current user is: drivers/fpga/intel-m10-bmc-sec-update.c

- Russ

>
> Cheers,
> Conor.
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
