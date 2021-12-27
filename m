Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5863BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 16:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bHbk8K1RPfUA80K+qAhdSibOWthriDySxJqBZe82MY=; b=FbSixvzle2yK/v
	CoQv+HXM8uuUNeaPB+eEiZFkduUSt/yRp942M/PUJuF3xi3DNiAgrZJaLSDUM9GASYyDcEt17krkw
	/oah8BdxYjwGP/DNS6liR1RRcoYn6piJu1dPVvZeH945zqajT8KcF22hFf8H3A+YarIB7Q//nh0TF
	ZaW8WnFu2YI5b/c7qJeJ8iNdGS5o97uM2zxs188iolHMXkargY3FvyBIXwI9YzkXs81fAM2+CNbCV
	FmNq2r+C1H4IXEGnSJl7MdQ6d5ggKeE4ysJNVD9jPKm9ZBTYbJ8vrGLrOsfgzK5zQEBtyEQYVuqbw
	DiZZQc9LiGO4IVM/oBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tDJ-00H46Q-Mc; Mon, 27 Dec 2021 16:51:09 +0000
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tAB-00H2iC-Gz
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 16:47:57 +0000
Received: by mail-qv1-f49.google.com with SMTP id h5so14190038qvh.8
 for <linux-riscv@lists.infradead.org>; Mon, 27 Dec 2021 08:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lDE0B4GVjE0LJYoy9bVa5acyiTrwOeGwxNWWSw8Ch2k=;
 b=OH7Ne95pEh+7/weJijxf9SU7o21JC4inhEdgpecOtuWjW9Z4P9jxkbnP7351bVc6HN
 Qzp/SgLRWhMD4X/ANnkNB7QQxjcpokROPxyggSBTJ8rOU+X6Lfqa4qBn1XCF4vERBf+D
 DVtkaoPPwo+vLPr5LeREma4pJp651crfDVR8cU2bSgTK4G2tcNo2wfkkNmNGnOxmYvEz
 NQUURice7ImuELzTD/GAyny1U3wHbY2sWe1dFwZAO6qnJ6jXrkloAk5JOdGHRO+W49i2
 yzJHcXOnpWMvbuHsz5jU3nlk/pzm5eVNMNpfIcLV+4OinylfeOaKtxtoUhpj24aetZEN
 zMvA==
X-Gm-Message-State: AOAM530HgrCMRLSDieSlwmvyd9s55F+ze3Qwime+VYg6T2s4LXnEz+Th
 b7yrCid3SLcB/r3kEcJntGIXMrR9UGY2cOy07Vs=
X-Google-Smtp-Source: ABdhPJzp91sTo1r6iyIdgTKl3gnZIU8G2ysznYOFt0lPn6SLPamsy1tCaZ8DFJhpq8W07Mr639WN2Jo3fcSBJq/l1lU=
X-Received: by 2002:a05:6214:508f:: with SMTP id
 kk15mr15558614qvb.61.1640623673123; 
 Mon, 27 Dec 2021 08:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-4-schnelle@linux.ibm.com>
In-Reply-To: <20211227164317.4146918-4-schnelle@linux.ibm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 27 Dec 2021 17:47:42 +0100
Message-ID: <CAJZ5v0iBJ8NtQautnWnp_pXMfLy_rxys8j4+ugSTbNBb=wzy6A@mail.gmail.com>
Subject: Re: [RFC 03/32] ACPI: Kconfig: add HAS_IOPORT dependencies
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux PCI <linux-pci@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 linux-csky@vger.kernel.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_084755_611912_487DB507 
X-CRM114-Status: GOOD (  13.28  )
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

On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. As ACPI always uses I/O port access

The ARM64 people may not agree with this.

> we depend on HAS_IOPORT unconditionally.
>
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/acpi/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
> index cdbdf68bd98f..b57f15817ede 100644
> --- a/drivers/acpi/Kconfig
> +++ b/drivers/acpi/Kconfig
> @@ -9,6 +9,7 @@ config ARCH_SUPPORTS_ACPI
>  menuconfig ACPI
>         bool "ACPI (Advanced Configuration and Power Interface) Support"
>         depends on ARCH_SUPPORTS_ACPI
> +       depends on HAS_IOPORT
>         select PNP
>         select NLS
>         default y if X86
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
