Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2598EEDEC05
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 01:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QgdiPu4QNiwOab9We1xD/97lg5zI2BKUyAcqAZaQVrg=; b=EonKa3jN4YQ7w+
	MPhqpREIcJ5pl4Pt/UJkcmVelLQwmouBGMjdvMj96RXJuyz6K+v2ZxqNzISJiDMteTzEbtnky3PUw
	2NFCG9xjjxzSmStUdEJGVJAPDlkJdIdOhXpL+oPoYT0yHJZ1sissySVCLV42DS2tRNglZTPFBegTW
	U34xPgiqHXm6EW5YP4RpTvPuLvx7ltp1YUGeSjK3ZypD5LXjT4KfmYPRPB+C2eiTgW5BayEaMWgvu
	GqUIKfNiumZQQKXwLUTsydL/aN1EcuoEkFAzMFmZQUDqhU4rKyxEaohKhBKy1MR5hVWwrrGYbr1mJ
	vlrQ8H3epIBFYSrN6fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxb1f-0000000GF6B-1W3i;
	Wed, 04 Mar 2026 01:27:47 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxb1b-0000000GEyk-3IJe;
	Wed, 04 Mar 2026 01:27:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5afcP+xPp53aYkHswiWzdI4Msozqr5V4tHhEVXe9ZVjtcmRiy3VX11EkPHjazOLYMHmGxtIZ1Y0lGPnHStG+/C0bRfTo7MUqs/Mt8xjsP3P7e45Tsjhnuput9GwSWyBLlsoZq2QWZSKI21cj3tsvENx9xrZ9jKDxVS7Ir+xVogQ8dPScgJpIFGkkHmjRcuTtxYiJUwfWpSGShQNjiEwGmIFTPWDeJpwX+mSIb0dtqB29KsgifvWU6U63Ztsb8TPcihy32Q/yp19plQumzA04MwzycDnQcvnjZljjC1W1nyboRNthKtcyp9pXv4mMkgoyqWpLchikAR6nskSg4ChpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gSCHE8kjPSLoULSKkpRxPQqFKwhZBXzpx81D8lSNwo=;
 b=wbJElpWqD6bg0np/jNgUS09/M6WzYi4dXudK8aKDX0VYiPs8VBeR5wWPPryGowCpTuB5H/ScREOXYsnBTRWUJtKCVh48VEvGMNSPA0FvjxenfxRYSiJv/3SsO1k4oIt9v0SSFvyG1Lev7GmYbW+CKWEmESsBklwuQfB/0v1pL4jgZ5k/XAhZKV0v8JCDOuUNm7RaR7Y9jbSdPvfj3NCPnohu+8z7NGRmq8hlm2RUA4hoz5u1Ay04m7rI3HziSV8vTp15QzorFOH2zQnTBkrfh8Bv20q+PV9C2YUE1fsyPndY0a/vtMAZdZOB6Zh9Szx+m/r3yjdbYR/4pz6V7wmw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gSCHE8kjPSLoULSKkpRxPQqFKwhZBXzpx81D8lSNwo=;
 b=f5sF/09Q480wY19v1DY3Wt+SNUs6vVXNnfB4WTZLCiAUZdUuHcjnQZtwIPxSD5MC3m8FjWqDcVHdmYoyy3a3YR8YTJZoqiCMCvFvSlpv2IWlfLYXxnB27ls2FDf17x0IGjUDteajVACehCgQlH9MkjMfmgtNfDoUNo1niDZAL0eZigyTFSeuWyGGkSbRqKBVaxptIbqnrR9aBmVRDapK/pME3lM6UW7pm2Xj5/EtV/1OYYM5kg3kg10EopJujBHC/ujXluuVSmDflkCC6+qiRR/UlVgMH018CmS8f49SnBIU8dYa1kciQOVP4rRF/2Zu1WHrSt9VUT4gsIEkfXRHFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:33 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:33 +0000
