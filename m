Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A41D606A329
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 17:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hw1xsNx3;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k6p0Dcyl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:CC:To:Subject:Date:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=nhbg3tufmvVsTfq246qZxOi47xp6XbLKiNDfcCMf7fg=; b=hw1xsNx35fXODQxCUCiPKnIU26
	6Km3nN/oUuHgWPi155l9PEm5d0M1fpeZpTqQ+PCgkNqQbrfoaWH1roV8RB7KaEefUEYTAxYgNqSfL
	8fCklBGX17pYUf39AKldgMESU3ScNFxgMjcZoenuTQNMYXSrkBuiY2b9dU8Q7ccMo1qNhj8DNeHg0
	DDxPngqSr/Z2EBejluKWtBz0fCTp54ps1vCXq4BrxUQB/LqilFOAZmfMi2cRM81Ypj7fmXKl03ZaF
	jbBpw4u5XZQe84zqtDVTIsDQu6XBt4NP8gCr1Ah1nTgGAWHeTX0qfKS/EgyajWn1vcJzfUKSE9JRm
	9oicNffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeQb-000000068Yh-2EiD;
	Wed, 04 Nov 2026 17:05:37 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeQZ-000000068Xk-00mp
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 17:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793811935; x=1825347935;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=suZlRyMGCDfHqO/bGu29sWtYIp5Efxw9blzGq5S8KvI=;
  b=k6p0Dcyl+UAXwqZhFwawBy9WFDAUJMDpnew47Rb3p7dzCi0Nyt739MhC
   3prXPbRVIyeMNVs3OnagljzPQCWVnCUeo4muMXBKV5XQxDyOVHCJm5DXZ
   /mCnxA6wh+inVDskLFj0WDEUlDUH3omABuC8MZm2n8/D/ldWWp+yMUVii
   beWRoStbopQSBRpBPPKqMGNB9ofdgldYdNLq7w+B7ruL7/6xFqcbVI8+j
   +sgKy1C37xFSmy7r9btTv4TcWYdL2NwiH9i0cF+WQUT5mHd8PyIkj38oI
   zxUYjHuD1wuHVPwGU52rIGU4rUK7jVYy1ZemxBXyhmdC0t2joWtVx8hfu
   w==;
X-CSE-ConnectionGUID: S0OkjeJpSbOprGNhS123mw==
X-CSE-MsgGUID: 44lDY81QQYaYX0x8oZiwOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2459812"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2459812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:05:34 -0800
X-CSE-ConnectionGUID: VAGW4Ml/SU2IFfElwJGZ6A==
X-CSE-MsgGUID: 2WyrfS7dRRuS3NxgPQgmCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6629366"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 09:05:33 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:05:32 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 09:05:32 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 09:05:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7bKh83LGAf3jGMdCIi25rqsPiTlh80HTdLON//TA3N5ys0jELLkh788SyE/vwxmAMqyJxm57XTV34O5ZeBETwcadvNGtl6bQYLnfvOh9d47FJJR/8TxRx9jE7o8xBvIdbQZuBTvwgZxf/wfnbVVSqz2bTMDbsONTEQUSKDa7jX8Wf8MC63K+Jl3RCW7DBG414PficS50+//tjadxCbp3Cn4phwgIv4NGEFxrDxtGd1p/vw4JULQfNy+9tKLAG3PicDMbEXT2cDoWfbLZiU1/cYtudBlLY7CUJSP/WRGmsmP3oP4EbfSPI+ld944Z2PShKujUjrMXrYq7vAIb6Qj0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4xvAMu5/sX+7pvq8rtNml9s23GleQcVNhbVI+SYdzs=;
 b=q6mlV08JiF33dv1PRpgrHrRsPXEP5Bbje9VL+y44U+/GOgsneWXqUyP8383fvtEbv1RpBlc1Pc4MBbN7D+xfmN0JqTk9sA2qkV6T1jyNpW1Pk8SABBRgS+mGMe6iiWFsI7Og6P1jEYilEKp9Q7tzr3SOu0KubR+cdeI4qPV0nzSsu2Y8IxqkBGCILMYWv4sJselW9CgAnotQjr9nagAqq/3UWU9fUi8MDpv6+b+aO8pnMH6WQ+6vNDqg3Yla8I6l3rq48tE5phVG4I/hoNYMJKFVMf8ooVmpZisKpgsBQGDfbYI+2EDhuWlAh2M2tpBogNpgve5XyAVe+O82df3Scw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB911879.namprd11.prod.outlook.com (2603:10b6:207:110::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 17:05:29 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 17:05:29 +0000
Message-ID: <3280b1b1-5697-4b62-9865-2601a86fb907@intel.com>
Date: Wed, 4 Nov 2026 09:05:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/6] MAINTAINERS: resctrl: Add myself as reviewer
To: Drew Fustini <fustini@kernel.org>, Adrien Ricciardi
	<aricciardi@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Albert Ou
	<aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, Babu Moger
	<babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>, Borislav Petkov
	<bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, Conor Dooley
	<conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua Yu
	<fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai
	<gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, James Morse
	<james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, "Liu
 Zhiwei" <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, Rob Herring
	<robh@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Sunil V L
	<sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, Weiwei Li
	<liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Zhanpeng Zhang
	<zhangzhanpeng.jasper@bytedance.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron
	<jic23@kernel.org>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<x86@kernel.org>, <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
 <20261104-dfustini-atl-sc-cbqri-dt-v10-6-1636a003a3c0@kernel.org>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-6-1636a003a3c0@kernel.org>
