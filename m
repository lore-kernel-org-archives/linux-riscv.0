Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FA0C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Mar 2022 20:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SIQgxcHVH9CZYZfYGbVW6YrkjRrBVtYTgFq2lcV3ag=; b=rhBGrienlq7Kij
	Bm4+PCCz8fCXnqbqMskZQ7db8yGinR0/dpuwi5qpaFas4y0e6p1ZjXQcbczlshEQrbbEmDl/Dkjz9
	EgVD8oU5P5XfHdiVkwgJ3jGY4U9Lu0OQ+ieiN6oj7nLQu5ibyfgSorj2Bwg1IwBsEDhuZooEJa/R2
	81zMLok51fRN2/QLTpbJLtMZXR/t/3W/igHBGfiBVlln1RyvSdJimppGB54hy+lzRIQzD86TAodqj
	A+RDe0b7nA1/ueTf8TeOkz5P76ZD4dQDWR7l3cQ/MnO6soK+tGkrjJ04QmL4gU0cWpXgdag+Q9sfm
	092plglQAg5b9ae7+sKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPVr1-0047Y0-Fu; Wed, 02 Mar 2022 20:45:47 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPVqp-0047VP-1c; Wed, 02 Mar 2022 20:45:36 +0000
Received: by mail-yb1-xb36.google.com with SMTP id x200so5881390ybe.6;
 Wed, 02 Mar 2022 12:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y6qqvHc/+bg7logl0Wqx5hN0gsT9pLtg+9GuBdEyV/s=;
 b=N6mzMrvWJ3NnD3ZyiJjMdVcsCSd17WTZeB6K7pfo5O4CTlaCF/zVdybZv+jhlTrmxe
 uPhSjCcemXAPPjSrv6Mt5HWt3iMD5ymv09MAlL+oTjIdHYCdg/0ssExCUuNBW85SJtyL
 6OeZi79DSlqdlABdL8kngO2BoTutu+xJFXugejEjTOelpI2a+1M4P6YxOlDkDUJyF29p
 PgdD7Ic+/VgjKaC6I7tmOHYd0tLr5EfPZX9OcETMEavgE8GzKwipHdx6ClJQBP2rXN9f
 EGUY3EVA/3aCTBVmeMF2lzsoXWVLoxju/7BmHfIIowzLDvJ2L+u3IWbGBpTNizOgCwuq
 xi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y6qqvHc/+bg7logl0Wqx5hN0gsT9pLtg+9GuBdEyV/s=;
 b=Tos5KRDNRn1/d0zQ896PWKHKpVmnkIoEB0v1HcJP8qVhgivjo3XW2Z/GosiJCNycvP
 8USLmE7XL84MucdyZ7LpP94XHmvzKxfWOlHmpwP7vsRQB/Ej8rFthEAcyzsYF0VPiEyS
 E8I2PG4UDkML0QOzCER7IXvnV5kV6YwW1bzJyYL5TOAgqeDRv5nIbFbWkslBs8mOFX+5
 3FaZpsfGtebWKllwwI4bm7eSQz7cq/sv5tuGdb5SNMjEvlDB9ePyuzSAgKwNX9/Fm+3L
 NeXAELvAbcA1GBPUKeX9xg+zAvqD9sGC5/L3I4PUHfWCt9f4gFMFRlpjM4bEFjkZas1+
 qOzw==
X-Gm-Message-State: AOAM532VwzGOx+JFPizT+G+qlTYNlbrNextPyjObzqteS4YaWxLVoHRN
 lFHQft8XDA3GL1gWNrhc1G1C+Hvkc0gHQT1mGdRr2z+YcWVN7Q==
X-Google-Smtp-Source: ABdhPJzRUMWLpsd+tQeqMe+lON1YrQZx9JkRO/Ga9/nynwkkheUILhBEVszCKkAbAE9UfTyjpoKk7tOUpMQSERi2HWM=
X-Received: by 2002:a25:23d2:0:b0:628:771a:9d3 with SMTP id
 j201-20020a2523d2000000b00628771a09d3mr10191498ybj.215.1646253932161; Wed, 02
 Mar 2022 12:45:32 -0800 (PST)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2202141955550.34636@angie.orcam.me.uk>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Wed, 2 Mar 2022 20:44:56 +0000
Message-ID: <CADVatmP4sPwyqi6vKPm3QOFD=47w1LwXtsUynhecY4wMYGhXmw@mail.gmail.com>
Subject: Re: [PATCH v2] parport_pc: Also enable driver for PCI systems
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>, 
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_124535_123194_298BD8E2 
X-CRM114-Status: GOOD (  17.76  )
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

On Mon, Feb 14, 2022 at 8:16 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> Nowadays PC-style parallel ports come in the form of PCI and PCIe option
> cards and there are some combined parallel/serial option cards as well
> that we handle in the parport subsystem.  There is nothing in particular
> that would prevent them from being used in any system equipped with PCI
> or PCIe connectivity, except that we do not permit the PARPORT_PC config
> option to be selected for platforms for which ARCH_MIGHT_HAVE_PC_PARPORT
> has not been set for.
>
> The only PCI platforms that actually can't make use of PC-style parallel
> port hardware are those newer PCIe systems that have no support for I/O
> cycles in the host bridge, required by such parallel ports.  Notably,
> this includes the s390 arch, which has port I/O accessors that cause
> compilation warnings (promoted to errors with `-Werror'), and there are
> other cases such as the POWER9 PHB4 device, though this one has variable
> port I/O accessors that depend on the particular system.  Also it is not
> clear whether the serial port side of devices enabled by PARPORT_SERIAL
> uses port I/O or MMIO.  Finally Super I/O solutions are always either
> ISA or platform devices.
>
> Make the PARPORT_PC option selectable also for PCI systems then, except
> for the s390 arch, however limit the availability of PARPORT_PC_SUPERIO
> to platforms that enable ARCH_MIGHT_HAVE_PC_PARPORT.  Update platforms
> accordingly for the required <asm/parport.h> header.
>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>

Acked-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Usually parport patches goes via Greg's tree. Adding Greg.

-- 
Regards
Sudip

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
