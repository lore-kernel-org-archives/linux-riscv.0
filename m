Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05F1C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 12:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aLCPIPwT0/HNdD1n+7vamhtwokAf4HtZ4Ht6ULAf13s=; b=tilRsWfuWSOqVL/401R9va2Xnl
	nqpNdsVIUeHtnD3SxywmoNCqIIPJMyCQaCtURu7ruTFufxlC9Nw8LmArxykR5roM6mVoYAWWAS3yK
	hFTJ2Ur4/soeC5SqLCBgufZs2X2Zh0QxYTdI1vQw2j3c54AI4wWFgESQ+S7oOVZWMdNOv+VNbcM7F
	bd6gAtJn5AJ/OF9DX+ngmtWVeaQBGKt5INnSNPsO4NGCRIsOINxd9TwfY2sudExcljYKBoGXI7RhW
	loFGZpau8tTgtPpsXmffCMIK4Ekkmjb3toOlaxgkmaB1NVP7B2ERhOChc21OVoWzjoEiLQCI2ETkB
	rUP7yGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjGc-00FYQ9-QT; Wed, 08 Feb 2023 12:09:38 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPjGQ-00FYPA-Rl; Wed, 08 Feb 2023 12:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675858166; x=1707394166;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=is0pnbUlCSwNC13hHLUzg+YQtH+19+Etby7SBYvbZhw=;
  b=b7tfk/khM1lpgO/x30Sn/ra69l5NoyYSuIKrTOCekSJqRgXbYpYUi/J8
   5iZKzyuiV0ztTXLKJK6+Mbr7uotnEI0RBVCe8ad8AyT4dPKQfYTLA1q5v
   EoAqGMbjT1WGMWBQQ4gYUiiaTVTTCGA8Wyg0PlC0wuhjWTyguUiU70Pu6
   TeQ7sBsPsa+V566PIBvts6BuHJqyBsUvqjS3ofQ8L/ZUedSi/rdJB+1zA
   7SPClbReVkTfmTXApPH5tw9eua/UQ/mQPNHRU3NI1mS0qq9N9/LncmITx
   VRzyV0I1/YZ0b1hNiMZnDYLa2LgzXL8HXxt9saySP28rMb1HamARZTwqV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="357172660"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="357172660"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 04:09:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="775994587"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="775994587"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2023 04:09:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 8 Feb 2023 04:09:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 8 Feb 2023 04:09:14 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 8 Feb 2023 04:09:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UetAz8TcwLb92WJwlPycXHgOSX6nbCXukdgaXL26bB9XiWUNQxHEMRFGQ1XLYz7lM5JlQQubXnrfvTFWJNTMxEVnfQk5iKRIfpwpc872/kuMw5WHpQhA2Xl1kV6xD357u7c5JJxmbs5N/Nnj7FgWXpOmjBi5nhZLYHl3hMaCIOs3DfE3xmgRsyuC7sLeyq+HhF4rOdacNdoeQ5HMvOO2mEmakHBQGRoZUlGjgv+qMm8S056XsjhL+gxoTsdTgYojvVxYyTxa3aJYxIjQoeJUAYQE6OZ9PwGh4t+9PCQLcbzkkpmzn+liSidi3qV7wcsgk4cuyPgwUOnJU4t14TVzWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgq8yb/IGQqgIlS+tWoKk1s1+G5L24A9Gc4USdsUKyE=;
 b=WeNS+txvvlnKmoMufEvu8ytm5gWM8eaDBQk/OkrOoD+LGj7D9UukdOKxxJGo9VUWaJlYlXTQQxdd4fUdxRIV7WEymCV7+Hv9/2QpUkWsaNf4Zxwml/1mkKDEDVgWwWVmHWx1d0mNr9waHkyamTklNogYiGcT0fI8YilfBdrC2DXUl4tt3oKOTIQetpHFRxf3HACisWcck6njxFEeZuazTTSa3BA2cKxxMuVcXkCqZISNPgD4mAixbnpEDBCu+UKKTYStA5XPPSdr/1GmqjpdLhKESTIIa/mUImLT4B9fEubZi6GHAqEzxV/92ly37+QeFyZNySHEfxxdoeF1beVMrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4820.namprd11.prod.outlook.com (2603:10b6:303:6f::8)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.35; Wed, 8 Feb
 2023 12:09:11 +0000
