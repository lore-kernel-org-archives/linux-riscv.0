Return-Path: <SRS0=zF8f=YB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547A1C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 15:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2731621721
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2019 15:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PG7eLp/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2731621721
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k3dgGoEAdx/adAVrMUMvxlwuw2Co7PiwQBAbC7iZj48=; b=PG7eLp/Ej37Xn2
	N6sJaEI9UDIotLRactFOYTjiZMDtAy+BS6ORSvX5YeBDr2MjCd2jlQ/4Lc6prVA2tqAlXIVbBBoaf
	8pSLWCcT32nYbt7PmuASmk1VQJJHb453PqOWeGUOy7mvBb5IAdh87ZSH9OiyyYkA69Zejyc5CXMJp
	0tYyneTSNvHN1qMpuJUfvP1iJ3DmZz1Dre9JN+LC9t2SHOjSLmGqmMEZbHBTLqaTsW51paB6LYMb5
	9pQ+YoWVP9WMmuzgL/sJOaItqypAScNX8sKpbqqcbbrYP3TxWeEh+FE/n6hMVi1DWpgfTGYokBYgT
	xuiIsYueRNVITGwv2BXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHraA-0005Pw-Jg; Tue, 08 Oct 2019 15:39:26 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red
 Hat Linux)) id 1iHra8-0005PO-Co; Tue, 08 Oct 2019 15:39:24 +0000
Date: Tue, 8 Oct 2019 08:39:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v2 3/3] RISC-V: Move SBI related macros under uapi.
Message-ID: <20191008153924.GA20318@infradead.org>
References: <20190927000915.31781-1-atish.patra@wdc.com>
 <20190927000915.31781-4-atish.patra@wdc.com>
 <20190927222107.GC4700@infradead.org>
 <CAAhSdy2kAze4bt17kVA3tB4H6qXPMSUroi5ybPcTvFB_=p48oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2kAze4bt17kVA3tB4H6qXPMSUroi5ybPcTvFB_=p48oQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
 Atish Patra <atish.patra@wdc.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 03, 2019 at 11:00:05AM +0530, Anup Patel wrote:
> These defines are indeed part of KVM userspace API because we will
> be forwarding SBI calls not handled by KVM RISC-V kernel module to
> KVM userspace (QEMU/KVMTOOL). The forwarded SBI call details
> are passed to userspace via "struct kvm_run" of KVM_RUN ioctl.

At best your are passing through a hardware interface.  We don't expose
e.g. the nvme headers to userspace either.  We keep the headers clean
enough that userspace can copy them (and a few projects do), but they
really are not a kernel interface in any classic way.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