X-ClientProxiedBy: MW4PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:303:8e::25) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB911879:EE_
X-MS-Office365-Filtering-Correlation-Id: 049eb8d1-ba38-41a0-ac57-08df3a95d443
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|921020|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yejpMkAywr2iNqYJ7sVfnD4nKw1mgF4ZFlsYakVKNJ2o8lgSySTnKv6g58/2N/KNBzmobOQutNopNCCsn651F8tMEHYISk3YD9N3DdCN7y4+DOWR2BjURbdJF1m8d08hv+Wz0u1nOMIhRUrDGR11r6JD4LTegq6O03Twm/huvGtWoP7ttGKO0nC9bk34/2oUN70AX95ohZ1KSo07h5Oh9XEPPiiBT0aau3Qb+0dWmwYU2TpfNBetUsaerXFAVnUZlW7o3xLi/yfllJfZ1Ncw+L/BWOkIVRBrMkbqsMpJX72QBAtq5ipSAB6PaZlbsuOBXEvSAteoZHZ5cZejspHLec27T/77aRYSOq0Ai4RdiJtrscfsUWbYlGOAeb5znndZX8DXqudINW36rkNrNdJOGYLMH1ksSVSdRXCKLq9U3OvZ0+OSZCiGoW5KWWhqobA9EM9t6bpLmHB4Hs4b2rJSi0EycoX0GiemQU+WAAblOS9ggCmwx6ApV6N1SfL/+BOfhlfz/P8ij1erz1xEnDgJgMwe8IKIDDHEV7lLmW0tnU/QoqKl0PqnpsH0GXtEHR1nu4IUI8puludWhZsdDjIBWaqggXFewcXYFZjvHXqzMb2xl5reLRYt6i95ysAnYxa0nOBEg4MMhSUxFUz2ujFgMlHfoB7TSypK5ri2fbuhwaSAVKLvY4SY6TC7yqGC5ccQo57ou9W0Ty/5PnlmzJsfQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(921020)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3hZWWZxcFRvdmlSbE1qVTFjU1ZlZnNrcWRjTm8zK01hNjROM3BoRGR6b1Bu?=
 =?utf-8?B?WEQ2V1poU0tWeG9SWU56dVZMZ1ZLUTJNTHZXVHpzMGhlQlpDdUY5enUweVVB?=
 =?utf-8?B?aWZBR2VzSEsrNVdKSlRETmlmL3BkQWdVTUQyejlzb3Z5Uk9PbGhKd2hmZGoy?=
 =?utf-8?B?eXpoYTNsaFNvT3FQRDc0SkpVYnZyZkN0SCtMakt5bmJwYStscjNDUi9VOXF6?=
 =?utf-8?B?OWtGbTJWalVNdHdlRS9EVm1IWmVuZnZncGFGMFBLTlRzdWlrWldKTi9nUVBn?=
 =?utf-8?B?d0hvVjdJUmtpNmRtck5KQkQ2RnVuZnhJQmRlc3RPQmZpd3pMQ3NCVFpjWE9F?=
 =?utf-8?B?bzRubEF0QVNYdWZYN3VUU0trc0FFSjNvVmZQTStnUkhGTFRtemI2NWV1YTJv?=
 =?utf-8?B?aGxYcnN0cWJZUW1qQ2NReXo4K3YybXhmVmpGN0NxbmJFbVg1L28xa0ZmWWxG?=
 =?utf-8?B?azIrY2FCQktQSGN2SjBkY2tkR1RnV3pyTzZVeUt2L0xvRmkxKzBVWXJMZHIv?=
 =?utf-8?B?SjgwcmpqbWtROG9vcUhqbnZPa3FsVElnSmJmeklGZ2pnOUN2Q0FDSElHTlE3?=
 =?utf-8?B?VjhXMTE5cEFUM3lreVFHTWp3VFJYK1BwTDN5blJCMWdHRU56U2ZEaU56c0Z5?=
 =?utf-8?B?ZDQ1dHI4bXBjY051NEZaTmN2amhyZU5oTVFaR3ptbnpSNjZ3WWIvb01DSmMy?=
 =?utf-8?B?MWVIZW5SZzRLZi8zUmpMYkVCOHBrWW9NRWlqbTJpaFgwOXlVemptR2pqUmJo?=
 =?utf-8?B?bkVGT3pqNG1Fb20xK0J2T1ZENUROYkMzYVFINmw2Myt3RlVrZE1jVUpWRnBa?=
 =?utf-8?B?NHpES2Nxc1FER04xNEk3TzRsTDFKNmRMaHNSb013cXgzMVJyOHg4eUJuM0NK?=
 =?utf-8?B?TFhUNU9BT3ptNXJYMDkxMHFVdmhFYzlIS0VvVUJzakdEeXltcUhqS2N6UkJt?=
 =?utf-8?B?WXRSMWhDbmlJWXI3a0V1czdpWUhqWTg2QVNpZzVDaFpkd1F2czkxUXZlRU11?=
 =?utf-8?B?bGU5dGgxRzlQd055cVB5bUtYSmNGQVBjR3NCNVNKQUI4Q3RNRmhQcENIcEVk?=
 =?utf-8?B?TW5rek5PMkFRUVpNUGlFRE9MQVFiVFAvT0pJcTdjczZFTm1PNk92QTNxWVJK?=
 =?utf-8?B?UXY4b3lDa3lZVkk3NXNCbTZJUHlpSU5BdElvdlQrVlNKTmpkZVVBT1JEVlV0?=
 =?utf-8?B?SUd2eFkrL0RwNWZMWkZveGNNb3VDWENUV2FDWlJKcFV4ZnZXQU9BQUV1bzVr?=
 =?utf-8?B?b2lNdHYwRFFQZVJHd0k1bndvY01SSy9iR28yNysvaFM4bmxvR09CU1dCWkZ6?=
 =?utf-8?B?ODZLZHRzSldIUmdRbFZWWEJHT0lUMWpSN2h2NXgwNGJYZ2w5MFY2Zjl6aTZu?=
 =?utf-8?B?UkpxQndOZm0vbHk0NTNqTEE4UEpGLzB4R0xQYUJnY0U4ek9iaHZQRG1aR1BL?=
 =?utf-8?B?NnlKVWljOG9qWmhaVHl4VXFSWUhoczRuaHF6UGg3TUpCeFFWVVg3clhWOEZh?=
 =?utf-8?B?VHFXVHo4YlFpQ1MzbytYbDNYRSt1RXR1b0lPaU9PRzNqK0JOejdhQ1l4Y0Zh?=
 =?utf-8?B?d1plcUx0dER6Y2lIZ1NRQmk4bm85M0pUQWVUbG5qRmdGZGVnSGgxQlVMN210?=
 =?utf-8?B?SlV4SGx6NzNhTTVkT3k2NDg2Rkp1RnRQSnNjdVZjejUwSTJQTVUzWFhlSVNX?=
 =?utf-8?B?cFVzV1RObmt4aXdlcjF4WlhJNGF5VTYyWSt5REpMbnlxNE1oMnY1WGJ2V2dK?=
 =?utf-8?B?ZVJheklWeDJ5Y0ZxZ2J1eVdTaWRnK0JKbitTaituOTZpREUrZGtEMFZNOUVP?=
 =?utf-8?B?aG04eXlGc2lLQzlzcjZWalJNZ0JnQVl5NytQVDFQMEVERkRTWXIwblBhM2Rp?=
 =?utf-8?B?QWZFWHdBQ3d0ZEw1RFJHNnA5K1pqOVFSVWk4L3hEY1JnZmlhSTJQb3FMdU5K?=
 =?utf-8?B?dmpPakd5ak1aMVY4d0tybnBXWURkR0E1VXBMUnhRQnNhTmRPM2NWR2liaU5H?=
 =?utf-8?B?NTdZMXo2K05DcTJYblQ4M1llSEswNmJ2eklkTHhoM3NsK3lQckdkUkFpNFpU?=
 =?utf-8?B?ekhGVzRnMlVGdnFSdUxCZkVJZTY2RDZ3YXJYendlWkRGb2xxRU5oUzJITkFD?=
 =?utf-8?B?SGdHcDlRUktwRzJWcmw0NDlFaEFGMDNaa0ZDR2IyalowNC9PLzk2N01FbW9K?=
 =?utf-8?B?OXpyYlkzZ3dyUWJaZmg3NVViTUNVUjhxaXhnQXorTXBRY1RTRHZoQkRTSS9Z?=
 =?utf-8?B?S0tScDFzcDNuU1ZscG1nby9NUytLU3RZQ00rQk9NaVNGd2RVckcwSHpQa25N?=
 =?utf-8?B?ZDJrTityRGc1cFhqL3VJQVp6bUlLWVMzMHc1VnFZUldVWXYvV2lqRjhxNDE4?=
 =?utf-8?Q?vmLeRyklowCBrYqg=3D?=
