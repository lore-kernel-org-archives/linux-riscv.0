Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9C0C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 15:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DB9A20878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 15:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eAjstorw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DB9A20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZ4rACkyIL/IZ1IA5mXTYzJIhyMHAl/jr+02oKQQBII=; b=eAjstorwlyGQPJ
	imITPiIeIW8WEorRM0qUrERnj1VsjJ0H9Er5w3KwS4vcnd/zJdarpmeqQvk9CLAjrD0tt6y2XAIOE
	ZM47rGWTa5nv8kLyHSGdUunFDoUo2qNJGE6m0BmgAH1X056Jv0ZMSRYtDxquZ+++682g1rGTHbQLu
	Yo0iv7qBfpIIE26ivE/D1Jyz+7CnolcdJzBzG9Y84BW0oiZSTu7gB+NEZlLIweZRgohes9rztAgUo
	oC4Uo+zanyUtcwGy29OtFXprM+7UAKoqH8XIKm3n+Mo4kq9beGzWhDxJ0ojAneccGYeoG/JFDryeL
	zEAKB0qIa7RK9g4KPz4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJJOz-0006Ic-Lv; Wed, 24 Apr 2019 15:01:37 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJJOy-0006Ho-3x; Wed, 24 Apr 2019 15:01:36 +0000
Date: Wed, 24 Apr 2019 08:01:35 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v3 2/3] RISC-V: Add interrupt related SCAUSE defines in
 asm/csr.h
Message-ID: <20190424150135.GA19543@infradead.org>
References: <20190415093648.7525-1-anup.patel@wdc.com>
 <20190415093648.7525-3-anup.patel@wdc.com>
 <20190424062947.GB10400@infradead.org>
 <CAAhSdy1Xc9AjPKY0RzLL_qsBs6wax23fi2BTVtMhuS0mAoKZmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy1Xc9AjPKY0RzLL_qsBs6wax23fi2BTVtMhuS0mAoKZmQ@mail.gmail.com>
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

On Wed, Apr 24, 2019 at 12:15:45PM +0530, Anup Patel wrote:
> We need these defines for programming HIDELEG CSR in KVM kernel module
> so it will be used at multiple places.
> 
> >
> > http://git.infradead.org/users/hch/misc.git/commitdiff/1221f5c32345ebe7ea2c1cd6e8a01ad4b422aaba
> 
> You can certainly use these defines in your nommu commit by using
> "#ifdef CONFIG_M_MODE" in switch case of do_IRQ().

Or just keep them in the current format even when you move them, as
that allows everything to work with a single ifdef at their point
of declaration..

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
