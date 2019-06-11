Return-Path: <SRS0=CXC0=UK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6502C4321A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 07:38:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D562212F5
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 11 Jun 2019 07:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pReP+JcI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D562212F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQrk/E26r3uXDS2jr9NZjamorVnHgyb+xFTRdlOJ2U4=; b=pReP+JcI5kvjnl
	xQbf7qgfJ/38xuztZPzr7g6DIL54N6nKTXVjBmkm60Zvbcod6mwC7jFEFZZxfwipgTueE57lbPWOt
	wIqbog7Ka90nVQLehfum6GdE1Jd1vUDbOFMISVMzOCHm7JqXS1F8Ikb3XeKIY9+3qtgHQR3nx4i3s
	tYZfmXLB231WG3/LUZK1gCc97IVzE13AQGFiMSag5pi36ZlBciMXCRqnFgNCL2HhiHRVE6qXmdUlD
	7LspnnzIMAhCPE5Lnlbgmdl8IJlqji8cQ3gcxbkXLUU6HPeuqHf896JPcOHZzF+jhyUJVFTZTDKtq
	A1sraEC/SGnZKjr03UcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1habMo-0006ng-4S; Tue, 11 Jun 2019 07:38:50 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1habMU-0006bN-PT; Tue, 11 Jun 2019 07:38:35 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 829D868B02; Tue, 11 Jun 2019 09:38:02 +0200 (CEST)
Date: Tue, 11 Jun 2019 09:38:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg Ungerer <gerg@linux-m68k.org>
Subject: Re: binfmt_flat cleanups and RISC-V support
Message-ID: <20190611073802.GB21522@lst.de>
References: <20190610212015.9157-1-hch@lst.de>
 <6e5fb7db-1d6f-7d49-553c-edc18f14f641@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e5fb7db-1d6f-7d49-553c-edc18f14f641@linux-m68k.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_003834_405875_1B44D6A5 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Michal Simek <monstr@monstr.eu>, linux-c6x-dev@linux-c6x.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 11, 2019 at 04:51:02PM +1000, Greg Ungerer wrote:
> Hi Christoph,
>
> On 11/6/19 7:20 am, Christoph Hellwig wrote:
>> below is a larger stash of cleanups for the binfmt_misc code,
>> preparing for the last patch that now trivially adds RISC-V
>> support, which will be used for the RISC-V nommu series I am
>> about to post.
>
> Whole series looks pretty good. Just the one comment I made.
>
> I normally take these through the m68knommu git tree,
> if you have no problem with that I'll push it in there.
> It will hit linux-next from there.

Yes, that's fine.  We'll need it to bring up riscv nommu support,
but there is no actual dependency on the patches for it to compile,
just for it to actually be useful.

Btw, it seems like the uclinux-dev list is dead, is there a replacement
for it?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