X-Exchange-RoutingPolicyChecked: 0xBXEUvOWJRO34pz5CwAIX/ttl+TNAT0hfBlQkqqLxDu7+sA4GgwbgVgmGk7A8Rl2+JuGODnau/WJOHmfGZurTOGnk04HGzkDdJIwRLZHNXA2HaPRtl1sltdWKM03uHvpCk7jXiQq7Txrdq9NVX8rQTq9cWUglYCnBDkfpMiH1n8HheRHeDkHFWJENhnm+GVZ0oeeO4nTIx+v59+lkimLD9YTrvt96y5Y05iSob2xzua5nSeOP9kkpcjQiPNLjrP/gkOaihc0I2SG4qbC1fN5DNqsQ/rfidBdWsbb85QbsOlL2UFhXy6jUxCDAEjOHeLgqkLMA9uNpAqyVFNhao3Tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 049eb8d1-ba38-41a0-ac57-08df3a95d443
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 17:05:29.6988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8Ey/UqOCug4VElNltLPOHAWJctwrYpSCDoRkvFuIEHniNEW4pAwR02a4YEL7y4er7uNl4s9WPlRntl4KStF9nR02ShldAxIEjHGdbJ9pUg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB911879
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_090535_090519_F283D195 
X-CRM114-Status: UNSURE (   7.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Drew,

On 11/4/26 8:35 AM, Drew Fustini wrote:
> The RISC-V CBQRI support builds on the common resctrl code, so changes
> there affect RISC-V. Add myself as a reviewer to stay aware of them.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Drew Fustini <fustini@kernel.org>
> ---

Thank you very much.

Acked-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
