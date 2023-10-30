Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB09C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8wb8/f+ftQGOJ0UM+TrLrMn9WbwrVIwuwpyRVMwbQqM=; b=IPRTzytAosoHJy
	wXHlhb4HlgWwnUoVGkTueayxomRSznWKC6eaowClzc16Zkcb+ixBxk4EYXk+bGi562sVz1h6c3vxZ
	F7CQiCHEUJcLQ2NUXdgrsRlIigL0ZYBfJqs6Mf4j8y6OGG2xpAWuKqwc1LO2LTY3gPnnRn2Rm2lls
	1rtZYZhWXbhGsfer98yt8ujPLFaRhWevmcCbWbDpfC7oe/W9jDIxK4QN01dzYW0AxLz8nJ6Vimwnc
	zugAH0LWxGfx9NRI2OvsiawF1FoCGi2Vbu1T95LCv4I++Ulyy0DxMCxKbEJCE3yoYKqbnZUocE9VY
	nFfzQA8kcqpTv3XeCy0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTGL-003UBL-13;
	Mon, 30 Oct 2023 14:29:05 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxTGH-003U8y-0B;
	Mon, 30 Oct 2023 14:29:02 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698676134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HGYwynunSWpp7MY0OO3XJkBFIC76kaNXkC48AoOrAVc=;
	b=HG5UUtFdFYt0Bica1QYIiuNSEnQMtxRj9w+bpsYb3AfvdlKXY7TY7mG0I7mfBNJ26Vb3vH
	ER4H+Nk6g/JJW+Vn/Oi13KEL6TEQLaGby5uQ6JqENOPTd6j2Jmflk+MxodDPQmZZD26+91
	GrnifWswkG3mK1wi/Ks+vRIrhC6i7fLlRRulZxfm8mzbuCumlthapIZTd8RtggLw0yswll
	XBp1pDDuxSh27lbtEBhVahhSXksr9sda76qTJ88Esg4Bwcj203d453C5XBKRoiR5vEavF3
	yZOr9uPr8SsPoXo2eSnlKfAuctUz5lgEeGQpqPKDtf9P6WaWZW8KRQacCl/P3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698676134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HGYwynunSWpp7MY0OO3XJkBFIC76kaNXkC48AoOrAVc=;
	b=QaOIDXiFtF6jCGy9EsLrcRusyaTEH5L7V++quj7q1yHWGNZwm+B08xNgGMCk9CUXz1WMun
	3MLluabPLEJBK5DQ==
To: Sunil V L <sunilvl@ventanamicro.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [RFC PATCH v2 11/21] PCI: MSI: Add helper function to set
 system wide MSI support
In-Reply-To: <20231025202344.581132-12-sunilvl@ventanamicro.com>
References: <20231025202344.581132-1-sunilvl@ventanamicro.com>
 <20231025202344.581132-12-sunilvl@ventanamicro.com>
Date: Mon, 30 Oct 2023 15:28:53 +0100
Message-ID: <87a5s0yyje.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_072901_238134_3B565944 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Haibo Xu <haibo1.xu@intel.com>, Jiri Slaby <jirislaby@kernel.org>, "Rafael J
 . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Anup Patel <anup@brainfault.org>, Atish Kumar Patra <atishp@rivosinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Andrew Jones <ajones@ventanamicro.com>, Will Deacon <will@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 26 2023 at 01:53, Sunil V. L. wrote:
> Like pci_no_msi() used to disable MSI support, add a function to enable
> system wide MSI support.

Why?

int pci_msi_enable = 1;

So this function makes it more one or what am I missing here?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
