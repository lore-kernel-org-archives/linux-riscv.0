Return-Path: <SRS0=v9z2=S4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8897C43218
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 06:21:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0959206BA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2019 06:21:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usbf+PnT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0959206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALs/QWX/mOKiTvQQft0kGC//exEbdgJBfw+qQ+flbes=; b=usbf+PnTWNRgKW
	o5QBVYT6e8COTqIv14HWXgXXbPMF7EdxTeGbBTXyHyxAoUKz0h84MWxSGhlfLfxMVFBq7WsbKoQUI
	eRknMOAe3IN1WW3blpiGvmyEASOrwNZsUlxWBFUv16LMaFrBLa8nGljymtr+966SqTFBUeOZm7eDF
	MNedpjwe+WzzY4sgKspFn8IkPFdIxQbY7rCdQmncsUjlOzaTk3sMiHvxkZTce5BU+WyQC3+g0wig7
	IZNGUa3b3oV5wJgSBkiQSoH+OcZbmeMNP6E8b6kOC64AU9NyPZwzc5X+gEKgqv8SQZV9dD/EOOUHF
	72/2sXhBdGaXY1esNucg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJuEp-0000D1-2m; Fri, 26 Apr 2019 06:21:35 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hJuEn-0000CS-8B; Fri, 26 Apr 2019 06:21:33 +0000
Date: Thu, 25 Apr 2019 23:21:33 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH] tty: Don't force RISCV SBI console as preferred console
Message-ID: <20190426062133.GA28529@infradead.org>
References: <20190425133435.56065-1-anup.patel@wdc.com>
 <9a8be7ef-e62e-2a93-9170-e3dc70dfb25f@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a8be7ef-e62e-2a93-9170-e3dc70dfb25f@wdc.com>
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
Cc: Palmer Dabbelt <palmer@sifive.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Jiri Slaby <jslaby@suse.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 25, 2019 at 09:41:21PM -0700, Atish Patra wrote:
> Do we even need HVC_SBI console to be enabled by default? Disabling
> CONFIG_HVC_RISCV_SBI seems to be fine while running in QEMU.
> 
> If we don't need it, I suggest we should remove the config option from
> defconfig in addition to this patch.

I think the whole concept of the SBI console is a little dangerous.
It means that for one piece of physical hardware (usually the uart)
we have two entiries (the M-mode firmware and the OS) in control,
which tends to rarely end well.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
