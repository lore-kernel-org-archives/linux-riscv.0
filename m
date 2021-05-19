Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FBAC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:06:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7552561040
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:06:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7552561040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qpbV5T/b27rd8wAZbzskUebdg3FtLyv8YOt3IlXgl+8=; b=ISQvnVUE5dZosSX8yjKuheG9Q
	FQeK+xq6mH/+SjSZ4x6G9xrFSZpan/GwNdRyEfs18yf7UNiUbhOvA/kp/T1LQlThDrR/CLbEZv2wY
	oxp5RvtbNpebm8Ss3PwooQR4Unt2JBFArw4TO4Vpgjd/mPMpU+2hG8sO1lBCTkYZPfKdumhexlbkt
	+XUrwfQzelmNLmtSyUcZ/b7OO+EEvBAs/vFlyIX30dEsuCKbe51BWMH19QZqUFnrUFQhb91wegsVH
	ZJBg3N7bhxJxmNt/a5ErgDaxOxyvKYVfJTgg+9Gjw8SWQOpa8Zx9M7Z69OrhPciPOx3Bpf2rt1tba
	Gc0ZV6pKQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljFLf-002wmn-Pb; Wed, 19 May 2021 06:06:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFLb-002wmR-Eu
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=O1Txh+t9H+TCovqB3YvN4kfb1Czbwt6zPlHx6LmU8Cs=; b=uHBH6BgEiv1wU73kOIRQ9fxwIR
 55YCwHAODKVu1phIFSZNV0GGQyIuT9iwoaRttQyO0riB2dY5a9oyV9Qe+f1mHZWYHvUaWM5fDC+lP
 edNaUlQCrW+iEACVJtnXPjUeK8bcBRE7/gbJS5OUzcTkQokxlI5l81Mgsn5zA0PTTxRhNuFPIYktX
 dMSO0WJ1k9urbPpEoc9DbzfL5kCtnb1fKY9hGYcNy0DRp5SzDDnfxDWO9mETmLki8Cef7I0uNaJTd
 mSedelJM2DDrRxLcFG8dNTt1aCQdQrv2S3xqrdbNDKUEMGZyMptrWB46avolScFg6kAjyxqRB2JOo
 8LaVytFw==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFLZ-00FAbP-0s
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:06:22 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id CC0B767373; Wed, 19 May 2021 08:06:17 +0200 (CEST)
Date: Wed, 19 May 2021 08:06:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Guo Ren <guoren@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Anup Patel <anup.patel@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, drew@beagleboard.org,
 wefu@redhat.com, lazyparser@gmail.com,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210519060617.GA28397@lst.de>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_230621_232991_0AD5B4B4 
X-CRM114-Status: GOOD (  12.39  )
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

On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> Since the existing RISC-V ISA cannot solve this problem, it is better
> to provide some configuration for the SOC vendor to customize.

We've been talking about this problem for close to five years.  So no,
if you don't manage to get the feature into the ISA it can't be
supported.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
