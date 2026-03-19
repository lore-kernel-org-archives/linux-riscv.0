Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3E4108E1E8
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmUlWT7nHmJos59c5xTmYVSzF/MTalToiTmazoWehUA=; b=dxv7lSEeaRTyzO
	/eBh23mJ8kmZNKE3ztW+LX/pFa9msr+J6z7TyyLNw5oz5a0jhiSdTA9450ClHboDxgZmZsde+LJfN
	VOvK+TcheQDjSzX9pHAdrpKM+n+S7FrQtM35ZhYXOgqFTiGvBILHmZ3it6K7VGB3WbyBhHIModu3t
	xbLEHpoL6ZQRoNva97ijDH2GbmNPrZ04HYTH6DX7V9s5bcolZBiWdv2MXiAjcUNR38a0bo0y87CjQ
	rmH+RWpv2SKr3EAM5h2dqiMuzUg3XFTm+x+zzWMrMiaKIk1Cf8hRyAP1sn30dupCZUQJ9WmA3fKCT
	6bLDBT+6clyHV04X46+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BAS-0000000AUGK-3mGf;
	Thu, 19 Mar 2026 11:03:56 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BAP-0000000AUFg-1vmO;
	Thu, 19 Mar 2026 11:03:55 +0000
Received: from mail.maildlp.com (unknown [172.18.224.83])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fc2py5dyzzJ46Dn;
	Thu, 19 Mar 2026 19:02:50 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 0A71A40086;
	Thu, 19 Mar 2026 19:03:50 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 19 Mar
 2026 11:03:48 +0000
Date: Thu, 19 Mar 2026 11:03:46 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
CC: <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, "WANG
 Xuerui" <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
	<hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, "Thomas Gleixner" <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
	<ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil
 Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Zi Yan
	<ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn
	<joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
	<byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
	<ying.huang@linux.alibaba.com>, "Alistair Popple" <apopple@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, "Steven Rostedt" <rostedt@goodmis.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<linux-s390@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH 0/2] mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE and
 cleanup CONFIG_MIGRATION
Message-ID: <20260319110346.000034a5@huawei.com>
In-Reply-To: <20260319-config_migration-v1-0-42270124966f@kernel.org>
References: <20260319-config_migration-v1-0-42270124966f@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_040353_790637_D181E62F 
X-CRM114-Status: GOOD (  12.24  )
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

On Thu, 19 Mar 2026 09:19:39 +0100
"David Hildenbrand (Arm)" <david@kernel.org> wrote:

> While working on memory hotplug code cleanups, I realized that
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE is not really required anymore.
> 
> Changing that revealed some rather nasty looking CONFIG_MIGRATION
> handling.
> 
> Let's clean that up by introducing a dedicated CONFIG_NUMA_MIGRATION
> option and reducing the dependencies that CONFIG_MIGRATION has.
> 
> Heavily cross compiled. I assume these changes are fine, but messing
> with kconfig sometimes feels like playing with fire :)
Seems fine to me, but I agree it always feels a bit like playing with fire.
So more eyes good!

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> 
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
> David Hildenbrand (Arm) (2):
>       mm: remove CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE
>       mm: introduce CONFIG_NUMA_MIGRATION and simplify CONFIG_MIGRATION
> 
>  arch/arm64/Kconfig           |  1 -
>  arch/loongarch/Kconfig       |  1 -
>  arch/powerpc/Kconfig         |  1 -
>  arch/riscv/Kconfig           |  1 -
>  arch/s390/Kconfig            |  1 -
>  arch/x86/Kconfig             |  1 -
>  include/linux/memory-tiers.h |  2 +-
>  init/Kconfig                 |  2 +-
>  mm/Kconfig                   | 33 +++++++++++++++------------------
>  mm/memory-tiers.c            | 12 ++++++------
>  mm/mempolicy.c               |  2 +-
>  mm/migrate.c                 |  5 ++---
>  12 files changed, 26 insertions(+), 36 deletions(-)
> ---
> base-commit: fbf55982f31ae6aa11f890c36bccc130ce70a312
> change-id: 20260317-config_migration-463e20400499
> 
> Best regards,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
