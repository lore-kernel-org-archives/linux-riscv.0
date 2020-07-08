Return-Path: <SRS0=nZh1=AT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25489C433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 04:22:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9271C20708
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 04:22:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CK6SpNZD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9271C20708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qHcX/7MUDpscQK0rD9D33faVrLi1VKgCOWtbaeRWMmo=; b=CK6SpNZDbUpat9oeBx0gS88ic
	ke5cR+cZqcgZMPkLRzAlUMs9Gn70HrFzg03tgZUFvz6fiqX8KQoeBk+JYvF64jM08dBeyQx8P49zB
	kF/gJyrn8/HN7rKawPrpgsQTrcgEUYb8PZA/jgP8+E5hQxE16+znZ2G5f11dZ4KOl/+t4pIjET53O
	W7k/P5Qn1/E7pvvmIOrK1bHxQo0TzyyzCJO6tsvNitnv4w5FVsaJ6iwpLZnAFHS1Sm8GRsn8ehSL6
	kZhx+6Pu8qa+ljH/XDvxi/m0ix+SOH6EHBivjDqBBJW4/ykdiVz2ZggcIKmxmux6/sJ9B0iitP0H3
	+fv6ohb9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt1al-00015y-NR; Wed, 08 Jul 2020 04:21:55 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt1aj-00015S-6S
 for linux-riscv@lists.infradead.org; Wed, 08 Jul 2020 04:21:54 +0000
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.11] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C642C60003;
 Wed,  8 Jul 2020 04:21:42 +0000 (UTC)
Subject: Re: [PATCH v5 0/4] vmalloc kernel mapping and relocatable kernel
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
References: <20200607075949.665-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8f47d523-5c01-1614-dbb0-d938f07be65f@ghiti.fr>
Date: Wed, 8 Jul 2020 00:21:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200607075949.665-1-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_002153_423315_367BC337 
X-CRM114-Status: GOOD (  21.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

Le 6/7/20 =E0 3:59 AM, Alexandre Ghiti a =E9crit=A0:
> This patchset originally implemented relocatable kernel support but now
> also moves the kernel mapping into the vmalloc zone.
>                                                                          =
         =

> The first patch explains why we need to move the kernel into vmalloc
> zone (instead of memcpying it around). That patch should ease KASLR
> implementation a lot.
>                                                                          =
         =

> The second patch allows to build relocatable kernels but is not selected
> by default.
>                                                                          =
         =

> The third and fourth patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.
>                                                                          =
         =

> Changes in v5:
>    * Add "static __init" to create_kernel_page_table function as reported=
 by
>      Kbuild test robot
>    * Add reviewed-by from Zong
>    * Rebase onto v5.7
> =

> Changes in v4:
>    * Fix BPF region that overlapped with kernel's as suggested by Zong
>    * Fix end of module region that could be larger than 2GB as suggested =
by Zong
>    * Fix the size of the vm area reserved for the kernel as we could lose
>      PMD_SIZE if the size was already aligned on PMD_SIZE
>    * Split compile time relocations check patch into 2 patches as suggest=
ed by Anup
>    * Applied Reviewed-by from Zong and Anup
>                                                                          =
         =

> Changes in v3:
>    * Move kernel mapping to vmalloc
>                                                                          =
         =

> Changes in v2:
>    * Make RELOCATABLE depend on MMU as suggested by Anup
>    * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
>    * Use __pa_symbol instead of __pa, as suggested by Zong
>    * Rebased on top of v5.6-rc3
>    * Tested with sv48 patchset
>    * Add Reviewed/Tested-by from Zong and Anup
> =

> Alexandre Ghiti (4):
>    riscv: Move kernel mapping to vmalloc zone
>    riscv: Introduce CONFIG_RELOCATABLE
>    powerpc: Move script to check relocations at compile time in scripts/
>    riscv: Check relocations at compile time
> =

>   arch/powerpc/tools/relocs_check.sh |  18 +----
>   arch/riscv/Kconfig                 |  12 +++
>   arch/riscv/Makefile                |   5 +-
>   arch/riscv/Makefile.postlink       |  36 +++++++++
>   arch/riscv/boot/loader.lds.S       |   3 +-
>   arch/riscv/include/asm/page.h      |  10 ++-
>   arch/riscv/include/asm/pgtable.h   |  38 ++++++---
>   arch/riscv/kernel/head.S           |   3 +-
>   arch/riscv/kernel/module.c         |   4 +-
>   arch/riscv/kernel/vmlinux.lds.S    |   9 ++-
>   arch/riscv/mm/Makefile             |   4 +
>   arch/riscv/mm/init.c               | 121 +++++++++++++++++++++++++----
>   arch/riscv/mm/physaddr.c           |   2 +-
>   arch/riscv/tools/relocs_check.sh   |  26 +++++++
>   scripts/relocs_check.sh            |  20 +++++
>   15 files changed, 259 insertions(+), 52 deletions(-)
>   create mode 100644 arch/riscv/Makefile.postlink
>   create mode 100755 arch/riscv/tools/relocs_check.sh
>   create mode 100755 scripts/relocs_check.sh
> =


Do you have any remark regarding this series ?

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
