Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3C660A383E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 17:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YeuhdnaC;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LasebwMC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:References
	:In-Reply-To:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nH9k47V04WX/NGnpeyNlGb2SAclSev2puulNkWjaK/8=; b=YeuhdnaC79dUkF/shp21T8654c
	lleCUF6HqBzMs2bXYRjyMdVb7p54ojZkMmknd8J7we01N9dZV8x3/h2P2UyP4NR5URtB6/dJJlcKm
	NrqAtqlU44SOqcGanIz8m4r2zKB32xZp3jld5p+x050f+YsXZDmYvn44iA/unimdhNSnW9gcOp5vG
	xqMCpn2sELkoGA7slebhjnRjEwTz32VfTRg07p2VM/INOWg8MKCS3Ggs9eYhdp14Jc7hgx6CcTCzk
	BdMFAxuiwa8IKEpo+49K2ZC2kwwy7iar4a/lQMpWnrDH8LStEaoic6uP2Ccuz5DFbLPPQnVmCISOs
	MnaI2Mng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSR2-0000000Fhb9-3bUt;
	Fri, 20 Nov 2026 17:30:04 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSQs-0000000FhSs-2hoP;
	Fri, 20 Nov 2026 17:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxMkgPUyjFNzQ40O9tfA44Kq80hToTTJXlQl2j8TxUR88iC3c6ssZ4fvvXQYMms5CjZ3/V8ZPpW/dE9GyXPhHbTHu9YB+FBOEB71PlzFzc7Rf3VUPE08YmPWMbKYbqmL8DEaBNxp9PI7/8sIiLRPk+DPVqQ5DekoMLYmoTzK5PeggDbwG9aRhkgqBZldHlIOYgWsW43fm9Dr7P3fsw/C0lHhVQmBrhQYWnbc749Qkgilgen+PgaCmyn67lOCEV3yNvy0xJGIeDm88yqLNg68XJ2NxdOBOHrn1+WfvaQtiORtYPZPjlzYtsGjiXx/wdz091Nfe/Ccc3f4fQ5T6bgCwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGnUUCXeUCOJ16CkWh7YQnDtI0mikaCtQG3sfuy+gXA=;
 b=bI/UM/Dk8j26yzuTWuue4PsRHzr89H6hFLPJFrOVJWV1oBETTpY7877Ug8Ffzh48ZJ8h8NA4s6BlJVO0kTTUrjesxzwEevTM5JAu7reY3XsislOSo4veO8ogXZAYoO+rS/2ogAq6+S28mXznJMVEhghIAGbXhsJeb9A+9jfD1w38SBCwj6p3eHxHvsnyut0DXtebWnkJHi2kWtJdVmfKOwHcGAcI6Gb/7a8bV80pBA7qsPikXdy0KKptobOJih2quWYofja+tMw4KXM/HC5h16K1cTWaXsH1LawHEhE6NJxCztdO1gE7QRa1gkSySvfHjGDRmPmJXhLzg9pJl17AGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGnUUCXeUCOJ16CkWh7YQnDtI0mikaCtQG3sfuy+gXA=;
 b=LasebwMCTqOdnhTiLwC38bVKzLroKRO6ahfliASyTmN/8tcCON0bXkgDAYG6Vd2sEk9gwc+lnxfkLahINvTfRDm/CWFDurHk7evKh2r1GeCKdmW1wbK4PddIs9jHVCQeTCwVIR01UPlQNjMtRWmjcH127QrGj2u5r8lpRAJ6csaF/pzuDRLDu726p2vweOVZBvkmemHaNqAhAInfsG5gRTrwjEU6zZjn5sYY9BvZORYFl3KBdoGO78PknLegfBM/RiDzkKxxep0iQ+o/rCojIl7zYqTJlVpdc90RN7CIRWsOrKoRGuOORBYEzgVvh6Fx2/ulcRH0jkIEayHiNNKVsQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12) by SJ1PR12MB6099.namprd12.prod.outlook.com
 (2603:10b6:a03:45e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 20 Nov
 2026 17:29:28 +0000
Received: from CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d]) by CHBPR12MB731189.namprd12.prod.outlook.com
 ([fe80::b0e5:123d:fe06:e10d%6]) with mapi id 15.21.0639.010; Fri, 20 Nov 2026
 17:29:28 +0000
Subject: Re: [PATCH v4 00/19] efi: Expose loaded image properties via info
 struct
