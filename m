Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B29EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 09:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLV1RlceFoPmVinWY/JnOnGjgKHh0yBDfAKPQxlosfg=; b=o+HRzWsI0/2mt/
	FRnkRheFDoAqll+ryn17dDYIsuckpg6LVC26AXAkLi/x8+xYEBWv0mNdmWbj7A+kW3IlQeZfPC7yZ
	dP3KGhNzcNSmyHCj5Nonsiu7dHcWODL3kaD2Xt4cZ0QNYy/IaabHa7YIV9BnwvPcIpxv7bln/o1iY
	PzqSOWCrC5XOlIIwfv+QP6A9vktVQHPwMLNflNPJFKb/MQrw+awxa6+DNL/8oBkwSo5sr6Zb+D1P4
	6YieOb7aqdyNFVgYPUkVy1akUP/6cN05cT60dxv7YSeT6Phck8R85pecsgLlxpon89UVZFZ2PDcAp
	Ia/KfeE8DWcBIet+OdHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPL8F-0020dG-Uk; Wed, 02 Mar 2022 09:18:51 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPL84-0020Zt-Id; Wed, 02 Mar 2022 09:18:41 +0000
Received: by mail-ej1-x62f.google.com with SMTP id qk11so2349942ejb.2;
 Wed, 02 Mar 2022 01:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4LuLQynsRS5ZDdiypHmCRhWOSK0fPQgMoxmBubsA8FA=;
 b=YwA2Tp9/WRHVf+AhpCscraLQ5YZMBIbTnjRD9qXALixvArniZHwws+D5eKFYJ4w9RG
 r5YPECm/lP0oAUKfe9WRJhv6+FML2S+XIXHKeVDBXWzTRzpq8V5VyDtMBBLt+RgC4uif
 rGbJjiYJ+RaebcdTWE+lgavU2sjB3KE2oYMSI2g0SnLEMM8BFRLk6tjS00Xev2qK5BZV
 5Ssf9EZ0tsmaxYSBGN+JYRBhKcBJnRtyUIj9fj+nmKF1+vj7CNwKABPlCEiIkg4HqhVl
 prjve+Nrt6ySEZf00Hzlz9gQ4nrt4ykYynGeggVTPypi2WOB4Q0/x8pbTwKWJmRWzNiw
 F8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4LuLQynsRS5ZDdiypHmCRhWOSK0fPQgMoxmBubsA8FA=;
 b=fMEqvkgKLqkabKOgXu3XGQc6QYtxF0JFDu41Zto5qi56hlA83EJl0+VOkSFRefqA14
 um8+01cv0a6f7AuNviJgnjd4VGaZJKnPLIpE7jqw57gGRczl3p7/w1y6OoYlPfmsN7m/
 LjbaUqrlO4zlfz7zXvAdkR2Hu3bFDJHlIE3QZdSg+jnmI+ADiK3MNQbA2GeaxKMUDjFa
 dYjztfPVU1bbx0d7jABgiHjKGwzi2QqXP/F/tM794gdv+K30StGrP7sZKZ0vRNzFYPdh
 IJODSR4NsfMQYdxZhK9okVh4f5gkagOOquhF47IWibHe/UG1b0yunlPySAcjBtEtsug9
 xZlQ==
X-Gm-Message-State: AOAM530ODNGqN3BHF4gyAoKyEjg1eN7d0geu5E8RZYyXmtGhm1dG3+hS
 b2yYRrq52lZncRgAZmHQU5kB82Ze/v7zePaN9/o=
X-Google-Smtp-Source: ABdhPJxefZcxfzkkMgbjOK8FTIKDUrSjhwIhlbq76ukZRP/HPSQoF7TsleylqvSIE+LRhSKcwrjAT6lGtFvgDJjKhNk=
X-Received: by 2002:a17:906:9f06:b0:6ce:36da:8247 with SMTP id
 fy6-20020a1709069f0600b006ce36da8247mr21813101ejc.651.1646212718008; Wed, 02
 Mar 2022 01:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20220227143055.335596-1-hch@lst.de>
 <20220227143055.335596-8-hch@lst.de>
In-Reply-To: <20220227143055.335596-8-hch@lst.de>
From: Anatoly Pugachev <matorola@gmail.com>
Date: Wed, 2 Mar 2022 12:18:26 +0300
Message-ID: <CADxRZqxrjp4erFNorH+XqubZWLRNjw2E14z7vOW537no1eKnhw@mail.gmail.com>
Subject: Re: [PATCH 07/11] x86: remove the IOMMU table infrastructure
To: Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux-foundation.org, x86@kernel.org, 
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
 Stefano Stabellini <sstabellini@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>, 
 Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org, 
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390 <linux-s390@vger.kernel.org>, linux-hyperv@vger.kernel.org, 
 tboot-devel@lists.sourceforge.net, linux-pci@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_011840_639744_CFC3FE8E 
X-CRM114-Status: GOOD (  17.47  )
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

On Sun, Feb 27, 2022 at 7:31 PM Christoph Hellwig <hch@lst.de> wrote:
>
> The IOMMU table tries to separate the different IOMMUs into different
> backends, but actually requires various cross calls.
>
> Rewrite the code to do the generic swiotlb/swiotlb-xen setup directly
> in pci-dma.c and then just call into the IOMMU drivers.
...
> --- a/arch/x86/include/asm/iommu_table.h
> +++ /dev/null
> @@ -1,102 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_X86_IOMMU_TABLE_H
> -#define _ASM_X86_IOMMU_TABLE_H
> -
> -#include <asm/swiotlb.h>
> -
> -/*
> - * History lesson:
> - * The execution chain of IOMMUs in 2.6.36 looks as so:
> - *
> - *            [xen-swiotlb]
> - *                 |
> - *         +----[swiotlb *]--+
> - *        /         |         \
> - *       /          |          \
> - *    [GART]     [Calgary]  [Intel VT-d]
> - *     /
> - *    /
> - * [AMD-Vi]
> - *
> - * *: if SWIOTLB detected 'iommu=soft'/'swiotlb=force' it would skip
> - * over the rest of IOMMUs and unconditionally initialize the SWIOTLB.
> - * Also it would surreptitiously initialize set the swiotlb=1 if there were
> - * more than 4GB and if the user did not pass in 'iommu=off'. The swiotlb
> - * flag would be turned off by all IOMMUs except the Calgary one.
> - *
> - * The IOMMU_INIT* macros allow a similar tree (or more complex if desired)
> - * to be built by defining who we depend on.
> - *
> - * And all that needs to be done is to use one of the macros in the IOMMU
> - * and the pci-dma.c will take care of the rest.
> - */

Christoph,

Is it possible to keep documentation comments in source files? Or are
they completely irrelevant now?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