From: Yury Norov <ynorov@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Theodore Ts'o" <tytso@mit.edu>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Anna Schumaker <anna@kernel.org>,
	Anton Yakovlev <anton.yakovlev@opensynergy.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Aswin Karuvally <aswin@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>,
	Carlos Maiolino <cem@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Dongsheng Yang <dongsheng.yang@linux.dev>,
	Eric Dumazet <edumazet@google.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jens Axboe <axboe@kernel.dk>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Linus Walleij <linusw@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Simona Vetter <simona@ffwll.ch>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Trond Myklebust <trondmy@kernel.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Will Deacon <will@kernel.org>,
	Yury Norov <yury.norov@gmail.com>,
	Zheng Gu <cengku@gmail.com>
Cc: Yury Norov <ynorov@nvidia.com>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-block@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	dm-devel@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	v9fs@lists.linux.dev,
	virtualization@lists.linux.dev,
	linux-sound@vger.kernel.org
Subject: [PATCH 6/8] KVM: use rest_of_page() macro where appropriate
Date: Tue,  3 Mar 2026 20:27:14 -0500
Message-ID: <20260304012717.201797-7-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0939.namprd03.prod.outlook.com
 (2603:10b6:408:108::14) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: a668991d-ff9b-4dbb-7daa-08de798d35a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: Z/6V97ZgGWZnJizosWGs3D3JmsBEU37quAoqwhEy56JDe8uN9V3H6D0yuBL506dxvp7oKI9HDcWQuTOlKn0o1JpfUQnxPPVHmG8fJW0OJ2nIPNi/BZ5LpoMR8z8W9ya02KrLD+7+pOg61gi6s0I3tkmeKrg5DEriLsalAWRhpbRdciQcUJ98RKyfMVAO/XnUqVRVy+mCCctZ5T0BPaspgBUdQCU+vpwLVMWgLWg4xwX5QaiOhiL5bYu3LJxw5MD3r3OTLNsbkDoQ0oUDuJh091ka7SnC0vuHZ3ptqQ3ghskwHcPQKSMbxV+7P8btNCQviv75jQU9o/qFRbhF2XUTNS+Qc4BtwtnE/Lvguo1ceZnaIQpK8RgQOlgihnvThAsXus7SPKfcgffX5kkYyiGOXXbx2QJxfndKopRgwym112xa8FNEwzOrYtKVSvsBMdlVPdMU8DUD5IC71mZYK1dAiaf36QUz9dW9Ibj8wULgR/OF2sGOXtJep8iC0/Ojd/ofmjfcQ6auj/jtREgrlK4jtSKwjsePgcVhq0mct+jNAElovWmy7MJ56cWAm7WgJ4SB1cTtaNxVMRhkgBJ56PKWV0JQu0xlZJ3NKA+xU4uPGfsFxXuV7VktmRigNpPV6h9vd5f9Pnphg3l+tgavj+Od6om9EpHzRTvSpjYzzG5471C9FMY+oSzEOq9q8Xn4COFLTJb1VuaMekZAgG+uBTdDVleFXWQy0PRNyCjZ1KPO4+wlaQ8xlZQ30GD3yei8xfzDp6Etd01YNcd7ZPo5U2jfWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8800.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laYgr3IxhCpx4j5kAcCot2E/Vds0o6kWWRSkjhyWLUWD7KnDgH7Y1ZuPn3NN?=
 =?us-ascii?Q?T7vC5+3ZaVnxRrdvyxx4Pk32wCA36ghzy+a7JPqKAgl/W6+ER1Gweb37TUlG?=
 =?us-ascii?Q?jbKLI3PtNYWB3vftGBA2zzxthZoh8cTCK1+iib+/D5uiOGZl3t/iu3gn52gG?=
 =?us-ascii?Q?6vdHH07a8CbBy8eX4hheIn+vKX3n8lCq+lScXOLywYvX5liTqyIobDDoHMxg?=
 =?us-ascii?Q?6/gdi8l94txKeW83Mpcn0rlrO2NZH2Wp+Xk9wwgBXl5m/yt5kpglcTqtX2uZ?=
 =?us-ascii?Q?bT2KRNx2B70ebitdNXc7JT83lyPk2H0/NEEZnmgauUaSD5EanlTM3rK3UMqf?=
 =?us-ascii?Q?VkZigj7W40REEgNAR+EZ2HoJEo2CCUHGldupvDrYdF/LeoC4GxS0mCufNpqi?=
 =?us-ascii?Q?+aroeTwNAV6oVuTfxshUYht6iSJAbIqVmtGmA+r9FfQ3NuOLqp7ehdd2OlFn?=
 =?us-ascii?Q?A+QTYT5DPXpU3Hjo6xbFRIeE8AzUnMeKNBdZVPJkA6MWofZ9AYvgvUfZzPSz?=
 =?us-ascii?Q?sMymeQ7yWdKdLd6lGxVL85nafColRy16aCzvBn5TqjIZwNlidpdNvFGY/RkH?=
 =?us-ascii?Q?ByLtJLcNNzgSr6mzWuPV3pm8Tq78hEGf2c2zMcdBlgH3dQwYa4JELCG+U0QR?=
 =?us-ascii?Q?KNTPwFJsRLv79MiuTHxxERMUXifaB9lRVVu9UeDeNnJnEf/oxfze9tHsxHHX?=
 =?us-ascii?Q?b64wyrpfq/5VWiLD0J5dKLbXcc6EB4OGeOWjKLxWdgTDWeyTMOTeNZtY4ltN?=
 =?us-ascii?Q?ilPrVnS9iVOlvhXSPF7inNdbpo3Qm9NdCiOftJtFr2pPTkkAUpJA1ddJsXHW?=
 =?us-ascii?Q?JV6H/5RL11cKVVtX91ibKZW07gLklZ5KG4OyZVmXf4qe+mwinGs5hhPDkCse?=
 =?us-ascii?Q?jwWtnKoExLGVTa9af5q3IRkESQZPeqRo3zvPV+tSSCrkkxO2DndjGFfQ3JSg?=
 =?us-ascii?Q?Tr+X9j8APyhcmfV+sT35H623x8I+h2YG1YdyewmmAkOxFzlp4e6RbzSSc5Ob?=
 =?us-ascii?Q?OhRz9+x2brAanr8h6fQ6kt1vX142wIyXIgoc4QBML58szqTKyEb1PjZS5QBc?=
 =?us-ascii?Q?IGl72nmkGzGrla/30UhPk/Uk33V77V/BS1KRwEOX+CNDXPxYD66C7bkUy265?=
 =?us-ascii?Q?2NWweaA/3yE0QY6orrpYKP4HQkb7VMgIOSBcOrDDk3lWK3TFyZ+sDvzNjYxL?=
 =?us-ascii?Q?nm6bQz7vMBlpbXKeCxouxHVtOmcvE2fEMdscirYsTU6RAkz6L5C0/LUezw+z?=
 =?us-ascii?Q?nQp3DS4x2tyD8sxYQyP2uTg3WJ+YIZS6GxlSQnNW3Bn+uBTZIt1EQYfSGZP7?=
 =?us-ascii?Q?ZIKGDgE2LTKC9RAcM9vVm3ZrvQDc7QoTNzUX41ttr3w+0g5s2Ji/gr/FyIbu?=
 =?us-ascii?Q?P7dG/cNYnnHQWq1o/DNFXBkEgSuY0o+vqJAZ8Jf0lzEsVlk345/poEQdlA+o?=
 =?us-ascii?Q?hf7PiKHDScKqE5Jh60nN78knkAj/oylR+TlFMCg5/D4EEUPCefP7ZnEcun2z?=
 =?us-ascii?Q?MYVGRd3uvVYU0vGTjb2jG3qb1vNYn+t1o7HdK9vymM2TtVhUxW/WJCirhuSf?=
 =?us-ascii?Q?pBmPscEsjuKH6aBdjXXDMv3/Yppc3XNC//+ObZWvq+DMuyIJ1uW3TvNFNzqO?=
 =?us-ascii?Q?fqHS0tbuUjJTX3ZASi+GQksg6JnUmNeG20CRLeFgzok2+suplVFdaKt7My4q?=
 =?us-ascii?Q?M5LyApib5nySpUtA+JaA2HSpBZrb14KDYPS6cyXnhX6yIyZ950FBjV7x172A?=
 =?us-ascii?Q?dVBrYx1dTkPYSm7toKzWE1J8W0h+zMjBquMe0kBK99qsGkl+aDlG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a668991d-ff9b-4dbb-7daa-08de798d35a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:33.1912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuFdHRQ+7R7JZVi6h8G6FO97rJSCcjNiBcJaG0+UNpDidCcb/D65BlFnnGxlBYVv7Gy4M0KiWg0X+ktiM9h16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_172743_850769_FF5A52CC 
