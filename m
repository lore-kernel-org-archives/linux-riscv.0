Return-Path: <SRS0=vm5i=MN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81427C07E9B
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 05:58:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B95B360725
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jul 2021 05:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95B360725
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYfDSkBYBfHXIf7iOPQhLvQBrBhRdhZXFeQ11mZ3OzI=; b=CGI0xrKMDv9lA/
	cU8/Evcxujqj+2T6SGc0Xzxa2oJzwlTr6SKAIeVLurGaxsMznFtfiNmR/lr0EdskIgjS2OD/036re
	qJ+BGp3Q3Y6CF3wjtBBwsEhvwWX5kGOKKQPFqtUvpjE4Q2+w2mXurPmvHmtDH1KGOeTGEoJkV+vgr
	pCW4RqKeYJHzCVSrdUiMu72y1jJLPDJaTyjEWUNkH3OSB0gAPwW+z0kpe3OfguQFT3VomfH2o1qTP
	uKoO+9yxXu1heAI+NnIr2atleF4zjqCrGjJ0gyVoqQ1nF/2bS3Fea84zadnG0Y1fu7N41PDEgplmY
	ELUAvtiSGnWATi/MjRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m65F3-00EXgP-Mb; Wed, 21 Jul 2021 05:58:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m65F2-00EXgC-92
 for linux-riscv@bombadil.infradead.org; Wed, 21 Jul 2021 05:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=VjxcWlaf6z0Lp4+alJYi2EBaYHfLu4QPezFerPqHPUU=; b=L0uDkpXz+IDMULUL75c929bkUv
 meFKGb8M7Wf0LHsf66mktNzJ5FocDZywLQXFXBZOMJo9VYoZ8Emq2mwiSqlboutnWEQk7OctqytT1
 W+rz7Helu5Ynob2CqWJZBB64lhO+LLnZZsS6sEY/mvnFcOGH5icTyPVNl6HjOu7Ty5eoBugcGgsiR
 gTz1kS5JFu4FodM+Y+LwfXvR8lxXS85uK4m4bBEdBHXIdDoACFXcV4IL3y9UbhTU5QPvwxTHyi2eQ
 MDSqIhwmBO1Zml8msAuz1lSq6tRW6SYD+dquP4++xj89Mos71CVGti/ZJn4JfKvqlyIW/qNfP8wZ4
 2HTwbhUQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1m65Es-008qtW-G2; Wed, 21 Jul 2021 05:57:51 +0000
Date: Wed, 21 Jul 2021 06:57:50 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Chen <vincent.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: Re: [PATCH v2] riscv: Kconfig: do not select PCI_MSI if CONIFG_PCI
 is enabled
Message-ID: <YPe3XuYfxBkbDzHf@infradead.org>
References: <1626838752-7013-1-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1626838752-7013-1-git-send-email-vincent.chen@sifive.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

On Wed, Jul 21, 2021 at 11:39:12AM +0800, Vincent Chen wrote:
> The CONFIG_PCI_MSI is used to allow device drivers to enable MSI. The MSI
> enables a device to generate an interrupt using an inbound Memory Write
> on its PCI bus instead of asserting a device IRQ pin. The whole mechanism
> needs support from the PCI controller or generic interrupt controller and
> the corresponding software driver.
> 
> The RISC-V Kconfig file actively selects the PCI_MSI  if users enable
> CONFIG_PCI. However, the RISC-V specification does not require every RISC-V
> platform shall have MSI support. In other words, Kconfig enables CONFIG_PCI
> to allow PCI devices to use MSI, but due to lack of MSI support, the kernel
> may not have any function to deal with the MSI from PCI devices. When this
> case happens, it leads to the following warning message displayed in
> booting a v5.10~v5.12 kernel.

So make sure the runtime detection works fine.  An x86 kernel with
CONFIG_PCI_MSI also works on non-MSI systems.

NAK to this patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
