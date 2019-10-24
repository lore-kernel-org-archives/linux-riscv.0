Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00D7CA9EBB
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 16:51:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95CBB21925
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 16:51:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8Q7cdee";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jsx5MQBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95CBB21925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FClAF+qHoXeix+0aYAhKiKXRd+BPofwI5ofRDldA7SU=; b=P8Q7cdeeeYcPZd
	VX+CuXRXE3XANXHtpM/2fxVeAB+f3m9UV4FsJiOiF7NE+2MgxM9QJJu7IOCBVd8HAMK2BBOLGy0G7
	o3rSh4q1uNq5ksV5zIGqjRxb2nURETvqWon3b3Inn1hMo6BgPRWhjDEzro0wGcJHPfLKtIZD6PxCr
	ziZzQYn7QPLgCKf2E24VQZXKZSQtFf8CqO02ix/k5DlhwBCvw40T0DHA4u612Xg1Bp38hFVOOfkLt
	ZNADg3xaVNUI4YLG3Oehug/w/H1UtFxHRW9JsLgDC1KQ715TVRTV3I8tN9U1uazhleDGq+UDVcD/D
	uId4xCDNlGsQQ+p7SkVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNgKi-00064V-IK; Thu, 24 Oct 2019 16:51:32 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNgKg-000640-3l
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 16:51:31 +0000
Received: by mail-il1-x143.google.com with SMTP id o16so14957226ilq.9
 for <linux-riscv@lists.infradead.org>; Thu, 24 Oct 2019 09:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=sFSyUVxBP37pgjvJlZsU/w0N+fGBkJlyXhysmzgiRpo=;
 b=jsx5MQBLTE/ixg4HSEH80bow8kXSPu0/ZvHVz75WFDvo4+cfMriHzGKD/W1YN7Ogvn
 5bgfLGRs+45/922cfbl6SzF51OSbFqPFB4aXc1djIT0ImEXcLJ6yySbeCdyVyGeM6Qc6
 XxYPN4NgHjeOShoryC+hXNoO064Nzqt9RZ9bVrOShHsCQSgnbrOC1EuMa4E5GoMF97pi
 C9ueRcm8KVwNy2L98a0QrueeGLLuXH336k7v/AWTdrPSK7lwOKByHvSvXuTqMpmCWalJ
 3AF93MvmlKQqomUEjciFRjTPLyLRj4nyoMlXJTY1VMjj/Y6usmwkx4C4AfkM3hYApVue
 YRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=sFSyUVxBP37pgjvJlZsU/w0N+fGBkJlyXhysmzgiRpo=;
 b=pzoeB4C4owBsflGkunrP3kQjvQ0DUTSfv6XyvRx+VPbgQGxXfQmkhJILuefRD3Wo6F
 Q7seAQ3EM9Gs8HXdFXOK27SJhEqjFPSJyDOTZ1GljEghC0Pdpqe+0y5gT/ahMTZ4otqW
 C/rfzNyU9DTqqAIfaqDbAOS/FhSoCNK4QlTnEePctr/qBaLUjwmvunhcpil19GPa6JvI
 I3C+i4svi8c4TfYIrAsAf6focOJT6KHbJmVtC7hSvddED4oJTDsgqxngsvXR4zQ1f6JD
 iCPIyXjPFHNKTN5gCRq7ACt9Z71nLVUlFtAJpD9lgK41k7IfWS5Ddpi1BWcxxFpYvW+v
 Thkg==
X-Gm-Message-State: APjAAAUa35NDMJLS05BQ9HxpvOI23eXRPXcH7mz79QE95e6VfzD7eX/o
 09F3+GpA5J/sITom0bNJsSDHdg==
X-Google-Smtp-Source: APXvYqwlgWwLvHpNCxZVDp1ya5Nk4eSqkY3nvyjRJZW6GGBcNGxrzX/5p972P71H9/AqqqDSnK2B8Q==
X-Received: by 2002:a92:9f1c:: with SMTP id u28mr17517108ili.97.1571935888436; 
 Thu, 24 Oct 2019 09:51:28 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id h13sm8830059ili.6.2019.10.24.09.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:51:27 -0700 (PDT)
Date: Thu, 24 Oct 2019 09:51:25 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH] RISC-V: Add PCIe I/O BAR memory mapping
In-Reply-To: <c4817ec1-4e50-5646-68f0-caeb0ab6f0bf@deltatee.com>
Message-ID: <alpine.DEB.2.21.9999.1910240937350.20010@viisi.sifive.com>
References: <1571908438-4802-1-git-send-email-yash.shah@sifive.com>
 <c4817ec1-4e50-5646-68f0-caeb0ab6f0bf@deltatee.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_095130_182954_0589515E 
X-CRM114-Status: GOOD (  10.41  )
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
Cc: "sorear2@gmail.com" <sorear2@gmail.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "alex@ghiti.fr" <alex@ghiti.fr>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "Palmer Dabbelt \( Sifive\)" <palmer@g.sifive.com>,
 "Anup.Patel@wdc.com" <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Paul Walmsley \( Sifive\)" <paul.walmsley@g.sifive.com>,
 "rppt@linux.ibm.com" <rppt@linux.ibm.com>,
 Sachin Ghadi <sachin.ghadi@sifive.com>, Yash Shah <yash.shah@sifive.com>,
 Greentime Hu <greentime.hu@g.sifive.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 24 Oct 2019, Logan Gunthorpe wrote:

> On 2019-10-24 3:14 a.m., Yash Shah wrote:
> > For I/O BARs to work correctly on RISC-V Linux, we need to establish a
> > reserved memory region for them, so that drivers that wish to use I/O BARs
> > can issue reads and writes against a memory region that is mapped to the
> > host PCIe controller's I/O BAR MMIO mapping.
> 
> I don't think other arches do this. 

$ git grep 'define PCI_IOBASE' arch/ 
arch/arm/include/asm/io.h:#define PCI_IOBASE            ((void __iomem *)PCI_IO_VIRT_BASE)
arch/arm64/include/asm/io.h:#define PCI_IOBASE          ((void __iomem *)PCI_IO_START)
arch/m68k/include/asm/io_no.h:#define PCI_IOBASE        ((void __iomem *) PCI_IO_PA)
arch/microblaze/include/asm/io.h:#define PCI_IOBASE     ((void __iomem *)_IO_BASE)
arch/unicore32/include/asm/io.h:#define PCI_IOBASE      PKUNITY_PCILIO_BASE
arch/xtensa/include/asm/io.h:#define PCI_IOBASE         ((void __iomem *)XCHAL_KIO_BYPASS_VADDR)
$

This is for the old x86-style, non-memory mapped I/O address space the 
legacy PCI stuff that one would use in{b,w,l}()/out{b,w,l}() for.

Yash, you might consider updating your patch description to note that this 
is for "legacy I/O BARs (i.e., non-MMIO BARs)" or something similar.  That 
might make things clearer.

> ioremap() typically just uses virtual address space in the VMALLOC 
> region, PCI doesn't need it's own range. As far as I know the ioremap() 
> implementation in riscv already does this.
> 
> In any case, 16MB for PCI bar space seems woefully inadequate.

The modern MMIO PCI resources wind up in jost controller apertures, which 
as you note, are usually much larger.  They don't go in this legacy space.

Regarding sizing - I haven't seen any PCIe cards with more than 64KiB of 
legacy I/O resources.  (16MiB / 64KiB) = 256, so 16MiB sounds reasonable 
from that point of view?  ARM64 is using that.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