Received: from CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4]) by CO1PR11MB4820.namprd11.prod.outlook.com
 ([fe80::1531:707:dec4:68b4%6]) with mapi id 15.20.6086.017; Wed, 8 Feb 2023
 12:09:11 +0000
Message-ID: <b44d5dc7-ee7a-80e0-5401-829bf5740de5@intel.com>
Date: Wed, 8 Feb 2023 20:09:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: API for setting multiple PTEs at once
To: Alexandre Ghiti <alex@ghiti.fr>, Matthew Wilcox <willy@infradead.org>,
	<linux-arch@vger.kernel.org>
CC: <linux-mm@kvack.org>, <linux-alpha@vger.kernel.org>,
	<linux-csky@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
	<linux-mips@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	<linux-parisc@vger.kernel.org>, <linux-sh@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<openrisc@lists.librecores.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
	<linux-xtensa@linux-xtensa.org>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
 <ba99ed28-61e4-4acd-ce17-338f5a49ef26@ghiti.fr>
Content-Language: en-US
From: "Yin, Fengwei" <fengwei.yin@intel.com>
In-Reply-To: <ba99ed28-61e4-4acd-ce17-338f5a49ef26@ghiti.fr>
X-ClientProxiedBy: SG2PR03CA0090.apcprd03.prod.outlook.com
 (2603:1096:4:7c::18) To CO1PR11MB4820.namprd11.prod.outlook.com
 (2603:10b6:303:6f::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4820:EE_|SA1PR11MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: 74446351-54ae-4c4a-5f78-08db09cd4997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3uX1/jzWwBD41j7lQH8xDqE+z6KOqrU1p4GTnaVEZudK4K+xQcNEe7JAbr9CB3MseGBWBguyx5VwRX6Y/tz7USNfmgAShnSfzhsH6sYkgxQ8Sk/jb/MRKCpEom3TzXzItgeSnB0SODs8AxMGHZZl9Cugno4pcmAjgtAIBv4/2nqWYrqkZz9etf9EGD83SsNp+YSKe1TsNf7ZPPhj9CYXnBFSdTWukPdBFLWLKBqL5/6+gZgfXGeUmDEBvXWCQsGyzMPBkMCg4dylY+ufTpZCLLAVjm7Nn4oND+dvxVMHprsDmcD823aBG3cbfEOuAc2qLGYUKCUoGw5Z9pkPxLXaANeFKt7cqUGmUofFPQSwiNlm0WmT0nxJNhMGrbMa8Q3cbgBx2MoJKK8G8CLySJHA5NmfsdH7VFnFtOyvW3hvZM3FlJV+sgXxCtlSa5js53PEO51DBa5WlUrG5OmygOfZnYtNE0//jR7abLekuGkxR/n+reTKdKJu9HapwjfDEU703n0dfrH8m1mkC+ilA1uQQjiX+W9qaYvAQUf4eTxpFiQbBVVuKyy7QjAhdDQ7VdM2FDFAS6wjEjpG1+RlThnW4CJP2JGVb9DjelTlMZE+QgiaF/wC0kij8/DxcZGr+aLxKTZAvI3k7O3l7/gf4qLLRzcdWTYRwShEGWNk1O2m+niYSD4fuMwiqjX45gy59budM5zfhO2t4DftoVIlk2AKGbcAl+SYD9xqsZ9o7J4+bgNSX2Jsaoff//dSYcSobzYgfg2Z0JIISBANMJhJxnvpbgw7EadXJ0FS6posiH9pVv3e0UkhC8/I9vNd6rRz0wlt
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199018)(8936002)(41300700001)(8676002)(6512007)(186003)(26005)(2616005)(83380400001)(82960400001)(2906002)(66946007)(4326008)(66476007)(66556008)(31696002)(31686004)(5660300002)(110136005)(7416002)(316002)(38100700002)(86362001)(6486002)(478600001)(966005)(6666004)(53546011)(6506007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3k1QkJlbXFBcHM2TDZ1N3d2NEF2bXk4b20wMEdHdmFPa2ZuTkdMYXZYbE9L?=
 =?utf-8?B?RlY1Vy9sNXV1a1ltMythM2d4ZllRU2M2cHhLTnMxS3B5c051Vm9FTmMxd3hM?=
 =?utf-8?B?MG5WSFZjdmN5SkZnWkt3Sml6ZWZROURpby9DVVY1WnhiaThFZ3F5V3RKeHZ2?=
 =?utf-8?B?ZXNqV3FVSWlpM2NGbmFtYzhSdEE0d25rM01qbUNBc24xSFVadDl1QmZMMzA4?=
 =?utf-8?B?UzBuYnFRNU1ldVVielIxMzAxVUFITzRYb1pkS2gxdTN3bVlSdmhISWIzNEdK?=
 =?utf-8?B?OUhyNmJERXBJcXo3Y2huR0RkaVc1azJWYVFDVGJ1US9IbkJRU2E2cnpSN244?=
 =?utf-8?B?aWJQVklSNzdDVHJaZ0M2czBQYTNaempPYjBma2hmL0EzRW1ldlVDUkpZY2tM?=
 =?utf-8?B?dlVCSFRyMk5iS2EyV2ZhTVdaZTdvbXZuNktiVjNsL0Z2ZFQzTzlldXlEVEJH?=
 =?utf-8?B?UFlZcFRONWxUMXBZeU5CdHNza2tBdDg5Yk1TMDlVZTNMYUVBWGxmcmFSNHV3?=
 =?utf-8?B?dGt5YVRKSWUyWXlJQmRtRmJaakpIVzdzeFRnNXZqSVRoTThSN1Z6Z2pjcHJl?=
 =?utf-8?B?UVgrUlBjbmljV3hjWjNEanhHa1MybGxZWWp1d1dpWnFZOXJRaE1HUTNvbUVx?=
 =?utf-8?B?NW5jUkdYWVdSSWFnQXNwN3BsenZuWVVCMElvajNsQi9MZm9WN0Mzc29kTTdG?=
 =?utf-8?B?UEZyY2w1MmU1R2k1UVNNUzRqTmJZTmxGMDlIQmtqeDR0NFQ0SGFDdDZyZ25r?=
 =?utf-8?B?cml1UHd4dCtiU2xQdHJNazgrMHU5dTNrdW9kZ0VmK1FCS2M1MnppenJKV3dT?=
 =?utf-8?B?VTB4RkdWYVFEdG54VXpxMnF1WWZTM29DQnJVQWxlUzUwRzR1ZithSFdERHNk?=
 =?utf-8?B?TzZNVjdsMzRGdHVOMXdjazE1Qm05alZXSCtuQmVVQnpMeHZma0x3NmhrcHJ0?=
 =?utf-8?B?UjJCRFZ1bllFaHA2R2JBZEp2UEpZOTdiT0FxZm8wZkZsTUNyR0NTL3hLMmM3?=
 =?utf-8?B?NHl1aHBoelhWTnBpUnMreThNaTU2SkVEazZmMnR3b21xMlY2eGtrSkJ5cHRV?=
 =?utf-8?B?S0paMjFndXVaSEFMYUlVWWsyOUxnbkJkWTdncE9XNDBCVkJ1T0hBYWpQd2Vs?=
 =?utf-8?B?bzc0NjExNTFWOUZheDJFQmlCa3VKWTVObW0ycmdnQ0h2dTNaa0d5UmxKVFBI?=
 =?utf-8?B?SFI0dU5WVnlpWjd0bWF4NDZTTklpYnlRSWpJU21iUHFoS0JLYjV0QVNXSTJK?=
 =?utf-8?B?VmVyaHFLT0RwYmtuMmMrNTgxVno4ZU9kdnhNTHlIRzhnNnAyL0N2MWJmTDMz?=
 =?utf-8?B?ZytRRHBnZVF5a3FYVjJ3TG9GRGZyOWpmUlVQT05CYXk1WXRJQVU0UnNlbmFt?=
 =?utf-8?B?UmdRUUJxZHB3V05XTnVDN1dSTEViVHNuQWRlYmFmMXQyS0M0VTluTU5CcmFj?=
 =?utf-8?B?SDV5alUvWEltS1B0MDhMWFBEZDRsK3FQYzFpZ1ZUVWdGTHh6a0JGY2NHdGxP?=
 =?utf-8?B?b0lmNFkwRk9mcVZiT1ZSRDZTdWI3UnlxaklmeHBIcGJTZEV1Zm9yK01Wangy?=
 =?utf-8?B?WjE0WW14THN0SWNhRUJSOEZNdFZMSlRCMDVVN3NlYmxoOHloN25oeUlvdjVQ?=
 =?utf-8?B?YnYzamU2aXpOVy93aU5IMHVJWmZxVWhxYzJRNXdiaUh0blR1V1I1Q09kUXp1?=
 =?utf-8?B?cXZSejU3TE9zeisvVUhSZ2J1ejduQVlxdFo2L1hBR0d0ZVh0MEpiak9lVnVu?=
 =?utf-8?B?Q1IycWxQUURIWFpOZ0dVY05TNmdwdC9jcnJ3L3Azd2lqL29od3YyWSs4d214?=
 =?utf-8?B?SkJqOWhnV2VzZW12cU55UTBGdHl6ODdSZGlQNldiVzR6U2VHYS85Zi91OGVO?=
 =?utf-8?B?eFFEV201Q0YvUGN2M2ZISUQ4WUkxVHNPNjFTZ3FPVGZ4akMyTTdyb1pJeVIy?=
 =?utf-8?B?YzRpNWhLVWpkaGpPVWVWWEg0Nzg4K3Y5WWU4TDdrcE1uT2FqQkFXTlMvMWxu?=
 =?utf-8?B?N2ZBMUhWSzdlYmZKMUJSbjlnaHRpeHZVUm0xcWN1MlEwRkhlS1F5L2daNzFz?=
 =?utf-8?B?Y2Q0VkdFZVoxUXRzdy9OVWdVbU8zMldHZm8wQmd6K1RZdE11MWZoSEJ0VDhy?=
 =?utf-8?B?WWxXM0kvV1IwZjV5TkZSUFB3VVFOdXduNmh2R0ZPSDVZQkluMDRROElUbUto?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74446351-54ae-4c4a-5f78-08db09cd4997
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:09:11.3003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zosHd4DwCyREAi4opUOQu23bZx1HzMLtiKazf49KiBq+KVmyfnJXQ3lMJfd91Maax6AZIK+hLTFMjjTOdSuVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_040926_979786_828D5B56 
X-CRM114-Status: GOOD (  18.52  )
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

CgpPbiAyLzgvMjAyMyA3OjIzIFBNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gSGkgTWF0dGhl
dywKPiAKPiBPbiAyLzcvMjMgMjE6MjcsIE1hdHRoZXcgV2lsY294IHdyb3RlOgo+PiBPbiBUaHUs
IEZlYiAwMiwgMjAyMyBhdCAwOToxNDoyM1BNICswMDAwLCBNYXR0aGV3IFdpbGNveCB3cm90ZToK
Pj4+IEZvciB0aG9zZSBvZiB5b3Ugbm90IHN1YnNjcmliZWQsIGxpbnV4LW1tIGlzIGN1cnJlbnRs
eSBkaXNjdXNzaW5nCj4+PiBob3cgYmVzdCB0byBoYW5kbGUgcGFnZSBmYXVsdHMgb24gbGFyZ2Ug
Zm9saW9zLsKgIEkgc2ltcGx5IG1hZGUgaXQgd29yawo+Pj4gd2hlbiBhZGRpbmcgbGFyZ2UgZm9s
aW8gc3VwcG9ydC7CoCBOb3cgWWluIEZlbmd3ZWkgaXMgd29ya2luZyBvbgo+Pj4gbWFraW5nIGl0
IGZhc3QuCj4+IE9LLCBoZXJlJ3MgYW4gYWN0dWFsIGltcGxlbWVudGF0aW9uOgo+Pgo+PiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1tbS8yMDIzMDIwNzE5NDkzNy4xMjI1NDMtMy13aWxs
eUBpbmZyYWRlYWQub3JnLwo+Pgo+PiBJdCBzdXJ2aXZlcyBhIHJ1biBvZiB4ZnN0ZXN0cy7CoCBJ
ZiB5b3VyIGFyY2hpdGVjdHVyZSBkb2Vzbid0IHN0b3JlIGl0cwo+PiBQRk5zIGF0IFBBR0VfU0hJ
RlQsIHlvdSdyZSBnb2luZyB0byB3YW50IHRvIGltcGxlbWVudCB5b3VyIG93biBzZXRfcHRlcygp
LAo+IAo+IAo+IHJpc2N2IHN0b3JlcyBpdHMgcGZuIGF0IFBBR0VfUEZOX1NISUZUIGluc3RlYWQg
b2YgUEFHRV9TSElGVCwgc2Ugd2UgbmVlZCB0byByZWltcGxlbWVudCBzZXRfcHRlcy4gQnV0IEkg
aGF2ZSBiZWVuIHBsYXlpbmcgd2l0aCB5b3VyIHBhdGNoc2V0IGFuZCB3ZSBuZXZlciBmYWxsIGlu
dG8gdGhlIGNhc2Ugd2hlcmUgc2V0X3B0ZXMgaXMgY2FsbGVkIHdpdGggbnIgPiAxLCBhbnkgaWRl
YSB3aHk/IEkgYm9vdGVkIGEgbGFyZ2UgdWJ1bnR1IGRlZmNvbmZpZyBhbmQgbGF1bmNoZWQgd2ls
bF9pdF9zY2FsZS5wYWdlX2ZhdWx0NC4KTmVlZCB0byB1c2UgeGZzIGZpbGVzeXN0ZW0gdG8gZ2V0
IGxhcmdlIGZvbGlvIGZvciBmaWxlIG1hcHBpbmcuCk90aGVyIGZpbGVzeXN0ZW0gbWF5IGJlIGFs
c28gT0suIEJ1dCBJIGp1c3QgdHJpZWQgeGZzLiBUaGFua3MuCgoKUmVnYXJkcwpZaW4sIEZlbmd3
ZWkKCj4gCj4gSSdsbCBjb21lIHVwIHdpdGggdGhlIHByb3BlciBpbXBsZW1lbnRhdGlvbiBvZiBz
ZXRfcHRlcyBhbnl3YXkgc29vbi4KPiAKPiBUaGFua3MsCj4gCj4gQWxleAo+IAo+IAo+PiBvciB5
b3UnbGwgc2VlIGVudGlyZWx5IHRoZSB3cm9uZyBwYWdlcyBtYXBwZWQgaW50byB1c2Vyc3BhY2Uu
wqAgWW91IG1heQo+PiBhbHNvIHdpc2ggdG8gaW1wbGVtZW50IHNldF9wdGVzKCkgaWYgaXQgY2Fu
IGJlIGRvbmUgbW9yZSBlZmZpY2llbnRseQo+PiB0aGFuIF9fcHRlKHB0ZXZhbChwdGUpICsgUEFH
RV9TSVpFKS4KPj4KPj4gQXJjaGl0ZWN0dXJlcyB0aGF0IGltcGxlbWVudCB0aGluZ3MgbGlrZSBm
bHVzaF9pY2FjaGVfcGFnZSgpIGFuZAo+PiB1cGRhdGVfbW11X2NhY2hlKCkgbWF5IHdhbnQgdG8g
cHJvcG9zZSBiYXRjaGVkIHZlcnNpb25zIG9mIHRob3NlLgo+PiBUaGF0J3MgYWxwaGEsIGNza3ks
IG02OGssIG1pcHMsIG5pb3MyLCBwYXJpc2MsIHNoLAo+PiBhcm0sIGxvb25nYXJjaCwgb3BlbnJp
c2MsIHBvd2VycGMsIHJpc2N2LCBzcGFyYyBhbmQgeHRlbnNhLgo+PiBNYWludGFpbmVycyBCQ0Mn
ZCwgbWFpbGluZyBsaXN0cyBDQydkLgo+Pgo+PiBJJ20gaGFwcHkgdG8gY29sbGVjdCBpbXBsZW1l
bnRhdGlvbnMgYW5kIHN1Ym1pdCB0aGVtIGFzIHBhcnQgb2YgYSB2Ni4KPj4KPj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPj4gaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
