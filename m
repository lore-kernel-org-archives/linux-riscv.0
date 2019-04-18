Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 010BDC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 12:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5C762183E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 12:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W9zL/c/l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mhYX69b7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5C762183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zgpYUCf9W/ihhtexe1QKdS1F8wByuMJHvEitW96pXE=; b=W9zL/c/loP2EeQ
	tOEdailGxTaJ54xf908GjHGOj+lm2iimOVy6zg9f+oo9R5XQc2bYziGeT/b3vNrLY5wpzNyGTXnLe
	FwNwWvi7fGM7DGJnjnRFJuOnUAZ6GQoZwlRfQHJbJwJxEaaHm3LAJ2NBscDe4drouaUA0C2dfB1An
	XFWrv10U4YzQBeUc20LWt5FxM4qWWwXDhDgrKJt3bCSJIYuOftId8otgjJrE9/pxVlW7yQ3Yvw1vc
	djPeupYnO7tPxkHlEx3/EnzRPeqWUOYBQnvxSKa7QjlT5XI07bGQ9lfCs+ebH9tnLokT81IoMhnUl
	TcHy/rBCmwRWuyL8bmWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hH6OD-0001Sf-A9; Thu, 18 Apr 2019 12:43:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6ND-0000FA-AT; Thu, 18 Apr 2019 12:42:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FVaqqPnygq1+XAL2fV0XyKGzQwLVOq4vtfOZzXdI+DY=; b=mhYX69b7VKfQqcoKdU0MCUDY48
 wz7J5q7ip7jfFijvK+A2ZbRvvIroxJe506D3ZMQrb3CoLvm9xyPHHWa/5V6VVBpMznpOnG3TfkBul
 kz42uT6vbsEoSWFDuxWpELrhXI3brxwrB2rUkFxbS3l/dQ1clL/hYTVu4waRAQlFVAZ3+DkBqFnzm
 gqZN/EwyZolsR5K1343i6maSxSww63KZgfyNN3MAFzgqy9B9T+AHfzMgzbhHjdvpwUt4XzdVhma0k
 h/lt7McRzt4geBfeCA+wuguIFyeSB89NrhZTxPp/AqEhMrzdLLhaX7EmpBQ/MpRtZ2kCWwpclFQTQ
 +L6+vL3A==;
Received: from 177.132.233.55.dynamic.adsl.gvt.net.br ([177.132.233.55]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hH6N8-0000gI-FO; Thu, 18 Apr 2019 12:42:35 +0000
Date: Thu, 18 Apr 2019 09:42:23 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Avoiding merge conflicts while adding new docs - Was: Re: [PATCH
 00/57] Convert files to ReST
Message-ID: <20190418091526.00e074d1@coco.lan>
In-Reply-To: <cover.1555382110.git.mchehab+samsung@kernel.org>
References: <cover.1555382110.git.mchehab+samsung@kernel.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-fpga@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 xdp-newbies@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, x86@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-gpio@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-kbuild@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Jon,

Em Mon, 15 Apr 2019 23:55:25 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> I have a separate patch series with do the actual rename and
> adjustment of references. I opted to submit this first, as it
> sounds easier to merge this way, as each subsystem maintainer
> can apply the conversion directly on their trees (or at docs
> tree), avoiding merge conflects.

Based on the number of feedbacks we have about this, I'm
considering to submit a second version of my conversion patch
series that would be doing the rename together with each patch,
adding the rst files to an index file.

However, doing that would produce lots of warnings. We have
already lots of those at linux-next:

	checking consistency... 

	docs/Documentation/accelerators/ocxl.rst: WARNING: document isn't included in any toctree
	docs/Documentation/admin-guide/mm/numaperf.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/allocators.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/attributes.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/bigalloc.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/bitmaps.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/blockgroup.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/blocks.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/checksums.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/directory.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/eainode.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/group_descr.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/ifork.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/inlinedata.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/inodes.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/journal.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/mmp.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/special_inodes.rst: WARNING: document isn't included in any toctree
	docs/Documentation/filesystems/ext4/super.rst: WARNING: document isn't included in any toctree
	docs/Documentation/fmc/index.rst: WARNING: document isn't included in any toctree
	docs/Documentation/gpu/msm-crash-dump.rst: WARNING: document isn't included in any toctree
	docs/Documentation/interconnect/interconnect.rst: WARNING: document isn't included in any toctree
	docs/Documentation/laptops/lg-laptop.rst: WARNING: document isn't included in any toctree
	docs/Documentation/virtual/kvm/amd-memory-encryption.rst: WARNING: document isn't included in any toctree
	docs/Documentation/virtual/kvm/vcpu-requests.rst: WARNING: document isn't included in any toctree

After thinking a little bit and doing some tests, I think a good solution
would be to add ":orphan:" markup to the new .rst files that were not
added yet into the main body (e. g. something like the enclosed example).

That will make Sphinx suppress the:
	"WARNING: document isn't included in any toctree"
warning for the new files, while they're not included at the main indexes.

This way, maintainers can do all the hard work of doing/applying the ReST
file conversion/addition patch series on their own trees, and, once
everything gets merged, submit a patch against the latest docs-next
tree, removing the :orphan: tag and add them to the common index.rst
files.

That should largely avoid merging conflicts.

For example, assuming that someone converts the stuff at
Documentation/accounting and rename the text files there to
RST (I'm actually doing that), he could add the enclosed change on
the top of its index file:

	diff --git a/Documentation/accounting/index.rst b/Documentation/accounting/index.rst
	index e7dda5afa73f..e1f6284b5ff3 100644
	--- a/Documentation/accounting/index.rst
	+++ b/Documentation/accounting/index.rst
	@@ -1,3 +1,5 @@
	+:orphan:
	+
	 ==========
	 Accounting
	 ==========

With would make Sphinx to ignore the subdir index file while
reporting errors. It will still build the documentation, allowing
the developer to test the changes.

One of the advantages is that checking the orphaned docs is as
easy as running:

	$ git grep -l ":orphan:" Documentation/
	...
	Documentation/accounting/index.rst
	...

Making easy for people to check the orphaned files and send a fixup
patch if something got orphaned after the merge window and send a
fixes patches to be applied upstream.

What do you think?

Regards,
Mauro

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
