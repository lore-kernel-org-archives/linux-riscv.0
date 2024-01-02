Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0ADC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 06:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:To:From:Subject:Date:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=nG3p9Bzm3a6Allp/VhMd/Kjg0mLtO7amsS9G5oF5JE4=; b=C/N
	trw5HNLNXXwnfEtldX/3QbdF+zyy08IQGRubsYfEihgRDk9gSGqV7Cs6x7M295zWqkWIS9oktqcAf
	vNSEfoebDPGE/UvlnEhm33rEeFX11R/R56eQF/B8FWRFaj0V+yG3syTnOU6P6cf5EuV9YwAM4XL0L
	AD+I+SMPVUo1GpjMxf7/QxpfBAtzkSZu6xrJXClLmZf4IQhW/i1lKyuyObyJC8ASsebt2zrMwRigQ
	x2kYxCmQPVB8YsHnOcl1SgTyAkmM6zdHzBIovsaTlPGqrcwiFkhGGUuWtlPpnZELrA8mjTXYzAY9n
	+msAnZxm0iq+1SSJfAJ7BS7Bi5JOvLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXt2-0079Ze-2d;
	Tue, 02 Jan 2024 06:04:24 +0000
Received: from forward102c.mail.yandex.net ([178.154.239.213])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKXsy-0079ZJ-2T
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 06:04:23 +0000
Received: from mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:8816:0:640:9b05:0])
	by forward102c.mail.yandex.net (Yandex) with ESMTP id 6639E6090C
	for <linux-riscv@lists.infradead.org>; Tue,  2 Jan 2024 09:04:07 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 54Tv1ATf4Gk0-YrLdxLXH;
	Tue, 02 Jan 2024 09:04:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dfyz.info; s=mail;
	t=1704175446; bh=cJ891uzD1LCkCNmk4coYEB6rgxD0cpquxHwe4tKfWVk=;
	h=Message-Id:Subject:To:Date:From;
	b=TT2eGD3i5wKJkMOd3RJfNFtYhUtT5AoV9aG7ppWTTjipvCzxa/m1OK7Y8P3yFqowL
	 PapfQDX57mZq+rEyqyBEZby8WWXduA+3/E7BasEnGVcOv1o6gTPHV/0/wpLUlY5sJM
	 3o6pklSuAY8ckukb82FBL2isr6h40G0UzZ+Po5yE=
Authentication-Results: mail-nwsmtp-smtp-production-main-36.iva.yp-c.yandex.net; dkim=pass header.i=@dfyz.info
Mime-Version: 1.0
Date: Tue, 02 Jan 2024 07:04:05 +0100
Subject: An off-by-one error in auxv setup for RISC-V
From: "Ivan Komarov" <Ivan.Komarov@dfyz.info>
To: <linux-riscv@lists.infradead.org>
Message-Id: <CY3Z02NYV1C4.11BLB9PLVW9G1@fedora>
X-Mailer: aerc 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_220420_988600_8B8B9C3B 
X-CRM114-Status: UNSURE (   6.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

Currently, the maximum size of the auxiliary vector is bounded (in
include/linux/mm_types.h) by the sum of the maximum size of
architecture-independent entries (AT_VECTOR_SIZE_BASE) and
architecture-specific ones (AT_VECTOR_SIZE_ARCH).

Commit e92f469b0771 added a new RISC-V-specific auxv entry to indicate
the signal frame size to userspace, but unfortunately didn't bump
AT_VECTOR_SIZE_ARCH, which can result in writing past the end of
mm->saved_auxv in create_elf_tables() from fs/binfmt_elf.c.

In practice, this is mostly harmless:
  * not all architecture-independent entires are actually used on RISC-V,
    so we still have plenty of space left in mm->saved_auxv even with
    the off-by-one
  * even if the overflow happened, kernels compiled with
    CONFIG_HARDENED_USERCOPY would detect it when copying auxv entries
    to userspace

Still, it might be good to fix this. My friend had already tried to send a
patch for this
(see https://lore.kernel.org/all/73883406.20231215232720@torrio.net/),
which had some process issues. This time, we're trying to do things properly,
including a Closes: tag that references a bug report (this e-mail).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
