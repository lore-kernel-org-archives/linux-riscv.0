Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8111C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 08:32:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 762E921917
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 08:32:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U120+ws9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 762E921917
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZoB7eN9Y/ETwJ9q6G2lXr4CpN4Yg10Jgz2y5rC+GAc=; b=U120+ws9/pdGR6
	OkfcMpitb0GSCDi+f7TgktTfy4xDh9ry2+BVojEVimR1RxaccOxbSgsb9/4yGviC+PgrUhn0Xg2bM
	82QiDfNnEL59yMMk0LfGdedKgFKTVvMbi/2bo76S+h4GtpV/HXj1uQf93Wezx9D4MAEx7hUboexuo
	+E3Bs05xd/b83ZJ4LCv95CoLlNXKElXg2484kMp6bzKurnyUzF7PEOuczI98gobuqYn3AozbXcQam
	cjiIj8M7K73zOVuuxOivanyIUwq+qLMJt2vGwBCTZ6VrIJ+Ece/M9JSy9ZJX7t1u0pB+sGcJ7hIuZ
	V6E8M2EFEgNnqlc2i8eQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gs1Zv-0001Qe-Op; Fri, 08 Feb 2019 08:32:07 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gs1Zu-0001QE-Cy; Fri, 08 Feb 2019 08:32:06 +0000
Date: Fri, 8 Feb 2019 00:32:06 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
Message-ID: <20190208083206.GA4699@infradead.org>
References: <4b647c0d-86de-fed3-aca6-d248b9aff762@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b647c0d-86de-fed3-aca6-d248b9aff762@wdc.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Andreas Schwab <schwab@suse.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 07, 2019 at 10:08:14PM -0800, Atish Patra wrote:
> If you are building a larger kernel image, it may not boot using BBL after
> 5.0-rc2. It works fine with OpenSBI though.
> 
> Here is the reasoning in case anybody else is facing the same issue.
> 
> The following patch was added 5.0-rc2 which helps reduce the flat image size
> for Linux kernel.
> 
> "22e6a2e1 RISC-V: Make BSS section as the last section in vmlinux.lds.S"
> 
> As the BSS section is moved to the end of the ELF, flat image will not
> include it. As BBL copies the DTB at the next 2MB page boundary, BSS
> section may overlap with DTB address. Kernel clears BSS section during early
> boot which may clear the DTB as well leading to a boot failure.

Breaking everyones (qemu) setups that we only got working two release
ago is really annoying.  I'd suggest reverting the commit for now, or
at least making it an optional config option.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
