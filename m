Return-Path: <SRS0=17fP=LL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DB7C2B9F4
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 13:34:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F43610A2
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jun 2021 13:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F43610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ugFGnfhhpQG5RZc4teBdwFwhfo1K3IRmfahsu80uEC0=; b=QmNaTO3I9h5qpb+QENNxUcbPfD
	WHL3b4rFGqk5LMofh+gwyfdieQpwDjgfKt+JciekRL44NC+2xVPmFghlaoyiCXhrPeN4mGICL08ZW
	k01wpFzwqtnHW5qPp8TXASXJ1FyoHIQO1STJt2CbRk+2qaD0Zbdg4Vprhsw9kAq2uoWtspbkp79xb
	nObDq1gyl4cChRGX7UGbavMJJpSGD7YThIEqo2vu7jYguxWhYX+aI5ddwsjVwrgohmX3aKyM6dBYP
	CjZCh2hc463bT1D+6QJ7qlapXV+RyI7ywMgRwCo2f7zx5dPYuiyCqAzEEl0Xfg7DpA/0An2zYAojH
	kkQS3CGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lts9d-00AWHw-UA; Thu, 17 Jun 2021 13:33:57 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lts9a-00AWGe-K9
 for linux-riscv@lists.infradead.org; Thu, 17 Jun 2021 13:33:56 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 75B2940011;
 Thu, 17 Jun 2021 13:33:49 +0000 (UTC)
Subject: Re: [PATCH v6 0/3] Introduce 64b relocatable kernel
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20210518101252.1484465-1-alex@ghiti.fr>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <8512c6b0-3dff-5485-b5d8-638044594973@ghiti.fr>
Date: Thu, 17 Jun 2021 15:33:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210518101252.1484465-1-alex@ghiti.fr>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_063354_978579_A1EAC09B 
X-CRM114-Status: GOOD (  24.08  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le 18/05/2021 =E0 12:12, Alexandre Ghiti a =E9crit=A0:
> After multiple attempts, this patchset is now based on the fact that the
> 64b kernel mapping was moved outside the linear mapping.
> =

> The first patch allows to build relocatable kernels but is not selected
> by default. That patch should ease KASLR implementation a lot.
> The second and third patches take advantage of an already existing powerpc
> script that checks relocations at compile-time, and uses it for riscv.

@Palmer, any thought about that? There are no users for now, do you want =

to wait for a KASLR implementation to use it before merging this? If so, =

I can work on a KASLR implementation based on older implementation from =

Zong.

Thanks,

> =

> This patchset was tested on:
> =

> * kernel:
> - rv32: OK
> - rv64 with RELOCATABLE: OK and checked that "suspicious" relocations are=
 caught.
> - rv64 without RELOCATABLE: OK
> - powerpc: build only and checked that "suspicious" relocations are caugh=
t.
>                                                                          =
         =

> * xipkernel:
> - rv32: build only
> - rv64: OK
> =

> * nommukernel:
> - rv64: build only
> =

> Changes in v6:
>    * Remove the kernel move to vmalloc zone
>    * Rebased on top of for-next
>    * Remove relocatable property from 32b kernel as the kernel is mapped =
in
>      the linear mapping and would then need to be copied physically too
>    * CONFIG_RELOCATABLE depends on !XIP_KERNEL
>    * Remove Reviewed-by from first patch as it changed a bit
> =

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
> =

> Changes in v3:
>    * Move kernel mapping to vmalloc
> =

> Changes in v2:
>    * Make RELOCATABLE depend on MMU as suggested by Anup
>    * Rename kernel_load_addr into kernel_virt_addr as suggested by Anup
>    * Use __pa_symbol instead of __pa, as suggested by Zong
>    * Rebased on top of v5.6-rc3
>    * Tested with sv48 patchset
>    * Add Reviewed/Tested-by from Zong and Anup
> =

> Alexandre Ghiti (3):
>    riscv: Introduce CONFIG_RELOCATABLE
>    powerpc: Move script to check relocations at compile time in scripts/
>    riscv: Check relocations at compile time
> =

>   arch/powerpc/tools/relocs_check.sh | 18 ++--------
>   arch/riscv/Kconfig                 | 12 +++++++
>   arch/riscv/Makefile                |  5 ++-
>   arch/riscv/Makefile.postlink       | 36 ++++++++++++++++++++
>   arch/riscv/kernel/vmlinux.lds.S    |  6 ++++
>   arch/riscv/mm/Makefile             |  4 +++
>   arch/riscv/mm/init.c               | 53 +++++++++++++++++++++++++++++-
>   arch/riscv/tools/relocs_check.sh   | 26 +++++++++++++++
>   scripts/relocs_check.sh            | 20 +++++++++++
>   9 files changed, 162 insertions(+), 18 deletions(-)
>   create mode 100644 arch/riscv/Makefile.postlink
>   create mode 100755 arch/riscv/tools/relocs_check.sh
>   create mode 100755 scripts/relocs_check.sh
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