From: Jason Gunthorpe <jgg@nvidia.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ard Biesheuvel <ardb@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
In-Reply-To: <20261118182105.1633603-21-ardb+git@google.com>
References: <20261118182105.1633603-21-ardb+git@google.com>
Date: Fri, 20 Nov 2026 13:29:22 -0400
Message-Id: <179519576288.392094.5864308719635887096.b4-review@b4>
X-Mailer: b4 0.17-dev
X-ClientProxiedBy: BL1PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:208:2be::9) To CHBPR12MB731189.namprd12.prod.outlook.com
 (2603:10b6:610:33d::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CHBPR12MB731189:EE_|SJ1PR12MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a79b00b-d231-449c-bd4f-08df472bd3b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|18002099003|6133799003|22082099003|261026121527099003|261022105027099003|11063799006|261102123227099003|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261022115727099003|261102130727099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 2xpAb8vKieghm5sjEP49vfT80cU3AVvdkOenuGA3IqzkOUFOW+bKzFqDz2QGOnRCFASvc0dAXqfJVu3VOxkAc/IuJcB7+PwKInkzkWeQAA4bKvdgS9BA8AlJVYP8GyFxW9prLPn31fJ0mYjS7Zm72oEnei0SO6KIHyHg49/m0s0o/MFwdvVpKOU/6/Rz5UiA0ucZsQ+6Ok8Lf7rcYqBiUlkg25mZC6rPpu0scutIEl7gJFMSH+mLNQxJz1KlbSlfxsPhImy11lYmV0lR9P41HSsBoh3qwEfsdVzUTRsn0PQstulUsgEGGIABgv7Kfk6QC3hwhK/Wu4/ucUx5TgZS8XzTNjIgoheTtKV0AKIPLnZ9jwG8nTvMWaxBMRBQyBTQDzrJ8GyursjFYbF+51TdSVcd6iUfQ/d66eQcGOgdv8yHTG+ln+MlT7boEdOiFLfGpA92CTXBdZhIMRiynwS6j3StdKgv0rXr7HALrTtF+b8LL/8XmHbRG+q9/45sfrJzoUTrhsUsHqWsh+7lTunmc42k8Ll8DyVT3uriC3W5lwpTUFdxDndP3FCVZ5sY3NTawXRmClcBvGzIwmWBUGNsCx1/YkC4qhZGEXJjG2PvdMSewOYav7d5dtAmVr8YydnVyIahBsLSs8s6nPYN5HUnTb6O1MgC36YHI7tj5yJZvrQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CHBPR12MB731189.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(18002099003)(6133799003)(22082099003)(261026121527099003)(261022105027099003)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261022115727099003)(261102130727099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWJtenkzaUhsMUJnWFg5SXJOcWQwWHAwWkdjQzZKY3FPODNlenNBSkdzUTZw?=
 =?utf-8?B?N01QMno1TXpHY3NsWXJYSzUrQU5zbDFlcTluODhpdjkwS3JkWGZXemtDMG5u?=
 =?utf-8?B?OTV2RzhGa0Z2TEtzYUxPNEhYMEtzY1FvWlBjVkxtUEFKSUViZWxCZ1dNdi9s?=
 =?utf-8?B?OVcwV2h1NkIwYUE5bWpZckJYOXJ5ckJNNzBpWFhoVlJwTkdONHBNMWZ2b1BE?=
 =?utf-8?B?UFR3WTRqNy9rL0NuaFB4ZTVGNDd3cTA1b0c2SENUMTFkQ2prNFVDSzZsd0V1?=
 =?utf-8?B?Q1BMT1FiUjFLMW55NU84SzFpbUdDbHgxc1JtNmo1d0hUclFUd09tSzlVdmZL?=
 =?utf-8?B?Z0dJOGFPTzQ0bnRMOTlUYU5SNzE1QUkxaXIyeUttS2MzanJqekpRNGViV3RK?=
 =?utf-8?B?SEFPZ1NBT2pMdzFIaG9zODVEMDNqN2VaTW5WWUxDalFZMGl4MFN2S2RRMHF2?=
 =?utf-8?B?bmhSQ25ZZ0dsSnh2SVFiclFkQk9raGRpQzhjNWV4VXJMdnhGZVdvc212ZmYv?=
 =?utf-8?B?SHpCQ1NXcjBFT1NPY1VTTHB0VlhRMGI5NzZNckVaYmt3cEJpZVNJZzZsVDlz?=
 =?utf-8?B?NUd6MzQ2NG5qbDc0Z1BXMFB2NkJ6aDBGZXZza3BQTkxTYjBMeVBzL21UZTFk?=
 =?utf-8?B?SzBsbndNQSsvYlpXS0g0RDI4cVVpS0NMR3l1bFBobVhycHhrV3FSRzJma1p2?=
 =?utf-8?B?MjIwUUpEQ09PWDdUeXNvQ0xPWXptM0FkN1F5dWJBSTlZblpJNGRGckNISENv?=
 =?utf-8?B?YzZ4dExNaWEwZnZwVmF5Zlp2ZjZ2VUFWSzlPdDlXdytod0VLL2Fnb3VJcDc0?=
 =?utf-8?B?NWpubUNGNThKb25GaXI2cnJBYk5ub0grSEJ5K0I2VUJFY1ExakhJMEtwR1pM?=
 =?utf-8?B?bllDdkxFdUF3SU9GMjd4YkRhTnlyQXFRSXFmLzh3UFE4a1dkdUJncThRd1VI?=
 =?utf-8?B?Q0hzdG1ja2NMby85bThadDdQZzRlcVZlTUJrTkpTNWZvTzRLNXJiRXBlNktm?=
 =?utf-8?B?OGF0RFBPK1g4bnVuZzFick02WVFWUFZWd0s4YURMQ05vWlMzN0Y1bS9XNEM1?=
 =?utf-8?B?ZkI0UTRFQ0s1ekRyck5zcS9XL0l3UE1iK21NcDU3eU8yR21VbHUySnJjZkpj?=
 =?utf-8?B?eDdnUW55WEF5UnlNRHBVRkpNbFpZYjFwOVhjdFQ0LzduOVUyclZzV3BrMUpL?=
 =?utf-8?B?K0ZOSHc2eW5wQ3RoRXNKcVZTdmcxS0RhQUVmbFlCeWxpczJkK1VDY09SbG5F?=
 =?utf-8?B?clU4cDRDbEpKWnVaRGc1TW1zSXhldUdBWHZ3UktIZm1XaXFMM01rMmNncHBv?=
 =?utf-8?B?bHdaT3E4c0ZrQVA3V1hDVVh2aTIyRFVFNVhmR3NkWmxrSkJxcHNVWFFGbm5C?=
 =?utf-8?B?M3B6MzdYOU55dVZ6allhSW5ta0o4ZFVHWC9nU0M4T3F0OVlyeVd6RXNCK2c3?=
 =?utf-8?B?cmtYN2FnemdVVDlkMDdtVHBra0FYL1cwTjQ2aHFEYmU1NGJqRG93TXVqbnNw?=
 =?utf-8?B?aTduRnNONjdlNGdtbFZycEp6cWZuajJOS2lJbzk2dDhkaUtFWU1hMDJDcUtI?=
 =?utf-8?B?dUlTQkVQbkZnZVYrUXorSzdIWnh2aHpSdnlrVFd1STlFbmhrejJIU1d2Tm54?=
 =?utf-8?B?T0pDZDg1T0lFdTlWS1lGbmtNaHR4T0l1MVJ2dHJrVGFaek1XS3VndFIwek94?=
 =?utf-8?B?R1FnckREQnI0bm4zb0NFZm9RSXdoSkhseDA4UGxFcFNxTE1sSGJIb05IMVJi?=
 =?utf-8?B?ckhiaHQ5MkI1V1dhU2tDQndzcWtZenZBdWUzK2UwcEVIZDQvcmEwNVgxVndo?=
 =?utf-8?B?S3ZldFpYUFhHOWc0NXhhN2h1dzJaMjR6NWhrUEdFNTc2akg5NXRhRTFQaG5L?=
 =?utf-8?B?L044MitFQ0drbjh5QVVydTNwWExHV1ZtdGJ1UU1CN00wMlpiRldVU3UzbWFJ?=
 =?utf-8?B?QzR0cmNiNHM5ZGJGeXFMQUh5eWluY3d6c0s4NUlESHFhRFJqeEo3ZUU4SHJW?=
 =?utf-8?B?NVRwWXBIYmJEMCtjZlk4aUl5Rkk1Y2xKa1pnb0JxVlNyTGU4ZkNHM0RyN3RE?=
 =?utf-8?B?SENETjFnbk1kdzhYWHRLRU12cTlPcS9yTUovYWtESHdPL1JkcW9zNXRBWGxD?=
 =?utf-8?B?U3hYc1hnOEttNnRZSEZkUGtkM2RzSERCeEUza2ZFeC9yWmlQbzVHdzVPZW9s?=
 =?utf-8?B?dEVEOVJSY2hzUE5qdzhXaTR0UWF6TVV4UVhTRDBLSlp3ZktUK2dqRGk4bEV5?=
 =?utf-8?B?cXJFUzMrTStJZEx3VkhpSk9BcGVYakZVWEVVRWt6K3lYbzBER0xoUUllR25I?=
 =?utf-8?Q?4yWQdn56yQw4uz1thG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a79b00b-d231-449c-bd4f-08df472bd3b8
X-MS-Exchange-CrossTenant-AuthSource: CHBPR12MB731189.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 17:29:27.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QtqvTXHtoMPEHRtPkCH8DHQiNABPkdQewMs0rk5tCgCMiy3Che3FCHsbJCqNHffq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_092955_068377_626BE5EA 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Clean up the arm64 build script and linker hacks that zboot uses to
> obtain properties of the loaded image (which it cannot access directly
> via a relative reference like the ordinary EFI stub).
> 
> Instead, define a generic struct efi_image_info, and expose its offset
> in the loaded image in a similar manner, but without relying on explicit
> linker script exports.
> 
> Populate the struct with section markers that all architecture use for
> loading the kernel image at boot, so that all the linker exports can be
> dropped for them.

This one looks fine to me, other than the minor sashiko note. Still
works

Tested-by: Jason Gunthorpe <jgg@nvidia.com>

-- 
Jason

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
