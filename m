Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CD1C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 18:45:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 697092190B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 18:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="atbOarr3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 697092190B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8paw1/lOyFzyIXXEb0Cxrp6Rfi7YQcAX4ZfLj0VWN+E=; b=atbOarr3wu/gs2
	xiNTiUO48N50bEm3BiEAZE45E/UOWLuqqUB7PDfdbYIpXY5J/kRHrB6L1UPzjpJ+8NqVkgYnwCNFU
	l8oAWt4wmgTHJSkWP6qAm7DWSY0icXZLzS8PEtlpK308qOGt7+KbWNGI2hM5TWfOa1a43a2jMH9sD
	oRv77cOXRI+U0349VHBW1LDlbyBIrbFRGOlCdZvzJMbDCcppCdfIpi0oHwObZ2nC4NrBAPoEYZMcM
	oht32gGsyUqsEXAo8HkZS3Fq5eTor6O2aMplB4U27TmkCfxQzIE4a5wGbtPlLRX1eUaik/E5UZSew
	cJn+Ay1NmhRR1qkXch8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtd3L-0004jI-GK; Tue, 12 Feb 2019 18:45:07 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gtd3J-0004X1-8H; Tue, 12 Feb 2019 18:45:05 +0000
Date: Tue, 12 Feb 2019 10:45:05 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 6/6] RISC-V: Implement keepinitrd kernel parameter
Message-ID: <20190212184505.GA10984@infradead.org>
References: <20190119132650.9978-1-anup.patel@wdc.com>
 <20190119132650.9978-7-anup.patel@wdc.com>
 <20190212070807.GD26747@infradead.org>
 <CAAhSdy1NED22YyYrAJDqPkDqT1c2ms2QC9OjHP0qLwHT+o2zvg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1NED22YyYrAJDqPkDqT1c2ms2QC9OjHP0qLwHT+o2zvg@mail.gmail.com>
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 03:53:21PM +0530, Anup Patel wrote:
> If it is initramfs (i.e. CPIO image) then contents of CPIO archive
> are extracted to create a ramfs instance.
> 
> If it is initrd (i.e. some filesystem image) then RAM block device
> is created in-place at initrd location. (Please correct me if I am
> wrong about initrd here).

No.  If it is an initrd image we still copy it into the rootfs first,
and then load it into a ram disk.  Take a look at
init/initramfs.c:populate_rootfs() and
init/do_mounts_initrd.c:initrd_load().

> So in case of initrd we might not want to free-up the RAM but
> we can certainly free-up in case of initramfs.

No, in either case we do not need the original initramfs/initrd
memory.  I suspect arm has this as a workaround for some weird
legacy boot issue, but I can't see any reason why we would not want
to free the memory on riscv.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
