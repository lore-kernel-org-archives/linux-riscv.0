Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE9FC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 12:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jch1aydGS+dIcKDvpCalppEnIBxSFWKVUPuktXxHGAE=; b=0+FyeU0xGJoV/W
	zK2vnDTx4GxYPMguVWqVmLIwjTSCRcDvy8mtZVu8PC8b1720Ew3T7Ze9fp9FdyI7cKenUk/dhqnwU
	hSZ3Q6Nrhe5LxppwYxZH3UlKCxrupV0nbIttPARYNr/S/H/5Cn4Jv1RvyMqoVGRbQsQ/mGpahNqtP
	nkUZysIE5v+Yd10uPlrTnd0H2xQGDnVSN3FKIJMeZlVDAwTkyzgfYG+iDvtqFE/T49yh1UCwytLpX
	zKBJ0tz7Jkni/3ZoElxfQUWeYbWYsCcr81rvnUtiikSR7K/ieXgTaP8ARTPccbx3ygeZ7X1jsHxJq
	qi75cMd3+pMuuPboQqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owN9y-00DlzU-Ud; Sat, 19 Nov 2022 12:41:26 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owN9w-00Dlmp-4e
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 12:41:25 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-12c8312131fso8987490fac.4
        for <linux-riscv@lists.infradead.org>; Sat, 19 Nov 2022 04:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ukIKYhKcZQpJNegqQ3ExbTO6FMrR9OLmlAf7eR0n2TU=;
        b=Dw0k+yWMHTCoPUk2OuSG3qdmxFTLbjwhGbhCa7cWdMqxgac5/bT/ks8OArPGczeRGB
         i9V0rT5g87bCv/ZC4xLKB9KiKz8QxImao4c45SDYUyBiFdoBHoBmYQfVX7+27hIi6K2i
         5LsTsUiPEIvVwzNgoqwMAWCPVD7WhBp2kxGt5Uswp+2t0puVx7ci4pejoRNmsck3O9zI
         zkvfRqoM8IhbHjE/ghPyVMmg0/2XCNHRXikvL2CBI15tjxZ1eSI/OEC0AzGG5OfSDkOr
         vr5Noz/xSjKKYyL1TnK7FNw1Q5nZXhe78C1wkJ1MlN7iYO6k9r5Kz11vgFX/TPcT+KvC
         U7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ukIKYhKcZQpJNegqQ3ExbTO6FMrR9OLmlAf7eR0n2TU=;
        b=m2ZNLx6A2+fkff0xcoan5cWEotsbGZu5KYxSyDBjF2txq6sEd+6UZy4YyDSBvcKred
         PHufESPmOGCdsnMN8gXReKYbQKyyzK31VL/5TEKcbpYqCGvS8jo8vU0qbBY8x7bm8lnu
         FuBuuDxnJwC8kP+0qGGGB6kgQ8ikE6AEsU03kVa4dkJj9N8cAai6yGHfhb37orKa7Q4e
         FN/t8ZBk7fi+BGpaugnO9dXKRJO7VUpBUCP4ymm7MDa9OW38psTLMegmQHCNwMrJD6pw
         U/5U0OdApEfoBoLjITIgcAG7uZyodXMcNrGKjx8pXeF8kp2uXxCafOjxD7ptpE3I9SnF
         oTPw==
X-Gm-Message-State: ANoB5plKbZfyGDxhcEjUIQFIbLWflobs8zw50ooXQ6mfc393jRGtxjqr
	3CB/kxvaZ2JXtoq2PtwdxZNgoSHlY/l9tT3Nep1Wxg==
X-Google-Smtp-Source: AA0mqf59eo6RB/JabY5iA+XwD4aELknMkiZwGCBNgxjw+gr7HUVOJK9NzHuAqsU7+shp++Rs2Hml8og4EeVGVLSpunQ=
X-Received: by 2002:a05:6870:ad0e:b0:132:a767:a2ba with SMTP id
 nt14-20020a056870ad0e00b00132a767a2bamr6249902oab.271.1668861681057; Sat, 19
 Nov 2022 04:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20221114090536.1662624-1-apatel@ventanamicro.com> <Y3JvwagRsMOJyayy@spud>
In-Reply-To: <Y3JvwagRsMOJyayy@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 19 Nov 2022 18:11:08 +0530
Message-ID: <CAK9=C2VRbUiFS2dCNVoC4KJNe4L+EMXNpfSfTrGoFuLRko1TkA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add PMEM support for RISC-V
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_044124_208390_BBE2E03B 
X-CRM114-Status: GOOD (  21.47  )
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

On Mon, Nov 14, 2022 at 10:11 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Anup,
>
> Looks like patches 2 and 3 are failing for the nommu defconfigs:
> https://patchwork.kernel.org/project/linux-riscv/list/?series=694995
> Unfortunately, if the build fails NIPA doesn't appear to save a log.
>
> In case it's relevant, should be gcc-11 & bintutils 2.37.

I tried nommu defconfigs with gcc-12.1.0 and binutils-2.39 and I did
not see any failure.

Regards,
Anup

>
> Thanks,
> Conor.
>
> On Mon, Nov 14, 2022 at 02:35:33PM +0530, Anup Patel wrote:
> > The Linux NVDIMM PEM drivers require arch support to map and access the
> > persistent memory device. This series adds RISC-V PMEM support using
> > recently added Svpbmt and Zicbom support.
> >
> > First two patches are fixes and remaining two patches add the required
> > PMEM support for Linux RISC-V.
> >
> > These patches can also be found in riscv_pmem_v6 branch at:
> > https://github.com/avpatel/linux.git
> >
> > Changes since v5:
> >  - Rebased on Linux-6.1-rc5
> >  - Directly add pmem.o in obj-y of PATCH3
> >  - Dropped PATCH1 since this is already merged.
> >
> > Changes since v4:
> >  - Simplify PATCH2 by implementing RISC-V specific arch_memremap_wb()
> >
> > Changes since v3:
> >  - Pickup correct version of Drew's patch as PATCH1
> >
> > Changes since v2:
> >  - Rebased on Linux-6.1-rc1
> >  - Replaced PATCH1 with the patch proposed by Drew
> >
> > Changes since v1:
> >  - Fix error reported by test bot
> >    https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/
> >
> > Anup Patel (3):
> >   RISC-V: Fix MEMREMAP_WB for systems with Svpbmt
> >   RISC-V: Implement arch specific PMEM APIs
> >   RISC-V: Enable PMEM drivers
> >
> >  arch/riscv/Kconfig           |  1 +
> >  arch/riscv/configs/defconfig |  1 +
> >  arch/riscv/include/asm/io.h  |  5 +++++
> >  arch/riscv/mm/Makefile       |  1 +
> >  arch/riscv/mm/pmem.c         | 21 +++++++++++++++++++++
> >  5 files changed, 29 insertions(+)
> >  create mode 100644 arch/riscv/mm/pmem.c
> >
> > --
> > 2.34.1
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
