Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A0606A336
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 17:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IBIveac2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=IzmW16p6;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HE8VOYxb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=f+c5Mraa5r4yJQLCisAE3t88hbXT5w8eDDE9eJOfqoA=; b=IBIveac2hRx1BaYGprF/MmyJLf
	As33rDmf/hbwjT7RmPfW1703Bq7duS/Wf/mDd++bN1jZz3DBe+vx7Fq2gVK7jPLeT+OeZpktXQwbv
	Jmx3E2yIl90Fjn6wrPIj2lyfpTfnKMoczrWpVoghSe3V+izar5kcp87oUz57jIXXB9T6LFQ8AJUUr
	fj1J6YM0PIO4l8X9tM3j0HqHjAf33qMUkthWKRVEW1myfcNWZGuZRG1WY214xNHIxvCeJcrnFOGT4
	Dcn8wG+LVMBqQ0LkKnLlq/pVpqMqzMV9CeerKlF39YkZFANO8tPZqIK6vzntHDnVWqOMbA6w5Tzgh
	Jud6yl2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSnM-0000000FnTv-3c0N;
	Fri, 20 Nov 2026 17:53:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSmy-0000000FnH5-1qFR;
	Fri, 20 Nov 2026 17:52:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+V2Pv5u7tZEWOi11vMXa7wdfnQUir1NP1GiYBLNC9Yo=; b=IzmW16p6QqEHo0RqAK7xJyVpc8
	BMEf4rZIbTIYWXMf1Ah6xkHtsmkVU8r/riROaojF/EM8EvklRjia+VBu/xlfaYPhszwY6vo+zJk0J
	ujpwFONQMYsWcq8j2ygvIBqN/fC/JYsAo3wR9arpzCHiX47v0xqVl7HUz7tYzfkHhncc1P3IT8aEP
	mQJGXTBbrRRtqRUxsa/PoD8ntummHJsMh12g67U9/ut1uX1Iwn5Mf4YRB6Q98j43cg1Zp5mzeRKHD
	FIzYLZ/ZgbP5+1J/T2iq2Y3emAbw92JanlpcGsPHFI9yWr392wgAwKUrmXHff9vIVHfJpHbVHQTuz
	vDIyC/Qg==;
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSmu-000000011xu-2bMz;
	Fri, 20 Nov 2026 17:52:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fa/xYHb+NjEFISPJsCTARU4uZU+rS31K3yqrB+rPkBYQ9MwqmFvb3EocgC5ymdtbbi/dZemH+oMUOsmNNm/3SmDcl9GqGSOhqP8PNWT175Y9++c3PWCTeI5bw3T9hD5nQf+Kf8uOnFpY7fwW7CRkUa+PabJHALxUw2piLJ2Qp5nkR7MA0so7UIrsvL6On2mz+AqK9qHW2g+85GygS4Uvc0pjieWbdxxJGzJXMn+Pg4wXuN96FVfG47CiWzL9fzS/It1lDAyfgFly+qsEZYCatgdEMxEL4AY9+qzEYHdVoPbM8QcXHQQcasuUcCjvdxt8NL6S0lTaTi43YTZ5CwgzsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+V2Pv5u7tZEWOi11vMXa7wdfnQUir1NP1GiYBLNC9Yo=;
 b=Gupr9klpXVO5uKtwnRBufL3cB56hK699ixhAGtTdsbDCx3qdgfYmtC4GtuFDwI9JNuUM06E/FZLo028ufG8rJ4JO+866U7HPaGlKStIkz+8/aJa3f2kGcShwLUM3sK2CkRK6yB3l0OcTngazLTzTnZh/bCJ8qGIsm4dHrSQ85AZ5Yu19oHlizfTgB8+TpX4VyxbQEbdEtvdIwrvuAJn2n+0MdaxpQsWufHwud2bP/NW0qiXwWhyX9OWqZxLzIL+XolT9Y7/lahLpt3g8tAbxDYs4i7iI/ESGNBPjzXtCyqmwhd4ZEH4z/0UQY+aXkAncdjbEQd+hBdSQYHubts8PvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+V2Pv5u7tZEWOi11vMXa7wdfnQUir1NP1GiYBLNC9Yo=;
 b=HE8VOYxbFxRZDDLeQhsC46oYIC8RtxQ+Bhd/s8nfeilHUrTI0u/NsYDc+XUFDvWi4iuaas0XlWNogvJIVE2c3Uh7xyO1xejKiZd6d1Cpm2vrnOSxzFzKt09bJbmqRLZcQd0kKVcaXUNyrQVgXYhTxeTl0cPGI7GFQnjMmGlFd54bWzUp/eA/YUj6UrOjuYsAYYZm2kox3cxkSkOilyKyw+sfF2CC95YuZ4yA7qBP09Z355EKgHiJayzlmdtktG2GZrK+MPkYmVBtjUEdhuLP7yAq6p8krGuhd6cF6sguZriGHK7SCG3WN7zakuU4YpBVm1dBuNlZYMpJ8VYV6CpYNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by IA1PR12MB6329.namprd12.prod.outlook.com
 (2603:10b6:208:3e5::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Fri, 20 Nov
 2026 17:52:11 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:52:11 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Mark Rutland <mark.rutland@arm.com>,
	Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-integrity@vger.kernel.org,
	patches@lists.linux.dev,
	=?utf-8?q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>,
	Ross Philipson <ross.philipson@gmail.com>
Subject: [PATCH v3 09/11] arm64: drtm: Call UNPROTECT_MEMORY
Date: Fri, 20 Nov 2026 13:52:02 -0400
Message-ID: <9-v3-22d1a1eb7d2e+17de-arm64_drtm_jgg@nvidia.com>
In-Reply-To: <0-v3-22d1a1eb7d2e+17de-arm64_drtm_jgg@nvidia.com>
References: 
X-ClientProxiedBy: BN9PR03CA0737.namprd03.prod.outlook.com
 (2603:10b6:408:110::22) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 9996a294-d6c6-4d78-6a1f-08df472efe86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|18002099003|6133799003|22082099003|261009223027099003|11063799006|5023799004|56012099006|921020|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: fFvIyOgRCVV6yYl8HK927lVQaoKC4GEJWUmni0nUpOkqZ0FwSFqS9FhnEIGk7VsDpVnHbh6IuzTL0VoXolwp0gHX6f7XtZUghfpwBFv8BkE8PjqiT4cdM0/m365h5/0AaCYZqhXOazj27KvX7RLGs4u9q7aygbRJOVvfUzeLzL8WJXTfK68/qfsgevY5ODINhkPd4XGio6H7Yf3OfcWE9mLQI9+A60CIorIUOkfIkG7q69eJ33T0xJWZjXsbuOSYllG5BnBhhIhXiM/9OS2R1jvgjdIpOsNDN5JC6M61fURra2jbaCsF5RuFBPmyMVXuTLYzKAFrl7+36dck0oTgqXO3RKdacsT01LYDyMJgGdmCAAB5m20/h39gdGi1fpp7K4sK7bZOvUc9BBgkcEXGzzp+v1KtpMaA+fR2fq0E/aFtwLwY66UUgyz0M0FYm8oXZwysl+tTc+f7dRswpqAk/ObnWozd9Z7iMVTST9qbZXuMtWr6wBFEeq0EPhqxcXpduAk8Wp4ybE7biQ9DBz9KJ5u4tx4v44LehCGjarJGmKS8h1ovNW6fWzDywu+t8IIXaNDXojRbsEpF7lrdSxnt8xmhhYvcIUdIV+JGdXpbe7OYxQ7/+HZFNR05TJeGOtbXPqn3P9zucsX7JwBKoRgk0T7aEicbIuykUuRRnDi6OHkb7KFeqLjwb75hGYKYtyIqlGHMXqXKwAga86B6JBQd7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(18002099003)(6133799003)(22082099003)(261009223027099003)(11063799006)(5023799004)(56012099006)(921020)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6BCXEPpKBOAMIYXuJ4KOCK+lDujrcGbVqc5QRLMLFG4GkS2BF7CRli3V0/lI?=
 =?us-ascii?Q?FGByS2JyHUOLa1SrWvvGPTlb963nRa6h9V7GaSsoFSeDGVDqRLebrYjz7l8e?=
 =?us-ascii?Q?TUrfsuOAb+155LcOm7kXW0IS7qQBOd4y2HTvYAsypn692ZqEgkhSiRjgDsVz?=
 =?us-ascii?Q?TVc4alG/oSauCFhFajxyl0k1CHnmB9reVEg/s1NEimUbWcl1bXfQUehRhj/p?=
 =?us-ascii?Q?UrBqjh2AwqvyreReeZVPUH6DDXYiZAZDUsP7TdKmEIJ2+C1yja/d2oSjuQ8+?=
 =?us-ascii?Q?+eYY70LusZN6Zu3zpY77AoXLSLXAoLtAzYNUDZXqyLQtwKCaWqBebq4eLIbT?=
 =?us-ascii?Q?mDu9VLHi5dTKJVGTVUs0DQ1i3kWn8jbYMG9iqs9oZ4fo1pgUqqSWbEB7icje?=
 =?us-ascii?Q?CE780daijkw8tsrzhD2iFf1yw7hWgZIzOThO2TFWWQf+ufULUQGo5qWDWJFd?=
 =?us-ascii?Q?lamOX60JC/PoympBFjreqKTTxJjjh8s9zBtY36/dzOpf1ChHyjOG8PDUf0AS?=
 =?us-ascii?Q?iyW110bQMUuMoTuvk/aH6c7MwCzars0DIWHRtfb1f+9Uf+CJMv2jhIvpCy5Y?=
 =?us-ascii?Q?sYvuHoCsBxG97ne4m+w602A1bgc0TKJh2SaO90FKIbQecCmJ5WjfOALggUut?=
 =?us-ascii?Q?juieQTEPE8fniZzkf+xrZ+WG23vIDQuSVlJy8dGKq6ULKz8BgOPjNkND+wnh?=
 =?us-ascii?Q?WUA5paeX4TNL70BhMTrwGvm2LKDFcNOxiTNLsYPjIQBg8Emkw3S60EokPmQ4?=
 =?us-ascii?Q?6EKIFdm2yiQ12GQv/zYHjQPZn6gUkVjHtSIZRaKgoo2va/ZUly/3OksUuJ4u?=
 =?us-ascii?Q?eb5ECmNW/PEcAF/DlDyVK11IzrnGZNOyIVmGKMaDwHVll5WNT2PCa5JCCraU?=
 =?us-ascii?Q?QzGqngEkuUmMwdzWpcMXCVyPzwTXPtbqb6sLT5ysxzFBqIMOlbOI6RmplxaJ?=
 =?us-ascii?Q?Kji56ec5OUIsySQRnbO3Ktw+YpGK7ZqnYAiz4qV0BkxLjmJrsGkCx1azipHS?=
 =?us-ascii?Q?w0lPBoW+bMwAWklXlWZybxxHNsNO6QeNPRrRDnxpE6TPXGB8nf6CC3oSc0Lk?=
 =?us-ascii?Q?ENJOgXsHlotjDZrNH3dDOQhm4b3MlwGLycAREPimuzUF2v1H1aczsP0MBnui?=
 =?us-ascii?Q?kLS+QtEHGlsXw/2uqbWdy+eq2pRuPY71l7yjRMGozq0hqKa2lgcLt8wHyTD7?=
 =?us-ascii?Q?ncNuAkVCdZfaJ88ejrpQ4ivOLtxGcha3zXO2gHqqhyOR6mwuAN5m+F70eICS?=
 =?us-ascii?Q?4i9BLasI3Uxpx68pU/6JOZwX/t82H45+Dt8+t3ahD6WysH1WhWPN1ZQEieSa?=
 =?us-ascii?Q?2XiyebswpTyTLCMJZ0qe6JNalCF6aRScOEAM7++mohuITXoJjlElwAsrx2Sj?=
 =?us-ascii?Q?gR46iixI/9bnJu/ecaf9NSt7x8pAs26oDR9y0mzu2o8PB5hesNo2lSu5O4Xy?=
 =?us-ascii?Q?DJkLDWrM/OxWk70teSiQnSo/6GwX3oLXntPWn5squtqOWispQLfyaXcWRPsn?=
 =?us-ascii?Q?vrZnlzJ5MCNvC30azFu9T1mXnPobB0GRIEOFaA8ZLl3zhr4DxCZAcqEqxRWm?=
 =?us-ascii?Q?1BhTmIDLIv2cGD7bg/Cc4mvEOSaHCYZQKjt8W3Q8DlOemOFGivqPMTENjjns?=
 =?us-ascii?Q?1K+XrELTwH8/o12Ow7mMzm9cSC/Un0UtkdnZxXaOmxott8h59AiJyW8hY0lW?=
 =?us-ascii?Q?OPhSmBrncKAwAvjHlbM/udtqMPsL4PwKH4/lFUvYI/3zLxRt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9996a294-d6c6-4d78-6a1f-08df472efe86
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:52:07.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSzzxnTtnc5BAbf7ZnT6v0le1CLR+o4uInXiUNusV93rt3FnPcEMSygdWFoG5HTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_175240_523956_A0C17E6B 
X-CRM114-Status: GOOD (  17.96  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The stub always requests ARM_DRTM_LAUNCH_DMA_COMPLETE. On a system
with an SMMU the COMPLETE option is sanely implemented using the SMMU
global abort register. DMA_COMPLETE should be mostly a no-op. It
seems to be designed for the region protection mode that Linux does
not use.

However, the FW can still do something interesting under it and we
should call it. Choose late_initcall as we know the SMMU drivers are
loaded by then. If some platform does actually block DMA beyond the
SMMU, then this would result in a noisy failure of built-in driver
DMA, not a silent security gap.

The platforms I'm aware of are OK with this placement, and it is a
reasonable place to start.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/firmware/drtm/arm64.c | 39 +++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/firmware/drtm/arm64.c b/drivers/firmware/drtm/arm64.c
index bf736ceb7f0368..07783d55275fd0 100644
--- a/drivers/firmware/drtm/arm64.c
+++ b/drivers/firmware/drtm/arm64.c
@@ -3,8 +3,47 @@
  *
  * Support functions for ARM DEN 0113 "DRTM Architecture for Arm"
  */
+#include <linux/bug.h>
 #include <linux/efi.h>
+#include <linux/init.h>
+#include <linux/printk.h>
 
 #include <asm/drtm.h>
 
 struct arm64_drtm_handoff drtm_handoff __efi_data_handoff;
+
+static int __init arm64_drtm_unprotect_memory(void)
+{
+	s64 status;
+
+	if (!drtm_handoff.drtm_enabled)
+		return 0;
+
+	/*
+	 * Currently Linux can only fully support a DRTM implementation that
+	 * relies only on the SMMU. This should be called directly after
+	 * attaching a driver to every SMMU but before binding any drivers that
+	 * want to use devices attached to the SMMU. Our boot flow does not have
+	 * a way to do that, so for now call it here.
+	 *
+	 * For SMMU based implementations their UNPROTECT_MEMORY is probably a
+	 * NOP since touching the SMMU here is forbidden by spec, but they may
+	 * still do something interesting so be sure to still call it.
+	 *
+	 * The stub excludes the most likely case of non-SMMU by only using
+	 * ARM_DRTM_DMA_PROTECTION_COMPLETE, which is defined as:
+	 *    Complete DMA protection is hardware-based enforcement at the SMMU
+	 *    that blocks all DMA from Non- secure devices."
+	 *
+	 * For now if people have such systems they cannot include built-in
+	 * drivers for any DMA devices, those have to be modules to be ordered
+	 * after this.
+	 */
+	status = arm_drtm_unprotect_memory();
+	WARN(status != ARM_DRTM_SUCCESS,
+	     "DRTM: failed to unprotect memory (x0=%lld)", status);
+	if (status == ARM_DRTM_SUCCESS)
+		pr_info("DRTM: launch completed\n");
+	return 0;
+}
+late_initcall_sync(arm64_drtm_unprotect_memory);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
