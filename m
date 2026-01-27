Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526A5D34097
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 15:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbZFJ2a+JvBXUOEjctYzcpcjz3pvnC0wu3MkLLbCIM0=; b=bSN5yFOA8h/X9b
	qofKNq539FyPFfOvpRhGQLChh5bqmA/Tpv6wuLu79lOPlqUTti85YfZ7w4iC+b0vdp6Q464oY2rUg
	zVFw9i+ebEWYopGjR80uaSJhSXrdBrUc3J4M4m5U2cYYoftjIz5h09VYCr689oprIO2TNs8WJl9qi
	Fnpw0jlEANkfgUT2gLGHe6UdvKt44h3cElCuLwZ3eFF8PL2JHR4nlL4zliJoYxeQDrXix1kGJPqUR
	x/El8BloB61WzRIJGrHuSzb3diz38h2fOdOYgFuk6Z46nMdc60jHjopvIythWZYgYGAyYCv1+GY4O
	xirKQWhaQb4TSlexYnSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklSj-0000000EadK-01bF;
	Tue, 27 Jan 2026 15:58:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vklSg-0000000EadB-3mK4
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 15:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE2E460143;
	Tue, 27 Jan 2026 15:58:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16200C116C6;
	Tue, 27 Jan 2026 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529517;
	bh=nVstBk4Y1lGp5Jd2un5oyBfrauMV07MlNCfy0oT7Nrs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dn5ItrDGAoRiK2rLspgWlpzL83EAEKcQ/UxvwLitxSZABIZ981Wp6WxiCFJQ/9kA8
	 Je2cv4hBalr56LXTpGyj0WX0sHx6VvbaeVyLOAUasNlOYxkeNPevKiLMYzpgYdZtWs
	 36WUNrRnMptzmkvOVjz+n4qwa1EI2o6HN5uXNu1liF2zucMtb6StxOb8vi6QkQRrM5
	 wYZgEfkfOCAQtMnsAjhHD3aWE0UpGOIyc3J7TwqgjrokdrqybDzIkP+DnQQk6kbWUh
	 nqRiSI4FhO/dn1Cou2jvphzZjdDrDriMt6iSFefg4O9qooXSQvGZQei0jULBDeRgmQ
	 AiHRHzLtEWh1A==
From: Thomas Gleixner <tglx@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Anup Patel <anup.patel@oss.qualcomm.com>,
 Samuel Holland <samuel.holland@sifive.com>, Charles Mirabile
 <cmirabil@redhat.com>, Lucas Zampieri <lzampier@redhat.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Mason Huo
 <mason.huo@starfivetech.com>, Zhang Xincheng
 <zhangxincheng@ultrarisc.com>, Charlie Jenkins <charlie@rivosinc.com>,
 Marc Zyngier <maz@kernel.org>, Sia Jee Heng
 <jeeheng.sia@starfivetech.com>, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2] irqchip/sifive-plic: Fix insufficient irq_groups
 allocation
In-Reply-To: <tencent_A697393AE256C4288768342AF245099A690A@qq.com>
References: <tencent_A697393AE256C4288768342AF245099A690A@qq.com>
Date: Tue, 27 Jan 2026 16:58:33 +0100
Message-ID: <87bjifavyu.ffs@tglx>
MIME-Version: 1.0
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

On Wed, Jan 21 2026 at 13:45, Yangyu Chen wrote:
> Since the first irq source is 1 instead of 0, when the number of
> irqs is multiple of 32, the last irq group will be ignored during
> allocation, saving, and restoring. This lead to memory corruption
> when accessing enable_save beyond allocated memory after commit
> 14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state")
> which will access enable_save for all sources during plic_probe.
> Thus, we should allocate irq_groups based on (nr_irqs + 1) instead of
> nr_irqs to avoid this issue.
>
> This is an long standing bug since Linux v6.4 but since the last irq
> source is rarely used, it may not be triggered in practice until commit
> 14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state").

I'm absolutely not convinced that this is the right fix. The handling of
nr_irqs in this driver is completely inconsistent:

1)

   static int plic_irq_suspend(void *data)
	/* irq ID 0 is reserved */
	for (unsigned int i = 1; i < priv->nr_irqs; i++) {

2)
   static void plic_irq_resume(void *data)
	/* irq ID 0 is reserved */
	for (unsigned int i = 1; i < priv->nr_irqs; i++) {
        ...
	for (i = 0; i < DIV_ROUND_UP(priv->nr_irqs, 32); i++) {

3)

   static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iomem *claim)
	int nr_irq_groups = DIV_ROUND_UP(handler->priv->nr_irqs, 32);

        for (i = 0; i < nr_irq_groups; i++) {
4)

   static int plic_probe(struct fwnode_handle *fwnode)
  
	priv->prio_save = bitmap_zalloc(nr_irqs, GFP_KERNEL);
        ...
		for (int j = 0; j <= nr_irqs / 32; j++)
			writel(0, enable_base + j);
        ...                        
                handler->enable_save = kcalloc(DIV_ROUND_UP(nr_irqs, 32),...
	...
	for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
        ...
	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs + 1,

So can the SIFIVE people please clarify once and forever what's the
actual meaning of nr_irqs:

   A) The actual number of hardware interrupts available for drivers
      starting from hwirq=1

   B) The total number of hardware interrupts, where hwirq=0 is reserved
      and therefore the number of interrupts available to drivers is
      nr_irqs - 1.

That needs to be clarified first and then subsequently every single
instance which deals with nr_irqs has to be updated accordingly.

A random fix which cures the symptom of an out of bounds memory access
is not helpful at all to cure the underlying root cause of
inconsistency.

Thanks,

        tglx



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
