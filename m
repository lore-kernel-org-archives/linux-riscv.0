Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEF8C38142
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jan 2023 09:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WgBhwSfy2GJzLnLUv9NJg4oQVAMzgq/Ji/wkNEGTps=; b=cR/4QLlXbLVtzT
	vZTwrRgS3/1gORpUW4G1exqtUipGOC6nrS9YVPzcauCS1lmqXyr0WH3gKCQ9Wi4tgzLUhgzXqKW9X
	R1rKwW8065LcgLxnLA3OUXbZjBSSAQsy1NoTI6VkGEmI7XdZbtmzGX62PslUG8ucOjbklFjuNIl9u
	hMzLiqpJtI6+Dr0cle/20VHdOy8PEHWBPyQD+RZDHtW18MXkseJlUzl7DEdY23rIVJ4a5NSk11vLp
	cWqtlAP/7N+5Oy67dnQPVMK3RcwfenBa3ZWmzX0JERfJm0bB9DtZzl0vEoa5/Mf6Qp4MA+MKMTDe0
	nfBGmED87D6JY4N2ORrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFEi-002p3g-If; Tue, 24 Jan 2023 09:05:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKFEe-002p30-4T
	for linux-riscv@lists.infradead.org; Tue, 24 Jan 2023 09:04:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id r9so13164670wrw.4
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jan 2023 01:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i1juhkmhpvx2lT4x4u+c5+9s9S4X54bhJYPvzt6ZWnE=;
        b=8R7UGXzogpSZH3Cp+NSSbVCzzvNbQcxPAtX9ECF9aLa/JCykl+NcPb3t87f5F09V9T
         GlKkIG22mHuVpzNgOc5H81+jPFAEQrCnF6t6ztL/4c6kzf1nt6f5q8JpIx5qFKQnLxzQ
         vS1KF/8gU3eJylhbeMxZoN3xd/Cxl/agoR5NJSvUG+L9vIeFR3jVjb4JdBtB9kMCZi/k
         ZTC42UPjHAw3DZe3NYlMzhNOVX/mXw4aXZu3GX9wp/x6GOHuN05aX2g5j4gmEz/eqUqr
         v9m2xdFf3T/xSN3o1YMKqlfxtFaR5rm5DkgEWhLmz5R3Un6nlmPhfD+xDdKvmi84TW9w
         rXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1juhkmhpvx2lT4x4u+c5+9s9S4X54bhJYPvzt6ZWnE=;
        b=069LpwlRxPA6tVcVxN/z+7nhbnXObSL+tVfXBiNmvEKjv8OxzNJ9fnP041rbvaz/vz
         Y9OynZegw32J35Pppg9feRfnnns2RtSi1c+oMp9gUNPZRu9trcFVQt4p5zKSCRKcDXc7
         CzvalHZh7zlGv1hxi5j6or5jxzikVdFqfNl/LGvrMnbNjI2hOBpM6MciDWfv5XTb9bfv
         sikwHwHWdEjDBum0cQ+ggX3/1XqHbePyHyRj5Lraf26A14JsSOo6PcCp/d1ddfMW6PCY
         QjOvYZpKMCmOeYKdNDEb7fzpqK9A79iRJLO0kYVlOduuBlk+gDpqvdUAXDwWa4n9S7tT
         Gz8w==
X-Gm-Message-State: AFqh2koQ5G2ZI/9JvC80cDb+JTIKFdsymcN6F8fupUMb3iUsx67bzCWe
	ijpFaFBqF0UH8thrIBrvLvQ8aNq0fR7PgEcAP4Gv5g==
X-Google-Smtp-Source: AMrXdXslWzyBPl6qN6lfBta/ufChiJMu2Y2CiUL1C94ZCECbF4eI9FFmR8w/ZsdDLVJkOVp28ufLm8pcdg8HVQLMWtk=
X-Received: by 2002:a5d:5190:0:b0:2bd:d6bc:e35c with SMTP id
 k16-20020a5d5190000000b002bdd6bce35cmr1227921wrv.144.1674551093678; Tue, 24
 Jan 2023 01:04:53 -0800 (PST)
MIME-Version: 1.0
References: <20230123112803.817534-1-alexghiti@rivosinc.com> <Y88F808GULoKFOVJ@spud>
In-Reply-To: <Y88F808GULoKFOVJ@spud>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 10:04:42 +0100
Message-ID: <CAHVXubh=SQ0fS2FCpdB-TD5n=DHUHAaRqDazHWDMv3fWqwpjcA@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Use PUD/P4D/PGD pages for the linear mapping
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_010456_400189_5D9B7103 
X-CRM114-Status: GOOD (  25.22  )
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

On Mon, Jan 23, 2023 at 11:11 PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Jan 23, 2023 at 12:28:02PM +0100, Alexandre Ghiti wrote:
> > During the early page table creation, we used to set the mapping for
> > PAGE_OFFSET to the kernel load address: but the kernel load address is
> > always offseted by PMD_SIZE which makes it impossible to use PUD/P4D/PGD
> > pages as this physical address is not aligned on PUD/P4D/PGD size (whereas
> > PAGE_OFFSET is).
> >
> > But actually we don't have to establish this mapping (ie set va_pa_offset)
> > that early in the boot process because:
> >
> > - first, setup_vm installs a temporary kernel mapping and among other
> >   things, discovers the system memory,
> > - then, setup_vm_final creates the final kernel mapping and takes
> >   advantage of the discovered system memory to create the linear
> >   mapping.
> >
> > During the first phase, we don't know the start of the system memory and
> > then until the second phase is finished, we can't use the linear mapping at
> > all and phys_to_virt/virt_to_phys translations must not be used because it
> > would result in a different translation from the 'real' one once the final
> > mapping is installed.
> >
> > So here we simply delay the initialization of va_pa_offset to after the
> > system memory discovery. But to make sure noone uses the linear mapping
> > before, we add some guard in the DEBUG_VIRTUAL config.
> >
> > Finally we can use PUD/P4D/PGD hugepages when possible, which will result
> > in a better TLB utilization.
> >
> > Note that we rely on the firmware to protect itself using PMP.
> >
> > Acked-by: Rob Herring <robh@kernel.org> # DT bits
> > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> No good on !MMU unfortunately Alex:
> ../arch/riscv/mm/init.c:222:2: error: use of undeclared identifier 'riscv_pfn_base'
>         riscv_pfn_base = PFN_DOWN(phys_ram_base);
>         ^
>
> Reproduces with nommu_virt_defconfig.

Thanks, fixed locally, I'll push the v5 soon.

Thanks again,

Alex

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