X-CRM114-Status: GOOD (  16.25  )
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

Switch KVM code to using the macro. No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/s390/kvm/gaccess.c | 6 +++---
 arch/x86/kvm/emulate.c  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kvm/gaccess.c b/arch/s390/kvm/gaccess.c
index 4630b2a067ea..40f85b7eca63 100644
--- a/arch/s390/kvm/gaccess.c
+++ b/arch/s390/kvm/gaccess.c
@@ -973,7 +973,7 @@ int access_guest_with_key(struct kvm_vcpu *vcpu, unsigned long ga, u8 ar,
 	if (rc)
 		goto out_unlock;
 	for (idx = 0; idx < nr_pages; idx++) {
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpas[idx]), len);
+		fragment_len = min(rest_of_page(gpas[idx]), len);
 		if (try_fetch_prot_override && fetch_prot_override_applies(ga, fragment_len)) {
 			rc = access_guest_page_gpa(vcpu->kvm, mode, gpas[idx], data, fragment_len);
 		} else {
@@ -1015,7 +1015,7 @@ int access_guest_real(struct kvm_vcpu *vcpu, unsigned long gra,
 
 	while (len && !rc) {
 		gpa = kvm_s390_real_to_abs(vcpu, gra);
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpa), len);
+		fragment_len = min(rest_of_page(gpa), len);
 		rc = access_guest_page_gpa(vcpu->kvm, mode, gpa, data, fragment_len);
 		len -= fragment_len;
 		gra += fragment_len;
@@ -1237,7 +1237,7 @@ int check_gpa_range(struct kvm *kvm, unsigned long gpa, unsigned long length,
 	int rc = 0;
 
 	while (length && !rc) {
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpa), length);
+		fragment_len = min(rest_of_page(gpa), length);
 		rc = vm_check_access_key_gpa(kvm, access_key, mode, gpa);
 		length -= fragment_len;
 		gpa += fragment_len;
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index c8e292e9a24d..c060d1e2bb94 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -864,7 +864,7 @@ static int __do_insn_fetch_bytes(struct x86_emulate_ctxt *ctxt, int op_size)
 		return rc;
 
 	size = min_t(unsigned, 15UL ^ cur_size, max_size);
-	size = min_t(unsigned, size, PAGE_SIZE - offset_in_page(linear));
+	size = min_t(unsigned int, size, rest_of_page(linear));
 
 	/*
 	 * One instruction can only straddle two pages,
@@ -1372,7 +1372,7 @@ static int pio_in_emulated(struct x86_emulate_ctxt *ctxt,
 			address_mask(ctxt, reg_read(ctxt, VCPU_REGS_RCX)) : 1;
 		in_page = (ctxt->eflags & X86_EFLAGS_DF) ?
 			offset_in_page(reg_read(ctxt, VCPU_REGS_RDI)) :
-			PAGE_SIZE - offset_in_page(reg_read(ctxt, VCPU_REGS_RDI));
+			rest_of_page(reg_read(ctxt, VCPU_REGS_RDI));
 		n = min3(in_page, (unsigned int)sizeof(rc->data) / size, count);
 		if (n == 0)
 			n = 1;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
